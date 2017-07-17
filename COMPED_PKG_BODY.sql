create or replace PACKAGE BODY COMPED_PKG IS


/* Validar Nro Expdte Web Service Tramix - Solicitud de Gasto */
FUNCTION COMPED_VLDR_EXPDTE_TRAMIX
 (P_SEGORG_ID IN NUMBER
 ,P_TIPO_EXPDTE IN VARCHAR2
 ,P_NRO_EXPDTE IN VARCHAR2
 ,P_EJERCICIO_EXPDTE IN NUMBER
 ,P_COMECO_ID IN NUMBER
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
    v_username           VARCHAR2(100);
    v_ticket             VARCHAR2(100);
    v_expdte_fmt_tramix  VARCHAR2(30);
    v_tipo_expdte        VARCHAR2(30);
    v_comeco             com_contratantes%rowtype;
    --
begin
   --
   -- Deducimos el Tipo de Expediente en funcion del formato
   --
   v_tipo_expdte := p_tipo_expdte;
   open cr_comeco(p_comeco_id);
   fetch cr_comeco into v_comeco;
   close cr_comeco;
   -- Si la unidad ejecutora es de la Univercidad de La Punta (ULP) cambiar el Tipo de Expediente a UND-
   if substr(v_comeco.codigo,1,instr(v_comeco.codigo,'-',1)) = 'ULP-' then
      v_tipo_expdte := 'UND';
   end if;
  --
  --<expediente_identif>'||P_TIPOEXP||'-0-'||P_NRO_EXPEDIENTE||'-'||P_EJERCICIO||'</expediente_identif>
  --
   v_expdte_fmt_tramix := v_tipo_expdte || '-' ||
                        to_number(substr(p_nro_expdte, 1, 4 )) || '-' ||
                        to_number(substr(p_nro_expdte, 11   )) || '-' ||
                        to_number(substr(p_nro_expdte, 8, 2 ));
   --
   --url := 'http://64.215.200.12:81/tramix-flex/services/ActWebService';
   v_url      := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_URL_EXPEDIENTE'
                                           ,p_segorg_id =>  p_segorg_id);
   --
   v_ticket   := SEG_PKG.OBTN_SEGCFG_VALOR( p_codigo    => 'TRAMIX_TICKET'
                                           ,p_segorg_id =>  p_segorg_id);
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
       <ws:infoExpediente> ';
   --
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   --
   utl_http.write_text(req,chunk_buffer);
   --
   chunk_buffer :='<ticket>'              || v_ticket             || '</ticket> '             ||
				  '<expediente_identif>'  || v_expdte_fmt_tramix  || '</expediente_identif>'  ||
				  '<usuario_identif>'     || v_username           || '</usuario_identif> ';
   --
   chunk_buffer_clob := chunk_buffer_clob || chunk_buffer;
   utl_http.write_text(req,chunk_buffer);
   --
   chunk_buffer := '</ws:infoExpediente>
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
   --
end;
FUNCTION COMPED_AUTORIZAR_SN
 (P_COMPED_ID IN NUMBER
 ,P_FECHA IN DATE
 )
 RETURN VARCHAR2
 IS
cursor cr_compau(p_comeco_id in number, p_comcob_id in number, p_dia number) is
  select count(ID)
  from  COM_PEDIDOS_AUT
  where COMECO_ID = p_comeco_id
  and   COMCOB_ID = p_comcob_id
  and   SITUACION = 'VIG'
  and   p_dia between DIA_DESDE and DIA_HASTA;
  v_comped COM_PEDIDOS%ROWTYPE;
  v_dummy NUMBER;
  v_dia NUMBER;
  v_retorno VARCHAR(2) := 'NO';
begin
  -- Validar los datos de la solicitud
  COM_PKG.COMPED_AUTORIZAR_VLD(p_comped_id => p_comped_id
                              ,p_motivo    => null);
  -- Obtener el dia desde la fecha
  v_dia := to_number(substr(to_char(p_fecha), 1, 2));
  -- Obtener los datos del pedido
  COM_PKG.INI_COMPED;
  COM_PKG.SET_COMPED(p_id => p_comped_id);
  COM_PKG.GET_COMPED(p_comped => v_comped);
  -- Buscar la autorizacion con el contratante y el objeto de catalogo en la fecha especificada
  open cr_compau(p_comeco_id => v_comped.COMECO_ID, p_comcob_id => v_comped.COMCOB_ID, p_dia => v_dia);
  fetch cr_compau into v_dummy;
  close cr_compau;
  -- Si existe al menos uno autorizar el pedido
  if nvl(v_dummy, 0) >= 1 then
    v_retorno := 'SI';
  end if;
  --
  return v_retorno;
exception
  when others then
    return 'NO';
end;
/* Obtener las partidas correspondientes al pedido */
FUNCTION COMPED_OBTN_PARTIDAS
 (P_COMPED_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
-- Obtiene las si han sido anexadas partidas presupuestarias a la contratacion
  -- (Estan concatenadas con las partidas originales de la solicitud)
  cursor cr_anexas is
    select compda.ID, compda.VALOR PARTIDA
    from   COM_CONTRATACIONES_DETALLES comcot
          ,COM_PEDIDOS_DAT compda
          ,COM_DATOS_TIPOS comdat
    where  comcot.COMPED_ID = p_comped_id
    and    comcot.COMPED_ID = compda.COMPED_ID
    and    compda.COMDAT_ID = comdat.ID
    and    comdat.CODIGO = 'ADJ_PARPRE_PCYCSL';
  --
  cursor cr_compda is
    select compda.VALOR PARTIDA
    from   COM_CONTRATACIONES_DETALLES comcot
          ,COM_PEDIDOS_DAT compda
          ,COM_DATOS_TIPOS comdat
    where  comcot.COMPED_ID = p_comped_id
    and    comcot.COMPED_ID = compda.COMPED_ID
    and    compda.COMDAT_ID = comdat.ID
    and    comdat.CODIGO = 'PED_PARPRE_PCYCSL';
  --
  v_resultado varchar2(32767) := null;
  v_compda_id number;
  v_partidas varchar2(32767) := null;
begin
  --
  open cr_anexas;
  fetch cr_anexas into v_compda_id, v_partidas;
  close cr_anexas;
  -- Si existen partidas anexas, devuelve las partidas anexas
  -- (Estan concatenadas con las partidas originales de la solicitud)
  if v_compda_id is not null then
    v_resultado := v_partidas;
  else
    -- Devuelve las partidas originales de la solicitud
    for v_compda in cr_compda loop
      v_resultado := v_resultado||v_compda.PARTIDA||chr(13)||chr(10)||chr(13)||chr(10);
    end loop;
    -- Elimina el retorno de carro y el fin de linea desde el resultado
    v_resultado := rtrim(v_resultado, chr(13)||chr(10));
  end if;
  --
  return v_resultado;
  --
end;
FUNCTION COMPED_RECHAZAR_SN
 (P_COMPED_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
begin
  -- Validar si se puede rechazar el Pedido
  COMPED_PKG.COMPED_RECHAZAR_VLD(p_comped_id => p_comped_id
                                ,p_motivo => null);
  return 'SI';
exception
  when others then
    return 'NO';
end;
PROCEDURE COMPED_RECHAZAR
 (P_COMPED_ID IN NUMBER
 ,P_MOTIVO IN VARCHAR2
 )
 IS
--cantidad de cotizaciones realizadas para el pedido
  cursor cr_comctz is
    select count(ID)
    from   COM_COTIZACIONES_DETALLES comped
    where  comped.COMPED_ID = p_comped_id;
    --
   v_comctz_cantidad number;
   v_compee_id number;
   v_compee COM_PEDIDOS_EST%rowtype;
begin
  --
  COMPED_PKG.COMPED_RECHAZAR_VLD(p_comped_id => p_comped_id
                                ,p_motivo    => p_motivo);
  --
  v_compee_id := COM_PKG.OBTN_COMPEE_ID(p_comped_id => p_comped_id);
  COM_PKG.SET_COMPEE(p_id => v_compee_id);
  COM_PKG.GET_COMPEE(p_compee => v_compee);
  COM_PKG.INI_COMPEE;
  --
  open cr_comctz;
  fetch cr_comctz into v_comctz_cantidad;
  close cr_comctz;
  --
  if v_compee.ESTADO in ('AUT') and v_comctz_cantidad = 0 then
    --
    v_compee.ID := null;
    v_compee.COMPED_ID := p_comped_id;
    v_compee.FECHA := sysdate;
    v_compee.ESTADO := 'RCH';
    v_compee.MOTIVO := p_motivo;
    --
    COM_PKG.INS_COMPEE(p_compee => v_compee);
  end if;
end;
PROCEDURE COMPED_RECHAZAR_VLD
 (P_COMPED_ID IN NUMBER
 ,P_MOTIVO IN VARCHAR2
 )
 IS
cursor cr_etqped(p_codigo in varchar2) is
  select VALOR
  from   COM_ETIQUETAS
  where  CODIGO = p_codigo;
--
v_comped COM_PEDIDOS%rowtype;
v_compee COM_PEDIDOS_EST%rowtype;
--
v_compee_id number;
v_etiqueta varchar2(100);
begin
  COM_PKG.SET_COMPED(p_id => p_comped_id);
  COM_PKG.GET_COMPED(p_comped => v_comped);
  COM_PKG.INI_COMPED;
  --
  if (v_comped.ID is null) then
    raise_application_error(-20000, 'El Pedido indicado es invalido.', true);
  end if;
  --
  v_compee_id := COM_PKG.OBTN_COMPEE_ID(p_comped_id => v_comped.ID);
  COM_PKG.SET_COMPEE(p_id => v_compee_id);
  COM_PKG.GET_COMPEE(p_compee => v_compee);
  COM_PKG.INI_COMPEE;
  --
  if (v_compee.ID is null) then
    raise_application_error(-20000, 'El Estado del Pedido es invalido.', true);
  end if;
  --
  open cr_etqped(p_codigo => 'PEDS');
  fetch cr_etqped into v_etiqueta;
  close cr_etqped;
  --
  if (v_compee.ESTADO = 'RCH') then
    raise_application_error(-20000, 'La '||v_etiqueta||' ya se encuentra '||GRAL_PKG.OBTN_CFGABR('COM_PEDIDOS_EST.ESTADO', v_compee.ESTADO), true);
  end if;
  --
end;

END COMPED_PKG;
