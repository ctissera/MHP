create or replace PACKAGE BODY COMOCM_PKG IS


V_COMCED COM_COMPROBANTES_DET%ROWTYPE;
V_COMCET COM_COMPROBANTES_ENT%ROWTYPE;
V_COMCEE COM_COMPROBANTES_EST%ROWTYPE;
V_COMCPD COM_CALIFICACIONES_PRD%ROWTYPE;
V_COMOCP COM_ORDENES_COMPRAS_PRO%ROWTYPE;
V_COMCLP COM_CALIFICACIONES_PRO%ROWTYPE;
V_COMCPT COM_CALIFICACIONES_PRT%ROWTYPE;


FUNCTION OBTN_COMOCM_FECHA_GENERACION
 (P_COMCON_ID IN NUMBER
 ,P_COMPRV_ID IN NUMBER
 )
 RETURN DATE
 IS
--
   cursor cr_comocm (p_comcon_id number, p_comprv_id number) is
    select comocm.fecha_generacion
    from com_ordenes_compras     comocm
    where comocm.comcon_id = p_comcon_id
     and comocm.comprv_id = p_comprv_id
     and comocm.comoce_estado not in ('NUE','PEN','ANU','RCH');
   --
    cursor cr_comctz (p_comcon_id number, p_comprv_id number) is
    select *
      from com_cotizaciones    comctz
     where comctz.comcon_id = p_comcon_id
       and comctz.comprv_id = p_comprv_id
       and comctz.situacion in ('PRE');
   --

   v_fecha_generacion    date;
   --
begin
    --
    v_fecha_generacion := sysdate;
    --
    --open cr_comocm(p_comcon_id, p_comprv_id);
    --fetch cr_comocm into v_fecha_generacion;
    --close cr_comocm;
    --
    for v_comctz in cr_comctz(p_comcon_id, p_comprv_id) loop
        --
          select nvl(max(comocm.fecha_generacion),sysdate)
            into v_fecha_generacion
            from com_ordenes_compras     comocm
            where comocm.comcon_id = p_comcon_id
           --and comocm.comprv_id = p_comprv_id
             and comocm.comoce_estado not in ('NUE','PEN','ANU','RCH');
            --
            return v_fecha_generacion;
        --
    end loop;
    --
    return v_fecha_generacion;
    --
end;
/* Actualiza el monto para un detalle de entrega */
PROCEDURE COMCED_ACTUALIZAR_MONTO
 (P_COMOCM_ID IN NUMBER
 ,P_COMOCD_ID IN NUMBER
 ,P_COMCET_ID IN NUMBER
 ,P_CANTIDAD IN NUMBER
 ,P_MONTO_UNITARIO IN NUMBER
 ,P_TIPO_ENTREGA IN VARCHAR2
 ,P_OBSERVACION IN VARCHAR2
 )
 IS
v_precio_cotizado number;
  --
begin
  -- Obtiene el precio cotizado para el item de la orden de compra
  v_precio_cotizado := COMOCM_PKG.COMCED_PRECIO_COTIZADO(p_comocd_id);
  --
  if p_tipo_entrega = 'CNT' then
	update COM_COMPROBANTES_DET  comced
	set       comced.CANTIDAD = p_cantidad
	         ,comced.MONTO_UNITARIO = v_precio_cotizado *  p_cantidad
	         ,comced.OBSERVACION = p_observacion
	where  comced.COMOCD_ID = p_comocd_id
	and    comced.COMCET_ID = p_comcet_id;
  elsif p_tipo_entrega = 'MNT' then
	update COM_COMPROBANTES_DET comced
	set	 comced.CANTIDAD = p_cantidad
	    ,comced.MONTO_UNITARIO = p_monto_unitario
	    ,comced.OBSERVACION = p_observacion
	where comced.COMOCD_ID = p_comocd_id
	and   comced.COMCET_ID = p_comcet_id;
  end if;
end;
/* Agregar el detalle del comprobante desde la Orden de compra */
PROCEDURE COMCED_AGREGAR
 (P_COMCET_ID IN NUMBER
 ,P_COMOCM_ID IN NUMBER
 )
 IS
-- Tipo de Entrega para las ordenes de compra
  cursor cr_comcet is
    select comcet.TIPO_ENTREGA
    from   COM_COMPROBANTES_ENT comcet
          ,COM_COMPROBANTES_EST comcee
    where  comcet.COMOCM_ID = p_comocm_id
    and    comcet.COMCEE_ID = comcee.ID
    and    comcee.ESTADO in ('PEN', 'ENT', 'PAP', 'PAE')
    and    rownum = 1
    order by comcet.ID asc;
  -- Existe detalle de entrega
  cursor cr_comced is
  select 1
  from   COM_COMPROBANTES_DET comced
        ,COM_COMPROBANTES_ENT comcet
        ,COM_COMPROBANTES_EST comcee
  where  comced.COMCET_ID = p_comcet_id
  and    comced.COMCET_ID = comcet.ID
  and    comcet.COMCEE_ID = comcee.ID
  and    comcee.ESTADO = 'ENT';
  -- Detalle de la orden de compra
  cursor cr_comocd is
  select *
  from   COM_ORDENES_COMPRAS_DET comocd
  where  comocd.COMOCM_ID = p_comocm_id;
  --
  v_comced COM_COMPROBANTES_DET%rowtype;
  v_comcet COM_COMPROBANTES_ENT%rowtype;
  v_comocm COM_ORDENES_COMPRAS%rowtype;
  --
  v_comcet_tipo_entrega varchar2(3);
  v_comced_existe number;
  v_saldo_cantidad number;
  v_saldo_monto number;
  --
begin
  -- Validar los parametros de entrada
  COMOCM_PKG.COMCED_AGREGAR_VLD(p_comcet_id => p_comcet_id
                               ,p_comocm_id => p_comocm_id);
  --
  COM_PKG.SET_COMOCM(p_id => p_comocm_id);
  COM_PKG.GET_COMOCM(p_comocm => v_comocm);
  COM_PKG.INI_COMOCM;
  -- Determinar el tipo de entrega
  if v_comocm.TIPO_ENTREGA is null then
    --
    open cr_comcet;
    fetch cr_comcet into v_comcet_tipo_entrega;
    close cr_comcet;
    --
  else
    v_comcet_tipo_entrega := v_comocm.TIPO_ENTREGA;
  end if;
  --
  open cr_comced;
  fetch cr_comced into v_comced_existe;
  close cr_comced;
  -- Verificar si el comprobante actual posee detalles previamente cargados
  -- Si no posee detalles previamente cargados generamos el nuevo detalle
  if nvl(v_comced_existe, 0) = 0 then
    --
    for v_comocd in cr_comocd loop
      dbms_output.put_line(v_comocd.ID);
      --
      v_comced.ID := COMCED_ID.nextval;
      --
      v_comced.COMCET_ID := p_comcet_id;
      v_comced.COMOCD_ID := v_comocd.ID;
      v_comced.OBSERVACION := null;
      --
      if v_comcet_tipo_entrega = 'CNT' then
        --
        v_comced.CANTIDAD := COMOCM_PKG.COMOCM_COTIZADO_CNT(v_comocm.ID, v_comocd.ID)
                           - COMOCM_PKG.COMCED_PENDIENTES_CNT(v_comocm.ID, v_comocd.ID)
                           - COMOCM_PKG.COMCED_ENTREGADOS_CNT(v_comocm.ID, v_comocd.ID);
        --
        v_comced.MONTO_UNITARIO := COMOCM_PKG.COMOCM_COTIZADO_MNT(v_comocm.ID, v_comocd.ID)
                        - COMOCM_PKG.COMCED_PENDIENTES_MNT(v_comocm.ID, v_comocd.ID)
                        - COMOCM_PKG.COMCED_ENTREGADOS_MNT(v_comocm.ID, v_comocd.ID);
        --v_comced.MONTO_UNITARIO := v_comced.CANTIDAD * COMOCM_PKG.COMCED_PRECIO_COTIZADO(v_comocd.ID);
        --
      else
        --
        v_comced.CANTIDAD := COMOCM_PKG.COMOCM_COTIZADO_CNT(v_comocm.ID, v_comocd.ID);
        --
        v_comced.MONTO_UNITARIO := COMOCM_PKG.COMOCM_COTIZADO_MNT(v_comocm.ID, v_comocd.ID)
                        - COMOCM_PKG.COMCED_PENDIENTES_MNT(v_comocm.ID, v_comocd.ID)
                        - COMOCM_PKG.COMCED_ENTREGADOS_MNT(v_comocm.ID, v_comocd.ID);
        --
      end if;
      --
      if v_comced.MONTO_UNITARIO > 0 then
        --
        COMOCM_PKG.COMCED_INS(p_comced => v_comced);
        --
      end if;
      v_saldo_cantidad := COMOCM_PKG.COMOCM_COTIZADO_CNT(v_comocm.ID, v_comocd.ID) - COMOCM_PKG.COMCED_ENTREGADOS_CNT(v_comocm.ID, v_comocd.ID);
      --
      v_saldo_monto := COMOCM_PKG.COMOCM_COTIZADO_MNT(v_comocm.ID, v_comocd.ID) - COMOCM_PKG.COMCED_ENTREGADOS_MNT(v_comocm.ID, v_comocd.ID);
      --
    update COM_ORDENES_COMPRAS_DET comocd
    set comocd.SALDO_CANTIDAD = v_saldo_cantidad,
        comocd.SALDO_MONTO = v_saldo_monto
    where comocd.ID = v_comocd.ID;
    end loop;
  end if;
end;
PROCEDURE COMCED_AGREGAR_VLD
 (P_COMCET_ID IN NUMBER
 ,P_COMOCM_ID IN NUMBER
 )
 IS
v_comcet COM_COMPROBANTES_ENT%rowtype;
  v_comcee COM_COMPROBANTES_EST%rowtype;
begin
  if p_comcet_id is null then
    raise_application_error(-20000, 'El Comprobante de Entrega no ha sido indicado y es un dato obligatorio', true);
  elsif p_comocm_id is null then
    raise_application_error(-20000, 'La Solicitud de Compra no ha sido indicada y es un dato obligatorio', true);
  end if;
  --
  COMCET_SET(p_comcet_id);
  COMCET_GET(v_comcet);
  COMCET_INI;
  --
  COMCEE_SET(v_comcet.COMCEE_ID);
  COMCEE_GET(v_comcee);
  COMCET_INI;
  --
  --if v_comcee.ESTADO <> 'NUE' then
  --  raise_application_error(-20000, 'No es posible agregar detalle de comprobante a un comprobante existente');
  --end if;
end;
/* Calcular cantidad pendiente de entrega para un item de orden de compra */
FUNCTION COMCED_CALCULAR_CANTIDAD
 (P_COMOCD_ID IN NUMBER
 ,P_COMCET_ID IN NUMBER
 ,P_ESTADO IN VARCHAR2 := 'ENT'
 )
 RETURN INTEGER
 IS
-- Cantidad adjudicada
cursor cr_comocd_comadd is
  select nvl(comadd.CANTIDAD_ADJUDICADA, 0) CANTIDAD
  from   COM_ORDENES_COMPRAS_DET comocd
        ,COM_ADJUDICACIONES_DET comadd
  where  comocd.ID = p_comocd_id
  and    comocd.COMADD_ID = comadd.ID;

-- Cantidad entregada
cursor cr_comocd_comced is
  select nvl(sum(comced.CANTIDAD), 0) CANTIDAD
  from   COM_COMPROBANTES_DET comced
        ,COM_COMPROBANTES_ENT comcet
        ,COM_COMPROBANTES_EST comcee
  where  comced.COMOCD_ID = p_comocd_id
  and    comced.COMCET_ID = comcet.ID
  and    comcet.COMCEE_ID = comcee.ID
  and    instr(p_estado,comcee.ESTADO) > 0; -- (p_estado = 'ENT' , 'PEN' , 'ENTPEN')
  --
  v_comocd_comadd cr_comocd_comadd%rowtype;
  v_comocd_comced cr_comocd_comced%rowtype;
  --
  v_comcet COM_COMPROBANTES_ENT%rowtype;
begin
  --
  COMOCM_PKG.COMCET_SET(p_id => p_comcet_id);
  COMOCM_PKG.COMCET_GET(p_comcet => v_comcet);
  COMOCM_PKG.COMCET_INI;
  -- Cantidad adjudicada
  open cr_comocd_comadd;
  fetch cr_comocd_comadd into v_comocd_comadd;
  close cr_comocd_comadd;
  -- Si el criterio es por MONTO la cantidad adjudicada es fija no se modifica
  -- Cantidad Entregada
  if (v_comcet.TIPO_ENTREGA = 'CNT') then
    open cr_comocd_comced;
    fetch cr_comocd_comced into v_comocd_comced;
    close cr_comocd_comced;
  end if;
  --
  return nvl(v_comocd_comadd.CANTIDAD, 0) - nvl(v_comocd_comced.CANTIDAD, 0);
end;
/* Calcular el monto pendiente de entrega de un item de Orden de Compra */
FUNCTION COMCED_CALCULAR_MONTO
 (P_COMOCD_ID IN NUMBER
 )
 RETURN INTEGER
 IS
cursor cr_comocd_comadd is
    select nvl(comadd.CANTIDAD_ADJUDICADA * comczd.PRECIO_UNITARIO_FINAL, 0) MONTO
    from   COM_ORDENES_COMPRAS_DET comocd
          ,COM_ADJUDICACIONES_DET comadd
          ,COM_COTIZACIONES_DETALLES comczd
    where  comocd.ID = p_comocd_id
    and    comocd.COMADD_ID = comadd.ID
    and    comocd.COMCZD_ID = comczd.ID;
  --
  cursor cr_comocd_comced is
    select nvl(sum(comced.MONTO_UNITARIO), 0) MONTO
    from   COM_COMPROBANTES_DET comced
          ,COM_COMPROBANTES_ENT comcet
          ,COM_COMPROBANTES_EST comcee
    where  comced.COMOCD_ID = p_comocd_id
    and    comced.COMCET_ID = comcet.ID
    and    comcet.COMCEE_ID = comcee.ID
    and    comcee.ESTADO = 'ENT';
  --
  v_comocd_comadd cr_comocd_comadd%rowtype;
  v_comocd_comced cr_comocd_comced%rowtype;
  --
begin
  open cr_comocd_comadd;
  fetch cr_comocd_comadd into v_comocd_comadd;
  close cr_comocd_comadd;
  --
  open cr_comocd_comced;
  fetch cr_comocd_comced into v_comocd_comced;
  close cr_comocd_comced;
  --
  return v_comocd_comadd.MONTO - v_comocd_comced.MONTO;
end;
/* Eliminar un item del detalle de la entrega */
PROCEDURE COMCED_ELIMINAR
 (P_COMCED_ID IN NUMBER
 )
 IS
begin
  -- Validar el item de entrega
  COMCED_ELIMINAR_VLD(p_comced_id);
  --
  delete from COM_COMPROBANTES_DET comced
  where comced.ID = p_comced_id;
end;
/* Validar la eliminacion de un item de la entrega */
PROCEDURE COMCED_ELIMINAR_VLD
 (P_COMCED_ID IN NUMBER
 )
 IS
v_comced COM_COMPROBANTES_DET%rowtype;
begin
  --
  if p_comced_id is null then
    raise_application_error(-20000, 'El item de entrega no fue indicado y es un dato obligatorio', true);
  end if;
  --
  COMOCM_PKG.COMCED_SET(p_comced_id);
  COMOCM_PKG.COMCED_GET(v_comced);
  COMOCM_PKG.COMCED_INI;
  --
  if v_comced.ID is null then
    raise_application_error(-20000, 'El item de entrega, no es un dato valido', true);
  end if;
end;
/* Monto Entregado para el Item de la Orden de Compra */
FUNCTION COMCED_ENTREGADOS_MNT
 (P_COMOCM_ID IN NUMBER
 ,P_COMOCD_ID IN NUMBER
 )
 RETURN NUMBER
 IS
cursor cr_comced is
    select nvl(sum(comced.MONTO_UNITARIO),0) MONTO_UNITARIO
    from   COM_COMPROBANTES_DET comced,
           COM_COMPROBANTES_ENT comcet,
           COM_COMPROBANTES_EST comcee
    where  comcet.COMOCM_ID = p_comocm_id
    and    comcet.ID = comced.COMCET_ID
    and    comced.COMOCD_ID = p_comocd_id
    and    comcet.COMCEE_ID = comcee.ID
    and    comcee.ESTADO = 'ENT';
  --
  v_comced_monto number;
begin
  --
  open cr_comced;
  fetch cr_comced into v_comced_monto;
  close cr_comced;
  -- Monto entregado para el item de la orden
  return v_comced_monto;
end;
/* Cantidad Entregada para el Item de la Orden de Compra */
FUNCTION COMCED_ENTREGADOS_CNT
 (P_COMOCM_ID IN NUMBER
 ,P_COMOCD_ID IN NUMBER
 )
 RETURN NUMBER
 IS
cursor cr_comced is
  select nvl(sum(comced.CANTIDAD), 0) CANTIDAD
  from   COM_COMPROBANTES_DET comced,
         COM_COMPROBANTES_ENT comcet,
         COM_COMPROBANTES_EST comcee
  where  comcet.COMOCM_ID = p_comocm_id
  and    comcet.ID = comced.COMCET_ID
  and    comced.COMOCD_ID = p_comocd_id
  and    comcet.COMCEE_ID = comcee.ID
  and    comcee.ESTADO = 'ENT';
  --
  v_comced_cantidad number;
begin
  --
  open cr_comced;
  fetch cr_comced into v_comced_cantidad;
  close cr_comced;
  -- Cantidad entregada para el item de la orden
   return v_comced_cantidad;
end;
/* Recupera un registro desde la variable de paquete */
PROCEDURE COMCED_GET
 (P_COMCED OUT COM_COMPROBANTES_DET%ROWTYPE
 )
 IS
begin
  p_comced := v_comced;
end;
/* Limpia la variable del paquete */
PROCEDURE COMCED_INI
 IS
begin
  v_comced := null;
end;
/* Agregar un nuevo registro a COM_COMPROBANTES_DET */
PROCEDURE COMCED_INS
 (P_COMCED IN COM_COMPROBANTES_DET%ROWTYPE
 )
 IS
begin
  insert into COM_COMPROBANTES_DET
  (
    ID
   ,COMCET_ID
   ,COMOCD_ID
   ,CANTIDAD
   ,MONTO_UNITARIO
   ,OBSERVACION
   ,DATE_CREATED
   ,CREATED_BY
   ,DATE_MODIFIED
   ,MODIFIED_BY
  )
  values
  (
    p_comced.ID
   ,p_comced.COMCET_ID
   ,p_comced.COMOCD_ID
   ,p_comced.CANTIDAD
   ,p_comced.MONTO_UNITARIO
   ,p_comced.OBSERVACION
   ,p_comced.DATE_CREATED
   ,p_comced.CREATED_BY
   ,p_comced.DATE_MODIFIED
   ,p_comced.MODIFIED_BY
  );
end;
/* Monto Pendiente de entrega por item de una Orden */
FUNCTION COMCED_PENDIENTES_MNT
 (P_COMOCM_ID IN NUMBER
 ,P_COMOCD_ID IN NUMBER
 )
 RETURN NUMBER
 IS
cursor cr_comced is
    select nvl(sum(comced.MONTO_UNITARIO), 0) MONTO_UNITARIO
    from   COM_COMPROBANTES_DET comced,
           COM_COMPROBANTES_ENT comcet,
           COM_COMPROBANTES_EST comcee
    where  comcet.COMOCM_ID = p_comocm_id
    and    comcet.ID = comced.COMCET_ID
    and    comced.COMOCD_ID = p_comocd_id
    and    comcet.COMCEE_ID = comcee.ID
    and    comcee.ESTADO in ('PEN', 'PAP', 'PAE');
  --
  v_comced_monto number;
begin
  --
  open cr_comced;
  fetch cr_comced into v_comced_monto;
  close cr_comced;
  -- Monto pendiente de entrega para un item de la Orden de Compra
  return v_comced_monto;
end;
/* Cantidad de items pendiente de entrega */
FUNCTION COMCED_PENDIENTES_CNT
 (P_COMOCM_ID IN NUMBER
 ,P_COMOCD_ID IN NUMBER
 )
 RETURN NUMBER
 IS
cursor cr_comced is
  select nvl(sum(comced.CANTIDAD), 0) CANTIDAD
  from   COM_COMPROBANTES_DET comced,
         COM_COMPROBANTES_ENT comcet,
         COM_COMPROBANTES_EST comcee
  where  comcet.COMOCM_ID = p_comocm_id
  and    comcet.ID = comced.COMCET_ID
  and    comced.COMOCD_ID = p_comocd_id
  and    comcet.COMCEE_ID = comcee.ID
  and    comcee.ESTADO in ('PEN', 'PAP', 'PAE');
  --
  v_comced_cantidad number;
begin
  --
  open cr_comced;
  fetch cr_comced into v_comced_cantidad;
  close cr_comced;
  -- Cantidad pendiente de entrega para el item de la orden
  return v_comced_cantidad;
end;
/* Precio Cotizado para el item de la orden de compra */
FUNCTION COMCED_PRECIO_COTIZADO
 (P_COMOCD_ID IN NUMBER
 )
 RETURN NUMBER
 IS
-- Obtener el precio cotizado para el item de la orden de compra
cursor cr_comczd is
    select comczd.PRECIO_UNITARIO_FINAL
    from   COM_ORDENES_COMPRAS_DET comocd
          ,COM_COTIZACIONES_DETALLES comczd
    where  comocd.ID = p_comocd_id
    and    comocd.COMCZD_ID = comczd.ID;
  --
  v_comczd number;
begin
  open cr_comczd;
  fetch cr_comczd into v_comczd;
  close cr_comczd;
  -- Devuelve el precio cotizado para iteme de la orden de compra
  return nvl(v_comczd, 0);
end;
/* Recupera un registro por su ID */
PROCEDURE COMCED_SET
 (P_ID IN NUMBER
 )
 IS
cursor cr_comced is
  select *
  from   COM_COMPROBANTES_DET comced
  where  comced.ID = p_id;
begin
  COMCED_INI;
  open cr_comced;
  fetch cr_comced into v_comced;
  close cr_comced;
end;
/* Recupera un registro desde la variable de paquete */
PROCEDURE COMCEE_GET
 (P_COMCEE OUT COM_COMPROBANTES_EST%ROWTYPE
 )
 IS
begin
  p_comcee := v_comcee;
end;
PROCEDURE COMCEE_INI
 IS
begin
  v_comcee := null;
end;
/* Agregar un nuevo registro a COM_COMPROBANTES_EST */
PROCEDURE COMCEE_INS
 (P_COMCEE IN COM_COMPROBANTES_EST%ROWTYPE
 )
 IS
begin
  insert into COM_COMPROBANTES_EST
  (
    ID
   ,COMCET_ID
   ,FECHA
   ,ESTADO
   ,MOTIVO
   ,DATE_CREATED
   ,CREATED_BY
   ,DATE_MODIFIED
   ,MODIFIED_BY
  )
  values
  (
    p_comcee.ID
   ,p_comcee.COMCET_ID
   ,p_comcee.FECHA
   ,p_comcee.ESTADO
   ,p_comcee.MOTIVO
   ,p_comcee.DATE_CREATED
   ,p_comcee.CREATED_BY
   ,p_comcee.DATE_MODIFIED
   ,p_comcee.MODIFIED_BY
  );
end;
/* Recupera un registro por su ID */
PROCEDURE COMCEE_SET
 (P_ID IN NUMBER
 )
 IS
cursor cr_comcee is
  select *
  from   COM_COMPROBANTES_EST comcee
  where  comcee.ID = p_id;
begin
  COMCEE_INI;
  open cr_comcee;
  fetch cr_comcee into v_comcee;
  close cr_comcee;
end;
/* Anular Entrega de bienes y servicios */
PROCEDURE COMCET_ANULAR
 (P_COMOCM_ID IN NUMBER
 ,P_COMCET_ID IN NUMBER
 ,P_MOTIVO IN VARCHAR2
 )
 IS
cursor cr_comocd is
    select comocd.ID
    from   COM_ORDENES_COMPRAS_DET comocd
    where  comocd.COMOCM_ID = p_comocm_id;
  --
  cursor cr_comcet_fecha is
    select trunc(max(nvl(comcet.DATE_MODIFIED, comcet.DATE_CREATED))) FECHA_ULTIMA_ENTREGA
    from   COM_COMPROBANTES_ENT comcet
          ,COM_COMPROBANTES_EST comcee
    where  comcet.COMOCM_ID = p_comocm_id
    and    comcet.COMCEE_ID = comcee.ID
    and    comcee.ESTADO in ('PEN', 'ENT', 'PAP', 'PAE')
    order  by comcet.ID desc;

  cursor cr_comcet_entregas is
    select count(comcet.id)
    from   COM_COMPROBANTES_ENT comcet
          ,COM_COMPROBANTES_EST comcee
    where  comcet.COMOCM_ID = p_comocm_id
    and    comcet.COMCEE_ID = comcee.ID
    and    comcee.ESTADO in ('PEN', 'ENT')
    order  by comcet.ID desc;
  --
  v_comocm COM_ORDENES_COMPRAS%rowtype;
  v_comcet COM_COMPROBANTES_ENT%rowtype;
  v_comcee COM_COMPROBANTES_EST%rowtype;
  --
  v_fecha_ultima_entrega date;
  v_comcet_entregas number;
  --

  v_cotizado_cnt number;
  v_entregado_cnt number;
  v_cotizado_mnt number;
  v_entregado_mnt number;
  --
  v_comocm_saldo_monto number;
  v_tipo_entrega varchar2(3);
  v_fecha_entrega date;
  v_cantidad number;
  v_monto number;
begin
    --
    COMOCM_PKG.COMCET_ANULAR_VLD(p_comocm_id => p_comocm_id
                                ,p_comcet_id => p_comcet_id);
    --
    COM_PKG.SET_COMOCM(p_id => p_comocm_id);
    COM_PKG.GET_COMOCM(p_comocm => v_comocm);
    COM_PKG.INI_COMOCM;
    --
    COMOCM_PKG.COMCET_SET(p_id => p_comcet_id);
    COMOCM_PKG.COMCET_GET(p_comcet => v_comcet);
    COMOCM_PKG.COMCET_INI;
    -- Cambia el estado de la entrega a ANULADO
    v_comcee.ID := COMCEE_ID.nextval;
    v_comcee.COMCET_ID := p_comcet_id;
    v_comcee.ESTADO := 'ANU';
    v_comcee.FECHA := sysdate;
    v_comcee.MOTIVO := p_motivo;
    --
    COMOCM_PKG.COMCEE_INS(v_comcee);
    -- Calcular el monto total de la entrega
    v_comocm_saldo_monto := nvl(COMOCM_PKG.COMCET_CALCULAR_MONTO(p_comocm_id => p_comocm_id), 0);
    dbms_output.put_line('v_comocm_saldo_monto: '||v_comocm_saldo_monto);
    --
    open cr_comcet_entregas;
    fetch cr_comcet_entregas into v_comcet_entregas;
    close cr_comcet_entregas;
    -- Si la entrega es la ultima se deben reiniciar los valores de la orden de compra
    if v_comcet_entregas = 0 then
      v_tipo_entrega := null;
      v_fecha_entrega := null;
      v_comocm_saldo_monto := null;
    else
      open cr_comcet_fecha;
      fetch cr_comcet_fecha into v_fecha_ultima_entrega;
      close cr_comcet_fecha;
      -- Si el tipo de entrega de la orden aun no se ha definido, utilizar el tipo de entrega de la entrega actual,
      -- caso contrario utilizar el tipo de entrega de la orden.
      if v_comocm.TIPO_ENTREGA is null then
        v_tipo_entrega := v_comcet.TIPO_ENTREGA;
      else
        v_tipo_entrega := v_comocm.TIPO_ENTREGA;
      end if;
    end if;
    -- Actualizar el monto total de la entrega
    update COM_ORDENES_COMPRAS comocm
    set    SALDO = v_comocm_saldo_monto
          ,TIPO_ENTREGA = v_tipo_entrega
          ,FECHA_ULTIMA_ENTREGA = v_fecha_entrega
    where     comocm.ID = p_comocm_id;
    --
    for v_comocd in cr_comocd loop
       v_cotizado_cnt := COMOCM_PKG.COMOCM_COTIZADO_CNT(p_comocm_id => p_comocm_id
                                                       ,p_comocd_id => v_comocd.ID);
       v_entregado_cnt := COMOCM_PKG.COMCED_ENTREGADOS_CNT(p_comocm_id => p_comocm_id
                                                          ,p_comocd_id => v_comocd.ID);
       v_cotizado_mnt := COMOCM_PKG.COMOCM_COTIZADO_MNT(p_comocm_id => p_comocm_id
                                                       ,p_comocd_id => v_comocd.ID);
       v_entregado_mnt := COMOCM_PKG.COMCED_ENTREGADOS_MNT(p_comocm_id => p_comocm_id
                                                          ,p_comocd_id => v_comocd.ID);
       --
        if v_tipo_entrega = 'CNT' then
            --
            v_cantidad := v_cotizado_cnt - v_entregado_cnt;
            v_monto := v_cotizado_cnt - v_entregado_cnt;
            --
        else
            --
            v_cantidad := v_cotizado_cnt;
            v_monto := v_cotizado_mnt - v_entregado_mnt;
            --
        end if;
        --
        update COM_ORDENES_COMPRAS_DET comocd
        set  comocd.SALDO_CANTIDAD = v_cantidad
            ,comocd.SALDO_MONTO = v_monto
        where  comocd.ID = v_comocd.ID;
        --
    end loop;
end;
/* Anular una entrega */
PROCEDURE COMCET_ANULAR_VLD
 (P_COMOCM_ID IN NUMBER
 ,P_COMCET_ID IN NUMBER
 )
 IS
cursor cr_comcet_entregas is
  select count(comcet.id)
  from   COM_COMPROBANTES_ENT comcet
        ,COM_COMPROBANTES_EST comcee
  where  comcet.COMOCM_ID = p_comocm_id
  and    comcet.COMCEE_ID = comcee.ID
  and    comcee.ESTADO in ('PEN', 'ENT', 'PAP', 'PAE')
  order  by comcet.ID desc;
  --
  v_comcee COM_COMPROBANTES_EST%rowtype;
  v_comcet COM_COMPROBANTES_ENT%rowtype;
  v_comocm COM_ORDENES_COMPRAS%rowtype;
  --
  v_comcet_entregas number;
begin
  if p_comocm_id is null then
    raise_application_error(-20000, 'La Orden de compra no fue proporcionada y es un dato obligatorio', true);
  end if;
  --
  COM_PKG.SET_COMOCM(p_comocm_id);
  COM_PKG.GET_COMOCM(v_comocm);
  COM_PKG.INI_COMOCM;
  --
  if v_comocm.ID is null then
    raise_application_error(-20000, 'La Orden de compra proporcionada no es valida', true);
  end if;
  --
  if p_comcet_id is null then
    raise_application_error(-20000, 'La entrega no fue proporcionada y es un dato obligatorio', true);
  end if;
  -- Obtener el estado actual del comprobante
  COMOCM_PKG.COMCET_SET(p_comcet_id);
  COMOCM_PKG.COMCET_GET(v_comcet);
  COMOCM_PKG.COMCET_INI;
  --
  if v_comcet.ID is null then
    raise_application_error(-20000, 'La entrega no es un dato valido', true);
  end if;
  --
  COMOCM_PKG.COMCEE_SET(v_comcet.comcee_id);
  COMOCM_PKG.COMCEE_GET(v_comcee);
  COMOCM_PKG.COMCEE_INI;
  --
  if v_comcee.ESTADO = 'NUE' then
    raise_application_error(-20000, 'El Comprobante no puede anularse, si se encuentra en estado '||GRAL_PKG.OBTN_CFGABR('COM_COMPROBATES_EST.ESTADO', v_comcee.ESTADO));
  elsif v_comcee.ESTADO = 'ANU' then
    raise_application_error(-20000, 'El Comprobante no puede anularse, si se encuentra en estado '||GRAL_PKG.OBTN_CFGABR('COM_COMPROBATES_EST.ESTADO', v_comcee.ESTADO));
  end if;
  --
  open cr_comcet_entregas;
  fetch cr_comcet_entregas into v_comcet_entregas;
  close cr_comcet_entregas;
  --
  if nvl(v_comcet_entregas, 0) = 0 then
    raise_application_error(-20000, 'No existen mas entregas para anular', true);
  end if;
end;
/* Obtiene si una entrega se encuentra Para Autorizar */
FUNCTION COMCET_AUTORIZADA_SN
 (P_COMCET_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_comocm is
 -- Obtener entrega para autorizar
  select 1
  from   COM_COMPROBANTES_ENT comcet
        ,COM_COMPROBANTES_EST comcee
  where  comcet.COMCEE_ID = comcee.ID
  and    comcee.ESTADO in ('PAP', 'PAE')
  and    comcet.id = p_comcet_id;
  --
  v_dummy number;
  v_retorno varchar2(2);
begin
  v_retorno := 'SI';
  --
  open cr_comocm;
  fetch cr_comocm into v_dummy;
  close cr_comocm;
  --  Si la entrega está para autorizar
  if nvl(v_dummy, 0) = 1 then
    v_retorno := 'NO';
  end if;
  --
  return v_retorno;
end;
/* Calcula el monto restante de la orden de compra */
FUNCTION COMCET_CALCULAR_MONTO
 (P_COMOCM_ID IN NUMBER
 )
 RETURN NUMBER
 IS
-- Monto total adjudicado
cursor cr_comocd is
  select nvl(sum(comadd.CANTIDAD_ADJUDICADA * comczd.PRECIO_UNITARIO_FINAL), 0) MONTO
  from COM_ORDENES_COMPRAS_DET comced
      ,COM_ADJUDICACIONES_DET comadd
      ,COM_COTIZACIONES_DETALLES comczd
  where  comced.COMOCM_ID = p_comocm_id
  and    comced.COMADD_ID = comadd.ID
  and    comced.COMCZD_ID = comczd.ID;
  -- Monto total entregado
cursor cr_comcet is
  select nvl(sum(comcet.MONTO), 0) MONTO
  from   COM_COMPROBANTES_ENT comcet
        ,COM_COMPROBANTES_EST comcee
  where  comcet.COMOCM_ID = p_comocm_id
  and    comcet.COMCEE_ID = comcee.ID
  and    comcee.ESTADO = 'ENT';
--
v_comocd_monto number;
v_comcet_monto number;
--
begin
  -- Monto adjudicado
  open cr_comocd;
  fetch cr_comocd into v_comocd_monto;
  close cr_comocd;
  -- Monto entregado
  open cr_comcet;
  fetch cr_comcet into v_comcet_monto;
  close cr_comcet;
  --
  return (v_comocd_monto - v_comcet_monto);
end;
/* Crea una cabecera de comprobante de entrega */
PROCEDURE COMCET_CREAR
 (P_COMOCM_ID IN NUMBER
 ,P_TIPO_ENTREGA IN VARCHAR2
 ,P_FECHA_VENCIMIENTO IN DATE
 ,P_SEGUSU_TIPO IN VARCHAR2
 ,P_OBSERVACION IN VARCHAR2
 ,P_COMCET_ID OUT NUMBER
 )
 IS
v_comcet_tipo_entrega varchar2(3);
   --
   v_comocm COM_ORDENES_COMPRAS%rowtype;
   v_comcet COM_COMPROBANTES_ENT%rowtype;
   v_comcee COM_COMPROBANTES_EST%rowtype;
begin
  --
  COMOCM_PKG.COMCET_CREAR_VLD(p_comocm_id
                             ,p_tipo_entrega
                             ,p_segusu_tipo);
  -- Recuperar el id de organziacion desde la orden de compra
  COM_PKG.SET_COMOCM(p_comocm_id);
  COM_PKG.GET_COMOCM(v_comocm);
  COM_PKG.INI_COMOCM;
  -- Establece los datos del comprobante de entrega
  v_comcet.ID := COMCET_ID.nextval;
  -- Si existe una entrega previamente realizada se toma el criterio de las
  -- entregas previamente creadas
  -- caso contrario se toma el criterio proporcionado
  v_comcet_tipo_entrega := COMOCM_PKG.COMCET_OBTN_TIPO_ENTREGA(p_comocm_id, v_comcet.ID);
  if (v_comcet_tipo_entrega is null) then
    v_comcet.TIPO_ENTREGA := p_tipo_entrega;
  else
    v_comcet.TIPO_ENTREGA := v_comcet_tipo_entrega;
  end if;
  --
  v_comcet.SEGORG_ID := v_comocm.segorg_id;
  v_comcet.COMOCM_ID := p_comocm_id;
  v_comcet.CODIGO :=  v_comcet.ID;
  v_comcet.SEGUSU_TIPO := p_segusu_tipo;
  --
  v_comcet.MONTO := 0;
  v_comcet.OBSERVACION := p_observacion;
  v_comcet.FECHA_VENCIMIENTO := p_fecha_vencimiento;
  v_comcet.FECHA_RECEPCION := null;
  --
  COMOCM_PKG.COMCET_INS(v_comcet);
  -- Establece el estado del comprobante a nuevo;
  v_comcee.ID := COMCEE_ID.nextval;
  --
  v_comcee.COMCET_ID := v_comcet.ID;
  v_comcee.FECHA := sysdate;
  v_comcee.ESTADO := 'NUE';
  v_comcee.MOTIVO := null;
  --
  COMOCM_PKG.COMCEE_INS(v_comcee);
  --
  p_comcet_id := v_comcet.ID;
end;
PROCEDURE COMCET_CREAR_VLD
 (P_COMOCM_ID IN NUMBER
 ,P_TIPO_ENTREGA IN VARCHAR2
 ,P_SEGUSU_TIPO IN VARCHAR2
 )
 IS
v_comocm COM_ORDENES_COMPRAS%rowtype;
begin
	if p_comocm_id is null then
		raise_application_error(-20000, 'No se ha indicado la orden de compra y es un dato obligatorio.', true);
	end if;
	--
	COM_PKG.SET_COMOCM(p_comocm_id);
	COM_PKG.GET_COMOCM(v_comocm);
	COM_PKG.INI_COMOCM;
	--
	if v_comocm.ID is null then
	  raise_application_error(-20000, 'La orden de compra indicada no es una orden de compra valida', true);
	end if;
	--
	if  p_tipo_entrega is null then
	  raise_application_error(-20000, 'El criterio de entrega no ha sido especificado y es un dato obligatorio', true);
	end if;

	if p_segusu_tipo not in ('PRV', 'ADM', 'ECO') then
	  raise_application_error(-20000, 'No esta permitido registrar entregas para el tipo de usuario', true);
	end if;
end;
/* Confirmar la Entrega de Bienes */
PROCEDURE COMCET_ENTREGAR
 (P_COMOCM_ID IN NUMBER
 ,P_COMCET_ID IN NUMBER
 ,P_MOTIVO IN VARCHAR2
 )
 IS
cursor cr_comocd is
	select comocd.ID
	from   COM_ORDENES_COMPRAS_DET comocd
	where  comocd.COMOCM_ID = p_comocm_id;
  --
  v_comocm COM_ORDENES_COMPRAS%rowtype;
  v_comcet COM_COMPROBANTES_ENT%rowtype;
  v_comcee COM_COMPROBANTES_EST%rowtype;
  --
  v_cotizado_cnt number;
  v_entregado_cnt number;
  v_cotizado_mnt number;
  v_entregado_mnt number;
  v_cantidad number;
  v_monto number;
  v_comocm_saldo_monto number;
  v_tipo_entrega varchar2(3);
  --
begin
	COMOCM_PKG.COMCET_ENTREGAR_VLD(p_comocm_id => p_comocm_id
								  ,p_comcet_id => p_comcet_id);
	--
	COM_PKG.SET_COMOCM(p_id => p_comocm_id);
	COM_PKG.GET_COMOCM(p_comocm => v_comocm);
	COM_PKG.INI_COMOCM;
	--
	COMOCM_PKG.COMCET_SET(p_id => p_comcet_id);
	COMOCM_PKG.COMCET_GET(p_comcet => v_comcet);
	COMOCM_PKG.COMCET_INI;
	--
	v_comcee.ID := COMCEE_ID.nextval;
	v_comcee.COMCET_ID := p_comcet_id;
	v_comcee.ESTADO := 'ENT';
	v_comcee.FECHA := sysdate;
	v_comcee.MOTIVO := p_motivo;
	--
	COMOCM_PKG.COMCEE_INS(p_comcee => v_comcee);
	-- Si el tipo de entrega no esta definido en la orden de compra, no se han realizado entregas previas
	-- por lo que se asigna el tipo de entrega definido en la entrega actual.
	if v_comocm.TIPO_ENTREGA is null then
		v_tipo_entrega := v_comcet.TIPO_ENTREGA;
	else
		v_tipo_entrega := v_comocm.TIPO_ENTREGA;
	end if;
	-- Calcular el monto total de la entrega
	v_comocm_saldo_monto := nvl(COMOCM_PKG.COMCET_CALCULAR_MONTO(p_comocm_id => p_comocm_id), 0);
	-- Actualizar el monto total de la entrega
	update COM_ORDENES_COMPRAS comocm
	set    SALDO = v_comocm_saldo_monto
		   ,TIPO_ENTREGA = v_tipo_entrega
	where     comocm.ID = p_comocm_id;
	--
	for v_comocd in cr_comocd loop
	   -- Para cada detalle de la orden de compra calcular la cantidad pendiente de entrega
	   v_cotizado_cnt := COMOCM_PKG.COMOCM_COTIZADO_CNT(p_comocm_id => p_comocm_id
	                                                   ,p_comocd_id => v_comocd.ID);
	   v_entregado_cnt := COMOCM_PKG.COMCED_ENTREGADOS_CNT(p_comocm_id => p_comocm_id
	                                                   ,p_comocd_id => v_comocd.ID);
	   v_cotizado_mnt := COMOCM_PKG.COMOCM_COTIZADO_MNT(p_comocm_id => p_comocm_id
	                                                   ,p_comocd_id => v_comocd.ID);
	   v_entregado_mnt := COMOCM_PKG.COMCED_ENTREGADOS_MNT(p_comocm_id => p_comocm_id
	                                                   ,p_comocd_id => v_comocd.ID);
        --
		if v_tipo_entrega = 'CNT' then
			-- Si el tipo de entrega es por cantidad, calcular la cantidad
			v_cantidad := v_cotizado_cnt - v_entregado_cnt;
			v_monto := v_cotizado_mnt - v_entregado_mnt;
			--
		else
			-- Si el tipo de entrega es por monto, la cantidad no varia
			v_cantidad := v_cotizado_cnt;
			v_monto := v_cotizado_mnt - v_entregado_mnt;
			--
		end if;
		-- asignar las cantidades calculadas al detalle de la orden de compra
		update COM_ORDENES_COMPRAS_DET comocd
		set  comocd.SALDO_CANTIDAD = v_cantidad
			,comocd.SALDO_MONTO = v_monto
		where  comocd.ID = v_comocd.ID;
		--
	end loop;
end;
/* Validacion Entrega de Comprobante */
PROCEDURE COMCET_ENTREGAR_VLD
 (P_COMOCM_ID IN NUMBER
 ,P_COMCET_ID IN NUMBER
 )
 IS
cursor cr_comocd is
		select comocd.ID
		from   COM_ORDENES_COMPRAS_DET comocd
		where  comocd.COMOCM_ID = p_comocm_id;
	--
	cursor cr_comced(p_comocd_id number) is
		select comced.CANTIDAD,
				  comced.MONTO_UNITARIO
		from   COM_COMPROBANTES_ENT comcet
				,COM_COMPROBANTES_DET comced
		where  comcet.ID = p_comcet_id
		and    comcet.COMOCM_ID = p_comocm_id
		and    comcet.ID = comced.COMCET_ID
		and    comced.COMOCD_ID = p_comocd_id;
	--
	v_cotizado_cnt number;
	v_cotizado_mnt number;
	v_entregado_cnt number;
	v_entregado_mnt number;
	--
	v_tipo_entrega varchar2(3);
	--
	v_comcee COM_COMPROBANTES_EST%rowtype;
	v_comcet COM_COMPROBANTES_ENT%rowtype;
	v_comocm COM_ORDENES_COMPRAS%rowtype;
	--
	v_comced cr_comced%rowtype;
begin
	if p_comocm_id is null then
		raise_application_error(-20000, 'La orden de compra no fue proporcionada y es un dato obligatorio', true);
	end if;
	-- obtener la orden de compra
	COM_PKG.SET_COMOCM(p_comocm_id);
	COM_PKG.GET_COMOCM(v_comocm);
	COM_PKG.INI_COMOCM;
	--
	if v_comocm.ID is null then
		raise_application_error(-20000, 'La orden de compra no es un dato valido', true);
	end if;
	--
	if p_comcet_id is null then
		raise_application_error(-20000, 'La entrega no fue proporcionada y es un dato obligatorio', true);
	end if;
	-- obtener el estado actual del componente
	COMOCM_PKG.COMCET_SET(p_comcet_id);
	COMOCM_PKG.COMCET_GET(v_comcet);
	COMOCM_PKG.COMCET_INI;
	--
	if v_comcet.ID is null then
		raise_application_error(-20000, 'El comprobante de entrega proporcionado no es un dato valido', true);
	end if;
	--
	COMOCM_PKG.COMCEE_SET(v_comcet.comcee_id);
	COMOCM_PKG.COMCEE_GET(v_comcee);
	COMOCM_PKG.COMCEE_INI;
	--
	if v_comcee.ESTADO = 'PAP' then
		raise_application_error(-20000, 'El comprobante no puede entregarse si se encuentra en estado '||GRAL_PKG.OBTN_CFGABR('COM_COMPROBANTES_EST.ESTADO', v_comcee.ESTADO), true);
	elsif v_comcee.ESTADO = 'PAE' then
		raise_application_error(-20000, 'El comprobante no puede entregarse si se encuentra en estado '||GRAL_PKG.OBTN_CFGABR('COM_COMPROBANTES_EST.ESTADO', v_comcee.ESTADO), true);
	elsif v_comcee.ESTADO = 'ENT' then
		raise_application_error(-20000, 'El comprobante no puede entregarse si se encuentra en estado '||GRAL_PKG.OBTN_CFGABR('COM_COMPROBANTES_EST.ESTADO', v_comcee.ESTADO), true);
	end if;
	--
	for v_comocd in cr_comocd loop
		--
		open cr_comced(p_comocd_id => v_comocd.ID);
		fetch cr_comced into v_comced;
		close cr_comced;
		--
		if v_comocm.TIPO_ENTREGA is null then
			--
			v_tipo_entrega := v_comcet.TIPO_ENTREGA;
		else
			v_tipo_entrega := v_comocm.TIPO_ENTREGA;
		end if;
    --
		if v_tipo_entrega = 'CNT' then
			v_cotizado_cnt := COMOCM_PKG.COMOCM_COTIZADO_CNT(p_comocm_id, v_comocd.ID);
			v_entregado_cnt := COMOCM_PKG.COMCED_ENTREGADOS_CNT(p_comocm_id, v_comocd.ID);
			if v_comced.CANTIDAD > (v_cotizado_cnt - v_entregado_cnt) then
				raise_application_error(-20000, 'No es posible entregar una cantidad '||v_comced.CANTIDAD||' superior a la cantidad pendiente de entrega '||(v_cotizado_cnt - v_entregado_cnt), true);
			end if;
		else
			v_cotizado_mnt := COMOCM_PKG.COMOCM_COTIZADO_MNT(p_comocm_id, v_comocd.ID);
			v_entregado_mnt := COMOCM_PKG.COMCED_ENTREGADOS_MNT(p_comocm_id, v_comocd.ID);
			if v_comced.MONTO_UNITARIO > (v_cotizado_mnt - v_entregado_mnt)then
				raise_application_error(-20000,'No es posible entregar un monto '||v_comced.MONTO_UNITARIO||' superior a el monto pendiente de entrega '||(v_cotizado_mnt - v_entregado_mnt), true);
			end if;
		end if;
		--
		v_comced := null;
  end loop;
end;
/* Obtener el tipo de Entrega */
FUNCTION COMCET_OBTN_TIPO_ENTREGA
 (P_COMOCM_ID IN NUMBER
 ,P_COMCET_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
-- Obtener el tipo de entrega
cursor cr_comcet is
     select comcet.TIPO_ENTREGA
     from   COM_COMPROBANTES_ENT comcet
             ,COM_COMPROBANTES_EST comcee
    where comcet.COMOCM_ID = p_comocm_id
    and   comcet.COMCEE_ID = comcee.ID
    and   comcee.ESTADO = 'ENT'
    and   rownum <= 1
    order by comcet.id asc;

  --
  v_comcet_tipo_entrega varchar2(3);
  v_comocm COM_ORDENES_COMPRAS%rowtype;
  v_comcet COM_COMPROBANTES_ENT%rowtype;
begin
  --
  COM_PKG.SET_COMOCM(p_comocm_id);
  COM_PKG.GET_COMOCM(v_comocm);
  COM_PKG.INI_COMOCM;
  --Si existen entregas previas el tipo de entrega es el de la orden de compra
  if (v_comocm.TIPO_ENTREGA is not null) then
    v_comcet_tipo_entrega := v_comocm.TIPO_ENTREGA;
  else
    -- Si no existe entregas previas el tipo de entrega es el de la cabecera
    open cr_comcet;
    fetch cr_comcet into v_comcet_tipo_entrega;
    close cr_comcet;
  end if;
  --
  return v_comcet_tipo_entrega;
end;
/* Obtiene si una entrega se encuentra Pendiente de entrega */
FUNCTION COMCET_PENDIENTE_SN
 (P_COMCET_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_comocm is
-- Obtener entrega pendiente
  select 1
  from   COM_COMPROBANTES_ENT comcet
        ,COM_COMPROBANTES_EST comcee
  where  comcet.COMCEE_ID = comcee.ID
  and    comcee.ESTADO = 'PEN'
  and    comcet.ID = p_comcet_id;
--
  v_dummy number;
  v_retorno varchar2(2);
begin
  v_retorno := 'NO';
  --
  open cr_comocm;
  fetch cr_comocm into v_dummy;
  close cr_comocm;
  -- SI la entrega esta pendiente
  if nvl(v_dummy, 0) = 1 then
    v_retorno := 'SI';
  end if;

  return v_retorno;
end;
/* Obtiene si una entrega está Vencida o no */
FUNCTION COMCET_VENCIDA_SN
 (P_COMCET_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_comcet is
  -- Obtener la entrega vencida
  select 1
  from   COM_COMPROBANTES_ENT comcet
        ,COM_COMPROBANTES_EST comcee
  where  comcet.COMCEE_ID = comcee.ID
  and    comcee.ESTADO in ('PEN', 'PAP', 'PAE')
  and    comcet.FECHA_VENCIMIENTO < trunc(sysdate)
  and    comcet.id = p_comcet_id;
--
  v_dummy number;
  v_retorno varchar2(2);
begin
  v_retorno := 'NO';
  --
  open cr_comcet;
  fetch cr_comcet into v_dummy;
  close cr_comcet;
  -- Si la entrega está vencida
  if nvl(v_dummy, 0) = 1 then
    v_retorno := 'SI';
  end if;
  --
  return v_retorno;
end;
/* Recupera un registro desde la variable de paquete */
PROCEDURE COMCET_GET
 (P_COMCET OUT COM_COMPROBANTES_ENT%ROWTYPE
 )
 IS
begin
  -- Devuelve el registro almacenado en la variable de paquete
  p_comcet := v_comcet;
end;
/* Limpia la variable de paquete */
PROCEDURE COMCET_INI
 IS
begin
  v_comcee := null;
end;
/* Agregar un nuevo registro a COM_COMPROBANTES_ENT */
PROCEDURE COMCET_INS
 (P_COMCET IN COM_COMPROBANTES_ENT%ROWTYPE
 )
 IS
begin
  insert into COM_COMPROBANTES_ENT
  (
    ID
   ,SEGORG_ID
   ,COMOCM_ID
   ,CODIGO
   ,FECHA_VENCIMIENTO
   ,FECHA_RECEPCION
   ,MONTO
   ,OBSERVACION
   ,COMCEE_ID
   ,TIPO_ENTREGA
   ,SEGUSU_TIPO
   ,DATE_CREATED
   ,CREATED_BY
   ,DATE_MODIFIED
   ,MODIFIED_BY
  )
  values
  (
    p_comcet.ID
   ,p_comcet.SEGORG_ID
   ,p_comcet.COMOCM_ID
   ,p_comcet.CODIGO
   ,p_comcet.FECHA_VENCIMIENTO
   ,p_comcet.FECHA_RECEPCION
   ,p_comcet.MONTO
   ,p_comcet.OBSERVACION
   ,p_comcet.COMCEE_ID
   ,p_comcet.TIPO_ENTREGA
   ,p_comcet.SEGUSU_TIPO
   ,p_comcet.DATE_CREATED
   ,p_comcet.CREATED_BY
   ,p_comcet.DATE_MODIFIED
   ,p_comcet.MODIFIED_BY
  );
end;
/* Recupera un registro por su ID */
PROCEDURE COMCET_SET
 (P_ID IN NUMBER
 )
 IS
cursor cr_comcet is
  select *
  from   COM_COMPROBANTES_ENT comcet
  where  comcet.ID = p_id;
begin
  COMCET_INI;
  open cr_comcet;
  fetch cr_comcet into v_comcet;
  close cr_comcet;
end;
/* Obtener el valor de la variable v_comclp. */
PROCEDURE COMCLP_GET
 (P_COMCLP OUT COM_CALIFICACIONES_PRO%ROWTYPE
 )
 IS
begin
  p_comclp := v_comclp;
end;
/* Inicializar la variable v_comclp. */
PROCEDURE COMCLP_INI
 IS
begin
    v_comclp := null;
end;
/* Insertar registro en COM_CONTRATACIONES_PRO. */
PROCEDURE COMCLP_INS
 (P_COMCLP IN COM_CALIFICACIONES_PRO%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_CALIFICACIONES_PRO
  ( ID
    ,COMCLF_ID
    ,COMCPT_ID
    ,FECHA
    ,DESCRIPCION
    ,ESTADO
    ,FECHA_ESTADO
    ,MOTIVO_ESTADO
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY
  )
  VALUES
  (  p_comclp.ID
    ,p_comclp.COMCLF_ID
    ,p_comclp.COMCPT_ID
    ,p_comclp.FECHA
    ,p_comclp.DESCRIPCION
    ,p_comclp.ESTADO
    ,p_comclp.FECHA_ESTADO
    ,p_comclp.MOTIVO_ESTADO
    ,p_comclp.DATE_CREATED
    ,p_comclp.CREATED_BY
    ,p_comclp.DATE_MODIFIED
    ,p_comclp.MODIFIED_BY
  );
  --
END;
/* Setear la variable v_comclp. */
PROCEDURE COMCLP_SET
 (P_ID IN NUMBER
 )
 IS
cursor cr_comclp is
  select *
  from COM_CALIFICACIONES_PRO COMCLP
  where COMCLP.ID = p_id;
begin
  -- Inicializa la variable
  COMCLP_INI;
  -- Cargar la variable con los datos de la consultaa
  open cr_comclp;
  fetch cr_comclp into v_comclp;
  close cr_comclp;
end;
/* Obtener el valor de la variable v_comcpd. */
PROCEDURE COMCPD_GET
 (P_COMCPD OUT COM_CALIFICACIONES_PRD%ROWTYPE
 )
 IS
begin
  p_comcpd := v_comcpd;
end;
/* Inicializar la variable v_comcpd. */
PROCEDURE COMCPD_INI
 IS
begin
    v_comcpd := null;
end;
/* Insertar registro en COM_CONTRATACIONES_PRD. */
PROCEDURE COMCPD_INS
 (P_COMCPD IN COM_CALIFICACIONES_PRD%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_CALIFICACIONES_PRD
  ( ID
    ,COMCLP_ID
    ,FECHA_ENTREGA
    ,DESCRIPCION
    ,SITUACION
    ,FECHA_SITUACION
    ,MOTIVO_SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY
  )
  VALUES
  (  p_comcpd.ID
     ,p_comcpd.COMCLP_ID
    ,p_comcpd.FECHA_ENTREGA
    ,p_comcpd.DESCRIPCION
    ,p_comcpd.SITUACION
    ,p_comcpd.FECHA_SITUACION
    ,p_comcpd.MOTIVO_SITUACION
    ,p_comcpd.DATE_CREATED
    ,p_comcpd.CREATED_BY
    ,p_comcpd.DATE_MODIFIED
    ,p_comcpd.MODIFIED_BY
  );
  --
END;
/* Setear la variable v_comcpd. */
PROCEDURE COMCPD_SET
 (P_ID IN NUMBER
 )
 IS
cursor cr_comcpd is
  select *
  from COM_CALIFICACIONES_PRD COMCPD
  where COMCPD.ID = p_id;
begin
  -- Inicializa la variable
  COMCPD_INI;
  -- Cargar la variable con los datos de la consultaa
  open cr_comcpd;
  fetch cr_comcpd into v_comcpd;
  close cr_comcpd;
end;
/* Obtener el valor de la variable v_comcpt. */
PROCEDURE COMCPT_GET
 (P_COMCPT OUT COM_CALIFICACIONES_PRT%ROWTYPE
 )
 IS
begin
  p_comcpt := v_comcpt;
end;
/* Inicializar la variable v_comcpt. */
PROCEDURE COMCPT_INI
 IS
begin
    v_comcpt := null;
end;
/* Insertar registro en COM_CONTRATACIONES_PRT. */
PROCEDURE COMCPT_INS
 (P_COMCPT IN COM_CALIFICACIONES_PRT%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_CALIFICACIONES_PRT
  ( ID
    ,SEGORG_ID
    ,CODIGO
    ,NOMBRE
    ,DESCRIPCION
    ,SITUACION
    ,FECHA_SITUACION
    ,MOTIVO_SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY
  )
  VALUES
  (  p_comcpt.ID
    ,p_comcpt.SEGORG_ID
    ,p_comcpt.CODIGO
    ,p_comcpt.NOMBRE
    ,p_comcpt.DESCRIPCION
    ,p_comcpt.SITUACION
    ,p_comcpt.FECHA_SITUACION
    ,p_comcpt.MOTIVO_SITUACION
    ,p_comcpt.DATE_CREATED
    ,p_comcpt.CREATED_BY
    ,p_comcpt.DATE_MODIFIED
    ,p_comcpt.MODIFIED_BY
  );
  --
END;
/* Setear la variable v_comcpt. */
PROCEDURE COMCPT_SET
 (P_ID IN NUMBER
 )
 IS
cursor cr_comcpt is
  select *
  from COM_CALIFICACIONES_PRT COMCPT
  where COMCPT.ID = p_id;
begin
  -- Inicializa la variable
  COMCPT_INI;
  -- Cargar la variable con los datos de la consultaa
  open cr_comcpt;
  fetch cr_comcpt into v_comcpt;
  close cr_comcpt;
end;
/* Setear la variable v_comcpt según codigo. */
PROCEDURE COMCPT_SET_CODIGO
 (P_SEGORG_ID IN NUMBER
 ,P_CODIGO IN VARCHAR2
 )
 IS
CURSOR cr_comcpt IS
    SELECT *
    FROM   COM_CALIFICACIONES_PRT COMCPT
    WHERE  COMCPT.SEGORG_ID = p_segorg_id
      AND  COMCPT.CODIGO = p_codigo;
  --
BEGIN
  -- Inicializar la variable
  COMCPT_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comcpt;
  FETCH cr_comcpt INTO v_comcpt;
  CLOSE cr_comcpt;
  --
END;
/* Controlar si una Entidad Contratante tiene al menos una orden vencida */
FUNCTION COMOCM_COMECO_VENCIDA_SN
 (P_COMECO_ID IN NUMBER
 ,P_SEGORG_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_comocm is
    select comocm.ID ID
    from com_ordenes_compras comocm,
         com_ordenes_compras_est comoce
    where comocm.COMECO_ID = P_COMECO_ID
      and comocm.COMOCE_ID = comoce.ID
      and comoce.ESTADO = 'APR'
      and comocm.SEGORG_ID = P_SEGORG_ID
    UNION
    select comocm.ID ID
    from com_ordenes_compras comocm
        ,com_ordenes_compras_est comoce
    where comocm.comoce_id = comoce.ID
      and comoce.estado = 'APR'
      and comocm.segorg_id = p_segorg_id
      and comocm.comeco_id IN (select VIN.COMECO_ID_HIJO
                               from COM_CONTRATANTES_VINC VIN
                              where VIN.COMECO_ID_PADRE = P_COMECO_ID);
   --
  v_vencida varchar2(2) := 'NO';
begin

    for v_comocm in cr_comocm loop
        v_vencida:= COMOCM_PKG.COMOCM_VENCIDA_SN(p_segorg_id => P_SEGORG_ID
                                                ,p_comocm_id => v_comocm.id);
        --Controlar si al menos una orden está vencida
        if v_vencida = 'SI' then
            exit;
        end if;

    end loop;

 return v_vencida;
end;
/* Cantidad Cotizada para el Item de la Orden de Compra */
FUNCTION COMOCM_COTIZADO_CNT
 (P_COMOCM_ID IN NUMBER
 ,P_COMOCD_ID IN NUMBER
 )
 RETURN NUMBER
 IS
cursor cr_comocd is
    select comadd.CANTIDAD_ADJUDICADA CANTIDAD
    from   COM_ORDENES_COMPRAS_DET comocd
          ,COM_ADJUDICACIONES_DET comadd
    where  comocd.COMOCM_ID = p_comocm_id
    and    comocd.COMADD_ID = comadd.ID
    and    comocd.ID = p_comocd_id;
  --
  v_comocd_cantidad number;
begin
  --
  open cr_comocd;
  fetch cr_comocd into v_comocd_cantidad;
  close cr_comocd;
  -- Cantidad Cotizada para el Item de la Orden de Compra
  return v_comocd_cantidad;
end;
/* Monto Cotizado para el Item de la Orden de Compra */
FUNCTION COMOCM_COTIZADO_MNT
 (P_COMOCM_ID IN NUMBER
 ,P_COMOCD_ID IN NUMBER
 )
 RETURN NUMBER
 IS
cursor cr_comocd is
    select comadd.CANTIDAD_ADJUDICADA * comczd.PRECIO_UNITARIO_FINAL  MONTO
    from   COM_ORDENES_COMPRAS_DET comocd
          ,COM_ADJUDICACIONES_DET comadd
          ,COM_COTIZACIONES_DETALLES comczd
    where  comocd.COMOCM_ID = p_comocm_id
    and    comocd.COMADD_ID = comadd.ID
    and    comocd.COMCZD_ID = comczd.ID
    and    comocd.ID = p_comocd_id;
  --
  v_comocd_cantidad number;
begin
  --
  open cr_comocd;
  fetch cr_comocd into v_comocd_cantidad;
  close cr_comocd;
  -- Monto Cotizado para el Item de la Orden de Compra
  return v_comocd_cantidad;
end;
/* Obtener si una orden posee entregas Para Autorizar. */
FUNCTION COMOCM_ENT_AUT_SN
 (P_COMOCM_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_comcet is
  -- Obtener entregas para autorizar en la orden
  select count(comcet.id)
  from   COM_COMPROBANTES_ENT comcet
  where  comcet.COMOCM_ID = p_comocm_id
    and  COMOCM_PKG.COMCET_AUTORIZADA_SN(p_comcet_id => comcet.ID) = 'NO';
--
  v_dummy number;
  v_retorno varchar2(2);
begin
  v_retorno := 'NO';
  --
  open cr_comcet;
  fetch cr_comcet into v_dummy;
  close cr_comcet;
  -- Si la orden tiene al menos una entrega para autorizar
  if v_dummy > 0 then
    v_retorno := 'SI';
  end if;
  --
  return v_retorno;
end;
/* Obtiene si una orden posee entregas Pendientes de autorizar. */
FUNCTION COMOCM_ENT_PEN_SN
 (P_COMOCM_ID IN NUMBER
 )
 RETURN VARCHAR2
 is
  --cursor cr_comcet is
  -- Obtener entregas para autorizar en la orden
  --select count(comcet.id)
  --from   COM_COMPROBANTES_ENT comcet
  --where  comcet.comocm_id = p_comocm_id
  --  and  comocm_pkg.comcet_pendiente_sn(p_comcet_id => comcet.id) = 'SI';
  
  cursor cr_comcet is
  -- Obtener entregas para autorizar en la orden
  select count(comcet.id)
  from   COM_COMPROBANTES_ENT comcet
  where  comcet.comocm_id = p_comocm_id
  and    comcet.comcee_estado = 'PEN';    
--
  v_dummy number;
  v_retorno varchar2(2);
begin
  v_retorno := 'NO';
  --
  open cr_comcet;
  fetch cr_comcet into v_dummy;
  close cr_comcet;
  -- Si la orden tiene al menos una entrega para autorizar
  if v_dummy > 0 then
    v_retorno := 'SI';
  end if;
  --
  return v_retorno;
end;
/* Determina si una orden posee alguna entrega vencida. */
FUNCTION COMOCM_ENT_VENC_SN
 (P_COMOCM_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_comcet is
  -- Obtener entregas vencidas para la orden
  select count(comcet.id)
  from   COM_COMPROBANTES_ENT comcet
  where  comcet.COMOCM_ID = p_comocm_id
    and  COMOCM_PKG.COMCET_VENCIDA_SN(p_comcet_id => comcet.ID) = 'SI';
--
  v_dummy number;
  v_retorno varchar2(2);
begin
  v_retorno := 'NO';
  --
  open cr_comcet;
  fetch cr_comcet into v_dummy;
  close cr_comcet;
  -- Si la orden tiene al menos una entrega vencida
  if v_dummy > 0 then
    v_retorno := 'SI';
  end if;
  --
  return v_retorno;
end;
/* Indica si existen entregas parciales */
FUNCTION COMOCM_ENTREGAS_PENDIENTES_SN
 (P_COMOCM_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_comcet_monto_entregado is
    select sum(comcet.MONTO) MONTO_ENTREGADO
    from   COM_COMPROBANTES_ENT comcet
          ,COM_COMPROBANTES_EST comcee
    where  comcet.COMOCM_ID = p_comocm_id
    and    comcet.COMCEE_ID = comcee.ID
    and    comcee.ESTADO in ('ENT', 'PEN', 'PAE', 'PAP');
  --
  v_comocm_monto number;
  v_comcet_monto_entregado number;
  v_retorno varchar2(2);
  --
begin
  v_retorno := 'SI';
  --
  v_comocm_monto := COMOCM_PKG.COMOCM_OBTN_MONTO(p_comocm_id => p_comocm_id);
  --
  open cr_comcet_monto_entregado;
  fetch cr_comcet_monto_entregado into v_comcet_monto_entregado;
  close cr_comcet_monto_entregado;
  --
  if v_comocm_monto = v_comcet_monto_entregado then
    v_retorno := 'NO';
  end if;
  --
  return v_retorno;
end;
/* Indica si se ha completado el Total de las entregas */
FUNCTION COMOCM_ENTREGAS_TOTALES_SN
 (P_COMOCM_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_comcet_monto_entregado is
    select nvl(sum(comcet.MONTO), 0) MONTO_ENTREGADO
    from   COM_COMPROBANTES_ENT comcet
          ,COM_COMPROBANTES_EST comcee
    where  comcet.COMOCM_ID = p_comocm_id
    and    comcet.COMCEE_ID = comcee.ID
    and    comcee.ESTADO in ('ENT');
  --
  v_comocm_monto number;
  v_comcet_monto_entregado number;
  v_retorno varchar2(2);
  --
begin
  v_retorno := 'NO';
  --
  v_comocm_monto := COMOCM_PKG.COMOCM_OBTN_MONTO(p_comocm_id => p_comocm_id);
  --
  open cr_comcet_monto_entregado;
  fetch cr_comcet_monto_entregado into v_comcet_monto_entregado;
  close cr_comcet_monto_entregado;
  -- Verifica si se han completado todas las entregas comparando el monto de las entregas
  -- contra el monto total cotizado
  if v_comocm_monto = v_comcet_monto_entregado then
    v_retorno := 'SI';
  end if;
  --
  return v_retorno;
end;
PROCEDURE COMOCM_ESTADISTICAS_PRCC
 (P_DIAS IN NUMBER := 1
 )
 IS
--
  cursor cr_datos is
  select distinct comocm.id
     , comocm.date_modified
     , comocm.date_created
  from com_ordenes_compras comocm
     , com_ordenes_compras_est comoce
     , com_ordenes_compras_est comoce2
  where comocm.comoce_id = comoce.id
    and comoce2.comocm_id = comocm.id
    and comoce2.date_created between trunc(sysdate)-nvl(p_dias,1) and sysdate;
  --
begin
  --
  for v_datos in cr_datos loop
    COMOCM_PKG.COMOCM_ESTADISTICAS_GNRR(p_comocm_id => v_datos.id);
  end loop;
  --
  EXECUTE IMMEDIATE ('TRUNCATE TABLE COM_ORDENES_COMPRAS_STDPOR');
  --
--  Para completar
  insert into COM_ORDENES_COMPRAS_STDPOR
  (SEGORG_ID
  ,ANIO
  ,MES
  ,DIA
  ,ORDENES_CNT
  ,ORDENES_MONTO
  ,COMECO_ID
  ,COMECO_NOMBRE
  ,COMECC_ID
  ,COMECC_NOMBRE
  ,COMCOB_ID
  ,COMCOB_NOMBRE)
   select comocs.SEGORG_ID SEGORG_ID
  ,substr(comocs.ANIO_MES_DIA,1,4) ANIO
  ,substr(comocs.ANIO_MES_DIA,6,2) MES
  ,substr(comocs.ANIO_MES_DIA,9,2) DIA
  ,count(comocs.id) ORDENES_CNT
  ,sum(comocs.monto) ORDENES_MONTO
  ,comocs.comeco_id
  ,upper(comeco.nombre) comeco_nombre
  ,comocs.comecc_id
  ,upper(comecc.nombre) comecc_nombre
  ,comocs.comcob_id
  ,upper(comcob.nombre) comcob_nombre
  from com_ordenes_compras_std comocs
     , com_catalogo_objetos comcob
     , com_contratantes comeco
     , com_contratantes_cat comecc
  where comocs.ESTADO NOT IN ('RCH','ANU','NOC','NUE','PEN')
    and comocs.comcob_id = comcob.id
    and comocs.comeco_id = comeco.id
    and comocs.comecc_id = comecc.id
  group by comocs.SEGORG_ID, comocs.ANIO_MES_DIA,comocs.comeco_id,upper(comeco.nombre),comocs.comecc_id,upper(comecc.nombre),comocs.comcob_id,upper(comcob.nombre);
  --
end;
PROCEDURE COMOCM_ESTADISTICAS_GNRR
 (P_COMOCM_ID IN NUMBER
 )
 IS
cursor cr_comocs is
  select *
  from com_ordenes_compras_std
  where comocm_id = p_comocm_id;
  --
  cursor cr_comocm is
  select *
  from com_ordenes_compras
  where id = p_comocm_id;
  --
  cursor cr_comoce (p_comoce_id in number)is
  select *
  from com_ordenes_compras_est
  where id = p_comoce_id;
  --
  cursor cr_comped (p_comcon_id in number) is
  select comped.*
  from com_pedidos comped
      ,com_contrataciones_detalles comcot
  where comped.id = comcot.comped_id
    and comcot.comcon_id = p_comcon_id;
  --
  cursor cr_comcon (p_comcon_id in number) is
  select *
  from com_contrataciones
  where id = p_comcon_id;
  --
  cursor cr_comeco (p_comeco_id in number) is
  select *
  from com_contratantes
  where id = p_comeco_id;
  --
  v_comeco com_contratantes%rowtype;
  v_comcon com_contrataciones%rowtype;
  v_comped com_pedidos%rowtype;
  v_comoce com_ordenes_compras_est%rowtype;
  v_comocs com_ordenes_compras_std%rowtype;
begin
  -- Obtener el registro de estadisticas
  open cr_comocs;
  fetch cr_comocs into v_comocs;
  close cr_comocs;
  -- Si no existe, generarlo y recuperarlo
  if v_comocs.id is null then
     insert into com_ordenes_compras_std
     (comocm_id) values (p_comocm_id);
     open cr_comocs;
     fetch cr_comocs into v_comocs;
     close cr_comocs;
  end if;
  -- Obtener los datos de la Orden de Compra
  for v_comocm in cr_comocm loop
    --
    v_comocs.segorg_id := v_comocm.segorg_id;
    v_comocs.comprv_id := v_comocm.comprv_id;
    v_comocs.comeco_id := v_comocm.comeco_id;
    v_comocs.anio_mes_dia  := to_char(v_comocm.fecha_generacion,'YYYY-MM-DD');
    v_comocs.monto     := v_comocm.monto;
    --
    -- Obtener los datos del estado de la orden de compra
    open cr_comoce(p_comoce_id => v_comocm.comoce_id);
    fetch cr_comoce into v_comoce;
    close cr_comoce;
    --
    v_comocs.estado   := v_comoce.estado;
    --
    -- Obtener el Objeto de Gasto del Pedido de Compra asociado
    open cr_comped (p_comcon_id => v_comocm.comcon_id);
    fetch cr_comped into v_comped;
    close cr_comped;
    --
    v_comocs.comcob_id := v_comped.comcob_id;
    --
    -- Obtener el Tipo de Contratación de la Contratación
    open cr_comcon(p_comcon_id => v_comocm.comcon_id);
    fetch cr_comcon into v_comcon;
    close cr_comcon;
    --
    v_comocs.comctt_id := v_comcon.comctt_id;
    --
    -- Obtener la categoria de Entidad contratante (Jurisdicción) de la Entidad Contratante
    open cr_comeco (p_comeco_id => v_comocm.comeco_id);
    fetch cr_comeco into v_comeco;
    close cr_comeco;
    --
    v_comocs.comecc_id := v_comeco.comecc_id;
    --
    update com_ordenes_compras_std
    set segorg_id = v_comocs.segorg_id
      , anio_mes_dia  = v_comocs.anio_mes_dia
      , monto     = v_comocs.monto
      , estado    = v_comocs.estado
      , comcob_id = v_comocs.comcob_id
      , comeco_id = v_comocs.comeco_id
      , comecc_id = v_comocs.comecc_id
      , comprv_id = v_comocs.comprv_id
      , comctt_id = v_comocs.comctt_id
    where id = v_comocs.id;
  end loop;
  --
end;
/* Actualizar fecha máxima de entrega a medida que se pactan entregas. */
PROCEDURE COMOCM_FECHA_ENTREGA
 (P_COMCET_ID IN NUMBER
 ,P_COMOCM_ID IN NUMBER
 )
 IS
cursor cr_comctt (p_comctt_id number) is
   select comctt.limite_max_calificar dias
   from com_contrataciones_tipos comctt
   where comctt.id = p_comctt_id;

v_comcet com_comprobantes_ent%rowtype;
v_comocm com_ordenes_compras%rowtype;
v_comcon com_contrataciones%rowtype;
v_comctt number;
v_plazo_max number;
begin
-- Obtener datos entrega
comocm_pkg.comcet_set(p_id => p_comcet_id);
comocm_pkg.comcet_get(p_comcet => v_comcet);
comocm_pkg.comcet_ini;
--
--Obtener datos orden
com_pkg.set_comocm(p_id => p_comocm_id);
com_pkg.get_comocm(p_comocm => v_comocm);
com_pkg.ini_comocm;
-- Obtener datos contratación
com_pkg.set_comcon(p_comcon_id => v_comocm.comcon_id);
com_pkg.get_comcon(p_comcon => v_comcon);
com_pkg.ini_comcon;
--Obtener datos del tipo de contratación
open cr_comctt(p_comctt_id => v_comcon.comctt_id);
fetch cr_comctt into v_comctt;
close cr_comctt;
--
if v_comctt is null then
    --Obtener el máximo de días para calificar
    v_plazo_max := SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => 'COMADM_OCMGES_PLAZO_MAX_CLF'
                                            ,P_SEGORG_ID => v_comocm.SEGORG_ID);
else
    v_plazo_max := v_comctt;
end if;
-- Si la nueva fecha estimada de entrega es mayor a la anterior, actualizamos la fecha
if (to_date(to_char(v_comcet.fecha_vencimiento + v_plazo_max,'DD/MM/YYYY'),'DD/MM/YYYY') > to_date(to_char(v_comocm.fecha_max_calificacion,'DD/MM/YYYY'),'DD/MM/YYYY')) then
    update com_ordenes_compras
    set fecha_max_calificacion = (v_comcet.fecha_vencimiento + v_plazo_max)
    where id = p_comocm_id;
end if;

end;
/* Modificar la fecha de entrega estimada al anular una entrega. */
PROCEDURE COMOCM_FECHA_ENT_ANU
 (P_COMOCM_ID IN NUMBER
 ,P_COMCET_ID IN NUMBER
 )
 IS
cursor cr_comcet_cant is
    select count(comcet.id)
    from com_comprobantes_ent comcet
        ,com_comprobantes_est comcee
    where comocm_id = p_comocm_id
     and  comcet.comcee_id = comcee.id
     and  comcee.estado in ('PEN','ENT');
 --
 cursor cr_comcet_fecha_max is
    select max(comcet.fecha_vencimiento) fecha
    from com_comprobantes_ent comcet
        ,com_comprobantes_est comcee
    where comocm_id = p_comocm_id
     and  comcet.comcee_id = comcee.id
     and  comcee.estado in ('PEN','ENT')
     and  comcet.id <> p_comcet_id;
 --
 cursor cr_comoce is
     select min(fecha) fecha
     from com_ordenes_compras_est
    where comocm_id = p_comocm_id
      and estado = 'APR'
      and situacion = 'VAL';
 --
 cursor cr_comctt (p_comctt_id number) is
   select comctt.limite_max_calificar dias
   from com_contrataciones_tipos comctt
   where comctt.id = p_comctt_id;

v_comcet com_comprobantes_ent%rowtype;
v_comocm com_ordenes_compras%rowtype;
v_comcon com_contrataciones%rowtype;
v_comctt number;
v_plazo_max number;
v_comcet_cant number;
v_comoce cr_comoce%rowtype;
v_comcet_fecha_max cr_comcet_fecha_max%rowtype;
begin

-- Obtener datos entrega
comocm_pkg.comcet_set(p_id => p_comcet_id);
comocm_pkg.comcet_get(p_comcet => v_comcet);
comocm_pkg.comcet_ini;
-- Obtener la cantidad de entregas Pendientes o Entregadas de la orden
open cr_comcet_cant;
fetch cr_comcet_cant into v_comcet_cant;
close cr_comcet_cant;
--Obtener datos orden
com_pkg.set_comocm(p_id => p_comocm_id);
com_pkg.get_comocm(p_comocm => v_comocm);
com_pkg.ini_comocm;
-- Obtener datos contratación
com_pkg.set_comcon(p_comcon_id => v_comocm.comcon_id);
com_pkg.get_comcon(p_comcon => v_comcon);
com_pkg.ini_comcon;
--Obtener datos del tipo de contratación
open cr_comctt(p_comctt_id => v_comcon.comctt_id);
fetch cr_comctt into v_comctt;
close cr_comctt;
if v_comctt is null then
    --Obtener el máximo de días para calificar
    v_plazo_max := SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => 'COMADM_OCMGES_PLAZO_MAX_CLF'
                                            ,P_SEGORG_ID => v_comocm.SEGORG_ID);
else
    v_plazo_max := v_comctt;
end if;
--
-- Si la cantidad de entregas es igual a 1, volveremos a la fecha estimada de entrega inicial
if v_comcet_cant = 1 then

    --Obtener fecha de la primera aprobación de la orden
    open cr_comoce;
    fetch cr_comoce into v_comoce;
    close cr_comoce;
    --
    update com_ordenes_compras
       set fecha_max_calificacion = (v_comoce.fecha + v_plazo_max)
     where id = p_comocm_id;
--
-- Si la cantidad de entregas es mayor que 1
-- Analizaremos si es preciso ajustar la fecha estimada de entrega o no
elsif v_comcet_cant > 1 then
    -- Obtener la fecha máxima de entrega
   open cr_comcet_fecha_max;
   fetch cr_comcet_fecha_max into v_comcet_fecha_max;
   close cr_comcet_fecha_max;
   -- Si la fecha de entrega, de la entrega que anularemos, es mayor que la fecha máxima
   -- de las entregas registradas, ajustamos la fecha
    if v_comcet.fecha_vencimiento > v_comcet_fecha_max.fecha then
        update com_ordenes_compras
        set fecha_max_calificacion = (v_comcet_fecha_max.fecha + v_plazo_max)
        where id = p_comocm_id;
    end if;
end if;
end;
/* Monto total de la Orden */
FUNCTION COMOCM_OBTN_MONTO
 (P_COMOCM_ID IN NUMBER
 )
 RETURN NUMBER
 IS
-- Obtener el monto total cotizado para la orden de compra
cursor cr_comocd is
  select sum(COMADD.CANTIDAD_ADJUDICADA * comczd.PRECIO_UNITARIO_FINAL) MONTO
  from   COM_ORDENES_COMPRAS_DET comocd
        ,COM_ADJUDICACIONES_DET comadd
        ,COM_COTIZACIONES_DETALLES comczd
  where  comocd.COMOCM_ID = p_comocm_id
  and    comocd.COMADD_ID = comadd.ID
  and    comocd.COMCZD_ID = comczd.ID;
  --and    comadd.SITUACION = 'GEN';
  --
  v_comocd_monto number;
begin
  --
  open cr_comocd;
  fetch cr_comocd into v_comocd_monto;
  close cr_comocd;
  --
  return v_comocd_monto;
end;
/* Obtener el Id de la Calificación actual para una orden de compra */
FUNCTION COMOCM_OBTN_CLF
 (P_COMOCM_ID IN NUMBER
 )
 RETURN NUMBER
 IS
-- Obtiene la  calificacion actual que es la ultima valida realizada
  cursor cr_comclf is
  select max(comclf.id) comclf_id
  from com_calificaciones comclf
  where comclf.comocm_id = p_comocm_id
    and comclf.situacion = 'VAL'
    and comclf.fecha = (select max(comclf2.fecha)
                        from com_calificaciones comclf2
                        where comclf2.comocm_id = p_comocm_id
                          and comclf2.situacion = 'VAL');
  --
  v_retorno number;
  --
begin
  -- Obtener la calificación actual.
  open cr_comclf;
  fetch cr_comclf into v_retorno;
  close cr_comclf;
  --
  return v_retorno;
  --
end;
/* Obtener el Estado de una Orden de Compra */
FUNCTION COMOCM_OBTN_ESTADO
 (P_COMOCM_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
--
  CURSOR cr_comoce IS
  SELECT COMOCE.ESTADO
  FROM COM_ORDENES_COMPRAS_EST COMOCE
      ,COM_ORDENES_COMPRAS COMOCM
  WHERE COMOCE.ID = COMOCM.COMOCE_ID
    AND COMOCM.ID = p_comocm_id;
  --
  v_retorno varchar2(100);
  --
BEGIN
  --
  OPEN cr_comoce;
  FETCH cr_comoce INTO v_retorno;
  CLOSE cr_comoce;
  --
  RETURN v_retorno;
  --
END;
FUNCTION COMOCM_VENCIDA_SN
 (P_SEGORG_ID IN NUMBER
 ,P_COMOCM_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
-- Obtener si está vencida
cursor cr_comocm_vencida is
 select 'SI'
 from com_ordenes_compras comocm
     ,com_ordenes_compras_est comoce
 where comocm.comoce_id = comoce.ID
   and comocm.id = p_comocm_id
   and comoce.estado = 'APR'
   and comocm.segorg_id = p_segorg_id
   and sysdate > fecha_max_calificacion;
  --
  v_resultado varchar2(2) := 'NO';
begin
    -- Verificar si está vencida en estado APROBADA
    open cr_comocm_vencida;
    fetch cr_comocm_vencida into v_resultado;
    close cr_comocm_vencida;
    --
    return v_resultado;
    --
end;
/* Determinar si el plazo para responder una réplica ha finalizado */
FUNCTION COMREP_PLAZO_FINALIZADO_SN
 (P_COMOCM_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
-- Obtener la calificación registrada para la orden de compra
cursor cr_comclf is
  select comclf.*
    from COM_CALIFICACIONES comclf
   where comclf.COMOCM_ID = p_comocm_id
     and comclf.SITUACION = 'VAL';
-- Obtener la réplica asociada a la orden para la calificación actual
cursor cr_comrep(p_comclf_id number) is
  select *
    from COM_REPLICAS comrep
   where comrep.COMOCM_ID = p_comocm_id
     and comrep.COMCLF_ID = p_comclf_id
     and comrep.ESTADO <> 'ANU';
-- Obtiene el ultimo detalle de replica registrado que se encuentre vigente
cursor cr_comred(p_comrep_id number) is
select *
  from COM_REPLICAS_DET comred2
 where comred2.ID = (select max(comred.id)
                       from COM_REPLICAS_DET comred
                      where comred.COMREP_ID = p_comrep_id
                        and comred.SITUACION = 'VIG');
--
v_comclf cr_comclf%rowtype;
v_comocm COM_ORDENES_COMPRAS%rowtype;
v_comrep cr_comrep%rowtype;
v_comred cr_comred%rowtype;
v_max_plazo_eco number;
v_max_plazo_prv number;
v_retorno varchar2 (2);
begin
v_retorno := 'SI';
--
COM_PKG.SET_COMOCM(p_comocm_id);
COM_PKG.GET_COMOCM(v_comocm);
COM_PKG.INI_COMOCM;
--
   --
   open cr_comclf;
  fetch cr_comclf into v_comclf;
  close cr_comclf;
  -- Obtener la réplica actual
   open cr_comrep(v_comclf.id);
  fetch cr_comrep into v_comrep;
  close cr_comrep;
  -- Obtener el ultimo detalle de replica vigente
 if v_comrep.id is not null then
      open cr_comred(v_comrep.id);
     fetch cr_comred into v_comred;
     close cr_comred;
end if;
-- Obtener el maximo plazo para respuesta del entidad contratante
v_max_plazo_eco := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo => 'COMADM_COMREP_PLAZO_MAX_REP_ECO'
,p_segorg_id => v_comocm.SEGORG_ID);
-- Obtener el maximo plazo para respuesta del proveedor
v_max_plazo_prv := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo => 'COMADM_COMREP_PLAZO_MAX_REP_PRV'
,p_segorg_id => v_comocm.SEGORG_ID);
--

    if v_comred.DESTINO <> 'ADM' then
        -- Si aun no se venció el plazo de respuesta para la ECO
        if v_comred.DESTINO = 'ECO' and (v_comred.FECHA + (v_max_plazo_eco/24) > sysdate) then
            v_retorno:= 'NO';
        end if;
        ---- Si aun no se venció el plazo de respuesta para el PRV
        if v_comred.DESTINO = 'PRV' and (v_comred.FECHA + (v_max_plazo_prv/24) > sysdate) then
            v_retorno:= 'NO';
        end if;
    else
        v_retorno:= 'SI';
    end if;
return v_retorno;
end;
/* Determinar el estado de las replicas para una orden de compra */
FUNCTION COMOCM_REPLICA_EST
 (P_COMOCM_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
-- Cuando una orden de provisión es calificada
  -- puede iniciarse un proceso de reclamo de la calificación otorgada
  -- por parte del proveedor.
  -- Este procedimiento se realiza mediante el registro de un descargo por parte del proveedor.
  -- Cuando un descargo es iniciado, el sistema deriva la atención del mismo
  -- a la Entidad Contratante a cargo del pedido por un periodo de tiempo configurable
  -- Cumplido dicho plazo, el sistema deriva la atención a la Administración Central
  -- La contestación de los descargos se realizan mediante el registro de "Replicas"
  -- Las replicas son las contestaciones realizadas ya sea por las entidades contratantes
  -- o la administración sobre el descargo abierto por el proveedor.
  -- Una vez contestado el descargo, el sistema deriva la contestación al proveedor por un plazo configurable.
  -- El proveedor posee entonces la opción de contestar nuevamente el descargo ingresando también una "replica".-
  -- Las replicas en este caso también sirven para registrar las contestaciones de los proveedores.
  -- Una vez contestada por el proveedor vuelve a iniciarse el ciclo antes descripto remitiendo el sistema
  -- a la entidad contratantes el descargo.
  -- En cualquier punto del proceso, mientras el descargo se encuentre a disposición de la administración central
  -- esta puede resolver el descargo en forma directa cerrandolo y estableciendo en forma definitiva su situación.
  -- Esta función determina para cada descargo, quien se encuentra a cargo de su atención en este momento.
  --
  -- Determina si la orden para la calificación posee replicas validas realizadas
  cursor cr_comrep_sn (p_comclf_id in number) is
  select 1
  from com_replicas comrep
  where comrep.comocm_id = p_comocm_id
    and comrep.comclf_id = p_comclf_id
    and comrep.estado not in ('NUE','ANU');
  --
  -- Determinar si la orden para la calificación posee replicas abiertas
  cursor cr_comrep_abi (p_comclf_id in number) is
  select max(comrep.id) comrep_id
  from com_replicas comrep
  where comrep.comocm_id = p_comocm_id
    and comrep.comclf_id = p_comclf_id
    and comrep.estado in ('PRE','REP');  -- Replicas abiertas (para contestar o contestadas)
  --
  -- Obtener la replica vigente actualmente
  cursor cr_comred (p_comrep_id in number) is
  select *
  from com_replicas_det comred
  where comred.id = (select max(comred1.id) comred_id
                     from com_replicas_det comred1
                     where comred1.comrep_id = p_comrep_id
                       and comred1.situacion = 'VIG'
                       and comred1.fecha = (select max(comred2.fecha)
                                            from com_replicas_det comred2
                                            where comred2.comrep_id = p_comrep_id
                                              and comred2.situacion = 'VIG'));
  --
  -- Obtener la cantidad de replicas realizadas pra un origen dado
  cursor cr_comred_ori (p_comrep_id in number, p_origen in varchar2) is
  select count(1) cantidad
  from com_replicas_det comred
  where comred.comrep_id = p_comrep_id
    and comred.origen = p_origen
    and comred.situacion = 'VIG';
  --
  -- Obtiene los datos de la calificación
  v_comocm         com_ordenes_compras%rowtype;
  v_comclf         com_calificaciones%rowtype;
  v_comred         com_replicas_det%rowtype;
  v_max_plazo_prv  number;
  v_max_plazo_eco  number;
  v_max_cant_eco   number;
  v_max_cant_prv   number;
  v_comocm_estado  varchar2(100);
  v_comrep_id      number;
  v_dummy          number;
  v_retorno        varchar2(100);
begin
  -- Obtener los datos de la orden
  COM_PKG.SET_COMOCM(p_id => p_comocm_id);
  COM_PKG.GET_COMOCM(p_comocm => v_comocm);
  COM_PKG.INI_COMOCM;
  -- Obtener el estado de la orden
  -- Solo las ordenes calificadas serán analizadas aqui, las demás se consideran que tienen sus calificaciones pendientes de realizar.
  v_comocm_estado := COMOCM_PKG.COMOCM_OBTN_ESTADO(p_comocm_id => p_comocm_id);
  --
  if nvl(v_comocm_estado,'0') not in ('CON','NOC') then
     v_retorno := 'PENDIENTE';
     return v_retorno;
  end if;
  --
  -- Obtener el tiempo maximo que el proveedor tiene para realizar una replica (la configuración esta en horas)
  begin
    v_max_plazo_prv := nvl(SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo => 'COMADM_COMREP_PLAZO_MAX_REP_PRV'
                                                    ,p_segorg_id => v_comocm.segorg_id),0);
  exception
     when others then
        raise_application_error(-20000,'Error al intentar obtener las configuraciones de valores para determinar el estado del descargo',true);
  end;
  --
  -- Obtener los datos de la calificación actual de la orden de compra
  COM_PKG.SET_COMCLF(p_id => COMOCM_PKG.COMOCM_OBTN_CLF(p_comocm_id => p_comocm_id));
  COM_PKG.GET_COMCLF(p_comclf => v_comclf);
  COM_PKG.INI_COMCLF;
  -- Si por algun adefesio de la naturaleza (tambien llamado inconsistencia de datos) no me recupera
  -- la calificación actual, no se puede determinar si hay algun descargo que atender, por lo cual, bien gracias, nadie esta a cargo y se considera finalizado.
  if v_comclf.id is null or v_comclf.fecha is null then
     v_retorno := 'FINALIZADA';
     return v_retorno;
  end if;
  --
  v_dummy := 0;
  -- Determinar si la calificación posee replicas realizadas.
  open cr_comrep_sn(p_comclf_id => v_comclf.id);
  fetch cr_comrep_sn into v_dummy;
  close cr_comrep_sn;
  --
  -- Si la calificación no posee replicas y se ha pasado el tiempo maximo asignado al proveedor para realizarla, se finaliza
  if nvl(v_dummy,0) = 0 and v_comclf.fecha+(v_max_plazo_prv/24) < sysdate then
     v_retorno := 'FINALIZADA';
     return v_retorno;
  elsif nvl(v_dummy,0) = 0 and v_comclf.fecha+(v_max_plazo_prv/24) >= sysdate then
     v_retorno := 'PARA REVISAR POR EL PROVEEDOR';
     return v_retorno;
  end if;
  --
  v_dummy := 0;
  -- Determinar si la calificación posee replicas abiertas
  open cr_comrep_abi(p_comclf_id => v_comclf.id);
  fetch cr_comrep_abi into v_comrep_id;
  close cr_comrep_abi;
  --
  -- Si la calificación no posee replicas abiertas, esta resuelta.
  if nvl(v_comrep_id,0) = 0 then
     v_retorno := 'FINALIZADA CON DESCARGO RESUELTO';
     return v_retorno;
  end if;
  --
  -- En este punto sabemos que existe una replica y que esta abierta
  -- Es necesario entonces, obtener cual es el ultimo detalle (movimiento) que se ha realizado sobre la misma
  -- para determinar quien esta a cargo de contestarla.
  --
  -- Obtener el movimiento vigente de la replica.
  open cr_comred(p_comrep_id => v_comrep_id);
  fetch cr_comred into v_comred;
  close cr_comred;
  -- Si por algun adefesio de la naturaleza (inconsistencia de datos) no se recupera correctamente el ultimo movimiento
  -- vigente de la replica, consideraremos que esta resuelta porque no es posible determinar quien la debe atender.
  if v_comred.id is null then
     v_retorno := 'FINALIZADA CON DESCARGO RESUELTO';
     return v_retorno;
  end if;
  -- Para determinar quien lo debe atender, ademas de los datos de la ultima replica
  -- se necesitan las configuraciones de cantidades y plazos para la contestación.
  --
  --
  begin
    -- Obtener el maximo plazo para respuesta del entidad contratante
    v_max_plazo_eco := nvl(SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo => 'COMADM_COMREP_PLAZO_MAX_REP_ECO'
                                                    ,p_segorg_id => v_comocm.SEGORG_ID),0);
    -- Obtiene el maximo numero de replicas permitidas para la entidad contratante
    v_max_cant_eco := nvl(SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo => 'COMADM_COMREP_CANT_MAX_REP_ECO'
                                                   ,p_segorg_id => v_comocm.SEGORG_ID),99999);
    -- Obtiene el maximo numero de replicas permitidas para el proveedor
    v_max_cant_prv := nvl(SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo => 'COMADM_COMREP_CANT_MAX_REP_PRV'
                                                   ,p_segorg_id => v_comocm.SEGORG_ID),99999);
  exception
     when others then
        raise_application_error(-20000,'Error al intentar obtener las configuraciones adicionales de valores para determinar el estado del descargo',true);
  end;
  --
  if v_comred.destino = 'ADM' then
     v_retorno := 'PARA REVISAR POR LA ADMINISTRACION';
  elsif v_comred.destino = 'ECO' and v_comred.fecha+(v_max_plazo_eco/24) >= sysdate then
     --
     -- Determinar la cantidad de replicas realizadas por la entidad contratante
     v_dummy := 0;
     open cr_comred_ori (p_comrep_id => v_comrep_id, p_origen => 'ECO');
     fetch cr_comred_ori into v_dummy;
     close cr_comred_ori;
     --
     -- Si la entidad contratante ha superado la cantidad de replicas habilitadas, se deriva a la ADMINISTRACION directamente.
     if nvl(v_dummy,0) > v_max_cant_eco then
        v_retorno := 'PARA REVISAR POR LA ADMINISTRACION';
     else
        v_retorno := 'PARA REVISAR POR LA ENTIDAD CONTRATANTE';
     end if;
     --
  elsif v_comred.destino = 'ECO' and v_comred.fecha+(v_max_plazo_eco/24) < sysdate then
     v_retorno := 'PARA REVISAR POR LA ADMINISTRACION';
  elsif v_comred.destino = 'PRV' and v_comred.fecha+(v_max_plazo_prv/24) >= sysdate then
     --
     -- Determinar la cantidad de replicas realizadas por el proveedor
     v_dummy := 0;
     open cr_comred_ori (p_comrep_id => v_comrep_id, p_origen => 'PRV');
     fetch cr_comred_ori into v_dummy;
     close cr_comred_ori;
     -- Si el proveedor ha superado la cantidad de replicas habilitadas, se deriva a la ADMINISTRACION directamente.
     if nvl(v_dummy,0) > v_max_cant_prv then
        v_retorno := 'PARA REVISAR POR LA ADMINISTRACION';
     else
        v_retorno := 'PARA REVISAR POR EL PROVEEDOR';
     end if;
     --
  elsif v_comred.destino = 'PRV' and v_comred.fecha+(v_max_plazo_prv/24) < sysdate then
     v_retorno := 'PARA REVISAR POR LA ADMINISTRACION';
  else
     v_retorno := 'PARA REVISAR POR LA ADMINISTRACION';
  end if;
  --
  return v_retorno;
  --
end;
FUNCTION COMREP_REPLICA_HS
 (P_COMOCM_ID IN NUMBER
 ,P_ORIGEN IN VARCHAR2
 )
 RETURN VARCHAR2
 IS
-- Obtener la calificación registrada para la orden de compra
cursor cr_comclf is
  select comclf.*
    from COM_CALIFICACIONES comclf
   where comclf.COMOCM_ID = p_comocm_id
     and comclf.SITUACION = 'VAL';
-- Obtener la réplica asociada a la orden para la calificación actual
cursor cr_comrep(p_comclf_id number) is
  select *
    from COM_REPLICAS comrep
   where comrep.COMOCM_ID = p_comocm_id
     and comrep.COMCLF_ID = p_comclf_id
     and comrep.ESTADO <> 'ANU';
-- Obtiene el ultimo detalle de replica registrado que se encuentre vigente
cursor cr_comred(p_comrep_id number) is
select *
  from COM_REPLICAS_DET comred2
 where comred2.ID = (select max(comred.id)
                       from COM_REPLICAS_DET comred
                      where comred.COMREP_ID = p_comrep_id
                        and comred.SITUACION = 'VIG');
--
  v_comrep cr_comrep%rowtype;
  v_comred cr_comred%rowtype;
  v_comclf cr_comclf%rowtype;
--
  v_retorno varchar2(100);
  v_max_plazo_eco number;
  v_max_plazo_prv number;
begin
  --
  -- Obtener la calificación para obtener la fecha limite de replicas
   open cr_comclf;
  fetch cr_comclf into v_comclf;
  close cr_comclf;
  -- Obtener la réplica actual
   open cr_comrep(v_comclf.id);
  fetch cr_comrep into v_comrep;
  close cr_comrep;
  -- Obtener el ultimo detalle de replica vigente
   if v_comrep.id is not null then
      open cr_comred(v_comrep.id);
     fetch cr_comred into v_comred;
     close cr_comred;
   end if;

  -- Obtener el maximo plazo para respuesta del entidad contratante
  v_max_plazo_eco := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo => 'COMADM_COMREP_PLAZO_MAX_REP_ECO'
                                              ,p_segorg_id => v_comclf.SEGORG_ID);
  -- Obtener el maximo plazo para respuesta del proveedor
  v_max_plazo_prv := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo => 'COMADM_COMREP_PLAZO_MAX_REP_PRV'
                                              ,p_segorg_id => v_comclf.SEGORG_ID);
  --
  v_retorno := NULL;
  --
  --  Si se han realizado replicas
  if v_comrep.ID is not null and v_comred.ID is not null then
    --Si es destino de la replica se permite replicar
    if p_origen = 'PRV' and v_comred.destino = p_origen then
       -- Si la replica ha sido respondida se permite replicar
      if v_comrep.ESTADO = 'REP' then
        -- Si se encuentra dentro del limite de tiempo para replicas del proveedor retornamos las horas restantes, con respecto a la fecha de la última réplica
        if (v_comred.FECHA + (v_max_plazo_prv/24) >= sysdate) then
          v_retorno := ((v_comred.FECHA + (v_max_plazo_prv/24)) - sysdate)*24;
          --Verificar si restan horas o minutos
          if v_retorno < 1 then
            v_retorno:= trunc(((v_retorno)*60))||' min  de '||v_max_plazo_prv||' hs';
          else
            v_retorno:= trunc(v_retorno)||' de '||v_max_plazo_prv||' hs';
          end if;
        end if;
      end if;
    end if;
    --Si es destino de la replica se permite replicar
    if p_origen = 'ECO' and v_comred.destino = p_origen then
      -- Si el estado de la replica es PRE se permite replicar
      if v_comrep.ESTADO in ('PRE','REP') then
        -- Si se encuentra dentro del limite de tiempo para replicas de la unidad ejecutora retornamos las horas restantes, con respecto a la fecha de la última réplica
        if (v_comred.FECHA + (v_max_plazo_eco/24) >= sysdate) then
           v_retorno := ((v_comred.FECHA + (v_max_plazo_eco/24)) - sysdate)*24;
           --Verificar si restan horas o minutos
          if v_retorno < 1 then
            v_retorno:= trunc(((v_retorno)*60))||' min  de '||v_max_plazo_eco||' hs';
          else
            v_retorno:= trunc(v_retorno)||' hs de '||v_max_plazo_eco||' hs';
          end if;
        end if;
      end if;
    end if;
    if p_origen = 'ADM' then
         v_retorno := null;
    end if;
    -- Si no se han realizado replicas  y el origen es PRV
  elsif p_origen = 'PRV' then
  -- Si se encuentra dentro del limite de tiempo para replicas del proveedor retornamos las horas restantes, con respecto a la fecha de la calificación
    if (v_comclf.FECHA + (v_max_plazo_prv/24) >= sysdate) then
      v_retorno := ((v_comclf.FECHA + (v_max_plazo_prv/24)) - sysdate)*24;
      if v_retorno < 1 then
        v_retorno:= trunc(((v_retorno)*60))||' min  de '||v_max_plazo_prv||' hs';
      else
        v_retorno:= trunc(v_retorno)||' hs de '||v_max_plazo_prv||' hs';
      end if;
    end if;
  end if;
  --
  return v_retorno;
  -- Si se produce un error no permite replicar
exception
  when others then
    return 'No se pudo calcular el tiempo restante para replicar';
end;
FUNCTION COMREP_REPLICAR_OPTIMIZADO_SN
 (P_COMREP_ID IN NUMBER
 ,P_ORIGEN IN VARCHAR2
 ,P_COMOCM_ID IN NUMBER
 ,P_SEGORG_ID IN NUMBER
 ,P_COMRED_ID IN NUMBER
 ,P_COMRED_DESTINO IN VARCHAR2
 ,P_COMREP_ESTADO IN VARCHAR2
 ,P_COMRED_ORIGEN IN VARCHAR2
 ,P_COMRED_FECHA IN DATE
 )
 RETURN VARCHAR2
 IS
-- Obtener la cantidad de replicas para el origen
cursor cr_comred_cantidad (p_comrep_id number) is
select count(comred.ID)
  from   COM_REPLICAS_DET comred
        ,COM_REPLICAS comrep
  where  comred.COMREP_ID = comrep.ID
  and    comred.COMREP_ID = p_comrep_id
  and    comred.ORIGEN = p_origen
  and    comred.SITUACION = 'VIG'
  and    comrep.COMOCM_ID = p_comocm_id;
--
  v_retorno varchar2(2);
  v_max_plazo_eco number;
  v_max_plazo_prv number;
  v_max_cant_eco number;
  v_max_cant_prv number;
  v_comred_cantidad number;
begin

  -- Obtiene el maximo numero de replicas permitidas para la entidad contratante
  v_max_cant_eco := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo => 'COMADM_COMREP_CANT_MAX_REP_ECO'
                                                       ,p_segorg_id => p_segorg_id);
  -- Obtiene el maximo numero de replicas permitidas para el proveedor
  v_max_cant_prv := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo => 'COMADM_COMREP_CANT_MAX_REP_PRV'
                                                       ,p_segorg_id => p_segorg_id);
  --
  v_retorno := 'NO';
  --
  -- Si existe al menos un detalle de réplica
  if p_comrep_id is not null and p_comred_id is not null then
    --
    -- Obtener la cantidad de replicas por origen
    open cr_comred_cantidad(p_comred_id);
    fetch cr_comred_cantidad into v_comred_cantidad;
    close cr_comred_cantidad;
    --
    --Si es destino de la replica se permite replicar
    if p_origen = 'PRV' and p_comred_destino = p_origen  then
       -- Si la replica ha sido respondida se permite replicar
       if p_comrep_estado = 'REP' then
         -- Si no se ha superado la cantidad maxima de replicas por proveedor, se permite replicar
         if (v_comred_cantidad < v_max_cant_prv) then
           v_retorno := 'SI';
         end if;
       end if;
    end if;
    --Si es destino de la replica se permite replicar
    if p_origen = 'ECO' and p_comred_destino = p_origen then
      -- Existe al menos un detalle de replica y el estado de la replica es PRE o REP
      if p_comrep_estado in ('PRE','REP') then
        -- Si no se ha superado la cantidad maxima de replicas por proveedor, se permite replicar
        if (v_comred_cantidad < v_max_cant_eco) then
          v_retorno := 'SI';
        end if;
      end if;
    end if;
   --Si es destino de la replica se permite replicar
    if p_origen = 'ADM' then
     -- Existe al menos un detalle de replica y el estado de la replica es PRE, REP
      if (p_comrep_estado in ('PRE','REP')) then
        --Si ADM es el origen de la replica o no es el destino de la replica
         if (( p_comred_origen = p_origen) or (p_comred_destino <> 'ADM'))then
           --
           --Si el destino es proveedor y se vencio el tiempo, se permite replicar
            if p_comred_destino = 'PRV' then
              -- Obtiene el maximo plazo para respuesta del proveedor
               v_max_plazo_prv := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo => 'COMADM_COMREP_PLAZO_MAX_REP_PRV'
                                                           ,p_segorg_id => p_segorg_id);
              --
              if ((p_comred_fecha + (v_max_plazo_prv/24)) < sysdate) then
                 v_retorno := 'SI';
              end if;
            end if;
            --Si el destino es Unidad ejecutora y se vencio el tiempo, se permite replicar
            if p_comred_destino = 'ECO' then
              --
              -- Obtiene el maximo plazo para respuesta del entidad contratante
              v_max_plazo_eco := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo => 'COMADM_COMREP_PLAZO_MAX_REP_ECO'
                                                          ,p_segorg_id => p_segorg_id);
              --
              if ((p_comred_fecha + (v_max_plazo_eco/24)) < sysdate) then
                 v_retorno := 'SI';
              end if;
            end if;
         else
            v_retorno := 'SI';
         end if;
      end if;
    end if;
    -- Si no se han realizado replicas  y el origen es PRV
  elsif p_origen = 'PRV' then
    v_retorno := 'SI';
  end if;
  --
  return v_retorno;
  -- Si se produce un error no permite replicar
exception
  when others then
   return 'NO';
end;
/* Obtener la máxima fecha de entrega registrada en la orden. */
FUNCTION OBTN_COMCET_FECH_MAX
 (P_COMOCM_ID IN NUMBER
 )
 RETURN DATE
 IS
cursor cr_comcet  is
    Select max(fecha_vencimiento) fecha
    from com_comprobantes_ent comcet
        ,com_comprobantes_est comcee
    where  comcet.COMOCM_ID = p_comocm_id
    and    comcet.COMCEE_ID = comcee.ID
    and    comcee.ESTADO in ('ENT','PEN');

 v_fecha date;
begin
    open cr_comcet;
    fetch cr_comcet into v_fecha;
    close cr_comcet;

    return v_fecha;
end;
/* Estado de la replica sin formato */
FUNCTION OBTN_COMREP_ESTADO_S
 (P_COMOCM_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_comrep IS
  select comrep.ID
         ,comrep.ESTADO
         ,GRAL_PKG.OBTN_CFGDES('COM_REPLICAS.ESTADO',ESTADO) ESTADO_DESC
  from   COM_CALIFICACIONES comclf
        ,COM_REPLICAS       comrep
        ,COM_REPLICAS_DET   comred
  where  comclf.COMOCM_ID = p_comocm_id
  and    comclf.ID = comrep.COMCLF_ID
  and    comrep.ESTADO not in ('NUE', 'ANU')
  and    comclf.SITUACION = 'VAL'
  and    comrep.ID = (select max(comrep2.ID)
                      from   COM_REPLICAS comrep2
                      where  comrep2.COMOCM_ID = p_comocm_id)
  and    comred.COMREP_ID =  comrep.ID
  and    comred.SITUACION = 'VIG';
 --
cursor cr_comrep_det(p_comrep_id number) is
 select COMENTARIO
      , GRAL_PKG.OBTN_CFGDES('COM_REPLICAS_DET.ORIGEN', ORIGEN) ORIGEN_DESC
 from COM_REPLICAS_DET
 where COMREP_ID = p_comrep_id
 and   SITUACION = 'VIG'
 order by FECHA;
 --
 v_comrep        cr_comrep%ROWTYPE;
 v_comrep_det    cr_comrep_det%ROWTYPE;
 v_replica_txt   VARCHAR2(2000) := null;
 v_retorno       VARCHAR2(1000) := null;
 v_comentario    VARCHAR2(100)  := null;
 --
begin
  --
  open cr_comrep;
  fetch cr_comrep into v_comrep;
  close cr_comrep;
  --
  for v_comrep_det in cr_comrep_det(v_comrep.id) loop
      if length(v_comrep_det.COMENTARIO) > 60 then
         v_comentario := substr(v_comrep_det.COMENTARIO,1, 60) || '...';
      else
         v_comentario := v_comrep_det.COMENTARIO;
      end if;
     v_replica_txt := v_replica_txt || v_comrep_det.ORIGEN_DESC|| ' dijo:' || v_comentario  || chr(10);
  end loop;
  --
  if v_comrep.ID is not null then
    v_retorno := v_comrep.ESTADO;
  end if;
  --
  return v_retorno;
  --
end;
/* Formato html del estado de la replica */
FUNCTION OBTN_COMREP_ESTADO
 (P_COMOCM_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
-- Obtener la calificación registrada para la orden de compra
cursor cr_comclf is
  select comclf.*
    from COM_CALIFICACIONES comclf
   where comclf.COMOCM_ID = p_comocm_id
     and comclf.SITUACION = 'VAL';
-- Obtener la réplica asociada a la orden para la calificación actual
cursor cr_comrep(p_comclf_id number) is
  select *
    from COM_REPLICAS comrep
   where comrep.COMOCM_ID = p_comocm_id
     and comrep.COMCLF_ID = p_comclf_id
     and comrep.ESTADO <> 'ANU';
-- Obtiene el ultimo detalle de replica registrado que se encuentre vigente
cursor cr_comred(p_comrep_id number) is
select *
  from COM_REPLICAS_DET comred2
 where comred2.ID = (select max(comred.id)
                       from COM_REPLICAS_DET comred
                      where comred.COMREP_ID = p_comrep_id
                        and comred.SITUACION = 'VIG');

-- Obtiene todos los detalles de replicas registrados que se encuentren vigentea
cursor cr_comred_texto (p_comrep_id number) is
    select *
      from COM_REPLICAS_DET comred
     where comred.COMREP_ID = p_comrep_id
      and  comred.SITUACION = 'VIG';
 --
 v_comrep        cr_comrep%ROWTYPE;
 v_comred_texto  cr_comred_texto%ROWTYPE;
 v_comred        cr_comred%rowtype;
 v_comclf        cr_comclf%rowtype;
 v_replica_txt   VARCHAR2(2000) := null;
 v_retorno       VARCHAR2(1000) := null;
 v_comentario    VARCHAR2(100)  := null;
 v_comred_destino VARCHAR2(100)   :=NULL;
 --
BEGIN
   -- Obtener la calificación para obtener la fecha limite de replicas
   open cr_comclf;
  fetch cr_comclf into v_comclf;
  close cr_comclf;
  -- Obtener la réplica actual
   open cr_comrep(v_comclf.id);
  fetch cr_comrep into v_comrep;
  close cr_comrep;
  -- Obtener el ultimo detalle de replica vigente
 if v_comrep.id is not null then
      open cr_comred(v_comrep.id);
     fetch cr_comred into v_comred;
     close cr_comred;

  for v_comred_texto in cr_comred_texto(v_comrep.id) loop
      if length(v_comred_texto.COMENTARIO) > 60 then
         v_comentario := substr(v_comred_texto.COMENTARIO,1, 60) || '...';
      else
         v_comentario := v_comred_texto.COMENTARIO;
      end if;
     v_replica_txt := v_replica_txt || GRAL_PKG.OBTN_CFGDES('COM_REPLICAS_DET.ORIGEN', v_comred_texto.ORIGEN) || ' dijo:' || v_comentario  || chr(10);
  end loop;
  --
if v_comred.id is not null then
  case v_comred.DESTINO
    when 'ADM' then
        v_comred_destino := 'EN COMPRAS';
    when 'ECO' then
        v_comred_destino := 'EN U.EJECUTORA';
    when 'PRV' then
        v_comred_destino := 'EN PROVEEDOR';
  else
        v_comred_destino := '';
  end case;
end if;
--
  IF v_comrep.ID IS NOT NULL THEN
      if v_comrep.ESTADO = 'RES' THEN
        v_retorno := '<img src="' || v('WORKSPACE_IMAGES') || 'replica_res.png" title="RESUELTA' || chr(10) || v_replica_txt ||'"> ';
      else
       case v_comred.ORIGEN
          when 'ADM' then
             v_retorno := '<img src="' || v('WORKSPACE_IMAGES') || 'replica_res.png" title="'||v_comred_destino || chr(10) || v_replica_txt ||'"> ';
          when 'ECO' then
             v_retorno := '<img src="' || v('WORKSPACE_IMAGES') || 'replica_rep.png" title="'||v_comred_destino || chr(10) || v_replica_txt ||'"> ';
          when 'PRV' then
             v_retorno := '<img src="' || v('WORKSPACE_IMAGES') || 'replica_pre.png" title="'||v_comred_destino || chr(10) || v_replica_txt ||'"> ';
          else
             v_retorno:='';
       end case;
      end if;
   END IF;
 end if;
  --
  RETURN v_retorno;
  --
END;
/* Obtener el valor de la variable v_comocp. */
PROCEDURE COMOCP_GET
 (P_COMOCP OUT COM_ORDENES_COMPRAS_PRO%ROWTYPE
 )
 IS
begin
    p_comocp := v_comocp;
end;
/* Inicializar la variable v_comocp. */
PROCEDURE COMOCP_INI
 IS
begin
    v_comocp := null;
end;
/* Insertar registro en COM_ORDENES_COMPRAS_PRO. */
PROCEDURE COMOCP_INS
 (P_COMOCP IN COM_ORDENES_COMPRAS_PRO%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_ORDENES_COMPRAS_PRO
  ( ID
    ,COMOCM_ID
    ,FECHA_PRORROGA
    ,SITUACION
    ,FECHA_SITUACION
    ,MOTIVO_PRORROGA
    ,MOTIVO_ANULACION
    ,FECHA_PRORROGADA
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY  )
  values
  (  p_comocp.ID
    ,p_comocp.COMOCM_ID
    ,p_comocp.FECHA_PRORROGA
    ,p_comocp.SITUACION
    ,p_comocp.FECHA_SITUACION
    ,p_comocp.MOTIVO_PRORROGA
    ,p_comocp.MOTIVO_ANULACION
    ,p_comocp.FECHA_PRORROGADA
    ,p_comocp.DATE_CREATED
    ,p_comocp.CREATED_BY
    ,p_comocp.DATE_MODIFIED
    ,p_comocp.MODIFIED_BY
    );
  --
END;
/* Setear la variable v_comocp. */
PROCEDURE COMOCP_SET
 (P_ID IN NUMBER
 )
 IS
CURSOR cr_comocp IS
    SELECT *
    FROM COM_ORDENES_COMPRAS_PRO COMOCP
    WHERE COMOCP.ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  COMOCP_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comocp;
  FETCH cr_comocp INTO v_comocp;
  CLOSE cr_comocp;
END;

END COMOCM_PKG;
