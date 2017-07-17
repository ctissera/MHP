set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end;
/
 
 
--application/set_environment
prompt  APPLICATION 2804 - Compras - Procesos de Compras
--
-- Application Export:
--   Application:     2804
--   Name:            Compras - Procesos de Compras
--   Date and Time:   13:26 Jueves Noviembre 17, 2016
--   Exported By:     CTISSERA
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         4.2.4.00.08
--   Instance ID:     61807403983761
--
-- Import:
--   Using Application Builder
--   or
--   Using SQL*Plus as the Oracle user APEX_040200 or as the owner (parsing schema) of the application
 
 
--       AAAA       PPPPP   EEEEEE  XX      XX
--      AA  AA      PP  PP  EE       XX    XX
--     AA    AA     PP  PP  EE        XX  XX
--    AAAAAAAAAA    PPPPP   EEEE       XXXX
--   AA        AA   PP      EE        XX  XX
--  AA          AA  PP      EE       XX    XX
--  AA          AA  PP      EEEEEE  XX      XX
prompt  Set Credentials...
 
begin
 
  -- Assumes you are running the script connected to SQL*Plus as the Oracle user APEX_040200 or as the owner (parsing schema) of the application.
  wwv_flow_api.set_security_group_id(p_security_group_id=>nvl(wwv_flow_application_install.get_workspace_id,2447900561010759));
 
end;
/

begin wwv_flow.g_import_in_progress := true; end;
/
begin 

select value into wwv_flow_api.g_nls_numeric_chars from nls_session_parameters where parameter='NLS_NUMERIC_CHARACTERS';

end;

/
begin execute immediate 'alter session set nls_numeric_characters=''.,''';

end;

/
begin wwv_flow.g_browser_language := 'es'; end;
/
prompt  Check Compatibility...
 
begin
 
-- This date identifies the minimum version required to import this file.
wwv_flow_api.set_version(p_version_yyyy_mm_dd=>'2012.01.01');
 
end;
/

prompt  Set Application ID...
 
begin
 
   -- SET APPLICATION ID
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,2804);
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
 
end;
/

PROMPT ...Remove page 410
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>410);
 
end;
/

 
--application/pages/page_00410
prompt  ...PAGE 410: Ordenes de Compras Proveedores
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 410
 ,p_user_interface_id => 220650599908639021 + wwv_flow_api.g_id_offset
 ,p_name => 'Ordenes de Compras Proveedores'
 ,p_step_title => 'Ordenes de Compras Proveedores'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Ordenes de Compras Proveedores'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_html_page_header => 
'<style>'||unistr('\000a')||
'#dialog-modal{display:none;}'||unistr('\000a')||
'</style>'||unistr('\000a')||
'<style>'||unistr('\000a')||
'#dialog-video{display:none;}'||unistr('\000a')||
'</style>'
 ,p_javascript_code => 
'function abrir_video (){'||unistr('\000a')||
' $( "#dialog-video" ).html($("#P410_VIDEO_IFRAME").val());'||unistr('\000a')||
' $( "#dialog-video" ).dialog({'||unistr('\000a')||
'   width: 700,'||unistr('\000a')||
'   height: 500,'||unistr('\000a')||
'   modal: true,'||unistr('\000a')||
'   close: function() {'||unistr('\000a')||
'     $( "#dialog-video" ).empty();'||unistr('\000a')||
'   }'||unistr('\000a')||
' });'||unistr('\000a')||
'}'||unistr('\000a')||
'function abrir_video2 (){'||unistr('\000a')||
' $( "#dialog-video2" ).html($("#P410_VIDEO_IFRAME2").val());'||unistr('\000a')||
' $( "#dialog-video2" ).dialog({'||unistr('\000a')||
'   width: 700,'||unistr('\000a')||
'   height: 500,'||unistr('\000a')||
'   modal: true,'||unistr('\000a')||
'  '||
' close: function() {'||unistr('\000a')||
'     $( "#dialog2-video" ).empty();'||unistr('\000a')||
'   }'||unistr('\000a')||
' });'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
''
 ,p_inline_css => 
'      #estados tbody tr.fila {         '||unistr('\000a')||
'        vertical-align: top;'||unistr('\000a')||
'      }    '||unistr('\000a')||
'      #estados tbody tr.fila td,      #estados tbody tr.cabecera th{'||unistr('\000a')||
'        border-bottom: 2px solid black;'||unistr('\000a')||
'        border-top: 2px solid black;'||unistr('\000a')||
'	border-left: 2px solid black;'||unistr('\000a')||
'	border-right: 2px solid black;'||unistr('\000a')||
'        padding: 5px;'||unistr('\000a')||
'        border-collapse: collapse;'||unistr('\000a')||
'      }'||unistr('\000a')||
''
 ,p_step_template => 236627632327903812 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'CTISSERA'
 ,p_last_upd_yyyymmddhh24miss => '20161117132628'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 56477130479149789 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_plug_name=> 'Filtros Pre-Definidos',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 236654936239903826+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 25,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> 11,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 56485508363270311 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 236664835566903831+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select comocm.id comocm_id'||unistr('\000a')||
'     , comocm.id comocm_id_new'||unistr('\000a')||
'     , comprv.id comprv_id'||unistr('\000a')||
'     , comprv.cuit comprv_cuit'||unistr('\000a')||
'     , comprv.nombre comprv_nombre'||unistr('\000a')||
'     , comprv.nombre||'' - CUIT: ''||comprv.cuit comprv_nombre_cuit'||unistr('\000a')||
'     , comped.id comped_id'||unistr('\000a')||
'     , comped.ejercicio comped_ejercicio'||unistr('\000a')||
'     , comped.codigo comped_codigo'||unistr('\000a')||
'     , comped.codigo||''/''||comped.ejercicio comped_codigo_ejercicio'||unistr('\000a')||
'     , compe';

s:=s||'d.expediente comped_expediente'||unistr('\000a')||
'     , comped.fecha_entrega comped_fecha_entrega'||unistr('\000a')||
'     , comeco.id comeco_id'||unistr('\000a')||
'     , comeco.nombre comeco_nombre'||unistr('\000a')||
'     , comcob.id comcob_id'||unistr('\000a')||
'     , comcob.nombre comcob_nombre     '||unistr('\000a')||
'     , comctt.id comctt_id'||unistr('\000a')||
'     , comctt.nombre comctt_nombre'||unistr('\000a')||
'     , comcon.id comcon_id'||unistr('\000a')||
'     , comcon.codigo comcon_codigo'||unistr('\000a')||
'     , comcon.codigo||''/''||comped.ejercicio comcon_codigo_ejercicio';

s:=s||''||unistr('\000a')||
'     , comcon.fecha_publicacion comcon_fecha_publicacion'||unistr('\000a')||
'     , comcon.fecha_inicio_propuesta comcon_fecha_inicio_propuesta'||unistr('\000a')||
'     , comcon.fecha_fin_propuesta comcon_fecha_fin_propuesta'||unistr('\000a')||
'     , gral_pkg.obtn_cfgabr(''COM_CONTRATACIONES_EST.ESTADO'',comcon.comcoe_estado) comcoe_estado_abr'||unistr('\000a')||
'     , comocm.codigo comocm_codigo'||unistr('\000a')||
'     , comocm.codigo||''/''||comped.ejercicio comocm_codigo_ejercicio'||unistr('\000a')||
'     , como';

s:=s||'cm.fecha_generacion comocm_fecha_generacion'||unistr('\000a')||
'     , comocm.monto comocm_monto'||unistr('\000a')||
'     , gral_pkg.obtn_cfgabr(''COM_ORDENES_COMPRAS_EST.ESTADO'',comocm.comoce_estado) comoce_estado_abr'||unistr('\000a')||
'     , decode(comocm.comoce_estado,''RCH'','''',nvl(COM_PKG.OBTN_COMCLF_CLFMOT(COMOCM.ID),''PENDIENTE'')) COMOCM_CLFMOT_IMG'||unistr('\000a')||
'     , decode(comocm.comoce_estado,''RCH'','''',nvl((select gral_pkg.obtn_cfgabr(''COM_CALIFICACIONES_TMO.CAL';

s:=s||'IFICACION'',comclf.calificacion) calificacion_abr'||unistr('\000a')||
'                                                           from  com_calificaciones comclf'||unistr('\000a')||
'                                                           where comclf.id = COMOCM_PKG.COMOCM_OBTN_CLF(p_comocm_id => comocm.id)),''PENDIENTE DE CALIFICAR'')) comocm_clf'||unistr('\000a')||
'     , to_date(decode(comocm.comoce_estado,''RCH'','''',(select to_char(comclf.fecha,''DD/MM/YYY';

s:=s||'Y'') comclf_fecha'||unistr('\000a')||
'                                                           from  com_calificaciones comclf'||unistr('\000a')||
'                                                           where comclf.id = COMOCM_PKG.COMOCM_OBTN_CLF(p_comocm_id => comocm.id))),''DD/MM/YYYY'') comclf_fecha'||unistr('\000a')||
'     , decode(comocm.comoce_estado,''RCH'','''',DECODE((select listagg(comred.origen,chr(10)) within group (order by comred.id) as replic';

s:=s||'a'||unistr('\000a')||
'        from   com_replicas_det comred'||unistr('\000a')||
'             , com_replicas comrep'||unistr('\000a')||
'        where  comrep.comocm_id = comocm.id'||unistr('\000a')||
'           and comred.comrep_id = comrep.id'||unistr('\000a')||
'           and comrep.estado not in (''NUE'',''ANU'')'||unistr('\000a')||
'           and comred.situacion = ''VIG''),'''','''',''<img src="#IMAGE_PREFIX#htmldb/icons/pt_messages.png" title="''||(select listagg(to_char(comred.fecha,''dd/mm/yyyy HH24:MI'')||'' ''||decode(co';

s:=s||'mred.origen,''PRV'',''Proveedor'',''ECO'',''Entidad Contratante'',''ADM'',''Administración'','''')||'' dice: ''||comred.comentario,chr(10)) within group (order by comred.id) as replica'||unistr('\000a')||
'        from   com_replicas_det comred'||unistr('\000a')||
'             , com_replicas comrep'||unistr('\000a')||
'        where  comrep.comocm_id = comocm.id'||unistr('\000a')||
'           and comred.comrep_id = comrep.id'||unistr('\000a')||
'           and comrep.estado not in (''NUE'',''ANU'')'||unistr('\000a')||
'           and comr';

s:=s||'ed.situacion = ''VIG'')||''">'')||comocm_pkg.comocm_replica_est(comocm.id)) comocm_replica_est'||unistr('\000a')||
'     , (select listagg(to_char(comred.fecha,''dd/mm/yyyy HH24:MI'')||'' ''||decode(comred.origen,''PRV'',''Proveedor'',''ECO'',''Entidad Contratante'',''ADM'',''Administración'','''')||'' dice: ''||comred.comentario,chr(10)) within group (order by comred.id) as replica'||unistr('\000a')||
'        from   com_replicas_det comred'||unistr('\000a')||
'             , com_r';

s:=s||'eplicas comrep'||unistr('\000a')||
'        where  comrep.comocm_id = comocm.id'||unistr('\000a')||
'           and comred.comrep_id = comrep.id'||unistr('\000a')||
'           and comrep.estado not in (''NUE'',''ANU'')'||unistr('\000a')||
'           and comred.situacion = ''VIG'') comocm_replicas_tooltip'||unistr('\000a')||
'from com_ordenes_compras comocm'||unistr('\000a')||
'   , com_contrataciones        comcon'||unistr('\000a')||
'   , com_contrataciones_tipos  comctt'||unistr('\000a')||
'   , com_proveedores           comprv'||unistr('\000a')||
'   , com_pedidos               compe';

s:=s||'d'||unistr('\000a')||
'   , com_contratantes          comeco'||unistr('\000a')||
'   , com_catalogo_objetos comcob'||unistr('\000a')||
'where comocm.comcon_id = comcon.id'||unistr('\000a')||
'  and comcon.comctt_id = comctt.id'||unistr('\000a')||
'  and comocm.comprv_id = comprv.id'||unistr('\000a')||
'  and comocm.comped_id = comped.id'||unistr('\000a')||
'  and comocm.comeco_id = comeco.id'||unistr('\000a')||
'  and comped.comcob_id = comcob.id'||unistr('\000a')||
'  and comocm.comoce_estado not in (''NUE'',''PEN'',''ANU'')  '||unistr('\000a')||
'  and trunc(sysdate) > trunc( com_pkg.DIA_HABIL_PROXIMO( como';

s:=s||'cm_pkg.OBTN_COMOCM_FECHA_GENERACION(comocm.comcon_id, comocm.comprv_id) ,to_number(:P1_SEGORG_ID), 5) )'||unistr('\000a')||
'  and comocm.comprv_id = :P410_COMPRV_ID'||unistr('\000a')||
'&P410_WHERE.';

wwv_flow_api.create_page_plug (
  p_id=> 56477514088149814 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_plug_name=> 'Ordenes de Compras Proveedores',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 236655221462903826+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_translate_title=> 'Y',
  p_rest_enabled=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_prn_output_show_link=> 'Y',
  p_prn_content_disposition=> 'ATTACHMENT',
  p_prn_document_header=> 'APEX',
  p_prn_units=> 'MILLIMETERS',
  p_prn_paper_size=> 'A4',
  p_prn_width=> 297,
  p_prn_height=> 210,
  p_prn_orientation=> 'HORIZONTAL',
  p_prn_page_header_font_color=> '#000000',
  p_prn_page_header_font_family=> 'Helvetica',
  p_prn_page_header_font_weight=> 'normal',
  p_prn_page_header_font_size=> '12',
  p_prn_page_footer_font_color=> '#000000',
  p_prn_page_footer_font_family=> 'Helvetica',
  p_prn_page_footer_font_weight=> 'normal',
  p_prn_page_footer_font_size=> '12',
  p_prn_header_bg_color=> '#9bafde',
  p_prn_header_font_color=> '#ffffff',
  p_prn_header_font_family=> 'Helvetica',
  p_prn_header_font_weight=> 'normal',
  p_prn_header_font_size=> '10',
  p_prn_body_bg_color=> '#efefef',
  p_prn_body_font_color=> '#000000',
  p_prn_body_font_family=> 'Helvetica',
  p_prn_body_font_weight=> 'normal',
  p_prn_body_font_size=> '10',
  p_prn_border_width=> .5,
  p_prn_page_header_alignment=> 'CENTER',
  p_prn_page_footer_alignment=> 'CENTER',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'select comocm.id comocm_id'||unistr('\000a')||
'     , comocm.id comocm_id_new'||unistr('\000a')||
'     , comprv.id comprv_id'||unistr('\000a')||
'     , comprv.cuit comprv_cuit'||unistr('\000a')||
'     , comprv.nombre comprv_nombre'||unistr('\000a')||
'     , comprv.nombre||'' - CUIT: ''||comprv.cuit comprv_nombre_cuit'||unistr('\000a')||
'     , comped.id comped_id'||unistr('\000a')||
'     , comped.ejercicio comped_ejercicio'||unistr('\000a')||
'     , comped.codigo comped_codigo'||unistr('\000a')||
'     , comped.codigo||''/''||comped.ejercicio comped_codigo_ejercicio'||unistr('\000a')||
'     , compe';

a1:=a1||'d.expediente comped_expediente'||unistr('\000a')||
'     , comped.fecha_entrega comped_fecha_entrega'||unistr('\000a')||
'     , comeco.id comeco_id'||unistr('\000a')||
'     , comeco.nombre comeco_nombre'||unistr('\000a')||
'     , comcob.id comcob_id'||unistr('\000a')||
'     , comcob.nombre comcob_nombre     '||unistr('\000a')||
'     , comctt.id comctt_id'||unistr('\000a')||
'     , comctt.nombre comctt_nombre'||unistr('\000a')||
'     , comcon.id comcon_id'||unistr('\000a')||
'     , comcon.codigo comcon_codigo'||unistr('\000a')||
'     , comcon.codigo||''/''||comped.ejercicio comcon_codigo_ejercicio';

a1:=a1||''||unistr('\000a')||
'     , comcon.fecha_publicacion comcon_fecha_publicacion'||unistr('\000a')||
'     , comcon.fecha_inicio_propuesta comcon_fecha_inicio_propuesta'||unistr('\000a')||
'     , comcon.fecha_fin_propuesta comcon_fecha_fin_propuesta'||unistr('\000a')||
'     , gral_pkg.obtn_cfgabr(''COM_CONTRATACIONES_EST.ESTADO'',comcon.comcoe_estado) comcoe_estado_abr'||unistr('\000a')||
'     , comocm.codigo comocm_codigo'||unistr('\000a')||
'     , comocm.codigo||''/''||comped.ejercicio comocm_codigo_ejercicio'||unistr('\000a')||
'     , como';

a1:=a1||'cm.fecha_generacion comocm_fecha_generacion'||unistr('\000a')||
'     , comocm.monto comocm_monto'||unistr('\000a')||
'     , gral_pkg.obtn_cfgabr(''COM_ORDENES_COMPRAS_EST.ESTADO'',comocm.comoce_estado) comoce_estado_abr'||unistr('\000a')||
'     , decode(comocm.comoce_estado,''RCH'','''',nvl(COM_PKG.OBTN_COMCLF_CLFMOT(COMOCM.ID),''PENDIENTE'')) COMOCM_CLFMOT_IMG'||unistr('\000a')||
'     , decode(comocm.comoce_estado,''RCH'','''',nvl((select gral_pkg.obtn_cfgabr(''COM_CALIFICACIONES_TMO.CAL';

a1:=a1||'IFICACION'',comclf.calificacion) calificacion_abr'||unistr('\000a')||
'                                                           from  com_calificaciones comclf'||unistr('\000a')||
'                                                           where comclf.id = COMOCM_PKG.COMOCM_OBTN_CLF(p_comocm_id => comocm.id)),''PENDIENTE DE CALIFICAR'')) comocm_clf'||unistr('\000a')||
'     , to_date(decode(comocm.comoce_estado,''RCH'','''',(select to_char(comclf.fecha,''DD/MM/YYY';

a1:=a1||'Y'') comclf_fecha'||unistr('\000a')||
'                                                           from  com_calificaciones comclf'||unistr('\000a')||
'                                                           where comclf.id = COMOCM_PKG.COMOCM_OBTN_CLF(p_comocm_id => comocm.id))),''DD/MM/YYYY'') comclf_fecha'||unistr('\000a')||
'     , decode(comocm.comoce_estado,''RCH'','''',DECODE((select listagg(comred.origen,chr(10)) within group (order by comred.id) as replic';

a1:=a1||'a'||unistr('\000a')||
'        from   com_replicas_det comred'||unistr('\000a')||
'             , com_replicas comrep'||unistr('\000a')||
'        where  comrep.comocm_id = comocm.id'||unistr('\000a')||
'           and comred.comrep_id = comrep.id'||unistr('\000a')||
'           and comrep.estado not in (''NUE'',''ANU'')'||unistr('\000a')||
'           and comred.situacion = ''VIG''),'''','''',''<img src="#IMAGE_PREFIX#htmldb/icons/pt_messages.png" title="''||(select listagg(to_char(comred.fecha,''dd/mm/yyyy HH24:MI'')||'' ''||decode(co';

a1:=a1||'mred.origen,''PRV'',''Proveedor'',''ECO'',''Entidad Contratante'',''ADM'',''Administración'','''')||'' dice: ''||comred.comentario,chr(10)) within group (order by comred.id) as replica'||unistr('\000a')||
'        from   com_replicas_det comred'||unistr('\000a')||
'             , com_replicas comrep'||unistr('\000a')||
'        where  comrep.comocm_id = comocm.id'||unistr('\000a')||
'           and comred.comrep_id = comrep.id'||unistr('\000a')||
'           and comrep.estado not in (''NUE'',''ANU'')'||unistr('\000a')||
'           and comr';

a1:=a1||'ed.situacion = ''VIG'')||''">'')||comocm_pkg.comocm_replica_est(comocm.id)) comocm_replica_est'||unistr('\000a')||
'     , (select listagg(to_char(comred.fecha,''dd/mm/yyyy HH24:MI'')||'' ''||decode(comred.origen,''PRV'',''Proveedor'',''ECO'',''Entidad Contratante'',''ADM'',''Administración'','''')||'' dice: ''||comred.comentario,chr(10)) within group (order by comred.id) as replica'||unistr('\000a')||
'        from   com_replicas_det comred'||unistr('\000a')||
'             , com_r';

a1:=a1||'eplicas comrep'||unistr('\000a')||
'        where  comrep.comocm_id = comocm.id'||unistr('\000a')||
'           and comred.comrep_id = comrep.id'||unistr('\000a')||
'           and comrep.estado not in (''NUE'',''ANU'')'||unistr('\000a')||
'           and comred.situacion = ''VIG'') comocm_replicas_tooltip'||unistr('\000a')||
'from com_ordenes_compras comocm'||unistr('\000a')||
'   , com_contrataciones        comcon'||unistr('\000a')||
'   , com_contrataciones_tipos  comctt'||unistr('\000a')||
'   , com_proveedores           comprv'||unistr('\000a')||
'   , com_pedidos               compe';

a1:=a1||'d'||unistr('\000a')||
'   , com_contratantes          comeco'||unistr('\000a')||
'   , com_catalogo_objetos comcob'||unistr('\000a')||
'where comocm.comcon_id = comcon.id'||unistr('\000a')||
'  and comcon.comctt_id = comctt.id'||unistr('\000a')||
'  and comocm.comprv_id = comprv.id'||unistr('\000a')||
'  and comocm.comped_id = comped.id'||unistr('\000a')||
'  and comocm.comeco_id = comeco.id'||unistr('\000a')||
'  and comped.comcob_id = comcob.id'||unistr('\000a')||
'  and comocm.comoce_estado not in (''NUE'',''PEN'',''ANU'')  '||unistr('\000a')||
'  and trunc(sysdate) > trunc( com_pkg.DIA_HABIL_PROXIMO( como';

a1:=a1||'cm_pkg.OBTN_COMOCM_FECHA_GENERACION(comocm.comcon_id, comocm.comprv_id) ,to_number(:P1_SEGORG_ID), 5) )'||unistr('\000a')||
'  and comocm.comprv_id = :P410_COMPRV_ID'||unistr('\000a')||
'&P410_WHERE.';

wwv_flow_api.create_worksheet(
  p_id=> 56477724494149820+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_region_id=> 56477514088149814+wwv_flow_api.g_id_offset,
  p_name=> 'Procesos de Compras Proveedores',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '1000000',
  p_max_row_count_message=> 'El recuento máximo de filas de este informe es #MAX_ROW_COUNT# filas. Aplique un filtro para reducir el número de registros de la consulta.',
  p_no_data_found_message=> 'No se ha encontrado ningún dato.',
  p_max_rows_per_page=>'',
  p_search_button_label=>'',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'',
  p_sql_query => a1,
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'Y',
  p_allow_save_rpt_public=>'N',
  p_allow_report_categories=>'N',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'N',
  p_show_search_bar=>'Y',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'N',
  p_show_select_columns=>'Y',
  p_show_rows_per_page=>'Y',
  p_show_filter=>'Y',
  p_show_sort=>'Y',
  p_show_control_break=>'Y',
  p_show_highlight=>'Y',
  p_show_computation=>'Y',
  p_show_aggregate=>'Y',
  p_show_chart=>'Y',
  p_show_group_by=>'Y',
  p_show_notify=>'N',
  p_show_calendar=>'N',
  p_show_flashback=>'Y',
  p_show_reset=>'Y',
  p_show_download=>'Y',
  p_show_help=>'Y',
  p_download_formats=>'CSV:HTML:EMAIL',
  p_allow_exclude_null_values=>'N',
  p_allow_hide_extra_columns=>'N',
  p_icon_view_enabled_yn=>'N',
  p_icon_view_use_custom=>'N',
  p_icon_view_columns_per_row=>1,
  p_detail_view_enabled_yn=>'N',
  p_owner=>'JPREDA',
  p_internal_uid=> 56477724494149820);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56478318228149862+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPRV_ID',
  p_display_order          =>2,
  p_column_identifier      =>'B',
  p_column_label           =>'Comprv Id',
  p_report_label           =>'Comprv Id',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56478405461149862+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPRV_CUIT',
  p_display_order          =>3,
  p_column_identifier      =>'C',
  p_column_label           =>'Comprv Cuit',
  p_report_label           =>'Comprv Cuit',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56478515528149862+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPRV_NOMBRE',
  p_display_order          =>4,
  p_column_identifier      =>'D',
  p_column_label           =>'Comprv Nombre',
  p_report_label           =>'Comprv Nombre',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56478621142149862+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPRV_NOMBRE_CUIT',
  p_display_order          =>5,
  p_column_identifier      =>'E',
  p_column_label           =>'Proveedor',
  p_report_label           =>'Proveedor',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56478707123149862+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPED_ID',
  p_display_order          =>6,
  p_column_identifier      =>'F',
  p_column_label           =>'Comped Id',
  p_report_label           =>'Comped Id',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56478829281149862+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPED_EJERCICIO',
  p_display_order          =>7,
  p_column_identifier      =>'G',
  p_column_label           =>'Ejercicio',
  p_report_label           =>'Ejercicio',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56478909335149864+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPED_CODIGO',
  p_display_order          =>8,
  p_column_identifier      =>'H',
  p_column_label           =>'Comped Codigo',
  p_report_label           =>'Comped Codigo',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56479019545149864+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPED_CODIGO_EJERCICIO',
  p_display_order          =>9,
  p_column_identifier      =>'I',
  p_column_label           =>'Pedido',
  p_report_label           =>'Pedido',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56479126018149864+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPED_EXPEDIENTE',
  p_display_order          =>10,
  p_column_identifier      =>'J',
  p_column_label           =>'Expediente',
  p_report_label           =>'Expediente',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56479222776149864+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMECO_ID',
  p_display_order          =>11,
  p_column_identifier      =>'K',
  p_column_label           =>'Comeco Id',
  p_report_label           =>'Comeco Id',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56479315895149864+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMECO_NOMBRE',
  p_display_order          =>12,
  p_column_identifier      =>'L',
  p_column_label           =>'Contratante',
  p_report_label           =>'Contratante',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56479416138149864+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMCOB_ID',
  p_display_order          =>13,
  p_column_identifier      =>'M',
  p_column_label           =>'Comcob Id',
  p_report_label           =>'Comcob Id',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56479522277149864+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMCOB_NOMBRE',
  p_display_order          =>14,
  p_column_identifier      =>'N',
  p_column_label           =>'Objeto',
  p_report_label           =>'Objeto',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56479614196149864+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMCTT_ID',
  p_display_order          =>15,
  p_column_identifier      =>'O',
  p_column_label           =>'Comctt Id',
  p_report_label           =>'Comctt Id',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56479714797149864+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMCTT_NOMBRE',
  p_display_order          =>16,
  p_column_identifier      =>'P',
  p_column_label           =>'Tipo',
  p_report_label           =>'Tipo',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56479825590149864+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMCON_ID',
  p_display_order          =>17,
  p_column_identifier      =>'Q',
  p_column_label           =>'Acción',
  p_report_label           =>'Acción',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_column_link            =>'f?p=2102:200:&SESSION.::NO:200:P200_COMCON_ID,G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P200_MUESTRO_MSJ_SN:#COMCON_ID#,&APP_ID.,&APP_PAGE_ID.,SI',
  p_column_linktext        =>'<img src="#IMAGE_PREFIX#htmldb/icons/pt_page.png" title="Detalle del Proceso" alt="Detalle del Proceso">',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56479900776149864+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMCON_CODIGO',
  p_display_order          =>18,
  p_column_identifier      =>'R',
  p_column_label           =>'Comcon Codigo',
  p_report_label           =>'Comcon Codigo',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56480022505149865+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMCON_CODIGO_EJERCICIO',
  p_display_order          =>19,
  p_column_identifier      =>'S',
  p_column_label           =>'Proceso',
  p_report_label           =>'Proceso',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56480119478149865+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMCON_FECHA_PUBLICACION',
  p_display_order          =>20,
  p_column_identifier      =>'T',
  p_column_label           =>'Publicado',
  p_report_label           =>'Publicado',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56480225136149865+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMCON_FECHA_INICIO_PROPUESTA',
  p_display_order          =>21,
  p_column_identifier      =>'U',
  p_column_label           =>'Inicio',
  p_report_label           =>'Inicio',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56480300468149865+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMCON_FECHA_FIN_PROPUESTA',
  p_display_order          =>22,
  p_column_identifier      =>'V',
  p_column_label           =>'Fin',
  p_report_label           =>'Fin',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56480521065149865+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMCOE_ESTADO_ABR',
  p_display_order          =>24,
  p_column_identifier      =>'X',
  p_column_label           =>'EstadoAdm',
  p_report_label           =>'EstadoAdm',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56484720236253098+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMOCM_ID',
  p_display_order          =>31,
  p_column_identifier      =>'AE',
  p_column_label           =>'Acción',
  p_report_label           =>'Acción',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_column_link            =>'f?p=ADMCOM:891:&SESSION.::NO:891:P891_ID,P891_APP_ANTERIOR,P891_PAG_ANTERIOR:#COMOCM_ID#,&APP_ID.,&APP_PAGE_ID.',
  p_column_linktext        =>'<img src="#IMAGE_PREFIX#htmldb/icons/pt_page.png" title="Detalle de la Orden" alt="Detalle de la Orden">',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'WITHOUT_MODIFICATION',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56484830190253100+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMOCM_CODIGO',
  p_display_order          =>32,
  p_column_identifier      =>'AF',
  p_column_label           =>'Comocm Codigo',
  p_report_label           =>'Comocm Codigo',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56484903142253100+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMOCM_FECHA_GENERACION',
  p_display_order          =>33,
  p_column_identifier      =>'AG',
  p_column_label           =>'Fecha',
  p_report_label           =>'Fecha',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_format_mask            =>'dd/mm/yyyy',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56485000525253100+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMOCM_MONTO',
  p_display_order          =>34,
  p_column_identifier      =>'AH',
  p_column_label           =>'Importe',
  p_report_label           =>'Importe',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_format_mask            =>'FML999G999G999G999G990D00',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56485125443253100+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMOCE_ESTADO_ABR',
  p_display_order          =>35,
  p_column_identifier      =>'AI',
  p_column_label           =>'Estado',
  p_report_label           =>'Estado',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56489430957324126+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMOCM_CODIGO_EJERCICIO',
  p_display_order          =>36,
  p_column_identifier      =>'AJ',
  p_column_label           =>'Orden',
  p_report_label           =>'Orden',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56500607437118176+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMOCM_CLFMOT_IMG',
  p_display_order          =>37,
  p_column_identifier      =>'AK',
  p_column_label           =>'Calificación',
  p_report_label           =>'Calificación',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'WITHOUT_MODIFICATION',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56506029056837404+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMOCM_CLF',
  p_display_order          =>38,
  p_column_identifier      =>'AL',
  p_column_label           =>'Calificación',
  p_report_label           =>'Calificación',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56557602605899923+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPED_FECHA_ENTREGA',
  p_display_order          =>40,
  p_column_identifier      =>'AN',
  p_column_label           =>'Fecha Entrega',
  p_report_label           =>'Fecha Entrega',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_format_mask            =>'dd/mm/yyyy',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 61362921142166939+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMCLF_FECHA',
  p_display_order          =>41,
  p_column_identifier      =>'AO',
  p_column_label           =>'Fecha Calificación',
  p_report_label           =>'Fecha Calificación',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_format_mask            =>'dd/mm/yyyy',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 61363025740166943+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMOCM_REPLICA_EST',
  p_display_order          =>42,
  p_column_identifier      =>'AP',
  p_column_label           =>'Situacion Calificación',
  p_report_label           =>'Situacion Calificación',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_column_linktext        =>'<img src="#IMAGE_PREFIX#htmldb/icons/pt_messages.png" title="#COMOCM_REPLICAS_TOOLTIP#" alt="#COMOCM_REPLICAS_TOOLTIP#">#COMOCM_REPLICA_EST#',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'WITHOUT_MODIFICATION',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 61367225436453564+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMOCM_REPLICAS_TOOLTIP',
  p_display_order          =>43,
  p_column_identifier      =>'AQ',
  p_column_label           =>'Calificación Tooltip',
  p_report_label           =>'Calificación Tooltip',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 69669323795158982+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMOCM_ID_NEW',
  p_display_order          =>44,
  p_column_identifier      =>'AR',
  p_column_label           =>'Acción',
  p_report_label           =>'Acción',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_column_link            =>'f?p=ADMCOM:891:&SESSION.::&DEBUG.:891:P891_ID,P891_APP_ANTERIOR,P891_PAG_ANTERIOR:#COMOCM_ID#,&APP_ID.,&APP_PAGE_ID.',
  p_column_linktext        =>'<img src="#IMAGE_PREFIX#htmldb/icons/pt_page.png" title="Detalle de la Orden" alt="Detalle de la Orden">',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'COMPED_EXPEDIENTE:COMCON_CODIGO_EJERCICIO:COMCON_ID:COMCTT_NOMBRE:COMCOB_NOMBRE:COMOCM_CODIGO_EJERCICIO:COMOCM_ID:COMOCE_ESTADO_ABR:COMOCM_FECHA_GENERACION:COMOCM_MONTO:COMPED_FECHA_ENTREGA:COMOCM_CLFMOT_IMG:COMCLF_FECHA:COMOCM_REPLICA_EST:COMOCM_REPLICAS_TOOLTIP:COMOCM_ID_NEW';

wwv_flow_api.create_worksheet_rpt(
  p_id => 56480803038149875+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'564809',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_sort_column_1           =>'COMOCM_FECHA_GENERACION',
  p_sort_direction_1        =>'DESC',
  p_sort_column_2           =>'COMPED_FECHA_ENTREGA',
  p_sort_direction_2        =>'DESC',
  p_sort_column_3           =>'0',
  p_sort_direction_3        =>'ASC',
  p_sort_column_4           =>'0',
  p_sort_direction_4        =>'ASC',
  p_sort_column_5           =>'0',
  p_sort_direction_5        =>'ASC',
  p_sort_column_6           =>'0',
  p_sort_direction_6        =>'ASC',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 72078923769582859+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_report_id => 56480803038149875+wwv_flow_api.g_id_offset,
  p_name                    =>'OrdenesPendientesdeEntrega',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'COMOCE_ESTADO_ABR',
  p_operator                =>'=',
  p_expr                    =>'APROBADA',
  p_condition_sql           =>' (case when ("COMOCE_ESTADO_ABR" = #APXWS_EXPR#) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# = ''APROBADA''  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_row_bg_color            =>'#FFDD44',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 72079006159582859+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_worksheet_id => 56477724494149820+wwv_flow_api.g_id_offset,
  p_report_id => 56480803038149875+wwv_flow_api.g_id_offset,
  p_name                    =>'OrdenesConCalificaciónParaRevisar',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'COMOCM_REPLICA_EST',
  p_operator                =>'=',
  p_expr                    =>'PARA REVISAR POR EL PROVEEDOR',
  p_condition_sql           =>' (case when ("COMOCM_REPLICA_EST" = #APXWS_EXPR#) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# = ''PARA REVISAR POR EL PROVEEDOR''  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>20,
  p_row_bg_color            =>'#FFFF99',
  p_column_format           =>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 56481422627149895 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_plug_name=> 'TopBar',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236656219840903827+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_grid_column_span => 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 56481823078149912 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_plug_name=> 'Buscar',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236656219840903827+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_grid_column_span => 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 56483622087149954 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_plug_name=> 'Ruta de Navegación',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 236652436221903825+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(569946071879134348 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 236667932049903833+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 69359419584219821 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_plug_name=> 'Acerca de',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236656844137903827+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 15,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> 11,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 69354013641763893 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 236663920507903831+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_header=> 'Para más detalle sobre esta pantalla acceda al video tutorial<br><br>',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'htp.print('''');';

wwv_flow_api.create_page_plug (
  p_id=> 69359818330228918 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_plug_name=> 'Video tutorial',
  p_region_name=>'dialog-video',
  p_region_attributes=> 'title="Video tutorial - Órdenes de provisión"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236656219840903827+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_list_template_id=> 236663920507903831+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'htp.print('''');';

wwv_flow_api.create_page_plug (
  p_id=> 70497317597622648 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_plug_name=> 'Video tutorial2',
  p_region_name=>'dialog-video2',
  p_region_attributes=> 'title="Video tutorial - Entregas de bienes y servicios"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236656219840903827+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 40,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_list_template_id=> 236663920507903831+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 56481614017149897 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 410,
  p_button_sequence=> 100,
  p_button_plug_id => 56481422627149895+wwv_flow_api.g_id_offset,
  p_button_name    => 'P410_RETORNAR',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(236667336255903833+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Retornar',
  p_button_position=> 'TEMPLATE_DEFAULT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&P410_APP_ANTERIOR.:&P410_APP_ANTERIOR_PAG.:&SESSION.',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'<table cellpadding="5" id="estados" >'||unistr('\000a')||
'  <tr class="cabecera">'||unistr('\000a')||
'    <th>Estado</th>'||unistr('\000a')||
'    <th>Explicación</th>      '||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr class="fila">'||unistr('\000a')||
'    <td>APROBADA</td>'||unistr('\000a')||
'    <td>Órdenes adjudicadas sin calificar.'||unistr('\000a')||
'    </td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr class="fila">'||unistr('\000a')||
'    <td>NO CONCRETADA</td>'||unistr('\000a')||
'    <td>Órdenes calificadas por la Entidad Contratante como NO CONCRETADA.'||unistr('\000a')||
'    </td>'||unistr('\000a')||
'  </tr>    '||unistr('\000a')||
'  <tr class="fila">'||unistr('\000a')||
'    <td>CONC';

h:=h||'RETADA</td>'||unistr('\000a')||
'    <td>Órdenes calificadas por la Entidad Contratante como CONCRETADA.</td>'||unistr('\000a')||
'  </tr>    '||unistr('\000a')||
'</table>';

wwv_flow_api.create_page_item(
  p_id=>56482015344149912 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 410,
  p_name=>'P410_COMOCE_ESTADO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 56481823078149912+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Estado :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select rv_abbreviation d, rv_low_value r'||unistr('\000a')||
'from cg_ref_codes'||unistr('\000a')||
'where rv_domain = ''COM_ORDENES_COMPRAS_EST.ESTADO'''||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'- TODOS -',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 4,
  p_rowspan=> null,
  p_grid_column=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_display_when=>'P410_FILTRO_PREDEFINIDO_SEL',
  p_display_when_type=>'ITEM_IS_NULL',
  p_field_template=> 236666243463903832+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'SUBMIT',
  p_attribute_03 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>56482400552149929 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 410,
  p_name=>'P410_FILTRO_PREDEFINIDO_SEL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 15,
  p_item_plug_id => 56481823078149912+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Filtro Predefinido :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'STATIC2:Ordenes Aprobadas;OPDE,Órdenes con Entregas Pendientes;OCEP,Órdenes con Entregas para Autorizar;OEPA,Órdenes con Entregas Vencidas;OCEV,Calificaciones para Revisar;OCPR',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_display_when=>'P410_FILTRO_PREDEFINIDO_SEL',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_read_only_when_type=>'ALWAYS',
  p_field_template=> 236666243463903832+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>56482607406149931 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 410,
  p_name=>'P410_COMPRV_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 56481823078149912+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Proveedor :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_POPUP_LOV',
  p_lov=> 'select nombre||'' - CUIT: ''||to_char(cuit) d, id r'||unistr('\000a')||
'from com_proveedores'||unistr('\000a')||
'where segorg_id = :p1_segorg_id',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'- TODOS -',
  p_lov_null_value=> '',
  p_cSize=> 80,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when=>'P410_COMPRV_SELECCIONAR_SN',
  p_read_only_when2=>'NO',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_field_template=> 236666243463903832+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NOT_ENTERABLE',
  p_attribute_02 => 'FIRST_ROWSET',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>56482815494149931 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 410,
  p_name=>'P410_WHERE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_item_plug_id => 56481823078149912+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>56483022927149931 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 410,
  p_name=>'P410_COMPRV_SELECCIONAR_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 2,
  p_item_plug_id => 56481823078149912+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'NO',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 4000,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Calificación de una Órden, realizada por la Entidad Contratante.';

wwv_flow_api.create_page_item(
  p_id=>56506225378854332 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 410,
  p_name=>'P410_COMCLF_CALIFICACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 56481823078149912+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Calificación :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select rv_abbreviation d, rv_low_value r'||unistr('\000a')||
'from cg_ref_codes'||unistr('\000a')||
'where rv_domain = ''COM_CALIFICACIONES.CALIFICACION'''||unistr('\000a')||
'union all'||unistr('\000a')||
'select ''PENDIENTE'' d,''PENDIENTE'' r'||unistr('\000a')||
'from dual'||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'- TODAS -',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 3,
  p_rowspan=> null,
  p_grid_column=> 5,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_display_when=>'P410_FILTRO_PREDEFINIDO_SEL',
  p_display_when_type=>'ITEM_IS_NULL',
  p_field_template=> 236666243463903832+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'SUBMIT',
  p_attribute_03 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'<table cellpadding="5" id="estados" >'||unistr('\000a')||
'  <tr class="cabecera">'||unistr('\000a')||
'    <th>Estado</th>'||unistr('\000a')||
'    <th>Explicación</th>      '||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr class="fila">'||unistr('\000a')||
'    <td>PENDIENTE</td>'||unistr('\000a')||
'    <td>Órdenes que aún no han sido calificadas.'||unistr('\000a')||
'    </td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr class="fila">'||unistr('\000a')||
'    <td>PARA REVISAR POR EL PROVEEDOR</td>'||unistr('\000a')||
'    <td>Órdenes cuya calificación ha recibido un descargo para ser contestado por el Proveedor.'||unistr('\000a')||
'    </td>'||unistr('\000a')||
'';

h:=h||'  </tr>    '||unistr('\000a')||
'  <tr class="fila">'||unistr('\000a')||
'    <td>PARA REVISAR POR LA ENTIDAD CONTRATANTE</td>'||unistr('\000a')||
'    <td>Órdenes cuya calificación ha recibido un descargo para ser contestado por la Entidad Contratante.</td>'||unistr('\000a')||
'  </tr>    '||unistr('\000a')||
'  <tr class="fila">'||unistr('\000a')||
'    <td>PARA REVISAR POR LA ADMINISTRACION</td>'||unistr('\000a')||
'    <td>Órdenes cuya calificación ha recibido un descargo para ser contestado por la Administración.</td>'||unistr('\000a')||
'  </tr>     '||unistr('\000a')||
'  <tr';

h:=h||' class="fila">'||unistr('\000a')||
'    <td>FINALIZADA</td>'||unistr('\000a')||
'    <td>Órdenes cuya calificación no ha recibido ningún descargo.</td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr class="fila">'||unistr('\000a')||
'    <td>FINALIZADA CON DESCARGO RESUELTO</td>'||unistr('\000a')||
'    <td>Órdenes cuya calificación recibió descargos y fueron resueltos.</td>'||unistr('\000a')||
'  </tr>      '||unistr('\000a')||
'</table>';

wwv_flow_api.create_page_item(
  p_id=>56508612555981857 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 410,
  p_name=>'P410_COMOCM_REPLICA_EST',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 56481823078149912+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Situación Calificación :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'STATIC2:PENDIENTE;PENDIENTE,PARA REVISAR POR EL PROVEEDOR;PARA REVISAR POR EL PROVEEDOR,PARA REVISAR POR LA ENTIDAD CONTRATANTE;PARA REVISAR POR LA ENTIDAD CONTRATANTE,PARA REVISAR POR LA ADMINISTRACION;PARA REVISAR POR LA ADMINISTRACION,FINALIZADA;FINALIZADA,FINALIZADA CON DESCARGO RESUELTO;FINALIZADA CON DESCARGO RESUELTO',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'- TODOS -',
  p_lov_null_value=> '0',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 5,
  p_rowspan=> null,
  p_grid_column=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_display_when=>'P410_FILTRO_PREDEFINIDO_SEL',
  p_display_when_type=>'ITEM_IS_NULL',
  p_field_template=> 236666243463903832+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'SUBMIT',
  p_attribute_03 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Fecha en que se entregan los bienes y/o servicios de la órden.';

wwv_flow_api.create_page_item(
  p_id=>56557818552907732 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 410,
  p_name=>'P410_FECHA_ENTREGA_DESDE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 56481823078149912+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Entrega Desde :',
  p_format_mask=>'DD/MM/YYYY',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DATE_PICKER',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 10,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 3,
  p_rowspan=> null,
  p_grid_column=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_display_when=>'P410_FILTRO_PREDEFINIDO_SEL',
  p_display_when_type=>'ITEM_IS_NULL',
  p_field_template=> 236666243463903832+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_04 => 'button',
  p_attribute_05 => 'N',
  p_attribute_07 => 'NONE',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Fecha en que se entregan los bienes y/o servicios de la órden.';

wwv_flow_api.create_page_item(
  p_id=>56558104534914248 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 410,
  p_name=>'P410_FECHA_ENTREGA_HASTA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 56481823078149912+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Entrega Hasta :',
  p_format_mask=>'DD/MM/YYYY',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DATE_PICKER',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 10,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 3,
  p_rowspan=> null,
  p_grid_column=> 4,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_display_when=>'P410_FILTRO_PREDEFINIDO_SEL',
  p_display_when_type=>'ITEM_IS_NULL',
  p_field_template=> 236666243463903832+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_04 => 'button',
  p_attribute_05 => 'N',
  p_attribute_07 => 'NONE',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>56559524633117628 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 410,
  p_name=>'P410_APP_ANTERIOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 3,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 4000,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>56559722692118521 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 410,
  p_name=>'P410_APP_ANTERIOR_PAG',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 4,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 4000,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>69253910517195385 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 410,
  p_name=>'P410_BUSCAR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 56481823078149912+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Buscar',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(236667336255903833 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> null,
  p_grid_column=> 7,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P410_FILTRO_PREDEFINIDO_SEL',
  p_display_when_type=>'ITEM_IS_NULL',
  p_is_persistent=> 'N',
  p_button_execute_validations=>'Y',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>69360629604257568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 410,
  p_name=>'P410_VIDEO_IFRAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 56481823078149912+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '<iframe width="670" height="430" src="//www.youtube.com/embed/Vz9TATqtsMM" frameborder="0" allowfullscreen id="clearmySound"></iframe>',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'<iframe width="670" height="430" src="//www.youtube.com/embed/Vz9TATqtsMM" frameborder="0" allowfullscreen id="clearmySound"></iframe>',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>70497203606620895 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 410,
  p_name=>'P410_VIDEO_IFRAME2',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 90,
  p_item_plug_id => 56481823078149912+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '<iframe width="670" height="430" src="//www.youtube.com/embed/hPOG2ybWjiU" frameborder="0" allowfullscreen id="clearmySound"></iframe>',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'<iframe width="670" height="430" src="//www.youtube.com/embed/hPOG2ybWjiU" frameborder="0" allowfullscreen id="clearmySound"></iframe>',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'P410_COMOCE_ESTADO,P410_COMCLF_CALIFICACION,P410_COMOCM_REPLICA_EST,P410_FECHA_ENTREGA_DESDE,P410_FECHA_ENTREGA_HASTA';

wwv_flow_api.create_page_process(
  p_id     => 56483902326149968 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 410,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'CLEAR_CACHE_FOR_ITEMS',
  p_process_name=> 'Restablecer',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'RESTABLECER,RESTABLECER_FILTRO_PREDEFINIDO',
  p_process_when_type=>'REQUEST_IN_CONDITION',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'IF :P410_APP_ANTERIOR is null then'||unistr('\000a')||
'  :P410_APP_ANTERIOR := :G_APP_ANTERIOR;'||unistr('\000a')||
'  :P410_APP_ANTERIOR_PAG := :G_APP_ANTERIOR_PAG;'||unistr('\000a')||
'end if;';

wwv_flow_api.create_page_process(
  p_id     => 56560009904125128 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 410,
  p_process_sequence=> 20,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AsignarAppAnterior',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P410_APP_ANTERIOR',
  p_process_when_type=>'ITEM_IS_NULL',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||':P410_WHERE := NULL;'||unistr('\000a')||
'if :P410_FILTRO_PREDEFINIDO_SEL = ''OPDE'' then'||unistr('\000a')||
'  :P410_COMOCE_ESTADO := ''APR'';'||unistr('\000a')||
'elsif :P410_FILTRO_PREDEFINIDO_SEL = ''OCCPR'' then'||unistr('\000a')||
'  :P410_COMOCM_REPLICA_EST := ''PARA REVISAR POR EL PROVEEDOR'';'||unistr('\000a')||
'  :P410_WHERE := :P410_WHERE||'' AND comocm.comoce_estado <>''''APR'''''';'||unistr('\000a')||
'end if;'||unistr('\000a')||
''||unistr('\000a')||
'if :P410_FILTRO_PREDEFINIDO_SEL = ''OCEP'' then'||unistr('\000a')||
'	:P410_WHERE := :P410_WHERE||'' and comocm.comoce_estado = ''''APR''';

p:=p||''' and COMOCM_PKG.COMOCM_ENT_PEN_SN(p_comocm_id => comocm.id) = ''''SI'''''' ;'||unistr('\000a')||
'elsif :P410_FILTRO_PREDEFINIDO_SEL = ''OEPA'' then'||unistr('\000a')||
'	:P410_WHERE := :P410_WHERE||'' and comocm.comoce_estado = ''''APR'''' and COMOCM_PKG.COMOCM_ENT_AUT_SN(p_comocm_id => comocm.id) = ''''SI'''''';'||unistr('\000a')||
'elsif :P410_FILTRO_PREDEFINIDO_SEL = ''OCEV'' then'||unistr('\000a')||
'	:P410_WHERE := :P410_WHERE||'' and comocm.comoce_estado = ''''APR'''' and COMOCM_PKG.COMOCM_ENT_V';

p:=p||'ENC_SN(p_comocm_id => comocm.id) = ''''SI'''''';'||unistr('\000a')||
'end if;	'||unistr('\000a')||
''||unistr('\000a')||
'--if nvl(:P1_COMPRV_ID,''0'') <> ''0'' then'||unistr('\000a')||
'--  :P410_WHERE := :P410_WHERE||'' AND comprv.id = ''||:P1_COMPRV_ID;'||unistr('\000a')||
'--end if;'||unistr('\000a')||
''||unistr('\000a')||
'if nvl(:P410_COMOCE_ESTADO,''0'') <> ''0'' then'||unistr('\000a')||
'  :P410_WHERE := :P410_WHERE||'' AND comocm.comoce_estado = ''''''||:P410_COMOCE_ESTADO||'''''''';'||unistr('\000a')||
'end if;  '||unistr('\000a')||
''||unistr('\000a')||
'if nvl(:P410_COMOCM_REPLICA_EST,''0'') <> ''0'' then'||unistr('\000a')||
'  :P410_WHERE := :P410_WHERE||'' ';

p:=p||'AND decode(comocm.comoce_estado,''''RCH'''','''''''',comocm_pkg.comocm_replica_est(p_comocm_id => comocm.id)) = ''''''||:P410_COMOCM_REPLICA_EST||'''''''';'||unistr('\000a')||
'end if;  '||unistr('\000a')||
''||unistr('\000a')||
'if nvl(:P410_COMCLF_CALIFICACION,''X'') <> ''X'' then'||unistr('\000a')||
'   IF :P410_COMCLF_CALIFICACION <> ''PENDIENTE'' then'||unistr('\000a')||
'    :P410_WHERE := :P410_WHERE||'' AND exists (select 1 from com_calificaciones comclf where comclf.comocm_id = comocm.id and comclf.situacion = ''''';

p:=p||'VAL'''' and comclf.calificacion = ''''''||:P410_COMCLF_CALIFICACION||'''''')'';'||unistr('\000a')||
'   else'||unistr('\000a')||
'    :P410_WHERE := :P410_WHERE||'' AND not exists (select 1 from com_calificaciones comclf where comclf.comocm_id = comocm.id and comclf.situacion = ''''VAL'''')'';'||unistr('\000a')||
'   end if;'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'if :P410_FECHA_ENTREGA_DESDE IS NOT NULL then'||unistr('\000a')||
'  :P410_WHERE := :P410_WHERE||'' AND comped.fecha_entrega >= to_date(''''''||:P410_FECHA_ENTREGA_D';

p:=p||'ESDE||'''''',''''DD/MM/YYYY'''')'';'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'if :P410_FECHA_ENTREGA_HASTA IS NOT NULL THEN'||unistr('\000a')||
'  :P410_WHERE := :P410_WHERE||'' AND comped.fecha_entrega <= to_date(''''''||:P410_FECHA_ENTREGA_HASTA||'''''',''''DD/MM/YYYY'''')'';'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--  '||unistr('\000a')||
':P410_WHERE := :P410_WHERE||'' ORDER BY TO_NUMBER(decode(comocm.comoce_estado,''''APR'''',''''1'''',decode(COM_PKG.COMREP_REPLICAR_SN(p_comocm_id => comocm.id,p_origen => ''''PRV''''),''''SI'''',''''';

p:=p||'2'''',''''3''''))) asc, comocm.fecha_generacion desc'';';

wwv_flow_api.create_page_process(
  p_id     => 56484102226149984 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 410,
  p_process_sequence=> 30,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AsignarWhere',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 410
--
 
begin
 
null;
end;
null;
 
end;
/

commit;
begin
execute immediate 'begin sys.dbms_session.set_nls( param => ''NLS_NUMERIC_CHARACTERS'', value => '''''''' || replace(wwv_flow_api.g_nls_numeric_chars,'''''''','''''''''''') || ''''''''); end;';
end;
/
set verify on
set feedback on
set define on
prompt  ...done
