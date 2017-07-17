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
--   Date and Time:   14:31 Lunes Octubre 24, 2016
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

PROMPT ...Remove page 310
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>310);
 
end;
/

 
--application/pages/page_00310
prompt  ...PAGE 310: Procesos de Compras Proveedores
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 310
 ,p_user_interface_id => 220650599908639021 + wwv_flow_api.g_id_offset
 ,p_name => 'Procesos de Compras Proveedores'
 ,p_step_title => 'Procesos de Compras Proveedores'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Procesos de Compras Proveedores'
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
'/* -------------------- Video Introducción ------------------*/'||unistr('\000a')||
''||unistr('\000a')||
'function abrir_video (){'||unistr('\000a')||
' $( "#dialog-video" ).html($("#P310_VIDEO_IFRAME").val());'||unistr('\000a')||
' $( "#dialog-video" ).dialog({'||unistr('\000a')||
'   width: 700,'||unistr('\000a')||
'   height: 500,'||unistr('\000a')||
'   modal: true,'||unistr('\000a')||
'   close: function() {'||unistr('\000a')||
'     $( "#dialog-video" ).empty();'||unistr('\000a')||
'   }'||unistr('\000a')||
' });'||unistr('\000a')||
'}'||unistr('\000a')||
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
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'CTISSERA'
 ,p_last_upd_yyyymmddhh24miss => '20161021095833'
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
  p_id=> 56383416016606568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
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
s:=s||'select comcoi.id comcoi_id'||unistr('\000a')||
'     , comprv.id comprv_id'||unistr('\000a')||
'     , comprv.cuit comprv_cuit'||unistr('\000a')||
'     , comprv.nombre comprv_nombre'||unistr('\000a')||
'     , comprv.nombre||'' - CUIT: ''||comprv.cuit comprv_nombre_cuit'||unistr('\000a')||
'     , comped.id comped_id'||unistr('\000a')||
'     , comped.ejercicio comped_ejercicio'||unistr('\000a')||
'     , comped.codigo comped_codigo'||unistr('\000a')||
'     , comped.codigo||''/''||comped.ejercicio comped_codigo_ejercicio'||unistr('\000a')||
'     , comped.expediente comped_expediente'||unistr('\000a')||
'';

s:=s||'     , comeco.id comeco_id'||unistr('\000a')||
'     , comeco.nombre comeco_nombre'||unistr('\000a')||
'     , comcob.id comcob_id'||unistr('\000a')||
'     , comcob.nombre comcob_nombre     '||unistr('\000a')||
'     , comctt.id comctt_id'||unistr('\000a')||
'     , comctt.nombre comctt_nombre'||unistr('\000a')||
'     , comcon.id comcon_id'||unistr('\000a')||
'     , comcon.id comcon_id_new'||unistr('\000a')||
'     , comcon.codigo comcon_codigo'||unistr('\000a')||
'     , comcon.codigo||''/''||comped.ejercicio comcon_codigo_ejercicio'||unistr('\000a')||
'     , comcon.fecha_publicacion comcon_fecha_pub';

s:=s||'licacion'||unistr('\000a')||
'     , comcon.fecha_inicio_propuesta comcon_fecha_inicio_propuesta'||unistr('\000a')||
'     , comcon.fecha_fin_propuesta comcon_fecha_fin_propuesta'||unistr('\000a')||
'     , comcon.fecha_fin_aclaracion comcon_fecha_fin_aclaracion'||unistr('\000a')||
'     , comcon.comcoe_id comcoe_id'||unistr('\000a')||
'     , gral_pkg.obtn_cfgabr(''COM_CONTRATACIONES_EST.ESTADO'',comcon.comcoe_estado) comcoe_estado_abr'||unistr('\000a')||
'     , comcon_pkg.comcon_comprv_estado(p_comcon_id => comcon.id, p';

s:=s||'_comprv_id => comprv.id) comcon_comprv_estado'||unistr('\000a')||
'     , to_number(decode(comcon.comcoe_estado,''ABI'',comcon_pkg.comcon_comctz_tiedia(p_comcon_id => comcon.id),'''')) comcon_comctz_dias'||unistr('\000a')||
'     , decode(comcon.comcoe_estado,''NUE'','''',''PEN'','''',comcon_pkg.comcon_comprv_ctzcnt(p_comcon_id => comcon.id, p_comprv_id => comprv.id)) comctz_cnt'||unistr('\000a')||
'     , decode(comcon.comcoe_estado,''NUE'','''',''PEN'','''',''ABI'','''',comcon_pkg';

s:=s||'.comcon_comprv_ocmcnt(p_comcon_id => comcon.id, p_comprv_id => comprv.id)) comocm_cnt'||unistr('\000a')||
'       ,''Detalle del Proceso - ''||LTRIM(RTRIM(''Contratante: ''||comped.CONTRATANTE||'' ''||comped.SOLICITANTE))||''''||'||unistr('\000a')||
'       DECODE(comped.CONTACTO,'''','''','' Contacto :''||comped.CONTACTO||'''')||'||unistr('\000a')||
'       '' Localidad Entrega: ''||(SELECT DECODE(comdom.LOCALIDAD,'''','''',comdom.LOCALIDAD||'', '')||'||unistr('\000a')||
'         DECODE(comdom.DEPARTA';

s:=s||'MENTO,'''','''',comdom.DEPARTAMENTO||'', '')|| comdom.PROVINCIA FROM COM_DOMICILIOS comdom WHERE comdom.ID = comped.COMDOM_ID)||''''||'||unistr('\000a')||
'       '' Domicilio de Entrega:''||(SELECT LTRIM(RTRIM(DECODE(comdom.CALLE,'''','''',comdom.CALLE||'' '')||'||unistr('\000a')||
'        DECODE(comdom.NUMERO_CASA,'''','''',''Nro: ''||comdom.NUMERO_CASA||'' '')||'||unistr('\000a')||
'        DECODE(comdom.PISO,'''','''',''Piso: ''||comdom.PISO||'' '')||'||unistr('\000a')||
'        DECODE(comdom.DPTO,'''','''',''';

s:=s||'Dpto: ''||comdom.DPTO||'' '')||'||unistr('\000a')||
'        DECODE(comdom.OBSERVACION,'''','''',''(''||comdom.OBSERVACION||''). '')))||'||unistr('\000a')||
'        DECODE((select comcoe.MOTIVO '||unistr('\000a')||
'                from   COM_CONTRATACIONES_EST comcoe'||unistr('\000a')||
'                where comcoe.ID = comcon.comcoe_id),'''','''','' Motivo: ''||'||unistr('\000a')||
'                (select comcoe.MOTIVO '||unistr('\000a')||
'                from   COM_CONTRATACIONES_EST comcoe'||unistr('\000a')||
'                where comcoe.ID = comcon';

s:=s||'.comcoe_id))'||unistr('\000a')||
'       FROM COM_DOMICILIOS comdom'||unistr('\000a')||
'       WHERE comdom.ID = comped.COMDOM_ID) hint'||unistr('\000a')||
'      ,decode(comcon_pkg.comcon_comprv_estado(p_comcon_id => comcon.id, p_comprv_id => comprv.id),''ABIERTO'',''<img src="#IMAGE_PREFIX#htmldb/icons/pt_dyn_actions.png">'',''EN ACLARACION'',''<img src="#IMAGE_PREFIX#htmldb/icons/pt_dyn_actions.png">'',''<img src="#IMAGE_PREFIX#htmldb/icons/pt_page.png">'') link'||unistr('\000a')||
'fr';

s:=s||'om com_contrataciones_inv comcoi'||unistr('\000a')||
'    ,com_contrataciones comcon'||unistr('\000a')||
'--    ,com_contrataciones_est comcoe'||unistr('\000a')||
'    ,com_contrataciones_tipos comctt'||unistr('\000a')||
'    ,com_proveedores comprv'||unistr('\000a')||
'    ,com_contrataciones_detalles comcot'||unistr('\000a')||
'    ,com_pedidos comped'||unistr('\000a')||
'    ,com_contratantes comeco'||unistr('\000a')||
'    ,com_catalogo_objetos comcob'||unistr('\000a')||
'where comcon.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'  and comcoi.situacion = ''ACT'''||unistr('\000a')||
'  and comcoi.comcon_id = comcon.id'||unistr('\000a')||
'-- ';

s:=s||' and comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'  and comcon.fecha_publicacion <= sysdate'||unistr('\000a')||
'  and comcon.comctt_id = comctt.id'||unistr('\000a')||
'  and comcoi.comprv_id = comprv.id'||unistr('\000a')||
'  and comcon.id = comcot.comcon_id'||unistr('\000a')||
'  and comcot.comped_id = comped.id'||unistr('\000a')||
'  and comped.comeco_id = comeco.id'||unistr('\000a')||
'  and comped.comcob_id = comcob.id'||unistr('\000a')||
'  and comprv.id = :P310_COMPRV_ID'||unistr('\000a')||
'&P310_WHERE.';

wwv_flow_api.create_page_plug (
  p_id=> 56383730512606575 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_plug_name=> 'Procesos de Compras Proveedores',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 236655221462903826+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_translate_title=> 'Y',
  p_rest_enabled=> 'N',
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
 a1 varchar2(32767) := null;
begin
a1:=a1||'select comcoi.id comcoi_id'||unistr('\000a')||
'     , comprv.id comprv_id'||unistr('\000a')||
'     , comprv.cuit comprv_cuit'||unistr('\000a')||
'     , comprv.nombre comprv_nombre'||unistr('\000a')||
'     , comprv.nombre||'' - CUIT: ''||comprv.cuit comprv_nombre_cuit'||unistr('\000a')||
'     , comped.id comped_id'||unistr('\000a')||
'     , comped.ejercicio comped_ejercicio'||unistr('\000a')||
'     , comped.codigo comped_codigo'||unistr('\000a')||
'     , comped.codigo||''/''||comped.ejercicio comped_codigo_ejercicio'||unistr('\000a')||
'     , comped.expediente comped_expediente'||unistr('\000a')||
'';

a1:=a1||'     , comeco.id comeco_id'||unistr('\000a')||
'     , comeco.nombre comeco_nombre'||unistr('\000a')||
'     , comcob.id comcob_id'||unistr('\000a')||
'     , comcob.nombre comcob_nombre     '||unistr('\000a')||
'     , comctt.id comctt_id'||unistr('\000a')||
'     , comctt.nombre comctt_nombre'||unistr('\000a')||
'     , comcon.id comcon_id'||unistr('\000a')||
'     , comcon.id comcon_id_new'||unistr('\000a')||
'     , comcon.codigo comcon_codigo'||unistr('\000a')||
'     , comcon.codigo||''/''||comped.ejercicio comcon_codigo_ejercicio'||unistr('\000a')||
'     , comcon.fecha_publicacion comcon_fecha_pub';

a1:=a1||'licacion'||unistr('\000a')||
'     , comcon.fecha_inicio_propuesta comcon_fecha_inicio_propuesta'||unistr('\000a')||
'     , comcon.fecha_fin_propuesta comcon_fecha_fin_propuesta'||unistr('\000a')||
'     , comcon.fecha_fin_aclaracion comcon_fecha_fin_aclaracion'||unistr('\000a')||
'     , comcon.comcoe_id comcoe_id'||unistr('\000a')||
'     , gral_pkg.obtn_cfgabr(''COM_CONTRATACIONES_EST.ESTADO'',comcon.comcoe_estado) comcoe_estado_abr'||unistr('\000a')||
'     , comcon_pkg.comcon_comprv_estado(p_comcon_id => comcon.id, p';

a1:=a1||'_comprv_id => comprv.id) comcon_comprv_estado'||unistr('\000a')||
'     , to_number(decode(comcon.comcoe_estado,''ABI'',comcon_pkg.comcon_comctz_tiedia(p_comcon_id => comcon.id),'''')) comcon_comctz_dias'||unistr('\000a')||
'     , decode(comcon.comcoe_estado,''NUE'','''',''PEN'','''',comcon_pkg.comcon_comprv_ctzcnt(p_comcon_id => comcon.id, p_comprv_id => comprv.id)) comctz_cnt'||unistr('\000a')||
'     , decode(comcon.comcoe_estado,''NUE'','''',''PEN'','''',''ABI'','''',comcon_pkg';

a1:=a1||'.comcon_comprv_ocmcnt(p_comcon_id => comcon.id, p_comprv_id => comprv.id)) comocm_cnt'||unistr('\000a')||
'       ,''Detalle del Proceso - ''||LTRIM(RTRIM(''Contratante: ''||comped.CONTRATANTE||'' ''||comped.SOLICITANTE))||''''||'||unistr('\000a')||
'       DECODE(comped.CONTACTO,'''','''','' Contacto :''||comped.CONTACTO||'''')||'||unistr('\000a')||
'       '' Localidad Entrega: ''||(SELECT DECODE(comdom.LOCALIDAD,'''','''',comdom.LOCALIDAD||'', '')||'||unistr('\000a')||
'         DECODE(comdom.DEPARTA';

a1:=a1||'MENTO,'''','''',comdom.DEPARTAMENTO||'', '')|| comdom.PROVINCIA FROM COM_DOMICILIOS comdom WHERE comdom.ID = comped.COMDOM_ID)||''''||'||unistr('\000a')||
'       '' Domicilio de Entrega:''||(SELECT LTRIM(RTRIM(DECODE(comdom.CALLE,'''','''',comdom.CALLE||'' '')||'||unistr('\000a')||
'        DECODE(comdom.NUMERO_CASA,'''','''',''Nro: ''||comdom.NUMERO_CASA||'' '')||'||unistr('\000a')||
'        DECODE(comdom.PISO,'''','''',''Piso: ''||comdom.PISO||'' '')||'||unistr('\000a')||
'        DECODE(comdom.DPTO,'''','''',''';

a1:=a1||'Dpto: ''||comdom.DPTO||'' '')||'||unistr('\000a')||
'        DECODE(comdom.OBSERVACION,'''','''',''(''||comdom.OBSERVACION||''). '')))||'||unistr('\000a')||
'        DECODE((select comcoe.MOTIVO '||unistr('\000a')||
'                from   COM_CONTRATACIONES_EST comcoe'||unistr('\000a')||
'                where comcoe.ID = comcon.comcoe_id),'''','''','' Motivo: ''||'||unistr('\000a')||
'                (select comcoe.MOTIVO '||unistr('\000a')||
'                from   COM_CONTRATACIONES_EST comcoe'||unistr('\000a')||
'                where comcoe.ID = comcon';

a1:=a1||'.comcoe_id))'||unistr('\000a')||
'       FROM COM_DOMICILIOS comdom'||unistr('\000a')||
'       WHERE comdom.ID = comped.COMDOM_ID) hint'||unistr('\000a')||
'      ,decode(comcon_pkg.comcon_comprv_estado(p_comcon_id => comcon.id, p_comprv_id => comprv.id),''ABIERTO'',''<img src="#IMAGE_PREFIX#htmldb/icons/pt_dyn_actions.png">'',''EN ACLARACION'',''<img src="#IMAGE_PREFIX#htmldb/icons/pt_dyn_actions.png">'',''<img src="#IMAGE_PREFIX#htmldb/icons/pt_page.png">'') link'||unistr('\000a')||
'fr';

a1:=a1||'om com_contrataciones_inv comcoi'||unistr('\000a')||
'    ,com_contrataciones comcon'||unistr('\000a')||
'--    ,com_contrataciones_est comcoe'||unistr('\000a')||
'    ,com_contrataciones_tipos comctt'||unistr('\000a')||
'    ,com_proveedores comprv'||unistr('\000a')||
'    ,com_contrataciones_detalles comcot'||unistr('\000a')||
'    ,com_pedidos comped'||unistr('\000a')||
'    ,com_contratantes comeco'||unistr('\000a')||
'    ,com_catalogo_objetos comcob'||unistr('\000a')||
'where comcon.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'  and comcoi.situacion = ''ACT'''||unistr('\000a')||
'  and comcoi.comcon_id = comcon.id'||unistr('\000a')||
'-- ';

a1:=a1||' and comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'  and comcon.fecha_publicacion <= sysdate'||unistr('\000a')||
'  and comcon.comctt_id = comctt.id'||unistr('\000a')||
'  and comcoi.comprv_id = comprv.id'||unistr('\000a')||
'  and comcon.id = comcot.comcon_id'||unistr('\000a')||
'  and comcot.comped_id = comped.id'||unistr('\000a')||
'  and comped.comeco_id = comeco.id'||unistr('\000a')||
'  and comped.comcob_id = comcob.id'||unistr('\000a')||
'  and comprv.id = :P310_COMPRV_ID'||unistr('\000a')||
'&P310_WHERE.';

wwv_flow_api.create_worksheet(
  p_id=> 56383822791606575+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_region_id=> 56383730512606575+wwv_flow_api.g_id_offset,
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
  p_internal_uid=> 56383822791606575);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56384022534606597+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMCOI_ID',
  p_display_order          =>1,
  p_column_identifier      =>'A',
  p_column_label           =>'Comcoi Id',
  p_report_label           =>'Comcoi Id',
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
  p_id => 56384108261606603+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
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
  p_id => 56384226886606603+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
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
  p_id => 56384316821606603+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
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
  p_id => 56384419796606603+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
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
  p_id => 56384520891606603+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
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
  p_id => 56384627299606603+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
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
  p_id => 56384729520606603+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
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
  p_id => 56384821777606603+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
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
  p_id => 56384907000606603+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
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
  p_id => 56385000816606603+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
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
  p_id => 56385113333606603+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
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
  p_id => 56385227351606604+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
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
  p_id => 56385316502606604+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
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
  p_id => 56385422436606604+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
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
  p_id => 56385520459606604+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
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
  p_id => 56385603189606604+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMCON_ID',
  p_display_order          =>17,
  p_column_identifier      =>'Q',
  p_column_label           =>'Acción',
  p_report_label           =>'Acción',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_column_link            =>'f?p=2102:200:&SESSION.::NO:200:P200_COMCON_ID,G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P200_MUESTRO_MSJ_SN:#COMCON_ID#,&APP_ID.,&APP_PAGE_ID.,SI',
  p_column_linktext        =>'#LINK#',
  p_column_link_attr       =>'title="#HINT#" alt="#HINT#"',
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
  p_id => 56385725665606606+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
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
  p_id => 56385816200606606+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
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
  p_id => 56385903393606606+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
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
  p_id => 56386019259606606+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMCON_FECHA_INICIO_PROPUESTA',
  p_display_order          =>21,
  p_column_identifier      =>'U',
  p_column_label           =>'InicioCotización',
  p_report_label           =>'InicioCotización',
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
  p_id => 56386118196606606+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMCON_FECHA_FIN_PROPUESTA',
  p_display_order          =>22,
  p_column_identifier      =>'V',
  p_column_label           =>'CierreCotización',
  p_report_label           =>'CierreCotización',
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
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56386207845606606+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMCOE_ID',
  p_display_order          =>23,
  p_column_identifier      =>'W',
  p_column_label           =>'Comcoe Id',
  p_report_label           =>'Comcoe Id',
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
  p_id => 56386326601606606+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
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
  p_id => 56386400900606606+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMCON_COMPRV_ESTADO',
  p_display_order          =>25,
  p_column_identifier      =>'Y',
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
  p_id => 56386528240606606+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMCON_COMCTZ_DIAS',
  p_display_order          =>26,
  p_column_identifier      =>'Z',
  p_column_label           =>'TiempoCtz.',
  p_report_label           =>'TiempoCtz.',
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
  p_format_mask            =>'SINCE',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 56386630382606606+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMCTZ_CNT',
  p_display_order          =>27,
  p_column_identifier      =>'AA',
  p_column_label           =>'CantidadCtz.',
  p_report_label           =>'CantidadCtz.',
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
  p_id => 56386707478606606+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMOCM_CNT',
  p_display_order          =>28,
  p_column_identifier      =>'AB',
  p_column_label           =>'CantidadAdj.',
  p_report_label           =>'CantidadAdj.',
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
  p_id => 56416909296818222+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'HINT',
  p_display_order          =>29,
  p_column_identifier      =>'AC',
  p_column_label           =>'Hint',
  p_report_label           =>'Hint',
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
  p_id => 56418213140862029+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'LINK',
  p_display_order          =>30,
  p_column_identifier      =>'AD',
  p_column_label           =>'Link',
  p_report_label           =>'Link',
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
  p_id => 56556528103827275+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMCON_FECHA_FIN_ACLARACION',
  p_display_order          =>31,
  p_column_identifier      =>'AE',
  p_column_label           =>'CierreAclaración',
  p_report_label           =>'CierreAclaración',
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
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 69793231124423196+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMCON_ID_NEW',
  p_display_order          =>32,
  p_column_identifier      =>'AF',
  p_column_label           =>'Acción New',
  p_report_label           =>'Acción New',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_column_link            =>'f?p=&APP_ID.:311:&SESSION.::&DEBUG.:311:P311_COMCON_ID,P311_MUESTRO_MSJ_SN,P311_APP_ANTERIOR,P311_PAG_ANTERIOR:#COMCON_ID#,SI,&APP_ID.,&APP_PAGE_ID.',
  p_column_linktext        =>'<img src="#IMAGE_PREFIX#ws/small_page.gif">',
  p_column_link_attr       =>'title="#HINT#" alt="#HINT#"',
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
rc1:=rc1||'COMPED_EXPEDIENTE:COMCON_CODIGO_EJERCICIO:COMCON_ID:COMCTT_NOMBRE:COMCOB_NOMBRE:COMCON_FECHA_FIN_PROPUESTA:COMCON_COMPRV_ESTADO:COMCON_ID_NEW';

wwv_flow_api.create_worksheet_rpt(
  p_id => 56387217573606840+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_type             =>'REPORT',
  p_report_alias            =>'563873',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_sort_column_1           =>'COMCON_FECHA_FIN_PROPUESTA',
  p_sort_direction_1        =>'DESC',
  p_sort_column_2           =>'0',
  p_sort_direction_2        =>'ASC',
  p_sort_column_3           =>'0',
  p_sort_direction_3        =>'ASC',
  p_sort_column_4           =>'0',
  p_sort_direction_4        =>'ASC',
  p_sort_column_5           =>'0',
  p_sort_direction_5        =>'ASC',
  p_sort_column_6           =>'0',
  p_sort_direction_6        =>'ASC',
  p_break_on                =>'0:0:0:0:0',
  p_break_enabled_on        =>'0:0:0:0:0',
  p_flashback_enabled       =>'N',
  p_chart_type              =>'LINE',
  p_chart_label_column      =>'APXWS_CC_001',
  p_chart_label_title       =>'Año/Mes',
  p_chart_value_column      =>'COMPED_EJERCICIO',
  p_chart_aggregate         =>'COUNT',
  p_chart_value_title       =>'Procesos',
  p_chart_sorting           =>'LABEL_ASC',
  p_calendar_display_column =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 72080806847606357+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
  p_report_id => 56387217573606840+wwv_flow_api.g_id_offset,
  p_name                    =>'ProcesosAbiertos',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'COMCON_COMPRV_ESTADO',
  p_operator                =>'=',
  p_expr                    =>'ABIERTO',
  p_condition_sql           =>' (case when ("COMCON_COMPRV_ESTADO" = #APXWS_EXPR#) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# = ''ABIERTO''  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_row_bg_color            =>'#99FF99',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 72080921014606357+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
  p_report_id => 56387217573606840+wwv_flow_api.g_id_offset,
  p_name                    =>'ProcesosEnAclaración',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'COMCON_COMPRV_ESTADO',
  p_operator                =>'=',
  p_expr                    =>'EN ACLARACION',
  p_condition_sql           =>' (case when ("COMCON_COMPRV_ESTADO" = #APXWS_EXPR#) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# = ''EN ACLARACION''  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>20,
  p_row_bg_color            =>'#D4FFD4',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 72081021881606357+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
  p_report_id => 56387217573606840+wwv_flow_api.g_id_offset,
  p_name                    =>'ProcesosEnAnalisis',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'COMCON_COMPRV_ESTADO',
  p_operator                =>'=',
  p_expr                    =>'EN ANALISIS',
  p_condition_sql           =>' (case when ("COMCON_COMPRV_ESTADO" = #APXWS_EXPR#) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# = ''EN ANALISIS''  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>30,
  p_row_bg_color            =>'#FFDD44',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 72081113313606357+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
  p_report_id => 56387217573606840+wwv_flow_api.g_id_offset,
  p_name                    =>'ProcesosAdjudicados',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'COMCON_COMPRV_ESTADO',
  p_operator                =>'in',
  p_expr                    =>'ADJUDICADO,FINALIZADO',
  p_condition_sql           =>' (case when ("COMCON_COMPRV_ESTADO" in (#APXWS_EXPR_VAL1#, #APXWS_EXPR_VAL2#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# #APXWS_OP_NAME# ''ADJUDICADO, FINALIZADO''  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>40,
  p_row_bg_color            =>'#99CCFF',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_computation(
  p_id => 72081215321606357+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
  p_report_id => 56387217573606840+wwv_flow_api.g_id_offset,
  p_db_column_name    =>'APXWS_CC_001',
  p_column_identifier =>'C01',
  p_computation_expr  =>'to_char(U,''YYYY-MM'')',
  p_format_mask       =>'',
  p_column_type       =>'STRING',
  p_column_label      =>'Año-Mes',
  p_report_label      =>'Año-Mes');
end;
/
begin
wwv_flow_api.create_worksheet_group_by(
  p_id => 72081313639606357+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_worksheet_id => 56383822791606575+wwv_flow_api.g_id_offset,
  p_report_id => 56387217573606840+wwv_flow_api.g_id_offset,
  p_group_by_columns =>'COMCON_COMPRV_ESTADO',
  p_function_01 =>'COUNT',
  p_function_column_01 =>'COMPED_EXPEDIENTE',
  p_function_db_column_name_01 =>'APXWS_GBFC_01',
  p_function_label_01 =>'Procesos',
  p_function_format_mask_01 =>'999G999G999G999G990',
  p_function_sum_01 =>'Y',
  p_sort_direction_12 =>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 56388013895615265 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_plug_name=> 'TopBar',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236656219840903827+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
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
  p_id=> 56388319782616943 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_plug_name=> 'Buscar',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236656219840903827+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
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
  p_id=> 56395231651930017 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_plug_name=> 'Filtros Pre-Definidos',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 236656544011903827+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 56394722374930000 + wwv_flow_api.g_id_offset,
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 69354520698775451 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_plug_name=> 'Acerca de',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236656844137903827+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'ABOVE',
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
  p_plug_header=> 'Para más detalle sobre esta pantalla acceda al video tutorial.<br><br>',
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
  p_id=> 69358227970127609 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_plug_name=> 'Video tutorial',
  p_region_name=>'dialog-video',
  p_region_attributes=> 'title="Video tutorial - Procesos de Compras"',
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
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 56388707231632276 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 310,
  p_button_sequence=> 100,
  p_button_plug_id => 56388013895615265+wwv_flow_api.g_id_offset,
  p_button_name    => 'P310_RETORNAR',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(236667336255903833+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Retornar',
  p_button_position=> 'TEMPLATE_DEFAULT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&P310_APP_ANTERIOR.:&P310_APP_ANTERIOR_PAG.:&SESSION.',
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
wwv_flow_api.create_page_item(
  p_id=>56388630644626239 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_COMPRV_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 56388319782616943+wwv_flow_api.g_id_offset,
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
  p_read_only_when=>'P310_COMPRV_SELECCIONAR_SN',
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
  p_id=>56389429554642022 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_WHERE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_item_plug_id => 56388319782616943+wwv_flow_api.g_id_offset,
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
  p_id=>56389915955663506 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_COMPRV_SELECCIONAR_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 2,
  p_item_plug_id => 56388319782616943+wwv_flow_api.g_id_offset,
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
h:=h||'<table cellpadding="5" id="estados" >'||unistr('\000a')||
'  <tr class="cabecera">'||unistr('\000a')||
'    <th>Estado</th>'||unistr('\000a')||
'    <th>Explicación</th>      '||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr class="fila">'||unistr('\000a')||
'    <td>ABIERTO</td>'||unistr('\000a')||
'    <td>Procesos disponibles para cotizar (Periodo de cotización: Fechas que van desde el Inicio y hasta el Fin de la Propuesta)'||unistr('\000a')||
'    </td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr class="fila">'||unistr('\000a')||
'    <td>EN ACLARACION</td>'||unistr('\000a')||
'    <td>Procesos que están en el Período de ';

h:=h||'Aclaración (Fechas que van desde el Fin de la Propuesta y hasta el Fin de la Aclaración), mayormente para Licitaciones.'||unistr('\000a')||
'    </td>'||unistr('\000a')||
'  </tr>    '||unistr('\000a')||
'  <tr class="fila">'||unistr('\000a')||
'    <td>CERRADO</td>'||unistr('\000a')||
'    <td>Los procesos en los que no realizo cotización lo visualizará en el estado CERRADO desde el cierre de la cotización hasta el final del mismo</td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr class="fila">'||unistr('\000a')||
'    <td>EN EVALUACION</td>'||unistr('\000a')||
'    <td>L';

h:=h||'os procesos que están en el periodo de evaluación una vez finalizado el Período de Cotización. (Fechas que van desde el Inicio y hasta el Fin de la Propuesta). Visualizará los procesos si realizó alguna oferta'||unistr('\000a')||
'    </td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr class="fila">'||unistr('\000a')||
'    <td>EVALUADO</td>'||unistr('\000a')||
'    <td>Los procesos en el estado EVALUADO.  Visualizará los procesos si realizó alguna oferta</td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr class="fila">'||unistr('\000a')||
'  ';

h:=h||'  <td>ANALISIS DE OFERTA</td>'||unistr('\000a')||
'    <td>Los procesos en el estado ANALISIS DE OFERTA cuando este analizando la pre adjudicación la UE o la Administración (Compras)</td>'||unistr('\000a')||
'  </tr>    '||unistr('\000a')||
'<tr class="fila">'||unistr('\000a')||
'  	<td>ADJUDICADO C/ORDEN</td>'||unistr('\000a')||
'    <td>Los procesos en los que Ud. realizó alguna cotización y fue adjudicado</td>'||unistr('\000a')||
'  </tr>    '||unistr('\000a')||
'  <tr class="fila">'||unistr('\000a')||
'    <td>NO ADJUDICADO</td>'||unistr('\000a')||
'    <td>Los procesos en los c';

h:=h||'uales Ud. realizó alguna oferta y  no fueron adjudicados aningún oferente que cotizó indicando el motivo correspondiente </td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr class="fila">'||unistr('\000a')||
'    <td>FINALIZADO S/ORDEN</td>'||unistr('\000a')||
'    <td>Los procesos en los cuales Ud. no realizó cotización</td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr class="fila">'||unistr('\000a')||
'    <td>ANULADO</td>'||unistr('\000a')||
'    <td>Los procesos anulados por la Administración indicando el motivo correspondiente</td>'||unistr('\000a')||
'  </t';

h:=h||'r>'||unistr('\000a')||
'  <tr class="fila">'||unistr('\000a')||
'    <td>DESIERTO</td>'||unistr('\000a')||
'    <td>Los procesos en los que no se registró cotización de ningún oferente</td>'||unistr('\000a')||
'  </tr>    '||unistr('\000a')||
'</table>';

wwv_flow_api.create_page_item(
  p_id=>56392110236802836 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_COMCON_COMPRV_ESTADO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 56388319782616943+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Estado :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select rv_abbreviation d, rv_low_value r'||unistr('\000a')||
'from cg_ref_codes'||unistr('\000a')||
'where rv_domain = ''COMCON_COMPRV_ESTADO_DM'''||unistr('\000a')||
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
  p_display_when=>'P310_FILTRO_PREDEFINIDO_SEL',
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
h:=h||'Procesos en los que usted ha presentado una oferta.';

wwv_flow_api.create_page_item(
  p_id=>56392720120843865 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_COMCON_COMPRV_CTZ_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 56388319782616943+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Cotización :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'STATIC2:SI;SI,NO;NO',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'- TODOS -',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 4,
  p_rowspan=> null,
  p_grid_column=> 5,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_display_when=>'P310_FILTRO_PREDEFINIDO_SEL',
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
  p_id=>56396117014951650 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_FILTRO_PREDEFINIDO_SEL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 15,
  p_item_plug_id => 56388319782616943+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Filtro Predefinido :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'STATIC2:Procesos Abiertos No Cotizados;PANC,Procesos Abiertos Cotizados;PAC,Procesos Cotizados En Aclaración;PCEAC,Procesos Cotizados En Análisis;PCEA',
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
  p_display_when=>'P310_FILTRO_PREDEFINIDO_SEL',
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
  p_id=>56552711972515707 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_APP_ANTERIOR',
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
  p_id=>56552909600516848 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_APP_ANTERIOR_PAG',
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
h := null;
h:=h||'Fecha en la que finaliza la propuesta y la posibilidad de cotizar.';

wwv_flow_api.create_page_item(
  p_id=>56553702637596026 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_FECHA_FIN_PROPUESTA_DESDE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 56388319782616943+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fin Cotización Desde:',
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
  p_colspan=> 4,
  p_rowspan=> null,
  p_grid_column=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_display_when=>'P310_FILTRO_PREDEFINIDO_SEL',
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
h:=h||'Fecha en la que finaliza la propuesta y la posibilidad de cotizar.';

wwv_flow_api.create_page_item(
  p_id=>56554305860609762 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_FECHA_FIN_PROPUESTA_HASTA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 56388319782616943+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fin Cotización Hasta:',
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
  p_colspan=> 4,
  p_rowspan=> null,
  p_grid_column=> 5,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_display_when=>'P310_FILTRO_PREDEFINIDO_SEL',
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
h:=h||'Fecha límite para hacer aclaraciones en su oferta.';

wwv_flow_api.create_page_item(
  p_id=>56555630118735218 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_FECHA_FIN_ACLARACION_D',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 56388319782616943+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fin Aclaración Desde:',
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
  p_colspan=> 4,
  p_rowspan=> null,
  p_grid_column=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_display_when=>'P310_FILTRO_PREDEFINIDO_SEL',
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
h:=h||'Fecha límite para hacer aclaraciones en su oferta.';

wwv_flow_api.create_page_item(
  p_id=>56555825589737309 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_FECHA_FIN_ACLARACION_H',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 56388319782616943+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fin Aclaración Hasta:',
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
  p_colspan=> 4,
  p_rowspan=> null,
  p_grid_column=> 5,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_display_when=>'P310_FILTRO_PREDEFINIDO_SEL',
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
  p_id=>69256109702261353 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_BUSCAR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 56388319782616943+wwv_flow_api.g_id_offset,
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
  p_grid_column=> 9,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P310_FILTRO_PREDEFINIDO_SEL',
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
  p_id=>69356424903940614 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_VIDEO_IFRAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 90,
  p_item_plug_id => 56388319782616943+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '<iframe width="670" height="430" src="//www.youtube.com/embed/iMm2HOeXcK8" frameborder="0" allowfullscreen id="clearmySound"></iframe>',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'<iframe width="670" height="430" src="//www.youtube.com/embed/iMm2HOeXcK8" frameborder="0" allowfullscreen id="clearmySound"></iframe>',
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
  p_id=>69903722223654751 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_COMPRV_CUIT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 11,
  p_item_plug_id => 56388319782616943+wwv_flow_api.g_id_offset,
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
  p_id=>69904820627761867 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_COMPRV_ESTADO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 12,
  p_item_plug_id => 56395231651930017+wwv_flow_api.g_id_offset,
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
  p_id=>70018014290948937 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_COMPRV_ESTADO_ABR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 100,
  p_item_plug_id => 56395231651930017+wwv_flow_api.g_id_offset,
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
  p_id=>70018209977950981 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_COMPRV_ESTADO_FECHA_VIG',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 110,
  p_item_plug_id => 56395231651930017+wwv_flow_api.g_id_offset,
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
  p_id=>70018401134955026 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_COMPRV_ESTADO_FECHA_VAL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 120,
  p_item_plug_id => 56395231651930017+wwv_flow_api.g_id_offset,
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
  p_id=>70018716434963132 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_COMPRV_ESTADO_MOTIVO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 130,
  p_item_plug_id => 56395231651930017+wwv_flow_api.g_id_offset,
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
  p_id=>70026816901449214 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_COMPRT_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 140,
  p_item_plug_id => 56395231651930017+wwv_flow_api.g_id_offset,
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

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'declare'||unistr('\000a')||
'  --'||unistr('\000a')||
' cursor cr_comprv IS'||unistr('\000a')||
'  select COMPRV.CUIT'||unistr('\000a')||
'        ,COMPRE_ESTADO ESTADO'||unistr('\000a')||
'        ,COMPRE_ESTADO_ABR ESTADO_ABR'||unistr('\000a')||
'        ,COMPRE_FECHA_VIGENCIA'||unistr('\000a')||
'        ,COMPRE_FECHA_VALIDEZ'||unistr('\000a')||
'        ,COMPRE_DESCRIPCION'||unistr('\000a')||
'        ,COMPRT.CODIGO COMPRT_CODIGO'||unistr('\000a')||
'  from COM_PROVEEDORES_V COMPRV'||unistr('\000a')||
'      ,COM_PROVEEDORES_TIPOS COMPRT'||unistr('\000a')||
'  where COMPRV.COMPRT_ID = COMPRT.ID'||unistr('\000a')||
'    and COMPRV.ID = :P310_COMPRV_ID;'||unistr('\000a')||
' --'||unistr('\000a')||
'  v_c';

p:=p||'omprv cr_comprv%ROWTYPE;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Obtener datos del Proveedor'||unistr('\000a')||
'  open cr_comprv;'||unistr('\000a')||
'  fetch cr_comprv into v_comprv;'||unistr('\000a')||
'  close cr_comprv;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  :P310_COMPRV_ESTADO := v_comprv.ESTADO;'||unistr('\000a')||
'  :P310_COMPRV_ESTADO_ABR := v_comprv.ESTADO_ABR;'||unistr('\000a')||
'  :P310_COMPRV_ESTADO_FECHA_VIG := v_comprv.COMPRE_FECHA_VIGENCIA;'||unistr('\000a')||
'  :P310_COMPRV_ESTADO_FECHA_VAL := v_comprv.COMPRE_FECHA_VALIDEZ;'||unistr('\000a')||
'  :P310_COMPRV_ESTADO_MOTIVO :=';

p:=p||' v_comprv.COMPRE_DESCRIPCION;'||unistr('\000a')||
'  :P310_COMPRT_CODIGO := v_comprv.COMPRT_CODIGO;'||unistr('\000a')||
'  :P310_COMPRV_CUIT := v_comprv.CUIT;'||unistr('\000a')||
'  --'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 69903827179721848 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 310,
  p_process_sequence=> 1,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Obtener Datos Proveedor',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P310_COMPRV_CUIT',
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
p:=p||'P310_COMCON_COMPRV_ESTADO,P310_COMCON_COMPRV_CTZ_SN,P310_FECHA_FIN_PROPUESTA_DESDE,P310_FECHA_FIN_PROPUESTA_HASTA,P310_FECHA_FIN_ACLARACION_D,P310_FECHA_FIN_ACLARACION_H';

wwv_flow_api.create_page_process(
  p_id     => 56397905892010362 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 310,
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
p:=p||'IF :P310_APP_ANTERIOR IS NULL THEN'||unistr('\000a')||
'   :P310_APP_ANTERIOR := :G_APP_ANTERIOR;'||unistr('\000a')||
'   :P310_APP_ANTERIOR_PAG := :G_APP_ANTERIOR_PAG;'||unistr('\000a')||
'END IF;';

wwv_flow_api.create_page_process(
  p_id     => 56553300957526392 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 310,
  p_process_sequence=> 20,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AsignarAppAnterior',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P310_APP_ANTERIOR',
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
p:=p||':P310_WHERE := NULL;'||unistr('\000a')||
'if :P310_FILTRO_PREDEFINIDO_SEL = ''PANC'' then'||unistr('\000a')||
'  :P310_COMCON_COMPRV_CTZ_SN := ''NO'';'||unistr('\000a')||
'  :P310_COMCON_COMPRV_ESTADO := ''ABIERTO'';'||unistr('\000a')||
'elsif :P310_FILTRO_PREDEFINIDO_SEL = ''PAC'' then'||unistr('\000a')||
'  :P310_COMCON_COMPRV_CTZ_SN := ''SI'';'||unistr('\000a')||
'  :P310_COMCON_COMPRV_ESTADO := ''ABIERTO'';'||unistr('\000a')||
'elsif :P310_FILTRO_PREDEFINIDO_SEL = ''PCEAC'' then'||unistr('\000a')||
'  :P310_COMCON_COMPRV_CTZ_SN := ''SI'';'||unistr('\000a')||
'  :P310_COMCON_COMPRV_ESTADO := ''EN';

p:=p||' ACLARACION'';'||unistr('\000a')||
'elsif :P310_FILTRO_PREDEFINIDO_SEL = ''PCEA'' then'||unistr('\000a')||
'  :P310_COMCON_COMPRV_CTZ_SN := ''SI'';'||unistr('\000a')||
'  :P310_COMCON_COMPRV_ESTADO := ''EN ANALISIS'';'||unistr('\000a')||
'end if;'||unistr('\000a')||
''||unistr('\000a')||
'if nvl(:P310_COMCON_COMPRV_ESTADO,''0'') <> ''0'' then'||unistr('\000a')||
'  :P310_WHERE := :P310_WHERE||'' AND comcon_pkg.comcon_comprv_estado(p_comcon_id => comcon.id, p_comprv_id => comprv.id) = ''''''||:P310_COMCON_COMPRV_ESTADO||'''''''';'||unistr('\000a')||
'end if;'||unistr('\000a')||
''||unistr('\000a')||
'if nvl(:P310_COMCON_CO';

p:=p||'MPRV_CTZ_SN,''0'') <> ''0'' then'||unistr('\000a')||
'  if :P310_COMCON_COMPRV_CTZ_SN = ''NO'' then'||unistr('\000a')||
'    :P310_WHERE := :P310_WHERE||'' AND decode(comcon.comcoe_estado,''''NUE'''','''''''',''''PEN'''','''''''',comcon_pkg.comcon_comprv_ctzcnt(p_comcon_id => comcon.id, p_comprv_id => comprv.id)) = 0'';'||unistr('\000a')||
'  else'||unistr('\000a')||
'    :P310_WHERE := :P310_WHERE||'' AND decode(comcon.comcoe_estado,''''NUE'''','''''''',''''PEN'''','''''''',comcon_pkg.comcon_comprv_ctzcnt(p_comcon_id =';

p:=p||'> comcon.id, p_comprv_id => comprv.id)) > 0'';'||unistr('\000a')||
'  end if; '||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'if :P310_FECHA_FIN_PROPUESTA_DESDE is not null then'||unistr('\000a')||
'  :P310_WHERE := :P310_WHERE||'' AND comcon.fecha_fin_propuesta >= to_date(''''''||:P310_FECHA_FIN_PROPUESTA_DESDE||'''''',''''DD/MM/YYYY'''')'';'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'if :P310_FECHA_FIN_PROPUESTA_HASTA is not null then'||unistr('\000a')||
'  :P310_WHERE := :P310_WHERE||'' AND comcon.fecha_fin_propuesta <= to_date(''''''||:P31';

p:=p||'0_FECHA_FIN_PROPUESTA_HASTA||'''''',''''DD/MM/YYYY'''')'';'||unistr('\000a')||
'end if;'||unistr('\000a')||
''||unistr('\000a')||
'--'||unistr('\000a')||
'if :P310_FECHA_FIN_ACLARACION_D is not null then'||unistr('\000a')||
'  :P310_WHERE := :P310_WHERE||'' AND comcon.fecha_fin_aclaracion >= to_date(''''''||:P310_FECHA_FIN_ACLARACION_D||'''''',''''DD/MM/YYYY'''')'';'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'if :P310_FECHA_FIN_ACLARACION_H is not null then'||unistr('\000a')||
'  :P310_WHERE := :P310_WHERE||'' AND comcon.fecha_fin_aclaracion <= to_date(''''''||:P310_FECHA_FIN_';

p:=p||'ACLARACION_H||'''''',''''DD/MM/YYYY'''')'';'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
':P310_WHERE := :P310_WHERE||'' ORDER BY TO_NUMBER(decode(comcon_pkg.comcon_comprv_estado(p_comcon_id => comcon.id, p_comprv_id => comprv.id),''''ABIERTO'''',''''1'''',''''EN ACLARACION'''',''''2'''',''''PARA EVALUAR'''',''''3'''',''''EVALUADO'''',''''4'''',''''EN ANALISIS'''',''''5'''',''''ADJUDICADO'''',''''6'''',''''FINALIZADO'''',''''7'''',''''NO ADJUDICADO'''',''''8'''',''''DESIERTO'''',''''9'''',''''CERRADO'''',''''10'''',''''1';

p:=p||'1'''')) asc,to_number(decode(comcon.comcoe_estado,''''ABI'''',comcon_pkg.comcon_comctz_tiedia(p_comcon_id => comcon.id),'''''''')) asc,comcon.fecha_fin_propuesta desc'';';

wwv_flow_api.create_page_process(
  p_id     => 56389510956652243 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 310,
  p_process_sequence=> 30,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AsignarWhereOriginal',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'',
  p_process_when_type=>'NEVER',
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
p:=p||':P310_WHERE := NULL;'||unistr('\000a')||
'if :P310_FILTRO_PREDEFINIDO_SEL = ''PANC'' then'||unistr('\000a')||
'  :P310_COMCON_COMPRV_CTZ_SN := ''NO'';'||unistr('\000a')||
'  :P310_COMCON_COMPRV_ESTADO := ''ABIERTO'';'||unistr('\000a')||
'  :P310_WHERE := :P310_WHERE|| '' and comcon.comcoe_estado = ''''ACT'''' and sysdate >= comcon.fecha_inicio_propuesta and sysdate <= comcon.fecha_fin_propuesta'';'||unistr('\000a')||
'elsif :P310_FILTRO_PREDEFINIDO_SEL = ''PAC'' then'||unistr('\000a')||
'  :P310_COMCON_COMPRV_CTZ_SN := ''SI'';'||unistr('\000a')||
'  :P310_C';

p:=p||'OMCON_COMPRV_ESTADO := ''ABIERTO'';'||unistr('\000a')||
'  :P310_WHERE := :P310_WHERE|| '' and comcon.comcoe_estado = ''''ACT'''' and sysdate >= comcon.fecha_inicio_propuesta and sysdate <= comcon.fecha_fin_propuesta'';'||unistr('\000a')||
'elsif :P310_FILTRO_PREDEFINIDO_SEL = ''PCEAC'' then'||unistr('\000a')||
'  :P310_COMCON_COMPRV_CTZ_SN := ''SI'';'||unistr('\000a')||
'  :P310_COMCON_COMPRV_ESTADO := ''EN ACLARACION'';'||unistr('\000a')||
'elsif :P310_FILTRO_PREDEFINIDO_SEL = ''PCEA'' then'||unistr('\000a')||
'  :P310_COMCON_COMPRV_C';

p:=p||'TZ_SN := ''SI'';'||unistr('\000a')||
'  :P310_COMCON_COMPRV_ESTADO := ''EN ANALISIS'';'||unistr('\000a')||
'  :P310_WHERE := :P310_WHERE|| '' and comcon.comcoe_estado = ''''VRF'''' '';'||unistr('\000a')||
''||unistr('\000a')||
'end if;'||unistr('\000a')||
''||unistr('\000a')||
'--if nvl(:P310_COMCON_COMPRV_ESTADO,''0'') <> ''0'' then'||unistr('\000a')||
'--  :P310_WHERE := :P310_WHERE||'' AND comcon_pkg.comcon_comprv_estado(p_comcon_id => comcon.id, p_comprv_id => comprv.id) = ''''''||:P310_COMCON_COMPRV_ESTADO||'''''''';'||unistr('\000a')||
'--end if;'||unistr('\000a')||
''||unistr('\000a')||
'if nvl(:P310_COMCON_COMPRV_CTZ';

p:=p||'_SN,''0'') <> ''0'' then'||unistr('\000a')||
'  if :P310_COMCON_COMPRV_CTZ_SN = ''NO'' then'||unistr('\000a')||
'    :P310_WHERE := :P310_WHERE||'' AND decode(comcon.comcoe_estado,''''NUE'''','''''''',''''PEN'''','''''''',comcon_pkg.comcon_comprv_ctzcnt(p_comcon_id => comcon.id, p_comprv_id => comprv.id)) = 0'';'||unistr('\000a')||
'  else'||unistr('\000a')||
'    :P310_WHERE := :P310_WHERE||'' AND decode(comcon.comcoe_estado,''''NUE'''','''''''',''''PEN'''','''''''',comcon_pkg.comcon_comprv_ctzcnt(p_comcon_id => comcon';

p:=p||'.id, p_comprv_id => comprv.id)) > 0'';'||unistr('\000a')||
'  end if; '||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'if :P310_FECHA_FIN_PROPUESTA_DESDE is not null then'||unistr('\000a')||
'  :P310_WHERE := :P310_WHERE||'' AND comcon.fecha_fin_propuesta >= to_date(''''''||:P310_FECHA_FIN_PROPUESTA_DESDE||'''''',''''DD/MM/YYYY'''')'';'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'if :P310_FECHA_FIN_PROPUESTA_HASTA is not null then'||unistr('\000a')||
'  :P310_WHERE := :P310_WHERE||'' AND comcon.fecha_fin_propuesta <= to_date(''''''||:P310_FECHA_';

p:=p||'FIN_PROPUESTA_HASTA||'''''',''''DD/MM/YYYY'''')'';'||unistr('\000a')||
'end if;'||unistr('\000a')||
''||unistr('\000a')||
'--'||unistr('\000a')||
'if :P310_FECHA_FIN_ACLARACION_D is not null then'||unistr('\000a')||
'  :P310_WHERE := :P310_WHERE||'' AND comcon.fecha_fin_aclaracion >= to_date(''''''||:P310_FECHA_FIN_ACLARACION_D||'''''',''''DD/MM/YYYY'''')'';'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'if :P310_FECHA_FIN_ACLARACION_H is not null then'||unistr('\000a')||
'  :P310_WHERE := :P310_WHERE||'' AND comcon.fecha_fin_aclaracion <= to_date(''''''||:P310_FECHA_FIN_ACLARACI';

p:=p||'ON_H||'''''',''''DD/MM/YYYY'''')'';'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
':P310_WHERE := :P310_WHERE||'' ORDER BY TO_NUMBER(decode(comcon_pkg.comcon_comprv_estado(p_comcon_id => comcon.id, p_comprv_id => comprv.id),''''ABIERTO'''',''''1'''',''''EN ACLARACION'''',''''2'''',''''PARA EVALUAR'''',''''3'''',''''EVALUADO'''',''''4'''',''''EN ANALISIS'''',''''5'''',''''ADJUDICADO'''',''''6'''',''''FINALIZADO'''',''''7'''',''''NO ADJUDICADO'''',''''8'''',''''DESIERTO'''',''''9'''',''''CERRADO'''',''''10'''',''''11'''')) as';

p:=p||'c,to_number(decode(comcon.comcoe_estado,''''ABI'''',comcon_pkg.comcon_comctz_tiedia(p_comcon_id => comcon.id),'''''''')) asc,comcon.fecha_fin_propuesta desc'';';

wwv_flow_api.create_page_process(
  p_id     => 364774526538543826 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 310,
  p_process_sequence=> 40,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AsignarWhereNuevo',
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
-- ...updatable report columns for page 310
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
