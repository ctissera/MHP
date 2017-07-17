create or replace PACKAGE BODY COMPRV_PKG IS


V_COMPRG COM_PROVEEDORES_RGP%ROWTYPE;
V_COMTDP COM_TRAMITES_PRV_DOC%ROWTYPE;
V_COMRUB COM_RUBROS%ROWTYPE;
V_COMPRA COM_PROVEEDORES_AUT%ROWTYPE;
V_COMPRV COM_PROVEEDORES%ROWTYPE;
V_COMPRE COM_PROVEEDORES_EST%ROWTYPE;
V_COMRUO COM_RUBROS_OBJ%ROWTYPE;
V_COMOBE COM_OBJETOS_EST%ROWTYPE;
V_COMOBJ COM_OBJETOS%ROWTYPE;
V_COMOBD COM_OBJETOS_DOC%ROWTYPE;
V_COMOBT COM_OBJETOS_TIPOS%ROWTYPE;
V_COMODT COM_OBJETOS_DOT%ROWTYPE;
V_COMPAD COM_PROVEEDORES_ADO%ROWTYPE;
V_COMPCT COM_PROVEEDORES_CAT%ROWTYPE;
V_COMPCC COM_PROVEEDORES_CAR%ROWTYPE;
V_COMOTT COM_OBJETOS_OTT%ROWTYPE;
V_COMCER COM_CERTIFICADOS%ROWTYPE;
V_COMCRT COM_CERTIFICADOS_TIPOS%ROWTYPE;
V_COMPCF COM_PROVEEDORES_CLF%ROWTYPE;
V_COMPPF COM_COMPRV_COMPCF%ROWTYPE;
V_COMPRS COM_PROVEEDORES_RES%ROWTYPE;
V_COMPRD COM_PROVEEDORES_DOM%ROWTYPE;


/* Validar Proveedor - Agente del Estado - Inscripcion de Proveedor */
FUNCTION COMPRV_VLDR_AGENTE
 (P_SEGORG_ID IN NUMBER
 ,P_COMTPR_CUIT IN VARCHAR2
 )
 RETURN VARCHAR2
 IS
--
   cursor cr_comeco (p_comeco_id number) is
   select *
   from com_contratantes comeco
   where comeco.id = p_comeco_id;
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
    --
    v_pre_cuit           VARCHAR2(2);
    v_nrodoc             VARCHAR2(10);
    v_suf_cuit           VARCHAR2(1);
    --
    v_document    dbms_xmldom.domdocument;
    v_nodes       dbms_xmldom.DOMNodeList;
    v_element_x   dbms_xmldom.DOMElement;
    v_node        dbms_xmldom.DOMNode;
    v_node_2      dbms_xmldom.DOMNode;
    v_tag         VARCHAR2(100);
    v_node_value  VARCHAR2(4000);
    eob           boolean; -- END-OF-BODY flag (Boolean)
    responsebody  clob := null;
    --
begin
   --
   v_url      := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'WS_URL_VALIDACION_BENEF'
                                           ,p_segorg_id =>  p_segorg_id);
   --
   -- Extender el tiempo de espera para el time oput a 10 min UTL_HTTP.set_transfer_timeout(180);

   utl_http.set_transfer_timeout(600);

   req := utl_http.begin_request(v_url,'POST','HTTP/1.1');
   --
   utl_http.set_header(req,'Content-Type','text/xml');
   utl_http.set_header(req,'Transfer-Encoding','chunked');
   --
   chunk_buffer :=
   '<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
    <soap:Body xmlns:ns1="http://dbcontable10/WSOBT_DATOS_BENF.wsdl/types/">
        <ns1:wscomprPchObtDatoBenfCuilElement>';
   --
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   --
   utl_http.write_text(req,chunk_buffer);
   --
   v_pre_cuit := substr(trim(replace(p_comtpr_cuit,'-','')),1, 2);
   v_nrodoc   := substr(trim(replace(p_comtpr_cuit,'-','')),3, 8);
   v_suf_cuit := substr(trim(replace(p_comtpr_cuit,'-','')),11,1);

   chunk_buffer :='<ns1:pPreCuit>' || v_pre_cuit || '</ns1:pPreCuit>
                   <ns1:pDni>'     || v_nrodoc   || '</ns1:pDni>
                   <ns1:pSufCuit>' || v_suf_cuit || '</ns1:pSufCuit>';
   --
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   utl_http.write_text(req,chunk_buffer);
   --
   chunk_buffer := '   </ns1:wscomprPchObtDatoBenfCuilElement>
                    </soap:Body>
                 </soap:Envelope>';

   utl_http.write_text(req,chunk_buffer);
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   --
   resp := utl_http.get_response(req);
   --
   --
   --
   --utl_http.read_text(resp, v_response_text, 32767);
   --utl_http.read_text(resp, v_response_text);
    eob := false; -- END-OF-BODY flag (Boolean)
    while not(eob) loop
        --
        begin
            utl_http.read_text(resp, v_response_text, 32767); -- buffer = VARCHAR2(32767)
            if v_response_text is not null and length(v_response_text) > 0 then
                dbms_lob.writeappend(responsebody, length(v_response_text), v_response_text);
            end if;
            exception when UTL_HTTP.END_OF_BODY then
            eob := true;
        end;
    end loop;
   --
   --
   --
   utl_http.end_response(resp);
   --
   v_document  := dbms_xmldom.newdomdocument(responsebody);
   v_nodes     := dbms_xmldom.getElementsByTagName(v_document, '*');
   --
   for i in 0..dbms_xmldom.getlength(v_nodes)-1 loop
      v_element_x  := dbms_xmldom.makeelement(xmldom.item(v_nodes,i));
      v_node       := dbms_xmldom.item(v_nodes,i);
      v_tag        := dbms_xmldom.getNodeName(v_node);
      v_node_2     := dbms_xmldom.getfirstchild(v_node);
      --
      if v_tag = 'return' then
         v_node_value := dbms_xmldom.getnodevalue(v_node_2);
      else
         v_node_value := null;
      end if;
      --
   end loop;
   --
   return v_node_value;
   --
end;
/* Indica si el Documento por Tipo de Objeto ha sido presentado */
FUNCTION COMOBD_PRESENTADO_SN2
 (P_SEGORG_ID IN NUMBER
 ,P_COMPRV_ID IN NUMBER
 ,P_COMODT_ID IN NUMBER
 ,P_COMOBJ_ID IN NUMBER
 )
 RETURN NUMBER
 IS
-- Obtener el ultimo Documento valido presentado
CURSOR cr_comobd IS
  SELECT *
  FROM (
    select comobd.ID
          ,comobd.OBLIGATORIO_SN
          ,COMOBD.FECHA_VENCIMIENTO
          --,nvl(COMOBD.fecha_vencimiento, COMOBD.fecha_presentacion) fecha_vencimiento
          ,dense_rank() over (partition by comobd.comobj_id
                                          ,comobd.comodt_id
                              order by comobd.comobj_id
                                      ,comobd.comodt_id
                                      ,nvl(comobd.fecha_vencimiento, to_date('01/01/01', 'DD/MM/YYYY')) desc) rank
    from   COM_OBJETOS comobj
          ,COM_OBJETOS_DOC comobd
    WHERE  COMOBJ.ID        = p_comobj_id
    AND    COMOBJ.COMPRV_ID = p_comprv_id
    and    comobj.SEGORG_ID = p_segorg_id
    AND    COMOBD.COMODT_ID = p_comodt_id
    AND    COMOBD.COMOBJ_ID = COMOBJ.ID
    AND    COMOBJ.COMOBE_ESTADO  = 'HAB'
    AND    COMOBD.SITUACION = 'VAL')
    WHERE  rank = 1
    AND    ROWNUM = 1;
  --
  v_comobd cr_comobd%rowtype;
  v_dias NUMBER;
  v_retorno NUMBER;
  --
BEGIN
  --
  open cr_comobd;
  fetch cr_comobd into v_comobd;
  CLOSE cr_comobd;
  --
  IF v_comobd.ID IS NULL THEN
    v_retorno := -1;
  else
    IF (v_comobd.OBLIGATORIO_SN = 'SI' AND v_comobd.FECHA_VENCIMIENTO+1 < SYSDATE) THEN
       v_retorno := -1;
    ELSE
       v_retorno := v_comobd.id;
    end if;
  end if;
  --
  RETURN V_RETORNO;
end;
/* Indica si el Documento por Tipo de Objeto ha sido presentado */
FUNCTION COMOBD_PRESENTADO_SN3
 (P_SEGORG_ID IN NUMBER
 ,P_COMPRV_ID IN NUMBER
 ,P_COMODT_ID IN NUMBER
 ,P_COMOBJ_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
-- Obtener el ultimo Documento valido presentado
  CURSOR cr_comobd IS
  SELECT *
  FROM (
    select comobd.ID
          ,comobd.OBLIGATORIO_SN
          ,COMOBD.FECHA_VENCIMIENTO
          --,nvl(COMOBD.fecha_vencimiento, COMOBD.fecha_presentacion) fecha_vencimiento
          ,dense_rank() over (partition by comobd.comobj_id
                                          ,comobd.comodt_id
                              order by comobd.comobj_id
                                      ,comobd.comodt_id
                                      ,nvl(comobd.fecha_vencimiento, to_date('01/01/01', 'DD/MM/YYYY')) desc) rank
    from   COM_OBJETOS comobj
          ,COM_OBJETOS_DOC comobd
    WHERE  COMOBJ.ID        = p_comobj_id
    AND    COMOBJ.COMPRV_ID = p_comprv_id
    AND    comobj.SEGORG_ID = p_segorg_id
    AND    COMOBJ.COMOBE_ESTADO  = 'HAB'
    AND    COMOBD.COMODT_ID = p_comodt_id
    AND    COMOBD.COMOBJ_ID = COMOBJ.ID
    AND    COMOBD.SITUACION = 'VAL')
    WHERE  rank = 1
    AND    ROWNUM = 1;
  --
  v_comobd cr_comobd%rowtype;
  v_dias NUMBER;
  v_retorno VARCHAR2(100);
  --
BEGIN
  --
  open cr_comobd;
  fetch cr_comobd into v_comobd;
  CLOSE cr_comobd;
  --
  IF v_comobd.ID IS NULL THEN
    v_retorno := '<span style="color:red"><b>NO PRESENTADO</b></span>';
  ELSE
    if (v_comobd.OBLIGATORIO_SN = 'SI' and v_comobd.FECHA_VENCIMIENTO+1 < sysdate) then
     v_dias := trunc(sysdate - v_comobd.FECHA_VENCIMIENTO);
     IF v_dias = 1 THEN
       v_retorno := '<span style="color:red"><b>VENCIDO ayer</b></span>';
     ELSE
       v_retorno := '<span style="color:red"><b>VENCIDO hace '||v_dias||' dias</b></span>';
     end if;
    else
      v_retorno := 'PRESENTADO';
    end if;
  end if;
  --
  RETURN V_RETORNO;
end;
/* Verificar si las autoridades del proveedor se encuentran vigentes */
FUNCTION COMPRA_COTIZAR_SN2
 (P_COMPRV_ID IN NUMBER
 ,P_COMPRT_ID IN NUMBER
 ,P_COMPCT_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_comprv is
    select comprt_id
          ,compct_id
      from com_proveedores
     where id = p_comprv_id;
   --
  cursor cr_comprt(p_comprt_id number) is
    select codigo
      from com_proveedores_tipos
     where id = p_comprt_id;
   --
  cursor cr_compra is
    select compra.id
      from com_proveedores_aut compra
          ,com_proveedores_car compcc
     where compra.comprv_id = p_comprv_id
       and compra.id in (select max(id)
                           from com_proveedores_aut compra1
                          where compra1.situacion not in ('NUE','ANU')
                            and compra1.comprv_id = p_comprv_id
                       group by compra1.compcc_id, compra1.numero_documento,compra1.comprv_id,compra1.tipo_documento)
       and compra.situacion = 'VIG'
       and compra.compcc_id = compcc.id
       and compcc.obligatorio_sn = 'SI'
   union
    select compra.id
      from com_proveedores_aut compra
          ,com_proveedores_car compcc
          ,(select compra.compcc_id, compra.numero_documento, compra.tipo_documento
              from com_proveedores_aut compra
             where compra.comprv_id = p_comprv_id
               and compra.id in (select max(id)
                           from com_proveedores_aut compra1
                          where compra1.situacion not in ('NUE','ANU')
                            and compra1.comprv_id = p_comprv_id
                       group by compra1.compcc_id, compra1.numero_documento,compra1.comprv_id,compra1.tipo_documento)
               and compra.situacion = 'MAR')compra2
     where compra.comprv_id = p_comprv_id
       and compra.compcc_id = compra2.compcc_id
       and compra.numero_documento = compra2.numero_documento
       and compra.tipo_documento = compra2.tipo_documento
       and compra.situacion = 'VIG'
       and compra.compcc_id = compcc.id
       and compcc.obligatorio_sn = 'SI';
  --
v_comprv cr_comprv%rowtype;
v_comprt cr_comprt%rowtype;
v_retorno varchar2 (2) := 'SI';
begin

    -- Recupero datos del Proveedor
    --open cr_comprv;
    --fetch cr_comprv into v_comprv;
    --close cr_comprv;
    --
    --open cr_comprt(p_comprt_id => v_comprv.comprt_id);
    open cr_comprt(p_comprt_id => p_comprt_id);
    fetch cr_comprt into v_comprt;
    close cr_comprt;
    -- Si es una persona física puede corizar
    if v_comprt.codigo = 'JUR' then
       --SI es una persona jurídica y no tiene autoridades declaradas, no puede cotizar
       if v_comprv.compct_id is null then
          v_retorno := 'NO';
       else
          -- Controlar si el proveedor tiene autoridades vencidas
        --if COMPRV_PKG.COMPRA_VENCIDAS_SN(p_comprv_id => p_comprv_id) = 'SI' then
          if COMPRV_PKG.COMPRA_VENCIDAS_SN2(p_comprv_id => p_comprv_id, p_compct_id => p_compct_id) = 'SI' then
            -- Si tiene autoridades vencidas, no puede cotizar
            v_retorno := 'NO';
          else
            -- Controlar si debe documentación alguna autoridad
            for v_compra in cr_compra loop
               if v_retorno = 'SI' then
                  if  COMPRV_PKG.COMPRA_DEBE_SN(p_compra_id => v_compra.id) = 'SI' then
                     v_retorno := 'NO';
                  else
                     v_retorno := 'SI';
                  end if;
               end if;
            end loop;
          end if;
       end if;
    end if;
  return v_retorno;
end;
FUNCTION COMPRV_COTIZAR_SN_2
 (P_COMPRV_ID IN NUMBER
 ,P_COMPRT_ID IN NUMBER
 ,P_COMCTT_ID IN NUMBER
 ,P_FECHA IN DATE := SYSDATE
 )
 RETURN VARCHAR2
 IS
-- Buscar los documentos obligatorios para un tipo de contratacion
  -- que el proveedor debe presentar
  cursor cr_compdo is
    select COUNT(DISTINCT(COMPDT.NOMBRE)) COMPDT_NOMBRE
    from com_compdt_comprt      comptt
        ,com_proveedores_dot    compdt
--      ,com_proveedores_dte    compde
        ,com_compdt_comctt      comcct
    where comptt.COMPRT_ID          = p_comprt_id
--  AND compdt.ID                   = compde.COMPDT_ID
--  AND compde.ID                   = com_pkg.obtn_compde_id (compdt.ID)
    AND comptt.COMPDT_ID            = compdt.ID
--  AND compde.ESTADO               = 'HAB'
    AND compdt.COMPDE_ESTADO        = 'HAB'
    AND compdt.TIPO                 = 'GEN'
    AND comcct.COMPDT_ID            = COMPDT.id
    AND comcct.NECESARIO_COTIZAR_SN = 'SI'
    AND comcct.COMCTT_ID            = P_COMCTT_ID
    AND com_pkg.obtn_comdoc_no_fmt4 (p_segorg_id            => COMPDT.SEGORG_ID
                                    ,p_comprv_id            => p_comprv_id
                                    ,p_comprt_id            => p_comprt_id
                                    ,p_compdt_id            => COMPDT.ID
                                    ,P_COMPDT_TIPO          => COMPDT.TIPO
                                    ,P_COMPDT_TIPO_DURACION => COMPDT.TIPO_DURACION
                                    ,P_COMPDE_ESTADO        => compdt.COMPDE_ESTADO --COMPDE.ESTADO
                                    ,p_fecha                => P_FECHA) not in ('VIGENTE','SUSPENDIDO');
  --
  -- Buscar los documentos obligatorios para TODOS los tipos de contratacion
  -- que el proveedor debe presentar
  cursor cr_compdo_2 is
    select COUNT(DISTINCT(COMPDT.NOMBRE)) COMPDT_NOMBRE
    from com_compdt_comprt     comptt
        ,com_proveedores_dot   compdt
--      ,com_proveedores_dte   compde
    where comptt.COMPRT_ID    = p_comprt_id
--  AND compdt.ID             = compde.COMPDT_ID
--  AND compde.ID             = com_pkg.obtn_compde_id (compdt.ID)
    AND comptt.COMPDT_ID      = compdt.ID
--  AND compde.ESTADO         = 'HAB'
    AND compdt.compde_ESTADO  = 'HAB'
    AND compdt.TIPO           = 'GEN'
    AND comptt.OBLIGATORIO_SN = 'SI'
    AND com_pkg.obtn_comdoc_no_fmt4 (p_segorg_id            => COMPDT.SEGORG_ID
                                    ,p_comprv_id            => p_comprv_id
                                    ,p_comprt_id            => p_comprt_id
                                    ,p_compdt_id            => COMPDT.ID
                                    ,P_COMPDT_TIPO          => COMPDT.TIPO
                                    ,P_COMPDT_TIPO_DURACION => COMPDT.TIPO_DURACION
                                    ,P_COMPDE_ESTADO        => COMPDT.COMPDE_ESTADO --COMPDE.ESTADO
                                    ,p_fecha                => P_FECHA) not in ('VIGENTE','SUSPENDIDO');
  v_compre COM_PROVEEDORES_EST%rowtype;
  v_comprv COM_PROVEEDORES%rowtype;
  v_dummy NUMBER;
  v_retorno varchar2(2):='SI';
begin
  --Validar Estado Proveedor
  COMPRV_PKG.COMPRE_SET(p_id =>  com_pkg.obtn_compre_id (p_comprv_id));
  COMPRV_PKG.COMPRE_GET(p_compre => v_compre);
  COMPRV_PKG.COMPRE_INI;
  --
  if nvl(v_compre.ESTADO,'XXX') in ('HAB','PEN') then
    --
    OPEN cr_compdo_2;
    FETCH cr_compdo_2 INTO v_dummy;
    CLOSE cr_compdo_2;
    --
    IF v_dummy <> 0 THEN
      v_retorno:= 'NO';
    END IF;
    --
    if v_retorno = 'SI' then
      --
      v_dummy := 0;
      if p_comctt_id is not null then
        OPEN cr_compdo;
        FETCH cr_compdo INTO v_dummy;
        CLOSE cr_compdo;
      end if;
      --
      IF v_dummy <> 0 THEN
        v_retorno:='NO';
      END IF;
      --
    end if;
    --
  else
    v_retorno := 'NO';
  end if;
  --
  RETURN (v_retorno);
  --
EXCEPTION
  when others then
     raise_application_error(-20000,'Error al intentar determinar si el proveedor está al día con su documentación para cotizar',true);
end;
/* Habilitado para cotizar por rubro, por proveedor y contratacion */
FUNCTION COMPRV_HABILITADO_COTIZAR_SN_2
 (P_COMPRV_ID IN NUMBER
 ,P_COMPRT_ID IN NUMBER
 ,P_COMRUB_ID IN NUMBER
 ,P_COMCTT_ID IN NUMBER
 ,P_COMCON_ID IN NUMBER := null
 ,P_COMPCT_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_segcfg is
  select segcfg.VALOR
  from   SEG_CONFIGURACIONES segcfg
  where  segcfg.CODIGO = 'COMPRV_CTRL_RUBRO_GRAL';
  --
cursor cr_compra_cfg is
  select compra_cfg.VALOR
  from   SEG_CONFIGURACIONES compra_cfg
  where  compra_cfg.CODIGO = 'COMPRA_FECHA_LIMITE';
  --
  v_retorno varchar2(2) := 'SI';
  v_valor varchar2(2000);
  v_fecha_limite varchar2(2000);
  v_comcon COM_CONTRATACIONES%rowtype;
begin
  -- Obtener la configuracion que indica si se aplica el control general
  -- sobre todos los documentos en todos los rubros
  open cr_segcfg;
  fetch cr_segcfg into v_valor;
  close cr_segcfg;
  --
  open cr_compra_cfg;
  fetch cr_compra_cfg into v_fecha_limite;
  close cr_compra_cfg;
  --
  if v_valor is null then
     v_valor := 'SI';
  end if;
  -- Si la configuracion indica SI, se deben controlar
  -- todos los documentos,  generales, por rubro y por contratacion
  if v_valor = 'SI' then
    -- Control por contratacion, Control por Rubro
      if COMPRV_COTIZAR_SN_2(p_comprv_id => p_comprv_id
                            ,p_comprt_id => p_comprt_id
                            ,p_comctt_id => p_comctt_id) = 'NO' then
       v_retorno := 'NO';
      end if;
    --
    if v_retorno = 'SI' then
       if COMPRV_COTIZAR_RUB_SN(p_comprv_id => p_comprv_id) = 'NO' then
         v_retorno := 'NO';
       end if;
    end if;
  -- Si solo se debe controlar el rubro específico
  else
    --
      if COMPRV_COTIZAR_SN_2(p_comprv_id => p_comprv_id
                            ,p_comprt_id => p_comprt_id
                            ,p_comctt_id => p_comctt_id) = 'NO' then
         v_retorno := 'NO';
      end if;
    --
    if v_retorno = 'SI' then
      if p_comrub_id is not null then
         --raise_application_error(-20000,'El Identificador del Rubro no ha sido indicado y es un dato obligatorio para aplicar este control',true);

        if COMPRV_COMRUB_COTIZAR_SN(p_comprv_id => p_comprv_id
                                   ,p_comrub_id => p_comrub_id) = 'NO' then
           v_retorno := 'NO';
        end if;
      end if;
    end if;
  end if;
  -- Verificar Autoridades si superó la Fecha Limite para Bloquear la Cotización
  if v_retorno = 'SI' and TO_DATE(v_fecha_limite,'DD/MM/YYYY') < trunc(SYSDATE) then
    -- Verificar Autoridades
    if COMPRA_COTIZAR_SN2(p_comprv_id => p_comprv_id, p_comprt_id => p_comprt_id, p_compct_id => p_compct_id) = 'NO' then
      v_retorno := 'NO';
    end if;
  end if;
  -- Si esta al día con la documentación
  -- pero se ha dado de baja del rubro que corresponde a la solicitud incluida en el proceso
  -- con posterioridad a la fecha de invitación, esto significa que el proveedor esta intentando
  -- no cumplir con los requisitos correspondientes al rubro y se debe evitar que esto suceda
  -- si el proveedor se ha dado de baja del rubro con posterioridad a la fecha de invitación no permitir cotizar.
  -- Modificación introducida en fecha 05/07/2013 a pedido del Programa Compras
  --
  if v_retorno = 'SI' and p_comcon_id is not null then
    --
    v_retorno := COMPRV_RUBROHAB_SN(p_comprv_id => p_comprv_id
                                   ,p_comcon_id => p_comcon_id);
    --
  end if;
  --
  return v_retorno;
end;
/* Indica si se ha vencido la duración del cargo de una autoridad. */
FUNCTION COMPRA_VENCIDAS_SN2
 (P_COMPRV_ID IN NUMBER
 ,P_COMPCT_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_comprv is
  select compct_id
  from com_proveedores
  where id = P_COMPRV_ID;
  --
  -- Cantidad de cargos obligatorios registrados para el proveedor
  -- que se encuentran vigentes y no vencidos
  cursor cr_compra is
  select count(compra.id)
  from com_proveedores_aut compra
      ,com_proveedores_car compcc
  where compra.ID in (select MAX(ID)
                      from (com_proveedores_aut)
                      where situacion not in ('NUE','ANU')
                        and comprv_id = P_COMPRV_ID
                      group by tipo_documento,numero_documento,compcc_id)
    and compra.compcc_id = compcc.id
    and compcc.obligatorio_sn = 'SI'
    and compra.situacion in ('VIG','MAR')
    and fecha_vencimiento > sysdate;
    --
  cursor cr_compcc (p_compct_id number) is
      select nvl(sum(cantidad_min),0)
      from   com_proveedores_car compcc
      where  compcc.compct_id      = p_compct_id
      and    compcc.obligatorio_sn = 'SI';

v_comprv cr_comprv%ROWTYPE;
v_compra number;
v_compcc number;
begin

   --open cr_comprv;
   --fetch cr_comprv into v_comprv;
   --close cr_comprv;
   -- Recupero las autoridades
   open cr_compra;
   fetch cr_compra into v_compra;
   close cr_compra;
          --
   open cr_compcc(p_compct_id => p_compct_id); -- v_comprv.compct_id);
   fetch cr_compcc into v_compcc;
   close cr_compcc;
   --Controlar que todos los cargos obligatorios esten vigentes
   if v_compra < v_compcc then
        return 'SI';
   else
        return 'NO';
   end if;
end;
/* Indica si se debe documentación de un Objeto */
FUNCTION COMOBJ_DEBE_SN
 (P_COMPRV_ID IN NUMBER
 ,P_COMOBJ_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
-- Obtener los Tipos de Documentos Vigentes para un Proveedor y Objeto dado
  cursor cr_comodt is
    select comott.COMODT_ID
          ,comott.OBLIGATORIO_SN
          ,COMPRV_PKG.COMOBD_PRESENTADO_SN(p_segorg_id => comobj.SEGORG_ID
                                          ,p_comprv_id => comobj.COMPRV_ID --p_comprv_id
                                          ,p_comodt_id => comott.COMODT_ID
                                          ,p_comobj_id => comobj.ID        --p_comobj_id
                                          ) ESTADO_DOCUMENTO
    from   COM_OBJETOS       comobj
          ,COM_OBJETOS_TIPOS comobt
          ,COM_OBJETOS_OTT   comott
          ,COM_OBJETOS_DOT   comodt
    where  comobj.COMPRV_ID = p_comprv_id
    and    comobj.ID        = p_comobj_id
    and    comobj.COMOBT_ID = comobt.ID
    and    comobt.ID        = comott.COMOBT_ID
    and    comobt.SITUACION = 'VIG'
    and    comott.COMODT_ID = comodt.ID
    and    comott.SITUACION = 'VIG'
    and    comodt.SITUACION = 'VIG';
  --
  v_comodt cr_comodt%rowtype;
  v_retorno varchar2(2) := 'SI';
begin
   open cr_comodt;
   -- Recorrer cada tipo de documento para el tipo de objeto indicado
   loop
     --
     fetch cr_comodt into v_comodt;
     exit when cr_comodt%notfound;
     -- Si el documento no ha sido presentado el proveedor debe documentacion para el objeto dado
     if v_comodt.ESTADO_DOCUMENTO <> 'PRESENTADO' and v_comodt.OBLIGATORIO_SN ='SI' then
       v_retorno := 'SI';
       exit;
     else
       v_retorno := 'NO';
     end if;
     --
   end loop;
   --
   close cr_comodt;
   -- Devolver si el proveedor debe o no Documentación
   return v_retorno;
end;
/* Determinar si se emite el certificado. */
FUNCTION COMPRV_EMITIR_CRT_SN
 (P_COMPRV_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
v_retorno varchar2(2);
begin
v_retorno := 'SI';
-- Verificar si debe documentación general
 if COMPRV_PKG.COMPRV_HABILITADO_COTIZAR_SN(p_comprv_id => p_comprv_id
                                            ,p_comctt_id => null
                                            ,p_comrub_id => null) =  'SI' THEN
   --Verificar que no deba documentación en ningun rubro
   --Si el parámetro de configuración COMPRV_CTRL_RUBRO_GRAL está configurado en NO
   --la función anterior devolverá que el proveedor está al día si no debe documentación general
   -- sin tener en cuenta los rubros, por eso corroboramos que no deba en nungún otro rubro.
   if COMPRV_PKG.COMPRV_COTIZAR_RUB_SN(p_comprv_id => p_comprv_id) = 'NO' then
         v_retorno := 'NO';
   end if;
 else
      v_retorno := 'NO';
 end if;

return v_retorno;

end;
/* Recupera un registro desde la variable de paquete */
PROCEDURE COMCER_GET
 (P_COMCER OUT COM_CERTIFICADOS%ROWTYPE
 )
 IS
begin

  p_comcer := v_comcer;

end;
/* Inicializar la variable de paquete */
PROCEDURE COMCER_INI
 IS
begin
  v_comcer := null;
end;
/* Insertar un registro en la tabla COM_CERTIFICADOS */
PROCEDURE COMCER_INS
 (P_COMCER IN COM_CERTIFICADOS%ROWTYPE
 )
 IS
begin
  insert into COM_CERTIFICADOS
  (
    ID
   ,SEGORG_ID
   ,COMCRT_ID
   ,CODIGO
   ,AUTORIDAD_CERTIFICADA
   ,REPRESENTANTE_AUT_CERTIFICADA
   ,OBJETO_CERTIFICADO
   ,OBJETO_DETALLE
   ,AUTORIDAD_CERTIFICANTE
   ,REPRESENTANTE_AUT_CERTIFICANTE
   ,FECHA_EMISION
   ,FECHA_VENCIMIENTO
   ,COSTO
   ,COMPRV_ID
   ,COMCON_ID
   ,ESTADO
   ,FECHA_ESTADO
   ,MOTIVO_ESTADO
   ,DATE_CREATED
   ,CREATED_BY
   ,DATE_MODIFIED
   ,MODIFIED_BY
  )
  values
  (
    p_comcer.ID
   ,p_comcer.SEGORG_ID
   ,p_comcer.COMCRT_ID
   ,p_comcer.CODIGO
   ,p_comcer.AUTORIDAD_CERTIFICADA
   ,p_comcer.REPRESENTANTE_AUT_CERTIFICADA
   ,p_comcer.OBJETO_CERTIFICADO
   ,p_comcer.OBJETO_DETALLE
   ,p_comcer.AUTORIDAD_CERTIFICANTE
   ,p_comcer.REPRESENTANTE_AUT_CERTIFICANTE
   ,p_comcer.FECHA_EMISION
   ,p_comcer.FECHA_VENCIMIENTO
   ,p_comcer.COSTO
   ,p_comcer.COMPRV_ID
   ,p_comcer.COMCON_ID
   ,p_comcer.ESTADO
   ,p_comcer.FECHA_ESTADO
   ,p_comcer.MOTIVO_ESTADO
   ,p_comcer.DATE_CREATED
   ,p_comcer.CREATED_BY
   ,p_comcer.DATE_MODIFIED
   ,p_comcer.MODIFIED_BY
  );
end;
/* Establecer la variable de paquete v_comcer */
PROCEDURE COMCER_SET
 (P_ID IN NUMBER
 )
 IS
cursor cr_comcer is
  select *
  from COM_CERTIFICADOS
  where id = p_id;
begin

  COMCER_INI;

  open cr_comcer;

  fetch cr_comcer into v_comcer;

  close cr_comcer;


end;
/* Generar Invitaciones */
PROCEDURE COMCOI_GENERAR
 (P_COMCON_ID IN COM_CONTRATACIONES.ID%TYPE
 )
 IS
-- Definición de Cursores
 CURSOR cr_comprv_v IS
  SELECT DISTINCT COMPRR.COMPRV_ID COMPRV_ID
 FROM COM_CONTRATACIONES_DETALLES COMCOT
    , COM_RUBCOB             COMRCB
    , COM_PROVEEDORES_RUB    COMPRR
    , COM_PROVEEDORES        COMPRV
    , COM_PROVEEDORES_EST    COMPRE
    , COM_PEDIDOS            COMPED
    , COM_RUBROS             COMRUB
 WHERE COMCOT.COMCON_ID = P_COMCON_ID
   AND COMCOT.COMPED_ID = COMPED.ID
   AND COMPED.COMCOB_ID = COMRCB.COMCOB_ID
   AND COMPRR.COMRUB_ID = COMRCB.COMRUB_ID
   AND COMPRR.COMPRV_ID = COMPRV.ID
   AND COMPRR.COMRUB_ID = COMRUB.ID
   AND COMPRE.ID = com_pkg.obtn_compre_id (COMPRV.ID)
   AND COMPRR.COMPRV_ID NOT IN (SELECT COMPRV_ID
                                FROM COM_CONTRATACIONES_INV COMCOI
                                WHERE COMCOI.COMCON_ID = p_comcon_id)
   AND COMPRE.ESTADO IN ('PEN','HAB')
   AND COMPRR.SITUACION = 'ACT'
   AND COMRCB.SITUACION = 'VIG'
   AND COMRUB.SITUACION = 'VIG';
 --
 v_comcoi COM_CONTRATACIONES_INV%ROWTYPE;
BEGIN
  -- Obtener los Proveedores asociados al Objeto Compra del Pedido
  FOR v_comprv_v IN cr_comprv_v LOOP
    -- Insertar al listado de Invitaciones
    v_comcoi.COMCON_ID  := p_comcon_id;
    v_comcoi.COMPRV_ID  := v_comprv_v.COMPRV_ID;
    v_comcoi.FECHA      := SYSDATE;
    v_comcoi.SITUACION  := 'PEN';
    v_comcoi.OBSERVACION:= '';
    --
    COM_PKG.INS_COMCOI(p_comcoi => v_comcoi);
    --
  END LOOP;
  --
END;
PROCEDURE COMCOI_GENERAR_RUB
 (P_COMCON_ID IN NUMBER
 ,P_COMRUB_ID IN NUMBER
 )
 IS
-- Definición de Cursores
 CURSOR cr_comprv_v IS
  SELECT DISTINCT COMPRR.COMPRV_ID COMPRV_ID
 FROM COM_CONTRATACIONES_DETALLES COMCOT
    , COM_RUBCOB             COMRCB
    , COM_PROVEEDORES_RUB    COMPRR
    , COM_PROVEEDORES        COMPRV
    , COM_PROVEEDORES_EST    COMPRE
    , COM_PEDIDOS            COMPED
    , COM_RUBROS             COMRUB
 WHERE COMCOT.COMCON_ID = P_COMCON_ID
   AND COMCOT.COMPED_ID = COMPED.ID
   AND COMPED.COMCOB_ID = COMRCB.COMCOB_ID
   AND COMPRR.COMRUB_ID = P_COMRUB_ID
   AND COMPRR.COMPRV_ID = COMPRV.ID
   AND COMPRR.COMRUB_ID = P_COMRUB_ID
   AND COMPRE.ID = com_pkg.obtn_compre_id (COMPRV.ID)
   AND COMPRR.COMPRV_ID NOT IN (SELECT COMPRV_ID
                                FROM COM_CONTRATACIONES_INV COMCOI
                                WHERE COMCOI.COMCON_ID = p_comcon_id)
   AND COMPRE.ESTADO IN ('PEN','HAB')
   AND COMPRR.SITUACION = 'ACT'
   AND COMRCB.SITUACION = 'VIG'
   AND COMRUB.SITUACION = 'VIG';
 --
 v_comcoi COM_CONTRATACIONES_INV%ROWTYPE;
BEGIN
  -- Obtener los Proveedores asociados al Objeto Compra del Pedido
  FOR v_comprv_v IN cr_comprv_v LOOP
    -- Insertar al listado de Invitaciones
    v_comcoi.COMCON_ID  := p_comcon_id;
    v_comcoi.COMPRV_ID  := v_comprv_v.COMPRV_ID;
    v_comcoi.FECHA      := SYSDATE;
    v_comcoi.SITUACION  := 'PEN';
    v_comcoi.OBSERVACION:= '';
    --
    COM_PKG.INS_COMCOI(p_comcoi => v_comcoi);
    --
  END LOOP;
  --
END;
PROCEDURE COMCRT_GET
 (P_COMCRT OUT COM_CERTIFICADOS_TIPOS%ROWTYPE
 )
 IS
begin

  p_comcrt := v_comcrt;

end;
/* Inicializar la variable de paquete */
PROCEDURE COMCRT_INI
 IS
begin

  v_comcrt := null;

end;
/* Insertar registro en la tabla COM_CERTIFICADOS_TIPOS */
PROCEDURE COMCRT_INS
 (P_COMCRT IN COM_CERTIFICADOS_TIPOS%ROWTYPE
 )
 IS
begin

  insert into COM_CERTIFICADOS_TIPOS (
   ID
  ,SEGORG_ID
  ,CODIGO
  ,NOMBRE
  ,DESCRIPCION
  ,TEXTO_CABECERA
  ,TEXTO_PIE
  ,DATOS_COMPRV_SN
  ,DATOS_COMCON_SN
  ,SITUACION
  ,PLANTILLA_XML
  ,COSTO
  ,VIGENCIA_DIAS
  ,FECHA_SITUACION
  ,MOTIVO_SITUACION
  ,DATE_CREATED
  ,CREATED_BY
  ,DATE_MODIFIED
  ,MODIFIED_BY
  )
  values(
   p_comcrt.ID
  ,p_comcrt.SEGORG_ID
  ,p_comcrt.CODIGO
  ,p_comcrt.NOMBRE
  ,p_comcrt.DESCRIPCION
  ,p_comcrt.TEXTO_CABECERA
  ,p_comcrt.TEXTO_PIE
  ,p_comcrt.DATOS_COMPRV_SN
  ,p_comcrt.DATOS_COMCON_SN
  ,p_comcrt.SITUACION
  ,p_comcrt.PLANTILLA_XML
  ,p_comcrt.COSTO
  ,p_comcrt.VIGENCIA_DIAS
  ,p_comcrt.FECHA_SITUACION
  ,p_comcrt.MOTIVO_SITUACION
  ,p_comcrt.DATE_CREATED
  ,p_comcrt.CREATED_BY
  ,p_comcrt.DATE_MODIFIED
  ,p_comcrt.MODIFIED_BY
  );
end;
/* Establecer la variable de paquete v_comcrt; */
PROCEDURE COMCRT_SET
 (P_ID IN number
 )
 IS
cursor cr_comcrt is
  select *
  from COM_CERTIFICADOS_TIPOS
  where ID = p_id;
begin
  --
  comcrt_ini;
  --
  open cr_comcrt;
  fetch cr_comcrt into v_comcrt;
  close cr_comcrt;
  --
end;
/* Establecer la variable de paquete v_comcrt */
PROCEDURE COMCRT_SET_CODIGO
 (P_CODIGO IN VARCHAR2
 )
 IS
cursor cr_comcrt is
  select *
  from COM_CERTIFICADOS_TIPOS
  where codigo = p_codigo;
begin
  --
  COMCRT_INI;
  --
  open cr_comcrt;
  fetch cr_comcrt into v_comcrt;
  close cr_comcrt;
  --
end;
/* Copiar una cotizacion existente de una contratacion */
PROCEDURE COMCTZ_COPIAR
 (P_COMCTZ_ID IN NUMBER
 ,P_COMCTZ_NUE OUT NUMBER
 )
 IS
-- Obtener la cotizacion de origen
  cursor cr_comctz is
    select comctz.*
    from   COM_COTIZACIONES comctz
    where  comctz.ID = p_comctz_id;
-- Obtener el detalle de la cotizacion
  cursor cr_comczd is
    select comczd.*
    from   COM_COTIZACIONES_DETALLES comczd
    where  comczd.COMCTZ_ID = p_comctz_id;
--
  v_comctz cr_comctz%rowtype;
  v_comctz_crear COM_COTIZACIONES%rowtype;
  v_comctz_nue number;
  v_comczd_crear COM_COTIZACIONES_DETALLES%rowtype;
  v_comctz_num number;
begin
  COMPRV_PKG.COMCTZ_COPIAR_VLD(p_comctz_id => p_comctz_id);

  -- Obtener la contratacion a la que pertenece la cotizacion
  open cr_comctz;
  fetch cr_comctz into v_comctz;
  close cr_comctz;
  -- Obtener la cantidad de cotizaciones presentadas
  v_comctz_num := COMPRV_PKG.OBTN_COMCTZ_PRE(p_comprv_id => v_comctz.COMPRV_ID
                                            ,p_comcon_id => v_comctz.COMCON_ID);
 -- Crear la nueva cotizacion
  v_comctz_nue := COMCTZ_ID.nextval;
  v_comctz_crear.ID :=  v_comctz_nue;
  v_comctz_crear.SEGORG_ID := v_comctz.SEGORG_ID;
  v_comctz_crear.COMCON_ID  := v_comctz.COMCON_ID;
  v_comctz_crear.COMPRV_ID  := v_comctz.COMPRV_ID;
  v_comctz_crear.CODIGO     := v_comctz_nue;
  v_comctz_crear.FECHA      := SYSDATE;
  v_comctz_crear.OBSERVACION:= 'Oferta '||to_char(NVL(v_comctz_num,0)+1);
  v_comctz_crear.SITUACION  := 'NUE';
  --
  COM_PKG.INS_COMCTZ(p_comctz => v_comctz_crear);
  -- Obtener el detalle de la cotizacion de origen
  for v_comczd in cr_comczd loop
    --v_comczd_crear.ID := null;
    v_comczd_crear.COMCTZ_ID := v_comctz_nue;
    v_comczd_crear.COMPED_ID  := v_comczd.COMPED_ID;
    v_comczd_crear.COMPET_ID  := v_comczd.COMPET_ID;
    v_comczd_crear.PRECIO_UNITARIO_FINAL := v_comczd.PRECIO_UNITARIO_FINAL;
    v_comczd_crear.MARCA      := v_comczd.MARCA;
    v_comczd_crear.MODELO     := v_comczd.MODELO;
    v_comczd_crear.OBSERVACION:= v_comczd.OBSERVACION;
    -- Inserto la copia del detalle en la nueva cotización
    COM_PKG.INS_COMCZD(p_comczd => v_comczd_crear);
  end loop;
  --
  p_comctz_nue := v_comctz_nue;
end;
/* Determina si es posible realizar una copia de la cotizacion */
FUNCTION COMCTZ_COPIAR_SN
 (P_COMCTZ_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
begin
  COMPRV_PKG.COMCTZ_COPIAR_VLD(p_comctz_id => p_comctz_id);
  return 'SI';
exception
  when others then
    return 'NO';
end;
/* Validar la copia de una cotizacion */
PROCEDURE COMCTZ_COPIAR_VLD
 (P_COMCTZ_ID IN NUMBER
 )
 IS
-- Obtener los datos de la cotizacion de origen
  cursor cr_comctz is
    select comctz.*
    from   COM_COTIZACIONES comctz
    where  comctz.ID = p_comctz_id;
-- Obtener los datos de la contratacion a la que pertenece la cotizacion
  cursor cr_comcon(p_comcon_id number) is
    select *
    from   COM_CONTRATACIONES comcon
    where  comcon.ID = p_comcon_id;
--
  v_comctz cr_comctz%rowtype;
  v_comcon cr_comcon%rowtype;
  v_comprv COM_PROVEEDORES%rowtype;
  v_comcon_estado varchar2(100);
  v_comctz_num number;
begin
  open cr_comctz;
  fetch cr_comctz into v_comctz;
  close cr_comctz;
  --
  if v_comctz.ID is null then
    raise_application_error(-20000, 'La cotización indicada no es una cotización valida.', true);
  end if;
  --
  open cr_comcon(v_comctz.COMCON_ID);
  fetch cr_comcon into v_comcon;
  close cr_comcon;
  --
  if v_comcon.ID is null then
    raise_application_error(-20000, 'La contratación indicada no es una contratación valida.', true);
  end if;
  -- Obtener el estado de la contratación a la que pertenece la cotizacion de origen
  v_comcon_estado := COM_PKG.OBTN_COMCON_ESTADO(p_comcon_id => v_comctz.COMCON_ID
                                               ,p_comprv_id => v_comctz.COMPRV_ID);
  --
  if v_comcon_estado <> 'ABIERTO' then
     raise_application_error(-20000, 'No es posible copiar una cotizacion de una contratatacion que no se encuentra en estado ABIERTO.', true);
  end if;
  -- Número de cotizaciones presentadas de la contratacion
  v_comctz_num := COMPRV_PKG.OBTN_COMCTZ_PRE(p_comprv_id => v_comctz.COMPRV_ID
                                            ,p_comcon_id => v_comctz.COMCON_ID)+1;
  --
  if nvl(v_comctz_num,0) >= v_comcon.LIMITE_MAX_COMCTZ then
    raise_application_error(-20000, 'La cantidad de cotizaciones ('||v_comctz_num||') es mayor que la cantidad obligatoria, que es '||v_comcon.LIMITE_MAX_COMCTZ, true);
  end if;
end;
FUNCTION F_COMPRV_DATOS_WS
 (P_CUIT IN VARCHAR2
 )
 RETURN VARCHAR2
 IS
--
  cursor cr_comprd (p_comprv_id number) is
  select *
  from com_proveedores_dom
  where comprv_id = p_comprv_id;
  --
  cursor cr_comdom (p_comdom_id number, p_comdmt_id number) is
  select *
  from com_domicilios
  where id = p_comdom_id
  and comdmt_id = p_comdmt_id;
  --
  v_compre  COM_PROVEEDORES_EST%rowtype;
  v_comprv  COM_PROVEEDORES%rowtype;
  v_comprd  COM_PROVEEDORES_DOM%rowtype;
  v_segorg  SEG_ORGANIZACIONES%rowtype;
  v_comdmt  COM_DOMICILIOS_TIPOS%rowtype;
  v_comdom  COM_DOMICILIOS%rowtype;
  v_dummy   NUMBER;
  --
   p_razon_social    VARCHAR2(200) := null;
   p_condicion_ib    VARCHAR2(20)  := null;
   p_cbu             VARCHAR2(30)  := null;
   p_email           VARCHAR2(50)  := null;
   p_nro_inscrip_ib  VARCHAR2(20)  := null;
   p_fec_inscrip_ib  VARCHAR2(20)  := null;
   p_nro_cml         VARCHAR2(30)  := null;
   p_calle           VARCHAR2(100) := null;
   p_numero_casa     VARCHAR2(10)  := null;
   p_piso            VARCHAR2(3)   := null;
   p_dpto            VARCHAR2(5)   := null;
   p_localidad       VARCHAR2(30)  := null;
   p_departamento    VARCHAR2(30)  := null;
   p_provincia       VARCHAR2(20)  := null;
   p_pais            VARCHAR2(20)  := null;
   p_codigo_postal   VARCHAR2(10)  := null;
   p_tel_codigo_area VARCHAR2(20)  := null;
   p_tel_numero      VARCHAR2(20)  := null;
   P_RETURN          VARCHAR2(4000);
   --
begin

   --Obtener Organizacion
   SEG_PKG.SET_SEGORG_CODIGO(p_codigo => 'PCYCSL');
   SEG_PKG.GET_SEGORG(p_segorg => v_segorg);
   SEG_PKG.INI_SEGORG;
   dbms_output.put_line('v_segorg = ' || v_segorg.ID);

   --Validar Proveedor existe
   COM_PKG.SET_COMPRV_CUIT(p_segorg_id => v_segorg.id
                          ,p_cuit      => p_cuit);
   COM_PKG.GET_COMPRV(p_comprv => v_comprv);
   COM_PKG.INI_COMPRV;
   dbms_output.put_line('v_comprv.NOMBRE = ' || v_comprv.nombre);

   --Validar Estado Proveedor
   COM_PKG.COMPRE_SET(p_id =>  com_pkg.obtn_compre_id (v_comprv.ID));
   COM_PKG.COMPRE_GET(p_compre => v_compre);
   COM_PKG.COMPRE_INI;
   --
   IF v_comprv.ID IS NOT NULL THEN
   --
      IF v_compre.ESTADO in ('HAB') THEN
         --
         p_razon_social    := v_comprv.nombre;
         p_condicion_ib    := v_comprv.condicion_ib;
         p_cbu             := v_comprv.cbu;
         p_email           := v_comprv.email;
         p_nro_inscrip_ib  := v_comprv.NUMERO_INSCRIPCION_IB;
         p_fec_inscrip_ib  := v_comprv.FECHA_INSCRIPCION_IB;
         p_nro_cml         := v_comprv.NUMERO_CONVENIO_MULTILATERAL;
         --
         COM_PKG.COMDMT_SET_CODIGO (p_codigo => 'PRV_LEGAL');
         COM_PKG.COMDMT_GET(p_comdmt => v_comdmt);
         --
         for v_comprd in cr_comprd(v_comprv.id) loop
            for v_comdom in cr_comdom (v_comprd.comdom_id, v_comdmt.id ) loop
               if v_comdom.id is not null then
                  p_calle           := v_comdom.calle;
                  p_numero_casa     := v_comdom.numero_casa;
                  p_piso            := v_comdom.piso;
                  p_dpto            := v_comdom.dpto;
                  p_localidad       := v_comdom.localidad;
                  p_departamento    := v_comdom.departamento;
                  p_provincia       := v_comdom.provincia;
                  p_pais            := v_comdom.pais;
                  p_codigo_postal   := v_comdom.codigo_postal;
                  p_tel_codigo_area := v_comdom.telefono_codigo_area;
                  p_tel_numero      := v_comdom.telefono_numero;
                  exit;
               end if;
            end loop;
         end loop;
         --
      END IF;
      --
      P_RETURN :=chr(60) || 'RazonSocial'   || chr(62) || p_razon_social   || chr(60) || '/RazonSocial'   || chr(62) ||
                 chr(60) || 'CondicionIb'   || chr(62) || p_condicion_ib   || chr(60) || '/CondicionIb'   || chr(62) ||
                 chr(60) || 'Cbu'           || chr(62) || p_cbu            || chr(60) || '/Cbu'           || chr(62) ||
                 chr(60) || 'Email'         || chr(62) || p_email          || chr(60) || '/Email'         || chr(62) ||
                 chr(60) || 'NroInscripIb'  || chr(62) || p_nro_inscrip_ib || chr(60) || '/NroInscripIb'  || chr(62) ||
                 chr(60) || 'FecInscripIb'  || chr(62) || p_fec_inscrip_ib || chr(60) || '/FecInscripIb'  || chr(62) ||
                 chr(60) || 'NroCml'        || chr(62) || p_nro_cml        || chr(60) || '/NroCml'        || chr(62) ||
                 chr(60) || 'Calle'         || chr(62) || p_calle          || chr(60) || '/Calle'         || chr(62) ||
                 chr(60) || 'NumeroCasa'    || chr(62) || p_numero_casa    || chr(60) || '/NumeroCasa'    || chr(62) ||
                 chr(60) || 'Piso'          || chr(62) || p_piso           || chr(60) || '/Piso'          || chr(62) ||
                 chr(60) || 'Dpto'          || chr(62) || p_dpto           || chr(60) || '/Dpto'          || chr(62) ||
                 chr(60) || 'Localidad'     || chr(62) || p_localidad      || chr(60) || '/Localidad'     || chr(62) ||
                 chr(60) || 'Departamento'  || chr(62) || p_departamento   || chr(60) || '/Departamento'  || chr(62) ||
                 chr(60) || 'Provincia'     || chr(62) || p_provincia      || chr(60) || '/Provincia'     || chr(62) ||
                 chr(60) || 'Pais'          || chr(62) || p_pais           || chr(60) || '/Pais'          || chr(62) ||
                 chr(60) || 'CodigoPostal'  || chr(62) || p_codigo_postal  || chr(60) || '/CodigoPostal'  || chr(62) ||
                 chr(60) || 'TelCodigoArea' || chr(62) || p_tel_codigo_area|| chr(60) || '/TelCodigoArea' || chr(62) ||
                 chr(60) || 'TelNumero'     || chr(62) || p_tel_numero     || chr(60) || '/TelNumero'     || chr(62);
      return P_RETURN;
   END IF;
   --
end;
/* ID del ultimo documento presentado del proveedor y tipo de documento */
FUNCTION COMOBD_COMPRV_OBTN_ID
 (P_COMODT_ID IN NUMBER
 ,P_COMPRV_ID IN NUMBER
 ,P_COMOBJ_ID IN NUMBER
 )
 RETURN NUMBER
 IS
cursor cr_comobj is
  select max(comobd.ID) ID
  from COM_OBJETOS_DOC comobd
      ,COM_OBJETOS comobj
  -- Modificado el 19/08/2014 por jpreda para que obtenga el documento con mayor fecha de vencimiento o el último presentado
  -- para documentos sin fecha de vencimiento.
  -- porque la fecha de presentación se ingresaba manualmente y el filtro originial daba problemas
  --where comobd.FECHA_PRESENTACION = (select max(comobd2.FECHA_PRESENTACION)
  where nvl(comobd.fecha_vencimiento,comobd.fecha_presentacion) = (select max(nvl(comobd2.fecha_vencimiento,comobd2.fecha_presentacion))
                                     from   COM_OBJETOS_DOC comobd2
                                           ,COM_OBJETOS comobj2
                                     where  comobd2.COMODT_ID = comobd.COMODT_ID --p_comodt_id
                                     and    comobd2.COMOBJ_ID = comobd.COMOBJ_ID --p_comobj_id
                                     and    comobj2.COMPRV_ID = comobj.COMPRV_ID --p_comprv_id
                                     -- Filtro agregado el 16/11/2015 por iweyler para que compare las fechas del último documento que se encuentre válido
                                     -- ya que encontraba los últimos documentos presentados de trámites pendientes, que se encontraban en estado NUEVO y
                                     -- originaba inconsistencias.
                                     and    comobd2.situacion = 'VAL')
  and   comobd.COMODT_ID = p_comodt_id
  and   comobd.COMOBJ_ID = p_comobj_id
  and   comobj.COMPRV_ID = p_comprv_id
  -- Filtro Agregado el 19/08/2014 por jpreda para prevenir que solo se obtengan los documentos con tramites aprobados
  and   comobd.SITUACION = 'VAL';
  --
  v_comobj cr_comobj%rowtype;
begin
  open cr_comobj;
  fetch cr_comobj into v_comobj;
  close cr_comobj;
  --
  return v_comobj.ID;
end;
/* Obtener el valor de la variable v_comobd. */
PROCEDURE COMOBD_GET
 (P_COMOBD OUT COM_OBJETOS_DOC%ROWTYPE
 )
 IS
begin
    p_comobd := v_comobd;
end;
/* Inicializar la variable v_comobd. */
PROCEDURE COMOBD_INI
 IS
begin
  v_comobd := null;
end;
/* Insertar registro en COM_OBJETOS_DOC. */
PROCEDURE COMOBD_INS
 (P_COMOBD IN COM_OBJETOS_DOC%ROWTYPE
 )
 IS
begin
  insert into COM_OBJETOS_DOC
  ( ID
    ,COMOBJ_ID
    ,COMODT_ID
    ,CODIGO
    ,OBSERVACION
    ,FECHA_EMISION
    ,FECHA_PRESENTACION
    ,FECHA_VENCIMIENTO
    ,OBLIGATORIO_SN
    ,DOCUMENTO
    ,FILENAME
    ,MIMETYPE
    ,LAST_UPDATE_DATE
    ,SITUACION
    ,FECHA_SITUACION
    ,MOTIVO_SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY
  )
  values
  ( p_comobd.ID
    ,p_comobd.COMOBJ_ID
    ,p_comobd.COMODT_ID
    ,p_comobd.CODIGO
    ,p_comobd.OBSERVACION
    ,p_comobd.FECHA_EMISION
    ,p_comobd.FECHA_PRESENTACION
    ,p_comobd.FECHA_VENCIMIENTO
    ,p_comobd.OBLIGATORIO_SN
    ,p_comobd.DOCUMENTO
    ,p_comobd.FILENAME
    ,p_comobd.MIMETYPE
    ,p_comobd.LAST_UPDATE_DATE
    ,p_comobd.SITUACION
    ,p_comobd.FECHA_SITUACION
    ,p_comobd.MOTIVO_SITUACION
    ,p_comobd.DATE_CREATED
    ,p_comobd.CREATED_BY
    ,p_comobd.DATE_MODIFIED
    ,p_comobd.MODIFIED_BY
   );
   end;
/* Indica si el Documento por Tipo de Objeto ha sido presentado */
FUNCTION COMOBD_PRESENTADO_SN
 (P_SEGORG_ID IN NUMBER
 ,P_COMPRV_ID IN NUMBER
 ,P_COMODT_ID IN NUMBER
 ,P_COMOBJ_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
-- Obtener el ultimo Documento valido presentado
cursor cr_comobd is
  select comobd.ID
        ,comobd.OBLIGATORIO_SN
        ,comobd.FECHA_VENCIMIENTO
  from   COM_OBJETOS comobj
        ,COM_OBJETOS_DOC comobd
  where  comobj.ID        = comobd.COMOBJ_ID
  and    comobj.COMPRV_ID = p_comprv_id
  and    comobj.SEGORG_ID = p_segorg_id
  and    comobd.COMODT_ID = p_comodt_id
  and    comobd.COMOBJ_ID = p_comobj_id
  and    comobd.SITUACION = 'VAL'
  and    comobd.ID        = COMPRV_PKG.COMOBD_COMPRV_OBTN_ID(p_comodt_id => comobd.COMODT_ID --p_comodt_id
                                                            ,p_comprv_id => comobj.COMPRV_ID --p_comprv_id
                                                            ,p_comobj_id => comobd.COMOBJ_ID --p_comobj_id
                                                            );
  --
  v_comobd cr_comobd%rowtype;
  v_dias number;
  v_retorno varchar2(100);
begin
  open cr_comobd;
  fetch cr_comobd into v_comobd;
  close cr_comobd;
  --
  if v_comobd.ID is null then
    v_retorno := 'NO PRESENTADO';
  else
    if (v_comobd.OBLIGATORIO_SN = 'SI' and v_comobd.FECHA_VENCIMIENTO+1 < sysdate) then
     v_dias := trunc(sysdate - v_comobd.FECHA_VENCIMIENTO);
     if v_dias = 1 then
       v_retorno := 'VENCIDO ayer';
     else
       v_retorno := 'VENCIDO hace '||v_dias||' dias';
     end if;
    else
      v_retorno := 'PRESENTADO';
    end if;
  end if;
  return v_retorno;
end;
/* Setear la variable v_comobd. */
PROCEDURE COMOBD_SET
 (P_ID IN NUMBER
 )
 IS
CURSOR cr_comobd IS
    SELECT *
    FROM COM_OBJETOS_DOC COMOBD
    WHERE COMOBD.ID = p_id;
  --
BEGIN
  -- Incializar la variable
  COMOBD_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN  cr_comobd;
  FETCH cr_comobd INTO v_comobd;
  CLOSE cr_comobd;
END;
/* Obtener el valor de la variable v_comobe. */
PROCEDURE COMOBE_GET
 (P_COMOBE OUT COM_OBJETOS_EST%ROWTYPE
 )
 IS
BEGIN
    p_comobe := v_comobe;
END;
/* Inicializar la variable v_comobe. */
PROCEDURE COMOBE_INI
 IS
begin
  v_comobe := null;
end;
/* Insertar registro en COM_OBJETOS_EST. */
PROCEDURE COMOBE_INS
 (P_COMOBE IN COM_OBJETOS_EST%ROWTYPE
 )
 IS
begin
  insert into COM_OBJETOS_EST
  ( ID
    ,COMOBJ_ID
    ,ESTADO
    ,FECHA
    ,MOTIVO
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY
   )
   values
   (p_comobe.ID
    ,p_comobe.COMOBJ_ID
    ,p_comobe.ESTADO
    ,p_comobe.FECHA
    ,p_comobe.MOTIVO
    ,p_comobe.DATE_CREATED
    ,p_comobe.CREATED_BY
    ,p_comobe.DATE_MODIFIED
    ,p_comobe.MODIFIED_BY
    );
    end;
/* Setear la variable v_comobe. */
PROCEDURE COMOBE_SET
 (P_ID IN NUMBER
 )
 IS
CURSOR cr_comobe IS
    SELECT *
    FROM COM_OBJETOS_EST COMOBE
    WHERE COMOBE.ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  COMOBE_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comobe;
  FETCH cr_comobe INTO v_comobe;
  CLOSE cr_comobe;
END;
/* Obtener el valor de la variable v_comobj. */
PROCEDURE COMOBJ_GET
 (P_COMOBJ OUT COM_OBJETOS%ROWTYPE
 )
 IS
begin
    p_comobj := v_comobj;
end;
/* Inicializar la variable v_comobj. */
PROCEDURE COMOBJ_INI
 IS
begin
  v_comobj := null;
end;
/* Insertar registro en COM_OBJETOS. */
PROCEDURE COMOBJ_INS
 (P_COMOBJ IN COM_OBJETOS%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_OBJETOS
  ( ID
    ,SEGORG_ID
    ,COMOBT_ID
    ,COMPRV_ID
    ,COMRUB_ID
    ,CODIGO
    ,DESCRIPCION
    ,NOMBRE
    ,OBSERVACION
    ,COMOBE_ID
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY )
   values
   ( p_comobj.ID
    ,p_comobj.SEGORG_ID
    ,p_comobj.COMOBT_ID
    ,p_comobj.COMPRV_ID
    ,p_comobj.COMRUB_ID
    ,p_comobj.CODIGO
    ,p_comobj.DESCRIPCION
    ,p_comobj.NOMBRE
    ,p_comobj.OBSERVACION
    ,p_comobj.COMOBE_ID
    ,p_comobj.DATE_CREATED
    ,p_comobj.CREATED_BY
    ,p_comobj.DATE_MODIFIED
    ,p_comobj.MODIFIED_BY
    );
    END;
/* Setear la variable v_comobj. */
PROCEDURE COMOBJ_SET
 (P_ID IN NUMBER
 )
 IS
CURSOR cr_comobj IS
    SELECT *
    FROM COM_OBJETOS COMOBJ
    WHERE COMOBJ.ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  COMOBE_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comobj;
  FETCH cr_comobj INTO v_comobj;
  CLOSE cr_comobj;
END;
/* Obtener el valor de la variable v_comobt. */
PROCEDURE COMOBT_GET
 (P_COMOBT OUT COM_OBJETOS_TIPOS%ROWTYPE
 )
 IS
begin
    p_comobt := v_comobt;
end;
/* Inicializar la variable v_comobt. */
PROCEDURE COMOBT_INI
 IS
begin
    v_comobt := null;
end;
/* Insertar registro en COM_OBJETOS_TIPOS. */
PROCEDURE COMOBT_INS
 (P_COMOBT IN COM_OBJETOS_TIPOS%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_OBJETOS_TIPOS
  ( ID
    ,SEGORG_ID
    ,CODIGO
    ,NOMBRE
    ,DESCRIPCION
    ,PLANTILLA_XML
    ,SITUACION
    ,FECHA_SITUACION
    ,MOTIVO_SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY  )
  values
  ( p_comobt.ID
    ,p_comobt.SEGORG_ID
    ,p_comobt.CODIGO
    ,p_comobt.NOMBRE
    ,p_comobt.DESCRIPCION
    ,p_comobt.PLANTILLA_XML
    ,p_comobt.SITUACION
    ,p_comobt.FECHA_SITUACION
    ,p_comobt.MOTIVO_SITUACION
    ,p_comobt.DATE_CREATED
    ,p_comobt.CREATED_BY
    ,p_comobt.DATE_MODIFIED
    ,p_comobt.MODIFIED_BY
    );
  --
END;
/* Setear la variable v_comobt. */
PROCEDURE COMOBT_SET
 (P_ID IN NUMBER
 )
 IS
CURSOR cr_comobt IS
    SELECT *
    FROM COM_OBJETOS_TIPOS COMOBT
    WHERE COMOBT.ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  COMOBT_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comobt;
  FETCH cr_comobt INTO v_comobt;
  CLOSE cr_comobt;
END;
/* Setear la variable v_comobt según codigo. */
PROCEDURE COMOBT_SET_CODIGO
 (P_SEGORG_ID IN NUMBER
 ,P_CODIGO IN VARCHAR2
 )
 IS
CURSOR cr_comobt IS
    SELECT *
    FROM COM_OBJETOS_TIPOS COMOBT
    WHERE COMOBT.SEGORG_ID = p_segorg_id
      AND COMOBT.CODIGO    = p_codigo;
  --
BEGIN
  -- Inicializar la variable
  COMOBT_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comobt;
  FETCH cr_comobt INTO v_comobt;
  CLOSE cr_comobt;
  --
END;
/* Indica si debe Documentacion de Objetos por tipo de Documento */
FUNCTION COMODT_DEBE_SN
 (P_COMPRV_ID IN NUMBER
 ,P_COMODT_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_comodt is
  select 1
  from   COM_OBJETOS_DOT comodt
        ,COM_OBJETOS_OTT comott
        ,COM_OBJETOS_TIPOS comobt
        ,COM_OBJETOS comobj
        ,COM_OBJETOS_EST comobe
  where  comodt.ID = p_comodt_id
  and    comodt.SITUACION = 'VIG'
  and    comodt.ID = comott.COMODT_ID
  and    comott.COMOBT_ID = comobt.ID
  and    comott.SITUACION = 'VIG'
  and    comobt.ID = comobj.COMOBT_ID
  and    comobj.COMOBE_ID = comobe.ID
  and    comobe.ESTADO = 'HAB'
  and    comobj.COMPRV_ID = p_comprv_id
  and    (comott.OBLIGATORIO_SN = 'SI' and
          COMPRV_PKG.COMOBD_PRESENTADO_SN(p_segorg_id => comobj.SEGORG_ID
                                         ,p_comprv_id => p_comprv_id
                                         ,p_comodt_id => p_comodt_id
                                         ,p_comobj_id => comobj.ID) <> 'PRESENTADO');
  --
  v_comodt number;
  v_retorno varchar2(2) := 'SI';
begin
  open cr_comodt;
  fetch cr_comodt into v_comodt;
  close cr_comodt;

  if nvl(v_comodt, 0) = 0 then
    v_retorno := 'NO';
  else
    v_retorno := 'SI';
  end if;
  --
  return v_retorno;
end;
/* Obtener el valor de la variable v_comodt. */
PROCEDURE COMODT_GET
 (P_COMODT OUT COM_OBJETOS_DOT%ROWTYPE
 )
 IS
begin
  p_comodt := v_comodt;
end;
/* Inicializar la variable v_comodt. */
PROCEDURE COMODT_INI
 IS
begin
    v_comodt := null;
end;
/* Insertar registro en COM_OBJETOS_DOT. */
PROCEDURE COMODT_INS
 (P_COMODT IN COM_OBJETOS_DOT%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_OBJETOS_DOT
  ( ID
    ,SEGORG_ID
    ,CODIGO
    ,NOMBRE
    ,DESCRIPCION
    ,PERIODO
    ,DURACION
    ,VENCIMIENTO_SN
    ,SITUACION
    ,FECHA_SITUACION
    ,MOTIVO_SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY
  )
  VALUES
  ( p_comodt.ID
    ,p_comodt.SEGORG_ID
    ,p_comodt.CODIGO
    ,p_comodt.NOMBRE
    ,p_comodt.DESCRIPCION
    ,p_comodt.PERIODO
    ,p_comodt.DURACION
    ,p_comodt.VENCIMIENTO_SN
    ,p_comodt.SITUACION
    ,p_comodt.FECHA_SITUACION
    ,p_comodt.MOTIVO_SITUACION
    ,p_comodt.DATE_CREATED
    ,p_comodt.CREATED_BY
    ,p_comodt.DATE_MODIFIED
    ,p_comodt.MODIFIED_BY
  );
  --
END;
/* Setear la variable v_comodt. */
PROCEDURE COMODT_SET
 (P_ID IN NUMBER
 )
 IS
cursor cr_comodt is
  select *
  from COM_OBJETOS_DOT COMODT
  where COMODT.ID = p_id;
begin
  -- Inicializa la variable
  COMODT_INI;
  -- Cargar la variable con los datos de la consultaa
  open cr_comodt;
  fetch cr_comodt into v_comodt;
  close cr_comodt;
end;
/* Setear la variable v_comodt según codigo. */
PROCEDURE COMODT_SET_CODIGO
 (P_SEGORG_ID IN NUMBER
 ,P_CODIGO IN VARCHAR2
 )
 IS
CURSOR cr_comodt IS
    SELECT *
    FROM   COM_OBJETOS_DOT COMODT
    WHERE  COMODT.SEGORG_ID = p_segorg_id
      AND  COMODT.CODIGO = p_codigo;
  --
BEGIN
  -- Inicializar la variable
  COMODT_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comodt;
  FETCH cr_comodt INTO v_comodt;
  CLOSE cr_comodt;
  --
END;
/* Obtener el valor de la variable v_comott. */
PROCEDURE COMOTT_GET
 (P_COMOTT OUT COM_OBJETOS_OTT%ROWTYPE
 )
 IS
begin
  p_comott := v_comott;
end;
/* Inicializar la variable v_comott. */
PROCEDURE COMOTT_INI
 IS
BEGIN
  v_comott := null;
END;
/* Insertar un registro en COM_OBJETOS_OTT. */
PROCEDURE COMOTT_INS
 (P_COMOTT IN COM_OBJETOS_OTT%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_OBJETOS_OTT
  ( ID
    ,COMOBT_ID
    ,COMODT_ID
    ,OBLIGATORIO_SN
    ,SITUACION
    ,FECHA_SITUACION
    ,MOTIVO_SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY
  )
  VALUES
  (p_comott.ID
    ,p_comott.COMOBT_ID
    ,p_comott.COMODT_ID
    ,p_comott.OBLIGATORIO_SN
    ,p_comott.SITUACION
    ,p_comott.FECHA_SITUACION
    ,p_comott.MOTIVO_SITUACION
    ,p_comott.DATE_CREATED
    ,p_comott.CREATED_BY
    ,p_comott.DATE_MODIFIED
    ,p_comott.MODIFIED_BY
  );
END;
/* Obtiene el Rubro para un Tipo de Documento de Objeto y Proveedor dados */
FUNCTION COMOTT_OBT_RUBROS
 (P_COMPRV_ID IN NUMBER
 ,P_COMODT_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_comrub is
  select unique comrub.ID
        ,comrub.CODIGO
        ,comrub.NOMBRE
        ,comott.OBLIGATORIO_SN
        ,decode(comott.OBLIGATORIO_SN,'SI','OBLIGATORIO','OPCIONAL') OBLIGATORIO
  from   COM_RUBROS comrub
        ,COM_OBJETOS comobj
        ,COM_OBJETOS_EST comobe
        ,COM_OBJETOS_OTT comott
  where  comobj.COMPRV_ID = p_comprv_id
  and    comobj.COMRUB_ID = comrub.ID
  and    comobj.COMOBT_ID = comott.COMOBT_ID
  and    comobj.COMOBE_ID = comobe.ID
  and    comobe.ESTADO = 'HAB'
  and    comott.COMODT_ID = p_comodt_id
  and    comott.SITUACION = 'VIG';
--
v_retorno varchar2(4000);
begin
  v_retorno := null;
  for v_comrub in cr_comrub loop
    if v_retorno is null then
      v_retorno := v_comrub.NOMBRE||' - '||v_comrub.OBLIGATORIO;
    else
      v_retorno := v_retorno||chr(10)||v_comrub.NOMBRE||' - '||v_comrub.OBLIGATORIO;
    end if;
  end loop;
  return v_retorno;
end;
/* Setear la variable v_comott. */
PROCEDURE COMOTT_SET
 (P_ID IN NUMBER
 )
 IS
CURSOR cr_comott IS
    SELECT *
    FROM   COM_OBJETOS_OTT COMOTT
    WHERE  COMOTT.ID = p_id;
BEGIN
   -- Inicializa la variable
   COMOTT_INI;
   -- Cargar la variable con los datos de la consulta
   OPEN cr_comott;
   FETCH cr_comott INTO v_comott;
   CLOSE cr_comott;
 END;
/* Obtener el valor de la variable v_compad. */
PROCEDURE COMPAD_GET
 (P_COMPAD OUT COM_PROVEEDORES_ADO%ROWTYPE
 )
 IS
begin
   p_compad:=v_compad;
end;
/* Inicializar la variable v_compad. */
PROCEDURE COMPAD_INI
 IS
begin
  v_compad:=null;
end;
/* Insertar registro en  COM_PROVEEDORES_ADO. */
PROCEDURE COMPAD_INS
 (P_COMPAD IN COM_PROVEEDORES_ADO%ROWTYPE
 )
 IS
begin
   insert into COM_PROVEEDORES_ADO
   (ID
   ,COMPRA_ID
   ,COMPDO_ID
   ,COMPDT_ID
   ,SITUACION
   ,FECHA_SITUACION
   ,MOTIVO_SITUACION
   ,DATE_CREATED
   ,CREATED_BY
   ,DATE_MODIFIED
   ,MODIFIED_BY
   )
   values
   (p_compad.ID
   ,p_compad.COMPRA_ID
   ,p_compad.COMPDO_ID
   ,p_compad.COMPDT_ID
   ,p_compad.SITUACION
   ,p_compad.FECHA_SITUACION
   ,p_compad.MOTIVO_SITUACION
   ,p_compad.DATE_CREATED
   ,p_compad.CREATED_BY
   ,p_compad.DATE_MODIFIED
   ,p_compad.MODIFIED_BY
   );
end;
/* Seteo de la variable v_compad. */
PROCEDURE COMPAD_SET
 (P_ID IN NUMBER
 )
 IS
cursor cr_compad is
 select *
   from COM_PROVEEDORES_ADO compad
  where compad.ID = p_id;
begin
 -- Inicializar la variable
 COMPAD_INI;
 -- Cargar la variable con los datos de la consulta
 open cr_compad;
 fetch cr_compad into v_compad;
 close cr_compad;
 --
end;
/* Obtener el valor de la variable v_compcc. */
PROCEDURE COMPCC_GET
 (P_COMPCC OUT COM_PROVEEDORES_CAR%ROWTYPE
 )
 IS
begin
   p_compcc:=v_compcc;
end;
/* Inicializar la variable v_compcc. */
PROCEDURE COMPCC_INI
 IS
begin
  v_compcc:=null;
end;
/* Insertar registro en  COM_PROVEEDORES_CAR. */
PROCEDURE COMPCC_INS
 (P_COMPCC IN COM_PROVEEDORES_CAR%ROWTYPE
 )
 IS
begin
   insert into COM_PROVEEDORES_CAR
   (ID
   ,COMPCT_ID
   ,CODIGO
   ,NOMBRE
   ,ORDEN
   ,DESCRIPCION
   ,DURACION_MANDATO_MAX
   ,OBLIGATORIO_SN
   ,CANTIDAD_MIN
   ,CANTIDAD_MAX
   ,SITUACION
   ,FECHA_SITUACION
   ,MOTIVO_SITUACION
   ,DATE_CREATED
   ,CREATED_BY
   ,DATE_MODIFIED
   ,MODIFIED_BY
   )
   values
   (p_compcc.ID
   ,p_compcc.COMPCT_ID
   ,p_compcc.CODIGO
   ,p_compcc.NOMBRE
   ,p_compcc.ORDEN
   ,p_compcc.DESCRIPCION
   ,p_compcc.DURACION_MANDATO_MAX
   ,p_compcc.OBLIGATORIO_SN
   ,p_compcc.CANTIDAD_MIN
   ,p_compcc.CANTIDAD_MAX
   ,p_compcc.SITUACION
   ,p_compcc.FECHA_SITUACION
   ,p_compcc.MOTIVO_SITUACION
   ,p_compcc.DATE_CREATED
   ,p_compcc.CREATED_BY
   ,p_compcc.DATE_MODIFIED
   ,p_compcc.MODIFIED_BY
   );
end;
/* Seteo de la variable v_compcc. */
PROCEDURE COMPCC_SET
 (P_ID IN NUMBER
 )
 IS
cursor cr_compcc is
 select *
   from COM_PROVEEDORES_CAR compcc
  where compcc.ID = p_id;
begin
 -- Inicializar la variable
 COMPCC_INI;
 -- Cargar la variable con los datos de la consulta
 open cr_compcc;
 fetch cr_compcc into v_compcc;
 close cr_compcc;
 --
end;
PROCEDURE COMPCC_SET_CODIGO
 (P_CODIGO IN VARCHAR2
 ,P_COMPCT_ID IN NUMBER
 )
 IS
cursor cr_compcc is
  select compcc.*
  from   COM_PROVEEDORES_CAR compcc
  where  compcc.CODIGO = p_codigo
  and    compcc.COMPCT_ID = p_compct_id;
begin
  open cr_compcc;
  fetch cr_compcc into v_compcc;
  close cr_compcc;
end;
/* Recupera el registro seleccionado desde la variable de paquete */
PROCEDURE COMPCF_GET
 (P_COMPCF OUT COM_PROVEEDORES_CLF%ROWTYPE
 )
 IS
begin
  p_compcf := v_compcf;
end;
/* Inicializacion de la variable de paquete */
PROCEDURE COMPCF_INI
 IS
begin
  --Limpia la variable de paquete
  v_compcf := null;
end;
/* Inserta un nuevo registro en la tabla */
PROCEDURE COMPCF_INS
 (P_COMPCF IN COM_PROVEEDORES_CLF%ROWTYPE
 )
 IS
begin
  -- Inserta un nuevo registro en la tabla COM_PROVEEDORES_CLF
  insert into COM_PROVEEDORES_CLF
  (
    ID
   ,SEGORG_ID
   ,CODIGO
   ,NOMBRE
   ,DESCRIPCION
   ,DATE_CREATED
   ,DATE_MODIFIED
   ,CREATED_BY
   ,MODIFIED_BY
  )
  values
  (
    p_compcf.ID
   ,p_compcf.SEGORG_ID
   ,p_compcf.CODIGO
   ,p_compcf.NOMBRE
   ,p_compcf.DESCRIPCION
   ,p_compcf.DATE_CREATED
   ,p_compcf.DATE_MODIFIED
   ,p_compcf.CREATED_BY
   ,p_compcf.MODIFIED_BY
  );
end;
PROCEDURE COMPCF_SET
 (P_ID IN NUMBER
 )
 IS
cursor cr_compcf is
  select compcf.*
  from   COM_PROVEEDORES_CLF compcf
  where  compcf.ID = p_ID;
begin
  open cr_compcf;
  fetch cr_compcf into v_compcf;
  close cr_compcf;
end;
PROCEDURE COMPCF_SET_CODIGO
 (P_CODIGO IN VARCHAR2
 ,P_SEGORG_ID IN NUMBER
 )
 IS
cursor cr_compcf is
  select compcf.*
  from   COM_PROVEEDORES_CLF compcf
  where  compcf.CODIGO = p_codigo
  and    compcf.SEGORG_ID = p_segorg_id;
begin
  open cr_compcf;
  fetch cr_compcf into v_compcf;
  close cr_compcf;
end;
PROCEDURE COMPCF_SET_NOMBRE
 (P_NOMBRE IN VARCHAR2
 ,P_SEGORG_ID IN NUMBER
 )
 IS
cursor cr_compcf is
  select compcf.*
  from   COM_PROVEEDORES_CLF compcf
  where  compcf.NOMBRE = p_nombre
  and    compcf.SEGORG_ID = p_segorg_id;
begin
  open cr_compcf;
  fetch cr_compcf into v_compcf;
  close cr_compcf;
end;
/* Obtener el valor de la variable v_compct. */
PROCEDURE COMPCT_GET
 (P_COMPCT OUT COM_PROVEEDORES_CAT%ROWTYPE
 )
 IS
begin
   p_compct:=v_compct;
end;
/* Inicializar la variable v_compct. */
PROCEDURE COMPCT_INI
 IS
begin
  v_compct:=null;
end;
/* Insertar registro en  COM_PROVEEDORES_CAT. */
PROCEDURE COMPCT_INS
 (P_COMPCT IN COM_PROVEEDORES_CAT%ROWTYPE
 )
 IS
begin
   insert into COM_PROVEEDORES_CAT
   (ID
   ,COMPRT_ID
   ,CODIGO
   ,NOMBRE
   ,SITUACION
   ,FECHA_SITUACION
   ,MOTIVO_SITUACION
   ,SOLICITAR_AUTORIADES_SN
   ,DATE_CREATED
   ,CREATED_BY
   ,DATE_MODIFIED
   ,MODIFIED_BY
   )
   values
   (p_compct.ID
   ,p_compct.COMPRT_ID
   ,p_compct.CODIGO
   ,p_compct.NOMBRE
   ,p_compct.SITUACION
   ,p_compct.FECHA_SITUACION
   ,p_compct.MOTIVO_SITUACION
   ,p_compct.SOLICITAR_AUTORIADES_SN
   ,p_compct.DATE_CREATED
   ,p_compct.CREATED_BY
   ,p_compct.DATE_MODIFIED
   ,p_compct.MODIFIED_BY
   );
end;
/* Seteo de la variable v_compct. */
PROCEDURE COMPCT_SET
 (P_ID IN NUMBER
 )
 IS
cursor cr_compct is
 select *
   from COM_PROVEEDORES_CAT compct
  where compct.ID = p_id;
begin
 -- Inicializar la variable
 COMPCT_INI;
 -- Cargar la variable con los datos de la consulta
 open cr_compct;
 fetch cr_compct into v_compct;
 close cr_compct;
 --
end;
PROCEDURE COMPCT_SET_CODIGO
 (P_CODIGO IN VARCHAR2
 ,P_COMPRT_ID IN NUMBER
 )
 IS
cursor cr_compct is
  select compct.*
  from   COM_PROVEEDORES_CAT compct
  where  compct.CODIGO = p_codigo
  and    compct.COMPRT_ID = p_comprt_id;
begin
  open cr_compct;
  fetch cr_compct into v_compct;
  close cr_compct;
end;
/* .Documentos presentados por Contrataciones */
FUNCTION COMPDO_COMCTT_PRESENTADOS_SN
 (P_COMPRV_ID IN NUMBER
 ,P_COMCTT_ID IN NUMBER
 ,P_FECHA IN DATE := 'SYSDATE'
 )
 RETURN VARCHAR2
 IS
cursor cr_comcct is
    select count(compdt.ID)
    from  COM_COMPDT_COMCTT comcct
         ,COM_PROVEEDORES_DOT compdt
    where COMCCT.COMPDT_ID = COMPDT.ID
    and   comcct.NECESARIO_COTIZAR_SN = 'SI'
    and   comcct.COMCTT_ID = p_comctt_id
    and   COM_PKG.COMPDO_PRESENTADO_SN(p_comprv_id => p_comprv_id
                                      ,p_compdt_id => compdt.ID
                                      ,p_fecha     => sysdate) = 'NO';
 --
 v_comcct_cant number;
 v_retorno varchar2(2) := 'SI';
begin
  open cr_comcct;
  fetch cr_comcct into v_comcct_cant;
  close cr_comcct;

  if v_comcct_cant > 0 then
    v_retorno := 'NO';
  end if;
  --
  return v_retorno;
end;
/* .Documentos presentados por Rubro */
FUNCTION COMPDO_COMRUB_PRESENTADOS_SN
 (P_COMPRV_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_comprr is
  select count(comprr.COMRUB_ID) CANTIDAD
  from   COM_PROVEEDORES_RUB comprr
  where  comprr.SITUACION = 'ACT'
  and    comprr.COMPRV_ID = p_comprv_id
  and    COMPRV_PKG.COMPRV_COMRUB_COTIZAR_SN(p_comprv_id => p_comprv_id
                                            ,p_comrub_id => comprr.COMRUB_ID
                                            ,p_fecha     => sysdate) = 'NO';
  v_comprr_cant number;
  v_retorno varchar2(2) := 'SI';
begin
    --
  open cr_comprr;
  fetch cr_comprr into v_comprr_cant;
  close cr_comprr;

  if v_comprr_cant > 0 then
    v_retorno := 'NO';
  end if;
  --
  return v_retorno;
end;
/* . Obtener la fecha de Vencimiento para un Tipo de Documento */
FUNCTION COMPDT_OBTN_FECHA_VENC
 (P_SEGORG_ID IN NUMBER
 ,P_COMPDT_ID IN NUMBER
 ,P_FECHA_EMISION IN DATE := 'sysdate'
 )
 RETURN DATE
 IS
-- Obtener el Tipo de Documento indicado para la la organizacion indicada.
  cursor cr_compdt is
    select compdt.*
    from   COM_PROVEEDORES_DOT compdt
          ,COM_PROVEEDORES_DTE  compde
    where compde.ID = (select max(compde.ID)
                       from   COM_PROVEEDORES_DTE compde
                       where  compde.ESTADO = 'HAB'
                       and    compde.COMPDT_ID = p_compdt_id)
    and   compde.COMPDT_ID = compdt.ID
    and   compdt.SEGORG_ID = p_segorg_id;
--
 v_compdt cr_compdt%rowtype;
begin
  -- Validar que existe el Tipo de Documento en la organizacion
  --
  open cr_compdt;
  fetch cr_compdt into v_compdt;
  close cr_compdt;
  -- Si el Tipo de Documento no existe devuelve la fecha de emision
  if v_compdt.ID is null then
    return p_fecha_emision;
  end if;
  -- Calcula la fecha de vencimiento en base al tiempo de vigencia del documento
  if v_compdt.TIPO_DURACION in ('SIN','NOD') then
     return null;
  else
      if v_compdt.DURACION_TIPO = 'AÑO' then
        return add_months(p_fecha_emision, nvl(v_compdt.DURACION_VALOR,1) * 12);
      elsif v_compdt.DURACION_TIPO = 'MES' then
        return add_months(p_fecha_emision, nvl(v_compdt.DURACION_VALOR,1));
      elsif v_compdt.DURACION_TIPO = 'DIA' then
        return p_fecha_emision + nvl(v_compdt.DURACION_VALOR,1);
      else
        return p_fecha_emision;
      end if;
  end if;
end;
/* Recuperar un registro desde la variable de paquete */
PROCEDURE COMPPF_GET
 (P_COMPPF OUT COM_COMPRV_COMPCF%ROWTYPE
 )
 IS
begin
  p_comppf := v_comppf;
end;
/* Inicializa la variable de paquete */
PROCEDURE COMPPF_INI
 IS
begin
  v_comppf := null;
end;
PROCEDURE COMPPF_INS
 (P_COMPPF IN COM_COMPRV_COMPCF%ROWTYPE
 )
 IS
begin
  -- Inserta un nuevo registro en la tabla COM_COMPRV_COMPCF
  insert into COM_COMPRV_COMPCF
  (
    ID
   ,COMPRV_ID
   ,COMPCF_ID
   ,FECHA_VIGENCIA
   ,FECHA_VALIDEZ
   ,SITUACION
   ,DATE_CREATED
   ,DATE_MODIFIED
   ,CREATED_BY
   ,MODIFIED_BY
  )
  values
  (
    p_comppf.ID
   ,p_comppf.COMPRV_ID
   ,p_comppf.COMPCF_ID
   ,p_comppf.FECHA_VIGENCIA
   ,p_comppf.FECHA_VALIDEZ
   ,p_comppf.SITUACION
   ,p_comppf.DATE_CREATED
   ,p_comppf.DATE_MODIFIED
   ,p_comppf.CREATED_BY
   ,p_comppf.MODIFIED_BY
  );
end;
PROCEDURE COMPPF_SET
 (P_ID IN NUMBER
 )
 IS
cursor cr_comppf is
  select *
  from   COM_COMPRV_COMPCF comppf
  where comppf.ID = p_id;
begin
  open cr_comppf;
  fetch cr_comppf into v_comppf;
  close cr_comppf;
end;
/* Verificar si las autoridades del proveedor se encuentran vigentes */
FUNCTION COMPRA_COTIZAR_SN
 (P_COMPRV_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_comprv is
    select comprt_id
          ,compct_id
      from com_proveedores
     where id = p_comprv_id;
   --
  cursor cr_comprt(p_comprt_id number) is
    select codigo
      from com_proveedores_tipos
     where id = p_comprt_id;
   --
  cursor cr_compra is
    select compra.id
      from com_proveedores_aut compra
          ,com_proveedores_car compcc
     where compra.comprv_id = p_comprv_id
       and compra.id in (select max(id)
                           from com_proveedores_aut compra1
                          where compra1.situacion not in ('NUE','ANU')
                            and compra1.comprv_id = compra.comprv_id --p_comprv_id
                       group by compra1.compcc_id, compra1.numero_documento,compra1.comprv_id,compra1.tipo_documento)
       and compra.situacion      = 'VIG'
       and compra.compcc_id      = compcc.id
       and compcc.obligatorio_sn = 'SI'
   union
    select compra.id
      from com_proveedores_aut compra
          ,com_proveedores_car compcc
          ,(select compra.compcc_id, compra.numero_documento, compra.tipo_documento
              from com_proveedores_aut compra
             where compra.comprv_id = p_comprv_id
               and compra.id in (select max(id)
                           from com_proveedores_aut compra1
                          where compra1.situacion not in ('NUE','ANU')
                            and compra1.comprv_id = compra.comprv_id --p_comprv_id
                       group by compra1.compcc_id, compra1.numero_documento,compra1.comprv_id,compra1.tipo_documento)
               and compra.situacion = 'MAR') compra2
     where compra.comprv_id        = p_comprv_id
       and compra.compcc_id        = compra2.compcc_id
       and compra.numero_documento = compra2.numero_documento
       and compra.tipo_documento   = compra2.tipo_documento
       and compra.situacion        = 'VIG'
       and compra.compcc_id        = compcc.id
       and compcc.obligatorio_sn   = 'SI';
  --
v_comprv cr_comprv%rowtype;
v_comprt cr_comprt%rowtype;
v_retorno varchar2 (2) := 'SI';
begin

    -- Recupero datos del Proveedor
    open cr_comprv;
    fetch cr_comprv into v_comprv;
    close cr_comprv;
    --
    open cr_comprt(p_comprt_id => v_comprv.comprt_id);
    fetch cr_comprt into v_comprt;
    close cr_comprt;
    -- Si es una persona física puede corizar
    if v_comprt.codigo = 'JUR' then
       --SI es una persona jurídica y no tiene autoridades declaradas, no puede cotizar
       if v_comprv.compct_id is null then
          v_retorno := 'NO';
       else
          -- Controlar si el proveedor tiene autoridades vencidas
          -- CT 07/11/2016 -  Uso otra funcion con dos parametros
          --
          --if COMPRV_PKG.COMPRA_VENCIDAS_SN(p_comprv_id => p_comprv_id) = 'SI' then
          if COMPRV_PKG.COMPRA_VENCIDAS_SN2(p_comprv_id => p_comprv_id, p_compct_id => v_comprv.compct_id) = 'SI' then
            -- Si tiene autoridades vencidas, no puede cotizar
            v_retorno := 'NO';
          else
            -- Controlar si debe documentación alguna autoridad
            for v_compra in cr_compra loop
               if v_retorno = 'SI' then
                  if  COMPRV_PKG.COMPRA_DEBE_SN(p_compra_id => v_compra.id) = 'SI' then
                     v_retorno := 'NO';
                  else
                     v_retorno := 'SI';
                  end if;
               end if;
            end loop;
          end if;
       end if;
    end if;
  return v_retorno;
end;
/* Determinar si una autoridad debe documentación. */
FUNCTION COMPRA_DEBE_SN
 (P_COMPRA_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_compra is
select compcc_id
      ,situacion
  from com_proveedores_aut
 where id = p_compra_id;
  --
  cursor cr_compcd(p_compcc_id number) is
  select obligatorio_sn
       , compdt_id
    from com_proveedores_cdt
   where compcc_id = p_compcc_id;
  --
  cursor cr_compra_mar is
  select compra.id
    from com_proveedores_aut compra
         ,(select compcc_id,numero_documento,tipo_documento,comprv_id
             from com_proveedores_aut
            where id = p_compra_id
              and situacion in ('MAR','BAJ'))compra2
     where compra.comprv_id        = compra2.comprv_id
       and compra.compcc_id        = compra2.compcc_id
       and compra.numero_documento = compra2.numero_documento
       and compra.tipo_documento   = compra2.tipo_documento
       and compra.situacion        = 'VIG';

v_compcd com_proveedores_cdt%rowtype;
v_compra cr_compra%rowtype;
v_situacion varchar2(30);
v_retorno   varchar2(2);
v_compra_id number (30);
begin
    -- Obtener autoridad
    open cr_compra;
    fetch cr_compra into v_compra;
    close cr_compra;

    v_retorno := 'NO';
 -- Obtener la situacion de los tipos de documentos asociados por configuración al cargo de la autoridad
    for v_compcd in cr_compcd(v_compra.compcc_id) loop
        if v_retorno = 'NO' then
            -- Verificar si es una autoridad Vigente o Marcada
          if v_compra.situacion = 'VIG' then
            v_compra_id := p_compra_id;
          else -- Si esta marcada, debemos buscar su vigente anterior
            open cr_compra_mar;
            fetch cr_compra_mar into v_compra_id;
            close cr_compra_mar;
          end if;
            v_situacion := COMPRV_PKG.COMPRA_COMPDT_OBT_SITUACION(p_compra_id => v_compra_id
                                                                 ,p_compdt_id => v_compcd.compdt_id);
            -- Si tiene documentacion vencida o no presentada y la misma es obligatoria
            if v_situacion in ('NO PRESENTADO','VENCIDO') and v_compcd.obligatorio_sn = 'SI' then
                v_retorno := 'SI';
            end if;
        end if;
    end loop;
  return v_retorno;
end;
/* Obtener el valor de la variable v_compra. */
PROCEDURE COMPRA_GET
 (P_COMPRA OUT COM_PROVEEDORES_AUT%ROWTYPE
 )
 IS
begin
   p_compra:=v_compra;
end;
/* Inicializar la variable v_compra. */
PROCEDURE COMPRA_INI
 IS
begin
  v_compra:=null;
end;
/* Insertar registro en  COM_PROVEEDORES_AUT. */
PROCEDURE COMPRA_INS
 (P_COMPRA IN COM_PROVEEDORES_AUT%ROWTYPE
 )
 IS
begin
   insert into COM_PROVEEDORES_AUT
   (ID
   ,COMPRV_ID
   ,COMPCC_ID
   ,COMPDO_ID
   ,COMTPR_ID
   ,TIPO_DOCUMENTO
   ,NUMERO_DOCUMENTO
   ,APELLIDO
   ,NOMBRE
   ,FECHA_INICIO
   ,FECHA_VENCIMIENTO
   ,SITUACION
   ,FECHA_SITUACION
   ,MOTIVO_SITUACION
   ,DATE_CREATED
   ,CREATED_BY
   ,DATE_MODIFIED
   ,MODIFIED_BY
   )
   values
   (p_compra.ID
   ,p_compra.COMPRV_ID
   ,p_compra.COMPCC_ID
   ,p_compra.COMPDO_ID
   ,p_compra.COMTPR_ID
   ,p_compra.TIPO_DOCUMENTO
   ,p_compra.NUMERO_DOCUMENTO
   ,p_compra.APELLIDO
   ,p_compra.NOMBRE
   ,p_compra.FECHA_INICIO
   ,p_compra.FECHA_VENCIMIENTO
   ,p_compra.SITUACION
   ,p_compra.FECHA_SITUACION
   ,p_compra.MOTIVO_SITUACION
   ,p_compra.DATE_CREATED
   ,p_compra.CREATED_BY
   ,p_compra.DATE_MODIFIED
   ,p_compra.MODIFIED_BY
   );
end;
/* Obtener situación del documento de autoridad */
FUNCTION COMPRA_COMPDT_OBT_SITUACION
 (P_COMPRA_ID IN NUMBER
 ,P_COMPDT_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
-- determinar situacion
 cursor cr_compad is
  select compdo.ID compdo_id
       , compdo.FECHA_VENCIMIENTO
    from com_proveedores_ado compad
       , com_proveedores_doc compdo
   where compad.compdo_id = compdo.ID
     and compad.compdt_id = p_compdt_id
     and compad.compra_id = p_compra_id
     and compad.situacion = 'VIG';
 --
 -- Obtener configuración TIPO DE DOCUMENTO
 cursor cr_compdt is
  select tipo_duracion
    from com_proveedores_dot
   where id = p_compdt_id;
 --
 v_retorno VARCHAR2(30) := 'NO PRESENTADO';
 v_compdt_tipo_duracion VARCHAR2(3);
 v_compad cr_compad%rowtype;
 --
begin
  -- determinar situacion
  open cr_compad;
  fetch cr_compad into v_compad;
  close cr_compad;
  --
  if v_compad.compdo_id is null then
    v_retorno := 'NO PRESENTADO';
  else
    -- Obtener configuración
    open cr_compdt;
    fetch cr_compdt into v_compdt_tipo_duracion;
    close cr_compdt;
    --
    -- Si es Indefinido o Vencimiento mayor al día de la fecha
    v_retorno := 'VIGENTE';
    --
    -- Si es Fijo y Vencimiento es menor  al día de la fecha
    if v_compdt_tipo_duracion = 'FIJ' and v_compad.fecha_vencimiento < sysdate then
       v_retorno := 'VENCIDO';
    end if;
    --
  end if;
  --
  return v_retorno;
  --
end;
/* Obtener situación del documento de autoridad con formato */
FUNCTION COMPRA_COMPDT_OBT_SIT_FMT
 (P_COMPRA_ID IN NUMBER
 ,P_COMPDT_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
v_situacion varchar2 (50);
v_retorno   varchar2 (50);
begin
    v_situacion:= COMPRV_PKG.COMPRA_COMPDT_OBT_SITUACION(p_compra_id => p_compra_id
                                                        ,p_compdt_id => p_compdt_id);
    v_retorno := '<font color="green"><b>VIGENTE</b></font>';
    if v_situacion = 'VENCIDO' then
        v_retorno:= '<font color="red"><b>VENCIDO</b></font>';
    end if;
    --
    if v_situacion = 'NO PRESENTADO' then
        v_retorno:= '<font color="red"><b>NO PRESENTADO</b></font>';
    end if;
    --

    return v_retorno;
end;
/* Buscar si se encuentra el registro solicitado en las autoridades */
FUNCTION COMPRA_OBTN_AUT_SN
 (P_TIPO_DOCUMENTO IN COM_PROVEEDORES_AUT.TIPO_DOCUMENTO%TYPE
 ,P_NUMERO_DOCUMENTO IN COM_PROVEEDORES_AUT.NUMERO_DOCUMENTO%TYPE
 ,P_NOMBRE IN COM_PROVEEDORES_AUT.NOMBRE%TYPE
 ,P_APELLIDO IN COM_PROVEEDORES_AUT.APELLIDO%TYPE
 ,P_SITUACION IN COM_PROVEEDORES_AUT.SITUACION%TYPE
 )
 RETURN VARCHAR2
 IS
cursor cr_dato (p_situaciones varchar2) is
    select id from (
     SELECT compra.id, compra.situacion
     from COM_PROVEEDORES_AUT compra
    where
              -- Datos por igual: Tipo, Documento(TIPO/NRO) y Autoridad(Apellido/Nombre)
       (p_tipo_documento is not null and
        p_numero_documento is not null and
        p_apellido is not null and
        p_nombre is not null and
        compra.TIPO_DOCUMENTO = p_tipo_documento and
        compra.NUMERO_DOCUMENTO = p_numero_documento and
        compra.APELLIDO = p_apellido and
        compra.NOMBRE = p_nombre)
    union
     SELECT compra.id, compra.situacion
     from COM_PROVEEDORES_AUT compra
    where
      -- Datos por igual: Documento(NRO) y Autoridad(Apellido/Nombre)
       (p_numero_documento is not null and
        p_apellido is not null and
        p_nombre is not null and
        compra.NUMERO_DOCUMENTO = p_numero_documento and
        compra.APELLIDO = p_apellido and
        compra.NOMBRE = p_nombre)
    union
     SELECT compra.id, compra.situacion
     from COM_PROVEEDORES_AUT compra
    where
      -- Datos por igual: Autoridad(Apellido/Nombre)
       (p_apellido is not null and
        p_nombre is not null and
        compra.APELLIDO = p_apellido and
        compra.NOMBRE = p_nombre)
        or
       (p_apellido is not null and
        p_nombre is not null and
        compra.APELLIDO = p_nombre and
        compra.NOMBRE = p_apellido)
    union
     SELECT compra.id, compra.situacion
     from COM_PROVEEDORES_AUT compra
    where
      -- Datos por igual: Documento(NRO)
      (p_numero_documento is not null and
        compra.NUMERO_DOCUMENTO = p_numero_documento)
   union
     SELECT compra.id, compra.situacion
     from COM_PROVEEDORES_AUT compra
    where
      -- Datos por igual: SITUACION
      (p_situacion is not null and
        compra.SITUACION = p_situacion) or p_situacion is null)
   where instr( p_situaciones,situacion) > 0
   and ROWNUM = 1;
    --
    v_dato cr_dato%rowtype;
    v_situaciones varchar2(30) := null;
    v_retorno varchar2(2);
begin
  -- Control de situacions
  if p_situacion = 'VIG' then
    v_situaciones := 'VIGMAR';
  else
    v_situaciones := 'VIGBAJMAR';
  end if;
  --
  open cr_dato(p_situaciones => v_situaciones);
  fetch cr_dato into v_dato;
  if cr_dato%NOTFOUND then
     v_retorno := 'NO';
  else
    v_retorno := 'SI';
  end if;
  close cr_dato;
  --
  return v_retorno;
  --
end;
/* Seteo de la variable v_compra. */
PROCEDURE COMPRA_SET
 (P_ID IN NUMBER
 )
 IS
cursor cr_compra is
 select *
   from COM_PROVEEDORES_AUT compra
  where compra.ID = p_id;
begin
 -- Inicializar la variable
 COMPRA_INI;
 -- Cargar la variable con los datos de la consulta
 open cr_compra;
 fetch cr_compra into v_compra;
 close cr_compra;
 --
end;
/* Indica si se ha vencido la duración del cargo de una autoridad. */
FUNCTION COMPRA_VENCIDAS_SN
 (P_COMPRV_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_comprv is
  select compct_id
  from com_proveedores
  where id = P_COMPRV_ID;
  --
  -- Cantidad de cargos obligatorios registrados para el proveedor
  -- que se encuentran vigentes y no vencidos
  cursor cr_compra is
  select count(compra.id)
  from com_proveedores_aut compra
      ,com_proveedores_car compcc
  where compra.ID in (select MAX(ID)
                      from (com_proveedores_aut)
                      where situacion not in ('NUE','ANU')
                        and comprv_id = P_COMPRV_ID
                      group by tipo_documento,numero_documento,compcc_id)
    and compra.compcc_id = compcc.id
    and compcc.obligatorio_sn = 'SI'
    and compra.situacion in ('VIG','MAR')
    and fecha_vencimiento > sysdate;
    --
  cursor cr_compcc (p_compct_id number) is
      select nvl(sum(cantidad_min),0)
      from   com_proveedores_car compcc
      where  compcc.compct_id      = p_compct_id
      and    compcc.obligatorio_sn = 'SI';

v_comprv cr_comprv%ROWTYPE;
v_compra number;
v_compcc number;
begin

   open cr_comprv;
   fetch cr_comprv into v_comprv;
   close cr_comprv;
   -- Recupero las autoridades
   open cr_compra;
   fetch cr_compra into v_compra;
   close cr_compra;
          --
   open cr_compcc(p_compct_id => v_comprv.compct_id);
   fetch cr_compcc into v_compcc;
   close cr_compcc;
   --Controlar que todos los cargos obligatorios esten vigentes
   if v_compra < v_compcc then
        return 'SI';
   else
        return 'NO';
   end if;
end;
/* Obtiene el valor de la variable de paquete */
PROCEDURE COMPRG_GET
 (P_COMPRG OUT COM_PROVEEDORES_RGP%ROWTYPE
 )
 IS
begin
  p_comprg := v_comprg;
end;
/* Inicializa la variable de paquete */
PROCEDURE COMPRG_INI
 IS
begin
  v_comprg := null;
end;
/* Inserta un nuevo registro en COM_PROVEEDORES_RGP */
PROCEDURE COMPRG_INS
 (P_COMPRG IN COM_PROVEEDORES_RGP%ROWTYPE
 )
 IS
begin
 insert into COM_PROVEEDORES_RGP (
   ID
  ,COMPRV_ID
  ,COMRGP_ID
  ,VIGENCIA_FCH
  ,VALIDEZ_FCH
  ,SITUACION
  ,MOTIVO_SITUACION
  ,DATE_CREATED
  ,DATE_MODIFIED
  ,CREATED_BY
  ,MODIFIED_BY
 ) values (
   p_comprg.ID
  ,p_comprg.COMPRV_ID
  ,p_comprg.COMRGP_ID
  ,p_comprg.VIGENCIA_FCH
  ,p_comprg.VALIDEZ_FCH
  ,p_comprg.SITUACION
  ,p_comprg.MOTIVO_SITUACION
  ,p_comprg.DATE_CREATED
  ,p_comprg.DATE_MODIFIED
  ,p_comprg.CREATED_BY
  ,p_comprg.MODIFIED_BY
 );
end;
/* Establece la variable de paquete */
PROCEDURE COMPRG_SET
 (P_ID IN NUMBER
 )
 IS
cursor cr_comprg is
  select comprg.*
  from   COM_PROVEEDORES_RGP comprg
  where  comprg.ID = p_id;
begin
  open cr_comprg;
  fetch cr_comprg into v_comprg;
  close cr_comprg;
end;
FUNCTION COMPRG_HABILITAR_SN
 (P_COMPRG_ID IN NUMBER
 ,P_SEGUSU_TIPO IN VARCHAR2
 ,P_COMECO_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_comprg  is
    select comprg.situacion situacion
          ,comprg.comrgp_id comrgp_id
          ,comprg.validez_fch validez_fch
      from com_proveedores_rgp comprg
      where comprg.id = p_comprg_id;
      --
 cursor cr_comcrg is
    select comcrg.comrgp_id comrgp_id
    from   com_contratantes_rgp comcrg
    where  comcrg.comeco_id = p_comeco_id
    and    comcrg.situacion = 'VIG';
--
v_comprg cr_comprg%rowtype;
v_comcrg cr_comcrg%rowtype;
v_retorno varchar2 (2);
begin
    open cr_comprg;
    fetch cr_comprg into v_comprg;
    close cr_comprg;
 --
    open cr_comcrg;
    fetch cr_comcrg into v_comcrg;
    close cr_comcrg;
  --
    if v_comprg.situacion = ('SUS') and ((v_comprg.comrgp_id = v_comcrg.comrgp_id) or p_segusu_tipo = 'ADM') and v_comprg.validez_fch is null then
        v_retorno := 'SI';
    else
        v_retorno := 'NO';
    end if;
   --
    return v_retorno;
   --
end;
/* Suspender proveedor para un Tipo de Registro. */
PROCEDURE COMPRG_SUSPENDER
 (P_COMPRV_ID IN NUMBER
 ,P_COMRGP_ID IN NUMBER
 ,P_MOTIVO IN VARCHAR2
 )
 IS
-- Buscar la situacion actual para el proveedor en el tipo de registro
   cursor cr_comprg is
    select max(comprg.id)
    from   com_proveedores_rgp comprg
    where  comprg.comrgp_id = p_comrgp_id
      and  comprg.comprv_id = p_comprv_id;
--
v_comprg_id number;
v_comprg com_proveedores_rgp%rowtype;
v_comprg_ins com_proveedores_rgp%rowtype;
begin
    open cr_comprg;
    fetch cr_comprg into v_comprg_id;
    close cr_comprg;
    --
    -- Obtener los datos del enlace entre el proveedor y el tipo de registro
  COMPRV_PKG.COMPRG_SET(p_id     => v_comprg_id);
  COMPRV_PKG.COMPRG_GET(p_comprg => v_comprg);
  COMPRV_PKG.COMPRG_INI;
  --
  -- Si la situación actual es VIGENTE, se debe dar de baja
  if v_comprg.situacion = 'VIG' then
    update com_proveedores_rgp
      set  validez_fch = sysdate
          ,motivo_situacion = 'Por suspensión de Proveedor.'
     where id = v_comprg.id;
  end if;
  --
  -- Insertar registro con situacion SUSPENDIDO
  v_comprg_ins.COMPRV_ID := p_comprv_id;
  v_comprg_ins.COMRGP_ID := p_comrgp_id;
  v_comprg_ins.vigencia_fch := sysdate;
  v_comprg_ins.motivo_situacion := p_motivo;
  v_comprg_ins.situacion := 'SUS';
  --
  COMPRV_PKG.COMPRG_INS(p_comprg => v_comprg_ins);

end;
FUNCTION COMPRG_SUSPENDER_SN
 (P_COMPRG_ID IN NUMBER
 ,P_SEGUSU_TIPO IN VARCHAR2
 ,P_COMECO_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_comprg  is
    select comprg.situacion situacion
          ,comprg.comrgp_id comrgp_id
      from com_proveedores_rgp comprg
      where comprg.id = p_comprg_id;
      --
 cursor cr_comcrg is
    select comcrg.comrgp_id comrgp_id
    from   com_contratantes_rgp comcrg
    where  comcrg.comeco_id = p_comeco_id
    and    comcrg.situacion = 'VIG';
--
v_comprg cr_comprg%rowtype;
v_comcrg cr_comcrg%rowtype;
v_retorno varchar2 (2);
begin
    open cr_comprg;
    fetch cr_comprg into v_comprg;
    close cr_comprg;
 --
    open cr_comcrg;
    fetch cr_comcrg into v_comcrg;
    close cr_comcrg;
  --
    if v_comprg.situacion in ('VIG','BAJ') and ((v_comprg.comrgp_id = v_comcrg.comrgp_id) or p_segusu_tipo = 'ADM') then
        v_retorno := 'SI';
    else
        v_retorno := 'NO';
    end if;
   --
    return v_retorno;
   --
end;
/* Obtener si un proveedor esta de baja en el periodo para el rubro */
FUNCTION COMPRR_HABILITADO_SN
 (P_COMPRV_ID IN NUMBER
 ,P_COMRUB_ID IN NUMBER
 ,P_FECHA_INICIO_CTZ IN DATE
 ,P_FECHA_FIN_CTZ IN DATE
 )
 RETURN VARCHAR2
 IS
cursor cr_comrub is
    select comrub.ID
    from   COM_RUBROS comrub
          ,COM_PROVEEDORES_RUB comprr
    where  comrub.ID = COMPRR.COMRUB_ID
    and    comprr.COMPRV_ID = p_comprv_id
    and    comprr.COMRUB_ID = p_comrub_id
    and    comprr.SITUACION = 'BAJ'
    and    decode(comprr.DATE_MODIFIED, null, comprr.DATE_CREATED, comprr.DATE_MODIFIED) between p_fecha_inicio_ctz and p_fecha_fin_ctz
    and    comrub.ID not in (select comrub.ID
                             from   COM_RUBROS comrub
                                   ,COM_PROVEEDORES_RUB comprr
                             where  comrub.ID = COMPRR.COMRUB_ID
                             and    comprr.COMPRV_ID = p_comprv_id
                             and    comprr.COMRUB_ID = p_comrub_id
                             and    comprr.SITUACION = 'ACT'
                             and    decode(comprr.DATE_MODIFIED, null, comprr.DATE_CREATED, comprr.DATE_MODIFIED) between p_fecha_inicio_ctz and p_fecha_fin_ctz);
  --
  v_comrub_id number;
begin
  --
  open cr_comrub;
  fetch cr_comrub into v_comrub_id;
  close cr_comrub;
  --
  if v_comrub_id is not null then
    return 'NO';
  else
    return 'SI';
  end if;
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
/* Obtener el valor de la variable v_comprs */
PROCEDURE COMPRS_GET
 (P_COMPRS OUT COM_PROVEEDORES_RES%ROWTYPE
 )
 IS
BEGIN
  p_comprs := v_comprs;
END;
PROCEDURE COMPRS_INI
 IS
begin
  v_comprs := null;
end;
/* Insertar registro en COM_PROVEEDORES_RES */
PROCEDURE COMPRS_INS
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
PROCEDURE COMPRV_ACTUALIZAR
 (P_COMPRV_ID IN NUMBER
 ,P_COMDOM_ID IN NUMBER
 ,P_COMPRV_EMAIL IN VARCHAR2
 ,P_COMDOM_TEL_CODIGO_AREA IN VARCHAR2
 ,P_COMDOM_TEL_NUMERO IN VARCHAR2
 )
 IS
cursor cr_segcfg is
  select VALOR
    from SEG_CONFIGURACIONES
   where CODIGO = 'COMADM_COMPRV_DIAS_VIGENCIA_DATOS';
  --
  v_valor NUMBER;
BEGIN
  COMPRV_ACTUALIZAR_VLD(P_COMPRV_ID => P_COMPRV_ID
                       ,P_COMDOM_ID => P_COMDOM_ID
                       ,P_COMPRV_EMAIL => P_COMPRV_EMAIL
                       ,P_COMDOM_TEL_CODIGO_AREA => P_COMDOM_TEL_CODIGO_AREA
                       ,P_COMDOM_TEL_NUMERO => P_COMDOM_TEL_NUMERO);
  --
  --Obtener Configuracion
  OPEN cr_segcfg;
  FETCH cr_segcfg INTO v_valor;
  CLOSE cr_segcfg;
  --
  --Actualizar Proveedor Email
  UPDATE COM_PROVEEDORES
     SET EMAIL = P_COMPRV_EMAIL
       , FECHA_VALIDEZ_DATOS = (SYSDATE + V_VALOR)
   WHERE ID = P_COMPRV_ID;
  --
  --Actualizar Proveedor Telefono
  UPDATE COM_DOMICILIOS
     SET TELEFONO_CODIGO_AREA = P_COMDOM_TEL_CODIGO_AREA
       , TELEFONO_NUMERO = P_COMDOM_TEL_NUMERO
   WHERE ID = P_COMDOM_ID;
  --

END;
PROCEDURE COMPRV_ACTUALIZAR_VLD
 (P_COMPRV_ID IN NUMBER
 ,P_COMDOM_ID IN NUMBER
 ,P_COMPRV_EMAIL IN VARCHAR2
 ,P_COMDOM_TEL_CODIGO_AREA IN VARCHAR2
 ,P_COMDOM_TEL_NUMERO IN VARCHAR2
 )
 IS
cursor cr_comdom is
  select ID
    from COM_DOMICILIOS
   where ID = P_COMDOM_ID;
  --
  v_comprv COM_PROVEEDORES%rowtype;
  v_comdom_id NUMBER;
  --
begin
  --Verificar los Parametros Obligatorios
  if P_COMPRV_ID is null then
    raise_application_error(-20000,'El Proveedor no ha sido indicado y es un valor obligatorio',true);
  elsif P_COMDOM_ID is null then
    raise_application_error(-20000,'El Domicilio Legal no ha sido indicado y es un valor obligatorio',true);
  elsif P_COMPRV_EMAIL is null then
    raise_application_error(-20000,'El Email no ha sido indicado y es un valor obligatorio',true);
  elsif P_COMDOM_TEL_CODIGO_AREA is null then
    raise_application_error(-20000,'El Código de Area no ha sido indicado y es un valor obligatorio',true);
  elsif P_COMDOM_TEL_NUMERO is null then
    raise_application_error(-20000,'El Número de Télefono no ha sido indicado y es un valor obligatorio',true);
  end if;
  --
  --Verificar los Parametros
  COMPRV_SET(P_ID => P_COMPRV_ID);
  COMPRV_GET(P_COMPRV => v_comprv);
  COMPRV_INI();
  --
  if v_comprv.ID is null then
    raise_application_error(-20000,'El Proveedor indicado es incorrecto',true);
  end if;
  --
  --
  OPEN cr_comdom;
  FETCH cr_comdom INTO v_comdom_id;
  CLOSE cr_comdom;
  --
  if v_comdom_id is null then
    raise_application_error(-20000,'El Domicilio indicado es incorrecto',true);
  end if;
  --
end;
/* el proveedor puede cotizar si no debe doc en ningun objeto y rubro */
FUNCTION COMPRV_COMOBJ_COTIZAR_SN
 (P_COMPRV_ID IN NUMBER
 ,P_COMRUB_ID IN NUMBER := null
 )
 RETURN VARCHAR2
 IS
-- Obtener los rubros del proveedor
cursor cr_comrub is
  select comrub.ID
  from   COM_PROVEEDORES_RUB comprr
        ,COM_RUBROS          comrub
        ,COM_RUBROS_OBJ      comruo
  where  comprr.COMPRV_ID           = p_comprv_id
  and    comprr.SITUACION           = 'ACT'
  and    comprr.COMRUB_ID           = comrub.ID
  and    comrub.SITUACION           = 'VIG'
  and    comrub.CONTIENE_OBJETOS_SN = 'SI'
  and    comrub.ID                  = comruo.COMRUB_ID
  and    comruo.SITUACION           = 'VIG'
  and    (comrub.ID = p_comrub_id or p_comrub_id is null);

-- Obtener los objetos del proveedor
cursor cr_comobj(p_comrub_id number) is
  select comobj.ID
  from   COM_OBJETOS     comobj
  --    ,COM_OBJETOS_EST comobe
  where  comobj.COMPRV_ID     = p_comprv_id
  and    comobj.COMRUB_ID     = p_comrub_id
--and    comobj.COMOBE_ID     = comobe.ID
  and    comobj.comobe_estado = 'HAB';
  --
  v_comobj cr_comobj%rowtype;
  v_retorno varchar2(2) := 'NO';
begin
-- Recorrer todos los rubros que contienen objetos.
  for v_comrub in cr_comrub loop
    open cr_comobj(v_comrub.ID);
    fetch cr_comobj into v_comobj;
    close cr_comobj;
      -- Si el rubro contienen objetos y no hay objetos asociados, el proveedor adeuda documentacion.
    if v_comobj.ID is not null then
      for v_comobj in cr_comobj(v_comrub.ID) loop
        -- Si debe documentacion para un objeto, entonces el proveedor adeuda documentacion.
        if COMPRV_PKG.COMOBJ_DEBE_SN(p_comprv_id => p_comprv_id,p_comobj_id => v_comobj.ID) = 'SI' then
          v_retorno := 'SI';
          exit;
        else
          v_retorno := 'NO';
        end if;
      end loop;
    else
      v_retorno := 'SI';
      exit;
    end if;
  end loop;
  return v_retorno;
end;
/* Devuelve los tipos de documentos requeridos para el proveedor */
FUNCTION COMPRV_COMPDT_REQUERIDO_SN
 (P_COMPRV_ID IN NUMBER
 ,P_COMPDT_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_compdt_gen is
  select 1
  from   COM_PROVEEDORES_DOT   compdt
      ,COM_PROVEEDORES_DTE   compde
  where  compde.ID = com_pkg.obtn_compde_id (compdt.ID)
  and    compde.ESTADO = 'HAB'
  and    COMPDT.TIPO = 'GEN'
  and    COMPDT.PRESENTA_TRAMITE_SN = 'NO'
  and    compdt.ID = p_compdt_id;
  --
  cursor cr_compdt_rub is
  select 1
  from   COM_PROVEEDORES_DOT   compdt
        ,COM_PROVEEDORES_DTE   compde
        ,COM_COMPDT_COMPRT     comptt
        ,COM_PROVEEDORES_TIPOS comprt
        ,COM_PROVEEDORES       comprv
        ,COM_COMPDT_COMRUB     comtdr
  where  compde.ID = com_pkg.obtn_compde_id (compdt.ID)
  and    compde.ESTADO = 'HAB'
  and    compdt.ID = comptt.COMPDT_ID
  and    COMPDT.TIPO = 'RUB'
  and    COMPDT.PRESENTA_TRAMITE_SN = 'NO'
  and    comprt.ID = comptt.COMPRT_ID
  and    comprt.ID = comprv.COMPRT_ID
  and    comprv.ID = p_comprv_id
  and    compdt.ID = comtdr.COMPDT_ID
  and    compdt.ID = p_compdt_id
  and    COMTDR.COMRUB_ID in (select comrub.ID
                              from COM_RUBROS comrub
                                  ,COM_PROVEEDORES_RUB comprr
                                  ,COM_PROVEEDORES comprv
                              where comprv.ID = p_comprv_id
                              and   comprv.ID = comprr.COMPRV_ID
                              and   comprr.COMRUB_ID = comrub.ID
                              and   comprr.SITUACION = 'ACT');
  --
  v_general number;
  v_rubro number;
  v_retorno varchar2(2);
begin
  v_retorno := 'NO';
  --
  open cr_compdt_gen;
  fetch cr_compdt_gen into v_general;
  close cr_compdt_gen;
  --
  if nvl(v_general, 0) = 1 then
    v_retorno := 'SI';
  else
    open cr_compdt_rub;
    fetch cr_compdt_rub into v_rubro;
    close cr_compdt_rub;
    --
    if nvl(v_rubro, 0) = 1 then
      v_retorno := 'SI';
    end if;
  end if;
  --
  return v_retorno;
end;
/* Obtener la lista de Situacion de un Proveedor con sus Registros */
FUNCTION COMPRV_COMPRG_OBT_SIT
 (P_COMPRV_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_datos is
  select 'Registro: <b>'||comrgp.nombre||'</b>'||chr(10)||
         'Situación: '||decode(comprg.situacion,'VIG','<font color="green"><b>ASOCIADO</b></font>','BAJ','<font color="red"><b>DE BAJA</b></font>','SUS','<font color="red"><b>SUSPENDIDO</b></font>')||chr(10)||
         'Fecha de Vigencia : '||to_char(comprg.vigencia_fch,'dd/mm/yyyy')||chr(10)||
         decode(comprg.motivo_situacion,'','','Motivo : '||comprg.motivo_situacion) descripcion
from com_proveedores_rgp comprg
    ,com_registros_prv comrgp
where comprg.comrgp_id = comrgp.id
  and comprg.comprv_id = p_comprv_id
  and (comprg.situacion ='VIG' OR (comprg.situacion = 'SUS' and comprg.validez_fch is null))
  order by comprg.vigencia_fch DESC;
  --
  v_retorno varchar2(4000);
  --
begin
  --
  for v_datos in cr_datos loop
    v_retorno := v_retorno||v_datos.descripcion||chr(10)||chr(10);
  end loop;
  --
  return v_retorno;
  --
end;
/* Indica si permite cotizar por proveedor para un rubro dado */
FUNCTION COMPRV_COMRUB_COTIZAR_SN
 (P_COMPRV_ID IN NUMBER
 ,P_COMRUB_ID IN NUMBER
 ,P_FECHA IN DATE := SYSDATE
 )
 RETURN VARCHAR2
 IS
-- Obtener la configuracion
    cursor cr_segcfg is
      select segcfg.valor
      from   SEG_CONFIGURACIONES segcfg
      where  segcfg.CODIGO = 'COMADM_COMOBD_NECESARIA_COTIZAR_SN';
    -- Obtener si existe algun tipo de documento no presentado,
    -- para los tipos de documentos asociados a los rubros del proveedor
    cursor cr_compdt_cant is
      select count(1) CANTIDAD
      from    com_proveedores_dot      compdt
             ,com_compdt_comrub        comtdr
             ,com_compdt_comprt        comptt
    --       ,com_proveedores_dte      compde
             ,com_proveedores_rub      comprr
             ,com_proveedores          comprv
     where    compdt.ID             = comtdr.compdt_id
--   and      compdt.ID             = compde.compdt_id
     and      comtdr.comrub_id      = p_comrub_id
--   and      compde.ID             = com_pkg.obtn_compde_id (compdt.ID)
--   and      compde.ESTADO         = 'HAB'
     and      compdt.compde_estado  = 'HAB'
     and      comtdr.OBLIGATORIO_SN = 'SI'
     and      comprr.COMRUB_ID      = comtdr.COMRUB_ID
     and      comprr.comprv_id      = comprv.id
     and      comprr.SITUACION      = 'ACT'
     and      comprv.comprt_id      = comptt.comprt_id
     and      comptt.compdt_id      = compdt.id
     and      comprv.id             = p_comprv_id
     and      COM_PKG.COMPDO_PRESENTADO_SN(p_comprv_id => comprv.id
                                          ,p_compdt_id => compdt.ID
                                          ,p_fecha     => p_fecha) = 'NO';
    --
  v_compdt_cant cr_compdt_cant%rowtype;
  v_retorno varchar2(2) := 'SI';
  v_segcfg_valor varchar2(2000);
  v_adeuda_objetos varchar2(2);
begin
  --
  open cr_segcfg;
  fetch cr_segcfg into v_segcfg_valor;
  close cr_segcfg;
  --
  if trim(v_segcfg_valor) = 'SI' then
    v_adeuda_objetos := COMPRV_COMOBJ_COTIZAR_SN(p_comprv_id => p_comprv_id
                                                ,p_comrub_id => p_comrub_id);
  else
    v_adeuda_objetos := 'NO';
  end if;
  --
  open cr_compdt_cant;
  fetch cr_compdt_cant into v_compdt_cant;
  close cr_compdt_cant;
  -- Si no se encontraron documentos adeudados no debe en el rubro
  if (nvl(v_compdt_cant.CANTIDAD,0) > 0) or (v_adeuda_objetos = 'SI') then
    v_retorno := 'NO';
  end if;
  --
  return v_retorno;
  --
end;
FUNCTION COMPRV_COTIZAR_SN
 (P_COMPRV_ID IN NUMBER
 ,P_COMCTT_ID IN NUMBER
 ,P_FECHA IN DATE := SYSDATE
 )
 RETURN VARCHAR2
 IS
-- Buscar los documentos obligatorios para un tipo de contratacion
  -- que el proveedor debe presentar
  cursor cr_compdo is
    select COUNT(DISTINCT(COMPDT.NOMBRE)) COMPDT_NOMBRE
    from com_compdt_comprt      comptt
        ,com_proveedores_tipos  comprt
        ,com_proveedores_dot    compdt
        ,com_proveedores_dte    compde
        ,com_proveedores        comprv
        ,com_compdt_comctt      comcct
    where comprv.ID                 = P_COMPRV_ID
    AND comptt.COMPRT_ID            = comprt.ID
    AND compdt.ID                   = compde.COMPDT_ID
    AND compde.ID                   = com_pkg.obtn_compde_id (compdt.ID)
    AND comptt.COMPDT_ID            = compdt.ID
    AND compde.ESTADO               = 'HAB'
    AND compdt.TIPO                 = 'GEN'
    AND comcct.COMPDT_ID            = COMPDT.id
    AND comcct.NECESARIO_COTIZAR_SN = 'SI'
    AND comcct.COMCTT_ID            = P_COMCTT_ID
    AND comptt.COMPRT_ID            = comprv.COMPRT_ID
    --and com_pkg.obtn_comdoc_no_fmt (p_segorg_id => COMPDT.SEGORG_ID
    --                               ,p_comprv_id => comprv.ID
    --                               ,p_compdt_id => COMPDT.id
    --                               ,p_fecha     => P_FECHA) not in ('VIGENTE','SUSPENDIDO');
    AND com_pkg.obtn_comdoc_no_fmt4 (p_segorg_id            => COMPDT.SEGORG_ID
                                    ,p_comprv_id            => comprv.ID
                                    ,p_comprt_id            => comprv.comprt_id
                                    ,p_compdt_id            => COMPDT.ID
                                    ,P_COMPDT_TIPO          => COMPDT.TIPO
                                    ,P_COMPDT_TIPO_DURACION => COMPDT.TIPO_DURACION
                                    ,P_COMPDE_ESTADO        => COMPDE.ESTADO
                                    ,p_fecha                => P_FECHA) not in ('VIGENTE','SUSPENDIDO');
  --
  -- Buscar los documentos obligatorios para TODOS los tipos de contratacion
  -- que el proveedor debe presentar
  cursor cr_compdo_2 is
    select COUNT(DISTINCT(COMPDT.NOMBRE)) COMPDT_NOMBRE
    from com_compdt_comprt     comptt
        ,com_proveedores_tipos comprt
        ,com_proveedores_dot   compdt
        ,com_proveedores_dte   compde
        ,com_proveedores       comprv
    where comprv.ID           = P_COMPRV_ID
    AND comptt.COMPRT_ID      = comprt.ID
    AND compdt.ID             = compde.COMPDT_ID
    AND compde.ID             = com_pkg.obtn_compde_id (compdt.ID)
    AND comptt.COMPDT_ID      = compdt.ID
    AND compde.ESTADO         = 'HAB'
    AND compdt.TIPO           = 'GEN'
    AND comptt.OBLIGATORIO_SN = 'SI'
    AND comptt.COMPRT_ID      = comprv.COMPRT_ID
    --and com_pkg.obtn_comdoc_no_fmt (p_segorg_id => COMPDT.SEGORG_ID
    --                               ,p_comprv_id => comprv.ID
    --                               ,p_compdt_id => COMPDT.id
    --                               ,p_fecha     => P_FECHA) not in ('VIGENTE','SUSPENDIDO');
    AND com_pkg.obtn_comdoc_no_fmt4 (p_segorg_id            => COMPDT.SEGORG_ID
                                    ,p_comprv_id            => comprv.ID
                                    ,p_comprt_id            => comprv.comprt_id
                                    ,p_compdt_id            => COMPDT.ID
                                    ,P_COMPDT_TIPO          => COMPDT.TIPO
                                    ,P_COMPDT_TIPO_DURACION => COMPDT.TIPO_DURACION
                                    ,P_COMPDE_ESTADO        => COMPDE.ESTADO
                                    ,p_fecha                => P_FECHA) not in ('VIGENTE','SUSPENDIDO');
  v_compre COM_PROVEEDORES_EST%rowtype;
  v_comprv COM_PROVEEDORES%rowtype;
  v_dummy NUMBER;
  v_retorno varchar2(2):='SI';
begin
  --Validar Proveedor existe
  --COMPRV_SET(p_id => p_comprv_id);
  --COMPRV_GET(p_comprv => v_comprv);
  --COMPRV_INI;
  --Validar Estado Proveedor
  COMPRV_PKG.COMPRE_SET(p_id =>  com_pkg.obtn_compre_id (p_comprv_id));
  COMPRV_PKG.COMPRE_GET(p_compre => v_compre);
  COMPRV_PKG.COMPRE_INI;
  --
  if nvl(v_compre.ESTADO,'XXX') in ('HAB','PEN') then
    --
    OPEN cr_compdo_2;
    FETCH cr_compdo_2 INTO v_dummy;
    CLOSE cr_compdo_2;
    --
    IF v_dummy <> 0 THEN
      v_retorno:= 'NO';
    END IF;
    --
    if v_retorno = 'SI' then
      --
      v_dummy := 0;
      if p_comctt_id is not null then
        OPEN cr_compdo;
        FETCH cr_compdo INTO v_dummy;
        CLOSE cr_compdo;
      end if;
      --
      IF v_dummy <> 0 THEN
        v_retorno:='NO';
      END IF;
      --
    end if;
    --
  else
    v_retorno := 'NO';
  end if;
  --
  RETURN (v_retorno);
  --
EXCEPTION
  when others then
     raise_application_error(-20000,'Error al intentar determinar si el proveedor está al día con su documentación para cotizar',true);
end;
/* Permite Cotizar si el proveedor no debe documentacion en ningun rubro */
FUNCTION COMPRV_COTIZAR_RUB_SN
 (P_COMPRV_ID IN NUMBER
 ,P_FECHA IN DATE := SYSDATE
 )
 RETURN VARCHAR2
 IS
--Verificar si el proveedor puede cotizar para cada rubro asociado
cursor cr_comrub is
  select count(comrub.ID)
  from COM_PROVEEDORES_RUB comprr
      ,COM_RUBROS          comrub
  where comprr.COMPRV_ID = p_comprv_id
  and   comprr.SITUACION = 'ACT'
  and   comprr.COMRUB_ID = comrub.ID
  and   COMPRV_PKG.COMPRV_COMRUB_COTIZAR_SN(p_comprv_id => comprr.COMPRV_ID --p_comprv_id
                                           ,p_comrub_id => comrub.ID
                                           ,p_fecha     => p_fecha) = 'NO';
  --
  v_dummy number;
  v_retorno varchar2(2);
begin
  -- Verificar configuracion
  --
  open cr_comrub;
  fetch cr_comrub into v_dummy;
  close cr_comrub;
  --
  if nvl(v_dummy, 0) > 0 then
    v_retorno :=  'NO';
  else
    v_retorno := 'SI';
  end if;

  return v_retorno;
end;
PROCEDURE COMPRV_DATOS_WS
 (P_CUIT IN VARCHAR2
 ,P_RAZON_SOCIAL OUT VARCHAR2
 ,P_CONDICION_IB OUT VARCHAR2
 ,P_CBU OUT VARCHAR2
 ,P_EMAIL OUT VARCHAR2
 ,P_NRO_INSCRIP_IB OUT VARCHAR2
 ,P_FEC_INSCRIP_IB OUT VARCHAR2
 ,P_NRO_CML OUT VARCHAR2
 ,P_CALLE OUT VARCHAR2
 ,P_NUMERO_CASA OUT VARCHAR2
 ,P_PISO OUT VARCHAR2
 ,P_DPTO OUT VARCHAR2
 ,P_LOCALIDAD OUT VARCHAR2
 ,P_DEPARTAMENTO OUT VARCHAR2
 ,P_PROVINCIA OUT VARCHAR2
 ,P_PAIS OUT VARCHAR2
 ,P_CODIGO_POSTAL OUT VARCHAR2
 ,P_TEL_CODIGO_AREA OUT VARCHAR2
 ,P_TEL_NUMERO OUT VARCHAR2
 )
 IS
--
  cursor cr_comprd (p_comprv_id number) is
  select *
  from com_proveedores_dom
  where comprv_id = p_comprv_id;
  --
  cursor cr_comdom (p_comdom_id number, p_comdmt_id number) is
  select *
  from com_domicilios
  where id = p_comdom_id
  and comdmt_id = p_comdmt_id;
  --
  cursor cr_comwsv (p_comwsv_codigo VARCHAR2) is
  select * from com_webservices comwsv
  where comwsv.codigo = p_comwsv_codigo;
  --
  v_compre      COM_PROVEEDORES_EST%rowtype;
  v_comprv      COM_PROVEEDORES%rowtype;
  v_comprd      COM_PROVEEDORES_DOM%rowtype;
  v_segorg      SEG_ORGANIZACIONES%rowtype;
  v_comdmt      COM_DOMICILIOS_TIPOS%rowtype;
  v_comdom      COM_DOMICILIOS%rowtype;
  v_comwsl      COM_WEBSERVICES_LOG%rowtype;
  v_comwsv      COM_WEBSERVICES%rowtype;
  v_dummy       NUMBER;
  v_codigo_ws   varchar2(100) := 'WS_DATOS_PROVEEDOR';
  v_var         varchar2(4000);
  --
begin
   p_razon_social    := null;
   p_condicion_ib    := null;
   p_cbu             := null;
   p_email           := null;
   p_nro_inscrip_ib  := null;
   p_fec_inscrip_ib  := null;
   p_nro_cml         := null;
   p_calle           := null;
   p_numero_casa     := null;
   p_piso            := null;
   p_dpto            := null;
   p_localidad       := null;
   p_departamento    := null;
   p_provincia       := null;
   p_pais            := null;
   p_codigo_postal   := null;
   p_tel_codigo_area := null;
   p_tel_numero      := null;

   --Obtener Organizacion
   SEG_PKG.SET_SEGORG_CODIGO(p_codigo => 'PCYCSL');
   SEG_PKG.GET_SEGORG(p_segorg => v_segorg);
   SEG_PKG.INI_SEGORG;
   dbms_output.put_line('v_segorg = ' || v_segorg.ID);
   --
   open cr_comwsv(p_comwsv_codigo => v_codigo_ws);
   fetch cr_comwsv into v_comwsv;
   close cr_comwsv;
   --
   if v_comwsv.ID = null then
      raise_application_error(-20000, 'No se ha encontrado la configuracion para el WebService: ' || v_codigo_ws , TRUE);
   end if;
   v_comwsl.COMWSV_ID := v_comwsv.ID;
   v_comwsl.DOCUMENTO := p_cuit;
   v_comwsl.FECHA     := sysdate;

   --
   --Validar Proveedor existe
   COM_PKG.SET_COMPRV_CUIT(p_segorg_id => v_segorg.id
                          ,p_cuit      => p_cuit);
   COM_PKG.GET_COMPRV(p_comprv => v_comprv);
   COM_PKG.INI_COMPRV;
   dbms_output.put_line('v_comprv.NOMBRE = ' || v_comprv.nombre);

   --Validar Estado Proveedor
   COM_PKG.COMPRE_SET(p_id =>  com_pkg.obtn_compre_id (v_comprv.ID));
   COM_PKG.COMPRE_GET(p_compre => v_compre);
   COM_PKG.COMPRE_INI;
   --
   IF v_comprv.ID IS NOT NULL THEN
   --
      IF v_compre.ESTADO in ('HAB') THEN
         --
         p_razon_social    := v_comprv.nombre;
         p_condicion_ib    := v_comprv.condicion_ib;
         p_cbu             := v_comprv.cbu;
         p_email           := v_comprv.email;
         p_nro_inscrip_ib  := v_comprv.NUMERO_INSCRIPCION_IB;
         p_fec_inscrip_ib  := v_comprv.FECHA_INSCRIPCION_IB;
         p_nro_cml         := v_comprv.NUMERO_CONVENIO_MULTILATERAL;
         --
         COM_PKG.COMDMT_SET_CODIGO (p_codigo => 'PRV_LEGAL');
         COM_PKG.COMDMT_GET(p_comdmt => v_comdmt);
         --
         for v_comprd in cr_comprd(v_comprv.id) loop
            for v_comdom in cr_comdom (v_comprd.comdom_id, v_comdmt.id ) loop
               if v_comdom.id is not null then
                  p_calle           := v_comdom.calle;
                  p_numero_casa     := v_comdom.numero_casa;
                  p_piso            := v_comdom.piso;
                  p_dpto            := v_comdom.dpto;
                  p_localidad       := v_comdom.localidad;
                  p_departamento    := v_comdom.departamento;
                  p_provincia       := v_comdom.provincia;
                  p_pais            := v_comdom.pais;
                  p_codigo_postal   := v_comdom.codigo_postal;
                  p_tel_codigo_area := v_comdom.telefono_codigo_area;
                  p_tel_numero      := v_comdom.telefono_numero;
                  exit;
               end if;
            end loop;
         end loop;
         --
      END IF;
      --
      v_var :=
         '<p_razon_social>'    || v_comprv.nombre                       || '</p_razon_social>'    ||
         '<p_condicion_ib>'    || v_comprv.condicion_ib                 || '</p_condicion_ib>'    ||
         '<p_cbu>'             || v_comprv.cbu                          || '</p_cbu>'             ||
         '<p_email>'           || v_comprv.email                        || '</p_email>'           ||
         '<p_nro_inscrip_ib>'  || v_comprv.NUMERO_INSCRIPCION_IB        || '</p_nro_inscrip_ib>'  ||
         '<p_fec_inscrip_ib>'  || v_comprv.FECHA_INSCRIPCION_IB         || '</p_fec_inscrip_ib>'  ||
         '<p_nro_cml>'         || v_comprv.NUMERO_CONVENIO_MULTILATERAL || '</p_nro_cml>'         ||
         '<p_calle>'           || v_comdom.calle                        || '</p_calle>'           ||
         '<p_numero_casa>'     || v_comdom.numero_casa                  || '</p_numero_casa>'     ||
         '<p_piso>'            || v_comdom.piso                         || '</p_piso>'            ||
         '<p_dpto>'            || v_comdom.dpto                         || '</p_dpto>'            ||
         '<p_localidad>'       || v_comdom.localidad                    || '</p_localidad>'       ||
         '<p_departamento>'    || v_comdom.departamento                 || '</p_departamento>'    ||
         '<p_provincia>'       || v_comdom.provincia                    || '</p_provincia>'       ||
         '<p_pais>'            || v_comdom.pais                         || '</p_pais>'            ||
         '<p_codigo_postal>'   || v_comdom.codigo_postal                || '</p_codigo_postal>'   ||
         '<p_tel_codigo_area>' || v_comdom.telefono_codigo_area         || '</p_tel_codigo_area>' ||
         '<p_tel_numero>'      || v_comdom.telefono_numero              || '</p_tel_numero>';

      v_comwsl.RESPUESTA  := v_var;
      v_comwsl.FECHA_RESPUESTA  := sysdate;
      v_comwsl.COMPRV_ID  := v_comprv.ID;
      v_comwsl.INVOCACION := '';
      v_comwsl.PARAMETROS := '<CUIT>'||P_CUIT||'</CUIT>';
      v_comwsl.MENSAJE  := '';
      v_comwsl.ESTADO   := 'VAL';
      COMWSV_PKG.COMWSL_INS(p_comwsl => v_comwsl);
      --
   END IF;
   --
end;
/* Registrar archivo firmado digitalmente en Doc Proveedores */
PROCEDURE COMPRV_DOCPRV_REGISTRAR
 (P_PARAMETROS IN VARCHAR2
 ,P_ARCHIVO IN BLOB
 )
 IS
v_parametros varchar2(32767);
  v_valor varchar2(2000);
  v_posicion number;
  v_comprv_id number;
  v_compdt_id number;
  v_fecha_presentacion date;
  v_fecha_emision date;
  v_fecha_vencimiento date;
  v_comentario varchar2(400);
  v_filename varchar2(200);
  --
  v_compdo COM_PROVEEDORES_DOC%rowtype;
begin
   v_parametros := p_parametros;
   -- Obtener el id de proveedor
    v_posicion := instr(v_parametros, ',');
    v_valor := substr(v_parametros, 1, v_posicion-1);
    v_parametros := substr(v_parametros, v_posicion+1);
    v_comprv_id := to_number(v_valor);
   -- Obtener el id de tipo de documento
    v_posicion := instr(v_parametros, ',');
    v_valor := substr(v_parametros, 1, v_posicion-1);
    v_parametros := substr(v_parametros, v_posicion+1);
    v_compdt_id := to_number(v_valor);
    -- Obtener la fecha de presentacion
    v_posicion := instr(v_parametros, ',');
    v_valor := substr(v_parametros, 1, v_posicion-1);
    v_parametros := substr(v_parametros, v_posicion+1);
    v_fecha_presentacion := to_date(v_valor, 'DD/MM/YYYY HH24:MI:SS');
    -- Obtener la fecha de emision
    v_posicion := instr(v_parametros, ',');
    v_valor := substr(v_parametros, 1, v_posicion-1);
    v_parametros := substr(v_parametros, v_posicion+1);
    v_fecha_emision := to_date(v_valor, 'DD/MM/YYYY HH24:MI:SS');
    -- Obtener la fecha de vencimiento
    v_posicion := instr(v_parametros, ',');
    v_valor := substr(v_parametros, 1, v_posicion-1);
    v_parametros := substr(v_parametros, v_posicion+1);
    v_fecha_vencimiento := to_date(v_valor, 'DD/MM/YYYY HH24:MI:SS');
    -- Obtener el comentario
    v_posicion := instr(v_parametros, ',');
    v_valor := substr(v_parametros, 1, v_posicion-1);
    v_parametros := substr(v_parametros, v_posicion+1);
    v_comentario := v_valor;
    -- Obtener el nombre de archivo
    v_filename := v_parametros;
    -- Insertar el archivo en la tabla COM_PROVEEDORES_DOC
    v_compdo.compdt_id := v_compdt_id;
    v_compdo.comprv_id := v_comprv_id;
    v_compdo.fecha_emision := v_fecha_emision;
    v_compdo.fecha_vencimiento := v_fecha_vencimiento;
    v_compdo.fecha_presentacion := v_fecha_presentacion;
    v_compdo.comentario := v_comentario;
    v_compdo.filename := v_filename;
    v_compdo.mimetype := 'application/pdf';
    v_compdo.last_update_date := sysdate;
    v_compdo.documento := p_archivo;
    v_compdo.situacion := 'NUE';
    v_compdo.motivo_situacion := 'Documento firmado Digitalmente';
    --
    COM_PKG.COMPDO_INS(p_compdo => v_compdo);
end;
/* Obtener el valor de la variable v_comprv */
PROCEDURE COMPRV_GET
 (P_COMPRV OUT COM_PROVEEDORES%ROWTYPE
 )
 IS
BEGIN
  p_comprv := v_comprv;
END;
/* Habilitado para cotizar por rubro, por proveedor y contratacion */
FUNCTION COMPRV_HABILITADO_COTIZAR_SN
 (P_COMPRV_ID IN NUMBER
 ,P_COMRUB_ID IN NUMBER
 ,P_COMCTT_ID IN NUMBER
 ,P_COMCON_ID IN NUMBER := null
 )
 RETURN VARCHAR2
 IS
cursor cr_segcfg is
  select segcfg.VALOR
  from   SEG_CONFIGURACIONES segcfg
  where  segcfg.CODIGO = 'COMPRV_CTRL_RUBRO_GRAL';
  --
cursor cr_compra_cfg is
  select compra_cfg.VALOR
  from   SEG_CONFIGURACIONES compra_cfg
  where  compra_cfg.CODIGO = 'COMPRA_FECHA_LIMITE';
  --
  v_retorno varchar2(2) := 'SI';
  v_valor varchar2(2000);
  v_fecha_limite varchar2(2000);
  v_comcon COM_CONTRATACIONES%rowtype;
begin
  -- Obtener la configuracion que indica si se aplica el control general
  -- sobre todos los documentos en todos los rubros
  open cr_segcfg;
  fetch cr_segcfg into v_valor;
  close cr_segcfg;
  --
  open cr_compra_cfg;
  fetch cr_compra_cfg into v_fecha_limite;
  close cr_compra_cfg;
  --
  -- CTISSERA: Para que accede a esta tabla ???
  --
  --COM_PKG.SET_COMCON(p_comcon_id => p_comcon_id);
  --COM_PKG.GET_COMCON(p_comcon => v_comcon);
  --COM_PKG.INI_COMCON;
  --
  if v_valor is null then
     v_valor := 'SI';
  end if;
  -- Si la configuracion indica SI, se deben controlar
  -- todos los documentos,  generales, por rubro y por contratacion
  if v_valor = 'SI' then
    -- Control por contratacion, Control por Rubro
      if COMPRV_COTIZAR_SN(p_comprv_id => p_comprv_id
                          ,p_comctt_id => p_comctt_id) = 'NO' then
       v_retorno := 'NO';
      end if;
    --
    if v_retorno = 'SI' then
       if COMPRV_COTIZAR_RUB_SN(p_comprv_id => p_comprv_id) = 'NO' then
         v_retorno := 'NO';
       end if;
    end if;
  -- Si solo se debe controlar el rubro específico
  else
    --
      if COMPRV_COTIZAR_SN(p_comprv_id => p_comprv_id
                          ,p_comctt_id => p_comctt_id) = 'NO' then
         v_retorno := 'NO';
      end if;
    --
    if v_retorno = 'SI' then
      if p_comrub_id is not null then
         --raise_application_error(-20000,'El Identificador del Rubro no ha sido indicado y es un dato obligatorio para aplicar este control',true);

        if COMPRV_COMRUB_COTIZAR_SN(p_comprv_id => p_comprv_id
                                   ,p_comrub_id => p_comrub_id) = 'NO' then
           v_retorno := 'NO';
        end if;
      end if;
    end if;
  end if;
  -- Verificar Autoridades si superó la Fecha Limite para Bloquear la Cotización
  if v_retorno = 'SI' and TO_DATE(v_fecha_limite,'DD/MM/YYYY') < trunc(SYSDATE) then
    -- Verificar Autoridades
    if COMPRA_COTIZAR_SN(p_comprv_id => p_comprv_id) = 'NO' then
      v_retorno := 'NO';
    end if;
  end if;
  -- Si esta al día con la documentación
  -- pero se ha dado de baja del rubro que corresponde a la solicitud incluida en el proceso
  -- con posterioridad a la fecha de invitación, esto significa que el proveedor esta intentando
  -- no cumplir con los requisitos correspondientes al rubro y se debe evitar que esto suceda
  -- si el proveedor se ha dado de baja del rubro con posterioridad a la fecha de invitación no permitir cotizar.
  -- Modificación introducida en fecha 05/07/2013 a pedido del Programa Compras
  --
  if v_retorno = 'SI' and p_comcon_id is not null then
    --
    v_retorno := COMPRV_RUBROHAB_SN(p_comprv_id => p_comprv_id
                                   ,p_comcon_id => p_comcon_id);
    --
  end if;
  --
  return v_retorno;
end;
PROCEDURE COMPRV_INI
 IS
begin
  v_comprv:=NULL;
end;
/* Insertar registro en COM_PROVEEDORES */
PROCEDURE COMPRV_INS
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
    ,FECHA_VALIDEZ_DATOS
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
    ,p_comprv.FECHA_VALIDEZ_DATOS
    ,p_comprv.OBSERVACION
    ,p_comprv.DATE_CREATED
    ,p_comprv.CREATED_BY
    ,p_comprv.DATE_MODIFIED
    ,p_comprv.MODIFIED_BY);
  --
END;
/* Obtener Nombre de Rubros por proveedor */
FUNCTION COMPRV_OBTN_COMRUB
 (P_COMPRV_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_datos is
  select comrub.nombre||' ('||comprr.observacion||')' rubro
  from com_proveedores_rub comprr
     , com_rubros comrub
  where comrub.id = comprr.comrub_id
    and comprr.situacion = 'ACT'
    and comprr.comprv_id = p_comprv_id;
  --
  v_retorno varchar2(4000);
  --
begin
  --
  for v_datos in cr_datos loop
    if v_retorno is null then
       v_retorno := v_datos.rubro;
    else
      v_retorno := v_retorno||chr(10)||v_datos.rubro;
    end if;
  end loop;
  --
  return v_retorno;
  --
end;
/* Restablecer Contraseña No logueado */
PROCEDURE COMPRV_RESCLV_OFF
 (P_COMPRV_ID IN NUMBER
 ,P_COMRES_ID IN NUMBER
 )
 IS
CURSOR cr_comprs IS
SELECT COMRES.NOMBRE
     , COMRES.TIPO_DOCUMENTO
     , COMRES.NUMERO_DOCUMENTO
     , COMPRS.SEGUSU_ID
     , COM_PKG.OBTN_CONTRASENIA(p_nombre => COMRES.NOMBRE
                              ,p_numero_documento => COMRES.NUMERO_DOCUMENTO) CONTRASENIA
 FROM COM_PROVEEDORES_RES COMPRS
     ,COM_RESPONSABLES COMRES
WHERE COMPRS.COMRES_ID = COMRES.ID
  AND COMPRS.COMPRV_ID = P_COMPRV_ID
  AND COMPRS.COMRES_ID = P_COMRES_ID;
BEGIN
 FOR v_comprs in cr_comprs LOOP
 UPDATE SEG_USUARIOS
    SET CONTRASENIA = v_comprs.contrasenia
 WHERE ID = v_comprs.segusu_id;
 END LOOP;
END;
/* Obtener el detalle de la baja para un Proveedor */
FUNCTION COMPRV_OBTN_BAJ
 (P_COMPRV_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_datos is
  select 'BAJA'||chr(10)||
         'Fecha de Vigencia : '||to_char(compre.FECHA_VIGENCIA,'dd/mm/yyyy')||chr(10)||
         'Normativa : '||GRAL_PKG.OBTN_VALORPARAMETRO('NORMATIVA',upper(compre.DESCRIPCION))||chr(10)||
         'Motivo : '||GRAL_PKG.OBTN_VALORPARAMETRO('DESCRIPCION',upper(compre.DESCRIPCION)) descripcion
  from com_proveedores_est compre
  where compre.comprv_id = p_comprv_id
    and compre.situacion = 'VAL'
    and compre.estado = 'BAJ'
  order by compre.fecha_vigencia DESC;
  --
  v_retorno varchar2(4000);
  --
begin
  --
  for v_datos in cr_datos loop
    v_retorno := v_retorno||v_datos.descripcion||chr(10)||chr(10);
  end loop;
  --
  return v_retorno;
  --
end;
/* Obtener la lista de Suspensiones para un Proveedor */
FUNCTION COMPRV_OBTN_SUS
 (P_COMPRV_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_datos is
  select 'Tipo de Sanción: SUSPENSION'||chr(10)||
         'Plazo : '||nvl(COMPRV_PKG.OBTN_PERIODO_SUS(compre.FECHA_VIGENCIA,compre.FECHA_VALIDEZ),'INDEFINIDO')||chr(10)||
         'Fecha de Vigencia : '||to_char(compre.FECHA_VIGENCIA,'dd/mm/yyyy')||chr(10)||
         'Normativa : '||GRAL_PKG.OBTN_VALORPARAMETRO('NORMATIVA',upper(compre.DESCRIPCION))||chr(10)||
         'Motivo : '||GRAL_PKG.OBTN_VALORPARAMETRO('DESCRIPCION',upper(compre.DESCRIPCION)) descripcion
  from com_proveedores_est compre
  where compre.comprv_id = p_comprv_id
    and compre.situacion = 'VAL'
    and compre.estado = 'SUS'
  order by compre.fecha_vigencia DESC;
  --
  v_retorno varchar2(4000);
  --
begin
  --
  for v_datos in cr_datos loop
    v_retorno := v_retorno||v_datos.descripcion||chr(10)||chr(10);
  end loop;
  --
  return v_retorno;
  --
end;
/* Obtener el estado de Deuda en DPIP y dejar un log de cada consulta. */
PROCEDURE COMPRV_REGISTRAR_DPIP
 (P_TIPO_DOCUMENTO IN VARCHAR2
 ,P_NRO_DOCUMENTO IN VARCHAR2
 ,P_FECHA IN DATE
 ,P_MENSAJE OUT VARCHAR2
 )
 IS
cursor cr_comwsv is
    select comwsv.ID
          ,comwsv.USERNAME
          ,comwsv.PASSWORD
          ,comwsv.URL
    from   COM_WEBSERVICES comwsv
    where  comwsv.CODIGO = 'estadoDeudaByFec';
  --
  cursor cr_comprv(p_segorg_id in number, p_cuit in varchar2) is
    select comprv.ID
    from   COM_PROVEEDORES comprv
    where  comprv.CUIT = p_cuit
    and    comprv.SEGORG_ID = p_segorg_id;
  --
  v_comwsv cr_comwsv%rowtype;
  v_comwsl COM_WEBSERVICES_LOG%rowtype;
  --v_comprv COM_PROVEEDORES%rowtype;
  --
  v_solicitud SYS.UTL_HTTP.req  := null;
  v_respuesta SYS.UTL_HTTP.resp := null;
  v_valor  varchar2(4000);
  v_xml    varchar2(4000);
  v_estado varchar2(3);
  v_resultado varchar2(100);
  v_segorg_id number;
  v_comprv_id number;
  v_fecha date;
begin
  v_estado := 'VAL';
  -- Obtener la organizacion a partir del usuario conectado
  v_segorg_id := SEG_PKG.OBTN_ORGUSU(nvl(v('APP_USER'), USER));
  -- Obtener los datos de la conexion
  open cr_comwsv;
  fetch cr_comwsv into v_comwsv;
  close cr_comwsv;
  -- Obtener el proveedor con el CUIT proporcionado
  open cr_comprv(p_segorg_id => v_segorg_id, p_cuit =>  p_nro_documento);
  fetch cr_comprv into v_comprv_id;
  close cr_comprv;
  -- Calcular la fecha desde la que se considera la deuda
  v_fecha := p_fecha - SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo => 'COMADM_COMPRV_DIAS_ATRAS_DPIP', p_segorg_id => v_segorg_id);
  -- Registrar el log en el estado inicial
  v_comwsl.ID         := COMWSL_ID.nextval;
  v_comwsl.COMWSV_ID  := v_comwsv.ID;
  v_comwsl.COMPRV_ID  := v_comprv_id;
  v_comwsl.FECHA      := v_fecha;
  v_comwsl.INVOCACION := null;
  v_comwsl.PARAMETROS := '<pTipdoc>'||p_tipo_documento||'</pTipdoc><pNroDoc>'||p_nro_documento||'</pNroDoc><pFecha>'||to_char(v_fecha,'DD/MM/YYYY')||'</pFecha>';
  v_comwsl.DOCUMENTO  := p_nro_documento;
  v_comwsl.ESTADO     := 'PEN';
  --
  COMWSV_PKG.COMWSL_INS(p_comwsl => v_comwsl);
  -- Si la llamada al Webservice falla se hace un rollback, se fuerza el log de la consulta.
  COMMIT;
  --
  -- Crear la envoltura del XML que contiene los parametros que se enviaran al servicio web
   v_xml := '<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
                     xmlns:xsi="http://www.w3.org/1999/XMLSchema-instance"
                     xmlns:xsd="http://www.w3.org/1999/XMLSchema">
              <SOAP-ENV:Body>
                <ns1:estadoDeudaWs2 xmlns:ns1="http://estadodeudabyfec/WSEstadoDeudaByFec.wsdl">
                  <pTipdoc>'||p_tipo_documento||'</pTipdoc>
                  <pNrodoc>'||p_nro_documento||'</pNrodoc>
                  <pFecha>'||to_char(v_fecha,'DD/MM/YYYY')||'</pFecha>
              </ns1:estadoDeudaWs2>
            </SOAP-ENV:Body>
          </SOAP-ENV:Envelope>';
  -- INVOCACION DEL SERVICIO
  begin
    --
    --SYS.UTL_HTTP.SET_WALLET('file:c:\sme','inter123');
    -- Generar una Solicitud HTTP al servidor Web
    v_solicitud := SYS.UTL_HTTP.BEGIN_REQUEST(v_comwsv.url, 'GET');
    -- Autenticar utilizando un esquema de autenticacion basico
    SYS.UTL_HTTP.SET_AUTHENTICATION(v_solicitud, v_comwsv.username, v_comwsv.password);
    -- Obtener la respuesta de la autenticacion.
    v_respuesta := SYS.UTL_HTTP.GET_RESPONSE(v_solicitud);
    -- Generar una Solicitud HTTP al servidor Web
    v_solicitud := SYS.UTL_HTTP.BEGIN_REQUEST(v_comwsv.url, 'POST');
    --
    --Creamos una cabecera para la solicitud, e indicamos que el contenido que enviamos es XML:
    SYS.UTL_HTTP.SET_HEADER(v_solicitud, 'content-Type', 'text/xml');
    --Establecemos el SOAPAction a invocar:
    SYS.UTL_HTTP.SET_HEADER(v_solicitud, 'soapaction', '"rpc/'||v_comwsv.url||'"');
    --Indicamos en el header el tamaño del mensaje enviado
    SYS.UTL_HTTP.SET_HEADER(v_solicitud, 'content-length', length(v_xml));
    --Escribimos el body del request
    SYS.UTL_HTTP.WRITE_TEXT(v_solicitud, v_xml);
    --Obtenemos la respuesta
    v_respuesta := SYS.UTL_HTTP.GET_RESPONSE(v_solicitud);
    --Cargamos en la variable respVal la devolución del servidor
    SYS.UTL_HTTP.READ_TEXT(v_respuesta, v_valor);
    --Finalizamos la conexión HTTP
    SYS.UTL_HTTP.END_RESPONSE(v_respuesta);
  exception
    when SYS.UTL_HTTP.REQUEST_FAILED then
      v_estado := 'INV';
      v_valor  := 'La solicitud fallo al ejecutarse';
      SYS.UTL_HTTP.END_RESPONSE(v_respuesta);
    when SYS.UTL_HTTP.BAD_ARGUMENT then
      v_estado := 'INV';
      v_valor  := 'El argumento pasado a la interfaz es incorrecto';
      SYS.UTL_HTTP.END_RESPONSE(v_respuesta);
    when SYS.UTL_HTTP.BAD_URL then
      v_estado := 'INV';
      v_valor  := 'La URL de la solicitud es incorrecta';
      SYS.UTL_HTTP.END_RESPONSE(v_respuesta);
    when SYS.UTL_HTTP.PROTOCOL_ERROR then
      v_estado := 'INV';
      v_valor  := 'Error de protocolo HTTP al comunicarse con el servidor';
      SYS.UTL_HTTP.END_RESPONSE(v_respuesta);
    when SYS.UTL_HTTP.UNKNOWN_SCHEME then
      v_estado := 'INV';
      v_valor  := 'El esquema de la URL es desconocido';
      SYS.UTL_HTTP.END_RESPONSE(v_respuesta);
    when SYS.UTL_HTTP.HEADER_NOT_FOUND then
      v_estado := 'INV';
      v_valor  := 'No se encontro el encabezado';
      SYS.UTL_HTTP.END_RESPONSE(v_respuesta);
    when SYS.UTL_HTTP.END_OF_BODY then
      v_estado := 'INV';
      v_valor  := 'Se alcanzo el final del cuerpo de la respuesta';
      SYS.UTL_HTTP.END_RESPONSE(v_respuesta);
    when SYS.UTL_HTTP.ILLEGAL_CALL then
      v_estado := 'INV';
      v_valor  := 'La llamada al servicio es ilegal en el estado actual de la solicitud';
      SYS.UTL_HTTP.END_RESPONSE(v_respuesta);
    when SYS.UTL_HTTP.HTTP_CLIENT_ERROR then
      v_estado := 'INV';
      v_valor  := v_respuesta.status_code||': '||v_respuesta.reason_phrase;
      SYS.UTL_HTTP.END_RESPONSE(v_respuesta);
    when SYS.UTL_HTTP.HTTP_SERVER_ERROR then
      v_estado := 'INV';
      v_valor  := v_respuesta.status_code||': '||v_respuesta.reason_phrase;
      SYS.UTL_HTTP.END_RESPONSE(v_respuesta);
    when SYS.UTL_HTTP.TOO_MANY_REQUESTS then
      v_estado := 'INV';
      v_valor  := 'Demasiadas solicitudes abiertas';
      SYS.UTL_HTTP.END_RESPONSE(v_respuesta);
    /*when SYS.UTL_HTTP.PARTIAL_MULTIBYTE_EXCEPTION then
      v_estado := 'INV';
      v_valor  := 'Se leeyo un carácter multibyte parcial que se encuentra al final del cuerpo de la respuesta';
      SYS.UTL_HTTP.END_RESPONSE(v_respuesta);*/
    when SYS.UTL_HTTP.TRANSFER_TIMEOUT then
      v_estado := 'INV';
      v_valor  := 'No se leyo ningun dato y se cumplio el tiempo de espera';
      SYS.UTL_HTTP.END_RESPONSE(v_respuesta);
    when others then
      v_estado := 'INV';
      v_valor  := substr(SQLERRM, 11);
      SYS.UTL_HTTP.END_RESPONSE(v_respuesta);
  end;
  -- CIERRE DEL SERVICIO
  -- Extraer el resultado desde el codigo XML de respuesta
  v_resultado := SUBSTR(v_valor,INSTR(v_valor,'<result>')+length('<result>')
                                    ,INSTR(v_valor,'</result>')-(INSTR(v_valor,'<result>')+length('<result>')));
  -- Interpretar el mensaje de resultado;
  if v_resultado is null then
    p_mensaje := 'No se pudo comprobar si presenta deuda';
  elsif v_resultado = '000' then
    p_mensaje := 'No presenta deuda en DPIP';
  else
    p_mensaje := 'Presenta deuda en DPIP';
  end if;
  -- Registrar el log de consulta del servicio web.
  update COM_WEBSERVICES_LOG
  set    RESPUESTA       = v_valor
        ,INVOCACION      = v_xml
        ,FECHA_RESPUESTA = p_fecha
        ,ESTADO          = v_estado
        ,MENSAJE         = p_mensaje
  where  ID              = v_comwsl.ID;
end;
/* Comprobar si el servicio web esta activo */
FUNCTION COMPRV_REGISTRAR_DPIP_VLD
 (P_URL IN VARCHAR2
 ,P_PROXY IN VARCHAR2
 )
 RETURN CLOB
 IS
v_solicitud SYS.UTL_HTTP.req  := null;
  v_respuesta SYS.UTL_HTTP.resp := null;
  v_retorno CLOB;
begin
  --
  -- Generar una Solicitud HTTP al servidor Web
  UTL_HTTP.SET_WALLET('file:c\sme','inter123');
  -- Establece el proxy si existe
  UTL_HTTP.SET_PROXY(p_proxy, null);
  -- Iniciar una solicitud HTTP al Servicio Web
  v_solicitud := SYS.UTL_HTTP.BEGIN_REQUEST(p_url, 'GET');
  -- Obtener una respuesta desde el servicio web
  v_respuesta := SYS.UTL_HTTP.GET_RESPONSE(v_solicitud);
  -- Leer la respuesta desde el web service
  UTL_HTTP.READ_TEXT(v_respuesta, v_retorno);
  -- Finalizar la respuesta y la solicitud
  UTL_HTTP.END_RESPONSE(v_respuesta);
  -- Si devuelve una respuesta pero no es ok elevar una excepcion
  if v_respuesta.STATUS_CODE <> UTL_HTTP.HTTP_OK then
    v_retorno := 'ERROR: '||UTL_HTTP.GET_DETAILED_SQLERRM;
  end if;
  return v_retorno;
exception
  -- No se pudo conectar al servicio Web
  when UTL_HTTP.REQUEST_FAILED then
    v_retorno := 'ERROR: '||UTL_HTTP.GET_DETAILED_SQLERRM;
    return v_retorno;
end;
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
/* Proveedor con rubro habilitado para cotizar en proceso */
FUNCTION COMPRV_RUBROHAB_SN
 (P_COMPRV_ID IN NUMBER
 ,P_COMCON_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
-- Recuperar el objeto de gastos del proceso
  cursor cr_comped is
  select comped.comcob_id
  from com_pedidos comped
     , com_contrataciones_detalles comcot
  where comcot.comped_id = comped.id
    and comcot.comcon_id = p_comcon_id;
  -- Recuperar los rubros asociados al objeto de gasto del proceso
  cursor cr_comrub (p_comcob_id in number) is
  select comrcb.comrub_id
  from com_rubcob comrcb
  where comrcb.comcob_id = p_comcob_id
    and situacion = 'VIG';
  --
  cursor cr_comprr_ins (p_comrub_id in number) is
  select 1
  from com_proveedores_rub comprr
  where comprr.comprv_id = p_comprv_id
    and comprr.comrub_id = p_comrub_id;
  --
  cursor cr_comprr (p_comrub_id in number) is
  select 1
  from com_proveedores_rub comprr
  where comprr.comprv_id = p_comprv_id
    and comprr.comrub_id = p_comrub_id
    and comprr.situacion = 'ACT'
    and comprr.fecha_validez is null;
  --
  cursor cr_comprr_2 (p_comrub_id in number) is
  select 1
  from com_proveedores_rub comprr
  where comprr.comprv_id = p_comprv_id
    and comprr.comrub_id = p_comrub_id
    and comprr.situacion = 'BAJ'
    and  comprr.fecha_validez is not null
    and (comprr.fecha_validez >= (select trunc(comcoi.fecha) fecha
                                 from com_contrataciones_inv comcoi
                                 where comcoi.comcon_id = p_comcon_id
                                 and comcoi.comprv_id = p_comprv_id))
    and comprr.fecha_vigencia = (select max(comprr.FECHA_VIGENCIA)
                                from com_proveedores_rub comprr
                                where comprr.comprv_id = p_comprv_id
                                and comprr.comrub_id = p_comrub_id);
  --
  v_dummy number;
  v_comprr_ins_sn VARCHAR2(2) := 'SI';
  v_retorno VARCHAR2(2) := 'SI';
  --
BEGIN
  for v_comped in cr_comped loop
    --
    for v_comrub in cr_comrub (p_comcob_id => v_comped.comcob_id) loop
      --
      open cr_comprr_ins (p_comrub_id => v_comrub.comrub_id);
      fetch cr_comprr_ins into v_dummy;
      if cr_comprr_ins%notfound then
         v_retorno := 'SI';
         v_comprr_ins_sn := 'NO';
      else
         v_comprr_ins_sn := 'SI';
      end if;
      close cr_comprr_ins;
      --
      if v_comprr_ins_sn = 'SI' then
          open cr_comprr (p_comrub_id => v_comrub.comrub_id);
          fetch cr_comprr into v_dummy;
          if cr_comprr%notfound then
              v_comprr_ins_sn := 'NO';
          else
              v_retorno := 'SI';
              v_comprr_ins_sn := 'SI';
          end if;

          close cr_comprr;
          --
      end if;
    end loop;
        -- Si se detecta que el proveedor no se encuentra en el rubro del proceso
        -- Verificar si se ha dado de baja del rubro con posterioridad a la fecha de invitacion
        -- De ser así, no permitile cotizar pues debe volver a darse de alta en el rubro
        if v_comprr_ins_sn = 'NO' then
          --
          for v_comrub in cr_comrub (p_comcob_id => v_comped.comcob_id) loop
            --
            open cr_comprr_2 (p_comrub_id => v_comrub.comrub_id);
            fetch cr_comprr_2 into v_dummy;
            if cr_comprr_2%found then
              v_retorno := 'NO';
            end if;
            close cr_comprr_2;
            --
        end loop;
      end if;
      --
    --
  end loop;
  --
  return (v_retorno);
  --
end;
/* Proveedor con rubro habilitado para cotizar en proceso */
FUNCTION COMPRV_RUBRO_SITUACION
 (P_COMPRV_ID IN NUMBER
 ,P_COMCON_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
-- Recuperar el objeto de gastos del proceso
  cursor cr_comped is
  select comped.comcob_id
  from com_pedidos comped
     , com_contrataciones_detalles comcot
  where comcot.comped_id = comped.id
    and comcot.comcon_id = p_comcon_id;
  -- Recuperar los rubros asociados al objeto de gasto del proceso
  cursor cr_comrub (p_comcob_id in number) is
  select comrcb.comrub_id
  from com_rubcob comrcb
  where comrcb.comcob_id = p_comcob_id
    and situacion = 'VIG';
  --
  cursor cr_comprr_ins (p_comrub_id in number) is
  select 1
  from com_proveedores_rub comprr
  where comprr.comprv_id = p_comprv_id
    and comprr.comrub_id = p_comrub_id;
  --
  cursor cr_comprr (p_comrub_id in number) is
  select 1
  from com_proveedores_rub comprr
  where comprr.comprv_id = p_comprv_id
    and comprr.comrub_id = p_comrub_id
    and comprr.situacion = 'ACT'
    and comprr.fecha_validez is null;
  --
  cursor cr_comprr_2 (p_comrub_id in number) is
  select 1
  from com_proveedores_rub comprr
  where comprr.comprv_id = p_comprv_id
    and comprr.comrub_id = p_comrub_id
    and comprr.situacion = 'BAJ'
    and comprr.fecha_validez >= (
    select trunc(comcoi.fecha) fecha
    from com_contrataciones_inv comcoi
    where comcoi.comcon_id = p_comcon_id
      and comcoi.comprv_id = p_comprv_id);
  --
  v_dummy number;
  v_comprr_ins_sn VARCHAR2(2) := 'NO';
  v_retorno VARCHAR2(20) := NULL;
  --
BEGIN
  --
  for v_comped in cr_comped loop
    --
    for v_comrub in cr_comrub (p_comcob_id => v_comped.comcob_id) loop
      --
      open cr_comprr_ins (p_comrub_id => v_comrub.comrub_id);
      fetch cr_comprr_ins into v_dummy;
      if cr_comprr_ins%notfound then
         v_retorno := 'INVITADO';
         v_comprr_ins_sn := 'NO';
      else
         v_comprr_ins_sn := 'SI';
      end if;
      close cr_comprr_ins;
      --
      if v_comprr_ins_sn = 'SI' then
          open cr_comprr (p_comrub_id => v_comrub.comrub_id);
          fetch cr_comprr into v_dummy;
          if cr_comprr%found then
              v_retorno := 'INSCRIPTO';
              v_comprr_ins_sn := 'SI';
          else
              v_comprr_ins_sn := 'NO';
          end if;
          close cr_comprr;
          --
        end if;
        -- Si se detecta que el proveedor no se encuentra en el rubro del proceso
        -- Verificar si se ha dado de baja del rubro con posterioridad a la fecha de invitacion
        -- De ser así, no permitile cotizar pues debe volver a darse de alta en el rubro
        if v_comprr_ins_sn = 'NO' then
          --
          open cr_comprr_2 (p_comrub_id => v_comrub.comrub_id);
          fetch cr_comprr_2 into v_dummy;
          if cr_comprr_2%found then
             v_retorno := 'NO INSCRIPTO';
          end if;
           close cr_comprr_2;
          --
        end if;
       --
    end loop;
    --
  end loop;
  --
  return (v_retorno);
  --
END;
/* Seteo la variable v_comprv */
PROCEDURE COMPRV_SET
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
  COMPRV_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comprv;
  FETCH cr_comprv INTO v_comprv;
  CLOSE cr_comprv;
  --
END;
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
PROCEDURE COMPRE_GET
 (P_COMPRE OUT COM_PROVEEDORES_EST%ROWTYPE
 )
 IS
begin
  p_compre := v_compre;
end;
/* Insertar registro en COM_PROVEEDORES_EST */
PROCEDURE COMPRE_INS
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
PROCEDURE COMPRE_INI
 IS
begin
  v_compre := null;
end;
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
/* Obtener los rubros para un tipo de documento y un tipo de proveedor */
FUNCTION COMPTT_OBTN_RUBROS
 (P_COMPRV_ID IN NUMBER
 ,P_COMPDT_ID IN NUMBER
 ,P_VER_OBLIGATORIO_SN IN VARCHAR2 := 'NO'
 )
 RETURN VARCHAR2
 IS
-- configuracion general
  cursor cr_datos1 is
  select decode(comptt.obligatorio_sn,'SI','OBLIGATORIO','OPCIONAL')  obligatorio
  from COM_PROVEEDORES_DOT compdt
      ,COM_COMPDT_COMPRT comptt
      ,COM_PROVEEDORES comprv
  where compdt.id = comptt.compdt_id
    and comptt.comprt_id = comprv.comprt_id
    and compdt.TIPO = 'GEN'
    and comprv.id = p_comprv_id
    and compdt.id = p_compdt_id;
  -- configuracion por rubro
  cursor cr_datos2 is
  select comrub.nombre rub_nombre
        ,decode(comtdr.obligatorio_sn,'SI','OBLIGATORIO','OPCIONAL')  obligatorio
  from COM_PROVEEDORES_DOT compdt
      ,COM_COMPDT_COMRUB comtdr
      ,COM_COMPDT_COMPRT comptt
      ,COM_PROVEEDORES comprv
      ,COM_PROVEEDORES_RUB comprr
      ,COM_RUBROS comrub
  where compdt.id = comtdr.compdt_id
    and comtdr.comrub_id = comprr.comrub_id
    and comtdr.comrub_id = comrub.id
    and compdt.id = comptt.compdt_id
    and comptt.comprt_id = comprv.comprt_id
    and comprr.comprv_id = comprv.id
    and comprv.id = p_comprv_id
    and comprr.SITUACION = 'ACT'
    and compdt.TIPO = 'RUB'
    and compdt.id = p_compdt_id;
  --
  v_retorno varchar2(4000);
begin
  -- Recorrer los generales del tipo de documento para el proveedor
  for v_datos in cr_datos1 loop
    -- Acumular el nombre del rubro
    if v_retorno is null then
      v_retorno:= 'GENERAL';
    else
      -- Si existe mas de un rubro, hacer un salto de linea antes de acumular
      v_retorno:= v_retorno||chr(10)||'GENERAL';
    end if;
    -- Si se ha solicitado ver si el rubro es obligatorio, mostrarlo agregandolo al acumulado
    if p_ver_obligatorio_sn = 'SI' then
       v_retorno := v_retorno||' - ('||v_datos.obligatorio||')';
    end if;
    --
  end loop;
  --
  -- Recorrer los rubros del tipo de documento para el proveedor
  for v_datos in cr_datos2 loop
    -- Acumular el nombre del rubro
    if v_retorno is null then
      v_retorno:= 'RUBRO - '||v_datos.rub_nombre;
    else
      -- Si existe mas de un rubro, hacer un salto de linea antes de acumular
      v_retorno:= v_retorno||chr(10)||'RUBRO - '||v_datos.rub_nombre;
    end if;
    -- Si se ha solicitado ver si el rubro es obligatorio, mostrarlo agregandolo al acumulado
    if p_ver_obligatorio_sn = 'SI' then
       v_retorno := v_retorno||' ('||v_datos.obligatorio||')';
    end if;
    --
  end loop;
  --
  return v_retorno;
  --
end;
/* Indica si un tipo de documento es obligatorio para un tipo proveedor */
FUNCTION COMPTT_OBLCTZ_SN
 (P_COMPRT_ID IN NUMBER
 ,P_COMPDT_ID IN NUMBER
 ,P_COMRUB_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_datos is
  select obligatorio_sn
  from COM_COMPDT_COMPRT
  where comprt_id = p_comprt_id
    and compdt_id = p_compdt_id;
  --
  cursor cr_datos2 is
  select obligatorio_sn
  from COM_COMPDT_COMRUB
  where comrub_id = p_comrub_id
    and compdt_id = p_compdt_id;
  --
  v_retorno varchar2(2):='NO';
  --
begin
  -- Obtener los datos de la configuración
  -- (relacion entre el tipo de proveedor y el tipo de documento habilitado para el tipo de proveedor)
  -- Obtiene los datos para la configuracion general de documentos
  open cr_datos;
  fetch cr_datos into v_retorno;
  close cr_datos;
  -- Si para el tipo de proveedor el documento
  -- no es obligatorio en forma general o no esta configurado
  -- y se ha indicado que se busque por rubro, ejecutar la busqueda
  if nvl(v_retorno,'NO') = 'NO' and p_comrub_id is not null then
    -- Obtiene los datos para la configuración por rubro del documento
    open cr_datos2;
    fetch cr_datos2 into v_retorno;
    close cr_datos2;
    --
  end if;
  --
  return nvl(v_retorno,'NO');
  --
end;
/* Obtener la cantidad de Rubros por Categoria dado un rubro. */
FUNCTION COMRBC_OBTN_CANT_RUB
 (P_COMRUB_ID IN NUMBER
 )
 RETURN INTEGER
 IS
--Obtengo Cantidad de Rubros por Categoria
  cursor cr_datos (P_COMRBC_ID NUMBER) is
  select count(1)
    from COM_RUBROS
   where comrbc_id = P_COMRBC_ID;
  --
  v_comrub       COM_RUBROS%rowtype;
  v_cantidad     NUMBER;
  --
begin
  --
  COMPRV_PKG.COMRUB_SET(p_id => p_comrub_id);
  COMPRV_PKG.COMRUB_GET(p_comrub => v_comrub);
  COMPRV_PKG.COMRUB_INI();
  --
  open cr_datos(v_comrub.COMRBC_ID);
  fetch cr_datos into v_cantidad;
  close cr_datos;
  --
  return v_cantidad;
  --
end;
FUNCTION COMRBC_PRV_INS_SN
 (P_COMRBC_ID IN NUMBER
 ,P_COMPRV_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_datos is
  select count(comrbc.ID)
	from COM_RUBROS_CAT comrbc
		,COM_RUBROS comrub
		,COM_PROVEEDORES_RUB comprr
		,COM_PROVEEDORES comprv
	where comrbc.ID = comrub.COMRBC_ID
	  and comrub.ID = comprr.COMRUB_ID
	  and comprv.ID = comprr.COMPRV_ID
	  and comprr.SITUACION = 'ACT'
      and comprv.ID = P_COMPRV_ID
	  and comrbc.id = P_COMRBC_ID;
  --
  v_retorno VARCHAR2(2):= 'SI';
  v_dummy NUMBER;
begin
  --
  IF nvl(P_COMRBC_ID,0)<>0 THEN
    --
    OPEN cr_datos;
    FETCH cr_datos INTO v_dummy;
    CLOSE cr_datos;
    --
    IF nvl(v_dummy,0) = 0 THEN
          v_retorno :='NO';
    END IF;
    --
  END IF;
  --
  RETURN v_retorno;
end;
PROCEDURE COMRUB_GET
 (P_COMRUB OUT COM_RUBROS%ROWTYPE
 )
 IS
begin
  p_comrub := v_comrub;
end;
FUNCTION COMRUB_AGREGAR_SN
 (P_COMRUB_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
v_cantidad     NUMBER;
  v_cantidad_max NUMBER;
  --
begin
  --
  v_cantidad := COMPRV_PKG.COMRBC_OBTN_CANT_RUB(p_comrub_id => p_comrub_id);
  --
  v_cantidad_max := SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => 'COMADM_COMRBC_CANT_MAX_RUB', P_SEGORG_ID => SEG_PKG.OBTN_ORGUSU(nvl(v('APP_USER'),user)) );
  --
  if v_cantidad < v_cantidad_max then
    RETURN 'SI';
  else
    RETURN 'NO';
  end if;
  --
end;
PROCEDURE COMRUB_INI
 IS
begin
  v_comrub := null;
end;
PROCEDURE COMRUB_INS
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
PROCEDURE COMRUB_SET
 (P_ID IN NUMBER
 )
 IS
CURSOR cr_comrub IS
  SELECT *
  FROM COM_RUBROS COMRUB
  WHERE COMRUB.ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  COMRUB_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comrub;
  FETCH cr_comrub INTO v_comrub;
  CLOSE cr_comrub;
  --
END;
PROCEDURE COMRUB_SET_NOMBRE
 (P_SEGORG_ID IN NUMBER
 ,P_NOMBRE IN VARCHAR2
 )
 IS
CURSOR cr_comrub IS
  SELECT *
  FROM COM_RUBROS COMRUB
  WHERE COMRUB.SEGORG_ID = p_segorg_id
    AND COMRUB.NOMBRE    = p_nombre;
  --
BEGIN
  -- Inicializar la variable
  COMRUB_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comrub;
  FETCH cr_comrub INTO v_comrub;
  CLOSE cr_comrub;
  --
END;
PROCEDURE COMRUB_SET_CODIGO
 (P_SEGORG_ID IN NUMBER
 ,P_CODIGO IN NUMBER
 )
 IS
CURSOR cr_comrub IS
  SELECT *
  FROM COM_RUBROS COMRUB
  WHERE COMRUB.SEGORG_ID = p_segorg_id
    AND COMRUB.CODIGO    = p_codigo;
  --
BEGIN
  -- Inicializar la variable
  COMRUB_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comrub;
  FETCH cr_comrub INTO v_comrub;
  CLOSE cr_comrub;
  --
END;
/* Obtener el valor de la variable v_comruo. */
PROCEDURE COMRUO_GET
 (P_COMRUO OUT COM_RUBROS_OBJ%ROWTYPE
 )
 IS
begin
  p_comruo := v_comruo;
end;
/* Inicializar la variable v_comruo. */
PROCEDURE COMRUO_INI
 IS
begin
  v_comruo := null;
end;
/* Insertar registro en COM_RUBROS_OBJ. */
PROCEDURE COMRUO_INS
 (P_COMRUO IN COM_RUBROS_OBJ%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_RUBROS_OBJ
  ( ID
    ,COMRUB_ID
    ,COMOBT_ID
    ,SITUACION
    ,MOTIVO_SITUACION
    ,FECHA_SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY
  )
  VALUES
  ( p_comruo.ID
    ,p_comruo.COMRUB_ID
    ,p_comruo.COMOBT_ID
    ,p_comruo.SITUACION
    ,p_comruo.MOTIVO_SITUACION
    ,p_comruo.FECHA_SITUACION
    ,p_comruo.DATE_CREATED
    ,p_comruo.CREATED_BY
    ,p_comruo.DATE_MODIFIED
    ,p_comruo.MODIFIED_BY
  );
  --
END;
/* Setear la variable v_comruo. */
PROCEDURE COMRUO_SET
 (P_ID IN NUMBER
 )
 IS
CURSOR cr_comruo IS
    SELECT *
    FROM COM_RUBROS_OBJ COMRUO
    WHERE COMRUO.ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  COMRUO_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comruo;
  FETCH cr_comruo INTO v_comruo;
  CLOSE cr_comruo;
  --
END;
PROCEDURE COMOBJ_CREAR
 (P_SEGORG_ID IN NUMBER
 ,P_COMOBT_ID IN NUMBER
 ,P_COMPRV_ID IN NUMBER
 ,P_COMRUB_ID IN NUMBER
 ,P_CODIGO IN VARCHAR2
 ,P_NOMBRE IN VARCHAR2
 ,P_DESCRIPCION IN VARCHAR2
 ,P_OBSERVACION IN VARCHAR2
 ,P_COMOBJ_ID OUT NUMBER
 )
 IS
v_comobj_crear COM_OBJETOS%rowtype;
v_comobe_crear COM_OBJETOS_EST%rowtype;
begin

  -- Validar la la Creación
  COMOBJ_CREAR_VLD( p_segorg_id   => p_segorg_id
                  , p_comobt_id   => p_comobt_id
                  , p_comprv_id   => p_comprv_id
                  , p_comrub_id   => p_comrub_id
                  , p_codigo      => p_codigo
                  , p_nombre      => p_nombre
                  , p_descripcion => p_descripcion
                  , p_observacion => p_observacion
                  );


   -- Registrar
  select COMOBJ_ID.NEXTVAL
  into   v_comobj_crear.ID
  from   dual;
  --
  -- Registrar
  --
  v_comobj_crear.SEGORG_ID   := p_segorg_id;
  v_comobj_crear.COMOBT_ID   := p_comobt_id;
  v_comobj_crear.COMPRV_ID   := p_comprv_id;
  v_comobj_crear.COMRUB_ID   := p_comrub_id;
  v_comobj_crear.CODIGO      := p_codigo;
  v_comobj_crear.NOMBRE      := p_nombre;
  v_comobj_crear.DESCRIPCION := p_descripcion;
  v_comobj_crear.OBSERVACION := p_observacion;

  --
  COMOBJ_INS(p_comobj => v_comobj_crear);
  --
  -- Registrar Estado de Campaña
  select COMOBE_ID.NEXTVAL
  into   v_comobe_crear.ID
  from   dual;
  --
  v_comobe_crear.COMOBJ_ID             := v_comobj_crear.ID;
  v_comobe_crear.ESTADO                := 'NUE';
  v_comobe_crear.FECHA                 := SYSDATE;
  v_comobe_crear.MOTIVO                := ' ';

  --
  COMOBE_INS(p_comobe => v_comobe_crear);
  --
  -- Cargar la variable de retorno con el Id creado.
  p_comobj_id := v_comobj_crear.ID;
  --

end;
PROCEDURE COMOBJ_CREAR_VLD
 (P_SEGORG_ID IN NUMBER
 ,P_COMOBT_ID IN NUMBER
 ,P_COMPRV_ID IN NUMBER
 ,P_COMRUB_ID IN NUMBER
 ,P_CODIGO IN VARCHAR2
 ,P_NOMBRE IN VARCHAR2
 ,P_DESCRIPCION IN VARCHAR2
 ,P_OBSERVACION IN VARCHAR2
 )
 IS
v_comobj  com_objetos%rowtype;
v_comobt  com_objetos_tipos%rowtype;
v_comprv  com_proveedores%rowtype;
v_comrub  com_rubros%rowtype;
begin
  -- Verificar los parametros obligatorios
  if p_segorg_ID is null then
    raise_application_error(-20000,'La Organización no ha sido indicada y es un dato obligatorio',true);
  elsif p_comobt_id is null then
    raise_application_error(-20000,'El Tipo de Objeto no ha sido indicado y es un dato obligatorio',true);
  elsif p_comprv_id is null then
    raise_application_error(-20000,'El Proveedor no ha sido indicado y es un dato obligatorio',true);
  elsif p_comrub_id is null then
    raise_application_error(-20000,'La Especialidad no ha sido indicada y es un dato obligatorio',true);
  elsif p_codigo is null then
    raise_application_error(-20000,'El Código no ha sido indicado y es un dato obligatorio',true);
  elsif p_nombre is null then
    raise_application_error(-20000,'El Nombre no ha sido indicado y es un dato obligatorio',true);
  end if;
  --

  ---Verificar los Parametros
 COMOBT_SET(p_id =>p_comobt_id);
 COMOBT_GET(p_comobt =>v_comobt);
 COMOBT_INI;
 --
 if v_comobt.ID is null then
   raise_application_error(-20000,'El Tipo de Objeto no es correcto',true);
 end if;
 --
 --
 COMPRV_SET(p_id =>p_comprv_id);
 COMPRV_GET(p_comprv =>v_comprv);
 COMPRV_INI;
 --
 if v_comprv.ID is null then
   raise_application_error(-20000,'El Proveedor no es correcto',true);
 end if;
 --
 --
 COMRUB_SET(p_id =>p_comrub_id);
 COMRUB_GET(p_comrub =>v_comrub);
 COMRUB_INI;
 --
 if v_comrub.ID is null then
   raise_application_error(-20000,'El Rubro no es correcto',true);
 end if;
 --
end;
PROCEDURE COMTDP_GET
 (P_COMTDP OUT COM_TRAMITES_PRV_DOC%ROWTYPE
 )
 IS
begin
  p_comtdp := v_comtdp;
end;
PROCEDURE COMTDP_INI
 IS
begin
  v_comtdp := null;
end;
PROCEDURE COMTDP_INS
 (P_COMTDP IN COM_TRAMITES_PRV_DOC%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_TRAMITES_PRV_DOC
  ( ID
   ,COMTPR_ID
   ,COMPDO_ID
   ,OBSERVACION
   ,DATE_CREATED
   ,CREATED_BY
   ,DATE_MODIFIED
   ,MODIFIED_BY
   )
  values
  ( p_comtdp.ID
   ,p_comtdp.COMTPR_ID
   ,p_comtdp.COMPDO_ID
   ,p_comtdp.OBSERVACION
   ,p_comtdp.DATE_CREATED
   ,p_comtdp.CREATED_BY
   ,p_comtdp.DATE_MODIFIED
   ,p_comtdp.MODIFIED_BY);
  --
END;
PROCEDURE COMTDP_SET
 (P_ID IN NUMBER
 )
 IS
CURSOR cr_comtdp IS
  SELECT *
  FROM COM_TRAMITES_PRV_DOC COMTDP
  WHERE COMTDP.ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  v_comtdp := NULL;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comtdp;
  FETCH cr_comtdp INTO v_comtdp;
  CLOSE cr_comtdp;
  --
END;
PROCEDURE COMTRN_INS
 (P_COMTRN IN COM_TRAMITES_PRV_NOT%ROWTYPE
 )
 IS
begin
  insert into COM_TRAMITES_PRV_NOT
  (ID
 , COMTPR_ID
 , NOTA
 , COMPDO_ID
 , SITUACION
 , FECHA_SITUACION
 , MOTIVO_SITUACION
 , DATE_CREATED
 , CREATED_BY
 , DATE_MODIFIED
 , MODIFIED_BY
  )
  values
  (p_comtrn.ID
 , p_comtrn.COMTPR_ID
 , p_comtrn.NOTA
 , p_comtrn.COMPDO_ID
 , p_comtrn.SITUACION
 , p_comtrn.FECHA_SITUACION
 , p_comtrn.MOTIVO_SITUACION
 , p_comtrn.DATE_CREATED
 , p_comtrn.CREATED_BY
 , p_comtrn.DATE_MODIFIED
 , p_comtrn.MODIFIED_BY );
  --
end;
/* Encripta un procesador */
FUNCTION ENCRIPTAR_CLAVE
 (P_STRING IN VARCHAR2
 ,P_CLAVE IN VARCHAR2
 ,P_ALGORITMO IN PLS_INTEGER := null
 )
 RETURN VARCHAR2
 IS
v_semilla_codificada raw(64);
  v_string_codificado raw(64);
  v_string_encriptado raw(64);
  c_des_ecb_pkcs5     constant pls_integer := dbms_crypto.ENCRYPT_DES + dbms_crypto.CHAIN_ECB + dbms_crypto.PAD_PKCS5;
  v_algoritmo pls_integer;
begin
  -- Si el p_algoritmo es nulo se utiliza el siguiente algoritmo de encriptacion por omision
  -- ENCRYPT_DES - Encriptación de Datos Estandar (DES) - Utiliza claves de longitud de 56 bits.
  -- CHAIN_ECB - (Libro de códigos de Encriptacion Electronica) (ECB) Encripta cada bloque de manera independiente
  -- PAD_PKCS5 - (Estandar de Criptografia basado en Clave) (PKCS #5) Provee el padding que cumple con el estandar.
  if p_algoritmo is null then
    v_algoritmo := c_des_ecb_pkcs5;
  else
    v_algoritmo := p_algoritmo;
  end if;
  --
  v_string_codificado := UTL_I18N.STRING_TO_RAW(p_string, 'AL32UTF8');
  v_semilla_codificada   := UTL_I18N.STRING_TO_RAW(p_clave, 'AL32UTF8');
  --
  v_string_encriptado := dbms_crypto.encrypt(
							src => v_string_codificado,
							typ => v_algoritmo,
							key => v_semilla_codificada,
							iv =>  NULL
                          );
  --
  return v_string_encriptado;
  exception
    when others then
      raise_application_error(-20000, 'Error al encriptar los datos: '||sqlerrm, true);
end;
/* Cifrado de parametros para servicio de Firma Digital */
FUNCTION ENCRIPTAR_PARAMETROS
 (P_PARAMETROS IN VARCHAR2
 )
 RETURN VARCHAR2
 IS
v_encriptado varchar2(4000);
begin
 v_encriptado := COMPRV_PKG.ENCRIPTAR_CLAVE(p_string => p_parametros
                              ,p_clave => 'YzIkyqt0aTnJ');
 return v_encriptado;
end;
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
FUNCTION OBTN_COMCTZ_PRE
 (P_COMPRV_ID IN NUMBER
 ,P_COMCON_ID IN NUMBER
 )
 RETURN INTEGER
 IS
cursor cr_comctz is
  select count(id)
    from COM_COTIZACIONES
   where COMPRV_ID = P_COMPRV_ID
     and COMCON_ID = P_COMCON_ID
     and SITUACION = 'PRE';
  --
  v_dummy NUMBER;
  --
begin
  OPEN cr_comctz;
  FETCH cr_comctz INTO v_dummy;
  CLOSE cr_comctz;
  --
  RETURN v_dummy;
  --
end;
/* Obtener el estado de la Documentacion de Objeto de Rubro con formato */
FUNCTION COMOBD_OBTN_ESTADO
 (P_SEGORG_ID IN NUMBER
 ,P_COMPRV_ID IN NUMBER
 ,P_COMODT_ID IN NUMBER
 ,P_COMOBJ_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
cursor cr_comobd is
    select comobd.ID
          ,comobd.COMOBJ_ID
          ,comobd.COMODT_ID
          ,COMPRV_PKG.COMOBD_PRESENTADO_SN(p_segorg_id => p_segorg_id
                                          ,p_comprv_id => p_comprv_id
                                          ,p_comodt_id => p_comodt_id
                                          ,p_comobj_id => p_comobj_id) ESTADO
    from   COM_OBJETOS_DOC comobd
    where  comobd.SITUACION = 'VAL'
    and    comobd.COMOBJ_ID = p_comobj_id
    and    comobd.COMODT_ID = p_comodt_id;
  --
  v_comobd cr_comobd%rowtype;
  v_retorno varchar2(100);
begin
  open cr_comobd;
  fetch cr_comobd into v_comobd;
  close cr_comobd;
  --
  if v_comobd.ID is not null then
    if v_comobd.ESTADO = 'PRESENTADO' then
      v_retorno := '<span style="color:green"><b>VIGENTE</b></span>';
    else
      v_retorno := '<span style="color:red"><b>'||v_comobd.ESTADO||'</b></span>';
    end if;
  else
    v_retorno := '<span style="color:red"><b>NO PRESENTADO</b></span>';
  end if;
  return v_retorno;
end;
/* Indica si presenta Deuda en DPIP DBLink */
FUNCTION OBTN_COMPRV_ADEUDA_DPIP_DB_SN
 (P_TIPO_DOCUMENTO IN VARCHAR2
 ,P_NRO_DOCUMENTO IN VARCHAR2
 ,P_FECHA IN DATE
 )
 RETURN VARCHAR2
 IS
v_mensaje varchar2(100);
  v_resultado varchar2(2) := 'NO';
  v_fecha date;
begin
  --
  -- Calcular la fecha desde la que se considera la deuda
  v_fecha := p_fecha - SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo => 'COMADM_COMPRV_DIAS_ATRAS_DPIP'
                                               , p_segorg_id => SEG_PKG.OBTN_ORGUSU(nvl(v('APP_USER'),user)));
  --
  --v_mensaje := tri_pkg.ESTADO_DEUDA_WS2@COMCLF(P_TIPDOC => p_tipo_documento
   --                                             ,P_NRODOC => p_nro_documento
    --                                            ,P_FECHA =>TO_CHAR(v_fecha,'DD/MM/YYYY'));
  --
  v_mensaje := '111';
  --
  if nvl(v_mensaje,'000') = '000' then
     v_resultado := 'NO';
  else
    v_resultado := 'SI';
  end if;
  return v_resultado;
end;
/* Indica si presenta Deuda en DPIP */
FUNCTION OBTN_COMPRV_ADEUDA_DPIP_SN
 (P_TIPO_DOCUMENTO IN VARCHAR2
 ,P_NRO_DOCUMENTO IN VARCHAR2
 ,P_FECHA IN DATE
 )
 RETURN VARCHAR2
 IS
cursor cr_compdt is
    select compdt.ID
    from   COM_PROVEEDORES_DOT compdt
    where  CODIGO = 'CRTCUMFIS'
    and    PERMITE_DIGITALIZAR_SN = 'NO';
  --
  cursor cr_comprv is
    select comprv.ID
    from   COM_PROVEEDORES comprv
    where  comprv.CUIT = p_nro_documento;
  --
  v_mensaje varchar2(100);
  v_resultado varchar2(2) := 'NO';
  v_compdt_id number;
  v_comprv_id number;
begin
  --
  open cr_compdt;
  fetch cr_compdt into v_compdt_id;
  close cr_compdt;
  --
  open cr_comprv;
  fetch cr_comprv into v_comprv_id;
  close cr_comprv;
  --
  if COM_PKG.COMPDO_PRESENTADO_SN(p_comprv_id => v_comprv_id
                                 ,p_compdt_id => v_compdt_id
                                 ,p_fecha     => p_fecha) = 'NO' then

    COMPRV_REGISTRAR_DPIP(p_tipo_documento => p_tipo_documento
                         ,p_nro_documento  => p_nro_documento
                         ,p_fecha          => p_fecha
                         ,p_mensaje        => v_mensaje);
    if v_mensaje= 'Presenta deuda en DPIP' then
      v_resultado := 'SI';
    else
      v_resultado := 'NO';
    end if;
  else
    v_resultado := 'NO';
  end if;
  --
  return v_resultado;
end;
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
FUNCTION OBTN_PERIODO_SUS
 (P_ORIGEN IN DATE
 ,P_FINAL IN DATE
 )
 RETURN VARCHAR2
 IS
v_diferencia number;
v_anios number;
v_meses number;
v_dias number;
v_respuesta varchar2(2000);
v_fechamenor exception;
begin
    if p_final < p_origen then
        raise v_fechamenor;
    end if;
    v_diferencia := trunc(p_final - p_origen);
    v_anios := trunc(v_diferencia/365);
    v_dias:= mod(v_diferencia,365);
    v_meses := trunc(v_dias/30);
    v_dias:= mod(v_dias,30);
   --
    if v_anios > 0 then
       if v_anios = 1 then
           v_respuesta := to_char(v_anios)||' AÑO ';
       else
           v_respuesta := to_char(v_anios)||' AÑOS ';
       end if;
    else
      if v_meses > 0 then
        if v_meses = 1 then
           v_respuesta := v_respuesta||to_char(v_meses)||' MES ';
        else
           v_respuesta := v_respuesta||to_char(v_meses)||' MESES ';
        end if;
      else
        if v_dias > 0 then
          if v_dias = 1 then
            v_respuesta := v_respuesta||to_char(v_dias)||' DIA';
          else
            v_respuesta := v_respuesta||to_char(v_dias)||' DIAS';
          end if;
        end if;
      end if;
    --
    end if;
    --

    return v_respuesta;
    --
    EXCEPTION
   WHEN v_fechamenor THEN
        raise_application_error(-20000,'Fecha origen no puede ser mayor a fecha final');
   WHEN OTHERS THEN
      raise_application_error(-20000,'Error al calcular período de Suspensión');
end;

END COMPRV_PKG;
