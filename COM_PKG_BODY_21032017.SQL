create or replace PACKAGE BODY COM_PKG IS


V_COMCDG COM_CONTRATACIONES_DOCGEN%ROWTYPE;
V_COMRDC COM_REPLICAS_DOC%ROWTYPE;
V_COMBCO COM_BANCOS%ROWTYPE;
V_COMCIT COM_CATALOGO_ITEMS%ROWTYPE;
V_COMCZG COM_COTIZACIONES_DOCGEN%ROWTYPE;
V_COMPDG COM_PEDIDOS_DOCGEN%ROWTYPE;
V_COMPDE COM_PROVEEDORES_DTE%ROWTYPE;
V_COMPRU COM_PROVEEDORES_RUBSUS%ROWTYPE;
V_COMPDO COM_PROVEEDORES_DOC%ROWTYPE;
V_COMPDT COM_PROVEEDORES_DOT%ROWTYPE;
V_COMPTT COM_COMPDT_COMPRT%ROWTYPE;
V_COMRED COM_REPLICAS_DET%ROWTYPE;
V_COMTDR COM_COMPDT_COMRUB%ROWTYPE;
V_COMPEL COM_PEDIDOS_CTL%ROWTYPE;
V_COMREP COM_REPLICAS%ROWTYPE;
V_COMCTT COM_CONTRATACIONES_TIPOS%ROWTYPE;
V_COMCOI COM_CONTRATACIONES_INV%ROWTYPE;
V_COMCOD COM_CONTRATACIONES_DOC%ROWTYPE;
V_COMCOT COM_CONTRATACIONES_DETALLES%ROWTYPE;
V_COMCTZ COM_COTIZACIONES%ROWTYPE;
V_COMCZC COM_COTIZACIONES_DOC%ROWTYPE;
V_COMRTP COM_TRAMITES_PRV_TIPOR%ROWTYPE;
V_COMTPT COM_TRAMITES_PRV_TIPO%ROWTYPE;
V_COMPED COM_PEDIDOS%ROWTYPE;
V_COMPEE COM_PEDIDOS_EST%ROWTYPE;
V_COMEJE COM_EJERCICIOS%ROWTYPE;
V_COMCTP COM_CATALOGO_PRECIOS%ROWTYPE;
V_COMETQ COM_ETIQUETAS%ROWTYPE;
V_COMFER COM_FERIADOS%ROWTYPE;
V_COMCTM COM_CALIFICACIONES_TMO%ROWTYPE;
V_COMCMO COM_CALIFICACIONES_MOT%ROWTYPE;
V_COMRRP COM_REPUTACION_RUBPRV%ROWTYPE;
V_COMRER COM_REPUTACION_RUB%ROWTYPE;
V_COMCLF COM_CALIFICACIONES%ROWTYPE;
V_COMECV COM_CONTRATANTES_VINC%ROWTYPE;
V_COMCPA COM_CATALOGO_PRECIOSACTL%ROWTYPE;
V_COMTCO COM_TRAMITES_CON%ROWTYPE;
V_COMOCM COM_ORDENES_COMPRAS%ROWTYPE;
V_COMOCD COM_ORDENES_COMPRAS_DET%ROWTYPE;
V_COMOCE COM_ORDENES_COMPRAS_EST%ROWTYPE;
V_COMCZD COM_COTIZACIONES_DETALLES%ROWTYPE;
V_COMCOE COM_CONTRATACIONES_EST%ROWTYPE;
V_COMCON COM_CONTRATACIONES%ROWTYPE;
V_COMECO COM_CONTRATANTES%ROWTYPE;
V_COMECC COM_CONTRATANTES_CAT%ROWTYPE;
V_COMCNR COM_CONTRATANTES_RES%ROWTYPE;
V_COMCCR COM_CONTRATANTES_CATRES%ROWTYPE;
V_COMPRE COM_PROVEEDORES_EST%ROWTYPE;
V_COMADJ COM_ADJUDICACIONES%ROWTYPE;
V_COMADD COM_ADJUDICACIONES_DET%ROWTYPE;
V_COMECE COM_CONTRATANTES_EST%ROWTYPE;
V_COMTPB COM_TRAMITES_PRV_RUB%ROWTYPE;
V_COMTPS COM_TRAMITES_PRV_RES%ROWTYPE;
V_COMTPD COM_TRAMITES_PRV_DOM%ROWTYPE;
V_COMTPR COM_TRAMITES_PRV%ROWTYPE;
V_COMTRR COM_TERRITORIOS%ROWTYPE;
V_COMRBC COM_RUBROS_CAT%ROWTYPE;
V_COMRUB COM_RUBROS%ROWTYPE;
V_COMRST COM_RESPONSABLES_TIPOS%ROWTYPE;
V_COMRES COM_RESPONSABLES%ROWTYPE;
V_COMPTR COM_PROVEEDORES_TREQ%ROWTYPE;
V_COMPRT COM_PROVEEDORES_TIPOS%ROWTYPE;
V_COMPRR COM_PROVEEDORES_RUB%ROWTYPE;
V_COMPRS COM_PROVEEDORES_RES%ROWTYPE;
V_COMPRD COM_PROVEEDORES_DOM%ROWTYPE;
V_COMPRV COM_PROVEEDORES%ROWTYPE;
V_COMDMT COM_DOMICILIOS_TIPOS%ROWTYPE;
V_COMDOM COM_DOMICILIOS%ROWTYPE;
V_COMDCT COM_DOCUMENTOS_TIPOS%ROWTYPE;
V_COMDOC COM_DOCUMENTOS%ROWTYPE;
V_COMCTR COM_CONTRATANTES_TREQ%ROWTYPE;
V_COMCNT COM_CONTRATANTES_TIPOS%ROWTYPE;

/* Evaluar Contratacion Metodo Menor Precio Individual */
PROCEDURE COMCON_EVAL_MPIND
 (P_COMCON_ID IN NUMBER
 );
/* Evaluar Contratacion Metodo Menor Precio Total */
PROCEDURE COMCON_EVAL_MPTOT
 (P_COMCON_ID IN NUMBER
 );
/* Evaluar Contratacion Metodo Menor Precio Individual */
PROCEDURE COMCON_EVALANU_MPIND
 (P_COMCON_ID IN NUMBER
 );
/* Proceso de Aceptacion delTrámite Proveedor  Cambio de Rubros */
PROCEDURE COMTPR_ACEPTAR_ALRB
 (P_COMTPR_ID IN COM_TRAMITES_PRV.ID%TYPE
 ,P_RESULTADO OUT VARCHAR2
 );
/* Proceso de Aceptacion del Trámite Baja de Categoría */
PROCEDURE COMTPR_ACEPTAR_BAJC
 (P_COMTPR_ID IN COM_TRAMITES_PRV.ID%TYPE
 ,P_RESULTADO OUT VARCHAR2
 ,P_COMPRV_ID OUT COM_PROVEEDORES.ID%TYPE
 );
/* Proceso de Aceptacion delTrámite Proveedor Solicitud de Incripción */
PROCEDURE COMTPR_ACEPTAR_INSC
 (P_COMTPR_ID IN COM_TRAMITES_PRV.ID%TYPE
 ,P_RESULTADO OUT VARCHAR2
 ,P_COMPRV_ID OUT COM_PROVEEDORES.ID%TYPE
 );


FUNCTION OBTN_COMDOC_NO_FMT4
 (P_SEGORG_ID IN NUMBER
 ,P_COMPRV_ID IN NUMBER
 ,P_COMPRT_ID IN NUMBER
 ,P_COMPDT_ID IN NUMBER
 ,P_COMPDT_TIPO IN VARCHAR2
 ,P_COMPDT_TIPO_DURACION IN VARCHAR2
 ,P_COMPDE_ESTADO IN VARCHAR2
 ,P_FECHA IN DATE := SYSDATE
 )
 RETURN VARCHAR2
 IS
--
   CURSOR cr_comptt (p_comprt_id number, p_compdt_id number) IS
   select *
   from com_compdt_comprt
   where  COMPRT_ID = p_comprt_id
   and COMPDT_ID = p_compdt_id;
   --
   CURSOR cr_comtdr (p_comprv_id number, p_compdt_id number) IS
   select 1
   from com_compdt_comrub comtdr
      , com_proveedores_rub  comprr
   where comtdr.COMPDT_ID = p_compdt_id
   and comtdr.comrub_id = comprr.comrub_id
   and comprr.comprv_id = p_comprv_id
   and comprr.situacion = 'ACT';
   --
   -- documentos presentados por proveedor
   CURSOR cr_compdo (p_comprv_id number, p_compdt_id number) IS
   select *
   from com_proveedores_doc
   where comprv_id = p_comprv_id
   and compdt_id = p_compdt_id
   and situacion = 'ACT'
   order by fecha_vencimiento desc;
   --
   v_dummy     number;
   v_retorno   VARCHAR2(20);
   v_comprv    com_proveedores%ROWTYPE;
   v_comprr    com_proveedores_rub%ROWTYPE;
   v_compdt    com_proveedores_dot%ROWTYPE;
   v_compde_vld com_proveedores_dte%ROWTYPE;
   v_comprt_id  number;
   v_comptt  cr_comptt%rowtype;
   v_compdo  cr_compdo%rowtype;
   v_fecha_actual    date;
   --
BEGIN
      if P_COMPDE_ESTADO = 'SUS' then
         return 'SUSPENDIDO';
      end if;
      -- Si el tipo de documento es RUBRO verifique que se encuentre configurado para algun rubro del proveedor
      if p_compdt_tipo = 'RUB' then
        OPEN cr_comtdr(p_comprv_id, p_compdt_id);
        FETCH cr_comtdr INTO v_dummy;
        if cr_comtdr%NOTFOUND THEN
          return 'NO RELACIONADO';
        end if;
        CLOSE cr_comtdr;
      end if;

      -- Verifico que el tipo de documento corresponda al tipo de proveedor
      OPEN cr_comptt(p_comprt_id, p_compdt_id);
      FETCH cr_comptt INTO v_comptt;
        if cr_comptt%NOTFOUND THEN
            return 'NO RELACIONADO';
        END IF;
      CLOSE cr_comptt;
      --
      if P_COMPDT_TIPO_DURACION in ('SIN','NOD') then
        return 'VIGENTE';
      else
          -- obtengo los datos del documento si es que esta presentado
          OPEN cr_compdo(p_comprv_id, p_compdt_id);
          FETCH cr_compdo INTO v_compdo;
          if cr_compdo%NOTFOUND THEN
            return 'NO PRESENTADO';
          end if;
          CLOSE cr_compdo;
          --
          v_fecha_actual := to_char(trunc(p_fecha));
          --
        if nvl(v_compdo.FECHA_VENCIMIENTO, v_fecha_actual+1) < v_fecha_actual then
          return 'VENCIDO';
        end if;
      end if;
      --
      RETURN 'VIGENTE';
END;
FUNCTION OBTN_COMDOC_NO_FMT2
 (P_SEGORG_ID IN NUMBER
 ,P_COMPRV_ID IN NUMBER
 ,P_COMPDT_ID IN NUMBER
 ,P_COMPDT_TIPO IN VARCHAR2
 ,P_COMPDT_TIPO_DURACION IN VARCHAR2
 ,P_COMPDE_ESTADO IN VARCHAR2
 ,P_FECHA IN DATE := SYSDATE
 )
 RETURN VARCHAR2
 IS
/* Esta función se utiliza cuando los parámetros son pasados desde la vista COM_PROVEEDORES_DOT_V */
-- proveedores
   CURSOR cr_comprv(p_comprv_id number) IS
   select *
   from com_proveedores
   WHERE ID = p_comprv_id;
   --
   CURSOR cr_comptt (p_comprt_id number, p_compdt_id number) IS
   select *
   from com_compdt_comprt
   where  COMPRT_ID = p_comprt_id
   and COMPDT_ID = p_compdt_id;
   --
   CURSOR cr_comtdr (p_comprv_id number, p_compdt_id number) IS
   select 1
   from com_compdt_comrub comtdr
   , com_proveedores_rub  comprr
   where comtdr.COMPDT_ID = p_compdt_id
   and comtdr.comrub_id = comprr.comrub_id
   and comprr.comprv_id = p_comprv_id
   and comprr.situacion = 'ACT';
   --
   -- documentos presentados por proveedor
   CURSOR cr_compdo (p_comprv_id number, p_compdt_id number) IS
   select *
   from com_proveedores_doc
   where comprv_id = p_comprv_id
   and compdt_id = p_compdt_id
   --and situacion = 'ACT'
   order by fecha_vencimiento desc;
   --
   v_dummy     number;
   v_retorno   VARCHAR2(20);
   v_comprv    com_proveedores%ROWTYPE;
   v_comprr    com_proveedores_rub%ROWTYPE;
   v_compdt    com_proveedores_dot%ROWTYPE;
   v_compde_vld com_proveedores_dte%ROWTYPE;
   v_comprt_id  number;
   v_comptt  cr_comptt%rowtype;
   v_compdo  cr_compdo%rowtype;
   v_fecha_actual    date;
   --
BEGIN
      if P_COMPDE_ESTADO = 'SUS' then
         return 'SUSPENDIDO';
      end if;
      -- Si el tipo de documento es RUBRO verifique que se encuentre configurado para algun rubro del proveedor
      if p_compdt_tipo = 'RUB' then
        OPEN cr_comtdr(p_comprv_id, p_compdt_id);
        FETCH cr_comtdr INTO v_dummy;
        if cr_comtdr%NOTFOUND THEN
          return 'NO RELACIONADO';
        end if;
        CLOSE cr_comtdr;
      end if;
      --
      OPEN cr_comprv(p_comprv_id);
      FETCH cr_comprv INTO v_comprv;
      CLOSE cr_comprv;

      -- Verifico que el tipo de documento corresponda al tipo de proveedor
      OPEN cr_comptt(v_comprv.comprt_id, p_compdt_id);
      FETCH cr_comptt INTO v_comptt;
        if cr_comptt%NOTFOUND THEN
            return 'NO RELACIONADO';
        END IF;
      CLOSE cr_comptt;
      --
      if P_COMPDT_TIPO_DURACION in ('SIN','NOD') then
        return 'VIGENTE';
      else
          -- obtengo los datos del documento si es que esta presentado
          OPEN cr_compdo(p_comprv_id, p_compdt_id);
          FETCH cr_compdo INTO v_compdo;
          if cr_compdo%NOTFOUND THEN
            return 'NO PRESENTADO';
          end if;
          CLOSE cr_compdo;
          --
          v_fecha_actual := to_char(trunc(p_fecha));
          --
        if v_compdo.SITUACION = 'ACT' and nvl(v_compdo.FECHA_VENCIMIENTO, v_fecha_actual+1) < v_fecha_actual then
          return 'VENCIDO';
        end if;
        --
        IF V_COMPDO.SITUACION <> 'ACT' THEN
          return 'NO PRESENTADO';
        end if;
        --
      end if;
      --
      RETURN 'VIGENTE';
END;
FUNCTION OBTN_COMDOC_NO_FMT3
 (P_SEGORG_ID IN NUMBER
 ,P_COMPRV_ID IN NUMBER
 ,P_COMPDT_ID IN NUMBER
 ,P_COMPDT_TIPO IN VARCHAR2
 ,P_COMPDT_TIPO_DURACION IN VARCHAR2
 ,P_COMPDE_ESTADO IN VARCHAR2
 ,P_FECHA_VENCIMIENTO IN DATE
 ,P_FECHA IN DATE := SYSDATE
 )
 RETURN VARCHAR2
 IS
/* Esta función se utiliza cuando los parámetros son pasados desde la vista COM_PROVEEDORES_DOC_V
   y no se accede a la tabla COM_PROVEEDORES_DOC, a diferencia de OBTN_COMDOC_NO_FMT2*/
-- proveedores
   CURSOR cr_comprv (p_comprv_id number)IS
   select *
   from com_proveedores
   WHERE ID = p_comprv_id;
   --
   CURSOR cr_comptt (p_comprt_id number, p_compdt_id number) IS
   select *
   from com_compdt_comprt
   where  COMPRT_ID = p_comprt_id
   and COMPDT_ID = p_compdt_id;
   --
   CURSOR cr_comtdr (p_comprv_id number, p_compdt_id number) IS
   select 1
   from com_compdt_comrub comtdr
   , com_proveedores_rub  comprr
   where comtdr.COMPDT_ID = p_compdt_id
   and comtdr.comrub_id = comprr.comrub_id
   and comprr.comprv_id = p_comprv_id
   and comprr.situacion = 'ACT';
   --
   v_dummy     number;
   v_retorno   VARCHAR2(20);
   v_comprv    com_proveedores%ROWTYPE;
   v_comprr    com_proveedores_rub%ROWTYPE;
   v_compdt    com_proveedores_dot%ROWTYPE;
   v_compde_vld com_proveedores_dte%ROWTYPE;
   v_comprt_id  number;
   v_comptt  cr_comptt%rowtype;
   v_fecha_actual    date;
   --
BEGIN
      if P_COMPDE_ESTADO = 'SUS' then
         return 'SUSPENDIDO';
      end if;
      --
      v_fecha_actual := to_char(trunc(p_fecha));
      --
      if P_COMPDT_TIPO_DURACION in ('SIN','NOD') then
        return 'VIGENTE';
      else
        if nvl(P_FECHA_VENCIMIENTO, v_fecha_actual+1) < v_fecha_actual then
          return 'VENCIDO';
        end if;
      end if;
      --
      -- Si el tipo de documento es RUBRO verifique que se encuentre configurado para algun rubro del proveedor
      if p_compdt_tipo = 'RUB' then
        OPEN cr_comtdr(p_comprv_id, p_compdt_id);
        FETCH cr_comtdr INTO v_dummy;
        if cr_comtdr%NOTFOUND THEN
          return 'NO RELACIONADO';
        end if;
        CLOSE cr_comtdr;
      end if;
      --
      OPEN cr_comprv (p_comprv_id);
      FETCH cr_comprv INTO v_comprv;
      CLOSE cr_comprv;
      -- Verifico que el tipo de documento corresponda al tipo de proveedor
      OPEN cr_comptt(v_comprv.comprt_id, p_compdt_id);
      FETCH cr_comptt INTO v_comptt;
      if cr_comptt%NOTFOUND THEN
        return 'NO RELACIONADO';
      end if;
      CLOSE cr_comptt;
      --
      RETURN 'VIGENTE';
END;
FUNCTION OBTN_COMDOC_ESTADO2
 (P_SEGORG_ID IN NUMBER
 ,P_COMPRV_ID IN NUMBER
 ,P_COMPDT_ID IN NUMBER
 ,P_COMPDT_TIPO_DURACION IN VARCHAR2
 ,P_COMPDE_ESTADO IN VARCHAR2
 )
 RETURN VARCHAR2
 IS
-- documentos presentados por proveedor
CURSOR cr_compdo (p_comprv_id number, p_compdt_id number) IS
select *
from com_proveedores_doc
where comprv_id = p_comprv_id
and compdt_id = p_compdt_id
and situacion = 'ACT'
order by fecha_vencimiento desc;
--
v_retorno   VARCHAR2(20);
v_comprv    com_proveedores%ROWTYPE;
v_comprr    com_proveedores_rub%ROWTYPE;
v_compdt    com_proveedores_dot%ROWTYPE;
v_compde_vld com_proveedores_dte%ROWTYPE;
v_fecha_actual date;
v_compdo_prv    com_proveedores_doc%rowtype;
--
BEGIN
   --
   if P_COMPDE_ESTADO = 'SUS' then
      return '<font color="black"><b>SUSPENDIDO</b></font>';
   END IF;
   --
   -- obtengo los datos del documento si es que esta presentado
   OPEN cr_compdo (p_comprv_id, p_compdt_id);
   FETCH cr_compdo INTO v_compdo_prv;
   if cr_compdo%NOTFOUND THEN
      return '<font color="red"><b>NO PRESENTADO</b></font>';
   end if;
   CLOSE cr_compdo;
   --
   if P_COMPDT_TIPO_DURACION in ('SIN','NOD') then
     return '<font color="green"><b>VIGENTE</b></font>';
   else
     v_fecha_actual := to_char(trunc(sysdate));
     if nvl(v_compdo_prv.FECHA_VENCIMIENTO, v_fecha_actual + 1) < v_fecha_actual then
        if trunc(sysdate) - trunc(v_compdo_prv.fecha_vencimiento) > 1 then
          return '<font color="red"><b>VENCIDO hace ' || to_char(round(sysdate - v_compdo_prv.fecha_vencimiento,0)) ||' dias</b></font>';
        elsif trunc(sysdate) - trunc(v_compdo_prv.fecha_vencimiento) = 1  then
          return '<font color="red"><b>VENCIDO Ayer</b></font>';
       -- elsif round(sysdate - v_compdo.fecha_vencimiento+1,0) = 0 then
       --   return '<font color="red"><b>VENCIDO Ahora</b></font>';
        end if;
     end if;
   end if;
   --
   RETURN '<font color="green"><b>VIGENTE</b></font>';
end;
FUNCTION OBTN_COMPDO_PDTPRV2
 (P_COMPRV_ID IN NUMBER
 ,P_COMPDT_ID IN NUMBER
 ,P_COMPDE_ID IN NUMBER
 )
 RETURN NUMBER
 IS
-- Obtener el ultimo documento presentado
-- para un proveedor y tipo de documento dado
-- cuyo tipo de documento se encuentre habilitado
-- y cuyo documento se encuentre activo
    cursor cr_dat is
    select max(a1.ID)
    from com_proveedores_doc a1
      ,com_proveedores_dte b1
    where a1.comprv_id = p_comprv_id
    and a1.compdt_id = p_compdt_id
    and a1.compdt_id = b1.compdt_id
    and a1.situacion = 'ACT'
    and b1.id = p_compde_id
    and b1.estado = 'HAB'
    and a1.fecha_vencimiento =(select max(a.fecha_vencimiento)
                                 from com_proveedores_doc a
                                     ,com_proveedores_dte b
                                where a.comprv_id = a1.comprv_id --p_comprv_id
                                  and a.compdt_id = a1.compdt_id --p_compdt_id
                                  and a.compdt_id = b.compdt_id
                                  and a.situacion = 'ACT'
                                  and b.id = b1.id --p_compde_id
                                  and b.estado = 'HAB');
    --
    v_retorno number;
    --
begin
    --
    open cr_dat;
    fetch cr_dat into v_retorno;
    close cr_dat;
    --
    return v_retorno;
end;
/* Obtener el valor de la variable v_comprv */
PROCEDURE COMDMT_GET
 (P_COMDMT OUT COM_DOMICILIOS_TIPOS%ROWTYPE
 )
 IS
BEGIN
  p_comdmt := v_comdmt;
END;
/* Seteo la variable v_comprv */
PROCEDURE COMDMT_SET_CODIGO
 (P_CODIGO IN COM_DOMICILIOS_TIPOS.CODIGO%TYPE
 )
 IS
CURSOR cr_comdmt IS
  SELECT *
  FROM COM_DOMICILIOS_TIPOS
  WHERE CODIGO = p_codigo;
  --
BEGIN
  -- Inicializar la variable
  --COMDMT_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comdmt;
  FETCH cr_comdmt INTO v_comdmt;
  CLOSE cr_comdmt;
  --
END;
/* Seteo la variable v_comprv */
PROCEDURE SET_COMPRV_CUIT
 (P_SEGORG_ID IN COM_PROVEEDORES.SEGORG_ID%TYPE
 ,P_CUIT IN COM_PROVEEDORES.CUIT%TYPE
 )
 IS
CURSOR cr_comprv IS
  SELECT *
  FROM COM_PROVEEDORES COMPRV
  WHERE COMPRV.SEGORG_ID = p_segorg_id
    AND COMPRV.CUIT = p_cuit;
  --
BEGIN
  -- Inicializar la variable
  INI_COMPRV;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comprv;
  FETCH cr_comprv INTO v_comprv;
  CLOSE cr_comprv;
  --
END;
/* Obtener el documento pdf en binario. */
FUNCTION OBTN_COMCON_LLAMADO_DOC_PDF
 (P_SEGORG_ID IN NUMBER
 ,P_COMCON_ID IN NUMBER
 )
 RETURN NUMBER
 IS
--
   v_comcon          com_contrataciones%ROWTYPE;
   v_comped          COM_PEDIDOS%ROWTYPE;
   v_comcot          com_contrataciones_detalles%rowtype;
   v_comctt          com_contrataciones_tipos%ROWTYPE;
   v_string          varchar2(4000);
   v_reportURL       VARCHAR2(255);
   v_blobRef         BLOB;
   v_request         Utl_Http.req;
   v_response        Utl_Http.resp;
   v_data            RAW(32767);
   v_dominio         VARCHAR2(300);
   str_return        VARCHAR2(32767);
   v_comdct_id       number;
   v_comdoc_id       number;
   v_nombre_archivo  varchar2(300);
   v_segorg_codigo   varchar2(100);
   v_comped_id       number;
   --
   cursor cr_segorg is
   select codigo from seg_organizaciones
   where id = p_segorg_id;
   --
   cursor cr_comdct is
   select id from com_documentos_tipos
   where segorg_id = p_segorg_id
   and codigo = 'COM_CONTRATACION';
   --
   cursor cr_comcon is
   select * from com_contrataciones
   where id = p_comcon_id;
   --
   CURSOR cr_comped (p_comped_id number) IS
   SELECT *
   FROM COM_PEDIDOS
   WHERE ID = p_comped_id;
   --
   CURSOR cr_comcot IS
   SELECT *
   FROM COM_CONTRATACIONES_DETALLES
   WHERE COMCON_ID = p_comcon_id;
   --
   cursor cr_comctt (p_comctt_id number) is
   select * from com_contrataciones_tipos
   where id = p_comctt_id;
   --
BEGIN
   --
   -- Validar Organización
   --
   if p_segorg_id is null then
      raise_application_error(-20000,'No se ha especificado el id de Organizacion',true);
   end if;
   -- Validar que existe el pedido
   --
   if p_comcon_id is null then
      raise_application_error(-20000,'El Proceso es un dato obligatorio y no ha sido especificado',true);
   end if;

   --
   -- Obtener el datos del proceso
   --
   OPEN cr_comcon;
   FETCH cr_comcon INTO v_comcon;
   CLOSE cr_comcon;
   --
   -- Validar que existe el proceso
   --
   if v_comcon.id is null then
      raise_application_error(-20000,'El proceso especificado No Existe',true);
   end if;
   --
   OPEN cr_comctt(v_comcon.comctt_id);
   FETCH cr_comctt INTO v_comctt;
   CLOSE cr_comctt;
   --
   if v_comctt.id is null then
      raise_application_error(-20000,'No se ha podido determinar el tipo de Contratación',true);
   end if;
   --
   -- Obtener el código de organización
   --
   OPEN cr_segorg;
   FETCH cr_segorg INTO v_segorg_codigo;
   CLOSE cr_segorg;

   --
   -- Obtener el tipo de documento
   --
   OPEN cr_comdct;
   FETCH cr_comdct INTO v_comdct_id;
   CLOSE cr_comdct;

   --
   -- Validar Tipo de Documento
   --
   if v_comdct_id is null then
      raise_application_error(-20000,'El tipo de Documento Especificado No existe',true);
   end if;
   --
   -- Obtener los datos del Detalle de Contratacion
   --
   OPEN cr_comcot;
   FETCH cr_comcot INTO v_comcot;
   CLOSE cr_comcot;
   --
   -- Validar que existe el detalle
   --
   if v_comcot.id is null then
      raise_application_error(-20000,'No se han encontrado datos del detalle de Contratación',true);
   end if;
   --
   -- Obtener los datos del pedido
   --
   v_comped_id := v_comcot.comped_id;
   OPEN cr_comped(v_comped_id);
   FETCH cr_comped INTO v_comped;
   CLOSE cr_comped;
   --
   -- Validar que existe el pedido
   --
   if v_comped.id is null then
      raise_application_error(-20000,'La solicitud de Gasto especificada No Existe',true);
   end if;
   --
   -- Recogemos la referencia del BLOB
   --
   v_nombre_archivo := 'ACTIVACION DE PROCESO DE CONTRATACION '||'N°: ' || v_comcon.codigo || '/' ||  v_comped.ejercicio || ' - ' || v_comctt.NOMBRE ;
   --
   SELECT COMDOC_ID.NEXTVAL INTO v_comdoc_id FROM DUAL;
   --
   INSERT INTO com_documentos (ID, COMDCT_ID, DOCUMENTO, NOMBRE_ARCHIVO, TIPO_ARCHIVO)
   VALUES (v_comdoc_id, v_comdct_id, Empty_Blob(), v_nombre_archivo , 'application/pdf')
   RETURNING DOCUMENTO INTO v_blobRef;

   --
   -- Recogemos el fichero PDF del APEX simulando una
   -- llamada al informe desde el navegador
   --
   begin
      --
      v_dominio := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo    => 'DOMINIO_SERVIDOR_REPORTES'
                                            ,p_segorg_id => p_segorg_id);
      --
      -- Construimos la URL para llamar al report
      --
      v_reportURL := 'http://' || trim(v_dominio) || '/f?p=INFCOM:' || '1082' || ':' || v('APP_SESSION')  || '::NO:1062:P1_SEGORG_CODIGO,P1062_COMCON_ID,P1062_SEGORG_ID:' || v_segorg_codigo || ',' || p_comcon_id|| ',' || p_segorg_id;
      dbms_output.put_line('v_reportURL=' || v_reportURL);
      -- Invocamos el reporte
      v_request  := Utl_Http.begin_request(v_reportUrl, 'GET');

      -- Obtenemos la respuesta
      v_response := Utl_Http.get_response(v_request);
      --
   exception
     when sys.utl_http.request_failed then
       return sys.utl_http.GET_DETAILED_SQLERRM;
   end;
   LOOP
      BEGIN
         --
         -- leemos la siguiente porcion de datos binarios
         --
         begin
            Utl_Http.read_raw(v_response, v_data, 32767);
         exception
            when sys.utl_http.request_failed then
               return sys.utl_http.GET_DETAILED_SQLERRM;
         end;
         v_string := v_string || TO_CHAR(UTL_RAW.length(v_data)) ;
         --
         -- y la añadimos a nuestro BLOB para el fichero PDF
         --
         Dbms_Lob.writeAppend ( lob_loc => v_blobRef
                              , amount  => Utl_Raw.length(v_data)
                              , buffer  => v_data
                              );
      EXCEPTION WHEN Utl_Http.END_OF_BODY THEN
         EXIT;
      END;
   END LOOP;

   Utl_Http.end_response(v_response);
   --
   return v_comdoc_id;
   --
exception when others then
   raise_application_error(-20000,'Error al obtener Documento : ' || sqlerrm, true);
end;
PROCEDURE COMCON_LLAMADO_TRANSMITIR
 (P_SEGORG_ID IN NUMBER
 ,P_COMCON_ID IN NUMBER
 ,P_INTENV_ID OUT NUMBER
 )
 IS
-----------------------------------------------------------------------------------
   --
   -- Argumentos
   -- p_segorg_id => Organizacion
   -- p_comcon_id => Id del Proceso
   --
   -----------------------------------------------------------------------------------
   --
   cursor cr_comcon (p_comcon_id number) is
   select *
   from COM_CONTRATACIONES comcon
   where comcon.id = p_comcon_id;
   --
   cursor cr_comcot IS
   select *
   from COM_CONTRATACIONES_DETALLES
   where COMCON_ID = p_comcon_id;
   --
   cursor cr_comcod is
   select *
   from COM_CONTRATACIONES_DOC
   where comcon_id = p_comcon_id;
   --
   cursor cr_conf is
   select valor
   from SEG_CONFIGURACIONES
   where segorg_id = P_SEGORG_ID
   and codigo = 'COMCON_SRVINT_TRAMIX_HABILITADO_SN';
   --
   cursor cr_comdct is
   select id
   from COM_DOCUMENTOS_TIPOS
   where segorg_id = p_segorg_id
   and codigo = 'COM_CONTRATACION';
   --
   cursor cr_comctt (p_comctt_id number) is
   select *
   from COM_CONTRATACIONES_TIPOS
   where id = p_comctt_id;
   --
   cursor cr_comped (p_comped_id number) IS
   select *
   from COM_PEDIDOS
   where ID = p_comped_id;
   --
   v_habilitado         varchar2(10);
   v_comcdg             com_contrataciones_docgen%rowtype;
   v_comcod             com_contrataciones_doc%rowtype;
   v_comcot             com_contrataciones_detalles%rowtype;
   v_intenv             int_envios%rowtype;
   v_comcoe             com_contrataciones_est%ROWTYPE;
   v_comcoe_tmp         com_contrataciones_est%ROWTYPE;
   v_comctt             com_contrataciones_tipos%ROWTYPE;
   v_intori             int_origenes%ROWTYPE;
   v_intdes             int_destinos%ROWTYPE;
   v_inttpo             int_tipos_objetos%ROWTYPE;
   v_intene             int_envios_est%ROWTYPE;
   v_comcon             com_contrataciones%rowtype;
   v_comped             COM_PEDIDOS%ROWTYPE;
   v_respuesta_ws       varchar2(2000);
   v_respuesta_ws_adj   varchar2(2000);
   v_resultado_ws       varchar2(2000);
   v_resultado_ws_adj   varchar2(2000);
   v_motivo             varchar2(2000);
   v_referencia         varchar2(2000);
   v_referencia_adj     varchar2(2000);
   v_actuacion_identif  varchar2(2000);
   v_aprobar            varchar2(2);
   v_inttpo_id          number;
   v_intori_id          number;
   v_intdes_id          number;
   v_intene_id          number;
   v_comcdg_id          number;
   v_comdct_id          number;
   v_intenv_id          number;
   v_cantidad_adjuntos  number;
   v_documento_id       number;
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
      if v_comcoe.estado <> 'ACT' then
         raise_application_error(-20000,'El proceso de contratacion No se encuentra Activo',true);
      end if;

      --
      for v_conf in cr_conf loop
         if v_conf.valor = 'SI' then
            v_habilitado := 'SI';
         else
            v_habilitado := 'NO';
         end if;
      end loop;
      dbms_output.put_line('v_habilitado = ' || v_habilitado);
      --
      -- Si la Integracion no esta habilitada entonces error.
      --
      if v_habilitado = 'NO' then
         raise_application_error(-20000,'La integracion No se encuentra Habilitada',true);
      end if;
      --
      -- Obtener el tipo de documento
      --
      OPEN cr_comdct;
      FETCH cr_comdct INTO v_comdct_id;
      CLOSE cr_comdct;
      --
      if v_comdct_id is null then
         raise_application_error(-20000,'No se ha podido determinar el tipo de documento del Proceso de Contratación',true);
      end if;
      --
      open cr_comcon(p_comcon_id);
      fetch cr_comcon into v_comcon;
      close cr_comcon;
      --
      if v_comcon.id is null then
         raise_application_error(-20000,'No se han podido obtener los datos del Proceso de Contratación',true);
      end if;
      --
      OPEN cr_comctt(v_comcon.comctt_id);
      FETCH cr_comctt INTO v_comctt;
      CLOSE cr_comctt;
      --
      if v_comctt.id is null then
         raise_application_error(-20000,'No se ha podido determinar el tipo de Contratación',true);
      end if;
      --
      -- Obtener los datos del Detalle de Contratacion
      --
      OPEN cr_comcot;
      FETCH cr_comcot INTO v_comcot;
      CLOSE cr_comcot;
      --
      -- Validar que existe el detalle
      --
      if v_comcot.id is null then
         raise_application_error(-20000,'No se han encontrado datos del detalle de Contratación',true);
      end if;
      --
      -- Obtener los datos del pedido
      --
      v_comped_id := v_comcot.comped_id;
      OPEN cr_comped(v_comped_id);
      FETCH cr_comped INTO v_comped;
      CLOSE cr_comped;
      --
      -- Validar que existe el pedido
      --
      if v_comped.id is null then
         raise_application_error(-20000,'La solicitud de Gasto especificada No Existe',true);
      end if;
      --
      -- 1. Generar y Grabar el Documento
      --
      --v_documento_id := com_pkg.obtn_comcon_doc_pdf(p_segorg_id => p_segorg_id
      v_documento_id := com_pkg.obtn_comcon_llamado_doc_pdf(p_segorg_id => p_segorg_id
                                                   ,p_comcon_id => p_comcon_id);
      if v_documento_id is null then
         raise_application_error(-20000,'No se ha podido generar el Documento del Proceso de Contratación',true);
      end if;
      --
      -- 2. Grabar referencia Proceso de Contratacion-Documento Generado
      --
      begin
         SELECT COMCDG_ID.NEXTVAL INTO v_comcdg_id FROM DUAL;
         v_comcdg.ID        := v_comcdg_id;
         v_comcdg.COMCON_ID := p_comcon_id;
         v_comcdg.COMDOC_ID := v_documento_id;
         v_comcdg.COMDCT_ID := v_comdct_id;
         v_comcdg.FECHA     := sysdate;
         COM_PKG.COMCDG_INS(p_comcdg => v_comcdg);
      EXCEPTION WHEN others THEN
         raise_application_error(-20000,'No se ha podido generar el registro de referencia Proceso de Contratacion-Documento Generado',true);
      END;
      dbms_output.put_line('v_comcdg_id = ' || v_comcdg_id);
      if v_comcdg_id is null then
         raise_application_error(-20000,'No se ha podido generar el registro de referencia Proceso de Contratacion-Documento Generado',true);
      end if;
      --
      -- 3. Transmitir el Documento al WebService
      --
      v_actuacion_identif := 'ACTPRO' || '-' || 'ACTIVACION DE PROCESO DE CONTRATACION ' ||' N°: ' || v_comcon.codigo || '/' ||  v_comped.ejercicio || ' - ' || v_comctt.NOMBRE ;
      dbms_output.put_line('v_actuacion_identif = ' || v_actuacion_identif);
      --
      v_respuesta_ws := COM_PKG.COMCON_INVOCAR_WS(p_comcdg_id         => v_comcdg_id
                                                , p_actuacion_identif => v_actuacion_identif
                                                , p_valida            => 1);
      dbms_output.put_line('v_respuesta_ws = ' || v_respuesta_ws);

      update com_contrataciones_docgen
      set xml_enviado = xml_enviado || chr(13) || chr(10) || to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss') || chr(13) || chr(10) || v_respuesta_ws
      where id = v_comcdg_id;

      --
      -- 4. Parseamos el resultado del Webservice
      --
      COM_PKG.COMCON_PROC_XML_ACT(p_xml       => v_respuesta_ws
                                 ,p_segorg_id => p_segorg_id
                                 ,p_resultado => v_resultado_ws
                                 ,p_motivo    => v_motivo
                                 ,p_referencia=> v_referencia);
      --
      IF v_resultado_ws = 'ERROR' THEN
         raise_application_error(-20000,'No se ha podido interpretar el mensaje de respuesta.',true);
      END IF;
      ----------------------------------------------------------
      -- 5. Grabar Log en Envíos
      ----------------------------------------------------------
      INT_PKG.INTTPO_SET_CODIGO(p_segorg_id => p_segorg_id
                               ,p_codigo    => 'COMCON_ACTUACION');
      INT_PKG.INTTPO_GET(p_inttpo => v_inttpo);
      if v_inttpo.id is null then
         raise_application_error(-20000,'El codigo de tipo de objeto COMCON_ACTUACION no se encuentra configurado',true);
      end if;
      v_inttpo_id := v_inttpo.id;
      --
      INT_PKG.INTENV_REGISTRAR(
                     P_INTTPO_ID     => v_inttpo_id
                    ,P_INTENV_OBJETO => '<comdoc_id>'    || v_documento_id || '</comdoc_id>'
                    ,P_INTENV_OBS    => v_respuesta_ws
                    ,P_INTENV_RES    => '<return>'       || v_resultado_ws || '<return>'        ||
                                        '<actuacion_id>' || v_referencia   || '</actuacion_id>'
                    ,P_INTENE_FECHA  => sysdate
                    ,P_INTENV_ID     => v_intenv_id
      );
      --
      --
      -- 6. Si la Actuacion principal se inserto correctamente
      --    entonces vamos a verificar si tiene adjuntos
      --
      --
      IF instr(v_resultado_ws,'OP_COMPLETED') > 0 THEN
          v_aprobar := 'SI';
            --
            -- 8.A Modificar Estado del Envio a ENVIADO
            --
            SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
            v_intene.ID            := v_intene_id;
            v_intene.INTENV_ID     := v_intenv_id;
            v_intene.FECHA         := sysdate;
            v_intene.ESTADO        := 'ENV';
            v_intene.MOTIVO_ESTADO := v_motivo;
            INT_PKG.INTENE_INS(p_intene => v_intene);
            --
      ELSE -- Devuelve distinto de OP_COMPLETED
         --
         -- 8.B Modificar Estado del Envio ERROR
         --
         SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
         v_intene.ID            := v_intene_id;
         v_intene.INTENV_ID     := v_intenv_id;
         v_intene.FECHA         := sysdate;
         v_intene.ESTADO        := 'ERR';
         v_intene.MOTIVO_ESTADO := v_motivo;
         INT_PKG.INTENE_INS(p_intene => v_intene);
         --
      END IF;
      --
      p_intenv_id := v_intenv_id;
      --
EXCEPTION WHEN others THEN
   raise_application_error(-20000,'No se ha podido enviar correctamente los documentos del Proceso de Contratación',true);
END;
/* Generación de Adjudicacion */
PROCEDURE COMADJ_GENERACION
 (P_COMCON_ID IN COM_CONTRATACIONES.ID%TYPE
 ,P_COMADJ_ID OUT COM_ADJUDICACIONES.ID%TYPE
 )
 IS
-- Comentado debido a que permitia la duplicacion de adjudicaciones en el caso de que
 -- uno o mas proveedores coincidieran con el menor ranking en la cotizacion para el detalle
 -- de un pedido
 -- 17-JUN-2013


/*-- Declaración de Cursores
 -- Obtiene los pedidos de una contratacion
 cursor cr_comcot is
   select COMPED_ID
   from   COM_CONTRATACIONES_DETALLES COMCOT
   where  COMCON_ID = p_comcon_id;
 -- Obtiene los detalles de un pedido
 cursor cr_compet (p_comped_id in number) is
   select COMPET.ID
         ,COMPET.CANTIDAD
         ,COM_PKG.OBTN_COMPET_SALDO(COMPET.ID) CANTIDAD_PENDIENTE
   from   COM_PEDIDOS_DETALLES COMPET
   where  COMPET.COMPED_ID = p_comped_id;
 -- Obtener la cotización de menor ranking presentada en
 -- un proceso de contratación para el detalle de un pedido
 cursor cr_comczd (p_compet_id in number) is
 select COMCZD.ID
 from   COM_COTIZACIONES_DETALLES COMCZD
       ,COM_COTIZACIONES COMCTZ
 where  COMCTZ.ID = COMCZD.COMCTZ_ID
 and    COMCTZ.COMCON_ID = p_comcon_id
 and    COMCZD.COMPET_ID = p_compet_id
 and    COMCTZ.SITUACION = 'PRE'
 and    COMCZD.PRECIO_UNITARIO_FINAL > 0
 and    COMCZD.EVALUACION = 1;
 --
 -- Obtiene los pedidos de una contratacion
 cursor cr_comadj is
   select 1
   from   COM_ADJUDICACIONES COMADJ
   where  COMADJ.COMCON_ID = p_comcon_id
     and  COMADJ.SITUACION <> 'ANU';
 -- Declaracion de Variables
 v_comadj COM_ADJUDICACIONES%ROWTYPE;
 v_ctz_preadj number;
 v_cr_comadj number;
-- Cuerpo del Proceso
begin
  -- Obtener Adjuducaciones Generadas
  open cr_comadj;
  fetch cr_comadj into v_cr_comadj;
  close cr_comadj;
  --
  if nvl(v_cr_comadj,0) = 0 then
    -- Generar la Cabecera de la Adjudicacion
    select COMADJ_ID.nextval
    into p_comadj_id
    from DUAL;
    --
    v_comadj.ID               := p_comadj_id;
    v_comadj.COMCON_ID        := p_comcon_id;
    v_comadj.FECHA_GENERACION := sysdate;
    v_comadj.OBSERVACION      := '';
    v_comadj.SITUACION        := 'NUE';
    --  Insertar la cabecera de la Adjudicacion
    COM_PKG.INS_COMADJ(p_comadj => v_comadj);
    --
    -- Recorrer los pedidos incluidos en la Contratacion
    for v_comcot in cr_comcot loop
      -- Por cada Pedido, recorrer sus detalles
      for v_compet in cr_compet (p_comped_id => v_comcot.COMPED_ID) loop
        -- Incorporar cada detalle a la adjudicacion
        declare
          v_comadd COM_ADJUDICACIONES_DET%ROWTYPE;
        begin
          v_comadd.COMADJ_ID  := v_comadj.ID;
          v_comadd.COMPET_ID  := v_compet.ID;
          -- Obtener la Cotización de Ranking 1 para sugerirla como adjudicada
          open cr_comczd(p_compet_id => v_comadd.COMPET_ID);
          fetch cr_comczd into v_comadd.COMCZD_ID;
          close cr_comczd;
          -- Si existe una cotización adjudicada, asignar el saldo de la cantidad pendiente como cantidad adjudicada
          if v_comadd.COMCZD_ID is not null then
            v_comadd.CANTIDAD_ADJUDICADA := v_compet.CANTIDAD_PENDIENTE;
          end if;
          v_comadd.SITUACION  := 'PEN';
          -- Inserto en COM_ADJUDICACIONES_DET
          COM_PKG.INS_COMADD(p_comadd => v_comadd);
        end;
      end loop;
    end loop;
  end if;
end;*/

   -- Permite bloquear el registro de la contratacion a la que se esta accediendo de modo
   -- que ningun otro proceso puede modificarlo durante la ejecucion de este proceso.
   cursor cr_lock is
     select ID
     from   COM_CONTRATACIONES comcon
     where   ID = p_comcon_id
     for update of ID nowait;
   -- Obtener los pedidos del proceso
   cursor cr_comcot is
     select comped_id
     from   COM_CONTRATACIONES_DETALLES comcot
     where  comcot.COMCON_ID = p_comcon_id;
   -- Obtener los detalles del pedido
   cursor cr_compet(p_comped_id number) is
     select compet.ID
           ,compet.CANTIDAD
           ,com_pkg.OBTN_COMPET_SALDO(p_compet_id => compet.ID) CANTIDAD_PENDIENTE
     from   COM_PEDIDOS_DETALLES compet
     where  compet.COMPED_ID = p_comped_id;
   -- Obtener la mejor cotizacion presentada para el detalle de un pedido
   cursor cr_comctz (p_compet_id number) is
     select min(comczd.id) id
     from COM_COTIZACIONES_DETALLES comczd
         ,COM_COTIZACIONES comctz
     where comctz.ID = comczd.COMCTZ_ID
     and comctz.COMCON_ID = p_comcon_id
     and comczd.COMPET_ID = p_compet_id
     and comctz.SITUACION = 'PRE'
     and comczd.PRECIO_UNITARIO_FINAL > 0
     and comczd.EVALUACION = 1;
 --
   v_comadj COM_ADJUDICACIONES%rowtype;
   v_dummy number;
begin
   --
   COM_PKG.COMADJ_GENERACION_VLD(p_comcon_id => p_comcon_id);
   -- Bloquear el registro para inciar el proceso
   open cr_lock;
   fetch cr_lock into v_dummy;
   close cr_lock;
   -- Generar la cabecera de una adjudicacion
   p_comadj_id := COMADJ_ID.nextval;
   --
   v_comadj.ID := p_comadj_id;
   v_comadj.COMCON_ID := p_comcon_id;
   v_comadj.FECHA_GENERACION := sysdate;
   v_comadj.SITUACION := 'NUE';
   --
   COM_PKG.INS_COMADJ(p_comadj => v_comadj);
   -- Generar el detalle de la adjudicación
   for v_comcot in cr_comcot loop
     --
     for v_compet in cr_compet(p_comped_id => v_comcot.comped_id) loop
       declare
         v_comadd COM_ADJUDICACIONES_DET%rowtype;
       begin
         v_comadd.COMADJ_ID := v_comadj.ID;
         v_comadd.COMPET_ID := v_compet.ID;
         v_comadd.SITUACION := 'PEN';
         --
         open cr_comctz(p_compet_id => v_compet.id);
         fetch cr_comctz into v_comadd.COMCZD_ID;
         close cr_comctz;
         -- Si existe cotización adjudicada, asignar la cantidad pendiente como adjudicada
         if v_comadd.COMCZD_ID is not null then
           v_comadd.CANTIDAD_ADJUDICADA := v_compet.CANTIDAD_PENDIENTE;
         end if;
         --
         COM_PKG.INS_COMADD(p_comadd => v_comadd);
         --
       end;
     end loop;
     --
   end loop;
 end;
/* Valida la generacion de las adjudicaciones */
PROCEDURE COMADJ_GENERACION_VLD
 (P_COMCON_ID IN NUMBER
 )
 IS
-- Obtener las adjudicaciones generadas previamente que no se encuentran anuladas
  cursor cr_comadj is
    select 1
    from   COM_ADJUDICACIONES
    where  comcon_id = p_comcon_id
    and    situacion <> 'ANU';
  --
  v_comcon COM_CONTRATACIONES%rowtype;
  v_dummy number;
begin
  -- validar los datos obligatorios
  if p_comcon_id is null then
    raise_application_error(-20000, 'El identificador del Proceso es un parametro obligatorio y no ha sido indicado.', true);
  end if;
  -- Verificar el parametro proporcionado
  COM_PKG.SET_COMCON(p_comcon_id => p_comcon_id);
  COM_PKG.GET_COMCON(p_comcon => v_comcon);
  COM_PKG.INI_COMCON;
  --
  if v_comcon.ID is null then
    raise_application_error(-20000, 'El identificador del Proceso: '||to_char(p_comcon_id)||' es incorrecto.', true);
  end if;
  --
  open cr_comadj;
  fetch cr_comadj into v_dummy;
  if cr_comadj%found then
    close cr_comadj;
    raise_application_error(-20000, 'El Proceso: '||to_char(p_comcon_id)||' ya posee adjudicaciones generadas', true);
  end if;
  close cr_comadj;
  --
end;
/* . Suma las adjudicaciones según el estado indicado */
FUNCTION OBTN_COMADJ_SUMA
 (P_COMCON_ID IN NUMBER
 ,P_SITUACION IN VARCHAR2
 )
 RETURN INTEGER
 IS
cursor cr_comadd is
  select sum(comadd.CANTIDAD_ADJUDICADA) SUMA
  from   COM_ADJUDICACIONES_DET comadd
        ,COM_ADJUDICACIONES     comadj
        ,COM_PEDIDOS_DETALLES   compet
  where COMADD.COMADJ_ID = comadj.ID
  and   comadd.COMPET_ID = compet.ID
  and   comadj.COMCON_ID = p_comcon_id
  and   comadd.SITUACION = p_situacion;
--
  v_dummy number;
begin
  open cr_comadd;
  fetch cr_comadd into v_dummy;
  close cr_comadd;
  --
  return v_dummy;
end;
/* Crear Responsable de Contratantes */
PROCEDURE COMCCR_CREAR
 (P_SEGORG_CODIGO IN SEG_ORGANIZACIONES.CODIGO%TYPE
 ,P_COMECC_ID IN COM_CONTRATANTES_CAT.ID%TYPE
 ,P_SEGUSU_ID OUT NUMBER
 ,P_SEGUSU_USUARIO IN SEG_USUARIOS.USUARIO%TYPE
 ,P_RESULTADO OUT VARCHAR2
 ,P_SEGUSU_CONTRASENIA IN SEG_USUARIOS.CONTRASENIA%TYPE
 ,P_SEGPRS_TIPO_DOCUMENTO IN COM_RESPONSABLES.TIPO_DOCUMENTO%TYPE
 ,P_SEGPRS_NUMERO_DOCUMENTO IN COM_RESPONSABLES.NUMERO_DOCUMENTO%TYPE
 ,P_SEGPRS_NOMBRE IN COM_RESPONSABLES.NOMBRE%TYPE
 ,P_SEGPRS_EMAIL IN COM_RESPONSABLES.EMAIL%TYPE
 ,P_SEGPRS_OBSERVACIONES IN COM_RESPONSABLES.OBSERVACION%TYPE
 ,P_SEGPFL_CODIGO IN SEG_PERFILES.CODIGO%TYPE
 ,P_SEGAPL_CODIGO IN SEG_APLICACIONES.CODIGO%TYPE
 ,P_COMRST_ID IN COM_RESPONSABLES_TIPOS.ID%TYPE
 ,P_COMRES_ID IN NUMBER := NULL
 )
 IS
-- Declaración de Variables
  v_segorg SEG_ORGANIZACIONES%ROWTYPE;
  v_segusu SEG_USUARIOS%ROWTYPE;
  v_comres COM_RESPONSABLES%ROWTYPE;
  v_comccr COM_CONTRATANTES_CATRES%ROWTYPE;
  v_segpus SEG_PERFILES_USUARIOS%ROWTYPE;
  v_segpfl SEG_PERFILES%ROWTYPE;
BEGIN
   p_resultado := NULL;
   -- Si se pasa la organizacion Obtener el id de la organización
   IF p_segorg_codigo IS NOT NULL THEN
    SEG_PKG.SET_SEGORG_CODIGO(p_codigo => p_segorg_codigo);
    SEG_PKG.GET_SEGORG(v_segorg);
    IF v_segorg.ID IS NULL THEN
       p_resultado := 'El Codigo de Organización no corresponde a una Organización existente';
    END IF;
   ELSE
    -- Si no se pasa la organización, Obtener el id de la organizacion del usuario
    SEG_PKG.SET_SEGUSU_USUARIO(p_USUARIO => v('APP_USER'));
    SEG_PKG.GET_SEGUSU(v_segusu);
    SEG_PKG.SET_SEGORG(p_id => v_segusu.segorg_id);
    SEG_PKG.GET_SEGORG(v_segorg);
    IF v_segorg.ID IS NULL THEN
       p_resultado := 'El Codigo de Organización del Usuario Conectado no corresponde a una Organización existente';
    END IF;
   --
  END IF;
   -- Crear el Usuario (1)  -> v_resultado, v_segusu_id (2)
   IF p_resultado IS NULL THEN
    SEG_PKG.SEGUSU_CREAR(
      p_segusu_usuario          => p_segusu_usuario
     ,p_segusu_contrasenia      => p_segusu_contrasenia
     ,p_segprs_observaciones    => p_segprs_observaciones
     ,p_segprs_nombre           => p_segprs_nombre
     ,p_segprs_email            => p_segprs_email
     ,p_segprs_tipo_documento   => p_segprs_tipo_documento
     ,p_segprs_numero_documento => p_segprs_numero_documento
     ,p_segorg_id               => v_segorg.ID
     ,p_segrol_codigo           => NULL
     ,p_segapl_codigo           => p_segapl_codigo
     ,p_resultado               => p_resultado -- SALIDA
     ,p_segusu_id               => p_segusu_id -- SALIDA
     );
    -- Crear el Responsable (2) -> p_comorr_id
    -- Asigno Perfil al Usuario
    IF p_segusu_id IS NOT NULL THEN
     IF p_segpfl_codigo IS NOT NULL THEN
        SEG_PKG.SET_SEGPFL_CODIGO(p_segpfl_codigo => p_segpfl_codigo);
        SEG_PKG.GET_SEGPFL(v_segpfl);
        IF v_segpfl.ID IS NULL THEN
            p_resultado := p_resultado||' El Perfil que intenta asignar al Responsable no Existe en la Organización.';
        ELSE
            v_segpus.SEGPFL_ID      := v_segpfl.ID;
            v_segpus.SEGUSU_ID      := p_segusu_id;
            v_segpus.FECHA_VIGENCIA := SYSDATE;
            v_segpus.FECHA_VALIDEZ  := NULL;
            SEG_PKG.INS_SEGPUS(P_SEGPUS => V_SEGPUS);
        END IF;
     END IF;
     IF p_comres_id IS NOT NULL THEN
        COM_PKG.SET_COMRES(p_id => p_comres_id);
        COM_PKG.GET_COMRES(p_comres => v_comres);
        COM_PKG.INI_COMRES;
     END IF;
     IF v_comres.ID IS NULL THEN
      -- Defino valores del Responsable
      SELECT COMRES_ID.NEXTVAL INTO v_comres.ID FROM DUAL;
      v_comres.COMRST_ID        := P_COMRST_ID;
      v_comres.TIPO_DOCUMENTO   := p_segprs_tipo_documento;
      v_comres.NUMERO_DOCUMENTO := p_segprs_numero_documento;
      v_comres.NOMBRE           := p_segprs_nombre;
      v_comres.EMAIL            := p_segprs_email;
      v_comres.OBSERVACION      := p_segprs_observaciones;
      -- Inserto el Responsable
      COM_PKG.INS_COMRES(p_comres => v_comres);
      --
     END IF;
     --
     COM_PKG.SET_COMCCR_RESP( p_comres_id => v_comres.ID
                             ,p_segusu_id => p_segusu_id
                             ,p_comecc_ID => p_comecc_ID );
     COM_PKG.GET_COMCCR(v_comccr);
    IF v_comccr.id IS NOT NULL THEN
       p_resultado := p_resultado||' El Responsable ya existe Activo.';
    ELSE
    --
    -- Defino valores del Responsable-Contratante
    v_comccr.COMECC_ID      := p_comecc_ID;
    v_comccr.COMRES_ID      := v_comres.ID;
    v_comccr.SEGUSU_ID      := p_segusu_id;
    v_comccr.SITUACION      := 'ACT';
    v_comccr.FECHA_VIGENCIA := SYSDATE;
    v_comccr.FECHA_VALIDEZ  := NULL;
    -- Inserto el Responsable-Contratante
    COM_PKG.INS_COMCCR(p_comccr => v_comccr);
    --
    END IF; --DEL CREAR RESPONSABLE
   END IF; -- DEL CREAR USUARIO
  END IF;
END;
/* Reactivar Responsable. */
PROCEDURE COMCCR_REACTIVAR
 (P_RESULTADO OUT VARCHAR2
 ,P_COMCCR_ID IN COM_CONTRATANTES_CATRES.ID%TYPE
 )
 IS
v_comccr COM_CONTRATANTES_CATRES%ROWTYPE;
BEGIN
  p_resultado := NULL;
  COM_PKG.SET_COMCCR(p_id => p_comccr_id);
  COM_PKG.GET_COMCCR(v_comccr);
  IF v_comccr.ID IS NULL THEN -- Si el Responsable no existe
    p_resultado :='El Responsable no EXISTE !';
  ELSE IF v_comccr.SITUACION = 'ACT' THEN -- Si el Responsable esta Activo
         p_resultado :='El Responsable esta Activo !';
       ELSE
         UPDATE COM_CONTRATANTES_CATRES
         SET SITUACION      = 'ACT',
             FECHA_VALIDEZ = NULL
         WHERE ID = v_comccr.ID;
         -- REACTIVAR EL USUARIO QUE SE CORRESPONDE AL RESPONSABLE
         SEG_PKG.SEGUSU_REACTIVAR( p_segusu_id => v_comccr.SEGUSU_ID,
                                   p_resultado => p_resultado );
       END IF;
  END IF;
END;
/* Suspender Responsable. */
PROCEDURE COMCCR_SUSPENDER
 (P_RESULTADO OUT VARCHAR2
 ,P_COMCCR_ID IN COM_CONTRATANTES_CATRES.ID%TYPE
 )
 IS
v_comcnr COM_CONTRATANTES_CATRES%ROWTYPE;
BEGIN
  p_resultado := NULL;
  COM_PKG.SET_COMCCR(p_id => p_comccr_id);
  COM_PKG.GET_COMCCR(v_comccr);
  IF v_comccr.ID IS NULL THEN -- Si el Responsable no existe
    p_resultado :='El Responsable no EXISTE !';
  ELSE IF v_comccr.SITUACION = 'SUS' THEN -- Si el Responsable esta Dado de Baja
         p_resultado :='El Responsable esta Suspendido !';
       ELSE
         UPDATE COM_CONTRATANTES_CATRES
         SET SITUACION      = 'SUS',
             FECHA_VALIDEZ = SYSDATE
         WHERE ID = v_comccr.ID;
         -- SUSPENDER EL USUARIO QUE SE CORRESPONDE AL RESPONSABLE
         SEG_PKG.SEGUSU_SUSPENDER( p_segusu_id => v_comccr.SEGUSU_ID,
                                   p_resultado => p_resultado );
       END IF;
  END IF;
END;
/* Inicializar la Calificación */
PROCEDURE COMCLF_INIC
 (P_COMOCM_ID IN COM_ORDENES_COMPRAS.ID%TYPE
 ,P_COMCLF_ID OUT COM_CALIFICACIONES.ID%TYPE
 )
 IS
cursor cr_comoce_fecha is
   select min(fecha) fecha
     from com_ordenes_compras_est
    where comocm_id = p_comocm_id
      and estado = 'APR'
      and situacion = 'VAL';

/*cursor cr_comctt (p_comcon_id number) is
  select comctt.limite_max_calificar dias
  from com_contrataciones_tipos comctt
  where comctt.id = (select comcon.comctt_id
                      from com_contrataciones comcon
                     where comcon.id = p_comcon_id);  */

--v_comctt        cr_comctt%ROWTYPE;
v_comoce_fecha  cr_comoce_fecha%ROWTYPE;
v_comclf_crear  COM_CALIFICACIONES%ROWTYPE;
v_comocm        COM_ORDENES_COMPRAS%ROWTYPE;
v_comped        COM_PEDIDOS%ROWTYPE;
v_comcmo_id     NUMBER;
v_plazo_max     NUMBER;
--
BEGIN
   -- Validar datos obligatorios
   IF p_comocm_id is null THEN
    raise_application_error(-20000,'La Orden de Provision no ha sido indicada y es un dato obligatorio',true);
   END IF;
  /* -- Obtener la fecha de la primera aprobación de la orden
   open cr_comoce_fecha;
   fetch cr_comoce_fecha into v_comoce_fecha;
   close cr_comoce_fecha;    */
   --
   SET_COMOCM(p_id => p_comocm_id);
   GET_COMOCM(p_comocm => v_comocm);
   --
   SET_COMPED(p_id => v_comocm.comped_id);
   GET_COMPED(p_comped => v_comped);
   --
  /* -- Obtener maximo de dias para calificar, establecidos en el tipo de contratación
   open cr_comctt(p_comcon_id => v_comocm.comcon_id);
   fetch cr_comctt into v_comctt;
   close cr_comctt;

   --
   if v_comctt.dias is null then
        --Obtener el máximo de días para calificar
        v_plazo_max := SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => 'COMADM_OCMGES_PLAZO_MAX_CLF'
                                            ,P_SEGORG_ID => v_comocm.segorg_id);
   else
        v_plazo_max := v_comctt.dias;
   end if;
   --Colocar la fecha máxima de calificación en la orden
   update com_ordenes_compras
   set FECHA_MAX_CALIFICACION = (v_comoce_fecha.fecha + v_plazo_max)
   WHERE id = p_comocm_id;
   --*/

   -- Insertar registro en COM_CALIFICACIONES
   SELECT COMCLF_ID.NEXTVAL INTO v_comclf_crear.ID FROM DUAL;
   v_comclf_crear.SEGORG_ID   := v_comocm.segorg_id;
   v_comclf_crear.COMOCM_ID   := p_comocm_id;
   v_comclf_crear.COMPRV_ID   := v_comocm.comprv_id;
   v_comclf_crear.COMECO_ID   := v_comped.comeco_id;
   v_comclf_crear.TIPO        := 'PRV';
   v_comclf_crear.CALIFICACION:= null;
   v_comclf_crear.COMENTARIO  := null;
   v_comclf_crear.SITUACION   := 'NUE';
   v_comclf_crear.FECHA       := SYSDATE;
   --
   INS_COMCLF(p_comclf => v_comclf_crear);
   --
   -- Creamos los Motivos la la Calificacion
   COMCMO_CREAR(p_comclf_id => v_comclf_crear.ID
               ,p_comcmo_id => v_comcmo_id);
   --
   -- Asigno parametros de salida
   p_comclf_id := v_comclf_crear.ID;
   --
END;
/* Generar Orden de Provision */
PROCEDURE COMCLF_ANULAR
 (P_COMCLF_ID IN COM_CALIFICACIONES.ID%TYPE
 )
 IS
-- Obtener el detalle de las ordenes de compra GENERADAS para la adjudicacion indicada
cursor cr_comadd(p_comadj_id number, p_comocm_id number) is
  select comadd.ID
  from COM_ADJUDICACIONES_DET  comadd
      ,COM_ADJUDICACIONES      comadj
      ,COM_ORDENES_COMPRAS     comocm
      ,COM_ORDENES_COMPRAS_DET comocd
  where comadd.COMADJ_ID = p_comadj_id
  and   comadd.SITUACION = 'ANU'
  and   comadd.COMADJ_ID = comadj.ID
  and   comocm.COMADJ_ID = comadj.ID
  and   comocm.ID =  p_comocm_id
  and   comocm.ID = comocd.COMOCM_ID
  and   comocd.COMADD_ID = comadd.ID;

-- Obtener la Prórroga asociada a la Calificación
   cursor cr_comclp is
    select id
    from com_calificaciones_pro comclp
    where comclp.comclf_id = p_comclf_id;

-- Declaración de Variables
v_comclf       COM_CALIFICACIONES%ROWTYPE;
v_comoce_crear COM_ORDENES_COMPRAS_EST%rowtype;
v_comocm       COM_ORDENES_COMPRAS%rowtype;
v_comclp_id    number(15);
--
BEGIN
   -- Validar datos obligatorios
   IF p_comclf_id is null THEN
    raise_application_error(-20000,'El Identificador de la Calificación no ha sido indicada y es un dato obligatorio',true);
   END IF;
   --
   -- Cargar registro en COM_CALIFICACIONES
   COM_PKG.SET_COMCLF(p_id => p_comclf_id);
   COM_PKG.GET_COMCLF(p_comclf => v_comclf);
   COM_PKG.INI_COMCLF;
   --
   IF v_comclf.ID is null THEN
    raise_application_error(-20000,'La Calificación que ha sido indicada no es válida',true);
   END IF;
   -- Actualizo el registro en COM_CALIFICACIONES
   UPDATE COM_CALIFICACIONES
   SET FECHA = SYSDATE
      ,SITUACION = 'ANU'
   WHERE ID = p_comclf_id;
   --
   -- Inserto el estado a la Orden de Compra como APR
   v_comoce_crear.COMOCM_ID := v_comclf.COMOCM_ID;
   v_comoce_crear.FECHA     := SYSDATE;
   v_comoce_crear.ESTADO    := 'APR';
   v_comoce_crear.MOTIVO    := 'Reversión al estado Aprobado por Anulación de Calificación';
   --
   COM_PKG.INS_COMOCE(p_comoce => v_comoce_crear);
   --
   COM_PKG.COMCLF_INIC(P_COMOCM_ID => v_comclf.COMOCM_ID
                      ,P_COMCLF_ID => v_comclf.ID);
   --
   -- Obtener la Orden de Compra a la que se esta anulando la calificacion
   COM_PKG.SET_COMOCM(p_id => v_comclf.COMOCM_ID);
   COM_PKG.GET_COMOCM(p_comocm => v_comocm);
   COM_PKG.INI_COMOCM;
   -- Revertir la situacion a GENERADA si se genero una adjudicacion previa
   for v_comadd in cr_comadd(p_comadj_id => v_comocm.COMADJ_ID, p_comocm_id => v_comclf.COMOCM_ID) loop
     update COM_ADJUDICACIONES_DET
      set    SITUACION = 'GEN'
            ,MOTIVO_SITUACION    = 'Calificacion ANULADA'
      where  ID = v_comadd.ID;
   end loop;
 --
   open cr_comclp;
   fetch cr_comclp into v_comclp_id;
   close cr_comclp;

    update COM_CALIFICACIONES_PRO
       set ESTADO = 'ANU'
    where id = v_comclp_id;

END;
/* Crear Responsable de Contratantes */
PROCEDURE COMCNR_CREAR
 (P_SEGORG_CODIGO IN SEG_ORGANIZACIONES.CODIGO%TYPE
 ,P_COMECO_ID IN COM_CONTRATACIONES.ID%TYPE
 ,P_SEGUSU_ID OUT NUMBER
 ,P_SEGUSU_USUARIO IN SEG_USUARIOS.USUARIO%TYPE
 ,P_RESULTADO OUT VARCHAR2
 ,P_SEGUSU_CONTRASENIA IN SEG_USUARIOS.CONTRASENIA%TYPE
 ,P_SEGPRS_TIPO_DOCUMENTO IN COM_RESPONSABLES.TIPO_DOCUMENTO%TYPE
 ,P_SEGPRS_NUMERO_DOCUMENTO IN COM_RESPONSABLES.NUMERO_DOCUMENTO%TYPE
 ,P_SEGPRS_NOMBRE IN COM_RESPONSABLES.NOMBRE%TYPE
 ,P_SEGPRS_EMAIL IN COM_RESPONSABLES.EMAIL%TYPE
 ,P_SEGPRS_OBSERVACIONES IN COM_RESPONSABLES.OBSERVACION%TYPE
 ,P_SEGPFL_CODIGO IN SEG_PERFILES.CODIGO%TYPE
 ,P_SEGAPL_CODIGO IN SEG_APLICACIONES.CODIGO%TYPE
 ,P_COMRST_ID IN COM_RESPONSABLES_TIPOS.ID%TYPE
 ,P_COMRES_ID IN NUMBER := NULL
 )
 IS
-- Declaración de Variables
  v_segorg SEG_ORGANIZACIONES%ROWTYPE;
  v_segusu SEG_USUARIOS%ROWTYPE;
  v_comres COM_RESPONSABLES%ROWTYPE;
  v_comcnr COM_CONTRATANTES_RES%ROWTYPE;
  v_segpus SEG_PERFILES_USUARIOS%ROWTYPE;
  v_segpfl SEG_PERFILES%ROWTYPE;
BEGIN
   p_resultado := NULL;
   -- Si se pasa la organizacion Obtener el id de la organización
   IF p_segorg_codigo IS NOT NULL THEN
    SEG_PKG.SET_SEGORG_CODIGO(p_codigo => p_segorg_codigo);
    SEG_PKG.GET_SEGORG(v_segorg);
    IF v_segorg.ID IS NULL THEN
       p_resultado := 'El Codigo de Organización no corresponde a una Organización existente';
    END IF;
   ELSE
    -- Si no se pasa la organización, Obtener el id de la organizacion del usuario
    SEG_PKG.SET_SEGUSU_USUARIO(p_USUARIO => v('APP_USER'));
    SEG_PKG.GET_SEGUSU(v_segusu);
    SEG_PKG.SET_SEGORG(p_id => v_segusu.segorg_id);
    SEG_PKG.GET_SEGORG(v_segorg);
    IF v_segorg.ID IS NULL THEN
       p_resultado := 'El Codigo de Organización del Usuario Conectado no corresponde a una Organización existente';
    END IF;
   --
  END IF;
   -- Crear el Usuario (1)  -> v_resultado, v_segusu_id (2)
   IF p_resultado IS NULL THEN
    SEG_PKG.SEGUSU_CREAR(
      p_segusu_usuario          => p_segusu_usuario
     ,p_segusu_contrasenia      => p_segusu_contrasenia
     ,p_segprs_observaciones    => p_segprs_observaciones
     ,p_segprs_nombre           => p_segprs_nombre
     ,p_segprs_email            => p_segprs_email
     ,p_segprs_tipo_documento   => p_segprs_tipo_documento
     ,p_segprs_numero_documento => p_segprs_numero_documento
     ,p_segorg_id               => v_segorg.ID
     ,p_segrol_codigo           => NULL
     ,p_segapl_codigo           => p_segapl_codigo
     ,p_resultado               => p_resultado -- SALIDA
     ,p_segusu_id               => p_segusu_id -- SALIDA
     );
    -- Crear el Responsable (2) -> p_comorr_id
    -- Asigno Perfil al Usuario
    IF p_segusu_id IS NOT NULL THEN
     IF p_segpfl_codigo IS NOT NULL THEN
        SEG_PKG.SET_SEGPFL_CODIGO(p_segpfl_codigo => p_segpfl_codigo);
        SEG_PKG.GET_SEGPFL(v_segpfl);
        IF v_segpfl.ID IS NULL THEN
            p_resultado := p_resultado||' El Perfil que intenta asignar al Responsable no Existe en la Organización.';
        ELSE
            v_segpus.SEGPFL_ID      := v_segpfl.ID;
            v_segpus.SEGUSU_ID      := p_segusu_id;
            v_segpus.FECHA_VIGENCIA := SYSDATE;
            v_segpus.FECHA_VALIDEZ  := NULL;
            SEG_PKG.INS_SEGPUS(P_SEGPUS => V_SEGPUS);
        END IF;
     END IF;
     IF p_comres_id IS NOT NULL THEN
        COM_PKG.SET_COMRES(p_id => p_comres_id);
        COM_PKG.GET_COMRES(p_comres => v_comres);
        COM_PKG.INI_COMRES;
     END IF;
     IF v_comres.ID IS NULL THEN
      -- Defino valores del Responsable
      SELECT COMRES_ID.NEXTVAL INTO v_comres.ID FROM DUAL;
      v_comres.COMRST_ID        := P_COMRST_ID;
      v_comres.TIPO_DOCUMENTO   := p_segprs_tipo_documento;
      v_comres.NUMERO_DOCUMENTO := p_segprs_numero_documento;
      v_comres.NOMBRE           := p_segprs_nombre;
      v_comres.EMAIL            := p_segprs_email;
      v_comres.OBSERVACION      := p_segprs_observaciones;
      -- Inserto el Responsable
      COM_PKG.INS_COMRES(p_comres => v_comres);
      --
     END IF;
     --
     COM_PKG.SET_COMCNR_RESP( p_comres_id => v_comres.ID
                             ,p_segusu_id => p_segusu_id
                             ,p_comeco_ID => p_comeco_ID );
     COM_PKG.GET_COMCNR(v_comcnr);
    IF v_comcnr.id IS NOT NULL THEN
       p_resultado := p_resultado||' El Responsable ya existe Activo para este Contratante.';
    ELSE
    --
    -- Defino valores del Responsable-Contratante
    v_comcnr.COMECO_ID      := p_comeco_ID;
    v_comcnr.COMRES_ID      := v_comres.ID;
    v_comcnr.SEGUSU_ID      := p_segusu_id;
    v_comcnr.SITUACION      := 'ACT';
    v_comcnr.FECHA_VIGENCIA := SYSDATE;
    v_comcnr.FECHA_VALIDEZ  := NULL;
    -- Inserto el Responsable-Contratante
    COM_PKG.INS_COMCNR(p_comcnr => v_comcnr);
    --
    END IF; --DEL CREAR RESPONSABLE
   END IF; -- DEL CREAR USUARIO
  END IF;
END;
/* Reactivar Responsable. */
PROCEDURE COMCNR_REACTIVAR
 (P_RESULTADO OUT VARCHAR2
 ,P_COMCNR_ID IN COM_CONTRATANTES_RES.ID%TYPE
 )
 IS
v_comcnr COM_CONTRATANTES_RES%ROWTYPE;
BEGIN
  p_resultado := NULL;
  COM_PKG.SET_COMCNR(p_id => p_comcnr_id);
  COM_PKG.GET_COMCNR(v_comcnr);
  IF v_comcnr.ID IS NULL THEN -- Si el Responsable no existe
    p_resultado :='El Responsable no EXISTE !';
  ELSE IF v_comcnr.SITUACION = 'ACT' THEN -- Si el Responsable esta Activo
         p_resultado :='El Responsable esta Activo !';
       ELSE
         UPDATE COM_CONTRATANTES_RES
         SET SITUACION      = 'ACT',
             FECHA_VALIDEZ = NULL
         WHERE ID = v_comcnr.ID;
         -- REACTIVAR EL USUARIO QUE SE CORRESPONDE AL RESPONSABLE
         SEG_PKG.SEGUSU_REACTIVAR( p_segusu_id => v_comcnr.SEGUSU_ID,
                                   p_resultado => p_resultado );
       END IF;
  END IF;
END;
/* Suspender Responsable. */
PROCEDURE COMCNR_SUSPENDER
 (P_RESULTADO OUT VARCHAR2
 ,P_COMCNR_ID IN COM_CONTRATANTES_RES.ID%TYPE
 )
 IS
v_comcnr COM_CONTRATANTES_RES%ROWTYPE;
BEGIN
  p_resultado := NULL;
  COM_PKG.SET_COMCNR(p_id => p_comcnr_id);
  COM_PKG.GET_COMCNR(v_comcnr);
  IF v_comcnr.ID IS NULL THEN -- Si el Responsable no existe
    p_resultado :='El Responsable no EXISTE !';
  ELSE IF v_comcnr.SITUACION = 'BAJ' THEN -- Si el Responsable esta Dado de Baja
         p_resultado :='El Responsable esta Dado de Baja !';
       ELSE
         UPDATE COM_CONTRATANTES_RES
         SET SITUACION      = 'BAJ',
             FECHA_VALIDEZ = SYSDATE
         WHERE ID = v_comcnr.ID;
         -- SUSPENDER EL USUARIO QUE SE CORRESPONDE AL RESPONSABLE
         SEG_PKG.SEGUSU_SUSPENDER( p_segusu_id => v_comcnr.SEGUSU_ID,
                                   p_resultado => p_resultado );
       END IF;
  END IF;
END;
PROCEDURE COMCDG_GET
 (P_COMCDG OUT COM_CONTRATACIONES_DOCGEN%ROWTYPE
 )
 IS
begin
  p_comcdg := v_comcdg;
end;
PROCEDURE COMCDG_INI
 IS
begin
  v_comcdg := null;
end;
/* Insertar registro en COM_CONTRATACIONES_DOCGEN. */
PROCEDURE COMCDG_INS
 (P_COMCDG IN COM_CONTRATACIONES_DOCGEN%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_CONTRATACIONES_DOCGEN
  ( ID
    ,COMCON_ID
    ,COMDCT_ID
    ,COMDOC_ID
    ,FECHA
    ,DATE_CREATED
    ,DATE_MODIFIED
    ,CREATED_BY
    ,MODIFIED_BY  )
  values
  ( p_comcdg.ID
    ,p_comcdg.COMCON_ID
    ,p_comcdg.COMDCT_ID
    ,p_comcdg.COMDOC_ID
    ,p_comcdg.FECHA
    ,p_comcdg.DATE_CREATED
    ,p_comcdg.DATE_MODIFIED
    ,p_comcdg.CREATED_BY
    ,p_comcdg.MODIFIED_BY  );

  --
END;
/* Seteo la variable v_comcdg */
PROCEDURE COMCDG_SET
 (P_ID IN NUMBER
 )
 IS
CURSOR cr_comcdg IS
  SELECT *
  FROM COM_CONTRATACIONES_DOCGEN COMCDG
  WHERE COMCDG.ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  COM_PKG.COMCDG_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comcdg;
  FETCH cr_comcdg INTO v_comcdg;
  CLOSE cr_comcdg;
  --
END;
PROCEDURE COMCMO_CREAR
 (P_COMCLF_ID IN NUMBER
 ,P_COMCMO_ID OUT NUMBER
 )
 IS
CURSOR cr_comctm IS
  SELECT *
  FROM COM_CALIFICACIONES_TMO COMCTM
  WHERE SITUACION = 'HAB';
  --
  v_comcmo_crear com_calificaciones_mot%rowtype;
  v_comctm       com_calificaciones_tmo%rowtype;
begin

  -- Inicializar la variable
  v_comctm       := NULL;
  v_comcmo_crear := NULL;
  -- Cargar la variable con los datos de la consulta
  FOR v_comctm IN cr_comctm LOOP

      -- Validar la Creación
      COMCMO_CREAR_VLD(p_comclf_id   => p_comclf_id
                     , p_comctm_id   => v_comctm.id);
      -- Registrar
      select COMCMO_ID.NEXTVAL
      into   v_comcmo_crear.ID
      from   dual;
      --
      v_comcmo_crear.COMCLF_ID          := p_comclf_id;
      v_comcmo_crear.COMCTM_ID          := v_comctm.id;
      v_comcmo_crear.VALOR_SN           := NULL;
      --
      INS_COMCMO(p_comcmo => v_comcmo_crear);
      -- Cargar la variable de retorno con el Id creado.
      p_comcmo_id := v_comcmo_crear.ID;
      --

  END LOOP;
  --
end;
FUNCTION COMCMO_CREAR_SN
 (P_COMCLF_ID IN NUMBER
 ,P_COMCTM_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
begin
  -- Validar la la Creación
  COMCMO_CREAR_VLD(p_comclf_id  => p_comclf_id
                 , p_comctm_id  => p_comctm_id);
  return 'SI';
exception
  when others then
    return 'NO';
end;
PROCEDURE COMCMO_CREAR_VLD
 (P_COMCLF_ID IN NUMBER
 ,P_COMCTM_ID IN NUMBER
 )
 IS
v_comcmo com_calificaciones_mot%rowtype;
v_comctm com_calificaciones_tmo%rowtype;
v_comclf com_calificaciones%rowtype;
begin
  -- Verificar parametros obligatorios
  if p_comclf_id is null then
    raise_application_error(-20000,'La Calificacion no ha sido indicada y es un dato obligatorio',true);
  elsif p_comctm_id is null then
    raise_application_error(-20000,'El Tipo de Motivo no ha sido indicado y es un dato obligatorio',true);
  end if;

  -- Verificar que las referencias externas existan
  COM_PKG.SET_COMCLF(p_id => p_comclf_id);
  COM_PKG.GET_COMCLF(p_comclf => v_comclf);
  COM_PKG.INI_COMCLF;
  if v_comclf.ID is null then
    raise_application_error(-20000,'La Calificacion indicada es incorrecta',true);
  end if;
  INI_COMCLF;

  COM_PKG.SET_COMCTM(p_id => p_comctm_id);
  COM_PKG.GET_COMCTM(p_comctm => v_comctm);
  COM_PKG.INI_COMCTM;
  if v_comctm.ID is null then
    raise_application_error(-20000,'El Tipo de Motivo indicado es incorrecto',true);
  end if;
  COM_PKG.INI_COMCTM;

  -- Verificar no duplicidad de datos
  COM_PKG.SET_COMCMO_CLF(p_comclf_id => p_comclf_id
                        ,p_comctm_id => p_comctm_id);
  COM_PKG.GET_COMCMO(p_comcmo => v_comcmo);
  if v_comcmo.ID is not null then
    COM_PKG.INI_COMCMO;
    raise_application_error(-20000,'La Calificación con el Tipo de Motivo indicado ya se encuentra registrada',true);
  end if;
  --
  COM_PKG.INI_COMCMO;
  --
end;
/* Excluir un Motivo de las Ordenes Aprobadas */
PROCEDURE COMCMO_EXCLUIR
 (P_COMCTM_ID IN NUMBER
 )
 IS
CURSOR cr_comclf IS
  SELECT COMOCM.ID COMOCM_ID
        ,COMCLF.ID COMCLF_ID
        ,COMOCE.ESTADO
    FROM COM_ORDENES_COMPRAS     COMOCM
        ,COM_ORDENES_COMPRAS_EST COMOCE
        ,COM_CALIFICACIONES      COMCLF
   WHERE COMOCM.ID        = COMOCE.COMOCM_ID
     AND COMOCM.ID        = COMCLF.COMOCM_ID
     AND COMOCE.ID        = COM_PKG.OBTN_COMOCE_ID(COMOCM.ID)
     AND COMOCE.ESTADO    = 'APR'
     AND COMCLF.ID IN ( SELECT COMCLF1.ID
                              FROM COM_ORDENES_COMPRAS     COMOCM1
                                  ,COM_ORDENES_COMPRAS_EST COMOCE1
                                  ,COM_CALIFICACIONES      COMCLF1
                                  ,COM_CALIFICACIONES_MOT  COMCMO1
                             WHERE COMOCM1.ID     = COMOCE1.COMOCM_ID
                               AND COMOCM1.ID     = COMCLF1.COMOCM_ID
                               AND COMCLF1.ID     = COMCMO1.COMCLF_ID
                               AND COMOCE1.ID     = COM_PKG.OBTN_COMOCE_ID(COMOCM1.ID)
                               AND COMOCE1.ESTADO = 'APR'
                               AND COMCMO1.COMCTM_ID = P_COMCTM_ID);
   --
BEGIN
  --
  COM_PKG.COMCMO_EXCLUIR_VLD(p_comctm_id   => p_comctm_id);
  --
  FOR v_cr_comclf IN cr_comclf LOOP
      -- Registrar Modificación
  DELETE COM_CALIFICACIONES_MOT
   WHERE COMCTM_ID = P_COMCTM_ID
     AND COMCLF_ID = v_cr_comclf.COMCLF_ID;
  --
  END LOOP;
  --
END;
FUNCTION COMCMO_EXCLUIR_SN
 (P_COMCTM_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
begin
  -- Validar si se puede Incluir el Motivo
  COMCMO_EXCLUIR_VLD(p_comctm_id  => p_comctm_id);
  return 'SI';
exception
  when others then
    return 'NO';
end;
/* Validar si se puede Excluir un Motivo de las Ordenes Aprobadas */
PROCEDURE COMCMO_EXCLUIR_VLD
 (P_COMCTM_ID IN NUMBER
 )
 IS
CURSOR cr_comclf IS
  SELECT COMCLF.ID COMCLF_ID
    FROM COM_ORDENES_COMPRAS     COMOCM
        ,COM_ORDENES_COMPRAS_EST COMOCE
        ,COM_CALIFICACIONES      COMCLF
   WHERE COMOCM.ID        = COMOCE.COMOCM_ID
     AND COMOCM.ID        = COMCLF.COMOCM_ID
     AND COMOCE.ID        = COM_PKG.OBTN_COMOCE_ID(COMOCM.ID)
     AND COMOCE.ESTADO    = 'APR'
     AND COMCLF.ID IN ( SELECT COMCLF1.ID
                              FROM COM_ORDENES_COMPRAS     COMOCM1
                                  ,COM_ORDENES_COMPRAS_EST COMOCE1
                                  ,COM_CALIFICACIONES      COMCLF1
                                  ,COM_CALIFICACIONES_MOT  COMCMO1
                             WHERE COMOCM1.ID     = COMOCE1.COMOCM_ID
                               AND COMOCM1.ID     = COMCLF1.COMOCM_ID
                               AND COMCLF1.ID     = COMCMO1.COMCLF_ID
                               AND COMOCE1.ID     = COM_PKG.OBTN_COMOCE_ID(COMOCM1.ID)
                               AND COMOCE1.ESTADO = 'APR'
                               AND COMCMO1.COMCTM_ID = P_COMCTM_ID);
   --
  v_dummy   NUMBER;
  v_retorno boolean:= false;
BEGIN
  --
  if p_comctm_id is null then
    raise_application_error(-20000,'El Tipo de Motivo no ha sido indicado y es un dato obligatorio',true);
  end if;
  --
  OPEN cr_comclf;
  FETCH cr_comclf into v_dummy;
    if cr_comclf%found then
       v_retorno := true;
    end if;
  CLOSE cr_comclf;
  if not v_retorno then
    raise_application_error(-20000,'No se puede Excluir el Tipo de Motivo indicado',true);
  end if;
  --
END;
FUNCTION COMCMO_INCLUIR_SN
 (P_COMCTM_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
begin
  -- Validar si se puede Incluir el Motivo
  COMCMO_INCLUIR_VLD(p_comctm_id  => p_comctm_id);
  return 'SI';
exception
  when others then
    return 'NO';
end;
FUNCTION COMCMO_INIC_SN
 (P_COMCLF_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
begin
  -- Validar la la Creación
  COM_PKG.COMCMO_INIC_VLD(p_comclf_id  => p_comclf_id);
  return 'SI';
exception
  when others then
    return 'NO';
end;
/* Incluir un Motivo a las Ordenes Aprobadas */
PROCEDURE COMCMO_INCLUIR
 (P_COMCTM_ID IN NUMBER
 )
 IS
CURSOR cr_comclf IS
  SELECT COMOCM.ID COMOCM_ID
        ,COMCLF.ID COMCLF_ID
    FROM COM_ORDENES_COMPRAS     COMOCM
        ,COM_ORDENES_COMPRAS_EST COMOCE
        ,COM_CALIFICACIONES      COMCLF
   WHERE COMOCM.ID     = COMOCE.COMOCM_ID
     AND COMOCM.ID     = COMCLF.COMOCM_ID
     AND COMOCE.ID     = COM_PKG.OBTN_COMOCE_ID(COMOCM.ID)
     AND COMOCE.ESTADO = 'APR'
     AND COMCLF.ID NOT IN ( SELECT COMCLF1.ID
                              FROM COM_CALIFICACIONES      COMCLF1
                                  ,COM_CALIFICACIONES_MOT  COMCMO1
                             WHERE COMCLF1.ID        = COMCMO1.COMCLF_ID
                               AND COMCMO1.COMCTM_ID = p_comctm_id
                               AND COMOCM_ID = COMOCM.ID);
  --
  v_comcmo_crear COM_CALIFICACIONES_MOT%ROWTYPE;
BEGIN
  --
  COM_PKG.COMCMO_INCLUIR_VLD(p_comctm_id   => p_comctm_id);
  --
  FOR v_cr_comclf IN cr_comclf LOOP
   -- Validar la Creación
      COM_PKG.COMCMO_CREAR_VLD(p_comclf_id   => v_cr_comclf.comclf_id
                             , p_comctm_id   => p_comctm_id);
      -- Registrar
      select COMCMO_ID.NEXTVAL
      into   v_comcmo_crear.ID
      from   dual;
      --
      v_comcmo_crear.COMCLF_ID          := v_cr_comclf.comclf_id;
      v_comcmo_crear.COMCTM_ID          := p_comctm_id;
      v_comcmo_crear.VALOR_SN           := NULL;
      --
      INS_COMCMO(p_comcmo => v_comcmo_crear);
  END LOOP;
  --
END;
/* Validar si se puede Incluir un Motivo a las Ordenes Aprobadas */
PROCEDURE COMCMO_INCLUIR_VLD
 (P_COMCTM_ID IN NUMBER
 )
 IS
CURSOR cr_comclf IS
  SELECT COMCLF.ID COMCLF_ID
    FROM COM_ORDENES_COMPRAS     COMOCM
        ,COM_ORDENES_COMPRAS_EST COMOCE
        ,COM_CALIFICACIONES      COMCLF
   WHERE COMOCM.ID     = COMOCE.COMOCM_ID
     AND COMOCM.ID     = COMCLF.COMOCM_ID
     AND COMOCE.ID     = COM_PKG.OBTN_COMOCE_ID(COMOCM.ID)
     AND COMOCE.ESTADO = 'APR'
     AND COMCLF.ID NOT IN ( SELECT COMCLF1.ID
                              FROM COM_CALIFICACIONES      COMCLF1
                                  ,COM_CALIFICACIONES_MOT  COMCMO1
                             WHERE COMCLF1.ID        = COMCMO1.COMCLF_ID
                               AND COMCMO1.COMCTM_ID = p_comctm_id);
  --
  v_dummy   NUMBER;
  v_retorno boolean:= false;
BEGIN
  --
  if p_comctm_id is null then
    raise_application_error(-20000,'El Tipo de Motivo no ha sido indicado y es un dato obligatorio',true);
  end if;
  --
  OPEN cr_comclf;
  FETCH cr_comclf into v_dummy;
    if cr_comclf%found then
       v_retorno := true;
    end if;
  CLOSE cr_comclf;
  if not v_retorno then
    raise_application_error(-20000,'No se puede Incluir el Tipo de Motivo indicado',true);
  end if;
  --
END;
PROCEDURE COMCMO_INIC
 (P_COMCLF_ID IN NUMBER
 )
 IS
BEGIN
  -- Validar la Inicialización
  COM_PKG.COMCMO_INIC_VLD(p_comclf_id   => p_comclf_id);

  -- Registrar Modificación
  UPDATE COM_CALIFICACIONES_MOT
  SET  VALOR_SN = NULL
  WHERE COMCLF_ID = p_comclf_id;
  --
END;
PROCEDURE COMCMO_INIC_VLD
 (P_COMCLF_ID IN NUMBER
 )
 IS
v_comclf com_calificaciones%rowtype;
begin
  -- Verificar parametros obligatorios
  if p_comclf_id is null then
    raise_application_error(-20000,'La Calificacion no ha sido indicada y es un dato obligatorio',true);
  end if;

  -- Verificar que las referencias externas existan
  COM_PKG.SET_COMCLF(p_id => p_comclf_id);
  COM_PKG.GET_COMCLF(p_comclf => v_comclf);
  COM_PKG.INI_COMCLF;
  if v_comclf.ID is null then
    raise_application_error(-20000,'La Calificacion indicada es incorrecta',true);
  end if;
  COM_PKG.INI_COMCLF;
  --
end;
PROCEDURE COMCON_ACORDAR
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
   CURSOR cr_comcot IS
   SELECT *
   FROM COM_CONTRATACIONES_DETALLES
   WHERE COMCON_ID = p_comcon_id;
   --
   cursor cr_comcod is
   select * from com_contrataciones_doc
   where comcon_id = p_comcon_id;
   --
   cursor cr_conf is
   select valor
   from seg_configuraciones
   where segorg_id = P_SEGORG_ID
   and codigo = 'COMCON_SRVINT_TRAMIX_HABILITADO_SN';
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
      if v_comcoe.estado = 'ACR' then
         raise_application_error(-20000,'El proceso de contratacion ya se encuentra acordado',true);
      end if;

      --
      for v_conf in cr_conf loop
         if v_conf.valor = 'SI' then
            v_habilitado := 'SI';
         else
            v_habilitado := 'NO';
            raise_application_error(-20000,'La integracion No se encuentra habilitada',true);
         end if;
      end loop;
      --
      dbms_output.put_line('v_habilitado = ' || v_habilitado);
      --
      SELECT COMCOE_ID.NEXTVAL INTO v_comcoe_id FROM DUAL;
      v_comcoe_tmp.ID        := v_comcoe_id;
      v_comcoe_tmp.COMCON_ID := p_comcon_id;
      v_comcoe_tmp.FECHA     := SYSDATE;
      v_comcoe_tmp.ESTADO    := 'ACR';
      v_comcoe_tmp.MOTIVO    := p_motivo;
      COM_PKG.INS_COMCOE(P_COMCOE => v_comcoe_tmp);
      --
EXCEPTION WHEN others THEN
   raise_application_error(-20000,'No se ha podido dar por Acordado el Proceso de Contratación',true);
END;
PROCEDURE COMCON_ACORDAR_REVERTIR
 (P_SEGORG_ID IN NUMBER
 ,P_MOTIVO IN VARCHAR2
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
   CURSOR cr_comcoe IS
   SELECT ESTADO
   FROM COM_CONTRATACIONES_EST
   WHERE ID = com_pkg.OBTN_COMCOE_ANT_ID(p_comcon_id);
   --
   v_habilitado         varchar2(10);
   v_comcoe             com_contrataciones_est%ROWTYPE;
   v_comcoe_tmp         com_contrataciones_est%ROWTYPE;
   v_comcon             com_contrataciones%rowtype;

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
      if v_comcoe.estado <> 'ACR' then
         raise_application_error(-20000,'El proceso de contratacion no se encuentra en estado acordado',true);
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
      v_comcoe_tmp.ESTADO    := v_comcoe_est.ESTADO; --'INF';
      v_comcoe_tmp.MOTIVO    := p_motivo;
      COM_PKG.INS_COMCOE(P_COMCOE => v_comcoe_tmp);
      --
/*      */
EXCEPTION WHEN others THEN
   raise_application_error(-20000,'No se ha podido Revertir el Acuerdo del Proceso de Contratación',true);
END;
PROCEDURE COMCON_ACORDAR_TRANSMITIR
 (P_SEGORG_ID IN NUMBER
 ,P_COMCON_ID IN NUMBER
 ,P_INTENV_ID OUT NUMBER
 )
 IS
-----------------------------------------------------------------------------------
   --
   -- Argumentos
   -- p_segorg_id => Organizacion
   -- p_comcon_id => Id del Proceso
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
   cursor cr_conf is
   select valor
   from seg_configuraciones
   where segorg_id = P_SEGORG_ID
   and codigo = 'COMCON_SRVINT_TRAMIX_HABILITADO_SN';
   --
   cursor cr_comdct is
   select id from com_documentos_tipos
   where segorg_id = p_segorg_id
   and codigo = 'COM_PRE_ADJUDICACION';
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
   v_intori             int_origenes%ROWTYPE;
   v_intdes             int_destinos%ROWTYPE;
   v_inttpo             int_tipos_objetos%ROWTYPE;
   v_intene             int_envios_est%ROWTYPE;
   v_comcon             com_contrataciones%rowtype;
   v_comcot             com_contrataciones_detalles%rowtype;
   v_comped             COM_PEDIDOS%ROWTYPE;
   v_respuesta_ws       varchar2(2000);
   v_respuesta_ws_adj   varchar2(2000);
   v_resultado_ws       varchar2(2000);
   v_resultado_ws_adj   varchar2(2000);
   v_motivo             varchar2(2000);
   v_referencia         varchar2(2000);
   v_referencia_adj     varchar2(2000);
   v_actuacion_identif  varchar2(2000);
   v_aprobar            varchar2(2);
   v_inttpo_id          number;
   v_intori_id          number;
   v_intdes_id          number;
   v_intene_id          number;
   v_comcdg_id          number;
   v_comdct_id          number;
   v_intenv_id          number;
   v_cantidad_adjuntos  number;
   v_documento_id       number;
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
      if v_comcoe.estado <> 'ACR' then
         raise_application_error(-20000,'El proceso de contratacion no se encuentra en estado acordado',true);
      end if;

      --
      for v_conf in cr_conf loop
         if v_conf.valor = 'SI' then
            v_habilitado := 'SI';
         else
            v_habilitado := 'NO';
            raise_application_error(-20000,'La integracion no se encuentra habilitada',true);
         end if;
      end loop;
      dbms_output.put_line('v_habilitado = ' || v_habilitado);
      --
      -- Obtener el tipo de documento
      --
      OPEN cr_comdct;
      FETCH cr_comdct INTO v_comdct_id;
      CLOSE cr_comdct;
      --
      if v_comdct_id is null then
         raise_application_error(-20000,'No se ha podido determinar el tipo de documento del Proceso de Contratación',true);
      end if;
      --
      open cr_comcon(p_comcon_id);
      fetch cr_comcon into v_comcon;
      close cr_comcon;
      --
      if v_comcon.id is null then
         raise_application_error(-20000,'No se han podido obtener los datos del Proceso de Contratación',true);
      end if;
      --
      OPEN cr_comctt(v_comcon.comctt_id);
      FETCH cr_comctt INTO v_comctt;
      CLOSE cr_comctt;
      --
      if v_comctt.id is null then
         raise_application_error(-20000,'No se ha podido determinar el tipo de Contratación',true);
      end if;
      --
      -- Obtener los datos del Detalle de Contratacion
      --
      OPEN cr_comcot;
      FETCH cr_comcot INTO v_comcot;
      CLOSE cr_comcot;
      --
      -- Validar que existe el detalle
      --
      if v_comcot.id is null then
         raise_application_error(-20000,'No se han encontrado datos del detalle de Contratación',true);
      end if;
      --
      -- Obtener los datos del pedido
      --
      v_comped_id := v_comcot.comped_id;
      OPEN cr_comped(v_comped_id);
      FETCH cr_comped INTO v_comped;
      CLOSE cr_comped;
      --
      -- Validar que existe el pedido
      --
      if v_comped.id is null then
         raise_application_error(-20000,'La solicitud de Gasto especificada No Existe',true);
      end if;
      --
      -- 1. Generar y Grabar el Documento
      --
      v_documento_id := com_pkg.obtn_comadj_doc_pdf(p_segorg_id => p_segorg_id
                                                   ,p_comcon_id => p_comcon_id);
      if v_documento_id is null then
         raise_application_error(-20000,'No se ha podido generar el Informe de Adjudicación del Proceso de Contratación',true);
      end if;
      --
      -- 2. Grabar referencia Proceso de Contratacion-Documento Generado
      --
      begin
         SELECT COMCDG_ID.NEXTVAL INTO v_comcdg_id FROM DUAL;
         v_comcdg.ID        := v_comcdg_id;
         v_comcdg.COMCON_ID := p_comcon_id;
         v_comcdg.COMDOC_ID := v_documento_id;
         v_comcdg.COMDCT_ID := v_comdct_id;
         v_comcdg.FECHA     := sysdate;
         COM_PKG.COMCDG_INS(p_comcdg => v_comcdg);
      EXCEPTION WHEN others THEN
         raise_application_error(-20000,'No se ha podido generar el registro de referencia Proceso de Contratacion-Documento Generado',true);
      END;
      dbms_output.put_line('v_comcdg_id = ' || v_comcdg_id);
      if v_comcdg_id is null then
         raise_application_error(-20000,'No se ha podido generar el registro de referencia Proceso de Contratacion-Documento Generado',true);
      end if;
      --
      -- 3. Transmitir el Documento al WebService
      --
      v_actuacion_identif := 'PRESEC' || '-' || 'INFORME DE PRE-ADJUDICACION POR PROVEEDOR' ||' - PROCESO N°: ' || v_comcon.codigo || '/' ||  v_comped.ejercicio || ' - ' || v_comctt.NOMBRE;
      dbms_output.put_line('v_actuacion_identif = ' || v_actuacion_identif);
      --
      v_respuesta_ws := COM_PKG.COMCON_INVOCAR_WS(p_comcdg_id         => v_comcdg_id
                                                , p_actuacion_identif => v_actuacion_identif
                                                , p_valida            => 1);
      dbms_output.put_line('v_respuesta_ws = ' || v_respuesta_ws);

      update com_contrataciones_docgen
      set xml_enviado = xml_enviado || chr(13) || chr(10) || to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss') || chr(13) || chr(10) || v_respuesta_ws
      where id = v_comcdg_id;

      --
      -- 4. Parseamos el resultado del Webservice
      --
      COM_PKG.COMCON_PROC_XML_ACT(p_xml       => v_respuesta_ws
                                 ,p_segorg_id => p_segorg_id
                                 ,p_resultado => v_resultado_ws
                                 ,p_motivo    => v_motivo
                                 ,p_referencia=> v_referencia);
      --
      IF v_resultado_ws = 'ERROR' THEN
         raise_application_error(-20000,'No se ha podido interpretar el mensaje de respuesta.',true);
      END IF;
      ----------------------------------------------------------
      -- 5. Grabar Log en Envíos
      ----------------------------------------------------------
      INT_PKG.INTTPO_SET_CODIGO(p_segorg_id => p_segorg_id
                               ,p_codigo    => 'COMCON_ACTUACION');
      INT_PKG.INTTPO_GET(p_inttpo => v_inttpo);
      if v_inttpo.id is null then
         raise_application_error(-20000,'El codigo de tipo de objeto COMCON_ACTUACION no se encuentra configurado',true);
      end if;
      v_inttpo_id := v_inttpo.id;
      --
      INT_PKG.INTENV_REGISTRAR(
                     P_INTTPO_ID     => v_inttpo_id
                    ,P_INTENV_OBJETO => '<comdoc_id>'    || v_documento_id || '</comdoc_id>'
                    ,P_INTENV_OBS    => v_respuesta_ws
                    ,P_INTENV_RES    => '<return>'       || v_resultado_ws || '<return>'        ||
                                        '<actuacion_id>' || v_referencia   || '</actuacion_id>'
                    ,P_INTENE_FECHA  => sysdate
                    ,P_INTENV_ID     => v_intenv_id
      );
      --
      --
      -- 6. Si la Actuacion principal se inserto correctamente
      --    entonces vamos a verificar si tiene adjuntos
      --
      --
      IF instr(v_resultado_ws,'OP_COMPLETED') > 0 THEN
         --
         v_aprobar := 'SI';

            --
            -- 8.A Modificar Estado del Envio a ENVIADO
            --
            SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
            v_intene.ID            := v_intene_id;
            v_intene.INTENV_ID     := v_intenv_id;
            v_intene.FECHA         := sysdate;
            v_intene.ESTADO        := 'ENV';
            v_intene.MOTIVO_ESTADO := v_motivo;
            INT_PKG.INTENE_INS(p_intene => v_intene);
            --
      ELSE -- Devuelve distinto de OP_COMPLETED
         --
         -- 8.B Modificar Estado del Envio ERROR
         --
         SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
         v_intene.ID            := v_intene_id;
         v_intene.INTENV_ID     := v_intenv_id;
         v_intene.FECHA         := sysdate;
         v_intene.ESTADO        := 'ERR';
         v_intene.MOTIVO_ESTADO := v_motivo;
         INT_PKG.INTENE_INS(p_intene => v_intene);
         --
      END IF;
      --
      p_intenv_id := v_intenv_id;
      --
EXCEPTION WHEN others THEN
   raise_application_error(-20000,'No se ha podido dar por Acordado el Proceso de Contratación',true);
END;
/* Actualiza los Precios Testigos de una Contratación */
PROCEDURE COMCON_ACTUALIZA_CTP
 (P_COMCON_ID IN COM_CONTRATACIONES.ID%TYPE
 )
 IS
-- Pedidos en la Contratacion
  CURSOR cr_comcot IS
  SELECT comcot.COMPED_ID
  FROM COM_CONTRATACIONES_DETALLES comcot
  WHERE comcot.COMCON_ID = p_comcon_id;
  -- Detalle de cada pedido
  CURSOR cr_compet (p_comped_id IN NUMBER) IS
  SELECT PRECIO_UNITARIO
        ,COMCIT_ID
        ,ID
  FROM COM_PEDIDOS_DETALLES compet
  WHERE compet.COMPED_ID = p_comped_id;
  --
  -- Obtengo Precio Testigo Vigente
  CURSOR cr_comcap (p_comcit_id IN NUMBER) IS
  SELECT PRECIO
  FROM COM_CATALOGO_PRECIOS comcap
  WHERE comcap.ID = COM_PKG.obtn_comctp_id(p_comcit_id);
  --
  v_comcoe COM_CONTRATACIONES_EST%rowtype;
  v_comcap cr_comcap%rowtype;
BEGIN
  --
  FOR v_comcot IN cr_comcot LOOP
    --
    FOR v_compet IN cr_compet (p_comped_id => v_comcot.COMPED_ID) LOOP
      --
      BEGIN
       IF v_compet.comcit_id IS NOT NULL THEN
        OPEN cr_comcap (p_comcit_id => v_compet.comcit_id);
        FETCH cr_comcap INTO v_comcap;
        CLOSE cr_comcap;
        --
         IF v_compet.PRECIO_UNITARIO <> v_comcap.PRECIO THEN
           -- Actualizo el Precio Testigo
           UPDATE COM_PEDIDOS_DETALLES
           SET PRECIO_UNITARIO = v_comcap.PRECIO
           WHERE ID = v_compet.ID ;
           --
         END IF;
         --
       END IF;
      END;
       --
    END LOOP;
    --
  END LOOP;
  --
END;
PROCEDURE COMCON_ANULADA_TRANSMITIR
 (P_SEGORG_ID IN NUMBER
 ,P_COMCON_ID IN NUMBER
 ,P_INTENV_ID OUT NUMBER
 )
 IS
-----------------------------------------------------------------------------------
   --
   -- Argumentos
   -- p_segorg_id => Organizacion
   -- p_comcon_id => Id del Proceso
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
   cursor cr_conf is
   select valor
   from seg_configuraciones
   where segorg_id = P_SEGORG_ID
   and codigo = 'COMCON_SRVINT_TRAMIX_HABILITADO_SN';
   --
   cursor cr_comdct is
   select id from com_documentos_tipos
   where segorg_id = p_segorg_id
   and codigo = 'COM_CONTRATACION_ANULADA';
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
   v_intori             int_origenes%ROWTYPE;
   v_intdes             int_destinos%ROWTYPE;
   v_inttpo             int_tipos_objetos%ROWTYPE;
   v_intene             int_envios_est%ROWTYPE;
   v_comcon             com_contrataciones%rowtype;
   v_comcot             com_contrataciones_detalles%rowtype;
   v_comped             COM_PEDIDOS%ROWTYPE;
   v_respuesta_ws       varchar2(2000);
   v_respuesta_ws_adj   varchar2(2000);
   v_resultado_ws       varchar2(2000);
   v_resultado_ws_adj   varchar2(2000);
   v_motivo             varchar2(2000);
   v_referencia         varchar2(2000);
   v_referencia_adj     varchar2(2000);
   v_actuacion_identif  varchar2(2000);
   v_aprobar            varchar2(2);
   v_inttpo_id          number;
   v_intori_id          number;
   v_intdes_id          number;
   v_intene_id          number;
   v_comcdg_id          number;
   v_comdct_id          number;
   v_intenv_id          number;
   v_cantidad_adjuntos  number;
   v_documento_id       number;
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
      if v_comcoe.estado <> 'CAN' then
         raise_application_error(-20000,'El proceso de contratacion no se encuentra en estado anulado',true);
      end if;

      --
      for v_conf in cr_conf loop
         if v_conf.valor = 'SI' then
            v_habilitado := 'SI';
         else
            v_habilitado := 'NO';
            raise_application_error(-20000,'La integracion no se encuentra habilitada',true);
         end if;
      end loop;
      dbms_output.put_line('v_habilitado = ' || v_habilitado);
      --
      -- Obtener el tipo de documento
      --
      OPEN cr_comdct;
      FETCH cr_comdct INTO v_comdct_id;
      CLOSE cr_comdct;
      --
      if v_comdct_id is null then
         raise_application_error(-20000,'No se ha podido determinar el tipo de documento del Proceso de Contratación: COM_CONTRATACION_ANULADA', true);
      end if;
      --
      open cr_comcon(p_comcon_id);
      fetch cr_comcon into v_comcon;
      close cr_comcon;
      --
      if v_comcon.id is null then
         raise_application_error(-20000,'No se han podido obtener los datos del Proceso de Contratación',true);
      end if;
      --
      OPEN cr_comctt(v_comcon.comctt_id);
      FETCH cr_comctt INTO v_comctt;
      CLOSE cr_comctt;
      --
      if v_comctt.id is null then
         raise_application_error(-20000,'No se ha podido determinar el tipo de Contratación',true);
      end if;
      --
      -- Obtener los datos del Detalle de Contratacion
      --
      OPEN cr_comcot;
      FETCH cr_comcot INTO v_comcot;
      CLOSE cr_comcot;
      --
      -- Validar que existe el detalle
      --
      if v_comcot.id is null then
         raise_application_error(-20000,'No se han encontrado datos del detalle de Contratación',true);
      end if;
      --
      -- Obtener los datos del pedido
      --
      v_comped_id := v_comcot.comped_id;
      OPEN cr_comped(v_comped_id);
      FETCH cr_comped INTO v_comped;
      CLOSE cr_comped;
      --
      -- Validar que existe el pedido
      --
      if v_comped.id is null then
         raise_application_error(-20000,'La solicitud de Gasto especificada No Existe',true);
      end if;
      --
      -- 1. Generar y Grabar el Documento
      --
      v_documento_id := com_pkg.obtn_comanu_doc_pdf(p_segorg_id => p_segorg_id
                                                   ,p_comcon_id => p_comcon_id);
      if v_documento_id is null then
         raise_application_error(-20000,'No se ha podido generar el Informe de Adjudicación del Proceso de Contratación',true);
      end if;
      --
      -- 2. Grabar referencia Proceso de Contratacion-Documento Generado
      --
      begin
         SELECT COMCDG_ID.NEXTVAL INTO v_comcdg_id FROM DUAL;
         v_comcdg.ID        := v_comcdg_id;
         v_comcdg.COMCON_ID := p_comcon_id;
         v_comcdg.COMDOC_ID := v_documento_id;
         v_comcdg.COMDCT_ID := v_comdct_id;
         v_comcdg.FECHA     := sysdate;
         COM_PKG.COMCDG_INS(p_comcdg => v_comcdg);
      EXCEPTION WHEN others THEN
         raise_application_error(-20000,'No se ha podido generar el registro de referencia Proceso de Contratacion-Documento Generado',true);
      END;
      dbms_output.put_line('v_comcdg_id = ' || v_comcdg_id);
      if v_comcdg_id is null then
         raise_application_error(-20000,'No se ha podido generar el registro de referencia Proceso de Contratacion-Documento Generado',true);
      end if;
      --
      -- 3. Transmitir el Documento al WebService
      --
      v_actuacion_identif := 'PRESEC' || '-' || 'INFORME DE ANULACION DEL PROCESO DE CONTRATACION N°: ' || v_comcon.codigo || '/' ||  v_comped.ejercicio || ' - ' || v_comctt.NOMBRE;
      dbms_output.put_line('v_actuacion_identif = ' || v_actuacion_identif);
      --
      v_respuesta_ws := COM_PKG.COMCON_INVOCAR_WS(p_comcdg_id         => v_comcdg_id
                                                , p_actuacion_identif => v_actuacion_identif
                                                , p_valida            => 1);
      dbms_output.put_line('v_respuesta_ws = ' || v_respuesta_ws);

      update com_contrataciones_docgen
      set xml_enviado = xml_enviado || chr(13) || chr(10) || to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss') || chr(13) || chr(10) || v_respuesta_ws
      where id = v_comcdg_id;

      --
      -- 4. Parseamos el resultado del Webservice
      --
      COM_PKG.COMCON_PROC_XML_ACT(p_xml       => v_respuesta_ws
                                 ,p_segorg_id => p_segorg_id
                                 ,p_resultado => v_resultado_ws
                                 ,p_motivo    => v_motivo
                                 ,p_referencia=> v_referencia);
      --
      IF v_resultado_ws = 'ERROR' THEN
         raise_application_error(-20000,'No se ha podido interpretar el mensaje de respuesta.',true);
      END IF;
      ----------------------------------------------------------
      -- 5. Grabar Log en Envíos
      ----------------------------------------------------------
      INT_PKG.INTTPO_SET_CODIGO(p_segorg_id => p_segorg_id
                               ,p_codigo    => 'COMCON_ANULADO');
      INT_PKG.INTTPO_GET(p_inttpo => v_inttpo);
      if v_inttpo.id is null then
         raise_application_error(-20000,'El codigo de tipo de objeto COMCON_ANULADO no se encuentra configurado',true);
      end if;
      v_inttpo_id := v_inttpo.id;
      --
      INT_PKG.INTENV_REGISTRAR(
                     P_INTTPO_ID     => v_inttpo_id
                    ,P_INTENV_OBJETO => '<comdoc_id>'    || v_documento_id || '</comdoc_id>'
                    ,P_INTENV_OBS    => v_respuesta_ws
                    ,P_INTENV_RES    => '<return>'       || v_resultado_ws || '<return>'        ||
                                        '<actuacion_id>' || v_referencia   || '</actuacion_id>'
                    ,P_INTENE_FECHA  => sysdate
                    ,P_INTENV_ID     => v_intenv_id
      );
      --
      --
      -- 6. Si la Actuacion principal se inserto correctamente
      --    entonces vamos a verificar si tiene adjuntos
      --
      --
      IF instr(v_resultado_ws,'OP_COMPLETED') > 0 THEN
         --
         v_aprobar := 'SI';

            --
            -- 8.A Modificar Estado del Envio a ENVIADO
            --
            SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
            v_intene.ID            := v_intene_id;
            v_intene.INTENV_ID     := v_intenv_id;
            v_intene.FECHA         := sysdate;
            v_intene.ESTADO        := 'ENV';
            v_intene.MOTIVO_ESTADO := v_motivo;
            INT_PKG.INTENE_INS(p_intene => v_intene);
            --
      ELSE -- Devuelve distinto de OP_COMPLETED
         --
         -- 8.B Modificar Estado del Envio ERROR
         --
         SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
         v_intene.ID            := v_intene_id;
         v_intene.INTENV_ID     := v_intenv_id;
         v_intene.FECHA         := sysdate;
         v_intene.ESTADO        := 'ERR';
         v_intene.MOTIVO_ESTADO := v_motivo;
         INT_PKG.INTENE_INS(p_intene => v_intene);
         --
      END IF;
      --
      p_intenv_id := v_intenv_id;
      --
EXCEPTION WHEN others THEN
   raise_application_error(-20000,'No se ha podido dar por Acordado el Proceso de Contratación',true);
END;
/* Anular Contratacion */
PROCEDURE COMCON_ANULAR
 (P_COMCON_ID IN NUMBER
 ,P_MOTIVO IN VARCHAR2
 ,P_ANULAR_COMPED_SN IN VARCHAR2 := 'NO'
 )
 IS
CURSOR cr_compedido (p_comped_id number) IS
  SELECT *
  FROM COM_PEDIDOS
  WHERE ID = p_comped_id;
  --
  CURSOR cr_comped IS
  SELECT COMPED_ID
  FROM COM_CONTRATACIONES_DETALLES
  WHERE COMCON_ID = p_comcon_id;
  --
  v_comcon              COM_CONTRATACIONES%ROWTYPE;
  v_comcoe              COM_CONTRATACIONES_EST%ROWTYPE;
  v_compee              COM_PEDIDOS_EST%ROWTYPE;
  v_compedido           COM_PEDIDOS%ROWTYPE;
  v_intenv_id           number;
  v_motivo_anulacion    varchar2(200);
  --
BEGIN
--
 SET_COMCON(p_comcon_id => p_comcon_id);
 GET_COMCON(p_comcon => v_comcon);
 INI_COMCON;
 --
 UPDATE COM_ADJUDICACIONES_DET A
 SET A.SITUACION = 'ANU'
   , A.MOTIVO_SITUACION = 'Anulación del Proceso'
 WHERE A.COMADJ_ID IN (SELECT B.ID
                       FROM COM_ADJUDICACIONES B
                       WHERE B.COMCON_ID = p_comcon_id)
   AND A.SITUACION ='PEN';
 --
 v_comcoe.COMCON_ID   := p_comcon_id;
 v_comcoe.FECHA       := SYSDATE;
 v_comcoe.ESTADO      := 'CAN';
 v_comcoe.MOTIVO      := p_motivo;

 COM_PKG.INS_COMCOE(P_COMCOE => v_comcoe);
 --
 FOR v_comped IN cr_comped LOOP
   v_compee.COMPED_ID  := v_comped.COMPED_ID;
   v_compee.FECHA       := SYSDATE;
   if p_anular_comped_sn = 'SI' then
      --
      v_motivo_anulacion := 'Por anulación del Proceso de Contratación Nº '||V_COMCON.CODIGO||', '||p_motivo;
      --
      open cr_compedido(v_comped.COMPED_ID);
      fetch cr_compedido into v_compedido;
      close cr_compedido;
      --
      COM_PKG.COMPED_ANULAR( p_segorg_id => v_compedido.segorg_id
                            ,p_comped_id => v_compedido.id
                            ,p_motivo    => v_motivo_anulacion
                            ,p_intenv_id => v_intenv_id
                            );
      --v_compee.ESTADO      := 'ANU';
      --v_compee.MOTIVO      := 'Por anulación del Proceso de Contratación Nº '||V_COMCON.CODIGO||', '||p_motivo;
      --COM_PKG.INS_COMPEE(P_COMPEE => v_compee);
    else
      --
      -- Si no se quiere anular tambien la solicitud entonces la dejamos en estado APR --
      --
      v_compee.ESTADO      := 'APR';
      v_compee.MOTIVO      := 'Por anulación del Proceso de Contratación Nº '||V_COMCON.CODIGO||', '||p_motivo;
      COM_PKG.INS_COMPEE(P_COMPEE => v_compee);
   end if;
   --
 END LOOP;
--
END;
/* Confirmar Proceso Creado */
PROCEDURE COMCON_CONFIRMAR
 (P_COMCON_ID IN NUMBER
 ,P_COMCON_CODIGO OUT NUMBER
 )
 IS
CURSOR cr_comcot IS
  SELECT *
  FROM COM_CONTRATACIONES_DETALLES
  WHERE COMCON_ID = p_comcon_id;
  --
  v_comcon_vrf  COM_CONTRATACIONES%ROWTYPE;
  v_comcoe_id   COM_CONTRATACIONES_EST.ID%type;
  v_comcon_codigo COM_CONTRATACIONES.CODIGO%type;
  v_comcot_vrf  COM_CONTRATACIONES_DETALLES%rowtype;
  v_comped_vrf  COM_PEDIDOS%rowtype;
  v_compee_id   COM_PEDIDOS_EST.ID%type;
  v_compee_crear COM_PEDIDOS_EST%rowtype;
  v_comcoe_crear COM_CONTRATACIONES_EST%rowtype;
BEGIN
  -- Verificar parametros obligatorios
  if p_comcon_id is null then
     raise_application_error(-20000,'El Proceso de Contratación no ha sido indicado y es un dato obligatorio',true);
  end if;
  -- Verificar que el Proceso de Contratación enviado es correcto
  SET_COMCON(p_comcon_id => p_comcon_id);
  GET_COMCON(p_comcon => v_comcon_vrf);
  INI_COMCON;
  --
  if v_comcon_vrf.ID is null then
     raise_application_error(-20000,'El Proceso de Contratación indicado es incorrecto',true);
  end if;
  -- Verificar que el Proceso de Contratación se encuentre en el estado correcto
  -- Obtener el estado actual del Proceso de Contratación
  v_comcoe_id := OBTN_COMCOE_ID (p_comcon_id => p_comcon_id, p_fecha => sysdate);
  -- Obtener los datos del estado del Proceso de Contratación
  SET_COMCOE(p_id => v_comcoe_id);
  -- Verificar si el estado pudo obtenerse
  if v_comcoe.ID is null then
    raise_application_error(-20000,'No se ha podido determinar el estado actual del Proceso de Contratación',true);
  end if;
  -- Verificar que el estado sea correcto
  if v_comcoe.ESTADO <> 'NUE' THEN
    raise_application_error(-20000,'El Proceso de Contratación ya se encuentra confirmado',true);
  end if;
  -- Obtener el Pedido asociado al Proceso de Contratación
  OPEN cr_comcot;
  FETCH cr_comcot INTO v_comcot_vrf;
  CLOSE cr_comcot;
  --
  if v_comcot_vrf.ID is null then
    raise_application_error(-20000,'El Proceso de Contratación indicado no posee ningún Pedido asociado',true);
  end if;
  -- Obtener los datos del Pedido asociado
  SET_COMPED(p_id => v_comcot_vrf.COMPED_ID);
  GET_COMPED(p_comped => v_comped_vrf);
  INI_COMPED;
  --
  if v_comped_vrf.ID is null then
    raise_application_error(-20000,'El Pedido asociado al Proceso de Contratación indicado es incorrecto',true);
  end if;
  -- Verificar el estado del Pedido
  v_compee_id := OBTN_COMPEE_ID(p_comped_id => v_comped_vrf.ID, p_fecha => sysdate);
  SET_COMPEE(p_id => v_compee_id);
  GET_COMPEE(p_compee => v_compee);
  if v_compee.ID is null then
    raise_application_error(-20000,'No se ha podido obtener el estado del Pedido asociado al Proceso de Contratación
indicado',true);
  end if;
  --if v_compee.ESTADO <> 'AUT' then
  --  raise_application_error(-20000,'El Pedido asociado al Proceso de Contratación no se encuentra AUTORIZADO, verifique el estado actual del Pedido',true);
  --end if;
  if v_compee.ESTADO <> 'APR' then
    raise_application_error(-20000,'El Pedido asociado al Proceso de Contratación no se encuentra APROBADO, verifique el
estado actual del Pedido',true);
  end if;

  --
  -- Obtener el Numero a ser asignado al Proceso de Contratación para confirmarlo
  LOOP
    v_comcon_codigo := OBTN_COMCON_NUMERO(p_segorg_id => v_comped_vrf.SEGORG_ID
                                        , p_ejercicio => v_comped_vrf.EJERCICIO);
    -- Verificar que el numero obtenido no se encuentre utilizado
    SET_COMCON_CODIGO(p_segorg_id => v_comped_vrf.segorg_id
                     ,p_ejercicio => v_comped_vrf.ejercicio
                     ,p_codigo    => v_comcon_codigo);
    GET_COMCON(p_comcon => v_comcon);
    if v_comcon.ID is null then
      EXIT;
    end if;
    v_comcon_codigo := NULL;
    INI_COMCON;
  END LOOP;
  -- Actualizar el Proceso con el Numero asignado
  UPDATE COM_CONTRATACIONES
  SET CODIGO = v_comcon_codigo
  WHERE ID = p_comcon_id;
  -- Actualizar el estado de los detalles del pedido asociado al Proceso
  UPDATE COM_PEDIDOS_DETALLES
  SET SITUACION = 'PRO'
  WHERE COMPED_ID = v_comped_vrf.ID;
  -- Actualizar el estado del Pedido asociado al Proceso
  v_compee_crear.COMPED_ID := v_comped_vrf.ID;
  v_compee_crear.FECHA     := SYSDATE;
  v_compee_crear.ESTADO    := 'PRO';
  v_compee_crear.MOTIVO    := NULL;
  --
  INS_COMPEE(p_compee => v_compee_crear);
  --
  -- Actualizar el estado del Proceso
  v_comcoe_crear.COMCON_ID := p_comcon_id;
  v_comcoe_crear.FECHA     := SYSDATE;
  v_comcoe_crear.ESTADO    := 'PEN';
  v_comcoe_crear.MOTIVO    := NULL;
  --
  INS_COMCOE(p_comcoe => v_comcoe_crear);
  --
  INI_COMPEE;
  INI_COMCOE;
  --
  p_comcon_codigo := v_comcon_codigo;
  --
END;
PROCEDURE COMCON_ESPECIAL
 (P_COMCON_ID IN NUMBER
 ,P_COMPRV_ID IN NUMBER
 )
 IS
-- Definición de Cursores
 -- Detalle del Pedido del proceso
 CURSOR cr_comcdp IS
 SELECT COMPED_ID
       ,COMPET_ID
       ,PRECIO_UNITARIO
 FROM COM_CONTRATACIONES_DETPED_V COMCDP
 WHERE COMCDP.COMCON_ID = p_comcon_id;
 --
 v_comcon COM_CONTRATACIONES%ROWTYPE;
 v_comprv COM_PROVEEDORES%ROWTYPE;
 v_comcoe COM_CONTRATACIONES_EST%ROWTYPE;
 v_comcoi COM_CONTRATACIONES_INV%ROWTYPE;
 v_comczd COM_COTIZACIONES_DETALLES%ROWTYPE;
 v_comctz_id NUMBER;
 v_comadj_id NUMBER;
BEGIN
  -- Verificar que los parámetros no sean Nulos
  IF p_comcon_id IS NULL THEN
    raise_application_error(-20000,'El Proceso de Contratación no ha sido indicado y es un dato obligatorio',true);
  ELSIF p_comprv_id IS NULL THEN
    raise_application_error(-20000,'El Proveedor no ha sido indicado y es un dato obligatorio',true);
  END IF;
  --
  -- Verificar que el Proceso de Contratación exista
  COM_PKG.SET_COMCON(p_comcon_id => p_comcon_id);
  COM_PKG.GET_COMCON(p_comcon => v_comcon);
  COM_PKG.INI_COMCON;
  if v_comcon.ID is null then
    raise_application_error(-20000,'El Proceso de Contratación indicado es incorrecto',true);
  end if;
  --
  -- Verificar que el Proveedor exista
  COM_PKG.SET_COMPRV(p_id => p_comprv_id);
  COM_PKG.GET_COMPRV(p_comprv => v_comprv);
  COM_PKG.INI_COMPRV;
  if v_comprv.ID is null then
    raise_application_error(-20000,'El proveedor indicado es incorrecto',true);
  end if;
  --
  -- Generar la invitación para el proveedor
  -- Insertando un registro en la Tabla COM_CONTRATACIONES_INV
  v_comcoi.COMCON_ID  := p_comcon_id;
  v_comcoi.COMPRV_ID  := p_comprv_id;
  v_comcoi.FECHA      := SYSDATE;
  v_comcoi.SITUACION  := 'PEN';
  v_comcoi.OBSERVACION:= '';
  --
  COM_PKG.INS_COMCOI(p_comcoi => v_comcoi);
  --
  -- Agregar las fechas al proceso
  UPDATE COM_CONTRATACIONES
  SET FECHA_PUBLICACION          = SYSDATE
    , FECHA_LIMITE_PREGUNTA      = SYSDATE
    , FECHA_INICIO_PROPUESTA     = SYSDATE
    , FECHA_FIN_PROPUESTA        = SYSDATE
    , FECHA_APERTURA_PROPUESTA    = SYSDATE
    , FECHA_INICIO_EVALUACION     = SYSDATE
    , FECHA_ESTIMADA_ADJUDICACION = SYSDATE
  WHERE ID = p_comcon_id;
  --
  -- Activar el proceso seteando el motivo
  v_comcoe.COMCON_ID   := p_comcon_id;
  v_comcoe.FECHA       := SYSDATE;
  v_comcoe.ESTADO      := 'ACT';
  v_comcoe.MOTIVO      := 'Contratación Especial';

  COM_PKG.INS_COMCOE(P_COMCOE => v_comcoe);
  --
  -- Activar la invitación
  UPDATE COM_CONTRATACIONES_INV
  SET SITUACION = 'ACT'
  WHERE COMCON_ID = p_comcon_id
    AND SITUACION = 'PEN';
  --
  -- Agregar la cotización al proceso por el monto de cada item del pedido
  -- para el proveedor indicado
  BEGIN
    -- Crear Cabezera de la Cotización
    COM_PKG.COMCTZ_CREAR(p_comcon_id => p_comcon_id
                         ,p_comprv_id => p_comprv_id
                         ,p_comctz_id => v_comctz_id);
    -- Por cada Items de los Pedidos incluidos en el Proceso
    -- Agregar la cotización
    FOR v_comcdp IN cr_comcdp LOOP
      --
      UPDATE COM_COTIZACIONES_DETALLES
      SET PRECIO_UNITARIO_FINAL  = v_comcdp.PRECIO_UNITARIO
         ,MARCA                  = '.'
         ,MODELO                 = '.'
         ,OBSERVACION            = '.'
      WHERE COMCTZ_ID = v_comctz_id
        and COMPET_ID = v_comcdp.COMPET_ID;
      --
    END LOOP;
    -- Actualizar la cabezera de la Cotización
    -- seteando la observación y cambiando la situación a PRE
    UPDATE COM_COTIZACIONES
    SET observacion = 'Contratación Especial'
       ,situacion = 'PRE'
    WHERE id = v_comctz_id;
  EXCEPTION
    WHEN OTHERS THEN
      raise_application_error(-20000,'La cotización no pudo ser realizada',true);
  END;
  --
  -- Evaluar el Proceso
  BEGIN
    --
    COM_PKG.COMCON_EVAL (p_comcon_id => p_comcon_id);
    --
  EXCEPTION
    WHEN OTHERS THEN
      raise_application_error(-20000,'La evaluación no pudo ser realizada',true);
  END;
  --
  -- Adjudicar el Proceso
  BEGIN
    --
    COM_PKG.COMADJ_GENERACION(p_comcon_id => p_comcon_id
                             ,p_comadj_id => v_comadj_id);
    --
  EXCEPTION
    WHEN OTHERS THEN
      raise_application_error(-20000,'La Adjudicación no pudo ser realizada',true);
  END;
  --
EXCEPTION
  WHEN OTHERS THEN
    raise_application_error(-20000,'La generación automática de la Adjudicación para la Contratacion Especial no pudo ser realizada',true);
END;
/* Evaluar Proceso de Compra */
PROCEDURE COMCON_EVAL
 (P_COMCON_ID IN NUMBER
 )
 IS
CURSOR cr_comcon IS
  SELECT ID
       , SEGORG_ID
       , COMCTT_ID
       , MONTO_PRESUPUESTO
       , METODO_ADJUDICACION
  FROM COM_CONTRATACIONES
  WHERE ID = p_comcon_id;
BEGIN
  --
  FOR v_comcon IN cr_comcon LOOP
    --
    IF v_comcon.METODO_ADJUDICACION = 'MPIND' THEN
      --
      COMCON_EVAL_MPIND (p_comcon_id => p_comcon_id);
      --
    ELSIF v_comcon.METODO_ADJUDICACION = 'MPTOT' THEN
      --
      COMCON_EVAL_MPTOT (p_comcon_id => p_comcon_id);
      --
    END IF;
    --
  END LOOP;
  --
END;
/* Evaluar Contratacion Metodo Menor Precio Individual */
PROCEDURE COMCON_EVAL_MPIND
 (P_COMCON_ID IN NUMBER
 )
 IS
-- Pedidos en la Contratacion
  CURSOR cr_comcot IS
  SELECT comcot.COMPED_ID
  FROM COM_CONTRATACIONES_DETALLES comcot
  WHERE comcot.COMCON_ID = p_comcon_id;
  -- Detalle de cada pedido
  CURSOR cr_compet (p_comped_id IN NUMBER) IS
  SELECT compet.ID
        ,compet.COMCIT_ID
  FROM COM_PEDIDOS_DETALLES compet
  WHERE compet.COMPED_ID = p_comped_id;
  -- Cotizaciones para el detalle
  CURSOR cr_comczd (p_compet_id IN NUMBER, p_comped_id IN NUMBER) IS
  SELECT comczd.ID
        ,comczd.PRECIO_UNITARIO_FINAL
  FROM COM_COTIZACIONES_DETALLES comczd
      ,COM_COTIZACIONES comctz
  WHERE comctz.ID = comczd.COMCTZ_ID
    AND comctz.SITUACION = 'PRE'
    AND comczd.COMPET_ID = p_compet_id
    AND comczd.COMPED_ID = p_comped_id
    AND comctz.COMCON_ID = p_comcon_id
--    AND comczd.PRECIO_UNITARIO_FINAL >= 0
  ORDER BY comczd.PRECIO_UNITARIO_FINAL, comczd.ID;
  --
  v_comcoe COM_CONTRATACIONES_EST%rowtype;
  v_preadj NUMBER:= 0;
  v_permite_cotizar_cero_sn VARCHAR2(2);
  v_verificar_sobreprecio_sn VARCHAR2(2);
BEGIN
  -- Verificar si se permite cotizar en Cero
    v_permite_cotizar_cero_sn := SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO    => 'COMPRV_COMCZD_COTIZAR_CERO_SN'
                                                          ,P_SEGORG_ID => SEG_PKG.OBTN_ORGUSU(NVL(v('APP_USER'),USER)));
  --
  FOR v_comcot IN cr_comcot LOOP
    --
    FOR v_compet IN cr_compet (p_comped_id => v_comcot.COMPED_ID) LOOP
      --
      DECLARE
        v_comczd_evaluacion            NUMBER:= 0;
        v_comczd_motivo_evaluacion     VARCHAR2(500);
        v_comczd_informe_evaluacion    VARCHAR2(4000):= NULL;
      BEGIN
        FOR v_comczd IN cr_comczd (p_compet_id => v_compet.ID, p_comped_id => v_comcot.COMPED_ID) LOOP
          --
          -- Solo si No se permite Cotizar en Cero y el Precio Cotizado es 0 no asigno Ranking
          IF v_comczd.PRECIO_UNITARIO_FINAL > 0 OR v_permite_cotizar_cero_sn = 'SI' THEN
            v_comczd_evaluacion := v_comczd_evaluacion+1;
            v_comczd_motivo_evaluacion := 'Evaluacion automática - Menor Precio individual presentado';
            --
            -- Ejecutar controles solo para Items Nomenclados
            if v_compet.COMCIT_ID is not null then
             --
             -- Verificar si se controla Sobreprecio
             v_verificar_sobreprecio_sn := SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO    => 'COMADM_OBTN_SOBREPRECIO_SN'
                                                          ,P_SEGORG_ID => SEG_PKG.OBTN_ORGUSU(NVL(v('APP_USER'),USER)));
             if nvl(v_verificar_sobreprecio_sn,'NO') = 'SI' then
             --
              v_comczd_informe_evaluacion := compnc_pkg.COMPNI_OBTN_VALOR_CODIGO(p_codigo => 'SOBREPRECIO_ADJ'
                                                                               , p_tipo_visualizacion => 'COM_N'
                                                                               , p_dato_id => v_compet.COMCIT_ID
                                                                               , p_numero_comparar => v_comczd.PRECIO_UNITARIO_FINAL);
             end if;
             --
            end if;
            --
            UPDATE COM_COTIZACIONES_DETALLES
            SET EVALUACION = v_comczd_evaluacion
               ,MOTIVO_EVALUACION  = v_comczd_motivo_evaluacion
               ,INFORME_EVALUACION = v_comczd_informe_evaluacion
            WHERE ID = v_comczd.ID;
            --
            v_preadj := v_preadj+1;
            --
           END IF;
           --
        END LOOP;
        --
        IF v_comczd_evaluacion = 0 THEN -- Desierto
          --
          UPDATE COM_PEDIDOS_DETALLES
          SET SITUACION = 'DES'
          WHERE ID = v_compet.ID;
          --
        ELSE -- El item fue evaluado
          --
          UPDATE COM_PEDIDOS_DETALLES
          SET SITUACION = 'PAD'
          WHERE ID = v_compet.ID;
          --
        END IF;
        --
      END;
      --
    END LOOP;
    --
  END LOOP;
  --
  v_comcoe.COMCON_ID := p_comcon_id;
  v_comcoe.FECHA := SYSDATE;
  -- Si se presento al menos un proveedor al proceso
  IF v_preadj > 0 THEN
    v_comcoe.ESTADO := 'PRE';
  -- Si no se presento ningun proveedor al proceso
  ELSE
    v_comcoe.ESTADO := 'DES';
  END IF;
  --
  v_comcoe.MOTIVO := 'Evaluación Automática';
  --
  INS_COMCOE(p_comcoe => v_comcoe);
  --
END;
/* Evaluar Contratacion Metodo Menor Precio Total */
PROCEDURE COMCON_EVAL_MPTOT
 (P_COMCON_ID IN NUMBER
 )
 IS
-- Pedidos en la Contratacion
  CURSOR cr_comcot IS
  SELECT comcot.COMPED_ID
  FROM COM_CONTRATACIONES_DETALLES comcot
  WHERE comcot.COMCON_ID = p_comcon_id;
  -- Cotizaciones para el detalle
  CURSOR cr_comctz IS
  SELECT *
  FROM (
   SELECT comctz.ID
         ,comctz.COMPRV_ID
         ,(SELECT sum(comczd.PRECIO_UNITARIO_FINAL)
           FROM COM_COTIZACIONES_DETALLES comczd
           WHERE comctz.ID = comczd.COMCTZ_ID) PRECIO
    FROM COM_COTIZACIONES comctz
   WHERE comctz.COMCON_ID = p_comcon_id
     AND comctz.SITUACION = 'PRE'
    )
  WHERE PRECIO > 0
  ORDER BY PRECIO, ID;
  --
  v_comcoe COM_CONTRATACIONES_EST%rowtype;
  v_preadj NUMBER:= 0;
  v_comczd_evaluacion            NUMBER:= 0;
  v_comczd_motivo_evaluacion     VARCHAR2(500);
BEGIN
  --
  FOR v_comcot IN cr_comcot LOOP
    --
      FOR v_comctz IN cr_comctz LOOP
        --
        v_comczd_evaluacion := v_comczd_evaluacion+1;
        v_comczd_motivo_evaluacion := 'Evaluacion automática - Menor Precio Total presentado';
        --
        UPDATE COM_COTIZACIONES_DETALLES
           SET EVALUACION = v_comczd_evaluacion
              ,MOTIVO_EVALUACION  = v_comczd_motivo_evaluacion
         WHERE COMCTZ_ID = v_comctz.ID;
        --
        v_preadj := v_preadj+1;
        --
      END LOOP;
      --
      IF v_comczd_evaluacion = 0 THEN -- Desierto
       --
       UPDATE COM_PEDIDOS_DETALLES
          SET SITUACION = 'DES'
        WHERE COMPED_ID = v_comcot.comped_id;
        --
      ELSE -- El item fue evaluado
        --
       UPDATE COM_PEDIDOS_DETALLES
          SET SITUACION = 'PAD'
        WHERE COMPED_ID = v_comcot.comped_id;
       --
      END IF;
      --
  END LOOP;
  --
  v_comcoe.COMCON_ID := p_comcon_id;
  v_comcoe.FECHA := SYSDATE;
  -- Si se presento al menos un proveedor al proceso
  IF v_preadj > 0 THEN
    v_comcoe.ESTADO := 'PRE';
  -- Si no se presento ningun proveedor al proceso
  ELSE
    v_comcoe.ESTADO := 'DES';
  END IF;
  --
  v_comcoe.MOTIVO := 'Evaluación Automática';
  --
  INS_COMCOE(p_comcoe => v_comcoe);
  --
END;
/* Evaluar Proceso de Compra */
PROCEDURE COMCON_EVALANU
 (P_COMCON_ID IN NUMBER
 )
 IS
CURSOR cr_comcon IS
  SELECT ID
       , SEGORG_ID
       , COMCTT_ID
       , MONTO_PRESUPUESTO
       , METODO_ADJUDICACION
  FROM COM_CONTRATACIONES
  WHERE ID = p_comcon_id;
BEGIN
  --
  FOR v_comcon IN cr_comcon LOOP
    --
    IF v_comcon.METODO_ADJUDICACION = 'MPIND' THEN
      --
      COMCON_EVALANU_MPIND (p_comcon_id => p_comcon_id);
      --
    END IF;
    --
  END LOOP;
  --
END;
/* Evaluar Contratacion Metodo Menor Precio Individual */
PROCEDURE COMCON_EVALANU_MPIND
 (P_COMCON_ID IN NUMBER
 )
 IS
-- Pedidos en la Contratacion
  CURSOR cr_comcot IS
  SELECT comcot.COMPED_ID
  FROM COM_CONTRATACIONES_DETALLES comcot
  WHERE comcot.COMCON_ID = p_comcon_id;
  --
  -- Cotizaciones realizadas
  CURSOR cr_comctz IS
  SELECT comctz.ID
  FROM COM_COTIZACIONES comctz
  WHERE comctz.COMCON_ID = p_comcon_id
    AND SITUACION NOT IN ('NUE','ANU','RCH');
  --
  v_comcoe COM_CONTRATACIONES_EST%rowtype;
BEGIN
  --
  FOR v_comcot IN cr_comcot LOOP
    --
    UPDATE COM_PEDIDOS_DETALLES
    SET SITUACION = 'PRO'
    WHERE COMPED_ID = v_comcot.COMPED_ID;
    --
  END LOOP;
  --
  FOR v_comctz IN cr_comctz LOOP
    --
    UPDATE COM_COTIZACIONES_DETALLES
    SET EVALUACION = NULL
      , MOTIVO_EVALUACION = NULL
      , INFORME_EVALUACION = NULL
    WHERE EVALUACION IS NOT NULL
     AND  COMCTZ_ID = v_comctz.ID;
    --
  END LOOP;
  --
  v_comcoe.COMCON_ID := p_comcon_id;
  v_comcoe.FECHA := SYSDATE;
  v_comcoe.ESTADO := 'ACT';
  v_comcoe.MOTIVO := 'Evaluación revertida';
  --
  INS_COMCOE(p_comcoe => v_comcoe);
  --
END;
/* Finalizar las contrataciones que cumplen las condiciones de cierre. */
PROCEDURE COMCON_FIN_AUTOMA
 (P_CANT_DIAS IN NUMERIC
 ,P_MOTIVO IN VARCHAR2
 )
 IS
-- Cursor que trae todas las contrataciones en estado ADJ
CURSOR cr_comcon IS
 SELECT COMCON.ID, COMCOE.ESTADO, COMCOE.FECHA
 FROM COM_CONTRATACIONES COMCON
     ,COM_CONTRATACIONES_EST COMCOE
 WHERE COMCOE.ID = COM_PKG.OBTN_COMCOE_ID(COMCON.ID)
   AND COMCON.ID = COMCOE.COMCON_ID
   AND COMCOE.ESTADO IN ('ADJ','DES');

 -- Cursor que cuenta la cantidad de ordenes de compras pendientes
 -- para una contratacion dada
 CURSOR cr_comocm(p_comcon_id number) IS
 SELECT count(COMOCE.ESTADO) Cant_Ord
 FROM COM_ORDENES_COMPRAS COMOCM
     ,COM_ORDENES_COMPRAS_EST COMOCE
 WHERE COMOCM.COMCON_ID = p_comcon_id
   AND COMOCE.ID = COM_PKG.OBTN_COMOCE_ID(COMOCM.ID)
   AND COMOCM.ID = COMOCE.COMOCM_ID
   AND COMOCE.ESTADO = 'PEN';

 -- Cursor que me da la ultima fecha de aprobacion de ordenes de compras
 -- para una contratacion dada
 CURSOR cr_comocm_fecha(p_comcon_id number) IS
 SELECT MAX(COMOCE.FECHA) fecha
 FROM COM_ORDENES_COMPRAS COMOCM
     ,COM_ORDENES_COMPRAS_EST COMOCE
 WHERE COMOCM.COMCON_ID = p_comcon_id
   AND COMOCE.ID = COM_PKG.OBTN_COMOCE_ID(COMOCM.ID)
   AND COMOCM.ID = COMOCE.COMOCM_ID
   AND COMOCE.ESTADO NOT IN ('PEN','NUE');

 --
 v_comocm           cr_comocm%ROWTYPE;
 v_comcon           cr_comcon%ROWTYPE;
 v_comocm_fecha     cr_comocm_fecha%ROWTYPE;
 v_segorg           SEG_ORGANIZACIONES%ROWTYPE;
 v_plazo_fin_prc    NUMBER := P_CANT_DIAS;
BEGIN
  -- obtener la organizacion PCYCSL
  SEG_PKG.SET_SEGORG_CODIGO(p_codigo    => 'PCYCSL');
  SEG_PKG.GET_SEGORG(p_segorg => v_segorg);
  SEG_PKG.INI_SEGORG;
  IF v_segorg.id IS NOT NULL THEN
    -- si esta configurado
    IF v_plazo_fin_prc IS NOT NULL THEN
      -- Por cada proceso Adjudicado  -- Verificar si cumple para ser finalizado --
      FOR v_comcon IN cr_comcon LOOP
        -- Obtener la cantidad de ordenes de compras en estado PENDIENTE
        OPEN  cr_comocm(v_comcon.ID);
        FETCH cr_comocm INTO v_comocm;
        CLOSE cr_comocm;
        -- Si la cantidad de ordenes de compra en estado PEN es 0
        IF   v_comocm.Cant_Ord = 0 THEN
          -- Obtener la fecha de aprobación de ordenes de compras en estado PENDIENTE
          OPEN  cr_comocm_fecha(v_comcon.ID);
          FETCH cr_comocm_fecha INTO v_comocm_fecha;
          CLOSE cr_comocm_fecha;
          -- Si la fecha de aprobacion de la última orden + los dias configurados es
          -- menor o igual a la fecha actual
          --
          --
          --
            -- Finalizar el proceso
          IF v_comcon.ESTADO = 'ADJ' THEN
            IF (NVL(v_comocm_fecha.FECHA,SYSDATE+1) + v_plazo_fin_prc) <= SYSDATE THEN
                com_pkg.COMCON_FINALIZAR ( p_comcon_id => v_comcon.ID
                                        ,p_comped_estado => 'ADJ');
            END IF;
          ELSE
            IF v_comcon.ESTADO = 'DES' THEN
                IF (v_comcon.FECHA+ v_plazo_fin_prc) <= SYSDATE THEN
                 com_pkg.COMCON_FINALIZAR ( p_comcon_id => v_comcon.ID
                                        ,p_comped_estado => 'DES');
                END IF;
            END IF;
          END IF;
        END IF;
        --
      END LOOP;
    END IF;
  END IF;
END;
/* Finalizar la contratación */
PROCEDURE COMCON_FINALIZAR
 (P_COMCON_ID IN NUMBER
 ,P_COMPED_ESTADO IN COM_PEDIDOS_EST.ESTADO%TYPE
 )
 IS
-- Declaración de Cursores
  CURSOR cr_comcot IS
  SELECT COMPED_ID
  FROM COM_CONTRATACIONES_DETALLES
  WHERE COMCON_ID = p_comcon_id;
  -- Declaración de Variables
  v_comcoe  COM_CONTRATACIONES_EST%rowtype;
  v_compee COM_PEDIDOS_EST%ROWTYPE;
BEGIN
  --
  FOR v_comcot IN cr_comcot LOOP
    --
    IF v_comcot.COMPED_ID IS NOT NULL THEN
      -- Inserto Estado pasado al Pedido
      SELECT COMPEE_ID.NEXTVAL INTO v_compee.ID FROM DUAL;
      v_compee.COMPED_ID  := v_comcot.COMPED_ID;
      v_compee.FECHA      := SYSDATE;
      v_compee.ESTADO     := p_comped_estado;
      v_compee.MOTIVO     := 'Finalizó el Proceso';
      --
      INS_COMPEE(P_COMPEE => v_compee);
      --
    END IF;
    --
  END LOOP;
  --
  -- Inserto Estado al Proceso
  SELECT COMCOE_ID.NEXTVAL INTO v_comcoe.ID FROM DUAL;
  v_comcoe.COMCON_ID := p_comcon_id;
  v_comcoe.FECHA     := SYSDATE;
  v_comcoe.ESTADO    := 'FIN';
  v_comcoe.MOTIVO    := 'Finalizado a pedido';
  --
  INS_COMCOE(p_comcoe => v_comcoe);
  --
END;
/* Forzar contratación desierta */
PROCEDURE COMCON_FRZDES
 (P_SEGORG_ID IN NUMBER
 ,P_COMCON_ID IN NUMBER
 ,P_MOTIVO IN VARCHAR2
 ,P_FECHA IN DATE := SYSDATE
 ,P_INTENV_ID OUT NUMBER
 )
 IS
CURSOR cr_comcot IS
   SELECT *
   FROM COM_CONTRATACIONES_DETALLES
   WHERE COMCON_ID = p_comcon_id;
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
   v_comcon    COM_CONTRATACIONES%ROWTYPE;
   v_comcot    com_contrataciones_detalles%rowtype;
   v_comcoe    COM_CONTRATACIONES_EST%ROWTYPE;
   v_comcdg    com_contrataciones_docgen%rowtype;
   v_compee    COM_PEDIDOS_EST%ROWTYPE;
   v_comped    COM_PEDIDOS%ROWTYPE;
   v_inttpo    int_tipos_objetos%ROWTYPE;
   v_comctt    com_contrataciones_tipos%ROWTYPE;
   --
   v_comcdg_id          number;
   v_documento_id       number;
   v_motivo             varchar2(2000);
   v_referencia         varchar2(2000);
   v_intene_id          number;
   v_intenv_id          number;
   v_inttpo_id          number;
   v_comdct_id          number;
   v_comped_id          number;
   --
BEGIN
   --
   COM_PKG.SET_COMCON(p_comcon_id => p_comcon_id);
   COM_PKG.GET_COMCON(p_comcon => v_comcon);
   COM_PKG.INI_COMCON;
   --
   -- Validar que existe el proceso
   --
   if v_comcon.id is null then
      raise_application_error(-20000,'El Proceso de Contratacion especificado No Existe',true);
   end if;
   --
   OPEN cr_comctt(v_comcon.comctt_id);
   FETCH cr_comctt INTO v_comctt;
   CLOSE cr_comctt;
   --
   if v_comctt.id is null then
      raise_application_error(-20000,'No se ha podido determinar el tipo de Contratación',true);
   end if;
      --
      SELECT COMCOE_ID.NEXTVAL
      INTO v_comcoe.ID
      FROM DUAL;
      --
      v_comcoe.COMCON_ID := p_comcon_id;
      v_comcoe.FECHA     := p_fecha;
      v_comcoe.ESTADO    := 'DES';
      v_comcoe.MOTIVO    := p_motivo;
      --
      COM_PKG.INS_COMCOE(p_comcoe => v_comcoe);
      --
END;
/* Transmitir Documento a Tramix */
PROCEDURE COMCON_FRZDES_TRANSMITIR
 (P_SEGORG_ID IN NUMBER
 ,P_COMCON_ID IN NUMBER
 ,P_INTENV_ID OUT NUMBER
 )
 IS
CURSOR cr_comcot IS
   SELECT *
   FROM COM_CONTRATACIONES_DETALLES
   WHERE COMCON_ID = p_comcon_id;
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
   cursor cr_conf is
   select valor
   from seg_configuraciones
   where segorg_id = P_SEGORG_ID
   and codigo = 'COMCON_SRVINT_TRAMIX_HABILITADO_SN';
   --
   cursor cr_comdct is
   select id from com_documentos_tipos
   where segorg_id = p_segorg_id
   and codigo = 'COM_CONTRATACION_DES';
   --
   v_comcon    COM_CONTRATACIONES%ROWTYPE;
   v_comcot    com_contrataciones_detalles%rowtype;
   v_comcoe    COM_CONTRATACIONES_EST%ROWTYPE;
   v_comcdg    com_contrataciones_docgen%rowtype;
   v_compee    COM_PEDIDOS_EST%ROWTYPE;
   v_comped    COM_PEDIDOS%ROWTYPE;
   v_inttpo    int_tipos_objetos%ROWTYPE;
   v_intene    int_envios_est%ROWTYPE;
   v_comctt    com_contrataciones_tipos%ROWTYPE;
   --
   v_habilitado         varchar2(10);
   v_comcdg_id          number;
   v_documento_id       number;
   v_respuesta_ws       varchar2(2000);
   v_resultado_ws       varchar2(2000);
   v_actuacion_identif  varchar2(2000);
   v_motivo             varchar2(2000);
   v_referencia         varchar2(2000);
   v_intene_id          number;
   v_intenv_id          number;
   v_inttpo_id          number;
   v_comdct_id          number;
   v_comped_id          number;
   --
BEGIN
   --
   COM_PKG.SET_COMCON(p_comcon_id => p_comcon_id);
   COM_PKG.GET_COMCON(p_comcon => v_comcon);
   COM_PKG.INI_COMCON;
   --
   -- Validar que existe el proceso
   --
   if v_comcon.id is null then
      raise_application_error(-20000,'El Proceso de Contratacion especificado No Existe',true);
   end if;
   --
   OPEN cr_comctt(v_comcon.comctt_id);
   FETCH cr_comctt INTO v_comctt;
   CLOSE cr_comctt;
   --
   if v_comctt.id is null then
      raise_application_error(-20000,'No se ha podido determinar el tipo de Contratación',true);
   end if;
      --
      for v_conf in cr_conf loop
         if v_conf.valor = 'SI' then
            v_habilitado := 'SI';
         else
            v_habilitado := 'NO';
            raise_application_error(-20000,'La integracion no se encuentra habilitada',true);
         end if;
      end loop;
      dbms_output.put_line('v_habilitado = ' || v_habilitado);

   --
   -- Obtener el tipo de documento
   --
   OPEN cr_comdct;
   FETCH cr_comdct INTO v_comdct_id;
   CLOSE cr_comdct;
   --
   if v_comdct_id is null then
      raise_application_error(-20000,'No se ha podido determinar el tipo de documento del Proceso de Contratación',true);
   end if;
   --
   -- Obtener los datos del Detalle de Contratacion
   --
   OPEN cr_comcot;
   FETCH cr_comcot INTO v_comcot;
   CLOSE cr_comcot;
   --
   -- Validar que existe el detalle
   --
   if v_comcot.id is null then
      raise_application_error(-20000,'No se han encontrado datos del detalle de Contratación',true);
   end if;

   --
   -- Obtener los datos del pedido
   --
   v_comped_id := v_comcot.comped_id;
   OPEN cr_comped(v_comped_id);
   FETCH cr_comped INTO v_comped;
   CLOSE cr_comped;
   --
   -- Validar que existe el pedido
   --
   if v_comped.id is null then
      raise_application_error(-20000,'La solicitud de Gasto especificada No Existe',true);
   end if;
   --
   -- 1. Generar y Grabar el Documento
   --
   v_documento_id := com_pkg.obtn_comcon_des_pdf(p_segorg_id => p_segorg_id
                                                ,p_comcon_id => p_comcon_id);
   --
   -- 2. Grabar referencia Proceso de Contratacion-Documento
   --
   SELECT COMCDG_ID.NEXTVAL INTO v_comcdg_id FROM DUAL;
   v_comcdg.ID        := v_comcdg_id;
   v_comcdg.COMCON_ID := p_comcon_id;
   v_comcdg.COMDCT_ID := v_comdct_id;
   v_comcdg.COMDOC_ID := v_documento_id;
   v_comcdg.FECHA     := sysdate;
   COM_PKG.COMCDG_INS(p_comcdg => v_comcdg);
   --
   -- 3. Transmitir el Documento al WebService
   --
   v_actuacion_identif := 'PRODES' || '-' || 'PROCESO DE CONTRATACION '|| 'N°: ' || v_comcon.codigo || '/' ||  v_comped.ejercicio || ' - ' || v_comctt.NOMBRE  || ' - ' || 'DECLARADO DESIERTO';
   v_respuesta_ws := COM_PKG.COMCON_INVOCAR_WS(p_comcdg_id         => v_comcdg_id
                                              ,p_actuacion_identif => v_actuacion_identif
                                              ,p_valida            => 1);
   --
   update com_contrataciones_docgen
   set xml_enviado = xml_enviado || chr(13) || chr(10) || to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss') || chr(13) || chr(10) || v_respuesta_ws
   where id = v_comcdg_id;
   --
   -- 4. Parseamos el resultado del Webservice
   --
   COM_PKG.COMCON_PROC_XML_ACT(p_xml       => v_respuesta_ws
                              ,p_segorg_id => p_segorg_id
                              ,p_resultado => v_resultado_ws
                              ,p_motivo    => v_motivo
                              ,p_referencia=> v_referencia);
   --
   ----------------------------------------------------------
   -- 5. Grabar Log en Envíos
   ----------------------------------------------------------
   INT_PKG.INTTPO_SET_CODIGO(p_segorg_id => p_segorg_id
                            ,p_codigo    => 'COMCON_ACTUACION');
   INT_PKG.INTTPO_GET(p_inttpo => v_inttpo);
   v_inttpo_id := v_inttpo.id;
   --
   INT_PKG.INTENV_REGISTRAR(
                  P_INTTPO_ID     => v_inttpo_id
                 ,P_INTENV_OBJETO => '<comdoc_id>'    || v_documento_id || '</comdoc_id>'
                 ,P_INTENV_OBS    => v_respuesta_ws
                 ,P_INTENV_RES    => '<return>'       || v_resultado_ws || '<return>'        ||
                                     '<actuacion_id>' || v_referencia   || '</actuacion_id>'
                 ,P_INTENE_FECHA  => sysdate
                 ,P_INTENV_ID     => v_intenv_id
   );
   --
   IF instr(v_resultado_ws,'OP_COMPLETED') > 0 THEN
      --
      -- 8.A Modificar Estado del Envio a ENVIADO
      --
      SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
      v_intene.ID            := v_intene_id;
      v_intene.INTENV_ID     := v_intenv_id;
      v_intene.FECHA         := sysdate;
      v_intene.ESTADO        := 'ENV';
      v_intene.MOTIVO_ESTADO := v_motivo;
      INT_PKG.INTENE_INS(p_intene => v_intene);
      --
   ELSE
      --
      -- 8.B Modificar Estado del Envio a ERROR
      --
      SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
      v_intene.ID            := v_intene_id;
      v_intene.INTENV_ID     := v_intenv_id;
      v_intene.FECHA         := sysdate;
      v_intene.ESTADO        := 'ERR';
      v_intene.MOTIVO_ESTADO := v_motivo;
      INT_PKG.INTENE_INS(p_intene => v_intene);
      --
   END IF;
   --
   p_intenv_id := v_intenv_id;
   --
END;
/* Invocar Web Service Actuaciones Tramix - Solicitud de Gasto - Adjuntos */
FUNCTION COMCON_INVOCAR_WS_ADJUNTO
 (P_ACTUACION_ID IN VARCHAR2
 ,P_COMCOD_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
req_body             CLOB;
   chunk_buffer_clob    CLOB;
   buffersize           NUMBER(4) := 2000;
   chunk_buffer         VARCHAR2(2000);
   chunk_length         NUMBER(4);
   chunk_offset         NUMBER;
   request_body_length  NUMBER;
   req                  utl_http.req;
   resp                 utl_http.resp;
   v_response_text      VARCHAR2(32767);
   v_url                VARCHAR2(1000);
   actuacion_identif    VARCHAR2(1000);
   v_username           VARCHAR2(100);
   v_ticket             VARCHAR2(100);
   v_fecha_adjunto      VARCHAR2(100);
   v_comcon             com_contrataciones%rowtype;
   v_comped             com_pedidos%rowtype;
   v_comdoc             com_documentos%rowtype;
   v_comcod             com_contrataciones_doc%rowtype;
   --
   cursor cr_comcon (p_comcon_id number) is
   select * from com_contrataciones comcon
   where comcon.id = p_comcon_id;
   --
   cursor cr_comcod is
   select * from com_contrataciones_doc
   where id = p_comcod_id;
   --
   cursor cr_comdoc (p_comdoc_id number) is
   select * from com_documentos comdoc
   where comdoc.id = p_comdoc_id;
   --
   --cursor cr_comped (p_comped_id number) is
   --select * from com_pedidos comped
   --where comped.id = p_comped_id;
   --
   --
   cursor cr_comcot (p_comcon_id number) is
   select * from com_contrataciones_detalles comcot
   where comcot.comcon_id = p_comcon_id;
   --
begin
   open cr_comcod;
   fetch cr_comcod into v_comcod;
   close cr_comcod;
   --
   open cr_comdoc(v_comcod.comdoc_id);
   fetch cr_comdoc into v_comdoc;
   close cr_comdoc;
   --
   open cr_comcon(v_comcod.comcon_id);
   fetch cr_comcon into v_comcon;
   close cr_comcon;
   --
   -- Necesitamos obtener el número de expediente
   -- Buscamos en el detalle del proceso el id del pedido
   --
   --open cr_comcot(v_comcod.comcon_id);
   --fetch cr_comcot into v_comcot;
   --close cr_comcot;
   --
   -- con el id del pedido del detalle obtenemos la cabecera del pedido
   --
   --open cr_comped(v_comcot.comped_id);
   --fetch cr_comped into v_comped;
   --close cr_comped;
   --
   req_body := COM_PKG.Blob2ClobBase64(v_comdoc.documento);
   --
   --url := 'http://64.215.200.12:81/tramix-flex/services/ActWebService';
   v_url      := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_URL_ACTUACION'
                                         ,p_segorg_id =>  v_comcon.segorg_id);
   --
   v_ticket   := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_TICKET'
                                         ,p_segorg_id =>  v_comcon.segorg_id);
   --
   --v_username := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_USERNAME'
   --                                      ,p_segorg_id =>  v_comcon.segorg_id);
   v_username := NVL(v('APP_USER'),USER) ;
   --
   --
   -- Extender el tiempo de espera para el time oput a 10 min UTL_HTTP.set_transfer_timeout(180);

   utl_http.set_transfer_timeout(600);

   req := utl_http.begin_request(v_url,'POST','HTTP/1.1');
   --
   utl_http.set_header(req,'Content-Type','text/xml');
   utl_http.set_header(req,'Transfer-Encoding','chunked');
   --
   chunk_buffer :=
   '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ws="ws.unitech.com">
	   <soapenv:Header />
      <soapenv:Body>
	   <ws:insertAdjunto> ';
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;

   utl_http.write_text(req,chunk_buffer);
   --
   v_fecha_adjunto := to_char(v_comcod.FECHA,'dd/mm/yyyy');
   --
   chunk_buffer :='<ticket>'            || v_ticket                || '</ticket> '           ||
                  '<usuario_identif>'   || v_username              || '</usuario_identif> '  ||
      				'<actuacion_identif>' || p_actuacion_id          || '</actuacion_identif>' ||
      				'<adjunto_nombre>'    || v_comdoc.NOMBRE_ARCHIVO || '</adjunto_nombre>'    ||
      				'<adjunto_fecha>'     || v_fecha_adjunto         || '</adjunto_fecha> '    ||
      				'<adjunto_descr>'     || v_comdoc.NOMBRE_ARCHIVO || '</adjunto_descr> '    ||
      				'<attachment>';
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   utl_http.write_text(req,chunk_buffer);
   --
   request_body_length := dbms_lob.getlength(req_body);
   chunk_offset := 1;
   while (chunk_offset < request_body_length) loop
      if chunk_offset + buffersize >= request_body_length
      then
         chunk_length := request_body_length - chunk_offset +1 ;
      else
         chunk_length := buffersize;
      end if;
      dbms_lob.read(req_body, chunk_length, chunk_offset, chunk_buffer);
      chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
      utl_http.write_text(req,chunk_buffer);
      chunk_offset := chunk_offset + chunk_length;
   end loop;
   --
   chunk_buffer := '</attachment>';
   --
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   utl_http.write_text(req,chunk_buffer);
   --
   chunk_buffer := '</ws:insertAdjunto>
	                  </soapenv:Body>
                     </soapenv:Envelope>';
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   --
   utl_http.write_text(req,chunk_buffer);
   --
   --insert into xml_requests(xml, fecha)
   --values (chunk_buffer_clob, sysdate);
   --
   resp := utl_http.get_response(req);
   utl_http.read_text(resp, v_response_text, 32767);
   utl_http.end_response(resp);
   --
   return v_response_text;
end;
/* Invocar Web Service Actuaciones Tramix - Proceso de Contratación */
FUNCTION COMCON_INVOCAR_WS
 (P_COMCDG_ID IN NUMBER
 ,P_ACTUACION_IDENTIF IN VARCHAR2
 ,P_VALIDA IN NUMBER
 )
 RETURN VARCHAR2
 IS
--
   cursor cr_comcdg is
   select * from com_contrataciones_docgen comcdg
   where comcdg.id = p_comcdg_id;
   --
   cursor cr_comdoc (p_comdoc_id number) is
   select * from com_documentos comdoc
   where comdoc.id = p_comdoc_id;
   --
   cursor cr_comcon (p_comcon_id number) is
   select * from com_contrataciones comcon
   where comcon.id = p_comcon_id;
   --
   cursor cr_comcot (p_comcon_id number) is
   select * from com_contrataciones_detalles comcot
   where comcot.comcon_id = p_comcon_id;
   --
   cursor cr_comped (p_comped_id number) is
   select comped.*
         ,comeco.codigo||' - '||comeco.nombre contratante_codigo
   from com_pedidos comped
       ,com_contratantes comeco
   where comped.comeco_id = comeco.id
     and comped.id = p_comped_id;
   --
   req_body             CLOB;
   chunk_buffer_clob    CLOB;
   buffersize           NUMBER(4) := 2000;
   chunk_buffer         VARCHAR2(2000);
   chunk_length         NUMBER(4);
   chunk_offset         NUMBER;
   request_body_length  NUMBER;
   req                  utl_http.req;
   resp                 utl_http.resp;
   v_response_text      VARCHAR2(32767);
   v_url                VARCHAR2(1000);
   v_username           VARCHAR2(100);
   v_ticket             VARCHAR2(100);
   v_expdte_fmt_tramix  VARCHAR2(30);
   v_tipo_expdte        VARCHAR2(30);
   v_comcon             com_contrataciones%rowtype;
   v_comcot             com_contrataciones_detalles%rowtype;
   v_comcdg             com_contrataciones_docgen%rowtype;
   v_comdoc             com_documentos%rowtype;
   v_comped             cr_comped%rowtype;
begin
   --
   if p_comcdg_id is null then
      raise_application_error(-20000,'No se ha especificado el id de Documento - Proceso de Contratacion',true);
   end if;
   --
   open cr_comcdg;
   fetch cr_comcdg into v_comcdg;
   close cr_comcdg;
   --
   if v_comcdg.id is null then
      raise_application_error(-20000,'Proceso de Contratacion - El id de Documento especificado No existe',true);
   end if;
   --
   open cr_comdoc(v_comcdg.comdoc_id);
   fetch cr_comdoc into v_comdoc;
   close cr_comdoc;
   --
   open cr_comcon(v_comcdg.comcon_id);
   fetch cr_comcon into v_comcon;
   close cr_comcon;
   --
   -- Necesitamos obtener el número de expediente
   -- Buscamos en el detalle del proceso el id del pedido
   open cr_comcot(v_comcdg.comcon_id);
   fetch cr_comcot into v_comcot;
   close cr_comcot;
   --
   -- con el id del pedido del detalle obtenemos la cabecera del pedido
   --
   open cr_comped(v_comcot.comped_id);
   fetch cr_comped into v_comped;
   close cr_comped;
   --
   -- Deducimos el Tipo de Expediente en funcion del formato
   --
   -- Si es de 6 caracteres es formato viejo No Digital
   --
    if length(substr(v_comped.expediente, 11   )) = 6 then
       v_tipo_expdte := 'EXP-';
       -- Si es de 8 caracteres
    elsif length(substr(v_comped.expediente, 11   )) = 8 then
       -- y si comienza con 00 es formato viejo No Digital
       if substr(v_comped.expediente, 11, 2) = '00' then
          v_tipo_expdte := 'EXP-';
       -- y si el segundo digito es distinto de 0 es formato nuevo Digital
       elsif to_number(substr(v_comped.expediente, 11, 2),'99') > 0 then
          v_tipo_expdte := 'EXD-';
       end if;
    end if;
   --
   -- Si la unidad ejecutora es de la Univercidad de La Punta (ULP) cambiar el Tipo de Expediente a UND-
   if substr(v_comped.contratante_codigo,1,instr(v_comped.contratante_codigo,'-',1)) = 'ULP-' then
      v_tipo_expdte := 'UND-';
   end if;
  --
   v_expdte_fmt_tramix := v_tipo_expdte ||
                        to_number(substr(v_comped.expediente, 1, 4 )) || '-' ||
                        to_number(substr(v_comped.expediente, 11   )) || '-' ||
                        to_number(substr(v_comped.expediente, 8, 2 ));
   --
   dbms_output.put_line('v_expdte_fmt_tramix = ' || v_expdte_fmt_tramix);
   req_body := COM_PKG.Blob2ClobBase64(v_comdoc.documento);
   --
   --url := 'http://64.215.200.12:81/tramix-flex/services/ActWebService';
   v_url      := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_URL_ACTUACION'
                                           ,p_segorg_id =>  v_comcon.segorg_id);
   --
   v_ticket   := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_TICKET'
                                           ,p_segorg_id =>  v_comcon.segorg_id);
   --
   --v_username := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_USERNAME'
   --                                        ,p_segorg_id =>  v_comcon.segorg_id);
   v_username := NVL(v('APP_USER'),USER) ;
   --
   --
   -- Extender el tiempo de espera para el time oput a 10 min UTL_HTTP.set_transfer_timeout(180);

   utl_http.set_transfer_timeout(600);
   req := utl_http.begin_request(v_url,'POST','HTTP/1.1');
   --
   utl_http.set_header(req,'Content-Type','text/xml');
   utl_http.set_header(req,'Transfer-Encoding','chunked');
   --
   chunk_buffer :=
   '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ws="ws.unitech.com">
	   <soapenv:Header />
      <soapenv:Body>
	   <ws:insertActuacionWAttach> ';
   --
chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   --
   utl_http.write_text(req,chunk_buffer);
   --
   chunk_buffer :='  <ticket>'               || v_ticket             || '</ticket> '             ||
      					'<expediente_identif>'  || v_expdte_fmt_tramix  || '</expediente_identif>'  ||
      					'<actuacion_identif>'   || p_actuacion_identif  || '</actuacion_identif>'   ||
      					'<usuario_identif>'     || v_username           || '</usuario_identif> '    ||
      					'<valida>'              || p_valida             || '</valida> '             ||
      					'<attachment>';
   --
chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   --
   utl_http.write_text(req,chunk_buffer);
   --
   request_body_length := dbms_lob.getlength(req_body);
   chunk_offset := 1;
   while (chunk_offset < request_body_length) loop
      if chunk_offset + buffersize >= request_body_length
      then
         chunk_length := request_body_length - chunk_offset +1 ;
      else
         chunk_length := buffersize;
      end if;
      dbms_lob.read(req_body, chunk_length, chunk_offset, chunk_buffer);
   --
chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   --
      utl_http.write_text(req,chunk_buffer);
      chunk_offset := chunk_offset + chunk_length;
   end loop;
   --
   chunk_buffer := '</attachment>';
   --
chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   utl_http.write_text(req,chunk_buffer);
   --
   chunk_buffer := '</ws:insertActuacionWAttach>
	                  </soapenv:Body>
                     </soapenv:Envelope>';
   utl_http.write_text(req,chunk_buffer);
chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;

   dbms_output.put_line('chunk_buffer_clob=' ||dbms_lob.substr( chunk_buffer_clob, 8000, 1 ));

   dbms_output.put_line(   dbms_lob.substr( chunk_buffer_clob, 1000, dbms_lob.getlength(chunk_buffer_clob) - 1000 )  );

   dbms_output.put_line( 'length = ' || dbms_lob.getlength(chunk_buffer_clob));
   --
   --insert into xml_requests(xml, fecha)
   --values (chunk_buffer_clob, sysdate);
   --
   -- Grabamos el log
   --
   update com_contrataciones_docgen
   set xml_enviado = xml_enviado || chr(13) || chr(10) || to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss') || chr(13) || chr(10) || chunk_buffer_clob
   where id = p_comcdg_id;
   --
   resp := utl_http.get_response(req);
   utl_http.read_text(resp, v_response_text, 32767);
   utl_http.end_response(resp);
   --
   return v_response_text;
end;
PROCEDURE COMCON_NOADJUDICADO
 (P_COMCON_ID IN NUMBER
 ,P_MOTIVO IN VARCHAR2
 )
 IS
CURSOR cr_comped IS
  SELECT COMPED_ID
  FROM COM_CONTRATACIONES_DETALLES
  WHERE COMCON_ID = p_comcon_id;
  v_comcon COM_CONTRATACIONES%ROWTYPE;
  v_comcoe COM_CONTRATACIONES_EST%ROWTYPE;
  v_compee COM_PEDIDOS_EST%ROWTYPE;
BEGIN
--
 SET_COMCON(p_comcon_id => p_comcon_id);
 GET_COMCON(p_comcon => v_comcon);
 INI_COMCON;
 --
 UPDATE COM_ADJUDICACIONES_DET A
 SET A.SITUACION = 'ANU'
   , A.MOTIVO_SITUACION = 'Declarado NO Adjudicado'
 WHERE A.COMADJ_ID IN (SELECT B.ID
                       FROM COM_ADJUDICACIONES B
                       WHERE B.COMCON_ID = p_comcon_id)
   AND A.SITUACION ='PEN';
 --
 v_comcoe.COMCON_ID   := p_comcon_id;
 v_comcoe.FECHA       := SYSDATE;
 v_comcoe.ESTADO      := 'NAD';
 v_comcoe.MOTIVO      := p_motivo;

 COM_PKG.INS_COMCOE(P_COMCOE => v_comcoe);
 --
 FOR v_comped IN cr_comped LOOP
   v_compee.COMPED_ID  := v_comped.COMPED_ID;
   v_compee.FECHA       := SYSDATE;
   v_compee.ESTADO      := 'APR';
   v_compee.MOTIVO      := 'Proceso de Contratación Nº '||V_COMCON.CODIGO||' Declarado NO Adjudicado';
   COM_PKG.INS_COMPEE(P_COMPEE => v_compee);
 END LOOP;
--
END;
PROCEDURE COMCON_NOADJUDICAD_2
 (P_SEGORG_ID IN NUMBER
 ,P_COMCON_ID IN NUMBER
 ,P_INTENV_ID OUT NUMBER
 )
 IS
CURSOR cr_comcot IS
   SELECT *
   FROM COM_CONTRATACIONES_DETALLES
   WHERE COMCON_ID = p_comcon_id;
   --
   CURSOR cr_comped (p_comped_id number) IS
   SELECT *
   FROM COM_PEDIDOS
   WHERE ID = p_comped_id;
   --
   cursor cr_conf is
   select valor
   from seg_configuraciones
   where segorg_id = P_SEGORG_ID
   and codigo = 'COMCON_SRVINT_TRAMIX_HABILITADO_SN';
   --
   cursor cr_comdct is
   select id from com_documentos_tipos
   where segorg_id = p_segorg_id
   and codigo = 'COM_CONTRATACION_NAD';
   --
   cursor cr_comctt (p_comctt_id number) is
   select * from com_contrataciones_tipos
   where id = p_comctt_id;
   --
   v_comcon    COM_CONTRATACIONES%ROWTYPE;
   v_comcot    com_contrataciones_detalles%rowtype;
   v_comcoe    COM_CONTRATACIONES_EST%ROWTYPE;
   v_comcdg    com_contrataciones_docgen%rowtype;
   v_compee    COM_PEDIDOS_EST%ROWTYPE;
   v_comped    COM_PEDIDOS%ROWTYPE;
   v_inttpo    int_tipos_objetos%ROWTYPE;
   v_intene    int_envios_est%ROWTYPE;
   v_comctt    com_contrataciones_tipos%ROWTYPE;
   --
   v_habilitado         varchar2(10);
   v_comcdg_id          number;
   v_documento_id       number;
   v_respuesta_ws       varchar2(2000);
   v_resultado_ws       varchar2(2000);
   v_actuacion_identif  varchar2(2000);
   v_motivo             varchar2(2000);
   v_referencia         varchar2(2000);
   v_intene_id          number;
   v_intenv_id          number;
   v_inttpo_id          number;
   v_comdct_id          number;
   v_comped_id          number;
   --
BEGIN
   --
   COM_PKG.SET_COMCON(p_comcon_id => p_comcon_id);
   COM_PKG.GET_COMCON(p_comcon => v_comcon);
   COM_PKG.INI_COMCON;
   --
   -- Validar que existe el proceso
   --
   if v_comcon.id is null then
      raise_application_error(-20000,'El proceso especificado No Existe',true);
   end if;
   --
   OPEN cr_comctt(v_comcon.comctt_id);
   FETCH cr_comctt INTO v_comctt;
   CLOSE cr_comctt;
   --
   if v_comctt.id is null then
      raise_application_error(-20000,'No se ha podido determinar el tipo de Contratación',true);
   end if;
   --
   -- Obtener los datos del Detalle de Contratacion
   --
   OPEN cr_comcot;
   FETCH cr_comcot INTO v_comcot;
   CLOSE cr_comcot;
   --
   -- Validar que existe el detalle
   --
   if v_comcot.id is null then
      raise_application_error(-20000,'No se han encontrado datos del detalle de Contratación',true);
   end if;
   --
   -- Obtener los datos del pedido
   --
   v_comped_id := v_comcot.comped_id;
   OPEN cr_comped(v_comped_id);
   FETCH cr_comped INTO v_comped;
   CLOSE cr_comped;
   --
   -- Validar que existe el pedido
   --
   if v_comped.id is null then
      raise_application_error(-20000,'La solicitud de Gasto especificada No Existe',true);
   end if;
   --
   -- Si la Integracion no esta habilitada entonces Anulamos las Adjudicaciones.
   -- y ponemos el estado de la contratacion en NAD
   --
   for v_conf in cr_conf loop
      if v_conf.valor = 'SI' then
         v_habilitado := 'SI';
      else
         v_habilitado := 'NO';
      end if;
   end loop;
   --
   -- Obtener el tipo de documento
   --
   OPEN cr_comdct;
   FETCH cr_comdct INTO v_comdct_id;
   CLOSE cr_comdct;
   --
   if v_comdct_id is null then
      raise_application_error(-20000,'No se ha podido determinar el tipo de documento del Proceso de Contratación',true);
   end if;
   --
   -- 1. Generar y Grabar el Documento
   --
   v_documento_id := com_pkg.obtn_comcon_nad_pdf(p_segorg_id => p_segorg_id
                                                ,p_comcon_id => p_comcon_id);
   --
   -- 2. Grabar referencia Proceso de Contratacion-Documento
   --
   SELECT COMCDG_ID.NEXTVAL INTO v_comcdg_id FROM DUAL;
   v_comcdg.ID        := v_comcdg_id;
   v_comcdg.COMCON_ID := p_comcon_id;
   v_comcdg.COMDCT_ID := v_comdct_id;
   v_comcdg.COMDOC_ID := v_documento_id;
   v_comcdg.FECHA     := sysdate;
   COM_PKG.COMCDG_INS(p_comcdg => v_comcdg);
   --
   -- 3. Transmitir el Documento al WebService
   --
   v_actuacion_identif := 'PRONAD' || '-' || 'PROCESO DE CONTRATACION N°: ' || v_comcon.codigo || '/' ||  v_comped.ejercicio || ' - ' || v_comctt.NOMBRE  || ' - ' || 'DECLARADO NO ADJUDICADO';
   v_respuesta_ws := COM_PKG.COMCON_INVOCAR_WS(p_comcdg_id         => v_comcdg_id
                                              ,p_actuacion_identif => v_actuacion_identif
                                              ,p_valida            => 1);
   --
   update com_contrataciones_docgen
   set xml_enviado = xml_enviado || chr(13) || chr(10) || to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss') || chr(13) || chr(10) || v_respuesta_ws
   where id = v_comcdg_id;

   --
   -- 4. Parseamos el resultado del Webservice
   --
   COM_PKG.COMCON_PROC_XML_ACT(p_xml       => v_respuesta_ws
                              ,p_segorg_id => p_segorg_id
                              ,p_resultado => v_resultado_ws
                              ,p_motivo    => v_motivo
                              ,p_referencia=> v_referencia);
   --
   ----------------------------------------------------------
   -- 5. Grabar Log en Envíos
   ----------------------------------------------------------
   INT_PKG.INTTPO_SET_CODIGO(p_segorg_id => p_segorg_id
                            ,p_codigo    => 'COMCON_ACTUACION');
   INT_PKG.INTTPO_GET(p_inttpo => v_inttpo);
   v_inttpo_id := v_inttpo.id;
   --
   INT_PKG.INTENV_REGISTRAR(
                  P_INTTPO_ID     => v_inttpo_id
                 ,P_INTENV_OBJETO => '<comdoc_id>'    || v_documento_id || '</comdoc_id>'
                 ,P_INTENV_OBS    => v_respuesta_ws
                 ,P_INTENV_RES    => '<return>'       || v_resultado_ws || '<return>'        ||
                                     '<actuacion_id>' || v_referencia   || '</actuacion_id>'
                 ,P_INTENE_FECHA  => sysdate
                 ,P_INTENV_ID     => v_intenv_id
   );
   --
   --
   -- 6. Cambiar Estado del Proceso a
   --
   --
   IF instr(v_resultado_ws,'OP_COMPLETED') > 0 THEN
      --
      -- 8.A Modificar Estado del Envio a ENVIADO
      --
      SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
      v_intene.ID            := v_intene_id;
      v_intene.INTENV_ID     := v_intenv_id;
      v_intene.FECHA         := sysdate;
      v_intene.ESTADO        := 'ENV';
      v_intene.MOTIVO_ESTADO := v_motivo;
      INT_PKG.INTENE_INS(p_intene => v_intene);
      --
   ELSE
      --
      -- 8.B Modificar Estado del Envio ERROR
      --
      SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
      v_intene.ID            := v_intene_id;
      v_intene.INTENV_ID     := v_intenv_id;
      v_intene.FECHA         := sysdate;
      v_intene.ESTADO        := 'ERR';
      v_intene.MOTIVO_ESTADO := v_motivo;
      INT_PKG.INTENE_INS(p_intene => v_intene);
      --
   END IF;
   --
   p_intenv_id := v_intenv_id;
   --
END;
PROCEDURE COMCON_PROC_XML_ADJ
 (P_XML IN VARCHAR2
 ,P_ACTUACION_ID IN VARCHAR2
 ,P_SEGORG_ID IN NUMBER
 ,P_RESULTADO OUT VARCHAR2
 ,P_MOTIVO OUT VARCHAR2
 ,P_REFERENCIA OUT VARCHAR2
 )
 IS
--
   l_clob        CLOB;
   v_document    dbms_xmldom.domdocument;
   v_nodes       dbms_xmldom.DOMNodeList;
   v_element_x   dbms_xmldom.DOMElement;
   v_node        dbms_xmldom.DOMNode;
   v_node_2      dbms_xmldom.DOMNode;
   v_tag         VARCHAR2(100);
   v_node_value  VARCHAR2(100);
   --
begin
   --
   l_clob      := p_xml;
   v_document  := dbms_xmldom.newdomdocument(l_clob);
   v_nodes     := dbms_xmldom.getElementsByTagName(v_document, '*');
   --
   FOR i IN 0..dbms_xmldom.getlength(v_nodes)-1
   LOOP
      v_element_x  := dbms_xmldom.makeelement(xmldom.item(v_nodes,i));
      v_node       := dbms_xmldom.item(v_nodes,i);
      v_tag        := dbms_xmldom.getNodeName(v_node);
      v_node_2     := dbms_xmldom.getfirstchild(v_node);

      --
      -- Tag de retorno de codigo de operacion
      --
      if v_tag = 'return' then
         v_node_value := dbms_xmldom.getnodevalue(v_node_2);
         p_resultado  := v_node_value;
         p_motivo     := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo     => v_node_value
                                                  ,p_segorg_id  => p_segorg_id);
         if p_motivo is null then
            raise_application_error(-20000, 'Error: El WebService ha devuelto un valor de retorno no configurado: ' || v_node_value , true);
         end if;
         --
      end if;

      --
      -- Tag de Id de Actuacion
      --
      if v_tag = 'id' then
         v_node_value := dbms_xmldom.getnodevalue(v_node_2);
         p_referencia := v_node_value;
      end if;
   END LOOP;
   --
end;
PROCEDURE COMCON_PROC_XML_ACT
 (P_XML IN VARCHAR2
 ,P_SEGORG_ID IN NUMBER
 ,P_RESULTADO OUT VARCHAR2
 ,P_MOTIVO OUT VARCHAR2
 ,P_REFERENCIA OUT VARCHAR2
 )
 IS
--
   l_clob        CLOB;
   v_document    dbms_xmldom.domdocument;
   v_nodes       dbms_xmldom.DOMNodeList;
   v_element_x   dbms_xmldom.DOMElement;
   v_node        dbms_xmldom.DOMNode;
   v_node_2      dbms_xmldom.DOMNode;
   v_tag         VARCHAR2(100);
   v_node_value  VARCHAR2(100);
   --
begin
   --
   p_resultado := 'ERROR';
   l_clob      := p_xml;
   v_document  := dbms_xmldom.newdomdocument(l_clob);
   v_nodes     := dbms_xmldom.getElementsByTagName(v_document, '*');
   --
   FOR i IN 0..dbms_xmldom.getlength(v_nodes)-1
   LOOP
      v_element_x  := dbms_xmldom.makeelement(xmldom.item(v_nodes,i));
      v_node       := dbms_xmldom.item(v_nodes,i);
      v_tag        := dbms_xmldom.getNodeName(v_node);
      v_node_2     := dbms_xmldom.getfirstchild(v_node);

      --
      -- Tag de retorno de codigo de operacion
      --
      if v_tag = 'return' then
         v_node_value := dbms_xmldom.getnodevalue(v_node_2);
         p_resultado  := v_node_value;

         v_node_value := trim(replace(v_node_value, '&', ''));
         if instr(v_node_value,'-') > 0 then
            v_node_value := substr(v_node_value,0,instr(v_node_value,'-')-1);
         end if;
         --
         -- Si la actuacion ya ha sido cargada le permitimos aprobar la solicitud
         --
         if instr(v_node_value,'ERR_ACT_NOTVALID(ya existe una actuaci') > 0 then
            p_resultado := 'YA_EXISTE';
         end if;
         --
         p_motivo     := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo     => v_node_value
                                                  ,p_segorg_id  => p_segorg_id);
         if p_motivo is null then
            raise_application_error(-20000, 'Error: El WebService ha devuelto un valor de retorno no configurado: <pre>' || v_node_value || ' ' || p_resultado ||'<pre>', true);
         end if;
         --
      end if;

      --
      -- Tag de Id de Actuacion
      --
      if v_tag = 'id' then
         v_node_value := dbms_xmldom.getnodevalue(v_node_2);
         p_referencia := v_node_value;
      end if;
   END LOOP;
   --
end;
/* Revertir el estado Anulado de un proceso */
PROCEDURE COMCON_REVANU
 (P_COMCON_ID IN NUMBER
 ,P_MENSAJE OUT VARCHAR2
 ,P_MOTIVO IN VARCHAR2
 )
 IS
CURSOR cr_comped IS
  SELECT COMPED_ID
  FROM COM_CONTRATACIONES_DETALLES
  WHERE COMCON_ID = p_comcon_id;
  --
  CURSOR cr_compee(p_comped_ID NUMBER) IS
  SELECT ESTADO
        ,MOTIVO
        ,(SELECT c.rv_abbreviation
            FROM cg_ref_codes c
           WHERE c.rv_domain = 'COM_PEDIDOS_EST.ESTADO'
             AND c.rv_low_value = ESTADO) ESTADO_DESC
  FROM COM_PEDIDOS_EST
  WHERE ID = com_pkg.obtn_compee_id(p_comped_ID);
  --
  CURSOR cr_comcoe IS
  SELECT ESTADO
  FROM COM_CONTRATACIONES_EST
  WHERE ID = com_pkg.OBTN_COMCOE_ANT_ID(p_comcon_id);
  --
  v_comcon COM_CONTRATACIONES%ROWTYPE;
  v_comcoe COM_CONTRATACIONES_EST%ROWTYPE;
  v_compee COM_PEDIDOS_EST%ROWTYPE;
  v_comped_est cr_compee%ROWTYPE;
  v_comcoe_est cr_comcoe%ROWTYPE;
BEGIN
--
 p_mensaje := null;
 SET_COMCON(p_comcon_id => p_comcon_id);
 GET_COMCON(p_comcon => v_comcon);
 INI_COMCON;
 -- Obtener los Pedidos incluídos en el Prceso
 FOR v_comped IN cr_comped LOOP
   OPEN cr_compee(v_comped.COMPED_ID);
   FETCH cr_compee INTO v_comped_est;
   CLOSE cr_compee;
   --
   IF v_comped_est.ESTADO in ('APR','ANU') THEN
     -- Inserto Estado 'En Proceso' al Pedido
     v_compee.COMPED_ID  := v_comped.COMPED_ID;
     v_compee.FECHA       := SYSDATE;
     v_compee.ESTADO      := 'PRO';
     v_compee.MOTIVO      := 'Reversión de la Anulación del Proceso de Contratación Nº '||V_COMCON.CODIGO;
     COM_PKG.INS_COMPEE(P_COMPEE => v_compee);
   ELSE
     -- Pedido afectado a otro Proceso
     p_mensaje := 'La Contratación no puede ser Revertida. Estado del Pedido '||v_comped_est.ESTADO_DESC||' '||v_comped_est.MOTIVO;
     EXIT;
   END IF;
   --
 END LOOP;
 IF p_mensaje IS NULL THEN
  -- Inserto estado anterior del Proceso
  OPEN cr_comcoe;
  FETCH cr_comcoe INTO v_comcoe_est;
  CLOSE cr_comcoe;
  --
  v_comcoe.COMCON_ID   := p_comcon_id;
  v_comcoe.FECHA       := SYSDATE;
  v_comcoe.ESTADO      := v_comcoe_est.ESTADO;
  v_comcoe.MOTIVO      := 'Reversión del Proceso. '||p_motivo;

  COM_PKG.INS_COMCOE(P_COMCOE => v_comcoe);
 --  Revierto la Anulación de la Pre-Adjudicación
 UPDATE COM_ADJUDICACIONES_DET A
 SET A.SITUACION = 'PEN'
   , A.MOTIVO_SITUACION = 'Reversión del Proceso. '||p_motivo
 WHERE A.COMADJ_ID IN (SELECT B.ID
                       FROM COM_ADJUDICACIONES B
                       WHERE B.COMCON_ID = p_comcon_id)
   AND A.SITUACION ='ANU'
   AND A.MOTIVO_SITUACION = 'Anulación del Proceso';
 --
 END IF;
END;
/* Revertir Finalización de la contratación */
PROCEDURE COMCON_REVFIN
 (P_COMCON_ID IN NUMBER
 ,P_MOTIVO IN COM_PEDIDOS_EST.MOTIVO%TYPE
 ,P_COMPED_ESTADO IN COM_PEDIDOS_EST.ESTADO%TYPE
 )
 IS
-- Declaración de Cursores
  CURSOR cr_comcot IS
  SELECT COMPED_ID
  FROM COM_CONTRATACIONES_DETALLES
  WHERE COMCON_ID = p_comcon_id;
  -- Declaración de Variables
  v_comcoe  COM_CONTRATACIONES_EST%rowtype;
  v_compee COM_PEDIDOS_EST%ROWTYPE;
BEGIN
  --
  FOR v_comcot IN cr_comcot LOOP
    --
    IF v_comcot.COMPED_ID IS NOT NULL THEN
      -- Inserto Estado pasado al Pedido
      SELECT COMPEE_ID.NEXTVAL INTO v_compee.ID FROM DUAL;
      v_compee.COMPED_ID  := v_comcot.COMPED_ID;
      v_compee.FECHA      := SYSDATE;
      v_compee.ESTADO     := 'PRO';
      v_compee.MOTIVO     := 'Revirtió el proceso. Motivo : '||p_motivo;
      --
      INS_COMPEE(P_COMPEE => v_compee);
      --
    END IF;
    --
  END LOOP;
  --
  -- Inserto Estado al Proceso
  SELECT COMCOE_ID.NEXTVAL INTO v_comcoe.ID FROM DUAL;
  v_comcoe.COMCON_ID := p_comcon_id;
  v_comcoe.FECHA     := SYSDATE;
  v_comcoe.ESTADO    := p_comped_estado;
  v_comcoe.MOTIVO    := 'Revirtió el proceso. Motivo : '||p_motivo;
  --
  INS_COMCOE(p_comcoe => v_comcoe);
  --
END;
/* Revertir el estado No Adjudicado de un proceso */
PROCEDURE COMCON_REVNAD
 (P_COMCON_ID IN NUMBER
 ,P_MENSAJE OUT VARCHAR2
 ,P_MOTIVO IN VARCHAR2
 )
 IS
CURSOR cr_comped IS
  SELECT COMPED_ID
  FROM COM_CONTRATACIONES_DETALLES
  WHERE COMCON_ID = p_comcon_id;
  --
  CURSOR cr_compee(p_comped_ID NUMBER) IS
  SELECT ESTADO
        ,MOTIVO
        ,(SELECT c.rv_abbreviation
            FROM cg_ref_codes c
           WHERE c.rv_domain = 'COM_PEDIDOS_EST.ESTADO'
             AND c.rv_low_value = ESTADO) ESTADO_DESC
  FROM COM_PEDIDOS_EST
  WHERE ID = com_pkg.obtn_compee_id(p_comped_ID);
  --
  v_comcon COM_CONTRATACIONES%ROWTYPE;
  v_comcoe COM_CONTRATACIONES_EST%ROWTYPE;
  v_compee COM_PEDIDOS_EST%ROWTYPE;
  v_comped_est cr_compee%ROWTYPE;
BEGIN
--
 p_mensaje := null;
 SET_COMCON(p_comcon_id => p_comcon_id);
 GET_COMCON(p_comcon => v_comcon);
 INI_COMCON;
 -- Obtener los Pedidos incluídos en el Prceso
 FOR v_comped IN cr_comped LOOP
   OPEN cr_compee(v_comped.COMPED_ID);
   FETCH cr_compee INTO v_comped_est;
   CLOSE cr_compee;
   --
   IF v_comped_est.ESTADO = 'APR' THEN
     -- Inserto Estado 'En Proceso' al Pedido
     v_compee.COMPED_ID   := v_comped.COMPED_ID;
     v_compee.FECHA       := SYSDATE;
     v_compee.ESTADO      := 'PRO';
     v_compee.MOTIVO      := 'Reversión de No Adjudicado del Proceso de Contratación Nº '||V_COMCON.CODIGO;
     COM_PKG.INS_COMPEE(P_COMPEE => v_compee);
   ELSE
     -- Pedido afectado a otro Proceso
     p_mensaje := 'La Contratación no puede ser Revertida. Estado del Pedido '||v_comped_est.ESTADO_DESC||' '||v_comped_est.MOTIVO;
     EXIT;
   END IF;
   --
 END LOOP;
 IF p_mensaje IS NULL THEN
     -- Inserto estado 'Evaluado' al Proceso
     v_comcoe.COMCON_ID   := p_comcon_id;
     v_comcoe.FECHA       := SYSDATE;
     --v_comcoe.ESTADO      := 'PRE';
     v_comcoe.ESTADO      := 'VRF';
     v_comcoe.MOTIVO      := 'Reversión del Proceso. '||p_motivo;

     COM_PKG.INS_COMCOE(P_COMCOE => v_comcoe);
    --  Revierto la Anulación de la Pre-Adjudicación
    UPDATE COM_ADJUDICACIONES_DET A
    SET A.SITUACION = 'PEN'
      , A.MOTIVO_SITUACION = 'Reversión del Proceso. '||p_motivo
    WHERE A.COMADJ_ID IN (SELECT B.ID
                          FROM COM_ADJUDICACIONES B
                          WHERE B.COMCON_ID = p_comcon_id)
      AND A.SITUACION ='ANU'
      AND A.MOTIVO_SITUACION = 'Declarado NO Adjudicado';
    --
 END IF;
END;
FUNCTION COMCON_TRAMIX_HAB_SN
 (P_SEGORG_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_conf is
   select valor
   from seg_configuraciones
   where segorg_id = P_SEGORG_ID
   and codigo = 'COMCON_SRVINT_TRAMIX_HABILITADO_SN';
   --
   v_habilitado         varchar2(10) := 'NO';
   --
BEGIN
   if p_segorg_id is null then
      raise_application_error(-20000,'La Organizacion no ha sido indicada y es un dato obligatorio',true);
   end if;
   --
   for v_conf in cr_conf loop
      if v_conf.valor = 'SI' then
         v_habilitado := 'SI';
      else
         v_habilitado := 'NO';
      end if;
   end loop;

   return v_habilitado;
END;
PROCEDURE COMCON_VERIFICAR_TRANSMITIR
 (P_SEGORG_ID IN NUMBER
 ,P_COMCON_ID IN NUMBER
 ,P_INTENV_ID OUT NUMBER
 )
 IS
-----------------------------------------------------------------------------------
   --
   -- Argumentos
   -- p_segorg_id => Organizacion
   -- p_comcon_id => Id del Proceso
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
   cursor cr_conf is
   select valor
   from seg_configuraciones
   where segorg_id = P_SEGORG_ID
   and codigo = 'COMCON_SRVINT_TRAMIX_HABILITADO_SN';
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
   v_comcot             com_contrataciones_detalles%rowtype;
   v_intenv             int_envios%rowtype;
   v_comcoe             com_contrataciones_est%ROWTYPE;
   v_comcoe_tmp         com_contrataciones_est%ROWTYPE;
   v_comctt             com_contrataciones_tipos%ROWTYPE;
   v_intori             int_origenes%ROWTYPE;
   v_intdes             int_destinos%ROWTYPE;
   v_inttpo             int_tipos_objetos%ROWTYPE;
   v_intene             int_envios_est%ROWTYPE;
   v_comcon             com_contrataciones%rowtype;
   v_comped             COM_PEDIDOS%ROWTYPE;
   v_respuesta_ws       varchar2(2000);
   v_respuesta_ws_adj   varchar2(2000);
   v_resultado_ws       varchar2(2000);
   v_resultado_ws_adj   varchar2(2000);
   v_motivo             varchar2(2000);
   v_referencia         varchar2(2000);
   v_referencia_adj     varchar2(2000);
   v_actuacion_identif  varchar2(2000);
   v_aprobar            varchar2(2);
   v_inttpo_id          number;
   v_intori_id          number;
   v_intdes_id          number;
   v_intene_id          number;
   v_comcdg_id          number;
   v_comdct_id          number;
   v_intenv_id          number;
   v_cantidad_adjuntos  number;
   v_documento_id       number;
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
      if v_comcoe.estado <> 'VRF' then
         raise_application_error(-20000,'El proceso de contratacion No se encuentra verificado',true);
      end if;

      --
      for v_conf in cr_conf loop
         if v_conf.valor = 'SI' then
            v_habilitado := 'SI';
         else
            v_habilitado := 'NO';
         end if;
      end loop;
      dbms_output.put_line('v_habilitado = ' || v_habilitado);
      --
      -- Si la Integracion no esta habilitada entonces error.
      --
      if v_habilitado = 'NO' then
         raise_application_error(-20000,'La integracion No se encuentra Habilitada',true);
      end if;
      --
      -- Obtener el tipo de documento
      --
      OPEN cr_comdct;
      FETCH cr_comdct INTO v_comdct_id;
      CLOSE cr_comdct;
      --
      if v_comdct_id is null then
         raise_application_error(-20000,'No se ha podido determinar el tipo de documento del Proceso de Contratación',true);
      end if;
      --
      open cr_comcon(p_comcon_id);
      fetch cr_comcon into v_comcon;
      close cr_comcon;
      --
      if v_comcon.id is null then
         raise_application_error(-20000,'No se han podido obtener los datos del Proceso de Contratación',true);
      end if;
      --
      OPEN cr_comctt(v_comcon.comctt_id);
      FETCH cr_comctt INTO v_comctt;
      CLOSE cr_comctt;
      --
      if v_comctt.id is null then
         raise_application_error(-20000,'No se ha podido determinar el tipo de Contratación',true);
      end if;
      --
      -- Obtener los datos del Detalle de Contratacion
      --
      OPEN cr_comcot;
      FETCH cr_comcot INTO v_comcot;
      CLOSE cr_comcot;
      --
      -- Validar que existe el detalle
      --
      if v_comcot.id is null then
         raise_application_error(-20000,'No se han encontrado datos del detalle de Contratación',true);
      end if;
      --
      -- Obtener los datos del pedido
      --
      v_comped_id := v_comcot.comped_id;
      OPEN cr_comped(v_comped_id);
      FETCH cr_comped INTO v_comped;
      CLOSE cr_comped;
      --
      -- Validar que existe el pedido
      --
      if v_comped.id is null then
         raise_application_error(-20000,'La solicitud de Gasto especificada No Existe',true);
      end if;
      --
      -- 1. Generar y Grabar el Documento
      --
      v_documento_id := com_pkg.obtn_comcon_doc_pdf(p_segorg_id => p_segorg_id
                                                   ,p_comcon_id => p_comcon_id);
      if v_documento_id is null then
         raise_application_error(-20000,'No se ha podido generar el Documento del Proceso de Contratación',true);
      end if;
      --
      -- 2. Grabar referencia Proceso de Contratacion-Documento Generado
      --
      begin
         SELECT COMCDG_ID.NEXTVAL INTO v_comcdg_id FROM DUAL;
         v_comcdg.ID        := v_comcdg_id;
         v_comcdg.COMCON_ID := p_comcon_id;
         v_comcdg.COMDOC_ID := v_documento_id;
         v_comcdg.COMDCT_ID := v_comdct_id;
         v_comcdg.FECHA     := sysdate;
         COM_PKG.COMCDG_INS(p_comcdg => v_comcdg);
      EXCEPTION WHEN others THEN
         raise_application_error(-20000,'No se ha podido generar el registro de referencia Proceso de Contratacion-Documento Generado',true);
      END;
      dbms_output.put_line('v_comcdg_id = ' || v_comcdg_id);
      if v_comcdg_id is null then
         raise_application_error(-20000,'No se ha podido generar el registro de referencia Proceso de Contratacion-Documento Generado',true);
      end if;
      --
      -- 3. Transmitir el Documento al WebService
      --
      v_actuacion_identif := 'PROSEC' || '-' || 'PROCESO DE CONTRATACION ' ||' N°: ' || v_comcon.codigo || '/' ||  v_comped.ejercicio || ' - ' || v_comctt.NOMBRE ;
      dbms_output.put_line('v_actuacion_identif = ' || v_actuacion_identif);
      --
      v_respuesta_ws := COM_PKG.COMCON_INVOCAR_WS(p_comcdg_id         => v_comcdg_id
                                                , p_actuacion_identif => v_actuacion_identif
                                                , p_valida            => 1);
      dbms_output.put_line('v_respuesta_ws = ' || v_respuesta_ws);

      dbms_output.put_line( substr( v_respuesta_ws , -1000 , 1000));

      update com_contrataciones_docgen
      set xml_enviado = xml_enviado || chr(13) || chr(10) || to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss') || chr(13) || chr(10) || v_respuesta_ws
      where id = v_comcdg_id;

      --
      -- 4. Parseamos el resultado del Webservice
      --
      COM_PKG.COMCON_PROC_XML_ACT(p_xml       => v_respuesta_ws
                                 ,p_segorg_id => p_segorg_id
                                 ,p_resultado => v_resultado_ws
                                 ,p_motivo    => v_motivo
                                 ,p_referencia=> v_referencia);
      --
      IF v_resultado_ws = 'ERROR' THEN
         raise_application_error(-20000,'No se ha podido interpretar el mensaje de respuesta.',true);
      END IF;
      ----------------------------------------------------------
      -- 5. Grabar Log en Envíos
      ----------------------------------------------------------
      INT_PKG.INTTPO_SET_CODIGO(p_segorg_id => p_segorg_id
                               ,p_codigo    => 'COMCON_ACTUACION');
      INT_PKG.INTTPO_GET(p_inttpo => v_inttpo);
      if v_inttpo.id is null then
         raise_application_error(-20000,'El codigo de tipo de objeto COMCON_ACTUACION no se encuentra configurado',true);
      end if;
      v_inttpo_id := v_inttpo.id;
      --
      INT_PKG.INTENV_REGISTRAR(
                     P_INTTPO_ID     => v_inttpo_id
                    ,P_INTENV_OBJETO => '<comdoc_id>'    || v_documento_id || '</comdoc_id>'
                    ,P_INTENV_OBS    => v_respuesta_ws
                    ,P_INTENV_RES    => '<return>'       || v_resultado_ws || '<return>'        ||
                                        '<actuacion_id>' || v_referencia   || '</actuacion_id>'
                    ,P_INTENE_FECHA  => sysdate
                    ,P_INTENV_ID     => v_intenv_id
      );
      --
      --
      -- 6. Si la Actuacion principal se inserto correctamente
      --    entonces vamos a verificar si tiene adjuntos
      --
      --
      IF instr(v_resultado_ws,'OP_COMPLETED') > 0 THEN
         --
         v_aprobar := 'SI';

         select count(*) into v_cantidad_adjuntos from com_contrataciones_doc  where comcon_id = p_comcon_id;
         dbms_output.put_line('v_cantidad_adjuntos=' || v_cantidad_adjuntos);
         IF v_cantidad_adjuntos > 0 THEN
            v_actuacion_identif := substr(v_resultado_ws, 14 );
            --
            -- 7. Transmitir Documentos Adjuntos al WebService
            --
            dbms_output.put_line('v_actuacion_identif = ' || v_actuacion_identif);
            FOR v_comcod IN cr_comcod LOOP
               dbms_output.put_line('entro al for cursor');
               --
               -- 8. Buscamos el documento adjunto y lo transmitimos al WS
               --
               v_respuesta_ws_adj := COM_PKG.COMCON_INVOCAR_WS_ADJUNTO(p_actuacion_id => v_actuacion_identif
                                                                      ,p_comcod_id    => v_comcod.id);
               dbms_output.put_line('v_respuesta_ws_adj = ' || v_respuesta_ws_adj);

               update com_contrataciones_docgen
               set xml_enviado = xml_enviado || chr(13) || chr(10) || ' Adjunto ' || to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss') || chr(13) || chr(10) || v_respuesta_ws_adj
               where id = v_comcdg_id;

               --
               -- 9. Parseamos el resultado del Webservice de envio de adjunto
               --
               COM_PKG.COMCON_PROC_XML_ADJ( p_xml          => v_respuesta_ws_adj
                                           ,p_actuacion_id => v_referencia
                                           ,p_segorg_id    => p_segorg_id
                                           ,p_resultado    => v_resultado_ws_adj
                                           ,p_motivo       => v_motivo
                                           ,p_referencia   => v_referencia_adj);
               --
               -- 10. Grabar Log en Envíos de Adjuntos
               --
               INT_PKG.INTTPO_SET_CODIGO(p_segorg_id => p_segorg_id
                                        ,p_codigo    => 'COMCON_ACTUACION');
               INT_PKG.INTTPO_GET(p_inttpo => v_inttpo);
               --
               if v_inttpo.id is null then
                  raise_application_error(-20000,'El codigo de tipo de objeto COMCON_ACTUACION no se encuentra configurado',true);
               end if;
               v_inttpo_id := v_inttpo.id;
               --
               INT_PKG.INTENV_REGISTRAR(
                                      P_INTTPO_ID     => v_inttpo_id
                                     ,P_INTENV_OBJETO => '<comdoc_id>'    || v_documento_id     || '</comdoc_id>'
                                     ,P_INTENV_OBS    => v_respuesta_ws
                                     ,P_INTENV_RES    => '<return>'       || v_resultado_ws_adj || '<return>'        ||
                                                         '<actuacion_id>' || v_referencia       || '</actuacion_id>'
                                     ,P_INTENE_FECHA  => sysdate
                                     ,P_INTENV_ID     => v_intenv_id
                                       );
               --
               IF v_resultado_ws_adj <> 'OP_COMPLETED' THEN
                  --
                  v_aprobar := 'NO';
                  --
                  -- 8.B Modificar Estado del Envio del Adjunto a ERROR
                  --
                  SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
                  v_intene.INTENV_ID     := v_intenv_id;
                  v_intene.FECHA         := sysdate;
                  v_intene.ESTADO        := 'ERR';
                  v_intene.MOTIVO_ESTADO := v_motivo || '-Error al enviar adjunto ' || v_resultado_ws_adj;
                  INT_PKG.INTENE_INS(p_intene => v_intene);
                  --
               END IF;
            END LOOP;
            --
            IF v_aprobar = 'SI' THEN
               --
               -- 8.A Modificar Estado del Envio a ENVIADO
               --
               SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
               v_intene.ID            := v_intene_id;
               v_intene.INTENV_ID     := v_intenv_id;
               v_intene.FECHA         := sysdate;
               v_intene.ESTADO        := 'ENV';
               v_intene.MOTIVO_ESTADO := v_motivo;
               INT_PKG.INTENE_INS(p_intene => v_intene);
               --
            END IF;
            --
         ELSE -- Si no tiene adjuntos
            --
            -- 8.A Modificar Estado del Envio a ENVIADO
            --
            SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
            v_intene.ID            := v_intene_id;
            v_intene.INTENV_ID     := v_intenv_id;
            v_intene.FECHA         := sysdate;
            v_intene.ESTADO        := 'ENV';
            v_intene.MOTIVO_ESTADO := v_motivo;
            INT_PKG.INTENE_INS(p_intene => v_intene);
            --
         END IF;
      ELSE -- Devuelve distinto de OP_COMPLETED
         --
         -- 8.B Modificar Estado del Envio ERROR
         --
         SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
         v_intene.ID            := v_intene_id;
         v_intene.INTENV_ID     := v_intenv_id;
         v_intene.FECHA         := sysdate;
         v_intene.ESTADO        := 'ERR';
         v_intene.MOTIVO_ESTADO := v_motivo;
         INT_PKG.INTENE_INS(p_intene => v_intene);
         --
      END IF;
      --
      p_intenv_id := v_intenv_id;
      --
EXCEPTION WHEN others THEN
   raise_application_error(-20000,'No se ha podido enviar correctamente los documentos del Proceso de Contratación',true);
END;
PROCEDURE COMCON_VERIFICAR
 (P_SEGORG_ID IN NUMBER
 ,P_MOTIVO IN VARCHAR2
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
   v_comcoe             com_contrataciones_est%ROWTYPE;
   v_comcoe_tmp         com_contrataciones_est%ROWTYPE;
   v_comcon             com_contrataciones%rowtype;
  --
BEGIN
   --
   if p_segorg_id is null then
      raise_application_error(-20000,'La Organizacion no ha sido indicada y es un dato obligatorio',true);
   elsif p_comcon_id is null then
      raise_application_error(-20000,'El Proceso no ha sido indicado y es un dato obligatorio',true);
   end if;
   --
   COM_PKG.SET_COMCON(p_comcon_id => p_comcon_id);
   COM_PKG.GET_COMCON(p_comcon => v_comcon);
   --
   COM_PKG.SET_COMCOE(p_id => v_comcon.comcoe_id);
   COM_PKG.GET_COMCOE(p_comcoe => v_comcoe);
   --
   if v_comcoe.estado = 'VRF' then
      raise_application_error(-20000,'El proceso de contratacion ya se encuentra verificado',true);
   end if;
   --
   v_comcoe_tmp.COMCON_ID := p_comcon_id;
   v_comcoe_tmp.FECHA     := SYSDATE;
   v_comcoe_tmp.ESTADO    := 'VRF';
   v_comcoe_tmp.MOTIVO    := p_motivo;
   COM_PKG.INS_COMCOE(P_COMCOE => v_comcoe_tmp);
   --
EXCEPTION WHEN others THEN
   raise_application_error(-20000,'No se ha podido dar por Verificado el Proceso de Contratación',true);
END;
PROCEDURE COMCTM_CREAR
 (P_SEGORG_ID IN NUMBER
 ,P_CODIGO IN VARCHAR2
 ,P_NOMBRE IN VARCHAR2
 ,P_DESCRIPCION IN VARCHAR2
 ,P_SITUACION IN VARCHAR2
 ,P_CALIFICACION IN NUMBER
 ,P_COMCTM_ID OUT NUMBER
 )
 IS
v_comctm_crear com_calificaciones_tmo%rowtype;
begin
  -- Validar la la Creación
  COMCTM_CREAR_VLD(p_segorg_id          => p_segorg_id
                 , p_codigo             => p_codigo
                 , p_nombre             => p_nombre
                 , p_descripcion        => p_descripcion
                 , p_situacion          => p_situacion
                 , p_calificacion       => p_calificacion);
  -- Registrar
  select COMCTM_ID.NEXTVAL
  into   v_comctm_crear.ID
  from   dual;
  --
  v_comctm_crear.SEGORG_ID          := p_segorg_id;
  v_comctm_crear.CODIGO             := p_codigo;
  v_comctm_crear.NOMBRE             := p_nombre;
  v_comctm_crear.DESCRIPCION        := p_descripcion;
  v_comctm_crear.SITUACION          := p_situacion;
  v_comctm_crear.CALIFICACION       := p_calificacion;
  --
  INS_COMCTM(p_comctm => v_comctm_crear);
  -- Cargar la variable de retorno con el Id creado.
  p_comctm_id := v_comctm_crear.ID;
  --
end;
FUNCTION COMCTM_CREAR_SN
 (P_SEGORG_ID IN NUMBER
 ,P_CODIGO IN VARCHAR2
 ,P_NOMBRE IN VARCHAR2
 ,P_DESCRIPCION IN VARCHAR2
 ,P_SITUACION IN VARCHAR2
 ,P_CALIFICACION IN NUMBER
 )
 RETURN VARCHAR2
 IS
begin
  -- Validar la la Creación
  COMCTM_CREAR_VLD(p_segorg_id        => p_segorg_id
                 , p_codigo           => p_codigo
                 , p_nombre           => p_nombre
                 , p_descripcion      => p_descripcion
                 , p_situacion        => p_situacion
                 , p_calificacion     => p_calificacion);
  return 'SI';
exception
  when others then
    return 'NO';
end;
PROCEDURE COMCTM_CREAR_VLD
 (P_SEGORG_ID IN NUMBER
 ,P_CODIGO IN VARCHAR2
 ,P_NOMBRE IN VARCHAR2
 ,P_DESCRIPCION IN VARCHAR2
 ,P_SITUACION IN VARCHAR2
 ,P_CALIFICACION IN VARCHAR2
 )
 IS
v_comctm com_calificaciones_tmo%rowtype;
  v_segorg seg_organizaciones%rowtype;
begin

  -- Verificar parametros obligatorios
  if p_codigo is null then
    raise_application_error(-20000,'El Codigo no ha sido indicado y es un dato obligatorio',true);
  elsif p_nombre is null then
    raise_application_error(-20000,'El Nombre no ha sido indicado y es un dato obligatorio',true);
  elsif p_situacion is null then
    raise_application_error(-20000,'La Situación no ha sido indicada y es un dato obligatorio',true);
  elsif p_calificacion is null then
    raise_application_error(-20000,'La Calificación no ha sido indicada y es un dato obligatorio',true);
  end if;

  -- Verificar que las referencias externas existan
  /*
  SEG_PKG.SET_SEGORG(p_id => p_segorg_id);
  SEG_PKG.GET_SEGORG(p_segorg => v_segorg);
  SEG_PKG.INI_SEGORG;
  if v_segorg.ID is null then
    raise_application_error(-20000,'La Organización indicada es incorrecta',true);
  end if;
  INI_COMCTM;
  */
  -- Verificar no duplicidad de datos
  SET_COMCTM_CODIGO(p_segorg_id   => p_segorg_id
                  , p_codigo      => p_codigo);
  GET_COMCTM(p_comctm => v_comctm);
  if v_comctm.ID is not null then
    INI_COMCTM;
    raise_application_error(-20000,'La Calificación con el Código indicado ya se encuentra registrado',true);
  end if;
  --
  SET_COMCTM_NOMBRE(p_segorg_id    => p_segorg_id
                  , p_calificacion => p_calificacion
                  , p_nombre       => p_nombre);
  GET_COMCTM(p_comctm => v_comctm);
  if v_comctm.ID is not null then
    INI_COMCTM;
    raise_application_error(-20000,'La Calificacion con el Nombre indicado ya se encuentra registrado',true);
  end if;

  INI_COMCTM;
  --
end;
PROCEDURE COMCTM_HABILITAR
 (P_COMCTM_ID IN NUMBER
 )
 IS
begin
  -- Validar operacion
  COMCTM_HABILITAR_VLD(p_comctm_id => p_comctm_id);
  -- Realizar la operación
  UPDATE COM_CALIFICACIONES_TMO
  SET SITUACION = 'HAB'
  WHERE ID = p_comctm_id;
  INI_COMCTM;
  --
end;
FUNCTION COMCTM_HABILITAR_SN
 (P_COMCTM_ID IN NUMBER
 )
 RETURN INTEGER
 IS
begin
  COMCTM_HABILITAR_VLD(p_comctm_id => p_comctm_id);
  return 'SI';
exception
  when others then
    return 'NO';
end;
PROCEDURE COMCTM_HABILITAR_VLD
 (P_COMCTM_ID IN NUMBER
 )
 IS
begin
  -- Verificar los parametros obligatorios
  if p_comctm_id is null then
    raise_application_error(-20000,'El Tipo Motivo de Calificación no ha sido indicado y es un dato obligatorio',true);
  end if;

  -- Verificar los valores de los parametros
  SET_COMCTM(p_id => p_comctm_id);
  GET_COMCTM(p_comctm => v_comctm);
  if v_comctm.ID is null then
    raise_application_error(-20000,'El Tipo Motivo de Calificación indicado es incorrecto',true);
  end if;

  -- Verificar la consistencia de los datos
  if v_comctm.SITUACION = 'HAB' then
    INI_COMCTM;
    raise_application_error(-20000,'El Tipo Motivo de Calificación indicada ya se encuentra HABILITADO',true);
  end if;
  INI_COMCTM;
  --
end;
PROCEDURE COMCTM_SUSPENDER
 (P_COMCTM_ID IN NUMBER
 )
 IS
begin
  -- Validar operacion
  COMCTM_SUSPENDER_VLD(p_comctm_id => p_comctm_id);
  -- Realizar la operación
  UPDATE COM_CALIFICACIONES_TMO
  SET SITUACION = 'SUS'
  WHERE ID = p_comctm_id;
  --
end;
FUNCTION COMCTM_SUSPENDER_SN
 (P_COMCTM_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
begin
  COMCTM_SUSPENDER_VLD(p_comctm_id => p_comctm_id);
  return 'SI';
exception
  when others then
    return 'NO';
end;
PROCEDURE COMCTM_SUSPENDER_VLD
 (P_COMCTM_ID IN NUMBER
 )
 IS
begin

  -- Verificar los parametros obligatorios
  if p_comctm_id is null then
    raise_application_error(-20000,'El Tipo de Calificación no ha sido indicado y es un dato obligatorio',true);
  end if;

  -- Verificar los valores de los parametros
  SET_COMCTM(p_id => p_comctm_id);
  GET_COMCTM(p_comctm => v_comctm);
  if v_comctm.ID is null then
    raise_application_error(-20000,'El Tipo de Calificación indicado es incorrecta',true);
  end if;

  -- Verificar la consistencia de los datos
  if v_comctm.SITUACION = 'SUS' then
    INI_COMCTM;
    raise_application_error(-20000,'El Tipo de Calificación indicado ya se encuentra SUSPENDIDO',true);
  end if;
  INI_COMCTM;
  --
end;
/* Anula la Cotizacion y su Detalle */
PROCEDURE COMCTZ_ANULAR
 (P_COMCTZ_ID IN COM_COTIZACIONES.ID%TYPE
 )
 IS
BEGIN
    --
    UPDATE COM_COTIZACIONES
    SET SITUACION = 'ANU'
       ,FECHA = SYSDATE
    WHERE ID  = p_comctz_id;
    --
END;
/* Crear cabezera y detalle de una cotizacion */
PROCEDURE COMCTZ_CREAR
 (P_COMCON_ID IN COM_CONTRATACIONES.ID%TYPE
 ,P_COMPRV_ID IN COM_PROVEEDORES.ID%TYPE
 ,P_COMCTZ_ID OUT COM_COTIZACIONES.ID%TYPE
 )
 IS
-- Definición de Cursores
 CURSOR cr_comcdp_v IS
 SELECT COMPED_ID
       ,COMPET_ID
       ,PRECIO_UNITARIO
 FROM COM_CONTRATACIONES_DETPED_V COMCDP_V
 WHERE COMCDP_V.COMCON_ID = P_COMCON_ID;
 --
v_comctz COM_COTIZACIONES%ROWTYPE;
v_comczd COM_COTIZACIONES_DETALLES%ROWTYPE;
BEGIN
    -- Genero Cabecera para la Cotización
    SELECT COMCTZ_ID.NEXTVAL INTO p_comctz_id FROM DUAL;
    v_comctz.ID         := p_comctz_id;
    v_comctz.COMCON_ID  := p_comcon_id;
    v_comctz.COMPRV_ID  := p_comprv_id;
    v_comctz.CODIGO     := p_comctz_id;
    v_comctz.FECHA      := SYSDATE;
    v_comctz.OBSERVACION:= '';
    v_comctz.SITUACION  := 'NUE';
    --  Inserto en COM_COTIZACIONES
    COM_PKG.INS_COMCTZ(p_comctz => v_comctz);
    --
    -- Obtener los Items de los Pedidos incluidos en el Proceso
    FOR v_comcdp_v IN cr_comcdp_v LOOP
     --
     v_comczd.COMCTZ_ID  := p_comctz_id;
     v_comczd.COMPED_ID  := v_comcdp_v.COMPED_ID;
     v_comczd.COMPET_ID  := v_comcdp_v.COMPET_ID;
     v_comczd.PRECIO_UNITARIO_FINAL := null;
     v_comczd.MARCA      := null;
     v_comczd.MODELO     := null;
     v_comczd.OBSERVACION:= null;
     -- Inserto en COM_COTIZACIONES_DETALLES
     COM_PKG.INS_COMCZD(p_comczd => v_comczd);
     --
    END LOOP;
  --
END;
/* Confirma la Cotizacion y su Detalle */
PROCEDURE COMCTZ_CONFIRMAR
 (P_COMCTZ_ID IN COM_COTIZACIONES.ID%TYPE
 )
 IS
BEGIN
    --
    UPDATE COM_COTIZACIONES
    SET SITUACION = 'PRE'
       ,CODIGO = COM_PKG.OBTN_COMNUM_NUMERO(P_CODIGO => 'COMCTZ_CODIGO'
                  ,P_SEGORG_ID => SEG_PKG.OBTN_ORGUSU(nvl(v('APP_USER'),user)))
       ,FECHA = SYSDATE
    WHERE ID  = p_comctz_id;
    --
END;
/* Invocar Web Service Actuaciones Tramix -Cotizacion - Adjuntos */
FUNCTION COMCTZ_INVOCAR_WS_ADJUNTO
 (P_ACTUACION_ID IN VARCHAR2
 ,P_COMCZC_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
req_body             CLOB;
   chunk_buffer_clob    CLOB;
   buffersize           NUMBER(4) := 2000;
   chunk_buffer         VARCHAR2(2000);
   chunk_length         NUMBER(4);
   chunk_offset         NUMBER;
   request_body_length  NUMBER;
   req                  utl_http.req;
   resp                 utl_http.resp;
   v_response_text      VARCHAR2(32767);
   v_url                VARCHAR2(1000);
   actuacion_identif    VARCHAR2(1000);
   v_username           VARCHAR2(100);
   v_ticket             VARCHAR2(100);
   v_fecha_adjunto      VARCHAR2(100);
   v_comped             com_pedidos%rowtype;
   v_comdoc             com_documentos%rowtype;
   v_compec             com_pedidos_doc%rowtype;
   v_comczc             com_cotizaciones_doc%rowtype;
   --
   cursor cr_comctz (p_comctz_id number) is
   select * from com_cotizaciones comctz
   where comctz.id = p_comctz_id;
   --
   cursor cr_comczc is
   select * from com_cotizaciones_doc
   where id = p_comczc_id;
   --
   cursor cr_comdoc (p_comdoc_id number) is
   select * from com_documentos comdoc
   where comdoc.id = p_comdoc_id;
   --
begin
   open cr_comczc;
   fetch cr_comczc into v_comczc;
   close cr_comczc;
   --
   open cr_comdoc(v_comczc.comdoc_id);
   fetch cr_comdoc into v_comdoc;
   close cr_comdoc;
   --
   open cr_comctz(v_comczc.comctz_id);
   fetch cr_comctz into v_comctz;
   close cr_comctz;
   --
   req_body := COM_PKG.Blob2ClobBase64(v_comdoc.documento);
   --
   --url := 'http://64.215.200.12:81/tramix-flex/services/ActWebService';
   v_url      := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_URL_ACTUACION'
                                         ,p_segorg_id =>  v_comctz.segorg_id);
   --
   v_ticket   := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_TICKET'
                                         ,p_segorg_id =>  v_comctz.segorg_id);
   --
   --v_username := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_USERNAME'
   --                                      ,p_segorg_id =>  v_comctz.segorg_id);
   v_username := NVL(v('APP_USER'),USER) ;
   --
   --
   -- Extender el tiempo de espera para el time oput a 10 min UTL_HTTP.set_transfer_timeout(180);

   utl_http.set_transfer_timeout(600);

   req := utl_http.begin_request(v_url,'POST','HTTP/1.1');
   --
   utl_http.set_header(req,'Content-Type','text/xml');
   utl_http.set_header(req,'Transfer-Encoding','chunked');
   --
   chunk_buffer :=
   '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ws="ws.unitech.com">
	   <soapenv:Header />
      <soapenv:Body>
	   <ws:insertAdjunto> ';
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;

   utl_http.write_text(req,chunk_buffer);
   --
   v_fecha_adjunto := to_char(v_compec.FECHA,'dd/mm/yyyy');
   --
   chunk_buffer :='<ticket>'            || v_ticket                || '</ticket> '           ||
                  '<usuario_identif>'   || v_username              || '</usuario_identif> '  ||
      				'<actuacion_identif>' || p_actuacion_id          || '</actuacion_identif>' ||
      				'<adjunto_nombre>'    || v_comdoc.NOMBRE_ARCHIVO || '</adjunto_nombre>'    ||
      				'<adjunto_fecha>'     || v_fecha_adjunto         || '</adjunto_fecha> '    ||
      				'<adjunto_descr>'     || v_comdoc.NOMBRE_ARCHIVO || '</adjunto_descr> '    ||

      				'<attachment>';
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   utl_http.write_text(req,chunk_buffer);
   --
   request_body_length := dbms_lob.getlength(req_body);
   chunk_offset := 1;
   while (chunk_offset < request_body_length) loop
      if chunk_offset + buffersize >= request_body_length
      then
         chunk_length := request_body_length - chunk_offset +1 ;
      else
         chunk_length := buffersize;
      end if;
      dbms_lob.read(req_body, chunk_length, chunk_offset, chunk_buffer);
      chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
      utl_http.write_text(req,chunk_buffer);
      chunk_offset := chunk_offset + chunk_length;
   end loop;
   --
   chunk_buffer := '</attachment>';
   --
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   utl_http.write_text(req,chunk_buffer);
   --
   chunk_buffer := '</ws:insertAdjunto>
	                  </soapenv:Body>
                     </soapenv:Envelope>';
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   utl_http.write_text(req,chunk_buffer);
   --
   --insert into xml_requests(xml, fecha)
   --values (chunk_buffer_clob, sysdate);
   --
   resp := utl_http.get_response(req);
   utl_http.read_text(resp, v_response_text, 32767);
   utl_http.end_response(resp);
   --
   return v_response_text;
end;
/* Invocar Web Service Actuaciones Tramix - Solicitud de Gasto */
FUNCTION COMCTZ_INVOCAR_WS
 (P_COMCZG_ID IN NUMBER
 ,P_ACTUACION_IDENTIF IN VARCHAR2
 ,P_VALIDA IN NUMBER
 )
 RETURN VARCHAR2
 IS
--
   cursor cr_comczg is                             -- Cotizacion Documento Generado
   select * from com_cotizaciones_docgen comczg
   where comczg.id = p_comczg_id;
   --
   cursor cr_comdoc (p_comdoc_id number) is        -- Documentos
   select * from com_documentos comdoc
   where comdoc.id = p_comdoc_id;
   --
   cursor cr_comcon (p_comcon_id number) is        -- Contrataciones
   select * from com_contrataciones comcon
   where comcon.id = p_comcon_id;
   --
   cursor cr_comctz (p_comctz_id number) is        -- Cotizaciones
   select * from com_cotizaciones comctz
   where comctz.id = p_comctz_id;
   --
   cursor cr_comcot (p_comcon_id number) is        -- Contrataciones Detalles
   select * from com_contrataciones_detalles comcot
   where comcot.comcon_id = p_comcon_id;
   --
   cursor cr_comped (p_comped_id number) is
   select comped.*
         ,comeco.codigo||' - '||comeco.nombre contratante_codigo
   from com_pedidos comped
       ,com_contratantes comeco
   where comped.comeco_id = comeco.id
     and comped.id = p_comped_id;
   --
   req_body             CLOB;
   chunk_buffer_clob    CLOB;
   buffersize           NUMBER(4) := 2000;
   chunk_buffer         VARCHAR2(2000);
   chunk_length         NUMBER(4);
   chunk_offset         NUMBER;
   request_body_length  NUMBER;
   p_comped_id          number;
   req                  utl_http.req;
   resp                 utl_http.resp;
   v_response_text      VARCHAR2(32767);
   v_url                VARCHAR2(1000);
   v_username           VARCHAR2(100);
   v_ticket             VARCHAR2(100);
   v_expdte_fmt_tramix  VARCHAR2(30);
   v_tipo_expdte        VARCHAR2(30);
   v_comctz             com_cotizaciones%rowtype;
   v_comczg             com_cotizaciones_docgen%rowtype;
   v_comdoc             com_documentos%rowtype;
   v_comped             cr_comped%rowtype;
   v_comcon             com_contrataciones%rowtype;
   v_comcot             com_contrataciones_detalles%rowtype;
begin
   --
   if p_comczg_id is null then
      raise_application_error(-20000,'No se ha especificado el id de Documento Cotizacion',true);
   end if;
   --
   open cr_comczg;
   fetch cr_comczg into v_comczg;
   close cr_comczg;
   --
   if v_comczg.id is null then
      raise_application_error(-20000,'El id de Documento especificado No existe',true);
   end if;
   --
   open cr_comdoc(v_comczg.comdoc_id);
   fetch cr_comdoc into v_comdoc;
   close cr_comdoc;
   --
   open cr_comctz(v_comczg.comctz_id);
   fetch cr_comctz into v_comctz;
   close cr_comctz;
   --
   open cr_comcot(v_comctz.comcon_id);
   fetch cr_comcot into v_comcot;
   close cr_comcot;
   --
   p_comped_id := v_comcot.comped_id;
   --
   open cr_comped(v_comcot.comped_id);
   fetch cr_comped into v_comped;
   close cr_comped;
   --
   --
   -- Deducimos el Tipo de Expediente en funcion del formato
   --
   -- Si es de 6 caracteres es formato viejo No Digital
   --
    if length(substr(v_comped.expediente, 11   )) = 6 then
       v_tipo_expdte := 'EXP-';
       -- Si es de 8 caracteres
    elsif length(substr(v_comped.expediente, 11   )) = 8 then
       -- y si comienza con 00 es formato viejo No Digital
       if substr(v_comped.expediente, 11, 2) = '00' then
          v_tipo_expdte := 'EXP-';
       -- y si el segundo digito es distinto de 0 es formato nuevo Digital
       elsif to_number(substr(v_comped.expediente, 11, 2),'99') > 0 then
          v_tipo_expdte := 'EXD-';
       end if;
    end if;
   --
   -- Si la unidad ejecutora es de la Univercidad de La Punta (ULP) cambiar el Tipo de Expediente a UND-
   if substr(v_comped.contratante_codigo,1,instr(v_comped.contratante_codigo,'-',1)) = 'ULP-' then
      v_tipo_expdte := 'UND-';
   end if;
  --
   v_expdte_fmt_tramix := v_tipo_expdte ||
                        to_number(substr(v_comped.expediente, 1, 4 )) || '-' ||
                        to_number(substr(v_comped.expediente, 11   )) || '-' ||
                        to_number(substr(v_comped.expediente, 8, 2 ));
   --
   req_body := COM_PKG.Blob2ClobBase64(v_comdoc.documento);
   --
   --url := 'http://64.215.200.12:81/tramix-flex/services/ActWebService';
   v_url      := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_URL_ACTUACION'
                                           ,p_segorg_id =>  v_comctz.segorg_id);
   --
   v_ticket   := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_TICKET'
                                           ,p_segorg_id =>  v_comctz.segorg_id);
   --
   --v_username := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_USERNAME'
   --                                        ,p_segorg_id =>  v_comped.segorg_id);
   v_username := NVL(v('APP_USER'),USER) ;
   --
   --
   -- Extender el tiempo de espera para el time oput a 10 min UTL_HTTP.set_transfer_timeout(180);

   utl_http.set_transfer_timeout(600);

   req := utl_http.begin_request(v_url,'POST','HTTP/1.1');
   --
   utl_http.set_header(req,'Content-Type','text/xml');
   utl_http.set_header(req,'Transfer-Encoding','chunked');
   --
   chunk_buffer :=
   '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ws="ws.unitech.com">
	   <soapenv:Header />
      <soapenv:Body>
	   <ws:insertActuacionWAttach> ';
   --
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   --
   utl_http.write_text(req,chunk_buffer);
   --
   chunk_buffer :='  <ticket>'               || v_ticket             || '</ticket> '             ||
      					'<expediente_identif>'  || v_expdte_fmt_tramix  || '</expediente_identif>'  ||
      					'<actuacion_identif>'   || p_actuacion_identif  || '</actuacion_identif>'   ||
      					'<usuario_identif>'     || v_username           || '</usuario_identif> '    ||
      					'<valida>'              || p_valida             || '</valida> '             ||
      					'<attachment>';
   --
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   --
   utl_http.write_text(req,chunk_buffer);
   --
   request_body_length := dbms_lob.getlength(req_body);
   chunk_offset := 1;
   while (chunk_offset < request_body_length) loop
      if chunk_offset + buffersize >= request_body_length
      then
         chunk_length := request_body_length - chunk_offset +1 ;
      else
         chunk_length := buffersize;
      end if;
      dbms_lob.read(req_body, chunk_length, chunk_offset, chunk_buffer);
      --
      chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
      --
      utl_http.write_text(req,chunk_buffer);
      chunk_offset := chunk_offset + chunk_length;
   end loop;
   --
   chunk_buffer := '</attachment>';
   --
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   utl_http.write_text(req,chunk_buffer);
   --
   chunk_buffer := '</ws:insertActuacionWAttach>
	                  </soapenv:Body>
                     </soapenv:Envelope>';
   utl_http.write_text(req,chunk_buffer);
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   --
   --insert into xml_requests(xml, fecha)
   --values (chunk_buffer_clob, sysdate);
   --
   resp := utl_http.get_response(req);
   utl_http.read_text(resp, v_response_text, 32767);
   utl_http.end_response(resp);
   --
   return v_response_text;
end;
PROCEDURE COMCTZ_PROC_XML_ADJ
 (P_XML IN VARCHAR2
 ,P_ACTUACION_ID IN VARCHAR2
 ,P_SEGORG_ID IN NUMBER
 ,P_RESULTADO OUT VARCHAR2
 ,P_MOTIVO OUT VARCHAR2
 ,P_REFERENCIA OUT VARCHAR2
 )
 IS
--
   l_clob        CLOB;
   v_document    dbms_xmldom.domdocument;
   v_nodes       dbms_xmldom.DOMNodeList;
   v_element_x   dbms_xmldom.DOMElement;
   v_node        dbms_xmldom.DOMNode;
   v_node_2      dbms_xmldom.DOMNode;
   v_tag         VARCHAR2(100);
   v_node_value  VARCHAR2(100);
   --
begin
   --
   l_clob      := p_xml;
   v_document  := dbms_xmldom.newdomdocument(l_clob);
   v_nodes     := dbms_xmldom.getElementsByTagName(v_document, '*');
   --
   FOR i IN 0..dbms_xmldom.getlength(v_nodes)-1
   LOOP
      v_element_x  := dbms_xmldom.makeelement(xmldom.item(v_nodes,i));
      v_node       := dbms_xmldom.item(v_nodes,i);
      v_tag        := dbms_xmldom.getNodeName(v_node);
      v_node_2     := dbms_xmldom.getfirstchild(v_node);

      --
      -- Tag de retorno de codigo de operacion
      --
      if v_tag = 'return' then
         v_node_value := dbms_xmldom.getnodevalue(v_node_2);
         p_resultado  := v_node_value;
         p_motivo     := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo     => v_node_value
                                                  ,p_segorg_id  => p_segorg_id);
         if p_motivo is null then
            raise_application_error(-20000, 'Error: El WebService ha devuelto un valor de retorno no configurado: ' || v_node_value , true);
         end if;
         --
      end if;

      --
      -- Tag de Id de Actuacion
      --
      if v_tag = 'id' then
         v_node_value := dbms_xmldom.getnodevalue(v_node_2);
         p_referencia := v_node_value;
      end if;
   END LOOP;
   --
end;
PROCEDURE COMCTZ_PROC_XML_ACT
 (P_XML IN VARCHAR2
 ,P_SEGORG_ID IN NUMBER
 ,P_RESULTADO OUT VARCHAR2
 ,P_MOTIVO OUT VARCHAR2
 ,P_REFERENCIA OUT VARCHAR2
 )
 IS
--
   l_clob        CLOB;
   v_document    dbms_xmldom.domdocument;
   v_nodes       dbms_xmldom.DOMNodeList;
   v_element_x   dbms_xmldom.DOMElement;
   v_node        dbms_xmldom.DOMNode;
   v_node_2      dbms_xmldom.DOMNode;
   v_tag         VARCHAR2(100);
   v_node_value  VARCHAR2(100);
   --
begin
   --
   p_resultado := 'ERROR';
   l_clob      := p_xml;
   v_document  := dbms_xmldom.newdomdocument(l_clob);
   v_nodes     := dbms_xmldom.getElementsByTagName(v_document, '*');
   --
   FOR i IN 0..dbms_xmldom.getlength(v_nodes)-1
   LOOP
      v_element_x  := dbms_xmldom.makeelement(xmldom.item(v_nodes,i));
      v_node       := dbms_xmldom.item(v_nodes,i);
      v_tag        := dbms_xmldom.getNodeName(v_node);
      v_node_2     := dbms_xmldom.getfirstchild(v_node);

      --
      -- Tag de retorno de codigo de operacion
      --
      if v_tag = 'return' then
         v_node_value := dbms_xmldom.getnodevalue(v_node_2);
         p_resultado  := v_node_value;

         v_node_value := trim(replace(v_node_value, '&', ''));
         if instr(v_node_value,'-') > 0 then
            v_node_value := substr(v_node_value,0,instr(v_node_value,'-')-1);
         end if;
         --
         if instr(v_node_value,'ERR_ACT_NOTVALID(ya existe una actuaci') > 0 then
            p_resultado := 'YA_EXISTE';
         end if;
         --
         p_motivo     := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo     => v_node_value
                                                  ,p_segorg_id  => p_segorg_id);
         if p_motivo is null then
            raise_application_error(-20000, 'Error: El WebService ha devuelto un valor de retorno no configurado: <pre>' || v_node_value || ' ' || p_resultado ||'<pre>', true);
         end if;
         --
      end if;

      --
      -- Tag de Id de Actuacion
      --
      if v_tag = 'id' then
         v_node_value := dbms_xmldom.getnodevalue(v_node_2);
         p_referencia := v_node_value;
      end if;
   END LOOP;
   --
end;
PROCEDURE COMCTZ_TRANSMITIR
 (P_SEGORG_ID IN NUMBER
 ,P_COMCTZ_ID IN NUMBER
 ,P_MOTIVO IN VARCHAR2
 ,P_INTENV_ID OUT NUMBER
 )
 IS
-----------------------------------------------------------------------------------
   --
   -- Argumentos
   -- p_segorg_id => Organizacion
   -- p_comctz_id => Id de la Cotizacion
   -- p_motivo    => Motivo ingresado en la interface
   -- p_intenv_id => Id del envio
   --
   -----------------------------------------------------------------------------------
   --
   cursor cr_comctz (p_comctz_id number) is
   select * from com_cotizaciones comctz
   where comctz.id = p_comctz_id;
   --
   cursor cr_comczc is
   select * from com_cotizaciones_doc
   where comctz_id = p_comctz_id;
   --
   cursor cr_conf is
   select valor
   from seg_configuraciones
   where segorg_id = P_SEGORG_ID
   and codigo = 'COMCTZ_SRVINT_TRAMIX_HABILITADO_SN';
   --
   v_habilitado         varchar2(10) := 'NO';
   v_comczg             com_cotizaciones_docgen%rowtype;
   v_intenv             int_envios%rowtype;
   v_intori             int_origenes%ROWTYPE;
   v_intdes             int_destinos%ROWTYPE;
   v_inttpo             int_tipos_objetos%ROWTYPE;
   v_intene             int_envios_est%ROWTYPE;
   v_comctz             com_cotizaciones%rowtype;
   v_comprv             com_proveedores%rowtype;
   v_respuesta_ws       varchar2(2000);
   v_respuesta_ws_adj   varchar2(2000);
   v_resultado_ws       varchar2(2000);
   v_resultado_ws_adj   varchar2(2000);
   v_motivo             varchar2(2000);
   v_referencia         varchar2(2000);
   v_referencia_adj     varchar2(2000);
   v_actuacion_identif  varchar2(2000);
   v_aprobar            varchar2(2);
   v_inttpo_id          number;
   v_intori_id          number;
   v_intdes_id          number;
   v_intene_id          number;
   v_compdg_id          number;
   v_comczg_id          number;
   v_intenv_id          number;
   v_cantidad_adjuntos  number;
   v_documento_id       number;
   --
BEGIN
   --
   if p_segorg_id is null then
      raise_application_error(-20000,'La Organizacion no ha sido indicada y es un dato obligatorio',true);
   elsif p_comctz_id is null then
      raise_application_error(-20000,'La Cotizacion no ha sido indicada y es un dato obligatorio',true);
   end if;
   --
   for v_conf in cr_conf loop
      if v_conf.valor = 'SI' then
         v_habilitado := 'SI';
      else
         v_habilitado := 'NO';
      end if;
   end loop;

   if v_habilitado = 'NO' then
      raise_application_error(-20000,'El envio no se encuentra habilitado en estos momentos',true);
   end if;
   --
   open cr_comctz(p_comctz_id);
   fetch cr_comctz into v_comctz;
   close cr_comctz;
   --
   -- Obtener Proveedor y cuit de la cotizacion
   COMPRV_PKG.COMPRV_SET(p_id => v_comctz.COMPRV_ID);
   COMPRV_PKG.COMPRV_GET(p_comprv => v_comprv);
   COMPRV_PKG.COMPRV_INI;
   --
   -- 1. Generar y Grabar el Documento
   --
   v_documento_id := com_pkg.obtn_comctz_doc_pdf(p_segorg_id => p_segorg_id
                                                ,p_comctz_id => p_comctz_id);
   if v_documento_id is null then
      raise_application_error(-20000,'No se ha podido generar el Documento',true);
   end if;
   --
   -- 2. Grabar referencia Cotizacion-Documento Generado
   --
   SELECT COMCZG_ID.NEXTVAL INTO v_comczg_id FROM DUAL;
   v_comczg.ID        := v_comczg_id;
   v_comczg.COMCTZ_ID := p_comctz_id;
   v_comczg.COMDOC_ID := v_documento_id;
   v_comczg.FECHA     := sysdate;
   COM_PKG.COMCZG_INS(p_comczg => v_comczg);
   --
   -- 3. Transmitir el Documento al WebService
   --
   v_actuacion_identif := 'COTZAC' || '-' || 'COTIZACION DE PROVEEDOR '||v_comprv.CUIT||' '||replace(v_comprv.NOMBRE,'&','&amp;')||' N°: '|| v_comctz.id ||' '|| v_comctz.observacion;
   v_respuesta_ws := COM_PKG.COMCTZ_INVOCAR_WS(p_comczg_id         => v_comczg_id
                                             , p_actuacion_identif => v_actuacion_identif
                                             , p_valida            => 1);
   --
   -- 4. Parseamos el resultado del Webservice
   --
   COM_PKG.COMCTZ_PROC_XML_ACT(p_xml       => v_respuesta_ws
                              ,p_segorg_id => p_segorg_id
                              ,p_resultado => v_resultado_ws
                              ,p_motivo    => v_motivo
                              ,p_referencia=> v_referencia);
   --
   IF v_resultado_ws = 'ERROR' THEN
      raise_application_error(-20000,'No se ha podido interpretar el mensaje de respuesta.',true);
   END IF;
   ----------------------------------------------------------
   -- 5. Grabar Log en Envíos
   ----------------------------------------------------------
   INT_PKG.INTTPO_SET_CODIGO(p_segorg_id => p_segorg_id
                            ,p_codigo    => 'COMCTZ_ACTUACION');
   INT_PKG.INTTPO_GET(p_inttpo => v_inttpo);
   v_inttpo_id := v_inttpo.id;
   --
   INT_PKG.INTENV_REGISTRAR(
                  P_INTTPO_ID     => v_inttpo_id
                 ,P_INTENV_OBJETO => '<comdoc_id>'    || v_documento_id || '</comdoc_id>'
                 ,P_INTENV_OBS    => v_respuesta_ws
                 ,P_INTENV_RES    => '<return>'       || v_resultado_ws || '<return>'        ||
                                     '<actuacion_id>' || v_referencia   || '</actuacion_id>'
                 ,P_INTENE_FECHA  => sysdate
                 ,P_INTENV_ID     => v_intenv_id
   );
   --
   --
   -- 6. Si la Actuacion principal se inserto correctamente
   --    entonces vamos a verificar si tiene adjuntos
   --
   --
   IF instr(v_resultado_ws,'OP_COMPLETED') > 0 THEN
      --
      v_aprobar := 'SI';

      select count(*) into v_cantidad_adjuntos from com_cotizaciones_doc  where comctz_id = p_comctz_id;
      IF v_cantidad_adjuntos > 0 THEN
         --OP_COMPLETED-SOLSEC 460/11
         v_actuacion_identif := substr(v_resultado_ws, 14 );
         --
         -- 7. Transmitir Documentos Adjuntos al WebService
         --

         FOR v_comczc IN cr_comczc LOOP
            --
            -- 8. Buscamos el documento adjunto y lo transmitimos al WS
            --
            v_respuesta_ws_adj := COM_PKG.COMCTZ_INVOCAR_WS_ADJUNTO(p_actuacion_id => v_actuacion_identif
                                                                   ,p_comczc_id    => v_comczc.id);

            --
            -- 9. Parseamos el resultado del Webservice de envio de adjunto
            --
            COM_PKG.COMCTZ_PROC_XML_ADJ( p_xml          => v_respuesta_ws_adj
                                        ,p_actuacion_id => v_referencia
                                        ,p_segorg_id    => p_segorg_id
                                        ,p_resultado    => v_resultado_ws_adj
                                        ,p_motivo       => v_motivo
                                        ,p_referencia   => v_referencia_adj);
            --
            -- 10. Grabar Log en Envíos de Adjuntos
            --
            INT_PKG.INTTPO_SET_CODIGO(p_segorg_id => p_segorg_id
                                     ,p_codigo    => 'COMCTZ_ACTUACION');
            INT_PKG.INTTPO_GET(p_inttpo => v_inttpo);
            v_inttpo_id := v_inttpo.id;
            --
            INT_PKG.INTENV_REGISTRAR(
                                   P_INTTPO_ID     => v_inttpo_id
                                  ,P_INTENV_OBJETO => '<comdoc_id>'    ||   v_comczc.comdoc_id   || '</comdoc_id>'
                                  ,P_INTENV_OBS    => v_respuesta_ws
                                  ,P_INTENV_RES    => '<return>'       || v_resultado_ws_adj || '<return>'        ||
                                                      '<actuacion_id>' || v_referencia       || '</actuacion_id>'
                                  ,P_INTENE_FECHA  => sysdate
                                  ,P_INTENV_ID     => v_intenv_id
                                    );
            --
            IF v_resultado_ws_adj <> 'OP_COMPLETED' THEN
               --
               v_aprobar := 'NO';
               --
               -- 8.B Modificar Estado del Envio del Adjunto a ERROR
               --
               SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
               v_intene.INTENV_ID     := v_intenv_id;
               v_intene.FECHA         := sysdate;
               v_intene.ESTADO        := 'ERR';
               v_intene.MOTIVO_ESTADO := v_motivo || '-Error al enviar archivo adjunto ' || v_resultado_ws_adj;
               INT_PKG.INTENE_INS(p_intene => v_intene);
               --
            END IF;
         END LOOP;
         --
         -- Si envio correctamente la actuacion y tambien todos los adjuntos
         -- entonces modificamos el estado a ENVIADO
         --
         IF v_aprobar = 'SI' THEN
            --
            -- 8.A Modificar Estado del Envio a ENVIADO
            --
            SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
            v_intene.ID            := v_intene_id;
            v_intene.INTENV_ID     := v_intenv_id;
            v_intene.FECHA         := sysdate;
            v_intene.ESTADO        := 'ENV';
            v_intene.MOTIVO_ESTADO := v_motivo;
            INT_PKG.INTENE_INS(p_intene => v_intene);
            --
         END IF;
         --
      ELSE -- Si no tiene adjuntos y la actuacion principal se envió correctamente
         --
         -- 8.A Modificar Estado del Envio a ENVIADO
         --
         SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
         v_intene.ID            := v_intene_id;
         v_intene.INTENV_ID     := v_intenv_id;
         v_intene.FECHA         := sysdate;
         v_intene.ESTADO        := 'ENV';
         v_intene.MOTIVO_ESTADO := v_motivo;
         INT_PKG.INTENE_INS(p_intene => v_intene);
         --
      END IF;
   ELSE -- Devuelve distinto de OP_COMPLETED
      --
      -- 8.B Modificar Estado del Envio ERROR
      --
      SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
      v_intene.ID            := v_intene_id;
      v_intene.INTENV_ID     := v_intenv_id;
      v_intene.FECHA         := sysdate;
      v_intene.ESTADO        := 'ERR';
      v_intene.MOTIVO_ESTADO := v_motivo;
      INT_PKG.INTENE_INS(p_intene => v_intene);
      --
   END IF;
   --
   p_intenv_id := v_intenv_id;
   --
EXCEPTION WHEN others THEN
   raise_application_error(-20000,'No se ha podido Enviar la Cotizacion',true);
END;
PROCEDURE COMCTZ_VERIFICAR
 (P_SEGORG_ID IN NUMBER
 ,P_COMCON_ID IN NUMBER
 ,P_INTENV_ID OUT NUMBER
 )
 IS
-----------------------------------------------------------------------------------
   --
   -- Argumentos
   -- p_segorg_id => Organizacion
   -- p_comcon_id => Id de la contratacion
   --
   -----------------------------------------------------------------------------------
   --
   cursor cr_comcon (p_comcon_id number) is
   select * from com_contrataciones comcon
   where comcon.id = p_comcon_id;
   --
   cursor cr_comctz (p_comcon_id number) is
   select * from com_cotizaciones comctz
   where comctz.comcon_id = p_comcon_id
     and comctz.situacion = 'PRE';  -- linea agregada el 19/09/2012 (email reclamo Formini)
   --
   cursor cr_comczc(p_comctz_id number) is
   select * from com_cotizaciones_doc
   where comctz_id = p_comctz_id;
   --
   cursor cr_conf is
   select valor
   from seg_configuraciones
   where segorg_id = P_SEGORG_ID
   and codigo = 'COMCON_SRVINT_TRAMIX_HABILITADO_SN';
   --
   cursor cr_comdct is
   select id from com_documentos_tipos
   where segorg_id = p_segorg_id
   and codigo = 'COM_EVALUACION';
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
   CURSOR cr_comcot IS
   SELECT *
   FROM COM_CONTRATACIONES_DETALLES
   WHERE COMCON_ID = p_comcon_id;
   --
   v_habilitado         varchar2(10);
   v_comcon             com_contrataciones%rowtype;
   v_comczg             com_cotizaciones_docgen%rowtype;
   v_comcod             com_contrataciones_doc%rowtype;
   v_comcdg             com_contrataciones_docgen%rowtype;
   v_intenv             int_envios%rowtype;
   v_comcoe             com_contrataciones_est%ROWTYPE;
   v_comctt             com_contrataciones_tipos%ROWTYPE;
   v_intori             int_origenes%ROWTYPE;
   v_intdes             int_destinos%ROWTYPE;
   v_inttpo             int_tipos_objetos%ROWTYPE;
   v_intene             int_envios_est%ROWTYPE;
   v_comctz             com_cotizaciones%rowtype;
   v_comped             COM_PEDIDOS%ROWTYPE;
   v_comcot             com_contrataciones_detalles%rowtype;
   v_respuesta_ws       varchar2(2000);
   v_respuesta_ws_adj   varchar2(2000);
   v_resultado_ws       varchar2(2000);
   v_resultado_ws_adj   varchar2(2000);
   v_motivo             varchar2(2000);
   v_referencia         varchar2(2000);
   v_referencia_adj     varchar2(2000);
   v_actuacion_identif  varchar2(2000);
   v_aprobar            varchar2(2);
   v_comczg_id          number;
   v_inttpo_id          number;
   v_intori_id          number;
   v_intdes_id          number;
   v_intene_id          number;
   v_comdct_id          number;
   v_comcdg_id          number;
   v_intenv_id          number;
   v_cantidad_adjuntos  number;
   v_documento_id       number;
   p_comctz_id          number;
   v_comped_id          number;
   --
BEGIN
      --
      if p_segorg_id is null then
         raise_application_error(-20000,'La Organizacion no ha sido indicada y es un dato obligatorio',true);
      elsif p_comcon_id is null then
         raise_application_error(-20000,'La Contratacion no ha sido indicada y es un dato obligatorio',true);
      end if;
      --
      -- Obtener el tipo de documento
      --
      OPEN cr_comdct;
      FETCH cr_comdct INTO v_comdct_id;
      CLOSE cr_comdct;
      --
      if v_comdct_id is null then
         raise_application_error(-20000,'No se ha podido determinar el tipo de documento de la Cotizacion',true);
      end if;
      --
      open cr_comcon(p_comcon_id);
      fetch cr_comcon into v_comcon;
      close cr_comcon;
      --
      if v_comcon.id is null then
         raise_application_error(-20000,'No se han podido obtener los datos del Proceso de Contratación',true);
      end if;
      --
      OPEN cr_comctt(v_comcon.comctt_id);
      FETCH cr_comctt INTO v_comctt;
      CLOSE cr_comctt;
      --
      if v_comctt.id is null then
         raise_application_error(-20000,'No se ha podido determinar el tipo de Contratación',true);
      end if;
      --
      -- Obtener los datos del Detalle de Contratacion
      --
      OPEN cr_comcot;
      FETCH cr_comcot INTO v_comcot;
      CLOSE cr_comcot;
      --
      -- Validar que existe el detalle
      --
      if v_comcot.id is null then
         raise_application_error(-20000,'No se han encontrado datos del detalle de Contratación',true);
      end if;
      --
      -- Obtener los datos del pedido
      --
      v_comped_id := v_comcot.comped_id;
      OPEN cr_comped(v_comped_id);
      FETCH cr_comped INTO v_comped;
      CLOSE cr_comped;
      --
      -- Validar que existe el pedido
      --
      if v_comped.id is null then
         raise_application_error(-20000,'La solicitud de Gasto especificada No Existe',true);
      end if;
      --
      -- 1. Generar y Grabar el Documento
      --
      v_documento_id := com_pkg.obtn_comczd_doc_pdf(p_segorg_id => p_segorg_id
                                                   ,p_comcon_id => p_comcon_id);
      if v_documento_id is null then
         raise_application_error(-20000,'No se ha podido generar el Documento de la Cotizacion',true);
      end if;
      --
      -- 2. Grabar referencia Proceso - Documento Evaluacion
      --
      BEGIN
         SELECT COMCDG_ID.NEXTVAL INTO v_comcdg_id FROM DUAL;
         v_comcdg.ID        := v_comcdg_id;
         v_comcdg.COMCON_ID := p_comcon_id;
         v_comcdg.COMDOC_ID := v_documento_id;
         v_comcdg.COMDCT_ID := v_comdct_id;
         v_comcdg.FECHA     := sysdate;
         COM_PKG.COMCDG_INS(p_comcdg => v_comcdg);
         --
         --SELECT COMCZG_ID.NEXTVAL INTO v_comczg_id FROM DUAL;
         --v_comczg.ID        := v_comczg_id;
         --v_comczg.COMCTZ_ID := p_comcon_id; --p_comctz_id;
         --v_comczg.COMDOC_ID := v_documento_id;
         --v_comczg.COMDCT_ID := v_comdct_id;
         --v_comczg.FECHA     := sysdate;
         --COM_PKG.COMCZG_INS(p_comczg => v_comczg);
      EXCEPTION WHEN others THEN
         raise_application_error(-20000,'No se ha podido Grabar referencia Proceso-Documento Evaluacion',true);
      END;

      --
      -- 3. Transmitir el Documento al WebService
      --
      v_actuacion_identif := 'INFSEC' || '-' || 'INFORME DE EVALUACION DE PROCESO DE CONTRATACION N°: ' || v_comcon.codigo || '/' ||  v_comped.ejercicio || ' - '  || v_comctt.NOMBRE ;
      BEGIN
         --v_respuesta_ws := COM_PKG.COMCZD_INVOCAR_WS(p_comczg_id         => v_comcdg_id
         --                                          , p_actuacion_identif => v_actuacion_identif
         --                                          , p_valida            => 1);
         v_respuesta_ws := COM_PKG.COMCON_INVOCAR_WS(p_comcdg_id         => v_comcdg_id
                                                   , p_actuacion_identif => v_actuacion_identif
                                                   , p_valida            => 1);

         update com_contrataciones_docgen
         set xml_enviado = xml_enviado || chr(13) || chr(10) || ' Cotizacion ' || to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss') || chr(13) || chr(10) || v_respuesta_ws
         where id = v_comcdg_id;

      EXCEPTION WHEN others THEN
         raise_application_error(-20000,'Error al invocar WebService',true);
      END;
      dbms_output.put_line('v_respuesta_ws = ' || v_respuesta_ws);
      --
      -- 4. Parseamos el resultado del Webservice
      --
      COM_PKG.COMCTZ_PROC_XML_ACT(p_xml       => v_respuesta_ws
                                 ,p_segorg_id => p_segorg_id
                                 ,p_resultado => v_resultado_ws
                                 ,p_motivo    => v_motivo
                                 ,p_referencia=> v_referencia);
      --
      IF v_resultado_ws = 'ERROR' THEN
         raise_application_error(-20000,'No se ha podido interpretar el mensaje de respuesta.',true);
      END IF;

      ----------------------------------------------------------
      -- 5. Grabar Log en Envíos
      ----------------------------------------------------------
      INT_PKG.INTTPO_SET_CODIGO(p_segorg_id => p_segorg_id
                               ,p_codigo    => 'COMCZD_ACTUACION');
      INT_PKG.INTTPO_GET(p_inttpo => v_inttpo);
      if v_inttpo.id is null then
         raise_application_error(-20000,'El codigo de tipo de objeto COMCZD_ACTUACION no se encuentra configurado',true);
      end if;
      v_inttpo_id := v_inttpo.id;
      --
      INT_PKG.INTENV_REGISTRAR(
                     P_INTTPO_ID     => v_inttpo_id
                    ,P_INTENV_OBJETO => '<comdoc_id>'    || v_documento_id || '</comdoc_id>'
                    ,P_INTENV_OBS    => v_respuesta_ws
                    ,P_INTENV_RES    => '<return>'       || v_resultado_ws || '<return>'        ||
                                        '<actuacion_id>' || v_referencia   || '</actuacion_id>'
                    ,P_INTENE_FECHA  => sysdate
                    ,P_INTENV_ID     => v_intenv_id
      );
      --
      --
      -- 6. Si la Actuacion principal se inserto correctamente
      --    entonces vamos a verificar si tiene adjuntos
      --
      --
      IF instr(v_resultado_ws,'OP_COMPLETED') > 0 THEN
         --
         v_aprobar := 'SI';
         --
         select count(*)
         into v_cantidad_adjuntos
         from com_cotizaciones comctz , com_cotizaciones_doc comctd
         where comctz.id = comctd.comctz_id
         and comctz.comcon_id = p_comcon_id
         and comctz.situacion = 'PRE'; -- linea agregada el 19/09/2012 (email Formini)
         --comctz_id = p_comctz_id;

         dbms_output.put_line('v_cantidad_adjuntos=' || v_cantidad_adjuntos);
         IF v_cantidad_adjuntos > 0 THEN
            v_actuacion_identif := substr(v_resultado_ws, 14 );
            --
            -- 7. Transmitir Documentos Adjuntos al WebService
            --
            FOR v_comctz IN cr_comctz(p_comcon_id) LOOP
               p_comctz_id := v_comctz.id;

               dbms_output.put_line('v_actuacion_identif = ' || v_actuacion_identif);
               FOR v_comczc IN cr_comczc(v_comctz.id) LOOP
                  dbms_output.put_line('entro al for cursor');
                  --
                  -- 8. Buscamos el documento adjunto y lo transmitimos al WS
                  --
                  v_respuesta_ws_adj := COM_PKG.COMCZD_INVOCAR_WS_ADJUNTO(p_actuacion_id => v_actuacion_identif
                                                                         ,p_comczc_id    => v_comczc.id);
                  dbms_output.put_line('v_respuesta_ws_adj = ' || v_respuesta_ws_adj);
                  --
                  -- 9. Parseamos el resultado del Webservice de envio de adjunto
                  --
                  COM_PKG.COMCTZ_PROC_XML_ADJ( p_xml          => v_respuesta_ws_adj
                                              ,p_actuacion_id => v_referencia
                                              ,p_segorg_id    => p_segorg_id
                                              ,p_resultado    => v_resultado_ws_adj
                                              ,p_motivo       => v_motivo
                                              ,p_referencia   => v_referencia_adj);
                  --
                  -- 10. Grabar Log en Envíos de Adjuntos
                  --
                  INT_PKG.INTTPO_SET_CODIGO(p_segorg_id => p_segorg_id
                                           ,p_codigo    => 'COMCON_ACTUACION');
                  INT_PKG.INTTPO_GET(p_inttpo => v_inttpo);
                  --
                  if v_inttpo.id is null then
                     raise_application_error(-20000,'El codigo de tipo de objeto COMCON_ACTUACION no se encuentra configurado',true);
                  end if;
                  v_inttpo_id := v_inttpo.id;
                  --
                  INT_PKG.INTENV_REGISTRAR(
                                         P_INTTPO_ID     => v_inttpo_id
                                        ,P_INTENV_OBJETO => '<comdoc_id>'    || v_documento_id     || '</comdoc_id>'
                                        ,P_INTENV_OBS    => v_respuesta_ws
                                        ,P_INTENV_RES    => '<return>'       || v_resultado_ws_adj || '<return>'        ||
                                                            '<actuacion_id>' || v_referencia       || '</actuacion_id>'
                                        ,P_INTENE_FECHA  => sysdate
                                        ,P_INTENV_ID     => v_intenv_id
                                          );
                  --
                  IF v_resultado_ws_adj <> 'OP_COMPLETED' THEN
                     --
                     v_aprobar := 'NO';
                     --
                     -- 8.B Modificar Estado del Envio del Adjunto a ERROR
                     --
                     SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
                     v_intene.INTENV_ID     := v_intenv_id;
                     v_intene.FECHA         := sysdate;
                     v_intene.ESTADO        := 'ERR';
                     v_intene.MOTIVO_ESTADO := v_motivo || '-Error al enviar adjunto ' || v_resultado_ws_adj;
                     INT_PKG.INTENE_INS(p_intene => v_intene);
                     --
                  END IF;
               END LOOP;
            END LOOP;
            --
            IF v_aprobar = 'SI' THEN
               --
               -- 8.A Modificar Estado del Envio a ENVIADO
               --
               SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
               v_intene.ID            := v_intene_id;
               v_intene.INTENV_ID     := v_intenv_id;
               v_intene.FECHA         := sysdate;
               v_intene.ESTADO        := 'ENV';
               v_intene.MOTIVO_ESTADO := v_motivo;
               INT_PKG.INTENE_INS(p_intene => v_intene);
               --
            END IF;
            --
         ELSE -- Si no tiene adjuntos
            --
            -- 8.A Modificar Estado del Envio a ENVIADO
            --
            SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
            v_intene.ID            := v_intene_id;
            v_intene.INTENV_ID     := v_intenv_id;
            v_intene.FECHA         := sysdate;
            v_intene.ESTADO        := 'ENV';
            v_intene.MOTIVO_ESTADO := v_motivo;
            INT_PKG.INTENE_INS(p_intene => v_intene);
            --
         END IF;
      --ELSIF v_resultado_ws = 'YA_EXISTE' THEN
      --   null;
      --
      ELSE -- Devuelve distinto de OP_COMPLETED
         --
         -- 8.B Modificar Estado del Envio ERROR
         --
         SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
         v_intene.ID            := v_intene_id;
         v_intene.INTENV_ID     := v_intenv_id;
         v_intene.FECHA         := sysdate;
         v_intene.ESTADO        := 'ERR';
         v_intene.MOTIVO_ESTADO := v_motivo;
         INT_PKG.INTENE_INS(p_intene => v_intene);
         --
      END IF;
      --
      p_intenv_id := v_intenv_id;
      --
EXCEPTION WHEN others THEN
   raise_application_error(-20000,'No se ha podido ejecutar el proceso para la integracion de la cotizacion',true);
END;
/* Seteo la variable v_comczg */
PROCEDURE COMCZG_SET
 (P_ID IN NUMBER
 )
 IS
CURSOR cr_comczg IS
  SELECT *
  FROM COM_COTIZACIONES_DOCGEN COMCZG
  WHERE COMCZG.ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  COM_PKG.COMCZG_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comczg;
  FETCH cr_comczg INTO v_comczg;
  CLOSE cr_comczg;
  --
END;
PROCEDURE COMCZG_INS
 (P_COMCZG IN COM_COTIZACIONES_DOCGEN%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_COTIZACIONES_DOCGEN
  ( ID
    ,COMCTZ_ID
    ,COMDOC_ID
    ,FECHA
    ,DATE_CREATED
    ,DATE_MODIFIED
    ,CREATED_BY
    ,MODIFIED_BY  )
  values
  ( p_comczg.ID
    ,p_comczg.COMCTZ_ID
    ,p_comczg.COMDOC_ID
    ,p_comczg.FECHA
    ,p_comczg.DATE_CREATED
    ,p_comczg.DATE_MODIFIED
    ,p_comczg.CREATED_BY
    ,p_comczg.MODIFIED_BY  );
  --
END;
PROCEDURE COMCZG_INI
 IS
begin
  v_comczg := null;
end;
PROCEDURE COMCZG_GET
 (P_COMCZG OUT COM_COTIZACIONES_DOCGEN%ROWTYPE
 )
 IS
begin
  p_comczg := v_comczg;
end;
/* Invocar Web Service Actuaciones Tramix - Solicitud de Gasto - Adjuntos */
FUNCTION COMCZD_INVOCAR_WS_ADJUNTO
 (P_ACTUACION_ID IN VARCHAR2
 ,P_COMCZC_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
req_body             CLOB;
   chunk_buffer_clob    CLOB;
   buffersize           NUMBER(4) := 2000;
   chunk_buffer         VARCHAR2(2000);
   chunk_length         NUMBER(4);
   chunk_offset         NUMBER;
   request_body_length  NUMBER;
   req                  utl_http.req;
   resp                 utl_http.resp;
   v_response_text      VARCHAR2(32767);
   v_url                VARCHAR2(1000);
   actuacion_identif    VARCHAR2(1000);
   v_username           VARCHAR2(100);
   v_ticket             VARCHAR2(100);
   v_fecha_adjunto      VARCHAR2(100);
   v_comctz             com_cotizaciones%rowtype;
   v_comped             com_pedidos%rowtype;
   v_comdoc             com_documentos%rowtype;
   v_comczc             com_cotizaciones_doc%rowtype;
   --
   cursor cr_comctz (p_comctz_id number) is
   select * from com_cotizaciones comctz
   where comctz.id = p_comctz_id;
   --
   cursor cr_comczc is
   select * from com_cotizaciones_doc
   where id = p_comczc_id;
   --
   cursor cr_comdoc (p_comdoc_id number) is
   select * from com_documentos comdoc
   where comdoc.id = p_comdoc_id;
   --
   --cursor cr_comped (p_comped_id number) is
   --select * from com_pedidos comped
   --where comped.id = p_comped_id;
   --
   --
   cursor cr_comcot (p_comctz_id number) is
   select * from com_cotizaciones_detalles comczd
   where comczd.comctz_id = p_comctz_id;
   --
begin
   open cr_comczc;
   fetch cr_comczc into v_comczc;
   close cr_comczc;
   --
   open cr_comdoc(v_comczc.comdoc_id);
   fetch cr_comdoc into v_comdoc;
   close cr_comdoc;
   --
   open cr_comctz(v_comczc.comctz_id);
   fetch cr_comctz into v_comctz;
   close cr_comctz;
   --
   -- Necesitamos obtener el número de expediente
   -- Buscamos en el detalle del proceso el id del pedido
   --
   --open cr_comcot(v_comcod.comcon_id);
   --fetch cr_comcot into v_comcot;
   --close cr_comcot;
   --
   -- con el id del pedido del detalle obtenemos la cabecera del pedido
   --
   --open cr_comped(v_comcot.comped_id);
   --fetch cr_comped into v_comped;
   --close cr_comped;
   --
   req_body := COM_PKG.Blob2ClobBase64(v_comdoc.documento);
   --
   --url := 'http://64.215.200.12:81/tramix-flex/services/ActWebService';
   v_url      := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_URL_ACTUACION'
                                         ,p_segorg_id =>  v_comctz.segorg_id);
   --
   v_ticket   := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_TICKET'
                                         ,p_segorg_id =>  v_comctz.segorg_id);
   --
   --v_username := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_USERNAME'
   --                                      ,p_segorg_id =>  v_comcon.segorg_id);
   v_username := NVL(v('APP_USER'),USER) ;
   --
   --
   -- Extender el tiempo de espera para el time oput a 10 min UTL_HTTP.set_transfer_timeout(180);

   utl_http.set_transfer_timeout(600);

   req := utl_http.begin_request(v_url,'POST','HTTP/1.1');
   --
   utl_http.set_header(req,'Content-Type','text/xml');
   utl_http.set_header(req,'Transfer-Encoding','chunked');
   --
   chunk_buffer :=
   '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ws="ws.unitech.com">
	   <soapenv:Header />
      <soapenv:Body>
	   <ws:insertAdjunto> ';
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;

   utl_http.write_text(req,chunk_buffer);
   --
   v_fecha_adjunto := to_char(v_comczc.FECHA,'dd/mm/yyyy');
   --
   chunk_buffer :='<ticket>'            || v_ticket                || '</ticket> '           ||
                  '<usuario_identif>'   || v_username              || '</usuario_identif> '  ||
      				'<actuacion_identif>' || p_actuacion_id          || '</actuacion_identif>' ||
      				'<adjunto_nombre>'    || v_comdoc.NOMBRE_ARCHIVO || '</adjunto_nombre>'    ||
      				'<adjunto_fecha>'     || v_fecha_adjunto         || '</adjunto_fecha> '    ||
      				'<adjunto_descr>'     || v_comdoc.NOMBRE_ARCHIVO || '</adjunto_descr> '    ||
      				'<attachment>';
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   utl_http.write_text(req,chunk_buffer);
   --
   request_body_length := dbms_lob.getlength(req_body);
   chunk_offset := 1;
   while (chunk_offset < request_body_length) loop
      if chunk_offset + buffersize >= request_body_length
      then
         chunk_length := request_body_length - chunk_offset +1 ;
      else
         chunk_length := buffersize;
      end if;
      dbms_lob.read(req_body, chunk_length, chunk_offset, chunk_buffer);
      chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
      utl_http.write_text(req,chunk_buffer);
      chunk_offset := chunk_offset + chunk_length;
   end loop;
   --
   chunk_buffer := '</attachment>';
   --
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   utl_http.write_text(req,chunk_buffer);
   --
   chunk_buffer := '</ws:insertAdjunto>
	                  </soapenv:Body>
                     </soapenv:Envelope>';
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   utl_http.write_text(req,chunk_buffer);
   --
   --insert into xml_requests(xml, fecha)
   --values (chunk_buffer_clob, sysdate);
   --
   resp := utl_http.get_response(req);
   utl_http.read_text(resp, v_response_text, 32767);
   utl_http.end_response(resp);
   --
   return v_response_text;
end;
/* Invocar Web Service Actuaciones Tramix - Evaluacion */
FUNCTION COMCZD_INVOCAR_WS
 (P_COMCZG_ID IN NUMBER
 ,P_ACTUACION_IDENTIF IN VARCHAR2
 ,P_VALIDA IN NUMBER
 )
 RETURN VARCHAR2
 IS
req_body             CLOB;
   chunk_buffer_clob    CLOB;
   buffersize           NUMBER(4) := 2000;
   chunk_buffer         VARCHAR2(2000);
   chunk_length         NUMBER(4);
   chunk_offset         NUMBER;
   request_body_length  NUMBER;
   req                  utl_http.req;
   resp                 utl_http.resp;
   v_response_text      VARCHAR2(32767);
   v_url                VARCHAR2(1000);
   v_username           VARCHAR2(100);
   v_ticket             VARCHAR2(100);
   v_expdte_fmt_tramix  VARCHAR2(30);
   v_tipo_expdte        VARCHAR2(30);
   v_comctz             com_cotizaciones%rowtype;
   v_comczd             com_cotizaciones_detalles%rowtype;
   v_comczg             com_cotizaciones_docgen%rowtype;
   v_comdoc             com_documentos%rowtype;
   --
   cursor cr_comczg is
   select * from com_cotizaciones_docgen comczg
   where comczg.id = p_comczg_id;
   --
   cursor cr_comdoc (p_comdoc_id number) is
   select * from com_documentos comdoc
   where comdoc.id = p_comdoc_id;
   --
   cursor cr_comctz (p_comctz_id number) is
   select * from com_cotizaciones comctz
   where comctz.id = p_comctz_id;
   --
   cursor cr_comczd (p_comctz_id number) is
   select * from com_cotizaciones_detalles comczd
   where comczd.comctz_id = p_comctz_id;
   --
   cursor cr_comped (p_comped_id number) is
   select comped.*
         ,comeco.codigo||' - '||comeco.nombre contratante_codigo
   from com_pedidos comped
       ,com_contratantes comeco
   where comped.comeco_id = comeco.id
     and comped.id = p_comped_id;
   --
   v_comped             cr_comped%rowtype;
begin
   --
   if p_comczg_id is null then
      raise_application_error(-20000,'No se ha especificado el id de Documento - Cotizacion',true);
   end if;
   --
   open cr_comczg;
   fetch cr_comczg into v_comczg;
   close cr_comczg;
   --
   if v_comczg.id is null then
      raise_application_error(-20000,'Cotizacion - El id de Documento especificado No existe',true);
   end if;
   --
   open cr_comdoc(v_comczg.comdoc_id);
   fetch cr_comdoc into v_comdoc;
   close cr_comdoc;
   --
   open cr_comctz(v_comczg.comctz_id);
   fetch cr_comctz into v_comctz;
   close cr_comctz;
   --
   -- Necesitamos obtener el número de expediente
   -- Buscamos en el detalle del proceso el id del pedido
   open cr_comczd(v_comctz.comcon_id);
   fetch cr_comczd into v_comczd;
   close cr_comczd;
   --
   -- con el id del pedido del detalle obtenemos la cabecera del pedido
   --
   open cr_comped(v_comczd.comped_id);
   fetch cr_comped into v_comped;
   close cr_comped;
   --
   -- Deducimos el Tipo de Expediente en funcion del formato
   --
   -- Si es de 6 caracteres es formato viejo No Digital
   --
    if length(substr(v_comped.expediente, 11   )) = 6 then
       v_tipo_expdte := 'EXP-';
       -- Si es de 8 caracteres
    elsif length(substr(v_comped.expediente, 11   )) = 8 then
       -- y si comienza con 00 es formato viejo No Digital
       if substr(v_comped.expediente, 11, 2) = '00' then
          v_tipo_expdte := 'EXP-';
       -- y si el segundo digito es distinto de 0 es formato nuevo Digital
       elsif to_number(substr(v_comped.expediente, 11, 2),'99') > 0 then
          v_tipo_expdte := 'EXD-';
       end if;
    end if;
   --
   -- Si la unidad ejecutora es de la Univercidad de La Punta (ULP) cambiar el Tipo de Expediente a UND-
   if substr(v_comped.contratante_codigo,1,instr(v_comped.contratante_codigo,'-',1)) = 'ULP-' then
      v_tipo_expdte := 'UND-';
   end if;
  --
   v_expdte_fmt_tramix := v_tipo_expdte ||
                        to_number(substr(v_comped.expediente, 1, 4 )) || '-' ||
                        to_number(substr(v_comped.expediente, 11   )) || '-' ||
                        to_number(substr(v_comped.expediente, 8, 2 ));
   --
   req_body := COM_PKG.Blob2ClobBase64(v_comdoc.documento);
   --
   --url := 'http://64.215.200.12:81/tramix-flex/services/ActWebService';
   v_url      := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_URL_ACTUACION'
                                           ,p_segorg_id =>  v_comctz.segorg_id);
   --
   v_ticket   := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_TICKET'
                                           ,p_segorg_id =>  v_comctz.segorg_id);
   --
   --v_username := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_USERNAME'
   --                                        ,p_segorg_id =>  v_comcon.segorg_id);
   v_username := NVL(v('APP_USER'),USER) ;
   --
   --
   -- Extender el tiempo de espera para el time oput a 10 min UTL_HTTP.set_transfer_timeout(180);

   utl_http.set_transfer_timeout(600);

   req := utl_http.begin_request(v_url,'POST','HTTP/1.1');
   --
   utl_http.set_header(req,'Content-Type','text/xml');
   utl_http.set_header(req,'Transfer-Encoding','chunked');
   --
   chunk_buffer :=
   '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ws="ws.unitech.com">
	   <soapenv:Header />
      <soapenv:Body>
	   <ws:insertActuacionWAttach> ';
   --
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   --
   utl_http.write_text(req,chunk_buffer);
   --
   chunk_buffer :='  <ticket>'               || v_ticket             || '</ticket> '             ||
      					'<expediente_identif>'  || v_expdte_fmt_tramix  || '</expediente_identif>'  ||
      					'<actuacion_identif>'   || p_actuacion_identif  || '</actuacion_identif>'   ||
      					'<usuario_identif>'     || v_username           || '</usuario_identif> '    ||
      					'<valida>'              || p_valida             || '</valida> '             ||
      					'<attachment>';
   --
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   --
   utl_http.write_text(req,chunk_buffer);
   --
   request_body_length := dbms_lob.getlength(req_body);
   chunk_offset := 1;
   while (chunk_offset < request_body_length) loop
      if chunk_offset + buffersize >= request_body_length
      then
         chunk_length := request_body_length - chunk_offset +1 ;
      else
         chunk_length := buffersize;
      end if;
      dbms_lob.read(req_body, chunk_length, chunk_offset, chunk_buffer);
   --
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   --
      utl_http.write_text(req,chunk_buffer);
      chunk_offset := chunk_offset + chunk_length;
   end loop;
   --
   chunk_buffer := '</attachment>';
   --
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   utl_http.write_text(req,chunk_buffer);
   --
   chunk_buffer := '</ws:insertActuacionWAttach>
	                  </soapenv:Body>
                     </soapenv:Envelope>';
   utl_http.write_text(req,chunk_buffer);
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   --
   dbms_output.put_line('chunk_buffer_clob=' ||dbms_lob.substr( chunk_buffer_clob, 4000, 1 ));
   --begin
   --   insert into xml_requests(xml, fecha)
   --   values (chunk_buffer_clob, sysdate);
   --   commit;
   --end;
   --
   resp := utl_http.get_response(req);
   utl_http.read_text(resp, v_response_text, 32767);
   utl_http.end_response(resp);
   --
   return v_response_text;
end;
/* Anular un registro de Estado de Contratantes. */
PROCEDURE COMECE_ANULAR
 (P_COMECE_ID IN COM_CONTRATANTES_EST.ID%TYPE
 ,P_MOTIVO_SITUACION IN VARCHAR2
 )
 IS
cursor cr_comeco is
    select comece.comeco_id
    from   COM_CONTRATANTES_EST comece
    where  comece.ID = p_comece_id;
  --
  v_comeco_id number;
  v_comece_id number;
  --
BEGIN
  --
  UPDATE COM_CONTRATANTES_EST
  SET   SITUACION = 'ANU'
      , MOTIVO_SITUACION = p_motivo_situacion
  WHERE ID = p_comece_id;
  --
  open cr_comeco;
  fetch cr_comeco into v_comeco_id;
  close cr_comeco;
  --
  v_comece_id := COM_PKG.OBTN_COMECE_ID(P_COMECO_ID => v_comeco_id);
  --
  update COM_CONTRATANTES
  set    comece_id = v_comece_id
  where  id = v_comeco_id;
  --
END;
PROCEDURE COMOCM_ANULADA_TRAN
 (P_SEGORG_ID IN NUMBER
 ,P_COMOCM_ID IN NUMBER
 ,P_INTENV_ID OUT NUMBER
 )
 IS
-----------------------------------------------------------------------------------
   --
   -- Argumentos
   -- p_segorg_id => Organizacion
   -- p_comocm_id => Id del Proceso
   --
   -----------------------------------------------------------------------------------
   --
   cursor cr_comocm is
   select * from com_ordenes_compras comocm
   where comocm.id = p_comocm_id;
   --
   cursor cr_comcon (p_comcon_id number) is
   select * from com_contrataciones comcon
   where comcon.id = p_comcon_id;
   --
   CURSOR cr_comcot IS
   SELECT *
   FROM COM_ORDENES_COMPRAS_DET
   WHERE COMOCM_ID = p_comocm_id;
   --
   cursor cr_conf is
   select valor
   from seg_configuraciones
   where segorg_id = P_SEGORG_ID
   and codigo = 'COMCON_SRVINT_TRAMIX_HABILITADO_SN';
   --
   cursor cr_comdct is
   select id from com_documentos_tipos
   where segorg_id = p_segorg_id
   and codigo = 'COM_ORDEN_PROVISION_ANU';
   --
   CURSOR cr_comped (p_comped_id number) IS
   SELECT *
   FROM COM_PEDIDOS
   WHERE ID = p_comped_id;
   --
   CURSOR cr_comctt(p_comctt_id number) IS
   SELECT *
   FROM COM_CONTRATACIONES_TIPOS
   WHERE ID = p_comctt_id;
   --
   v_habilitado         varchar2(10);
   v_comodg             com_ordenes_compras_docgen%rowtype;
   v_intenv             int_envios%rowtype;
   v_comoce             com_ordenes_compras_est%ROWTYPE;
   v_comcon             com_contrataciones%ROWTYPE;
   v_comctt             com_contrataciones_tipos%ROWTYPE;
   v_comoce_tmp         com_ordenes_compras_est%ROWTYPE;
   v_intori             int_origenes%ROWTYPE;
   v_intdes             int_destinos%ROWTYPE;
   v_inttpo             int_tipos_objetos%ROWTYPE;
   v_intene             int_envios_est%ROWTYPE;
   v_comocm             com_ordenes_compras%rowtype;
   v_comped             COM_PEDIDOS%ROWTYPE;
   v_respuesta_ws       varchar2(2000);
   v_respuesta_ws_adj   varchar2(2000);
   v_resultado_ws       varchar2(2000);
   v_resultado_ws_adj   varchar2(2000);
   v_motivo             varchar2(2000);
   v_referencia         varchar2(2000);
   v_referencia_adj     varchar2(2000);
   v_actuacion_identif  varchar2(2000);
   v_aprobar            varchar2(2);
   v_inttpo_id          number;
   v_intori_id          number;
   v_intdes_id          number;
   v_intene_id          number;
   v_comodg_id          number;
   v_comdct_id          number;
   v_intenv_id          number;
   v_documento_id       number;
   v_comoce_id          number;
   v_comped_id          number;
   --
BEGIN
      --
      if p_segorg_id is null then
         raise_application_error(-20000,'La Organizacion no ha sido indicada y es un dato obligatorio',true);
      elsif p_comocm_id is null then
         raise_application_error(-20000,'El Numero de Orden de Provision no ha sido indicado y es un dato obligatorio ' || p_comocm_id,true);
      end if;
      --
      OPEN cr_comocm;
      FETCH cr_comocm INTO v_comocm;
      CLOSE cr_comocm;
      --
      v_comoce_id := com_pkg.obtn_comoce_id(p_comocm_id => v_comocm.comoce_id);
      COM_PKG.SET_COMOCE(p_id => v_comoce_id);
      COM_PKG.GET_COMOCE(p_comoce => v_comoce);
      --
      if v_comoce.estado <> 'ANU' then
         raise_application_error(-20000,'La Orden de Provision No se encuentra Anulada',true);
      end if;

      --
      for v_conf in cr_conf loop
         if v_conf.valor = 'SI' then
            v_habilitado := 'SI';
         else
            v_habilitado := 'NO';
         end if;
      end loop;
      dbms_output.put_line('v_habilitado = ' || v_habilitado);
      --
      -- Si la Integracion no esta habilitada entonces error.
      --
      if v_habilitado = 'NO' then
         raise_application_error(-20000,'La integracion No se encuentra Habilitada',true);
      end if;
      --
      -- Obtener el tipo de documento
      --
      OPEN cr_comdct;
      FETCH cr_comdct INTO v_comdct_id;
      CLOSE cr_comdct;
      --
      if v_comdct_id is null then
         raise_application_error(-20000,'No se ha podido determinar el tipo de documento de la Orden de Provisión Anulada',true);
      end if;
      --
      open cr_comocm;
      fetch cr_comocm into v_comocm;
      close cr_comocm;
      --
      if v_comocm.id is null then
         raise_application_error(-20000,'No se han podido obtener los datos de la Orden de Provisión',true);
      end if;
      --
      -- Obtener los datos de la Contratacion
      --
      OPEN cr_comcon(v_comocm.comcon_id);
      FETCH cr_comcon INTO v_comcon;
      CLOSE cr_comcon;
      --
      -- Validar que existe la contratacion
      --
      if v_comcon.id is null then
         raise_application_error(-20000,'No se han encontrado los datos de la Contratación',true);
      end if;

      --
      -- Obtener los datos del tipo de contratación
      --
      OPEN cr_comctt(v_comcon.comctt_id);
      FETCH cr_comctt INTO v_comctt;
      CLOSE cr_comctt;
      --
      if v_comctt.id is null then
         raise_application_error(-20000,'No se ha podido determinar el tipo de Contratación',true);
      end if;

      --
      -- Obtener los datos del pedido
      --
      v_comped_id := v_comocm.comped_id;
      OPEN cr_comped(v_comped_id);
      FETCH cr_comped INTO v_comped;
      CLOSE cr_comped;
      --
      -- Validar que existe el pedido
      --
      if v_comped.id is null then
         raise_application_error(-20000,'La solicitud de Gasto especificada No Existe',true);
      end if;

      --
      -- 1. Generar y Grabar el Documento
      --
      v_documento_id := com_pkg.obtn_ocmanu_doc_pdf(p_segorg_id => p_segorg_id
                                                   ,p_comocm_id => p_comocm_id);
      if v_documento_id is null then
         raise_application_error(-20000,'No se ha podido generar el Documento de Orden de Provision Anulada',true);
      end if;

      --
      -- 2. Grabar referencia Proceso de Contratacion-Documento Generado
      --
      begin
         SELECT COMODG_ID.NEXTVAL INTO v_comodg_id FROM DUAL;
         v_comodg.ID        := v_comodg_id;
         v_comodg.COMOCM_ID := p_comocm_id;
         v_comodg.COMDOC_ID := v_documento_id;
         v_comodg.COMDCT_ID := v_comdct_id;
         v_comodg.FECHA     := sysdate;
         COM_PKG.COMODG_INS(p_comodg => v_comodg);
      EXCEPTION WHEN others THEN
         raise_application_error(-20000,'No se ha podido generar el registro de referencia Orden de Compra-Documento Generado',true);
      END;
      dbms_output.put_line('v_comodg_id = ' || v_comodg_id);
      if v_comodg_id is null then
         raise_application_error(-20000,'No se ha podido generar el registro de referencia Orden de Compra-Documento Generado',true);
      end if;

      --
      -- 3. Transmitir el Documento al WebService
      --
      v_actuacion_identif := 'ANUORD' || '-' || 'ANULACION DE ORDEN DE PROVISION N°: ' || v_comocm.codigo || '/' ||  v_comped.ejercicio; -- || ' - ' || v_comctt.NOMBRE;
      dbms_output.put_line('v_actuacion_identif = ' || v_actuacion_identif);
      --

      v_respuesta_ws := COM_PKG.COMOCM_INVOCAR_WS(p_comodg_id         => v_comodg_id
                                                , p_actuacion_identif => v_actuacion_identif
                                                , p_valida            => 1);
      dbms_output.put_line('v_respuesta_ws = ' || v_respuesta_ws);

      --
      -- 4. Parseamos el resultado del Webservice
      --
      COM_PKG.COMOCM_PROC_XML_ACT(p_xml       => v_respuesta_ws
                                 ,p_segorg_id => p_segorg_id
                                 ,p_resultado => v_resultado_ws
                                 ,p_motivo    => v_motivo
                                 ,p_referencia=> v_referencia);
      --
      IF v_resultado_ws = 'ERROR' THEN
         raise_application_error(-20000,'No se ha podido interpretar el mensaje de respuesta.',true);
      END IF;

      ----------------------------------------------------------
      -- 5. Grabar Log en Envíos
      ----------------------------------------------------------
      INT_PKG.INTTPO_SET_CODIGO(p_segorg_id => p_segorg_id
                               ,p_codigo    => 'COMOCM_ACTUACION_ANU');
      INT_PKG.INTTPO_GET(p_inttpo => v_inttpo);
      if v_inttpo.id is null then
         raise_application_error(-20000,'El codigo de tipo de objeto COMOCM_ACTUACION_ANU no se encuentra configurado',true);
      end if;
      v_inttpo_id := v_inttpo.id;
      --
      INT_PKG.INTENV_REGISTRAR(
                     P_INTTPO_ID     => v_inttpo_id
                    ,P_INTENV_OBJETO => '<comdoc_id>'    || v_documento_id || '</comdoc_id>'
                    ,P_INTENV_OBS    => v_respuesta_ws
                    ,P_INTENV_RES    => '<return>'       || v_resultado_ws || '<return>'        ||
                                        '<actuacion_id>' || v_referencia   || '</actuacion_id>'
                    ,P_INTENE_FECHA  => sysdate
                    ,P_INTENV_ID     => v_intenv_id
      );

      --
      -- 6. Si la Actuacion principal se inserto correctamente
      --    entonces vamos a verificar si tiene adjuntos
      --
      IF instr(v_resultado_ws,'OP_COMPLETED') > 0 THEN
         --
         v_aprobar := 'SI';
         --
         -- 8.A Modificar Estado del Envio a ENVIADO
         --
         SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
         v_intene.ID            := v_intene_id;
         v_intene.INTENV_ID     := v_intenv_id;
         v_intene.FECHA         := sysdate;
         v_intene.ESTADO        := 'ENV';
         v_intene.MOTIVO_ESTADO := v_motivo;
         INT_PKG.INTENE_INS(p_intene => v_intene);
         --
      ELSE -- Devuelve distinto de OP_COMPLETED
         --
         -- 8.B Modificar Estado del Envio ERROR
         --
         SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
         v_intene.ID            := v_intene_id;
         v_intene.INTENV_ID     := v_intenv_id;
         v_intene.FECHA         := sysdate;
         v_intene.ESTADO        := 'ERR';
         v_intene.MOTIVO_ESTADO := v_motivo;
         INT_PKG.INTENE_INS(p_intene => v_intene);
         --
      END IF;

      --
      p_intenv_id := v_intenv_id;
      --
EXCEPTION WHEN others THEN
   raise_application_error(-20000,'No se ha podido enviar correctamente los documentos de las Ordenes de Provision Anulada',true);
END;
PROCEDURE COMOCM_APROBADA_TRAN
 (P_SEGORG_ID IN NUMBER
 ,P_COMOCM_ID IN NUMBER
 ,P_INTENV_ID OUT NUMBER
 )
 IS
-----------------------------------------------------------------------------------
   --
   -- Argumentos
   -- p_segorg_id => Organizacion
   -- p_comocm_id => Id del Proceso
   --
   -----------------------------------------------------------------------------------
   --
   cursor cr_comocm is
   select * from com_ordenes_compras comocm
   where comocm.id = p_comocm_id;
   --
   cursor cr_comcon (p_comcon_id number) is
   select * from com_contrataciones comcon
   where comcon.id = p_comcon_id;
   --
   CURSOR cr_comcot IS
   SELECT *
   FROM COM_ORDENES_COMPRAS_DET
   WHERE COMOCM_ID = p_comocm_id;
   --
   cursor cr_conf is
   select valor
   from seg_configuraciones
   where segorg_id = P_SEGORG_ID
   and codigo = 'COMCON_SRVINT_TRAMIX_HABILITADO_SN';
   --
   cursor cr_comdct is
   select id from com_documentos_tipos
   where segorg_id = p_segorg_id
   and codigo = 'COM_ORDEN_PROVISION';
   --
   CURSOR cr_comped (p_comped_id number) IS
   SELECT *
   FROM COM_PEDIDOS
   WHERE ID = p_comped_id;
   --
   CURSOR cr_comctt(p_comctt_id number) IS
   SELECT *
   FROM COM_CONTRATACIONES_TIPOS
   WHERE ID = p_comctt_id;
   --
   CURSOR cr_comprv (p_comprv_id number) IS
   SELECT *
   FROM COM_PROVEEDORES
   WHERE ID = p_comprv_id;
   --
   cursor cr_comeco (p_comeco_id number) is
     select *
     from   COM_CONTRATANTES comeco
     where  comeco.ID = p_comeco_id;
   --
   v_habilitado         varchar2(10);
   v_comodg             com_ordenes_compras_docgen%rowtype;
   v_intenv             int_envios%rowtype;
   v_comoce             com_ordenes_compras_est%ROWTYPE;
   v_comcon             com_contrataciones%ROWTYPE;
   v_comctt             com_contrataciones_tipos%ROWTYPE;
   v_comoce_tmp         com_ordenes_compras_est%ROWTYPE;
   v_intori             int_origenes%ROWTYPE;
   v_intdes             int_destinos%ROWTYPE;
   v_inttpo             int_tipos_objetos%ROWTYPE;
   v_intene             int_envios_est%ROWTYPE;
   v_comocm             com_ordenes_compras%rowtype;
   v_comped             COM_PEDIDOS%ROWTYPE;
   v_comprv             com_proveedores%ROWTYPE;
   v_comeco             com_contratantes%rowtype;
   v_respuesta_ws       varchar2(2000);
   v_respuesta_ws_adj   varchar2(2000);
   v_resultado_ws       varchar2(2000);
   v_resultado_ws_adj   varchar2(2000);
   v_motivo             varchar2(2000);
   v_referencia         varchar2(2000);
   v_referencia_adj     varchar2(2000);
   v_actuacion_identif  varchar2(2000);
   v_aprobar            varchar2(2);
   v_inttpo_id          number;
   v_intori_id          number;
   v_intdes_id          number;
   v_intene_id          number;
   v_comodg_id          number;
   v_comdct_id          number;
   v_intenv_id          number;
   v_documento_id       number;
   v_comoce_id          number;
   v_comped_id          number;
   --
BEGIN
      --
      if p_segorg_id is null then
         raise_application_error(-20000,'La Organizacion no ha sido indicada y es un dato obligatorio',true);
      elsif p_comocm_id is null then
         raise_application_error(-20000,'El Numero de Orden de Provision no ha sido indicado y es un dato obligatorio ' || p_comocm_id,true);
      end if;
      --
      OPEN cr_comocm;
      FETCH cr_comocm INTO v_comocm;
      CLOSE cr_comocm;
      --
      if v_comocm.id is null then
         raise_application_error(-20000,'No se han podido obtener los datos de la Orden de Provisión',true);
      end if;
      --
      -- v_comoce_id := com_pkg.obtn_comoce_id(p_comocm_id => v_comocm.comoce_id);
      COM_PKG.SET_COMOCE(p_id => v_comocm.comoce_id);
      COM_PKG.GET_COMOCE(p_comoce => v_comoce);
      COM_PKG.INI_COMOCE;
      --
      if v_comoce.estado <> 'APR' then
         raise_application_error(-20000,'La Orden de Provision No se encuentra aprobada',true);
      end if;

      --
      for v_conf in cr_conf loop
         if v_conf.valor = 'SI' then
            v_habilitado := 'SI';
         else
            v_habilitado := 'NO';
         end if;
      end loop;
      dbms_output.put_line('v_habilitado = ' || v_habilitado);
      --
      -- Si la Integracion no esta habilitada entonces error.
      --
      if v_habilitado = 'NO' then
         raise_application_error(-20000,'La integracion No se encuentra Habilitada',true);
      end if;
      --
      -- Obtener el tipo de documento
      --
      OPEN cr_comdct;
      FETCH cr_comdct INTO v_comdct_id;
      CLOSE cr_comdct;
      --
      if v_comdct_id is null then
         raise_application_error(-20000,'No se ha podido determinar el tipo de documento de la Orden de Provisión',true);
      end if;
      --
      --
      -- Obtener los datos de la Contratacion
      --
      OPEN cr_comcon(v_comocm.comcon_id);
      FETCH cr_comcon INTO v_comcon;
      CLOSE cr_comcon;
      --
      -- Validar que existe la contratacion
      --
      if v_comcon.id is null then
         raise_application_error(-20000,'No se han encontrado los datos de la Contratación',true);
      end if;

      --
      -- Obtener los datos del tipo de contratación
      --
      OPEN cr_comctt(v_comcon.comctt_id);
      FETCH cr_comctt INTO v_comctt;
      CLOSE cr_comctt;
      --
      if v_comctt.id is null then
         raise_application_error(-20000,'No se ha podido determinar el tipo de Contratación',true);
      end if;
      --
      -- Obtener los datos del pedido
      --
      v_comped_id := v_comocm.comped_id;
      OPEN cr_comped(v_comped_id);
      FETCH cr_comped INTO v_comped;
      CLOSE cr_comped;
      --
      -- Validar que existe el pedido
      --
      if v_comped.id is null then
         raise_application_error(-20000,'La solicitud de Gasto especificada No Existe',true);
      end if;

      --
      -- 1. Generar y Grabar el Documento
      --
      v_documento_id := com_pkg.obtn_comocm_doc_pdf(p_segorg_id => p_segorg_id
                                                   ,p_comocm_id => p_comocm_id);
      if v_documento_id is null then
         raise_application_error(-20000,'No se ha podido generar el Documento del Proceso de Contratación',true);
      end if;

      --
      -- 2. Grabar referencia Orden de Provision-Documento Generado
      --
      begin
         SELECT COMODG_ID.NEXTVAL INTO v_comodg_id FROM DUAL;
         v_comodg.ID        := v_comodg_id;
         v_comodg.COMOCM_ID := p_comocm_id;
         v_comodg.COMDOC_ID := v_documento_id;
         v_comodg.COMDCT_ID := v_comdct_id;
         v_comodg.FECHA     := sysdate;
         COM_PKG.COMODG_INS(p_comodg => v_comodg);
      EXCEPTION WHEN others THEN
         raise_application_error(-20000,'No se ha podido generar el registro de referencia Orden de Compra-Documento Generado',true);
      END;
      dbms_output.put_line('v_comodg_id = ' || v_comodg_id);
      if v_comodg_id is null then
         raise_application_error(-20000,'No se ha podido generar el registro de referencia Orden de Compra-Documento Generado',true);
      end if;

      -- Obtenemos los datos del Proveedor
      OPEN cr_comprv (v_comocm.COMPRV_ID);
      FETCH cr_comprv INTO v_comprv;
      CLOSE cr_comprv;

      open cr_comeco(p_comeco_id => v_comocm.COMECO_ID);
      fetch cr_comeco into v_comeco;
      close cr_comeco;

      --
      -- 3. Transmitir el Documento al WebService
      --                         6        1              18               5            30             1             4                3            100               9             11             3            200 = 391
      --v_actuacion_identif := 'ORDSEC' || '-' || 'ORDEN DE PROVISION' ||' N°: ' || v_comocm.codigo || '/' ||  v_comped.ejercicio || ' - ' || v_comctt.NOMBRE || ' - CUIT: ' || v_comprv.CUIT || ' - ' || v_comprv.NOMBRE;
      --                         6        1              18               5            30             1             4                3            100               9             11        = 188
      --v_actuacion_identif := 'ORDSEC' || '-' || 'ORDEN DE PROVISION' ||' N°: ' || v_comocm.codigo || '/' ||  v_comped.ejercicio || ' - ' || v_comctt.NOMBRE || ' - CUIT: ' || v_comprv.CUIT ;
      --                         6        1              18               5            30             1             4                3            200               9             11        = 288
      if nvl(v_comeco.PROCESO_DESCENTRALIZADO_SN, 'NO') = 'SI' then
        v_actuacion_identif := 'ORDDES' || '-' || 'ORDEN DE PROVISION' ||' N°: ' || v_comocm.codigo || '/' ||  v_comped.ejercicio || ' - ' || replace(v_comprv.NOMBRE,'&','&amp;') ||  ' - CUIT: ' || v_comprv.CUIT ;
      else
        if v_comctt.codigo = 'CONPRE' then
            v_actuacion_identif := 'ORDCON' || '-' || 'ORDEN DE PROVISION CONCURSO DE PRECIOS ' ||' N°: ' || v_comocm.codigo || '/' ||  v_comped.ejercicio || ' - ' || replace(v_comprv.NOMBRE,'&','&amp;') ||  ' - CUIT: ' || v_comprv.CUIT ;
        else
            v_actuacion_identif := 'ORDSEC' || '-' || 'ORDEN DE PROVISION' ||' N°: ' || v_comocm.codigo || '/' ||  v_comped.ejercicio || ' - ' || replace(v_comprv.NOMBRE,'&','&amp;') ||  ' - CUIT: ' || v_comprv.CUIT ;
        end if;
        --
      end if;

      dbms_output.put_line('v_actuacion_identif = ' || v_actuacion_identif);
      --

      v_respuesta_ws := COM_PKG.COMOCM_INVOCAR_WS(p_comodg_id         => v_comodg_id
                                                , p_actuacion_identif => v_actuacion_identif
                                                , p_valida            => 1);
      dbms_output.put_line('v_respuesta_ws = ' || v_respuesta_ws);
      dbms_output.put_line( substr( v_respuesta_ws , -1000 , 1000));
      --
      -- 4. Parseamos el resultado del Webservice
      --
      COM_PKG.COMOCM_PROC_XML_ACT(p_xml       => v_respuesta_ws
                                 ,p_segorg_id => p_segorg_id
                                 ,p_resultado => v_resultado_ws
                                 ,p_motivo    => v_motivo
                                 ,p_referencia=> v_referencia);
      --
      IF v_resultado_ws = 'ERROR' THEN
         raise_application_error(-20000,'No se ha podido interpretar el mensaje de respuesta.',true);
      END IF;

      ----------------------------------------------------------
      -- 5. Grabar Log en Envíos
      ----------------------------------------------------------
      INT_PKG.INTTPO_SET_CODIGO(p_segorg_id => p_segorg_id
                               ,p_codigo    => 'COMOCM_ACTUACION');
      INT_PKG.INTTPO_GET(p_inttpo => v_inttpo);
      if v_inttpo.id is null then
         raise_application_error(-20000,'El codigo de tipo de objeto COMOCM_ACTUACION no se encuentra configurado',true);
      end if;
      v_inttpo_id := v_inttpo.id;
      --
      INT_PKG.INTENV_REGISTRAR(
                     P_INTTPO_ID     => v_inttpo_id
                    ,P_INTENV_OBJETO => '<comdoc_id>'    || v_documento_id || '</comdoc_id>'
                    ,P_INTENV_OBS    => v_respuesta_ws
                    ,P_INTENV_RES    => '<return>'       || v_resultado_ws || '<return>'        ||
                                        '<actuacion_id>' || v_referencia   || '</actuacion_id>'
                    ,P_INTENE_FECHA  => sysdate
                    ,P_INTENV_ID     => v_intenv_id
      );
      --
      -- Modificamos el campo id de envio en la tabla de documentos generados por la orden de provision
      --
      update com_ordenes_compras_docgen
      set intenv_id = v_intenv_id
      where ID = v_comodg_id;
      --
      -- 6. Si la Actuacion principal se inserto correctamente
      --    entonces vamos a verificar si tiene adjuntos
      --
      IF instr(v_resultado_ws,'OP_COMPLETED') > 0 THEN
         --
         v_aprobar := 'SI';
         --
         -- 8.A Modificar Estado del Envio a ENVIADO
         --
         SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
         v_intene.ID            := v_intene_id;
         v_intene.INTENV_ID     := v_intenv_id;
         v_intene.FECHA         := sysdate;
         v_intene.ESTADO        := 'ENV';
         v_intene.MOTIVO_ESTADO := v_motivo;
         INT_PKG.INTENE_INS(p_intene => v_intene);
         --
      ELSE -- Devuelve distinto de OP_COMPLETED
         --
         -- 8.B Modificar Estado del Envio ERROR
         --
         SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
         v_intene.ID            := v_intene_id;
         v_intene.INTENV_ID     := v_intenv_id;
         v_intene.FECHA         := sysdate;
         v_intene.ESTADO        := 'ERR';
         v_intene.MOTIVO_ESTADO := v_motivo;
         INT_PKG.INTENE_INS(p_intene => v_intene);
         --
      END IF;

      --
      p_intenv_id := v_intenv_id;
      --
EXCEPTION WHEN others THEN
   raise_application_error(-20000,'No se ha podido enviar correctamente los documentos de las Ordenes de Provision',true);
END;
/* Aprobar Ordenes de Compras masivamnete */
PROCEDURE COMOCM_APR_AUTOMA
 (P_FECHA_DESDE IN DATE
 ,P_FECHA_HASTA IN DATE
 ,P_FINALIZA_PROC_SN IN VARCHAR2
 ,P_MOTIVO IN VARCHAR2
 )
 IS
-- Cursor que trae todas las contrataciones en estado ADJ
CURSOR cr_comocm_PEN IS
 SELECT COMOCM.ID
       ,COMOCM.SEGORG_ID
       ,COMOCM.COMCON_ID
       ,COMOCE.ESTADO, COMOCE.FECHA
 FROM COM_ORDENES_COMPRAS     COMOCM
     ,COM_ORDENES_COMPRAS_EST COMOCE
 WHERE COMOCM.ID = COMOCE.COMOCM_ID
   AND COMOCE.ID = COM_PKG.OBTN_COMOCE_ID(COMOCM.ID)
   AND COMOCE.ESTADO = 'PEN'
   AND COMOCM.FECHA_GENERACION
        BETWEEN TO_CHAR(P_FECHA_DESDE,'DD/MM/YYYY')
            AND TO_CHAR(P_FECHA_HASTA,'DD/MM/YYYY');
 -- Cursor que cuenta la cantidad de ordenes de compras pendientes para una contratacion dada
CURSOR cr_comocm(p_comcon_id number) IS
 SELECT NVL(count(COMOCE.ESTADO),0) Cant_Ord
 FROM COM_ORDENES_COMPRAS COMOCM
     ,COM_ORDENES_COMPRAS_EST COMOCE
 WHERE COMOCM.COMCON_ID = p_comcon_id
   AND COMOCE.ID = COM_PKG.OBTN_COMOCE_ID(COMOCM.ID)
   AND COMOCM.ID = COMOCE.COMOCM_ID
   AND COMOCE.ESTADO = 'PEN';
 --
 v_comocm           cr_comocm%ROWTYPE;
 v_comoce           COM_ORDENES_COMPRAS_EST%ROWTYPE;
 v_comcoe           COM_CONTRATACIONES_EST%ROWTYPE;
 v_plazo_fin_prc    NUMBER;
 v_comclf_id        NUMBER;
 --
BEGIN
  -- Verificar los parametros obligatorios
  IF P_FECHA_DESDE IS NULL THEN
    raise_application_error(-20000,'La Fecha Desde no ha sido indicada y es un dato obligatorio',true);
  END IF;
  IF P_FECHA_HASTA IS NULL THEN
    raise_application_error(-20000,'La Fecha Hasta no ha sido indicada y es un dato obligatorio',true);
  END IF;
  IF P_FINALIZA_PROC_SN NOT IN ('SI','NO') THEN
    raise_application_error(-20000,'Si se finalizan o no los Procesos no ha sido indicado y es un dato obligatorio',true);
  END IF;
  -- Por cada Orden PARA APROBAR  -- Verificar si cumple para ser aprobada --
  FOR v_comocm_PEN IN cr_comocm_PEN LOOP
        -- Aprobar Orden
        v_comoce.COMOCM_ID:= v_comocm_PEN.ID;
        v_comoce.FECHA    := SYSDATE;
        v_comoce.ESTADO   := 'APR';
        v_comoce.MOTIVO   := P_MOTIVO;
        --
        COM_PKG.INS_COMOCE(p_comoce => v_comoce);
        --
        -- Inicializo la Calificación de la Orden
        COM_PKG.COMCLF_INIC(P_COMOCM_ID => v_comocm_PEN.ID
                           ,P_COMCLF_ID => v_comclf_id);
             -- Verificar se Finaliza el Proceso
        IF P_FINALIZA_PROC_SN = 'SI' THEN
         -- Obtener la cantidad de ordenes de compras en estado PENDIENTE
         OPEN  cr_comocm(v_comocm_PEN.COMCON_ID);
         FETCH cr_comocm INTO v_comocm;
         CLOSE cr_comocm;
         -- Si la cantidad de ordenes de compra en estado PEN es 0
         IF   v_comocm.Cant_Ord = 0 THEN
          -- Obtener los dias para finalizar el porceso
          v_plazo_fin_prc := TO_NUMBER(SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo    => 'COMADM_COMGES_PLAZO_FIN_PRC'
                                                                ,p_segorg_id => v_comocm_PEN.SEGORG_ID));
          --
          SET_COMCOE(p_id => COM_PKG.OBTN_COMCOE_ID(v_comocm_PEN.COMCON_ID));
          GET_COMCOE(p_comcoe => v_comcoe);
          INI_COMCOE;
          IF v_comcoe.ESTADO = 'ADJ' AND  (v_comcoe.FECHA + v_plazo_fin_prc) <= SYSDATE
             THEN
                COM_PKG.COMCON_FINALIZAR ( p_comcon_id => v_comcoe.COMCON_ID
                                          ,p_comped_estado => 'ADJ');
          END IF;
          --
         END IF;
         --
        END IF;
  END LOOP;
END;
/* Generar Orden de Provision */
PROCEDURE COMOCM_CALIFICAR
 (P_COMCLF_ID IN COM_CALIFICACIONES.ID%TYPE
 ,P_COMOCM_ID IN COM_ORDENES_COMPRAS.ID%TYPE
 ,P_FECHA IN COM_ORDENES_COMPRAS.FECHA_GENERACION%TYPE
 ,P_CALIFICACION IN COM_CALIFICACIONES.CALIFICACION%TYPE
 ,P_COMENTARIO IN COM_CALIFICACIONES.COMENTARIO%TYPE
 ,P_COMOCE_ESTADO IN COM_ORDENES_COMPRAS_EST.ESTADO%TYPE
 )
 IS
-- Declaración de Cursores
cursor cr_cursor is
select *
from COM_CALIFICACIONES_MOT
where COMCLF_ID = p_comclf_id
  and VALOR_SN = 'SI';
-- Obtener el detalle de las ordenes de compra GENERADAS para la adjudicacion indicada
cursor cr_comadd(p_comadj_id number, p_comocm_id number) is
  select comadd.ID
  from COM_ADJUDICACIONES_DET  comadd
      ,COM_ADJUDICACIONES      comadj
      ,COM_ORDENES_COMPRAS     comocm
      ,COM_ORDENES_COMPRAS_DET comocd
  where comadd.COMADJ_ID = p_comadj_id
  and   comadd.SITUACION = 'GEN'
  and   comadd.COMADJ_ID = comadj.ID
  and   comocm.COMADJ_ID = comadj.ID
  and   comocm.ID =  p_comocm_id
  and   comocm.ID = comocd.COMOCM_ID
  and   comocd.COMADD_ID = comadd.ID;
--
-- Obtener Estado de la Contratacion
cursor cr_comcon(p_comcon_id number) is
  select comcoe.ESTADO
  from  COM_CONTRATACIONES comcon
       ,COM_CONTRATACIONES_EST comcoe
  where comcon.comcoe_id = comcoe.ID
  and   comcon.ID = p_comcon_id;
--
-- Declaración de Variables
v_comclf        COM_CALIFICACIONES%rowtype;
v_comoce_crear  COM_ORDENES_COMPRAS_EST%rowtype;
v_comcmo        cr_cursor%rowtype;
v_comocm        COM_ORDENES_COMPRAS%rowtype;
v_comcon        cr_comcon%rowtype;
--
begin
   -- Validar datos obligatorios
   if p_comclf_id is null then
    raise_application_error(-20000,'La Calificación no ha sido indicada y es un dato obligatorio',true);
   elsif p_comocm_id is null then
    raise_application_error(-20000,'La Orden de Provision no ha sido indicada y es un dato obligatorio',true);
   elsif p_calificacion is null then
    raise_application_error(-20000,'La Calificación no ha sido indicada y es un dato obligatorio',true);
   elsif p_comoce_estado is null then
    raise_application_error(-20000,'El Estado de la Orden no ha sido indicado y es un dato obligatorio',true);
   end if;
   --
   -- Cargar registro en COM_CALIFICACIONES
   COM_PKG.SET_COMCLF(p_id => p_comclf_id);
   COM_PKG.GET_COMCLF(p_comclf => v_comclf);
   COM_PKG.INI_COMCLF;
   --
   if v_comclf.ID is null then
    raise_application_error(-20000,'La Calificación que ha sido indicada no es válida',true);
   end if;
   --
   open cr_cursor;
   fetch cr_cursor into v_comcmo;
   close cr_cursor;
   --
   if (p_calificacion = -1) and (p_comoce_estado = 'CON') and (v_comcmo.ID is null) then
    raise_application_error(-20000,'Las Calificaciones Negativas deben tener al menos un motivo indicado.',true);
   end if;
   -- Actualizo el registro en COM_CALIFICACIONES
   update COM_CALIFICACIONES
   set CALIFICACION = p_calificacion
      ,COMENTARIO   = p_comentario
      ,SITUACION    = 'VAL'
      ,FECHA        = sysdate
   where ID = p_comclf_id;
   --
   -- Inserto el estado a la Orden de Compra
   v_comoce_crear.COMOCM_ID := p_comocm_id;
   v_comoce_crear.FECHA     := sysdate;
   v_comoce_crear.ESTADO    := p_comoce_estado;
   v_comoce_crear.MOTIVO    := p_comentario;
   --
   COM_PKG.INS_COMOCE(p_comoce => v_comoce_crear);
   -- Obtener la Orden de Compra que se esta calificando
   COM_PKG.SET_COMOCM(p_id => p_comocm_id);
   COM_PKG.GET_COMOCM(p_comocm => v_comocm);
   COM_PKG.INI_COMOCM;
   --
   -- Revertir la Situacion a ANULADA si se genero una adjudicacion previa
   if p_comoce_estado = 'NOC' then
   --
    for v_comadd in cr_comadd(p_comadj_id => v_comocm.COMADJ_ID, p_comocm_id => v_comocm.ID) loop
      update COM_ADJUDICACIONES_DET
      set   SITUACION = 'ANU'
            ,MOTIVO_SITUACION = 'Calificación NO CONCRETADO'
      where ID = v_comadd.ID;
    end loop;
    --
    open cr_comcon(p_comcon_id => v_comocm.COMCON_ID);
    fetch cr_comcon into v_comcon;
    close cr_comcon;
    --
      -- Revertir Finalizacion del Proceso
      if v_comcon.ESTADO = 'FIN' then
         COM_PKG.COMCON_REVFIN ( P_COMCON_ID     => v_comocm.COMCON_ID
                              ,P_COMPED_ESTADO => 'ADJ'
                              ,P_MOTIVO        => 'Calificación NO CONCRETADO');
      --
      end if;
   --
   end if;
   --
end;
PROCEDURE COMOCM_CONTRATO_TRAN
 (P_SEGORG_ID IN NUMBER
 ,P_COMOCM_ID IN NUMBER
 ,P_INTENV_ID OUT NUMBER
 )
 IS
-----------------------------------------------------------------------------------
   --
   -- Argumentos
   -- p_segorg_id => Organizacion
   -- p_comocm_id => Id del Proceso
   --
   -----------------------------------------------------------------------------------
   --
   cursor cr_comocm is
   select * from com_ordenes_compras comocm
   where comocm.id = p_comocm_id;
   --
   cursor cr_comcon (p_comcon_id number) is
   select * from com_contrataciones comcon
   where comcon.id = p_comcon_id;
   --
   CURSOR cr_comcot IS
   SELECT *
   FROM COM_ORDENES_COMPRAS_DET
   WHERE COMOCM_ID = p_comocm_id;
   --
   cursor cr_conf is
   select valor
   from seg_configuraciones
   where segorg_id = P_SEGORG_ID
   and codigo = 'COMCON_SRVINT_TRAMIX_HABILITADO_SN';
   --
   cursor cr_comdct is
   select id from com_documentos_tipos
   where segorg_id = p_segorg_id
   and codigo = 'COM_ORDEN_PROVISION';
   --
   CURSOR cr_comped (p_comped_id number) IS
   SELECT *
   FROM COM_PEDIDOS
   WHERE ID = p_comped_id;
   --
   CURSOR cr_comctt(p_comctt_id number) IS
   SELECT *
   FROM COM_CONTRATACIONES_TIPOS
   WHERE ID = p_comctt_id;
   --
   v_habilitado         varchar2(10);
   v_comodg             com_ordenes_compras_docgen%rowtype;
   v_intenv             int_envios%rowtype;
   v_comoce             com_ordenes_compras_est%ROWTYPE;
   v_comcon             com_contrataciones%ROWTYPE;
   v_comctt             com_contrataciones_tipos%ROWTYPE;
   v_comoce_tmp         com_ordenes_compras_est%ROWTYPE;
   v_intori             int_origenes%ROWTYPE;
   v_intdes             int_destinos%ROWTYPE;
   v_inttpo             int_tipos_objetos%ROWTYPE;
   v_intene             int_envios_est%ROWTYPE;
   v_comocm             com_ordenes_compras%rowtype;
   v_comped             COM_PEDIDOS%ROWTYPE;
   v_respuesta_ws       varchar2(2000);
   v_respuesta_ws_adj   varchar2(2000);
   v_resultado_ws       varchar2(2000);
   v_resultado_ws_adj   varchar2(2000);
   v_motivo             varchar2(2000);
   v_referencia         varchar2(2000);
   v_referencia_adj     varchar2(2000);
   v_actuacion_identif  varchar2(2000);
   v_aprobar            varchar2(2);
   v_inttpo_id          number;
   v_intori_id          number;
   v_intdes_id          number;
   v_intene_id          number;
   v_comodg_id          number;
   v_comdct_id          number;
   v_intenv_id          number;
   v_documento_id       number;
   v_comoce_id          number;
   v_comped_id          number;
   --
BEGIN
      --
      if p_segorg_id is null then
         raise_application_error(-20000,'La Organizacion no ha sido indicada y es un dato obligatorio',true);
      elsif p_comocm_id is null then
         raise_application_error(-20000,'El Numero de Orden de Provision no ha sido indicado y es un dato obligatorio ' || p_comocm_id,true);
      end if;
      --
      OPEN cr_comocm;
      FETCH cr_comocm INTO v_comocm;
      CLOSE cr_comocm;
      --
      v_comoce_id := com_pkg.obtn_comoce_id(p_comocm_id => v_comocm.comoce_id);
      COM_PKG.SET_COMOCE(p_id => v_comoce_id);
      COM_PKG.GET_COMOCE(p_comoce => v_comoce);
      --
      if v_comoce.estado <> 'APR' then
         raise_application_error(-20000,'La Orden de Provision No se encuentra aprobada',true);
      end if;

      --
      for v_conf in cr_conf loop
         if v_conf.valor = 'SI' then
            v_habilitado := 'SI';
         else
            v_habilitado := 'NO';
         end if;
      end loop;
      dbms_output.put_line('v_habilitado = ' || v_habilitado);
      --
      -- Si la Integracion no esta habilitada entonces error.
      --
      if v_habilitado = 'NO' then
         raise_application_error(-20000,'La integracion No se encuentra Habilitada',true);
      end if;
      --
      -- Obtener el tipo de documento
      --
      OPEN cr_comdct;
      FETCH cr_comdct INTO v_comdct_id;
      CLOSE cr_comdct;
      --
      if v_comdct_id is null then
         raise_application_error(-20000,'No se ha podido determinar el tipo de documento de la Orden de Provisión',true);
      end if;
      --
      open cr_comocm;
      fetch cr_comocm into v_comocm;
      close cr_comocm;
      --
      if v_comocm.id is null then
         raise_application_error(-20000,'No se han podido obtener los datos de la Orden de Provisión',true);
      end if;
      --
      -- Obtener los datos de la Contratacion
      --
      OPEN cr_comcon(v_comocm.comcon_id);
      FETCH cr_comcon INTO v_comcon;
      CLOSE cr_comcon;
      --
      -- Validar que existe la contratacion
      --
      if v_comcon.id is null then
         raise_application_error(-20000,'No se han encontrado los datos de la Contratación',true);
      end if;

      --
      -- Obtener los datos del tipo de contratación
      --
      OPEN cr_comctt(v_comcon.comctt_id);
      FETCH cr_comctt INTO v_comctt;
      CLOSE cr_comctt;
      --
      if v_comctt.id is null then
         raise_application_error(-20000,'No se ha podido determinar el tipo de Contratación',true);
      end if;

      --
      -- Obtener los datos del pedido
      --
      v_comped_id := v_comocm.comped_id;
      OPEN cr_comped(v_comped_id);
      FETCH cr_comped INTO v_comped;
      CLOSE cr_comped;
      --
      -- Validar que existe el pedido
      --
      if v_comped.id is null then
         raise_application_error(-20000,'La solicitud de Gasto especificada No Existe',true);
      end if;

      --
      -- 1. Generar y Grabar el Documento
      --                        OBTN_COMOCM_CON_DOC
      v_documento_id := com_pkg.obtn_comocm_contrato_doc_pdf(p_segorg_id => p_segorg_id
                                                            ,p_comocm_id => p_comocm_id);
      if v_documento_id is null then
         raise_application_error(-20000,'No se ha podido generar el Documento del Proceso de Contratación',true);
      end if;

      --
      -- 2. Grabar referencia Orden de Provision-Documento Generado
      --
      begin
         SELECT COMODG_ID.NEXTVAL INTO v_comodg_id FROM DUAL;
         v_comodg.ID        := v_comodg_id;
         v_comodg.COMOCM_ID := p_comocm_id;
         v_comodg.COMDOC_ID := v_documento_id;
         v_comodg.COMDCT_ID := v_comdct_id;
         v_comodg.FECHA     := sysdate;
         COM_PKG.COMODG_INS(p_comodg => v_comodg);
      EXCEPTION WHEN others THEN
         raise_application_error(-20000,'No se ha podido generar el registro de referencia Orden de Compra-Documento Generado',true);
      END;
      dbms_output.put_line('v_comodg_id = ' || v_comodg_id);
      if v_comodg_id is null then
         raise_application_error(-20000,'No se ha podido generar el registro de referencia Orden de Compra-Documento Generado',true);
      end if;

      --
      -- 3. Transmitir el Documento al WebService
      --
      v_actuacion_identif := 'CONTOB' || '-' || 'CONTRATO DE OBRA' ||' N°: ' || v_comocm.codigo || '/' ||  v_comped.ejercicio || ' - ' || v_comctt.NOMBRE ;
      dbms_output.put_line('v_actuacion_identif = ' || v_actuacion_identif);
      --

      v_respuesta_ws := COM_PKG.COMOCM_INVOCAR_WS(p_comodg_id         => v_comodg_id
                                                , p_actuacion_identif => v_actuacion_identif
                                                , p_valida            => 1);
      dbms_output.put_line('v_respuesta_ws = ' || v_respuesta_ws);

      --
      -- 4. Parseamos el resultado del Webservice
      --
      COM_PKG.COMOCM_PROC_XML_ACT(p_xml       => v_respuesta_ws
                                 ,p_segorg_id => p_segorg_id
                                 ,p_resultado => v_resultado_ws
                                 ,p_motivo    => v_motivo
                                 ,p_referencia=> v_referencia);
      --
      IF v_resultado_ws = 'ERROR' THEN
         raise_application_error(-20000,'No se ha podido interpretar el mensaje de respuesta.',true);
      END IF;

      ----------------------------------------------------------
      -- 5. Grabar Log en Envíos
      ----------------------------------------------------------
      INT_PKG.INTTPO_SET_CODIGO(p_segorg_id => p_segorg_id
                               ,p_codigo    => 'COMOCM_ACTUACION');
      INT_PKG.INTTPO_GET(p_inttpo => v_inttpo);
      if v_inttpo.id is null then
         raise_application_error(-20000,'El codigo de tipo de objeto COMOCM_ACTUACION no se encuentra configurado',true);
      end if;
      v_inttpo_id := v_inttpo.id;
      --
      INT_PKG.INTENV_REGISTRAR(
                     P_INTTPO_ID     => v_inttpo_id
                    ,P_INTENV_OBJETO => '<comdoc_id>'    || v_documento_id || '</comdoc_id>'
                    ,P_INTENV_OBS    => v_respuesta_ws
                    ,P_INTENV_RES    => '<return>'       || v_resultado_ws || '<return>'        ||
                                        '<actuacion_id>' || v_referencia   || '</actuacion_id>'
                    ,P_INTENE_FECHA  => sysdate
                    ,P_INTENV_ID     => v_intenv_id
      );
      --
      -- Modificamos el campo id de envio en la tabla de documentos generados por la orden de provision
      --
      update com_ordenes_compras_docgen
      set intenv_id = v_intenv_id
      where ID = v_comodg_id;
      --
      -- 6. Si la Actuacion principal se inserto correctamente
      --    entonces vamos a verificar si tiene adjuntos
      --
      IF instr(v_resultado_ws,'OP_COMPLETED') > 0 THEN
         --
         v_aprobar := 'SI';
         --
         -- 8.A Modificar Estado del Envio a ENVIADO
         --
         SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
         v_intene.ID            := v_intene_id;
         v_intene.INTENV_ID     := v_intenv_id;
         v_intene.FECHA         := sysdate;
         v_intene.ESTADO        := 'ENV';
         v_intene.MOTIVO_ESTADO := v_motivo;
         INT_PKG.INTENE_INS(p_intene => v_intene);
         --
      ELSE -- Devuelve distinto de OP_COMPLETED
         --
         -- 8.B Modificar Estado del Envio ERROR
         --
         SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
         v_intene.ID            := v_intene_id;
         v_intene.INTENV_ID     := v_intenv_id;
         v_intene.FECHA         := sysdate;
         v_intene.ESTADO        := 'ERR';
         v_intene.MOTIVO_ESTADO := v_motivo;
         INT_PKG.INTENE_INS(p_intene => v_intene);
         --
      END IF;

      --
      p_intenv_id := v_intenv_id;
      --
EXCEPTION WHEN others THEN
   raise_application_error(-20000,'No se ha podido enviar correctamente los documentos de las Ordenes de Provision',true);
END;
/* Generar Orden de Provision */
PROCEDURE COMOCM_GENERAR
 (P_COMADJ_ID IN COM_ADJUDICACIONES.ID%TYPE
 ,P_FECHA_GENERACION IN COM_ORDENES_COMPRAS.FECHA_GENERACION%TYPE
 ,P_COMCOE_ESTADO IN COM_CONTRATACIONES_EST.ESTADO%TYPE
 ,P_APROBAR IN VARCHAR2 := 'NO'
 ,P_COMADJ_PROCESO OUT VARCHAR2
 )
 IS
-- Declaración de Cursores
-- Obtiene los Pedidos y Proveedores de una Adjudicacion
CURSOR cr_comadd IS
SELECT COMPED_ID, COMPRV_ID, COMCON_ID, COMECO_ID, SEGORG_ID, MAX(EJERCICIO) EJERCICIO
  FROM (SELECT comadd.ID comadd_id
             , comctz.comprv_ID comprv_id
             , comctz.segorg_id segorg_id
             , comctz.comcon_id comcon_id
             , comadd.comadj_id comadj_id
             , comczd.comped_id comped_id
             , comadd.compet_id compet_id
             , comadd.comczd_id comczd_id
             , comczd.comctz_id comctz_id
             , comped.EJERCICIO ejercicio
             , comped.COMECO_ID comeco_id
             , comadd.situacion situacion
       FROM com_adjudicaciones_det    comadd,
            com_cotizaciones          comctz,
            com_cotizaciones_detalles comczd,
            com_pedidos               comped
       WHERE comadd.comczd_id = comczd.ID
         AND comczd.comctz_id = comctz.ID
         AND comczd.COMPED_ID = comped.ID
         AND comadd.situacion = 'PEN')
WHERE COMADJ_ID = p_comadj_id
GROUP BY COMPED_ID, COMPRV_ID, COMCON_ID, COMECO_ID, SEGORG_ID;
--
CURSOR cr_comadd_ped_prv ( p_comped_id IN NUMBER, p_comprv_id IN NUMBER ) IS
SELECT comadd.ID comadd_id
      , comctz.comprv_ID comprv_id
      , comctz.segorg_id segorg_id
      , comctz.comcon_id comcon_id
      , comadd.comadj_id comadj_id
      , comczd.comped_id comped_id
      , comadd.compet_id compet_id
      , comadd.comczd_id comczd_id
      , comczd.comctz_id comctz_id
      , comped.ejercicio ejercicio
      , comped.COMECO_ID comeco_id
      , comadd.situacion situacion
 FROM com_adjudicaciones_det    comadd,
      com_cotizaciones          comctz,
      com_cotizaciones_detalles comczd,
      com_pedidos               comped
WHERE comadd.comczd_id = comczd.ID
  AND comczd.comctz_id = comctz.ID
  AND comczd.COMPED_ID = comped.ID
  AND comczd.COMPED_ID = p_comped_id
  AND comctz.COMPRV_ID = p_comprv_id
  AND comadd.situacion = 'PEN'
  AND nvl(COM_PKG.OBTN_COMADD_CANT_ADJ(comadd.COMPET_ID),0)> 0
  AND (nvl(COM_PKG.OBTN_COMPET_SALDO(comadd.COMPET_ID),0)
       - nvl(COM_PKG.OBTN_COMADD_CANT_ADJ(comadd.COMPET_ID),0))>= 0   ;
--
cursor cr_comctt (p_comcon_id number) is
  select comctt.limite_max_calificar dias
  from com_contrataciones_tipos comctt
  where comctt.id = (select comcon.comctt_id
                      from com_contrataciones comcon
                     where comcon.id = p_comcon_id);
--
 v_comcoe COM_CONTRATACIONES_EST%rowtype;
 v_comcon_id NUMBER;
 v_comocm_codigo NUMBER;
 v_comctt cr_comctt%ROWTYPE;
 v_plazo_max     NUMBER;
-- Cuerpo del Proceso
BEGIN
COMOCM_GENERAR_VLD(p_comadj_id => p_comadj_id);
-- Confirmar consistencia de los parámetros y obtengo el nro de proceso
IF p_comadj_id IS NOt NULL THEN
 -- Obtengo el nro de proceso
 P_COMADJ_PROCESO := COM_PKG.OBTN_COMNUM_NUMERO(P_CODIGO => 'COMADJ_PROCESO'
                     ,P_SEGORG_ID => SEG_PKG.OBTN_ORGUSU(nvl(v('APP_USER'),user)));
 -- Recorrer el detalle de la Adjudicacion agrupado por Pedidos y Proveedores
 FOR v_comadd IN cr_comadd LOOP
   DECLARE
     v_comocm_crear COM_ORDENES_COMPRAS%ROWTYPE;
     v_comoce_crear COM_ORDENES_COMPRAS_EST%ROWTYPE;
   BEGIN
   -- Generar cabecera de la Orden de Provision
     SELECT COMOCM_ID.NEXTVAL INTO v_comocm_crear.ID FROM DUAL;
     v_comocm_crear.SEGORG_ID := v_comadd.SEGORG_ID;
     v_comocm_crear.COMCON_ID := v_comadd.COMCON_ID;
     v_comocm_crear.COMADJ_ID := p_comadj_id;
     v_comocm_crear.COMPED_ID := v_comadd.COMPED_ID;
     v_comocm_crear.COMPRV_ID := v_comadd.COMPRV_ID;
     v_comocm_crear.COMECO_ID := v_comadd.COMECO_ID;
     --
     --v_comocm_crear.CODIGO    := COM_PKG.OBTN_COMNUM_NUMERO(P_CODIGO => 'COMOCM_CODIGO'
     --                ,P_SEGORG_ID => SEG_PKG.OBTN_ORGUSU(nvl(v('APP_USER'),user)));
     --
     -- Obtener el Numero a ser asignado al Proceso de Contratación para confirmarlo
     LOOP
       v_comocm_crear.codigo := OBTN_COMOCM_NUMERO(p_segorg_id => v_comadd.SEGORG_ID
                                                 , p_ejercicio => v_comadd.EJERCICIO);
       -- Verificar que el numero obtenido no se encuentre utilizado
       SET_COMOCM_CODIGO(p_segorg_id => v_comadd.segorg_id
                        ,p_ejercicio => v_comadd.ejercicio
                        ,p_codigo    => v_comocm_crear.codigo);
       GET_COMOCM(p_comocm => v_comocm);
       if v_comocm.ID is null then
         EXIT;
       end if;
       v_comocm_crear.codigo := NULL;
       INI_COMOCM;
     END LOOP;
     --
     v_comocm_crear.FECHA_GENERACION := P_FECHA_GENERACION;
     v_comocm_crear.OBSERVACION      := '';
     --
     COM_PKG.INS_COMOCM(p_comocm => v_comocm_crear);
     --
     -- Guardar el COMCON_ID para luego insertar el Estado
     v_comcon_id := v_comocm_crear.COMCON_ID;
     -- Inserto el estado a la Orden de Compra como NUE
     v_comoce_crear.COMOCM_ID := v_comocm_crear.ID;
     v_comoce_crear.FECHA     := SYSDATE;
     v_comoce_crear.ESTADO    := 'NUE';
     v_comoce_crear.MOTIVO    := 'Proceso Adjudicación Nro. '||to_char(P_COMADJ_PROCESO);
     --
     COM_PKG.INS_COMOCE(p_comoce => v_comoce_crear);
     --
     -- Recorrer el detalle de la Adjudicacion por Pedido y Proveedor
     FOR v_comadd_ped_prv IN cr_comadd_ped_prv ( p_comped_id => v_comadd.COMPED_ID
                                               , p_comprv_id => v_comadd.COMPRV_ID) LOOP
       -- Inserto Detalle de la Orden de Compra
       DECLARE
         v_comocd COM_ORDENES_COMPRAS_DET%ROWTYPE;
       BEGIN
         v_comocd.COMOCM_ID  := v_comocm_crear.ID;
         v_comocd.COMADD_ID  := v_comadd_ped_prv.COMADD_ID;
         v_comocd.COMPET_ID  := v_comadd_ped_prv.COMPET_ID;
         v_comocd.COMCZD_ID  := v_comadd_ped_prv.COMCZD_ID;
         v_comocd.OBSERVACION:= '';
         --
         COM_PKG.INS_COMOCD(p_comocd => v_comocd);
         --
         -- Cambio la situacion a la Adjudicacion
         UPDATE COM_ADJUDICACIONES
         SET SITUACION = 'GEN',
             OBSERVACION = ' Generada por el Proceso Adjudicación Nro. '||to_char(P_COMADJ_PROCESO)
         WHERE ID = p_comadj_id;
         -- Cambio la situacion al Detalle de la Adjudicacion
         UPDATE COM_ADJUDICACIONES_DET
         SET SITUACION = 'GEN'
          -- Comentado 02/08/2014 - Ajustado para no sobreescribir el motivo indicado por el usuario al cambiar la Adjudicacion - Incidencia 0020898
          -- MOTIVO_SITUACION = 'Generada por el Proceso Adjudicación Nro. '||to_char(P_COMADJ_PROCESO)
         WHERE ID = v_comadd_ped_prv.COMADD_ID;
       END;
     END LOOP;
     -- Inserto el estado a la Orden de Compra como PEN
     v_comoce_crear.COMOCM_ID := v_comocm_crear.ID;
     v_comoce_crear.FECHA     := SYSDATE;
     v_comoce_crear.ESTADO    := 'PEN';
     v_comoce_crear.MOTIVO    := 'Proceso Adjudicación Nro. '||to_char(P_COMADJ_PROCESO);
     --
     COM_PKG.INS_COMOCE(p_comoce => v_comoce_crear);
     --
     IF p_aprobar = 'SI' THEN
        -- Inserto el estado a la Orden de Compra como PEN
        v_comoce_crear.COMOCM_ID := v_comocm_crear.ID;
        v_comoce_crear.FECHA     := SYSDATE;
        v_comoce_crear.ESTADO    := 'APR';
        v_comoce_crear.MOTIVO    := 'Proceso Adjudicación Nro. '||to_char(P_COMADJ_PROCESO);
        --
        COM_PKG.INS_COMOCE(p_comoce => v_comoce_crear);
        --
        -- Obtener maximo de dias para calificar, establecidos en el tipo de contratación
       open cr_comctt(p_comcon_id => v_comocm_crear.COMCON_ID);
       fetch cr_comctt into v_comctt;
       close cr_comctt;
       --
       if v_comctt.dias is null then
            --Obtener el máximo de días para calificar
            v_plazo_max := SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => 'COMADM_OCMGES_PLAZO_MAX_CLF'
                                                ,P_SEGORG_ID => v_comocm_crear.SEGORG_ID);
       else
            v_plazo_max := v_comctt.dias;
       end if;
       --Colocar la fecha máxima de calificación en la orden
       update com_ordenes_compras
       set FECHA_MAX_CALIFICACION = (sysdate + v_plazo_max)
       WHERE id = v_comocm_crear.ID;
        --
     END IF;
   END;
 END LOOP;
 --
 v_comcoe.COMCON_ID := v_comcon_id;
 v_comcoe.FECHA  := SYSDATE;
 v_comcoe.ESTADO := P_COMCOE_ESTADO;
 v_comcoe.MOTIVO := 'Desde Proceso Adjudicación Nro. '||to_char(P_COMADJ_PROCESO);
 --
 COM_PKG.INS_COMCOE(p_comcoe => v_comcoe);
 --
END IF;
--
END;
/* Indica si Puede generar una orden de compra */
FUNCTION COMOCM_GENERAR_SN
 (P_COMADJ_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
begin
  COMOCM_GENERAR_VLD(p_comadj_id => p_comadj_id);
  return 'SI';
exception
  when others then
    return 'NO';
end;
/* Validar la Generacion de la Orden de Compra */
PROCEDURE COMOCM_GENERAR_VLD
 (P_COMADJ_ID IN NUMBER
 )
 IS
cursor cr_comcon is
     select COMCON_ID
     from   COM_ADJUDICACIONES
     where  ID = p_COMADJ_ID;

  cursor cr_comadj(p_comcon_id in number) is
     select 1
     from   COM_ADJUDICACIONES_DET comadd
           ,COM_ADJUDICACIONES     comadj
           ,COM_PEDIDOS_DETALLES   compet
     where  comadd.COMADJ_ID = comadj.ID
     and    comadd.COMPET_ID = compet.ID
     and    comadj.COMCON_ID = p_comcon_id
     and    comadd.SITUACION = 'PEN'
     and    nvl(OBTN_COMADD_CANT_ADJ(comadd.COMPET_ID),0)> 0
     and    compet.CANTIDAD >= nvl(OBTN_COMOCD_CANT_ADJ(comadd.COMPET_ID),0) + nvl(OBTN_COMADD_CANT_ADJ(comadd.COMPET_ID),0);
  --
  v_comcon_id number;
  v_comadj number;
  v_error varchar2(200);
begin
  open cr_comcon;
  fetch cr_comcon into v_comcon_id;
  close cr_comcon;
  --
  if v_comcon_id is null then
    raise_application_error(-20000, 'La Contratación indicada es incorrecta.', true);
  end if;

  open cr_comadj(v_comcon_id);
  fetch cr_comadj into v_comadj;
  close cr_comadj;
  --
  if nvl(v_comadj, 0) = 0 then
    raise_application_error(-20000, 'No se puede efectuar la adjudicación, no existen ítems pendientes de adjudicación.', true);
  end if;
end;
/* Invocar Web Service Actuaciones Tramix - Ordenes de Compra */
FUNCTION COMOCM_INVOCAR_WS
 (P_COMODG_ID IN NUMBER
 ,P_ACTUACION_IDENTIF IN VARCHAR2
 ,P_VALIDA IN NUMBER
 )
 RETURN VARCHAR2
 IS
req_body             CLOB;
   chunk_buffer_clob    CLOB;
   buffersize           NUMBER(4) := 2000;
   chunk_buffer         VARCHAR2(2000);
   chunk_length         NUMBER(4);
   chunk_offset         NUMBER;
   request_body_length  NUMBER;
   req                  utl_http.req;
   resp                 utl_http.resp;
   v_response_text      VARCHAR2(32767);
   v_url                VARCHAR2(1000);
   v_username           VARCHAR2(100);
   v_ticket             VARCHAR2(100);
   v_expdte_fmt_tramix  VARCHAR2(30);
   v_tipo_expdte        VARCHAR2(30);
   v_comcon             com_contrataciones%rowtype;
   v_comcot             com_contrataciones_detalles%rowtype;
   --v_comcdg             com_contrataciones_docgen%rowtype;
   v_comodg             com_ordenes_compras_docgen%rowtype;
   v_comocm             com_ordenes_compras%rowtype;
   v_comdoc             com_documentos%rowtype;
   --
   cursor cr_comodg is
   select * from com_ordenes_compras_docgen comodg
   where comodg.id = p_comodg_id;
   --
   cursor cr_comdoc (p_comdoc_id number) is
   select * from com_documentos comdoc
   where comdoc.id = p_comdoc_id;
   --
   cursor cr_comocm (p_comocm_id number) is
   select * from com_ordenes_compras comocm
   where id = p_comocm_id;
   --
   cursor cr_comcon (p_comcon_id number) is
   select * from com_contrataciones comcon
   where comcon.id = p_comcon_id;
   --
   cursor cr_comcot (p_comcon_id number) is
   select * from com_contrataciones_detalles comcot
   where comcot.comcon_id = p_comcon_id;
   --
   cursor cr_comped (p_comped_id number) is
   select comped.*
         ,comeco.codigo||' - '||comeco.nombre contratante_codigo
   from com_pedidos comped
       ,com_contratantes comeco
   where comped.comeco_id = comeco.id
     and comped.id = p_comped_id;
   --
   v_comped             cr_comped%rowtype;
begin
   --
   if p_comodg_id is null then
      raise_application_error(-20000,'No se ha especificado el id de Documento - Orden de Compra',true);
   end if;
   --
   open cr_comodg;
   fetch cr_comodg into v_comodg;
   close cr_comodg;
   --
   if v_comodg.id is null then
      raise_application_error(-20000,'Orden de Provision - El id de Documento especificado No existe',true);
   end if;
   --
   open cr_comdoc(v_comodg.comdoc_id);
   fetch cr_comdoc into v_comdoc;
   close cr_comdoc;
   --
   open cr_comocm(v_comodg.comocm_id);
   fetch cr_comocm into v_comocm;
   close cr_comocm;
   --
   open cr_comcon(v_comocm.comcon_id);
   fetch cr_comcon into v_comcon;
   close cr_comcon;

   -- Necesitamos obtener el número de expediente
   -- Buscamos en el detalle del proceso el id del pedido
   --open cr_comcot(v_comcdg.comcon_id);
   --fetch cr_comcot into v_comcot;
   --close cr_comcot;
   --
   -- con el id del pedido del detalle obtenemos la cabecera del pedido
   --
   open cr_comped(v_comocm.comped_id);
   fetch cr_comped into v_comped;
   close cr_comped;
   --
   -- Deducimos el Tipo de Expediente en funcion del formato
   --
   -- Si es de 6 caracteres es formato viejo No Digital
   --
    if length(substr(v_comped.expediente, 11   )) = 6 then
       v_tipo_expdte := 'EXP-';
       -- Si es de 8 caracteres
    elsif length(substr(v_comped.expediente, 11   )) = 8 then
       -- y si comienza con 00 es formato viejo No Digital
       if substr(v_comped.expediente, 11, 2) = '00' then
          v_tipo_expdte := 'EXP-';
       -- y si el segundo digito es distinto de 0 es formato nuevo Digital
       elsif to_number(substr(v_comped.expediente, 11, 2),'99') > 0 then
          v_tipo_expdte := 'EXD-';
       end if;
    end if;
   --
   -- Si la unidad ejecutora es de la Univercidad de La Punta (ULP) cambiar el Tipo de Expediente a UND-
   if substr(v_comped.contratante_codigo,1,instr(v_comped.contratante_codigo,'-',1)) = 'ULP-' then
      v_tipo_expdte := 'UND-';
   end if;
  --
   v_expdte_fmt_tramix := v_tipo_expdte ||
                        to_number(substr(v_comped.expediente, 1, 4 )) || '-' ||
                        to_number(substr(v_comped.expediente, 11   )) || '-' ||
                        to_number(substr(v_comped.expediente, 8, 2 ));
   --
   dbms_output.put_line('v_expdte_fmt_tramix = ' || v_expdte_fmt_tramix);
   req_body := COM_PKG.Blob2ClobBase64(v_comdoc.documento);
   --
   --url := 'http://64.215.200.12:81/tramix-flex/services/ActWebService';
   v_url      := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_URL_ACTUACION'
                                           ,p_segorg_id =>  v_comocm.segorg_id);
   --
   v_ticket   := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_TICKET'
                                           ,p_segorg_id =>  v_comcon.segorg_id);
   --
   --v_username := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_USERNAME'
   --                                        ,p_segorg_id =>  v_comcon.segorg_id);
   v_username := NVL(v('APP_USER'),USER) ;
   --
   --
   dbms_output.put_line('v_url = ' || v_url);

   -- Extender el tiempo de espera para el time oput a 10 min UTL_HTTP.set_transfer_timeout(180);

   utl_http.set_transfer_timeout(600);

   req := utl_http.begin_request(v_url,'POST','HTTP/1.1');
   --
   utl_http.set_header(req,'Content-Type','text/xml');
   utl_http.set_header(req,'Transfer-Encoding','chunked');
   --
   chunk_buffer :=
   '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ws="ws.unitech.com">
	   <soapenv:Header />
      <soapenv:Body>
	   <ws:insertActuacionWAttach> ';
   --
chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   --
   utl_http.write_text(req,chunk_buffer);
   --
   chunk_buffer :='  <ticket>'               || v_ticket             || '</ticket> '             ||
      					'<expediente_identif>'  || v_expdte_fmt_tramix  || '</expediente_identif>'  ||
      					'<actuacion_identif>'   || p_actuacion_identif  || '</actuacion_identif>'   ||
      					'<usuario_identif>'     || v_username           || '</usuario_identif> '    ||
      					'<valida>'              || p_valida             || '</valida> '             ||
      					'<attachment>';
   --
chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   --
   utl_http.write_text(req,chunk_buffer);
   --
   request_body_length := dbms_lob.getlength(req_body);
   chunk_offset := 1;
   while (chunk_offset < request_body_length) loop
      if chunk_offset + buffersize >= request_body_length
      then
         chunk_length := request_body_length - chunk_offset +1 ;
      else
         chunk_length := buffersize;
      end if;
      dbms_lob.read(req_body, chunk_length, chunk_offset, chunk_buffer);
   --
chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   --
      utl_http.write_text(req,chunk_buffer);
      chunk_offset := chunk_offset + chunk_length;
   end loop;
   --
   chunk_buffer := '</attachment>';
   --
chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   utl_http.write_text(req,chunk_buffer);
   --
   chunk_buffer := '</ws:insertActuacionWAttach>
	                  </soapenv:Body>
                     </soapenv:Envelope>';
   utl_http.write_text(req,chunk_buffer);
chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   dbms_output.put_line('chunk_buffer_clob=' ||dbms_lob.substr( chunk_buffer_clob, 4000, 1 ));
   dbms_output.put_line(dbms_lob.substr( chunk_buffer_clob, -1000, 1000 ));

   --
   --insert into xml_requests(xml, fecha)
   --values (chunk_buffer_clob, sysdate);
   --
   resp := utl_http.get_response(req);
   utl_http.read_text(resp, v_response_text, 32767);
   utl_http.end_response(resp);
   --
   dbms_output.put_line('termino invocar_ws');
   return v_response_text;
end;
PROCEDURE COMOCM_NO_CONCR_TRAN
 (P_SEGORG_ID IN NUMBER
 ,P_COMOCM_ID IN NUMBER
 ,P_INTENV_ID OUT NUMBER
 )
 IS
-----------------------------------------------------------------------------------
   --
   -- Argumentos
   -- p_segorg_id => Organizacion
   -- p_comocm_id => Id del Proceso
   --
   -----------------------------------------------------------------------------------
   --
   cursor cr_comocm is
   select * from com_ordenes_compras comocm
   where comocm.id = p_comocm_id;
   --
   cursor cr_comcon (p_comcon_id number) is
   select * from com_contrataciones comcon
   where comcon.id = p_comcon_id;
   --
   CURSOR cr_comcot IS
   SELECT *
   FROM COM_ORDENES_COMPRAS_DET
   WHERE COMOCM_ID = p_comocm_id;
   --
   cursor cr_conf is
   select valor
   from seg_configuraciones
   where segorg_id = P_SEGORG_ID
   and codigo = 'COMCON_SRVINT_TRAMIX_HABILITADO_SN';
   --
   cursor cr_comdct is
   select id from com_documentos_tipos
   where segorg_id = p_segorg_id
   and codigo = 'COM_ORDEN_PROVISION_NOC';
   --
   CURSOR cr_comped (p_comped_id number) IS
   SELECT *
   FROM COM_PEDIDOS
   WHERE ID = p_comped_id;
   --
   CURSOR cr_comctt(p_comctt_id number) IS
   SELECT *
   FROM COM_CONTRATACIONES_TIPOS
   WHERE ID = p_comctt_id;
   --
   v_habilitado         varchar2(10);
   v_comodg             com_ordenes_compras_docgen%rowtype;
   v_intenv             int_envios%rowtype;
   v_comoce             com_ordenes_compras_est%ROWTYPE;
   v_comcon             com_contrataciones%ROWTYPE;
   v_comctt             com_contrataciones_tipos%ROWTYPE;
   v_comoce_tmp         com_ordenes_compras_est%ROWTYPE;
   v_intori             int_origenes%ROWTYPE;
   v_intdes             int_destinos%ROWTYPE;
   v_inttpo             int_tipos_objetos%ROWTYPE;
   v_intene             int_envios_est%ROWTYPE;
   v_comocm             com_ordenes_compras%rowtype;
   v_comped             COM_PEDIDOS%ROWTYPE;
   v_respuesta_ws       varchar2(2000);
   v_respuesta_ws_adj   varchar2(2000);
   v_resultado_ws       varchar2(2000);
   v_resultado_ws_adj   varchar2(2000);
   v_motivo             varchar2(2000);
   v_referencia         varchar2(2000);
   v_referencia_adj     varchar2(2000);
   v_actuacion_identif  varchar2(2000);
   v_aprobar            varchar2(2);
   v_inttpo_id          number;
   v_intori_id          number;
   v_intdes_id          number;
   v_intene_id          number;
   v_comodg_id          number;
   v_comdct_id          number;
   v_intenv_id          number;
   v_documento_id       number;
   v_comoce_id          number;
   v_comped_id          number;
   --
BEGIN
      --
      if p_segorg_id is null then
         raise_application_error(-20000,'La Organizacion no ha sido indicada y es un dato obligatorio',true);
      elsif p_comocm_id is null then
         raise_application_error(-20000,'El Numero de Orden de Provision no ha sido indicado y es un dato obligatorio ' || p_comocm_id,true);
      end if;
      --
      OPEN cr_comocm;
      FETCH cr_comocm INTO v_comocm;
      CLOSE cr_comocm;
      --
      v_comoce_id := com_pkg.obtn_comoce_id(p_comocm_id => v_comocm.comoce_id);
      COM_PKG.SET_COMOCE(p_id => v_comoce_id);
      COM_PKG.GET_COMOCE(p_comoce => v_comoce);
      --
      if v_comoce.estado <> 'NOC' then
         raise_application_error(-20000,'La Orden de Provision No se encuentra en estado NO Concretada',true);
      end if;

      --
      for v_conf in cr_conf loop
         if v_conf.valor = 'SI' then
            v_habilitado := 'SI';
         else
            v_habilitado := 'NO';
         end if;
      end loop;
      dbms_output.put_line('v_habilitado = ' || v_habilitado);
      --
      -- Si la Integracion no esta habilitada entonces error.
      --
      if v_habilitado = 'NO' then
         raise_application_error(-20000,'La integracion No se encuentra Habilitada',true);
      end if;
      --
      -- Obtener el tipo de documento
      --
      OPEN cr_comdct;
      FETCH cr_comdct INTO v_comdct_id;
      CLOSE cr_comdct;
      --
      if v_comdct_id is null then
         raise_application_error(-20000,'No se ha podido determinar el tipo de documento de la Orden de Provisión Anulada',true);
      end if;
      --
      open cr_comocm;
      fetch cr_comocm into v_comocm;
      close cr_comocm;
      --
      if v_comocm.id is null then
         raise_application_error(-20000,'No se han podido obtener los datos de la Orden de Provisión',true);
      end if;
      --
      -- Obtener los datos de la Contratacion
      --
      OPEN cr_comcon(v_comocm.comcon_id);
      FETCH cr_comcon INTO v_comcon;
      CLOSE cr_comcon;
      --
      -- Validar que existe la contratacion
      --
      if v_comcon.id is null then
         raise_application_error(-20000,'No se han encontrado los datos de la Contratación',true);
      end if;

      --
      -- Obtener los datos del tipo de contratación
      --
      OPEN cr_comctt(v_comcon.comctt_id);
      FETCH cr_comctt INTO v_comctt;
      CLOSE cr_comctt;
      --
      if v_comctt.id is null then
         raise_application_error(-20000,'No se ha podido determinar el tipo de Contratación',true);
      end if;

      --
      -- Obtener los datos del pedido
      --
      v_comped_id := v_comocm.comped_id;
      OPEN cr_comped(v_comped_id);
      FETCH cr_comped INTO v_comped;
      CLOSE cr_comped;
      --
      -- Validar que existe el pedido
      --
      if v_comped.id is null then
         raise_application_error(-20000,'La solicitud de Gasto especificada No Existe',true);
      end if;

      --
      -- 1. Generar y Grabar el Documento
      --
      v_documento_id := com_pkg.obtn_ocmnoc_doc_pdf(p_segorg_id => p_segorg_id
                                                   ,p_comocm_id => p_comocm_id);
      if v_documento_id is null then
         raise_application_error(-20000,'No se ha podido generar el Documento de Orden de Provision Anulada',true);
      end if;

      --
      -- 2. Grabar referencia Proceso de Contratacion-Documento Generado
      --
      begin
         SELECT COMODG_ID.NEXTVAL INTO v_comodg_id FROM DUAL;
         v_comodg.ID        := v_comodg_id;
         v_comodg.COMOCM_ID := p_comocm_id;
         v_comodg.COMDOC_ID := v_documento_id;
         v_comodg.COMDCT_ID := v_comdct_id;
         v_comodg.FECHA     := sysdate;
         COM_PKG.COMODG_INS(p_comodg => v_comodg);
      EXCEPTION WHEN others THEN
         raise_application_error(-20000,'No se ha podido generar el registro de referencia Orden de Compra-Documento Generado',true);
      END;
      dbms_output.put_line('v_comodg_id = ' || v_comodg_id);
      if v_comodg_id is null then
         raise_application_error(-20000,'No se ha podido generar el registro de referencia Orden de Compra-Documento Generado',true);
      end if;

      --
      -- 3. Transmitir el Documento al WebService
      --
      v_actuacion_identif := 'ORDPNC' || '-' || 'ORDEN DE PROVISION N°: ' || v_comocm.codigo || '/' ||  v_comped.ejercicio || ' - NO CONCRETADA'; -- || v_comctt.NOMBRE;
      dbms_output.put_line('v_actuacion_identif = ' || v_actuacion_identif);
      --

      v_respuesta_ws := COM_PKG.COMOCM_INVOCAR_WS(p_comodg_id         => v_comodg_id
                                                , p_actuacion_identif => v_actuacion_identif
                                                , p_valida            => 1);
      dbms_output.put_line('v_respuesta_ws = ' || v_respuesta_ws);

      --
      -- 4. Parseamos el resultado del Webservice
      --
      COM_PKG.COMOCM_PROC_XML_ACT(p_xml       => v_respuesta_ws
                                 ,p_segorg_id => p_segorg_id
                                 ,p_resultado => v_resultado_ws
                                 ,p_motivo    => v_motivo
                                 ,p_referencia=> v_referencia);
      --
      IF v_resultado_ws = 'ERROR' THEN
         raise_application_error(-20000,'No se ha podido interpretar el mensaje de respuesta.',true);
      END IF;

      ----------------------------------------------------------
      -- 5. Grabar Log en Envíos
      ----------------------------------------------------------
      INT_PKG.INTTPO_SET_CODIGO(p_segorg_id => p_segorg_id
                               ,p_codigo    => 'COMOCM_ACTUACION_NOC');
      INT_PKG.INTTPO_GET(p_inttpo => v_inttpo);
      if v_inttpo.id is null then
         raise_application_error(-20000,'El codigo de tipo de objeto COMOCM_ACTUACION_NOC no se encuentra configurado',true);
      end if;
      v_inttpo_id := v_inttpo.id;
      --
      INT_PKG.INTENV_REGISTRAR(
                     P_INTTPO_ID     => v_inttpo_id
                    ,P_INTENV_OBJETO => '<comdoc_id>'    || v_documento_id || '</comdoc_id>'
                    ,P_INTENV_OBS    => v_respuesta_ws
                    ,P_INTENV_RES    => '<return>'       || v_resultado_ws || '<return>'        ||
                                        '<actuacion_id>' || v_referencia   || '</actuacion_id>'
                    ,P_INTENE_FECHA  => sysdate
                    ,P_INTENV_ID     => v_intenv_id
      );

      --
      -- 6. Si la Actuacion principal se inserto correctamente
      --    entonces vamos a verificar si tiene adjuntos
      --
      IF instr(v_resultado_ws,'OP_COMPLETED') > 0 THEN
         --
         v_aprobar := 'SI';
         --
         -- 8.A Modificar Estado del Envio a ENVIADO
         --
         SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
         v_intene.ID            := v_intene_id;
         v_intene.INTENV_ID     := v_intenv_id;
         v_intene.FECHA         := sysdate;
         v_intene.ESTADO        := 'ENV';
         v_intene.MOTIVO_ESTADO := v_motivo;
         INT_PKG.INTENE_INS(p_intene => v_intene);
         --
      ELSE -- Devuelve distinto de OP_COMPLETED
         --
         -- 8.B Modificar Estado del Envio ERROR
         --
         SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
         v_intene.ID            := v_intene_id;
         v_intene.INTENV_ID     := v_intenv_id;
         v_intene.FECHA         := sysdate;
         v_intene.ESTADO        := 'ERR';
         v_intene.MOTIVO_ESTADO := v_motivo;
         INT_PKG.INTENE_INS(p_intene => v_intene);
         --
      END IF;

      --
      p_intenv_id := v_intenv_id;
      --
EXCEPTION WHEN others THEN
   raise_application_error(-20000,'No se ha podido enviar correctamente los documentos de las Ordenes de Provision No Concretada',true);
END;
PROCEDURE COMOCM_PROC_XML_ACT
 (P_XML IN VARCHAR2
 ,P_SEGORG_ID IN NUMBER
 ,P_RESULTADO OUT VARCHAR2
 ,P_MOTIVO OUT VARCHAR2
 ,P_REFERENCIA OUT VARCHAR2
 )
 IS
--
   l_clob        CLOB;
   v_document    dbms_xmldom.domdocument;
   v_nodes       dbms_xmldom.DOMNodeList;
   v_element_x   dbms_xmldom.DOMElement;
   v_node        dbms_xmldom.DOMNode;
   v_node_2      dbms_xmldom.DOMNode;
   v_tag         VARCHAR2(100);
   v_node_value  VARCHAR2(100);
   --
begin
   --
   p_resultado := 'ERROR';
   l_clob      := p_xml;
   v_document  := dbms_xmldom.newdomdocument(l_clob);
   v_nodes     := dbms_xmldom.getElementsByTagName(v_document, '*');
   --
   FOR i IN 0..dbms_xmldom.getlength(v_nodes)-1
   LOOP
      v_element_x  := dbms_xmldom.makeelement(xmldom.item(v_nodes,i));
      v_node       := dbms_xmldom.item(v_nodes,i);
      v_tag        := dbms_xmldom.getNodeName(v_node);
      v_node_2     := dbms_xmldom.getfirstchild(v_node);

      --
      -- Tag de retorno de codigo de operacion
      --
      if v_tag = 'return' then
         v_node_value := dbms_xmldom.getnodevalue(v_node_2);
         p_resultado  := v_node_value;

         v_node_value := trim(replace(v_node_value, '&', ''));
         if instr(v_node_value,'-') > 0 then
            v_node_value := substr(v_node_value,0,instr(v_node_value,'-')-1);
         end if;
         --
         -- Si la actuacion ya ha sido cargada le permitimos aprobar la solicitud
         --
         if instr(v_node_value,'ERR_ACT_NOTVALID(ya existe una actuaci') > 0 then
            p_resultado := 'YA_EXISTE';
         end if;
         --
         p_motivo     := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo     => v_node_value
                                                  ,p_segorg_id  => p_segorg_id);
         if p_motivo is null then
            raise_application_error(-20000, 'Error: El WebService ha devuelto un valor de retorno no configurado: <pre>' || v_node_value || ' ' || p_resultado ||'<pre>', true);
         end if;
         --
      end if;

      --
      -- Tag de Id de Actuacion
      --
      if v_tag = 'id' then
         v_node_value := dbms_xmldom.getnodevalue(v_node_2);
         p_referencia := v_node_value;
      end if;
   END LOOP;
   --
end;
/* Generar Orden de Provision */
PROCEDURE COMOCM_RECALIFICAR
 (P_COMCLF_ID IN COM_CALIFICACIONES.ID%TYPE
 ,P_CALIFICACION IN COM_CALIFICACIONES.CALIFICACION%TYPE
 ,P_COMENTARIO IN COM_CALIFICACIONES.COMENTARIO%TYPE
 ,P_COMOCE_ESTADO IN COM_ORDENES_COMPRAS_EST.ESTADO%TYPE
 )
 IS
-- Obtener el detalle de las ordenes de compra GENERADAS para la adjudicacion indicada
cursor cr_comadd_anu(p_comadj_id number, p_comocm_id number) is
  select comadd.ID
  from COM_ADJUDICACIONES_DET  comadd
      ,COM_ADJUDICACIONES      comadj
      ,COM_ORDENES_COMPRAS     comocm
      ,COM_ORDENES_COMPRAS_DET comocd
  where comadd.COMADJ_ID = p_comadj_id
  and   comadd.SITUACION = 'ANU'
  and   comadd.COMADJ_ID = comadj.ID
  and   comocm.COMADJ_ID = comadj.ID
  and   comocm.ID =  p_comocm_id
  and   comocm.ID = comocd.COMOCM_ID
  and   comocd.COMADD_ID = comadd.ID;
-- Obtener el detalle de las ordenes de compra ANULADAS para la adjudicacion indicada
cursor cr_comadd_gen(p_comadj_id number, p_comocm_id number) is
  select comadd.ID
  from COM_ADJUDICACIONES_DET  comadd
      ,COM_ADJUDICACIONES      comadj
      ,COM_ORDENES_COMPRAS     comocm
      ,COM_ORDENES_COMPRAS_DET comocd
  where comadd.COMADJ_ID = p_comadj_id
  and   comadd.SITUACION = 'GEN'
  and   comadd.COMADJ_ID = comadj.ID
  and   comocm.COMADJ_ID = comadj.ID
  and   comocm.ID =  p_comocm_id
  and   comocm.ID = comocd.COMOCM_ID
  and   comocd.COMADD_ID = comadd.ID;
-- Declaración de Variables
v_comclf  COM_CALIFICACIONES%ROWTYPE;
v_comoce_crear  COM_ORDENES_COMPRAS_EST%ROWTYPE;
v_comocm        COM_ORDENES_COMPRAS%rowtype;
--
BEGIN
   -- Validar datos obligatorios
   IF p_comclf_id is null THEN
    raise_application_error(-20000,'El Identificador de la Calificación no ha sido indicada y es un dato obligatorio',true);
   ELSIF p_calificacion is null then
    raise_application_error(-20000,'La Calificación no ha sido indicada y es un dato obligatorio',true);
   ELSIF p_comentario is null THEN
    raise_application_error(-20000,'El Comentario no ha sido indicado y es un dato obligatorio',true);
   ELSIF p_comoce_estado is null THEN
    raise_application_error(-20000,'El Estado de la Orden no ha sido indicado y es un dato obligatorio',true);
   END IF;
   --
   -- Cargar registro en COM_CALIFICACIONES
   COM_PKG.SET_COMCLF(p_id => p_comclf_id);
   COM_PKG.GET_COMCLF(p_comclf => v_comclf);
   COM_PKG.INI_COMCLF;
   --
   IF v_comclf.ID is null THEN
    raise_application_error(-20000,'La Calificación que ha sido indicada no es válida',true);
   END IF;
   -- Actualizo el registro en COM_CALIFICACIONES
   UPDATE COM_CALIFICACIONES
   SET CALIFICACION = p_calificacion
      ,COMENTARIO = p_comentario
      ,FECHA = SYSDATE
   WHERE ID = p_comclf_id;
   -- Inserto el estado a la Orden de Compra como PEN
   v_comoce_crear.COMOCM_ID := v_comclf.COMOCM_ID;
   v_comoce_crear.FECHA     := SYSDATE;
   v_comoce_crear.ESTADO    := p_comoce_estado;
   v_comoce_crear.MOTIVO    := p_comentario;
   --
   COM_PKG.INS_COMOCE(p_comoce => v_comoce_crear);
   --
   -- Obtener la Orden de Compra que se esta calificando
   COM_PKG.SET_COMOCM(p_id => v_comclf.COMOCM_ID);
   COM_PKG.GET_COMOCM(p_comocm => v_comocm);
   COM_PKG.INI_COMOCM;
   --
   -- Revertir la Situacion a ANULADA si existe una adjudicacion previa CONCRETADA
   if p_comoce_estado = 'CON' then
    --
    for v_comadd in cr_comadd_anu(p_comadj_id => v_comocm.COMADJ_ID, p_comocm_id => v_comocm.ID) loop
      update COM_ADJUDICACIONES_DET
      set   SITUACION = 'GEN'
            ,MOTIVO_SITUACION = 'Calificación CONCRETADA'
      where ID = v_comadd.ID;
    end loop;
    --
   end if;
   --
      -- Revertir la Situacion a ANULADA si se genero una adjudicacion previa
   if p_comoce_estado = 'NOC' then
    --
    for v_comadd in cr_comadd_gen(p_comadj_id => v_comocm.COMADJ_ID, p_comocm_id => v_comocm.ID) loop
      update COM_ADJUDICACIONES_DET
      set   SITUACION = 'ANU'
            ,MOTIVO_SITUACION = 'Calificación NO CONCRETADA'
      where ID = v_comadd.ID;
    end loop;
    --
   end if;
   --
END;
PROCEDURE COMOCM_TRAN_X_LOTE
 (P_SEGORG_ID IN NUMBER
 ,P_COMCON_ID IN NUMBER
 ,P_COMPED_EXPEDIENTE IN VARCHAR
 )
 IS
cursor cr_comocm is
   SELECT *
   FROM COM_ORDENES_COMPRAS2_V COMOCM
   WHERE COMOCM.COMCON_ID = P_COMCON_ID
   AND upper(COMPED_EXPEDIENTE) = P_COMPED_EXPEDIENTE;
   --
   v_intenv_id       number;
   --
begin
   --
   for v_comocm in cr_comocm loop
      --
      if v_comocm.COMOCE_ESTADO in ('APR','CON') then
        --
        com_pkg.comocm_aprobada_tran(p_segorg_id => v_comocm.segorg_id
                                  ,p_comocm_id => v_comocm.id
                                  ,p_intenv_id => v_intenv_id);
        --
      elsif v_comocm.COMOCE_ESTADO = 'NOC' then
        --
        com_pkg.comocm_no_concr_tran(p_segorg_id => v_comocm.segorg_id
                                    ,p_comocm_id => v_comocm.id
                                    ,p_intenv_id => v_intenv_id);
      elsif v_comocm.COMOCE_ESTADO = 'ANU' then
        --
        com_pkg.comocm_anulada_tran(p_segorg_id => v_comocm.segorg_id
                                   ,p_comocm_id => v_comocm.id
                                   ,p_intenv_id => v_intenv_id);
      end if;
       --
   end loop;
   --
end;
/* Insertar registro en COM_ORDENES_COMPRAS_DOCGEN. */
PROCEDURE COMODG_INS
 (P_COMODG IN COM_ORDENES_COMPRAS_DOCGEN%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_ORDENES_COMPRAS_DOCGEN
  ( ID
    ,COMOCM_ID
    ,COMDCT_ID
    ,COMDOC_ID
    ,FECHA
    ,DATE_CREATED
    ,DATE_MODIFIED
    ,CREATED_BY
    ,MODIFIED_BY  )
  values
  ( p_comodg.ID
    ,p_comodg.COMOCM_ID
    ,p_comodg.COMDCT_ID
    ,p_comodg.COMDOC_ID
    ,p_comodg.FECHA
    ,p_comodg.DATE_CREATED
    ,p_comodg.DATE_MODIFIED
    ,p_comodg.CREATED_BY
    ,p_comodg.MODIFIED_BY  );

  --
END;
PROCEDURE COMPDE_CREAR
 (P_COMPDT_ID IN NUMBER
 ,P_ESTADO IN VARCHAR2
 ,P_MOTIVO IN VARCHAR2
 )
 IS
--v_comdte_crear com_proveedores_dte%rowtype;
   v_compde_crear com_proveedores_dte%rowtype;
begin
  -- Validar operacion
  COMPDE_CREAR_VLD(p_compdt_id => p_compdt_id
                 , p_estado    => p_estado
                 , p_motivo    => p_motivo);
  -- Realizar la operación
  -- Insertar el registro de estado
  -- Armar la variable         COMPDE
  select COMPDE_ID.NEXTVAL
  into   v_compde_crear.ID
  from   dual;
  --
  v_compde_crear.COMPDT_ID     := p_compdt_id;
  v_compde_crear.FECHA         := SYSDATE;
  v_compde_crear.ESTADO        := p_estado;
  v_compde_crear.MOTIVO_ESTADO := p_motivo;
  --
  COMPDE_INS(p_compde => v_compde_crear);
  -- Cargar la variable de retorno con el Id creado.
  --p_compde_id := v_compde_crear.ID;
  --
end;
PROCEDURE COMPDE_CREAR_VLD
 (P_COMPDT_ID IN NUMBER
 ,P_ESTADO IN VARCHAR2
 ,P_MOTIVO IN VARCHAR2
 )
 IS
v_compdt_vld  com_proveedores_dot%rowtype;
  v_compde_vld  com_proveedores_dte%rowtype;
begin

  -- Verificar los parametros obligatorios
  if p_compdt_id is null then
    raise_application_error(-20000,'El Tipo de Documento no ha sido indicado y es un dato obligatorio',true);
  elsif p_estado is null then
    raise_application_error(-20000,'El Estado no ha sido indicado y es un dato obligatorio',true);
  elsif p_motivo is null then
    raise_application_error(-20000,'El Motivo no ha sido indicado y es un dato obligatorio',true);
  end if;

  -- Verificar los valores de los parametros
  COMPDT_SET(p_id => p_compdt_id);
  COMPDT_GET(p_compdt => v_compdt_vld);
  COMPDT_INI;
  if v_compdt_vld.ID is null then
    raise_application_error(-20000,'El Tipo de Documento indicado es incorrecto',true);
  end if;
  --
  -- carlos tissera 09/01/17
  --COMPDE_SET(p_id => OBTN_COMPDE_ID(p_compdt_id => p_compdt_id));
  --COMPDE_GET(p_compde => v_compde_vld);
  --COMPDE_INI;
  --
  --if v_compde_vld.ESTADO is not null and v_compde_vld.ESTADO = p_estado then
  if v_compdt_vld.compde_estado is not null and v_compdt_vld.compde_estado = p_estado then
     raise_application_error(-20000,'El Tipo de Documento '||v_compdt.NOMBRE||
     ' ya se encuentra en estado '||GRAL_PKG.OBTN_CFGDES('COM_PROVEEDORES_DOT.ESTADO',p_estado),true);
  end if;
  --
end;
/* Obtener el valor de la variable v_compdt */
PROCEDURE COMPDE_GET
 (P_COMPDE OUT COM_PROVEEDORES_DTE%ROWTYPE
 )
 IS
begin
  p_compde := v_compde;
end;
/* Inicializar la variable v_compdo */
PROCEDURE COMPDE_INI
 IS
begin
  v_compde := null;
end;
/* Insertar registro en COM_PROVEEDORES_DTE */
PROCEDURE COMPDE_INS
 (P_COMPDE IN COM_PROVEEDORES_DTE%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_PROVEEDORES_DTE
  (ID
 , COMPDT_ID
 , FECHA
 , ESTADO
 , MOTIVO_ESTADO
 , DATE_CREATED
 , CREATED_BY
 , DATE_MODIFIED
 , MODIFIED_BY)
  values
  (p_compde.ID
 , p_compde.COMPDT_ID
 , p_compde.FECHA
 , p_compde.ESTADO
 , p_compde.MOTIVO_ESTADO
 , p_compde.DATE_CREATED
 , p_compde.CREATED_BY
 , p_compde.DATE_MODIFIED
 , p_compde.MODIFIED_BY);
  --
END;
/* Setear la variable v_compdo */
PROCEDURE COMPDE_SET
 (P_ID IN NUMBER
 )
 IS
CURSOR cr_dat IS
  SELECT *
  FROM COM_PROVEEDORES_DTE
  WHERE ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  COMPDE_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_dat;
  FETCH cr_dat INTO v_compde;
  CLOSE cr_dat;
  --
END;
PROCEDURE COMPDG_GET
 (P_COMPDG OUT COM_PEDIDOS_DOCGEN%ROWTYPE
 )
 IS
begin
  p_compdg := v_compdg;
end;
PROCEDURE COMPDG_INI
 IS
begin
  v_compdg := null;
end;
/* Insertar registro en COM_PEDIDOS_DOCGEN. */
PROCEDURE COMPDG_INS
 (P_COMPDG IN COM_PEDIDOS_DOCGEN%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_PEDIDOS_DOCGEN
  ( ID
   ,COMPED_ID
   ,COMDOC_ID
   ,DATE_CREATED
   ,CREATED_BY
   ,DATE_MODIFIED
   ,MODIFIED_BY
   )
  values
  (p_compdg.ID
   ,p_compdg.COMPED_ID
   ,p_compdg.COMDOC_ID
   ,p_compdg.DATE_CREATED
   ,p_compdg.CREATED_BY
   ,p_compdg.DATE_MODIFIED
   ,p_compdg.MODIFIED_BY
   );
  --
END;
/* Seteo la variable v_comped */
PROCEDURE COMPDG_SET
 (P_ID IN NUMBER
 )
 IS
CURSOR cr_compdg IS
  SELECT *
  FROM COM_PEDIDOS_DOCGEN COMPDG
  WHERE COMPDG.ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  COM_PKG.COMPDG_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_compdg;
  FETCH cr_compdg INTO v_compdg;
  CLOSE cr_compdg;
  --
END;
/* Setear la variable v_compdo */
PROCEDURE COMPDO_SET
 (P_ID IN NUMBER
 )
 IS
CURSOR cr_dat IS
  SELECT *
  FROM COM_PROVEEDORES_DOC
  WHERE ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  COMPDO_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_dat;
  FETCH cr_dat INTO v_compdo;
  CLOSE cr_dat;
  --
END;
/* Insertar registro en COM_PROVEEDORES_DOC */
PROCEDURE COMPDO_INS
 (P_COMPDO IN COM_PROVEEDORES_DOC%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_PROVEEDORES_DOC
  (ID
 , COMPDT_ID
 , COMPRV_ID
 , FECHA_EMISION
 , FECHA_VENCIMIENTO
 , FECHA_PRESENTACION
 , COMENTARIO
 , DOCUMENTO
 , FILENAME
 , MIMETYPE
 , LAST_UPDATE_DATE
 , SITUACION
 , MOTIVO_SITUACION
 , DATE_CREATED
 , CREATED_BY
 , DATE_MODIFIED
 , MODIFIED_BY)
  values
  (p_compdo.ID
 , p_compdo.COMPDT_ID
 , p_compdo.COMPRV_ID
 , p_compdo.FECHA_EMISION
 , p_compdo.FECHA_VENCIMIENTO
 , p_compdo.FECHA_PRESENTACION
 , p_compdo.COMENTARIO
 , p_compdo.DOCUMENTO
 , p_compdo.FILENAME
 , p_compdo.MIMETYPE
 , p_compdo.LAST_UPDATE_DATE
 , p_compdo.SITUACION
 , p_compdo.MOTIVO_SITUACION
 , p_compdo.DATE_CREATED
 , p_compdo.CREATED_BY
 , p_compdo.DATE_MODIFIED
 , p_compdo.MODIFIED_BY);
  --
END;
/* Inicializar la variable v_compdo */
PROCEDURE COMPDO_INI
 IS
begin
  v_compdo := null;
end;
/* Obtener el valor de la variable v_compdo */
PROCEDURE COMPDO_GET
 (P_COMPDO OUT COM_PROVEEDORES_DOC%ROWTYPE
 )
 IS
begin
  p_compdo := v_compdo;
end;
FUNCTION COMPDO_PRESENTADO_FMT
 (P_COMPRV_ID IN NUMBER
 ,P_COMPDT_ID IN NUMBER
 ,P_FECHA IN DATE := 'sysdate'
 )
 RETURN VARCHAR2
 IS
begin
   if nvl(COMPDO_PRESENTADO_SN(p_comprv_id => p_comprv_id
                              ,p_compdt_id => p_compdt_id
                              ,p_fecha     => p_fecha), 'NO') = 'SI' then
     return '<img src="#IMAGE_PREFIX#menu/icon_validation_16x16.gif" alt="" title=""/>';
   else
     return '-';
   end if;
 end;
/* .Presentacion Documento por Proveedor y Tipo de Contratacion dado */
FUNCTION COMPDO_PRESENTADO_SN
 (P_COMPRV_ID IN NUMBER
 ,P_COMPDT_ID IN NUMBER
 ,P_FECHA IN DATE := 'SYSDATE'
 )
 RETURN VARCHAR2
 IS
-- Obtener los documentos Presentados por el Proveedor
  cursor cr_compdo(p_comprv_id number, p_compdt_id number) is
  select count(distinct compdo.ID) CANTIDAD
  from   com_proveedores_doc compdo
        ,com_proveedores_dot compdt
--      ,com_proveedores_dte compde
        ,com_proveedores     comprv
        ,com_proveedores_est compre
  where  compdo.compdt_id = compdt.ID
--  and  compdt.ID        = compde.compdt_id
--  and  compde.ID        = com_pkg.obtn_compde_id (compdt.ID)
    and  comprv.ID        = p_comprv_id
    and  comprv.ID        = compdo.COMPRV_ID
    and  compdo.SITUACION = 'ACT'
    and  (compdo.FECHA_VENCIMIENTO is null or compdt.TIPO_DURACION in ('SIN', 'NOD')
     or  (compdo.FECHA_VENCIMIENTO is not null and compdo.FECHA_VENCIMIENTO+1 >= p_fecha))
--  and   compde.ID = (select max(ID)
--                       from COM_PROVEEDORES_DTE
--                      where COMPDT_ID = compdt.ID
--                        and ESTADO = 'HAB')
    and   compdt.compde_estado = 'HAB'

    and   compre.ID = (select max(ID)
                         from  COM_PROVEEDORES_EST
                        where  COMPRV_ID = comprv.ID
                          and  ESTADO = 'HAB')

    and   compdo.COMPDT_ID = p_compdt_id;
  --
  v_compdo cr_compdo%rowtype;
begin
  open cr_compdo(p_comprv_id, p_compdt_id);
  fetch cr_compdo into v_compdo;
  close cr_compdo;

  if v_compdo.CANTIDAD > 0 then
    return 'SI';
  else
    return 'NO';
  end if;
end;
/* Setear la variable v_compdt */
PROCEDURE COMPDT_SET
 (P_ID IN NUMBER
 )
 IS
CURSOR cr_dat IS
  SELECT *
  FROM COM_PROVEEDORES_DOT
  WHERE ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  COMPDT_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_dat;
  FETCH cr_dat INTO v_compdt;
  CLOSE cr_dat;
  --
END;
/* Insertar registro en COM_PROVEEDORES_DOT */
PROCEDURE COMPDT_INS
 (P_COMPDT IN COM_PROVEEDORES_DOT%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_PROVEEDORES_DOT
  ( ID
   , SEGORG_ID
   , CODIGO
   , NOMBRE
   , DESCRIPCION
   , TIPO_DURACION
   , DURACION_VALOR
   , DURACION_TIPO
   , TIPO
   , PERMITE_DIGITALIZAR_SN
   , PRESENTA_TRAMITE_SN
   , COMTPT_ID
   , DATE_CREATED
   , CREATED_BY
   , DATE_MODIFIED
   , MODIFIED_BY )
  values
  (  p_compdt.ID
    ,p_compdt.SEGORG_ID
    ,p_compdt.CODIGO
    ,p_compdt.NOMBRE
    ,p_compdt.DESCRIPCION
    ,p_compdt.TIPO_DURACION
    ,p_compdt.DURACION_VALOR
    ,p_compdt.DURACION_TIPO
    ,p_compdt.TIPO
    ,p_compdt.PERMITE_DIGITALIZAR_SN
    ,p_compdt.PRESENTA_TRAMITE_SN
    ,p_compdt.COMTPT_ID
    ,p_compdt.DATE_CREATED
    ,p_compdt.CREATED_BY
    ,p_compdt.DATE_MODIFIED
    ,p_compdt.MODIFIED_BY  );
  --
END;
/* Inicializar la variable v_compdt */
PROCEDURE COMPDT_INI
 IS
begin
  v_compdt := null;
end;
PROCEDURE COMPDT_SUSPENDER_VLD
 (P_COMPDT_ID IN NUMBER
 )
 IS
v_compdt com_proveedores_dot%rowtype;
   v_compde com_proveedores_dte%rowtype;
begin
   -- Verificar los parametros obligatorios
   if p_compdt_id is null then
      raise_application_error(-20000,'El Tipo de Documento no ha sido indicado y es un dato obligatorio',true);
   end if;

   -- Verificar los valores de los parametros
   COMPDT_SET(p_id => p_compdt_id);
   COMPDT_GET(p_compdt => v_compdt);
   COMPDT_INI;
   if v_compdt.ID is null then
      raise_application_error(-20000,'El Tipo de Documento indicado es incorrecta',true);
   end if;

   -- Verificar la consistencia de los datos
   -- carlos tissera 09/01/17
   --COMPDE_SET(p_id => COM_PKG.OBTN_COMPDE_ID(p_compdt_id => p_compdt_id));
   --COMPDE_GET(p_compde => v_compde);
   --COMPDE_INI;

   --if v_compde.ESTADO = 'SUS' then
   if v_compdt.compde_estado = 'SUS' then
      COMPDE_INI;
      raise_application_error(-20000,'El Tipo de Documento indicado ya se encuentra SUSPENDIDO',true);
   end if;
   COMPDE_INI;
   --
end;
PROCEDURE COMPDT_SUSPENDER
 (P_COMPDT_ID IN NUMBER
 ,P_MOTIVO IN VARCHAR2
 )
 IS
begin
   -- Validar operacion
   COMPDT_SUSPENDER_VLD(p_compdt_id => p_compdt_id);

   -- Setear el estado SUS en la Tabla de estado asociada
   COMPDE_CREAR(p_compdt_id => p_compdt_id
               ,p_estado    => 'SUS'
               ,p_motivo    => p_motivo);
   --
end;
PROCEDURE COMPDT_HABILITAR_VLD
 (P_COMPDT_ID IN NUMBER
 )
 IS
v_compdt com_proveedores_dot%rowtype;
   v_compde com_proveedores_dte%rowtype;
begin
   -- Verificar los parametros obligatorios
   if p_compdt_id is null then
      raise_application_error(-20000,'El Tipo Documento no ha sido indicado y es un dato obligatorio',true);
   end if;

   -- Verificar los valores de los parametros
   COMPDT_SET(p_id => p_compdt_id);
   COMPDT_GET(p_compdt => v_compdt);
   COMPDT_INI;
   if v_compdt.ID is null then
      raise_application_error(-20000,'El Tipo de Documento indicado es incorrecto',true);
   end if;

   -- Verificar la consistencia de los datos
   -- carlos tissera
   --COMPDE_SET(p_id     => COM_PKG.OBTN_COMPDE_ID(p_compdt_id => p_compdt_id));
   --COMPDE_GET(p_compde => v_compde);

   --if v_compde.ESTADO = 'HAB' then
   if v_compdt.compde_estado = 'HAB' then
      raise_application_error(-20000,'El Tipo Documento indicado ya se encuentra HABILITADO',true);
   end if;
   --
end;
PROCEDURE COMPDT_HABILITAR
 (P_COMPDT_ID IN NUMBER
 ,P_MOTIVO IN VARCHAR2
 )
 IS
begin
   -- Validar operacion
   COMPDT_HABILITAR_VLD(p_compdt_id => p_compdt_id);
   -- Realizar la operación
   COM_PKG.COMPDE_CREAR(p_compdt_id => p_compdt_id
                       ,p_estado    => 'HAB'
                       ,p_motivo    => p_motivo);
end;
PROCEDURE COMPDT_SET_CODIGO
 (P_SEGORG_ID IN NUMBER
 ,P_CODIGO IN VARCHAR2
 )
 IS
CURSOR cr_compdt IS
  SELECT *
  FROM COM_PROVEEDORES_DOT COMPDT
  WHERE COMPDT.SEGORG_ID = p_segorg_id
    AND COMPDT.CODIGO    = p_codigo;
  --
BEGIN
  -- Inicializar la variable
  COMPDT_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_compdt;
  FETCH cr_compdt INTO v_compdt;
  CLOSE cr_compdt;
  --
END;
/* Obtener el valor de la variable v_compdt */
PROCEDURE COMPDT_GET
 (P_COMPDT OUT COM_PROVEEDORES_DOT%ROWTYPE
 )
 IS
begin
  p_compdt := v_compdt;
end;
PROCEDURE COMPED_ANULAR
 (P_SEGORG_ID IN NUMBER
 ,P_COMPED_ID IN NUMBER
 ,P_MOTIVO IN VARCHAR2
 ,P_INTENV_ID OUT NUMBER
 )
 IS
-----------------------------------------------------------------------------------
   --
   -- Argumentos
   -- p_segorg_id => Organizacion
   -- p_comped_id => Id del Pedido
   -- p_motivo    => Motivo ingresado en la interface
   --
   -----------------------------------------------------------------------------------
   --
   cursor cr_comped (p_comped_id number) is
   select * from com_pedidos comped
   where comped.id = p_comped_id;
   --
   cursor cr_compee (p_compee_id number) is
   select * from com_pedidos_est compee
   where compee.id = p_compee_id;
   --
   v_habilitado         varchar2(10);
   v_compee             com_pedidos_est%ROWTYPE;
   v_compee_aux         com_pedidos_est%ROWTYPE;
   v_compee_n           com_pedidos_est%ROWTYPE;
   v_comped             com_pedidos%rowtype;
   v_motivo             varchar2(2000);
   v_referencia         varchar2(2000);
   v_actuacion_identif  varchar2(2000);
   v_aprobar            varchar2(2);

   v_compee_id          number;
   --
BEGIN
      --
      open cr_comped(p_comped_id);
      fetch cr_comped into v_comped;
      close cr_comped;
      -- Verificar que el Pedido se encuentre en el estado correcto
      -- Obtener el estado actual del pedido
      v_compee_id := COM_PKG.OBTN_COMPEE_ID (p_comped_id => p_comped_id, p_fecha => sysdate);
      --
      -- Obtener los datos del estado del pedido
      COM_PKG.SET_COMPEE(p_id => v_compee_id);
      COM_PKG.GET_COMPEE(p_compee => v_compee);
      --
      -- Verificar si el estado pudo obtenerse
      if v_compee.ID is null then
         raise_application_error(-20000,'No se ha podido determinar el estado actual del Pedido',true);
      end if;
      --
      if v_compee.ESTADO = 'ANU' then
         raise_application_error(-20000,'La Solicitud de Gasto ya se encuentra Anulada',true);
      end if;
      --

         SELECT COMPEE_ID.NEXTVAL INTO v_compee_n.ID  FROM DUAL;
         v_compee_n.COMPED_ID := p_comped_id;
         v_compee_n.FECHA     := SYSDATE;
         v_compee_n.ESTADO    := 'ANU';
         v_compee_n.MOTIVO    := p_motivo;
         COM_PKG.INS_COMPEE(P_COMPEE => v_compee_n);

      --
EXCEPTION WHEN others THEN
   raise_application_error(-20000,'No se ha podido ANULAR la Solicitud de Gasto',true);
END;
PROCEDURE COMPED_APROBAR
 (P_SEGORG_ID IN NUMBER
 ,P_COMPED_ID IN NUMBER
 ,P_MOTIVO IN VARCHAR2
 ,P_INTENV_ID OUT NUMBER
 )
 IS
-----------------------------------------------------------------------------------
   --
   -- Argumentos
   -- p_segorg_id => Organizacion
   -- p_comped_id => Id del Pedido
   -- p_motivo    => Motivo ingresado en la interface
   --
   -----------------------------------------------------------------------------------
   --
  CURSOR cr_compee (p_compee_id number) IS
  SELECT estado
  FROM COM_PEDIDOS_EST COMPEE
  WHERE COMPEE.ID = p_compee_id;
   --
   v_compee          com_pedidos_est%ROWTYPE;
   v_compee_id       number;
   v_compee_estado   varchar2(10);
   --
BEGIN
   --
   v_compee_id := com_pkg.obtn_compee_id(p_comped_id  => p_comped_id);

   OPEN cr_compee(v_compee_id);
   FETCH cr_compee INTO v_compee_estado;
   CLOSE cr_compee;
   --
   if v_compee_estado = 'AUT' then
      --
      v_compee.COMPED_ID := p_comped_id;
      v_compee.FECHA     := SYSDATE;
      v_compee.ESTADO    := 'APR';
      v_compee.MOTIVO    := p_motivo;
      COM_PKG.INS_COMPEE(P_COMPEE => v_compee);
      --
   end if;
   --
EXCEPTION WHEN others THEN
   raise_application_error(-20000,'No se ha podido APROBAR la Solicitud de Gasto. ' || SQLERRM, true);
END;
/* Autorizar un Pedido de Compra */
PROCEDURE COMPED_AUTORIZAR
 (P_COMPED_ID IN NUMBER
 ,P_MOTIVO IN VARCHAR2
 )
 IS
-- Importe total de la solicitud
  cursor cr_comped_total is
    select sum(comped.cantidad*comped.precio_unitario)
    from   COM_PEDIDOS_DETALLES comped
    where  comped.COMPED_ID = p_comped_id;
  --
  v_comped COM_PEDIDOS%rowtype;
  v_compee COM_PEDIDOS_EST%rowtype;
  --
  v_comped_total number;
begin
  COM_PKG.COMPED_AUTORIZAR_VLD(p_comped_id => p_comped_id
                              ,p_motivo => p_motivo);
  -- Recuperar los datos del pedido
  COM_PKG.SET_COMPED(p_id => p_comped_id);
  COM_PKG.GET_COMPED(p_comped => v_comped);
  COM_PKG.INI_COMPED;
  -- Recuperar el estado del pedido
  COM_PKG.SET_COMPEE(p_id => v_comped.compee_id);
  COM_PKG.GET_COMPEE(p_compee => v_compee);
  COM_PKG.INI_COMPEE;
  -- Si el pedido esta PARA AUTORIZAR o RECHAZADO actualizar el importe total del pedido
  if v_compee.ESTADO in ('PAU', 'RCH') then
    open cr_comped_total;
    fetch cr_comped_total into v_comped_total;
    close cr_comped_total;
    -- actualizar el importe del pedido
    update COM_PEDIDOS comped
    set    comped.PRECIO = v_comped_total
    where  ID = p_comped_id;
    -- AUTORIZAR el pedido
    v_compee.ID := null;
    v_compee.COMPED_ID := p_comped_id;
    v_compee.FECHA := sysdate;
    v_compee.ESTADO := 'AUT';
    v_compee.MOTIVO := p_motivo;
    --
    COM_PKG.INS_COMPEE(p_compee => v_compee);
  end if;
end;
PROCEDURE COMPED_AUTORIZAR_VLD
 (P_COMPED_ID IN NUMBER
 ,P_MOTIVO IN VARCHAR2
 )
 IS
cursor cr_etqped(p_codigo IN VARCHAR2) IS
    select VALOR
    from   COM_ETIQUETAS
    where  CODIGO = p_codigo;
--  Verificar si el pedido posee items asociados en el detalle
  cursor cr_compet is
    select 1
    from   COM_PEDIDOS_DETALLES compet
    where  compet.COMPED_ID = p_comped_id;
-- Verificar si el pedido posee Partidas presupuestarias asociadas
  cursor cr_compda is
    select 1
    from   COM_PEDIDOS_DAT compda
    where  compda.COMPED_ID = p_comped_id;
v_comped COM_PEDIDOS%rowtype;
v_compee COM_PEDIDOS_EST%rowtype;
--
v_compet_detalles number;
v_compda_detalles number;
--
v_compee_id number;
v_etiqueta varchar2(100);
v_mensaje varchar2(2000) := null;
begin
  OPEN cr_etqped(p_codigo => 'PEDS');
  FETCH cr_etqped into v_etiqueta;
  CLOSE cr_etqped;
  --
  COM_PKG.SET_COMPED(p_id => p_comped_id);
  COM_PKG.GET_COMPED(p_comped => v_comped);
  COM_PKG.INI_COMPED;
  if (v_comped.ID is null) then
    v_mensaje := v_mensaje||'El pedido indicado es invalido'||chr(10);
  end if;
  --
  if (v_comped.EXPEDIENTE is null) then
    v_mensaje := v_mensaje||'No se ha indicado el número de expediente de la '||v_etiqueta||chr(10);
  end if;
  --
  if (v_comped.RESOLUCION is null) then
    v_mensaje := v_mensaje||'No se ha indicado el número de asiento de la '||v_etiqueta||chr(10);
  end if;
  --
  if (v_comped.DESCRIPCION is null) then
    v_mensaje := v_mensaje||'No se ha indicado la finalidad de la '||v_etiqueta||chr(10);
  end if;
  --
  open cr_compet;
  fetch cr_compet into v_compet_detalles;
  close cr_compet;
  --
  if nvl(v_compet_detalles,0) = 0 then
    v_mensaje := v_mensaje||'La '||v_etiqueta||' debe incluir al menos un item'||chr(10);
  end if;
  --
  open cr_compda;
  fetch cr_compda into v_compda_detalles;
  close cr_compda;
  --
  if nvl(v_compda_detalles, 0) = 0 then
    v_mensaje := v_mensaje||'Debe indicar al menos una partida presupuestaria'||chr(10);
  end if;
  --
  v_compee_id := COM_PKG.OBTN_COMPEE_ID(p_comped_id => v_comped.ID);
  COM_PKG.SET_COMPEE(p_id => v_compee_id);
  COM_PKG.GET_COMPEE(p_compee => v_compee);
  COM_PKG.INI_COMPEE;
  --
  if (v_compee.ID is null) then
    v_mensaje := v_mensaje||'El Estado del Pedido es invalido.';
  end if;
  --
  if (v_compee.ESTADO = 'AUT') then
    v_mensaje := v_mensaje||'La '||v_etiqueta||' ya se encuentra '||GRAL_PKG.OBTN_CFGABR('COM_PEDIDOS_EST.ESTADO', v_compee.ESTADO);
  end if;
  -- Si existe algun mensaje de error mostrar el mensaje
  if v_mensaje is not null then
    raise_application_error(-20000, v_mensaje, true);
  end if;
end;
/* Confirmar Pedido Creado */
PROCEDURE COMPED_CONFIRMAR
 (P_COMPED_ID IN NUMBER
 ,P_COMPED_CODIGO OUT NUMBER
 )
 IS
cursor cr_compet is
  select count(COMPET.ID) CANTIDAD
    from COM_PEDIDOS_DETALLES COMPET
       , COM_PEDIDOS COMPED
       , COM_CATALOGO_OBJETOS COMCOB
  where COMPET.COMPED_ID = COMPED.ID
    and COMPED.COMCOB_ID = COMCOB.ID
    and COMPET.COMPED_ID = p_comped_id
    and COMPET.CODIGO IS NULL
    and COMCOB.SOLO_ITEMS_NOMENCLADOS_SN = 'SI';
  --
  v_compet cr_compet%rowtype;
  v_compee_id     COM_PEDIDOS_EST.ID%type;
  v_comped_codigo COM_PEDIDOS.CODIGO%type;
  v_compee_crear  COM_PEDIDOS_EST%rowtype;
  v_comped_vrf    COM_PEDIDOS%rowtype;
BEGIN
  -- Verificar parametros obligatorios
  if p_comped_id is null then
     raise_application_error(-20000,'El Pedido no ha sido indicado y es un dato obligatorio',true);
  end if;
  --
  -- Verificar si existen Items No Nomenclados
  open cr_compet;
  fetch cr_compet into v_compet;
  close cr_compet;
  --
  if  NVL(v_compet.CANTIDAD,0) > 0 then
      raise_application_error(-20000,'No se puede autorizar este pedido. Se encuentran '||v_compet.CANTIDAD||' items No Nomenclados y el Objeto de Gasto del Pedido está configurado para SOLO permitir Items Nomenclados. Bórrelos y Autorice nuevamente.',true);
  end if;
  --
  -- Verificar que el Pedido enviado es correcto
  SET_COMPED(p_id => p_comped_id);
  GET_COMPED(p_comped => v_comped_vrf);
  INI_COMPED;
  --
  if v_comped_vrf.ID is null then
     raise_application_error(-20000,'El Pedido indicado es incorrecto',true);
  end if;
  -- Verificar que el Pedido se encuentre en el estado correcto
  -- Obtener el estado actual del pedido
  v_compee_id := OBTN_COMPEE_ID (p_comped_id => p_comped_id, p_fecha => sysdate);
  -- Obtener los datos del estado del pedido
  SET_COMPEE(p_id => v_compee_id);
  GET_COMPEE(p_compee => v_compee);
  -- Verificar si el estado pudo obtenerse
  if v_compee.ID is null then
    raise_application_error(-20000,'No se ha podido determinar el estado actual del Pedido',true);
  end if;
  -- Verificar que el estado sea correcto
  if v_compee.ESTADO <> 'NUE' THEN
    raise_application_error(-20000,'El Pedido ya se encuentra confirmado',true);
  end if;
  -- Obtener el Numero a ser asignado al Pedido para confirmarlo
  LOOP
    v_comped_codigo := OBTN_COMPED_NUMERO(p_segorg_id => v_comped_vrf.SEGORG_ID
                                        , p_ejercicio => v_comped_vrf.EJERCICIO);
    -- Verificar que el numero obtenido no se encuentre utilizado
    SET_COMPED_CODIGO(p_segorg_id => v_comped_vrf.segorg_id
                     ,p_ejercicio => v_comped_vrf.ejercicio
                     ,p_codigo    => v_comped_codigo);
    GET_COMPED(p_comped => v_comped);
    if v_comped.ID is null then
      EXIT;
    end if;
    v_comped_codigo := NULL;
    INI_COMPED;
  END LOOP;
  -- Actualizar el Pedido con el Numero asignado
  UPDATE COM_PEDIDOS ped
  SET ped.CODIGO = v_comped_codigo
    , ped.PRECIO = (select sum(cantidad*precio_unitario) from com_pedidos_detalles where comped_id = p_comped_id)
  WHERE ped.ID = p_comped_id;
  -- Actualizar el estado de los detalles del pedido
  UPDATE COM_PEDIDOS_DETALLES
  SET SITUACION = 'PAU'
  WHERE COMPED_ID = p_comped_id;
  -- Actualizar el estado del Pedido
  v_compee_crear.COMPED_ID := p_comped_id;
  v_compee_crear.FECHA     := SYSDATE;
  v_compee_crear.ESTADO    := 'PAU';
  v_compee_crear.MOTIVO    := NULL;
  --
  INS_COMPEE(p_compee => v_compee_crear);
  --
  INI_COMPEE;
  --
  p_comped_codigo := v_comped_codigo;
  --
END;
/* Copia todos los datos de un Pedido y genera uno nuevo. */
PROCEDURE COMPED_COPIAR
 (P_COMPED_ID IN NUMBER
 ,P_COMPED_NUE_ID OUT NUMBER
 )
 IS
--
   cursor cr_comped is
   select comped.*
         ,comcob.SOLO_ITEMS_NOMENCLADOS_SN
   from com_pedidos  comped
       ,com_catalogo_objetos comcob
   where comped.id = p_comped_id
   and comped.COMCOB_ID = comcob.ID;
   -- Detalles del pedido
   cursor cr_compet (p_comped_id number) is
     select * from com_pedidos_detalles
     where comped_id = p_comped_id;
   --  Detalles del pedido nomenclados
   cursor cr_compet_nmc(p_comped_id number) is
     select COMPET.*
     from COM_PEDIDOS_DETALLES COMPET
     where COMPET.COMPED_ID = p_comped_id
     and   COMPET.CODIGO IS NOT NULL;
   --
   cursor cr_compec (p_comped_id number) is
   select * from com_pedidos_doc
   where comped_id = p_comped_id;
   --
   cursor cr_compda (p_comped_id number) is
   select compda.*
   from com_pedidos_dat compda
       ,com_datos_tipos comdat
   where compda.comped_id = p_comped_id
   and   compda.comdat_id = comdat.ID
   and   comdat.CODIGO = 'PED_PARPRE_PCYCSL';
   --
   cursor cr_comdoc (p_id number) is
   select * from com_documentos
   where id = p_id;
   --
   cursor cr_comdom (p_id number) is
   select * from com_domicilios
   where id = p_id;
   --
   v_comped_ori      com_pedidos%rowtype;
   v_comped_des      com_pedidos%rowtype;
   v_comped_tmp      com_pedidos%rowtype;
   v_compee          com_pedidos_est%ROWTYPE;
   v_comece          com_contratantes_est%ROWTYPE;
   v_comcit          com_catalogo_items%ROWTYPE;
   v_compet_ori      com_pedidos_detalles%ROWTYPE;
   v_compet_des      com_pedidos_detalles%ROWTYPE;
   v_compec_ori      com_pedidos_doc%rowtype;
   v_compec_des      com_pedidos_doc%rowtype;
   v_comdoc_ori      com_documentos%rowtype;
   v_comdoc_des      com_documentos%rowtype;
   v_compda_ori      com_pedidos_dat%rowtype;
   v_compda_des      com_pedidos_dat%rowtype;
   v_comdom_ori      com_domicilios%rowtype;
   v_comdom_des      com_domicilios%rowtype;
   v_comrub          com_rubros%rowtype;
   v_comece_id       number;
   v_comped_codigo   varchar2(100);
   --
BEGIN
   FOR v_comped_ori IN cr_comped LOOP
      --
      -- Validar Unidad Ejecutora
      --
      v_comece_id := COM_PKG.OBTN_COMECE_ID(v_comped_ori.COMECO_ID);
      COM_PKG.SET_COMECE(p_id => v_comece_id );
      COM_PKG.GET_COMECE(p_comece => v_comece);
      if v_comece.ESTADO <> 'HAB' then
         raise_application_error(-20000,'La Unidad Ejecutora no se encuentra Habilitada',true);
      end if;

      --
      -- Copiamos el Domicilio de Entrega
      --
      FOR v_comdom_ori IN cr_comdom(v_comped_ori.comdom_id) LOOP
         --
         SELECT COMDOM_ID.NEXTVAL INTO v_comdom_des.ID FROM DUAL;
         --
         v_comdom_des.COMDMT_ID				:=	v_comdom_ori.COMDMT_ID;
         v_comdom_des.PAIS					   :=	v_comdom_ori.PAIS;
         v_comdom_des.PROVINCIA				:=	v_comdom_ori.PROVINCIA;
         v_comdom_des.DEPARTAMENTO			:=	v_comdom_ori.DEPARTAMENTO;
         v_comdom_des.LOCALIDAD				:=	v_comdom_ori.LOCALIDAD;
         v_comdom_des.CALLE					:=	v_comdom_ori.CALLE;
         v_comdom_des.NUMERO_CASA			:=	v_comdom_ori.NUMERO_CASA;
         v_comdom_des.PISO					   :=	v_comdom_ori.PISO;
         v_comdom_des.DPTO					   :=	v_comdom_ori.DPTO;
         v_comdom_des.OBSERVACION			:=	v_comdom_ori.OBSERVACION;
         v_comdom_des.CODIGO_POSTAL			:=	v_comdom_ori.CODIGO_POSTAL;
         v_comdom_des.TELEFONO_CODIGO_AREA:=	v_comdom_ori.TELEFONO_CODIGO_AREA;
         v_comdom_des.TELEFONO_NUMERO		:=	v_comdom_ori.TELEFONO_NUMERO;
         v_comdom_des.FAX_CODIGO_AREA		:=	v_comdom_ori.FAX_CODIGO_AREA;
         v_comdom_des.FAX_NUMERO				:=	v_comdom_ori.FAX_NUMERO;
         --
         COM_PKG.INS_COMDOM(p_comdom => v_comdom_des);
      END LOOP;

      --
      -- Copiamos la cabecera del Pedido
      --
      SELECT COMPED_ID.NEXTVAL INTO v_comped_des.ID FROM DUAL;
      p_comped_nue_id := v_comped_des.ID;
      --
      v_comped_des.SEGORG_ID               := v_comped_ori.SEGORG_ID;

      v_comped_des.CODIGO                  := v_comped_des.ID;
      v_comped_des.FECHA_SOLICITUD         := SYSDATE;
      v_comped_des.COMECO_ID               := v_comped_ori.COMECO_ID;
      v_comped_des.COMCOB_ID               := v_comped_ori.COMCOB_ID;
      v_comped_des.EJERCICIO               := v_comped_ori.EJERCICIO;
      v_comped_des.CONTRATANTE             := v_comped_ori.CONTRATANTE;
      v_comped_des.SOLICITANTE             := v_comped_ori.SOLICITANTE;
      v_comped_des.DESCRIPCION             := v_comped_ori.DESCRIPCION;
      v_comped_des.CONTACTO                := v_comped_ori.CONTACTO;
      --v_comped_des.COMDOM_ID               := v_comped_ori.COMDOM_ID;
      v_comped_des.COMDOM_ID               := v_comdom_des.ID;
      v_comped_des.TIPO_ENTREGA            := v_comped_ori.TIPO_ENTREGA;
      v_comped_des.PLAZO_ENTREGA_CANTIDAD  := v_comped_ori.PLAZO_ENTREGA_CANTIDAD;
      v_comped_des.PLAZO_ENTREGA_UNIDAD    := v_comped_ori.PLAZO_ENTREGA_UNIDAD;
      v_comped_des.PERIODO_ENTREGA         := v_comped_ori.PERIODO_ENTREGA;
      v_comped_des.FECHA_ENTREGA           := v_comped_ori.FECHA_ENTREGA;
      --v_comped_des.PRECIO                  := v_comped_ori.PRECIO;
      v_comped_des.PARTIDA_PRESUPUESTARIA  := v_comped_ori.PARTIDA_PRESUPUESTARIA;
      v_comped_des.EXPEDIENTE              := v_comped_ori.EXPEDIENTE;
      v_comped_des.RESOLUCION              := v_comped_ori.RESOLUCION;
      v_comped_des.OBSERVACIONES           := v_comped_ori.OBSERVACIONES;
      --
      COM_PKG.INS_COMPED(p_comped => v_comped_des);
      --
      -- Genero el Estado para el Pedido
      --
      v_compee.COMPED_ID := p_comped_nue_id;
      v_compee.FECHA     := SYSDATE;
      v_compee.ESTADO    := 'NUE';
      v_compee.MOTIVO    := 'Copia de Solicitud';
      --
      COM_PKG.INS_COMPEE(p_compee => v_compee);
      --
      -- Obtener el Numero a ser asignado al Pedido para confirmarlo
      LOOP
         v_comped_codigo := OBTN_COMPED_NUMERO(p_segorg_id => v_comped_ori.SEGORG_ID
                                             , p_ejercicio => v_comped_ori.EJERCICIO);
         -- Verificar que el numero obtenido no se encuentre utilizado
         SET_COMPED_CODIGO(p_segorg_id => v_comped_ori.segorg_id
                          ,p_ejercicio => v_comped_ori.ejercicio
                          ,p_codigo    => v_comped_codigo);
         GET_COMPED(p_comped => v_comped_tmp);
         if v_comped_tmp.ID is null then
            EXIT;
         end if;
         v_comped_codigo := NULL;
         INI_COMPED;
      END LOOP;
      --
      -- Actualizar el Pedido con el Numero asignado
      UPDATE COM_PEDIDOS ped
      SET ped.CODIGO = v_comped_codigo
      WHERE ped.ID = p_comped_nue_id;
      --
      v_compee.COMPED_ID := p_comped_nue_id;
      v_compee.FECHA     := SYSDATE;
      v_compee.ESTADO    := 'PAU';
      v_compee.MOTIVO    := 'Copia de Solicitud';
      --
      COM_PKG.INS_COMPEE(p_compee => v_compee);

      --
      -- Copiamos el Detalle del Pedido
      --
      if v_comped_ori.SOLO_ITEMS_NOMENCLADOS_SN = 'NO' then
        -- Copiar Todos los Items
          FOR v_compet_ori IN cr_compet(p_comped_id) LOOP
             --
             -- Validar Items - Si el item ya no esta vigente no lo copiamos
             --
             COM_PKG.SET_COMCIT(p_comcit_id => v_compet_ori.COMCIT_ID);
             COM_PKG.GET_COMCIT(p_comcit => v_comcit);
             if v_comcit.SITUACION <> 'VIG' then
                continue;
             end if;
             --
             SELECT COMPET_ID.NEXTVAL INTO v_compet_des.ID FROM DUAL;
             v_compet_des.COMPED_ID        := p_comped_nue_id;
             v_compet_des.RENGLON          := v_compet_ori.RENGLON;
             v_compet_des.COMCCL_ID        := v_compet_ori.COMCCL_ID;
             v_compet_des.COMCIT_ID        := v_compet_ori.COMCIT_ID;
             v_compet_des.CODIGO           := v_compet_ori.CODIGO;
             v_compet_des.DESCRIPCION      := v_compet_ori.DESCRIPCION;
             v_compet_des.CANTIDAD         := v_compet_ori.CANTIDAD;
             v_compet_des.PRECIO_UNITARIO  := v_compet_ori.PRECIO_UNITARIO;
             v_compet_des.OBSERVACION      := ''; --v_compet_ori.OBSERVACION;
             v_compet_des.SITUACION        := v_compet_ori.SITUACION;
             COM_PKG.INS_COMPET(p_compet => v_compet_des);
          END LOOP;
          --
      else
      -- Copiar solo los Items Nomenclados
          FOR v_compet_ori IN cr_compet_nmc(p_comped_id) LOOP
             --
             -- Validar Items - Si el item ya no esta vigente no lo copiamos
             --
             COM_PKG.SET_COMCIT(p_comcit_id => v_compet_ori.COMCIT_ID);
             COM_PKG.GET_COMCIT(p_comcit => v_comcit);
             if v_comcit.SITUACION <> 'VIG' then
                continue;
             end if;
             --
             SELECT COMPET_ID.NEXTVAL INTO v_compet_des.ID FROM DUAL;
             v_compet_des.COMPED_ID        := p_comped_nue_id;
             v_compet_des.RENGLON          := v_compet_ori.RENGLON;
             v_compet_des.COMCCL_ID        := v_compet_ori.COMCCL_ID;
             v_compet_des.COMCIT_ID        := v_compet_ori.COMCIT_ID;
             v_compet_des.CODIGO           := v_compet_ori.CODIGO;
             v_compet_des.DESCRIPCION      := v_compet_ori.DESCRIPCION;
             v_compet_des.CANTIDAD         := v_compet_ori.CANTIDAD;
             v_compet_des.PRECIO_UNITARIO  := v_compet_ori.PRECIO_UNITARIO;
             v_compet_des.OBSERVACION      := ''; --v_compet_ori.OBSERVACION;
             v_compet_des.SITUACION        := v_compet_ori.SITUACION;
             COM_PKG.INS_COMPET(p_compet => v_compet_des);
          END LOOP;
          --
      end if;
      --
      -- Copiamos los Datos Adicionales del Pedido
      --
      FOR v_compda_ori IN cr_compda(p_comped_id) LOOP
         SELECT COMPDA_ID.NEXTVAL INTO v_compda_des.ID FROM DUAL;
         v_compda_des.COMPED_ID    := p_comped_nue_id;
         v_compda_des.COMDAT_ID    := v_compda_ori.COMDAT_ID;
         v_compda_des.INSTANCIA    := v_compda_ori.INSTANCIA;
         v_compda_des.VALOR        := v_compda_ori.VALOR;
         COM_PKG.INS_COMPDA(p_compda => v_compda_des);
      END LOOP;
      --
      -- Copiamos los Documentos del Pedido
      --
      FOR v_compec_ori IN cr_compec(p_comped_id) LOOP
         --
         FOR v_comdoc_ori IN cr_comdoc(v_compec_ori.COMDOC_ID) LOOP
            --
            SELECT COMDOC_ID.NEXTVAL INTO v_comdoc_des.ID FROM DUAL;
            v_comdoc_des.COMDCT_ID        := v_comdoc_ori.COMDCT_ID;
            v_comdoc_des.DOCUMENTO        := v_comdoc_ori.DOCUMENTO;
            v_comdoc_des.NOMBRE_ARCHIVO   := v_comdoc_ori.NOMBRE_ARCHIVO;
            v_comdoc_des.TIPO_ARCHIVO     := v_comdoc_ori.TIPO_ARCHIVO;
            --
            COM_PKG.INS_COMDOC(p_comdoc => v_comdoc_des);
            --
         END LOOP;
         --
         v_compec_des.COMPED_ID  := p_comped_nue_id;
         v_compec_des.COMDCT_ID  := v_compec_ori.COMDCT_ID;
         v_compec_des.COMDOC_ID  := v_comdoc_des.ID;
         v_compec_des.FECHA      := SYSDATE;
         --
         COM_PKG.INS_COMPEC(p_compec => v_compec_des);
      END LOOP;

   END LOOP;

END;
/* Invocar Web Service Actuaciones Tramix - Solicitud de Gasto */
FUNCTION COMPED_INVOCAR_WS
 (P_COMPDG_ID IN NUMBER
 ,P_ACTUACION_IDENTIF IN VARCHAR2
 ,P_VALIDA IN NUMBER
 )
 RETURN VARCHAR2
 IS
req_body             CLOB;
   chunk_buffer_clob    CLOB;
   buffersize           NUMBER(4) := 2000;
   chunk_buffer         VARCHAR2(2000);
   chunk_length         NUMBER(4);
   chunk_offset         NUMBER;
   request_body_length  NUMBER;
   req                  utl_http.req;
   resp                 utl_http.resp;
   v_response_text      VARCHAR2(32767);
   v_url                VARCHAR2(1000);
   v_username           VARCHAR2(100);
   v_ticket             VARCHAR2(100);
   v_expdte_fmt_tramix  VARCHAR2(30);
   v_tipo_expdte        VARCHAR2(30);
   v_compdg             com_pedidos_docgen%rowtype;
   v_comdoc             com_documentos%rowtype;
   --
   cursor cr_compdg is
   select * from com_pedidos_docgen compdg
   where compdg.id = p_compdg_id;
   --
   cursor cr_comdoc (p_comdoc_id number) is
   select * from com_documentos comdoc
   where comdoc.id = p_comdoc_id;
   --
   cursor cr_comped (p_comped_id number) is
   select comped.*
         ,comeco.codigo||' - '||comeco.nombre contratante_codigo
   from com_pedidos comped
       ,com_contratantes comeco
   where comped.comeco_id = comeco.id
     and comped.id = p_comped_id;
   --
   v_comped cr_comped%rowtype;
   --
begin
   --
   if p_compdg_id is null then
      raise_application_error(-20000,'No se ha especificado el id de Documento Solicitud de Gasto',true);
   end if;
   --
   open cr_compdg;
   fetch cr_compdg into v_compdg;
   close cr_compdg;
   --
   if v_compdg.id is null then
      raise_application_error(-20000,'El id de Documento especificado No existe',true);
   end if;
   --
   open cr_comdoc(v_compdg.comdoc_id);
   fetch cr_comdoc into v_comdoc;
   close cr_comdoc;
   --
   open cr_comped(v_compdg.comped_id);
   fetch cr_comped into v_comped;
   close cr_comped;
   --
   -- Deducimos el Tipo de Expediente en funcion del formato
   --
   -- Si es de 6 caracteres es formato viejo No Digital
   --
    if length(substr(v_comped.expediente, 11   )) = 6 then
       v_tipo_expdte := 'EXP-';
       -- Si es de 8 caracteres
    elsif length(substr(v_comped.expediente, 11   )) = 8 then
       -- y si comienza con 00 es formato viejo No Digital
       if substr(v_comped.expediente, 11, 2) = '00' then
          v_tipo_expdte := 'EXP-';
       -- y si el segundo digito es distinto de 0 es formato nuevo Digital
       elsif to_number(substr(v_comped.expediente, 11, 2),'99') > 0 then
          v_tipo_expdte := 'EXD-';
       end if;
    end if;
   --
   -- Si la unidad ejecutora es de la Univercidad de La Punta (ULP) cambiar el Tipo de Expediente a UND-
   if substr(v_comped.contratante_codigo,1,instr(v_comped.contratante_codigo,'-',1)) = 'ULP-' then
      v_tipo_expdte := 'UND-';
   end if;
  --
   v_expdte_fmt_tramix := v_tipo_expdte ||
                        to_number(substr(v_comped.expediente, 1, 4 )) || '-' ||
                        to_number(substr(v_comped.expediente, 11   )) || '-' ||
                        to_number(substr(v_comped.expediente, 8, 2 ));
   --
   req_body := COM_PKG.Blob2ClobBase64(v_comdoc.documento);
   --
   --url := 'http://64.215.200.12:81/tramix-flex/services/ActWebService';
   v_url      := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_URL_ACTUACION'
                                           ,p_segorg_id =>  v_comped.segorg_id);
   --
   v_ticket   := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_TICKET'
                                           ,p_segorg_id =>  v_comped.segorg_id);
   --
   --v_username := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_USERNAME'
   --                                        ,p_segorg_id =>  v_comped.segorg_id);
   v_username := NVL(v('APP_USER'),USER) ;
   --
   --
   -- Extender el tiempo de espera para el time oput a 10 min UTL_HTTP.set_transfer_timeout(180);

   utl_http.set_transfer_timeout(600);

   req := utl_http.begin_request(v_url,'POST','HTTP/1.1');
   --
   utl_http.set_header(req,'Content-Type','text/xml');
   utl_http.set_header(req,'Transfer-Encoding','chunked');
   --
   chunk_buffer :=
   '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ws="ws.unitech.com">
	   <soapenv:Header />
      <soapenv:Body>
	   <ws:insertActuacionWAttach> ';
   --
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   --
   utl_http.write_text(req,chunk_buffer);
   --
   chunk_buffer :='  <ticket>'               || v_ticket             || '</ticket> '             ||
      					'<expediente_identif>'  || v_expdte_fmt_tramix  || '</expediente_identif>'  ||
      					'<actuacion_identif>'   || p_actuacion_identif  || '</actuacion_identif>'   ||
      					'<usuario_identif>'     || v_username           || '</usuario_identif> '    ||
      					'<valida>'              || p_valida             || '</valida> '             ||
      					'<attachment>';
   --
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   --
   utl_http.write_text(req,chunk_buffer);
   --
   request_body_length := dbms_lob.getlength(req_body);
   chunk_offset := 1;
   while (chunk_offset < request_body_length) loop
      if chunk_offset + buffersize >= request_body_length
      then
         chunk_length := request_body_length - chunk_offset +1 ;
      else
         chunk_length := buffersize;
      end if;
      dbms_lob.read(req_body, chunk_length, chunk_offset, chunk_buffer);
      --
      chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
      --
      utl_http.write_text(req,chunk_buffer);
      chunk_offset := chunk_offset + chunk_length;
   end loop;
   --
   chunk_buffer := '</attachment>';
   --
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   utl_http.write_text(req,chunk_buffer);
   --
   chunk_buffer := '</ws:insertActuacionWAttach>
	                  </soapenv:Body>
                     </soapenv:Envelope>';
   utl_http.write_text(req,chunk_buffer);
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   --
   --insert into xml_requests(xml, fecha)
   --values (chunk_buffer_clob, sysdate);
   --
   resp := utl_http.get_response(req);
   utl_http.read_text(resp, v_response_text, 32767);
   utl_http.end_response(resp);
   --
   return v_response_text;
end;
/* Invocar Web Service Actuaciones Tramix - Solicitud de Gasto - Adjuntos */
FUNCTION COMPED_INVOCAR_WS_ADJUNTO
 (P_ACTUACION_ID IN VARCHAR2
 ,P_COMPEC_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
req_body             CLOB;
   chunk_buffer_clob    CLOB;
   buffersize           NUMBER(4) := 2000;
   chunk_buffer         VARCHAR2(2000);
   chunk_length         NUMBER(4);
   chunk_offset         NUMBER;
   request_body_length  NUMBER;
   req                  utl_http.req;
   resp                 utl_http.resp;
   v_response_text      VARCHAR2(32767);
   v_url                VARCHAR2(1000);
   actuacion_identif    VARCHAR2(1000);
   v_username           VARCHAR2(100);
   v_ticket             VARCHAR2(100);
   v_fecha_adjunto      VARCHAR2(100);
   v_comped             com_pedidos%rowtype;
   v_comdoc             com_documentos%rowtype;
   v_compec             com_pedidos_doc%rowtype;
   --
   cursor cr_comped (p_comped_id number) is
   select * from com_pedidos comped
   where comped.id = p_comped_id;
   --
   cursor cr_compec is
   select * from com_pedidos_doc
   where id = p_compec_id;
   --
   cursor cr_comdoc (p_comdoc_id number) is
   select * from com_documentos comdoc
   where comdoc.id = p_comdoc_id;
   --
begin
   open cr_compec;
   fetch cr_compec into v_compec;
   close cr_compec;
   --
   open cr_comdoc(v_compec.comdoc_id);
   fetch cr_comdoc into v_comdoc;
   close cr_comdoc;
   --
   open cr_comped(v_compec.comped_id);
   fetch cr_comped into v_comped;
   close cr_comped;
   --
   req_body := COM_PKG.Blob2ClobBase64(v_comdoc.documento);
   --
   --url := 'http://64.215.200.12:81/tramix-flex/services/ActWebService';
   v_url      := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_URL_ACTUACION'
                                         ,p_segorg_id =>  v_comped.segorg_id);
   --
   v_ticket   := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_TICKET'
                                         ,p_segorg_id =>  v_comped.segorg_id);
   --
   --v_username := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_USERNAME'
   --                                      ,p_segorg_id =>  v_comped.segorg_id);
   v_username := NVL(v('APP_USER'),USER) ;
   --
   --
   -- Extender el tiempo de espera para el time oput a 10 min UTL_HTTP.set_transfer_timeout(180);

   utl_http.set_transfer_timeout(600);

   req := utl_http.begin_request(v_url,'POST','HTTP/1.1');
   --
   utl_http.set_header(req,'Content-Type','text/xml');
   utl_http.set_header(req,'Transfer-Encoding','chunked');
   --
   chunk_buffer :=
   '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ws="ws.unitech.com">
	   <soapenv:Header />
      <soapenv:Body>
	   <ws:insertAdjunto> ';
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;

   utl_http.write_text(req,chunk_buffer);
   --
   v_fecha_adjunto := to_char(v_compec.FECHA,'dd/mm/yyyy');
   --
   chunk_buffer :='<ticket>'            || v_ticket                || '</ticket> '           ||
                  '<usuario_identif>'   || v_username              || '</usuario_identif> '  ||
      				'<actuacion_identif>' || p_actuacion_id          || '</actuacion_identif>' ||
      				'<adjunto_nombre>'    || v_comdoc.NOMBRE_ARCHIVO || '</adjunto_nombre>'    ||
      				'<adjunto_fecha>'     || v_fecha_adjunto         || '</adjunto_fecha> '    ||
      				'<adjunto_descr>'     || v_comdoc.NOMBRE_ARCHIVO || '</adjunto_descr> '    ||

      				'<attachment>';
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   utl_http.write_text(req,chunk_buffer);
   --
   request_body_length := dbms_lob.getlength(req_body);
   chunk_offset := 1;
   while (chunk_offset < request_body_length) loop
      if chunk_offset + buffersize >= request_body_length
      then
         chunk_length := request_body_length - chunk_offset +1 ;
      else
         chunk_length := buffersize;
      end if;
      dbms_lob.read(req_body, chunk_length, chunk_offset, chunk_buffer);
      chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
      utl_http.write_text(req,chunk_buffer);
      chunk_offset := chunk_offset + chunk_length;
   end loop;
   --
   chunk_buffer := '</attachment>';
   --
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   utl_http.write_text(req,chunk_buffer);
   --
   chunk_buffer := '</ws:insertAdjunto>
	                  </soapenv:Body>
                     </soapenv:Envelope>';
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   utl_http.write_text(req,chunk_buffer);
   --
   --insert into xml_requests(xml, fecha)
   --values (chunk_buffer_clob, sysdate);
   --
   resp := utl_http.get_response(req);
   utl_http.read_text(resp, v_response_text, 32767);
   utl_http.end_response(resp);
   --
   return v_response_text;
end;
PROCEDURE COMPED_PROC_XML_ADJ
 (P_XML IN VARCHAR2
 ,P_ACTUACION_ID IN VARCHAR2
 ,P_SEGORG_ID IN NUMBER
 ,P_RESULTADO OUT VARCHAR2
 ,P_MOTIVO OUT VARCHAR2
 ,P_REFERENCIA OUT VARCHAR2
 )
 IS
--
   l_clob        CLOB;
   v_document    dbms_xmldom.domdocument;
   v_nodes       dbms_xmldom.DOMNodeList;
   v_element_x   dbms_xmldom.DOMElement;
   v_node        dbms_xmldom.DOMNode;
   v_node_2      dbms_xmldom.DOMNode;
   v_tag         VARCHAR2(100);
   v_node_value  VARCHAR2(100);
   --
begin
   --
   l_clob      := p_xml;
   v_document  := dbms_xmldom.newdomdocument(l_clob);
   v_nodes     := dbms_xmldom.getElementsByTagName(v_document, '*');
   --
   FOR i IN 0..dbms_xmldom.getlength(v_nodes)-1
   LOOP
      v_element_x  := dbms_xmldom.makeelement(xmldom.item(v_nodes,i));
      v_node       := dbms_xmldom.item(v_nodes,i);
      v_tag        := dbms_xmldom.getNodeName(v_node);
      v_node_2     := dbms_xmldom.getfirstchild(v_node);

      --
      -- Tag de retorno de codigo de operacion
      --
      if v_tag = 'return' then
         v_node_value := dbms_xmldom.getnodevalue(v_node_2);
         p_resultado  := v_node_value;
         p_motivo     := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo     => v_node_value
                                                  ,p_segorg_id  => p_segorg_id);
         if p_motivo is null then
            --raise_application_error(-20000, 'Error: El WebService ha devuelto un valor de retorno no configurado: ' || v_node_value , true);
            p_resultado := 'Error: El WebService ha devuelto un valor de retorno no configurado: <pre>' || v_node_value || '-' || p_resultado ||'</pre>';
         end if;
         --
      end if;

      --
      -- Tag de Id de Actuacion
      --
      if v_tag = 'id' then
         v_node_value := dbms_xmldom.getnodevalue(v_node_2);
         p_referencia := v_node_value;
      end if;
   END LOOP;
   --
end;
PROCEDURE COMPED_PROC_XML_ACT
 (P_XML IN VARCHAR2
 ,P_SEGORG_ID IN NUMBER
 ,P_RESULTADO OUT VARCHAR2
 ,P_MOTIVO OUT VARCHAR2
 ,P_REFERENCIA OUT VARCHAR2
 )
 IS
--
   l_clob        CLOB;
   v_document    dbms_xmldom.domdocument;
   v_nodes       dbms_xmldom.DOMNodeList;
   v_element_x   dbms_xmldom.DOMElement;
   v_node        dbms_xmldom.DOMNode;
   v_node_2      dbms_xmldom.DOMNode;
   v_tag         VARCHAR2(100);
   v_node_value  VARCHAR2(100);
   --
begin
   --
   p_resultado := 'ERROR';
   l_clob      := p_xml;
   v_document  := dbms_xmldom.newdomdocument(l_clob);
   v_nodes     := dbms_xmldom.getElementsByTagName(v_document, '*');
   --
   FOR i IN 0..dbms_xmldom.getlength(v_nodes)-1
   LOOP
      v_element_x  := dbms_xmldom.makeelement(xmldom.item(v_nodes,i));
      v_node       := dbms_xmldom.item(v_nodes,i);
      v_tag        := dbms_xmldom.getNodeName(v_node);
      v_node_2     := dbms_xmldom.getfirstchild(v_node);

      --
      -- Tag de retorno de codigo de operacion
      --
      if v_tag = 'return' then
         v_node_value := dbms_xmldom.getnodevalue(v_node_2);
         p_resultado  := v_node_value;

         v_node_value := trim(replace(v_node_value, '&', ''));
         if instr(v_node_value,'-') > 0 then
            v_node_value := substr(v_node_value,0,instr(v_node_value,'-')-1);
         end if;
         --
         -- Si la actuacion ya ha sido cargada le permitimos aprobar la solicitud
         --
         if instr(v_node_value,'ERR_ACT_NOTVALID(ya existe una actuaci') > 0 then
            p_resultado := 'YA_EXISTE';
         end if;
         --
         p_motivo     := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo     => v_node_value
                                                  ,p_segorg_id  => p_segorg_id);
         if p_motivo is null then
            --raise_application_error(-20000, 'Error: El WebService ha devuelto un valor de retorno no configurado: <pre>' || v_node_value || '-' || p_resultado ||'</pre>', true);
            p_resultado := 'Error: El WebService ha devuelto un valor de retorno no configurado: <pre>' || v_node_value || '-' || p_resultado ||'</pre>';
         end if;
         --
      end if;

      --
      -- Tag de Id de Actuacion
      --
      if v_tag = 'id' then
         v_node_value := dbms_xmldom.getnodevalue(v_node_2);
         p_referencia := v_node_value;
      end if;
   END LOOP;
   --
end;
/* Verificar que todos los items del Pedido Tengan Precio Testigo. */
FUNCTION COMPED_TIENE_CTP
 (P_COMPED_ID IN NUMBER
 ,P_FECHA IN DATE := sysdate
 )
 RETURN VARCHAR2
 IS
--
  CURSOR cr_compet IS
  SELECT *
  FROM COM_PEDIDOS_DETALLES COMPET
  WHERE COMPET.COMPED_ID = p_comped_id;
  --
  CURSOR cr_comctp (p_comcit_id IN NUMBER)IS
  SELECT ID
  FROM (SELECT COMCTP.ID ID
        FROM COM_CATALOGO_PRECIOS COMCTP
        WHERE COMCTP.COMCIT_ID = p_comcit_id
          AND COMCTP.SITUACION = 'VAL'
          AND COMCTP.FECHA_VIGENCIA <= p_fecha
          AND (COMCTP.FECHA_VALIDEZ IS NULL OR COMCTP.FECHA_VALIDEZ >= p_fecha)
        ORDER BY COMCTP.FECHA_VIGENCIA DESC, COMCTP.FECHA_VALIDEZ ASC
       )
  WHERE ROWNUM=1;
  --
  v_retorno     VARCHAR2(2);
  v_comctp_id   NUMBER;
  --
BEGIN
  v_retorno := 'NO';
  FOR v_compet IN cr_compet LOOP
    -- Por cada item dentro del detalle del pedido
    -- verificar que todos tengan precio testigo
    -- al primero que no la cumpla retornar falso
    OPEN cr_comctp(p_comcit_id => v_compet.comcit_id);
    FETCH cr_comctp INTO v_comctp_id;
    CLOSE cr_comctp;
    IF v_comctp_id IS NULL THEN
      RETURN 'NO';
    ELSE
      v_retorno := 'SI';
    END IF;
  END LOOP;
  --
  RETURN v_retorno;
  --
EXCEPTION
  WHEN OTHERS THEN
    RETURN 'NO';
END;
FUNCTION COMPED_TRAMIX_HAB_SN
 (P_SEGORG_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_conf is
   select valor
   from seg_configuraciones
   where segorg_id = P_SEGORG_ID
   and codigo = 'COMPED_SRVINT_TRAMIX_HABILITADO_SN';
   --
   v_habilitado         varchar2(10) := 'NO';
   --
BEGIN
   if p_segorg_id is null then
      raise_application_error(-20000,'La Organizacion no ha sido indicada y es un dato obligatorio',true);
   end if;
   --
   for v_conf in cr_conf loop
      if v_conf.valor = 'SI' then
         v_habilitado := 'SI';
      else
         v_habilitado := 'NO';
      end if;
   end loop;

   return v_habilitado;
END;
PROCEDURE COMPED_TRANSMITIR
 (P_SEGORG_ID IN NUMBER
 ,P_COMPED_ID IN NUMBER
 ,P_MOTIVO IN VARCHAR2
 ,P_INTENV_ID OUT NUMBER
 )
 IS
-----------------------------------------------------------------------------------
   --
   -- Argumentos
   -- p_segorg_id => Organizacion
   -- p_comped_id => Id del Pedido
   -- p_motivo    => Motivo ingresado en la interface
   --
   -----------------------------------------------------------------------------------
   --
   cursor cr_comped (p_comped_id number) is
   select * from com_pedidos comped
   where comped.id = p_comped_id;
   --
   cursor cr_compec is
   select * from com_pedidos_doc
   where comped_id = p_comped_id;
   --
   cursor cr_conf is
   select valor
   from seg_configuraciones
   where segorg_id = P_SEGORG_ID
   and codigo = 'COMPED_SRVINT_TRAMIX_HABILITADO_SN';
   --
   v_habilitado         varchar2(10);
   v_compdg             com_pedidos_docgen%rowtype;
   v_intenv             int_envios%rowtype;
   v_compee             com_pedidos_est%ROWTYPE;
   v_intori             int_origenes%ROWTYPE;
   v_intdes             int_destinos%ROWTYPE;
   v_inttpo             int_tipos_objetos%ROWTYPE;
   v_intene             int_envios_est%ROWTYPE;
   v_comped             com_pedidos%rowtype;
   v_respuesta_ws       varchar2(2000);
   v_respuesta_ws_adj   varchar2(2000);
   v_resultado_ws       varchar2(2000);
   v_resultado_ws_adj   varchar2(2000);
   v_motivo             varchar2(2000);
   v_referencia         varchar2(2000);
   v_referencia_adj     varchar2(2000);
   v_actuacion_identif  varchar2(2000);
   v_aprobar            varchar2(2);
   v_inttpo_id          number;
   v_intori_id          number;
   v_intdes_id          number;
   v_intene_id          number;
   v_compdg_id          number;
   v_intenv_id          number;
   v_cantidad_adjuntos  number;
   v_documento_id       number;
   --
BEGIN
   --
   if p_segorg_id is null then
      raise_application_error(-20000,'La Organizacion no ha sido indicada y es un dato obligatorio',true);
   elsif p_comped_id is null then
      raise_application_error(-20000,'El Pedido no ha sido indicado y es un dato obligatorio',true);
   end if;
   --
   for v_conf in cr_conf loop
      if v_conf.valor = 'SI' then
         v_habilitado := 'SI';
      else
         v_habilitado := 'NO';
      end if;
   end loop;

   if v_habilitado = 'NO' then
      raise_application_error(-20000,'El envio no se encuentra habilitado en estos momentos',true);
   end if;
   --
   open cr_comped(p_comped_id);
   fetch cr_comped into v_comped;
   close cr_comped;
   --
   -- 1. Generar y Grabar el Documento
   --
   v_documento_id := com_pkg.obtn_comped_doc_pdf(p_segorg_id => p_segorg_id
                                                ,p_comped_id => p_comped_id);
   if v_documento_id is null then
      raise_application_error(-20000,'No se ha podido generar el Documento',true);
   end if;
   --
   -- 2. Grabar referencia Pedido-Documento
   --
   SELECT COMPDG_ID.NEXTVAL INTO v_compdg_id FROM DUAL;
   v_compdg.ID        := v_compdg_id;
   v_compdg.COMPED_ID := p_comped_id;
   v_compdg.COMDOC_ID := v_documento_id;
   COM_PKG.COMPDG_INS(p_compdg => v_compdg);
   --
   -- 3. Transmitir el Documento al WebService
   --
   v_actuacion_identif := 'SOLSEC' || '-' || 'SOLICITUD DE GASTO N°: ' || v_comped.codigo || '/' ||  v_comped.ejercicio;
   v_respuesta_ws := COM_PKG.COMPED_INVOCAR_WS(p_compdg_id         => v_compdg_id
                                             , p_actuacion_identif => v_actuacion_identif
                                             , p_valida            => 1);
   --
   -- 4. Parseamos el resultado del Webservice
   --
   COM_PKG.COMPED_PROC_XML_ACT(p_xml       => v_respuesta_ws
                              ,p_segorg_id => p_segorg_id
                              ,p_resultado => v_resultado_ws
                              ,p_motivo    => v_motivo
                              ,p_referencia=> v_referencia);
   --
   IF v_resultado_ws = 'ERROR' THEN
      raise_application_error(-20000,'No se ha podido interpretar el mensaje de respuesta.',true);
   END IF;
   ----------------------------------------------------------
   -- 5. Grabar Log en Envíos
   ----------------------------------------------------------
   INT_PKG.INTTPO_SET_CODIGO(p_segorg_id => p_segorg_id
                            ,p_codigo    => 'COMPED_ACTUACION');
   INT_PKG.INTTPO_GET(p_inttpo => v_inttpo);
   v_inttpo_id := v_inttpo.id;
   --
   INT_PKG.INTENV_REGISTRAR(
                  P_INTTPO_ID     => v_inttpo_id
                 ,P_INTENV_OBJETO => '<comdoc_id>'    || v_documento_id || '</comdoc_id>'
                 ,P_INTENV_OBS    => v_respuesta_ws
                 ,P_INTENV_RES    => '<return>'       || v_resultado_ws || '<return>'        ||
                                     '<actuacion_id>' || v_referencia   || '</actuacion_id>'
                 ,P_INTENE_FECHA  => sysdate
                 ,P_INTENV_ID     => v_intenv_id
   );
   --
   --
   -- 6. Si la Actuacion principal se inserto correctamente
   --    entonces vamos a verificar si tiene adjuntos
   --
   --
   IF instr(v_resultado_ws,'OP_COMPLETED') > 0 THEN
      --
      v_aprobar := 'SI';

      select count(*) into v_cantidad_adjuntos from com_pedidos_doc  where comped_id = p_comped_id;
      IF v_cantidad_adjuntos > 0 THEN
         --OP_COMPLETED-SOLSEC 460/11
         v_actuacion_identif := substr(v_resultado_ws, 14 );
         --
         -- 7. Transmitir Documentos Adjuntos al WebService
         --

         FOR v_compec IN cr_compec LOOP
            --
            -- 8. Buscamos el documento adjunto y lo transmitimos al WS
            --
            v_respuesta_ws_adj := COM_PKG.COMPED_INVOCAR_WS_ADJUNTO(p_actuacion_id => v_actuacion_identif
                                                                   ,p_compec_id    => v_compec.id);

            --
            -- 9. Parseamos el resultado del Webservice de envio de adjunto
            --
            COM_PKG.COMPED_PROC_XML_ADJ( p_xml          => v_respuesta_ws_adj
                                        ,p_actuacion_id => v_referencia
                                        ,p_segorg_id    => p_segorg_id
                                        ,p_resultado    => v_resultado_ws_adj
                                        ,p_motivo       => v_motivo
                                        ,p_referencia   => v_referencia_adj);
            --
            -- 10. Grabar Log en Envíos de Adjuntos
            --
            INT_PKG.INTTPO_SET_CODIGO(p_segorg_id => p_segorg_id
                                     ,p_codigo    => 'COMPED_ACTUACION');
            INT_PKG.INTTPO_GET(p_inttpo => v_inttpo);
            v_inttpo_id := v_inttpo.id;
            --
            INT_PKG.INTENV_REGISTRAR(
                                   P_INTTPO_ID     => v_inttpo_id
                                  ,P_INTENV_OBJETO => '<comdoc_id>'    ||   v_compec.comdoc_id   || '</comdoc_id>'
                                  ,P_INTENV_OBS    => v_respuesta_ws
                                  ,P_INTENV_RES    => '<return>'       || v_resultado_ws_adj || '<return>'        ||
                                                      '<actuacion_id>' || v_referencia       || '</actuacion_id>'
                                  ,P_INTENE_FECHA  => sysdate
                                  ,P_INTENV_ID     => v_intenv_id
                                    );
            --
            IF v_resultado_ws_adj <> 'OP_COMPLETED' THEN
               --
               v_aprobar := 'NO';
               --
               -- 8.B Modificar Estado del Envio del Adjunto a ERROR
               --
               SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
               v_intene.INTENV_ID     := v_intenv_id;
               v_intene.FECHA         := sysdate;
               v_intene.ESTADO        := 'ERR';
               v_intene.MOTIVO_ESTADO := v_motivo || '-Error al enviar archivo adjunto ' || v_resultado_ws_adj;
               INT_PKG.INTENE_INS(p_intene => v_intene);
               --
            END IF;
         END LOOP;
         --
         -- Si envio correctamente la actuacion y tambien todos los adjuntos
         -- entonces modificamos el estado a ENVIADO
         --
         IF v_aprobar = 'SI' THEN
            --
            -- 8.A Modificar Estado del Envio a ENVIADO
            --
            SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
            v_intene.ID            := v_intene_id;
            v_intene.INTENV_ID     := v_intenv_id;
            v_intene.FECHA         := sysdate;
            v_intene.ESTADO        := 'ENV';
            v_intene.MOTIVO_ESTADO := v_motivo;
            INT_PKG.INTENE_INS(p_intene => v_intene);
            --
         END IF;
         --
      ELSE -- Si no tiene adjuntos y la actuacion principal se envió correctamente
         --
         -- 8.A Modificar Estado del Envio a ENVIADO
         --
         SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
         v_intene.ID            := v_intene_id;
         v_intene.INTENV_ID     := v_intenv_id;
         v_intene.FECHA         := sysdate;
         v_intene.ESTADO        := 'ENV';
         v_intene.MOTIVO_ESTADO := v_motivo;
         INT_PKG.INTENE_INS(p_intene => v_intene);
         --
      END IF;
   ELSE -- Devuelve distinto de OP_COMPLETED
      --
      -- 8.B Modificar Estado del Envio ERROR
      --
      SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
      v_intene.ID            := v_intene_id;
      v_intene.INTENV_ID     := v_intenv_id;
      v_intene.FECHA         := sysdate;
      v_intene.ESTADO        := 'ERR';
      v_intene.MOTIVO_ESTADO := v_motivo;
      INT_PKG.INTENE_INS(p_intene => v_intene);
      --
   END IF;
   --
   p_intenv_id := v_intenv_id;
   --
EXCEPTION WHEN others THEN
   raise_application_error(-20000,'No se ha podido Enviar la Solicitud de Gasto',true);
END;
PROCEDURE COMPED_TRANSMITO_ANU
 (P_SEGORG_ID IN NUMBER
 ,P_COMPED_ID IN NUMBER
 ,P_INTENV_ID OUT NUMBER
 )
 IS
-----------------------------------------------------------------------------------
   --
   -- Argumentos
   -- p_segorg_id => Organizacion
   -- p_comped_id => Id del Pedido
   -- p_intenv_id => Id del Envio
   --
   -----------------------------------------------------------------------------------
   --
   cursor cr_comped (p_comped_id number) is
   select * from com_pedidos comped
   where comped.id = p_comped_id;
   --
   cursor cr_compec is
   select * from com_pedidos_doc
   where comped_id = p_comped_id;
   --
   --
   cursor cr_conf is
   select valor
   from seg_configuraciones
   where segorg_id = P_SEGORG_ID
   and codigo = 'COMPED_SRVINT_TRAMIX_HABILITADO_SN';
   --
   cursor cr_compee (p_compee_id number) is
   select * from com_pedidos_est compee
   where compee.id = p_compee_id;
   --
   v_habilitado         varchar2(10);
   v_compdg             com_pedidos_docgen%rowtype;
   v_intenv             int_envios%rowtype;
   v_compee             com_pedidos_est%ROWTYPE;
   v_compee_aux         com_pedidos_est%ROWTYPE;
   v_compee_n           com_pedidos_est%ROWTYPE;
   v_intori             int_origenes%ROWTYPE;
   v_intdes             int_destinos%ROWTYPE;
   v_inttpo             int_tipos_objetos%ROWTYPE;
   v_intene             int_envios_est%ROWTYPE;
   v_comped             com_pedidos%rowtype;
   v_respuesta_ws       varchar2(2000);
   v_respuesta_ws_adj   varchar2(2000);
   v_resultado_ws       varchar2(2000);
   v_motivo             varchar2(2000);
   v_referencia         varchar2(2000);
   v_actuacion_identif  varchar2(2000);
   v_aprobar            varchar2(2);
   v_inttpo_id          number;
   v_intori_id          number;
   v_intdes_id          number;
   v_intene_id          number;
   v_compdg_id          number;
   v_intenv_id          number;
   v_cantidad_adjuntos  number;
   v_documento_id       number;
   v_compee_id          number;
   --
BEGIN
      --
      open cr_comped(p_comped_id);
      fetch cr_comped into v_comped;
      close cr_comped;
      -- Verificar que el Pedido se encuentre en el estado correcto
      -- Obtener el estado actual del pedido
      v_compee_id := COM_PKG.OBTN_COMPEE_ID (p_comped_id => p_comped_id, p_fecha => sysdate);
      --
      -- Obtener los datos del estado del pedido
      COM_PKG.SET_COMPEE(p_id => v_compee_id);
      COM_PKG.GET_COMPEE(p_compee => v_compee);
      --
      -- Verificar si el estado pudo obtenerse
      if v_compee.ID is null then
         raise_application_error(-20000,'No se ha podido determinar el estado actual de la Solicitud de Gasto',true);
      end if;
      --
      if v_compee.ESTADO <> 'ANU' then
         raise_application_error(-20000,'La Solicitud de Gasto No se encuentra Anulada',true);
      end if;
      --
      -- Si la Integracion no esta habilitada entonces Anulamos el Pedido.
      --
      --
      for v_conf in cr_conf loop
         if v_conf.valor = 'NO' then
            raise_application_error(-20000,'La Integración No se encuentra Habilitada',true);
         end if;
      end loop;
      --
      -- 1. Generar y Grabar el Documento
      --
      v_documento_id := com_pkg.obtn_comped_doc_anu_pdf(p_segorg_id => p_segorg_id
                                                       ,p_comped_id => p_comped_id
                                                       ,p_compee_id => v_compee.ID
                                                       );
      --
      -- 2. Grabar referencia Pedido-Documento
      --
      SELECT COMPDG_ID.NEXTVAL INTO v_compdg_id FROM DUAL;
      v_compdg.ID        := v_compdg_id;
      v_compdg.COMPED_ID := p_comped_id;
      v_compdg.COMDOC_ID := v_documento_id;
      COM_PKG.COMPDG_INS(p_compdg => v_compdg);
      --
      -- 3. Transmitir el Documento al WebService
      --
      v_actuacion_identif := 'ANUSOL' || '-' || 'ANULACION DE SOLICITUD DE GASTOS N°: ' || v_comped.codigo || '/' ||  v_comped.ejercicio;
      v_respuesta_ws := COM_PKG.COMPED_INVOCAR_WS(p_compdg_id         => v_compdg_id
                                                 ,p_actuacion_identif => v_actuacion_identif
                                                 ,p_valida            => 1);
      --
      -- 4. Parseamos el resultado del Webservice
      --
      COM_PKG.COMPED_PROC_XML_ACT(p_xml       => v_respuesta_ws
                                 ,p_segorg_id => p_segorg_id
                                 ,p_resultado => v_resultado_ws
                                 ,p_motivo    => v_motivo
                                 ,p_referencia=> v_referencia);
      --
      ----------------------------------------------------------
      -- 5. Grabar Log en Envíos
      ----------------------------------------------------------
      INT_PKG.INTTPO_SET_CODIGO(p_segorg_id => p_segorg_id
                               ,p_codigo    => 'COMPED_ACTUACION');
      INT_PKG.INTTPO_GET(p_inttpo => v_inttpo);
      v_inttpo_id := v_inttpo.id;
      --
      INT_PKG.INTENV_REGISTRAR(
                     P_INTTPO_ID     => v_inttpo_id
                    ,P_INTENV_OBJETO => '<comdoc_id>'    || v_documento_id || '</comdoc_id>'
                    ,P_INTENV_OBS    => v_respuesta_ws
                    ,P_INTENV_RES    => '<return>'       || v_resultado_ws || '<return>'        ||
                                        '<actuacion_id>' || v_referencia   || '</actuacion_id>'
                    ,P_INTENE_FECHA  => sysdate
                    ,P_INTENV_ID     => v_intenv_id
      );
      --
      --
      -- 6. Cambiar Estado del Pedido a ANULADO
      --
      --
      IF instr(v_resultado_ws,'OP_COMPLETED') > 0 THEN
         --
         -- 8.A Modificar Estado del Envio a ENVIADO
         --
         SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
         v_intene.ID            := v_intene_id;
         v_intene.INTENV_ID     := v_intenv_id;
         v_intene.FECHA         := sysdate;
         v_intene.ESTADO        := 'ENV';
         v_intene.MOTIVO_ESTADO := v_motivo;
         INT_PKG.INTENE_INS(p_intene => v_intene);
         --
      ELSE
         --
         -- 8.B Modificar Estado del Envio ERROR
         --
         SELECT INTENE_ID.NEXTVAL INTO v_intene_id FROM DUAL;
         v_intene.ID            := v_intene_id;
         v_intene.INTENV_ID     := v_intenv_id;
         v_intene.FECHA         := sysdate;
         v_intene.ESTADO        := 'ERR';
         v_intene.MOTIVO_ESTADO := v_motivo;
         INT_PKG.INTENE_INS(p_intene => v_intene);
         --
      END IF;
      --
      p_intenv_id := v_intenv_id;
      --
EXCEPTION WHEN others THEN
   raise_application_error(-20000,'No se ha podido ANULAR la Solicitud de Gasto',true);
END;
PROCEDURE COMPEL_GET
 (P_COMPEL OUT COM_PEDIDOS_CTL%ROWTYPE
 )
 IS
begin
  p_compel := v_compel;
end;
PROCEDURE COMPEL_INI
 IS
begin
  v_compel:= null;
end;
/* Isertar registro en COM_PEDIDOS_CTL. */
PROCEDURE COMPEL_INS
 (P_COMPEL IN COM_PEDIDOS_CTL%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_PEDIDOS_CTL
  ( ID
  ,COMPED_ID
  ,TIPO_CONTROL
  ,FECHA
  ,EJECUTADO_SN
  ,COMENTARIO
  ,DATE_CREATED
  ,CREATED_BY
  ,DATE_MODIFIED
  ,MODIFIED_BY
  ,RESULTADO
  ,LOG_WS)
  values
  ( p_compel.ID
  ,p_compel.COMPED_ID
  ,p_compel.TIPO_CONTROL
  ,p_compel.FECHA
  ,p_compel.EJECUTADO_SN
  ,p_compel.COMENTARIO
  ,p_compel.DATE_CREATED
  ,p_compel.CREATED_BY
  ,p_compel.DATE_MODIFIED
  ,p_compel.MODIFIED_BY
  ,p_compel.RESULTADO
  ,p_compel.LOG_WS
  );
  --
END;
/* Seteo la variable v_comped */
PROCEDURE COMPEL_SET
 (P_ID IN NUMBER
 )
 IS
CURSOR cr_compel IS
  SELECT *
  FROM COM_PEDIDOS_CTL COMPEL
  WHERE COMPEL.ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  v_compel := NULL;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_compel;
  FETCH cr_compel INTO v_compel;
  CLOSE cr_compel;
  --
END;
PROCEDURE COMPRE_SET
 (P_ID IN NUMBER
 )
 IS
CURSOR cr_dat IS
  SELECT *
  FROM COM_PROVEEDORES_EST
  WHERE ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  v_comprv := NULL;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_dat;
  FETCH cr_dat INTO v_compre;
  CLOSE cr_dat;
  --
END;
PROCEDURE COMPRE_GET
 (P_COMPRE OUT COM_PROVEEDORES_EST%ROWTYPE
 )
 IS
begin
  p_compre := v_compre;
end;
PROCEDURE COMPRE_INI
 IS
begin
  v_compre := null;
end;
FUNCTION COMPRE_OBTN_ID
 (P_COMPRV_ID IN NUMBER
 ,P_FECHA IN DATE := sysdate
 )
 RETURN NUMBER
 IS
--
  CURSOR cr_compre_baj IS
  SELECT COMPRE3.ID, COMPRE3.ESTADO
  FROM COM_PROVEEDORES_EST COMPRE3
  WHERE COMPRE3.ID = (
  SELECT MAX(COMPRE.ID) ID
  FROM COM_PROVEEDORES_EST COMPRE
  WHERE COMPRE.FECHA_VIGENCIA = (SELECT MAX(FECHA_VIGENCIA)
                                 FROM COM_PROVEEDORES_EST COMPRE2
                                 WHERE COMPRE2.COMPRV_ID = p_comprv_id
                                   AND COMPRE2.SITUACION = 'VAL'
                                   AND COMPRE2.ESTADO IN ('BAJ','HAB')
                                   AND p_fecha BETWEEN COMPRE2.FECHA_VIGENCIA AND NVL(COMPRE2.FECHA_VALIDEZ,SYSDATE)
                                )
  AND COMPRE.COMPRV_ID = p_comprv_id
  AND COMPRE.SITUACION = 'VAL'
  AND COMPRE.ESTADO IN ('BAJ','HAB')
  AND p_fecha BETWEEN COMPRE.FECHA_VIGENCIA AND NVL(COMPRE.FECHA_VALIDEZ,SYSDATE));
  --
  CURSOR cr_compre_sus IS
  SELECT MAX(COMPRE.ID) ID
  FROM COM_PROVEEDORES_EST COMPRE
  WHERE NVL(COMPRE.FECHA_VALIDEZ,SYSDATE) = (SELECT MAX(NVL(FECHA_VALIDEZ,SYSDATE))
                                FROM COM_PROVEEDORES_EST COMPRE2
                                WHERE COMPRE2.COMPRV_ID = p_comprv_id
                                  AND COMPRE2.SITUACION = 'VAL'
                                  AND COMPRE2.ESTADO = 'SUS'
                                  AND p_fecha BETWEEN COMPRE2.FECHA_VIGENCIA AND NVL(COMPRE2.FECHA_VALIDEZ,SYSDATE)
                                )
  AND COMPRE.COMPRV_ID = p_comprv_id
  AND COMPRE.SITUACION = 'VAL'
  AND COMPRE.ESTADO = 'SUS'
  AND p_fecha BETWEEN COMPRE.FECHA_VIGENCIA AND NVL(COMPRE.FECHA_VALIDEZ,SYSDATE);
  --
  CURSOR cr_compre IS
  SELECT MAX(COMPRE.ID) ID
  FROM COM_PROVEEDORES_EST COMPRE
  WHERE COMPRE.FECHA_VIGENCIA = (SELECT MAX(FECHA_VIGENCIA)
                                FROM COM_PROVEEDORES_EST COMPRE2
                                WHERE COMPRE2.COMPRV_ID = p_comprv_id
                                  AND COMPRE2.SITUACION = 'VAL'
                                  AND COMPRE2.ESTADO NOT IN ('SUS','BAJ')
                                  AND p_fecha BETWEEN COMPRE2.FECHA_VIGENCIA AND NVL(COMPRE2.FECHA_VALIDEZ,SYSDATE)
                                )
    AND COMPRE.COMPRV_ID = p_comprv_id
    AND COMPRE.SITUACION = 'VAL'
    AND COMPRE.ESTADO NOT IN('SUS','BAJ')
    AND p_fecha BETWEEN COMPRE.FECHA_VIGENCIA AND NVL(COMPRE.FECHA_VALIDEZ,SYSDATE);
  --
  v_retorno NUMBER;
  v_compre_estado COM_PROVEEDORES_EST.ESTADO%type;
  --
BEGIN
  --
  OPEN cr_compre_baj;
  FETCH cr_compre_baj INTO v_retorno, v_compre_estado;
  CLOSE cr_compre_baj;
  --
  IF v_compre_estado = 'BAJ' and v_retorno IS NOT NULL THEN
    RETURN v_retorno;
  else
    v_retorno := NULL;
  END IF;
  --
  OPEN cr_compre_sus;
  FETCH cr_compre_sus INTO v_retorno;
  CLOSE cr_compre_sus;
  --
  IF v_retorno IS NOT NULL THEN
    RETURN v_retorno;
  END IF;
  --
  OPEN cr_compre;
  FETCH cr_compre INTO v_retorno;
  CLOSE cr_compre;
  --
  RETURN v_retorno;
  --
END;
PROCEDURE COMPRE_ANULAR_VLD
 (P_COMPRE_ID IN NUMBER
 ,P_MOTIVO_SITUACION IN VARCHAR2
 )
 IS
v_compre_vld  com_proveedores_est%rowtype;
  v_compre_act  com_proveedores_est%rowtype;
  CURSOR cr_dat (p_comprv_id in number) is
  select 1
  from com_proveedores_est
  where comprv_id = p_comprv_id
    and situacion = 'VAL'
    and id <> p_compre_id;
  v_dummy number;
  --
begin
  -- Verificar los parametros obligatorios
  if p_compre_id is null then
    raise_application_error(-20000,'El Identificador de Estado no ha sido indicado y es un dato obligatorio',true);
  elsif p_motivo_situacion is null then
    raise_application_error(-20000,'El Motivo no ha sido indicado y es un dato obligatorio',true);
  end if;
  -- Verificar los valores de los parametros
  COMPRE_SET(p_id => p_compre_id);
  COMPRE_GET(p_compre => v_compre_vld);
  COMPRE_INI;
  if v_compre_vld.ID is null then
    raise_application_error(-20000,'El Proveedor indicado indicado es incorrecto',true);
  end if;
  -- Verificar si el estado existe
  COMPRE_SET(p_id => COMPRE_OBTN_ID(p_comprv_id => v_compre_vld.comprv_id));
  COMPRE_GET(p_compre => v_compre_vld);
  COMPRE_INI;
  --
  if v_compre_vld.ID is null then
    raise_application_error(-20000,'El Identificador '||to_char(p_compre_id)||'de Estado del Proveedor indicado es incorrecto',true);
  end if;
  -- Verificar que el estado se encuentra vigente
  if v_compre_vld.SITUACION = 'ANU' then
    raise_application_error(-20000,'El estado del proveedor indicado ya se encuentra ANULADO.',true);
  end if;
  --
  -- Verificar que el estado que se intenta anular no sea el último disponible
  open cr_dat(p_comprv_id => v_compre_vld.COMPRV_ID);
  fetch cr_dat into v_dummy;
  if cr_dat%notfound then
    close cr_dat;
    raise_application_error(-20000,'Ha intentado anular el primer estado del Proveedor, esta operación no se encuentra permitida.',true);
  end if;
  close cr_dat;
  --
  -- Obtener el estado actual
  COMPRE_SET(p_id => COMPRE_OBTN_ID(p_comprv_id => v_compre_vld.comprv_id));
  COMPRE_GET(p_compre => v_compre_act);
  COMPRE_INI;
  -- Verificar sea el estado actual el que se intenta anular
  if v_compre_vld.ID <> v_compre_act.ID then
    raise_application_error(-20000,'Solo puede anular el estado ACTUAL del Proveedor, el estado que intenta anular no es el actual.',true);
  end if;
  --
end;
/* Anular un registro del Estado de Proveedores */
PROCEDURE COMPRE_ANULAR
 (P_COMPRE_ID IN NUMBER
 ,P_MOTIVO_SITUACION IN VARCHAR2
 )
 IS
begin
  -- Validar operacion
  COMPRE_ANULAR_VLD(p_compre_id        => p_compre_id
                   ,p_motivo_situacion => p_motivo_situacion);
  -- Realizar la operación
  UPDATE COM_PROVEEDORES_EST
  SET   SITUACION = 'ANU'
      , MOTIVO_SITUACION = p_motivo_situacion
  WHERE ID = p_compre_id;
  --
end;
/* Alta de Responsable de Proveedor */
PROCEDURE COMPRS_ALTA
 (P_SEGORG_CODIGO IN SEG_ORGANIZACIONES.CODIGO%TYPE
 ,P_COMPRV_ID IN COM_PROVEEDORES.ID%TYPE
 ,P_COMRST_ID IN COM_RESPONSABLES_TIPOS.ID%TYPE
 ,P_SEGPRS_NOMBRE IN COM_RESPONSABLES.NOMBRE%TYPE
 ,P_SEGPRS_TIPO_DOCUMENTO IN COM_RESPONSABLES.TIPO_DOCUMENTO%TYPE
 ,P_SEGPRS_NUMERO_DOCUMENTO IN COM_RESPONSABLES.NUMERO_DOCUMENTO%TYPE
 ,P_SEGPRS_EMAIL IN COM_RESPONSABLES.EMAIL%TYPE
 ,P_SEGPRS_OBSERVACIONES IN COM_RESPONSABLES.OBSERVACION%TYPE
 ,P_SEGUSU_USUARIO IN SEG_USUARIOS.USUARIO%TYPE
 ,P_SEGROL_CODIGO IN SEG_ROLES.CODIGO%TYPE
 ,P_SEGAPL_CODIGO IN SEG_APLICACIONES.CODIGO%TYPE
 ,P_SEGUSU_ID OUT NUMBER
 ,P_RESULTADO OUT VARCHAR2
 )
 IS
-- Declaración de Variables
  v_segorg SEG_ORGANIZACIONES%ROWTYPE;
  v_segusu SEG_USUARIOS%ROWTYPE;
  v_comres COM_RESPONSABLES%ROWTYPE;
  v_comprs COM_PROVEEDORES_RES%ROWTYPE;
  v_segusu_contrasenia VARCHAR(30) := NULL;
BEGIN
   p_resultado := NULL;
   -- Si se pasa la organizacion Obtener el id de la organización
   IF p_segorg_codigo IS NOT NULL THEN
    SEG_PKG.SET_SEGORG_CODIGO(p_codigo => p_segorg_codigo);
    SEG_PKG.GET_SEGORG(v_segorg);
    IF v_segorg.ID IS NULL THEN
       p_resultado := 'El Codigo de Organización no corresponde a una Organización existente';
    END IF;
   ELSE
    -- Si no se pasa la organización, Obtener el id de la organizacion del usuario
    SEG_PKG.SET_SEGUSU_USUARIO(p_USUARIO => v('APP_USER'));
    SEG_PKG.GET_SEGUSU(v_segusu);
    SEG_PKG.SET_SEGORG(p_id => v_segusu.segorg_id);
    SEG_PKG.GET_SEGORG(v_segorg);
    IF v_segorg.ID IS NULL THEN
       p_resultado := 'El Codigo de Organización del Usuario Conectado no corresponde a una Organización existente';
    END IF;
   --
  END IF;
   -- Crear el Usuario (1)  -> v_resultado, v_segusu_id (2)
   v_segusu_contrasenia := COM_PKG.OBTN_CONTRASENIA(p_nombre => p_segprs_nombre
                                                   ,p_numero_documento => p_segprs_numero_documento);
   IF p_resultado IS NULL THEN
    SEG_PKG.SEGUSU_CREAR(
      p_segusu_usuario          => p_segusu_usuario
     ,p_segusu_contrasenia      => v_segusu_contrasenia
     ,p_segprs_observaciones    => p_segprs_observaciones
     ,p_segprs_nombre           => p_segprs_nombre
     ,p_segprs_email            => p_segprs_email
     ,p_segprs_tipo_documento   => p_segprs_tipo_documento
     ,p_segprs_numero_documento => p_segprs_numero_documento
     ,p_segorg_id               => v_segorg.ID
     ,p_segrol_codigo           => p_segrol_codigo
     ,p_segapl_codigo           => p_segapl_codigo
     ,p_resultado               => p_resultado -- SALIDA
     ,p_segusu_id               => p_segusu_id -- SALIDA
     );
    -- Crear el Responsable (2) ->
    IF (p_segusu_id IS NOT NULL) AND (p_resultado IS NULL) THEN
      -- Defino valores del Responsable
      SELECT COMRES_ID.NEXTVAL INTO v_comres.ID FROM DUAL;
      v_comres.COMRST_ID        := P_COMRST_ID;
      v_comres.TIPO_DOCUMENTO   := p_segprs_tipo_documento;
      v_comres.NUMERO_DOCUMENTO := p_segprs_numero_documento;
      v_comres.NOMBRE           := p_segprs_nombre;
      v_comres.EMAIL            := p_segprs_email;
      v_comres.OBSERVACION      := p_segprs_observaciones;
      -- Inserto el Responsable
      COMPRV_PKG.INS_COMRES(p_comres => v_comres);
      -- Buscar si el Responsable ya esta asignado al Proveedor
      COMPRV_PKG.COMPRS_SET_RESP(p_comres_id => v_comres.ID
                             ,p_segusu_id => p_segusu_id
                             ,p_comprv_id => p_comprv_id);
      COMPRV_PKG.COMPRS_GET(v_comprs);
     IF v_comprs.id IS NOT NULL THEN
        p_resultado := p_resultado||' El Responsable ya esta Activo para este Proveedor.';
     ELSE
     -- Vincular el responsable con el proveedor
     v_comprs.COMPRV_ID  := p_comprv_id;
     v_comprs.COMRES_ID  := v_comres.ID;
     v_comprs.SEGUSU_ID  := p_segusu_id;
     v_comprs.SITUACION  := 'ACT';
     v_comprs.FECHA_VIGENCIA := SYSDATE;
     v_comprs.FECHA_VALIDEZ  := NULL;
     -- Insertar el vinculo
     COMPRV_PKG.COMPRS_INS(p_comprs => v_comprs);
     --
    END IF; --DEL CREAR RESPONSABLE
   END IF; -- DEL CREAR USUARIO
  END IF;
END;
/* Dar de Baja a un Responsable de Proveedor */
PROCEDURE COMPRS_BAJA
 (P_COMPRS_ID IN COM_PROVEEDORES_RES.ID%TYPE
 ,P_RESULTADO OUT VARCHAR2
 )
 IS
v_comprs COM_PROVEEDORES_RES%ROWTYPE;
BEGIN
  p_resultado := NULL;
  COMPRV_PKG.COMPRS_SET(p_id => p_comprs_id);
  COMPRV_PKG.COMPRS_GET(v_comprs);
  IF v_comprs.ID IS NULL THEN -- Si el Responsable no existe
    p_resultado :='El Responsable no EXISTE !';
  ELSE IF v_comprs.SITUACION = 'BAJ' THEN -- Si el Responsable esta Dado de Baja
         p_resultado :='El Responsable esta Dado de Baja !';
       ELSE
         UPDATE COM_PROVEEDORES_RES
         SET SITUACION     = 'BAJ',
             FECHA_VALIDEZ = SYSDATE
         WHERE ID = v_comprs.ID;
         -- SUSPENDER EL USUARIO QUE SE CORRESPONDE AL RESPONSABLE
         SEG_PKG.SEGUSU_SUSPENDER( p_segusu_id => v_comprs.SEGUSU_ID,
                                   p_resultado => p_resultado );
       END IF;
  END IF;
END;
/* Seteo de la variable v_comprs */
PROCEDURE COMPRS_SET
 (P_ID IN COM_PROVEEDORES_RES.ID%TYPE
 )
 IS
CURSOR cr_comprs IS
  SELECT *
  FROM COM_PROVEEDORES_RES COMPRS
  WHERE COMPRS.ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  v_comprs := NULL;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comprs;
  FETCH cr_comprs INTO v_comprs;
  CLOSE cr_comprs;
  --
END;
/* Seteo de la variable v_comprs */
PROCEDURE COMPRS_SET_RESP
 (P_COMRES_ID IN COM_PROVEEDORES_RES.COMRES_ID%TYPE
 ,P_COMPRV_ID IN COM_PROVEEDORES.ID%TYPE
 ,P_SEGUSU_ID IN NUMBER
 )
 IS
CURSOR cr_comprs IS
  SELECT *
  FROM COM_PROVEEDORES_RES COMPRS
  WHERE COMPRS.COMRES_ID = p_comres_id
    AND COMPRS.SEGUSU_ID = p_segusu_id
    AND COMPRS.COMPRV_ID = p_comprv_id
    AND COMPRS.SITUACION = 'ACT';
  --
BEGIN
  -- Inicializar la variable
  v_comprs := NULL;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comprs;
  FETCH cr_comprs INTO v_comprs;
  CLOSE cr_comprs;
  --
END;
FUNCTION COMPRU_OBTN_ID
 (P_COMPRV_ID IN NUMBER
 ,P_COMRUB_ID IN NUMBER
 ,P_FECHA IN DATE := sysdate
 )
 RETURN NUMBER
 IS
cursor cr_compru is
  select max(id) id
  from com_proveedores_rubsus
  where comprv_id = p_comprv_id
    and comrub_id = p_comrub_id
    and situacion = 'VAL'
    and nvl(p_fecha,sysdate) between fecha_vigencia and nvl(fecha_validez,nvl(p_fecha,sysdate));
  --
  v_retorno number;
begin
  open cr_compru;
  fetch cr_compru into v_retorno;
  close cr_compru;
  --
  return v_retorno;
  --
end;
PROCEDURE COMPRU_GET
 (P_COMPRU OUT COM_PROVEEDORES_RUBSUS%ROWTYPE
 )
 IS
begin
  p_compru := v_compru;
end;
PROCEDURE COMPRU_INI
 IS
begin
  v_compru := null;
end;
PROCEDURE COMPRU_INS
 (P_COMPRU IN COM_PROVEEDORES_RUBSUS%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_PROVEEDORES_RUBSUS
  ( ID
   ,COMPRV_ID
   ,COMRUB_ID
   ,FECHA_VIGENCIA
   ,FECHA_VALIDEZ
   ,MOTIVO
   ,SITUACION
   ,DATE_CREATED
   ,DATE_MODIFIED
   ,CREATED_BY
   ,MODIFIED_BY)
  values
  ( p_compru.ID
   ,p_compru.COMPRV_ID
   ,p_compru.COMRUB_ID
   ,p_compru.FECHA_VIGENCIA
   ,p_compru.FECHA_VALIDEZ
   ,p_compru.MOTIVO
   ,p_compru.SITUACION
   ,p_compru.DATE_CREATED
   ,p_compru.DATE_MODIFIED
   ,p_compru.CREATED_BY
   ,p_compru.MODIFIED_BY);
  --
END;
PROCEDURE COMPRU_SET
 (P_ID IN NUMBER
 )
 IS
CURSOR cr_dat IS
  SELECT *
  FROM COM_PROVEEDORES_RUBSUS
  WHERE ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  COMPRU_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_dat;
  FETCH cr_dat INTO v_compru;
  CLOSE cr_dat;
  --
END;
/* Restablecer Contraseña */
PROCEDURE COMPRV_RESCLV
 (P_COMPRV_ID IN NUMBER
 ,P_COMRES_ID IN NUMBER
 )
 IS
CURSOR cr_comprs IS
SELECT COMRES_NOMBRE
     , COMRES_TIPO_DOCUMENTO
     , COMRES_NUMERO_DOCUMENTO
     , SEGUSU_ID
     ,COM_PKG.OBTN_CONTRASENIA(p_nombre => COMRES_NOMBRE
                              ,p_numero_documento => COMRES_NUMERO_DOCUMENTO) CONTRASENIA
 FROM COM_PROVEEDORES_RES_V COMPRS_V
WHERE COMPRS_V.COMPRV_ID = P_COMPRV_ID
  AND COMPRS_V.COMRES_ID = P_COMRES_ID;
BEGIN
 FOR v_comprs in cr_comprs LOOP
 UPDATE SEG_USUARIOS
    SET CONTRASENIA = v_comprs.contrasenia
 WHERE ID = v_comprs.segusu_id;
 END LOOP;
END;
/* Inicializar la variable v_comptt */
PROCEDURE COMPTT_INI
 IS
begin
  v_comptt := null;
end;
/* Obtener el valor de la variable v_comptt */
PROCEDURE COMPTT_GET
 (P_COMPTT OUT COM_COMPDT_COMPRT%ROWTYPE
 )
 IS
begin
  p_comptt := v_comptt;
end;
/* Insertar registro en COM_COMPDT_COMPRT */
PROCEDURE COMPTT_INS
 (P_COMPTT IN COM_COMPDT_COMPRT%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_COMPDT_COMPRT
  ( ID
   ,COMPRT_ID
   ,COMPDT_ID
   ,OBLIGATORIO_SN
   ,DATE_CREATED
   ,CREATED_BY
   ,DATE_MODIFIED
   ,MODIFIED_BY)
  values (p_comptt.ID
         ,p_comptt.COMPRT_ID
         ,p_comptt.COMPDT_ID
         ,p_comptt.OBLIGATORIO_SN
         ,p_comptt.DATE_CREATED
         ,p_comptt.CREATED_BY
         ,p_comptt.DATE_MODIFIED
         ,p_comptt.MODIFIED_BY);
  --
END;
/* Setear la varible v_comptt */
PROCEDURE COMPTT_SET
 (P_ID IN NUMBER
 )
 IS
CURSOR cr_dat IS
  SELECT *
  FROM COM_COMPDT_COMPRT
  WHERE ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  COMPTT_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_dat;
  FETCH cr_dat INTO v_comptt;
  CLOSE cr_dat;
  --
END;
/* Devuelve el registro almacenado en la variable de paquete */
PROCEDURE COMRDC_GET
 (P_COMRDC OUT COM_REPLICAS_DOC%ROWTYPE
 )
 IS
begin
  p_comrdc := v_comrdc;
end;
/* Inicializa la variable de paquete */
PROCEDURE COMRDC_INI
 IS
begin
  v_comrdc := null;
end;
/* Agrega un nuevo registro a COM_REPLICAS_DOC */
PROCEDURE COMRDC_INS
 (P_COMRDC IN COM_REPLICAS_DOC%ROWTYPE
 )
 IS
begin
  insert into COM_REPLICAS_DOC
  (
    ID
   ,COMRED_ID
   ,COMDOC_ID
   ,SITUACION
   ,FECHA_SITUACION
   ,MOTIVO_SITUACION
   ,DATE_CREATED
   ,CREATED_BY
   ,DATE_MODIFIED
   ,MODIFIED_BY
  )
  values
  (
    p_comrdc.ID
   ,p_comrdc.COMRED_ID
   ,p_comrdc.COMDOC_ID
   ,p_comrdc.SITUACION
   ,p_comrdc.FECHA_SITUACION
   ,p_comrdc.MOTIVO_SITUACION
   ,p_comrdc.DATE_CREATED
   ,p_comrdc.CREATED_BY
   ,p_comrdc.DATE_MODIFIED
   ,p_comrdc.MODIFIED_BY
  );
end;
/* Recupera un registro por su ID */
PROCEDURE COMRDC_SET
 (P_ID IN NUMBER
 )
 IS
cursor cr_comrdc is
    select *
    from   COM_REPLICAS_DOC
    where  ID = P_ID;
begin
  open cr_comrdc;
  fetch cr_comrdc into v_comrdc;
  close cr_comrdc;
end;
PROCEDURE COMREP_REPLICAR
 (P_COMCLF_ID IN NUMBER
 ,P_COMREP_ID IN NUMBER
 ,P_ORIGEN IN VARCHAR2
 ,P_COMENTARIO IN VARCHAR2
 )
 IS
CURSOR cr_comclf IS
   SELECT *
   FROM  COM_CALIFICACIONES_V COMCLF
   WHERE COMCLF.ID = P_COMCLF_ID
    AND COMCLF.SITUACION <> 'ANU';
   --
   CURSOR cr_replicas IS
   select *
   from com_replicas
   where id = P_COMREP_ID;
   --
   v_comclf          cr_comclf%ROWTYPE;
   v_com_replicas    com_replicas%ROWTYPE;
   v_com_replicas_d  com_replicas_det%ROWTYPE;

   --v_comclf_id NUMBER;
   v_prox_estado     varchar2(3);
   v_origen          varchar2(3);
   v_comentario      varchar2(4000) := null;
   v_retorno         varchar2(400)  := null;
   --
BEGIN
   OPEN cr_comclf;
   FETCH cr_comclf INTO v_comclf;
   CLOSE cr_comclf;
   --
   IF v_comclf.ID IS NULL THEN
      v_retorno := 'La calificacion especificada no existe';
   END IF;
   --
   IF COM_PKG.COMREP_REPLICAR_SN(v_comclf.COMOCM_ID, P_ORIGEN) = 'NO' THEN
      v_retorno := 'No se encuentra habilitado para ingresar un descargo';
   END IF;
   --
   open cr_replicas;
   fetch cr_replicas into v_com_replicas;
   close cr_replicas;
   --
   if v_com_replicas.ID is null then
      --
      select COMREP_ID.NEXTVAL into v_com_replicas.ID from dual;
      --
      v_com_replicas.SEGORG_ID        := v_comclf.SEGORG_ID;
      v_com_replicas.COMOCM_ID        := v_comclf.COMOCM_ID;
      v_com_replicas.COMCLF_ID        := v_comclf.ID;
      v_com_replicas.COMECO_ID        := v_comclf.COMPRV_ID;
      v_com_replicas.COMPRV_ID        := v_comclf.COMECO_ID;
      v_com_replicas.FECHA_GENERACION := SYSDATE;
      v_com_replicas.COMENTARIO       := ' ';
      v_com_replicas.ESTADO           := 'NUE';
      v_com_replicas.FECHA_ESTADO     := SYSDATE;
      v_prox_estado                   := 'NUE';
      v_origen                        := 'PRV';
      --
      COM_PKG.COMREP_INS(p_comrep  => v_com_replicas);
   end if;
   --
   case v_com_replicas.ESTADO
      when 'NUE' then
         v_prox_estado := 'PRE';
      when 'PRE' then
         v_prox_estado := 'REP';
      when 'REP' then
         v_prox_estado := 'RES';
         v_comentario  := P_COMENTARIO;
   end case;
   --
   IF v_com_replicas.ID IS NOT NULL THEN
      update com_replicas
      set ESTADO = v_prox_estado
        , COMENTARIO = v_comentario
      where id = v_com_replicas.ID;
      --
      v_com_replicas_d.COMREP_ID  := v_com_replicas.ID;
      v_com_replicas_d.FECHA      := SYSDATE;
      v_com_replicas_d.ORIGEN     := P_ORIGEN;
      v_com_replicas_d.COMENTARIO := P_COMENTARIO;
      v_com_replicas_d.SITUACION  := 'VIG';
      --
      COM_PKG.COMRED_INS(p_comred => v_com_replicas_d);
   ELSE
      raise_application_error(-20000,'Error al generar el descargo o descargo inexistente.',true);
   END IF;
   --
EXCEPTION
   WHEN OTHERS THEN
      raise_application_error(-20000,'Se ha producido una excepción al generar el descargo.',true);
END;
/* Seteo de la variable v_comred */
PROCEDURE COMRED_SET
 (P_ID IN COM_REPLICAS_DET.ID%TYPE
 )
 IS
CURSOR cr_comred IS
  SELECT *
  FROM COM_REPLICAS_DET COMRED
  WHERE COMRED.ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  v_comred := NULL;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comred;
  FETCH cr_comred INTO v_comred;
  CLOSE cr_comred;
  --
END;
/* Obtener el valor de la variable v_comred */
PROCEDURE COMRED_GET
 (P_COMRED OUT COM_REPLICAS_DET%ROWTYPE
 )
 IS
BEGIN
  p_comred := v_comred;
END;
PROCEDURE COMRED_INI
 IS
begin
  v_comred := null;
end;
/* Insertar registro en COM_REPLICAS_DET */
PROCEDURE COMRED_INS
 (P_COMRED IN COM_REPLICAS_DET%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_REPLICAS_DET
  ( ID
   ,COMREP_ID
   ,FECHA
   ,DESTINO
   ,ORIGEN
   ,COMENTARIO
   ,SITUACION
   ,DATE_CREATED
   ,CREATED_BY
   ,DATE_MODIFIED
   ,MODIFIED_BY
   )
   values
   (
    p_comred.ID
   ,p_comred.COMREP_ID
   ,p_comred.FECHA
   ,p_comred.DESTINO
   ,p_comred.ORIGEN
   ,p_comred.COMENTARIO
   ,p_comred.SITUACION
   ,p_comred.DATE_CREATED
   ,p_comred.CREATED_BY
   ,p_comred.DATE_MODIFIED
   ,p_comred.MODIFIED_BY
   );
  --
END;
/* Seteo de la variable v_comrep */
PROCEDURE COMREP_SET
 (P_ID IN COM_REPLICAS.ID%TYPE
 )
 IS
CURSOR cr_comrep IS
  SELECT *
  FROM COM_REPLICAS COMREP
  WHERE COMREP.ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  v_comrep := NULL;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comrep;
  FETCH cr_comrep INTO v_comrep;
  CLOSE cr_comrep;
  --
END;
/* Insertar registro en COM_REPLICAS */
PROCEDURE COMREP_INS
 (P_COMREP IN COM_REPLICAS%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_REPLICAS
  ( ID
   ,SEGORG_ID
   ,COMOCM_ID
   ,COMCLF_ID
   ,COMECO_ID
   ,COMPRV_ID
   ,FECHA_GENERACION
   ,COMENTARIO
   ,ESTADO
   ,FECHA_ESTADO
   ,DATE_CREATED
   ,CREATED_BY
   ,DATE_MODIFIED
   ,MODIFIED_BY
   )
   values (p_comrep.ID
         ,p_comrep.SEGORG_ID
         ,p_comrep.COMOCM_ID
         ,p_comrep.COMCLF_ID
         ,p_comrep.COMECO_ID
         ,p_comrep.COMPRV_ID
         ,p_comrep.FECHA_GENERACION
         ,p_comrep.COMENTARIO
         ,p_comrep.ESTADO
         ,p_comrep.FECHA_ESTADO
         ,p_comrep.DATE_CREATED
         ,p_comrep.CREATED_BY
         ,p_comrep.DATE_MODIFIED
         ,p_comrep.MODIFIED_BY
   );
  --
END;
PROCEDURE COMREP_INI
 IS
begin
  v_comrep := null;
end;
/* Obtener el valor de la variable v_comrep */
PROCEDURE COMREP_GET
 (P_COMREP OUT COM_REPLICAS%ROWTYPE
 )
 IS
BEGIN
  p_comrep := v_comrep;
END;
/* Determina y carga los Cortes segun las ponderancias definidas */
PROCEDURE COMRER_CARGA_CORTES
 (P_FECHA_MOV_DESDE IN DATE
 ,P_FECHA_MOV_HASTA IN DATE
 )
 IS
-- Declaracion de Cursores
-- Rubros por COP - CANTIDAD DE OPERACIONES
CURSOR CR_CURSOR_COP IS
SELECT  COMRCB.COMRUB_ID
       ,COUNT(DISTINCT COMOCM.COMPRV_ID) AS CANTIDAD_PROV_RUB
FROM COM_ORDENES_COMPRAS     COMOCM
    ,COM_ORDENES_COMPRAS_EST COMOCE
    ,COM_PEDIDOS             COMPED
    ,COM_RUBCOB              COMRCB
    ,COM_PROVEEDORES_RUB     COMPRR
WHERE COMOCM.ID        = COMOCE.COMOCM_ID
  AND COMOCM.COMPRV_ID = COMPRR.COMPRV_ID
  AND COMOCM.COMPED_ID = COMPED.ID
  AND COMPED.COMCOB_ID = COMRCB.COMCOB_ID
  AND COMRCB.SITUACION = 'VIG'
  AND(    COMOCE.ESTADO  IN ('APR','CON','NOC')
      AND COMOCE.SITUACION = 'VAL'
      AND COMOCE.FECHA BETWEEN P_FECHA_MOV_DESDE AND P_FECHA_MOV_HASTA
      )
GROUP BY COMRCB.COMRUB_ID
ORDER BY COMRCB.COMRUB_ID;
--
-- Rubros por POC - PORCENTAJE DE OPERACIONES CONCRETADAS
CURSOR CR_CURSOR_POC IS
SELECT  COMRCB.COMRUB_ID
       ,COUNT(DISTINCT COMOCM.COMPRV_ID) AS CANTIDAD_PROV_RUB
       ,COUNT(DISTINCT COMOCM.ID) AS CANTIDAD_OCM_CON
FROM COM_ORDENES_COMPRAS     COMOCM
    ,COM_ORDENES_COMPRAS_EST COMOCE
    ,COM_PEDIDOS             COMPED
    ,COM_RUBCOB              COMRCB
    ,COM_PROVEEDORES_RUB     COMPRR
WHERE COMOCM.ID        = COMOCE.COMOCM_ID
  AND COMOCM.COMPRV_ID = COMPRR.COMPRV_ID
  AND COMOCM.COMPED_ID = COMPED.ID
  AND COMPED.COMCOB_ID = COMRCB.COMCOB_ID
  AND COMRCB.SITUACION = 'VIG'
  AND(    COMOCE.ESTADO    = 'CON'
      AND COMOCE.SITUACION = 'VAL'
      AND COMOCE.FECHA BETWEEN P_FECHA_MOV_DESDE AND P_FECHA_MOV_HASTA
      )
GROUP BY COMRCB.COMRUB_ID
ORDER BY COMRCB.COMRUB_ID;
--
-- Rubros por POP - PORCENTAJE DE OPERACIONES CON CALIFICACION POSITIVA
CURSOR CR_CURSOR_POP IS
SELECT  COMRCB.COMRUB_ID
       ,COUNT(DISTINCT COMOCM.COMPRV_ID) AS CANTIDAD_PROV_POSITIVOS
       ,COUNT(DISTINCT COMOCM.ID) AS CANTIDAD_COMOCM_POS
FROM COM_ORDENES_COMPRAS     COMOCM
    ,COM_PEDIDOS             COMPED
    ,COM_RUBCOB              COMRCB
    ,COM_PROVEEDORES_RUB     COMPRR
    ,COM_CALIFICACIONES      COMCLF
WHERE COMOCM.COMPRV_ID = COMPRR.COMPRV_ID
  AND COMOCM.COMPED_ID = COMPED.ID
  AND COMOCM.ID        = COMCLF.COMOCM_ID
  AND COMPED.COMCOB_ID = COMRCB.COMCOB_ID
  AND COMRCB.SITUACION = 'VIG'
  AND(    COMCLF.CALIFICACION = 1
      AND COMCLF.SITUACION = 'VAL'
      AND COMCLF.FECHA BETWEEN P_FECHA_MOV_DESDE AND P_FECHA_MOV_HASTA
      )
GROUP BY COMRCB.COMRUB_ID
ORDER BY COMRCB.COMRUB_ID, CANTIDAD_PROV_POSITIVOS;
--
-- Rubros por PIM - PORCENTAJE DE IMPORTE DE OPERACIONES POSITIVAS
CURSOR CR_CURSOR_PIM IS
SELECT COMRCB.COMRUB_ID
      ,COUNT(DISTINCT COMOCM.COMPRV_ID) AS CANTIDAD_PROV_RUB
      ,SUM(COMADD.CANTIDAD_ADJUDICADA*COMCZD.PRECIO_UNITARIO_FINAL)  AS MONTO_TOTAL
FROM COM_ORDENES_COMPRAS       COMOCM
    ,COM_ORDENES_COMPRAS_DET   COMOCD
    ,COM_ADJUDICACIONES_DET    COMADD
    ,COM_PEDIDOS_DETALLES      COMPET
    ,COM_COTIZACIONES_DETALLES COMCZD
    ,COM_CATALOGO_CLASES       COMCCL
    ,COM_CATALOGO_OBJETOS      COMCOB
    ,COM_CALIFICACIONES        COMCLF
    ,COM_RUBCOB                COMRCB
WHERE  COMOCM.ID        = COMOCD.COMOCM_ID
   AND COMOCM.ID        = COMCLF.COMOCM_ID
   AND COMOCD.COMADD_ID = COMADD.ID
   AND COMOCD.COMPET_ID = COMPET.ID
   AND COMOCD.COMCZD_ID = COMCZD.ID
   AND COMPET.COMCCL_ID = COMCCL.ID(+)
   AND COMCCL.COMCOB_ID = COMCOB.ID(+)
   AND COMCCL.COMCOB_ID = COMRCB.COMCOB_ID
   AND(COMCLF.CALIFICACION = 1
      AND COMCLF.SITUACION = 'VAL'
      AND COMCLF.FECHA BETWEEN P_FECHA_MOV_DESDE AND P_FECHA_MOV_HASTA
      )
GROUP BY COMRCB.COMRUB_ID
ORDER BY COMRCB.COMRUB_ID;
--
v_FECHA_VIGENCIA DATE := TO_CHAR(P_FECHA_MOV_HASTA,'DD/MM/YYYY');
--
BEGIN
  -- Inicializamos Cortes de todos los Rubros en cero "0"
  COMRER_CORTES_INIC(P_FECHA_VIGENCIA => v_FECHA_VIGENCIA);
  --
  -- Recorremos los Rubros por COP - CANTIDAD DE OPERACIONES
  FOR v_cr_cursor_COP IN cr_cursor_COP LOOP
   -- COP - CANTIDAD DE OPERACIONES
   COMRER_CORTES_COP(P_COMRUB_ID   => v_cr_cursor_COP.COMRUB_ID
                    ,P_CANT_PRV_RUB    => v_cr_cursor_COP.CANTIDAD_PROV_RUB
                    ,P_FECHA_VIGENCIA => v_FECHA_VIGENCIA
                    ,P_FECHA_MOV_DESDE => P_FECHA_MOV_DESDE
                    ,P_FECHA_MOV_HASTA => P_FECHA_MOV_HASTA
                     );
   END LOOP;
  --
  -- Recorremos los Rubros por POC - PORCENTAJE DE OPERACIONES CONCRETADAS
  FOR v_cr_cursor_POC IN cr_cursor_POC LOOP
   -- POC - PORCENTAJE DE OPERACIONES CONCRETADAS
   COMRER_CORTES_POC(P_COMRUB_ID   => v_cr_cursor_POC.COMRUB_ID
                    ,P_CANT_PRV_RUB    => v_cr_cursor_POC.CANTIDAD_PROV_RUB
                    ,P_FECHA_VIGENCIA => v_FECHA_VIGENCIA
                    ,P_FECHA_MOV_DESDE => P_FECHA_MOV_DESDE
                    ,P_FECHA_MOV_HASTA => P_FECHA_MOV_HASTA
                     );
  END LOOP;
  --
  -- Recorremos los Rubros por POP - PORCENTAJE DE OPERACIONES CON CALIFICACION POSITIVA
  FOR v_cr_cursor_POP IN cr_cursor_POP LOOP
   -- POP - PORCENTAJE DE OPERACIONES CON CALIFICACION POSITIVA
   COMRER_CORTES_POP(P_COMRUB_ID   => v_cr_cursor_POP.COMRUB_ID
                    ,P_CANT_PRV_RUB    => v_cr_cursor_POP.CANTIDAD_PROV_POSITIVOS
                    ,P_FECHA_VIGENCIA => v_FECHA_VIGENCIA
                    ,P_FECHA_MOV_DESDE => P_FECHA_MOV_DESDE
                    ,P_FECHA_MOV_HASTA => P_FECHA_MOV_HASTA
                     );
   END LOOP;
  --
  -- Recorremos los Rubros por PIM - PORCENTAJE DE IMPORTE DE OPERACIONES POSITIVAS
   FOR V_cr_cursor_PIM IN cr_cursor_PIM LOOP
   -- PIM - PORCENTAJE DE IMPORTE DE OPERACIONES POSITIVAS
   COMRER_CORTES_PIM(P_COMRUB_ID    => v_cr_cursor_PIM.COMRUB_ID
                    ,P_CANT_PRV_RUB     => v_cr_cursor_PIM.CANTIDAD_PROV_RUB
                    ,P_FECHA_VIGENCIA => v_FECHA_VIGENCIA
                    ,P_FECHA_MOV_DESDE  => P_FECHA_MOV_DESDE
                    ,P_FECHA_MOV_HASTA  => P_FECHA_MOV_HASTA
                     );
  END LOOP;
  --
END;
/* Inicializa los Cortes con valor 0 en todos los rubros */
PROCEDURE COMRER_CORTES_INIC
 (P_FECHA_VIGENCIA IN DATE
 )
 IS
-- Declaracion de Cursores
CURSOR cr_cursor IS
 SELECT DISTINCT COMRUB_ID
   FROM COM_RUBCOB
  WHERE SITUACION = 'VIG'
  ORDER BY COMRUB_ID;
--
CURSOR cr_comrer_tipos IS
 SELECT RV_LOW_VALUE TIPO
   FROM CG_REF_CODES
  WHERE RV_DOMAIN = 'COM_REPUTACION_RUB.TIPO';
--
-- Declaración de variables
 v_comrer COM_REPUTACION_RUB%ROWTYPE;
 v_FECHA_VIGENCIA DATE := TO_CHAR(P_FECHA_VIGENCIA,'DD/MM/YYYY');
 --
BEGIN
  --
  FOR v_cr_cursor IN cr_cursor LOOP
    --
    FOR v_comrer_tipos IN cr_comrer_tipos LOOP
      --
      FOR v_posicion IN 1..5 LOOP
         -- Obtener el 1er corte e insertarlo en COM_REPUTACION_RUB
         v_comrer.COMRUB_ID      := v_cr_cursor.comrub_id;
         v_comrer.FECHA_VIGENCIA := v_FECHA_VIGENCIA;
         v_comrer.TIPO     := v_comrer_tipos.tipo;
         v_comrer.POSICION := v_posicion;
         v_comrer.VALOR    := 0;
         --
         INS_COMRER(p_comrer => v_comrer);
         --
      END LOOP;
      --
    END LOOP;
    --
  END LOOP;
  --
EXCEPTION
  WHEN OTHERS THEN
    raise_application_error(-20000,'Error en Inicializar Cortes.', TRUE);
END;
/* Determina y carga los Cortes COP segun las ponderancias definidas */
PROCEDURE COMRER_CORTES_COP
 (P_COMRUB_ID IN COM_REPUTACION_RUB.COMRUB_ID%TYPE
 ,P_CANT_PRV_RUB IN NUMBER
 ,P_FECHA_VIGENCIA IN DATE
 ,P_FECHA_MOV_DESDE IN DATE
 ,P_FECHA_MOV_HASTA IN DATE
 )
 IS
-- Declaracion de Cursores
CURSOR cr_cursor IS
SELECT  COMRCB.COMRUB_ID
       ,COMOCM.COMPRV_ID
       ,COUNT(COMOCM.COMPRV_ID) AS CANTIDAD_COMOCM_APR
FROM COM_ORDENES_COMPRAS     COMOCM
    ,COM_ORDENES_COMPRAS_EST COMOCE
    ,COM_PEDIDOS             COMPED
    ,COM_RUBCOB              COMRCB
    ,COM_PROVEEDORES_RUB     COMPRR
WHERE COMOCM.ID        = COMOCE.COMOCM_ID
  AND COMOCM.COMPRV_ID = COMPRR.COMPRV_ID
  AND COMOCM.COMPED_ID = COMPED.ID
  AND COMPED.COMCOB_ID = COMRCB.COMCOB_ID
  AND COMRCB.SITUACION = 'VIG'
  AND(    COMOCE.ESTADO   IN ('APR','CON','NOC')
      AND COMOCE.SITUACION = 'VAL'
      AND COMOCE.FECHA BETWEEN P_FECHA_MOV_DESDE AND P_FECHA_MOV_HASTA
      )
  AND COMRCB.COMRUB_ID = P_COMRUB_ID
GROUP BY COMRCB.COMRUB_ID, COMOCM.COMPRV_ID
ORDER BY COMRCB.COMRUB_ID, CANTIDAD_COMOCM_APR;
--
-- Declaración de variables
 v_FECHA_VIGENCIA DATE := TO_CHAR(P_FECHA_VIGENCIA,'DD/MM/YYYY');
 v_INICIO NUMBER := 1;
 v_CORTE1 NUMBER := 1;
 v_CORTE2 NUMBER := 1;
 v_CORTE3 NUMBER := 1;
 v_CORTE4 NUMBER := 1;
 v_CORTE5 NUMBER := 1;
 v_PONDERANCIA_1 NUMBER := SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => 'COMADM_COMRER_PONDERANCIA1',P_SEGORG_ID => SEG_PKG.OBTN_ORGUSU(NVL (v ('APP_USER'), USER)));
 v_PONDERANCIA_2 NUMBER := SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => 'COMADM_COMRER_PONDERANCIA2',P_SEGORG_ID => SEG_PKG.OBTN_ORGUSU(NVL (v ('APP_USER'), USER)));
 v_PONDERANCIA_3 NUMBER := SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => 'COMADM_COMRER_PONDERANCIA3',P_SEGORG_ID => SEG_PKG.OBTN_ORGUSU(NVL (v ('APP_USER'), USER)));
 v_PONDERANCIA_4 NUMBER := SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => 'COMADM_COMRER_PONDERANCIA4',P_SEGORG_ID => SEG_PKG.OBTN_ORGUSU(NVL (v ('APP_USER'), USER)));
 --
 v_comrer COM_REPUTACION_RUB%ROWTYPE;
 v_indice NUMBER := 1;
 v_tipo  VARCHAR2(3) := 'COP';
 --
BEGIN
   -- Obtener cortes
   v_CORTE1 := FLOOR(((p_Cant_PRV_RUB * v_PONDERANCIA_1)/100)+v_INICIO);
   v_CORTE2 := FLOOR(((p_Cant_PRV_RUB * (v_PONDERANCIA_1+v_PONDERANCIA_2))/100)+v_INICIO);
   v_CORTE3 := FLOOR(((p_Cant_PRV_RUB * (v_PONDERANCIA_1+v_PONDERANCIA_2
                                        +v_PONDERANCIA_3))/100)+v_INICIO);
   v_CORTE4 := FLOOR(((p_Cant_PRV_RUB * (v_PONDERANCIA_1+v_PONDERANCIA_2
                                        +v_PONDERANCIA_3+v_PONDERANCIA_4))/100)+v_INICIO);
  --
  FOR v_cr_cursor IN cr_cursor LOOP
    BEGIN
      IF v_indice = v_INICIO THEN
         -- Obtener el 1er valor y Actualizarlo en COM_REPUTACION_RUB
         UPDATE COM_REPUTACION_RUB
            SET VALOR = v_cr_cursor.CANTIDAD_COMOCM_APR
          WHERE COMRUB_ID = p_comrub_id
            AND FECHA_VIGENCIA = v_FECHA_VIGENCIA
            AND TIPO = v_tipo
            AND POSICION = 1;
         --
      END IF;
      IF v_indice = v_CORTE1 THEN
         -- Obtener el 2do valor y Actualizarlo en COM_REPUTACION_RUB
         UPDATE COM_REPUTACION_RUB
            SET VALOR = v_cr_cursor.CANTIDAD_COMOCM_APR
          WHERE COMRUB_ID = p_comrub_id
            AND FECHA_VIGENCIA = v_FECHA_VIGENCIA
            AND TIPO = v_tipo
            AND POSICION = 2;
         --
      END IF;
      IF v_indice = v_CORTE2 THEN
         -- Obtener el 3er valor y Actualizarlo en COM_REPUTACION_RUB
         UPDATE COM_REPUTACION_RUB
            SET VALOR = v_cr_cursor.CANTIDAD_COMOCM_APR
          WHERE COMRUB_ID = p_comrub_id
            AND FECHA_VIGENCIA = v_FECHA_VIGENCIA
            AND TIPO = v_tipo
            AND POSICION = 3;
         --
      END IF;
      IF v_indice = v_CORTE3 THEN
         -- Obtener el 4to valor y Actualizarlo en COM_REPUTACION_RUB
         UPDATE COM_REPUTACION_RUB
            SET VALOR = v_cr_cursor.CANTIDAD_COMOCM_APR
          WHERE COMRUB_ID = p_comrub_id
            AND FECHA_VIGENCIA = v_FECHA_VIGENCIA
            AND TIPO = v_tipo
            AND POSICION = 4;
         --
      END IF;
      IF v_indice = v_CORTE4 THEN
         -- Obtener el 5to valor y Actualizarlo en COM_REPUTACION_RUB
         UPDATE COM_REPUTACION_RUB
            SET VALOR = v_cr_cursor.CANTIDAD_COMOCM_APR
          WHERE COMRUB_ID = p_comrub_id
            AND FECHA_VIGENCIA = v_FECHA_VIGENCIA
            AND TIPO = v_tipo
            AND POSICION = 5;
         --
      END IF;
     v_Indice := v_Indice+1;
    --
     END;
    END LOOP;
   --
EXCEPTION
  WHEN OTHERS THEN
    raise_application_error(-20000,'Error es Cortes COP ', TRUE);
END;
/* Determina y carga los Cortes PIM segun las ponderancias definidas */
PROCEDURE COMRER_CORTES_PIM
 (P_COMRUB_ID IN COM_REPUTACION_RUB.COMRUB_ID%TYPE
 ,P_CANT_PRV_RUB IN NUMBER
 ,P_FECHA_VIGENCIA IN DATE
 ,P_FECHA_MOV_DESDE IN DATE
 ,P_FECHA_MOV_HASTA IN DATE
 )
 IS
-- Declaracion de Cursores
CURSOR cr_cursor IS
SELECT COMRCB.COMRUB_ID
      ,COMOCM.COMPRV_ID COMPRV_ID
      ,(OBTN_VALOR_PIM(
                 P_COMRUB_ID => COMRCB.COMRUB_ID
                ,P_COMPRV_ID => COMOCM.COMPRV_ID
                ,P_FECHA_MOV_DESDE => P_FECHA_MOV_DESDE
                ,P_FECHA_MOV_HASTA => P_FECHA_MOV_HASTA
                       )) PORCENTAJE_PIM
FROM COM_ORDENES_COMPRAS       COMOCM
    ,COM_ORDENES_COMPRAS_DET   COMOCD
    ,COM_ADJUDICACIONES_DET    COMADD
    ,COM_PEDIDOS_DETALLES      COMPET
    ,COM_COTIZACIONES_DETALLES COMCZD
    ,COM_CATALOGO_CLASES       COMCCL
    ,COM_CATALOGO_OBJETOS      COMCOB
    ,COM_CALIFICACIONES        COMCLF
    ,COM_RUBCOB                COMRCB
WHERE  COMOCM.ID        = COMOCD.COMOCM_ID
   AND COMOCM.ID        = COMCLF.COMOCM_ID
   AND COMOCD.COMADD_ID = COMADD.ID
   AND COMOCD.COMPET_ID = COMPET.ID
   AND COMOCD.COMCZD_ID = COMCZD.ID
   AND COMPET.COMCCL_ID = COMCCL.ID(+)
   AND COMCCL.COMCOB_ID = COMCOB.ID(+)
   AND COMCCL.COMCOB_ID = COMRCB.COMCOB_ID
   AND(COMCLF.CALIFICACION = 1
      AND COMCLF.SITUACION = 'VAL'
      AND COMCLF.FECHA BETWEEN P_FECHA_MOV_DESDE AND P_FECHA_MOV_HASTA
      )
     AND COMRCB.COMRUB_ID = P_COMRUB_ID
GROUP BY COMRCB.COMRUB_ID,COMOCM.COMPRV_ID
ORDER BY COMRCB.COMRUB_ID,PORCENTAJE_PIM;
--
-- Declaración de variables
 v_FECHA_VIGENCIA DATE := TO_CHAR(P_FECHA_VIGENCIA,'DD/MM/YYYY');
 v_INICIO NUMBER := 1;
 v_CORTE1 NUMBER := 1;
 v_CORTE2 NUMBER := 1;
 v_CORTE3 NUMBER := 1;
 v_CORTE4 NUMBER := 1;
 v_PONDERANCIA_1 NUMBER := SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => 'COMADM_COMRER_PONDERANCIA1',P_SEGORG_ID => SEG_PKG.OBTN_ORGUSU(NVL (v ('APP_USER'), USER)));
 v_PONDERANCIA_2 NUMBER := SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => 'COMADM_COMRER_PONDERANCIA2',P_SEGORG_ID => SEG_PKG.OBTN_ORGUSU(NVL (v ('APP_USER'), USER)));
 v_PONDERANCIA_3 NUMBER := SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => 'COMADM_COMRER_PONDERANCIA3',P_SEGORG_ID => SEG_PKG.OBTN_ORGUSU(NVL (v ('APP_USER'), USER)));
 v_PONDERANCIA_4 NUMBER := SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => 'COMADM_COMRER_PONDERANCIA4',P_SEGORG_ID => SEG_PKG.OBTN_ORGUSU(NVL (v ('APP_USER'), USER)));
 --
 v_comrer COM_REPUTACION_RUB%ROWTYPE;
 v_indice NUMBER := 1;
 v_tipo  VARCHAR2(3) := 'PIM';
 --
BEGIN
   -- Obtener cortes
   v_CORTE1 := FLOOR(((P_CANT_PRV_RUB * v_PONDERANCIA_1)/100)+v_INICIO);
   v_CORTE2 := FLOOR(((P_CANT_PRV_RUB * (v_PONDERANCIA_1+v_PONDERANCIA_2))/100)+v_INICIO);
   v_CORTE3 := FLOOR(((P_CANT_PRV_RUB * (v_PONDERANCIA_1+v_PONDERANCIA_2
                                        +v_PONDERANCIA_3))/100)+v_INICIO);
   v_CORTE4 := FLOOR(((P_CANT_PRV_RUB * (v_PONDERANCIA_1+v_PONDERANCIA_2
                                        +v_PONDERANCIA_3+v_PONDERANCIA_4))/100)+v_INICIO);

  FOR v_cr_cursor IN cr_cursor LOOP
    BEGIN
      IF v_indice = v_INICIO THEN
         -- Obtener el 1er valor y Actualizarlo en COM_REPUTACION_RUB
         UPDATE COM_REPUTACION_RUB
            SET VALOR = v_cr_cursor.PORCENTAJE_PIM
          WHERE COMRUB_ID = p_comrub_id
            AND FECHA_VIGENCIA = v_FECHA_VIGENCIA
            AND TIPO = v_tipo
            AND POSICION = 1;
         --
      END IF;
      IF v_indice = v_CORTE1 THEN
         -- Obtener el 2do valor y Actualizarlo en COM_REPUTACION_RUB
         UPDATE COM_REPUTACION_RUB
            SET VALOR = v_cr_cursor.PORCENTAJE_PIM
          WHERE COMRUB_ID = p_comrub_id
            AND FECHA_VIGENCIA = v_FECHA_VIGENCIA
            AND TIPO = v_tipo
            AND POSICION = 2;
         --
      END IF;
      IF v_indice = v_CORTE2 THEN
         -- Obtener el 3er valor y Actualizarlo en COM_REPUTACION_RUB
         UPDATE COM_REPUTACION_RUB
            SET VALOR = v_cr_cursor.PORCENTAJE_PIM
          WHERE COMRUB_ID = p_comrub_id
            AND FECHA_VIGENCIA = v_FECHA_VIGENCIA
            AND TIPO = v_tipo
            AND POSICION = 3;
         --
      END IF;
      IF v_indice = v_CORTE3 THEN
         -- Obtener el 4to valor y Actualizarlo en COM_REPUTACION_RUB
         UPDATE COM_REPUTACION_RUB
            SET VALOR = v_cr_cursor.PORCENTAJE_PIM
          WHERE COMRUB_ID = p_comrub_id
            AND FECHA_VIGENCIA = v_FECHA_VIGENCIA
            AND TIPO = v_tipo
            AND POSICION = 4;
         --
      END IF;
      IF v_indice = v_CORTE4 THEN
         -- Obtener el 5to valor y Actualizarlo en COM_REPUTACION_RUB
         UPDATE COM_REPUTACION_RUB
            SET VALOR = v_cr_cursor.PORCENTAJE_PIM
          WHERE COMRUB_ID = p_comrub_id
            AND FECHA_VIGENCIA = v_FECHA_VIGENCIA
            AND TIPO = v_tipo
            AND POSICION = 5;
         --
      END IF;
     v_Indice := v_Indice+1;
    --
     END;
    END LOOP;
   --
EXCEPTION
  WHEN OTHERS THEN
    raise_application_error(-20000,'Error es Cortes PIM ', TRUE);
END;
/* Determina y carga los Cortes POC segun las ponderancias definidas */
PROCEDURE COMRER_CORTES_POC
 (P_COMRUB_ID IN COM_REPUTACION_RUB.COMRUB_ID%TYPE
 ,P_CANT_PRV_RUB IN NUMBER
 ,P_FECHA_VIGENCIA IN DATE
 ,P_FECHA_MOV_DESDE IN DATE
 ,P_FECHA_MOV_HASTA IN DATE
 )
 IS
-- Declaracion de Cursores
CURSOR cr_cursor IS
SELECT  COMRCB.COMRUB_ID
       ,COMOCM.COMPRV_ID COMPRV_ID
       ,(OBTN_VALOR_POC(
                      P_COMRUB_ID => COMRCB.COMRUB_ID
                     ,P_COMPRV_ID => COMOCM.COMPRV_ID
                     ,P_FECHA_MOV_DESDE => P_FECHA_MOV_DESDE
                     ,P_FECHA_MOV_HASTA => P_FECHA_MOV_HASTA
                       )) PORCENTAJE_POC
FROM COM_ORDENES_COMPRAS     COMOCM
    ,COM_ORDENES_COMPRAS_EST COMOCE
    ,COM_PEDIDOS             COMPED
    ,COM_RUBCOB              COMRCB
    ,COM_PROVEEDORES_RUB     COMPRR
WHERE COMOCM.ID        = COMOCE.COMOCM_ID
  AND COMOCM.COMPRV_ID = COMPRR.COMPRV_ID
  AND COMOCM.COMPED_ID = COMPED.ID
  AND COMPED.COMCOB_ID = COMRCB.COMCOB_ID
  AND COMRCB.SITUACION = 'VIG'
  AND(COMOCE.ESTADO    = 'CON'
      AND COMOCE.SITUACION = 'VAL'
      AND COMOCE.FECHA BETWEEN P_FECHA_MOV_DESDE AND P_FECHA_MOV_HASTA)
  AND COMRCB.COMRUB_ID = P_COMRUB_ID
GROUP BY COMRCB.COMRUB_ID, COMOCM.COMPRV_ID
ORDER BY COMRCB.COMRUB_ID, PORCENTAJE_POC;
--
-- Declaración de variables
 v_FECHA_VIGENCIA DATE := TO_CHAR(P_FECHA_VIGENCIA,'DD/MM/YYYY');
 v_INICIO NUMBER := 1;
 v_CORTE1 NUMBER := 1;
 v_CORTE2 NUMBER := 1;
 v_CORTE3 NUMBER := 1;
 v_CORTE4 NUMBER := 1;
 v_CORTE5 NUMBER := 1;
 v_PONDERANCIA_1 NUMBER := SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => 'COMADM_COMRER_PONDERANCIA1',P_SEGORG_ID => SEG_PKG.OBTN_ORGUSU(NVL (v ('APP_USER'), USER)));
 v_PONDERANCIA_2 NUMBER := SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => 'COMADM_COMRER_PONDERANCIA2',P_SEGORG_ID => SEG_PKG.OBTN_ORGUSU(NVL (v ('APP_USER'), USER)));
 v_PONDERANCIA_3 NUMBER := SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => 'COMADM_COMRER_PONDERANCIA3',P_SEGORG_ID => SEG_PKG.OBTN_ORGUSU(NVL (v ('APP_USER'), USER)));
 v_PONDERANCIA_4 NUMBER := SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => 'COMADM_COMRER_PONDERANCIA4',P_SEGORG_ID => SEG_PKG.OBTN_ORGUSU(NVL (v ('APP_USER'), USER)));
 --
 v_comrer COM_REPUTACION_RUB%ROWTYPE;
 v_indice NUMBER := 1;
 v_tipo  VARCHAR2(3) := 'POC';
 --
BEGIN
   -- Obtener cortes
   v_CORTE1 := FLOOR(((p_Cant_PRV_RUB * v_PONDERANCIA_1)/100)+v_INICIO);
   v_CORTE2 := FLOOR(((p_Cant_PRV_RUB * (v_PONDERANCIA_1+v_PONDERANCIA_2))/100)+v_INICIO);
   v_CORTE3 := FLOOR(((p_Cant_PRV_RUB * (v_PONDERANCIA_1+v_PONDERANCIA_2
                                        +v_PONDERANCIA_3))/100)+v_INICIO);
   v_CORTE4 := FLOOR(((p_Cant_PRV_RUB * (v_PONDERANCIA_1+v_PONDERANCIA_2
                                        +v_PONDERANCIA_3+v_PONDERANCIA_4))/100)+v_INICIO);

  FOR v_cr_cursor IN cr_cursor LOOP
  BEGIN
      IF v_indice = v_INICIO THEN
         -- Obtener el 1er valor y Actualizarlo en COM_REPUTACION_RUB
         UPDATE COM_REPUTACION_RUB
            SET VALOR = v_cr_cursor.PORCENTAJE_POC
          WHERE COMRUB_ID = p_comrub_id
            AND FECHA_VIGENCIA = v_FECHA_VIGENCIA
            AND TIPO = v_tipo
            AND POSICION = 1;
         --
      END IF;
      IF v_indice = v_CORTE1 THEN
         -- Obtener el 2do valor y Actualizarlo en COM_REPUTACION_RUB
         UPDATE COM_REPUTACION_RUB
            SET VALOR = v_cr_cursor.PORCENTAJE_POC
          WHERE COMRUB_ID = p_comrub_id
            AND FECHA_VIGENCIA = v_FECHA_VIGENCIA
            AND TIPO = v_tipo
            AND POSICION = 2;
         --
      END IF;
      IF v_indice = v_CORTE2 THEN
         -- Obtener el 3er valor y Actualizarlo en COM_REPUTACION_RUB
         UPDATE COM_REPUTACION_RUB
            SET VALOR = v_cr_cursor.PORCENTAJE_POC
          WHERE COMRUB_ID = p_comrub_id
            AND FECHA_VIGENCIA = v_FECHA_VIGENCIA
            AND TIPO = v_tipo
            AND POSICION = 3;
         --
      END IF;
      IF v_indice = v_CORTE3 THEN
         -- Obtener el 3er valor y Actualizarlo en COM_REPUTACION_RUB
         UPDATE COM_REPUTACION_RUB
            SET VALOR = v_cr_cursor.PORCENTAJE_POC
          WHERE COMRUB_ID = p_comrub_id
            AND FECHA_VIGENCIA = v_FECHA_VIGENCIA
            AND TIPO = v_tipo
            AND POSICION = 4;
         --
      END IF;
      IF v_indice = v_CORTE4 THEN
         -- Obtener el 3er valor y Actualizarlo en COM_REPUTACION_RUB
         UPDATE COM_REPUTACION_RUB
            SET VALOR = v_cr_cursor.PORCENTAJE_POC
          WHERE COMRUB_ID = p_comrub_id
            AND FECHA_VIGENCIA = v_FECHA_VIGENCIA
            AND TIPO = v_tipo
            AND POSICION = 5;
         --
      END IF;
     v_Indice := v_Indice+1;
    --
     END;
    END LOOP;
   --
EXCEPTION
  WHEN OTHERS THEN
    raise_application_error(-20000,'Error es Cortes POC.', TRUE);
END;
/* Determina y carga los Cortes POC segun las ponderancias definidas */
PROCEDURE COMRER_CORTES_POP
 (P_COMRUB_ID IN COM_REPUTACION_RUB.COMRUB_ID%TYPE
 ,P_CANT_PRV_RUB IN NUMBER
 ,P_FECHA_VIGENCIA IN DATE
 ,P_FECHA_MOV_DESDE IN DATE
 ,P_FECHA_MOV_HASTA IN DATE
 )
 IS
-- Declaracion de Cursores
CURSOR cr_cursor IS
SELECT  COMRCB.COMRUB_ID
       ,COMOCM.COMPRV_ID COMPRV_ID
       ,(OBTN_VALOR_POP(
                  P_COMRUB_ID => COMRCB.COMRUB_ID
                 ,P_COMPRV_ID => COMOCM.COMPRV_ID
                 ,P_FECHA_MOV_DESDE => P_FECHA_MOV_DESDE
                 ,P_FECHA_MOV_HASTA => P_FECHA_MOV_HASTA
                       )) PORCENTAJE_POP
FROM COM_ORDENES_COMPRAS     COMOCM
    ,COM_PEDIDOS             COMPED
    ,COM_RUBCOB              COMRCB
    ,COM_PROVEEDORES_RUB     COMPRR
    ,COM_CALIFICACIONES      COMCLF
WHERE COMOCM.COMPRV_ID = COMPRR.COMPRV_ID
  AND COMOCM.COMPED_ID = COMPED.ID
  AND COMOCM.ID        = COMCLF.COMOCM_ID
  AND COMPED.COMCOB_ID = COMRCB.COMCOB_ID
  AND COMRCB.SITUACION = 'VIG'
  AND(    COMCLF.CALIFICACION = 1
      AND COMCLF.SITUACION = 'VAL'
      AND COMCLF.FECHA BETWEEN P_FECHA_MOV_DESDE AND P_FECHA_MOV_HASTA
      )
  AND COMRCB.COMRUB_ID = P_COMRUB_ID
GROUP BY COMRCB.COMRUB_ID,COMOCM.COMPRV_ID
ORDER BY COMRCB.COMRUB_ID, PORCENTAJE_POP;
--
-- Declaración de variables
 v_FECHA_VIGENCIA DATE := TO_CHAR(P_FECHA_VIGENCIA,'DD/MM/YYYY');
 v_INICIO NUMBER := 1;
 v_CORTE1 NUMBER := 1;
 v_CORTE2 NUMBER := 1;
 v_CORTE3 NUMBER := 1;
 v_CORTE4 NUMBER := 1;
 v_PONDERANCIA_1 NUMBER := SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => 'COMADM_COMRER_PONDERANCIA1',P_SEGORG_ID => SEG_PKG.OBTN_ORGUSU(NVL (v ('APP_USER'), USER)));
 v_PONDERANCIA_2 NUMBER := SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => 'COMADM_COMRER_PONDERANCIA2',P_SEGORG_ID => SEG_PKG.OBTN_ORGUSU(NVL (v ('APP_USER'), USER)));
 v_PONDERANCIA_3 NUMBER := SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => 'COMADM_COMRER_PONDERANCIA3',P_SEGORG_ID => SEG_PKG.OBTN_ORGUSU(NVL (v ('APP_USER'), USER)));
 v_PONDERANCIA_4 NUMBER := SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => 'COMADM_COMRER_PONDERANCIA4',P_SEGORG_ID => SEG_PKG.OBTN_ORGUSU(NVL (v ('APP_USER'), USER)));
 --
 v_comrer COM_REPUTACION_RUB%ROWTYPE;
 v_indice NUMBER := 1;
 v_tipo  VARCHAR2(3) := 'POP';
 --
BEGIN
   -- Obtener cortes
   v_CORTE1 := FLOOR(((p_Cant_PRV_RUB * v_PONDERANCIA_1)/100)+v_INICIO);
   v_CORTE2 := FLOOR(((p_Cant_PRV_RUB * (v_PONDERANCIA_1+v_PONDERANCIA_2))/100)+v_INICIO);
   v_CORTE3 := FLOOR(((p_Cant_PRV_RUB * (v_PONDERANCIA_1+v_PONDERANCIA_2
                                        +v_PONDERANCIA_3))/100)+v_INICIO);
   v_CORTE4 := FLOOR(((p_Cant_PRV_RUB * (v_PONDERANCIA_1+v_PONDERANCIA_2
                                        +v_PONDERANCIA_3+v_PONDERANCIA_4))/100)+v_INICIO);

  FOR v_cr_cursor IN cr_cursor LOOP
    BEGIN
      IF v_indice = v_INICIO THEN
         -- Obtener el 1er valor y Actualizarlo en COM_REPUTACION_RUB
         UPDATE COM_REPUTACION_RUB
            SET VALOR = v_cr_cursor.PORCENTAJE_POP
          WHERE COMRUB_ID = p_comrub_id
            AND FECHA_VIGENCIA = v_FECHA_VIGENCIA
            AND TIPO = v_tipo
            AND POSICION = 1;
         --
      END IF;
      IF v_indice = v_CORTE1 THEN
         -- Obtener el 2do valor y Actualizarlo en COM_REPUTACION_RUB
         UPDATE COM_REPUTACION_RUB
            SET VALOR = v_cr_cursor.PORCENTAJE_POP
          WHERE COMRUB_ID = p_comrub_id
            AND FECHA_VIGENCIA = v_FECHA_VIGENCIA
            AND TIPO = v_tipo
            AND POSICION = 2;
         --
      END IF;
      IF v_indice = v_CORTE2 THEN
         -- Obtener el 3er valor y Actualizarlo en COM_REPUTACION_RUB
         UPDATE COM_REPUTACION_RUB
            SET VALOR = v_cr_cursor.PORCENTAJE_POP
          WHERE COMRUB_ID = p_comrub_id
            AND FECHA_VIGENCIA = v_FECHA_VIGENCIA
            AND TIPO = v_tipo
            AND POSICION = 3;
         --
      END IF;
      IF v_indice = v_CORTE3 THEN
         -- Obtener el 4to valor y Actualizarlo en COM_REPUTACION_RUB
         UPDATE COM_REPUTACION_RUB
            SET VALOR = v_cr_cursor.PORCENTAJE_POP
          WHERE COMRUB_ID = p_comrub_id
            AND FECHA_VIGENCIA = v_FECHA_VIGENCIA
            AND TIPO = v_tipo
            AND POSICION = 4;
         --
      END IF;
      IF v_indice = v_CORTE4 THEN
         -- Obtener el 5to valor y Actualizarlo en COM_REPUTACION_RUB
         UPDATE COM_REPUTACION_RUB
            SET VALOR = v_cr_cursor.PORCENTAJE_POP
          WHERE COMRUB_ID = p_comrub_id
            AND FECHA_VIGENCIA = v_FECHA_VIGENCIA
            AND TIPO = v_tipo
            AND POSICION = 5;
         --
      END IF;
     v_Indice := v_Indice+1;
    --
     END;
    END LOOP;
   --
EXCEPTION
  WHEN OTHERS THEN
    raise_application_error(-20000,'Error es Cortes POP ', TRUE);
END;
/* Generar grilla para reputacion */
PROCEDURE COMRRP_GENERAR
 (P_FECHA_MOV_HASTA IN DATE
 ,P_FECHA_MOV_DESDE IN DATE
 ,P_FECHA_VIGENCIA IN DATE
 )
 IS
-- Declaración de cursores
CURSOR CR_CURSOR IS
SELECT  DISTINCT COMRCB.COMRUB_ID
       ,COMOCM.COMPRV_ID
FROM COM_ORDENES_COMPRAS     COMOCM
    ,COM_ORDENES_COMPRAS_EST COMOCE
    ,COM_PEDIDOS             COMPED
    ,COM_RUBCOB              COMRCB
    ,COM_PROVEEDORES_RUB     COMPRR
WHERE COMOCM.ID        = COMOCE.COMOCM_ID
  AND COMOCM.COMPRV_ID = COMPRR.COMPRV_ID
  AND COMOCM.COMPED_ID = COMPED.ID
  AND COMPED.COMCOB_ID = COMRCB.COMCOB_ID
  AND COMRCB.SITUACION = 'VIG'
  AND(    COMOCE.ESTADO    = 'APR'
      AND COMOCE.SITUACION = 'VAL'
      AND COMOCE.FECHA BETWEEN P_FECHA_MOV_DESDE AND P_FECHA_MOV_HASTA)
ORDER BY COMRCB.COMRUB_ID,COMOCM.COMPRV_ID;
--
PROCEDURE COMRRP_CARGAR
 (P_COMRUB_ID IN COM_REPUTACION_RUB.COMRUB_ID%TYPE
 ,P_COMPRV_ID IN NUMBER
 ,P_TIPO IN VARCHAR2
 ,P_FECHA_VIGENCIA IN DATE
 ,P_FECHA_MOV_DESDE IN DATE
 ,P_FECHA_MOV_HASTA IN DATE
 )
 IS
 -- Declaracion de cursores
 CURSOR cr_cursor IS
 SELECT POSICION
       ,VALOR
 FROM COM_REPUTACION_RUB
 WHERE COMRUB_ID = P_COMRUB_ID
   AND TIPO      = P_TIPO
 ORDER BY POSICION;
 --
 -- Declaración de variables
 v_comrrp COM_REPUTACION_RUBPRV%ROWTYPE;
 v_fecha_vigencia DATE := TO_CHAR(P_FECHA_VIGENCIA,'DD/MM/YYYY');
 v_valor_COP NUMBER    := 0;
 v_monto_COP NUMBER    := 0;
 v_valor     NUMBER    := 0;
 v_posicion  NUMBER    := 1;
 --
BEGIN
  --
  -- Obtener Ordenes Aprobadas
   v_valor_COP := COM_PKG. OBTN_VALOR_COP_MONTO(P_COMRUB_ID => P_COMRUB_ID
                                         ,P_COMPRV_ID => P_COMPRV_ID
                                         ,P_MONTO_COP => V_MONTO_COP
                                         ,P_FECHA_MOV_DESDE => P_FECHA_MOV_DESDE
                                         ,P_FECHA_MOV_HASTA => P_FECHA_MOV_HASTA);
   v_valor := v_valor_COP;
  IF P_TIPO = 'POC' THEN
   -- Obtener Porcentaje Ordenes Concretadas
   v_valor :=  COM_PKG.OBTN_VALOR_POC(P_COMRUB_ID => P_COMRUB_ID
                                     ,P_COMPRV_ID => P_COMPRV_ID
                                     ,P_FECHA_MOV_DESDE => P_FECHA_MOV_DESDE
                                     ,P_FECHA_MOV_HASTA => P_FECHA_MOV_HASTA);
   --
  END IF;
  --
  IF P_TIPO = 'POP' THEN
   -- Obtener Porcentaje Ordenes Positivas
   v_valor :=  COM_PKG.OBTN_VALOR_POP(P_COMRUB_ID => P_COMRUB_ID
                                     ,P_COMPRV_ID => P_COMPRV_ID
                                     ,P_FECHA_MOV_DESDE => P_FECHA_MOV_DESDE
                                     ,P_FECHA_MOV_HASTA => P_FECHA_MOV_HASTA);
   --
  END IF;
  --
    IF P_TIPO = 'PIM' THEN
   -- Obtener Ordenes Aprobadas
   v_valor :=  COM_PKG.OBTN_VALOR_PIM(P_COMRUB_ID => P_COMRUB_ID
                                     ,P_COMPRV_ID => P_COMPRV_ID
                                     ,P_FECHA_MOV_DESDE => P_FECHA_MOV_DESDE
                                     ,P_FECHA_MOV_HASTA => P_FECHA_MOV_HASTA);
   --
  END IF;
  --
  -- Asigno posicion
  FOR v_cr_cursor IN cr_cursor LOOP
    IF v_valor >  v_cr_cursor.VALOR
     THEN v_posicion := v_cr_cursor.POSICION;
    END IF;
  END LOOP;
  --
  -- Defino variable e inserto en COM_REPUTACION_RUBPRV
  v_comrrp.COMRUB_ID      := P_COMRUB_ID;
  v_comrrp.COMPRV_ID      := P_COMPRV_ID;
  v_comrrp.FECHA_VIGENCIA := v_fecha_vigencia;
  v_comrrp.TIPO           := P_TIPO;
  v_comrrp.VALOR          := v_posicion;
  --
  INS_COMRRP(p_comrrp => v_comrrp);
  --
END;
--
BEGIN
  -- Recoorro todos los Rubros y sus Proveedores para Generar su Reputación
  FOR v_cr_cursor IN cr_cursor LOOP
   -- Obtener e insertar Ordenes Aprobadas COP
   COMRRP_CARGAR(P_COMRUB_ID => v_cr_cursor.COMRUB_ID
                ,P_COMPRV_ID => v_cr_cursor.COMPRV_ID
                ,P_TIPO      => 'COP'
                ,P_FECHA_VIGENCIA  => P_FECHA_VIGENCIA
                ,P_FECHA_MOV_DESDE => P_FECHA_MOV_DESDE
                ,P_FECHA_MOV_HASTA => P_FECHA_MOV_HASTA);
   --
   -- Obtener e insertar Porcentaje Ordenes Concretadas POC
   COMRRP_CARGAR(P_COMRUB_ID => v_cr_cursor.COMRUB_ID
                ,P_COMPRV_ID => v_cr_cursor.COMPRV_ID
                ,P_TIPO      => 'POC'
                ,P_FECHA_VIGENCIA  => P_FECHA_VIGENCIA
                ,P_FECHA_MOV_DESDE => P_FECHA_MOV_DESDE
                ,P_FECHA_MOV_HASTA => P_FECHA_MOV_HASTA);
   --
   -- Obtener e insertar Porcentaje Ordenes Positivas POP
   COMRRP_CARGAR(P_COMRUB_ID => v_cr_cursor.COMRUB_ID
                ,P_COMPRV_ID => v_cr_cursor.COMPRV_ID
                ,P_TIPO      => 'POP'
                ,P_FECHA_VIGENCIA  => P_FECHA_VIGENCIA
                ,P_FECHA_MOV_DESDE => P_FECHA_MOV_DESDE
                ,P_FECHA_MOV_HASTA => P_FECHA_MOV_HASTA);
   --
   -- Obtener e insertar Porcentaje Importes Positivos PIM
   COMRRP_CARGAR(P_COMRUB_ID => v_cr_cursor.COMRUB_ID
                ,P_COMPRV_ID => v_cr_cursor.COMPRV_ID
                ,P_TIPO      => 'PIM'
                ,P_FECHA_VIGENCIA  => P_FECHA_VIGENCIA
                ,P_FECHA_MOV_DESDE => P_FECHA_MOV_DESDE
                ,P_FECHA_MOV_HASTA => P_FECHA_MOV_HASTA);
   --
  END LOOP;
  --
END;
FUNCTION COMREP_ANULA_REP_SN
 (P_ID IN NUMBER
 ,P_COMREP_ID IN NUMBER
 ,P_ORIGEN IN VARCHAR2
 )
 RETURN VARCHAR2
 IS
--
cursor cr_replicas_rep is
select *
from com_replicas_det
where SITUACION = 'VIG'
and id = (select max(id)
          from com_replicas_det
          where comrep_id = p_comrep_id
          and SITUACION = 'VIG');
--
v_com_replicas_det      com_replicas_det%ROWTYPE;
--v_com_replicas_det      cr_replicas_rep%ROWTYPE;
v_retorno               varchar2(10) := 'NO';
--
begin
   --
   -- Si existe un registro posterior entonces devuelvo false.
   --
   open cr_replicas_rep;
   fetch cr_replicas_rep into v_com_replicas_det;
   close cr_replicas_rep;
   if v_com_replicas_det.id = p_id then
      if p_origen = v_com_replicas_det.origen then
         v_retorno := 'SI';
      end if;
   end if;
   --
   return v_retorno;
   --
end;
FUNCTION COMREP_REPLICAR_SN
 (P_COMOCM_ID IN NUMBER
 ,P_ORIGEN IN VARCHAR2
 )
 RETURN VARCHAR2
 IS
-- Obtener la calificación registrada para la orden de compra
cursor cr_comclf is
  select comclf.*
  from   COM_CALIFICACIONES comclf
  where  comclf.COMOCM_ID = p_comocm_id
  and    comclf.SITUACION = 'VAL';
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
 where comred2.comrep_id = p_comrep_id
   and comred2.ID = (select max(comred.id)
                       from COM_REPLICAS_DET comred
                      where comred.COMREP_ID = p_comrep_id
                        and comred.SITUACION = 'VIG');
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
  v_comrep cr_comrep%rowtype;
  v_comred cr_comred%rowtype;
  v_comclf cr_comclf%rowtype;
--
  v_retorno varchar2(2);
  v_max_plazo_eco number;
  v_max_plazo_prv number;
  v_max_cant_eco number;
  v_max_cant_prv number;
  v_comred_cantidad number;
begin
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
  -- Obtiene el maximo numero de replicas permitidas para la entidad contratante
  v_max_cant_eco := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo => 'COMADM_COMREP_CANT_MAX_REP_ECO'
                                             ,p_segorg_id => v_comclf.SEGORG_ID);
  -- Obtiene el maximo numero de replicas permitidas para el proveedor
  v_max_cant_prv := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo => 'COMADM_COMREP_CANT_MAX_REP_PRV'
                                             ,p_segorg_id => v_comclf.SEGORG_ID);
  --
  v_retorno := 'NO';
  --
  if v_comrep.ID  is not null and v_comred.ID is not null then
    -- Obtener la cantidad de replicas por origen
    open cr_comred_cantidad(v_comrep.id);
    fetch cr_comred_cantidad into v_comred_cantidad;
    close cr_comred_cantidad;
    --Si es destino de la replica se permite replicar
    if p_origen = 'PRV' and v_comred.destino = p_origen  then
       --si la replica ha sido respondida se permite replicar
       if v_comrep.ESTADO = 'REP' then
         -- Si no se ha superado la cantidad maxima de replicas por proveedor
         -- o aun se encuentra dentro del limite de tiempo para replicas del proveedor
         -- se permite replicar
         if (v_comred_cantidad < v_max_cant_prv) and (v_comred.FECHA + (v_max_plazo_prv/24) >= sysdate) then
           v_retorno := 'SI';
         end if;
       end if;
    end if;
    --Si es destino de la replica se permite replicar
    if p_origen = 'ECO' and v_comred.destino = p_origen then
      -- Existe al menos un detalle de replica y el estado de la replica es PRE o REP
      if v_comrep.ESTADO in ('PRE','REP') then
        -- Si no se ha superado la cantidad maxima de replicas por proveedor
        -- o aun se encuentra dentro del limite de tiempo para replicas de la entidad
        -- se permite replicar
        if (v_comred_cantidad < v_max_cant_eco) and (v_comred.FECHA + (v_max_plazo_eco/24) >= sysdate) then
          v_retorno := 'SI';
        end if;
      end if;
    end if;
    --Si es destino de la replica se permite replicar
    if p_origen = 'ADM' then
    -- Existe al menos un detalle de replica y el estado de la replica es PRE, REP
      if (v_comrep.ESTADO in ('PRE','REP')) then
      --Si ADM es el origen de la replica
         if ( v_comred.origen = p_origen)then
         --Si el destino es proveedor y se vencio el tiempo, se permite replicar
            if (v_comred.DESTINO = 'PRV' and (v_comred.FECHA + (v_max_plazo_prv/24) < sysdate)) then
                 v_retorno := 'SI';
            end if;
            --Si el destino es Unidad ejecutora y se vencio el tiempo, se permite replicar
            if(v_comred.DESTINO = 'ECO' and (v_comred.FECHA + (v_max_plazo_eco/24) < sysdate)) then
                 v_retorno := 'SI';
            end if;
         else
            v_retorno := 'SI';
         end if;
      end if;
    end if;
    -- Si no se han realizado replicas  y el origen es PRV
    elsif p_origen = 'PRV' then
          -- Si se encuentra dentro del limite de tiempo para replicas del proveedor retornamos las horas restantes, con respecto a la fecha de la calificación
       if(v_comclf.FECHA + (v_max_plazo_prv/24) >= sysdate) then
            v_retorno := 'SI';
       end if;
  end if;
  --
  return v_retorno;
  -- Si se produce un error no permite replicar
exception
  when others then
    return 'NO';
end;
/* Proceso de Aceptacion del Trámite Cambio CBU */
PROCEDURE COMTPR_ACEPTAR_ACCB
 (P_COMTPR_ID IN COM_TRAMITES_PRV.ID%TYPE
 ,P_RESULTADO OUT VARCHAR2
 ,P_COMPRV_ID OUT COM_PROVEEDORES.ID%TYPE
 )
 IS
cursor cr_comtdp is
  select *
    from COM_TRAMITES_PRV_DOC
   where COMTPR_ID = p_comtpr_id;
  --

  -- Declaracion de variables
  v_comtpr COM_TRAMITES_PRV%ROWTYPE;
  --
BEGIN
  -- Obtener los datos del trámite de proveedor
  COM_PKG.SET_COMTPR(p_id     => p_comtpr_id);
  COM_PKG.GET_COMTPR(p_comtpr => v_comtpr);
  COM_PKG.INI_COMTPR;
  --
  IF v_comtpr.ID IS NOT NULL THEN
  --
   -- Actualizar el Proveedor
   UPDATE COM_PROVEEDORES
   SET CBU = v_comtpr.CBU
   WHERE ID = v_comtpr.COMPRV_ID;
   --
   -- Activar el Documento/s Presentado
    for v_comtdp in cr_comtdp loop
      --
      update com_proveedores_doc
      set SITUACION = 'ACT'
      where id = v_comtdp.COMPDO_ID;
      --
    end loop;
    --
   p_comprv_id := v_comtpr.comprv_id;
   --
  END IF;
  --
END;
/* Proceso de Presentar Documentación */
PROCEDURE COMTPR_ACEPTAR_PDOC
 (P_COMTPR_ID IN COM_TRAMITES_PRV.ID%TYPE
 ,P_RESULTADO OUT VARCHAR2
 ,P_COMPRV_ID OUT COM_PROVEEDORES.ID%TYPE
 )
 IS
-- Declaracion de variables
  --
  cursor cr_comtdp is
  select *
    from COM_TRAMITES_PRV_DOC
   where COMTPR_ID = p_comtpr_id;
  --
  v_comtpr COM_TRAMITES_PRV%ROWTYPE;
  --
BEGIN
  -- Obtener los datos del trámite de proveedor
  COM_PKG.SET_COMTPR(p_id     => p_comtpr_id);
  COM_PKG.GET_COMTPR(p_comtpr => v_comtpr);
  COM_PKG.INI_COMTPR;
  --
  IF v_comtpr.ID IS NOT NULL THEN
    --
    for v_comtdp in cr_comtdp loop
      --
      update com_proveedores_doc
      set SITUACION = 'ACT'
      where id = v_comtdp.COMPDO_ID;
      --
    end loop;
    --
    p_comprv_id := v_comtpr.comprv_id;
   --
  END IF;
  --
END;
PROCEDURE COMTDR_SET
 (P_ID IN NUMBER
 )
 IS
CURSOR cr_dat IS
  SELECT *
  FROM COM_COMPDT_COMRUB
  WHERE ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  COMTDR_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_dat;
  FETCH cr_dat INTO v_comtdr;
  CLOSE cr_dat;
  --
END;
PROCEDURE COMTDR_INS
 (P_COMTDR IN COM_COMPDT_COMRUB%ROWTYPE
 )
 IS
begin
  insert into COM_COMPDT_COMRUB
  (ID
 , COMPDT_ID
 , COMRUB_ID
 , OBLIGATORIO_SN
 , DATE_CREATED
 , CREATED_BY
 , DATE_MODIFIED
 , MODIFIED_BY
  )
  values
  (p_comtdr.ID
 , p_comtdr.COMPDT_ID
 , p_comtdr.COMRUB_ID
 , p_comtdr.OBLIGATORIO_SN
 , p_comtdr.DATE_CREATED
 , p_comtdr.CREATED_BY
 , p_comtdr.DATE_MODIFIED
 , p_comtdr.MODIFIED_BY );
  --
end;
PROCEDURE COMTDR_INI
 IS
begin
  v_comtdr := NULL;
end;
/* Obtener el valor de la variable v_comtdr */
PROCEDURE COMTDR_GET
 (P_COMTDR OUT COM_COMPDT_COMRUB%ROWTYPE
 )
 IS
begin
  p_comtdr := v_comtdr;
end;
/* Proceso de Aceptacion del solicitud de Inscripcion de Responsables ECO */
PROCEDURE COMTCO_INSR_ACEPTAR
 (P_COMTCO_ID IN COM_TRAMITES_CON.ID%TYPE
 ,P_RESULTADO OUT VARCHAR2
 )
 IS
-- Declaracion de Cursores


  -- Obtener los responsables del trámite
  CURSOR cr_comtcs IS
  SELECT *
  FROM COM_TRAMITES_CON_RES
  WHERE COMTCO_ID = p_comtco_id;
  --
  CURSOR cr_comcnr (p_segorg_id number, p_tipodoc varchar2, p_nrodoc number, p_comeco_id number ) IS
  SELECT COMCNR.ID
  FROM COM_CONTRATANTES_RES  COMCNR
     , COM_RESPONSABLES      COMRES
     , SEG_ORGANIZACIONES    SEGORG
     , SEG_PERSONAS          SEGPRS
     , SEG_USUARIOS          SEGUSU
     , COM_CONTRATANTES      COMECO
     , COM_CONTRATANTES_CAT  COMECC
  WHERE SEGUSU.SEGORG_ID = p_segorg_id AND
        SEGUSU.ID = COMCNR.SEGUSU_ID(+) AND
        SEGUSU.SEGORG_ID = SEGORG.ID(+) AND
        SEGUSU.ID = SEGPRS.SEGUSU_ID(+) AND
        COMCNR.COMRES_ID = COMRES.ID AND
        COMCNR.COMECO_ID = COMECO.ID AND
        COMECO.COMECC_ID = COMECC.ID AND
        COMCNR.SITUACION = 'ACT' AND
        COMRES.TIPO_DOCUMENTO = p_tipodoc AND
        COMRES.NUMERO_DOCUMENTO = p_nrodoc AND
        COMECO.ID = p_comeco_id;

  -- Obtener el tipo de contratante
  CURSOR cr_comcnt(p_comcnt_id NUMBER) IS
  SELECT *
  FROM COM_CONTRATANTES_TIPOS
  WHERE ID = p_comcnt_id;
  --
  -- Declaracion de variables
  v_comtco COM_TRAMITES_CON%ROWTYPE;
  v_comres COM_RESPONSABLES%ROWTYPE;
  v_comcnt cr_comcnt%ROWTYPE;
  --v_comtcs cr_comtcs%ROWTYPE;
  v_comtcs  COM_TRAMITES_CON_RES%ROWTYPE;
  --
  v_segorg             SEG_ORGANIZACIONES%ROWTYPE;
  v_segusu_id          SEG_USUARIOS.ID%TYPE;
  v_segusu_contrasenia SEG_USUARIOS.CONTRASENIA%TYPE;
  v_segusu_usuario     SEG_USUARIOS.USUARIO%TYPE;
  v_segpfl_codigo      SEG_PERFILES.CODIGO%TYPE;
  v_segpfl_regprv      SEG_PERFILES.CODIGO%TYPE;
  --
  v_comcnr_id          number;
  --
BEGIN
  -- Obtener los datos del trámite de proveedor
  COM_PKG.SET_COMTCO(p_id     => p_comtco_id);
  COM_PKG.GET_COMTCO(p_comtco => v_comtco);
  --COM_PKG.INI_COMTCO;
  --
  IF v_comtco.id IS NULL THEN
    p_resultado := 'El Nro. de Trámite indicado es incorrecto.';
    raise_application_error(-20000,'Error 1');
  END IF;
  --
  -- Solo se aceptan solicitudes Recepcionadas
  IF v_comtco.situacion <> 'REC' THEN
    p_resultado := 'El Nro. de Trámite indicado no se encuentra recepcionado para ser aceptado.';
    raise_application_error(-20000,'Error 2');
  END IF;
  -- Recorrer los responsables del trámite para relacionarlos al contratante
  FOR v_comtcs IN cr_comtcs  LOOP
    -- Inicializar las variables necesarias
    v_segusu_id := NULL;
    --
    -- Obtener los datos del tipo de contratante para determinar si se debe generar usuario
    OPEN  cr_comcnt(p_comcnt_id => v_comtco.comcnt_id);
    FETCH cr_comcnt INTO v_comcnt;
    CLOSE cr_comcnt;
    -- Generar el usuario si el tipo de proveedor así lo indica
    IF v_comcnt.GENERAR_USUARIO_SN = 'SI' THEN
      --
      -- Generar el Usuario al responsable del contratante
      --
      -- Obtener los datos de la organización
      SEG_PKG.SET_SEGORG(p_id     => v_comtco.SEGORG_ID);
      SEG_PKG.GET_SEGORG(p_segorg => v_segorg);
      SEG_PKG.INI_SEGORG;

      -- Obtener la información del responsable para generar el usuario correspondiente
      COM_PKG.SET_COMRES(p_id => v_comtcs.COMRES_ID);
      COM_PKG.GET_COMRES(p_comres => v_comres);
      COM_PKG.INI_COMRES;
      --
      -- Obtener la informacion del responsable por entidad, si ya existe damos error
      OPEN  cr_comcnr(p_segorg_id => v_segorg.id,
                      p_tipodoc   => v_comres.tipo_documento,
                      p_nrodoc    => TO_NUMBER(v_comres.numero_documento),
                      p_comeco_id => v_comtco.comeco_id);
      FETCH cr_comcnr INTO v_comcnr_id;
      CLOSE cr_comcnr;
      --
      if v_comcnr_id is not null then
         raise_application_error(-20000,'El responsable ' || v_comres.tipo_documento || ' ' || v_comres.numero_documento || ' ya se encuentra registrado ',true);
      end if;
      --
      -- Generar la contraseña inicial
      -- Las dos primeras letras del nombre, las dos ultimas del nombre y las cuatro ultimas cifras del documento
      v_segusu_contrasenia := COM_PKG.OBTN_CONTRASENIA(p_nombre => v_comres.nombre
                                                   ,p_numero_documento => v_comres.numero_documento);
      -- Armar el nombre del usuario
      -- El código de la organización + Codigo ECO + Codigo de Tipo de Usuario (ECOCOM)
      -- + Tipo de documento del responsable + Numero de documento
      v_segusu_usuario := v_segorg.codigo||'.ECOCOM.'||v_comtco.CODIGO||'.'||
                          v_comres.tipo_documento||'.'||v_comres.numero_documento;
      -- Inicializamos p_resultado
      p_resultado := null;
      v_segpfl_codigo := null;
      v_segpfl_codigo := SUBSTR(v_comres.OBSERVACION,1,INSTR(v_comres.OBSERVACION,' - ')-1);
      IF v_segpfl_codigo IS NULL THEN
        v_segpfl_codigo := 'COMECO_ADMIN';
      END IF;
      -- Buscamos si existe un perfil adicional para el usuario
      if instr(v_segpfl_codigo, ':') > 0 then
        v_segpfl_regprv := substr(v_segpfl_codigo, instr(v_segpfl_codigo, ':')+1);
        v_segpfl_codigo := substr(v_segpfl_codigo, 1, instr(v_segpfl_codigo, ':')-1);
      end if;
      -- Llamamos al Proceso de Creacion de un Responsable de Contratantes
      BEGIN
         COM_PKG.COMCNR_CREAR(
          p_segusu_usuario          => v_segusu_usuario
         ,p_segusu_contrasenia      => v_segusu_contrasenia
         ,p_segprs_observaciones    => v_comres.OBSERVACION
         ,p_segprs_nombre           => v_comres.nombre
         ,p_segprs_email            => v_comres.email
         ,p_segprs_tipo_documento   => v_comres.tipo_documento
         ,p_segprs_numero_documento => TO_NUMBER(v_comres.numero_documento)
         ,p_segorg_codigo           => v_segorg.codigo
         ,p_segpfl_codigo           => v_segpfl_codigo -- Perfil Admin ECO del Usuiario
         ,p_segapl_codigo           => null -- 'ECOCOM'
         ,p_comrst_id               => v_comres.comrst_id
         ,p_comeco_id               => v_comtco.comeco_id
         ,p_resultado               => p_resultado   -- SALIDA
         ,p_segusu_id               => v_segusu_id   -- SALIDA
         ,p_comres_id               => v_comres.ID
        );

      -- Si se ha definido un segundo perfil añadirlo
      if length(v_segpfl_regprv) > 0 then
        declare
          v_segpus SEG_PERFILES_USUARIOS%ROWTYPE;
          v_segpfl SEG_PERFILES%ROWTYPE;
        begin
          --
          SEG_PKG.SET_SEGPFL_CODIGO(p_segpfl_codigo => v_segpfl_regprv);
          SEG_PKG.GET_SEGPFL(v_segpfl);
          SEG_PKG.INI_SEGPFL;
          --
          if v_segpfl.ID is null then
            p_resultado := p_resultado||' El Perfil que intenta asignar al Responsable no Existe en la Organización.';
          else
            --
            v_segpus.SEGPFL_ID      := v_segpfl.ID;
            v_segpus.SEGUSU_ID      := v_segusu_id;
            v_segpus.FECHA_VIGENCIA := SYSDATE;
            v_segpus.FECHA_VALIDEZ  := NULL;
            SEG_PKG.INS_SEGPUS(P_SEGPUS => V_SEGPUS);
            --
          end if;
        end;
      end if;

      EXCEPTION WHEN others THEN
         raise_application_error(-20000,'No se ha podido crear el responsable ' || SQLERRM,true);
      END;
    --
    END IF;
    --
  END LOOP;
  -- Marcar la solicitud de inscripción como aprobada
  UPDATE COM_TRAMITES_CON
  SET    SITUACION = 'APR'
  WHERE ID = p_comtco_id;
  --
EXCEPTION WHEN others THEN
   raise_application_error(-20000,'No se ha podido aceptar el tramite ' || SQLERRM,true);
END;
/* Devuelve si el documento esta presente en el tramite */
FUNCTION COMTOD_PRESENTADO_SN
 (P_COMTPR_ID IN NUMBER
 ,P_COMODT_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_comtod is
  select 1
  from   COM_TRAMITES_PRV comtpr
        ,COM_TRAMITES_PRV_OBD comtod
        ,COM_OBJETOS_DOC comobd
  where  comtpr.ID = p_comtpr_id
  and    comtpr.ID = comtod.COMTPR_ID
  and    comtod.COMOBD_ID = comobd.ID
  and    comobd.COMODT_ID = p_comodt_id;
  --
  v_comtod_existe number;
  v_retorno varchar2(2);
begin
  --
  open cr_comtod;
  fetch cr_comtod into v_comtod_existe;
  close cr_comtod;
  --
  if nvl(v_comtod_existe,0) = 1 then
    v_retorno := 'SI';
  else
    v_retorno := 'NO';
  end if;
  --
  return v_retorno;
end;
/* Proceso de Aceptacion Solicitud de Trámite Proveedor */
PROCEDURE COMTPR_ACEPTAR
 (P_COMTPR_ID IN COM_TRAMITES_PRV.ID%TYPE
 ,P_RESULTADO OUT VARCHAR2
 ,P_COMPRV_ID OUT COM_PROVEEDORES.ID%TYPE
 )
 IS
-- Declaracion de Cursores
  -- Declaracion de variables
  v_comtpr COM_TRAMITES_PRV%ROWTYPE;
  v_comprv COM_PROVEEDORES%ROWTYPE;
  v_comprt COM_PROVEEDORES_TIPOS%ROWTYPE;
  v_comres COM_RESPONSABLES%ROWTYPE;
  v_compre COM_PROVEEDORES_EST%ROWTYPE;
  --
  v_segorg         SEG_ORGANIZACIONES%ROWTYPE;
  v_segusu_id      SEG_USUARIOS.ID%TYPE;
  v_contrasenia    SEG_USUARIOS.CONTRASENIA%TYPE;
  v_segusu_usuario SEG_USUARIOS.USUARIO%TYPE;
  v_comprv_id      NUMBER;
  --
BEGIN
  -- Obtener los datos del trámite de proveedor
  COM_PKG.SET_COMTPR(p_id     => p_comtpr_id);
  COM_PKG.GET_COMTPR(p_comtpr => v_comtpr);
  COM_PKG.INI_COMTPR;
  --
  IF v_comtpr.id IS NULL THEN
    p_resultado := 'El Nro. de Trámite indicado es incorrecto.';
    raise_application_error(-20000,'Error 1 - '||p_resultado);
  END IF;
  --
  -- Solo se aceptan solicitudes Recepcionadas
  IF v_comtpr.situacion <> 'REC' THEN
    p_resultado := 'El Nro. de Trámite indicado no se encuentra recepcionado para ser aceptado.';
    raise_application_error(-20000,'Error 2- '||p_resultado);
  END IF;
  -- Invoco al preceso de Aceptacion segun Tipo de Tramite
  IF v_comtpr.TIPO = 'INSC' THEN
    -- Trámite Inscripción de Proveedor al Registro
    COM_PKG.COMTPR_ACEPTAR_INSC(p_comtpr_id => p_comtpr_id
                               ,p_comprv_id => v_comprv_id
                               ,p_resultado => p_resultado);
  ELSIF v_comtpr.TIPO = 'ACDP' THEN
    -- Trámite Cambio Datos Generales del Proveedor
    COM_PKG.COMTPR_ACEPTAR_ACDP(p_comtpr_id => p_comtpr_id
                               ,p_comprv_id => v_comprv_id
                               ,p_resultado => p_resultado);
  ELSIF v_comtpr.TIPO = 'ACRS' THEN
    -- Trámite Cambio Nombre/Razon_Social
    COM_PKG.COMTPR_ACEPTAR_ACRS(p_comtpr_id => p_comtpr_id
                               ,p_comprv_id => v_comprv_id
                               ,p_resultado => p_resultado);
  ELSIF v_comtpr.TIPO = 'ALRB' THEN
    -- Trámite Cambio de Rubros del Proveedor
    COM_PKG.COMTPR_ACEPTAR_ALRB(p_comtpr_id => p_comtpr_id
                               ,p_resultado => p_resultado);
    v_comprv_id := v_comtpr.comprv_id;
  ELSIF v_comtpr.TIPO = 'BAJA' THEN
    -- Trámite Dar de baja al Proveedor
    COM_PKG.BAJ_PRV(p_comprv_id => v_comtpr.comprv_id
                   ,p_descripcion => v_comtpr.DESCRIPCION_ACTIVIDAD);
    v_comprv_id := v_comtpr.comprv_id;
  ELSIF v_comtpr.TIPO = 'ALDC' THEN
    -- Trámite Cambio Domicilio Comercial al Proveedor
    COM_PKG.COMTPR_ACEPTAR_ALDC(p_comtpr_id => p_comtpr_id
                               ,p_resultado => p_resultado);
    v_comprv_id := v_comtpr.comprv_id;
  ELSIF v_comtpr.TIPO = 'ACDL' THEN
    -- Trámite Cambio Domicilio Comercial al Proveedor
    COM_PKG.COMTPR_ACEPTAR_ACDL(p_comtpr_id => p_comtpr_id
                               ,p_resultado => p_resultado);
    v_comprv_id := v_comtpr.comprv_id;
  ELSIF v_comtpr.TIPO = 'ACRP' THEN
    -- Trámite Cambio Responsable al Proveedor
    COM_PKG.COMTPR_ACEPTAR_ACRP(p_comtpr_id => p_comtpr_id
                               ,p_resultado => p_resultado);
    v_comprv_id := v_comtpr.comprv_id;
  ELSIF v_comtpr.TIPO = 'ACCB' THEN
    -- Trámite Cambio CBU
    COM_PKG.COMTPR_ACEPTAR_ACCB(p_comtpr_id => p_comtpr_id
                               ,p_comprv_id => v_comprv_id
                               ,p_resultado => p_resultado);
  ELSIF v_comtpr.TIPO = 'PDOC' THEN
    -- Trámite Documentacion
    COM_PKG.COMTPR_ACEPTAR_PDOC(p_comtpr_id => p_comtpr_id
                               ,p_comprv_id => v_comprv_id
                               ,p_resultado => p_resultado);
  ELSIF v_comtpr.TIPO = 'INOB' THEN
    -- Trámite Documentacion
    COM_PKG.COMTPR_ACEPTAR_INOB(p_comtpr_id => p_comtpr_id
                               ,p_comprv_id => v_comprv_id
                               ,p_resultado => p_resultado);
  ELSIF v_comtpr.TIPO = 'PROB' THEN
    -- Tramite Presentar Documentacion de Objeto
    COM_PKG.COMTPR_ACEPTAR_PROB(p_comtpr_id => p_comtpr_id
                               ,p_comprv_id => v_comprv_id
                               ,p_resultado => p_resultado);
  ELSIF v_comtpr.TIPO = 'BJOB' THEN
    -- Trámite Documentacion
    COM_PKG.COMTPR_ACEPTAR_BJOB(p_comtpr_id => p_comtpr_id
                               ,p_comprv_id => v_comprv_id
                               ,p_resultado => p_resultado);
  ELSIF v_comtpr.TIPO = 'PDOI' THEN
    -- Trámite Documentacion
    COM_PKG.COMTPR_ACEPTAR_PDOI(p_comtpr_id => p_comtpr_id
                               ,p_comprv_id => v_comprv_id
                               ,p_resultado => p_resultado);
  ELSIF v_comtpr.TIPO = 'INCT' THEN
    -- Trámite Inscripción Categorías
    COM_PKG.COMTPR_ACEPTAR_INCT(p_comtpr_id => p_comtpr_id
                               ,p_comprv_id => v_comprv_id
                               ,p_resultado => p_resultado);
  ELSIF v_comtpr.TIPO = 'AIAU' THEN
    -- Tramite Actualización Autoridades
    COM_PKG.COMTPR_ACEPTAR_AIAU(p_comtpr_id => p_comtpr_id
                               ,p_comprv_id => v_comprv_id
                               ,p_resultado => p_resultado);
  ELSIF v_comtpr.TIPO = 'BAJC' THEN
    -- Tramite Baja de Categoría y Autoridades
    COM_PKG.COMTPR_ACEPTAR_BAJC(p_comtpr_id => p_comtpr_id
                               ,p_comprv_id => v_comprv_id
                               ,p_resultado => p_resultado);
  ELSIF v_comtpr.TIPO = 'ADAU' THEN
    -- Tramite Actualización de Documentos de Autoridades
    COM_PKG.COMTPR_ACEPTAR_ADAU(p_comtpr_id => p_comtpr_id
                               ,p_comprv_id => v_comprv_id
                               ,p_resultado => p_resultado);
  ELSIF v_comtpr.TIPO = 'ARGP' THEN
    -- Tramite Actualización de Documentos de Autoridades
    COM_PKG.COMTPR_ACEPTAR_ARGP(p_comtpr_id => p_comtpr_id
                               ,p_comprv_id => v_comprv_id
                               ,p_resultado => p_resultado);
 -- ELSIF .....
  END IF;
  --
  -- Marcar la solicitud de inscripción como aprobada y vincularla al proveedor relacionado
  UPDATE COM_TRAMITES_PRV
  SET    SITUACION = 'APR'
        ,COMPRV_ID =  v_comprv_id
  WHERE ID = p_comtpr_id;
  --
  --Devuelvo el ID del nuevo proveedor
  p_comprv_id := v_comprv_id;
  --
END;
/* Proceso de Aceptacion del Trámite Cambio de Domicilio Legal */
PROCEDURE COMTPR_ACEPTAR_ACDL
 (P_COMTPR_ID IN COM_TRAMITES_PRV.ID%TYPE
 ,P_RESULTADO OUT VARCHAR2
 )
 IS
-- Declaracion de Cursores
  -- Obtener los domicilios del trámite
  CURSOR cr_comtpd IS
  SELECT *
  FROM COM_TRAMITES_PRV_DOM
  WHERE COMTPR_ID = p_comtpr_id;
  --
  -- Obtener los domicilios actuales
  CURSOR cr_comprd (p_comprv_id NUMBER)IS
  SELECT *
  FROM COM_PROVEEDORES_DOM
  WHERE COMPRV_ID = p_comprv_id
    AND COMDOM_ID IN (SELECT ID
                        FROM COM_DOMICILIOS
   			  		   WHERE COMDMT_ID IN (SELECT ID
					                        FROM COM_DOMICILIOS_TIPOS
					  					   WHERE CODIGO = 'PRV_LEGAL'));
  --
  -- Declaracion de variables
  v_comtpr COM_TRAMITES_PRV%ROWTYPE;
  v_comprv COM_PROVEEDORES%ROWTYPE;
  v_comprd COM_PROVEEDORES_DOM%ROWTYPE;
  --
BEGIN
  -- Obtener los datos del trámite de proveedor
  COM_PKG.SET_COMTPR(p_id     => p_comtpr_id);
  COM_PKG.GET_COMTPR(p_comtpr => v_comtpr);
  COM_PKG.INI_COMTPR;
  --
  -- Recorrer los domicilios del proveedor para eliminarlos
  FOR v_comprd IN cr_comprd(p_comprv_id => v_comtpr.comprv_id) LOOP
    -- Dar baja al domicilio del proveedor
    DELETE COM_PROVEEDORES_DOM
    WHERE ID = v_comprd.ID;
    --
  END LOOP;
  --
  v_comprd.ID := NULL;
  -- Recorrer los domicilios del trámite para relacionarlos al proveedor
  FOR v_comtpb IN cr_comtpd LOOP
    -- Vincular los domicilios al proveedor
    v_comprd.COMPRV_ID  := v_comtpr.comprv_id;
    v_comprd.COMDOM_ID  := v_comtpb.COMDOM_ID;
    v_comprd.SITUACION  := 'ACT';
    v_comprd.FECHA_VIGENCIA := SYSDATE;
    v_comprd.FECHA_VALIDEZ  := NULL;
    -- Insertar el vínculo
    COM_PKG.INS_COMPRD(p_comprd => v_comprd);
    --
  END LOOP;
  --
END;
/* Proceso de Aceptacion del Trámite Act de Docs de Autoridades */
PROCEDURE COMTPR_ACEPTAR_ADAU
 (P_COMTPR_ID IN COM_TRAMITES_PRV.ID%TYPE
 ,P_RESULTADO OUT VARCHAR2
 ,P_COMPRV_ID OUT COM_PROVEEDORES.ID%TYPE
 )
 IS
cursor cr_comtdp is
     select *
     from com_tramites_prv_doc
     where comtpr_id = p_comtpr_id;
  --
  cursor cr_compad(p_compdo_id number) is
      select *
        from com_proveedores_ado
       where compdo_id = p_compdo_id;

  -- Declaracion de variables
v_compad com_proveedores_ado%rowtype;
v_comtpr COM_TRAMITES_PRV%ROWTYPE;
  --
begin
  -- Obtener los datos del trámite de proveedor
  COM_PKG.SET_COMTPR(p_id     => p_comtpr_id);
  COM_PKG.GET_COMTPR(p_comtpr => v_comtpr);
  COM_PKG.INI_COMTPR;
  --
  if v_comtpr.ID is not null then
  --
   -- Activar el Documento/s Presentado
      for v_comtdp in cr_comtdp loop
          update com_proveedores_doc
             set situacion= 'ACT'
           where id = v_comtdp.COMPDO_ID;
          -- Obtener el tipo de documento subido y su autoridad
          open cr_compad(v_comtdp.COMPDO_ID);
          fetch cr_compad into v_compad;
          close cr_compad;
          -- Dar de baja el documento que actualmente estaba vigente para esa autoridad y ese tipo de documento
          update com_proveedores_ado
             set situacion = 'BAJ'
           where compra_id = v_compad.compra_id
             and compdt_id = v_compad.compdt_id
             and situacion = 'VIG';
         -- Colocar como vigente el nuevo documento subido.
          update com_proveedores_ado
             set situacion = 'VIG'
           where compdo_id = v_comtdp.COMPDO_ID;
          --
      end loop;
    --
  --
   p_comprv_id := v_comtpr.comprv_id;
   --
  end if;
  --
end;
PROCEDURE COMTPR_ACEPTAR_AIAU
 (P_COMTPR_ID IN NUMBER
 ,P_RESULTADO OUT NUMBER
 ,P_COMPRV_ID OUT NUMBER
 )
 IS
-- Autoridades del tramites
cursor cr_compra is
  select *
  from   com_proveedores_aut
  where  comtpr_id = p_comtpr_id
  and    situacion in ('NUE','MAR');

cursor cr_compad(p_compra_id number) is
    select *
    from com_proveedores_ado
    where compra_id = p_compra_id
    and   situacion = 'NUE';
v_comtpr COM_TRAMITES_PRV%rowtype;
--
begin
  -- Obtener los datos tramite de proveedor
  COM_PKG.SET_COMTPR(p_id => p_comtpr_id);
  COM_PKG.GET_COMTPR(p_comtpr => v_comtpr);
  COM_PKG.INI_COMTPR;
  --
  if v_comtpr.ID is not null then
    for v_compra in cr_compra loop
      --
      if v_compra.situacion= 'NUE' then
        update com_proveedores_aut
           set situacion = 'VIG'
              ,fecha_situacion = sysdate
        where  id = v_compra.ID;
        -- Activar los documentos relacionados a la autoridad
        for v_compad in cr_compad(v_compra.ID) loop
            update com_proveedores_doc
               set situacion = 'ACT'
             where id = v_compad.COMPDO_ID;
             --
             update com_proveedores_ado
                set situacion = 'VIG'
                   ,fecha_situacion = sysdate
              where id = v_compad.ID;
             --
        end loop;
      elsif v_compra.SITUACION = 'MAR' then
        update com_proveedores_aut
        set    situacion = 'BAJ'
              ,fecha_situacion = sysdate
        where  id = v_compra.ID;
      end if;
    end loop;
    --
    p_comprv_id := v_comtpr.COMPRV_ID;
    --
  end if;
  --
end;
/* Proceso de Aceptacion del Trámite Cambio de Domicilio Comercial */
PROCEDURE COMTPR_ACEPTAR_ALDC
 (P_COMTPR_ID IN COM_TRAMITES_PRV.ID%TYPE
 ,P_RESULTADO OUT VARCHAR2
 )
 IS
-- Declaracion de Cursores
  -- Obtener los domicilios del trámite
  CURSOR cr_comtpd IS
  SELECT *
  FROM COM_TRAMITES_PRV_DOM
  WHERE COMTPR_ID = p_comtpr_id;
  --
  -- Obtener los domicilios actuales
  CURSOR cr_comprd (p_comprv_id NUMBER)IS
  SELECT *
  FROM COM_PROVEEDORES_DOM
  WHERE COMPRV_ID = p_comprv_id
    AND COMDOM_ID IN (SELECT ID
                        FROM COM_DOMICILIOS
   			  		   WHERE COMDMT_ID IN (SELECT ID
					                        FROM COM_DOMICILIOS_TIPOS
					  					   WHERE CODIGO = 'PRV_COMERCIAL'));
  --
  -- Declaracion de variables
  v_comtpr COM_TRAMITES_PRV%ROWTYPE;
  v_comprv COM_PROVEEDORES%ROWTYPE;
  v_comprd COM_PROVEEDORES_DOM%ROWTYPE;
  --
BEGIN
  -- Obtener los datos del trámite de proveedor
  COM_PKG.SET_COMTPR(p_id     => p_comtpr_id);
  COM_PKG.GET_COMTPR(p_comtpr => v_comtpr);
  COM_PKG.INI_COMTPR;
  --
  -- Recorrer los domicilios del proveedor de darlos de Baja
  FOR v_comprd IN cr_comprd(p_comprv_id => v_comtpr.comprv_id) LOOP
    -- Dar baja al domicilio del proveedor
    DELETE COM_PROVEEDORES_DOM
    WHERE ID = v_comprd.ID;
    --
  END LOOP;
  -- Recorrer los domicilios del trámite para relacionarlos al proveedor
  FOR v_comtpb IN cr_comtpd LOOP
    -- Vincular los domicilios al proveedor
    v_comprd.COMPRV_ID  := v_comtpr.comprv_id;
    v_comprd.COMDOM_ID  := v_comtpb.COMDOM_ID;
    v_comprd.SITUACION  := 'ACT';
    v_comprd.FECHA_VIGENCIA := SYSDATE;
    v_comprd.FECHA_VALIDEZ  := NULL;
    -- Insertar el vínculo
    COM_PKG.INS_COMPRD(p_comprd => v_comprd);
    --
  END LOOP;
  --
END;
/* Proceso de Aceptacion delTrámite Proveedor  Cambio de Rubros */
PROCEDURE COMTPR_ACEPTAR_ALRB
 (P_COMTPR_ID IN COM_TRAMITES_PRV.ID%TYPE
 ,P_RESULTADO OUT VARCHAR2
 )
 IS
-- Declaracion de Cursores
  -- Obtener los rubros del trámite
  CURSOR cr_comtpb IS
  SELECT *
  FROM COM_TRAMITES_PRV_RUB
  WHERE COMTPR_ID = p_comtpr_id;
  --
  -- Obtener los rubros Activos del porveedor
  CURSOR cr_comprr (p_comprv_id NUMBER)IS
  SELECT *
  FROM COM_PROVEEDORES_RUB
  WHERE COMPRV_ID = p_comprv_id
    AND SITUACION = 'ACT';
  --
  -- Declaracion de variables
  v_comtpr COM_TRAMITES_PRV%ROWTYPE;
  v_comprv COM_PROVEEDORES%ROWTYPE;
  v_comprr COM_PROVEEDORES_RUB%ROWTYPE;
  --
BEGIN
  -- Obtener los datos del trámite de proveedor
  COM_PKG.SET_COMTPR(p_id     => p_comtpr_id);
  COM_PKG.GET_COMTPR(p_comtpr => v_comtpr);
  COM_PKG.INI_COMTPR;
  --
  -- Recorrer los rubros del proveedor de darlos de Baja
  FOR v_comprr IN cr_comprr(p_comprv_id => v_comtpr.comprv_id) LOOP
    -- Dar baja al rubro del proveedor
    UPDATE COM_PROVEEDORES_RUB
    SET SITUACION    = 'BAJ'
       ,FECHA_VALIDEZ= SYSDATE
    WHERE ID = v_comprr.ID;
    --
  END LOOP;
  -- Recorrer los rubros del trámite para relacionarlos al proveedor
  FOR v_comtpb IN cr_comtpb LOOP
    -- Vincular los rubros al proveedor
    v_comprr.COMPRV_ID  := v_comtpr.comprv_id;
    v_comprr.COMRUB_ID  := v_comtpb.COMRUB_ID;
    v_comprr.SITUACION  := 'ACT';
    v_comprr.OBSERVACION:= v_comtpb.OBSERVACION;
    v_comprr.FECHA_VIGENCIA := SYSDATE;
    v_comprr.FECHA_VALIDEZ  := NULL;
    -- Insertar el vínculo
    COM_PKG.INS_COMPRR(p_comprr => v_comprr);
    --
  END LOOP;
  --
END;
/* Proceso de Aceptacion del Trámite Cambio Nombre/Razon Social */
PROCEDURE COMTPR_ACEPTAR_ACRS
 (P_COMTPR_ID IN COM_TRAMITES_PRV.ID%TYPE
 ,P_RESULTADO OUT VARCHAR2
 ,P_COMPRV_ID OUT COM_PROVEEDORES.ID%TYPE
 )
 IS
-- Declaracion de variables
  v_comtpr COM_TRAMITES_PRV%ROWTYPE;
  --
BEGIN
  -- Obtener los datos del trámite de proveedor
  COM_PKG.SET_COMTPR(p_id     => p_comtpr_id);
  COM_PKG.GET_COMTPR(p_comtpr => v_comtpr);
  COM_PKG.INI_COMTPR;
  --
  IF v_comtpr.ID IS NOT NULL THEN
   -- Actualizar el Proveedor
   UPDATE COM_PROVEEDORES
   SET NOMBRE = v_comtpr.NOMBRE
   WHERE ID = v_comtpr.COMPRV_ID;
   --
   p_comprv_id := v_comtpr.comprv_id;
   --
  END IF;
  --
END;
/* Proceso de Aceptacion del Trámite Cambio Datos Generales del Prov */
PROCEDURE COMTPR_ACEPTAR_ACDP
 (P_COMTPR_ID IN COM_TRAMITES_PRV.ID%TYPE
 ,P_RESULTADO OUT VARCHAR2
 ,P_COMPRV_ID OUT COM_PROVEEDORES.ID%TYPE
 )
 IS
-- Declaracion de variables
  v_comtpr COM_TRAMITES_PRV%ROWTYPE;
  --
BEGIN
  -- Obtener los datos del trámite de proveedor
  COM_PKG.SET_COMTPR(p_id     => p_comtpr_id);
  COM_PKG.GET_COMTPR(p_comtpr => v_comtpr);
  COM_PKG.INI_COMTPR;
  --
  IF v_comtpr.ID IS NOT NULL THEN
   -- Actualizar el Proveedor
   UPDATE COM_PROVEEDORES
   SET DESCRIPCION_ACTIVIDAD = v_comtpr.DESCRIPCION_ACTIVIDAD
      ,EMAIL                 = v_comtpr.EMAIL
      ,CONDICION_IB          = v_comtpr.CONDICION_IB
      ,NUMERO_INSCRIPCION_IB = v_comtpr.NUMERO_INSCRIPCION_IB
      ,FECHA_INSCRIPCION_IB  = v_comtpr.FECHA_INSCRIPCION_IB
      ,NUMERO_CONVENIO_MULTILATERAL = v_comtpr.NUMERO_CONVENIO_MULTILATERAL
   WHERE ID = v_comtpr.COMPRV_ID;
   --
   p_comprv_id := v_comtpr.comprv_id;
   --
  END IF;
  --
END;
/* Proceso de Aceptacion del Trámite Cambio de Responsables */
PROCEDURE COMTPR_ACEPTAR_ACRP
 (P_COMTPR_ID IN COM_TRAMITES_PRV.ID%TYPE
 ,P_RESULTADO OUT VARCHAR2
 )
 IS
-- Declaracion de Cursores
  -- Obtener los responsables del trámite
  CURSOR cr_comtps IS
  SELECT *
  FROM COM_TRAMITES_PRV_RES
  WHERE COMTPR_ID = p_comtpr_id;
  --
  -- Obtener los responsables actuales
  CURSOR cr_comprs (p_comprv_id NUMBER)IS
  SELECT *
  FROM COM_PROVEEDORES_RES
  WHERE COMPRV_ID = p_comprv_id;
  --
  --Obtener si esta vinculado el proveedor - usuario - responsable
  CURSOR cr_comprs_vin (p_comres_id NUMBER, p_segusu_id NUMBER, p_comprv_id NUMBER)IS
  SELECT *
  FROM COM_PROVEEDORES_RES COMPRS
  WHERE COMPRS.COMRES_ID = p_comres_id
    AND COMPRS.SEGUSU_ID = p_segusu_id
    AND COMPRS.COMPRV_ID = p_comprv_id;
  --
  -- Declaracion de variables
  v_comtpr  COM_TRAMITES_PRV%ROWTYPE;
  v_comprv  COM_PROVEEDORES%ROWTYPE;
  v_comprs  COM_PROVEEDORES_RES%ROWTYPE;
  v_segusu  SEG_USUARIOS%ROWTYPE;
  v_comres  COM_RESPONSABLES%ROWTYPE;
 --
  v_comprt         COM_PROVEEDORES_TIPOS%ROWTYPE;
  v_segorg         SEG_ORGANIZACIONES%ROWTYPE;
  v_contrasenia    SEG_USUARIOS.CONTRASENIA%TYPE;
  v_segusu_usuario SEG_USUARIOS.USUARIO%TYPE;
  v_segusu_id      SEG_USUARIOS.ID%TYPE;
  v_segpfl         SEG_PERFILES%ROWTYPE;
  v_segpus         SEG_PERFILES_USUARIOS%ROWTYPE;
  --
BEGIN
  -- Obtener los datos de COM_TRAMITES_PRV
  COM_PKG.SET_COMTPR(p_id     => p_comtpr_id);
  COM_PKG.GET_COMTPR(p_comtpr => v_comtpr);
  COM_PKG.INI_COMTPR;
  --
  -- Recorro COM_PROVEEDORES_RES para dar de Baja los responsbles actuales
  FOR v_comprs IN cr_comprs(p_comprv_id => v_comtpr.comprv_id) LOOP
    --
    UPDATE COM_PROVEEDORES_RES
       SET SITUACION     = 'BAJ'
         , FECHA_VALIDEZ = SYSDATE
    WHERE ID = v_comprs.ID;
    --
    UPDATE SEG_USUARIOS
       SET SITUACION     = 'SUS'
    WHERE ID = v_comprs.SEGUSU_ID;
    --
  END LOOP;
  --
  --
  -- Busco los responsables enlazados al proveedor en COM_TRAMITES_PRV_RES para enlazarlos en COM_PROVEEDORES_RES
  FOR v_comtps IN cr_comtps  LOOP
    --
    v_comprs := null;
    --
    -- Obtener datos de la organización del tramite
    SEG_PKG.SET_SEGORG(p_id     => v_comtpr.SEGORG_ID);
    SEG_PKG.GET_SEGORG(p_segorg => v_segorg);
    SEG_PKG.INI_SEGORG;
    --
    -- Obtener datos del responsable
    COM_PKG.SET_COMRES(p_id => v_comtps.COMRES_ID);
    COM_PKG.GET_COMRES(p_comres => v_comres);
    COM_PKG.INI_COMRES;
    --
    -- Armo el usuario del Responsable: El código de la organización + Codigo de Tipo de Usuario (PRVCOM) + CUIT del proveedor + Tipo de documento del responsable + Numero de documento
    v_segusu_usuario := v_segorg.codigo||'.PRVCOM.'||v_comtpr.CUIT||'.'||v_comres.tipo_documento||'.'||v_comres.numero_documento;
    --
    --Traigo el id del Usuario del Responsable
    SEG_PKG.SET_SEGUSU_USUARIO(p_usuario => v_segusu_usuario);
    SEG_PKG.GET_SEGUSU(p_segusu => v_segusu);
    SEG_PKG.INI_SEGUSU;
    --
    -- Verfico si esta vinculado el proveedor - usuario - responsable
    OPEN cr_comprs_vin (p_comres_id => v_comres.ID
                       ,p_segusu_id => v_segusu.ID
                       ,p_comprv_id => v_comtpr.comprv_id) ;
    FETCH cr_comprs_vin INTO v_comprs;
    CLOSE cr_comprs_vin;
    --
    --Si v_comprs.id trae datos el responsable ya esta ligado hago un update para activarlo
    IF v_comprs.id IS NOT NULL THEN
      --
      UPDATE COM_PROVEEDORES_RES
         SET SITUACION = 'ACT'
           , FECHA_VALIDEZ = NULL
       WHERE ID = v_comprs.id;
      --
      --
      UPDATE SEG_USUARIOS
         SET SITUACION     = 'ACT'
      WHERE ID = v_comprs.SEGUSU_ID;
      --
    ELSE
      --
      -- Obtengo los datos del tipo de proveedor para determinar si se debe generar usuario
      COM_PKG.SET_COMPRT(p_id     => v_comtpr.COMPRT_ID);
      COM_PKG.GET_COMPRT(p_comprt => v_comprt);
      COM_PKG.INI_COMPRT;
      --
      -- Generar el usuario si el tipo de proveedor así lo indica
      IF v_comprt.GENERAR_USUARIO_SN = 'SI' THEN
          --
          -- Generar el Usuario al Responsable del proveedor
          -- Armar la contraseña inicial
          v_contrasenia := COM_PKG.OBTN_CONTRASENIA(v_comres.nombre,v_comres.numero_documento);
          --
          -- Invocar al proceso de generacion del usuario
          BEGIN
            SEG_PKG.SEGUSU_CREAR(p_segusu_usuario          => v_segusu_usuario
                                ,p_segusu_contrasenia      => v_contrasenia
                                ,p_segprs_observaciones    => v_comres.observacion
                                ,p_segprs_nombre           => v_comres.nombre
                                ,p_segprs_email            => v_comres.email
                                ,p_segprs_tipo_documento   => v_comres.tipo_documento
                                ,p_segprs_numero_documento => v_comres.numero_documento
                                ,p_segorg_id               => v_comtpr.SEGORG_ID
                                ,p_segrol_codigo           => null
                                ,p_segapl_codigo           => 'PRVCOM'
                                ,p_resultado               => p_resultado
                                ,p_segusu_id               => v_segusu_id );
          EXCEPTION
            WHEN OTHERS THEN
              p_resultado := 'Error al generar el usuario';
              raise_application_error(-20000,'Error 3 - '||p_resultado);
          END;
        --
        -- Asigno Perfil al Usuario
        IF v_segusu_id IS NOT NULL THEN
          --
            SEG_PKG.SET_SEGPFL_CODIGO(p_segpfl_codigo => 'PRVCOM_ADMIN');
            SEG_PKG.GET_SEGPFL(v_segpfl);
            --
            IF v_segpfl.ID IS NULL THEN
                p_resultado := p_resultado||' El Perfil que intenta asignar al Responsable no Existe en la Organización.';
            ELSE
                v_segpus.SEGPFL_ID      := v_segpfl.ID;
                v_segpus.SEGUSU_ID      := v_segusu_id;
                v_segpus.FECHA_VIGENCIA := SYSDATE;
                v_segpus.FECHA_VALIDEZ  := NULL;
                SEG_PKG.INS_SEGPUS(P_SEGPUS => V_SEGPUS);
            END IF;
            --
          --
        END IF;
        --
        -- Vinculo el nuevo responsable con el proveedor
        v_comprs.COMPRV_ID  := v_comtpr.comprv_id;
        v_comprs.COMRES_ID  := v_comtps.COMRES_ID;
        v_comprs.SEGUSU_ID  := v_segusu_id;
        v_comprs.SITUACION  := 'ACT';
        v_comprs.FECHA_VIGENCIA := SYSDATE;
        v_comprs.FECHA_VALIDEZ  := NULL;
        -- Insertar el vinculo en COM_PROVEEDORES_RES
        COM_PKG.INS_COMPRS(p_comprs => v_comprs);
        --
      END IF;
      --
    END IF;
    --
  END LOOP;
  --
END;
/* Aceptar tramite de Actualizacion de Tipos de registro. */
PROCEDURE COMTPR_ACEPTAR_ARGP
 (P_COMTPR_ID IN NUMBER
 ,P_COMPRV_ID OUT NUMBER
 ,P_RESULTADO OUT VARCHAR2
 )
 IS
cursor cr_comtpg is
    select comtpg.comrgp_id  comrgp_id
      from com_tramites_prv_rgp comtpg
     where comtpg.comtpr_id = p_comtpr_id;
--
v_comprg com_proveedores_rgp%rowtype;
v_comtpr com_tramites_prv%rowtype;
begin
  -- Obtener los datos del trámite de proveedor
  COM_PKG.SET_COMTPR(p_id     => p_comtpr_id);
  COM_PKG.GET_COMTPR(p_comtpr => v_comtpr);
  COM_PKG.INI_COMTPR;
  --
  -- Dar de baja los tipos de registros a los que se encontraba asociado el proveedor
  update com_proveedores_rgp
  set validez_fch = sysdate
  where comprv_id = v_comtpr.comprv_id
    and situacion = 'VIG';
  -- Cargar los nuevos Tipos de Registro
  for v_comtpg in cr_comtpg loop
   v_comprg.COMPRV_ID := v_comtpr.COMPRV_ID;
   v_comprg.COMRGP_ID := v_comtpg.COMRGP_ID;
   v_comprg.VIGENCIA_FCH := sysdate;
   v_comprg.VALIDEZ_FCH := null;
   --
   COMPRV_PKG.COMPRG_INS(p_comprg => v_comprg);
   --
   end loop;
   --
   p_comprv_id := v_comtpr.comprv_id;
end;
/* Proceso de Aceptacion del Trámite Baja de Categoría */
PROCEDURE COMTPR_ACEPTAR_BAJC
 (P_COMTPR_ID IN COM_TRAMITES_PRV.ID%TYPE
 ,P_RESULTADO OUT VARCHAR2
 ,P_COMPRV_ID OUT COM_PROVEEDORES.ID%TYPE
 )
 IS
cursor cr_compra is
  select *
    from com_proveedores_aut
   where comtpr_id = p_comtpr_id;
  --

  /*cursor cr_comtdp is
    select *
    from COM_TRAMITES_PRV_DOC
    where comtpr_id = p_comtpr_id;*/

  -- Declaracion de variables
  v_comtpr COM_TRAMITES_PRV%ROWTYPE;
  --v_comtdp COM_TRAMITES_PRV_DOC%ROWTYPE;
  --
begin
  --open cr_comtdp;
  --fetch  cr_comtdp into v_comtdp;
  --close cr_comtdp;
  -- Obtener los datos del trámite de proveedor
  COM_PKG.SET_COMTPR(p_id     => p_comtpr_id);
  COM_PKG.GET_COMTPR(p_comtpr => v_comtpr);
  COM_PKG.INI_COMTPR;
  --
  if v_comtpr.ID is not null then
    -- Dar de baja Autoridades
    for v_compra in cr_compra loop
      update com_proveedores_aut
      set situacion = 'BAJ'
        , fecha_situacion= SYSDATE
      where id = v_compra.id;
    end loop;
    --
    -- Activar el documento
    -- update com_proveedores_doc
    -- set SITUACION = 'ACT'
    -- where id = v_comtdp.compdo_id;
    --
    -- Quitar Categoría al Proveedor
    update com_proveedores
    set    compct_id = null
    where  id = v_comtpr.comprv_id;
    --
    p_comprv_id := v_comtpr.comprv_id;
   --
  end if;
  --
end;
/* Proceso Baja de Objetos de Especialidades */
PROCEDURE COMTPR_ACEPTAR_BJOB
 (P_COMTPR_ID IN COM_TRAMITES_PRV.ID%TYPE
 ,P_RESULTADO OUT VARCHAR2
 ,P_COMPRV_ID OUT COM_PROVEEDORES.ID%TYPE
 )
 IS
-- Declaracion de variables
  --
  cursor cr_comtpo is
  select *
    from COM_TRAMITES_PRV_OBJ
   where COMTPR_ID = p_comtpr_id;
  --
  v_comtpr COM_TRAMITES_PRV%ROWTYPE;
  v_comtpo CR_COMTPO%ROWTYPE;
  v_comobj COM_OBJETOS%rowtype;
  v_comobe_crear COM_OBJETOS_EST%rowtype;

  --
BEGIN
  -- Obtener los datos del trámite de proveedor
  COM_PKG.SET_COMTPR(p_id     => p_comtpr_id);
  COM_PKG.GET_COMTPR(p_comtpr => v_comtpr);
  COM_PKG.INI_COMTPR;
  --
  IF v_comtpr.ID IS NOT NULL THEN
    --
    OPEN cr_comtpo;
    FETCH cr_comtpo INTO v_comtpo;
    CLOSE cr_comtpo;
    --
    v_comobe_crear.COMOBJ_ID             := v_comtpo.COMOBJ_ID;
    v_comobe_crear.ESTADO                := 'ANU';
    v_comobe_crear.FECHA                 := SYSDATE;
    v_comobe_crear.MOTIVO                := ' ';
    v_comobe_crear.MOTIVO                := v_comtpo.OBSERVACION;
    --
    COMPRV_PKG.COMOBE_INS(p_comobe => v_comobe_crear);
    --
    update com_objetos_doc
    set SITUACION = 'INV'
      , MOTIVO_SITUACION = v_comtpo.OBSERVACION
    where COMOBJ_ID = v_comtpo.COMOBJ_ID;
    --
    COMPRV_PKG.COMOBJ_SET(p_id     => v_comtpo.COMOBJ_ID);
    COMPRV_PKG.COMOBJ_GET(p_comobj => v_comobj);
    COMPRV_PKG.COMOBJ_INI;
    --
    p_comprv_id := v_comobj.COMPRV_ID;
   --
  END IF;
  --
END;
/* Proceso de Aceptacion del Trámite Inscripcion de Categorías */
PROCEDURE COMTPR_ACEPTAR_INCT
 (P_COMTPR_ID IN COM_TRAMITES_PRV.ID%TYPE
 ,P_RESULTADO OUT VARCHAR2
 ,P_COMPRV_ID OUT COM_PROVEEDORES.ID%TYPE
 )
 IS
cursor cr_compra is
      select *
        from com_proveedores_aut
       where comtpr_id = p_comtpr_id;
  --
  cursor cr_compad(p_compra_id number) is
      select *
        from com_proveedores_ado
       where compra_id = p_compra_id
         and situacion = 'NUE';

  -- Declaracion de variables
  v_comtpr COM_TRAMITES_PRV%ROWTYPE;
  v_compct_id number;
  v_compcc COM_PROVEEDORES_CAR%ROWTYPE;
  --
begin
  -- Obtener los datos del trámite de proveedor
  COM_PKG.SET_COMTPR(p_id     => p_comtpr_id);
  COM_PKG.GET_COMTPR(p_comtpr => v_comtpr);
  COM_PKG.INI_COMTPR;
  --
  if v_comtpr.ID is not null then
  --
   -- Activar el Documento/s Presentado
    for v_compra in cr_compra loop
      --
      for v_compad in cr_compad(v_compra.id)loop
          update com_proveedores_doc
             set situacion = 'ACT'
           where id = v_compad.COMPDO_ID;
          --
          update com_proveedores_ado
             set situacion = 'VIG'
                ,fecha_situacion = sysdate
           where id = v_compad.ID;
      end loop;
          -- Activar Autoridades
          update com_proveedores_aut
             set situacion = 'VIG'
                ,fecha_situacion = sysdate
          where id = v_compra.id;
         -- Obtener Categoría
        if v_compct_id is null then
          COMPRV_PKG.COMPCC_SET(p_id     => v_compra.compcc_id);
          COMPRV_PKG.COMPCC_GET(p_compcc => v_compcc);
          COMPRV_PKG.COMPCC_INI;
          v_compct_id := v_compcc.compct_id;
        end if;
      end loop;
    --
    --Asignar Categoría al Proveedor
    update com_proveedores
       set compct_id = v_compct_id
     where id = v_comtpr.comprv_id;
   --
   p_comprv_id := v_comtpr.comprv_id;
   --
  end if;
  --
end;
/* Proceso Inscripción de Objetos de Especialidades */
PROCEDURE COMTPR_ACEPTAR_INOB
 (P_COMTPR_ID IN COM_TRAMITES_PRV.ID%TYPE
 ,P_RESULTADO OUT VARCHAR2
 ,P_COMPRV_ID OUT COM_PROVEEDORES.ID%TYPE
 )
 IS
-- Declaracion de variables
  --
  cursor cr_comtpo is
  select *
    from COM_TRAMITES_PRV_OBJ
   where COMTPR_ID = p_comtpr_id;
  --
  v_comtpr COM_TRAMITES_PRV%ROWTYPE;
  v_comtpo CR_COMTPO%ROWTYPE;
  v_comobj COM_OBJETOS%rowtype;
  v_comobe_crear COM_OBJETOS_EST%rowtype;

  --
BEGIN
  -- Obtener los datos del trámite de proveedor
  COM_PKG.SET_COMTPR(p_id     => p_comtpr_id);
  COM_PKG.GET_COMTPR(p_comtpr => v_comtpr);
  COM_PKG.INI_COMTPR;
  --
  IF v_comtpr.ID IS NOT NULL THEN
    --
    OPEN cr_comtpo;
    FETCH cr_comtpo INTO v_comtpo;
    CLOSE cr_comtpo;
    --
    v_comobe_crear.COMOBJ_ID             := v_comtpo.COMOBJ_ID;
    v_comobe_crear.ESTADO                := 'HAB';
    v_comobe_crear.FECHA                 := SYSDATE;
    v_comobe_crear.MOTIVO                := ' ';
    --
    COMPRV_PKG.COMOBE_INS(p_comobe => v_comobe_crear);
    --
    update com_objetos_doc
    set SITUACION = 'VAL'
    where COMOBJ_ID = v_comtpo.COMOBJ_ID;
    --
    COMPRV_PKG.COMOBJ_SET(p_id     => v_comtpo.COMOBJ_ID);
    COMPRV_PKG.COMOBJ_GET(p_comobj => v_comobj);
    COMPRV_PKG.COMOBJ_INI;
    --
    p_comprv_id := v_comobj.COMPRV_ID;
   --
  END IF;
  --
END;
/* Proceso de Aceptacion delTrámite Proveedor Solicitud de Incripción */
PROCEDURE COMTPR_ACEPTAR_INSC
 (P_COMTPR_ID IN COM_TRAMITES_PRV.ID%TYPE
 ,P_RESULTADO OUT VARCHAR2
 ,P_COMPRV_ID OUT COM_PROVEEDORES.ID%TYPE
 )
 IS
-- Declaracion de Cursores
  -- Obtener los domicilios del trámite
  cursor cr_comtpd is
    select *
    from COM_TRAMITES_PRV_DOM
    where COMTPR_ID = p_comtpr_id;
  -- Obtener los rubros del trámite
  cursor cr_comtpb is
    select *
    from COM_TRAMITES_PRV_RUB
    where COMTPR_ID = p_comtpr_id;
  -- Obtener los responsables del trámite
  cursor cr_comtps is
    select *
    from COM_TRAMITES_PRV_RES
    where COMTPR_ID = p_comtpr_id;
  -- Obtener registros de proveedores
  cursor cr_comtpg is
    select *
    from COM_TRAMITES_PRV_RGP comtpg
    where comtpg.COMTPR_ID = p_comtpr_id;
  -- Declaracion de variables
  v_comtpr COM_TRAMITES_PRV%rowtype;
  v_comprv COM_PROVEEDORES%rowtype;
  v_comprd COM_PROVEEDORES_DOM%rowtype;
  v_comprr COM_PROVEEDORES_RUB%rowtype;
  v_comprs COM_PROVEEDORES_RES%rowtype;
  v_comprt COM_PROVEEDORES_TIPOS%rowtype;
  v_comres COM_RESPONSABLES%rowtype;
  v_compre COM_PROVEEDORES_EST%rowtype;
  v_comprg COM_PROVEEDORES_RGP%rowtype;
  --
  v_segorg         SEG_ORGANIZACIONES%rowtype;
  v_segusu_id      SEG_USUARIOS.ID%type;
  v_contrasenia    SEG_USUARIOS.CONTRASENIA%type;
  V_segusu_usuario SEG_USUARIOS.USUARIO%type;
  v_segpfl         SEG_PERFILES%rowtype;
  v_segpus         SEG_PERFILES_USUARIOS%rowtype;
  --
  v_comtpg cr_comtpg%rowtype;
begin
  -- Obtener los datos del trámite de proveedor
  COM_PKG.SET_COMTPR(p_id     => p_comtpr_id);
  COM_PKG.GET_COMTPR(p_comtpr => v_comtpr);
  COM_PKG.INI_COMTPR;
  --
  v_comprv.ID := COMPRV_ID.nextval;
  --
  v_comprv.SEGORG_ID             := v_comtpr.SEGORG_ID;
  v_comprv.COMPRT_ID             := v_comtpr.COMPRT_ID;
  v_comprv.CUIT                  := v_comtpr.CUIT;
  v_comprv.NOMBRE                := v_comtpr.NOMBRE;
  v_comprv.DESCRIPCION_ACTIVIDAD := v_comtpr.DESCRIPCION_ACTIVIDAD;
  v_comprv.EMAIL                 := v_comtpr.EMAIL;
  v_comprv.CONDICION_IB          := v_comtpr.CONDICION_IB;
  v_comprv.NUMERO_INSCRIPCION_IB := v_comtpr.NUMERO_INSCRIPCION_IB;
  v_comprv.FECHA_INSCRIPCION_IB  := v_comtpr.FECHA_INSCRIPCION_IB;
  v_comprv.NUMERO_CONVENIO_MULTILATERAL := v_comtpr.NUMERO_CONVENIO_MULTILATERAL;
  v_comprv.CBU                   := v_comtpr.CBU;
  -- Insertar el registro del proveedor
  COM_PKG.INS_COMPRV(p_comprv => v_comprv);
  --Devuelvo el Id del nuevo proveedor
  P_COMPRV_ID := V_COMPRV.ID;
  --
  open cr_comtpg;
  fetch cr_comtpg into v_comtpg;
  close cr_comtpg;
  --
  -- Vincular el proveedor creado al registro de proveedores
  v_comprg.ID := COMPRG_ID.nextval;
  v_comprg.COMPRV_ID := v_comprv.ID;
  v_comprg.COMRGP_ID := v_comtpg.COMRGP_ID;
  v_comprg.VIGENCIA_FCH := sysdate;
  v_comprg.VALIDEZ_FCH := null;
  v_comprg.SITUACION := 'VIG';
  --
  COMPRV_PKG.COMPRG_INS(p_comprg => v_comprg);
  -- Recorrer los domicilios del trámite para relacionarlos al proveedor
  FOR v_comtpd IN cr_comtpd  LOOP
    -- Vincular los domicilios al proveedor
    v_comprd.COMPRV_ID  := v_comprv.ID;
    v_comprd.COMDOM_ID  := v_comtpd.COMDOM_ID;
    v_comprd.SITUACION  := 'ACT';
    v_comprd.FECHA_VIGENCIA := SYSDATE;
    v_comprd.FECHA_VALIDEZ  := NULL;
    -- Insertar el vinculo
    COM_PKG.INS_COMPRD(p_comprd => v_comprd);
    --
  END LOOP;
  --
  -- Recorrer los rubros del trámite para relacionarlos al proveedor
  FOR v_comtpb IN cr_comtpb LOOP
    -- Vincular los rubros al proveedor
    v_comprr.COMPRV_ID  := v_comprv.ID;
    v_comprr.COMRUB_ID  := v_comtpb.COMRUB_ID;
    v_comprr.SITUACION  := 'ACT';
    v_comprr.OBSERVACION:= v_comtpb.OBSERVACION;
    v_comprr.FECHA_VIGENCIA := SYSDATE;
    v_comprr.FECHA_VALIDEZ  := NULL;
    -- Insertar el vínculo
    COM_PKG.INS_COMPRR(p_comprr => v_comprr);
    --
  END LOOP;
  --
  -- Recorrer los responsables del trámite para relacionarlos al proveedor
  FOR v_comtps IN cr_comtps  LOOP
    -- Inicializar las variables necesarias
    v_segusu_id := NULL;
    --
    -- Obtener los datos del tipo de proveedor para determinar si se debe generar usuario
    COM_PKG.SET_COMPRT(p_id     => v_comtpr.COMPRT_ID);
    COM_PKG.GET_COMPRT(p_comprt => v_comprt);
    COM_PKG.INI_COMPRT;
    -- Generar el usuario si el tipo de proveedor así lo indica
    IF v_comprt.GENERAR_USUARIO_SN = 'SI' THEN
      --
      -- Generar el Usuario al responsable del proveedor
      --
      -- Obtener los datos de la organización
      SEG_PKG.SET_SEGORG(p_id     => v_comprv.SEGORG_ID);
      SEG_PKG.GET_SEGORG(p_segorg => v_segorg);
      SEG_PKG.INI_SEGORG;
      --
      -- Obtener la información del responsable para generar el usuario correspondiente
      COM_PKG.SET_COMRES(p_id => v_comtps.COMRES_ID);
      COM_PKG.GET_COMRES(p_comres => v_comres);
      COM_PKG.INI_COMRES;
      --
      -- Armar la contraseña inicial
      v_contrasenia := COM_PKG.OBTN_CONTRASENIA(v_comres.nombre,v_comres.numero_documento);
      -- Armar el nombre del usuario
      -- El código de la organización + Codigo de Tipo de Usuario (PRVCOM)
      -- + CUIT del proveedor + Tipo de documento del responsable + Numero de documento
      v_segusu_usuario := v_segorg.codigo||'.PRVCOM.'||v_comtpr.CUIT||'.'||
                          v_comres.tipo_documento||'.'||v_comres.numero_documento;
      --
      -- Invocar al proceso de generacion del usuario
      BEGIN
        SEG_PKG.SEGUSU_CREAR(p_segusu_usuario          => v_segusu_usuario
                            ,p_segusu_contrasenia      => v_contrasenia
                            ,p_segprs_observaciones    => v_comres.observacion
                            ,p_segprs_nombre           => v_comres.nombre
                            ,p_segprs_email            => v_comres.email
                            ,p_segprs_tipo_documento   => v_comres.tipo_documento
                            ,p_segprs_numero_documento => v_comres.numero_documento
                            ,p_segorg_id               => v_comprv.SEGORG_ID
                            ,p_segrol_codigo           => null
                            ,p_segapl_codigo           => null
                            ,p_resultado               => p_resultado
                            ,p_segusu_id               => v_segusu_id );
      EXCEPTION
        WHEN OTHERS THEN
          p_resultado := 'Error al intentar generar el usuario al proveedor';
          raise_application_error(-20000,p_resultado,true);
      END;
      --
    END IF;
    --
    -- Asigno Perfil al Usuario
    IF v_segusu_id IS NOT NULL THEN
        SEG_PKG.SET_SEGPFL_CODIGO(p_segpfl_codigo => 'PRVCOM_ADMIN');
        SEG_PKG.GET_SEGPFL(v_segpfl);
        IF v_segpfl.ID IS NULL THEN
            p_resultado := p_resultado||' El Perfil que intenta asignar al Responsable no Existe en la Organización.';
        ELSE
            v_segpus.SEGPFL_ID      := v_segpfl.ID;
            v_segpus.SEGUSU_ID      := v_segusu_id;
            v_segpus.FECHA_VIGENCIA := SYSDATE;
            v_segpus.FECHA_VALIDEZ  := NULL;
            SEG_PKG.INS_SEGPUS(P_SEGPUS => V_SEGPUS);
        END IF;
    END IF;
    --
    -- Vincular el responsable con el proveedor
    v_comprs.COMPRV_ID  := v_comprv.ID;
    v_comprs.COMRES_ID  := v_comtps.COMRES_ID;
    v_comprs.SEGUSU_ID  := v_segusu_id;
    v_comprs.SITUACION  := 'ACT';
    v_comprs.FECHA_VIGENCIA := SYSDATE;
    v_comprs.FECHA_VALIDEZ  := NULL;
    -- Insertar el vinculo
    COM_PKG.INS_COMPRS(p_comprs => v_comprs);
    --
  END LOOP;
  -- Generar el estado del proveedor
  v_compre.COMPRV_ID      := v_comprv.ID;
  v_compre.ESTADO         := 'PEN';
  v_compre.FECHA_VIGENCIA := SYSDATE;
  v_compre.FECHA_VALIDEZ  := NULL;
  v_compre.COMDOC_ID      := NULL;
  v_compre.DESCRIPCION    := 'Trámite Solicitud de Inscripción N°'||to_char(p_comtpr_id);
  v_compre.SITUACION      := 'VAL';
  --
  -- Insertar registro del estado
  COM_PKG.INS_COMPRE(p_compre => v_compre);
  --
end;
/* Proceso de Aceptacion del Trámite Presentacion Documentos Internos */
PROCEDURE COMTPR_ACEPTAR_PDOI
 (P_COMTPR_ID IN COM_TRAMITES_PRV.ID%TYPE
 ,P_RESULTADO OUT VARCHAR2
 ,P_COMPRV_ID OUT COM_PROVEEDORES.ID%TYPE
 )
 IS
cursor cr_comtdp is
  select *
    from COM_TRAMITES_PRV_DOC
   where COMTPR_ID = p_comtpr_id;
  --

  -- Declaracion de variables
  v_comtpr COM_TRAMITES_PRV%ROWTYPE;
  --
BEGIN
  -- Obtener los datos del trámite de proveedor
  COM_PKG.SET_COMTPR(p_id     => p_comtpr_id);
  COM_PKG.GET_COMTPR(p_comtpr => v_comtpr);
  COM_PKG.INI_COMTPR;
  --
  IF v_comtpr.ID IS NOT NULL THEN
  --
   -- Actualizar el Proveedor
   --UPDATE COM_PROVEEDORES
   --SET CBU = v_comtpr.CBU
   --WHERE ID = v_comtpr.COMPRV_ID;
   --
   -- Activar el Documento/s Presentado
    for v_comtdp in cr_comtdp loop
      --
      update com_proveedores_doc
      set SITUACION = 'ACT'
      where id = v_comtdp.COMPDO_ID;
      --
    end loop;
    --
   p_comprv_id := v_comtpr.comprv_id;
   --
  END IF;
  --
END;
PROCEDURE COMTPR_ACEPTAR_PROB
 (P_COMTPR_ID IN NUMBER
 ,P_RESULTADO OUT VARCHAR2
 ,P_COMPRV_ID OUT NUMBER
 )
 IS
-- Declaracion de variables
  --
  cursor cr_comtpo is
  select *
    from COM_TRAMITES_PRV_OBJ
   where COMTPR_ID = p_comtpr_id;
  --
  v_comtpr COM_TRAMITES_PRV%ROWTYPE;
  v_comtpo CR_COMTPO%ROWTYPE;
  v_comobj COM_OBJETOS%rowtype;
  v_comobe_crear COM_OBJETOS_EST%rowtype;

  --
BEGIN
  -- Obtener los datos del trámite de proveedor
  COM_PKG.SET_COMTPR(p_id     => p_comtpr_id);
  COM_PKG.GET_COMTPR(p_comtpr => v_comtpr);
  COM_PKG.INI_COMTPR;
  --
  IF v_comtpr.ID IS NOT NULL THEN
    --
    open cr_comtpo;
    fetch cr_comtpo into v_comtpo;
    close cr_comtpo;
    --
    v_comobe_crear.COMOBJ_ID             := v_comtpo.COMOBJ_ID;
    v_comobe_crear.ESTADO                := 'HAB';
    v_comobe_crear.FECHA                 := SYSDATE;
    v_comobe_crear.MOTIVO                := ' ';
    --
    COMPRV_PKG.COMOBE_INS(p_comobe => v_comobe_crear);
    --
    update com_objetos_doc
    set SITUACION = 'VAL'
    where COMOBJ_ID = v_comtpo.COMOBJ_ID;
    --
    COMPRV_PKG.COMOBJ_SET(p_id     => v_comtpo.COMOBJ_ID);
    COMPRV_PKG.COMOBJ_GET(p_comobj => v_comobj);
    COMPRV_PKG.COMOBJ_INI;
    --
    p_comprv_id := v_comobj.COMPRV_ID;
   --
  END IF;
  --
END;
/* Anular trámite de Actualización de Documentos de Autoridades. */
PROCEDURE COMTPR_ANULAR_ADAU
 (P_COMTPR_ID IN NUMBER
 )
 IS
cursor cr_comtdp is
     select *
     from com_tramites_prv_doc
     where comtpr_id = p_comtpr_id;

  -- Declaracion de variables
v_comtpr COM_TRAMITES_PRV%ROWTYPE;
  --
begin
  -- Obtener los datos del trámite de proveedor
  COM_PKG.SET_COMTPR(p_id     => p_comtpr_id);
  COM_PKG.GET_COMTPR(p_comtpr => v_comtpr);
  COM_PKG.INI_COMTPR;
  --
  if v_comtpr.ID is not null then
  --
   -- Anular el Documento/s Presentado
      for v_comtdp in cr_comtdp loop
          update com_proveedores_doc
             set situacion= 'ANU'
          where id = v_comtdp.COMPDO_ID;
         -- Colocar como anulado el enlace entre la autoridad y el nuevo documento subido.
          update com_proveedores_ado
            set situacion = 'ANU'
          where compdo_id = v_comtdp.COMPDO_ID;
          --
      end loop;
    --
  --
  end if;
  --
end;
/* Proceso de Creación de Trámite Proveedor por Tipo */
PROCEDURE COMTPR_CREAR
 (P_COMPRV_ID IN COM_PROVEEDORES.ID%TYPE
 ,P_COMTPR_TIPO IN COM_TRAMITES_PRV_TIPO.CODIGO%TYPE
 ,P_COMTPR_ID OUT COM_TRAMITES_PRV.ID%TYPE
 ,P_RESULTADO OUT VARCHAR2
 )
 IS
-- Declaración de Cursores
  -- Obtiene los Datos del Proveedor
  CURSOR cr_comprv IS
  SELECT *
  FROM COM_PROVEEDORES
  WHERE ID = p_comprv_id;
  -- Obtiene los rubros del Proveedor
  CURSOR cr_comprr IS
  SELECT *
  FROM COM_PROVEEDORES_RUB
  WHERE COMPRV_ID = p_comprv_id
    AND SITUACION = 'ACT';
  -- Obtiene los Domicilio Comerciales del Proveedor
  CURSOR cr_comdom_c IS
  SELECT *
  FROM COM_PROVEEDORES_DOM_V
  WHERE COMDMT_CODIGO = 'PRV_COMERCIAL'
    AND COMPRV_ID = p_comprv_id
    AND SITUACION = 'ACT';
-- Obtiene los Domicilio Legal del Proveedor
  CURSOR cr_comdom_l IS
  SELECT *
  FROM COM_PROVEEDORES_DOM_V
  WHERE COMDMT_CODIGO = 'PRV_LEGAL'
    AND COMPRV_ID = p_comprv_id
    AND SITUACION = 'ACT';
-- Obtiene los Responsables del Proveedor
  CURSOR cr_comres IS
  SELECT *
  FROM COM_PROVEEDORES_RES_V
  WHERE COMPRV_ID = p_comprv_id
   AND SITUACION = 'ACT';
-- Obtiene los tipos de Registros a los cuales se ha inscripto el proveedor
  CURSOR cr_comprg IS
  SELECT *
  FROM COM_PROVEEDORES_RGP
  WHERE COMPRV_ID = p_comprv_id
    AND SITUACION = 'VIG';
-- Declaración de Variables
  v_comtpr COM_TRAMITES_PRV%rowtype;
  v_comtpb COM_TRAMITES_PRV_RUB%rowtype;
  v_comprv cr_comprv%rowtype;
  v_comtpg COM_TRAMITES_PRV_RGP%rowtype;
BEGIN
  -- Obtengo los datos del Proveedor
  OPEN  cr_comprv;
  FETCH cr_comprv INTO v_comprv;
  CLOSE cr_comprv;
  --  Genero cabecera y detalle según Tipo de Trámite
  IF p_comtpr_tipo IN ('ACCB','ACDP','ALRB','ACRS','BAJA','ALDC','ACDL','ACRP','ACDR','ACER','PDOC','INOB','PROB','BJOB','PDOI','INCT', 'AIAU','BAJC','ADAU','ARGP') THEN
    IF v_comprv.id IS NOT NULL THEN
    -- Genero la cabecera del Tramite
    SELECT COMTPR_ID.NEXTVAL
    INTO   v_comtpr.ID
    FROM DUAL;
    --
    v_comtpr.SEGORG_ID := v_comprv.SEGORG_ID;
    v_comtpr.FECHA     := sysdate;
    v_comtpr.COMPRV_ID := v_comprv.ID;
    v_comtpr.TIPO      := p_comtpr_tipo;
    v_comtpr.COMPRT_ID := v_comprv.COMPRT_ID;
    v_comtpr.CUIT      := v_comprv.CUIT;
    v_comtpr.NOMBRE    := v_comprv.NOMBRE;
    v_comtpr.CBU       := v_comprv.CBU;
    v_comtpr.DESCRIPCION_ACTIVIDAD := v_comprv.DESCRIPCION_ACTIVIDAD;
    v_comtpr.EMAIL     := v_comprv.EMAIL;
    v_comtpr.CONDICION_IB := v_comprv.CONDICION_IB;
    v_comtpr.NUMERO_INSCRIPCION_IB := v_comprv.NUMERO_INSCRIPCION_IB;
    v_comtpr.FECHA_INSCRIPCION_IB  := v_comprv.FECHA_INSCRIPCION_IB;
    v_comtpr.NUMERO_CONVENIO_MULTILATERAL := v_comprv.NUMERO_CONVENIO_MULTILATERAL;
    v_comtpr.SITUACION := 'NUE';
    v_comtpr.MOTIVO_SITUACION := null;
    --
    COM_PKG.INS_COMTPR(p_comtpr => v_comtpr);
    --
    P_COMTPR_ID := v_comtpr.ID;
    --
    -- Genero detalle según Tipo de Trámite
    IF p_comtpr_tipo IN ('ALRB') THEN
     -- Recorrer los rubros del proveedor para vincularlos al trámite
     FOR v_comprr IN cr_comprr LOOP
      -- Vincular los rubros al trámite
      v_comtpb.COMTPR_ID  := v_comtpr.ID;
      v_comtpb.COMRUB_ID  := v_comprr.COMRUB_ID;
      v_comtpb.OPERACION  := 'REG';
      v_comtpb.OBSERVACION:= v_comprr.OBSERVACION;
      -- Insertar el vínculo
      COM_PKG.INS_COMTPB(p_comtpb => v_comtpb);
      --
     END LOOP;
     --
    END IF;
    --
    IF p_comtpr_tipo IN ('ALDC') THEN
     -- Recorrer los Domicilios Comerciales del proveedor para vincularlos al trámite
     FOR v_comdom IN cr_comdom_c LOOP
      -- Vincular los rubros al trámite
      v_comtpd.COMTPR_ID  := v_comtpr.ID;
      v_comtpd.COMDOM_ID  := v_comdom.COMDOM_ID;
      v_comtpd.OPERACION  := 'REG';
      -- Insertar el vínculo
      COM_PKG.INS_COMTPD(p_comtpd => v_comtpd);
      --
     END LOOP;
     --
    END IF;
    --
    IF p_comtpr_tipo IN ('ACDL') THEN
     -- Recorrer el Domicilio Legal del proveedor para vincularlos al trámite
     FOR v_comdom_l IN cr_comdom_l LOOP
      -- Vincular los rubros al trámite
      v_comtpd.COMTPR_ID  := v_comtpr.ID;
      v_comtpd.COMDOM_ID  := v_comdom_l.COMDOM_ID;
      v_comtpd.OPERACION  := 'REG';
      -- Insertar el vínculo
      COM_PKG.INS_COMTPD(p_comtpd => v_comtpd);
      --
     END LOOP;
     --
    END IF;
    --
    IF p_comtpr_tipo IN ('ACRP') THEN
     -- Recorrer el Respondable del proveedor para vincularlos al trámite
     FOR v_comres IN cr_comres LOOP
      -- Vincular los rubros al trámite
      v_comtps.COMTPR_ID  := v_comtpr.ID;
      v_comtps.COMRES_ID  := v_comres.COMRES_ID;
      v_comtps.OPERACION  := 'REG';
      -- Insertar el vínculo
      COM_PKG.INS_COMTPS(p_comtps => v_comtps);
      --
     END LOOP;
     --
    END IF;
    --
    IF p_comtpr_tipo IN ('ARGP') THEN
     -- Recorrer los tipos de registros del proveedor para vincularlos al trámite
     FOR v_comprg IN cr_comprg LOOP
      -- Vincular los Tipos de Registros al trámite
      v_comtpg.COMTPR_ID := v_comtpr.id;
      v_comtpg.COMRGP_ID := v_comprg.COMRGP_ID;
      v_comtpg.OPERACION := 'REG';
    -- Insertar el vínculo
      COM_PKG.INS_COMTPG(p_comtpg => v_comtpg);
    --
     END LOOP;
     --
    END IF;
    --
   END IF;
  END IF;
  --
END;
/* Autenticar usuario y su entidad contratante */
FUNCTION AUTH_SEGUSU_ECO
 (P_USERNAME IN VARCHAR2
 ,P_PASSWORD IN VARCHAR2
 )
 RETURN BOOLEAN
 IS
-- Obtener Usuarios de la Entidad Contratante
  cursor cr_segusu(p_tipo_usuario varchar2, p_documento varchar2) is
    select segusu.USUARIO
    from   SEG_USUARIOS segusu
    where  segusu.USUARIO LIKE p_tipo_usuario||'%'||p_documento;
  --
  v_segorg SEG_ORGANIZACIONES%rowtype;
  v_documento varchar2(50) := null;
  v_tipo_usuario varchar2(50) := null;
  v_retorno boolean := FALSE;
begin
  -- Obtener parametros del Usuario
  v_documento    := substr(p_username,instr(p_username,'.',1,3)+1,length(p_username));
  --dbms_output.put_line('v_documento: ' ||v_documento);
  v_tipo_usuario := substr(p_username,1,instr(p_username,'.',1,2)-1);
  --dbms_output.put_line('v_tipo_usuario: ' ||v_tipo_usuario);
  --
  -- Recorrer los Usuarios del Responsable de Entidad Contratante
  for v_usuario in cr_segusu(p_tipo_usuario => v_tipo_usuario , p_documento => v_documento) loop
    --
    if SEG_PKG.VLDR_SEGUSU(v_usuario.USUARIO, p_password) then
        -- Validamos la Entidad Contratante Habilitada
      if VLDR_SEGUSU_ECO(p_usuario => v_usuario.USUARIO) then
       --
       RETURN TRUE;
       --dbms_output.put_line('TRUE');
       --
      end if;
     --
    end if;
    --
  end loop;
  --
  --dbms_output.put_line('FALSE');
  RETURN FALSE;
  --
end;
FUNCTION BLOB2CLOBBASE64
 (P_BLOB IN BLOB
 )
 RETURN CLOB
 IS
/*
    pos         pls_integer         := 1;
    buffer      varchar2 (32767);
    res         clob;
    lob_len     integer             := dbms_lob.getlength (p_blob);
    l_width     pls_integer         := (76 / 4 * 3)-9;
begin
    dbms_lob.createtemporary (res, true);
    dbms_lob.open (res, dbms_lob.lob_readwrite);

    while (pos < lob_len) loop
        buffer :=
                utl_raw.cast_to_varchar2
                 (utl_encode.base64_encode (dbms_lob.substr (p_blob, l_width, pos)));

        dbms_lob.writeappend (res, length (buffer), buffer);

        pos := pos + l_width;
    end loop;

    return res;

end;
  */
    v_clob clob;
    v_result clob;
    v_offset integer;
    v_chunk_size binary_integer := (48 / 4) * 3;
    v_buffer_varchar varchar2(48);
    v_buffer_raw raw(48);
begin
    if p_blob is null then
      return null;
    end if;
    dbms_lob.createtemporary(v_clob, true);
    v_offset := 1;
    for i in 1 .. ceil(dbms_lob.getlength(p_blob) / v_chunk_size) loop
      --
      dbms_lob.read(p_blob, v_chunk_size, v_offset, v_buffer_raw);
      v_buffer_raw := utl_encode.base64_encode(v_buffer_raw);
      v_buffer_varchar := utl_raw.cast_to_varchar2(v_buffer_raw);
      dbms_lob.writeappend(v_clob, length(v_buffer_varchar), v_buffer_varchar);
      v_offset := v_offset + v_chunk_size;
      --
    end loop;
    --
    v_result := v_clob;
    dbms_lob.freetemporary(v_clob);
    return v_result;
 end;
/* Obtener el anterior día hábil. */
FUNCTION DIA_HABIL_ANTERIOR
 (P_FECHA IN COM_FERIADOS.FECHA%TYPE
 ,P_SEGORG_ID IN COM_FERIADOS.SEGORG_ID%TYPE
 ,P_CANTIDAD IN NUMBER
 )
 RETURN DATE
 IS
-- Declaración de variables
  v_fecha      DATE:= p_fecha;
  v_cant_habil NUMBER:=0;
  --
BEGIN
  IF p_cantidad > 0 THEN
    LOOP
      v_fecha := v_fecha - 1;
      IF com_pkg.es_dia_habil(p_fecha     => v_fecha
                             ,p_segorg_id => p_segorg_id) THEN
        v_cant_habil   := v_cant_habil + 1;
      END IF;
      IF v_cant_habil >= p_cantidad THEN
        EXIT;
      END IF;
    END LOOP;
  END IF;
  --
  RETURN(v_fecha);
  --
END;
/* Obtener el próximo día hábil. */
FUNCTION DIA_HABIL_PROXIMO
 (P_FECHA IN COM_FERIADOS.FECHA%TYPE
 ,P_SEGORG_ID IN COM_FERIADOS.SEGORG_ID%TYPE
 ,P_CANTIDAD IN NUMBER := 1
 )
 RETURN DATE
 IS
-- Declaración de variables
  v_fecha      DATE:= p_fecha;
  v_cant_habil NUMBER:= 0;
  --
BEGIN
  IF p_cantidad > 0 THEN
    LOOP
      v_fecha := v_fecha +1;
      IF com_pkg.es_dia_habil(p_fecha      => v_fecha
                            ,p_segorg_id => p_segorg_id) THEN
        v_cant_habil   := v_cant_habil + 1;
      END IF;
      IF v_cant_habil >= p_cantidad THEN
        EXIT;
      END IF;
    END LOOP;
  END IF;
  --
  RETURN(v_fecha);
  --
END;
/* Determinar si una fecha es un día habil. */
FUNCTION ES_DIA_HABIL
 (P_FECHA IN COM_FERIADOS.FECHA%TYPE
 ,P_SEGORG_ID IN COM_FERIADOS.SEGORG_ID%TYPE
 )
 RETURN BOOLEAN
 IS
-- Declaracion de cursores
  -- Busca la fecha para ver si es feriado
  CURSOR cr_comfer IS
  SELECT 1 id
  FROM COM_FERIADOS
  WHERE segorg_id = p_segorg_id
     and
     ((tipo='ANU' AND TO_CHAR(fecha, 'DD/MM') = TO_CHAR(p_fecha, 'DD/MM'))
      OR (tipo='UNI' AND TO_CHAR(fecha, 'DD/MM/YYYY') = TO_CHAR(p_fecha, 'DD/MM/YYYY'))
     );
  -- Declaración de variables
  v_retorno   BOOLEAN;
  v_fechaID   INTEGER;
  --
BEGIN
  IF p_fecha IS NULL OR p_segorg_id IS NULL THEN
    RETURN(FALSE);
  END IF;
  -- verificar si el día es Sabado o Domingo
  IF LTRIM(RTRIM(UPPER(TO_CHAR(p_fecha,'DAY')))) IN ('SÁBADO','DOMINGO','SATURDAY','SUNDAY') THEN
    v_retorno := FALSE;
  ELSE
    OPEN cr_comfer;
    FETCH cr_comfer INTO v_fechaID;
    -- Si no se encuentra ninguna fecha retornar TRUE
    IF cr_comfer%NOTFOUND THEN
      v_retorno := TRUE;
    ELSE
      v_retorno := FALSE;
    END IF;
    CLOSE cr_comfer;
  END IF;
  RETURN(v_retorno);
EXCEPTION
  WHEN OTHERS THEN
    RETURN(FALSE);
END;
FUNCTION FORM_URL_DECODE
 (P_DATA IN VARCHAR2
 ,P_CHARSET IN VARCHAR2
 )
 RETURN VARCHAR2
 IS
BEGIN
   RETURN utl_url.unescape(p_data, p_charset);
END;
FUNCTION FORM_URL_ENCODE
 (P_DATA IN VARCHAR2
 ,P_CHARSET IN VARCHAR2
 )
 RETURN VARCHAR2
 IS
BEGIN
   RETURN utl_url.escape(p_data, TRUE, p_charset);
END;
/* Configuración de los días feriados inamovibles. */
PROCEDURE INIC_FERIADOS_ANUAL
 IS
------------------------------------------------------------------------------
-- Nombre: INIC_FERIADOS_ANUAL
-- Propósito: Configuración de los días feriados inamovibles
--
-- Parámetros:
-- NINGUNO
--
-- Revisiones:
-- 27/05/2009 - Marcelo Alfonso - Creación
------------------------------------------------------------------------------
  -- Declaración de Constantes
  c_programa  CONSTANT VARCHAR2(100) := 'INIC_FERIADOS_ANUAL';
  c_proposito CONSTANT VARCHAR2(100) := 'Configuración de los días feriados inamovibles';

  -- Declaración de Variables
  v_segorg    SEG_ORGANIZACIONES%ROWTYPE;
  v_comfer    COM_FERIADOS%ROWTYPE;
  v_fecha     DATE;

  --
BEGIN
  --Buscar la organizacion de compras para el San Luis
  SEG_PKG.SET_SEGORG_CODIGO(p_codigo => 'PCYCSL');
  SEG_PKG.GET_SEGORG(v_segorg);
  IF v_segorg.ID IS NOT NULL THEN

    -- Inicializo los días feriados inamobibles que voy a tener
    -- Tipo = 'ANUAL'

    --  Año Nuevo --
    BEGIN
    --
      v_fecha := TO_DATE('01/01/2009', 'DD/MM/YYYY');
      COM_PKG.SET_COMFER_FECHA(p_fecha => v_fecha);
      COM_PKG.GET_COMFER(p_comfer => v_comfer);
      COM_PKG.INI_COMFER;
      IF v_comfer.ID IS NULL THEN
        v_comfer.SEGORG_ID  := v_segorg.ID;
        v_comfer.FECHA      := v_fecha;
        v_comfer.TIPO       := 'ANU';
        v_comfer.NOMBRE     := 'Año Nuevo';
        COM_PKG.INS_COMFER(p_comfer => v_comfer);
      END IF;
      --
    EXCEPTION
      WHEN OTHERS THEN
        raise_application_error(-20000,'Error al inicializar el feriado para el día '||TO_CHAR(v_fecha,'DD/MM/YYYY'),true);
    END;

    -- Día Nacional de la Memoria por la Verdad y la Justicia --
    BEGIN
    --
      v_fecha := TO_DATE('24/03/2009', 'DD/MM/YYYY');
      COM_PKG.SET_COMFER_FECHA(p_fecha => v_fecha);
      COM_PKG.GET_COMFER(p_comfer => v_comfer);
      COM_PKG.INI_COMFER;
      IF v_comfer.ID IS NULL THEN
        v_comfer.SEGORG_ID  := v_segorg.ID;
        v_comfer.FECHA      := v_fecha;
        v_comfer.TIPO       := 'ANU';
        v_comfer.NOMBRE     := 'Día Nacional de la Memoria por la Verdad y la Justicia';
        COM_PKG.INS_COMFER(p_comfer => v_comfer);
      END IF;
      --
    EXCEPTION
      WHEN OTHERS THEN
        raise_application_error(-20000,'Error al inicializar el feriado para el día '||TO_CHAR(v_fecha,'DD/MM/YYYY'),true);
    END;

    -- Día del Veterano y los caídos en la Guerra de Malvinas (Ley 26.110) --
    BEGIN
    --
      v_fecha := TO_DATE('02/04/2009', 'DD/MM/YYYY');
      COM_PKG.SET_COMFER_FECHA(p_fecha => v_fecha);
      COM_PKG.GET_COMFER(p_comfer => v_comfer);
      COM_PKG.INI_COMFER;
      IF v_comfer.ID IS NULL THEN
        v_comfer.SEGORG_ID  := v_segorg.ID;
        v_comfer.FECHA      := v_fecha;
        v_comfer.TIPO       := 'ANU';
        v_comfer.NOMBRE     := 'Día del Veterano y los caídos en la Guerra de Malvinas (Ley 26.110)';
        COM_PKG.INS_COMFER(p_comfer => v_comfer);
      END IF;
      --
    EXCEPTION
      WHEN OTHERS THEN
        raise_application_error(-20000,'Error al inicializar el feriado para el día '||TO_CHAR(v_fecha,'DD/MM/YYYY'),true);
    END;

    -- Día del Trabajador --
    BEGIN
    --
      v_fecha := TO_DATE('01/05/2009', 'DD/MM/YYYY');
      COM_PKG.SET_COMFER_FECHA(p_fecha => v_fecha);
      COM_PKG.GET_COMFER(p_comfer => v_comfer);
      COM_PKG.INI_COMFER;
      IF v_comfer.ID IS NULL THEN
        v_comfer.SEGORG_ID  := v_segorg.ID;
        v_comfer.FECHA      := v_fecha;
        v_comfer.TIPO       := 'ANU';
        v_comfer.NOMBRE     := 'Día del Trabajador';
        COM_PKG.INS_COMFER(p_comfer => v_comfer);
      END IF;
      --
    EXCEPTION
      WHEN OTHERS THEN
        raise_application_error(-20000,'Error al inicializar el feriado para el día '||TO_CHAR(v_fecha,'DD/MM/YYYY'),true);
    END;

    -- Cristo de la Quebrada y de Renca --
    BEGIN
    --
      v_fecha := TO_DATE('03/05/2009', 'DD/MM/YYYY');
      COM_PKG.SET_COMFER_FECHA(p_fecha => v_fecha);
      COM_PKG.GET_COMFER(p_comfer => v_comfer);
      COM_PKG.INI_COMFER;
      IF v_comfer.ID IS NULL THEN
        v_comfer.SEGORG_ID  := v_segorg.ID;
        v_comfer.FECHA      := v_fecha;
        v_comfer.TIPO       := 'ANU';
        v_comfer.NOMBRE     := 'Cristo de la Quebrada y de Renca';
        COM_PKG.INS_COMFER(p_comfer => v_comfer);
      END IF;
      --
    EXCEPTION
      WHEN OTHERS THEN
        raise_application_error(-20000,'Error al inicializar el feriado para el día '||TO_CHAR(v_fecha,'DD/MM/YYYY'),true);
    END;

    -- 1er. Gobierno Patrio  --
    BEGIN
    --
      v_fecha := TO_DATE('25/05/2009', 'DD/MM/YYYY');
      COM_PKG.SET_COMFER_FECHA(p_fecha => v_fecha);
      COM_PKG.GET_COMFER(p_comfer => v_comfer);
      COM_PKG.INI_COMFER;
      IF v_comfer.ID IS NULL THEN
        v_comfer.SEGORG_ID  := v_segorg.ID;
        v_comfer.FECHA      := v_fecha;
        v_comfer.TIPO       := 'ANU';
        v_comfer.NOMBRE     := '1er. Gobierno Patrio ';
        COM_PKG.INS_COMFER(p_comfer => v_comfer);
      END IF;
      --
    EXCEPTION
      WHEN OTHERS THEN
        raise_application_error(-20000,'Error al inicializar el feriado para el día '||TO_CHAR(v_fecha,'DD/MM/YYYY'),true);
    END;

    -- Día de la Independencia --
    BEGIN
    --
      v_fecha := TO_DATE('09/07/2009', 'DD/MM/YYYY');
      COM_PKG.SET_COMFER_FECHA(p_fecha => v_fecha);
      COM_PKG.GET_COMFER(p_comfer => v_comfer);
      COM_PKG.INI_COMFER;
      IF v_comfer.ID IS NULL THEN
        v_comfer.SEGORG_ID  := v_segorg.ID;
        v_comfer.FECHA      := v_fecha;
        v_comfer.TIPO       := 'ANU';
        v_comfer.NOMBRE     := 'Día de la Independencia';
        COM_PKG.INS_COMFER(p_comfer => v_comfer);
      END IF;
      --
    EXCEPTION
      WHEN OTHERS THEN
        raise_application_error(-20000,'Error al inicializar el feriado para el día '||TO_CHAR(v_fecha,'DD/MM/YYYY'),true);
    END;

    -- Fundación de San Luis (Provincial) --
    BEGIN
    --
      v_fecha := TO_DATE('25/08/2009', 'DD/MM/YYYY');
      COM_PKG.SET_COMFER_FECHA(p_fecha => v_fecha);
      COM_PKG.GET_COMFER(p_comfer => v_comfer);
      COM_PKG.INI_COMFER;
      IF v_comfer.ID IS NULL THEN
        v_comfer.SEGORG_ID  := v_segorg.ID;
        v_comfer.FECHA      := v_fecha;
        v_comfer.TIPO       := 'ANU';
        v_comfer.NOMBRE     := 'Fundación de San Luis (Provincial)';
        COM_PKG.INS_COMFER(p_comfer => v_comfer);
      END IF;
      --
    EXCEPTION
      WHEN OTHERS THEN
        raise_application_error(-20000,'Error al inicializar el feriado para el día '||TO_CHAR(v_fecha,'DD/MM/YYYY'),true);
    END;

    -- Día del Empleado Público (Provincial) --
    BEGIN
    --
      v_fecha := TO_DATE('04/12/2009', 'DD/MM/YYYY');
      COM_PKG.SET_COMFER_FECHA(p_fecha => v_fecha);
      COM_PKG.GET_COMFER(p_comfer => v_comfer);
      COM_PKG.INI_COMFER;
      IF v_comfer.ID IS NULL THEN
        v_comfer.SEGORG_ID  := v_segorg.ID;
        v_comfer.FECHA      := v_fecha;
        v_comfer.TIPO       := 'ANU';
        v_comfer.NOMBRE     := 'Día del Empleado Público (Provincial)';
        COM_PKG.INS_COMFER(p_comfer => v_comfer);
      END IF;
      --
    EXCEPTION
      WHEN OTHERS THEN
        raise_application_error(-20000,'Error al inicializar el feriado para el día '||TO_CHAR(v_fecha,'DD/MM/YYYY'),true);
    END;

    -- Inmaculada Concepción de María --
    BEGIN
    --
      v_fecha := TO_DATE('08/12/2009', 'DD/MM/YYYY');
      COM_PKG.SET_COMFER_FECHA(p_fecha => v_fecha);
      COM_PKG.GET_COMFER(p_comfer => v_comfer);
      COM_PKG.INI_COMFER;
      IF v_comfer.ID IS NULL THEN
        v_comfer.SEGORG_ID  := v_segorg.ID;
        v_comfer.FECHA      := v_fecha;
        v_comfer.TIPO       := 'ANU';
        v_comfer.NOMBRE     := 'Inmaculada Concepción de María';
        COM_PKG.INS_COMFER(p_comfer => v_comfer);
      END IF;
      --
    EXCEPTION
      WHEN OTHERS THEN
        raise_application_error(-20000,'Error al inicializar el feriado para el día '||TO_CHAR(v_fecha,'DD/MM/YYYY'),true);
    END;

    -- Navidad --
    BEGIN
    --
      v_fecha := TO_DATE('25/12/2009', 'DD/MM/YYYY');
      COM_PKG.SET_COMFER_FECHA(p_fecha => v_fecha);
      COM_PKG.GET_COMFER(p_comfer => v_comfer);
      COM_PKG.INI_COMFER;
      IF v_comfer.ID IS NULL THEN
        v_comfer.SEGORG_ID  := v_segorg.ID;
        v_comfer.FECHA      := v_fecha;
        v_comfer.TIPO       := 'ANU';
        v_comfer.NOMBRE     := 'Navidad';
        COM_PKG.INS_COMFER(p_comfer => v_comfer);
      END IF;
      --
    EXCEPTION
      WHEN OTHERS THEN
        raise_application_error(-20000,'Error al inicializar el feriado para el día '||TO_CHAR(v_fecha,'DD/MM/YYYY'),true);
    END;
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    raise_application_error(-20000, c_programa || ' - ' ||
                                    c_proposito , TRUE);
END;
/* Configuración de los días feriados trasladables 2009. */
PROCEDURE INIC_FERIADOS_2009
 IS
------------------------------------------------------------------------------
-- Nombre: INIC_FERIADOS_2009
-- Propósito: Configuración de los días feriados trasladables 2009
--
-- Parámetros:
-- NINGUNO
--
-- Revisiones:
-- 27/05/2009 - Marcelo Alfonso - Creación
------------------------------------------------------------------------------
  -- Declaración de Constantes
  c_programa  CONSTANT VARCHAR2(100) := 'INIC_FERIADOS_2009';
  c_proposito CONSTANT VARCHAR2(100) := 'Configuración de los días feriados trasladables 2009';

  -- Declaración de Variables
  v_segorg    SEG_ORGANIZACIONES%ROWTYPE;
  v_comfer    COM_FERIADOS%ROWTYPE;
  v_fecha     DATE;

  --
BEGIN
  --Buscar la organizacion de compras para el San Luis
  SEG_PKG.SET_SEGORG_CODIGO(p_codigo => 'PCYCSL');
  SEG_PKG.GET_SEGORG(v_segorg);
  IF v_segorg.ID IS NOT NULL THEN

    -- Inicializo los días feriados trasladables que voy a tener para el 2009
    -- Tipo = 'UNI'

    -- Jueves Santo --
    BEGIN
    --
      v_fecha := TO_DATE('09/04/2009', 'DD/MM/YYYY');
      COM_PKG.SET_COMFER_FECHA(p_fecha => v_fecha);
      COM_PKG.GET_COMFER(p_comfer => v_comfer);
      COM_PKG.INI_COMFER;
      IF v_comfer.ID IS NULL THEN
        v_comfer.SEGORG_ID  := v_segorg.ID;
        v_comfer.FECHA      := v_fecha;
        v_comfer.TIPO       := 'UNI';
        v_comfer.NOMBRE     := 'Jueves Santo';
        COM_PKG.INS_COMFER(p_comfer => v_comfer);
      END IF;
      --
    EXCEPTION
      WHEN OTHERS THEN
        raise_application_error(-20000,'Error al inicializar el feriado para el día '||TO_CHAR(v_fecha,'DD/MM/YYYY'),true);
    END;

    -- Viernes Santo --
    BEGIN
    --
      v_fecha := TO_DATE('10/04/2009', 'DD/MM/YYYY');
      COM_PKG.SET_COMFER_FECHA(p_fecha => v_fecha);
      COM_PKG.GET_COMFER(p_comfer => v_comfer);
      COM_PKG.INI_COMFER;
      IF v_comfer.ID IS NULL THEN
        v_comfer.SEGORG_ID  := v_segorg.ID;
        v_comfer.FECHA      := v_fecha;
        v_comfer.TIPO       := 'UNI';
        v_comfer.NOMBRE     := 'Viernes Santo';
        COM_PKG.INS_COMFER(p_comfer => v_comfer);
      END IF;
      --
    EXCEPTION
      WHEN OTHERS THEN
        raise_application_error(-20000,'Error al inicializar el feriado para el día '||TO_CHAR(v_fecha,'DD/MM/YYYY'),true);
    END;

    -- (20/06/2009)Paso a la inmortalidad del General Manuel Belgrano --
    BEGIN
    --
      v_fecha := TO_DATE('15/06/2009', 'DD/MM/YYYY');
      COM_PKG.SET_COMFER_FECHA(p_fecha => v_fecha);
      COM_PKG.GET_COMFER(p_comfer => v_comfer);
      COM_PKG.INI_COMFER;
      IF v_comfer.ID IS NULL THEN
        v_comfer.SEGORG_ID  := v_segorg.ID;
        v_comfer.FECHA      := v_fecha;
        v_comfer.TIPO       := 'UNI';
        v_comfer.NOMBRE     := '(20/06/2009)Paso a la inmortalidad del General Manuel Belgrano';
        COM_PKG.INS_COMFER(p_comfer => v_comfer);
      END IF;
      --
    EXCEPTION
      WHEN OTHERS THEN
        raise_application_error(-20000,'Error al inicializar el feriado para el día '||TO_CHAR(v_fecha,'DD/MM/YYYY'),true);
    END;

    -- (17/08/2009)Paso a la inmortalidad del General José de San Martín --
    BEGIN
    --
      v_fecha := TO_DATE('17/08/2009', 'DD/MM/YYYY');
      COM_PKG.SET_COMFER_FECHA(p_fecha => v_fecha);
      COM_PKG.GET_COMFER(p_comfer => v_comfer);
      COM_PKG.INI_COMFER;
      IF v_comfer.ID IS NULL THEN
        v_comfer.SEGORG_ID  := v_segorg.ID;
        v_comfer.FECHA      := v_fecha;
        v_comfer.TIPO       := 'UNI';
        v_comfer.NOMBRE     := '(17/08/2009)Paso a la inmortalidad del General José de San Martín';
        COM_PKG.INS_COMFER(p_comfer => v_comfer);
      END IF;
      --
    EXCEPTION
      WHEN OTHERS THEN
        raise_application_error(-20000,'Error al inicializar el feriado para el día '||TO_CHAR(v_fecha,'DD/MM/YYYY'),true);
    END;

    -- (12/10/2009)Día de la Raza --
    BEGIN
    --
      v_fecha := TO_DATE('12/10/2009', 'DD/MM/YYYY');
      COM_PKG.SET_COMFER_FECHA(p_fecha => v_fecha);
      COM_PKG.GET_COMFER(p_comfer => v_comfer);
      COM_PKG.INI_COMFER;
      IF v_comfer.ID IS NULL THEN
        v_comfer.SEGORG_ID  := v_segorg.ID;
        v_comfer.FECHA      := v_fecha;
        v_comfer.TIPO       := 'UNI';
        v_comfer.NOMBRE     := '(12/10/2009)Día de la Raza';
        COM_PKG.INS_COMFER(p_comfer => v_comfer);
      END IF;
      --
    EXCEPTION
      WHEN OTHERS THEN
        raise_application_error(-20000,'Error al inicializar el feriado para el día '||TO_CHAR(v_fecha,'DD/MM/YYYY'),true);
    END;
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    raise_application_error(-20000, c_programa || ' - ' ||
                                    c_proposito , TRUE);
END;
/* Procesar los precios testigos de la tabla COM_CATALOGO_PRECIOSACTL. */
PROCEDURE PROC_COMCPA
 (P_SEGORG_ID IN number
 ,P_CODIGO IN COM_CATALOGO_PRECIOSACTL.CODIGO%TYPE
 ,P_FECHA_VIGENCIA IN DATE := 'SYSDATE'
 ,P_FECHA_VALIDEZ IN DATE
 )
 IS
CURSOR cr_comcpa IS
  SELECT *
  FROM COM_CATALOGO_PRECIOSACTL COMCPA
  WHERE COMCPA.SEGORG_ID = p_segorg_id
    AND COMCPA.CODIGO = p_codigo
    AND COMCPA.SITUACION = 'PEN';

  v_comctp    COM_CATALOGO_PRECIOS%ROWTYPE;
BEGIN
  -- Por cada registro ingresado en la tabla COM_CATALOGO_PRECIOSACTL
  -- con el estado PEN
  -- Debo insertar un registro en la tabla COM_CATLOGO_PRECIOS
  FOR v_comcpa IN cr_comcpa LOOP
    --
    -- Si el registro esta en situacion 'PEN'
    IF v_comcpa.SITUACION = 'PEN' THEN
      v_comctp := NULL;
      SELECT COMCTP_ID.NEXTVAL
      INTO v_comctp.ID
      FROM DUAL;
      --
      v_comctp.COMCIT_ID      := v_comcpa.COMCIT_ID;
      v_comctp.PRECIO         := v_comcpa.PRECIO;
      v_comctp.FECHA_VIGENCIA := p_fecha_vigencia;
      v_comctp.FECHA_VALIDEZ  := p_fecha_validez;
      v_comctp.FECHA          := v_comcpa.FECHA_PRECIO;
      v_comctp.OBSERVACION    := v_comcpa.OBSERVACION;
      v_comctp.SITUACION      := 'VAL';
      --
      COM_PKG.INS_COMCTP(p_comctp => v_comctp);
      --
      -- Seteo el estado del procesamiento para la fila dada
      UPDATE COM_CATALOGO_PRECIOSACTL
      SET SITUACION = 'PRO'
      WHERE CODIGO = v_comcpa.codigo
        AND CODIGO_ITEM = v_comcpa.codigo_item;
      --
    END IF;
  END LOOP;
EXCEPTION
  WHEN OTHERS THEN
    raise_application_error(-20000,'Se produjo un error al procesar los nuevos precios testigos');
END;
/* Procesar la planilla para Importar precios testigos al catalogo. */
PROCEDURE PROC_COMDOC_CTP
 (P_SEGORG_ID IN NUMBER
 ,P_ID IN COM_DOCUMENTOS.ID%TYPE
 ,P_SEPARADOR IN VARCHAR2 := ';'
 ,P_MENSAJE OUT VARCHAR2
 ,P_PROCESADO OUT VARCHAR2
 ,P_CODIGO OUT COM_CATALOGO_PRECIOSACTL.CODIGO%TYPE
 )
 IS
CURSOR cr_comdoc IS
  SELECT *
  FROM COM_DOCUMENTOS COMDOC
  WHERE COMDOC.ID = p_id;

  CURSOR cr_comcit (p_codigo_completo IN VARCHAR2) IS
  SELECT comcit.ID
  FROM com_catalogo_clases comccl,
       com_catalogo_items comcit,
       com_catalogo_objetos comcob
  WHERE comcit.comcob_id = comcob.ID
    AND comcit.comccl_id = comccl.ID
    AND comcob.segorg_id = p_segorg_id
    AND TRIM(TO_CHAR (comcob.codigo, '000')
       || '.'
       || TO_CHAR (comccl.codigo, '00000')
       || '.'
       || TO_CHAR (comcit.codigo, '0000')) = p_codigo_completo;

  CURSOR cr_comcpa (p_codigo1 IN NUMBER
                   ,p_codigo_item IN VARCHAR2) IS
  SELECT ID
  FROM COM_CATALOGO_PRECIOSACTL COMCPA
  WHERE COMCPA.SEGORG_ID = p_segorg_id
    AND COMCPA.CODIGO = p_codigo1
    AND COMCPA.CODIGO_ITEM = p_codigo_item;

  v_longitudTotal       NUMBER;
  v_leeHasta            NUMBER         := 4000;
  v_linea_str           VARCHAR2(32767):= '';
  v_posicion            NUMBER         := 1;
  -- Seteo propio para la planilla dada
  v_NroLinea            NUMBER         := 0;
  v_fin_de_linea        VARCHAR2(10)   := chr(10); -- Enter
  v_valor               VARCHAR2(2000);
  v_valor1              VARCHAR2(2000);
  v_error               BOOLEAN;
  v_motivo_error        VARCHAR2(2000);
  --
  v_comdoc              COM_DOCUMENTOS%ROWTYPE;
  v_comcpa              COM_CATALOGO_PRECIOSACTL%ROWTYPE;
  v_codigo              COM_CATALOGO_PRECIOSACTL.CODIGO%TYPE;
  v_comcpa_id           NUMBER;
  v_procesado_error     BOOLEAN;
  v_clob                CLOB;
BEGIN
  v_procesado_error := FALSE;
  -- Cargo el Archivo en el BLOB
  v_comdoc := NULL;
  OPEN cr_comdoc;
  FETCH cr_comdoc INTO v_comdoc;
  CLOSE cr_comdoc;
  -- Convierto el BLOB a CLOB
  v_clob := COM_PKG.GET_BLOB_TO_CLOB(v_comdoc.DOCUMENTO);
  -- Defino la longitud total del archivo CLOB
  v_longitudTotal := dbms_lob.getlength(v_clob);
  -- Cargo el Archivo LOB linea a linea dentro de la Tabla
  WHILE (v_posicion <= v_longitudTotal) LOOP
    v_Linea_str := dbms_lob.substr(v_CLOB
                                  ,INSTR(dbms_lob.substr(v_CLOB,v_leeHasta,v_posicion),v_fin_de_linea)-2
                                  ,v_posicion);
    v_posicion := v_posicion + length(v_Linea_str)+2;
    -- Si es la cabecera
    IF v_NroLinea = 0 THEN
      --Creo el codigo a usar como secuencia
      SELECT COMCPA_CODIGO.NEXTVAL
      INTO v_codigo
      FROM DUAL;
    ELSE
      v_error := FALSE;
      v_motivo_error := NULL;
      v_comcpa := NULL;
      -- Cargo e Inserto a la TABLA
      v_comcpa.SEGORG_ID := p_segorg_id;
      v_comcpa.CODIGO := v_codigo;
      v_comcpa.NRO_LINEA := v_NroLinea;
      -- Campo CODIGO_ITEM -- columna 0
      v_valor := COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                       ,p_columna   => 0
                                       ,p_separador => p_separador);
      v_comcpa.CODIGO_ITEM := v_valor;
      -- Si CODIGO_ITEM es NOT NULL
      IF v_valor IS NOT NULL THEN
        -- Obtengo el id del item
        OPEN cr_comcit(p_codigo_completo => v_valor);
        FETCH cr_comcit INTO v_comcpa.COMCIT_ID;
        CLOSE cr_comcit;
        --Si no lo enontro error
        IF v_comcpa.COMCIT_ID IS NULL THEN
          v_error :=  TRUE;
          v_motivo_error := v_motivo_error || 'El campo Código: '||v_valor||' es inválido.'||chr(10);
        ELSE
          -- Si el CODIGO_ITEM ya fue ingresado error
          OPEN cr_comcpa(p_codigo1 => v_codigo
                        ,p_codigo_item => v_valor);
          FETCH cr_comcpa INTO v_comcpa_id;
          CLOSE cr_comcpa;
          IF v_comcpa_id IS NOT NULL THEN
            v_error :=  TRUE;
            v_motivo_error := v_motivo_error || 'Ya existe un registro con este Código: '||v_valor||'.'||chr(10);
          END IF;
        END IF;
      -- Si CODIGO_ITEM es NULL error
      ELSE
        v_error :=  TRUE;
        v_motivo_error := v_motivo_error || 'El campo Código es Nulo.'||chr(10);
      END IF;
      --
      -- Campo PRECIO-- columna 5
      v_valor := COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                       ,p_columna   => 5
                                       ,p_separador => p_separador);
      IF v_valor IS NOT NULL THEN
        -- ver que Precio sea número
        BEGIN
          -- sacar el simbolo $ si asi fue cargado
          v_valor1 := LTRIM(RTRIM((REPLACE(v_valor,'$',''))));
          -- convertir a numero

          -- Verificar si el separador decimal es la coma con 1 o 2 decimales
          IF (INSTR(v_valor1, ',', length(v_valor1)-2) > 0) THEN
            -- saco los separadores de miles punto
            v_valor1 := REPLACE(v_valor1,'.','');
            -- reemplazo la coma por el punto
            v_valor1 := REPLACE(v_valor1,',','.');
          ELSE
            -- Verificar si el separador decimal es el punto con 1 o 2 decimales
            IF (INSTR(v_valor1, '.', length(v_valor1)-2) > 0) THEN
              -- saco los separadores de miles coma
              v_valor1 := REPLACE(v_valor1,',','');
            ELSE
              -- No se encontro separador decimal
              -- Verificar si hay separador de miles coma
              IF (INSTR(v_valor1, ',', length(v_valor1)-3) = length(v_valor1)-3) THEN
                -- si no hay un punto
                IF (INSTR(v_valor1, '.') = 0) THEN
                  -- saco los separadores de miles coma
                  v_valor1 := REPLACE(v_valor1,',','');
                ELSE
                  v_valor1 := 'error';
                END IF;
              ELSE
                -- Verificar si hay separador de miles punto
                IF (INSTR(v_valor1, '.', length(v_valor1)-3) = length(v_valor1)-3) THEN
                  -- si no hay una coma
                  IF (INSTR(v_valor1, ',') = 0) THEN
                    -- saco los separadores de miles PUNTO
                    v_valor1 := REPLACE(v_valor1,'.','');
                  ELSE
                    v_valor1 := 'error';
                  END IF;
                ELSE
                  -- si estoy en este punto no deberia haber si puntos, ni comas.
                  IF ((INSTR(v_valor1, '.') > 0) OR (INSTR(v_valor1, ',') > 0)) THEN
                    v_valor1:= 'error';
                  END IF;
                END IF;
              END IF;
           END IF;
          END IF;
          --
          v_comcpa.PRECIO := TO_NUMBER(v_valor1,'999999999999.99');
          --
        EXCEPTION
          WHEN OTHERS THEN
            v_comcpa.PRECIO := -1;
            v_error :=  TRUE;
            v_motivo_error := v_motivo_error || 'El valor del campo Precio: '||v_valor||' no es válido.'||chr(10);

        END;
      ELSE
        v_comcpa.PRECIO := -1;
        v_error :=  TRUE;
        v_motivo_error := v_motivo_error || 'El valor del campo Precio es Nulo.'||chr(10);
      END IF;
      -- Campo FECHA_PRECIO-- columna 6
      v_valor := COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                       ,p_columna   => 6
                                       ,p_separador => p_separador);
      --
      IF v_valor IS NOT NULL THEN
        -- ver que Fecha Precio sea fecha
        BEGIN
          BEGIN
            -- teniendo en cuenta el formato DD/MM/YYYY
            v_comcpa.FECHA_PRECIO := TO_DATE(v_valor,'DD/MM/YYYY');
          EXCEPTION
            WHEN OTHERS THEN
              -- si dicho formato no fue reconocido pruebo el formato DD-MM-YYYY
              v_comcpa.FECHA_PRECIO := TO_DATE(v_valor,'DD-MM-YYYY');
          END;
        EXCEPTION
          WHEN OTHERS THEN
            v_error :=  TRUE;
            v_motivo_error := v_motivo_error || 'El valor del campo Fecha Precio: '||v_valor||' no tiene el formato válido DD/MM/YYYY.'||chr(10);
        END;
      END IF;
      -- Campo OBSERVACION-- columna 7
      v_valor := COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                       ,p_columna   => 7
                                       ,p_separador => p_separador);
      v_comcpa.OBSERVACION := v_valor;
      --
      -- Si no hubo ningun error la situacion del registro queda en 'PEN'
      IF v_error THEN
        v_comcpa.SITUACION := 'ERR';
        v_comcpa.MOTIVO_SITUACION := v_motivo_error;
        v_procesado_error := TRUE;
      ELSE
        v_comcpa.SITUACION := 'PEN';
      END IF;
      COM_PKG.INS_COMCPA(p_comcpa => v_comcpa);
      --
    END IF;
    v_NroLinea := v_NroLinea + 1;
  END LOOP;
  IF v_procesado_error THEN
    -- Setear la situacion en DES de todos las filas que esten en estado PEN
    UPDATE COM_CATALOGO_PRECIOSACTL
    SET SITUACION = 'DES'
    WHERE SEGORG_ID = p_segorg_id
      AND CODIGO    = v_codigo
      AND SITUACION = 'PEN';
  END IF;
  p_mensaje := NULL;
  p_procesado := 'SI';
  p_codigo := v_codigo;
EXCEPTION
  WHEN OTHERS THEN
    p_mensaje := 'El Archivo no pudo ser Procesado:<br>'||sqlerrm;
    p_procesado := 'NO';
    p_codigo := NULL;
END;
/* Dar Baja a un Proveedor */
PROCEDURE BAJ_PRV
 (P_COMPRV_ID IN NUMBER
 ,P_DESCRIPCION IN VARCHAR2
 )
 IS
v_compre COM_PROVEEDORES_EST%ROWTYPE;
BEGIN
  IF p_comprv_id IS NOT NULL THEN
    v_compre.COMPRV_ID      := p_comprv_id;
    v_compre.ESTADO         := 'BAJ';
    v_compre.FECHA_VIGENCIA := SYSDATE;
    v_compre.FECHA_VALIDEZ  := null;
    v_compre.DESCRIPCION    := p_descripcion;
    v_compre.SITUACION      := 'VAL';
    v_compre.MOTIVO_SITUACION:= null;
    --
    COM_PKG.INS_COMPRE(p_compre => v_compre);
    --
  END IF;
END;
/* Habilitar un Proveedor */
PROCEDURE HAB_PRV
 (P_COMPRV_ID IN COM_PROVEEDORES_EST.COMPRV_ID%TYPE
 ,P_DESCRIPCION IN COM_PROVEEDORES_EST.DESCRIPCION%TYPE
 )
 IS
v_compre COM_PROVEEDORES_EST%ROWTYPE;
BEGIN
  IF p_comprv_id IS NOT NULL THEN
    v_compre.COMPRV_ID      := p_comprv_id;
    v_compre.ESTADO         := 'HAB';
    v_compre.FECHA_VIGENCIA := SYSDATE;
    v_compre.FECHA_VALIDEZ  := null;
    v_compre.DESCRIPCION    := p_descripcion;
    v_compre.SITUACION      := 'VAL';
    v_compre.MOTIVO_SITUACION:= null;
    --
    COM_PKG.INS_COMPRE(p_compre => v_compre);
    --
  END IF;
END;
/* Suspender un Proveedor */
PROCEDURE SUS_PRV
 (P_COMPRV_ID IN COM_PROVEEDORES_EST.COMPRV_ID%TYPE
 ,P_FECHA_VIGENCIA IN COM_PROVEEDORES_EST.FECHA_VIGENCIA%TYPE
 ,P_DESCRIPCION IN COM_PROVEEDORES_EST.DESCRIPCION%TYPE
 ,P_FECHA_VALIDEZ IN COM_PROVEEDORES_EST.FECHA_VALIDEZ%TYPE
 )
 IS
v_compre COM_PROVEEDORES_EST%ROWTYPE;
BEGIN
  IF p_comprv_id IS NOT NULL THEN
    v_compre.COMPRV_ID      := p_comprv_id;
    v_compre.ESTADO         := 'SUS';
    v_compre.FECHA_VIGENCIA := p_fecha_vigencia;
    v_compre.FECHA_VALIDEZ  := p_fecha_validez;
    v_compre.DESCRIPCION    := p_descripcion;
    v_compre.SITUACION      := 'VAL';
    v_compre.MOTIVO_SITUACION:= null;
    --
    COM_PKG.INS_COMPRE(p_compre => v_compre);
    --
  END IF;
END;
/* Dar Baja a una Unidad Ejecutora. */
PROCEDURE BAJ_ECO
 (P_COMECO_ID IN COM_CONTRATANTES.ID%TYPE
 ,P_DESCRIPCION IN VARCHAR2
 )
 IS
CURSOR cr_comecr IS
  SELECT COMRES_ID
  FROM COM_CONTRATANTES_RES
  WHERE SITUACION = 'ACT'
    AND COMECO_ID = p_comeco_id;
  --
  v_comece COM_CONTRATANTES_EST%ROWTYPE;
  v_comecr cr_comecr%ROWTYPE;
BEGIN
  --
  IF p_comeco_id IS NOT NULL THEN
    --
    OPEN  cr_comecr;
    FETCH cr_comecr INTO v_comecr;
    CLOSE cr_comecr;
    -- Controlar que no existan Respnsables activos para este Contratante
    IF v_comecr.COMRES_ID IS NOT NULL THEN
     raise_application_error(-20000,'Para poder dar de BAJA se necesita que todos los Responsables esten SUSPENDIDOS.',true);
    END IF;
    --
    v_comece.COMECO_ID      := p_comeco_id;
    v_comece.ESTADO         := 'BAJ';
    v_comece.FECHA_VIGENCIA := SYSDATE;
    v_comece.FECHA_VALIDEZ  := null;
    v_comece.COMDOC_ID      := null;
    v_comece.SITUACION      := 'VAL';
    v_comece.MOTIVO_SITUACION:= p_descripcion;
    --
    COM_PKG.INS_COMECE(p_comece => v_comece);
    --
  END IF;
END;
/* Habilitar una Entidad Contratante . */
PROCEDURE HAB_ECO
 (P_COMECO_ID IN COM_CONTRATANTES.ID%TYPE
 ,P_DESCRIPCION IN VARCHAR2
 )
 IS
v_comece COM_CONTRATANTES_EST%ROWTYPE;
BEGIN
  IF p_comeco_id IS NOT NULL THEN
    v_comece.COMECO_ID      := p_comeco_id;
    v_comece.ESTADO         := 'HAB';
    v_comece.FECHA_VIGENCIA := SYSDATE;
    v_comece.FECHA_VALIDEZ  := null;
    v_comece.COMDOC_ID      := null;
    v_comece.SITUACION      := 'VAL';
    v_comece.MOTIVO_SITUACION:= p_descripcion;
    --
    COM_PKG.INS_COMECE(p_comece => v_comece);
    --
  END IF;
END;
/* Suspender una Entidad Contratante. */
PROCEDURE SUS_ECO
 (P_COMECO_ID IN COM_CONTRATANTES.ID%TYPE
 ,P_FECHA_VALIDEZ IN COM_CONTRATANTES_EST.FECHA_VALIDEZ%TYPE
 ,P_DESCRIPCION IN VARCHAR2
 ,P_FECHA_VIGENCIA IN COM_CONTRATANTES_EST.FECHA_VIGENCIA%TYPE
 )
 IS
v_comece COM_CONTRATANTES_EST%ROWTYPE;
BEGIN
  IF p_comeco_id IS NOT NULL THEN
    v_comece.COMECO_ID      := p_comeco_id;
    v_comece.ESTADO         := 'SUS';
    v_comece.FECHA_VIGENCIA := p_fecha_vigencia;
    v_comece.FECHA_VALIDEZ  := p_fecha_validez;
    v_comece.COMDOC_ID      := null;
    v_comece.SITUACION      := 'VAL';
    v_comece.MOTIVO_SITUACION:= p_descripcion;
    --
    COM_PKG.INS_COMECE(p_comece => v_comece);
    --
  END IF;
END;
/* Convertir de un BLOB a un CLOB. */
FUNCTION GET_BLOB_TO_CLOB
 (P_BLOB IN BLOB
 )
 RETURN CLOB
 IS
v_clob        CLOB;
  v_dest_offset NUMBER  := 1;
  v_src_offset  NUMBER  := 1;
  v_amount      INTEGER := DBMS_LOB.lobmaxsize;
  v_blob_csid   NUMBER  := DBMS_LOB.default_csid;
  v_lang_ctx    INTEGER := DBMS_LOB.default_lang_ctx;
  v_warning     INTEGER;
  --
BEGIN
  DBMS_LOB.CreateTemporary(lob_loc=>v_clob, cache=>TRUE, dur=>DBMS_LOB.SESSION);
  DBMS_LOB.ConvertToClob(v_clob,p_blob,v_amount,v_dest_offset,v_src_offset,v_blob_csid,v_lang_ctx,v_warning);
  IF v_warning = DBMS_LOB.no_warning THEN
    RETURN(v_clob);
  ELSE
    RETURN(NULL);
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    RETURN(NULL);
END;
PROCEDURE GET_COMOCE
 (P_COMOCE OUT COM_ORDENES_COMPRAS_EST%ROWTYPE
 )
 IS
begin
  p_comoce := v_comoce;
end;
PROCEDURE GET_COMCIT
 (P_COMCIT OUT COM_CATALOGO_ITEMS%ROWTYPE
 )
 IS
begin
  p_comcit := v_comcit;
end;
PROCEDURE SET_COMCIT
 (P_COMCIT_ID IN NUMBER
 )
 IS
cursor cr_comcit is
 select *
 from com_catalogo_items
 where id = p_comcit_id;
begin
 INI_COMCIT;
 OPEN cr_comcit;
 FETCH cr_comcit INTO v_comcit;
 CLOSE cr_comcit;
 --
end;
/* Obtener el valor de la variable v_comcmo. */
PROCEDURE GET_COMCMO
 (P_COMCMO OUT COM_CALIFICACIONES_MOT%ROWTYPE
 )
 IS
BEGIN
  p_comcmo := v_comcmo;
END;
/* Obtener el valor de la variable v_comctm. */
PROCEDURE GET_COMCTM
 (P_COMCTM OUT COM_CALIFICACIONES_TMO%ROWTYPE
 )
 IS
BEGIN
  p_comctm := v_comctm;
END;
/* Obtener el valor de la variable v_comrrp */
PROCEDURE GET_COMRRP
 (P_COMRRP OUT COM_REPUTACION_RUBPRV%ROWTYPE
 )
 IS
BEGIN
  p_comrrp := v_comrrp;
END;
/* Obtener el valor de la variable v_comrer */
PROCEDURE GET_COMRER
 (P_COMRER OUT COM_REPUTACION_RUB%ROWTYPE
 )
 IS
BEGIN
  p_comrer := v_comrer;
END;
/* Obtener el valor de la variable v_comclf */
PROCEDURE GET_COMCLF
 (P_COMCLF OUT COM_CALIFICACIONES%ROWTYPE
 )
 IS
BEGIN
  p_comclf := v_comclf;
END;
PROCEDURE GET_COMOCM
 (P_COMOCM OUT COM_ORDENES_COMPRAS%ROWTYPE
 )
 IS
begin
  p_comocm := v_comocm;
end;
PROCEDURE GET_COMCOE
 (P_COMCOE OUT COM_CONTRATACIONES_EST%ROWTYPE
 )
 IS
begin
  p_comcoe := v_comcoe;
end;
PROCEDURE GET_COMECE
 (P_COMECE OUT COM_CONTRATANTES_EST%ROWTYPE
 )
 IS
begin
  p_comece := v_comece;
end;
PROCEDURE SET_COMECE
 (P_ID IN NUMBER
 )
 IS
cursor cr_comece is
 select *
 from com_contratantes_est
 where id = p_id;
begin
 INI_COMECE;
 OPEN cr_comece;
 FETCH cr_comece INTO v_comece;
 CLOSE cr_comece;
 --
end;
PROCEDURE GET_COMECO
 (P_COMECO OUT COM_CONTRATANTES%ROWTYPE
 )
 IS
begin
  p_comeco := v_comeco;
end;
PROCEDURE GET_COMPED
 (P_COMPED OUT COM_PEDIDOS%ROWTYPE
 )
 IS
begin
  p_comped := v_comped;
end;
PROCEDURE GET_COMPEE
 (P_COMPEE OUT COM_PEDIDOS_EST%ROWTYPE
 )
 IS
begin
  p_compee := v_compee;
end;
PROCEDURE GET_COMEJE
 (P_COMEJE OUT COM_EJERCICIOS%ROWTYPE
 )
 IS
begin
  p_comeje := v_comeje;
end;
/* Obtener el valor de la variable v_comprv */
PROCEDURE GET_COMPRV
 (P_COMPRV OUT COM_PROVEEDORES%ROWTYPE
 )
 IS
BEGIN
  p_comprv := v_comprv;
END;
PROCEDURE GET_COMCON
 (P_COMCON OUT COM_CONTRATACIONES%ROWTYPE
 )
 IS
begin
  p_comcon := v_comcon;
end;
/* Obtener el valor de la variable v_comctp */
PROCEDURE GET_COMCTP
 (P_COMCTP OUT COM_CATALOGO_PRECIOS%ROWTYPE
 )
 IS
BEGIN
  p_comctp := v_comctp;
END;
/* Obtener el valor de la variable v_comccr */
PROCEDURE GET_COMCCR
 (P_COMCCR OUT COM_CONTRATANTES_CATRES%ROWTYPE
 )
 IS
BEGIN
  p_comccr := v_comccr;
END;
/* Obtener el valor de la variable v_comcpa */
PROCEDURE GET_COMCPA
 (P_COMCPA OUT COM_CATALOGO_PRECIOSACTL%ROWTYPE
 )
 IS
BEGIN
  p_comcpa := v_comcpa;
END;
/* Obtener el valor de la variable v_comtco */
PROCEDURE GET_COMTCO
 (P_COMTCO OUT COM_TRAMITES_CON%ROWTYPE
 )
 IS
BEGIN
  p_comtco := v_comtco;
END;
/* Obtener el valor de la variable v_comres */
PROCEDURE GET_COMRES
 (P_COMRES OUT COM_RESPONSABLES%ROWTYPE
 )
 IS
BEGIN
  p_comres := v_comres;
END;
/* Obtener el valor de la variable v_comprs */
PROCEDURE GET_COMPRS
 (P_COMPRS OUT COM_PROVEEDORES_RES%ROWTYPE
 )
 IS
BEGIN
  p_comprs := v_comprs;
END;
/* Obtener el valor de la variable v_cometq */
PROCEDURE GET_COMETQ
 (P_COMETQ OUT COM_ETIQUETAS%ROWTYPE
 )
 IS
BEGIN
  p_cometq := v_cometq;
END;
/* Obtener el valor de la variable v_comcnr */
PROCEDURE GET_COMCNR
 (P_COMCNR OUT COM_CONTRATANTES_RES%ROWTYPE
 )
 IS
BEGIN
  p_comcnr := v_comcnr;
END;
/* Obtener el valor de la variable v_comres */
PROCEDURE GET_COMRST
 (P_COMRST OUT COM_RESPONSABLES_TIPOS%ROWTYPE
 )
 IS
BEGIN
  p_comrst := v_comrst;
END;
/* Obtener valores de la variable v_comfer. */
PROCEDURE GET_COMFER
 (P_COMFER OUT COM_FERIADOS%ROWTYPE
 )
 IS
BEGIN
  p_comfer := v_comfer;
END;
/* Obtener el valor de la variable v_comprt */
PROCEDURE GET_COMPRT
 (P_COMPRT OUT COM_PROVEEDORES_TIPOS%ROWTYPE
 )
 IS
BEGIN
  p_comprt := v_comprt;
END;
/* Obtener el valor de la variable v_comtpr */
PROCEDURE GET_COMTPR
 (P_COMTPR OUT COM_TRAMITES_PRV%ROWTYPE
 )
 IS
BEGIN
  p_comtpr := v_comtpr;
END;
PROCEDURE INI_COMOCE
 IS
begin
  v_comoce := null;
end;
PROCEDURE INI_COMCIT
 IS
begin
  v_comcit := NULL;
end;
PROCEDURE INI_COMCMO
 IS
begin
  v_comcmo := null;
end;
PROCEDURE INI_COMCTM
 IS
begin
  v_comctm := null;
end;
PROCEDURE INI_COMRRP
 IS
begin
  v_comrrp:=NULL;
end;
PROCEDURE INI_COMRER
 IS
begin
  v_comrer:=NULL;
end;
PROCEDURE INI_COMCLF
 IS
begin
  v_comclf := null;
end;
PROCEDURE INI_COMCOE
 IS
begin
  v_comcoe := null;
end;
PROCEDURE INI_COMEJE
 IS
begin
  v_comeje:=NULL;
end;
PROCEDURE INI_COMOCM
 IS
begin
  v_comocm := null;
end;
PROCEDURE INI_COMPED
 IS
begin
  v_comped:= null;
end;
PROCEDURE INI_COMPEE
 IS
begin
  v_compee := null;
end;
PROCEDURE INI_COMECE
 IS
begin
  v_comece := NULL;
end;
PROCEDURE INI_COMECO
 IS
begin
  v_comeco := NULL;
end;
PROCEDURE INI_COMPRV
 IS
begin
  v_comprv:=NULL;
end;
PROCEDURE INI_COMCON
 IS
begin
  v_comcon := NULL;
end;
/* Inicializar la variable v_comcpa. */
PROCEDURE INI_COMCPA
 IS
begin
  v_comcpa:=NULL;
end;
/* Inicializar la variable v_comctp. */
PROCEDURE INI_COMCTP
 IS
begin
  v_comctp:=NULL;
end;
/* Inicializar la variable v_comtco. */
PROCEDURE INI_COMTCO
 IS
begin
  v_comtco := NULL;
end;
PROCEDURE INI_COMPRT
 IS
begin
  v_comprt:=NULL;
end;
PROCEDURE INI_COMETQ
 IS
begin
  v_cometq:=NULL;
end;
PROCEDURE INI_COMRST
 IS
begin
  v_comrst:=NULL;
end;
/* Inicializa la variablr v_comfer. */
PROCEDURE INI_COMFER
 IS
begin
  v_comfer:=NULL;
end;
PROCEDURE INI_COMTPR
 IS
begin
  v_comtpr := NULL;
end;
PROCEDURE INI_COMRES
 IS
begin
  v_comres:=NULL;
end;
/* Insertar registro en COM_CALIFICACIONES_MOT. */
PROCEDURE INS_COMCMO
 (P_COMCMO IN COM_CALIFICACIONES_MOT%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_CALIFICACIONES_MOT
  (  ID
    ,COMCLF_ID
    ,COMCTM_ID
    ,VALOR_SN
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY              )
  values
   ( p_comcmo.ID
    ,p_comcmo.COMCLF_ID
    ,p_comcmo.COMCTM_ID
    ,p_comcmo.VALOR_SN
    ,p_comcmo.DATE_CREATED
    ,p_comcmo.CREATED_BY
    ,p_comcmo.DATE_MODIFIED
    ,p_comcmo.MODIFIED_BY     );
  --
END;
/* Insertar registro en COM_CALIFICACIONES_TMO. */
PROCEDURE INS_COMCTM
 (P_COMCTM IN COM_CALIFICACIONES_TMO%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_CALIFICACIONES_TMO
  (  ID
    ,SEGORG_ID
    ,CODIGO
    ,NOMBRE
    ,DESCRIPCION
    ,SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY
    ,CALIFICACION )
  values
   ( p_comctm.ID
    ,p_comctm.SEGORG_ID
    ,p_comctm.CODIGO
    ,p_comctm.NOMBRE
    ,p_comctm.DESCRIPCION
    ,p_comctm.SITUACION
    ,p_comctm.DATE_CREATED
    ,p_comctm.CREATED_BY
    ,p_comctm.DATE_MODIFIED
    ,p_comctm.MODIFIED_BY
    ,p_comctm.CALIFICACION );
  --
END;
/* Insertar registro en COM_REPUTACION_RUBPRV */
PROCEDURE INS_COMRRP
 (P_COMRRP IN COM_REPUTACION_RUBPRV%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_REPUTACION_RUBPRV
  ( ID
    ,COMRUB_ID
    ,FECHA_VIGENCIA
    ,TIPO
    ,COMPRV_ID
    ,VALOR
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY)
  values
  (  p_comrrp.ID
    ,p_comrrp.COMRUB_ID
    ,p_comrrp.FECHA_VIGENCIA
    ,p_comrrp.TIPO
    ,p_comrrp.COMPRV_ID
    ,p_comrrp.VALOR
    ,p_comrrp.DATE_CREATED
    ,p_comrrp.CREATED_BY
    ,p_comrrp.DATE_MODIFIED
    ,p_comrrp.MODIFIED_BY);
  --
END;
/* Insertar registro en COM_REPUTACION_RUB */
PROCEDURE INS_COMRER
 (P_COMRER IN COM_REPUTACION_RUB%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_REPUTACION_RUB
  ( ID
    ,COMRUB_ID
    ,FECHA_VIGENCIA
    ,TIPO
    ,POSICION
    ,VALOR
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY)
  values
  (  p_comrer.ID
    ,p_comrer.COMRUB_ID
    ,p_comrer.FECHA_VIGENCIA
    ,p_comrer.TIPO
    ,p_comrer.POSICION
    ,p_comrer.VALOR
    ,p_comrer.DATE_CREATED
    ,p_comrer.CREATED_BY
    ,p_comrer.DATE_MODIFIED
    ,p_comrer.MODIFIED_BY);
  --
END;
/* Insertar registro en COM_CALIFICACIONES */
PROCEDURE INS_COMCLF
 (P_COMCLF IN COM_CALIFICACIONES%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_CALIFICACIONES
  ( ID
    ,SEGORG_ID
    ,COMOCM_ID
    ,COMPRV_ID
    ,COMECO_ID
    ,TIPO
    ,CALIFICACION
    ,COMENTARIO
    ,FECHA
    ,SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY              )
  values
   ( p_comclf.ID
    ,p_comclf.SEGORG_ID
    ,p_comclf.COMOCM_ID
    ,p_comclf.COMPRV_ID
    ,p_comclf.COMECO_ID
    ,p_comclf.TIPO
    ,p_comclf.CALIFICACION
    ,p_comclf.COMENTARIO
    ,p_comclf.FECHA
    ,p_comclf.SITUACION
    ,p_comclf.DATE_CREATED
    ,p_comclf.CREATED_BY
    ,p_comclf.DATE_MODIFIED
    ,p_comclf.MODIFIED_BY     );
  --
END;
/* Insertar registro en COM_CATALOGO_PRECIOSACTL. */
PROCEDURE INS_COMCPA
 (P_COMCPA IN COM_CATALOGO_PRECIOSACTL%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_CATALOGO_PRECIOSACTL
  ( ID
   ,SEGORG_ID
   ,CODIGO
   ,NRO_LINEA
   ,CODIGO_ITEM
   ,PRECIO
   ,FECHA_PRECIO
   ,OBSERVACION
   ,COMCIT_ID
   ,SITUACION
   ,MOTIVO_SITUACION
   ,DATE_CREATED
   ,DATE_MODIFIED
   ,MODIFIED_BY
   ,CREATED_BY)
  VALUES
  ( p_comcpa.ID
   ,p_comcpa.SEGORG_ID
   ,p_comcpa.CODIGO
   ,p_comcpa.NRO_LINEA
   ,p_comcpa.CODIGO_ITEM
   ,p_comcpa.PRECIO
   ,p_comcpa.FECHA_PRECIO
   ,p_comcpa.OBSERVACION
   ,p_comcpa.COMCIT_ID
   ,p_comcpa.SITUACION
   ,p_comcpa.MOTIVO_SITUACION
   ,p_comcpa.DATE_CREATED
   ,p_comcpa.DATE_MODIFIED
   ,p_comcpa.MODIFIED_BY
   ,p_comcpa.CREATED_BY);
  --
END;
/* Insertar registro en COM_FERIADOS. */
PROCEDURE INS_COMFER
 (P_COMFER IN COM_FERIADOS%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_FERIADOS
  ( ID
  , SEGORG_ID
  , FECHA
  , TIPO
  , NOMBRE)
  VALUES
  ( p_comfer.ID
  , p_comfer.SEGORG_ID
  , p_comfer.FECHA
  , p_comfer.TIPO
  , p_comfer.NOMBRE);
  --
END;
/* Insertar registro en COM_CATLOGO_PRECIOS */
PROCEDURE INS_COMCTP
 (P_COMCTP IN COM_CATALOGO_PRECIOS%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_CATALOGO_PRECIOS
  (
    ID
   ,COMCIT_ID
   ,COMZON_ID
   ,PRECIO
   ,FECHA_VIGENCIA
   ,FECHA_VALIDEZ
   ,OBSERVACION
   ,SITUACION
   ,FECHA
   ,DATE_CREATED
   ,CREATED_BY
   ,DATE_MODIFIED
   ,MODIFIED_BY)
  VALUES
  (
    p_comctp.ID
   ,p_comctp.COMCIT_ID
   ,p_comctp.COMZON_ID
   ,p_comctp.PRECIO
   ,p_comctp.FECHA_VIGENCIA
   ,p_comctp.FECHA_VALIDEZ
   ,p_comctp.OBSERVACION
   ,p_comctp.SITUACION
   ,p_comctp.FECHA
   ,p_comctp.DATE_CREATED
   ,p_comctp.CREATED_BY
   ,p_comctp.DATE_MODIFIED
   ,p_comctp.MODIFIED_BY);
  --
END;
/* Insertar  registro en COM_CONTRATANTES_CATRES */
PROCEDURE INS_COMCCR
 (P_COMCCR IN COM_CONTRATANTES_CATRES%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_CONTRATANTES_CATRES
  ( ID
    ,COMECC_ID
    ,COMRES_ID
    ,DATE_CREATED
    ,FECHA_VALIDEZ
    ,FECHA_VIGENCIA
    ,SITUACION
    ,SEGUSU_ID
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY)
  values
  ( p_comccr.ID
    ,p_comccr.COMECC_ID
    ,p_comccr.COMRES_ID
    ,p_comccr.DATE_CREATED
    ,p_comccr.FECHA_VALIDEZ
    ,p_comccr.FECHA_VIGENCIA
    ,p_comccr.SITUACION
    ,p_comccr.SEGUSU_ID
    ,p_comccr.CREATED_BY
    ,p_comccr.DATE_MODIFIED
    ,p_comccr.MODIFIED_BY);
  --
END;
/* Insertar registro en COM_TRAMITES_PRV_TIPOR */
PROCEDURE INS_COMRPT
 (P_COMRPT IN COM_TRAMITES_PRV_TIPOR%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_TRAMITES_PRV_TIPOR
  ( ID
    ,COMTPT_ID
    ,ORDEN
    ,NOMBRE
    ,DESCRIPCION
    ,SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY)
  values
  ( p_comrpt.ID
   ,p_comrpt.COMTPT_ID
   ,p_comrpt.ORDEN
   ,p_comrpt.NOMBRE
   ,p_comrpt.DESCRIPCION
   ,p_comrpt.SITUACION
   ,p_comrpt.DATE_CREATED
   ,p_comrpt.CREATED_BY
   ,p_comrpt.DATE_MODIFIED
   ,p_comrpt.MODIFIED_BY);
  --
END;
/* Insertar registro en COM_ORDENES_COMPRAS */
PROCEDURE INS_COMOCM
 (P_COMOCM IN COM_ORDENES_COMPRAS%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_ORDENES_COMPRAS
  ( ID
,SEGORG_ID
,COMCON_ID
,COMADJ_ID
,COMPED_ID
,COMPRV_ID
,COMECO_ID
,CODIGO
,FECHA_GENERACION
,OBSERVACION
,PRORROGA_SN
,DATE_CREATED
,DATE_MODIFIED
,CREATED_BY
,MODIFIED_BY )
  values
   ( p_comocm.ID
,p_comocm.SEGORG_ID
,p_comocm.COMCON_ID
,p_comocm.COMADJ_ID
,p_comocm.COMPED_ID
,p_comocm.COMPRV_ID
,p_comocm.COMECO_ID
,p_comocm.CODIGO
,p_comocm.FECHA_GENERACION
,p_comocm.OBSERVACION
,p_comocm.PRORROGA_SN
,p_comocm.DATE_CREATED
,p_comocm.DATE_MODIFIED
,p_comocm.CREATED_BY
,p_comocm.MODIFIED_BY    );
  --
END;
/* Insertar restros en COM_ORDENES_COMPRAS_EST */
PROCEDURE INS_COMOCE
 (P_COMOCE IN COM_ORDENES_COMPRAS_EST%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_ORDENES_COMPRAS_EST
  ( ID
,COMOCM_ID
,FECHA
,ESTADO
,MOTIVO
,SITUACION
,DATE_CREATED
,DATE_MODIFIED
,CREATED_BY
,MODIFIED_BY )
  values
   ( p_comoce.ID
,p_comoce.COMOCM_ID
,p_comoce.FECHA
,p_comoce.ESTADO
,p_comoce.MOTIVO
,NVL(p_comoce.SITUACION,'VAL')
,p_comoce.DATE_CREATED
,p_comoce.DATE_MODIFIED
,p_comoce.CREATED_BY
,p_comoce.MODIFIED_BY   );
  --
END;
/* Insertar registros en COM_ORDENES_COMPRAS_DET */
PROCEDURE INS_COMOCD
 (P_COMOCD IN COM_ORDENES_COMPRAS_DET%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_ORDENES_COMPRAS_DET
  ( ID
,COMOCM_ID
,COMADD_ID
,COMPET_ID
,COMCZD_ID
,OBSERVACION
,DATE_CREATED
,DATE_MODIFIED
,CREATED_BY
,MODIFIED_BY )
  values
   ( p_comocd.ID
,p_comocd.COMOCM_ID
,p_comocd.COMADD_ID
,p_comocd.COMPET_ID
,p_comocd.COMCZD_ID
,p_comocd.OBSERVACION
,p_comocd.DATE_CREATED
,p_comocd.DATE_MODIFIED
,p_comocd.CREATED_BY
,p_comocd.MODIFIED_BY   );
  --
END;
/* Insertar registro en COM_ADJUDICACIONES_DET */
PROCEDURE INS_COMADD
 (P_COMADD IN COM_ADJUDICACIONES_DET%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_ADJUDICACIONES_DET
  ( ID
    ,COMADJ_ID
    ,COMPET_ID
    ,COMCZD_ID
    ,CANTIDAD_ADJUDICADA
    ,SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY              )
  values
   ( p_comadd.ID
    ,p_comadd.COMADJ_ID
    ,p_comadd.COMPET_ID
    ,p_comadd.COMCZD_ID
    ,p_comadd.CANTIDAD_ADJUDICADA
    ,p_comadd.SITUACION
    ,p_comadd.DATE_CREATED
    ,p_comadd.CREATED_BY
    ,p_comadd.DATE_MODIFIED
    ,p_comadd.MODIFIED_BY     );
  --
END;
/* insertar registro en COM_ADJUDICACIONES */
PROCEDURE INS_COMADJ
 (P_COMADJ IN COM_ADJUDICACIONES%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_ADJUDICACIONES
  ( ID
    ,COMCON_ID
    ,FECHA_GENERACION
    ,OBSERVACION
    ,SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY    )
  values
   ( p_comadj.ID
    ,p_comadj.COMCON_ID
    ,p_comadj.FECHA_GENERACION
    ,p_comadj.OBSERVACION
    ,p_comadj.SITUACION
    ,p_comadj.DATE_CREATED
    ,p_comadj.CREATED_BY
    ,p_comadj.DATE_MODIFIED
    ,p_comadj.MODIFIED_BY    );
  --
END;
/* Insertar registro en COM_COTIZACIONES */
PROCEDURE INS_COMCTZ
 (P_COMCTZ IN COM_COTIZACIONES%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_COTIZACIONES
  ( ID
    ,SEGORG_ID
    ,COMCON_ID
    ,COMPRV_ID
    ,CODIGO
    ,FECHA
    ,OBSERVACION
    ,SITUACION
    ,MOTIVO
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY )
  values
   ( p_comctz.ID
    ,p_comctz.SEGORG_ID
    ,p_comctz.COMCON_ID
    ,p_comctz.COMPRV_ID
    ,p_comctz.CODIGO
    ,p_comctz.FECHA
    ,p_comctz.OBSERVACION
    ,p_comctz.SITUACION
    ,p_comctz.MOTIVO
    ,p_comctz.DATE_CREATED
    ,p_comctz.CREATED_BY
    ,p_comctz.DATE_MODIFIED
    ,p_comctz.MODIFIED_BY);
      --
END;
/* Insertar registro en COM_COTIZACIONES_DOC. */
PROCEDURE INS_COMCZC
 (P_COMCZC IN COM_COTIZACIONES_DOC%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_COTIZACIONES_DOC
  ( ID
    ,COMCTZ_ID
    ,COMDCT_ID
    ,COMDOC_ID
    ,FECHA
    ,DATE_CREATED
    ,DATE_MODIFIED
    ,CREATED_BY
    ,MODIFIED_BY  )
  values
  ( p_comczc.ID
    ,p_comczc.COMCTZ_ID
    ,p_comczc.COMDCT_ID
    ,p_comczc.COMDOC_ID
    ,p_comczc.FECHA
    ,p_comczc.DATE_CREATED
    ,p_comczc.DATE_MODIFIED
    ,p_comczc.CREATED_BY
    ,p_comczc.MODIFIED_BY  );
  --
END;
/* Insertar registro en COM_COTIZACIONES_DETALLES */
PROCEDURE INS_COMCZD
 (P_COMCZD IN COM_COTIZACIONES_DETALLES%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_COTIZACIONES_DETALLES
  ( ID
    ,COMCTZ_ID
    ,COMPED_ID
    ,COMPET_ID
    ,PRECIO_UNITARIO_FINAL
    ,MARCA
    ,MODELO
    ,OBSERVACION
    ,EVALUACION
    ,MOTIVO_EVALUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY )
  values
  (  p_comczd.ID
    ,p_comczd.COMCTZ_ID
    ,p_comczd.COMPED_ID
    ,p_comczd.COMPET_ID
    ,p_comczd.PRECIO_UNITARIO_FINAL
    ,p_comczd.MARCA
    ,p_comczd.MODELO
    ,p_comczd.OBSERVACION
    ,p_comczd.EVALUACION
    ,p_comczd.MOTIVO_EVALUACION
    ,p_comczd.DATE_CREATED
    ,p_comczd.CREATED_BY
    ,p_comczd.DATE_MODIFIED
    ,p_comczd.MODIFIED_BY );
  --
END;
/* Insertar registro en la tabla COM_PEDIDOS_DAT */
PROCEDURE INS_COMPDA
 (P_COMPDA IN COM_PEDIDOS_DAT%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_PEDIDOS_DAT
    ( ID
    ,COMPED_ID
    ,COMDAT_ID
    ,INSTANCIA
    ,VALOR
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY    )
  values
  (  p_compda.ID
    ,p_compda.COMPED_ID
    ,p_compda.COMDAT_ID
    ,p_compda.INSTANCIA
    ,p_compda.VALOR
    ,p_compda.DATE_CREATED
    ,p_compda.CREATED_BY
    ,p_compda.DATE_MODIFIED
    ,p_compda.MODIFIED_BY    );
  --
END;
/* Insertar registro en COM_CONTRATACIONES_INV. */
PROCEDURE INS_COMCOI
 (P_COMCOI IN COM_CONTRATACIONES_INV%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_CONTRATACIONES_INV
  ( ID
    ,COMCON_ID
    ,COMPRV_ID
    ,FECHA
    ,OBSERVACION
    ,SITUACION
    ,DATE_CREATED
    ,DATE_MODIFIED
    ,CREATED_BY
    ,MODIFIED_BY  )
  values
  ( p_comcoi.ID
    ,p_comcoi.COMCON_ID
    ,p_comcoi.COMPRV_ID
    ,p_comcoi.FECHA
    ,p_comcoi.OBSERVACION
    ,p_comcoi.SITUACION
    ,p_comcoi.DATE_CREATED
    ,p_comcoi.DATE_MODIFIED
    ,p_comcoi.CREATED_BY
    ,p_comcoi.MODIFIED_BY  );
  --
END;
/* Insertar registro en COM_CONTRATACIONES_DOC. */
PROCEDURE INS_COMCOD
 (P_COMCOD IN COM_CONTRATACIONES_DOC%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_CONTRATACIONES_DOC
  ( ID
    ,COMCON_ID
    ,COMDCT_ID
    ,COMDOC_ID
    ,FECHA
    ,DATE_CREATED
    ,DATE_MODIFIED
    ,CREATED_BY
    ,MODIFIED_BY  )
  values
  ( p_comcod.ID
    ,p_comcod.COMCON_ID
    ,p_comcod.COMDCT_ID
    ,p_comcod.COMDOC_ID
    ,p_comcod.FECHA
    ,p_comcod.DATE_CREATED
    ,p_comcod.DATE_MODIFIED
    ,p_comcod.CREATED_BY
    ,p_comcod.MODIFIED_BY  );
  --
END;
/* Insertar registro en COM_CONTRATACIONES */
PROCEDURE INS_COMCON
 (P_COMCON IN COM_CONTRATACIONES%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_CONTRATACIONES
  ( ID
    ,SEGORG_ID
    ,COMCTT_ID
    ,COMCOE_ID
    ,CODIGO
    ,OBJETO
    ,MONTO_PRESUPUESTO
    ,FORMA_PAGO
    ,PLAZO_ENTREGA_DIAS
    ,VIGENCIA_OFERTA_DIAS
    ,METODO_ADJUDICACION
    ,CONSULTAS
    ,FECHA_PUBLICACION
    ,FECHA_LIMITE_PREGUNTA
    ,FECHA_INICIO_PROPUESTA
    ,FECHA_FIN_PROPUESTA
    ,FECHA_FIN_ACLARACION
    ,FECHA_APERTURA_PROPUESTA
    ,FECHA_INICIO_EVALUACION
    ,FECHA_ESTIMADA_ADJUDICACION
    ,LIMITE_MIN_COMCTZ
    ,LIMITE_MAX_COMCTZ
    ,PRIORIDAD
    ,OBSERVACIONES
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY )
  values
   ( p_comcon.ID
    ,p_comcon.SEGORG_ID
    ,p_comcon.COMCTT_ID
    ,p_comcon.COMCOE_ID
    ,p_comcon.CODIGO
    ,p_comcon.OBJETO
    ,p_comcon.MONTO_PRESUPUESTO
    ,p_comcon.FORMA_PAGO
    ,p_comcon.PLAZO_ENTREGA_DIAS
    ,p_comcon.VIGENCIA_OFERTA_DIAS
    ,p_comcon.METODO_ADJUDICACION
    ,p_comcon.CONSULTAS
    ,p_comcon.FECHA_PUBLICACION
    ,p_comcon.FECHA_LIMITE_PREGUNTA
    ,p_comcon.FECHA_INICIO_PROPUESTA
    ,p_comcon.FECHA_FIN_ACLARACION
    ,p_comcon.FECHA_FIN_PROPUESTA
    ,p_comcon.FECHA_APERTURA_PROPUESTA
    ,p_comcon.FECHA_INICIO_EVALUACION
    ,p_comcon.FECHA_ESTIMADA_ADJUDICACION
    ,p_comcon.LIMITE_MIN_COMCTZ
    ,p_comcon.LIMITE_MAX_COMCTZ
    ,p_comcon.PRIORIDAD
    ,p_comcon.OBSERVACIONES
    ,p_comcon.DATE_CREATED
    ,p_comcon.CREATED_BY
    ,p_comcon.DATE_MODIFIED
    ,p_comcon.MODIFIED_BY);
      --
END;
/* Insertar registro en COM_CONTRATACIONES_EST */
PROCEDURE INS_COMCOE
 (P_COMCOE IN COM_CONTRATACIONES_EST%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_CONTRATACIONES_EST
  ( ID
    ,COMCON_ID
    ,FECHA
    ,ESTADO
    ,MOTIVO
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY )
  values
  (  p_comcoe.ID
    ,p_comcoe.COMCON_ID
    ,p_comcoe.FECHA
    ,p_comcoe.ESTADO
    ,p_comcoe.MOTIVO
    ,p_comcoe.DATE_CREATED
    ,p_comcoe.CREATED_BY
    ,p_comcoe.DATE_MODIFIED
    ,p_comcoe.MODIFIED_BY );
  --
END;
/* Insertar registro en COM_CONTRATACIONES_DETALLES */
PROCEDURE INS_COMCOT
 (P_COMCOT IN COM_CONTRATACIONES_DETALLES%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_CONTRATACIONES_DETALLES
  ( ID
    ,COMCON_ID
    ,COMPED_ID
    ,OBSERVACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY )
  values
  (  p_comcot.ID
    ,p_comcot.COMCON_ID
    ,p_comcot.COMPED_ID
    ,p_comcot.OBSERVACION
    ,p_comcot.DATE_CREATED
    ,p_comcot.CREATED_BY
    ,p_comcot.DATE_MODIFIED
    ,p_comcot.MODIFIED_BY );
  --
END;
/* Insertar registro en COM_CONTRATACIONES_TIPOS. */
PROCEDURE INS_COMCTT
 (P_COMCTT IN COM_CONTRATACIONES_TIPOS%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_CONTRATACIONES_TIPOS
  (  ID
    ,SEGORG_ID
    ,CLASE
    ,NIVEL
    ,TIPO
    ,CODIGO
    ,NOMBRE
    ,PRECIO_TESTIGO_SN
    ,DESCRIPCION
    ,PRECIO_DESDE
    ,PRECIO_HASTA
    ,MENSAJE_PRV_SN
    ,MENSAJE_PRV
    ,TAMANIO_MAX_COMCZC
    ,SITUACION
    ,LIMITE_MIN_COMCTZ
    ,LIMITE_MAX_COMCTZ
    ,LIMITE_MAX_CALIFICAR
    ,MOTIVO_SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY
    ,METODO_SELECCION_PRV
    ,EXCLUIR_INVITACION_PRV_SN
    ,EXIGIR_FIRMADIGITAL_DOCCTZ_SN
    ,PUBLICAR_DOCPED_SN
    ,PUBLICAR_DOCCON_SN
    ,DESTACAR_PUBLICACION_SN
    ,METODO_ADJ_DEFAULT
    ,EMITIR_RESOLUCION_SN
     )
  values
  ( p_comctt.ID
    ,p_comctt.SEGORG_ID
    ,p_comctt.CLASE
    ,p_comctt.NIVEL
    ,p_comctt.TIPO
    ,p_comctt.CODIGO
    ,p_comctt.NOMBRE
    ,p_comctt.PRECIO_TESTIGO_SN
    ,p_comctt.DESCRIPCION
    ,p_comctt.PRECIO_DESDE
    ,p_comctt.PRECIO_HASTA
    ,p_comctt.MENSAJE_PRV_SN
    ,p_comctt.MENSAJE_PRV
    ,p_comctt.TAMANIO_MAX_COMCZC
    ,p_comctt.SITUACION
    ,p_comctt.LIMITE_MIN_COMCTZ
    ,p_comctt.LIMITE_MAX_COMCTZ
    ,p_comctt.LIMITE_MAX_CALIFICAR
    ,p_comctt.MOTIVO_SITUACION
    ,p_comctt.DATE_CREATED
    ,p_comctt.CREATED_BY
    ,p_comctt.DATE_MODIFIED
    ,p_comctt.MODIFIED_BY
    ,p_comctt.METODO_SELECCION_PRV
    ,p_comctt.EXCLUIR_INVITACION_PRV_SN
    ,p_comctt.EXIGIR_FIRMADIGITAL_DOCCTZ_SN
    ,p_comctt.PUBLICAR_DOCPED_SN
    ,p_comctt.PUBLICAR_DOCCON_SN
    ,p_comctt.DESTACAR_PUBLICACION_SN
    ,p_comctt.METODO_ADJ_DEFAULT
    ,p_comctt.EMITIR_RESOLUCION_SN
    );
  --
END;
/* Insertar registro en COM_PEDIDOS_DOC. */
PROCEDURE INS_COMPEC
 (P_COMPEC IN COM_PEDIDOS_DOC%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_PEDIDOS_DOC
  ( ID
    ,COMPED_ID
    ,COMDCT_ID
    ,COMDOC_ID
    ,FECHA
    ,DATE_CREATED
    ,DATE_MODIFIED
    ,CREATED_BY
    ,MODIFIED_BY  )
  values
  ( p_compec.ID
    ,p_compec.COMPED_ID
    ,p_compec.COMDCT_ID
    ,p_compec.COMDOC_ID
    ,p_compec.FECHA
    ,p_compec.DATE_CREATED
    ,p_compec.DATE_MODIFIED
    ,p_compec.CREATED_BY
    ,p_compec.MODIFIED_BY  );
  --
END;
/* Isertar registro en COM_PEDIDOS. */
PROCEDURE INS_COMPED
 (P_COMPED IN COM_PEDIDOS%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_PEDIDOS
  ( ID
    ,SEGORG_ID
    ,CODIGO
    ,FECHA_SOLICITUD
    ,COMECO_ID
    ,COMCOB_ID
    ,EJERCICIO
    ,CONTRATANTE
    ,SOLICITANTE
    ,DESCRIPCION
    ,CONTACTO
    ,COMDOM_ID
    ,TIPO_ENTREGA
    ,PLAZO_ENTREGA_CANTIDAD
    ,PLAZO_ENTREGA_UNIDAD
    ,PERIODO_ENTREGA
    ,FECHA_ENTREGA
    ,PRECIO
    ,PARTIDA_PRESUPUESTARIA
    ,EXPEDIENTE
    ,RESOLUCION
    ,OBSERVACIONES
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY      )
  values
  ( p_comped.ID
    ,p_comped.SEGORG_ID
    ,p_comped.CODIGO
    ,p_comped.FECHA_SOLICITUD
    ,p_comped.COMECO_ID
    ,p_comped.COMCOB_ID
    ,p_comped.EJERCICIO
    ,p_comped.CONTRATANTE
    ,p_comped.SOLICITANTE
    ,p_comped.DESCRIPCION
    ,p_comped.CONTACTO
    ,p_comped.COMDOM_ID
    ,p_comped.TIPO_ENTREGA
    ,p_comped.PLAZO_ENTREGA_CANTIDAD
    ,p_comped.PLAZO_ENTREGA_UNIDAD
    ,p_comped.PERIODO_ENTREGA
    ,p_comped.FECHA_ENTREGA
    ,p_comped.PRECIO
    ,p_comped.PARTIDA_PRESUPUESTARIA
    ,p_comped.EXPEDIENTE
    ,p_comped.RESOLUCION
    ,p_comped.OBSERVACIONES
    ,p_comped.DATE_CREATED
    ,p_comped.CREATED_BY
    ,p_comped.DATE_MODIFIED
    ,p_comped.MODIFIED_BY );
  --
END;
/* Insertar registro en COM_PEDIDOS_EST */
PROCEDURE INS_COMPEE
 (P_COMPEE IN COM_PEDIDOS_EST%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_PEDIDOS_EST
  ( ID
    ,COMPED_ID
    ,FECHA
    ,ESTADO
    ,MOTIVO
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY      )
  values
  ( p_compee.ID
    ,p_compee.COMPED_ID
    ,p_compee.FECHA
    ,p_compee.ESTADO
    ,p_compee.MOTIVO
    ,p_compee.DATE_CREATED
    ,p_compee.CREATED_BY
    ,p_compee.DATE_MODIFIED
    ,p_compee.MODIFIED_BY   );
  --
END;
/* Insertar registro en COM_PEDIDOS_DETALLES. */
PROCEDURE INS_COMPET
 (P_COMPET IN COM_PEDIDOS_DETALLES%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_PEDIDOS_DETALLES
  ( ID
    ,COMPED_ID
    ,RENGLON
    ,COMCCL_ID
    ,COMCIT_ID
    ,CODIGO
    ,DESCRIPCION
    ,CANTIDAD
    ,PRECIO_UNITARIO
    ,OBSERVACION
    ,SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY)
  values
  ( p_compet.ID
    ,p_compet.COMPED_ID
    ,p_compet.RENGLON
    ,p_compet.COMCCL_ID
    ,p_compet.COMCIT_ID
    ,p_compet.CODIGO
    ,p_compet.DESCRIPCION
    ,p_compet.CANTIDAD
    ,p_compet.PRECIO_UNITARIO
    ,p_compet.OBSERVACION
    ,p_compet.SITUACION
    ,p_compet.DATE_CREATED
    ,p_compet.CREATED_BY
    ,p_compet.DATE_MODIFIED
    ,p_compet.MODIFIED_BY);
  --
END;
/* Insertar registyro en COM_CATALOGO_OBJETOS. */
PROCEDURE INS_COMCOB
 (P_COMCOB IN COM_CATALOGO_OBJETOS%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_CATALOGO_OBJETOS
    ( ID
    ,SEGORG_ID
    ,CODIGO
    ,NOMBRE
    ,SOLO_ITEMS_NOMENCLADOS_SN
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY    )
  values
  ( p_comcob.ID
    ,p_comcob.SEGORG_ID
    ,p_comcob.CODIGO
    ,p_comcob.NOMBRE
    ,p_comcob.SOLO_ITEMS_NOMENCLADOS_SN
    ,p_comcob.DATE_CREATED
    ,p_comcob.CREATED_BY
    ,p_comcob.DATE_MODIFIED
    ,p_comcob.MODIFIED_BY    );
  --
END;
/* Insertar registro en COM_CONTRATANTES_EST */
PROCEDURE INS_COMECE
 (P_COMECE IN COM_CONTRATANTES_EST%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_CONTRATANTES_EST
  ( ID
    ,COMECO_ID
    ,ESTADO
    ,FECHA_VIGENCIA
    ,FECHA_VALIDEZ
    ,COMDOC_ID
    ,SITUACION
    ,MOTIVO_SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY            )
  values
  ( p_comece.ID
    ,p_comece.COMECO_ID
    ,p_comece.ESTADO
    ,p_comece.FECHA_VIGENCIA
    ,p_comece.FECHA_VALIDEZ
    ,p_comece.COMDOC_ID
    ,p_comece.SITUACION
    ,p_comece.MOTIVO_SITUACION
    ,p_comece.DATE_CREATED
    ,p_comece.CREATED_BY
    ,p_comece.DATE_MODIFIED
    ,p_comece.MODIFIED_BY);
  --
END;
/* Insertar registro en COM_CATALOGO_ITEMS. */
PROCEDURE INS_COMCIT
 (P_COMCIT IN COM_CATALOGO_ITEMS%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_CATALOGO_ITEMS
    ( ID
    ,COMCOB_ID
    ,COMCCL_ID
    ,CODIGO
    ,ESTADO
    ,TIPO
    ,PROCESO
    ,ADITIVO
    ,AGREGADO
    ,ENVASE
    ,CONTENIDO_CANTIDAD
    ,CONTENIDO_UNIDAD_MEDIDA
    ,CONTROL_PRECIOS_SN
    ,SITUACION
    ,MOTIVO_SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY    )
  values
  ( p_comcit.ID
    ,p_comcit.COMCOB_ID
    ,p_comcit.COMCCL_ID
    ,p_comcit.CODIGO
    ,p_comcit.ESTADO
    ,p_comcit.TIPO
    ,p_comcit.PROCESO
    ,p_comcit.ADITIVO
    ,p_comcit.AGREGADO
    ,p_comcit.ENVASE
    ,p_comcit.CONTENIDO_CANTIDAD
    ,p_comcit.CONTENIDO_UNIDAD_MEDIDA
    ,p_comcit.CONTROL_PRECIOS_SN
    ,p_comcit.SITUACION
    ,p_comcit.MOTIVO_SITUACION
    ,p_comcit.DATE_CREATED
    ,p_comcit.CREATED_BY
    ,p_comcit.DATE_MODIFIED
    ,p_comcit.MODIFIED_BY    );
  --
END;
/* Insertar registro en com_rubcob. */
PROCEDURE INS_COMRCB
 (P_COMRCB IN COM_RUBCOB%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_RUBCOB
  ( ID
    ,COMCOB_ID
    ,COMRUB_ID
    ,SITUACION
    ,MOTIVO_SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY)
  values
  ( p_comrcb.ID
    ,p_comrcb.COMCOB_ID
    ,p_comrcb.COMRUB_ID
    ,p_comrcb.SITUACION
    ,p_comrcb.MOTIVO_SITUACION
    ,p_comrcb.DATE_CREATED
    ,p_comrcb.CREATED_BY
    ,p_comrcb.DATE_MODIFIED
    ,p_comrcb.MODIFIED_BY);
  --
END;
/* Insertar registro en COM_CATALOGO_CLASES. */
PROCEDURE INS_COMCCL
 (P_COMCCL IN COM_CATALOGO_CLASES%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_CATALOGO_CLASES
    ( ID
    ,COMCOB_ID
    ,CODIGO
    ,NOMBRE
    ,SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY      )
  values
  ( p_comccl.ID
    ,p_comccl.COMCOB_ID
    ,p_comccl.CODIGO
    ,p_comccl.NOMBRE
    ,p_comccl.SITUACION
    ,p_comccl.DATE_CREATED
    ,p_comccl.CREATED_BY
    ,p_comccl.DATE_MODIFIED
    ,p_comccl.MODIFIED_BY     );
  --
END;
/* Insertar  registro en COM_CONTRATANTES_RES */
PROCEDURE INS_COMCNR
 (P_COMCNR IN COM_CONTRATANTES_RES%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_CONTRATANTES_RES
  ( ID
    ,COMECO_ID
    ,COMRES_ID
    ,DATE_CREATED
    ,FECHA_VALIDEZ
    ,FECHA_VIGENCIA
    ,SITUACION
    ,SEGUSU_ID
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY)
  values
  ( p_comcnr.ID
    ,p_comcnr.COMECO_ID
    ,p_comcnr.COMRES_ID
    ,p_comcnr.DATE_CREATED
    ,p_comcnr.FECHA_VALIDEZ
    ,p_comcnr.FECHA_VIGENCIA
    ,p_comcnr.SITUACION
    ,p_comcnr.SEGUSU_ID
    ,p_comcnr.CREATED_BY
    ,p_comcnr.DATE_MODIFIED
    ,p_comcnr.MODIFIED_BY);
  --
END;
/* Insertar registro en COM_CONTRATANTES_TIPOS */
PROCEDURE INS_COMCNT
 (P_COMCNT IN COM_CONTRATANTES_TIPOS%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_CONTRATANTES_TIPOS
  ( ID
    ,SEGORG_ID
    ,CODIGO
    ,NOMBRE
    ,TIPO_PERSONA
    ,SOLICITAR_RESPONSABLE_SN
    ,GENERAR_USUARIO_SN
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY )
  values
  ( p_comcnt.ID
    ,p_comcnt.SEGORG_ID
    ,p_comcnt.CODIGO
    ,p_comcnt.NOMBRE
    ,p_comcnt.TIPO_PERSONA
    ,p_comcnt.SOLICITAR_RESPONSABLE_SN
    ,p_comcnt.GENERAR_USUARIO_SN
    ,p_comcnt.DATE_CREATED
    ,p_comcnt.CREATED_BY
    ,p_comcnt.DATE_MODIFIED
    ,p_comcnt.MODIFIED_BY);
  --
END;
/* Insertar registro en COM_ETIQUETAS */
PROCEDURE INS_COMETQ
 (P_COMETQ IN COM_ETIQUETAS%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_ETIQUETAS
  ( ID
    ,SEGORG_ID
    ,CODIGO
    ,VALOR
    ,DESCRIPCION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY )
  values
  ( p_cometq.ID
    ,p_cometq.SEGORG_ID
    ,p_cometq.CODIGO
    ,p_cometq.VALOR
    ,p_cometq.DESCRIPCION
    ,p_cometq.DATE_CREATED
    ,p_cometq.CREATED_BY
    ,p_cometq.DATE_MODIFIED
    ,p_cometq.MODIFIED_BY);
  --
END;
/* Insertar registro en COM_CONTRATANTES_TREQ. */
PROCEDURE INS_COMCTR
 (P_COMCTR IN COM_CONTRATANTES_TREQ%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_CONTRATANTES_TREQ
  ( ID
    ,COMCNT_ID
    ,ORDEN
    ,DESCRIPCION
    ,COMDOC_ID
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY)
  values
  ( p_comctr.ID
    ,p_comctr.COMCNT_ID
    ,p_comctr.ORDEN
    ,p_comctr.DESCRIPCION
    ,p_comctr.COMDOC_ID
    ,p_comctr.DATE_CREATED
    ,p_comctr.CREATED_BY
    ,p_comctr.DATE_MODIFIED
    ,p_comctr.MODIFIED_BY);
  --
END;
/* Insertar registro en COM_DOCUMENTOS_TIPOS */
PROCEDURE INS_COMDCT
 (P_COMDCT IN COM_DOCUMENTOS_TIPOS%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_DOCUMENTOS_TIPOS
  ( ID
    ,SEGORG_ID
    ,CODIGO
    ,NOMBRE
    ,OBLIGATORIO_SN
    ,CANTIDAD_MAXIMA
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY )
  values
  ( p_comdct.ID
    ,p_comdct.SEGORG_ID
    ,p_comdct.CODIGO
    ,p_comdct.NOMBRE
    ,p_comdct.OBLIGATORIO_SN
    ,p_comdct.CANTIDAD_MAXIMA
    ,p_comdct.DATE_CREATED
    ,p_comdct.CREATED_BY
    ,p_comdct.DATE_MODIFIED
    ,p_comdct.MODIFIED_BY );
  --
END;
/* Insertar registro en COM_DOMICILIOS_TIPOS */
PROCEDURE INS_COMDMT
 (P_COMDMT IN COM_DOMICILIOS_TIPOS%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_DOMICILIOS_TIPOS
  ( ID
    ,SEGORG_ID
    ,CODIGO
    ,NOMBRE
    ,OBLIGATORIO_SN
    ,CANTIDAD_MAXIMA
    ,PAIS
    ,PROVINCIA
    ,DEPARTAMENTO
    ,LOCALIDAD
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY )
  values
  (p_comdmt.ID
    ,p_comdmt.SEGORG_ID
    ,p_comdmt.CODIGO
    ,p_comdmt.NOMBRE
    ,p_comdmt.OBLIGATORIO_SN
    ,p_comdmt.CANTIDAD_MAXIMA
    ,p_comdmt.PAIS
    ,p_comdmt.PROVINCIA
    ,p_comdmt.DEPARTAMENTO
    ,p_comdmt.LOCALIDAD
    ,p_comdmt.DATE_CREATED
    ,p_comdmt.CREATED_BY
    ,p_comdmt.DATE_MODIFIED
    ,p_comdmt.MODIFIED_BY);
  --
END;
/* Insertar registro en COM_DOCUMENTOS. */
PROCEDURE INS_COMDOC
 (P_COMDOC IN COM_DOCUMENTOS%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_DOCUMENTOS
  ( ID
    ,COMDCT_ID
    ,DOCUMENTO
    ,NOMBRE_ARCHIVO
    ,TIPO_ARCHIVO
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY)
  values
  ( p_comdoc.ID
    ,p_comdoc.COMDCT_ID
    ,p_comdoc.DOCUMENTO
    ,p_comdoc.NOMBRE_ARCHIVO
    ,p_comdoc.TIPO_ARCHIVO
    ,p_comdoc.DATE_CREATED
    ,p_comdoc.CREATED_BY
    ,p_comdoc.DATE_MODIFIED
    ,p_comdoc.MODIFIED_BY);
  --
END;
/* Insertar registro en COM_DOMICILIOS */
PROCEDURE INS_COMDOM
 (P_COMDOM IN COM_DOMICILIOS%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_DOMICILIOS
  ( ID
    ,COMDMT_ID
    ,PAIS
    ,PROVINCIA
    ,DEPARTAMENTO
    ,LOCALIDAD
    ,CALLE
    ,NUMERO_CASA
    ,PISO
    ,DPTO
    ,OBSERVACION
    ,CODIGO_POSTAL
    ,TELEFONO_CODIGO_AREA
    ,TELEFONO_NUMERO
    ,FAX_CODIGO_AREA
    ,FAX_NUMERO
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY            )
  values
  ( p_comdom.ID
    ,p_comdom.COMDMT_ID
    ,p_comdom.PAIS
    ,p_comdom.PROVINCIA
    ,p_comdom.DEPARTAMENTO
    ,p_comdom.LOCALIDAD
    ,p_comdom.CALLE
    ,p_comdom.NUMERO_CASA
    ,p_comdom.PISO
    ,p_comdom.DPTO
    ,p_comdom.OBSERVACION
    ,p_comdom.CODIGO_POSTAL
    ,p_comdom.TELEFONO_CODIGO_AREA
    ,p_comdom.TELEFONO_NUMERO
    ,p_comdom.FAX_CODIGO_AREA
    ,p_comdom.FAX_NUMERO
    ,p_comdom.DATE_CREATED
    ,p_comdom.CREATED_BY
    ,p_comdom.DATE_MODIFIED
    ,p_comdom.MODIFIED_BY            );
  --
END;
/* Insertar registro en COM_CONTRATANTES_CAT. */
PROCEDURE INS_COMECC
 (P_COMECC IN COM_CONTRATANTES_CAT%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_CONTRATANTES_CAT
  ( ID
    ,SEGORG_ID
    ,CODIGO
    ,NOMBRE
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY)
  values
  ( p_comecc.ID
    ,p_comecc.SEGORG_ID
    ,p_comecc.CODIGO
    ,p_comecc.NOMBRE
    ,p_comecc.DATE_CREATED
    ,p_comecc.CREATED_BY
    ,p_comecc.DATE_MODIFIED
    ,p_comecc.MODIFIED_BY);
  --
END;
/* Insertar registro en COM_CONTRATANTES */
PROCEDURE INS_COMECO
 (P_COMECO IN COM_CONTRATANTES%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_CONTRATANTES
  (ID
   ,SEGORG_ID
   ,COMCNT_ID
   ,COMECC_ID
   ,CODIGO
   ,NOMBRE
   ,EMAIL
   ,AUTOGESTIONADO_SN
   ,PROCESO_DESCENTRALIZADO_SN
   ,DATE_CREATED
   ,CREATED_BY
   ,DATE_MODIFIED
   ,MODIFIED_BY    )
  values
  (p_comeco.ID
   ,p_comeco.SEGORG_ID
   ,p_comeco.COMCNT_ID
   ,p_comeco.COMECC_ID
   ,p_comeco.CODIGO
   ,p_comeco.NOMBRE
   ,p_comeco.EMAIL
   ,p_comeco.AUTOGESTIONADO_SN
   ,p_comeco.PROCESO_DESCENTRALIZADO_SN
   ,p_comeco.DATE_CREATED
   ,p_comeco.CREATED_BY
   ,p_comeco.DATE_MODIFIED
   ,p_comeco.MODIFIED_BY    );
  --
END;
/* Insertar registro en COM_CONTRATANTES_VINC */
PROCEDURE INS_COMECV
 (P_COMECV IN COM_CONTRATANTES_VINC%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_CONTRATANTES_VINC
  (ID
   ,COMECO_ID_PADRE
   ,COMECO_ID_HIJO
   ,OBSERVACION
   ,DATE_CREATED
   ,CREATED_BY
   ,DATE_MODIFIED
   ,MODIFIED_BY    )
  values
  (p_comecv.ID
   ,p_comecv.COMECO_ID_PADRE
   ,p_comecv.COMECO_ID_HIJO
   ,p_comecv.OBSERVACION
   ,p_comecv.DATE_CREATED
   ,p_comecv.CREATED_BY
   ,p_comecv.DATE_MODIFIED
   ,p_comecv.MODIFIED_BY    );
  --
END;
/* Insertar registro en COM_PROVEEDORES_DOM */
PROCEDURE INS_COMPRD
 (P_COMPRD IN COM_PROVEEDORES_DOM%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_PROVEEDORES_DOM
  ( ID
    ,COMPRV_ID
    ,COMDOM_ID
    ,SITUACION
    ,FECHA_VIGENCIA
    ,FECHA_VALIDEZ
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY)
  values
  ( p_comprd.ID
    ,p_comprd.COMPRV_ID
    ,p_comprd.COMDOM_ID
    ,p_comprd.SITUACION
    ,p_comprd.FECHA_VIGENCIA
    ,p_comprd.FECHA_VALIDEZ
    ,p_comprd.DATE_CREATED
    ,p_comprd.CREATED_BY
    ,p_comprd.DATE_MODIFIED
    ,p_comprd.MODIFIED_BY);
  --
END;
/* Insertar registro en COM_PROVEEDORES_EST */
PROCEDURE INS_COMPRE
 (P_COMPRE IN COM_PROVEEDORES_EST%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_PROVEEDORES_EST
  ( ID
    ,COMPRV_ID
    ,ESTADO
    ,FECHA_VIGENCIA
    ,FECHA_VALIDEZ
    ,COMDOC_ID
    ,DESCRIPCION
    ,SITUACION
    ,MOTIVO_SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY)
  values
  ( p_compre.ID
    ,p_compre.COMPRV_ID
    ,p_compre.ESTADO
    ,p_compre.FECHA_VIGENCIA
    ,p_compre.FECHA_VALIDEZ
    ,p_compre.COMDOC_ID
    ,p_compre.DESCRIPCION
    ,p_compre.SITUACION
    ,p_compre.MOTIVO_SITUACION
    ,p_compre.DATE_CREATED
    ,p_compre.CREATED_BY
    ,p_compre.DATE_MODIFIED
    ,p_compre.MODIFIED_BY);
  --
END;
/* Insertar registro en COM_PROVEEDORES_RUB */
PROCEDURE INS_COMPRR
 (P_COMPRR IN COM_PROVEEDORES_RUB%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_PROVEEDORES_RUB
  ( ID
    ,COMPRV_ID
    ,COMRUB_ID
    ,SITUACION
    ,OBSERVACION
    ,FECHA_VIGENCIA
    ,FECHA_VALIDEZ
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY)
  values
  ( p_comprr.ID
    ,p_comprr.COMPRV_ID
    ,p_comprr.COMRUB_ID
    ,p_comprr.SITUACION
    ,p_comprr.OBSERVACION
    ,p_comprr.FECHA_VIGENCIA
    ,p_comprr.FECHA_VALIDEZ
    ,p_comprr.DATE_CREATED
    ,p_comprr.CREATED_BY
    ,p_comprr.DATE_MODIFIED
    ,p_comprr.MODIFIED_BY);
  --
END;
/* Insertar registro en COM_PROVEEDORES_RES */
PROCEDURE INS_COMPRS
 (P_COMPRS IN COM_PROVEEDORES_RES%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_PROVEEDORES_RES
  ( ID
    ,COMPRV_ID
    ,COMRES_ID
    ,SEGUSU_ID
    ,SITUACION
    ,FECHA_VIGENCIA
    ,FECHA_VALIDEZ
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY)
  values
  ( p_comprs.ID
    ,p_comprs.COMPRV_ID
    ,p_comprs.COMRES_ID
    ,p_comprs.SEGUSU_ID
    ,p_comprs.SITUACION
    ,p_comprs.FECHA_VIGENCIA
    ,p_comprs.FECHA_VALIDEZ
    ,p_comprs.DATE_CREATED
    ,p_comprs.CREATED_BY
    ,p_comprs.DATE_MODIFIED
    ,p_comprs.MODIFIED_BY);
  --
END;
/* Insertar registro en COM_PROVEEDORES_TIPOS */
PROCEDURE INS_COMPRT
 (P_COMPRT IN COM_PROVEEDORES_TIPOS%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_PROVEEDORES_TIPOS
  ( ID
    ,SEGORG_ID
    ,CODIGO
    ,NOMBRE
    ,TIPO_PERSONA
    ,SOLICITAR_RESPONSABLE_SN
    ,GENERAR_USUARIO_SN
    ,SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY)
  values
  ( p_comprt.ID
    ,p_comprt.SEGORG_ID
    ,p_comprt.CODIGO
    ,p_comprt.NOMBRE
    ,p_comprt.TIPO_PERSONA
    ,p_comprt.SOLICITAR_RESPONSABLE_SN
    ,p_comprt.GENERAR_USUARIO_SN
    ,p_comprt.SITUACION
    ,p_comprt.DATE_CREATED
    ,p_comprt.CREATED_BY
    ,p_comprt.DATE_MODIFIED
    ,p_comprt.MODIFIED_BY);
  --
END;
/* Insertar registro en COM_PROVEEDORES */
PROCEDURE INS_COMPRV
 (P_COMPRV IN COM_PROVEEDORES%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_PROVEEDORES
  ( ID
    ,SEGORG_ID
    ,COMPRT_ID
    ,CUIT
    ,NOMBRE
    ,DESCRIPCION_ACTIVIDAD
    ,EMAIL
    ,CONDICION_IB
    ,NUMERO_INSCRIPCION_IB
    ,FECHA_INSCRIPCION_IB
    ,NUMERO_CONVENIO_MULTILATERAL
    ,CBU
    ,OBSERVACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY)
  values
  ( p_comprv.ID
    ,p_comprv.SEGORG_ID
    ,p_comprv.COMPRT_ID
    ,p_comprv.CUIT
    ,p_comprv.NOMBRE
    ,p_comprv.DESCRIPCION_ACTIVIDAD
    ,p_comprv.EMAIL
    ,p_comprv.CONDICION_IB
    ,p_comprv.NUMERO_INSCRIPCION_IB
    ,p_comprv.FECHA_INSCRIPCION_IB
    ,p_comprv.NUMERO_CONVENIO_MULTILATERAL
    ,p_comprv.CBU
    ,p_comprv.OBSERVACION
    ,p_comprv.DATE_CREATED
    ,p_comprv.CREATED_BY
    ,p_comprv.DATE_MODIFIED
    ,p_comprv.MODIFIED_BY);
  --
END;
/* Insertar registro en COM_PROVEEDORES_TREQ */
PROCEDURE INS_COMPTR
 (P_COMPTR IN COM_PROVEEDORES_TREQ%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_PROVEEDORES_TREQ
  ( ID
    ,COMPRT_ID
    ,ORDEN
    ,DESCRIPCION
    ,COMDOC_ID
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY)
  values
  ( p_comptr.ID
    ,p_comptr.COMPRT_ID
    ,p_comptr.ORDEN
    ,p_comptr.DESCRIPCION
    ,p_comptr.COMDOC_ID
    ,p_comptr.DATE_CREATED
    ,p_comptr.CREATED_BY
    ,p_comptr.DATE_MODIFIED
    ,p_comptr.MODIFIED_BY);
  --
END;
/* Insertar registro en COM_RUBROS_CAT */
PROCEDURE INS_COMRBC
 (P_COMRBC IN COM_RUBROS_CAT%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_RUBROS_CAT
  ( ID
    ,SEGORG_ID
    ,CODIGO
    ,NOMBRE
    ,SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY)
  values
  ( p_comrbc.ID
    ,p_comrbc.SEGORG_ID
    ,p_comrbc.CODIGO
    ,p_comrbc.NOMBRE
    ,NVL(p_comrbc.SITUACION,'VIG')
    ,p_comrbc.DATE_CREATED
    ,p_comrbc.CREATED_BY
    ,p_comrbc.DATE_MODIFIED
    ,p_comrbc.MODIFIED_BY);
  --
END;
/* Insertar registro en COM_RESPONSABLES */
PROCEDURE INS_COMRES
 (P_COMRES IN COM_RESPONSABLES%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_RESPONSABLES
  ( ID
    ,COMRST_ID
    ,TIPO_DOCUMENTO
    ,NUMERO_DOCUMENTO
    ,NOMBRE
    ,EMAIL
    ,OBSERVACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY)
  values
  ( p_comres.ID
    ,p_comres.COMRST_ID
    ,p_comres.TIPO_DOCUMENTO
    ,p_comres.NUMERO_DOCUMENTO
    ,p_comres.NOMBRE
    ,p_comres.EMAIL
    ,p_comres.OBSERVACION
    ,p_comres.DATE_CREATED
    ,p_comres.CREATED_BY
    ,p_comres.DATE_MODIFIED
    ,p_comres.MODIFIED_BY);
  --
END;
/* Insertar registro en COM_RESPONSABLES_TIPOS */
PROCEDURE INS_COMRST
 (P_COMRST IN COM_RESPONSABLES_TIPOS%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_RESPONSABLES_TIPOS
  ( ID
    ,SEGORG_ID
    ,CODIGO
    ,NOMBRE
    ,OBLIGATORIO_SN
    ,CANTIDAD_MAXIMA
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY)
  values
  ( p_comrst.ID
    ,p_comrst.SEGORG_ID
    ,p_comrst.CODIGO
    ,p_comrst.NOMBRE
    ,p_comrst.OBLIGATORIO_SN
    ,p_comrst.CANTIDAD_MAXIMA
    ,p_comrst.DATE_CREATED
    ,p_comrst.CREATED_BY
    ,p_comrst.DATE_MODIFIED
    ,p_comrst.MODIFIED_BY);
  --
END;
/* Insertar registro en COM_RUBROS */
PROCEDURE INS_COMRUB
 (P_COMRUB IN COM_RUBROS%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_RUBROS
  ( ID
    ,SEGORG_ID
    ,COMRBC_ID
    ,CODIGO
    ,NOMBRE
    ,DESCRIPCION
    ,SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY)
  values
  ( p_comrub.ID
    ,p_comrub.SEGORG_ID
    ,p_comrub.COMRBC_ID
    ,p_comrub.CODIGO
    ,p_comrub.NOMBRE
    ,p_comrub.DESCRIPCION
    ,p_comrub.SITUACION
    ,p_comrub.DATE_CREATED
    ,p_comrub.CREATED_BY
    ,p_comrub.DATE_MODIFIED
    ,p_comrub.MODIFIED_BY);
  --
END;
/* Insertar registro en COM_TRAMITES_PRV_OBD */
PROCEDURE INS_COMTOD
 (P_COMTOD IN COM_TRAMITES_PRV_OBD%ROWTYPE
 )
 IS
begin
  --
  insert into COM_TRAMITES_PRV_OBD
  ( ID
   ,COMTPR_ID
   ,COMOBD_ID
   ,OBSERVACION
   ,DATE_CREATED
   ,DATE_MODIFIED
   ,CREATED_BY
   ,MODIFIED_BY)
  values
  ( p_comtod.ID
   ,p_comtod.COMTPR_ID
   ,p_comtod.COMOBD_ID
   ,p_comtod.OBSERVACION
   ,p_comtod.DATE_CREATED
   ,p_comtod.DATE_MODIFIED
   ,p_comtod.CREATED_BY
   ,p_comtod.MODIFIED_BY);
  --
end;
PROCEDURE INS_COMTCS
 (P_COMTCS IN COM_TRAMITES_CON_RES%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_TRAMITES_CON_RES
  ( ID
   ,COMTCO_ID
   ,COMRES_ID
   ,OPERACION
   ,DATE_CREATED
   ,DATE_MODIFIED
   ,CREATED_BY
   ,MODIFIED_BY)
  values
  ( p_comtcs.ID
   ,p_comtcs.COMTCO_ID
   ,p_comtcs.COMRES_ID
   ,p_comtcs.OPERACION
   ,p_comtcs.DATE_CREATED
   ,p_comtcs.DATE_MODIFIED
   ,p_comtcs.CREATED_BY
   ,p_comtcs.MODIFIED_BY);
  --
END;
/* Insertar registro en  COM_TRAMITES_CON */
PROCEDURE INS_COMTCO
 (P_COMTCO IN COM_TRAMITES_CON%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_TRAMITES_CON
  ( ID
    ,SEGORG_ID
    ,TIPO
    ,FECHA
    ,COMECO_ID
    ,COMCNT_ID
    ,CODIGO
    ,NOMBRE
    ,EMAIL
    ,SITUACION
    ,MOTIVO_SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY )
  values
   ( p_comtco.ID
    ,p_comtco.SEGORG_ID
    ,p_comtco.TIPO
    ,p_comtco.FECHA
    ,p_comtco.COMECO_ID
    ,p_comtco.COMCNT_ID
    ,p_comtco.CODIGO
    ,p_comtco.NOMBRE
    ,p_comtco.EMAIL
    ,p_comtco.SITUACION
    ,p_comtco.MOTIVO_SITUACION
    ,p_comtco.DATE_CREATED
    ,p_comtco.CREATED_BY
    ,p_comtco.DATE_MODIFIED
    ,p_comtco.MODIFIED_BY);
  --
END;
/* Insertar registro en COM_TRAMITES_PRV_RUB */
PROCEDURE INS_COMTPB
 (P_COMTPB IN COM_TRAMITES_PRV_RUB%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_TRAMITES_PRV_RUB
  ( ID
    ,COMTPR_ID
    ,COMRUB_ID
    ,OBSERVACION
    ,OPERACION
    ,DATE_CREATED
    ,DATE_MODIFIED
    ,CREATED_BY
    ,MODIFIED_BY)
  values
  ( p_comtpb.ID
    ,p_comtpb.COMTPR_ID
    ,p_comtpb.COMRUB_ID
    ,p_comtpb.OBSERVACION
    ,p_comtpb.OPERACION
    ,p_comtpb.DATE_CREATED
    ,p_comtpb.DATE_MODIFIED
    ,p_comtpb.CREATED_BY
    ,p_comtpb.MODIFIED_BY);
  --
END;
/* Insertar registro en  COM_TRAMITES_PRV_DOM */
PROCEDURE INS_COMTPD
 (P_COMTPD IN COM_TRAMITES_PRV_DOM%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_TRAMITES_PRV_DOM
  ( ID
    ,COMTPR_ID
    ,COMDOM_ID
    ,OPERACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY)
  values
  ( p_comtpd.ID
    ,p_comtpd.COMTPR_ID
    ,p_comtpd.COMDOM_ID
    ,p_comtpd.OPERACION
    ,p_comtpd.DATE_CREATED
    ,p_comtpd.CREATED_BY
    ,p_comtpd.DATE_MODIFIED
    ,p_comtpd.MODIFIED_BY );
  --
END;
/* Insertar registro en COM_TRAMITES_PRV_RGP */
PROCEDURE INS_COMTPG
 (P_COMTPG IN COM_TRAMITES_PRV_RGP%ROWTYPE
 )
 IS
begin
  --
  insert into COM_TRAMITES_PRV_RGP
  (ID
  ,COMTPR_ID
  ,COMRGP_ID
  ,OPERACION
  ,OBSERVACION
  ,DATE_CREATED
  ,DATE_MODIFIED
  ,CREATED_BY
  ,MODIFIED_BY
   )
  values
  (p_comtpg.ID
  ,p_comtpg.COMTPR_ID
  ,p_comtpg.COMRGP_ID
  ,p_comtpg.OPERACION
  ,p_comtpg.OBSERVACION
  ,p_comtpg.DATE_CREATED
  ,p_comtpg.DATE_MODIFIED
  ,p_comtpg.CREATED_BY
  ,p_comtpg.MODIFIED_BY
  );
  --
end;
/* Insertar registro en COM_TRAMITES_PRV_OBJ */
PROCEDURE INS_COMTPO
 (P_COMTPO IN COM_TRAMITES_PRV_OBJ%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_TRAMITES_PRV_OBJ
  ( ID
    ,COMTPR_ID
    ,COMOBJ_ID
    ,OPERACION
    ,OBSERVACION
    ,DATE_CREATED
    ,DATE_MODIFIED
    ,CREATED_BY
    ,MODIFIED_BY)
  values
  ( p_comtpo.ID
    ,p_comtpo.COMTPR_ID
    ,p_comtpo.COMOBJ_ID
    ,p_comtpo.OPERACION
    ,p_comtpo.OBSERVACION
    ,p_comtpo.DATE_CREATED
    ,p_comtpo.DATE_MODIFIED
    ,p_comtpo.CREATED_BY
    ,p_comtpo.MODIFIED_BY);
  --
END;
/* Insertar registro en  COM_TRAMITES_PRV */
PROCEDURE INS_COMTPR
 (P_COMTPR IN COM_TRAMITES_PRV%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_TRAMITES_PRV
  ( ID
    ,SEGORG_ID
    ,FECHA
    ,COMPRV_ID
    ,TIPO
    ,COMPRT_ID
    ,CUIT
    ,NOMBRE
    ,DESCRIPCION_ACTIVIDAD
    ,EMAIL
    ,CONDICION_IB
    ,NUMERO_INSCRIPCION_IB
    ,FECHA_INSCRIPCION_IB
    ,NUMERO_CONVENIO_MULTILATERAL
    ,CBU
    ,SITUACION
    ,MOTIVO_SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY
    )
  values
  ( p_comtpr.ID
    ,p_comtpr.SEGORG_ID
    ,p_comtpr.FECHA
    ,p_comtpr.COMPRV_ID
    ,p_comtpr.TIPO
    ,p_comtpr.COMPRT_ID
    ,p_comtpr.CUIT
    ,p_comtpr.NOMBRE
    ,p_comtpr.DESCRIPCION_ACTIVIDAD
    ,p_comtpr.EMAIL
    ,p_comtpr.CONDICION_IB
    ,p_comtpr.NUMERO_INSCRIPCION_IB
    ,p_comtpr.FECHA_INSCRIPCION_IB
    ,p_comtpr.NUMERO_CONVENIO_MULTILATERAL
    ,p_comtpr.CBU
    ,p_comtpr.SITUACION
    ,p_comtpr.MOTIVO_SITUACION
    ,p_comtpr.DATE_CREATED
    ,p_comtpr.CREATED_BY
    ,p_comtpr.DATE_MODIFIED
    ,p_comtpr.MODIFIED_BY
    );
  --
END;
/* Insertar registro en COM_TRAMITES_PRV_TIPO */
PROCEDURE INS_COMTPT
 (P_COMTPT IN COM_TRAMITES_PRV_TIPO%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_TRAMITES_PRV_TIPO
  ( ID
    ,SEGORG_ID
    ,CODIGO
    ,NOMBRE
    ,DESCRIPCION
    ,AUTOACEPTAR_SN
    ,NOTIFICAR_RECHAZO_SN
    ,SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY)
  values
  ( p_comtpt.ID
   ,p_comtpt.SEGORG_ID
   ,p_comtpt.CODIGO
   ,p_comtpt.NOMBRE
   ,p_comtpt.DESCRIPCION
   ,p_comtpt.AUTOACEPTAR_SN
   ,p_comtpt.NOTIFICAR_RECHAZO_SN
   ,p_comtpt.SITUACION
   ,p_comtpt.DATE_CREATED
   ,p_comtpt.CREATED_BY
   ,p_comtpt.DATE_MODIFIED
   ,p_comtpt.MODIFIED_BY);
  --
END;
/* Insertar registro en COM_TRAMITES_PRV_RES */
PROCEDURE INS_COMTPS
 (P_COMTPS IN COM_TRAMITES_PRV_RES%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_TRAMITES_PRV_RES
  ( ID
    ,COMTPR_ID
    ,COMRES_ID
    ,OPERACION
    ,DATE_CREATED
    ,DATE_MODIFIED
    ,CREATED_BY
    ,MODIFIED_BY)
  values
  ( p_comtps.ID
    ,p_comtps.COMTPR_ID
    ,p_comtps.COMRES_ID
    ,p_comtps.OPERACION
    ,p_comtps.DATE_CREATED
    ,p_comtps.DATE_MODIFIED
    ,p_comtps.CREATED_BY
    ,p_comtps.MODIFIED_BY);
  --
END;
/* Insertar registro en COM_TERRITORIOS */
PROCEDURE INS_COMTRR
 (P_COMTRR IN COM_TERRITORIOS%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_TERRITORIOS
  ( ID
    ,SEGORG_ID
    ,TIPO
    ,CODIGO
    ,NOMBRE
    ,COMTRR_ID_PADRE
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY)
  values
  ( p_comtrr.ID
    ,p_comtrr.SEGORG_ID
    ,p_comtrr.TIPO
    ,p_comtrr.CODIGO
    ,p_comtrr.NOMBRE
    ,p_comtrr.COMTRR_ID_PADRE
    ,p_comtrr.DATE_CREATED
    ,p_comtrr.CREATED_BY
    ,p_comtrr.DATE_MODIFIED
    ,p_comtrr.MODIFIED_BY);
  --
END;
PROCEDURE SET_COMOCE
 (P_ID IN NUMBER
 )
 IS
cursor cr_comoce is
 select *
 from com_ordenes_compras_est
 where id = p_id;
begin
 INI_COMOCE;
 OPEN cr_comoce;
 FETCH cr_comoce INTO v_comoce;
 CLOSE cr_comoce;
 --
end;
/* Seteo de la variable v_comcmo. */
PROCEDURE SET_COMCMO
 (P_ID IN COM_CALIFICACIONES_MOT.ID%TYPE
 )
 IS
CURSOR cr_comcmo IS
  SELECT *
  FROM COM_CALIFICACIONES_MOT COMCMO
  WHERE COMCMO.ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  v_comcmo := NULL;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comcmo;
  FETCH cr_comcmo INTO v_comcmo;
  CLOSE cr_comcmo;
  --
END;
PROCEDURE SET_COMCMO_CLF
 (P_COMCLF_ID IN COM_CALIFICACIONES_MOT.COMCLF_ID%TYPE
 ,P_COMCTM_ID IN COM_CALIFICACIONES_MOT.COMCTM_ID%TYPE
 )
 IS
CURSOR cr_comcmo IS
  SELECT *
  FROM COM_CALIFICACIONES_MOT COMCMO
  WHERE COMCMO.COMCLF_ID = p_comclf_id
    AND COMCMO.COMCTM_ID = p_comctm_id;
  --
BEGIN
  -- Inicializar la variable
  v_comcmo := NULL;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comcmo;
  FETCH cr_comcmo INTO v_comcmo;
  CLOSE cr_comcmo;
  --
END;
/* Seteo de la variable v_comctm. */
PROCEDURE SET_COMCTM
 (P_ID IN COM_CALIFICACIONES_TMO.ID%TYPE
 )
 IS
CURSOR cr_comctm IS
  SELECT *
  FROM COM_CALIFICACIONES_TMO COMCTM
  WHERE COMCTM.ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  v_comctm := NULL;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comctm;
  FETCH cr_comctm INTO v_comctm;
  CLOSE cr_comctm;
  --
END;
PROCEDURE SET_COMCTM_CODIGO
 (P_SEGORG_ID IN COM_CALIFICACIONES_TMO.SEGORG_ID%TYPE
 ,P_CODIGO IN COM_CALIFICACIONES_TMO.CODIGO%TYPE
 )
 IS
CURSOR cr_comctm IS
  SELECT *
  FROM COM_CALIFICACIONES_TMO COMCTM
  WHERE COMCTM.SEGORG_ID = p_segorg_id
    AND COMCTM.CODIGO    = p_codigo;
  --
BEGIN
  -- Inicializar la variable
  v_comctm := NULL;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comctm;
  FETCH cr_comctm INTO v_comctm;
  CLOSE cr_comctm;
  --
END;
PROCEDURE SET_COMCTM_NOMBRE
 (P_SEGORG_ID IN COM_CALIFICACIONES_TMO.SEGORG_ID%TYPE
 ,P_CALIFICACION IN COM_CALIFICACIONES_TMO.CALIFICACION%TYPE
 ,P_NOMBRE IN COM_CALIFICACIONES_TMO.NOMBRE%TYPE
 )
 IS
CURSOR cr_comctm IS
  SELECT *
  FROM COM_CALIFICACIONES_TMO COMCTM
  WHERE COMCTM.SEGORG_ID    = p_segorg_id
    AND COMCTM.CALIFICACION = p_calificacion
    AND COMCTM.NOMBRE       = p_nombre;
  --
BEGIN
  -- Inicializar la variable
  v_comctm := NULL;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comctm;
  FETCH cr_comctm INTO v_comctm;
  CLOSE cr_comctm;
  --
END;
/* Seteo la variable v_comrrp */
PROCEDURE SET_COMRRP
 (P_ID IN COM_REPUTACION_RUBPRV.ID%TYPE
 )
 IS
CURSOR cr_comrrp IS
  SELECT *
  FROM COM_REPUTACION_RUBPRV COMRRP
  WHERE COMRRP.ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  INI_COMRRP;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comrrp;
  FETCH cr_comrrp INTO v_comrrp;
  CLOSE cr_comrrp;
  --
END;
/* Seteo la variable v_comrer */
PROCEDURE SET_COMRER
 (P_ID IN COM_REPUTACION_RUB.ID%TYPE
 )
 IS
CURSOR cr_comrer IS
  SELECT *
  FROM COM_REPUTACION_RUB COMRER
  WHERE COMRER.ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  INI_COMRER;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comrer;
  FETCH cr_comrer INTO v_comrer;
  CLOSE cr_comrer;
  --
END;
/* Seteo de la variable v_comclf */
PROCEDURE SET_COMCLF
 (P_ID IN COM_CALIFICACIONES.ID%TYPE
 )
 IS
CURSOR cr_comclf IS
  SELECT *
  FROM COM_CALIFICACIONES COMCLF
  WHERE COMCLF.ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  v_comclf := NULL;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comclf;
  FETCH cr_comclf INTO v_comclf;
  CLOSE cr_comclf;
  --
END;
/* Seteo la variable v_comeco */
PROCEDURE SET_COMECO_CODIGO
 (P_CODIGO IN VARCHAR2
 )
 IS
CURSOR cr_comeco IS
 SELECT *
 FROM COM_CONTRATANTES
 WHERE CODIGO = p_codigo;
 --
BEGIN
  -- Inicializar la variable
  INI_COMECO;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comeco;
  FETCH cr_comeco INTO v_comeco;
  CLOSE cr_comeco;
  --
END;
PROCEDURE SET_COMOCM
 (P_ID IN NUMBER
 )
 IS
CURSOR cr_comocm IS
  SELECT COMOCM.*
  FROM COM_ORDENES_COMPRAS COMOCM
  WHERE COMOCM.ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  INI_COMOCM;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comocm;
  FETCH cr_comocm INTO v_comocm;
  CLOSE cr_comocm;
  --
END;
PROCEDURE SET_COMOCM_CODIGO
 (P_SEGORG_ID IN NUMBER
 ,P_CODIGO IN VARCHAR2
 ,P_EJERCICIO IN NUMBER
 )
 IS
CURSOR cr_comocm IS
  SELECT COMOCM.*
  FROM COM_ORDENES_COMPRAS COMOCM
     , COM_PEDIDOS COMPED
  WHERE COMOCM.SEGORG_ID = p_segorg_id
    and COMPED.EJERCICIO = p_ejercicio
    and COMOCM.CODIGO    = p_codigo
    and COMOCM.COMPED_ID = COMPED.ID;
  --
BEGIN
  -- Inicializar la variable
  INI_COMOCM;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comocm;
  FETCH cr_comocm INTO v_comocm;
  CLOSE cr_comocm;
  --
END;
PROCEDURE SET_COMCOE
 (P_ID IN NUMBER
 )
 IS
cursor cr_comcoe is
 select *
 from com_contrataciones_est
 where id = p_id;
begin
 INI_COMCOE;
 OPEN cr_comcoe;
 FETCH cr_comcoe INTO v_comcoe;
 CLOSE cr_comcoe;
 --
end;
/* Seteo la variable v_comcon */
PROCEDURE SET_COMCON_CODIGO
 (P_SEGORG_ID IN NUMBER
 ,P_EJERCICIO IN NUMBER
 ,P_CODIGO IN VARCHAR2
 )
 IS
CURSOR cr_comcon IS
  SELECT COMCON.*
  FROM COM_CONTRATACIONES COMCON
     , COM_CONTRATACIONES_EST COMCOE
     , COM_CONTRATACIONES_DETALLES COMDET
     , COM_PEDIDOS COMPED
  WHERE COMCON.ID        = COMDET.COMCON_ID(+)
    and COMDET.COMPED_ID = COMPED.ID(+)
    and COMCON.ID        = COMCOE.COMCON_ID
    and COMCOE.ID        = COM_PKG.OBTN_COMCOE_ID(COMCON.ID)
    and COMCON.SEGORG_ID = p_segorg_id
    and COMPED.EJERCICIO = p_ejercicio
    and COMCON.CODIGO    = p_codigo
    and COMCOE.ESTADO    <> 'NUE';
  --
BEGIN
  -- Inicializar la variable
  INI_COMCON;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comcon;
  FETCH cr_comcon INTO v_comcon;
  CLOSE cr_comcon;
  --
END;
/* Seteo la variable v_comped */
PROCEDURE SET_COMPED_CODIGO
 (P_SEGORG_ID IN NUMBER
 ,P_EJERCICIO IN NUMBER
 ,P_CODIGO IN VARCHAR2
 )
 IS
CURSOR cr_comped IS
  SELECT COMPED.*
  FROM COM_PEDIDOS COMPED
     , COM_PEDIDOS_EST COMPEE
  WHERE COMPED.SEGORG_ID = p_segorg_id
    and COMPED.EJERCICIO = p_ejercicio
    and COMPED.CODIGO    = p_codigo
    and COMPED.ID        = COMPEE.COMPED_ID
    and COMPEE.ID        = COM_PKG.OBTN_COMPEE_ID(COMPED.ID)
    and COMPEE.ESTADO    <> 'NUE';
  --
BEGIN
  -- Inicializar la variable
  INI_COMPED;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comped;
  FETCH cr_comped INTO v_comped;
  CLOSE cr_comped;
  --
END;
/* Seteo la variable v_comped */
PROCEDURE SET_COMPED
 (P_ID IN NUMBER
 )
 IS
CURSOR cr_comped IS
  SELECT *
  FROM COM_PEDIDOS COMPED
  WHERE COMPED.ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  INI_COMPED;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comped;
  FETCH cr_comped INTO v_comped;
  CLOSE cr_comped;
  --
END;
/* Seteo la variable v_compee */
PROCEDURE SET_COMPEE
 (P_ID IN NUMBER
 )
 IS
CURSOR cr_compee IS
  SELECT *
  FROM COM_PEDIDOS_EST COMPEE
  WHERE COMPEE.ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  INI_COMPEE;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_compee;
  FETCH cr_compee INTO v_compee;
  CLOSE cr_compee;
  --
END;
/* Seteo la variable v_comres */
PROCEDURE SET_COMEJE_EJERCICIO
 (P_SEGORG_ID IN NUMBER
 ,P_EJERCICIO IN NUMBER
 )
 IS
CURSOR cr_comeje IS
  SELECT *
  FROM COM_EJERCICIOS COMEJE
  WHERE COMEJE.SEGORG_ID = p_segorg_id
    AND COMEJE.EJERCICIO = p_ejercicio;
  --
BEGIN
  -- Inicializar la variable
  INI_COMEJE;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comeje;
  FETCH cr_comeje INTO v_comeje;
  CLOSE cr_comeje;
  --
END;
/* Seteo la variable v_comprv */
PROCEDURE SET_COMPRV
 (P_ID IN COM_PROVEEDORES.ID%TYPE
 )
 IS
CURSOR cr_comprv IS
  SELECT *
  FROM COM_PROVEEDORES COMPRV
  WHERE ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  INI_COMPRV;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comprv;
  FETCH cr_comprv INTO v_comprv;
  CLOSE cr_comprv;
  --
END;
PROCEDURE SET_COMCPA_CODIGO
 (P_SEGORG_ID IN NUMBER
 ,P_CODIGO IN COM_CATALOGO_PRECIOSACTL.CODIGO%TYPE
 ,P_NRO_LINEA IN COM_CATALOGO_PRECIOSACTL.NRO_LINEA%TYPE
 )
 IS
CURSOR cr_comcpa IS
  SELECT *
  FROM COM_CATALOGO_PRECIOSACTL COMCPA
  WHERE COMCPA.SEGORG_ID = p_segorg_id
    AND COMCPA.CODIGO = p_codigo
    AND COMCPA.NRO_LINEA = p_nro_linea;
  --
BEGIN
  -- Inicializar la variable
  v_comcpa := NULL;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comcpa;
  FETCH cr_comcpa INTO v_comcpa;
  CLOSE cr_comcpa;
  --
END;
/* Seteo de la variable v_comcnr */
PROCEDURE SET_COMCCR
 (P_ID IN COM_CONTRATANTES_CATRES.ID%TYPE
 )
 IS
CURSOR cr_comccr IS
  SELECT *
  FROM COM_CONTRATANTES_CATRES COMCCR
  WHERE COMCCR.ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  v_comccr := NULL;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comccr;
  FETCH cr_comccr INTO v_comccr;
  CLOSE cr_comccr;
  --
END;
PROCEDURE SET_COMCON
 (P_COMCON_ID IN NUMBER
 )
 IS
cursor cr_comcon is
 select *
 from com_contrataciones
 where id = p_comcon_id;
begin
 INI_COMCON;
 OPEN cr_comcon;
 FETCH cr_comcon INTO v_comcon;
 CLOSE cr_comcon;
 --
end;
/* Seteo de la variable v_comctp */
PROCEDURE SET_COMCTP
 (P_ID IN NUMBER
 )
 IS
CURSOR cr_comctp IS
  SELECT *
  FROM COM_CATALOGO_PRECIOS COMCTP
  WHERE COMCTP.ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  v_comctp := NULL;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comctp;
  FETCH cr_comctp INTO v_comctp;
  CLOSE cr_comctp;
  --
END;
/* Seteo de la variable v_comcnr */
PROCEDURE SET_COMCCR_RESP
 (P_COMRES_ID IN NUMBER
 ,P_COMECC_ID IN NUMBER
 ,P_SEGUSU_ID IN NUMBER
 )
 IS
CURSOR cr_comccr IS
  SELECT *
  FROM COM_CONTRATANTES_CATRES COMCCR
  WHERE COMCCR.COMRES_ID = p_comres_id
    AND COMCCR.COMECC_ID = p_comecc_id
    AND COMCCR.SEGUSU_ID = p_segusu_id
    AND COMCCR.SITUACION = 'ACT';
  --
BEGIN
  -- Inicializar la variable
  v_comccr := NULL;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comccr;
  FETCH cr_comccr INTO v_comccr;
  CLOSE cr_comccr;
  --
END;
/* Seteo de la variable v_comcnr */
PROCEDURE SET_COMCNR
 (P_ID IN COM_CONTRATANTES_RES.ID%TYPE
 )
 IS
CURSOR cr_comcnr IS
  SELECT *
  FROM COM_CONTRATANTES_RES COMCNR
  WHERE COMCNR.ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  v_comcnr := NULL;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comcnr;
  FETCH cr_comcnr INTO v_comcnr;
  CLOSE cr_comcnr;
  --
END;
/* Seteo de la variable v_comcnr */
PROCEDURE SET_COMCNR_RESP
 (P_COMRES_ID IN NUMBER
 ,P_COMECO_ID IN COM_CONTRATANTES.ID%TYPE
 ,P_SEGUSU_ID IN NUMBER
 )
 IS
CURSOR cr_comcnr IS
  SELECT *
  FROM COM_CONTRATANTES_RES COMCNR
  WHERE COMCNR.COMRES_ID = p_comres_id
    AND COMCNR.COMECO_ID = p_comeco_id
    AND COMCNR.SEGUSU_ID = p_segusu_id
    AND COMCNR.SITUACION = 'ACT';
  --
BEGIN
  -- Inicializar la variable
  v_comcnr := NULL;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comcnr;
  FETCH cr_comcnr INTO v_comcnr;
  CLOSE cr_comcnr;
  --
END;
/* Seteo la variable v_comtco */
PROCEDURE SET_COMTCO
 (P_ID IN COM_TRAMITES_CON.ID%TYPE
 )
 IS
--
  CURSOR cr_comtco is
  SELECT *
  FROM COM_TRAMITES_CON
  WHERE ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  INI_COMTCO;
  -- Cargar la variable con los datos de la consulta
  OPEN  cr_comtco;
  FETCH cr_comtco INTO v_comtco;
  CLOSE cr_comtco;
  --
END;
PROCEDURE SET_COMRST_CODIGO
 (P_CODIGO IN VARCHAR2
 ,P_SEGORG_ID IN NUMBER
 )
 IS
CURSOR cr_comrst IS
  SELECT *
  FROM COM_RESPONSABLES_TIPOS COMRST
  WHERE COMRST.SEGORG_ID = p_segorg_id
    AND COMRST.CODIGO    = p_codigo;
  --
BEGIN
  -- Inicializar la variable
  v_comrst := NULL;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comrst;
  FETCH cr_comrst INTO v_comrst;
  CLOSE cr_comrst;
  --
END;
/* Setea la variable v_comfer por fecha. */
PROCEDURE SET_COMFER_FECHA
 (P_FECHA IN COM_FERIADOS.FECHA%TYPE
 )
 IS
-- Declaración de Cursores
  CURSOR cr_comfer IS
  SELECT *
  FROM COM_FERIADOS COMFER
  WHERE TO_CHAR(COMFER.FECHA, 'DD/MM/YYYY') = TO_CHAR(p_fecha, 'DD/MM/YYYY');
  --
BEGIN
  -- Inicializar la variable
  INI_COMFER;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comfer;
  FETCH cr_comfer INTO v_comfer;
  CLOSE cr_comfer;
  --
END;
PROCEDURE SET_COMETQ_CODIGO
 (P_CODIGO IN VARCHAR2
 ,P_SEGORG_ID IN NUMBER
 )
 IS
CURSOR cr_cometq IS
  SELECT *
  FROM COM_ETIQUETAS COMETQ
  WHERE COMETQ.SEGORG_ID = p_segorg_id
    AND COMETQ.CODIGO    = p_codigo;
  --
BEGIN
  -- Inicializar la variable
  v_cometq := NULL;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_cometq;
  FETCH cr_cometq INTO v_cometq;
  CLOSE cr_cometq;
  --
END;
/* Seteo la variable v_comprt */
PROCEDURE SET_COMPRT
 (P_ID IN COM_PROVEEDORES_TIPOS.ID%TYPE
 )
 IS
CURSOR cr_comprt IS
  SELECT *
  FROM COM_PROVEEDORES_TIPOS COMPRT
  WHERE ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  INI_COMPRT;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comprt;
  FETCH cr_comprt INTO v_comprt;
  CLOSE cr_comprt;
  --
END;
/* Seteo la variable v_comres */
PROCEDURE SET_COMRES
 (P_ID IN COM_RESPONSABLES.ID%TYPE
 )
 IS
CURSOR cr_comres IS
  SELECT *
  FROM COM_RESPONSABLES COMRES
  WHERE COMRES.ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  INI_COMRES;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comres;
  FETCH cr_comres INTO v_comres;
  CLOSE cr_comres;
  --
END;
/* Seteo la variable v_comres */
PROCEDURE SET_COMRES_DOC
 (P_COMRST_ID IN COM_RESPONSABLES.COMRST_ID%TYPE
 ,P_NUMERO_DOCUMENTO IN COM_RESPONSABLES.NUMERO_DOCUMENTO%TYPE
 ,P_TIPO_DOCUMENTO IN COM_RESPONSABLES.TIPO_DOCUMENTO%TYPE
 )
 IS
CURSOR cr_comres IS
  SELECT *
  FROM COM_RESPONSABLES COMRES
  WHERE COMRES.COMRST_ID        = p_comrst_id
    AND COMRES.TIPO_DOCUMENTO   = p_tipo_documento
    AND COMRES.NUMERO_DOCUMENTO = p_numero_documento;
  --
BEGIN
  -- Inicializar la variable
  v_comres := NULL;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comres;
  FETCH cr_comres INTO v_comres;
  CLOSE cr_comres;
  --
END;
/* Seteo la variable v_comrpr */
PROCEDURE SET_COMTPR
 (P_ID IN COM_TRAMITES_PRV.ID%TYPE
 )
 IS
--
  CURSOR cr_comtpr is
  SELECT *
  FROM COM_TRAMITES_PRV
  WHERE ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  INI_COMTPR;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comtpr;
  FETCH cr_comtpr INTO v_comtpr;
  CLOSE cr_comtpr;
  --
END;
/* Obtener el documento pdf en binario. */
FUNCTION OBTN_COMADJ_DOC_PDF
 (P_SEGORG_ID IN NUMBER
 ,P_COMCON_ID IN NUMBER
 )
 RETURN NUMBER
 IS
--
   v_comcon          com_contrataciones%ROWTYPE;
   v_comped          COM_PEDIDOS%ROWTYPE;
   v_comcot          com_contrataciones_detalles%rowtype;
   v_comctt          com_contrataciones_tipos%ROWTYPE;
   v_string          varchar2(4000);
   v_reportURL       VARCHAR2(1000);
   v_blobRef         BLOB;
   v_request         Utl_Http.req;
   v_response        Utl_Http.resp;
   v_data            RAW(32767);
   v_dominio         VARCHAR2(300);
   str_return        VARCHAR2(32767);
   v_comdct_id       number;
   v_comdoc_id       number;
   v_nombre_archivo  varchar2(300);
   v_segorg_codigo   varchar2(100);
   v_comped_id       number;
   --
   cursor cr_segorg is
   select codigo from seg_organizaciones
   where id = p_segorg_id;
   --
   cursor cr_comdct is
   select id from com_documentos_tipos
   where segorg_id = p_segorg_id
   and codigo = 'COM_PRE_ADJUDICACION';
   --
   cursor cr_comcon is
   select * from com_contrataciones
   where id = p_comcon_id;
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
   CURSOR cr_comcot IS
   SELECT *
   FROM COM_CONTRATACIONES_DETALLES
   WHERE COMCON_ID = p_comcon_id;
   --
BEGIN
   --
   -- Validar Organización
   --
   if p_segorg_id is null then
      raise_application_error(-20000,'No se ha especificado el id de Organizacion',true);
   end if;
   -- Validar que existe el pedido
   --
   if p_comcon_id is null then
      raise_application_error(-20000,'El Proceso es un dato obligatorio y no ha sido especificado',true);
   end if;

   --
   -- Obtener el datos del proceso
   --
   OPEN cr_comcon;
   FETCH cr_comcon INTO v_comcon;
   CLOSE cr_comcon;
   --
   -- Validar que existe el proceso
   --
   if v_comcon.id is null then
      raise_application_error(-20000,'El proceso especificado No Existe',true);
   end if;

   --
   -- Obtener el código de organización
   --
   OPEN cr_segorg;
   FETCH cr_segorg INTO v_segorg_codigo;
   CLOSE cr_segorg;

   --
   -- Obtener el tipo de documento
   --
   OPEN cr_comdct;
   FETCH cr_comdct INTO v_comdct_id;
   CLOSE cr_comdct;

   --
   -- Validar Tipo de Documento
   --
   if v_comdct_id is null then
      raise_application_error(-20000,'El tipo de Documento Especificado No existe',true);
   end if;
   --
   OPEN cr_comctt(v_comcon.comctt_id);
   FETCH cr_comctt INTO v_comctt;
   CLOSE cr_comctt;
   --
   if v_comctt.id is null then
      raise_application_error(-20000,'No se ha podido determinar el tipo de Contratación',true);
   end if;
   --
   -- Obtener los datos del Detalle de Contratacion
   --
   OPEN cr_comcot;
   FETCH cr_comcot INTO v_comcot;
   CLOSE cr_comcot;
   --
   -- Validar que existe el detalle
   --
   if v_comcot.id is null then
      raise_application_error(-20000,'No se han encontrado datos del detalle de Contratación',true);
   end if;
   --
   -- Obtener los datos del pedido
   --
   v_comped_id := v_comcot.comped_id;
   OPEN cr_comped(v_comped_id);
   FETCH cr_comped INTO v_comped;
   CLOSE cr_comped;
   --
   -- Validar que existe el pedido
   --
   if v_comped.id is null then
      raise_application_error(-20000,'La solicitud de Gasto especificada No Existe',true);
   end if;
   --
   -- Recogemos la referencia del BLOB
   --
   v_nombre_archivo := 'INFORME DE PRE-ADJUDICACION POR PROVEEDOR' ||' - PROCESO N°: ' || v_comcon.codigo || '/' ||  v_comped.ejercicio || ' - ' || v_comctt.NOMBRE;
   --
   SELECT COMDOC_ID.NEXTVAL INTO v_comdoc_id FROM DUAL;
   --
   INSERT INTO com_documentos (ID, COMDCT_ID, DOCUMENTO, NOMBRE_ARCHIVO, TIPO_ARCHIVO)
   VALUES (v_comdoc_id, v_comdct_id, Empty_Blob(), v_nombre_archivo , 'application/pdf')
   RETURNING DOCUMENTO INTO v_blobRef;

   --
   -- Recogemos el fichero PDF del APEX simulando una
   -- llamada al informe desde el navegador
   --
   begin
      --
      v_dominio := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo    => 'DOMINIO_SERVIDOR_REPORTES'
                                            ,p_segorg_id => p_segorg_id);
      --
      -- Construimos la URL para llamar al report
      --
      --http://des02a:7700/pls/apex_desa/f?p=INFCOM:1069:1546407613635965::NO:1069:                         P1069_SEGORG_ID,P1_SEGORG_CODIGO,P1069_COMCON_ID,P1069_TITULO_REPORTE,P1069_FILTRO:2,PCYCSL,541,INFORME%20DE%20PRE-ADJUDICACION%20POR%20PROVEEDOR,%22PEN%22
      v_reportURL := 'http://' || trim(v_dominio) || '/f?p=INFCOM:' || '1069' || ':' || v('APP_SESSION')  || '::NO:1069:P1069_SEGORG_ID,P1_SEGORG_CODIGO,P1069_COMCON_ID,P1069_TITULO_REPORTE,P1069_FILTRO:' || p_segorg_id || ',' || v_segorg_codigo || ',' || p_comcon_id|| ',' || 'INFORME%20DE%20PRE-ADJUDICACION%20POR%20PROVEEDOR,%22PEN%22';
      dbms_output.put_line('v_reportURL=' || v_reportURL);
      -- Invocamos el reporte
      v_request  := Utl_Http.begin_request(v_reportUrl, 'GET');

      -- Obtenemos la respuesta
      v_response := Utl_Http.get_response(v_request);
      --
   exception
     when sys.utl_http.request_failed then
       return sys.utl_http.GET_DETAILED_SQLERRM;
   end;
   LOOP
      BEGIN
         --
         -- leemos la siguiente porcion de datos binarios
         --
         begin
            Utl_Http.read_raw(v_response, v_data, 32767);
         exception
            when sys.utl_http.request_failed then
               return sys.utl_http.GET_DETAILED_SQLERRM;
         end;
         v_string := v_string || TO_CHAR(UTL_RAW.length(v_data)) ;
         --
         -- y la añadimos a nuestro BLOB para el fichero PDF
         --
         Dbms_Lob.writeAppend ( lob_loc => v_blobRef
                              , amount  => Utl_Raw.length(v_data)
                              , buffer  => v_data
                              );
      EXCEPTION WHEN Utl_Http.END_OF_BODY THEN
         EXIT;
      END;
   END LOOP;

   Utl_Http.end_response(v_response);
   --
   return v_comdoc_id;
   --
exception when others then
   raise_application_error(-20000,'Error al obtener Documento : ' || sqlerrm, true);
end;
/* Obtener el documento pdf en binario. */
FUNCTION OBTN_COMANU_DOC_PDF
 (P_SEGORG_ID IN NUMBER
 ,P_COMCON_ID IN NUMBER
 )
 RETURN NUMBER
 IS
--
   v_comcon          com_contrataciones%ROWTYPE;
   v_comped          COM_PEDIDOS%ROWTYPE;
   v_comcot          com_contrataciones_detalles%rowtype;
   v_comctt          com_contrataciones_tipos%ROWTYPE;
   v_string          varchar2(4000);
   v_reportURL       VARCHAR2(255);
   v_blobRef         BLOB;
   v_request         Utl_Http.req;
   v_response        Utl_Http.resp;
   v_data            RAW(32767);
   v_dominio         VARCHAR2(300);
   str_return        VARCHAR2(32767);
   v_comdct_id       number;
   v_comdoc_id       number;
   v_nombre_archivo  varchar2(300);
   v_segorg_codigo   varchar2(100);
   v_comped_id       number;
   --
   cursor cr_segorg is
   select codigo from seg_organizaciones
   where id = p_segorg_id;
   --
   cursor cr_comdct is
   select id from com_documentos_tipos
   where segorg_id = p_segorg_id
   and codigo = 'COM_CONTRATACION_ANULADA';
   --
   cursor cr_comcon is
   select * from com_contrataciones
   where id = p_comcon_id;
   --
   CURSOR cr_comped (p_comped_id number) IS
   SELECT *
   FROM COM_PEDIDOS
   WHERE ID = p_comped_id;
   --
   CURSOR cr_comcot IS
   SELECT *
   FROM COM_CONTRATACIONES_DETALLES
   WHERE COMCON_ID = p_comcon_id;
   --
   cursor cr_comctt (p_comctt_id number) is
   select * from com_contrataciones_tipos
   where id = p_comctt_id;
   --
BEGIN
   --
   -- Validar Organización
   --
   if p_segorg_id is null then
      raise_application_error(-20000,'No se ha especificado el id de Organizacion',true);
   end if;
   -- Validar que existe el pedido
   --
   if p_comcon_id is null then
      raise_application_error(-20000,'El Proceso es un dato obligatorio y no ha sido especificado',true);
   end if;

   --
   -- Obtener el datos del proceso
   --
   OPEN cr_comcon;
   FETCH cr_comcon INTO v_comcon;
   CLOSE cr_comcon;
   --
   -- Validar que existe el proceso
   --
   if v_comcon.id is null then
      raise_application_error(-20000,'El proceso especificado No Existe',true);
   end if;
   --
   OPEN cr_comctt(v_comcon.comctt_id);
   FETCH cr_comctt INTO v_comctt;
   CLOSE cr_comctt;
   --
   if v_comctt.id is null then
      raise_application_error(-20000,'No se ha podido determinar el tipo de Contratación',true);
   end if;
   --
   -- Obtener el código de organización
   --
   OPEN cr_segorg;
   FETCH cr_segorg INTO v_segorg_codigo;
   CLOSE cr_segorg;

   --
   -- Obtener el tipo de documento
   --
   OPEN cr_comdct;
   FETCH cr_comdct INTO v_comdct_id;
   CLOSE cr_comdct;

   --
   -- Validar Tipo de Documento
   --
   if v_comdct_id is null then
      raise_application_error(-20000,'El tipo de Documento COM_CONTRATACION_ANULADA No existe ',true);
   end if;
   --
   -- Obtener los datos del Detalle de Contratacion
   --
   OPEN cr_comcot;
   FETCH cr_comcot INTO v_comcot;
   CLOSE cr_comcot;
   --
   -- Validar que existe el detalle
   --
   if v_comcot.id is null then
      raise_application_error(-20000,'No se han encontrado datos del detalle de Contratación',true);
   end if;
   --
   -- Obtener los datos del pedido
   --
   v_comped_id := v_comcot.comped_id;
   OPEN cr_comped(v_comped_id);
   FETCH cr_comped INTO v_comped;
   CLOSE cr_comped;
   --
   -- Validar que existe el pedido
   --
   if v_comped.id is null then
      raise_application_error(-20000,'La solicitud de Gasto especificada No Existe',true);
   end if;
   --
   -- Recogemos la referencia del BLOB
   --
   v_nombre_archivo := 'PROCESO DE CONTRATACION - ' || v_comctt.NOMBRE ||' N°: ' || v_comcon.codigo || '/' ||  v_comped.ejercicio || ' ANULADO';
   --
   SELECT COMDOC_ID.NEXTVAL INTO v_comdoc_id FROM DUAL;
   --
   INSERT INTO com_documentos (ID, COMDCT_ID, DOCUMENTO, NOMBRE_ARCHIVO, TIPO_ARCHIVO)
   VALUES (v_comdoc_id, v_comdct_id, Empty_Blob(), v_nombre_archivo , 'application/pdf')
   RETURNING DOCUMENTO INTO v_blobRef;

   --
   -- Recogemos el fichero PDF del APEX simulando una
   -- llamada al informe desde el navegador
   --
   begin
      --
      v_dominio := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo    => 'DOMINIO_SERVIDOR_REPORTES'
                                            ,p_segorg_id => p_segorg_id);
      --
      -- Construimos la URL para llamar al report
      --
      v_reportURL := 'http://' || trim(v_dominio) || '/f?p=INFCOM:' || '1072' || ':' || v('APP_SESSION')  || '::NO:1072:P1_SEGORG_CODIGO,P1072_COMCON_ID,P1072_SEGORG_ID,P1072_COMCOE_ID:' || v_segorg_codigo || ',' || p_comcon_id|| ',' || p_segorg_id|| ',' || v_comcon.comcoe_id;
      dbms_output.put_line('v_reportURL=' || v_reportURL);
      -- Invocamos el reporte
      v_request  := Utl_Http.begin_request(v_reportUrl, 'GET');

      -- Obtenemos la respuesta
      v_response := Utl_Http.get_response(v_request);
      --
   exception
     when sys.utl_http.request_failed then
       return sys.utl_http.GET_DETAILED_SQLERRM;
   end;
   LOOP
      BEGIN
         --
         -- leemos la siguiente porcion de datos binarios
         --
         begin
            Utl_Http.read_raw(v_response, v_data, 32767);
         exception
            when sys.utl_http.request_failed then
               return sys.utl_http.GET_DETAILED_SQLERRM;
         end;
         v_string := v_string || TO_CHAR(UTL_RAW.length(v_data)) ;
         --
         -- y la añadimos a nuestro BLOB para el fichero PDF
         --
         Dbms_Lob.writeAppend ( lob_loc => v_blobRef
                              , amount  => Utl_Raw.length(v_data)
                              , buffer  => v_data
                              );
      EXCEPTION WHEN Utl_Http.END_OF_BODY THEN
         EXIT;
      END;
   END LOOP;

   Utl_Http.end_response(v_response);
   --
   return v_comdoc_id;
   --
exception when others then
   raise_application_error(-20000,'Error al obtener Documento : ' || sqlerrm, true);
end;
/* Obtener Precio Sugerido para un Item */
FUNCTION OBTN_COMCIT_PRECIO_SUGERIDO
 (P_COMCIT_ID IN NUMBER
 ,P_FECHA IN DATE := sysdate
 )
 RETURN NUMBER
 IS
-- Obtengo Ultimo precio adjudicado
  CURSOR cr_comczd (p_comcit_id number) IS
  SELECT comczd.precio_unitario_final comczd_precio_unitario
     FROM com_ordenes_compras_det comocd,
          com_ordenes_compras comocm,
          com_pedidos_detalles compet,
          com_cotizaciones_detalles comczd
    WHERE comocd.compet_id = compet.ID
      AND comocd.comczd_id = comczd.ID
      AND comocd.comocm_id = comocm.ID
      AND compet.comcit_id = p_comcit_id
      AND comocm.id = ( SELECT MAX(comocm.id)
                         FROM com_ordenes_compras_det comocd,
                              com_ordenes_compras comocm,
                              com_ordenes_compras_est comoce,
                              com_pedidos_detalles compet,
                              com_cotizaciones_detalles comczd
                        WHERE comocd.compet_id = compet.ID
                          AND comocd.comczd_id = comczd.ID
                          AND comocd.comocm_id = comocm.ID
                          AND comocm.comoce_id = comoce.ID
                          AND comoce.estado IN ('APR','NOC','CON')
                          AND comoce.fecha <= p_fecha
                          AND comoce.fecha > p_fecha-180
                          AND compet.comcit_id = p_comcit_id)
    ;
  --
  v_retorno NUMBER := null;
begin
  -- Obtengo Ultimo precio adjudicado
  OPEN cr_comczd(p_comcit_id => p_comcit_id);
  FETCH cr_comczd INTO v_retorno;
  CLOSE cr_comczd;
  --
  RETURN v_retorno;
  --
EXCEPTION
  WHEN OTHERS THEN
    RETURN NULL;
END;
/* Obtener Precio Testigo para un Item por Zona */
FUNCTION OBTN_COMCIT_PRECIO_TESTIGO
 (P_COMCIT_ID IN NUMBER
 ,P_FECHA IN DATE := sysdate
 )
 RETURN NUMBER
 IS
-- Obtengo Precio testigo
  CURSOR cr_comctp (p_comcit_id number) IS
  SELECT *
  FROM COM_CATALOGO_PRECIOS COMCTP
  WHERE COMCTP.ID = com_pkg.obtn_comctp_id (p_comcit_id => p_comcit_id
                                           ,p_fecha => p_fecha);
  --
  v_comctp cr_comctp%rowtype;
  v_retorno NUMBER := null;
begin
  -- Identificar si se solicita Precio Testigo Global o por Zona
  -- Obtengo el Precio Testigo
  OPEN cr_comctp(p_comcit_id => p_comcit_id);
  FETCH cr_comctp INTO v_comctp;
  CLOSE cr_comctp;
  --
  if v_comctp.ID is not null then
    -- Asigno Precio Testigo
    v_retorno := v_comctp.PRECIO;
    --
  end if;
      --
  RETURN v_retorno;
  --
EXCEPTION
  WHEN OTHERS THEN
    RETURN NULL;
END;
/* Obtener Precio Sugerido para un Item */
FUNCTION OBTN_COMCIT_PRECIO
 (P_COMCIT_ID IN NUMBER
 ,P_FECHA IN DATE := sysdate
 )
 RETURN NUMBER
 IS
v_retorno NUMBER := null;
begin
  -- Obtengo el Precio Testigo
  v_retorno := OBTN_COMCIT_PRECIO_TESTIGO(p_comcit_id => p_comcit_id
                                         ,p_fecha => p_fecha);
  --
  if v_retorno is null then
    -- Obtengo Ultimo precio adjudicado
     v_retorno := OBTN_COMCIT_PRECIO_SUGERIDO(p_comcit_id => p_comcit_id
                                             ,p_fecha => p_fecha);
    --
  end if;
  --
  RETURN v_retorno;
  --
EXCEPTION
  WHEN OTHERS THEN
    RETURN NULL;
END;
FUNCTION OBTN_COMCLF_CLFMOT_2
 (P_COMOCM_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
CURSOR cr_comclf IS
 SELECT ID
       ,GRAL_PKG.OBTN_CFGABR('COM_CALIFICACIONES_TMO.CALIFICACION',COMCLF.CALIFICACION) CALIFICACION_DESC
 FROM  COM_CALIFICACIONES COMCLF
 WHERE COMCLF.COMOCM_ID = p_comocm_id
   AND COMCLF.SITUACION = 'VAL';
--
CURSOR cr_comcmo(p_comclf_id NUMBER) IS
 SELECT comcmo.ID ID
      , comctm.calificacion comctm_calificacion
      , comctm.codigo comctm_codigo
      , comctm.nombre comctm_nombre
      , comctm.descripcion comctm_descripcion
  FROM com_calificaciones_mot comcmo
      ,com_calificaciones_tmo comctm
 WHERE comcmo.comctm_id = comctm.ID
   AND comcmo.valor_sn  = 'SI'
   AND comcmo.comclf_id = p_comclf_id;
 --
 v_comclf cr_comclf%ROWTYPE;
 v_motivos VARCHAR2(1000) := null;
 v_retorno VARCHAR2(1000) := null;
 l_img_loc VARCHAR2(1000) := null;
 --
BEGIN
  --
  OPEN cr_comclf;
  FETCH cr_comclf INTO v_comclf;
  CLOSE cr_comclf;
  --
  IF v_comclf.ID IS NOT NULL THEN
    -- Cargar los Motivos de la Calificación
    v_motivos := 'CALIFICACION : '||v_comclf.CALIFICACION_DESC|| chr(10);
    FOR v_comcmo IN cr_comcmo(v_comclf.ID) LOOP
      v_motivos := v_motivos||v_comcmo.comctm_codigo||' - '||v_comcmo.comctm_nombre||chr(10);
    END LOOP;
    --
  END IF;
  --
  RETURN v_motivos;
  --
END;
/* Obtener el documento pdf en binario de Contratacion No Adjudicada */
FUNCTION OBTN_COMCON_DES_PDF
 (P_SEGORG_ID IN NUMBER
 ,P_COMCON_ID IN NUMBER
 )
 RETURN NUMBER
 IS
--
   v_comcon          com_contrataciones%ROWTYPE;
   v_comctt          com_contrataciones_tipos%ROWTYPE;
   v_comped          COM_PEDIDOS%ROWTYPE;
   v_comcot          com_contrataciones_detalles%rowtype;
   v_string          varchar2(4000);
   v_reportURL       VARCHAR2(255);
   v_blobRef         BLOB;
   v_request         Utl_Http.req;
   v_response        Utl_Http.resp;
   v_data            RAW(32767);
   v_dominio         VARCHAR2(300);
   str_return        VARCHAR2(32767);
   v_comdct_id       number;
   v_comdoc_id       number;
   v_nombre_archivo  varchar2(300);
   v_segorg_codigo   varchar2(100);
   v_comped_id       number;
   --
   cursor cr_segorg is
   select codigo from seg_organizaciones
   where id = p_segorg_id;
   --
   cursor cr_comdct is
   select id from com_documentos_tipos
   where segorg_id = p_segorg_id
   and codigo = 'COM_CONTRATACION_DES';
   --
   cursor cr_comcon is
   select * from com_contrataciones
   where id = p_comcon_id;
   --
   CURSOR cr_comcot IS
   SELECT *
   FROM COM_CONTRATACIONES_DETALLES
   WHERE COMCON_ID = p_comcon_id;
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
BEGIN
   --
   -- Validar Organización
   --
   if p_segorg_id is null then
      raise_application_error(-20000,'No se ha especificado el id de Organizacion',true);
   end if;
   -- Validar que existe el proceso
   --
   if p_comcon_id is null then
      raise_application_error(-20000,'El Proceso es un dato obligatorio y no ha sido especificada',true);
   end if;

   --
   -- Obtener el datos del proceso
   --
   OPEN cr_comcon;
   FETCH cr_comcon INTO v_comcon;
   CLOSE cr_comcon;
   --
   -- Validar que existe el proceso
   --
   if v_comcon.id is null then
      raise_application_error(-20000,'El Proceso de Contratacion especificado No Existe',true);
   end if;
   --
   OPEN cr_comctt(v_comcon.comctt_id);
   FETCH cr_comctt INTO v_comctt;
   CLOSE cr_comctt;
   --
   if v_comctt.id is null then
      raise_application_error(-20000,'No se ha podido determinar el tipo de Contratación',true);
   end if;
   --
   -- Obtener los datos del Detalle de Contratacion
   --
   OPEN cr_comcot;
   FETCH cr_comcot INTO v_comcot;
   CLOSE cr_comcot;
   --
   -- Validar que existe el detalle
   --
   if v_comcot.id is null then
      raise_application_error(-20000,'No se han encontrado datos del detalle de Contratación',true);
   end if;
   --
   -- Obtener los datos del pedido
   --
   v_comped_id := v_comcot.comped_id;
   OPEN cr_comped(v_comped_id);
   FETCH cr_comped INTO v_comped;
   CLOSE cr_comped;
   --
   -- Validar que existe el pedido
   --
   if v_comped.id is null then
      raise_application_error(-20000,'La solicitud de Gasto especificada No Existe',true);
   end if;
   --
   -- Obtener el código de organización
   --
   OPEN cr_segorg;
   FETCH cr_segorg INTO v_segorg_codigo;
   CLOSE cr_segorg;

   --
   -- Obtener el tipo de documento
   --
   OPEN cr_comdct;
   FETCH cr_comdct INTO v_comdct_id;
   CLOSE cr_comdct;

   --
   -- Validar Tipo de Documento
   --
   if v_comdct_id is null then
      raise_application_error(-20000,'El tipo de Documento Especificado No existe',true);
   end if;

   --
   -- Recogemos la referencia del BLOB
   --
   v_nombre_archivo := 'PROCESO DE CONTRATACION - ' || v_comctt.NOMBRE || ' N°: ' || v_comcon.codigo || '/' ||  v_comped.ejercicio || ' DECLARADO DESIERTO';
   --
   SELECT COMDOC_ID.NEXTVAL INTO v_comdoc_id FROM DUAL;
   --
   INSERT INTO com_documentos (ID, COMDCT_ID, DOCUMENTO, NOMBRE_ARCHIVO, TIPO_ARCHIVO)
   VALUES (v_comdoc_id, v_comdct_id, Empty_Blob(), v_nombre_archivo , 'application/pdf')
   RETURNING DOCUMENTO INTO v_blobRef;

   --
   -- Recogemos el fichero PDF del APEX simulando una
   -- llamada al informe desde el navegador
   --
   begin
      --
      v_dominio := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo    => 'DOMINIO_SERVIDOR_REPORTES'
                                            ,p_segorg_id => p_segorg_id);
      --
      -- Construimos la URL para llamar al report
      --
      v_reportURL := 'http://' || trim(v_dominio) || '/f?p=INFCOM:' || '1065' || ':' || v('APP_SESSION')  || '::NO:1065:P1_SEGORG_CODIGO,P1065_COMCON_ID,P1065_SEGORG_ID,P1065_COMCOE_ID:' || v_segorg_codigo || ',' || p_comcon_id || ',' || p_segorg_id || ',' || v_comcon.comcoe_id ;
      dbms_output.put_line(v_reportURL);

      -- Invocamos el reporte
      v_request  := Utl_Http.begin_request(v_reportURL, 'GET');

      -- Obtenemos la respuesta
      v_response := Utl_Http.get_response(v_request);
      --
   exception
     when sys.utl_http.request_failed then
       return sys.utl_http.GET_DETAILED_SQLERRM;
   end;
   LOOP
      BEGIN
         --
         -- leemos la siguiente porcion de datos binarios
         --
         begin
            Utl_Http.read_raw(v_response, v_data, 32767);
         exception
            when sys.utl_http.request_failed then
               return sys.utl_http.GET_DETAILED_SQLERRM;
         end;
         v_string := v_string || TO_CHAR(UTL_RAW.length(v_data)) ;
         --
         -- y la añadimos a nuestro BLOB para el fichero PDF
         --
         Dbms_Lob.writeAppend ( lob_loc => v_blobRef
                              , amount  => Utl_Raw.length(v_data)
                              , buffer  => v_data
                              );
      EXCEPTION WHEN Utl_Http.END_OF_BODY THEN
         EXIT;
      END;
   END LOOP;

   Utl_Http.end_response(v_response);
   --
   return v_comdoc_id;
   --
exception when others then
   raise_application_error(-20000,'Error al obtener Documento : ' || sqlerrm, true);
end;
/* Obtener el documento pdf en binario. */
FUNCTION OBTN_COMCTZ_DOC_PDF
 (P_SEGORG_ID IN NUMBER
 ,P_COMCTZ_ID IN NUMBER
 )
 RETURN NUMBER
 IS
--
   v_comctz          com_cotizaciones%ROWTYPE;
   v_comprv          com_proveedores%ROWTYPE;
   v_comcon          com_contrataciones%ROWTYPE;
   v_string          varchar2(4000);
   v_reportURL       VARCHAR2(255);
   v_blobRef         BLOB;
   v_request         Utl_Http.req;
   v_response        Utl_Http.resp;
   v_data            RAW(32767);
   v_dominio         VARCHAR2(300);
   str_return        VARCHAR2(32767);
   v_comdct_id       number;
   v_comdoc_id       number;
   v_nombre_archivo  varchar2(300);
   v_segorg_codigo   varchar2(100);
   --
   cursor cr_segorg is
   select codigo from seg_organizaciones
   where id = p_segorg_id;
   --
   cursor cr_comdct is
   select id from com_documentos_tipos
   where segorg_id = p_segorg_id
   and codigo = 'COM_COTIZACION';
   --
   cursor cr_comctz is
   select * from com_cotizaciones
   where id = p_comctz_id;
   --
   cursor cr_comprv (p_comprv_id number) is
   select * from com_proveedores
   where id = p_comprv_id;
   --
BEGIN
   --
   -- Validar Organización
   --
   if p_segorg_id is null then
      raise_application_error(-20000,'No se ha especificado el id de Organizacion',true);
   end if;
   -- Validar que existe el pedido
   --
   if p_comctz_id is null then
      raise_application_error(-20000,'La cotizacion es un dato obligatorio y no ha sido especificada',true);
   end if;

   --
   -- Obtener el datos de la cotizacion
   --
   OPEN cr_comctz;
   FETCH cr_comctz INTO v_comctz;
   CLOSE cr_comctz;
   --
   -- Obtener los datos del proveedor
   --
   --OPEN cr_comprv;
   --FETCH cr_comprv INTO v_comprv;
   --CLOSE cr_comprv;

   --
   -- Validar que existe la cotizacion
   --
   if v_comctz.id is null then
      raise_application_error(-20000,'La cotizacion especificada No Existe',true);
   end if;

   --
   -- Obtener el código de organización
   --
   OPEN cr_segorg;
   FETCH cr_segorg INTO v_segorg_codigo;
   CLOSE cr_segorg;

   --
   -- Obtener el tipo de documento
   --
   OPEN cr_comdct;
   FETCH cr_comdct INTO v_comdct_id;
   CLOSE cr_comdct;

   --
   -- Validar Tipo de Documento
   --
   if v_comdct_id is null then
      raise_application_error(-20000,'El tipo de Documento Especificado No existe',true);
   end if;

   --
   -- Recogemos la referencia del BLOB
   --
   --v_nombre_archivo := 'COMPED_' || p_comped_id;
   v_nombre_archivo := 'COTIZACION N°: ' || v_comctz.id; -- || '/' ||  ;
   --
   SELECT COMDOC_ID.NEXTVAL INTO v_comdoc_id FROM DUAL;
   --
   INSERT INTO com_documentos (ID, COMDCT_ID, DOCUMENTO, NOMBRE_ARCHIVO, TIPO_ARCHIVO)
   VALUES (v_comdoc_id, v_comdct_id, Empty_Blob(), v_nombre_archivo , 'application/pdf')
   RETURNING DOCUMENTO INTO v_blobRef;

   --
   -- Recogemos el fichero PDF del APEX simulando una
   -- llamada al informe desde el navegador
   --
   begin
      --
      v_dominio := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo    => 'DOMINIO_SERVIDOR_REPORTES'
                                            ,p_segorg_id => p_segorg_id);
      --
      -- Construimos la URL para llamar al report
      --
      v_reportURL := 'http://' || trim(v_dominio) || '/f?p=INFCOM:' || '1079' || ':' || v('APP_SESSION')  || '::NO:1079:P1079_COMCTZ_ID,P1079_COMCON_ID,P1079_COMPRV_ID,P1079_SEGORG_ID:' || p_comctz_id || ',' || v_comctz.comcon_id || ',' || v_comctz.comprv_id || ',' || p_segorg_id;
      dbms_output.put_line('v_reportURL=' || v_reportURL);
      -- Invocamos el reporte
      v_request  := Utl_Http.begin_request(v_reportUrl, 'GET');

      -- Obtenemos la respuesta
      v_response := Utl_Http.get_response(v_request);
      --
   exception
     when sys.utl_http.request_failed then
       return sys.utl_http.GET_DETAILED_SQLERRM;
   end;
   LOOP
      BEGIN
         --
         -- leemos la siguiente porcion de datos binarios
         --
         begin
            Utl_Http.read_raw(v_response, v_data, 32767);
         exception
            when sys.utl_http.request_failed then
               return sys.utl_http.GET_DETAILED_SQLERRM;
         end;
         v_string := v_string || TO_CHAR(UTL_RAW.length(v_data)) ;
         --
         -- y la añadimos a nuestro BLOB para el fichero PDF
         --
         Dbms_Lob.writeAppend ( lob_loc => v_blobRef
                              , amount  => Utl_Raw.length(v_data)
                              , buffer  => v_data
                              );
      EXCEPTION WHEN Utl_Http.END_OF_BODY THEN
         EXIT;
      END;
   END LOOP;

   Utl_Http.end_response(v_response);
   --
   return v_comdoc_id;
   --
exception when others then
   raise_application_error(-20000,'Error al obtener Documento : ' || sqlerrm, true);
end;
/* Obtener el documento pdf en binario. */
FUNCTION OBTN_COMCZD_DOC_PDF
 (P_SEGORG_ID IN NUMBER
 ,P_COMCON_ID IN NUMBER
 )
 RETURN NUMBER
 IS
--
   v_comctz          com_cotizaciones%ROWTYPE;
   v_comczd          com_cotizaciones%ROWTYPE;
   v_comped          COM_PEDIDOS%ROWTYPE;
   v_comcon          com_contrataciones%rowtype;
   v_comcot          com_contrataciones_detalles%rowtype;
   v_comctt          com_contrataciones_tipos%ROWTYPE;
   v_string          varchar2(4000);
   v_reportURL       VARCHAR2(1000);
   v_blobRef         BLOB;
   v_request         Utl_Http.req;
   v_response        Utl_Http.resp;
   v_data            RAW(32767);
   v_dominio         VARCHAR2(300);
   str_return        VARCHAR2(32767);
   v_comdct_id       number;
   v_comdoc_id       number;
   v_nombre_archivo  varchar2(300);
   v_segorg_codigo   varchar2(100);
   v_comped_id       number;
   --
   cursor cr_segorg is
   select codigo from seg_organizaciones
   where id = p_segorg_id;
   --
   cursor cr_comdct is
   select id from com_documentos_tipos
   where segorg_id = p_segorg_id
   and codigo = 'COM_EVALUACION';
   --
   cursor cr_comctz(p_comctz_id number) is
   select * from com_cotizaciones
   where id = p_comctz_id;
   --
   cursor cr_comcon is
   select * from com_contrataciones
   where id = p_comcon_id;
   --
   CURSOR cr_comcot IS
   SELECT *
   FROM COM_CONTRATACIONES_DETALLES
   WHERE COMCON_ID = p_comcon_id;
   --
   CURSOR cr_comped (p_comped_id number) IS
   SELECT *
   FROM COM_PEDIDOS
   WHERE ID = p_comped_id;
   --
   cursor cr_comctt (p_comctt_id number) is
   select * from com_contrataciones_tipos
   where id = p_comctt_id;
   --
BEGIN
   --
   -- Validar Organización
   --
   if p_segorg_id is null then
      raise_application_error(-20000,'No se ha especificado el id de Organizacion',true);
   end if;
   -- Validar que exista la cotizacion
   --
   if p_comcon_id is null then
      raise_application_error(-20000,'La Cotizacion es un dato obligatorio y no ha sido especificado',true);
   end if;

   --
   -- Obtener el datos de la cotizacion
   --
   OPEN cr_comcon;
   FETCH cr_comcon INTO v_comcon;
   CLOSE cr_comcon;
   --
   -- Validar que exista la cotizacion
   --
   if v_comcon.id is null then
      raise_application_error(-20000,'La Contatacion especificada No Existe',true);
   end if;
   --
   OPEN cr_comctt(v_comcon.comctt_id);
   FETCH cr_comctt INTO v_comctt;
   CLOSE cr_comctt;
   --
   if v_comctt.id is null then
      raise_application_error(-20000,'No se ha podido determinar el tipo de Contratación',true);
   end if;

   --
   -- Obtener el código de organización
   --
   OPEN cr_segorg;
   FETCH cr_segorg INTO v_segorg_codigo;
   CLOSE cr_segorg;
   --
   -- Validar la organizacion
   --
   if v_segorg_codigo is null then
      raise_application_error(-20000,'La organizacion Especificada No existe',true);
   end if;
   --
   -- Obtener el tipo de documento
   --
   OPEN cr_comdct;
   FETCH cr_comdct INTO v_comdct_id;
   CLOSE cr_comdct;
   --
   -- Validar Tipo de Documento
   --
   if v_comdct_id is null then
      raise_application_error(-20000,'El tipo de Documento Especificado No existe',true);
   end if;
   --
   -- Obtener los datos del Detalle de Contratacion
   --
   OPEN cr_comcot;
   FETCH cr_comcot INTO v_comcot;
   CLOSE cr_comcot;
   --
   -- Validar que existe el detalle
   --
   if v_comcot.id is null then
      raise_application_error(-20000,'No se han encontrado datos del detalle de Contratación',true);
   end if;
   --
   -- Obtener los datos del pedido
   --
   v_comped_id := v_comcot.comped_id;
   OPEN cr_comped(v_comped_id);
   FETCH cr_comped INTO v_comped;
   CLOSE cr_comped;
   --
   -- Validar que existe el pedido
   --
   if v_comped.id is null then
      raise_application_error(-20000,'La solicitud de Gasto especificada No Existe',true);
   end if;
   --
   -- Recogemos la referencia del BLOB
   --
   v_nombre_archivo := 'INFORME DE EVALUACION DE PROCESO DE CONTRATACION '|| 'N°: ' || v_comcon.codigo || '/' ||  v_comped.ejercicio || ' - '  || v_comctt.NOMBRE;
   --
   SELECT COMDOC_ID.NEXTVAL INTO v_comdoc_id FROM DUAL;
   --
   INSERT INTO com_documentos (ID, COMDCT_ID, DOCUMENTO, NOMBRE_ARCHIVO, TIPO_ARCHIVO)
   VALUES (v_comdoc_id, v_comdct_id, Empty_Blob(), v_nombre_archivo , 'application/pdf')
   RETURNING DOCUMENTO INTO v_blobRef;

   --
   -- Recogemos el fichero PDF del APEX simulando una
   -- llamada al informe desde el navegador
   --
   begin
      --
      v_dominio := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo    => 'DOMINIO_SERVIDOR_REPORTES'
                                            ,p_segorg_id => p_segorg_id);
      --
      -- Construimos la URL para llamar al report
      --
      v_reportURL := 'http://' || trim(v_dominio) || '/f?p=INFCOM:' || '1063' || ':' || v('APP_SESSION')  || '::NO:1063:P1_SEGORG_CODIGO,P1063_COMCON_ID,P1063_SEGORG_ID:' || v_segorg_codigo || ',' || p_comcon_id|| ',' || p_segorg_id;
      dbms_output.put_line('v_reportURL = ' || v_reportURL);
      -- Invocamos el reporte
      v_request  := Utl_Http.begin_request(v_reportUrl, 'GET');

      -- Obtenemos la respuesta
      v_response := Utl_Http.get_response(v_request);
      --
   exception
     when sys.utl_http.request_failed then
       return sys.utl_http.GET_DETAILED_SQLERRM;
   end;
   LOOP
      BEGIN
         --
         -- leemos la siguiente porcion de datos binarios
         --
         begin
            Utl_Http.read_raw(v_response, v_data, 32767);
         exception
            when sys.utl_http.request_failed then
               return sys.utl_http.GET_DETAILED_SQLERRM;
         end;
         v_string := v_string || TO_CHAR(UTL_RAW.length(v_data)) ;
         --
         -- y la añadimos a nuestro BLOB para el fichero PDF
         --
         Dbms_Lob.writeAppend ( lob_loc => v_blobRef
                              , amount  => Utl_Raw.length(v_data)
                              , buffer  => v_data
                              );
      EXCEPTION WHEN Utl_Http.END_OF_BODY THEN
         EXIT;
      END;
   END LOOP;

   Utl_Http.end_response(v_response);
   --
   return v_comdoc_id;
   --
exception when others then
   raise_application_error(-20000,'Error al obtener Documento : ' || sqlerrm, true);
end;
FUNCTION OBTN_COMECE_ESTADO
 (P_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
-- Declaracion de constantes
  c_programa  VARCHAR2(30):='OBTN_COMECE_ESTADO';
  c_proposito VARCHAR2(100):='Obtener el Estado de la Orden de Compra';

  -- Declaracion de cursores
  CURSOR cr_comece IS
  SELECT estado
  FROM COM_ORDENES_COMPRAS_EST COMECE
  WHERE ID = p_id;

  -- Declaración de variables
  v_retorno com_ordenes_compras_est.estado%type;
  --
BEGIN
  -- Buscar el valor
  OPEN cr_comece;
  FETCH cr_comece INTO v_retorno;
  CLOSE cr_comece;
  --
  RETURN (v_retorno);
  --
EXCEPTION
  WHEN OTHERS THEN
    raise_application_error(-20000,'Error en '||c_programa,true);
END;
/* Obtener el documento pdf en binario. */
FUNCTION OBTN_COMOCM_CONTRATO_DOC_PDF
 (P_SEGORG_ID IN NUMBER
 ,P_COMOCM_ID IN NUMBER
 )
 RETURN NUMBER
 IS
--
   v_comocm          com_ordenes_compras%ROWTYPE;
   v_comped          COM_PEDIDOS%ROWTYPE;
   v_comcot          com_contrataciones_detalles%rowtype;
   v_comctt          com_contrataciones_tipos%ROWTYPE;
   v_string          varchar2(4000);
   v_reportURL       VARCHAR2(255);
   v_blobRef         BLOB;
   v_request         Utl_Http.req;
   v_response        Utl_Http.resp;
   v_data            RAW(32767);
   v_dominio         VARCHAR2(300);
   str_return        VARCHAR2(32767);
   v_comdct_id       number;
   v_comdoc_id       number;
   v_nombre_archivo  varchar2(300);
   v_segorg_codigo   varchar2(100);
   v_comped_id       number;
   --
   cursor cr_segorg is
   select codigo from seg_organizaciones
   where id = p_segorg_id;
   --
   cursor cr_comdct is
   select id from com_documentos_tipos
   where segorg_id = p_segorg_id
   and codigo = 'COM_ORDEN_PROVISION';
   --
   cursor cr_comocm is
   select * from com_ordenes_compras
   where id = p_comocm_id;
   --
   CURSOR cr_comped (p_comped_id number) IS
   SELECT *
   FROM COM_PEDIDOS
   WHERE ID = p_comped_id;
   --
   CURSOR cr_comcon (p_comcon_id number) IS
   SELECT *
   FROM COM_CONTRATACIONES
   WHERE ID = p_comcon_id;
   --
   cursor cr_comctt (p_comctt_id number) is
   select * from com_contrataciones_tipos
   where id = p_comctt_id;

   --
BEGIN
   --
   -- Validar Organización
   --
   if p_segorg_id is null then
      raise_application_error(-20000,'No se ha especificado el id de Organizacion',true);
   end if;
   -- Validar que existe el pedido
   --
   if p_comocm_id is null then
      raise_application_error(-20000,'El Numero de Orden de Provision es un dato obligatorio y no ha sido especificado',true);
   end if;
   --
   -- Obtener el datos de la orden
   --
   OPEN cr_comocm;
   FETCH cr_comocm INTO v_comocm;
   CLOSE cr_comocm;
   --
   -- Validar que existe la orden
   --
   if v_comocm.id is null then
      raise_application_error(-20000,'La Orden de Provision especificada No Existe',true);
   end if;
   --
   -- Obtener los datos de la Contratacion
   --
   OPEN cr_comcon(v_comocm.comcon_id);
   FETCH cr_comcon INTO v_comcon;
   CLOSE cr_comcon;
   --
   -- Validar que existe la contratacion
   --
   if v_comcon.id is null then
      raise_application_error(-20000,'No se han encontrado los datos de la Contratación',true);
   end if;
   --
   -- Obtener los datos del tipo de Contratacion
   --
   OPEN cr_comctt(v_comcon.comctt_id);
   FETCH cr_comctt INTO v_comctt;
   CLOSE cr_comctt;

   if v_comctt.id is null then
      raise_application_error(-20000,'No se ha podido determinar el tipo de Contratación',true);
   end if;
   --
   -- Obtener el código de organización
   --
   OPEN cr_segorg;
   FETCH cr_segorg INTO v_segorg_codigo;
   CLOSE cr_segorg;

   --
   -- Obtener el tipo de documento
   --
   OPEN cr_comdct;
   FETCH cr_comdct INTO v_comdct_id;
   CLOSE cr_comdct;

   --
   -- Validar Tipo de Documento
   --
   if v_comdct_id is null then
      raise_application_error(-20000,'El tipo de Documento Especificado No existe',true);
   end if;
   --
   -- Obtener los datos del pedido
   --
   OPEN cr_comped(v_comocm.comped_id);
   FETCH cr_comped INTO v_comped;
   CLOSE cr_comped;
   --
   -- Validar que existe el pedido
   --
   if v_comped.id is null then
      raise_application_error(-20000,'La solicitud de Gasto especificada No Existe',true);
   end if;
   --
   -- Recogemos la referencia del BLOB
   --
   v_nombre_archivo := 'CONTRATO DE OBRA '||'N°: ' || v_comocm.codigo || '/' ||  v_comped.ejercicio || ' - ' || v_comctt.NOMBRE ;
   --
   SELECT COMDOC_ID.NEXTVAL INTO v_comdoc_id FROM DUAL;
   --
   INSERT INTO com_documentos (ID, COMDCT_ID, DOCUMENTO, NOMBRE_ARCHIVO, TIPO_ARCHIVO)
   VALUES (v_comdoc_id, v_comdct_id, Empty_Blob(), v_nombre_archivo , 'application/pdf')
   RETURNING DOCUMENTO INTO v_blobRef;

   --
   -- Recogemos el fichero PDF del APEX simulando una
   -- llamada al informe desde el navegador
   --
   begin
      --
      v_dominio := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo    => 'DOMINIO_SERVIDOR_REPORTES'
                                            ,p_segorg_id => p_segorg_id);
      --
      -- Construimos la URL para llamar al report
      --
      v_reportURL := 'http://' || trim(v_dominio) || '/f?p=INFCOM:' || '1081' || ':' || v('APP_SESSION')  || '::NO:1081:P1_SEGORG_CODIGO,P1081_COMOCM_ID,P1081_SEGORG_ID:' || v_segorg_codigo || ',' || p_comocm_id|| ',' || p_segorg_id;
      dbms_output.put_line('v_reportURL=' || v_reportURL);
      -- Invocamos el reporte
      v_request  := Utl_Http.begin_request(v_reportUrl, 'GET');

      -- Obtenemos la respuesta
      v_response := Utl_Http.get_response(v_request);
      --
   exception
     when sys.utl_http.request_failed then
       return sys.utl_http.GET_DETAILED_SQLERRM;
   end;
   LOOP
      BEGIN
         --
         -- leemos la siguiente porcion de datos binarios
         --
         begin
            Utl_Http.read_raw(v_response, v_data, 32767);
         exception
            when sys.utl_http.request_failed then
               return sys.utl_http.GET_DETAILED_SQLERRM;
         end;
         v_string := v_string || TO_CHAR(UTL_RAW.length(v_data)) ;
         --
         -- y la añadimos a nuestro BLOB para el fichero PDF
         --
         Dbms_Lob.writeAppend ( lob_loc => v_blobRef
                              , amount  => Utl_Raw.length(v_data)
                              , buffer  => v_data
                              );
      EXCEPTION WHEN Utl_Http.END_OF_BODY THEN
         EXIT;
      END;
   END LOOP;

   Utl_Http.end_response(v_response);
   --
   return v_comdoc_id;
   --
exception when others then
   raise_application_error(-20000,'Error al obtener Documento : ' || sqlerrm, true);
end;
/* Obtener el documento pdf en binario. */
FUNCTION OBTN_COMOCM_DOC_PDF
 (P_SEGORG_ID IN NUMBER
 ,P_COMOCM_ID IN NUMBER
 )
 RETURN NUMBER
 IS
--
   v_comocm          com_ordenes_compras%ROWTYPE;
   v_comped          COM_PEDIDOS%ROWTYPE;
   v_comcot          com_contrataciones_detalles%rowtype;
   v_comctt          com_contrataciones_tipos%ROWTYPE;
   v_string          varchar2(4000);
   v_reportURL       VARCHAR2(255);
   v_blobRef         BLOB;
   v_request         Utl_Http.req;
   v_response        Utl_Http.resp;
   v_data            RAW(32767);
   v_dominio         VARCHAR2(300);
   str_return        VARCHAR2(32767);
   v_comdct_id       number;
   v_comdoc_id       number;
   v_nombre_archivo  varchar2(300);
   v_segorg_codigo   varchar2(100);
   v_comped_id       number;
   --
   cursor cr_segorg is
   select codigo
   from seg_organizaciones
   where id = p_segorg_id;
   --
   cursor cr_comdct is
   select id from com_documentos_tipos
   where segorg_id = p_segorg_id
   and codigo = 'COM_ORDEN_PROVISION';
   --
   cursor cr_comocm is
   select * from com_ordenes_compras
   where id = p_comocm_id;
   --
   CURSOR cr_comped (p_comped_id number) IS
   SELECT *
   FROM COM_PEDIDOS
   WHERE ID = p_comped_id;
   --
   CURSOR cr_comcon (p_comcon_id number) IS
   SELECT *
   FROM COM_CONTRATACIONES
   WHERE ID = p_comcon_id;
   --
   cursor cr_comctt (p_comctt_id number) is
   select * from com_contrataciones_tipos
   where id = p_comctt_id;

   --
BEGIN
   --
   -- Validar Organización
   --
   if p_segorg_id is null then
      raise_application_error(-20000,'No se ha especificado el id de Organizacion',true);
   end if;
   -- Validar que existe el pedido
   --
   if p_comocm_id is null then
      raise_application_error(-20000,'El Numero de Orden de Provision es un dato obligatorio y no ha sido especificado',true);
   end if;
   --
   -- Obtener el datos de la orden
   --
   OPEN cr_comocm;
   FETCH cr_comocm INTO v_comocm;
   CLOSE cr_comocm;
   --
   -- Validar que existe la orden
   --
   if v_comocm.id is null then
      raise_application_error(-20000,'La Orden de Provision especificada No Existe',true);
   end if;
   --
   -- Obtener los datos de la Contratacion
   --
   OPEN cr_comcon(v_comocm.comcon_id);
   FETCH cr_comcon INTO v_comcon;
   CLOSE cr_comcon;
   --
   -- Validar que existe la contratacion
   --
   if v_comcon.id is null then
      raise_application_error(-20000,'No se han encontrado los datos de la Contratación',true);
   end if;
   --
   -- Obtener los datos del tipo de Contratacion
   --
   OPEN cr_comctt(v_comcon.comctt_id);
   FETCH cr_comctt INTO v_comctt;
   CLOSE cr_comctt;

   if v_comctt.id is null then
      raise_application_error(-20000,'No se ha podido determinar el tipo de Contratación',true);
   end if;
   --
   -- Obtener el código de organización
   --
   OPEN cr_segorg;
   FETCH cr_segorg INTO v_segorg_codigo;
   CLOSE cr_segorg;

   --
   -- Obtener el tipo de documento
   --
   OPEN cr_comdct;
   FETCH cr_comdct INTO v_comdct_id;
   CLOSE cr_comdct;

   --
   -- Validar Tipo de Documento
   --
   if v_comdct_id is null then
      raise_application_error(-20000,'El tipo de Documento Especificado No existe',true);
   end if;
   --
   -- Obtener los datos del pedido
   --
   OPEN cr_comped(v_comocm.comped_id);
   FETCH cr_comped INTO v_comped;
   CLOSE cr_comped;
   --
   -- Validar que existe el pedido
   --
   if v_comped.id is null then
      raise_application_error(-20000,'La solicitud de Gasto especificada No Existe',true);
   end if;
   --
   -- Recogemos la referencia del BLOB
   --
   v_nombre_archivo := 'ORDEN DE PROVISION '||'N°: ' || v_comocm.codigo || '/' ||  v_comped.ejercicio || ' - ' || v_comctt.NOMBRE ;
   --
   SELECT COMDOC_ID.NEXTVAL INTO v_comdoc_id FROM DUAL;
   --
   INSERT INTO com_documentos (ID, COMDCT_ID, DOCUMENTO, NOMBRE_ARCHIVO, TIPO_ARCHIVO)
   VALUES (v_comdoc_id, v_comdct_id, Empty_Blob(), v_nombre_archivo , 'application/pdf')
   RETURNING DOCUMENTO INTO v_blobRef;

   --
   -- Recogemos el fichero PDF del APEX simulando una
   -- llamada al informe desde el navegador
   --
   begin
      --
      v_dominio := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo    => 'DOMINIO_SERVIDOR_REPORTES'
                                            ,p_segorg_id => p_segorg_id);
      --
      -- Construimos la URL para llamar al report
      --
      v_reportURL := 'http://' || trim(v_dominio) || '/f?p=INFCOM:' || '1075' || ':' || v('APP_SESSION')  || '::NO:1075:P1_SEGORG_CODIGO,P1075_COMOCM_ID,P1075_SEGORG_ID:' || v_segorg_codigo || ',' || p_comocm_id|| ',' || p_segorg_id;
      dbms_output.put_line('v_reportURL=' || v_reportURL);
      -- Invocamos el reporte
      v_request  := Utl_Http.begin_request(v_reportUrl, 'GET');

      -- Obtenemos la respuesta
      v_response := Utl_Http.get_response(v_request);
      --
   exception
     when sys.utl_http.request_failed then
       return sys.utl_http.GET_DETAILED_SQLERRM;
   end;
   LOOP
      BEGIN
         --
         -- leemos la siguiente porcion de datos binarios
         --
         begin
            Utl_Http.read_raw(v_response, v_data, 32767);
         exception
            when sys.utl_http.request_failed then
               return sys.utl_http.GET_DETAILED_SQLERRM;
         end;
         v_string := v_string || TO_CHAR(UTL_RAW.length(v_data)) ;
         --
         -- y la añadimos a nuestro BLOB para el fichero PDF
         --
         Dbms_Lob.writeAppend ( lob_loc => v_blobRef
                              , amount  => Utl_Raw.length(v_data)
                              , buffer  => v_data
                              );
      EXCEPTION WHEN Utl_Http.END_OF_BODY THEN
         EXIT;
      END;
   END LOOP;

   Utl_Http.end_response(v_response);
   --
   return v_comdoc_id;
   --
exception when others then
   raise_application_error(-20000,'Error al obtener Documento : ' || sqlerrm, true);
end;
/* Obtener el documento pdf en binario. */
FUNCTION OBTN_OCMANU_DOC_PDF
 (P_SEGORG_ID IN NUMBER
 ,P_COMOCM_ID IN NUMBER
 )
 RETURN NUMBER
 IS
--
   v_comocm          com_ordenes_compras%ROWTYPE;
   v_comped          COM_PEDIDOS%ROWTYPE;
   v_comcot          com_contrataciones_detalles%rowtype;
   v_comctt          com_contrataciones_tipos%ROWTYPE;
   v_string          varchar2(4000);
   v_reportURL       VARCHAR2(255);
   v_blobRef         BLOB;
   v_request         Utl_Http.req;
   v_response        Utl_Http.resp;
   v_data            RAW(32767);
   v_dominio         VARCHAR2(300);
   str_return        VARCHAR2(32767);
   v_comdct_id       number;
   v_comdoc_id       number;
   v_nombre_archivo  varchar2(300);
   v_segorg_codigo   varchar2(100);
   v_comped_id       number;
   --
   cursor cr_segorg is
   select codigo from seg_organizaciones
   where id = p_segorg_id;
   --
   cursor cr_comdct is
   select id from com_documentos_tipos
   where segorg_id = p_segorg_id
   and codigo = 'COM_ORDEN_PROVISION_ANU';
   --
   cursor cr_comocm is
   select * from com_ordenes_compras
   where id = p_comocm_id;
   --
   CURSOR cr_comped (p_comped_id number) IS
   SELECT *
   FROM COM_PEDIDOS
   WHERE ID = p_comped_id;
   --
   CURSOR cr_comcon (p_comcon_id number) IS
   SELECT *
   FROM COM_CONTRATACIONES
   WHERE ID = p_comcon_id;
   --
   cursor cr_comctt (p_comctt_id number) is
   select * from com_contrataciones_tipos
   where id = p_comctt_id;

   --
BEGIN
   --
   -- Validar Organización
   --
   if p_segorg_id is null then
      raise_application_error(-20000,'No se ha especificado el id de Organizacion',true);
   end if;
   -- Validar que existe el pedido
   --
   if p_comocm_id is null then
      raise_application_error(-20000,'El Numero de Orden de Provision es un dato obligatorio y no ha sido especificado',true);
   end if;
   --
   -- Obtener el datos de la orden
   --
   OPEN cr_comocm;
   FETCH cr_comocm INTO v_comocm;
   CLOSE cr_comocm;
   --
   -- Validar que existe la orden
   --
   if v_comocm.id is null then
      raise_application_error(-20000,'La Orden de Provision especificada No Existe',true);
   end if;
   --
   -- Obtener los datos de la Contratacion
   --
   OPEN cr_comcon(v_comocm.comcon_id);
   FETCH cr_comcon INTO v_comcon;
   CLOSE cr_comcon;
   --
   -- Validar que existe la contratacion
   --
   if v_comcon.id is null then
      raise_application_error(-20000,'No se han encontrado los datos de la Contratación',true);
   end if;
   --
   -- Obtener los datos del tipo de Contratacion
   --
   OPEN cr_comctt(v_comcon.comctt_id);
   FETCH cr_comctt INTO v_comctt;
   CLOSE cr_comctt;

   if v_comctt.id is null then
      raise_application_error(-20000,'No se ha podido determinar el tipo de Contratación',true);
   end if;
   --
   -- Obtener el código de organización
   --
   OPEN cr_segorg;
   FETCH cr_segorg INTO v_segorg_codigo;
   CLOSE cr_segorg;

   --
   -- Obtener el tipo de documento
   --
   OPEN cr_comdct;
   FETCH cr_comdct INTO v_comdct_id;
   CLOSE cr_comdct;

   --
   -- Validar Tipo de Documento
   --
   if v_comdct_id is null then
      raise_application_error(-20000,'El tipo de Documento Especificado No existe',true);
   end if;
   --
   -- Obtener los datos del pedido
   --
   OPEN cr_comped(v_comocm.comped_id);
   FETCH cr_comped INTO v_comped;
   CLOSE cr_comped;
   --
   -- Validar que existe el pedido
   --
   if v_comped.id is null then
      raise_application_error(-20000,'La solicitud de Gasto especificada No Existe',true);
   end if;
   --
   -- Recogemos la referencia del BLOB
   --
   v_nombre_archivo := 'ANULACION DE ORDEN DE PROVISION '||'N°: ' || v_comocm.codigo || '/' ||  v_comped.ejercicio; -- || ' - ' || v_comctt.NOMBRE;
   --
   SELECT COMDOC_ID.NEXTVAL INTO v_comdoc_id FROM DUAL;
   --
   INSERT INTO com_documentos (ID, COMDCT_ID, DOCUMENTO, NOMBRE_ARCHIVO, TIPO_ARCHIVO)
   VALUES (v_comdoc_id, v_comdct_id, Empty_Blob(), v_nombre_archivo , 'application/pdf')
   RETURNING DOCUMENTO INTO v_blobRef;

   --
   -- Recogemos el fichero PDF del APEX simulando una
   -- llamada al informe desde el navegador
   --
   begin
      --
      v_dominio := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo    => 'DOMINIO_SERVIDOR_REPORTES'
                                            ,p_segorg_id => p_segorg_id);
      --
      -- Construimos la URL para llamar al report
      --
      v_reportURL := 'http://' || trim(v_dominio) || '/f?p=INFCOM:' || '1076' || ':' || v('APP_SESSION')  || '::NO:1076:P1_SEGORG_CODIGO,P1076_COMOCM_ID,P1076_SEGORG_ID:' || v_segorg_codigo || ',' || p_comocm_id|| ',' || p_segorg_id;
      dbms_output.put_line('v_reportURL=' || v_reportURL);
      -- Invocamos el reporte
      v_request  := Utl_Http.begin_request(v_reportUrl, 'GET');

      -- Obtenemos la respuesta
      v_response := Utl_Http.get_response(v_request);
      --
   exception
     when sys.utl_http.request_failed then
       return sys.utl_http.GET_DETAILED_SQLERRM;
   end;
   LOOP
      BEGIN
         --
         -- leemos la siguiente porcion de datos binarios
         --
         begin
            Utl_Http.read_raw(v_response, v_data, 32767);
         exception
            when sys.utl_http.request_failed then
               return sys.utl_http.GET_DETAILED_SQLERRM;
         end;
         v_string := v_string || TO_CHAR(UTL_RAW.length(v_data)) ;
         --
         -- y la añadimos a nuestro BLOB para el fichero PDF
         --
         Dbms_Lob.writeAppend ( lob_loc => v_blobRef
                              , amount  => Utl_Raw.length(v_data)
                              , buffer  => v_data
                              );
      EXCEPTION WHEN Utl_Http.END_OF_BODY THEN
         EXIT;
      END;
   END LOOP;

   Utl_Http.end_response(v_response);
   --
   return v_comdoc_id;
   --
exception when others then
   raise_application_error(-20000,'Error al obtener Documento : ' || sqlerrm, true);
end;
/* Obtener el documento pdf en binario. */
FUNCTION OBTN_OCMNOC_DOC_PDF
 (P_SEGORG_ID IN NUMBER
 ,P_COMOCM_ID IN NUMBER
 )
 RETURN NUMBER
 IS
--
   v_comocm          com_ordenes_compras%ROWTYPE;
   v_comped          COM_PEDIDOS%ROWTYPE;
   v_comcot          com_contrataciones_detalles%rowtype;
   v_comctt          com_contrataciones_tipos%ROWTYPE;
   v_string          varchar2(4000);
   v_reportURL       VARCHAR2(255);
   v_blobRef         BLOB;
   v_request         Utl_Http.req;
   v_response        Utl_Http.resp;
   v_data            RAW(32767);
   v_dominio         VARCHAR2(300);
   str_return        VARCHAR2(32767);
   v_comdct_id       number;
   v_comdoc_id       number;
   v_nombre_archivo  varchar2(300);
   v_segorg_codigo   varchar2(100);
   v_comped_id       number;
   --
   cursor cr_segorg is
   select codigo from seg_organizaciones
   where id = p_segorg_id;
   --
   cursor cr_comdct is
   select id from com_documentos_tipos
   where segorg_id = p_segorg_id
   and codigo = 'COM_ORDEN_PROVISION_NOC';
   --
   cursor cr_comocm is
   select * from com_ordenes_compras
   where id = p_comocm_id;
   --
   CURSOR cr_comped (p_comped_id number) IS
   SELECT *
   FROM COM_PEDIDOS
   WHERE ID = p_comped_id;
   --
   CURSOR cr_comcon (p_comcon_id number) IS
   SELECT *
   FROM COM_CONTRATACIONES
   WHERE ID = p_comcon_id;
   --
   cursor cr_comctt (p_comctt_id number) is
   select * from com_contrataciones_tipos
   where id = p_comctt_id;

   --
BEGIN
   --
   -- Validar Organización
   --
   if p_segorg_id is null then
      raise_application_error(-20000,'No se ha especificado el id de Organizacion',true);
   end if;
   -- Validar que existe el pedido
   --
   if p_comocm_id is null then
      raise_application_error(-20000,'El Numero de Orden de Provision es un dato obligatorio y no ha sido especificado',true);
   end if;
   --
   -- Obtener el datos de la orden
   --
   OPEN cr_comocm;
   FETCH cr_comocm INTO v_comocm;
   CLOSE cr_comocm;
   --
   -- Validar que existe la orden
   --
   if v_comocm.id is null then
      raise_application_error(-20000,'La Orden de Provision especificada No Existe',true);
   end if;
   --
   -- Obtener los datos de la Contratacion
   --
   OPEN cr_comcon(v_comocm.comcon_id);
   FETCH cr_comcon INTO v_comcon;
   CLOSE cr_comcon;
   --
   -- Validar que existe la contratacion
   --
   if v_comcon.id is null then
      raise_application_error(-20000,'No se han encontrado los datos de la Contratación',true);
   end if;
   --
   -- Obtener los datos del tipo de Contratacion
   --
   OPEN cr_comctt(v_comcon.comctt_id);
   FETCH cr_comctt INTO v_comctt;
   CLOSE cr_comctt;

   if v_comctt.id is null then
      raise_application_error(-20000,'No se ha podido determinar el tipo de Contratación',true);
   end if;
   --
   -- Obtener el código de organización
   --
   OPEN cr_segorg;
   FETCH cr_segorg INTO v_segorg_codigo;
   CLOSE cr_segorg;

   --
   -- Obtener el tipo de documento
   --
   OPEN cr_comdct;
   FETCH cr_comdct INTO v_comdct_id;
   CLOSE cr_comdct;

   --
   -- Validar Tipo de Documento
   --
   if v_comdct_id is null then
      raise_application_error(-20000,'El tipo de Documento COM_ORDEN_PROVISION_NOC No existe',true);
   end if;
   --
   -- Obtener los datos del pedido
   --
   OPEN cr_comped(v_comocm.comped_id);
   FETCH cr_comped INTO v_comped;
   CLOSE cr_comped;
   --
   -- Validar que existe el pedido
   --
   if v_comped.id is null then
      raise_application_error(-20000,'La solicitud de Gasto especificada No Existe',true);
   end if;
   --
   -- Recogemos la referencia del BLOB
   --
   v_nombre_archivo := 'ORDEN DE PROVISION '||'N°: ' || v_comocm.codigo || '/' ||  v_comped.ejercicio || ' - NO CONCRETADA'; -- || ' - ' || v_comctt.NOMBRE;
   --
   SELECT COMDOC_ID.NEXTVAL INTO v_comdoc_id FROM DUAL;
   --
   INSERT INTO com_documentos (ID, COMDCT_ID, DOCUMENTO, NOMBRE_ARCHIVO, TIPO_ARCHIVO)
   VALUES (v_comdoc_id, v_comdct_id, Empty_Blob(), v_nombre_archivo , 'application/pdf')
   RETURNING DOCUMENTO INTO v_blobRef;

   --
   -- Recogemos el fichero PDF del APEX simulando una
   -- llamada al informe desde el navegador
   --
   begin
      --
      v_dominio := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo    => 'DOMINIO_SERVIDOR_REPORTES'
                                            ,p_segorg_id => p_segorg_id);
      --
      -- Construimos la URL para llamar al report
      --
      v_reportURL := 'http://' || trim(v_dominio) || '/f?p=INFCOM:' || '1077' || ':' || v('APP_SESSION')  || '::NO:1077:P1_SEGORG_CODIGO,P1077_COMOCM_ID,P1077_SEGORG_ID:' || v_segorg_codigo || ',' || p_comocm_id|| ',' || p_segorg_id;
      dbms_output.put_line('v_reportURL=' || v_reportURL);
      -- Invocamos el reporte
      v_request  := Utl_Http.begin_request(v_reportUrl, 'GET');

      -- Obtenemos la respuesta
      v_response := Utl_Http.get_response(v_request);
      --
   exception
     when sys.utl_http.request_failed then
       return sys.utl_http.GET_DETAILED_SQLERRM;
   end;
   LOOP
      BEGIN
         --
         -- leemos la siguiente porcion de datos binarios
         --
         begin
            Utl_Http.read_raw(v_response, v_data, 32767);
         exception
            when sys.utl_http.request_failed then
               return sys.utl_http.GET_DETAILED_SQLERRM;
         end;
         v_string := v_string || TO_CHAR(UTL_RAW.length(v_data)) ;
         --
         -- y la añadimos a nuestro BLOB para el fichero PDF
         --
         Dbms_Lob.writeAppend ( lob_loc => v_blobRef
                              , amount  => Utl_Raw.length(v_data)
                              , buffer  => v_data
                              );
      EXCEPTION WHEN Utl_Http.END_OF_BODY THEN
         EXIT;
      END;
   END LOOP;

   Utl_Http.end_response(v_response);
   --
   return v_comdoc_id;
   --
exception when others then
   raise_application_error(-20000,'Error al obtener Documento : ' || sqlerrm, true);
end;
/* Obtener el documento pdf en binario de Contratacion No Adjudicada */
FUNCTION OBTN_COMCON_NAD_PDF
 (P_SEGORG_ID IN NUMBER
 ,P_COMCON_ID IN NUMBER
 )
 RETURN NUMBER
 IS
--
   v_comcon          com_contrataciones%ROWTYPE;
   v_comctt          com_contrataciones_tipos%ROWTYPE;
   v_comcot          com_contrataciones_detalles%rowtype;
   v_comped          COM_PEDIDOS%ROWTYPE;
   v_string          varchar2(4000);
   v_reportURL       VARCHAR2(255);
   v_blobRef         BLOB;
   v_request         Utl_Http.req;
   v_response        Utl_Http.resp;
   v_data            RAW(32767);
   v_dominio         VARCHAR2(300);
   str_return        VARCHAR2(32767);
   v_comdct_id       number;
   v_comdoc_id       number;
   v_nombre_archivo  varchar2(300);
   v_segorg_codigo   varchar2(100);
   v_comped_id       number;
   --
   cursor cr_segorg is
   select codigo from seg_organizaciones
   where id = p_segorg_id;
   --
   cursor cr_comdct is
   select id from com_documentos_tipos
   where segorg_id = p_segorg_id
   and codigo = 'COM_CONTRATACION_NAD';
   --
   cursor cr_comcon is
   select * from com_contrataciones
   where id = p_comcon_id;
   --
   CURSOR cr_comcot IS
   SELECT *
   FROM COM_CONTRATACIONES_DETALLES
   WHERE COMCON_ID = p_comcon_id;
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
BEGIN
   --
   -- Validar Organización
   --
   if p_segorg_id is null then
      raise_application_error(-20000,'No se ha especificado el id de Organizacion',true);
   end if;
   -- Validar que existe el proceso
   --
   if p_comcon_id is null then
      raise_application_error(-20000,'El Proceso es un dato obligatorio y no ha sido especificada',true);
   end if;
   --
   -- Obtener el datos del proceso
   --
   OPEN cr_comcon;
   FETCH cr_comcon INTO v_comcon;
   CLOSE cr_comcon;
   --
   -- Validar que existe el proceso
   --
   if v_comcon.id is null then
      raise_application_error(-20000,'El Proceso de Contratacion especificado No Existe',true);
   end if;
   --
   OPEN cr_comctt(v_comcon.comctt_id);
   FETCH cr_comctt INTO v_comctt;
   CLOSE cr_comctt;
   --
   if v_comctt.id is null then
      raise_application_error(-20000,'No se ha podido determinar el tipo de Contratación',true);
   end if;
   --
   -- Obtener los datos del Detalle de Contratacion
   --
   OPEN cr_comcot;
   FETCH cr_comcot INTO v_comcot;
   CLOSE cr_comcot;
   --
   -- Validar que existe el detalle
   --
   if v_comcot.id is null then
      raise_application_error(-20000,'No se han encontrado datos del detalle de Contratación',true);
   end if;
   --
   -- Obtener los datos del pedido
   --
   v_comped_id := v_comcot.comped_id;
   OPEN cr_comped(v_comped_id);
   FETCH cr_comped INTO v_comped;
   CLOSE cr_comped;
   --
   -- Validar que existe el pedido
   --
   if v_comped.id is null then
      raise_application_error(-20000,'La solicitud de Gasto especificada No Existe',true);
   end if;
   --
   -- Obtener el código de organización
   --
   OPEN cr_segorg;
   FETCH cr_segorg INTO v_segorg_codigo;
   CLOSE cr_segorg;

   --
   -- Obtener el tipo de documento
   --
   OPEN cr_comdct;
   FETCH cr_comdct INTO v_comdct_id;
   CLOSE cr_comdct;

   --
   -- Validar Tipo de Documento
   --
   if v_comdct_id is null then
      raise_application_error(-20000,'El tipo de Documento Especificado No existe',true);
   end if;

   --
   -- Recogemos la referencia del BLOB
   --
   v_nombre_archivo := 'PROCESO DE CONTRATACION - ' || v_comctt.NOMBRE || ' N°: ' || v_comcon.codigo || '/' ||  v_comped.ejercicio || ' DECLARADO NO ADJUDICADO';
   --
   SELECT COMDOC_ID.NEXTVAL INTO v_comdoc_id FROM DUAL;
   --
   INSERT INTO com_documentos (ID, COMDCT_ID, DOCUMENTO, NOMBRE_ARCHIVO, TIPO_ARCHIVO)
   VALUES (v_comdoc_id, v_comdct_id, Empty_Blob(), v_nombre_archivo , 'application/pdf')
   RETURNING DOCUMENTO INTO v_blobRef;

   --
   -- Recogemos el fichero PDF del APEX simulando una
   -- llamada al informe desde el navegador
   --
   begin
      --
      v_dominio := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo    => 'DOMINIO_SERVIDOR_REPORTES'
                                            ,p_segorg_id => p_segorg_id);
      --
      -- Construimos la URL para llamar al report
      --
      v_reportURL := 'http://' || trim(v_dominio) || '/f?p=INFCOM:' || '1064' || ':' || v('APP_SESSION')  || '::NO:1064:P1_SEGORG_CODIGO,P1064_COMCON_ID,P1064_SEGORG_ID,P1064_COMCOE_ID:' || v_segorg_codigo || ',' || p_comcon_id || ',' || p_segorg_id || ',' || v_comcon.comcoe_id ;
      dbms_output.put_line(v_reportURL);

      -- Invocamos el reporte
      v_request  := Utl_Http.begin_request(v_reportURL, 'GET');

      -- Obtenemos la respuesta
      v_response := Utl_Http.get_response(v_request);
      --
   exception
     when sys.utl_http.request_failed then
       return sys.utl_http.GET_DETAILED_SQLERRM;
   end;
   LOOP
      BEGIN
         --
         -- leemos la siguiente porcion de datos binarios
         --
         begin
            Utl_Http.read_raw(v_response, v_data, 32767);
         exception
            when sys.utl_http.request_failed then
               return sys.utl_http.GET_DETAILED_SQLERRM;
         end;
         v_string := v_string || TO_CHAR(UTL_RAW.length(v_data)) ;
         --
         -- y la añadimos a nuestro BLOB para el fichero PDF
         --
         Dbms_Lob.writeAppend ( lob_loc => v_blobRef
                              , amount  => Utl_Raw.length(v_data)
                              , buffer  => v_data
                              );
      EXCEPTION WHEN Utl_Http.END_OF_BODY THEN
         EXIT;
      END;
   END LOOP;

   Utl_Http.end_response(v_response);
   --
   return v_comdoc_id;
   --
exception when others then
   raise_application_error(-20000,'Error al obtener Documento : ' || sqlerrm, true);
end;
/* Obtener el documento pdf en binario. */
FUNCTION OBTN_COMCON_DOC_PDF
 (P_SEGORG_ID IN NUMBER
 ,P_COMCON_ID IN NUMBER
 )
 RETURN NUMBER
 IS
--
   v_comcon          com_contrataciones%ROWTYPE;
   v_comped          COM_PEDIDOS%ROWTYPE;
   v_comcot          com_contrataciones_detalles%rowtype;
   v_comctt          com_contrataciones_tipos%ROWTYPE;
   v_string          varchar2(4000);
   v_reportURL       VARCHAR2(255);
   v_blobRef         BLOB;
   v_request         Utl_Http.req;
   v_response        Utl_Http.resp;
   v_data            RAW(32767);
   v_dominio         VARCHAR2(300);
   str_return        VARCHAR2(32767);
   v_comdct_id       number;
   v_comdoc_id       number;
   v_nombre_archivo  varchar2(300);
   v_segorg_codigo   varchar2(100);
   v_comped_id       number;
   --
   cursor cr_segorg is
   select codigo from seg_organizaciones
   where id = p_segorg_id;
   --
   cursor cr_comdct is
   select id from com_documentos_tipos
   where segorg_id = p_segorg_id
   and codigo = 'COM_CONTRATACION';
   --
   cursor cr_comcon is
   select * from com_contrataciones
   where id = p_comcon_id;
   --
   CURSOR cr_comped (p_comped_id number) IS
   SELECT *
   FROM COM_PEDIDOS
   WHERE ID = p_comped_id;
   --
   CURSOR cr_comcot IS
   SELECT *
   FROM COM_CONTRATACIONES_DETALLES
   WHERE COMCON_ID = p_comcon_id;
   --
   cursor cr_comctt (p_comctt_id number) is
   select * from com_contrataciones_tipos
   where id = p_comctt_id;
   --
BEGIN
   --
   -- Validar Organización
   --
   if p_segorg_id is null then
      raise_application_error(-20000,'No se ha especificado el id de Organizacion',true);
   end if;
   -- Validar que existe el pedido
   --
   if p_comcon_id is null then
      raise_application_error(-20000,'El Proceso es un dato obligatorio y no ha sido especificado',true);
   end if;

   --
   -- Obtener el datos del proceso
   --
   OPEN cr_comcon;
   FETCH cr_comcon INTO v_comcon;
   CLOSE cr_comcon;
   --
   -- Validar que existe el proceso
   --
   if v_comcon.id is null then
      raise_application_error(-20000,'El proceso especificado No Existe',true);
   end if;
   --
   OPEN cr_comctt(v_comcon.comctt_id);
   FETCH cr_comctt INTO v_comctt;
   CLOSE cr_comctt;
   --
   if v_comctt.id is null then
      raise_application_error(-20000,'No se ha podido determinar el tipo de Contratación',true);
   end if;
   --
   -- Obtener el código de organización
   --
   OPEN cr_segorg;
   FETCH cr_segorg INTO v_segorg_codigo;
   CLOSE cr_segorg;

   --
   -- Obtener el tipo de documento
   --
   OPEN cr_comdct;
   FETCH cr_comdct INTO v_comdct_id;
   CLOSE cr_comdct;

   --
   -- Validar Tipo de Documento
   --
   if v_comdct_id is null then
      raise_application_error(-20000,'El tipo de Documento Especificado No existe',true);
   end if;
   --
   -- Obtener los datos del Detalle de Contratacion
   --
   OPEN cr_comcot;
   FETCH cr_comcot INTO v_comcot;
   CLOSE cr_comcot;
   --
   -- Validar que existe el detalle
   --
   if v_comcot.id is null then
      raise_application_error(-20000,'No se han encontrado datos del detalle de Contratación',true);
   end if;
   --
   -- Obtener los datos del pedido
   --
   v_comped_id := v_comcot.comped_id;
   OPEN cr_comped(v_comped_id);
   FETCH cr_comped INTO v_comped;
   CLOSE cr_comped;
   --
   -- Validar que existe el pedido
   --
   if v_comped.id is null then
      raise_application_error(-20000,'La solicitud de Gasto especificada No Existe',true);
   end if;
   --
   -- Recogemos la referencia del BLOB
   --
   v_nombre_archivo := 'PROCESO DE CONTRATACION '||'N°: ' || v_comcon.codigo || '/' ||  v_comped.ejercicio || ' - ' || v_comctt.NOMBRE ;
   --
   SELECT COMDOC_ID.NEXTVAL INTO v_comdoc_id FROM DUAL;
   --
   INSERT INTO com_documentos (ID, COMDCT_ID, DOCUMENTO, NOMBRE_ARCHIVO, TIPO_ARCHIVO)
   VALUES (v_comdoc_id, v_comdct_id, Empty_Blob(), v_nombre_archivo , 'application/pdf')
   RETURNING DOCUMENTO INTO v_blobRef;

   --
   -- Recogemos el fichero PDF del APEX simulando una
   -- llamada al informe desde el navegador
   --
   begin
      --
      v_dominio := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo    => 'DOMINIO_SERVIDOR_REPORTES'
                                            ,p_segorg_id => p_segorg_id);
      --
      -- Construimos la URL para llamar al report
      --
      v_reportURL := 'http://' || trim(v_dominio) || '/f?p=INFCOM:' || '1062' || ':' || v('APP_SESSION')  || '::NO:1062:P1_SEGORG_CODIGO,P1062_COMCON_ID,P1062_SEGORG_ID:' || v_segorg_codigo || ',' || p_comcon_id|| ',' || p_segorg_id;
      dbms_output.put_line('v_reportURL=' || v_reportURL);
      -- Invocamos el reporte
      v_request  := Utl_Http.begin_request(v_reportUrl, 'GET');

      -- Obtenemos la respuesta
      v_response := Utl_Http.get_response(v_request);
      --
   exception
     when sys.utl_http.request_failed then
       return sys.utl_http.GET_DETAILED_SQLERRM;
   end;
   LOOP
      BEGIN
         --
         -- leemos la siguiente porcion de datos binarios
         --
         begin
            Utl_Http.read_raw(v_response, v_data, 32767);
         exception
            when sys.utl_http.request_failed then
               return sys.utl_http.GET_DETAILED_SQLERRM;
         end;
         v_string := v_string || TO_CHAR(UTL_RAW.length(v_data)) ;
         --
         -- y la añadimos a nuestro BLOB para el fichero PDF
         --
         Dbms_Lob.writeAppend ( lob_loc => v_blobRef
                              , amount  => Utl_Raw.length(v_data)
                              , buffer  => v_data
                              );
      EXCEPTION WHEN Utl_Http.END_OF_BODY THEN
         EXIT;
      END;
   END LOOP;

   Utl_Http.end_response(v_response);
   --
   return v_comdoc_id;
   --
exception when others then
   raise_application_error(-20000,'Error al obtener Documento : ' || sqlerrm, true);
end;
/* Obtener el documento pdf en binario de anulacion de Pedido. */
FUNCTION OBTN_COMPED_DOC_ANU_PDF
 (P_SEGORG_ID IN NUMBER
 ,P_COMPED_ID IN NUMBER
 ,P_COMPEE_ID IN NUMBER
 )
 RETURN NUMBER
 IS
--
   v_comped          com_pedidos%ROWTYPE;
   v_string          varchar2(4000);
   v_reportURL       VARCHAR2(4000);
   v_blobRef         BLOB;
   v_request         Utl_Http.req;
   v_response        Utl_Http.resp;
   v_data            RAW(32767);
   v_dominio         VARCHAR2(4000);
   str_return        VARCHAR2(32767);
   v_comdct_id       number;
   v_comdoc_id       number;
   v_nombre_archivo  varchar2(300);
   v_segorg_codigo   varchar2(100);
   --
   cursor cr_segorg is
   select codigo from seg_organizaciones
   where id = p_segorg_id;
   --
   cursor cr_comdct is
   select id from com_documentos_tipos
   where segorg_id = p_segorg_id
   and codigo = 'COM_PEDIDO_ANU';
   --
   cursor cr_comped is
   select * from com_pedidos
   where id = p_comped_id;
   --
BEGIN
   --
   -- Validar Organización
   --
   if p_segorg_id is null then
      raise_application_error(-20000,'No se ha especificado el id de Organizacion',true);
   end if;
   -- Validar que existe el pedido
   --
   if p_comped_id is null then
      raise_application_error(-20000,'La solicitud de Gasto es un dato obligatorio y no ha sido especificada',true);
   end if;

   --
   -- Obtener el datos del pedido
   --
   OPEN cr_comped;
   FETCH cr_comped INTO v_comped;
   CLOSE cr_comped;
   --
   -- Validar que existe el pedido
   --
   if v_comped.id is null then
      raise_application_error(-20000,'La solicitud de Gasto especificada No Existe',true);
   end if;

   --
   -- Obtener el código de organización
   --
   OPEN cr_segorg;
   FETCH cr_segorg INTO v_segorg_codigo;
   CLOSE cr_segorg;

   --
   -- Obtener el tipo de documento
   --
   OPEN cr_comdct;
   FETCH cr_comdct INTO v_comdct_id;
   CLOSE cr_comdct;

   --
   -- Validar Tipo de Documento
   --
   if v_comdct_id is null then
      raise_application_error(-20000,'El tipo de Documento Especificado No existe',true);
   end if;

   --
   -- Recogemos la referencia del BLOB
   --
   v_nombre_archivo := 'ANULACION DE SOLICITUD DE GASTOS N°: ' || v_comped.codigo || '/' ||  v_comped.ejercicio;
   --
   SELECT COMDOC_ID.NEXTVAL INTO v_comdoc_id FROM DUAL;
   --
   INSERT INTO com_documentos (ID, COMDCT_ID, DOCUMENTO, NOMBRE_ARCHIVO, TIPO_ARCHIVO)
   VALUES (v_comdoc_id, v_comdct_id, Empty_Blob(), v_nombre_archivo , 'application/pdf')
   RETURNING DOCUMENTO INTO v_blobRef;

   --
   -- Recogemos el fichero PDF del APEX simulando una
   -- llamada al informe desde el navegador
   --
   begin
      --
      v_dominio := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo    => 'DOMINIO_SERVIDOR_REPORTES'
                                            ,p_segorg_id => p_segorg_id);
      --
      -- Construimos la URL para llamar al report
      --
      --v_reportURL := 'http://' || trim(v_dominio) || '/f?p=INFCOM:' || '1052' || ':' || v('APP_SESSION')  || '::NO:1052:P1_SEGORG_CODIGO,P1052_COMPED_ID,P1052_MOTIVO:' || v_segorg_codigo || ',' || p_comped_id || ',' || com_pkg.form_url_encode(p_motivo,'ISO-8859-1');
      v_reportURL := 'http://' || trim(v_dominio) || '/f?p=INFCOM:' || '1052' || ':' || v('APP_SESSION')  || '::NO:1052:P1_SEGORG_CODIGO,P1052_COMPED_ID,P1052_COMPEE_ID:' || v_segorg_codigo || ',' || p_comped_id || ',' || p_compee_id; -- || ',' ||com_pkg.form_url_encode(p_motivo,'ISO-8859-1');
      dbms_output.put_line(v_reportURL);
      --
   exception when others then
      raise_application_error(-20000,'Error al obtener URL de Documento : ' || v_reportURL || ' ' || sqlerrm, true);
   end;
   begin
      -- Invocamos el reporte
      v_request  := Utl_Http.begin_request(v_reportURL, 'GET');

      -- Obtenemos la respuesta
      v_response := Utl_Http.get_response(v_request);
      --
   exception
     when sys.utl_http.request_failed then
       return sys.utl_http.GET_DETAILED_SQLERRM;
   end;
   LOOP
      BEGIN
         --
         -- leemos la siguiente porcion de datos binarios
         --
         begin
            Utl_Http.read_raw(v_response, v_data, 32767);
         exception
            when sys.utl_http.request_failed then
               return sys.utl_http.GET_DETAILED_SQLERRM;
         end;
         v_string := v_string || TO_CHAR(UTL_RAW.length(v_data)) ;
         --
         -- y la añadimos a nuestro BLOB para el fichero PDF
         --
         Dbms_Lob.writeAppend ( lob_loc => v_blobRef
                              , amount  => Utl_Raw.length(v_data)
                              , buffer  => v_data
                              );
      EXCEPTION WHEN Utl_Http.END_OF_BODY THEN
         EXIT;
      END;
   END LOOP;

   Utl_Http.end_response(v_response);
   --
   return v_comdoc_id;
   --
exception when others then
   raise_application_error(-20000,'Error al obtener Documento : ' || sqlerrm, true);
end;
/* Obtener el documento pdf en binario. */
FUNCTION OBTN_COMPED_DOC_PDF
 (P_SEGORG_ID IN NUMBER
 ,P_COMPED_ID IN NUMBER
 )
 RETURN NUMBER
 IS
--
   v_comped          com_pedidos%ROWTYPE;
   v_string          varchar2(4000);
   v_reportURL       VARCHAR2(255);
   v_blobRef         BLOB;
   v_request         Utl_Http.req;
   v_response        Utl_Http.resp;
   v_data            RAW(32767);
   v_dominio         VARCHAR2(300);
   str_return        VARCHAR2(32767);
   v_comdct_id       number;
   v_comdoc_id       number;
   v_nombre_archivo  varchar2(300);
   v_segorg_codigo   varchar2(100);
   --
   cursor cr_segorg is
   select codigo from seg_organizaciones
   where id = p_segorg_id;
   --
   cursor cr_comdct is
   select id from com_documentos_tipos
   where segorg_id = p_segorg_id
   and codigo = 'COM_PEDIDO';
   --
   cursor cr_comped is
   select * from com_pedidos
   where id = p_comped_id;
   --
BEGIN
   --
   -- Validar Organización
   --
   if p_segorg_id is null then
      raise_application_error(-20000,'No se ha especificado el id de Organizacion',true);
   end if;
   -- Validar que existe el pedido
   --
   if p_comped_id is null then
      raise_application_error(-20000,'La solicitud de Gasto es un dato obligatorio y no ha sido especificada',true);
   end if;

   --
   -- Obtener el datos del pedido
   --
   OPEN cr_comped;
   FETCH cr_comped INTO v_comped;
   CLOSE cr_comped;
   --
   -- Validar que existe el pedido
   --
   if v_comped.id is null then
      raise_application_error(-20000,'La solicitud de Gasto especificada No Existe',true);
   end if;

   --
   -- Obtener el código de organización
   --
   OPEN cr_segorg;
   FETCH cr_segorg INTO v_segorg_codigo;
   CLOSE cr_segorg;

   --
   -- Obtener el tipo de documento
   --
   OPEN cr_comdct;
   FETCH cr_comdct INTO v_comdct_id;
   CLOSE cr_comdct;

   --
   -- Validar Tipo de Documento
   --
   if v_comdct_id is null then
      raise_application_error(-20000,'El tipo de Documento Especificado No existe',true);
   end if;

   --
   -- Recogemos la referencia del BLOB
   --
   --v_nombre_archivo := 'COMPED_' || p_comped_id;
   v_nombre_archivo := 'SOLICITUD DE GASTOS N°: ' || v_comped.codigo || '/' ||  v_comped.ejercicio;
   --
   SELECT COMDOC_ID.NEXTVAL INTO v_comdoc_id FROM DUAL;
   --
   INSERT INTO com_documentos (ID, COMDCT_ID, DOCUMENTO, NOMBRE_ARCHIVO, TIPO_ARCHIVO)
   VALUES (v_comdoc_id, v_comdct_id, Empty_Blob(), v_nombre_archivo , 'application/pdf')
   RETURNING DOCUMENTO INTO v_blobRef;

   --
   -- Recogemos el fichero PDF del APEX simulando una
   -- llamada al informe desde el navegador
   --
   begin
      --
      v_dominio := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo    => 'DOMINIO_SERVIDOR_REPORTES'
                                            ,p_segorg_id => p_segorg_id);
      --
      -- Construimos la URL para llamar al report
      --
      v_reportURL := 'http://' || trim(v_dominio) || '/f?p=INFCOM:' || '1051' || ':' || v('APP_SESSION')  || '::NO:1051:P1_SEGORG_CODIGO,P1051_COMPED_ID:' || v_segorg_codigo || ',' || p_comped_id;

      -- Invocamos el reporte
      v_request  := Utl_Http.begin_request(v_reportUrl, 'GET');

      -- Obtenemos la respuesta
      v_response := Utl_Http.get_response(v_request);
      --
   exception
     when sys.utl_http.request_failed then
       return sys.utl_http.GET_DETAILED_SQLERRM;
   end;
   LOOP
      BEGIN
         --
         -- leemos la siguiente porcion de datos binarios
         --
         begin
            Utl_Http.read_raw(v_response, v_data, 32767);
         exception
            when sys.utl_http.request_failed then
               return sys.utl_http.GET_DETAILED_SQLERRM;
         end;
         v_string := v_string || TO_CHAR(UTL_RAW.length(v_data)) ;
         --
         -- y la añadimos a nuestro BLOB para el fichero PDF
         --
         Dbms_Lob.writeAppend ( lob_loc => v_blobRef
                              , amount  => Utl_Raw.length(v_data)
                              , buffer  => v_data
                              );
      EXCEPTION WHEN Utl_Http.END_OF_BODY THEN
         EXIT;
      END;
   END LOOP;

   Utl_Http.end_response(v_response);
   --
   return v_comdoc_id;
   --
exception when others then
   raise_application_error(-20000,'Error al obtener Documento : ' || sqlerrm, true);
end;
FUNCTION OBTN_XML_VALIDA_ASIENTO_PARTID
 (P_VALIDA IN VARCHAR2
 ,P_EJERCICIO IN VARCHAR2
 ,P_EXPEDIENTE IN VARCHAR2
 ,P_RESOLUCION IN VARCHAR2
 ,P_CONTRATANTE IN VARCHAR2
 ,P_PARTIDA1 IN VARCHAR2
 ,P_PARTIDA2 IN VARCHAR2
 ,P_PARTIDA3 IN VARCHAR2
 ,P_PARTIDA4 IN VARCHAR2
 ,P_PARTIDA5 IN VARCHAR2
 ,P_PARTIDA6 IN VARCHAR2
 ,P_PARTIDA7 IN VARCHAR2
 ,P_PARTIDA8 IN VARCHAR2
 ,P_PARTIDA9 IN VARCHAR2
 ,P_PARTIDA10 IN VARCHAR2
 ,P_SEGORG_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
v_url           varchar2(3000);
   v_respuesta     CLOB;
begin
   --
   v_url := SEG_PKG.OBTN_SEGCFG_VALOR( P_CODIGO    =>  'WS_URL_VALIDACION'
                                      ,P_SEGORG_ID =>  p_segorg_id);

   --
   if p_segorg_id is null then
      raise_application_error(-20000,'No se ha especificado la organización y es un dato obligatorio<',true);
   end if;
   if v_url is null then
      raise_application_error(-20000,'No se ha encontrado la configuración de la URL del web service de validación',true);
   end if;
   --
   v_url := v_url || '/wscompValidaAsientoPartidas' || chr(63) ||
   'pValida='           || 'ENL-G2NHPW'  ||  chr(38) ||
   'pEjercicio='        || p_ejercicio   ||  chr(38) ||
   'pNroExpediente='    || p_expediente  ||  chr(38) ||
   'pNroAsiento='       || p_resolucion  ||  chr(38) ||
   'pUnidadEjecutora='  || p_contratante ||  chr(38) ||
   'pPartida1='         || p_partida1    ||  chr(38) ||
   'pPartida2='         || p_partida2    ||  chr(38) ||
   'pPartida3='         || p_partida3    ||  chr(38) ||
   'pPartida4='         || p_partida4    ||  chr(38) ||
   'pPartida5='         || p_partida5    ||  chr(38) ||
   'pPartida6='         || p_partida6    ||  chr(38) ||
   'pPartida7='         || p_partida7    ||  chr(38) ||
   'pPartida8='         || p_partida8    ||  chr(38) ||
   'pPartida9='         || p_partida9    ||  chr(38) ||
   'pPartida10='        || p_partida10;
   --
   v_respuesta := sys.invocarWS(v_url,'');
   --
   return v_url || chr(10) || chr(13) || v_respuesta;
   --
end;
FUNCTION OBTN_COMCON_PERIODO_ACLARAC_SN
 (P_SEGORG_ID IN NUMBER
 ,P_COMCON_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
--
   CURSOR cr_comcoe IS
   SELECT ESTADO
   FROM COM_CONTRATACIONES_EST
   WHERE ID = OBTN_COMCOE_ID(p_comcon_id);
   --
   CURSOR cr_comcon IS
   SELECT *
   FROM COM_CONTRATACIONES
   WHERE ID = p_comcon_id;
   --
   v_query        VARCHAR2(2000);
   v_retorno      VARCHAR2(2) := 'NO';
   v_comcoe_est   VARCHAR2(100);
   v_estado       VARCHAR2(100) := NULL;
   v_comcon       com_contrataciones%ROWTYPE;
  --
BEGIN
   -- Verificar parametros obligatorios
   if p_segorg_id is null then
      raise_application_error(-20000,'La Organización no ha sido indicada y es un dato obligatorio',true);
   elsif p_comcon_id is null then
      raise_application_error(-20000,'El Numero de Contratacion no ha sido indicado y es un dato obligatorio',true);
   end if;
   --
   OPEN cr_comcoe;
   FETCH cr_comcoe INTO v_comcoe_est;
   CLOSE cr_comcoe;
   --
   IF (v_comcoe_est = 'ACT') AND (OBTN_COMCON_COTIZAR(p_comcon_id => p_comcon_id) = 'SI') THEN
      v_estado := 'ABIERTO';
   ELSE
      v_estado := 'CERRADO';
   END IF;
   --
   OPEN cr_comcon;
   FETCH cr_comcon INTO v_comcon;
   CLOSE cr_comcon;
   --
   -- Si se encuentra en estado abierto entonces SI permite adjuntar documentos
   IF v_estado = 'ABIERTO' THEN
      v_retorno := 'SI';
   ELSE
      -- Si el proceso ya esta cerrado y no tiene fecha de aclaracion
      IF v_comcon.FECHA_FIN_ACLARACION IS NULL THEN
         v_retorno := 'NO';
      ELSE
         -- Si el proceso ya esta cerrado y tiene fecha de aclaracion, verifico las fechas
         IF sysdate >= v_comcon.FECHA_FIN_PROPUESTA AND sysdate <= v_comcon.FECHA_FIN_ACLARACION  THEN
            v_retorno := 'SI';
         ELSE
            v_retorno := 'NO';
         END IF;
      END IF;
   END IF;
   --
   RETURN v_retorno;
   --
END;
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
/* Obtener los telefonos de un proveedor */
FUNCTION OBTN_COMPRV_TELEFONOS
 (P_COMPRV_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_comprd is
  select distinct decode(a.telefono_codigo_area,'','','('||a.telefono_codigo_area||') ') area, a.telefono_numero numero
  from com_domicilios a
     , com_proveedores_dom b
  where b.comdom_id = a.id
    and b.comprv_id = p_comprv_id
    and b.situacion = 'ACT'
    and a.telefono_numero is not null;
  v_telefonos varchar2(4000);
begin
  for v_comprd in cr_comprd loop
    if v_telefonos is not null then
      v_telefonos:=v_telefonos||' ; '||v_comprd.area||v_comprd.numero;
    else
      v_telefonos:=v_comprd.area||v_comprd.numero;
    end if;
  end loop;
  return v_telefonos;
end;
FUNCTION OBTN_DOC_FEC_VENC_ULT_DOC_HAB
 (P_COMPRV_ID IN NUMBER
 ,P_COMPDT_ID IN NUMBER
 )
 RETURN DATE
 IS
cursor cur_doc is
   select FECHA_VENCIMIENTO
    from	 COM_PROVEEDORES_DOC COMPDO
   where COMPRV_ID = P_COMPRV_ID
     and COMPDT_ID = P_COMPDT_ID
     and SITUACION = 'ACT'
   order by id desc;
  --
  v_fecha_vencimiento   date;
  --
BEGIN
   v_fecha_vencimiento:=null;
   open cur_doc;
   fetch cur_doc into v_fecha_vencimiento;
   close cur_doc;
   RETURN v_fecha_vencimiento;
END;
FUNCTION OBTN_DOC_FECHA_VENC
 (P_COMPRV_ID IN NUMBER
 ,P_COMPDT_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cur_doc is
   select FECHA_VENCIMIENTO
    from	 COM_PROVEEDORES_DOC COMPDO
   where COMPRV_ID = P_COMPRV_ID
     and COMPDT_ID = P_COMPDT_ID
     and SITUACION <> 'NUE'
   order by id desc;
  --
  v_fecha_vencimiento   date;
  --
BEGIN
   open cur_doc;
   fetch cur_doc into v_fecha_vencimiento;
   close cur_doc;
   RETURN to_char(v_fecha_vencimiento);
END;
FUNCTION OBTN_DOC_ADEUDADO
 (P_SEGORG_ID IN NUMBER
 ,P_COMPRV_ID IN NUMBER
 ,P_COMPDT_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_gen is
      --select com_pkg.obtn_comdoc_estado ( p_segorg_id => P_SEGORG_ID
      --                                  , p_comprv_id => P_COMPRV_ID
      --                                  , p_compdt_id => P_COMPDT_ID  ) ESTADO
      select com_pkg.obtn_comdoc_no_fmt ( p_segorg_id => P_SEGORG_ID
                                       , p_comprv_id => P_COMPRV_ID
                                       , p_compdt_id => P_COMPDT_ID  ) ESTADO
       from dual
      where com_pkg.obtn_comdoc_no_fmt ( p_segorg_id => P_SEGORG_ID
                                       , p_comprv_id => P_COMPRV_ID
                                       , p_compdt_id => P_COMPDT_ID  ) in ('NO PRESENTADO','VENCIDO');

   --
   v_comprv      COM_PROVEEDORES%ROWTYPE;
   v_compdt      COM_PROVEEDORES_DOT%ROWTYPE;
   v_estado       varchar2(100);
BEGIN
   OPEN cr_gen;
   FETCH cr_gen INTO v_estado;
   CLOSE cr_gen;
   return v_estado ;
END;
/* Obtener la fecha de vencimiento de un documento. */
FUNCTION OBTN_DOC_VENCIDO_SN
 (P_SEGORG_ID IN NUMBER
 ,P_COMPDT_ID IN NUMBER
 ,P_FECHA_EMISION IN VARCHAR2
 )
 RETURN VARCHAR2
 IS
--
-- tipos de documentos
CURSOR cr_compdt IS
select *
from com_proveedores_dot COMPDT
where COMPDT.id = p_compdt_id
and COMPDT.segorg_id = p_segorg_id;
--and situacion = 'HAB';
--
v_retorno         VARCHAR2(20);
v_compdt          com_proveedores_dot%ROWTYPE;
v_meses           integer;
V_FECHA_EMISION   DATE;
V_RET             VARCHAR2(50);
V_RET_DATE        DATE;
--
BEGIN
   --
   -- Verificamos que existe el tipo de Documento
   --
   OPEN cr_compdt;
   FETCH cr_compdt INTO v_compdt;
   if cr_compdt%NOTFOUND THEN
      --return P_FECHA_EMISION || ' - ' || p_compdt_id;
      return null;
   end if;
   CLOSE cr_compdt;
   --
   V_FECHA_EMISION := TO_DATE(P_FECHA_EMISION, 'dd/mm/yyyy');
   --
   IF v_compdt.DURACION_TIPO = 'AÑO' THEN
      v_meses := v_compdt.DURACION_VALOR * 12;
      V_RET_DATE := add_months(V_FECHA_EMISION , v_meses);
   ELSIF v_compdt.DURACION_TIPO = 'MES' THEN
      v_meses := v_compdt.DURACION_VALOR;
      V_RET_DATE := add_months(V_FECHA_EMISION, v_meses);
   ELSIF v_compdt.DURACION_TIPO = 'DIA' THEN
      V_RET_DATE := V_FECHA_EMISION + (v_compdt.DURACION_VALOR);
   END IF;
   --
   IF V_RET_DATE > SYSDATE THEN
      V_RET := 'NO';
   ELSE
      V_RET := 'SI';
   END IF;
   --
   RETURN V_RET;
   --
END;
FUNCTION OBTN_COMDOC_CANT_ADE
 (P_COMPRV_ID IN NUMBER
 )
 RETURN INTEGER
 IS
/* cursor cur_pdt_rub is
   select COUNT(*) AS "CANT_RUB"
    from COM_COMPDT_COMRUB    COMTDR
        ,COM_PROVEEDORES_DOT  COMPDT
        ,COM_PROVEEDORES_RUB  PRVRUB
        ,COM_PROVEEDORES_DTE  COMPDE
   where COMTDR.COMPDT_ID = COMPDT.ID
   and   COMPDE.ESTADO = 'HAB'
   and   COMTDR.COMRUB_ID = PRVRUB.COMRUB_ID
   and   PRVRUB.COMPRV_ID = P_COMPRV_ID
   and   COMPDT.ID = COMPDE.COMPDT_ID
   and   PRVRUB.SITUACION ='ACT'
   and   COMTDR.OBLIGATORIO_SN = 'SI'
   and com_pkg.obtn_comdoc_no_fmt ( p_segorg_id => COMPDT.SEGORG_ID
                                  , p_comprv_id => P_COMPRV_ID
                                  , p_compdt_id => COMPDT.id  ) in ('NO PRESENTADO','VENCIDO')
   and compde.ID = com_pkg.obtn_compde_id (compdt.ID);*/
   --
   cursor cur_pdt_prt (P_COMPRT_ID NUMBER) is
   select COUNT(*) AS "CANT_PRT"
    from COM_COMPDT_COMPRT    COMPTT
        ,COM_PROVEEDORES_DOT  COMPDT
      --,COM_PROVEEDORES_DTE  COMPDE
   where COMPTT.COMPDT_ID = COMPDT.ID
-- and   COMPDT.ID = COMPDE.COMPDT_ID
   and COMPDT.COMPDE_ESTADO = 'HAB'
   and COMPDT.TIPO = 'GEN'
   and COMPTT.OBLIGATORIO_SN = 'SI'
   and COMPTT.COMPRT_ID = P_COMPRT_ID
   and com_pkg.obtn_comdoc_no_fmt ( p_segorg_id => COMPDT.SEGORG_ID
                                  , p_comprv_id => P_COMPRV_ID
                                  , p_compdt_id => COMPDT.id  ) in ('NO PRESENTADO','VENCIDO')
-- and compde.ID = com_pkg.obtn_compde_id (compdt.ID)
   ;
   --
--   v_cant_doc_rub     number(12);
   v_cant_doc_prt     number(12);
   V_COMPRV           COM_PROVEEDORES%ROWTYPE;
   --
BEGIN
   --
--   v_cant_doc_rub   := 0;
   v_cant_doc_prt   := 0;
   --
   COM_PKG.SET_COMPRV(P_COMPRV_ID);
   COM_PKG.GET_COMPRV(P_COMPRV => V_COMPRV);
   --
   open cur_pdt_prt (V_COMPRV.COMPRT_ID);
   fetch cur_pdt_prt into v_cant_doc_prt;
   close cur_pdt_prt;
   --
   --open cur_pdt_rub;
   --fetch cur_pdt_rub into v_cant_doc_rub;
   --close cur_pdt_rub;
   --
   --return v_cant_doc_rub + v_cant_doc_prt;
   --
   return v_cant_doc_prt;
END;
/* Obtener el ultimo documento presentado para un proveedor y tipo de doc */
FUNCTION OBTN_COMPDO_PDTPRV
 (P_COMPRV_ID IN NUMBER
 ,P_COMPDT_ID IN NUMBER
 )
 RETURN NUMBER
 IS
-- Obtener el ultimo documento presentado
 -- para un proveedor y tipo de documento dado
 -- cuyo tipo de documento se encuentre habilitado
 -- y cuyo documento se encuentre activo
 cursor cr_dat is
 select max(compdo.ID)
 from com_proveedores_doc compdo
     ,com_proveedores_dot compdt
 where compdo.compdt_id = compdt.id
   and compdo.comprv_id = p_comprv_id
   and compdo.compdt_id = p_compdt_id
   and compdo.situacion = 'ACT'
   and compdt.compde_estado = 'HAB'
   and compdo.fecha_vencimiento =(select max(a.fecha_vencimiento)
                                    from com_proveedores_doc a
                                        ,com_proveedores_dot b
                                   where a.comprv_id = compdo.comprv_id --p_comprv_id
                                     and a.compdt_id = compdo.compdt_id --p_compdt_id
                                     and a.compdt_id = b.id
                                     and a.situacion = 'ACT'
                                     --
                                     and b.compde_estado = 'HAB');
  --
  v_retorno number;
begin
  --
  open cr_dat;
  fetch cr_dat into v_retorno;
  close cr_dat;
  --
  return v_retorno;
/*
carlos tissera 09/01/17
-----------------------------------------------------------------
 select max(a1.ID)
 from com_proveedores_doc a1
     ,com_proveedores_dte b1
 where a1.comprv_id = p_comprv_id
   and a1.compdt_id = p_compdt_id
   and a1.compdt_id = b1.compdt_id
   and a1.situacion = 'ACT'
   --
   and b1.id = COM_PKG.OBTN_COMPDE_ID(a1.compdt_id)
   and b1.estado = 'HAB'
   --
   and a1.fecha_vencimiento =
          (select max(a.fecha_vencimiento)
           from com_proveedores_doc a
               ,com_proveedores_dte b
           where a.comprv_id = p_comprv_id
             and a.compdt_id = p_compdt_id
             and a.compdt_id = b.compdt_id
             and a.situacion = 'ACT'
             --
             and b.id = COM_PKG.OBTN_COMPDE_ID(a.compdt_id)
             and b.estado = 'HAB')
             --
  ;
-----------------------------------------------------------------
    select max(a1.ID)
    from com_proveedores_doc a1
      ,com_proveedores_dte b1
    where a1.comprv_id = p_comprv_id
    and a1.compdt_id = p_compdt_id
    and a1.compdt_id = b1.compdt_id
    and a1.situacion = 'ACT'
    and b1.id = p_compde_id
    and b1.estado = 'HAB'
    and a1.fecha_vencimiento =(select max(a.fecha_vencimiento)
                                 from com_proveedores_doc a
                                     ,com_proveedores_dte b
                                where a.comprv_id = a1.comprv_id --p_comprv_id
                                  and a.compdt_id = a1.compdt_id --p_compdt_id
                                  and a.compdt_id = b.compdt_id
                                  and a.situacion = 'ACT'
                                  and b.id = b1.id --p_compde_id
                                  and b.estado = 'HAB');

-----------------------------------------------------------------
 select max(a1.id)
 from com_proveedores_doc a1
     ,com_proveedores_dte b1
 where a1.comprv_id = p_comprv_id
   and a1.compdt_id = p_compdt_id
   and a1.compdt_id = b1.compdt_id
   and a1.situacion = 'ACT'
   and b1.id = COM_PKG.OBTN_COMPDE_ID(a1.compdt_id)
   and b1.estado = 'HAB'
   and a1.fecha_presentacion =
          (select max(a.fecha_presentacion)
           from com_proveedores_doc a
               ,com_proveedores_dte b
           where a.comprv_id = p_comprv_id
             and a.compdt_id = p_compdt_id
             and a.compdt_id = b.compdt_id
             and a.situacion = 'ACT'
             and b.id = COM_PKG.OBTN_COMPDE_ID(a.compdt_id)
             and b.estado = 'HAB');

*/
end;
/* Saber si el proveedor tiene la documentacion al dia o no. */
FUNCTION OBTN_DOC_AL_DIA_SN
 (P_SEGORG_ID IN NUMBER
 ,P_COMPRV_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
CURSOR cr_compdt IS
(select COMPDT.ID
 from COM_COMPDT_COMPRT    COMPTT
     ,COM_PROVEEDORES_DOT  COMPDT
     ,COM_PROVEEDORES      COMPRV
where COMPTT.COMPDT_ID = COMPDT.ID
and COMPDT.TIPO = 'GEN'
and COMPTT.OBLIGATORIO_SN = 'SI'
and COMPRV.COMPRT_ID = COMPTT.COMPRT_ID
and COMPRV.ID = p_comprv_id
and com_pkg.obtn_comdoc_no_fmt ( p_segorg_id => COMPDT.SEGORG_ID
                               , P_COMPRV_ID => p_comprv_id
                               , p_compdt_id => COMPDT.id  ) in ('NO PRESENTADO','VENCIDO')
union all
select prvrub.comrub_id
from COM_PROVEEDORES_RUB    PRVRUB
where PRVRUB.COMPRV_ID = p_comprv_id
and   PRVRUB.SITUACION ='ACT'
and   COMPRV_PKG.COMPRV_COMRUB_COTIZAR_SN(P_COMPRV_ID => p_comprv_id
                                ,p_comrub_id => prvrub.comrub_ID
                                ,p_fecha     => sysdate) = 'NO');
   --
   v_compdt    com_proveedores_dot%ROWTYPE;
   v_compdt_id number;
BEGIN
   open cr_compdt;
   fetch cr_compdt into v_compdt_id;
   close cr_compdt;
   --
   if v_compdt_id is null then
      return 'SI';
   else
      return 'NO';
   end if;
   --
END;
FUNCTION OBTN_COMPDE_ID
 (P_COMPDT_ID IN NUMBER
 )
 RETURN NUMBER
 IS
cursor cr_dat is
  select max(a.id)
  from com_proveedores_dte a
  where a.compdt_id = p_compdt_id
    and a.fecha = (select max(b.fecha)
                   from com_proveedores_dte b
                   where b.compdt_id = p_compdt_id);
   v_retorno number;
begin
   open cr_dat;
   fetch cr_dat into v_retorno;
   close cr_dat;
   --
   return (v_retorno);
   --
end;
/* Obtener el estado de la documentacion del proveedor. */
FUNCTION OBTN_COMDOC_EST_HIS
 (P_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
-- documentos presentados por proveedor
CURSOR cr_compdo IS
select *
from com_proveedores_doc
where id = p_id;
--
v_retorno   VARCHAR2(20);
v_compdo    com_proveedores_doc%ROWTYPE;
--
BEGIN
   --
   -- obtengo los datos del documento si es que esta presentado
   OPEN cr_compdo;
   FETCH cr_compdo INTO v_compdo;
   if cr_compdo%NOTFOUND THEN
      return '<font color="red"><b>NO PRESENTADO</b></font>';
   end if;
   CLOSE cr_compdo;
   --
   if v_compdo.situacion = 'BAJ' then
      return '<font><b>DADO DE BAJA</b></font>';
   end if;
   --
   if nvl(v_compdo.fecha_vencimiento, sysdate + 1 ) < sysdate then
      return '<font color="red"><b>VENCIDO hacen ' || to_char(round(sysdate - v_compdo.fecha_vencimiento,0)) ||' dias</b></font>';
   end if;
   --
   RETURN '<font color="green"><b>VIGENTE</b></font>';
END;
/* Obtener la fecha de vencimiento de un documento. */
FUNCTION OBTN_FECHA_VENC_DOC
 (P_SEGORG_ID IN NUMBER
 ,P_COMPDT_ID IN NUMBER
 ,P_FECHA_EMISION IN VARCHAR2
 )
 RETURN VARCHAR2
 IS
--
-- tipos de documentos
CURSOR cr_compdt IS
select *
from com_proveedores_dot COMPDT
where COMPDT.id = p_compdt_id
and COMPDT.segorg_id = p_segorg_id;
--and situacion = 'HAB';
--
v_retorno         VARCHAR2(20);
v_compdt          com_proveedores_dot%ROWTYPE;
v_meses           integer;
V_FECHA_EMISION   DATE;
V_RET             VARCHAR2(50);
V_RET_DATE        DATE;
--
BEGIN
   --
   -- Verificamos que existe el tipo de Documento
   --
   OPEN cr_compdt;
   FETCH cr_compdt INTO v_compdt;
   if cr_compdt%NOTFOUND THEN
      return P_FECHA_EMISION || ' - ' || p_compdt_id;
   end if;
   CLOSE cr_compdt;
   --
   V_FECHA_EMISION := TO_DATE(P_FECHA_EMISION, 'dd/mm/yyyy');
   --
   IF v_compdt.DURACION_TIPO = 'AÑO' THEN
      v_meses := v_compdt.DURACION_VALOR * 12;
      V_RET_DATE := add_months(V_FECHA_EMISION , v_meses);
   ELSIF v_compdt.DURACION_TIPO = 'MES' THEN
      v_meses := v_compdt.DURACION_VALOR;
      V_RET_DATE := add_months(V_FECHA_EMISION, v_meses);
   ELSIF v_compdt.DURACION_TIPO = 'DIA' THEN
      V_RET_DATE := V_FECHA_EMISION + (v_compdt.DURACION_VALOR);
   END IF;
   --
   V_RET := TO_CHAR(V_RET_DATE, 'dd/mm/yyyy');
   --
   RETURN V_RET;
   --
END;
/* Obtener el estado de la documentacion del proveedor. */
FUNCTION OBTN_COMDOC_NO_FMT
 (P_SEGORG_ID IN NUMBER
 ,P_COMPRV_ID IN NUMBER
 ,P_COMPDT_ID IN NUMBER
 ,P_FECHA IN DATE := SYSDATE
 )
 RETURN VARCHAR2
 IS
-- proveedores
CURSOR cr_comprv IS
select *
from com_proveedores
where id = p_comprv_id;
--
-- tipos de documentos
CURSOR cr_compdt IS
select *
from com_proveedores_dot
where id = p_compdt_id
--and situacion = 'HAB'
;
--
CURSOR cr_comptt (p_comprt_id number) IS
select *
from com_compdt_comprt
where  COMPRT_ID = p_comprt_id
and COMPDT_ID = p_compdt_id;
--
CURSOR cr_comtdr IS
select 1
from com_compdt_comrub comtdr
   , com_proveedores_rub  comprr
where comtdr.COMPDT_ID = p_compdt_id
  and comtdr.comrub_id = comprr.comrub_id
  and comprr.comprv_id = p_comprv_id
  and comprr.situacion = 'ACT';

--
-- documentos presentados por proveedor
CURSOR cr_compdo IS
select *
from com_proveedores_doc
where comprv_id = p_comprv_id
and compdt_id = p_compdt_id
and situacion = 'ACT'
order by fecha_vencimiento desc;
--
v_dummy     number;
v_retorno   VARCHAR2(20);
v_comprv    com_proveedores%ROWTYPE;
v_comprr    com_proveedores_rub%ROWTYPE;
v_compdt    com_proveedores_dot%ROWTYPE;
v_compde_vld com_proveedores_dte%ROWTYPE;
v_comprt_id  number;
v_comptt  cr_comptt%rowtype;
v_compdo  cr_compdo%rowtype;
v_fecha_actual    date;
--
BEGIN
   -- Verificamos si existe el proveedor
   OPEN cr_comprv;
   FETCH cr_comprv INTO v_comprv;
   if cr_comprv%NOTFOUND THEN
      raise_application_error(-20000 , 'El Proveedor especificado no existe' , true);
   end if;
   CLOSE cr_comprv;
   --
   -- Verificamos que exista el tipo de Documento
   OPEN cr_compdt;
   FETCH cr_compdt INTO v_compdt;
   if cr_compdt%NOTFOUND THEN
      --raise_application_error(-20000 , 'Error al buscar Documentos NO presentados. El Tipo de Documento especificado no existe. ' || to_char(p_compdt_id) , true);
      return 'INEXISTENTE';
   else
      -- Carlos Tissera 09/01/17
      --COMPDE_SET(p_id => COM_PKG.OBTN_COMPDE_ID(p_compdt_id => p_compdt_id));
      --COMPDE_GET(p_compde => v_compde_vld);
      --COMPDE_INI;
      --if v_compde_vld.ESTADO = 'SUS' then
      if v_compdt.compde_estado = 'SUS' then
         return 'SUSPENDIDO';
      end if;

      --if v_compdt.situacion = 'SUS' then
      --   return 'SUSPENDIDO';
      --end if;
   end if;
   CLOSE cr_compdt;
   --
   -- obtengo los datos del tipo de documento
   --OPEN cr_compdt;
   --FETCH cr_compdt INTO v_compdt;
   --CLOSE cr_compdt;
   --
   -- Verifico que el tipo de documento corresponda al tipo de proveedor
   OPEN cr_comptt(v_comprv.comprt_id);
   FETCH cr_comptt INTO v_comptt;
   if cr_comptt%NOTFOUND THEN
      return 'NO RELACIONADO';
   end if;
   CLOSE cr_comptt;
   --
   -- Si el tipo de documento es RUBRO verifique que se encuentre configurado para algun rubro del proveedor
   if v_compdt.tipo = 'RUB' then
     OPEN cr_comtdr;
     FETCH cr_comtdr INTO v_dummy;
     if cr_comtdr%NOTFOUND THEN
        return 'NO RELACIONADO';
     end if;
     CLOSE cr_comtdr;
   end if;
   --
   -- obtengo los datos del documento si es que esta presentado
   OPEN cr_compdo;
   FETCH cr_compdo INTO v_compdo;
   if cr_compdo%NOTFOUND THEN
      return 'NO PRESENTADO';
   end if;
   CLOSE cr_compdo;
   --
   v_fecha_actual := to_char(trunc(p_fecha));
   --
   if v_compdt.TIPO_DURACION in ('SIN','NOD') then
     return 'VIGENTE';
   else
     if nvl(v_compdo.FECHA_VENCIMIENTO, v_fecha_actual+1) < v_fecha_actual then
        return 'VENCIDO';
     end if;
   end if;
   --
   RETURN 'VIGENTE';
END;
/* Obtener el estado de la documentacion del proveedor. */
FUNCTION OBTN_COMDOC_ESTADO
 (P_SEGORG_ID IN NUMBER
 ,P_COMPRV_ID IN NUMBER
 ,P_COMPDT_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
-- proveedores
CURSOR cr_comprv IS
select *
from com_proveedores
where id = p_comprv_id;
--
-- tipos de documentos
CURSOR cr_compdt IS
select *
from com_proveedores_dot
where id = p_compdt_id;
--and situacion = 'HAB';
--
-- documentos presentados por proveedor
CURSOR cr_compdo IS
select *
from com_proveedores_doc
where comprv_id = p_comprv_id
and compdt_id = p_compdt_id
and situacion = 'ACT'
order by fecha_vencimiento desc;
--
v_retorno   VARCHAR2(20);
v_comprv    com_proveedores%ROWTYPE;
v_comprr    com_proveedores_rub%ROWTYPE;
v_compdt    com_proveedores_dot%ROWTYPE;
v_compde_vld com_proveedores_dte%ROWTYPE;
v_fecha_actual date;
v_compdo_prv    com_proveedores_doc%rowtype;
--
BEGIN
   --
   -- Verificamos si existe el proveedor
   OPEN cr_comprv;
   FETCH cr_comprv INTO v_comprv;
   if cr_comprv%NOTFOUND THEN
      raise_application_error(-20000 , 'El Proveedor especificado no existe' , true);
   end if;
   CLOSE cr_comprv;
   --
   -- Verificamos que exista el tipo de Documento

   OPEN cr_compdt;
   FETCH cr_compdt INTO v_compdt;
   if cr_compdt%NOTFOUND THEN
      return null;
      --raise_application_error(-20000 , 'Error al Obtener Estado. El Tipo de Documento especificado no existe. ' || to_char(p_compdt_id) , true);
   end if;

   CLOSE cr_compdt;
   -- carlos tissera 09/01/17
   --COMPDE_SET(p_id => com_pkg.OBTN_COMPDE_ID(p_compdt_id => p_compdt_id));
   --COMPDE_GET(p_compde => v_compde_vld);
   --COMPDE_INI;
   --if v_compde_vld.ESTADO = 'SUS' then
   if v_compdt.compde_estado = 'SUS' then
      return '<font color="black"><b>SUSPENDIDO</b></font>';
   end if;
   --
   --
   -- obtengo los datos del documento si es que esta presentado
   OPEN cr_compdo;
   FETCH cr_compdo INTO v_compdo_prv;
   if cr_compdo%NOTFOUND THEN
      return '<font color="red"><b>NO PRESENTADO</b></font>';
   end if;
   CLOSE cr_compdo;
   --
   if v_compdt.TIPO_DURACION in ('SIN','NOD') then
     return '<font color="green"><b>VIGENTE</b></font>';
   else
     v_fecha_actual := to_char(trunc(sysdate));
     if nvl(v_compdo_prv.FECHA_VENCIMIENTO, v_fecha_actual + 1) < v_fecha_actual then
        if trunc(sysdate) - trunc(v_compdo_prv.fecha_vencimiento) > 1 then
          return '<font color="red"><b>VENCIDO hace ' || to_char(round(sysdate - v_compdo_prv.fecha_vencimiento,0)) ||' dias</b></font>';
        elsif trunc(sysdate) - trunc(v_compdo_prv.fecha_vencimiento) = 1  then
          return '<font color="red"><b>VENCIDO Ayer</b></font>';
       -- elsif round(sysdate - v_compdo.fecha_vencimiento+1,0) = 0 then
       --   return '<font color="red"><b>VENCIDO Ahora</b></font>';
        end if;
     end if;
   end if;
   --
   return '<font color="green"><b>VIGENTE</b></font>';
end;
/* Determinar si un tipo de documento es obligatorio */
FUNCTION OBTN_COMPDT_OBL_SN
 (P_COMPRV_ID IN NUMBER
 ,P_COMPDT_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
CURSOR cr_comptt (p_comprt_id number) IS
 select *
 from com_compdt_comprt
 where comprt_id = p_comprt_id
   and compdt_id = p_compdt_id;
 --
 CURSOR cr_comprr IS
 select *
 from com_proveedores_rub
 where comprv_id = p_comprv_id
 and situacion = 'ACT'
 and fecha_vigencia <= sysdate
 and fecha_validez is null ;
 --
 CURSOR cr_comtdr (p_comrub_id number) IS
 select *
 from com_compdt_comrub
 where comrub_id = p_comrub_id
   and compdt_id = p_compdt_id
   and OBLIGATORIO_SN = 'SI';
 --
 v_comprv    com_proveedores%ROWTYPE;
 v_compdt    com_proveedores_dot%ROWTYPE;
 v_compde    com_proveedores_dte%ROWTYPE;
 v_comptt    com_compdt_comprt%ROWTYPE;
 v_comtdr    com_compdt_comrub%ROWTYPE;
 v_dummy     number:=0;
 --
BEGIN
 --
 -- carlos tissera 09/01/17
 -- Obtener los datos del tipo de documento
 COM_PKG.COMPDT_SET(p_id => p_compdt_id);
 COM_PKG.COMPDT_GET(p_compdt => v_compdt);
 COM_PKG.COMPDT_INI;
 -- Obtener el estado del tipo de documento
 --COM_PKG.COMPDE_SET(p_id => OBTN_COMPDE_ID(p_compdt_id => p_compdt_id));
 --COM_PKG.COMPDE_GET(p_compde => v_compde);
 --COM_PKG.COMPDE_INI;
 --
 --if v_compde.estado <> 'HAB' then
 if v_compdt.compde_estado <> 'HAB' then
    return 'NO';
 end if;
 --
 -- Obtener los datos del proveedor
 COM_PKG.SET_COMPRV(p_id     => p_comprv_id);
 COM_PKG.GET_COMPRV(p_comprv => v_comprv);
 COM_PKG.INI_COMPRV;
 -- Verificar si el tipo de proveedor se encuentra configurado
 -- para el tipo de documento dado
 open cr_comptt(p_comprt_id => v_comprv.comprt_id);
 fetch cr_comptt into v_comptt;
 close cr_comptt;
 --
 if v_comptt.id is null or
    (v_comptt.OBLIGATORIO_SN = 'NO' and v_compdt.TIPO = 'GEN') then
    return 'NO';
 end if;
 if v_comptt.id is not null and v_comptt.OBLIGATORIO_SN = 'SI' and v_compdt.TIPO = 'GEN' then
    return 'SI';
 end if;
 --
 if v_comptt.id is not null and v_compdt.TIPO = 'RUB' then
   for v_comprr in cr_comprr loop
     -- Verificar si existe algun rubro obligatorio asociado
     -- al Rubro del proveedor para el tipo de documento dado
     OPEN cr_comtdr(p_comrub_id => v_comprr.comrub_id);
     FETCH cr_comtdr INTO v_comtdr;
     if cr_comtdr%found then
        close cr_comtdr;
        v_dummy := 1;
        exit;
     end if;
     close cr_comtdr;
     --
   end loop;
   --
   if v_dummy = 1 then
     return 'SI';
   end if;
 end if;
 --
 return 'NO';
 --
END;
/* Obtener el numero de Adjudicacion de su numerador */
FUNCTION OBTN_COMADJ_NUMERO
 (P_SEGORG_ID IN NUMBER
 ,P_EJERCICIO IN NUMBER
 )
 RETURN NUMBER
 IS
v_query VARCHAR2(2000);
  v_retorno NUMBER := null;
BEGIN
  -- Verificar parametros obligatorios
  if p_segorg_id is null then
     raise_application_error(-20000,'La Organización no ha sido indicada y es un dato obligatorio',true);
  elsif p_ejercicio is null then
     raise_application_error(-20000,'El Ejercicio no ha sido indicado y es un dato obligatorio',true);
  end if;
  -- Verificar que el Ejercicio indicado es correcto
  SET_COMEJE_EJERCICIO(p_segorg_id => p_segorg_id, p_ejercicio => p_ejercicio);
  --
  if v_comeje.ID is null then
    raise_application_error(-20000,'El Ejercicio indicado es incorrecto',true);
  end if;
  -- Verificar que el Pedido posea secuencia asignada
  if v_comeje.NUMERADOR_COMADJ is null then
    raise_application_error(-20000,'El Ejercicio indicado no tiene definido el Numerador para Adjudicaciones',true);
  end if;
  -- Obtener el numero de la secuencia asignada al Pedido
  v_query := 'SELECT '||v_comeje.NUMERADOR_COMADJ||'.NEXTVAL FROM DUAL';
  EXECUTE IMMEDIATE v_query INTO v_retorno;
  --
  if v_retorno is null then
    raise_application_error(-20000,'El Numerador para Adjudicaciones definido para el Ejercicio indicado no ha sido creado',true);
  end if;
  --
  INI_COMEJE;
  RETURN v_retorno;
  --
END;
/* Obtener el numero de Proceso de su numerador */
FUNCTION OBTN_COMCON_NUMERO
 (P_SEGORG_ID IN NUMBER
 ,P_EJERCICIO IN NUMBER
 )
 RETURN NUMBER
 IS
v_query VARCHAR2(2000);
  v_retorno NUMBER := null;
BEGIN
  -- Verificar parametros obligatorios
  if p_segorg_id is null then
     raise_application_error(-20000,'La Organización no ha sido indicada y es un dato obligatorio',true);
  elsif p_ejercicio is null then
     raise_application_error(-20000,'El Ejercicio no ha sido indicado y es un dato obligatorio',true);
  end if;
  -- Verificar que el Ejercicio indicado es correcto
  SET_COMEJE_EJERCICIO(p_segorg_id => p_segorg_id, p_ejercicio => p_ejercicio);
  --
  if v_comeje.ID is null then
    raise_application_error(-20000,'El Ejercicio indicado es incorrecto',true);
  end if;
  -- Verificar que el Pedido posea secuencia asignada
  if v_comeje.NUMERADOR_COMCON is null then
    raise_application_error(-20000,'El Ejercicio indicado no tiene definido el Numerador para Procesos de Contratación',true);
  end if;
  -- Obtener el numero de la secuencia asignada al Pedido
  v_query := 'SELECT '||v_comeje.NUMERADOR_COMCON||'.NEXTVAL FROM DUAL';
  EXECUTE IMMEDIATE v_query INTO v_retorno;
  --
  if v_retorno is null then
    raise_application_error(-20000,'El Numerador para Procesos de Contratación definido para el Ejercicio indicado no ha sido creado',true);
  end if;
  --
  INI_COMEJE;
  RETURN v_retorno;
  --
END;
/* Obtener el numero de Cotización de su numerador */
FUNCTION OBTN_COMCTZ_NUMERO
 (P_SEGORG_ID IN NUMBER
 ,P_EJERCICIO IN NUMBER
 )
 RETURN NUMBER
 IS
v_query VARCHAR2(2000);
  v_retorno NUMBER := null;
BEGIN
  -- Verificar parametros obligatorios
  if p_segorg_id is null then
     raise_application_error(-20000,'La Organización no ha sido indicada y es un dato obligatorio',true);
  elsif p_ejercicio is null then
     raise_application_error(-20000,'El Ejercicio no ha sido indicado y es un dato obligatorio',true);
  end if;
  -- Verificar que el Ejercicio indicado es correcto
  SET_COMEJE_EJERCICIO(p_segorg_id => p_segorg_id, p_ejercicio => p_ejercicio);
  --
  if v_comeje.ID is null then
    raise_application_error(-20000,'El Ejercicio indicado es incorrecto',true);
  end if;
  -- Verificar que el Pedido posea secuencia asignada
  if v_comeje.NUMERADOR_COMCTZ is null then
    raise_application_error(-20000,'El Ejercicio indicado no tiene definido el Numerador para Cotizaciones',true);
  end if;
  -- Obtener el numero de la secuencia asignada al Pedido
  v_query := 'SELECT '||v_comeje.NUMERADOR_COMCTZ||'.NEXTVAL FROM DUAL';
  EXECUTE IMMEDIATE v_query INTO v_retorno;
  --
  if v_retorno is null then
    raise_application_error(-20000,'El Numerador para Cotizaciones definido para el Ejercicio indicado no ha sido creado',true);
  end if;
  --
  INI_COMEJE;
  RETURN v_retorno;
  --
END;
/* Obtener el numero de Ordenes de Compra de su numerador */
FUNCTION OBTN_COMOCM_NUMERO
 (P_SEGORG_ID IN NUMBER
 ,P_EJERCICIO IN NUMBER
 )
 RETURN NUMBER
 IS
v_query VARCHAR2(2000);
  v_retorno NUMBER := null;
BEGIN
  -- Verificar parametros obligatorios
  if p_segorg_id is null then
     raise_application_error(-20000,'La Organización no ha sido indicada y es un dato obligatorio',true);
  elsif p_ejercicio is null then
     raise_application_error(-20000,'El Ejercicio no ha sido indicado y es un dato obligatorio',true);
  end if;
  -- Verificar que el Ejercicio indicado es correcto
  SET_COMEJE_EJERCICIO(p_segorg_id => p_segorg_id, p_ejercicio => p_ejercicio);
  --
  if v_comeje.ID is null then
    raise_application_error(-20000,'El Ejercicio indicado es incorrecto',true);
  end if;
  -- Verificar que el Pedido posea secuencia asignada
  if v_comeje.NUMERADOR_COMOCM is null then
    raise_application_error(-20000,'El Ejercicio indicado no tiene definido el Numerador para Ordenes de Compra',true);
  end if;
  -- Obtener el numero de la secuencia asignada al Pedido
  v_query := 'SELECT '||v_comeje.NUMERADOR_COMOCM||'.NEXTVAL FROM DUAL';
  EXECUTE IMMEDIATE v_query INTO v_retorno;
  --
  if v_retorno is null then
    raise_application_error(-20000,'El Numerador para Ordenes de Compra definido para el Ejercicio indicado no ha sido creado',true);
  end if;
  --
  INI_COMEJE;
  RETURN v_retorno;
  --
END;
/* Obtener el numero de Pedido de su numerador */
FUNCTION OBTN_COMPED_NUMERO
 (P_SEGORG_ID IN NUMBER
 ,P_EJERCICIO IN NUMBER
 )
 RETURN NUMBER
 IS
v_query VARCHAR2(2000);
  v_retorno NUMBER := null;
BEGIN
  -- Verificar parametros obligatorios
  if p_segorg_id is null then
     raise_application_error(-20000,'La Organización no ha sido indicada y es un dato obligatorio',true);
  elsif p_ejercicio is null then
     raise_application_error(-20000,'El Ejercicio no ha sido indicado y es un dato obligatorio',true);
  end if;
  -- Verificar que el Ejercicio indicado es correcto
  SET_COMEJE_EJERCICIO(p_segorg_id => p_segorg_id, p_ejercicio => p_ejercicio);
  --
  if v_comeje.ID is null then
    raise_application_error(-20000,'El Ejercicio indicado es incorrecto',true);
  end if;
  -- Verificar que el Pedido posea secuencia asignada
  if v_comeje.NUMERADOR_COMPED is null then
    raise_application_error(-20000,'El Ejercicio indicado no tiene definido el Numerador para Pedidos',true);
  end if;
  -- Obtener el numero de la secuencia asignada al Pedido
  v_query := 'SELECT '||v_comeje.NUMERADOR_COMPED||'.NEXTVAL FROM DUAL';
  EXECUTE IMMEDIATE v_query INTO v_retorno;
  --
  if v_retorno is null then
    raise_application_error(-20000,'El Numerador para Pedidos definido para el Ejercicio indicado no ha sido creado',true);
  end if;
  --
  INI_COMEJE;
  RETURN v_retorno;
  --
END;
/* Obtener el Id del estado anterior al actual de la contratación */
FUNCTION OBTN_COMCOE_ANT_ID
 (P_COMCON_ID IN NUMBER
 )
 RETURN NUMBER
 IS
CURSOR cr_comcoe IS
  SELECT MAX(COMCOE.ID) ID
  FROM COM_CONTRATACIONES_EST COMCOE
  WHERE COMCOE.COMCON_ID = p_comcon_id
    AND COMCOE.ID < COM_PKG.OBTN_COMCOE_ID(p_comcon_id);
  --
  v_retorno NUMBER;
  --
BEGIN
  --
  OPEN cr_comcoe;
  FETCH cr_comcoe INTO v_retorno;
  CLOSE cr_comcoe;
  --
  RETURN v_retorno;
  --
END;
/* Obtener si un  Pedido contiene todos los Items con Precio Testigo */
FUNCTION OBTN_COMPED_CTP_SN
 (P_COMCON_ID IN COM_CONTRATACIONES.ID%TYPE
 )
 RETURN VARCHAR2
 IS
-- Pedidos en la Contratacion
  CURSOR cr_comcot IS
  SELECT comcot.COMPED_ID
  FROM COM_CONTRATACIONES_DETALLES comcot
  WHERE comcot.COMCON_ID = p_comcon_id;
  -- Detalle de cada pedido
  CURSOR cr_compet (p_comped_id IN NUMBER) IS
  SELECT PRECIO_UNITARIO
        ,COMCIT_ID
  FROM COM_PEDIDOS_DETALLES compet
  WHERE compet.COMPED_ID = p_comped_id;
  --
  -- Obtengo Precio Testigo Vigente
  CURSOR cr_comcap (p_comcit_id IN NUMBER) IS
  SELECT PRECIO
  FROM COM_CATALOGO_PRECIOS comcap
  WHERE comcap.ID = COM_PKG.obtn_comctp_id(p_comcit_id);
  --
  v_comcoe COM_CONTRATACIONES_EST%rowtype;
  v_comcap cr_comcap%rowtype;
BEGIN
  --
  FOR v_comcot IN cr_comcot LOOP
    --
    FOR v_compet IN cr_compet (p_comped_id => v_comcot.COMPED_ID) LOOP
      --
    BEGIN
       IF v_compet.comcit_id IS NULL
        THEN RETURN ('NO');
       ELSE
        -- Si Existe, Obtengo el Precio Testigo del Item
        OPEN cr_comcap (p_comcit_id => v_compet.comcit_id);
        FETCH cr_comcap INTO v_comcap;
        CLOSE cr_comcap;
        --
        IF v_comcap.PRECIO IS NULL
          THEN RETURN ('NO');
        END IF;
        --
       END IF;
      END;
      --
    END LOOP;
    --
  END LOOP;
  --
  RETURN ('SI');
  --
END;
FUNCTION OBTN_COMPARATIVA_CTP
 (P_PRECIO_COTIZADO IN NUMBER
 ,P_PRECIO_TESTIGO IN NUMBER
 )
 RETURN INTEGER
 IS
v_tolerancia NUMBER := 1+(TO_NUMBER(SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo    => 'COMADM_CONGES_TOLERANCIA'
                                                         ,p_segorg_id => SEG_PKG.OBTN_ORGUSU(nvl(v('APP_USER'),user))))/100);
BEGIN
   --
    IF (P_PRECIO_COTIZADO) > (P_PRECIO_TESTIGO*v_tolerancia) THEN
      --
      RETURN (1);
      --
    END IF;
        --
    IF (P_PRECIO_COTIZADO) <= (P_PRECIO_TESTIGO*v_tolerancia) AND (p_PRECIO_COTIZADO) > (P_PRECIO_TESTIGO) THEN
      --
      RETURN (0);
      --
    END IF;
        --
    IF P_PRECIO_COTIZADO <= P_PRECIO_TESTIGO THEN
      --
      RETURN (-1);
      --
    END IF;
  --
END;
/* Obtener Diferencias de Precios Testigos Vigentes en Pedidos */
FUNCTION OBTN_COMPED_DIF_CTP
 (P_COMCON_ID IN COM_CONTRATACIONES.ID%TYPE
 )
 RETURN VARCHAR2
 IS
-- Pedidos en la Contratacion
  CURSOR cr_comcot IS
  SELECT comcot.COMPED_ID
  FROM COM_CONTRATACIONES_DETALLES comcot
  WHERE comcot.COMCON_ID = p_comcon_id;
  -- Detalle de cada pedido
  CURSOR cr_compet (p_comped_id IN NUMBER) IS
  SELECT PRECIO_UNITARIO
        ,COMCIT_ID
  FROM COM_PEDIDOS_DETALLES compet
  WHERE compet.COMPED_ID = p_comped_id;
  --
  -- Obtengo Precio Testigo Vigente
  CURSOR cr_comcap (p_comcit_id IN NUMBER) IS
  SELECT PRECIO
  FROM COM_CATALOGO_PRECIOS comcap
  WHERE comcap.ID = COM_PKG.obtn_comctp_id(p_comcit_id);
  --
  v_comcoe COM_CONTRATACIONES_EST%rowtype;
  v_comcap cr_comcap%rowtype;
BEGIN
  --
  FOR v_comcot IN cr_comcot LOOP
    --
    FOR v_compet IN cr_compet (p_comped_id => v_comcot.COMPED_ID) LOOP
      --
      BEGIN

       OPEN cr_comcap (p_comcit_id => v_compet.comcit_id);
       FETCH cr_comcap INTO v_comcap;
       CLOSE cr_comcap;
       --
        IF v_compet.PRECIO_UNITARIO <> v_comcap.PRECIO THEN
          -- Retorno que Existe al menos una diferencia
          RETURN ('SI');
          --
        END IF;
        --
      END;
      --
    END LOOP;
    --
  END LOOP;
  --
  RETURN ('NO');
  --
END;
/* Obtener valor Cantidad Operaciones Adjudicadas */
FUNCTION OBTN_VALOR_COP
 (P_COMRUB_ID IN COM_REPUTACION_RUBPRV.COMRUB_ID%TYPE
 ,P_COMPRV_ID IN COM_REPUTACION_RUBPRV.COMPRV_ID%TYPE
 ,P_FECHA_MOV_DESDE IN DATE
 ,P_FECHA_MOV_HASTA IN DATE
 )
 RETURN NUMBER
 IS
-- Declaracion de Cursores
CURSOR cr_cursor IS
SELECT  COMRCB.COMRUB_ID
       ,COUNT(DISTINCT COMOCM.ID) AS CANTIDAD_COMOCM_APR
FROM COM_ORDENES_COMPRAS       COMOCM
    ,COM_ORDENES_COMPRAS_EST   COMOCE
    ,COM_PEDIDOS               COMPED
    ,COM_RUBCOB                COMRCB
    ,COM_PROVEEDORES_RUB       COMPRR
WHERE COMOCM.ID        = COMOCE.COMOCM_ID
  AND COMOCM.COMPRV_ID = COMPRR.COMPRV_ID
  AND COMOCM.COMPED_ID = COMPED.ID
  AND COMPED.COMCOB_ID = COMRCB.COMCOB_ID
  AND COMRCB.SITUACION = 'VIG'
  AND(COMOCE.ESTADO    IN ('APR','CON','NOC')
      AND COMOCE.SITUACION = 'VAL'
      AND COMOCE.FECHA BETWEEN P_FECHA_MOV_DESDE AND P_FECHA_MOV_HASTA)
  AND COMRCB.COMRUB_ID = P_COMRUB_ID
  AND COMOCM.COMPRV_ID = P_COMPRV_ID
GROUP BY COMRCB.COMRUB_ID;
--
 v_cr_cursor cr_cursor%ROWTYPE;
 --
BEGIN
   -- Obtener Ordenes Aprobadas
  OPEN cr_cursor;
  FETCH cr_cursor INTO v_cr_cursor;
  CLOSE cr_cursor;
  --
  RETURN v_cr_cursor.CANTIDAD_COMOCM_APR;
END;
/* Obtener valor Cantidad Operaciones Adjudicadas */
FUNCTION OBTN_VALOR_COP_MONTO
 (P_COMRUB_ID IN COM_REPUTACION_RUBPRV.COMRUB_ID%TYPE
 ,P_COMPRV_ID IN COM_REPUTACION_RUBPRV.COMPRV_ID%TYPE
 ,P_MONTO_COP OUT NUMBER
 ,P_FECHA_MOV_DESDE IN DATE
 ,P_FECHA_MOV_HASTA IN DATE
 )
 RETURN NUMBER
 IS
-- Declaracion de Cursores
--
-- Todo lo que esta comentado es como estaba originalmente.
--
CURSOR cr_cursor IS
SELECT  COMRCB.COMRUB_ID
       ,COUNT(DISTINCT COMOCM.ID) AS CANTIDAD_COMOCM_APR
--       ,SUM(COM_PKG.OBTN_COMOCM_TOTAL(COMOCM.ID)) AS MONTO_COP
--      ,SUM(nvl(comocm.monto,0)-nvl(comocm.monto_descuento,0)) AS MONTO_COP  --hubiera sido mejor hacerlo
                                                                              --con esta linea y no con la anterior
                                                                              --que vuelve a acceder a COM_ORDENES_COMPRAS
FROM COM_ORDENES_COMPRAS       COMOCM
--    ,COM_ORDENES_COMPRAS_EST   COMOCE
    ,COM_PEDIDOS               COMPED
    ,COM_RUBCOB                COMRCB
    ,COM_PROVEEDORES_RUB       COMPRR
WHERE COMOCM.COMPRV_ID = COMPRR.COMPRV_ID
--  AND COMOCM.ID        = COMOCE.COMOCM_ID
  AND COMOCM.COMPED_ID = COMPED.ID
  AND COMPED.COMCOB_ID = COMRCB.COMCOB_ID
  AND COMRCB.SITUACION = 'VIG'

--  AND(COMOCE.ESTADO  IN ('APR','CON','NOC')
--  AND COMOCE.SITUACION = 'VAL'
--  AND COMOCE.FECHA BETWEEN P_FECHA_MOV_DESDE AND P_FECHA_MOV_HASTA)

  AND(COMOCM.COMOCE_ESTADO  IN ('APR','CON','NOC')
  AND COMOCM.COMOCE_SITUACION = 'VAL'
  AND COMOCM.COMOCE_FECHA BETWEEN P_FECHA_MOV_DESDE AND P_FECHA_MOV_HASTA)

  AND COMRCB.COMRUB_ID = P_COMRUB_ID
  AND COMOCM.COMPRV_ID = P_COMPRV_ID
GROUP BY COMRCB.COMRUB_ID;
--
 v_cr_cursor cr_cursor%ROWTYPE;
 --
BEGIN
   -- Obtener Ordenes Aprobadas
  OPEN cr_cursor;
  FETCH cr_cursor INTO v_cr_cursor;
  CLOSE cr_cursor;
  --
  --p_MONTO_COP := v_cr_cursor.MONTO_COP;
  --
  RETURN v_cr_cursor.CANTIDAD_COMOCM_APR;
END;
/* Obtener valor Porcentaje del Importe Concretado Positivo */
FUNCTION OBTN_VALOR_PIM
 (P_COMRUB_ID IN COM_REPUTACION_RUBPRV.COMRUB_ID%TYPE
 ,P_COMPRV_ID IN COM_REPUTACION_RUBPRV.COMPRV_ID%TYPE
 ,P_FECHA_MOV_DESDE IN DATE
 ,P_FECHA_MOV_HASTA IN DATE
 )
 RETURN NUMBER
 IS
-- Declaracion de Cursores
CURSOR cr_cursor IS
SELECT COMRCB.COMRUB_ID
      ,SUM(COMADD_CANTIDAD_ADJUDICADA*COMCZD_PRECIO_UNITARIO_FINAL)  AS MONTO_PRV
FROM COM_ORDENES_COMPRAS       COMOCM
    ,com_ordenes_compras_det_v COMOCD
    ,COM_CALIFICACIONES        COMCLF
    ,COM_RUBCOB               COMRCB
WHERE COMOCM.ID        = COMOCD.COMOCM_ID
    AND COMOCM.ID        = COMCLF.COMOCM_ID
   AND COMOCD.COMCOB_ID  = COMRCB.COMCOB_ID
   AND(COMCLF.CALIFICACION = 1
      AND COMCLF.SITUACION = 'VAL'
      AND COMCLF.FECHA BETWEEN P_FECHA_MOV_DESDE AND P_FECHA_MOV_HASTA
      )
     AND COMRCB.COMRUB_ID = P_COMRUB_ID
     AND COMOCM.COMPRV_ID = P_COMPRV_ID
GROUP BY COMRCB.COMRUB_ID
ORDER BY COMRCB.COMRUB_ID,MONTO_PRV ;
--
 v_cursor cr_cursor%ROWTYPE;
 v_monto_COP NUMBER :=0;
 v_valor_COP NUMBER :=0;
 --
BEGIN
   -- Obtener Ordenes Aprobadas
  OPEN cr_cursor;
  FETCH cr_cursor INTO v_cursor;
  CLOSE cr_cursor;
  --
  v_valor_COP := COM_PKG. OBTN_VALOR_COP_MONTO(P_COMRUB_ID => P_COMRUB_ID
                                        ,P_COMPRV_ID => P_COMPRV_ID
                                        ,P_MONTO_COP => V_MONTO_COP
                                        ,P_FECHA_MOV_DESDE => P_FECHA_MOV_DESDE
                                        ,P_FECHA_MOV_HASTA => P_FECHA_MOV_HASTA);
  --
  IF (v_monto_COP IS NOT NULL) AND (v_cursor.MONTO_PRV IS NOT NULL) THEN
    RETURN (v_cursor.MONTO_PRV/nvl(v_monto_COP,1))*100;
  ELSE
    RETURN 0;
  END IF;
  --
END;
/* Obtener Cantidad de  Operaciones Concretadas */
FUNCTION OBTN_VALOR_COC
 (P_COMRUB_ID IN COM_REPUTACION_RUBPRV.COMRUB_ID%TYPE
 ,P_COMPRV_ID IN COM_REPUTACION_RUBPRV.COMPRV_ID%TYPE
 ,P_FECHA_MOV_DESDE IN DATE
 ,P_FECHA_MOV_HASTA IN DATE
 )
 RETURN NUMBER
 IS
-- Declaracion de Cursores
CURSOR cr_cursor_prv IS
SELECT  COMRCB.COMRUB_ID
       ,COUNT(DISTINCT COMOCM.ID) AS CANT_POC_PRV
FROM COM_ORDENES_COMPRAS     COMOCM
    ,COM_ORDENES_COMPRAS_EST COMOCE
    ,COM_PEDIDOS             COMPED
    ,COM_RUBCOB              COMRCB
    ,COM_PROVEEDORES_RUB     COMPRR
WHERE COMOCM.ID        = COMOCE.COMOCM_ID
  AND COMOCM.COMPRV_ID = COMPRR.COMPRV_ID
  AND COMOCM.COMPED_ID = COMPED.ID
  AND COMPED.COMCOB_ID = COMRCB.COMCOB_ID
  AND COMRCB.SITUACION = 'VIG'
  AND(COMOCE.ESTADO    = 'CON'
      AND COMOCE.SITUACION = 'VAL'
      AND COMOCE.FECHA BETWEEN P_FECHA_MOV_DESDE AND P_FECHA_MOV_HASTA)
  AND COMRCB.COMRUB_ID = P_COMRUB_ID
  AND COMOCM.COMPRV_ID = P_COMPRV_ID
GROUP BY COMRCB.COMRUB_ID;
--
 v_cr_POC_PRV cr_cursor_prv%ROWTYPE;
 v_monto_COP NUMBER :=0;
 v_valor_COP NUMBER :=0;
 --
BEGIN
   -- Obtener Ordenes Concretadas
  OPEN cr_cursor_prv;
  FETCH cr_cursor_prv INTO v_cr_POC_PRV;
  CLOSE cr_cursor_prv;
  --
  RETURN v_cr_POC_PRV.CANT_POC_PRV;
  --
EXCEPTION
  WHEN OTHERS THEN
    raise_application_error(-20000,'Error en Obtener Valor COC.', TRUE);
END;
/* Obtener Cantidad de Operaciones Calificadas Negativas */
FUNCTION OBTN_VALOR_COC_NEG
 (P_COMRUB_ID IN COM_REPUTACION_RUBPRV.COMRUB_ID%TYPE
 ,P_COMPRV_ID IN COM_REPUTACION_RUBPRV.COMPRV_ID%TYPE
 ,P_FECHA_MOV_DESDE IN DATE
 ,P_FECHA_MOV_HASTA IN DATE
 )
 RETURN NUMBER
 IS
-- Declaracion de Cursores
CURSOR cr_cursor IS
SELECT  COMRCB.COMRUB_ID
       ,COUNT(DISTINCT COMOCM.ID) AS CANT_COMOCM_NEG
FROM COM_ORDENES_COMPRAS     COMOCM
    ,COM_PEDIDOS             COMPED
    ,COM_RUBCOB              COMRCB
    ,COM_PROVEEDORES_RUB     COMPRR
    ,COM_CALIFICACIONES      COMCLF
WHERE COMOCM.COMPRV_ID = COMPRR.COMPRV_ID
  AND COMOCM.COMPED_ID = COMPED.ID
  AND COMOCM.ID        = COMCLF.COMOCM_ID
  AND COMPED.COMCOB_ID = COMRCB.COMCOB_ID
  AND COMRCB.SITUACION = 'VIG'
  AND(    COMCLF.CALIFICACION = -1
      AND COMCLF.SITUACION = 'VAL'
      AND COMCLF.FECHA BETWEEN P_FECHA_MOV_DESDE AND P_FECHA_MOV_HASTA)
  AND COMRCB.COMRUB_ID = P_COMRUB_ID
  AND COMOCM.COMPRV_ID = P_COMPRV_ID
GROUP BY COMRCB.COMRUB_ID,COMOCM.COMPRV_ID
ORDER BY COMRCB.COMRUB_ID;
--
 v_cursor cr_cursor%ROWTYPE;
 v_monto_COP NUMBER :=0;
 v_valor_COP NUMBER :=0;
 --
BEGIN
   -- Obtener Ordenes Aprobadas
  OPEN cr_cursor;
  FETCH cr_cursor INTO v_cursor;
  CLOSE cr_cursor;
  --
  RETURN v_cursor.CANT_COMOCM_NEG;
  --
END;
/* Obtener Cantidad de Operaciones Calificadas Neutras */
FUNCTION OBTN_VALOR_COC_NEU
 (P_COMRUB_ID IN COM_REPUTACION_RUBPRV.COMRUB_ID%TYPE
 ,P_COMPRV_ID IN COM_REPUTACION_RUBPRV.COMPRV_ID%TYPE
 ,P_FECHA_MOV_DESDE IN DATE
 ,P_FECHA_MOV_HASTA IN DATE
 )
 RETURN NUMBER
 IS
-- Declaracion de Cursores
CURSOR cr_cursor IS
SELECT  COMRCB.COMRUB_ID
       ,COUNT(DISTINCT COMOCM.ID) AS CANT_COMOCM_NEU
FROM COM_ORDENES_COMPRAS     COMOCM
    ,COM_PEDIDOS             COMPED
    ,COM_RUBCOB              COMRCB
    ,COM_PROVEEDORES_RUB     COMPRR
    ,COM_CALIFICACIONES      COMCLF
WHERE COMOCM.COMPRV_ID = COMPRR.COMPRV_ID
  AND COMOCM.COMPED_ID = COMPED.ID
  AND COMOCM.ID        = COMCLF.COMOCM_ID
  AND COMPED.COMCOB_ID = COMRCB.COMCOB_ID
  AND COMRCB.SITUACION = 'VIG'
  AND(    COMCLF.CALIFICACION = 0
      AND COMCLF.SITUACION = 'VAL'
      AND COMCLF.FECHA BETWEEN P_FECHA_MOV_DESDE AND P_FECHA_MOV_HASTA)
  AND COMRCB.COMRUB_ID = P_COMRUB_ID
  AND COMOCM.COMPRV_ID = P_COMPRV_ID
GROUP BY COMRCB.COMRUB_ID,COMOCM.COMPRV_ID
ORDER BY COMRCB.COMRUB_ID;
--
 v_cursor cr_cursor%ROWTYPE;
 v_monto_COP NUMBER :=0;
 v_valor_COP NUMBER :=0;
 --
BEGIN
   -- Obtener Ordenes Aprobadas
  OPEN cr_cursor;
  FETCH cr_cursor INTO v_cursor;
  CLOSE cr_cursor;
  --
  RETURN v_cursor.CANT_COMOCM_NEU;
  --
END;
/* Obtener Cantidad de Operaciones Calificadas Positivas */
FUNCTION OBTN_VALOR_COC_POS
 (P_COMRUB_ID IN COM_REPUTACION_RUBPRV.COMRUB_ID%TYPE
 ,P_COMPRV_ID IN COM_REPUTACION_RUBPRV.COMPRV_ID%TYPE
 ,P_FECHA_MOV_DESDE IN DATE
 ,P_FECHA_MOV_HASTA IN DATE
 )
 RETURN NUMBER
 IS
-- Declaracion de Cursores
CURSOR cr_cursor IS
SELECT  COMRCB.COMRUB_ID
       ,COUNT(DISTINCT COMOCM.ID) AS CANT_COMOCM_POS
FROM COM_ORDENES_COMPRAS     COMOCM
    ,COM_PEDIDOS             COMPED
    ,COM_RUBCOB              COMRCB
    ,COM_PROVEEDORES_RUB     COMPRR
    ,COM_CALIFICACIONES      COMCLF
WHERE COMOCM.COMPRV_ID = COMPRR.COMPRV_ID
  AND COMOCM.COMPED_ID = COMPED.ID
  AND COMOCM.ID        = COMCLF.COMOCM_ID
  AND COMPED.COMCOB_ID = COMRCB.COMCOB_ID
  AND COMRCB.SITUACION = 'VIG'
  AND(    COMCLF.CALIFICACION = 1
      AND COMCLF.SITUACION = 'VAL'
      AND COMCLF.FECHA BETWEEN P_FECHA_MOV_DESDE AND P_FECHA_MOV_HASTA)
  AND COMRCB.COMRUB_ID = P_COMRUB_ID
  AND COMOCM.COMPRV_ID = P_COMPRV_ID
GROUP BY COMRCB.COMRUB_ID,COMOCM.COMPRV_ID
ORDER BY COMRCB.COMRUB_ID;
--
 v_cursor cr_cursor%ROWTYPE;
 v_monto_COP NUMBER :=0;
 v_valor_COP NUMBER :=0;
 --
BEGIN
   -- Obtener Ordenes Aprobadas
  OPEN cr_cursor;
  FETCH cr_cursor INTO v_cursor;
  CLOSE cr_cursor;
  --
  RETURN v_cursor.CANT_COMOCM_POS;
  --
END;
/* Obtener valor Porcentaje de  Operaciones Concretadas */
FUNCTION OBTN_VALOR_POC
 (P_COMRUB_ID IN COM_REPUTACION_RUBPRV.COMRUB_ID%TYPE
 ,P_COMPRV_ID IN COM_REPUTACION_RUBPRV.COMPRV_ID%TYPE
 ,P_FECHA_MOV_DESDE IN DATE
 ,P_FECHA_MOV_HASTA IN DATE
 )
 RETURN NUMBER
 IS
-- Declaracion de Cursores
CURSOR cr_cursor_prv IS
SELECT  COMRCB.COMRUB_ID
       ,COUNT(DISTINCT COMOCM.ID) AS CANT_POC_PRV
FROM COM_ORDENES_COMPRAS     COMOCM
    ,COM_ORDENES_COMPRAS_EST COMOCE
    ,COM_PEDIDOS             COMPED
    ,COM_RUBCOB              COMRCB
    ,COM_PROVEEDORES_RUB     COMPRR
WHERE COMOCM.ID        = COMOCE.COMOCM_ID
  AND COMOCM.COMPRV_ID = COMPRR.COMPRV_ID
  AND COMOCM.COMPED_ID = COMPED.ID
  AND COMPED.COMCOB_ID = COMRCB.COMCOB_ID
  AND COMRCB.SITUACION = 'VIG'
  AND(COMOCE.ESTADO    = 'CON'
      AND COMOCE.SITUACION = 'VAL'
      AND COMOCE.FECHA BETWEEN P_FECHA_MOV_DESDE AND P_FECHA_MOV_HASTA)
  AND COMRCB.COMRUB_ID = P_COMRUB_ID
  AND COMOCM.COMPRV_ID = P_COMPRV_ID
GROUP BY COMRCB.COMRUB_ID;
--
 v_cr_POC_PRV cr_cursor_prv%ROWTYPE;
 v_monto_COP NUMBER :=0;
 v_valor_COP NUMBER :=0;
 --
BEGIN
   -- Obtener Ordenes Concretadas
  OPEN cr_cursor_prv;
  FETCH cr_cursor_prv INTO v_cr_POC_PRV;
  CLOSE cr_cursor_prv;
  --
  v_valor_COP := COM_PKG.OBTN_VALOR_COP_MONTO(P_COMRUB_ID => P_COMRUB_ID
                                        ,P_COMPRV_ID => P_COMPRV_ID
                                        ,P_MONTO_COP => V_MONTO_COP
                                        ,P_FECHA_MOV_DESDE => P_FECHA_MOV_DESDE
                                        ,P_FECHA_MOV_HASTA => P_FECHA_MOV_HASTA);
  --
  IF (v_valor_COP IS NOT NULL) AND (v_cr_POC_PRV.CANT_POC_PRV IS NOT NULL) THEN
    RETURN (v_cr_POC_PRV.CANT_POC_PRV/nvl(v_valor_COP,1))*100;
  ELSE
    RETURN 0;
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    raise_application_error(-20000,'Error es Obtener Valor POC.', TRUE);
END;
/* Obtener valor Porcentaje de  Operaciones Concretadas Actualizada */
FUNCTION OBTN_VALOR_POCACT
 (P_COMRUB_ID IN COM_REPUTACION_RUBPRV.COMRUB_ID%TYPE
 ,P_COMPRV_ID IN COM_REPUTACION_RUBPRV.COMPRV_ID%TYPE
 ,P_FECHA IN DATE
 )
 RETURN NUMBER
 IS
-- Declaracion de Cursores
CURSOR cr_cursor_prv (P_FECHA_DESDE DATE) IS
SELECT  COMRCB.COMRUB_ID
       ,COUNT(DISTINCT COMOCM.ID) AS CANT_POC_PRV
FROM COM_ORDENES_COMPRAS     COMOCM
    ,COM_ORDENES_COMPRAS_EST COMOCE
    ,COM_PEDIDOS             COMPED
    ,COM_RUBCOB              COMRCB
    ,COM_PROVEEDORES_RUB     COMPRR
WHERE COMOCM.ID        = COMOCE.COMOCM_ID
  AND COMOCM.COMPRV_ID = COMPRR.COMPRV_ID
  AND COMOCM.COMPED_ID = COMPED.ID
  AND COMPED.COMCOB_ID = COMRCB.COMCOB_ID
  AND COMRCB.SITUACION = 'VIG'
  AND COMOCE.ID = OBTN_COMOCE_ID(COMOCM.ID,P_FECHA)
  AND COMOCE.ESTADO IN ('CON')
  AND COMOCE.FECHA BETWEEN P_FECHA_DESDE AND P_FECHA
  AND COMRCB.COMRUB_ID = P_COMRUB_ID
  AND COMOCM.COMPRV_ID = P_COMPRV_ID
GROUP BY COMRCB.COMRUB_ID;
--
 v_cr_POC_PRV cr_cursor_prv%ROWTYPE;
 v_monto_COP NUMBER :=0;
 v_valor_COP NUMBER :=0;
 v_dias_atras NUMBER := TO_NUMBER(SEG_PKG.OBTN_SEGCFG_VALOR
       (p_codigo    => 'COMADM_COMRRP_CANT_DIAS_ATRAS'
       ,p_segorg_id => seg_pkg.obtn_orgusu (NVL (v ('APP_USER'), USER))));

 --
BEGIN
   -- Obtener Ordenes Concretadas
  OPEN cr_cursor_prv (P_FECHA_DESDE => P_FECHA-v_dias_atras);
  FETCH cr_cursor_prv INTO v_cr_POC_PRV;
  CLOSE cr_cursor_prv;
  --
  v_valor_COP := COM_PKG.OBTN_VALOR_COP_MONTO(P_COMRUB_ID => P_COMRUB_ID
                                        ,P_COMPRV_ID => P_COMPRV_ID
                                        ,P_MONTO_COP => V_MONTO_COP
                                        ,P_FECHA_MOV_DESDE => P_FECHA-v_dias_atras
                                        ,P_FECHA_MOV_HASTA => P_FECHA);
  --
  IF (v_valor_COP IS NOT NULL) AND (v_cr_POC_PRV.CANT_POC_PRV IS NOT NULL) THEN
    RETURN (v_cr_POC_PRV.CANT_POC_PRV/nvl(v_valor_COP,1))*100;
  ELSE
    RETURN 0;
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    raise_application_error(-20000,'Error es Obtener Valor POC.', TRUE);
END;
/* Obtener Cantidad de  Operaciones Concretadas Actualmente */
FUNCTION OBTN_VALOR_COCACT
 (P_COMRUB_ID IN COM_REPUTACION_RUBPRV.COMRUB_ID%TYPE
 ,P_COMPRV_ID IN COM_REPUTACION_RUBPRV.COMPRV_ID%TYPE
 ,P_FECHA IN DATE := sysdate
 )
 RETURN NUMBER
 IS
-- Declaracion de Cursores
CURSOR cr_cursor_prv(P_FECHA_DESDE DATE) IS
SELECT  COMRCB.COMRUB_ID
       ,COUNT(DISTINCT COMOCM.ID) AS CANT_POC_PRV
FROM COM_ORDENES_COMPRAS     COMOCM
    ,COM_ORDENES_COMPRAS_EST COMOCE
    ,COM_PEDIDOS             COMPED
    ,COM_RUBCOB              COMRCB
    ,COM_PROVEEDORES_RUB     COMPRR
WHERE COMOCM.ID        = COMOCE.COMOCM_ID
  AND COMOCM.COMPRV_ID = COMPRR.COMPRV_ID
  AND COMOCM.COMPED_ID = COMPED.ID
  AND COMPED.COMCOB_ID = COMRCB.COMCOB_ID
  AND COMRCB.SITUACION = 'VIG'
  AND COMOCE.ID = OBTN_COMOCE_ID(COMOCM.ID,P_FECHA)
  AND COMOCE.ESTADO IN ('CON')
  AND COMOCE.FECHA BETWEEN P_FECHA_DESDE AND P_FECHA
  AND COMRCB.COMRUB_ID = P_COMRUB_ID
  AND COMOCM.COMPRV_ID = P_COMPRV_ID
GROUP BY COMRCB.COMRUB_ID;
--
 v_cr_POC_PRV cr_cursor_prv%ROWTYPE;
 v_monto_COP NUMBER :=0;
 v_valor_COP NUMBER :=0;
 v_dias_atras NUMBER := TO_NUMBER(SEG_PKG.OBTN_SEGCFG_VALOR
       (p_codigo    => 'COMADM_COMRRP_CANT_DIAS_ATRAS'
       ,p_segorg_id => seg_pkg.obtn_orgusu (NVL (v ('APP_USER'), USER))));
 --
BEGIN
   -- Obtener Ordenes Concretadas
  OPEN cr_cursor_prv(P_FECHA_DESDE => P_FECHA-v_dias_atras);
  FETCH cr_cursor_prv INTO v_cr_POC_PRV;
  CLOSE cr_cursor_prv;
  --
  RETURN v_cr_POC_PRV.CANT_POC_PRV;
  --
EXCEPTION
  WHEN OTHERS THEN
    raise_application_error(-20000,'Error en Obtener Valor COC.', TRUE);
END;
/* Obtener valor Porcentaje de Operaciones Positivas */
FUNCTION OBTN_VALOR_POP
 (P_COMRUB_ID IN COM_REPUTACION_RUBPRV.COMRUB_ID%TYPE
 ,P_COMPRV_ID IN COM_REPUTACION_RUBPRV.COMPRV_ID%TYPE
 ,P_FECHA_MOV_DESDE IN DATE
 ,P_FECHA_MOV_HASTA IN DATE
 )
 RETURN NUMBER
 IS
-- Declaracion de Cursores
CURSOR cr_cursor IS
SELECT  COMRCB.COMRUB_ID
       ,COUNT(DISTINCT COMOCM.ID) AS CANT_COMOCM_POS
FROM COM_ORDENES_COMPRAS     COMOCM
    ,COM_PEDIDOS             COMPED
    ,COM_RUBCOB              COMRCB
    ,COM_PROVEEDORES_RUB     COMPRR
    ,COM_CALIFICACIONES      COMCLF
WHERE COMOCM.COMPRV_ID = COMPRR.COMPRV_ID
  AND COMOCM.COMPED_ID = COMPED.ID
  AND COMOCM.ID        = COMCLF.COMOCM_ID
  AND COMPED.COMCOB_ID = COMRCB.COMCOB_ID
  AND COMRCB.SITUACION = 'VIG'
  AND(    COMCLF.CALIFICACION = 1
      AND COMCLF.SITUACION = 'VAL'
      AND COMCLF.FECHA BETWEEN P_FECHA_MOV_DESDE AND P_FECHA_MOV_HASTA)
  AND COMRCB.COMRUB_ID = P_COMRUB_ID
  AND COMOCM.COMPRV_ID = P_COMPRV_ID
GROUP BY COMRCB.COMRUB_ID,COMOCM.COMPRV_ID
ORDER BY COMRCB.COMRUB_ID, CANT_COMOCM_POS;
--
 v_cursor cr_cursor%ROWTYPE;
 v_monto_COP NUMBER :=0;
 v_valor_COP NUMBER :=0;
 --
BEGIN
   -- Obtener Ordenes Aprobadas
  OPEN cr_cursor;
  FETCH cr_cursor INTO v_cursor;
  CLOSE cr_cursor;
  --
  v_valor_COP := COM_PKG.OBTN_VALOR_COP_MONTO(P_COMRUB_ID => P_COMRUB_ID
                                        ,P_COMPRV_ID => P_COMPRV_ID
                                        ,P_MONTO_COP => V_MONTO_COP
                                        ,P_FECHA_MOV_DESDE => P_FECHA_MOV_DESDE
                                        ,P_FECHA_MOV_HASTA => P_FECHA_MOV_HASTA);
  --
  IF (v_valor_COP IS NOT NULL) AND (v_cursor.CANT_COMOCM_POS IS NOT NULL) THEN
    RETURN (v_cursor.CANT_COMOCM_POS/nvl(v_valor_COP,1))*100;
  ELSE
    RETURN 0;
  END IF;
  --
END;
/* Obtener el menor valor de la Reputación del proveedor */
FUNCTION OBTN_COMRRP_VAL
 (P_COMRUB_ID IN COM_REPUTACION_RUBPRV.COMRUB_ID%TYPE
 ,P_COMPRV_ID IN COM_REPUTACION_RUBPRV.COMPRV_ID%TYPE
 ,P_FECHA_VIGENCIA IN DATE
 ,P_TIPO_PRV OUT VARCHAR2
 )
 RETURN NUMBER
 IS
-- Declaración de Cursores
 CURSOR cr_cursor IS
 SELECT FECHA_VIGENCIA
      ,TIPO
      ,VALOR
 FROM COM_REPUTACION_RUBPRV
 WHERE COMPRV_ID = P_COMPRV_ID
   AND COMRUB_ID = P_COMRUB_ID
   AND FECHA_VIGENCIA <= P_FECHA_VIGENCIA
   AND ROWNUM = 1
 ORDER BY FECHA_VIGENCIA DESC, VALOR;
 --
 v_cr_cursor cr_cursor%ROWTYPE;
 v_valor_COP NUMBER := 0;
 v_monto_COP NUMBER := 0;
 v_retorno NUMBER := 0;
 --
BEGIN
  IF (P_COMPRV_ID IS NOT NULL ) AND (P_COMRUB_ID IS NOT NULL )  THEN
    --
    -- Obtengo el menor Valor para la Fecha Vigente pasada por parametro
    OPEN cr_cursor;
    FETCH cr_cursor INTO v_cr_cursor;
    CLOSE cr_cursor;
    --
    v_retorno :=  v_cr_cursor.VALOR;
    --
    -- Obtengo el Tipo de Proveedor según sus Ordenes Aprobadas el Ultimo Año
    v_valor_COP := COM_PKG.OBTN_VALOR_COP_MONTO(P_COMRUB_ID => P_COMRUB_ID
                                         ,P_COMPRV_ID => P_COMPRV_ID
                                         ,P_MONTO_COP => V_MONTO_COP
                                         ,P_FECHA_MOV_DESDE => P_FECHA_VIGENCIA-365
                                         ,P_FECHA_MOV_HASTA => P_FECHA_VIGENCIA);
    -- Inicializo Tipo Prov en null
    P_TIPO_PRV := NULL;
    --
    IF  v_valor_COP IS NULL THEN
        P_TIPO_PRV := 'Proveedor nuevo';
     ELSIF v_valor_COP < 3 THEN
      -- Obtengo el Tipo de Proveedor según sus Ordenes Aprobadas en toda la historia
      v_valor_COP := COM_PKG.OBTN_VALOR_COP_MONTO(P_COMRUB_ID => P_COMRUB_ID
                                            ,P_COMPRV_ID => P_COMPRV_ID
                                            ,P_MONTO_COP => V_MONTO_COP
                                            ,P_FECHA_MOV_DESDE => TO_DATE('01/01/0001','DD/MM/YYYY')
                                            ,P_FECHA_MOV_HASTA => P_FECHA_VIGENCIA);
      --
      IF v_valor_COP >= 3 THEN
        P_TIPO_PRV := 'Proveedor ocasional';
      ELSIF  v_valor_COP = 0 THEN
        P_TIPO_PRV := 'Proveedor nuevo';
       ELSE
        P_TIPO_PRV := '';
        v_retorno := 0;
      END IF;
    END IF;
    --
    RETURN v_retorno;
  END IF;
  --
 END;
/* Obtener la Reputación del proveedor con su grafica */
FUNCTION OBTN_REPUTACION_URL
 (P_COMRUB_ID IN COM_REPUTACION_RUB.COMRUB_ID%TYPE
 ,P_COMPRV_ID IN COM_PROVEEDORES.ID%TYPE
 ,P_FECHA_VIGENCIA IN DATE
 ,P_COLOR_FONDO IN VARCHAR2
 )
 RETURN VARCHAR2
 IS
-- Declaración de variables
 v_valor NUMBER;
 v_tipo_prv VARCHAR2(100);
 v_retorno  VARCHAR2(300);
 --
BEGIN
  --
  v_valor := COM_PKG.OBTN_COMRRP_VAL(P_COMPRV_ID => P_COMPRV_ID
                                    ,P_COMRUB_ID => P_COMRUB_ID
                                    ,P_FECHA_VIGENCIA => P_FECHA_VIGENCIA
                                    ,P_TIPO_PRV  => v_tipo_prv
                                    );
  -- Asigno imagenes con fonde color pasado por parametro
  IF P_COLOR_FONDO = 'G' THEN
   -- Imagenes fondo color Gris
   IF v_valor = 0 THEN v_retorno := '<img src="WORKSPACE_IMAGES.Reputacion_0_grey.png" title="No posee movimientos suficientes para determinar su reputación"/><br>'||v_tipo_prv; END IF;
   IF v_valor = 1 THEN v_retorno := '<img src="WORKSPACE_IMAGES.Reputacion_1_grey.png" title="'||v_tipo_prv||'"/><br>'||v_tipo_prv; END IF;
   IF v_valor = 2 THEN v_retorno := '<img src="WORKSPACE_IMAGES.Reputacion_2_grey.png" title="'||v_tipo_prv||'"/><br>'||v_tipo_prv; END IF;
   IF v_valor = 3 THEN v_retorno := '<img src="WORKSPACE_IMAGES.Reputacion_3_grey.png" title="'||v_tipo_prv||'"/><br>'||v_tipo_prv; END IF;
   IF v_valor = 4 THEN v_retorno := '<img src="WORKSPACE_IMAGES.Reputacion_4_grey.png" title="'||v_tipo_prv||'"/><br>'||v_tipo_prv; END IF;
   IF v_valor = 5 THEN v_retorno := '<img src="WORKSPACE_IMAGES.Reputacion_5_grey.png" title="'||v_tipo_prv||'"/><br>'||v_tipo_prv; END IF;
   IF v_valor IS NULL THEN v_retorno := '<img src="WORKSPACE_IMAGES.Reputacion_grey.png" title="'||v_tipo_prv||'"/>'; END IF;
  ELSE
   -- Imagenes fondo color Blanco
   IF v_valor = 0 THEN v_retorno := '<img src="WORKSPACE_IMAGES.Reputacion_0.png" title="No posee movimientos suficientes para determinar su reputación"</><br>'||v_tipo_prv; END IF;
   IF v_valor = 1 THEN v_retorno := '<img src="WORKSPACE_IMAGES.Reputacion_1.png" title="'||v_tipo_prv||'"</><br>'||v_tipo_prv; END IF;
   IF v_valor = 2 THEN v_retorno := '<img src="WORKSPACE_IMAGES.Reputacion_2.png" title="'||v_tipo_prv||'"</><br>'||v_tipo_prv; END IF;
   IF v_valor = 3 THEN v_retorno := '<img src="WORKSPACE_IMAGES.Reputacion_3.png" title="'||v_tipo_prv||'"</><br>'||v_tipo_prv; END IF;
   IF v_valor = 4 THEN v_retorno := '<img src="WORKSPACE_IMAGES.Reputacion_4.png" title="'||v_tipo_prv||'"</><br>'||v_tipo_prv; END IF;
   IF v_valor = 5 THEN v_retorno := '<img src="WORKSPACE_IMAGES.Reputacion_5.png" title="'||v_tipo_prv||'"</><br>'||v_tipo_prv; END IF;
   IF v_valor IS NULL THEN v_retorno := '<img src="WORKSPACE_IMAGES.Reputacion.png" title="'||v_tipo_prv||'"</>'; END IF;
  END IF;
  --
  RETURN v_retorno;
  --
 END;
/* Obtener la proximidad del Proveedor al Domicilio del Pedido */
FUNCTION OBTN_CATEG_DOM_URL
 (P_COMPRV_ID IN COM_PROVEEDORES.ID%TYPE
 ,P_COMPED_ID IN COM_PEDIDOS.ID%TYPE
 ,P_COLOR_FONDO IN VARCHAR2
 )
 RETURN VARCHAR2
 IS
-- Declaración de Cursores
  -- Domicilios Comerciales del Proveedor
  CURSOR cr_comprd IS
   SELECT COMPRD.COMPRV_ID
         ,COMPRD.COMDOM_ID
         ,COMDOM.PAIS
         ,COMDOM.PROVINCIA
         ,COMDOM.DEPARTAMENTO
         ,COMDOM.LOCALIDAD
     FROM COM_PROVEEDORES_DOM  COMPRD
         ,COM_DOMICILIOS       COMDOM
         ,COM_DOMICILIOS_TIPOS COMDMT
    WHERE COMPRD.COMDOM_ID = COMDOM.ID
      AND COMDOM.COMDMT_ID = COMDMT.ID
      AND COMDMT.CODIGO    = 'PRV_COMERCIAL'
      AND COMPRD.SITUACION = 'ACT'
      AND COMPRD.COMPRV_ID = P_COMPRV_ID;
  --
  -- Domicilio del Pedido
  CURSOR cr_comped_dom IS
   SELECT COMPED.ID COMPED_ID
         ,COMPED.COMDOM_ID
         ,COMDOM.PAIS
         ,COMDOM.PROVINCIA
         ,COMDOM.DEPARTAMENTO
         ,COMDOM.LOCALIDAD
     FROM COM_PEDIDOS      COMPED
         ,COM_DOMICILIOS   COMDOM
    WHERE COMPED.COMDOM_ID = COMDOM.ID
      AND COMPED.ID = P_COMPED_ID;
  --
-- Declaración de variables
 v_valor    NUMBER := 1;
 v_retorno  VARCHAR2(300);
 v_comped_dom cr_comped_dom%ROWTYPE;
 v_hint VARCHAR2(100) := 'Proveedor fuera del Pais';
 --
BEGIN
  -- Obtengo el Domicilio del Pedido
  OPEN cr_comped_dom;
  FETCH cr_comped_dom INTO v_comped_dom;
  CLOSE cr_comped_dom;
  --
  -- Recorro los Domicilios Comerciales del Proveedor y Comparo
  FOR v_comprd IN cr_comprd LOOP
     -- Comparo el PAIS
     IF v_comped_dom.PAIS = v_comprd.PAIS AND v_valor < 2  THEN
         v_valor := 2;
         v_hint := 'Proveedor en el mismo Pais';
     END IF;
     --
     -- Comparo el PROVINCIA
     IF v_comped_dom.PROVINCIA = v_comprd.PROVINCIA AND v_valor < 3 THEN
         v_valor := 3;
         v_hint := 'Proveedor en la misma Provincia';
     END IF;
     --
     -- Comparo el DEPARTAMENTO
     IF v_comped_dom.DEPARTAMENTO = v_comprd.DEPARTAMENTO AND v_valor < 4 THEN
         v_valor := 4;
         v_hint := 'Proveedor en el mismo Departamento';
     END IF;
     --
     -- Comparo el LOCALIDAD
     IF v_comped_dom.LOCALIDAD = v_comprd.LOCALIDAD AND v_valor < 5 THEN
         v_valor := 5;
         v_hint := 'Proveedor en la misma Localidad';
     END IF;
    --
   --
  END LOOP;
  --
  -- Asigno imagenes con fonde color pasado por parametro
  IF P_COLOR_FONDO = 'G' THEN
   -- Imagenes fondo color Gris
   IF v_valor = 0 THEN v_retorno := '<img src="WORKSPACE_IMAGES.Reputacion_0_grey.png" title="'||v_hint||'"/>'; END IF;
   IF v_valor = 1 THEN v_retorno := '<img src="WORKSPACE_IMAGES.Reputacion_1_grey.png" title="'||v_hint||'"/>'; END IF;
   IF v_valor = 2 THEN v_retorno := '<img src="WORKSPACE_IMAGES.Reputacion_2_grey.png" title="'||v_hint||'"/>'; END IF;
   IF v_valor = 3 THEN v_retorno := '<img src="WORKSPACE_IMAGES.Reputacion_3_grey.png" title="'||v_hint||'"/>'; END IF;
   IF v_valor = 4 THEN v_retorno := '<img src="WORKSPACE_IMAGES.Reputacion_4_grey.png" title="'||v_hint||'"/>'; END IF;
   IF v_valor = 5 THEN v_retorno := '<img src="WORKSPACE_IMAGES.Reputacion_5_grey.png" title="'||v_hint||'"/>'; END IF;
   IF v_valor IS NULL THEN v_retorno := '<img src="WORKSPACE_IMAGES.Reputacion.png" title="'||v_hint||'"/>'; END IF;
  ELSE
   -- Imagenes fondo color Blanco
   IF v_valor = 0 THEN v_retorno := '<img src="WORKSPACE_IMAGES.Reputacion_0.png" title="'||v_hint||'"</>'; END IF;
   IF v_valor = 1 THEN v_retorno := '<img src="WORKSPACE_IMAGES.Reputacion_1.png" title="'||v_hint||'"</>'; END IF;
   IF v_valor = 2 THEN v_retorno := '<img src="WORKSPACE_IMAGES.Reputacion_2.png" title="'||v_hint||'"</>'; END IF;
   IF v_valor = 3 THEN v_retorno := '<img src="WORKSPACE_IMAGES.Reputacion_3.png" title="'||v_hint||'"</>'; END IF;
   IF v_valor = 4 THEN v_retorno := '<img src="WORKSPACE_IMAGES.Reputacion_4.png" title="'||v_hint||'"</>'; END IF;
   IF v_valor = 5 THEN v_retorno := '<img src="WORKSPACE_IMAGES.Reputacion_5.png" title="'||v_hint||'"</>'; END IF;
   IF v_valor IS NULL THEN v_retorno := '<img src="WORKSPACE_IMAGES.Reputacion.png" title="'||v_hint||'"</>'; END IF;
  END IF;
  --
  RETURN v_retorno;
  --
 END;
/* Obtiene la Contraseña por defecto para el Usuario */
FUNCTION OBTN_CONTRASENIA
 (P_NOMBRE IN VARCHAR2
 ,P_NUMERO_DOCUMENTO IN VARCHAR2
 )
 RETURN VARCHAR2
 IS
v_contrasenia VARCHAR2(15);
v_nombre      VARCHAR2(300);
v_retorno     VARCHAR2(15);
BEGIN
 -- Genero la Contraseña
 v_nombre := TRIM(p_nombre);
 v_contrasenia :=
         -- los 2 primeros caracteres del NOMBRE
         UPPER(SUBSTR(LTRIM(RTRIM(v_nombre)),1,2)||
         -- los 4 ultimos digitos del NUMERO DE DOCUMENTO
         SUBSTR(LTRIM(RTRIM(p_numero_documento)),length(p_numero_documento)-3,4)||
         -- los 2 ultimos caracteres del NOMBRE
         SUBSTR(LTRIM(RTRIM(v_nombre)),length(v_nombre)-1,2));
  --
  v_retorno := REPLACE(v_contrasenia,'Ñ','N');
  v_retorno := REPLACE(v_retorno,'ñ','n');
  --
  v_retorno := REPLACE(v_retorno,'Á','A');
  v_retorno := REPLACE(v_retorno,'á','a');
  --
  v_retorno := REPLACE(v_retorno,'É','E');
  v_retorno := REPLACE(v_retorno,'é','e');
  --
  v_retorno := REPLACE(v_retorno,'Í','I');
  v_retorno := REPLACE(v_retorno,'í','i');
  --
  v_retorno := REPLACE(v_retorno,'Ó','O');
  v_retorno := REPLACE(v_retorno,'ó','o');
  --
  v_retorno := REPLACE(v_retorno,'Ú','U');
  v_retorno := REPLACE(v_retorno,'ú','u');
  --
  v_retorno := REPLACE(v_retorno,'À','A');
  v_retorno := REPLACE(v_retorno,'à','a');
  --
  v_retorno := REPLACE(v_retorno,'È','E');
  v_retorno := REPLACE(v_retorno,'è','e');
  --
  v_retorno := REPLACE(v_retorno,'Ì','I');
  v_retorno := REPLACE(v_retorno,'ì','i');
  --
  v_retorno := REPLACE(v_retorno,'ò','O');
  v_retorno := REPLACE(v_retorno,'ò','o');
  --
  v_retorno := REPLACE(v_retorno,'Ù','U');
  v_retorno := REPLACE(v_retorno,'ù','u');
  --
  v_retorno := REPLACE(v_retorno,'º','X');
  --
  v_retorno := REPLACE(v_retorno,',','X');
  --
  v_retorno := REPLACE(v_retorno,'.','X');
  --
  v_retorno := REPLACE(v_retorno,'(','X');
  --
  v_retorno := REPLACE(v_retorno,')','X');
  --
  v_retorno := REPLACE(v_retorno,'*','X');
  --
  RETURN v_retorno;
  --
END;
/* Obtenner si se muestra mensaje al proveedor */
FUNCTION OBTN_MUESTRO_MSJ_SN
 (P_COMCON_ID IN COM_CONTRATACIONES.ID%TYPE
 ,P_COMPRV_ID IN COM_PROVEEDORES.ID%TYPE
 )
 RETURN VARCHAR2
 IS
-- Declaracaión de Cursores
 CURSOR cr_comcon IS
 SELECT COMCTT_ID
   FROM COM_CONTRATACIONES
  WHERE ID = p_comcon_id;
 --
 CURSOR cr_comctt(p_comctt_id number) IS
 SELECT MENSAJE_PRV_SN
   FROM COM_CONTRATACIONES_TIPOS
  WHERE ID = p_comctt_id;
  --
 CURSOR cr_comctz IS
 SELECT  COUNT(ID) REALIZADAS
   FROM COM_COTIZACIONES
  WHERE COMCON_ID = p_comcon_id
    AND COMPRV_ID = p_comprv_id
    AND SITUACION NOT IN ('NUE','ANU');
 --
 -- Declaración de Variables
 v_comcon cr_comcon%rowtype;
 v_comctt cr_comctt%rowtype;
 v_comctz cr_comctz%rowtype;
 v_resultado VARCHAR2(2) := 'NO';
BEGIN
 --
 OPEN  cr_comcon;
 FETCH cr_comcon INTO v_comcon;
 CLOSE cr_comcon;
 --
 OPEN  cr_comctt(p_comctt_id => v_comcon.COMCTT_ID);
 FETCH cr_comctt INTO v_comctt;
 CLOSE cr_comctt;
 --
 OPEN  cr_comctz;
 FETCH cr_comctz INTO v_comctz;
 CLOSE cr_comctz;
 --
 -- Retorno SI en el caso que este seteado en el tipo de contratación
 IF ((v_comctt.MENSAJE_PRV_SN = 'SI')
    -- ademas si la contratación aun esta ABIERTA
    AND (COM_PKG.OBTN_COMCON_ESTADO(p_comcon_id => p_comcon_id,p_comprv_id => p_comprv_id) = 'ABIERTO')
    -- ademas si el proveedor aún no ha realizado ninguna cotización
    AND (v_comctz.realizadas = 0))
   THEN
     v_resultado := 'SI';
 END IF;
 --
 RETURN v_resultado;
END;
/* Obtiene la Cantidad a Adjudicar de un Item */
FUNCTION OBTN_COMADD_CANT_ADJ
 (P_COMPET_ID IN COM_PEDIDOS_DETALLES.ID%TYPE
 )
 RETURN NUMBER
 IS
-- Declaración de Cursores
CURSOR cr_comadd IS
SELECT COMADD.CANTIDAD_ADJUDICADA
FROM COM_ADJUDICACIONES_DET COMADD
WHERE COMADD.COMPET_ID = P_COMPET_ID
  AND COMADD.SITUACION = 'PEN';
--
V_COMADD_CANT_A_ADJ_TOTAL NUMBER := 0;
BEGIN
 -- Recorro el detalle de la adjudicacion y sumo las Cantidades a Adjudicadas
  FOR v_comadd IN cr_comadd LOOP
    V_COMADD_CANT_A_ADJ_TOTAL := V_COMADD_CANT_A_ADJ_TOTAL + NVL(v_comadd.CANTIDAD_ADJUDICADA,0);
  END LOOP;
  --
 --
 RETURN V_COMADD_CANT_A_ADJ_TOTAL;
 --
END;
/* Obtiene el Saldo del Item de Pedido */
FUNCTION OBTN_COMPET_SALDO
 (P_COMPET_ID IN COM_PEDIDOS_DETALLES.ID%TYPE
 )
 RETURN NUMBER
 IS
-- Declaración de Cursores
CURSOR cr_compet_saldo IS
SELECT NVL(COMPET.CANTIDAD,0)
FROM COM_PEDIDOS_DETALLES COMPET
WHERE COMPET.ID = P_COMPET_ID;
--
v_cantidad_saldo NUMBER;
BEGIN
--
OPEN cr_compet_saldo;
FETCH cr_compet_saldo INTO v_cantidad_saldo;
CLOSE cr_compet_saldo;
--
RETURN NVL(v_cantidad_saldo - OBTN_COMOCD_CANT_ADJ(P_COMPET_ID),0);
--
END;
/* Obtiene la Cantidad Adjudicada de un Item */
FUNCTION OBTN_COMOCD_CANT_ADJ
 (P_COMPET_ID IN COM_PEDIDOS_DETALLES.ID%TYPE
 )
 RETURN NUMBER
 IS
-- Declaración de Cursores
CURSOR cr_comocd IS
SELECT COMOCD.COMADD_ID
FROM COM_ORDENES_COMPRAS_DET COMOCD
    ,COM_ORDENES_COMPRAS_EST COMOCE
WHERE COMOCD.COMOCM_ID = COMOCD.COMOCM_ID
  AND COMOCD.COMPET_ID = P_COMPET_ID
  AND COMOCE.ID = COM_PKG.OBTN_COMOCE_ID(COMOCD.COMOCM_ID)
  AND COMOCE.ESTADO NOT IN ('ANU','RCH','NOC');
--
CURSOR cr_comadd (P_COMADD_ID NUMBER)IS
SELECT COMADD.CANTIDAD_ADJUDICADA
FROM COM_ADJUDICACIONES_DET COMADD
WHERE COMADD.ID = P_COMADD_ID;
--
V_COMADD_CANT_ADJUDICADA_TOTAL NUMBER := 0;
BEGIN
--  Recorro los detalles de las Ordenes de Compras para obtener las Adjudicaciones el Item buscado
 FOR v_comocd IN cr_comocd LOOP
   -- Recorro los detalles de las adjudicaciones encontradas y sumo las Cantidades Adjudicadas
   FOR v_comadd IN cr_comadd(v_comocd.COMADD_ID) LOOP
     V_COMADD_CANT_ADJUDICADA_TOTAL := V_COMADD_CANT_ADJUDICADA_TOTAL + v_comadd.CANTIDAD_ADJUDICADA;
   END LOOP;
 END LOOP;
--
--
RETURN V_COMADD_CANT_ADJUDICADA_TOTAL;
--
END;
/* Obtener el Id del Estado vigente de una Orden de Compra */
FUNCTION OBTN_COMOCE_ID
 (P_COMOCM_ID IN NUMBER
 ,P_FECHA IN DATE := SYSDATE
 )
 RETURN NUMBER
 IS
--
--  CURSOR cr_comoce IS
--  SELECT MAX(COMOCE.ID) ID
--  FROM COM_ORDENES_COMPRAS_EST COMOCE
--  WHERE COMOCE.FECHA = (SELECT MAX(COMOCE2.FECHA)
--                        FROM COM_ORDENES_COMPRAS_EST COMOCE2
--                        WHERE COMOCE2.COMOCM_ID = p_comocm_id
--                          AND COMOCE2.FECHA <= p_fecha
--                          AND COMOCE2.SITUACION = 'VAL')
--    AND COMOCE.COMOCM_ID = p_comocm_id
--    AND COMOCE.SITUACION = 'VAL';
  --
  CURSOR cr_comoce IS
  SELECT COMOCE_ID ID
  FROM COM_ORDENES_COMPRAS
  WHERE ID = p_comocm_id;
  --
  v_retorno NUMBER;
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
/* Obtener el Estado interpretado de una Orden de Compra */
FUNCTION OBTN_COMOCE_ESTADO
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
  --
  --
  RETURN v_retorno;
  --
END;
/* Obtiene la interpretación del Estado del proceso */
FUNCTION OBTN_COMCON_ESTADO
 (P_COMCON_ID IN COM_CONTRATACIONES.ID%TYPE
 ,P_COMPRV_ID IN COM_PROVEEDORES.ID%TYPE
 )
 RETURN VARCHAR2
 IS
cursor cr_comcon is
    select *
    from COM_CONTRATACIONES
    where id = p_comcon_id;
  --
  cursor cr_comcoe (p_comcoe_id in number) is
    select ESTADO
    from COM_CONTRATACIONES_EST
    where ID = p_comcoe_id;
  --
  cursor cr_comczd is
    select  count(comctz.ID) COTIZACIONES
    from COM_COTIZACIONES comctz
    where comctz.COMCON_ID = p_comcon_id
    and comctz.COMPRV_ID = p_comprv_id
    and comctz.SITUACION ='PRE';
  --
  cursor cr_comocm is
    select count(comocm.ID) ORDENES
    from   COM_ORDENES_COMPRAS comocm
          ,COM_ORDENES_COMPRAS_EST comoce
    where  comocm.COMCON_ID = p_comcon_id
    and    comocm.COMPRV_ID = p_comprv_id
    and    comocm.COMOCE_ID = comoce.ID
    and    comoce.SITUACION <> 'ANU';
  --
  v_retorno varchar2(100);
  v_comcoe_est varchar2(100);
  v_comczd cr_comczd%rowtype;
  v_comocm cr_comocm%rowtype;
  v_comcon COM_CONTRATACIONES%rowtype;
  v_dummy number;
  --
begin
  --
  open cr_comczd;
  fetch cr_comczd into v_comczd;
  close cr_comczd;
  --
  open cr_comcon;
  fetch cr_comcon into v_comcon;
  close cr_comcon;
  --
  open cr_comcoe(p_comcoe_id => v_comcon.comcoe_id);
  fetch cr_comcoe into v_comcoe_est;
  close cr_comcoe;
  --
  if v_comcoe_est = 'ACT' and sysdate >= v_comcon.FECHA_INICIO_PROPUESTA and sysdate <= v_comcon.FECHA_FIN_PROPUESTA then
    v_retorno := 'ABIERTO';
  elsif v_comcoe_est = 'ACT' and sysdate > v_comcon.FECHA_FIN_PROPUESTA and sysdate <= v_comcon.FECHA_FIN_ACLARACION then
    v_retorno := 'EN ACLARACION';
  elsif v_comcoe_est = 'ACT' and sysdate > v_comcon.FECHA_FIN_PROPUESTA and nvl(v_comczd.COTIZACIONES, 0) > 0 then
    v_retorno := 'EN EVALUACION';
  elsif v_comcoe_est in ('VRF','PRE') and nvl(v_comczd.COTIZACIONES, 0) > 0 then
    v_retorno := 'EVALUADO';
  elsif v_comcoe_est in ('ENV','INF','ACR','RES') and nvl(v_comczd.COTIZACIONES, 0) > 0 then
    v_retorno := 'EN ANALISIS DE OFERTA';
  elsif v_comcoe_est in ('FIN','ADJ') and nvl(v_comczd.COTIZACIONES, 0) > 0 then
    --
    open cr_comocm;
    fetch cr_comocm into v_comocm;
    close cr_comocm;
    --
    if v_comocm.ORDENES > 0 then
      v_retorno := 'ADJUDICADO C/ORDEN';
    else
      v_retorno := 'FINALIZADO S/ORDEN';
    end if;
  elsif v_comcoe_est in ('FIN','ADJ') and nvl(v_comczd.COTIZACIONES, 0) = 0 then
    v_retorno := 'CERRADO';
  elsif v_comcoe_est in ('ACT','PRE','ENV','INF','VRF','ACR','FIN','IFC','RES') and sysdate > v_comcon.FECHA_FIN_PROPUESTA then
    v_retorno := 'CERRADO';
  elsif v_comcoe_est = 'DES' then
    v_retorno := 'DESIERTO';
  elsif v_comcoe_est = 'CAN' then
    v_retorno := 'ANULADO';
  elsif v_comcoe_est = 'NAD' then
    v_retorno := 'NO ADJUDICADO';
  else
    v_retorno := GRAL_PKG.OBTN_CFGDES('COM_CONTRATACIONES_EST.ESTADO', v_comcoe_est);
  end if;
  --
  return v_retorno;
  --
end;
/* Obtener el numero de un numerador configurado */
FUNCTION OBTN_COMNUM_NUMERO
 (P_CODIGO IN VARCHAR2
 ,P_SEGORG_ID IN NUMBER
 ,P_EJERCICIO IN NUMBER := to_number(to_char(sysdate,'YYYY'))
 )
 RETURN NUMBER
 IS
CURSOR cr_comnum IS
  select SECUENCIA_NUMERADOR
    from  COM_NUMERADORES
   where SEGORG_ID = p_segorg_id
     and CODIGO    = p_codigo;
   v_retorno NUMBER := null;
   v_query VARCHAR2(2000);
   v_comnum cr_comnum%rowtype;
BEGIN
   OPEN cr_comnum;
   FETCH cr_comnum INTO v_comnum;
   CLOSE cr_comnum;
   --
   IF v_comnum.SECUENCIA_NUMERADOR IS NOT NULL THEN
     v_query := 'SELECT '||v_comnum.SECUENCIA_NUMERADOR||'.NEXTVAL FROM DUAL';
     EXECUTE IMMEDIATE v_query INTO v_retorno;
   END IF;
   --
   RETURN v_retorno;
   --
END;
/* Obtiene si aun se puede Cotizar una Contratacion */
FUNCTION OBTN_COMCON_COTIZAR
 (P_COMCON_ID IN COM_CONTRATACIONES.ID%TYPE
 )
 RETURN VARCHAR2
 IS
--
 CURSOR cr_comcon IS
 SELECT comcoe.estado comcoe_estado
      , comcon.fecha_inicio_propuesta
      , comcon.fecha_fin_propuesta
 FROM COM_CONTRATACIONES comcon
    , COM_CONTRATACIONES_EST comcoe
 WHERE comcon.ID = p_comcon_id
   and comcon.comcoe_id = comcoe.id;
 --
 v_comcon cr_comcon%ROWTYPE;
 v_retorno varchar2(2):='NO';
 --
BEGIN
  --
  OPEN cr_comcon;
  FETCH cr_comcon INTO  v_comcon;
  CLOSE cr_comcon;
  --
  IF  v_comcon.COMCOE_ESTADO NOT IN ('ANU','NUE')
     AND sysdate >= v_comcon.FECHA_INICIO_PROPUESTA
     AND sysdate <= v_comcon.FECHA_FIN_PROPUESTA then
     v_retorno := 'SI';
   ELSE
     v_retorno := 'NO';
  END IF;
  --
  return v_retorno;
END;
/* Obtener el Nombre del Contratante. */
FUNCTION OBTN_COMECO_NOMBRE
 (P_COMECO_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
CURSOR cr_comeco_nom IS
  select  NOMBRE NOMBRE  -- CODIGO||' - '||NOMBRE NOMBRE cambiado por decisión de Compras el 16/09/2014
    from  COM_CONTRATANTES
   where ID = p_comeco_id;
   v_retorno VARCHAR2(2000);
BEGIN
   OPEN cr_comeco_nom;
   FETCH cr_comeco_nom INTO v_retorno;
   CLOSE cr_comeco_nom;
   --
   RETURN v_retorno;
   --
END;
/* Obtengo el Codigo del Contratante. */
FUNCTION OBTN_COMECO_CODIGO
 (P_COMECO_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
CURSOR cr_comeco_cod IS
  select CODIGO
    from  COM_CONTRATANTES
   where ID = p_comeco_id;
   v_retorno VARCHAR2(2000);
BEGIN
   OPEN cr_comeco_cod;
   FETCH cr_comeco_cod INTO v_retorno;
   CLOSE cr_comeco_cod;
   --
   RETURN v_retorno;
   --
END;
/* Obtiene el Estado del Proveedor a la fecha dada */
FUNCTION OBTN_COMPRE_ID
 (P_COMPRV_ID IN NUMBER
 ,P_FECHA IN DATE := SYSDATE
 )
 RETURN NUMBER
 IS
--
  CURSOR cr_compre_baj IS
  SELECT COMPRE3.ID, COMPRE3.ESTADO
  FROM COM_PROVEEDORES_EST COMPRE3
  WHERE COMPRE3.ID = (
  SELECT MAX(COMPRE.ID) ID
  FROM COM_PROVEEDORES_EST COMPRE
  WHERE COMPRE.FECHA_VIGENCIA = (SELECT MAX(FECHA_VIGENCIA)
                                 FROM COM_PROVEEDORES_EST COMPRE2
                                 WHERE COMPRE2.COMPRV_ID = p_comprv_id
                                   AND COMPRE2.SITUACION = 'VAL'
                                   AND COMPRE2.ESTADO IN ('BAJ','HAB')
                                   AND p_fecha BETWEEN COMPRE2.FECHA_VIGENCIA AND NVL(COMPRE2.FECHA_VALIDEZ,SYSDATE)
                                )
  AND COMPRE.COMPRV_ID = p_comprv_id
  AND COMPRE.SITUACION = 'VAL'
  AND COMPRE.ESTADO IN ('BAJ','HAB')
  AND p_fecha BETWEEN COMPRE.FECHA_VIGENCIA AND NVL(COMPRE.FECHA_VALIDEZ,SYSDATE));
  --
  CURSOR cr_compre_sus IS
  SELECT MAX(COMPRE.ID) ID
  FROM COM_PROVEEDORES_EST COMPRE
  WHERE NVL(COMPRE.FECHA_VALIDEZ,SYSDATE) = (SELECT MAX(NVL(FECHA_VALIDEZ,SYSDATE))
                                FROM COM_PROVEEDORES_EST COMPRE2
                                WHERE COMPRE2.COMPRV_ID = p_comprv_id
                                  AND COMPRE2.SITUACION = 'VAL'
                                  AND COMPRE2.ESTADO = 'SUS'
                                  AND p_fecha BETWEEN COMPRE2.FECHA_VIGENCIA AND NVL(COMPRE2.FECHA_VALIDEZ,SYSDATE)
                                )
  AND COMPRE.COMPRV_ID = p_comprv_id
  AND COMPRE.SITUACION = 'VAL'
  AND COMPRE.ESTADO = 'SUS'
  AND p_fecha BETWEEN COMPRE.FECHA_VIGENCIA AND NVL(COMPRE.FECHA_VALIDEZ,SYSDATE);
  --
  CURSOR cr_compre IS
  SELECT MAX(COMPRE.ID) ID
  FROM COM_PROVEEDORES_EST COMPRE
  WHERE COMPRE.FECHA_VIGENCIA = (SELECT MAX(FECHA_VIGENCIA)
                                FROM COM_PROVEEDORES_EST COMPRE2
                                WHERE COMPRE2.COMPRV_ID = p_comprv_id
                                  AND COMPRE2.SITUACION = 'VAL'
                                  AND COMPRE2.ESTADO NOT IN ('SUS','BAJ')
                                  AND p_fecha BETWEEN COMPRE2.FECHA_VIGENCIA AND NVL(COMPRE2.FECHA_VALIDEZ,SYSDATE)
                                )
    AND COMPRE.COMPRV_ID = p_comprv_id
    AND COMPRE.SITUACION = 'VAL'
    AND COMPRE.ESTADO NOT IN('SUS','BAJ')
    AND p_fecha BETWEEN COMPRE.FECHA_VIGENCIA AND NVL(COMPRE.FECHA_VALIDEZ,SYSDATE);
  --
  v_retorno NUMBER;
  v_compre_estado COM_PROVEEDORES_EST.ESTADO%type;
  --
BEGIN
  --
  OPEN cr_compre_baj;
  FETCH cr_compre_baj INTO v_retorno, v_compre_estado;
  CLOSE cr_compre_baj;
  --
  IF v_compre_estado = 'BAJ' and v_retorno IS NOT NULL THEN
    RETURN v_retorno;
  else
    v_retorno := NULL;
  END IF;
  --
  OPEN cr_compre_sus;
  FETCH cr_compre_sus INTO v_retorno;
  CLOSE cr_compre_sus;
  --
  IF v_retorno IS NOT NULL THEN
    RETURN v_retorno;
  END IF;
  --
  OPEN cr_compre;
  FETCH cr_compre INTO v_retorno;
  CLOSE cr_compre;
  --
  RETURN v_retorno;
  --
END;
/* Obtener el Id del Estado del Pedido */
FUNCTION OBTN_COMPEE_ID
 (P_COMPED_ID IN NUMBER
 ,P_FECHA IN DATE := sysdate
 )
 RETURN NUMBER
 IS
--
--  CURSOR cr_compee IS
--  SELECT MAX(COMPEE.ID) ID
--  FROM COM_PEDIDOS_EST COMPEE
--  WHERE COMPEE.FECHA = (SELECT MAX(COMPEE2.FECHA)
--                        FROM COM_PEDIDOS_EST COMPEE2
--                        WHERE COMPEE2.COMPED_ID = p_comped_id
--                          AND COMPEE2.FECHA <= p_fecha)
--    AND COMPEE.COMPED_ID = p_comped_id;
  --
  CURSOR cr_compee IS
  SELECT COMPEE_ID ID
  FROM COM_PEDIDOS
  WHERE ID = p_comped_id;
  --
  v_retorno NUMBER;
  --
BEGIN
  --
  OPEN cr_compee;
  FETCH cr_compee INTO v_retorno;
  CLOSE cr_compee;
  --
  RETURN v_retorno;
  --
END;
/* Obtiene el Estado del Contratante la fecha dada */
FUNCTION OBTN_COMECE_ID
 (P_COMECO_ID IN NUMBER
 ,P_FECHA IN DATE := SYSDATE
 )
 RETURN NUMBER
 IS
--
  CURSOR cr_comece_baj IS
  SELECT COMECE3.ID, COMECE3.ESTADO
  FROM COM_CONTRATANTES_EST COMECE3
  WHERE COMECE3.ID = (
  SELECT MAX(COMECE.ID) ID
  FROM COM_CONTRATANTES_EST COMECE
  WHERE COMECE.FECHA_VIGENCIA = (SELECT MAX(FECHA_VIGENCIA)
                                 FROM COM_CONTRATANTES_EST COMECE2
                                 WHERE COMECE2.COMECO_ID = p_comeco_id
                                   AND COMECE2.SITUACION = 'VAL'
                                   AND COMECE2.ESTADO IN ('BAJ','HAB')
                                   AND p_fecha BETWEEN COMECE2.FECHA_VIGENCIA AND NVL(COMECE2.FECHA_VALIDEZ,SYSDATE)
                                )
  AND COMECE.COMECO_ID = p_comeco_id
  AND COMECE.SITUACION = 'VAL'
  AND COMECE.ESTADO IN ('BAJ','HAB')
  AND p_fecha BETWEEN COMECE.FECHA_VIGENCIA AND NVL(COMECE.FECHA_VALIDEZ,SYSDATE));
  --
  CURSOR cr_comece_sus IS
  SELECT MAX(COMECE.ID) ID
  FROM COM_CONTRATANTES_EST COMECE
  WHERE COMECE.FECHA_VALIDEZ = (SELECT MAX(FECHA_VALIDEZ)
                                FROM COM_CONTRATANTES_EST COMECE2
                                WHERE COMECE2.COMECO_ID = p_comeco_id
                                  AND COMECE2.SITUACION = 'VAL'
                                  AND COMECE2.ESTADO = 'SUS'
                                  AND p_fecha BETWEEN COMECE2.FECHA_VIGENCIA AND NVL(COMECE2.FECHA_VALIDEZ,SYSDATE)
                                )
  AND COMECE.COMECO_ID = p_comeco_id
  AND COMECE.SITUACION = 'VAL'
  AND COMECE.ESTADO = 'SUS'
  AND p_fecha BETWEEN COMECE.FECHA_VIGENCIA AND NVL(COMECE.FECHA_VALIDEZ,SYSDATE);
  --
  CURSOR cr_comece IS
  SELECT MAX(COMECE.ID) ID
  FROM COM_CONTRATANTES_EST COMECE
  WHERE COMECE.FECHA_VIGENCIA = (SELECT MAX(FECHA_VIGENCIA)
                                FROM COM_CONTRATANTES_EST COMECE2
                                WHERE COMECE2.COMECO_ID = p_comeco_id
                                  AND COMECE2.SITUACION = 'VAL'
                                  AND COMECE2.ESTADO NOT IN ('SUS','BAJ')
                                  AND p_fecha BETWEEN COMECE2.FECHA_VIGENCIA AND NVL(COMECE2.FECHA_VALIDEZ,SYSDATE)
                                )
    AND COMECE.COMECO_ID = p_comeco_id
    AND COMECE.SITUACION = 'VAL'
    AND COMECE.ESTADO NOT IN('SUS','BAJ')
    AND p_fecha BETWEEN COMECE.FECHA_VIGENCIA AND NVL(COMECE.FECHA_VALIDEZ,SYSDATE);
  --
  v_retorno NUMBER;
  v_comece_estado COM_CONTRATANTES_EST.ESTADO%type;
  --
BEGIN
  --
  OPEN cr_comece_baj;
  FETCH cr_comece_baj INTO v_retorno, v_comece_estado;
  CLOSE cr_comece_baj;
  --
  IF v_comece_estado = 'BAJ' and v_retorno IS NOT NULL THEN
    RETURN v_retorno;
  else
    v_retorno := NULL;
  END IF;
  --
  OPEN cr_comece_sus;
  FETCH cr_comece_sus INTO v_retorno;
  CLOSE cr_comece_sus;
  --
  IF v_retorno IS NOT NULL THEN
    RETURN v_retorno;
  END IF;
  --
  OPEN cr_comece;
  FETCH cr_comece INTO v_retorno;
  CLOSE cr_comece;
  --
  RETURN v_retorno;
  --
END;
/* Obtener el Id del estado de la contratación */
FUNCTION OBTN_COMCOE_ID
 (P_COMCON_ID IN NUMBER
 ,P_FECHA IN DATE := SYSDATE
 )
 RETURN NUMBER
 IS
--
--  CURSOR cr_comcoe IS
--  SELECT MAX(COMCOE.ID) ID
--  FROM COM_CONTRATACIONES_EST COMCOE
--  WHERE COMCOE.FECHA = (SELECT MAX(COMCOE2.FECHA)
--                        FROM COM_CONTRATACIONES_EST COMCOE2
--                        WHERE COMCOE2.COMCON_ID = p_comcon_id
--                         AND COMCOE2.FECHA <= p_fecha)
--    AND COMCOE.COMCON_ID = p_comcon_id;
  --
  CURSOR cr_comcoe IS
  SELECT COMCOE_ID
  FROM COM_CONTRATACIONES
  WHERE ID = p_comcon_id;

  --
  v_retorno NUMBER;
  --
BEGIN
  --
  OPEN cr_comcoe;
  FETCH cr_comcoe INTO v_retorno;
  CLOSE cr_comcoe;
  --
  RETURN v_retorno;
  --
END;
/* Obtener la descripción de un item */
FUNCTION OBTN_COMCIT_DESC
 (P_COMCIT_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
CURSOR cr_comcit_desc IS
   select DECODE(ESTADO,'Sin','','Estado '||
          ESTADO||' - ')||rtrim(' '||DECODE(TIPO,'Sin','','Tipo '||TIPO||' - '))||rtrim(' '||DECODE(PROCESO,'Sin','',PROCESO||' - '))||rtrim(' '||DECODE(ADITIVO,'Sin','','Aditivado con '||ADITIVO||' - '))||rtrim(' '||DECODE(AGREGADO,'Sin','','con '||AGREGADO||' - '))||rtrim(' '||DECODE(ENVASE,'Sin','','Envase '||ENVASE||' - '))||' Contenido '||CONTENIDO_CANTIDAD||' '||CONTENIDO_UNIDAD_MEDIDA DESCRIPCION
   from  COM_CATALOGO_ITEMS
   where ID = p_comcit_id;
   v_retorno VARCHAR2(2000);
BEGIN
   OPEN cr_comcit_desc;
   FETCH cr_comcit_desc INTO v_retorno;
   CLOSE cr_comcit_desc;
   --
   RETURN v_retorno;
   --
END;
/* Obtiene el valor de una columna de una linea con separador. */
FUNCTION OBTN_VALOR_COL
 (P_LINEA IN VARCHAR2
 ,P_COLUMNA IN NUMBER
 ,P_SEPARADOR IN VARCHAR2
 )
 RETURN VARCHAR2
 IS
v_retorno  VARCHAR2(3000);
--
BEGIN
  IF p_columna = 0 THEN
    v_retorno := SUBSTR(p_linea,1,INSTR(p_linea,p_separador,1,1)-1);
  END IF;
  IF p_columna > 0 THEN
   v_retorno := SUBSTR(p_linea,INSTR(p_linea,p_separador,1,p_columna)+1);
   IF (SUBSTR(v_retorno,1,INSTR(v_retorno,p_separador,1,1)) is not NULL) THEN
      v_retorno := SUBSTR(v_retorno,1,INSTR(v_retorno,p_separador,1,1));
   END IF;
  END IF;
  -- Saco los espacios en blanco al comienzo y final del dato
  -- Tambien verifico que no haya quedado ningun separador en el dato
  RETURN  RTRIM(LTRIM(REPLACE(v_retorno,p_separador,'')));
EXCEPTION
  WHEN OTHERS THEN
    RETURN NULL;
END;
/* Obtiene el Total de una Orden de Compra */
FUNCTION OBTN_COMOCM_TOTAL
 (P_COMOCM_ID IN COM_ORDENES_COMPRAS_DET.COMOCM_ID%TYPE
 )
 RETURN NUMBER
 IS
-- Declaración de Cursores
CURSOR cr_comocm IS
SELECT nvl(monto,0)-nvl(monto_descuento,0) TOTAL
FROM COM_ORDENES_COMPRAS
WHERE ID = p_comocm_id;
 --
 v_comocm cr_comocm%ROWTYPE;
 --
BEGIN
 --
 OPEN cr_comocm;
 FETCH cr_comocm INTO v_comocm;
 CLOSE cr_comocm;
 --
 RETURN v_comocm.TOTAL;
 --
END;
/* Obtener el Id del Precio Actual para un Item */
FUNCTION OBTN_COMCTP_ID
 (P_COMCIT_ID IN NUMBER
 ,P_FECHA IN DATE := sysdate
 )
 RETURN NUMBER
 IS
--
  CURSOR cr_comctp IS
  SELECT ID
  FROM (SELECT COMCTP.ID ID
        FROM COM_CATALOGO_PRECIOS COMCTP
        WHERE COMCTP.COMCIT_ID = p_comcit_id
          AND COMCTP.SITUACION = 'VAL'
          AND COMCTP.FECHA_VIGENCIA <= p_fecha
          AND (COMCTP.FECHA_VALIDEZ IS NULL OR COMCTP.FECHA_VALIDEZ >= p_fecha)
        ORDER BY COMCTP.FECHA_VIGENCIA DESC, COMCTP.FECHA_VALIDEZ ASC
       )
  WHERE ROWNUM=1;

  --
  v_retorno NUMBER;
  --
BEGIN
  --
  OPEN cr_comctp;
  FETCH cr_comctp INTO v_retorno;
  CLOSE cr_comctp;
  --
  RETURN v_retorno;
  --
EXCEPTION
  WHEN OTHERS THEN
    RETURN NULL;
END;
/* Obtener el estado de la Contratación */
FUNCTION OBTN_COMCOE_ID_EST
 (P_COMCON_ID IN NUMBER
 ,P_ESTADO IN VARCHAR2
 )
 RETURN NUMBER
 IS
--
--  CURSOR cr_comcoe IS
--  SELECT MAX(COMCOE.ID) ID
--  FROM COM_CONTRATACIONES_EST COMCOE
-- WHERE COMCOE.FECHA = (SELECT MAX(COMCOE2.FECHA)
--                        FROM COM_CONTRATACIONES_EST COMCOE2
--                        WHERE COMCOE2.COMCON_ID = p_comcon_id
--                          AND COMCOE2.ESTADO = p_estado)
--    AND COMCOE.COMCON_ID = p_comcon_id;
  CURSOR cr_comcoe IS
  SELECT COMCOE_ID ID
  FROM COM_CONTRATACIONES
  WHERE ID = p_comcon_id;
  --
  v_retorno NUMBER;
  --
BEGIN
  --
  OPEN cr_comcoe;
  FETCH cr_comcoe INTO v_retorno;
  CLOSE cr_comcoe;
  --
  RETURN v_retorno;
  --
END;
FUNCTION OBTN_COMCLF_CLFMOT
 (P_COMOCM_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
--
 -- Calificaciones otorgadas a la orden de provisión
 cursor cr_comclf IS
 select comclf.ID
       ,gral_pkg.obtn_cfgabr('COM_CALIFICACIONES_TMO.CALIFICACION',comclf.calificacion) calificacion_abr
 from com_calificaciones comclf
 where comclf.comocm_id = p_comocm_id
   and comclf.situacion = 'VAL';
 --
 -- Motivos de una calificación
 cursor cr_comcmo (p_comclf_id number) is
 select comcmo.id ID
      , comctm.calificacion comctm_calificacion
      , comctm.codigo comctm_codigo
      , comctm.nombre comctm_nombre
      , comctm.descripcion comctm_descripcion
 from com_calificaciones_mot comcmo
    , com_calificaciones_tmo comctm
 where comcmo.comctm_id = comctm.ID
   and comcmo.valor_sn  = 'SI'
   and comcmo.comclf_id = p_comclf_id;
 --
 v_comclf cr_comclf%ROWTYPE;
 v_motivos VARCHAR2(1000) := null;
 v_retorno VARCHAR2(1000) := null;
 l_img_loc VARCHAR2(1000) := null;
 --
BEGIN
    -- Obtener la calificación para la orden de provisión indicada por parámetro
    OPEN cr_comclf;
    FETCH cr_comclf INTO v_comclf;
    CLOSE cr_comclf;
    -- Si existe calificación
    IF v_comclf.ID IS NOT NULL THEN
        --
        v_motivos := 'Calificación '||InitCap(v_comclf.calificacion_abr)||'&#10;';
        l_img_loc := v('WORKSPACE_IMAGES');
        -- Obtener Motivos de la calificación si existen
        FOR v_comcmo IN cr_comcmo(v_comclf.ID) LOOP
            v_motivos := v_motivos||'. '||InitCap(v_comcmo.comctm_nombre)||'&#10;';
        END LOOP;
        --
        v_retorno := '<img src="' || v('WORKSPACE_IMAGES') || lower(v_comclf.calificacion_abr) || '.png" title="' || v_motivos || '"> ';
    END IF;
    --
    RETURN v_retorno;
    --
END;
FUNCTION OBTN_PERFILES_USUAR
 (P_SEGUSU_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_pfl_usu is
    select distinct segpfl_id
    from seg_perfiles_usuarios
    where segusu_id = p_segusu_id
    and fecha_vigencia <= sysdate
    and ( fecha_validez  >= sysdate or fecha_validez is null)    ;
    --
    cursor cr_pfl(v_segpfl_id NUMBER) is
    select nombre
    from seg_perfiles
    where id = v_segpfl_id;

    --

    v_desc_perfiles     VARCHAR2(4000);
    v_nombre_perfil     VARCHAR2(200);
    --v_segpfl_id   number;
--
BEGIN
    v_desc_perfiles := NULL;
    FOR v_segpfl_id IN cr_pfl_usu LOOP
        OPEN cr_pfl(v_segpfl_id.segpfl_id) ;
        FETCH cr_pfl INTO v_nombre_perfil;
        CLOSE cr_pfl;

        v_desc_perfiles := v_desc_perfiles || v_nombre_perfil || ' ';
    END LOOP;

    IF v_desc_perfiles IS NULL THEN
        v_desc_perfiles := 'Sin perfiles asignados';
    END IF;
    --
    RETURN (v_desc_perfiles);
  --
EXCEPTION
  WHEN OTHERS THEN
    raise_application_error(-20000,'Error al Obtener perfiles de usuario',true);
END;
/* Verifica si existe una Seguencia, sino la crea */
PROCEDURE VERIFICO_SQ
 (P_SECUENCIA_NUMERADOR IN VARCHAR2
 )
 IS
v_contador NUMBER;
BEGIN
   SELECT COUNT(SEQUENCE_NAME) INTO v_contador
   FROM ALL_SEQUENCES
   WHERE SEQUENCE_NAME = P_SECUENCIA_NUMERADOR;
   IF v_contador = 0 THEN
      EXECUTE IMMEDIATE ('CREATE SEQUENCE '||P_SECUENCIA_NUMERADOR||' START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE');
   END IF;
   --
EXCEPTION
   WHEN OTHERS THEN
     raise_application_error(-20000, SQLERRM, true);
END;
/* Validar Entidad Contratante segun Usuario */
FUNCTION VLDR_SEGUSU_ECO
 (P_USUARIO IN VARCHAR2
 )
 RETURN BOOLEAN
 IS
v_comeco_codigo VARCHAR2(100);
v_comeco COM_CONTRATANTES%ROWTYPE;
v_comece COM_CONTRATANTES_EST%ROWTYPE;
v_retorno BOOLEAN := FALSE;
--
BEGIN
  v_comeco_codigo := substr(p_usuario,instr(p_usuario,'.',1,2)+1,instr(p_usuario,'.',1,3)-instr(p_usuario,'.',1,2)-1);
  --
  SET_COMECO_CODIGO(p_codigo => v_comeco_codigo);
  GET_COMECO(p_comeco => v_comeco);
  --
  SET_COMECE(OBTN_COMECE_ID(v_comeco.ID));
  GET_COMECE(p_comece => v_comece);
  -- Retornar el valor de autenticación
  IF v_comece.ESTADO = 'HAB' THEN
   v_retorno := TRUE;
  ELSE
   v_retorno := FALSE;
  END IF;
  --
  RETURN (v_retorno);
  --
EXCEPTION
  WHEN OTHERS THEN
    raise_application_error(-20000,'Error al Validar la Entidad Contratante',true);
END;
/* Validar la planilla para Importar precios testigos al catalogo. */
PROCEDURE VLDR_COMDOC_CTP
 (P_ID IN COM_DOCUMENTOS.ID%TYPE
 ,P_SEPARADOR IN VARCHAR2 := ';'
 ,P_MENSAJE OUT VARCHAR2
 ,P_VALIDO OUT VARCHAR2
 )
 IS
CURSOR cr_comdoc IS
  SELECT *
  FROM COM_DOCUMENTOS COMDOC
  WHERE COMDOC.ID = p_id;

  v_longitudTotal       NUMBER;
  v_leeHasta            NUMBER         := 4000;
  v_linea_str           VARCHAR2(32767):= '';
  v_posicion            NUMBER         := 1;
  v_encontro_fin        BOOLEAN;
  -- Seteo propio para la planilla dada
  v_fin_de_linea        VARCHAR2(10)   := chr(10); -- Enter
  v_valor               VARCHAR2(2000);
  v_valor_posicion_ini  NUMBER;
  v_valor_posicion_fin  NUMBER;
  --
  v_mensaje             VARCHAR2(4000);
  v_comdoc              COM_DOCUMENTOS%ROWTYPE;
  v_clob                CLOB;
BEGIN
   v_mensaje := NULL;
   -- Cargo el Archivo en el BLOB
   v_comdoc := NULL;
   OPEN cr_comdoc;
   FETCH cr_comdoc INTO v_comdoc;
   CLOSE cr_comdoc;
   -- Convierto el BLOB a CLOB
   v_clob := COM_PKG.GET_BLOB_TO_CLOB(v_comdoc.DOCUMENTO);
   -- Defino la longitud total del archivo CLOB
   v_longitudTotal := dbms_lob.getlength(v_clob);
   -- Cargo la primer linea del Archivo LOB
   v_Linea_str := dbms_lob.substr(v_CLOB
                                 ,INSTR(dbms_lob.substr(v_CLOB,v_leeHasta,v_posicion),v_fin_de_linea)-2
                                 ,v_posicion);
   -- validar que esten presente los siguientes campos
   -- Campo Código -- columna 0
   v_valor := COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                    ,p_columna   => 0
                                    ,p_separador => p_separador);
   IF v_valor IS NULL OR UPPER(v_valor) <> 'CODIGO' THEN
     v_mensaje := v_mensaje || 'Falta el campo Código. Se encontró: "'||v_valor||'"<br>';
   END IF;
   -- Campo Descripción -- columna 1
   v_valor := COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                    ,p_columna   => 1
                                    ,p_separador => p_separador);
   IF v_valor IS NULL OR UPPER(v_valor) <> 'DESCRIPCION' THEN
     v_mensaje := v_mensaje || 'Falta el campo Descripción. Se encontró: "'||v_valor||'"<br>';
   END IF;
   -- Campo Especialidad/Rubro -- columna 2
   v_valor := COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                    ,p_columna   => 2
                                    ,p_separador => p_separador);
   IF v_valor IS NULL OR UPPER(v_valor) <> 'ESPECIALIDAD/RUBRO' THEN
     v_mensaje := v_mensaje || 'Falta el campo Especialidad/Rubro. Se encontró: "'||v_valor||'"<br>';
   END IF;
   -- Campo Clase Genérica -- columna 3
   v_valor := COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                    ,p_columna   => 3
                                    ,p_separador => p_separador);
   IF v_valor IS NULL OR UPPER(v_valor) <> 'CLASE GENERICA' THEN
     v_mensaje := v_mensaje || 'Falta el campo Clase Genérica. Se encontró: "'||v_valor||'"<br>';
   END IF;
   -- Campo Situación -- columna 4
   v_valor := COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                    ,p_columna   => 4
                                    ,p_separador => p_separador);
   IF v_valor IS NULL OR UPPER(v_valor) <> 'SITUACION' THEN
     v_mensaje := v_mensaje || 'Falta el campo Situación. Se encontró: "'||v_valor||'"<br>';
   END IF;
   -- Campo Precio Nuevo -- columna 5
   v_valor := COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                    ,p_columna   => 5
                                    ,p_separador => p_separador);
   IF v_valor IS NULL OR UPPER(v_valor) <> 'PRECIO NUEVO' THEN
    v_mensaje := v_mensaje || 'Falta el campo Precio Nuevo. Se encontró: "'||v_valor||'"<br>';
   END IF;
   -- Campo Fecha Precio -- columna 6
   v_valor := COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                    ,p_columna   => 6
                                    ,p_separador => p_separador);
   IF v_valor IS NULL OR UPPER(v_valor) <> 'FECHA DE RELEVAMIENTO' THEN
     v_mensaje := v_mensaje || 'Falta el campo Fecha de Relevamiento. Se encontró: "'||v_valor||'"<br>';
   END IF;
   -- Campo Observación -- columna 7
   v_valor := COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                    ,p_columna   => 7
                                    ,p_separador => p_separador);
   IF v_valor IS NULL OR UPPER(v_valor) <> 'OBSERVACION' THEN
     v_mensaje := v_mensaje || 'Falta el campo Observación. Se encontró: "'||v_valor||'"<br>';
   END IF;
   --
   IF v_mensaje IS NULL THEN
     p_valido  := 'SI';
   ELSE
     p_valido := 'NO';
     p_mensaje := 'El archivo no es válido.<br>'|| v_mensaje;
   END IF;
   --
 EXCEPTION
   WHEN OTHERS THEN
    p_mensaje := 'El Archivo no pudo ser validado.<br>'||v_mensaje||sqlerrm;
    p_valido := 'NO';
 END;

END COM_PKG;
