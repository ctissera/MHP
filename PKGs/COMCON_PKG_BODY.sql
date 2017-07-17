create or replace PACKAGE BODY COMCON_PKG IS


V_COMCTD COM_CONTRATACIONES_TIPDOT%ROWTYPE;


/* Estado de una contratación para un proveedor */
FUNCTION COMCON_COMPRV_ESTADO
 (P_COMCON_ID IN NUMBER
 ,P_COMPRV_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_datos is
  select comcon.fecha_publicacion comcon_fecha_publicacion
        ,comcon.fecha_inicio_propuesta comcon_fecha_inicio_propuesta
        ,comcon.fecha_fin_propuesta comcon_fecha_fin_propuesta
        ,comcon.fecha_fin_aclaracion comcon_fecha_fin_aclaracion
        ,comcon.comcoe_estado comcoe_estado
  from com_contrataciones comcon
  where comcon.id = p_comcon_id;
  --
  v_datos cr_datos%rowtype;
  v_retorno varchar2(100);
  --
begin
  --
  open cr_datos;
  fetch cr_datos into v_datos;
  close cr_datos;
  --
  if v_datos.comcoe_estado = 'NUE' then
      v_retorno := 'EN ELABORACION';
  elsif v_datos.comcoe_estado = 'PEN' then
      v_retorno := 'EN ELABORACION';
  elsif v_datos.comcoe_estado = 'DES' then
      v_retorno := 'DESIERTO';
  elsif v_datos.comcoe_estado = 'CAN' then
      v_retorno := 'ANULADO';
  elsif v_datos.comcoe_estado = 'ACT' then
      -- Si aún no se ha habilitado el inicio de la presentación de cotizaciones
      if sysdate < v_datos.comcon_fecha_inicio_propuesta then
          v_retorno := 'PUBLICADO';
      -- Si se encuentra habilitada la presentación de cotizaciones
      elsif sysdate >= v_datos.comcon_fecha_inicio_propuesta and sysdate <= v_datos.comcon_fecha_fin_propuesta then
          v_retorno := 'ABIERTO';
      -- Si ha finalizado la presentación de cotizaciones y estamos dentro del tiempo para presentar adjuntos para aclarar la cotización.
      elsif sysdate > v_datos.comcon_fecha_fin_propuesta and sysdate <= v_datos.comcon_fecha_fin_aclaracion then
          v_retorno := 'EN ACLARACION';
      -- Si ha finaliado la presentación de cotizaciones
      elsif sysdate > v_datos.comcon_fecha_fin_propuesta then
      -- Si el proveedor presentó cotizaciones
          if comcon_pkg.COMCON_COMPRV_CTZCNT(p_comcon_id => p_comcon_id, p_comprv_id => p_comprv_id) > 0 then
              v_retorno := 'PARA EVALUAR';
          else
              v_retorno := 'CERRADO';
          end if;
      end if;
  elsif v_datos.comcoe_estado = 'PRE' then
        -- Si el proveedor presentó cotizaciones
        if comcon_pkg.COMCON_COMPRV_CTZCNT(p_comcon_id => p_comcon_id, p_comprv_id => p_comprv_id) > 0 then
          v_retorno := 'EVALUADO';
        else
          v_retorno := 'CERRADO';
        end if;
  elsif v_datos.comcoe_estado = 'VRF' then
      -- Si el proveedor presentó cotizaciones
      if comcon_pkg.COMCON_COMPRV_CTZCNT(p_comcon_id => p_comcon_id, p_comprv_id => p_comprv_id) > 0 then
        v_retorno := 'EN ANALISIS';
      else
        v_retorno := 'CERRADO';
      end if;
  elsif v_datos.comcoe_estado = 'ENV' then
      -- Si el proveedor presentó cotizaciones
      if comcon_pkg.COMCON_COMPRV_CTZCNT(p_comcon_id => p_comcon_id, p_comprv_id => p_comprv_id) > 0 then
        v_retorno := 'EN ANALISIS';
      else
        v_retorno := 'CERRADO';
      end if;
  elsif v_datos.comcoe_estado = 'INF' then
      -- Si el proveedor presentó cotizaciones
      if comcon_pkg.COMCON_COMPRV_CTZCNT(p_comcon_id => p_comcon_id, p_comprv_id => p_comprv_id) > 0 then
        v_retorno := 'EN ANALISIS';
      else
        v_retorno := 'CERRADO';
      end if;
  elsif v_datos.comcoe_estado = 'IFC' then
      -- Si el proveedor presentó cotizaciones
      if comcon_pkg.COMCON_COMPRV_CTZCNT(p_comcon_id => p_comcon_id, p_comprv_id => p_comprv_id) > 0 then
          v_retorno := 'EN ANALISIS';
      else
          v_retorno := 'CERRADO';
      end if;
  elsif v_datos.comcoe_estado = 'ACR' then
      -- Si el proveedor presentó cotizaciones
      if comcon_pkg.COMCON_COMPRV_CTZCNT(p_comcon_id => p_comcon_id, p_comprv_id => p_comprv_id) > 0 then
          v_retorno := 'EN ANALISIS';
      else
          v_retorno := 'CERRADO';
      end if;
  elsif v_datos.comcoe_estado = 'RES' then
      -- Si el proveedor presentó cotizaciones
      if comcon_pkg.COMCON_COMPRV_CTZCNT(p_comcon_id => p_comcon_id, p_comprv_id => p_comprv_id) > 0 then
          v_retorno := 'EN ANALISIS';
      else
          v_retorno := 'CERRADO';
      end if;
  elsif v_datos.comcoe_estado = 'ADJ' then
      -- Si al proveedor se adjudicaron ordenes de compra
      if comcon_pkg.COMCON_COMPRV_OCMCNT(p_comcon_id => p_comcon_id, p_comprv_id => p_comprv_id) > 0 then
          v_retorno := 'ADJUDICADO';
      elsif comcon_pkg.COMCON_COMPRV_CTZCNT(p_comcon_id => p_comcon_id, p_comprv_id => p_comprv_id) > 0 then
          v_retorno := 'FINALIZADO';
      else
          v_retorno := 'CERRADO';
      end if;
  elsif v_datos.comcoe_estado = 'FIN' then
      -- Si al proveedor se adjudicaron ordenes de compra
      if comcon_pkg.COMCON_COMPRV_OCMCNT(p_comcon_id => p_comcon_id, p_comprv_id => p_comprv_id) > 0 then
          v_retorno := 'ADJUDICADO';
      elsif comcon_pkg.COMCON_COMPRV_CTZCNT(p_comcon_id => p_comcon_id, p_comprv_id => p_comprv_id) > 0 then
          v_retorno := 'FINALIZADO';
      else
          v_retorno := 'CERRADO';
      end if;
  /* Movido al principio para optimizar
  elsif v_datos.comcoe_estado = 'DES' then
      v_retorno := 'DESIERTO';
  elsif v_datos.comcoe_estado = 'CAN' then
      v_retorno := 'ANULADO';
  */
  elsif v_datos.comcoe_estado = 'NAD' then
      if comcon_pkg.COMCON_COMPRV_CTZCNT(p_comcon_id => p_comcon_id, p_comprv_id => p_comprv_id) > 0 then
          v_retorno := 'NO ADJUDICADO';
      else
          v_retorno := 'CERRADO';
      end if;
  end if;
  --
  return v_retorno;
  --
end;
/* Cantidad de Ordenes para un Proveedor en un Proceso de compra */
FUNCTION COMCON_COMPRV_OCMCNT
 (P_COMCON_ID IN NUMBER
 ,P_COMPRV_ID IN NUMBER
 )
 RETURN NUMBER
 IS
-- Obtener la cantidad de ordenes para un proveedor en un proceso de compras
  cursor cr_datos is
  select count(1) cantidad
  FROM com_ordenes_compras
  where comcon_id = p_comcon_id
  AND comprv_id = p_comprv_id
  and comoce_situacion = 'VAL'
  and comoce_estado IN ('APR','CON','NOC');
  --
  v_retorno number;
begin
  --
  open cr_datos;
  fetch cr_datos into v_retorno;
  close cr_datos;
  --
  return v_retorno;
  --
end;
/* Tiempo disponible para cotizar en un proceso en dias */
FUNCTION COMCON_COMCTZ_TIEDIA
 (P_COMCON_ID IN NUMBER
 )
 RETURN NUMBER
 IS
cursor cr_datos is
  select fecha_fin_propuesta-sysdate disponible_dias
  from com_contrataciones comcon
  where id = p_comcon_id;
  --
  v_retorno number;
  --
begin
  -- Si se encuentra abierto el periodo para cotizar
  if comcon_pkg.comcon_comctz_estado(p_comcon_id => p_comcon_id) = 'ABIERTA' then
     -- Determinar el tiempo disponible para hacerlo en dias
     open cr_datos;
     fetch cr_datos into v_retorno;
     close cr_datos;
  end if;
  --
  -- Si el periodo para cotizar se encuentra cerrado, no se devuelve valor
  return v_retorno;
  --
end;
/* Estado para Cotizar un Proceso de Compras */
FUNCTION COMCON_COMCTZ_ESTADO
 (P_COMCON_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
--
  cursor cr_datos is
  select comcon.fecha_publicacion comcon_fecha_publicacion
       , comcon.fecha_inicio_propuesta comcon_fecha_inicio_propuesta
       , comcon.fecha_fin_propuesta comcon_fecha_fin_propuesta
       , gral_pkg.obtn_cfgabr('COM_CONTRATACIONES_EST.ESTADO',comcon.comcoe_estado) comcoe_estado_abr
  from com_contrataciones comcon
--     , com_contrataciones_est comcoe
  where comcon.id = p_comcon_id
--    and comcon.comcoe_id = comcoe.id
;
  --
  v_datos   cr_datos%rowtype;
  v_retorno varchar2(500);
  --
begin
  --
  open cr_datos;
  fetch cr_datos into v_datos;
  close cr_datos;
  --
  if v_datos.comcoe_estado_abr = 'ACTIVO' then
    if sysdate >= v_datos.comcon_fecha_inicio_propuesta and sysdate < v_datos.comcon_fecha_fin_propuesta then
       v_retorno := 'ABIERTA';
    else
       v_retorno := 'CERRADA';
    end if;
  else
    v_retorno := 'CERRADA';
  end if;
  --
  return v_retorno;
  --
end;
/* Obtener cantidad de cotizaciones validas de un proveedor en un proceso */
FUNCTION COMCON_COMPRV_CTZCNT
 (P_COMCON_ID IN NUMBER
 ,P_COMPRV_ID IN NUMBER
 )
 RETURN NUMBER
 IS
-- Obtener la cantidad de contizaciones presentadas por un proveedor en un proceso de compras
  cursor cr_datos is
  select count(1) cantidad
  from com_cotizaciones comctz
  where comcon_id = p_comcon_id
    and comprv_id = p_comprv_id
    and situacion = 'PRE';
  --
  v_retorno number;
  --
begin
  --
  open cr_datos;
  fetch cr_datos into v_retorno;
  close cr_datos;
  --
  return v_retorno;
  --
end;
FUNCTION COMCON_EMITIR_RES_SN
 (P_COMCON_ID IN NUMBER
 ,P_SEGORG_ID IN number
 )
 RETURN VARCHAR2
 IS
cursor cr_comcon is
    select comctt.emitir_resolucion_sn
      from com_contrataciones comcon
          ,com_contrataciones_tipos comctt
     where comcon.comctt_id = comctt.id
       and comcon.id = p_comcon_id
       and comcon.segorg_id = p_segorg_id;

v_comcon cr_comcon%ROWTYPE;
v_resultado varchar2 (2);
begin

    open cr_comcon;
    fetch cr_comcon into v_comcon;
    close cr_comcon;

    if v_comcon.emitir_resolucion_sn = 'SI' then
        v_resultado := 'SI';
    else
        v_resultado := 'NO';
    end if;
   --
   return v_resultado;
end;
/* Colocar la contratación en estado RESOLUCION EMITIDA. */
PROCEDURE COMCON_RES_EMITIDA
 (P_SEGORG_ID IN NUMBER
 ,P_COMCON_ID IN NUMBER
 )
 IS
-----------------------------------------------------------------------------------
   --
   -- Argumentos
   -- p_segorg_id => Organizacion
   -- p_comcon_id => Id del Proceso
   -- p_motivo    => Motivo ingresado en la interface
   --
   -----------------------------------------------------------------------------------
   --
   cursor cr_comcon (p_comcon_id number) is
   select * from com_contrataciones comcon
   where comcon.id = p_comcon_id;
   --
   CURSOR cr_comcot IS
   SELECT *
   FROM COM_CONTRATACIONES_DETALLES
   WHERE COMCON_ID = p_comcon_id;
   --
   cursor cr_comcod is
   select * from com_contrataciones_doc
   where comcon_id = p_comcon_id;
   --
   /*cursor cr_conf is
   select valor
   from seg_configuraciones
   where segorg_id = P_SEGORG_ID
   and codigo = 'COMCON_SRVINT_TRAMIX_HABILITADO_SN';*/
   --
   cursor cr_comdct is
   select id from com_documentos_tipos
   where segorg_id = p_segorg_id
   and codigo = 'COM_CONTRATACION';
   --
   cursor cr_comctt (p_comctt_id number) is
   select * from com_contrataciones_tipos
   where id = p_comctt_id;
   --
   CURSOR cr_comped (p_comped_id number) IS
   SELECT *
   FROM COM_PEDIDOS
   WHERE ID = p_comped_id;
   --

   v_habilitado         varchar2(10);
   v_comcdg             com_contrataciones_docgen%rowtype;
   v_comcod             com_contrataciones_doc%rowtype;
   v_intenv             int_envios%rowtype;
   v_comcoe             com_contrataciones_est%ROWTYPE;
   v_comcoe_tmp         com_contrataciones_est%ROWTYPE;
   v_comctt             com_contrataciones_tipos%ROWTYPE;
   v_comcon             com_contrataciones%rowtype;
   v_comcot             com_contrataciones_detalles%rowtype;
   v_comped             COM_PEDIDOS%ROWTYPE;
   v_motivo             varchar2(2000);
   v_aprobar            varchar2(2);
   v_comcdg_id          number;
   v_comdct_id          number;
   v_comcoe_id          number;
   v_comped_id          number;
   --
BEGIN
      --
      if p_segorg_id is null then
         raise_application_error(-20000,'La Organizacion no ha sido indicada y es un dato obligatorio',true);
      elsif p_comcon_id is null then
         raise_application_error(-20000,'El Proceso no ha sido indicado y es un dato obligatorio',true);
      end if;
      --
      v_comcoe_id := com_pkg.obtn_comcoe_id(p_comcon_id => p_comcon_id);
      COM_PKG.SET_COMCOE(p_id => v_comcoe_id);
      COM_PKG.GET_COMCOE(p_comcoe => v_comcoe);
      if v_comcoe.estado = 'RES' then
         raise_application_error(-20000,'El proceso de contratacion ya se encuentra con resolución emitida',true);
      end if;

      --
     /* for v_conf in cr_conf loop
         if v_conf.valor = 'SI' then
            v_habilitado := 'SI';
         else
            v_habilitado := 'NO';
            raise_application_error(-20000,'La integracion No se encuentra habilitada',true);
         end if;
      end loop;
      --
      dbms_output.put_line('v_habilitado = ' || v_habilitado); */
      --
      SELECT COMCOE_ID.NEXTVAL INTO v_comcoe_id FROM DUAL;
      v_comcoe_tmp.ID        := v_comcoe_id;
      v_comcoe_tmp.COMCON_ID := p_comcon_id;
      v_comcoe_tmp.FECHA     := SYSDATE;
      v_comcoe_tmp.ESTADO    := 'RES';
      --v_comcoe_tmp.MOTIVO    := p_motivo;
      COM_PKG.INS_COMCOE(P_COMCOE => v_comcoe_tmp);
      --
EXCEPTION WHEN others THEN
   raise_application_error(-20000,'No se ha podido dar por Resolución Emitida el Proceso de Contratación',true);
END;
/* Revertir estado RESOLUCION EMITIDA. */
PROCEDURE COMCON_RES_EMI_REVER
 (P_SEGORG_ID IN NUMBER
 ,P_COMCON_ID IN NUMBER
 ,P_MOTIVO IN VARCHAR2
 )
 IS
-----------------------------------------------------------------------------------
   --
   -- Argumentos
   -- p_segorg_id => Organizacion
   -- p_comcon_id => Id del Proceso
   -- p_motivo    => Motivo ingresado en la interface
   --
   -----------------------------------------------------------------------------------
   --
   cursor cr_comcon (p_comcon_id number) is
   select * from com_contrataciones comcon
   where comcon.id = p_comcon_id;
   --
   CURSOR cr_comcoe IS
   SELECT ESTADO
   FROM COM_CONTRATACIONES_EST
   WHERE ID = com_pkg.OBTN_COMCOE_ANT_ID(p_comcon_id);
   --
   --Buscar partidas presupuestarias editadas
   cursor cr_compda is
    select compda.id
    from com_contrataciones_detalles comcot
        ,com_pedidos_dat compda
        ,com_datos_tipos comdat
    where comcot.COMPED_ID = COMPDA.COMPED_ID
      and  COMCOT.COMCON_ID = p_comcon_id
      and  COMDAT.ID = COMPDA.COMDAT_ID
      and  COMDAT.CODIGO = 'ADJ_PARPRE_PCYCSL';
   --
   cursor cr_parametros is
    select compda.id
    from com_contrataciones_detalles comcot
        ,com_pedidos_dat compda
        ,com_datos_tipos comdat
    where comcot.COMPED_ID = COMPDA.COMPED_ID
      and  COMCOT.COMCON_ID = p_comcon_id
      and  COMDAT.ID = COMPDA.COMDAT_ID
      and  COMDAT.CODIGO = 'ADJ_PARAMETROS_PCYCSL';

   --
   v_habilitado         varchar2(10);
   v_comcoe             com_contrataciones_est%ROWTYPE;
   v_comcoe_tmp         com_contrataciones_est%ROWTYPE;
   v_comcon             com_contrataciones%rowtype;
   v_compda             cr_compda%ROWTYPE;
   v_parametros         cr_parametros%ROWTYPE;

   v_motivo             varchar2(2000);
   v_aprobar            varchar2(2);
   v_comcdg_id          number;
   v_comdct_id          number;
   v_comcoe_id          number;
   v_comped_id          number;
   v_comcoe_est         cr_comcoe%ROWTYPE;
   --
BEGIN
      --
      if p_segorg_id is null then
         raise_application_error(-20000,'La Organizacion no ha sido indicada y es un dato obligatorio',true);
      elsif p_comcon_id is null then
         raise_application_error(-20000,'El Proceso no ha sido indicado y es un dato obligatorio',true);
      end if;
      --
      v_comcoe_id := com_pkg.obtn_comcoe_id(p_comcon_id => p_comcon_id);
      COM_PKG.SET_COMCOE(p_id => v_comcoe_id);
      COM_PKG.GET_COMCOE(p_comcoe => v_comcoe);
      if v_comcoe.estado <> 'RES' then
         raise_application_error(-20000,'El proceso de contratacion no se encuentra en estado Resolución Emitida',true);
      end if;
      --
      -- Inserto estado anterior del Proceso
      OPEN cr_comcoe;
      FETCH cr_comcoe INTO v_comcoe_est;
      CLOSE cr_comcoe;

      SELECT COMCOE_ID.NEXTVAL INTO v_comcoe_id FROM DUAL;
      v_comcoe_tmp.ID        := v_comcoe_id;
      v_comcoe_tmp.COMCON_ID := p_comcon_id;
      v_comcoe_tmp.FECHA     := SYSDATE;
      v_comcoe_tmp.ESTADO    := v_comcoe_est.ESTADO;
      v_comcoe_tmp.MOTIVO    := p_motivo;
      COM_PKG.INS_COMCOE(P_COMCOE => v_comcoe_tmp);
      --
      open cr_compda;
      fetch cr_compda into v_compda;
      close cr_compda;

      open cr_parametros;
      fetch cr_parametros into v_parametros;
      close cr_parametros;

      if v_compda.id is not null then
            delete from com_pedidos_dat
                   where id = v_compda.id;
      end if;

      if v_parametros.id is not null then
            delete from com_pedidos_dat
                   where id = v_parametros.id;
      end if;

/*      */
EXCEPTION WHEN others THEN
   raise_application_error(-20000,'No se ha podido Revertir la Emisión de la Resolución del Proceso de Contratación',true);
END;
/* Transmitir el Documento de la Resolucion a Tramix */
PROCEDURE COMCON_RESOLUCION_TRANS
 (P_COMCON_ID IN NUMBER
 ,P_SEGORG_ID IN NUMBER
 ,P_INTENV_ID OUT NUMBER
 )
 IS
-- Contratacion
  cursor cr_comcon (p_comcon_id number) is
    select *
    from com_contrataciones comcon
    where comcon.id = p_comcon_id;
  -- Estado de la contratacion
  cursor cr_comcoe(p_comcoe_id number) is
    select *
    from com_contrataciones_est comcoe
    where comcoe.id = p_comcoe_id;
  --  Configuracion de Tramix
  cursor cr_conf is
    select valor
	from SEG_CONFIGURACIONES
	where segorg_id = p_segorg_id
	and codigo = 'COMCON_SRVINT_TRAMIX_HABILITADO_SN';
  -- Tipo de Documento
  cursor cr_comdct is
    select id
	from COM_DOCUMENTOS_TIPOS
	where segorg_id = p_segorg_id
	and codigo = 'COM_RESOLUCION';
  -- Tipo de Contratacion
  cursor cr_comctt(p_comctt_id number) is
    select *
	from COM_CONTRATACIONES_TIPOS
	where id = p_comctt_id;
  -- Proveedor
  cursor cr_comprv(p_comprv_id number) is
    select *
	from COM_PROVEEDORES
	where id = p_comprv_id;
  -- Tipo de datos (Parametros de la Resolucion)
  cursor cr_comdat is
    select comdat.*
    from   COM_DATOS_TIPOS comdat
    where  comdat.CODIGO = 'ADJ_PARAMETROS_PCYCSL';
  -- Obtener los datos de la resolucion emitida
  cursor cr_compda(p_comped_id number, p_comdat_id number) is
    select GRAL_PKG.OBTN_VALORPARAMETRO('NRO_RESOLUCION', VALOR) RESOLUCION_NRO
    from   COM_PEDIDOS_DAT compda
    where  compda.COMPED_ID = p_comped_id
    and    compda.COMDAT_ID = p_comdat_id;
  -- Solicitud de Gasto de la Contratación
  cursor cr_comped(p_comped_id number) is
    select comped.*
    from   COM_PEDIDOS comped
    where  comped.ID = p_comped_id;
  -- Detalle de la Contratacion
  cursor cr_comcot is
    select comcot.*
    from     COM_CONTRATACIONES_DETALLES comcot
    where    comcot.COMCON_ID = p_comcon_id;
  --
  v_comcon cr_comcon%rowtype;
  v_comcoe cr_comcoe%rowtype;
  v_comcdg COM_CONTRATACIONES_DOCGEN%rowtype;
  v_comdat cr_comdat%rowtype;
  v_conf   cr_conf%rowtype;
  v_comped cr_comped%rowtype;
  v_comcot cr_comcot%rowtype;
  v_inttpo INT_TIPOS_OBJETOS%rowtype;
  v_intene INT_ENVIOS_EST%rowtype;
  --
  v_comdct_id number;
  v_comcdg_id number;
  v_inttpo_id number;
  v_intenv_id number;
  v_documento_id number;
  v_referencia varchar2(2000);
  v_actuacion_identif  varchar2(2000);
  v_respuesta_ws       varchar2(2000);
  v_resultado_ws       varchar2(2000);
  v_motivo             varchar2(2000);
  v_motivos varchar2(2000);
  v_habilitado varchar2(2);
  v_resolucion_nro varchar2(100);
begin
	-- Validar datos de la contratación
	if p_segorg_id is null then
		raise_application_error(-20000, 'La Organizacion no ha sido indicada y es un dato obligatorio.', true);
	end if;
	--
	open cr_comcon(p_comcon_id);
	fetch cr_comcon into v_comcon;
	close cr_comcon;
	--
	if v_comcon.ID is null then
		raise_application_error(-20000, 'La Contratacion es incorrecta o no existe', true);
	end if;
	--
	open cr_comcoe(v_comcon.COMCOE_ID);
	fetch cr_comcoe into v_comcoe;
	close cr_comcoe;
	--
	if v_comcoe.ID is null then
		raise_application_error(-20000, 'El Estado de la contratacion es incorrecto o no existe', true);
	end if;

	if v_comcoe.ESTADO not in ('RES', 'ADJ') then
		raise_application_error(-20000, 'El Estado de la contratacion no se encuentra en RESOLUCION EMITIDA', true);
	end if;
	--
	open cr_conf;
	fetch cr_conf into v_conf;
	close cr_conf;
	--
	if v_conf.valor is null then
		raise_application_error(-20000, 'El parametro de configuracion no esta definido', true);
	end if;
	--
	v_habilitado := v_conf.valor;
	--
	if v_habilitado = 'NO'then
		raise_application_error(-2000, 'La integracion con el sistema de Tramix no se encuentra habilitada', true);
	end if;
	--
	open  cr_comdct;
	fetch cr_comdct into v_comdct_id;
	close cr_comdct;
	--
	if v_comdct_id is null then
		raise_application_error(-20000,'No se ha podido determinar el tipo de documento de la Resolución',true);
	end if;
	--1 - Generar y Grabar el documento
	v_documento_id := COMCON_PKG.OBTN_COMCON_RES_PDF(p_segorg_id => p_segorg_id
													,p_comcon_id => p_comcon_id);
	-- 2 - Guardar referencia a la resolución  Generada
	begin
	   --
		select COMCDG_ID.nextval into v_comcdg_id from dual;
		--
		v_comcdg.ID := v_comcdg_id;
		v_comcdg.COMCON_ID := p_comcon_id;
		v_comcdg.COMDOC_ID := v_documento_id;
		v_comcdg.COMDCT_ID := v_comdct_id;
		v_comcdg.FECHA := sysdate;
	--
		COM_PKG.COMCDG_INS(p_comcdg => v_comcdg);
	--
	exception
	  when others then
		raise_application_error(-20000, 'No se ha podido generar el registro de referencia de la Resolucion generada', true);
	end;
	--dbms_output.put_line('v_comcdg.ID'||v_comcdg.ID);
	if v_comcdg.ID is null then
		raise_application_error(-20000, 'No se ha podido generar el registro de referencia de la Resolucion generada', true);
	end if;
    -- Obtener el detalle de la contratacion
    open cr_comcot;
    fetch cr_comcot into v_comcot;
    close cr_comcot;
    -- Obtener la solicitud de gasto de la contratacion
    open cr_comped(v_comcot.COMPED_ID);
    fetch cr_comped into v_comped;
    close cr_comped;
    -- Obtener los datos de la resolucion
    open cr_comdat;
    fetch cr_comdat into v_comdat;
    close cr_comdat;
    --dbms_output.put_line('v_comdat.ID: '||v_comdat.ID);
    --
    open cr_compda(v_comped.ID, v_comdat.ID);
    fetch cr_compda into v_resolucion_nro;
    close cr_compda;
    dbms_output.put_line('v_resolucion_nro: '||v_resolucion_nro);
	--
	-- 3 - Transmitir el Documento al Web Service
	v_actuacion_identif := 'RESMIW-RESOLUCION MINISTERIAL DE EXPEDIENTE N° '||v_resolucion_nro;
	--dbms_output.put_line('<actuacion_identif>'||v_actuacion_identif);
	v_respuesta_ws := COM_PKG.COMCON_INVOCAR_WS(p_comcdg_id => v_comcdg.ID
                                               ,p_actuacion_identif => v_actuacion_identif
                                               ,p_valida => 1);
	--dbms_output.put_line('v_respuesta_ws: '||v_respuesta_ws);
	--dbms_output.put_line(substr(v_respuesta_ws, -1000, 1000));
	-- 4 - Procesar el resultado del Web Sevice
	COM_PKG.COMCON_PROC_XML_ACT(p_xml => v_respuesta_ws
                               ,p_segorg_id => p_segorg_id
                               ,p_resultado => v_resultado_ws
                               ,p_motivo => v_motivo
                               ,p_referencia => v_referencia);
	--
	if v_resultado_ws = 'ERROR' then
		raise_application_error(-20000, 'No se ha podido interpretar el mensaje de respuesta', true);
	end if;
	-- 5 - Guardar el log de envios
	INT_PKG.INTTPO_SET_CODIGO(p_segorg_id => p_segorg_id
                             ,p_codigo => 'COMCON_ACTUACION');
	INT_PKG.INTTPO_GET(p_inttpo => v_inttpo);
	--
	if v_inttpo .ID is null then
		raise_application_error(-20000, 'El código de tipo de objeto COMCON_ACTUACION no se encuentra configurado', true);
	end if;
	--
	v_inttpo_id := v_inttpo.ID;
	--
	INT_PKG.INTENV_REGISTRAR(p_inttpo_id => v_inttpo_id
                            ,p_intenv_objeto => '<comdoc_id>'||v_documento_id||'</comdoc_id>'
                            ,p_intenv_obs => v_respuesta_ws
                            ,p_intenv_res => '<return>'||v_resultado_ws||'<return>'||'<actuacion_id>'||v_referencia||'</actuacion_id>'
                            ,p_intene_fecha => sysdate
                            ,p_intenv_id => v_intenv_id);
	-- Modificar el campo id 	de envio en la tabla de documentos generados por la orden de provision (COM_DOCUMENTOS)
	update COM_ORDENES_COMPRAS_DOCGEN
	set INTENV_ID = v_intenv_id
	where ID = v_comcdg_id;
	-- 6 - Si la actualización principal se inserto correctamente vamos
	if instr(v_resultado_ws, 'OP_COMPLETED')>0 then
      -- 7A - Modificar el Estado del envio a ENVIADO
      v_intene.ID :=  INTENE_ID.nextval;
	  v_intene.INTENV_ID := v_intenv_id;
	  v_intene.FECHA := sysdate;
	  v_intene.ESTADO := 'ENV';
	  v_intene.MOTIVO_ESTADO := v_motivo;
	  INT_PKG.INTENE_INS(p_intene => v_intene);
	else
	  -- 7B - Modificar el Estado del envio a ERROR
	  v_intene.ID :=  INTENE_ID.nextval;
	  v_intene.INTENV_ID := v_intenv_id;
	  v_intene.FECHA := sysdate;
	  v_intene.ESTADO := 'ERR';
	  v_intene.MOTIVO_ESTADO := v_motivo;
	  INT_PKG.INTENE_INS(p_intene => v_intene);
	end if;
	--
	p_intenv_id := v_intenv_id;
	--
exception when 	others then
	raise_application_error(-20000, 'No se ha podido enviar correctamente los documentos de las ordenes de provision', true);
end;
/* Lista de numeros de items adjudicados al proveedor */
FUNCTION COMCON_OBTN_ITEM_FRM1
 (P_COMCON_ID IN NUMBER
 ,P_COMPRV_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_comadj is
    select COMPET.RENGLON ITEM_NRO
    from   COM_ADJUDICACIONES comadj
          ,COM_ADJUDICACIONES_DET comadd
          ,COM_COTIZACIONES_DETALLES comczd
          ,COM_COTIZACIONES comctz
          ,COM_PROVEEDORES comprv
          ,COM_PEDIDOS_DETALLES compet
    where  comadj.COMCON_ID = p_comcon_id
    and    comadj.ID = comadd.COMADJ_ID
    and    comadj.SITUACION <> 'ANU'
    and    comadd.COMCZD_ID = comczd.ID
    and    comczd.COMCTZ_ID = comctz.ID
    and    comctz.COMPRV_ID = comprv.ID
    and    comadd.COMPET_ID = compet.ID
    and    comprv.ID = p_comprv_id
    order  by compet.RENGLON;
--
v_retorno varchar2(32767) := null;
begin
  for v_comadj in cr_comadj loop
    v_retorno := v_retorno||v_comadj.ITEM_NRO||', ';
  end loop;
  -- remueve la coma final de la concatenacion
  v_retorno := rtrim(v_retorno, ', ');
  return v_retorno;
end;
/* Procesar Tiempos de Contrataciones */
PROCEDURE COMCON_TIEMPOS_PRCC
 (P_DIAS IN NUMBER := 1
 )
 IS
--
  cursor cr_datos is
  select distinct comcon.id
     , comcon.date_modified
     , comcon.date_created
  from com_contrataciones comcon
     , com_contrataciones_est comcoe
     , com_contrataciones_est comcoe2
  where comcon.comcoe_id = comcoe.id
    and comcoe.estado <> 'NUE'
    and comcoe2.comcon_id = comcon.id
    and comcoe2.date_created between trunc(sysdate)-nvl(p_dias,1) and sysdate;
  --
begin
  --
  for v_datos in cr_datos loop
    COMCON_PKG.COMCON_TIEMPOS_GNRR(p_comcon_id => v_datos.id,p_fecha => nvl(v_datos.date_modified,v_datos.date_created));
  end loop;
  --
  EXECUTE IMMEDIATE ('TRUNCATE TABLE COM_CONTRATACIONES_TIEMDSHB');
  --
  insert into COM_CONTRATACIONES_TIEMDSHB
  (ANIO_MES,PROCESOS_CNT
  ,PROCESOS_DIAS_AVG
  ,PROCESOS_DIAS_MIN
  ,PROCESOS_DIAS_MAX
  ,ADMCOM_PRE_DIAS_AVG
  ,ADMCOM_POS_DIAS_AVG
  ,ECOCOM_PRE_DIAS_AVG
  ,ECOCOM_POS_DIAS_AVG
  ,PRVCOM_DIAS_AVG
  ,PUBLICIDAD_DIAS_AVG)
   select NVL(ANIO_MES,'EN PROCESO') ANIO_MES
  ,count(1) PROCESOS_CNT
  ,round(avg(DURACION_TOTAL_DIAS),6) PROCESOS_DIAS_AVG
  ,round(min(DURACION_TOTAL_DIAS),6) PROCESOS_DIAS_MIN
  ,round(max(DURACION_TOTAL_DIAS),6) PROCESOS_DIAS_MAX
  ,round(avg(ADMINISTRACION_PRE_DIAS),6) ADMCOM_PRE_DIAS_AVG
  ,round(avg(ADMINISTRACION_POS_DIAS),6) ADMCOM_POS_DIAS_AVG
  ,round(avg(CONTRATANTE_PRE_DIAS),6) ECOCOM_PRE_DIAS_AVG
  ,round(avg(CONTRATANTE_POS_DIAS),6) ECOCOM_POS_DIAS_AVG
  ,round(avg(PROVEEDOR_DIAS),6) PRVCOM_DIAS_AVG
  ,round(avg(PUBLICACION_PRE_DIAS),6) PUBLICIDAD_DIAS_AVG
  from com_contrataciones_tiempos
  where desierto_dias is null
    and no_adjudicado_dias is null
    and anulado_dias is null
    and desierto_fch is null
    and no_adjudicado_fch is null
    and anulado_fch is null
  group by ANIO_MES;
  --
end;
/* Generar Tiempos Contratacion */
PROCEDURE COMCON_TIEMPOS_GNRR
 (P_COMCON_ID IN NUMBER
 ,P_FECHA IN DATE
 )
 IS
cursor cr_comcon is
  select *
  from com_contrataciones
  where id = p_comcon_id;
  --
  cursor cr_comcop is
  select *
  from com_contrataciones_tiempos
  where comcon_id = p_comcon_id;
  --
  cursor cr_comcoe is
  select *
  from com_contrataciones_est
  where comcon_id = p_comcon_id;
  --
  cursor cr_comcot is
  select *
  from com_contrataciones_detalles
  where comcon_id = p_comcon_id;
  --
  v_comcop com_contrataciones_tiempos%rowtype;
  v_comcot com_contrataciones_detalles%rowtype;
begin
  -- Obtener el registro de tiempos
  open cr_comcop;
  fetch cr_comcop into v_comcop;
  close cr_comcop;
  -- Si no existe, generarlo y recuperarlo
  if v_comcop.id is null then
     insert into com_contrataciones_tiempos
     (comcon_id) values (p_comcon_id);
     open cr_comcop;
     fetch cr_comcop into v_comcop;
     close cr_comcop;
  end if;
  --
  -- Obtener los datos de la contratación
  for v_comcon in cr_comcon loop
    -- Obtener el pedido asociado a la contratación
    open cr_comcot;
    fetch cr_comcot into v_comcot;
    close cr_comcot;
    -- Obtener la fecha de aprobación
    v_comcop.aprobado_fch := null;
    declare
      cursor cr_compee (p_comped_id in number) is
      select max(fecha)
      from com_pedidos_est
      where comped_id = p_comped_id
        and estado = 'APR'
        and fecha <= nvl((select min(a.FECHA)
      from com_contrataciones_est a
      where a.comcon_id = p_comcon_id
        and a.estado = 'PEN'
        and a.fecha <= p_fecha),p_fecha);
      --
      cursor cr_compee2 (p_comped_id in number) is
      select max(fecha)
      from com_pedidos_est
      where comped_id = p_comped_id
        and estado = 'AUT'
        and fecha <= nvl((select min(a.FECHA)
      from com_contrataciones_est a
      where a.comcon_id = p_comcon_id
        and a.estado = 'PEN'
        and a.fecha <= p_fecha),p_fecha);
    begin
      -- Obtener la ultima aprobación anterior a la fecha de procesamiento o fecha de generacion del proceso.
      open cr_compee (p_comped_id => v_comcot.comped_id);
      fetch cr_compee into v_comcop.aprobado_fch;
      close cr_compee;
      --
      if v_comcop.aprobado_fch is null then
        -- Obtener la ultima autorizacion anterior a la fecha de procesamiento o fecha de generacion del proceso.
        open cr_compee2 (p_comped_id => v_comcot.comped_id);
        fetch cr_compee2 into v_comcop.aprobado_fch;
        close cr_compee2;
      end if;
    end;
    -- Obtener la fecha de generación
    v_comcop.generado_fch := null;
    declare
      cursor cr_comcoe is
      select min(FECHA)
      from com_contrataciones_est
      where comcon_id = p_comcon_id
        and estado = 'PEN'
        and fecha <= p_fecha;
    begin
      -- Obtener la primera fecha de activación anterior a la fecha de procesamiento.
      open cr_comcoe;
      fetch cr_comcoe into v_comcop.generado_fch;
      close cr_comcoe;
    end;
    -- Obtener la fecha de activación
    v_comcop.activado_fch := null;
    declare
      cursor cr_comcoe is
      select min(FECHA)
      from com_contrataciones_est
      where comcon_id = p_comcon_id
        and estado = 'ACT'
        and fecha <= p_fecha;
    begin
      -- Obtener la primera fecha de activacion anterior a la fecha de procesamiento.
      open cr_comcoe;
      fetch cr_comcoe into v_comcop.activado_fch;
      close cr_comcoe;
    end;
    -- Obtener la fecha de inicio de la cotización
    v_comcop.inicio_cotizacion_fch := null;
    begin
      -- Es la fecha de inicio cotizacion indicada en el proceso.
      v_comcop.inicio_cotizacion_fch := v_comcon.fecha_inicio_propuesta;
      -- Si la fecha de inicio de cotizacion es menor a la fecha de activacion
      -- se considera la fecha de activación como fecha de inicio de la cotizacion
      -- esto es así porque se activó despues de la fecha indicada en el proceso
      if v_comcop.inicio_cotizacion_fch < v_comcop.activado_fch then
         v_comcop.inicio_cotizacion_fch := v_comcop.activado_fch;
      end if;
    end;
    -- Obtener la fecha de fin de la cotización
    v_comcop.fin_cotizacion_fch := null;
    begin
      -- Es la fecha de fin cotizacion indicada en el proceso.
      v_comcop.fin_cotizacion_fch := v_comcon.fecha_fin_propuesta;
    end;
    -- Obtener la fecha de evaluacion
    v_comcop.evaluado_fch := null;
    declare
      cursor cr_comcoe is
      select max(FECHA)
      from com_contrataciones_est
      where comcon_id = p_comcon_id
        and estado = 'PRE'
        and fecha <= p_fecha;
    begin
      -- Obtener la ultima fecha de evaluacion anterior a la fecha de procesamiento.
      open cr_comcoe;
      fetch cr_comcoe into v_comcop.evaluado_fch;
      close cr_comcoe;
      -- Si la fecha de evaluación es menor a la fecha de fin de cotización
      -- se considera que la fecha de fin de cotización es igual a la fecha de evaluación
      -- esto es así porque es posible que se altere la fecha de fin de cotización
      -- para realizar una evaluación
      if v_comcop.evaluado_fch < v_comcop.fin_cotizacion_fch then
         v_comcop.fin_cotizacion_fch := v_comcop.evaluado_fch;
      end if;
    end;
    -- Obtener la fecha de verificación
    v_comcop.verificado_fch := null;
    declare
      cursor cr_comcoe is
      select max(FECHA)
      from com_contrataciones_est
      where comcon_id = p_comcon_id
        and estado = 'VRF'
        and fecha <= p_fecha;
    begin
      -- Obtener la ultima fecha de verificacion anterior a la fecha de procesamiento.
      open cr_comcoe;
      fetch cr_comcoe into v_comcop.verificado_fch;
      close cr_comcoe;
    end;
    -- Obtener la fecha de envío
    v_comcop.enviado_fch := null;
    declare
      cursor cr_comcoe is
      select min(FECHA)
      from com_contrataciones_est
      where comcon_id = p_comcon_id
        and estado = 'ENV'
        and fecha <= p_fecha;
    begin
      -- Obtener la primera fecha de envío anterior a la fecha de procesamiento.
      open cr_comcoe;
      fetch cr_comcoe into v_comcop.enviado_fch;
      close cr_comcoe;
    end;
    -- Obtener la fecha de devuelto
    v_comcop.devuelto_fch := null;
    declare
      cursor cr_comcoe is
      select max(FECHA)
      from com_contrataciones_est
      where comcon_id = p_comcon_id
        and estado in ('INF','IFC')
        and fecha <= nvl((select min(a.FECHA)
      from com_contrataciones_est a
      where a.comcon_id = p_comcon_id
        and a.estado = 'ACR'
        and a.fecha <= p_fecha),p_fecha);
    begin
      -- Obtener la ultima fecha de devolución anterior a la fecha de procesamiento o acordado
      open cr_comcoe;
      fetch cr_comcoe into v_comcop.devuelto_fch;
      close cr_comcoe;
    end;
    -- Obtener la fecha de acordado
    v_comcop.acordado_fch := null;
    declare
      cursor cr_comcoe is
      select max(FECHA)
      from com_contrataciones_est
      where comcon_id = p_comcon_id
        and estado = 'ACR'
        and fecha <= p_fecha;
    begin
      -- Obtener la ultima fecha de acordado anterior a la fecha de procesamiento.
      open cr_comcoe;
      fetch cr_comcoe into v_comcop.acordado_fch;
      close cr_comcoe;
    end;
    -- Obtener la fecha de resolucion
    v_comcop.resolucion_fch := null;
    declare
      cursor cr_comcoe is
      select max(FECHA)
      from com_contrataciones_est
      where comcon_id = p_comcon_id
        and estado = 'RES'
        and fecha <= p_fecha;
    begin
      -- Obtener la primera fecha de resolucion anterior a la fecha de procesamiento.
      open cr_comcoe;
      fetch cr_comcoe into v_comcop.resolucion_fch;
      close cr_comcoe;
    end;

    -- Obtener la fecha de adjudicado
    v_comcop.adjudicado_fch := null;
    declare
      cursor cr_comcoe is
      select min(FECHA)
      from com_contrataciones_est
      where comcon_id = p_comcon_id
        and estado = 'ADJ'
        and fecha <= p_fecha;
    begin
      -- Obtener la primera fecha de adjudicación anterior a la fecha de procesamiento.
      open cr_comcoe;
      fetch cr_comcoe into v_comcop.adjudicado_fch;
      close cr_comcoe;
    end;
    -- Obtener la fecha de finalizado
    v_comcop.finalizado_fch := null;
    declare
      cursor cr_comcoe is
      select min(FECHA)
      from com_contrataciones_est
      where comcon_id = p_comcon_id
        and estado = 'FIN'
        and fecha <= p_fecha;
    begin
      -- Obtener la primera fecha de finalización anterior a la fecha de procesamiento.
      open cr_comcoe;
      fetch cr_comcoe into v_comcop.finalizado_fch;
      close cr_comcoe;
    end;
    -- Obtener la fecha de desierto
    v_comcop.desierto_fch := null;
    declare
      cursor cr_comcoe is
      select max(FECHA)
      from com_contrataciones_est
      where comcon_id = p_comcon_id
        and estado = 'DES'
        and fecha <= p_fecha
        and fecha >= v_comcop.fin_cotizacion_fch;
    begin
      -- Obtener la ultima fecha de desierto anterior a la fecha de procesamiento.
      open cr_comcoe;
      fetch cr_comcoe into v_comcop.desierto_fch;
      close cr_comcoe;
    end;
    -- Obtener la fecha de no adjudicado
    v_comcop.no_adjudicado_fch := null;
    declare
      cursor cr_comcoe is
      select max(FECHA)
      from com_contrataciones_est
      where comcon_id = p_comcon_id
        and estado = 'NAD'
        and fecha <= p_fecha;
    begin
      -- Obtener la ultima fecha de no adjudicado anterior a la fecha de procesamiento.
      open cr_comcoe;
      fetch cr_comcoe into v_comcop.no_adjudicado_fch;
      close cr_comcoe;
    end;
    -- Obtener la fecha de anulado
    v_comcop.anulado_fch := null;
    declare
      cursor cr_comcoe is
      select max(FECHA)
      from com_contrataciones_est
      where comcon_id = p_comcon_id
        and estado = 'CAN'
        and fecha <= p_fecha;
    begin
      -- Obtener la ultima fecha de cancelado (anulado) anterior a la fecha de procesamiento.
      open cr_comcoe;
      fetch cr_comcoe into v_comcop.anulado_fch;
      close cr_comcoe;
    end;
    --
    -- Calculo de tiempos
    v_comcop.aprobado_dias := null;
    if v_comcop.generado_fch is not null and
       v_comcop.aprobado_fch is not null then
      v_comcop.aprobado_dias := v_comcop.generado_fch-v_comcop.aprobado_fch;
    end if;
    --
    v_comcop.generado_dias := null;
    if v_comcop.activado_fch is not null and
       v_comcop.generado_fch is not null then
      v_comcop.generado_dias := v_comcop.activado_fch-v_comcop.generado_fch;
    end if;
    --
    v_comcop.activado_dias := null;
    if v_comcop.inicio_cotizacion_fch is not null and
       v_comcop.activado_fch is not null then
      v_comcop.activado_dias := v_comcop.inicio_cotizacion_fch-v_comcop.activado_fch;
    end if;
    --
    v_comcop.cotizado_dias := null;
    if v_comcop.fin_cotizacion_fch is not null and
       v_comcop.inicio_cotizacion_fch is not null then
      v_comcop.cotizado_dias := v_comcop.fin_cotizacion_fch-v_comcop.inicio_cotizacion_fch;
    end if;
    --
    v_comcop.evaluado_dias := null;
    if v_comcop.evaluado_fch is not null and
       v_comcop.fin_cotizacion_fch is not null then
      v_comcop.evaluado_dias := v_comcop.evaluado_fch-v_comcop.fin_cotizacion_fch;
    end if;
    --
    v_comcop.verificado_dias := null;
    if v_comcop.verificado_fch is not null and
       v_comcop.evaluado_fch is not null then
      v_comcop.verificado_dias := v_comcop.verificado_fch-v_comcop.evaluado_fch;
    end if;
    --
    v_comcop.enviado_dias := null;
    if v_comcop.enviado_fch is not null and
       (v_comcop.verificado_fch is not null or v_comcop.evaluado_fch is not null) then
      v_comcop.enviado_dias := v_comcop.enviado_fch - nvl(v_comcop.verificado_fch,v_comcop.evaluado_fch);
    end if;
    --
    v_comcop.para_informar_dias := null;
    --
    if v_comcop.enviado_fch is not null then
      declare
        -- Obtener todos los envios realizados
        cursor cr_comenv is
        select fecha
        from com_contrataciones_est
        where comcon_id = p_comcon_id
          and estado = 'ENV'
          and fecha >= v_comcop.enviado_fch;
        -- Obtener la primera fecha de devolucion posterior
        -- a la fecha de envio (la contestación)
        cursor cr_comenv_time (p_fecha in date) is
        select min(fecha)
        from com_contrataciones_est
        where comcon_id = p_comcon_id
          and estado = 'INF'
          and fecha >= p_fecha;
        --
      begin
        -- Contabilizar el tiempo transcurrido para cada envio
        -- Por cada envío contabilizar el tiempo transcurrido entre
        -- el envio y su contestación, si aun no fue contestado se considera
        -- que hasta la fecha actual se encuentra para informar y se suma el tiempo
        -- hasta la adjudicación, la declaracion de no adjudicado o la fecha actual.
        v_comcop.para_informar_dias := 0;
        for v_comenv in cr_comenv loop
          declare
            v_comenv_time_fecha date;
          begin
            open cr_comenv_time (p_fecha => v_comenv.fecha);
            fetch cr_comenv_time into v_comenv_time_fecha;
            close cr_comenv_time;
            --
            v_comcop.para_informar_dias := v_comcop.para_informar_dias + (nvl(v_comenv_time_fecha,nvl(v_comcop.acordado_fch,nvl(v_comcop.no_adjudicado_fch,sysdate)))-v_comenv.fecha);
          end;
        end loop;
        --
      end;
    end if;
    --
    v_comcop.informado_dias := null;
    --
    if v_comcop.devuelto_fch is not null then
      declare
        -- Obtener todos los informes recibidos
        cursor cr_cominf is
        select fecha
        from com_contrataciones_est
        where comcon_id = p_comcon_id
          and estado = 'INF'
          and fecha <= v_comcop.devuelto_fch;
        -- Obtener la primera fecha de envio posterior
        -- a la fecha de recepcion (el reenvio)
        cursor cr_cominf_time (p_fecha in date) is
        select min(fecha)
        from com_contrataciones_est
        where comcon_id = p_comcon_id
          and estado = 'ENV'
          and fecha >= p_fecha;
        --
      begin
        -- Contabilizar el tiempo transcurrido entre reenvios
        -- Por cada recepcion contabilizar el tiempo transcurrido entre
        -- la recepción y su reenvio, si no fue reenviado y no se tiene
        -- fecha de acordado, adjudicado, desierto o declaracion de no adjudicado
        -- se considera que aun esta pendiente de reslucion y se cuenta hasta la fecha actual.
        v_comcop.informado_dias := 0;
        for v_cominf in cr_cominf loop
          declare
            v_cominf_time_fecha date;
          begin
            open cr_cominf_time (p_fecha => v_cominf.fecha);
            fetch cr_cominf_time into v_cominf_time_fecha;
            close cr_cominf_time;
            --
            if v_cominf_time_fecha is null and
               v_comcop.acordado_fch is null and
               v_comcop.adjudicado_fch is null and
               v_comcop.finalizado_fch is null and
               v_comcop.desierto_fch is null and
               v_comcop.no_adjudicado_fch is null and
               v_comcop.anulado_fch is null then
               v_comcop.informado_dias := v_comcop.informado_dias + (sysdate - v_cominf.fecha);
            elsif v_cominf_time_fecha is not null then
              v_comcop.informado_dias := v_comcop.informado_dias + (v_cominf_time_fecha - v_cominf.fecha);
            else
              -- Si no se ha obtenido la fecha de contestación pero
              -- el proceso ha sido acordado, adjudicado .. etc.
              -- no se tiene en cuenta este tiempo
              null;
            end if;
          end;
        end loop;
        --
      end;
      --
    end if;
    --
    v_comcop.acordado_dias := null;
    if v_comcop.acordado_fch is not null and
       v_comcop.evaluado_fch is not null then
      v_comcop.acordado_dias  := v_comcop.acordado_fch-nvl(v_comcop.devuelto_fch,nvl(v_comcop.enviado_fch,nvl(v_comcop.verificado_fch,v_comcop.evaluado_fch)));
    end if;
    --
    v_comcop.resolucion_dias := null;
    if v_comcop.resolucion_fch is not null and
       v_comcop.acordado_fch is not null then
       if v_comcop.resolucion_fch >= v_comcop.acordado_fch then
         v_comcop.resolucion_dias  := v_comcop.resolucion_fch-v_comcop.acordado_fch;
       else
         v_comcop.resolucion_dias := 0;
       end if;
    end if;
    --
    v_comcop.adjudicado_dias := null;
    if v_comcop.adjudicado_fch is not null and
       v_comcop.evaluado_fch is not null then
      v_comcop.adjudicado_dias  := v_comcop.adjudicado_fch- nvl(v_comcop.resolucion_fch,nvl(v_comcop.acordado_fch,nvl(v_comcop.devuelto_fch,nvl(v_comcop.enviado_fch,nvl(v_comcop.verificado_fch,v_comcop.evaluado_fch)))));
    end if;
    --
    v_comcop.finalizado_dias := null;
    if v_comcop.finalizado_fch is not null and
       (v_comcop.acordado_fch is not null or v_comcop.devuelto_fch is not null) then
      v_comcop.finalizado_dias:= v_comcop.finalizado_fch-nvl(v_comcop.adjudicado_fch,nvl(v_comcop.acordado_fch,v_comcop.devuelto_fch));
    end if;
    --
    v_comcop.desierto_dias := null;
    if v_comcop.desierto_fch is not null and
       v_comcop.activado_fch is not null then
      if v_comcop.acordado_fch is not null and v_comcop.acordado_fch < v_comcop.desierto_fch then
        v_comcop.desierto_dias   := v_comcop.desierto_fch - v_comcop.acordado_fch;
      elsif v_comcop.devuelto_fch is not null and v_comcop.devuelto_fch < v_comcop.desierto_fch then
        v_comcop.desierto_dias   := v_comcop.desierto_fch - v_comcop.devuelto_fch;
      elsif v_comcop.enviado_fch is not null and v_comcop.enviado_fch < v_comcop.desierto_fch then
        v_comcop.desierto_dias   := v_comcop.desierto_fch - v_comcop.enviado_fch;
      elsif v_comcop.verificado_fch is not null and v_comcop.verificado_fch < v_comcop.desierto_fch then
        v_comcop.desierto_dias   := v_comcop.desierto_fch - v_comcop.verificado_fch;
      elsif v_comcop.evaluado_fch is not null and v_comcop.evaluado_fch < v_comcop.desierto_fch then
        v_comcop.desierto_dias   := v_comcop.desierto_fch - v_comcop.evaluado_fch;
      elsif v_comcop.fin_cotizacion_fch is not null and v_comcop.fin_cotizacion_fch < v_comcop.desierto_fch then
        v_comcop.desierto_dias   := v_comcop.desierto_fch - v_comcop.fin_cotizacion_fch;
      elsif v_comcop.inicio_cotizacion_fch is not null and v_comcop.inicio_cotizacion_fch < v_comcop.desierto_fch then
        v_comcop.desierto_dias   := v_comcop.desierto_fch - v_comcop.inicio_cotizacion_fch;
      elsif v_comcop.activado_fch is not null and v_comcop.activado_fch < v_comcop.desierto_fch then
        v_comcop.desierto_dias   := v_comcop.desierto_fch - v_comcop.activado_fch;
      end if;
    end if;
    --
    v_comcop.no_adjudicado_dias := null;
    if v_comcop.no_adjudicado_fch is not null and
       v_comcop.activado_fch is not null then
      if v_comcop.adjudicado_fch is not null and v_comcop.adjudicado_fch < v_comcop.no_adjudicado_fch then
        v_comcop.no_adjudicado_dias   := v_comcop.no_adjudicado_fch - v_comcop.adjudicado_fch;
      elsif v_comcop.resolucion_fch is not null and v_comcop.resolucion_fch < v_comcop.no_adjudicado_fch then
        v_comcop.no_adjudicado_dias   := v_comcop.no_adjudicado_fch - v_comcop.resolucion_fch;
      elsif v_comcop.acordado_fch is not null and v_comcop.acordado_fch < v_comcop.no_adjudicado_fch then
        v_comcop.no_adjudicado_dias   := v_comcop.no_adjudicado_fch - v_comcop.acordado_fch;
      elsif v_comcop.devuelto_fch is not null and v_comcop.devuelto_fch < v_comcop.no_adjudicado_fch then
        v_comcop.no_adjudicado_dias   := v_comcop.no_adjudicado_fch - v_comcop.devuelto_fch;
      elsif v_comcop.enviado_fch is not null and v_comcop.enviado_fch < v_comcop.no_adjudicado_fch then
        v_comcop.no_adjudicado_dias   := v_comcop.no_adjudicado_fch - v_comcop.enviado_fch;
      elsif v_comcop.verificado_fch is not null and v_comcop.verificado_fch < v_comcop.no_adjudicado_fch then
        v_comcop.no_adjudicado_dias   := v_comcop.no_adjudicado_fch - v_comcop.verificado_fch;
      elsif v_comcop.evaluado_fch is not null and v_comcop.evaluado_fch < v_comcop.no_adjudicado_fch then
        v_comcop.no_adjudicado_dias   := v_comcop.no_adjudicado_fch - v_comcop.evaluado_fch;
      elsif v_comcop.fin_cotizacion_fch is not null and v_comcop.fin_cotizacion_fch < v_comcop.no_adjudicado_fch then
        v_comcop.no_adjudicado_dias   := v_comcop.no_adjudicado_fch - v_comcop.fin_cotizacion_fch;
      elsif v_comcop.inicio_cotizacion_fch is not null and v_comcop.inicio_cotizacion_fch < v_comcop.no_adjudicado_fch then
        v_comcop.no_adjudicado_dias   := v_comcop.no_adjudicado_fch - v_comcop.inicio_cotizacion_fch;
      elsif v_comcop.activado_fch is not null and v_comcop.activado_fch < v_comcop.no_adjudicado_fch then
        v_comcop.no_adjudicado_dias   := v_comcop.no_adjudicado_fch - v_comcop.activado_fch;
      end if;
    end if;
    --
    v_comcop.anulado_dias := null;
    if v_comcop.anulado_fch is not null and
       v_comcop.generado_fch is not null then
      if v_comcop.adjudicado_fch is not null and v_comcop.adjudicado_fch < v_comcop.anulado_fch then
        v_comcop.anulado_dias   := v_comcop.anulado_fch - v_comcop.adjudicado_fch;
      elsif v_comcop.acordado_fch is not null and v_comcop.acordado_fch < v_comcop.anulado_fch then
        v_comcop.anulado_dias   := v_comcop.anulado_fch - v_comcop.acordado_fch;
      elsif v_comcop.devuelto_fch is not null and v_comcop.devuelto_fch < v_comcop.anulado_fch then
        v_comcop.anulado_dias   := v_comcop.anulado_fch - v_comcop.devuelto_fch;
      elsif v_comcop.enviado_fch is not null and v_comcop.enviado_fch < v_comcop.anulado_fch then
        v_comcop.anulado_dias   := v_comcop.anulado_fch - v_comcop.enviado_fch;
      elsif v_comcop.verificado_fch is not null and v_comcop.verificado_fch < v_comcop.anulado_fch then
        v_comcop.anulado_dias   := v_comcop.anulado_fch - v_comcop.verificado_fch;
      elsif v_comcop.evaluado_fch is not null and v_comcop.evaluado_fch < v_comcop.anulado_fch then
        v_comcop.anulado_dias   := v_comcop.anulado_fch - v_comcop.evaluado_fch;
      elsif v_comcop.fin_cotizacion_fch is not null and v_comcop.fin_cotizacion_fch < v_comcop.anulado_fch then
        v_comcop.anulado_dias   := v_comcop.anulado_fch - v_comcop.fin_cotizacion_fch;
      elsif v_comcop.inicio_cotizacion_fch is not null and v_comcop.inicio_cotizacion_fch < v_comcop.anulado_fch then
        v_comcop.anulado_dias   := v_comcop.anulado_fch - v_comcop.inicio_cotizacion_fch;
      elsif v_comcop.activado_fch is not null and v_comcop.activado_fch < v_comcop.anulado_fch then
        v_comcop.anulado_dias   := v_comcop.anulado_fch - v_comcop.activado_fch;
      elsif v_comcop.generado_fch is not null and v_comcop.generado_fch < v_comcop.anulado_fch then
        v_comcop.anulado_dias  := v_comcop.anulado_fch - v_comcop.generado_fch;
      end if;
    end if;
    --
    v_comcop.duracion_total_dias := null;
    if v_comcop.aprobado_fch is not null and
       nvl(nvl(nvl(nvl(v_comcop.adjudicado_fch,v_comcop.desierto_fch),v_comcop.no_adjudicado_fch),v_comcop.anulado_fch),v_comcop.finalizado_fch) is not null then
      v_comcop.duracion_total_dias := nvl(nvl(nvl(nvl(v_comcop.adjudicado_fch,v_comcop.desierto_fch),v_comcop.no_adjudicado_fch),v_comcop.anulado_fch),v_comcop.finalizado_fch) - v_comcop.aprobado_fch;
    end if;
    --
    v_comcop.contratante_pre_dias    := null;
    v_comcop.contratante_pre_dias    := nvl(v_comcop.aprobado_dias,0);
    --
    v_comcop.administracion_pre_dias := null;
    v_comcop.administracion_pre_dias := nvl(v_comcop.generado_dias,0);
    --
    v_comcop.administracion_pos_dias := null;
    v_comcop.administracion_pos_dias := nvl(v_comcop.evaluado_dias,0)+
                                        nvl(v_comcop.verificado_dias,0)+
                                        nvl(v_comcop.enviado_dias,0)+
                                        nvl(v_comcop.informado_dias,0)+
                                        nvl(v_comcop.acordado_dias,0)+
                                        nvl(v_comcop.desierto_dias,0)+
                                        nvl(v_comcop.no_adjudicado_dias,0)+
                                        nvl(v_comcop.anulado_dias,0);
    --
    v_comcop.contratante_pos_dias := null;
    v_comcop.contratante_pos_dias := nvl(v_comcop.para_informar_dias,0)+nvl(v_comcop.adjudicado_dias,0)+nvl(v_comcop.resolucion_dias,0);
    --
    v_comcop.proveedor_dias := null;
    v_comcop.proveedor_dias := nvl(v_comcop.cotizado_dias,0);
    --
    v_comcop.publicacion_pre_dias := null;
    v_comcop.publicacion_pre_dias := nvl(v_comcop.activado_dias,0);
    --
    v_comcop.anio_mes := null;
    if nvl(nvl(nvl(nvl(v_comcop.adjudicado_fch,v_comcop.desierto_fch),v_comcop.no_adjudicado_fch),v_comcop.anulado_fch),v_comcop.finalizado_fch) is not null then
      v_comcop.anio_mes := to_char(nvl(nvl(nvl(nvl(v_comcop.adjudicado_fch,v_comcop.desierto_fch),v_comcop.no_adjudicado_fch),v_comcop.anulado_fch),v_comcop.finalizado_fch),'YYYY-MM');
    end if;
    --
    update com_contrataciones_tiempos
    set aprobado_fch = v_comcop.aprobado_fch
       ,generado_fch = v_comcop.generado_fch
       ,activado_fch = v_comcop.activado_fch
       ,inicio_cotizacion_fch = v_comcop.inicio_cotizacion_fch
       ,fin_cotizacion_fch = v_comcop.fin_cotizacion_fch
       ,evaluado_fch = v_comcop.evaluado_fch
       ,verificado_fch = v_comcop.verificado_fch
       ,enviado_fch = v_comcop.enviado_fch
       ,devuelto_fch = v_comcop.devuelto_fch
       ,acordado_fch = v_comcop.acordado_fch
       ,resolucion_fch = v_comcop.resolucion_fch
       ,adjudicado_fch = v_comcop.adjudicado_fch
       ,finalizado_fch = v_comcop.finalizado_fch
       ,desierto_fch = v_comcop.desierto_fch
       ,no_adjudicado_fch = v_comcop.no_adjudicado_fch
       ,anulado_fch = v_comcop.anulado_fch
       ,aprobado_dias = v_comcop.aprobado_dias
       ,generado_dias = v_comcop.generado_dias
       ,activado_dias = v_comcop.activado_dias
       ,cotizado_dias = v_comcop.cotizado_dias
       ,evaluado_dias = v_comcop.evaluado_dias
       ,verificado_dias = v_comcop.verificado_dias
       ,enviado_dias = v_comcop.enviado_dias
       ,para_informar_dias = v_comcop.para_informar_dias
       ,informado_dias = v_comcop.informado_dias
       ,acordado_dias = v_comcop.acordado_dias
       ,resolucion_dias = v_comcop.resolucion_dias
       ,adjudicado_dias = v_comcop.adjudicado_dias
       ,finalizado_dias = v_comcop.finalizado_dias
       ,desierto_dias = v_comcop.desierto_dias
       ,no_adjudicado_dias = v_comcop.no_adjudicado_dias
       ,anulado_dias = v_comcop.anulado_dias
       ,duracion_total_dias = v_comcop.duracion_total_dias
       ,contratante_pre_dias = v_comcop.contratante_pre_dias
       ,administracion_pre_dias = v_comcop.administracion_pre_dias
       ,publicacion_pre_dias = v_comcop.publicacion_pre_dias
       ,proveedor_dias = v_comcop.proveedor_dias
       ,administracion_pos_dias = v_comcop.administracion_pos_dias
       ,contratante_pos_dias = v_comcop.contratante_pos_dias
       ,anio_mes = v_comcop.anio_mes
     where id = v_comcop.id;
  end loop;
end;
/* Obtener el valor de la variable v_comctd. */
PROCEDURE COMCTD_GET
 (P_COMCTD OUT COM_CONTRATACIONES_TIPDOT%ROWTYPE
 )
 IS
begin
  p_comctd := v_comctd;
end;
/* Inicializar la variable v_comctd. */
PROCEDURE COMCTD_INI
 IS
begin
    v_comctd := null;
end;
/* Insertar registro en COM_CONTRATACIONES_TIPDOT. */
PROCEDURE COMCTD_INS
 (P_COMCTD IN COM_CONTRATACIONES_TIPDOT%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_CONTRATACIONES_TIPDOT
  ( ID
    ,COMCTT_ID
    ,COMDCT_ID
    ,SITUACION
    ,MOTIVO_SITUACION
    ,FECHA_SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY
  )
  VALUES
  (  p_comctd.ID
    ,p_comctd.COMCTT_ID
    ,p_comctd.COMDCT_ID
    ,p_comctd.SITUACION
    ,p_comctd.MOTIVO_SITUACION
    ,p_comctd.FECHA_SITUACION
    ,p_comctd.DATE_CREATED
    ,p_comctd.CREATED_BY
    ,p_comctd.DATE_MODIFIED
    ,p_comctd.MODIFIED_BY
  );
  --
END;
/* Setear la variable v_comctd. */
PROCEDURE COMCTD_SET
 (P_ID IN NUMBER
 )
 IS
cursor cr_comctd is
  select *
  from COM_CONTRATACIONES_TIPDOT COMCTD
  where COMCTD.ID = p_id;
begin
  -- Inicializa la variable
  COMCTD_INI;
  -- Cargar la variable con los datos de la consultaa
  open cr_comctd;
  fetch cr_comctd into v_comctd;
  close cr_comctd;
end;
FUNCTION OBTN_COMCON_RES_PDF
 (P_SEGORG_ID IN NUMBER
 ,P_COMCON_ID IN NUMBER
 )
 RETURN INTEGER
 IS
-- Organizacion
  cursor cr_segorg is
    select segorg.CODIGO
    from        SEG_ORGANIZACIONES segorg
    where     segorg.ID = p_segorg_id;
  -- Contratación
  cursor cr_comcon is
    select comcon.*
    from      COM_CONTRATACIONES comcon
    where    comcon.id = p_comcon_id;
  -- Tipo de Contratacion
  cursor cr_comctt(p_comctt_id number) is
    select comctt.*
    from        COM_CONTRATACIONES_TIPOS comctt
    where    comctt.id = p_comctt_id;
  -- Detalle de la Contratacion
  cursor cr_comcot is
    select comcot.*
    from     COM_CONTRATACIONES_DETALLES comcot
    where    comcot.COMCON_ID = p_comcon_id;
  -- Estado de Contracion
  cursor cr_comcoe(p_comcoe_id number) is
    select comcoe.*
    from         COM_CONTRATACIONES_EST comcoe
    where    id = p_comcoe_id;
  -- Tipo de Documento
  cursor cr_comdct is
    select comdct.*
    from        COM_DOCUMENTOS_TIPOS comdct
    where   comdct.CODIGO = 'COM_RESOLUCION';
  -- Solicitud de Gasto de la Contratación
  cursor cr_comped(p_comped_id number) is
    select comped.*
    from        COM_PEDIDOS comped
    where    comped.ID = p_comped_id;
  -- Tipo de datos (Parametros de la Resolucion)
  cursor cr_comdat is
    select comdat.*
    from   COM_DATOS_TIPOS comdat
    where  comdat.CODIGO = 'ADJ_PARAMETROS_PCYCSL';
  -- Obtener los datos de la resolucion emitida
  cursor cr_compda(p_comped_id number, p_comdat_id number) is
    select    GRAL_PKG.OBTN_VALORPARAMETRO('NRO_RESOLUCION', VALOR) RESOLUCION_NRO
    from        COM_PEDIDOS_DAT compda
    where    compda.COMPED_ID = p_comped_id
    and        compda.COMDAT_ID = p_comdat_id;
  --
  v_comcon cr_comcon%rowtype;
  v_comctt cr_comctt%rowtype;
  v_comcot cr_comcot%rowtype;
  v_comcoe cr_comcoe%rowtype;
  v_comdct cr_comdct%rowtype;
  v_comped cr_comped%rowtype;
  v_comdat cr_comdat%rowtype;
  --
  v_blob_referencia BLOB;
  v_segorg_codigo  varchar2(100);
  v_request        UTL_HTTP.REQ;
  v_response       UTL_HTTP.RESP;
  v_data           RAW(32767);
  v_dominio        varchar2(300);
  v_resolucion_nro varchar2(100);
  v_nombre_archivo varchar2(300);
  v_comdoc_id      number;
  v_reportURL      varchar2(300);
  v_string          varchar2(4000);
    --
begin
    -- Validar la Organización
    if p_segorg_id is null then
        raise_application_error(-20000, 'La Organizacion no ha sido indicada y es un dato obligatorio.', true);
    end if;
    --
    open cr_segorg;
    fetch cr_segorg into v_segorg_codigo;
    close cr_segorg;

    -- Comprobar que existe el proceso y que es valido
    if p_comcon_id is null then
        raise_application_error(-20000, 'El Proceso de contratacion no ha sido especificado y es un dato obligatorio', true);
    end if;
    --
    open cr_comcon;
    fetch cr_comcon into v_comcon;
    close cr_comcon;
    -- Determinar si es estado de la contratacion es RESOLUCION_EMITIDA
    open cr_comcoe(v_comcon.COMCOE_ID);
    fetch cr_comcoe into v_comcoe;
    close cr_comcoe;
    --dbms_output.put_line('v_comcoe.ID:'||v_comcoe.ID||', v_comcoe.ESTADO: '||v_comcoe.ESTADO);
    --
    if v_comcoe.id is null then
        raise_application_error(-20000, 'No se ha podido determinar el estado de la contratacion.', true);
    elsif v_comcoe.ESTADO not in ('RES', 'ADJ') then
        raise_application_error(-20000, 'La Contratación no se encuentra en estado '||GRAL_PKG.OBTN_CFGABR('COM_CONTRATACIONES_EST.ESTADO', 'RES'));
    end if;
    -- Determinar el tipo de la Contratación contratacion
    open cr_comctt(v_comcon.COMCTT_ID);
    fetch cr_comctt into v_comctt;
    close cr_comctt;
    --dbms_output.put_line('v_comctt.ID:'||v_comctt.ID);
    --
    if v_comctt.id is null then
        raise_application_error(-20000, 'No se ha podido determinar el tipo de Contratación', true);
    end if;
    -- Validar el tipo de documento
    open cr_comdct;
    fetch cr_comdct into v_comdct;
    close cr_comdct;
    --dbms_output.put_line('v_comdct.ID:'||v_comdct.ID);
    --
    if v_comdct.id is null then
        raise_application_error(-20000, 'El tipo de documento especificado no existe', true);
    end if;
    -- Obtener el detalle de la contratacion
    open cr_comcot;
    fetch cr_comcot into v_comcot;
    close cr_comcot;
    --dbms_output.put_line('v_comcot.ID:'||v_comcot.ID);
    -- Obtener la solicitud de gasto de la contratacion
    open cr_comped(v_comcot.COMPED_ID);
    fetch cr_comped into v_comped;
    close cr_comped;
    --dbms_output.put_line('v_comped.ID: '||v_comped.ID);
    -- Obtener los datos de la resolucion
    open cr_comdat;
    fetch cr_comdat into v_comdat;
    close cr_comdat;
    --dbms_output.put_line('v_comdat.ID: '||v_comdat.ID);
    --
    open cr_compda(v_comped.ID, v_comdat.ID);
    fetch cr_compda into v_resolucion_nro;
    close cr_compda;
    --dbms_output.put_line('v_resolucion_nro: '||v_resolucion_nro);
    -- Recogemos la referencia del Blob que contiene el archivo PDF generado por el reporte
    v_nombre_archivo := 'PROCESO DE CONTRATACION - '||v_comctt.NOMBRE||' N° '||v_comcon.CODIGO||'/'||v_comped.EJERCICIO||' - '||v_comdct.NOMBRE||' '||v_resolucion_nro||'-MHyOP-2014';
    --dbms_output.put_line('v_nombre_archivo: '||v_nombre_archivo);
    --
	v_comdoc_id := COMDOC_ID.nextval;
	--
	insert into com_documentos
	(
		ID,
		COMDCT_ID,
		DOCUMENTO,
		NOMBRE_ARCHIVO,
		TIPO_ARCHIVO
	) values (
		v_comdoc_id,
		v_comdct.id,
		EMPTY_BLOB(),
		v_nombre_archivo,
		'application/pdf'
	) return DOCUMENTO into v_blob_referencia;
	--
	-- Recogemos el archivo PDF simulando una llamada al informe desde el navegador
	begin
      --
      v_dominio := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo => 'DOMINIO_SERVIDOR_REPORTES', p_segorg_id => p_segorg_id);
      --dbms_output.put_line('v_dominio: '||v_dominio);
      -- Contruimos la url para llamar al reporte
      v_reportURL := 'http://'||trim(v_dominio)||'/f?p=INFCOM:1014:'||v('APP_SESSION')||'::NO:1014:P1_SEGORG_CODIGO,P1014_COMCON_ID:'||v_segorg_codigo||','||p_comcon_id;
      --dbms_output.put_line('v_reportURL: '||v_reportURL);
	  --Invocamos el reporte
	  v_request := UTL_HTTP.begin_request(v_reportURL, 'GET');
	  -- Obtenemos la respuesta
      v_response := UTL_HTTP.get_response(v_request);
	  --
	exception
		when UTL_HTTP.REQUEST_FAILED then
			return UTL_HTTP.GET_DETAILED_SQLERRM;
            --dbms_output.put_line(UTL_HTTP.GET_DETAILED_SQLERRM);
	end;
	--
	loop
		begin
			-- leer la porcion de datos binarios.
			begin
				UTL_HTTP.READ_RAW(v_response, v_data, 32767);
			exception
				when UTL_HTTP.REQUEST_FAILED then
					return UTL_HTTP.GET_DETAILED_SQLERRM;
			end;
			v_string := v_string || to_char(UTL_RAW.length(v_data));
			-- lo asignamos al blob vacio que teniamos en v_comdoc
			DBMS_LOB.WRITEAPPEND(lob_loc => v_blob_referencia
								,amount => UTL_RAW.LENGTH(v_data)
								,buffer	 => v_data);

	exception
	    when UTL_HTTP.END_OF_BODY then
			exit;
		end;
	end loop;
	UTL_HTTP.end_response(v_response);
	return v_comdoc_id;
exception when others then
		raise_application_error(-20000,'Error al obtener el documento: '||sqlerrm, true);
end;

END COMCON_PKG;
