set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end;
/
 
 
--application/set_environment
prompt  APPLICATION 2803 - Compras - Portal para Proveedores
--
-- Application Export:
--   Application:     2803
--   Name:            Compras - Portal para Proveedores
--   Date and Time:   11:39 Miércoles Noviembre 23, 2016
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
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,2803);
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
 
end;
/

PROMPT ...Remove page 1
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>1);
 
end;
/

 
--application/pages/page_00001
prompt  ...PAGE 1: Inicio
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 1
 ,p_user_interface_id => 107929550430827001 + wwv_flow_api.g_id_offset
 ,p_name => 'Inicio'
 ,p_alias => 'HOME'
 ,p_step_title => 'Inicio'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Inicio'
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
'function NewsTicker(pNewsjQueryObject, pNewsList, pSeconds, pFadeSpeed) {'||unistr('\000a')||
'  var lNextNewsEntry = null;'||unistr('\000a')||
'  function showNews() {'||unistr('\000a')||
'    pNewsjQueryObject'||unistr('\000a')||
'      .fadeOut(pFadeSpeed)'||unistr('\000a')||
'      .queue(function(){'||unistr('\000a')||
'               apex.jQuery(this).html(pNewsList[lNextNewsEntry]);'||unistr('\000a')||
'               apex.jQuery(this).dequeue();'||unistr('\000a')||
'             })'||unistr('\000a')||
'      .fadeIn(pFadeSpeed);'||unistr('\000a')||
'    // queue in the next news entry. Start fro'||
'm the beginning if the end is reached'||unistr('\000a')||
'    lNextNewsEntry++;'||unistr('\000a')||
'    if (lNextNewsEntry == pNewsList.length) { lNextNewsEntry=0 };'||unistr('\000a')||
'    setTimeout(showNews, pSeconds*1500);'||unistr('\000a')||
'  };'||unistr('\000a')||
'  // Show the first entry immediately. If there are more entries start the rotator'||unistr('\000a')||
'  if (pNewsList.length > 0) {'||unistr('\000a')||
'    pNewsjQueryObject.html(pNewsList[0]);'||unistr('\000a')||
'    if (pNewsList.length > 1) {'||unistr('\000a')||
'      lNextNewsEntry = 1;'||unistr('\000a')||
'      setTimeou'||
't(showNews, pSeconds*1500);'||unistr('\000a')||
'    }'||unistr('\000a')||
'  }'||unistr('\000a')||
'};'||unistr('\000a')||
''||unistr('\000a')||
'/* -------------------- Noticias Todas -------------------- */'||unistr('\000a')||
'$(function() { '||unistr('\000a')||
' $( "#dialog-modal" ).dialog( "destroy" ); '||unistr('\000a')||
'});'||unistr('\000a')||
''||unistr('\000a')||
'function abrir_news (){'||unistr('\000a')||
' $( "#dialog-modal" ).dialog({'||unistr('\000a')||
'   width:800,'||unistr('\000a')||
'   height: 500,'||unistr('\000a')||
'   modal: true'||unistr('\000a')||
' });'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'/* -------------------- Video Introducción ------------------*/'||unistr('\000a')||
''||unistr('\000a')||
'function abrir_video (){'||unistr('\000a')||
' $( "#dialog-video" ).html($("#P'||
'1_VIDEO_IFRAME").val());'||unistr('\000a')||
' $( "#dialog-video" ).dialog({'||unistr('\000a')||
'   width: 700,'||unistr('\000a')||
'   height: 500,'||unistr('\000a')||
'   modal: true,'||unistr('\000a')||
'   close: function() {'||unistr('\000a')||
'     $( "#dialog-video" ).empty();'||unistr('\000a')||
'   }'||unistr('\000a')||
' });'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
''
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'CTISSERA'
 ,p_last_upd_yyyymmddhh24miss => '20161111095308'
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
  p_id=> 56243818912136972 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Proveedor',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 123935170363091807+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
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
s:=s||'declare'||unistr('\000a')||
' cursor cr_cfgalt is'||unistr('\000a')||
' select QUERY'||unistr('\000a')||
'   from cfg_alertas_tipos cfgalt'||unistr('\000a')||
'  where segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'    and sysdate between nvl(fecha_desde, sysdate) and nvl(fecha_hasta, sysdate)'||unistr('\000a')||
'    and situacion = ''VIG'' '||unistr('\000a')||
'    and CFG_BI_PKG.CFGALT_SEGUSU_AUTH(:P1_SEGUSU_ID, cfgalt.ID) = ''SI'';'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_return clob;'||unistr('\000a')||
'  v_dummy NUMBER := 1; '||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  for v_cfgalt in cr_cfgalt loop'||unistr('\000a')||
'    --'||unistr('\000a')||
'    if v_dummy';

s:=s||' = 1 then'||unistr('\000a')||
'      v_return := v_cfgalt.QUERY;'||unistr('\000a')||
'      v_dummy := 0;'||unistr('\000a')||
'    else '||unistr('\000a')||
'      v_return := v_return ||'' union all ''|| v_cfgalt.QUERY;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    --'||unistr('\000a')||
'  end loop;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  RETURN v_return;'||unistr('\000a')||
'  --'||unistr('\000a')||
'end;'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 62222817859223521 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Alertas',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 123930484949091804+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 130,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_ALERT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'EXISTS',
  p_plug_display_when_condition => 'Select 1'||unistr('\000a')||
'from cfg_alertas_tipos cfgalt'||unistr('\000a')||
'where segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
' and sysdate between nvl(fecha_desde, sysdate) and nvl(fecha_hasta, sysdate)'||unistr('\000a')||
'    and situacion = ''VIG'' '||unistr('\000a')||
'    and CFG_BI_PKG.CFGALT_SEGUSU_AUTH(:P1_SEGUSU_ID, cfgalt.ID) = ''SI'';',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'P1_HABILITADO_SN',
  p_attribute_02 => 'ALERT_EXECUTE_SN',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'22148815502294520';

wwv_flow_api.create_page_plug (
  p_id=> 69078828347581734 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Acerca de',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 123935794660091807+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 69079012894586720 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 123942871030091811+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_header=> '<b>Pantalla principal del Portal de Proveedores</b>.<br> Desde aquí se podrá gestionar toda la información del proveedor conectado. <br>Para más detalle acceda al video Tutorial<br><br>',
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
  p_id=> 71279923469342170 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Panel de Control',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 123935794660091807+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 39,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
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
s:=s||'select ''Procesos Abiertos Cotizados'' label, (select to_char(count(1)) cantidad'||unistr('\000a')||
'from com_contrataciones_inv comcoi'||unistr('\000a')||
'    ,com_contrataciones comcon'||unistr('\000a')||
'--    ,com_contrataciones_est comcoe'||unistr('\000a')||
'    ,com_contrataciones_tipos comctt'||unistr('\000a')||
'    ,com_proveedores comprv'||unistr('\000a')||
'    ,com_contrataciones_detalles comcot'||unistr('\000a')||
'    ,com_pedidos comped'||unistr('\000a')||
'    ,com_contratantes comeco'||unistr('\000a')||
'    ,com_catalogo_objetos comcob'||unistr('\000a')||
'where comcon.segorg_id = :P';

s:=s||'1_SEGORG_ID'||unistr('\000a')||
'  and comcoi.situacion = ''ACT'''||unistr('\000a')||
'  and comcoi.comcon_id = comcon.id'||unistr('\000a')||
'--  and comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'  and comcon.fecha_publicacion <= sysdate'||unistr('\000a')||
'  and comcon.comctt_id = comctt.id'||unistr('\000a')||
'  and comcoi.comprv_id = comprv.id'||unistr('\000a')||
'  and comcon.id = comcot.comcon_id'||unistr('\000a')||
'  and comcot.comped_id = comped.id'||unistr('\000a')||
'  and comped.comeco_id = comeco.id'||unistr('\000a')||
'  and comped.comcob_id = comcob.id'||unistr('\000a')||
'  and comprv.id = :P1_COMPRV_ID'||unistr('\000a')||
' ';

s:=s||' --and comcon_pkg.comcon_comprv_estado(p_comcon_id => comcon.id, p_comprv_id => comprv.id) = ''ABIERTO'''||unistr('\000a')||
'  and sysdate >= comcon.fecha_inicio_propuesta and sysdate <= comcon.fecha_fin_propuesta'||unistr('\000a')||
'  and decode(comcon.comcoe_estado,''NUE'','''',''PEN'','''',comcon_pkg.comcon_comprv_ctzcnt(p_comcon_id => comcon.id, p_comprv_id => comprv.id)) > 0)  value, ''f?p=COMCON:310:&SESSION.::NO:RIR,310:G_APP_ANTERIOR,G_APP';

s:=s||'_ANTERIOR_PAG,P310_COMPRV_ID,P310_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,&P1_COMPRV_ID.,PAC''  url,100 pct'||unistr('\000a')||
'from dual';

wwv_flow_api.create_page_plug (
  p_id=> 71278317881312147 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Procesos Abiertos Cotizados',
  p_region_name=>'',
  p_parent_plug_id=>71279923469342170 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 41,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_grid_column_span => 3,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_COM.ORACLE.APEX.BIG_VALUE_LIST',
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
  p_attribute_01=> 'LABEL',
  p_attribute_02 => 'VALUE',
  p_attribute_03 => 'PCT',
  p_attribute_04 => '&URL.',
  p_attribute_05 => '1',
  p_attribute_06 => 'B',
  p_plug_comment=> 'select ''Procesos Abiertos Cotizados'' label, (select to_char(count(1)) cantidad'||unistr('\000a')||
'from com_contrataciones_inv comcoi'||unistr('\000a')||
'    ,com_contrataciones comcon'||unistr('\000a')||
'    ,com_contrataciones_est comcoe'||unistr('\000a')||
'    ,com_contrataciones_tipos comctt'||unistr('\000a')||
'    ,com_proveedores comprv'||unistr('\000a')||
'    ,com_contrataciones_detalles comcot'||unistr('\000a')||
'    ,com_pedidos comped'||unistr('\000a')||
'    ,com_contratantes comeco'||unistr('\000a')||
'    ,com_catalogo_objetos comcob'||unistr('\000a')||
'where comcon.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'  and comcoi.situacion = ''ACT'''||unistr('\000a')||
'  and comcoi.comcon_id = comcon.id'||unistr('\000a')||
'  and comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'  and comcon.fecha_publicacion <= sysdate'||unistr('\000a')||
'  and comcon.comctt_id = comctt.id'||unistr('\000a')||
'  and comcoi.comprv_id = comprv.id'||unistr('\000a')||
'  and comcon.id = comcot.comcon_id'||unistr('\000a')||
'  and comcot.comped_id = comped.id'||unistr('\000a')||
'  and comped.comeco_id = comeco.id'||unistr('\000a')||
'  and comped.comcob_id = comcob.id'||unistr('\000a')||
'  and comprv.id = :P1_COMPRV_ID'||unistr('\000a')||
'  --and comcon_pkg.comcon_comprv_estado(p_comcon_id => comcon.id, p_comprv_id => comprv.id) = ''ABIERTO'''||unistr('\000a')||
'  and sysdate >= comcon.fecha_inicio_propuesta and sysdate <= comcon.fecha_fin_propuesta'||unistr('\000a')||
'  and decode(comcoe.estado,''NUE'','''',''PEN'','''',comcon_pkg.comcon_comprv_ctzcnt(p_comcon_id => comcon.id, p_comprv_id => comprv.id)) > 0)  value, ''f?p=COMCON:310:&SESSION.::NO:RIR,310:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P310_COMPRV_ID,P310_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,&P1_COMPRV_ID.,PAC''  url,100 pct'||unistr('\000a')||
'from dual');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select ''Procesos Cotizados En Análisis'' label'||unistr('\000a')||
'     , (select to_char(count(1)) cantidad'||unistr('\000a')||
'        from (select distinct comctz.COMCON_ID'||unistr('\000a')||
'              from com_cotizaciones comctz'||unistr('\000a')||
'                 , com_contrataciones comcon'||unistr('\000a')||
'--                 , com_contrataciones_est comcoe'||unistr('\000a')||
'              where comctz.comprv_id = :P1_COMPRV_ID'||unistr('\000a')||
'                AND comctz.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'                AND ';

s:=s||'comctz.situacion = ''PRE'''||unistr('\000a')||
'                AND comctz.comcon_id = comcon.id '||unistr('\000a')||
'--                AND comcon.comcoe_id = comcoe.ID       '||unistr('\000a')||
'                AND comcon.comcoe_estado in (''VRF'',''ENV'',''INF'',''IFC'',''ACR'',''RES'') ))  value'||unistr('\000a')||
'   , ''f?p=COMCON:310:&SESSION.::NO:RIR,310:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P310_COMPRV_ID,P310_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,&P1_COMPRV_ID.,PCEA'' url'||unistr('\000a')||
'   ,100';

s:=s||' pct'||unistr('\000a')||
'from dual';

wwv_flow_api.create_page_plug (
  p_id=> 71279307407328039 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Procesos Cotizados En Análisis',
  p_region_name=>'',
  p_parent_plug_id=>71279923469342170 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 42,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_grid_column_span => 3,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_COM.ORACLE.APEX.BIG_VALUE_LIST',
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
  p_attribute_01=> 'LABEL',
  p_attribute_02 => 'VALUE',
  p_attribute_03 => 'PCT',
  p_attribute_04 => '&URL.',
  p_attribute_05 => '1',
  p_attribute_06 => 'B',
  p_plug_comment=> 'select ''Procesos Cotizados En Análisis'' label'||unistr('\000a')||
'     , (select to_char(count(1)) cantidad'||unistr('\000a')||
'        from (select distinct comctz.COMCON_ID'||unistr('\000a')||
'              from com_cotizaciones comctz'||unistr('\000a')||
'                 , com_contrataciones comcon'||unistr('\000a')||
'                 , com_contrataciones_est comcoe'||unistr('\000a')||
'              where comctz.comprv_id = :P1_COMPRV_ID'||unistr('\000a')||
'                AND comctz.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'                AND comctz.situacion = ''PRE'''||unistr('\000a')||
'                AND comctz.comcon_id = comcon.id '||unistr('\000a')||
'                AND comcon.comcoe_id = comcoe.ID       '||unistr('\000a')||
'                AND comcoe.estado in (''VRF'',''ENV'',''INF'',''IFC'',''ACR'',''RES'') ))  value'||unistr('\000a')||
'   , ''f?p=COMCON:310:&SESSION.::NO:RIR,310:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P310_COMPRV_ID,P310_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,&P1_COMPRV_ID.,PCEA'' url'||unistr('\000a')||
'   ,100 pct'||unistr('\000a')||
'from dual');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select ''Ordenes Aprobadas'' label, (select to_char(count(1)) cantidad'||unistr('\000a')||
'from com_ordenes_compras       comocm'||unistr('\000a')||
'--   , com_ordenes_compras_est comoce'||unistr('\000a')||
'   , com_contrataciones        comcon'||unistr('\000a')||
'--   , com_contrataciones_est  comcoe'||unistr('\000a')||
'   , com_contrataciones_tipos  comctt'||unistr('\000a')||
'   , com_proveedores           comprv'||unistr('\000a')||
'   , com_pedidos               comped'||unistr('\000a')||
'    ,com_contratantes          comeco'||unistr('\000a')||
'    ,com_catalogo_objetos  ';

s:=s||'    comcob'||unistr('\000a')||
'where comocm.comcon_id = comcon.id'||unistr('\000a')||
'--  and comocm.comoce_id = comoce.id'||unistr('\000a')||
'  and comcon.comctt_id = comctt.id'||unistr('\000a')||
'  and comocm.comprv_id = comprv.id'||unistr('\000a')||
'  and comocm.comped_id = comped.id'||unistr('\000a')||
'  and comocm.comeco_id = comeco.id'||unistr('\000a')||
'  and comped.comcob_id = comcob.id'||unistr('\000a')||
'--  and comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'  and comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'  and comocm.comprv_id = :P1_COMPRV_ID'||unistr('\000a')||
'  and comocm.comoce_estado ';

s:=s||'= ''APR'') value, ''f?p=COMCON:410:&SESSION.::NO:RIR,410:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P410_COMPRV_ID,P410_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,&P1_COMPRV_ID.,OPDE'' url,100 pct'||unistr('\000a')||
'from dual'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 71279606846337347 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Ordenes Aprobadas',
  p_region_name=>'',
  p_parent_plug_id=>71279923469342170 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 43,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_grid_column_span => 3,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_COM.ORACLE.APEX.BIG_VALUE_LIST',
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
  p_attribute_01=> 'LABEL',
  p_attribute_02 => 'VALUE',
  p_attribute_03 => 'PCT',
  p_attribute_04 => '&URL.',
  p_attribute_05 => '1',
  p_attribute_06 => 'B',
  p_plug_comment=> 'select ''Ordenes Aprobadas'' label, (select to_char(count(1)) cantidad'||unistr('\000a')||
'from com_ordenes_compras comocm'||unistr('\000a')||
'   , com_ordenes_compras_est comoce'||unistr('\000a')||
'   , com_contrataciones comcon'||unistr('\000a')||
'   , com_contrataciones_est comcoe'||unistr('\000a')||
'   , com_contrataciones_tipos comctt'||unistr('\000a')||
'   , com_proveedores comprv'||unistr('\000a')||
'   , com_pedidos comped'||unistr('\000a')||
'    ,com_contratantes comeco'||unistr('\000a')||
'    ,com_catalogo_objetos comcob'||unistr('\000a')||
'where comocm.comcon_id = comcon.id'||unistr('\000a')||
'  and comocm.comoce_id = comoce.id'||unistr('\000a')||
'  and comcon.comctt_id = comctt.id'||unistr('\000a')||
'  and comocm.comprv_id = comprv.id'||unistr('\000a')||
'  and comocm.comped_id = comped.id'||unistr('\000a')||
'  and comocm.comeco_id = comeco.id'||unistr('\000a')||
'  and comped.comcob_id = comcob.id'||unistr('\000a')||
'  and comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'  and comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'  and comocm.comprv_id = :P1_COMPRV_ID'||unistr('\000a')||
'  and comoce.estado = ''APR'') value, ''f?p=COMCON:410:&SESSION.::NO:RIR,410:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P410_COMPRV_ID,P410_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,&P1_COMPRV_ID.,OPDE'' url,100 pct'||unistr('\000a')||
'from dual'||unistr('\000a')||
'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select ''Entregas Pendientes'' label, (select to_char(count(1)) cantidad'||unistr('\000a')||
'from com_ordenes_compras comocm'||unistr('\000a')||
'--   , com_ordenes_compras_est comoce'||unistr('\000a')||
'   , com_comprobantes_ent comcet'||unistr('\000a')||
'where comcet.comocm_id = comocm.id'||unistr('\000a')||
'  and comocm.comoce_estado = ''APR''  '||unistr('\000a')||
'--  and comocm.comoce_id = comoce.id'||unistr('\000a')||
'  and comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'  and comocm.comprv_id = :P1_COMPRV_ID'||unistr('\000a')||
'  and COMOCM_PKG.COMCET_PENDIENTE_SN(p_';

s:=s||'comcet_id => comcet.id) = ''SI'''||unistr('\000a')||
'  ) value, ''f?p=COMCON:410:&SESSION.::NO:RIR,410:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P410_COMPRV_ID,P410_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,&P1_COMPRV_ID.,OCEP'' url,100 pct'||unistr('\000a')||
'  from dual'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 71282107932366043 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Entregas Pendientes',
  p_region_name=>'',
  p_parent_plug_id=>71279923469342170 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 44,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_grid_column_span => 3,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_COM.ORACLE.APEX.BIG_VALUE_LIST',
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
  p_attribute_01=> 'LABEL',
  p_attribute_02 => 'VALUE',
  p_attribute_03 => 'PCT',
  p_attribute_04 => '&URL.',
  p_attribute_05 => '1',
  p_attribute_06 => 'B',
  p_plug_comment=> 'select ''Entregas Pendientes'' label, (select to_char(count(1)) cantidad'||unistr('\000a')||
'from com_ordenes_compras comocm'||unistr('\000a')||
'   , com_ordenes_compras_est comoce'||unistr('\000a')||
'   , com_comprobantes_ent comcet'||unistr('\000a')||
'where comocm.comoce_id = comoce.id'||unistr('\000a')||
'  and comoce.estado = ''APR''  '||unistr('\000a')||
'  and comcet.comocm_id = comocm.id'||unistr('\000a')||
'  and comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'  and comocm.comprv_id = :P1_COMPRV_ID'||unistr('\000a')||
'  and COMOCM_PKG.COMCET_PENDIENTE_SN(p_comcet_id => comcet.id) = ''SI'''||unistr('\000a')||
'  ) value, ''f?p=COMCON:410:&SESSION.::NO:RIR,410:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P410_COMPRV_ID,P410_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,&P1_COMPRV_ID.,OCEP'' url,100 pct'||unistr('\000a')||
'  from dual'||unistr('\000a')||
'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select ''Entregas para Autorizar'' label, (select to_char(count(1)) cantidad'||unistr('\000a')||
'from com_ordenes_compras comocm'||unistr('\000a')||
'--   , com_ordenes_compras_est comoce'||unistr('\000a')||
'   , com_comprobantes_ent comcet'||unistr('\000a')||
'where comcet.comocm_id = comocm.id'||unistr('\000a')||
'  and comocm.comoce_estado = ''APR''  '||unistr('\000a')||
'--  and comocm.comoce_id = comoce.id'||unistr('\000a')||
'  and comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'  and comocm.comprv_id = :P1_COMPRV_ID'||unistr('\000a')||
'  and COMOCM_PKG.COMCET_AUTORIZADA_';

s:=s||'SN(p_comcet_id => comcet.id) = ''NO'''||unistr('\000a')||
'  ) value, ''f?p=COMCON:410:&SESSION.::NO:RIR,410:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P410_COMPRV_ID,P410_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,&P1_COMPRV_ID.,OEPA'' url,100 pct'||unistr('\000a')||
'  from dual'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 71282419013369232 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Entregas para Autorizar',
  p_region_name=>'',
  p_parent_plug_id=>71279923469342170 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 45,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_grid_column_span => 3,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_COM.ORACLE.APEX.BIG_VALUE_LIST',
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
  p_attribute_01=> 'LABEL',
  p_attribute_02 => 'VALUE',
  p_attribute_03 => 'PCT',
  p_attribute_04 => '&URL.',
  p_attribute_05 => '1',
  p_attribute_06 => 'B',
  p_plug_comment=> 'select ''Entregas para Autorizar'' label, (select to_char(count(1)) cantidad'||unistr('\000a')||
'from com_ordenes_compras comocm'||unistr('\000a')||
'   , com_ordenes_compras_est comoce'||unistr('\000a')||
'   , com_comprobantes_ent comcet'||unistr('\000a')||
'where comocm.comoce_id = comoce.id'||unistr('\000a')||
'  and comoce.estado = ''APR''  '||unistr('\000a')||
'  and comcet.comocm_id = comocm.id'||unistr('\000a')||
'  and comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'  and comocm.comprv_id = :P1_COMPRV_ID'||unistr('\000a')||
'  and COMOCM_PKG.COMCET_AUTORIZADA_SN(p_comcet_id => comcet.id) = ''NO'''||unistr('\000a')||
'  ) value, ''f?p=COMCON:410:&SESSION.::NO:RIR,410:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P410_COMPRV_ID,P410_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,&P1_COMPRV_ID.,OEPA'' url,100 pct'||unistr('\000a')||
'  from dual'||unistr('\000a')||
'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select ''Calificaciones para Revisar'' label, (select to_char(count(1)) cantidad'||unistr('\000a')||
'from com_ordenes_compras        comocm'||unistr('\000a')||
'--   , com_ordenes_compras_est    comoce'||unistr('\000a')||
'   , com_contrataciones         comcon'||unistr('\000a')||
'--   , com_contrataciones_est     comcoe'||unistr('\000a')||
'   , com_contrataciones_tipos   comctt'||unistr('\000a')||
'   , com_proveedores            comprv'||unistr('\000a')||
'   , com_pedidos                comped'||unistr('\000a')||
'    ,com_contratantes           comeco'||unistr('\000a')||
'    ,';

s:=s||'com_catalogo_objetos       comcob'||unistr('\000a')||
'where comocm.comcon_id = comcon.id'||unistr('\000a')||
'--  and comocm.comoce_id = comoce.id'||unistr('\000a')||
'  and comcon.comctt_id = comctt.id'||unistr('\000a')||
'  and comocm.comprv_id = comprv.id'||unistr('\000a')||
'  and comocm.comped_id = comped.id'||unistr('\000a')||
'  and comocm.comeco_id = comeco.id'||unistr('\000a')||
'  and comped.comcob_id = comcob.id'||unistr('\000a')||
'--  and comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'  and comocm.comoce_estado not in (''NUE'',''PEN'',''ANU'')  '||unistr('\000a')||
'  and comocm.segorg_id = :';

s:=s||'P1_SEGORG_ID'||unistr('\000a')||
'  and comocm.comprv_id = :P1_COMPRV_ID'||unistr('\000a')||
'  and comocm.comoce_estado <> ''APR'''||unistr('\000a')||
'  and decode(comocm.comoce_estado,''NUE'','''',''ANU'','''',''RCH'','''',''APR'','''',COM_PKG.COMREP_REPLICAR_SN(p_comocm_id => comocm.id,p_origen => ''PRV''))= ''SI'') value, ''f?p=COMCON:410:&SESSION.::NO:RIR,410:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P410_COMPRV_ID,P410_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,&P1_COMPRV_ID.,OCP';

s:=s||'R'' url,100 pct'||unistr('\000a')||
'from dual'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 71282710487376236 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Calificaciones para Revisar',
  p_region_name=>'',
  p_parent_plug_id=>71279923469342170 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 46,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_grid_column_span => 3,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_COM.ORACLE.APEX.BIG_VALUE_LIST',
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
  p_attribute_01=> 'LABEL',
  p_attribute_02 => 'VALUE',
  p_attribute_03 => 'PCT',
  p_attribute_04 => '&URL.',
  p_attribute_05 => '1',
  p_attribute_06 => 'B',
  p_plug_comment=> 'select ''Calificaciones para Revisar'' label, (select to_char(count(1)) cantidad'||unistr('\000a')||
'from com_ordenes_compras comocm'||unistr('\000a')||
'   , com_ordenes_compras_est comoce'||unistr('\000a')||
'   , com_contrataciones comcon'||unistr('\000a')||
'   , com_contrataciones_est comcoe'||unistr('\000a')||
'   , com_contrataciones_tipos comctt'||unistr('\000a')||
'   , com_proveedores comprv'||unistr('\000a')||
'   , com_pedidos comped'||unistr('\000a')||
'    ,com_contratantes comeco'||unistr('\000a')||
'    ,com_catalogo_objetos comcob'||unistr('\000a')||
'where comocm.comoce_id = comoce.id'||unistr('\000a')||
'  and comocm.comcon_id = comcon.id'||unistr('\000a')||
'  and comcon.comctt_id = comctt.id'||unistr('\000a')||
'  and comocm.comprv_id = comprv.id'||unistr('\000a')||
'  and comocm.comped_id = comped.id'||unistr('\000a')||
'  and comocm.comeco_id = comeco.id'||unistr('\000a')||
'  and comped.comcob_id = comcob.id'||unistr('\000a')||
'  and comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'  and comoce.estado not in (''NUE'',''PEN'',''ANU'')  '||unistr('\000a')||
'  and comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'  and comocm.comprv_id = :P1_COMPRV_ID'||unistr('\000a')||
'  and comoce.estado <> ''APR'''||unistr('\000a')||
'  and decode(comoce.estado,''NUE'','''',''ANU'','''',''RCH'','''',''APR'','''',COM_PKG.COMREP_REPLICAR_SN(p_comocm_id => comocm.id,p_origen => ''PRV''))= ''SI'') value, ''f?p=COMCON:410:&SESSION.::NO:RIR,410:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P410_COMPRV_ID,P410_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,&P1_COMPRV_ID.,OCPR'' url,100 pct'||unistr('\000a')||
'from dual'||unistr('\000a')||
'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select ''Entregas Vencidas'' label, (select to_char(count(1)) cantidad'||unistr('\000a')||
'from com_ordenes_compras      comocm'||unistr('\000a')||
'--   , com_ordenes_compras_est  comoce'||unistr('\000a')||
'   , com_comprobantes_ent     comcet'||unistr('\000a')||
'where comcet.comocm_id = comocm.id  '||unistr('\000a')||
'  and comocm.comoce_estado = ''APR'''||unistr('\000a')||
'--  and comocm.comoce_id = comoce.id'||unistr('\000a')||
'  and comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'  and comocm.comprv_id = :P1_COMPRV_ID'||unistr('\000a')||
'  and COMOCM_PKG.COMCET_VENCIDA';

s:=s||'_SN(p_comcet_id => comcet.id) = ''SI'''||unistr('\000a')||
'  ) value, ''f?p=COMCON:410:&SESSION.::NO:RIR,410:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P410_COMPRV_ID,P410_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,&P1_COMPRV_ID.,OCEV'' url,100 pct'||unistr('\000a')||
'  from dual'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 71283329533381717 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Entregas Vencidas',
  p_region_name=>'',
  p_parent_plug_id=>71279923469342170 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 47,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_grid_column_span => 3,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_COM.ORACLE.APEX.BIG_VALUE_LIST',
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
  p_attribute_01=> 'LABEL',
  p_attribute_02 => 'VALUE',
  p_attribute_03 => 'PCT',
  p_attribute_04 => '&URL.',
  p_attribute_05 => '1',
  p_attribute_06 => 'B',
  p_plug_comment=> 'select ''Entregas Vencidas'' label, (select to_char(count(1)) cantidad'||unistr('\000a')||
'from com_ordenes_compras comocm'||unistr('\000a')||
'   , com_ordenes_compras_est comoce'||unistr('\000a')||
'   , com_comprobantes_ent comcet'||unistr('\000a')||
'where comocm.comoce_id = comoce.id'||unistr('\000a')||
'  and comoce.estado = ''APR'''||unistr('\000a')||
'  and comcet.comocm_id = comocm.id  '||unistr('\000a')||
'  and comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'  and comocm.comprv_id = :P1_COMPRV_ID'||unistr('\000a')||
'  and COMOCM_PKG.COMCET_VENCIDA_SN(p_comcet_id => comcet.id) = ''SI'''||unistr('\000a')||
'  ) value, ''f?p=COMCON:410:&SESSION.::NO:RIR,410:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P410_COMPRV_ID,P410_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,&P1_COMPRV_ID.,OCEV'' url,100 pct'||unistr('\000a')||
'  from dual'||unistr('\000a')||
'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select ''Documentación Adeudada'' label, (select to_char(count(1)) cantidad'||unistr('\000a')||
'from ('||unistr('\000a')||
'select distinct compdt.id'||unistr('\000a')||
'from com_proveedores_dot_v compdt'||unistr('\000a')||
'    ,com_compdt_comprt_v comptt'||unistr('\000a')||
'where compdt.id = comptt.compdt_id'||unistr('\000a')||
'  and compdt.tipo = ''GEN'''||unistr('\000a')||
'  and compdt.compde_estado = ''HAB'''||unistr('\000a')||
'  and comptt.comprt_id = (select comprt_id from com_proveedores comprv where comprv.id = :P1_COMPRV_ID)'||unistr('\000a')||
'  and com_pkg.obtn_comdoc_n';

s:=s||'o_fmt2 ( p_segorg_id => COMPDT.SEGORG_ID'||unistr('\000a')||
'                                 , p_comprv_id => :P1_COMPRV_ID'||unistr('\000a')||
'                                 , p_compdt_id => COMPDT.id'||unistr('\000a')||
'                                 , p_compdt_tipo => compdt.tipo'||unistr('\000a')||
'                                 , P_COMPDT_TIPO_DURACION => COMPDT.TIPO_DURACION'||unistr('\000a')||
'                                 , P_COMPDE_ESTADO => COMPDT.COMPDE_ESTADO) in (''NO PRESE';

s:=s||'NTADO'',''VENCIDO'')'||unistr('\000a')||
'union all'||unistr('\000a')||
'select distinct compdt.id'||unistr('\000a')||
'from com_proveedores_dot_v compdt'||unistr('\000a')||
'    ,com_compdt_comrub_v comtdr'||unistr('\000a')||
'    ,com_proveedores_rub comprr'||unistr('\000a')||
'where compdt.id = comtdr.compdt_id'||unistr('\000a')||
'  and comtdr.comrub_id = comprr.comrub_id'||unistr('\000a')||
'  and comprr.situacion = ''ACT'''||unistr('\000a')||
'  and compdt.tipo = ''RUB'''||unistr('\000a')||
'  and compdt.compde_estado = ''HAB'''||unistr('\000a')||
'  and comprr.comprv_id = :P1_COMPRV_ID'||unistr('\000a')||
'  and com_pkg.obtn_comdoc_no_fmt2 ( p_se';

s:=s||'gorg_id => COMPDT.SEGORG_ID'||unistr('\000a')||
'                          , p_comprv_id => comprr.comprv_id    --:P1_COMPRV_ID'||unistr('\000a')||
'                          , p_compdt_id => COMPDT.id'||unistr('\000a')||
'                          , p_compdt_tipo => compdt.tipo'||unistr('\000a')||
'                          , P_COMPDT_TIPO_DURACION => COMPDT.TIPO_DURACION'||unistr('\000a')||
'                          , P_COMPDE_ESTADO => COMPDT.COMPDE_ESTADO) in (''NO PRESENTADO'',''VENCIDO'') '||unistr('\000a')||
'union a';

s:=s||'ll'||unistr('\000a')||
'select distinct comode.ID comodt_id'||unistr('\000a')||
'from   COM_OBJETOS_DOC_ESTADO_V comode'||unistr('\000a')||
'      ,COM_RUBROS comrub'||unistr('\000a')||
'where  comode.COMOBJ_COMPRV_ID = :P1_COMPRV_ID'||unistr('\000a')||
'and    comrub.ID = comode.COMOBJ_COMRUB_ID'||unistr('\000a')||
'and    comode.SEGORG_ID = comode.SEGORG_ID --:P1_SEGORG_ID'||unistr('\000a')||
'and    comode.ESTADO <> ''PRESENTADO''))  value, ''f?p=COMCON:510:&SESSION.::NO:RIR,510:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P510_COMPRV_ID:&APP_ID.,&APP_';

s:=s||'PAGE_ID.,&P1_COMPRV_ID.'' url, 100 pct'||unistr('\000a')||
'from dual';

wwv_flow_api.create_page_plug (
  p_id=> 71284126548390334 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Documentación Adeudada',
  p_region_name=>'',
  p_parent_plug_id=>71279923469342170 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 48,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_grid_column_span => 3,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_COM.ORACLE.APEX.BIG_VALUE_LIST',
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
  p_attribute_01=> 'LABEL',
  p_attribute_02 => 'VALUE',
  p_attribute_03 => 'PCT',
  p_attribute_04 => '&URL.',
  p_attribute_05 => '1',
  p_attribute_06 => 'B',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select ''Documentación adeudada por Autoridades'' label'||unistr('\000a')||
',(select to_char(count(1)) cantidad '||unistr('\000a')||
'from (select compra.id '||unistr('\000a')||
'      from com_proveedores_aut_v compra '||unistr('\000a')||
'      where compra.comprv_id = :P1_COMPRV_ID '||unistr('\000a')||
'        and comprv_pkg.compra_debe_sn(p_compra_id => compra.id) = ''SI'' '||unistr('\000a')||
'        and compra.id in (select max(compra1.id) '||unistr('\000a')||
'                          from (com_proveedores_aut_v) compra1 '||unistr('\000a')||
'            ';

s:=s||'              where compra1.situacion not in (''NUE'',''ANU'') '||unistr('\000a')||
'                            and compra1.comprv_id = :P1_COMPRV_ID '||unistr('\000a')||
'                          group by compra1.compcc_id,compra1.numero_documento,compra1.comprv_id,compra1.tipo_documento))) value'||unistr('\000a')||
', ''f?p=ADMCOM:PRVDET:&SESSION.::NO::P251_ID,P251_APP_ANTERIOR,P251_PAG_ANTERIOR:&P1_COMPRV_ID.,&APP_ID.,&APP_PAGE_ID.'' url'||unistr('\000a')||
', 100 pct '||unistr('\000a')||
'from dual';

wwv_flow_api.create_page_plug (
  p_id=> 71284512742414784 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Documentación adeudada por Autoridades',
  p_region_name=>'',
  p_parent_plug_id=>71279923469342170 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 49,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_grid_column_span => 3,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_COM.ORACLE.APEX.BIG_VALUE_LIST',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'FUNCTION_BODY',
  p_plug_display_when_condition => 'declare'||unistr('\000a')||
'  cursor cr_comprv is'||unistr('\000a')||
'	select comprt_id '||unistr('\000a')||
'    from com_proveedores'||unistr('\000a')||
'    where id = :P1_COMPRV_ID;'||unistr('\000a')||
'    --'||unistr('\000a')||
'  cursor cr_comprt(p_comprt_id number) is '||unistr('\000a')||
'    select codigo'||unistr('\000a')||
'    from com_proveedores_tipos '||unistr('\000a')||
'    where id = p_comprt_id;'||unistr('\000a')||
'--    '||unistr('\000a')||
'v_comprv cr_comprv%rowtype;'||unistr('\000a')||
'v_comprt cr_comprt%rowtype;'||unistr('\000a')||
''||unistr('\000a')||
'begin'||unistr('\000a')||
'    --'||unistr('\000a')||
'    -- Obtener el tipo de Proveedor'||unistr('\000a')||
'    open cr_comprv;'||unistr('\000a')||
'    fetch cr_comprv into v_comprv;'||unistr('\000a')||
'    close cr_comprv;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    -- Obtener el código del tipo de Proveedor'||unistr('\000a')||
'    open cr_comprt(v_comprv.comprt_id);'||unistr('\000a')||
'    fetch cr_comprt into v_comprt;'||unistr('\000a')||
'    close cr_comprt;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    -- Si es persona jurídica, se muestra el contador de autoridades que deben documentación.'||unistr('\000a')||
'    if v_comprt.codigo = ''JUR'' then'||unistr('\000a')||
'       return true;'||unistr('\000a')||
'    else'||unistr('\000a')||
'       return false;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'end;',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'LABEL',
  p_attribute_02 => 'VALUE',
  p_attribute_03 => 'PCT',
  p_attribute_04 => '&URL.',
  p_attribute_05 => '1',
  p_attribute_06 => 'B',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select ''Procesos Abiertos No Cotizados'' label, (select to_char(count(1)) cantidad'||unistr('\000a')||
'from com_contrataciones_inv comcoi'||unistr('\000a')||
'    ,com_contrataciones comcon'||unistr('\000a')||
'--    ,com_contrataciones_est comcoe'||unistr('\000a')||
'    ,com_contrataciones_tipos comctt'||unistr('\000a')||
'    ,com_proveedores comprv'||unistr('\000a')||
'    ,com_contrataciones_detalles comcot'||unistr('\000a')||
'    ,com_pedidos comped'||unistr('\000a')||
'    ,com_contratantes comeco'||unistr('\000a')||
'    ,com_catalogo_objetos comcob'||unistr('\000a')||
'where comcon.segorg_id =';

s:=s||' :P1_SEGORG_ID'||unistr('\000a')||
'  and comcoi.situacion = ''ACT'''||unistr('\000a')||
'  and comcoi.comcon_id = comcon.id'||unistr('\000a')||
'--  and comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'  and comcon.fecha_publicacion <= sysdate'||unistr('\000a')||
'  and comcon.comctt_id = comctt.id'||unistr('\000a')||
'  and comcoi.comprv_id = comprv.id'||unistr('\000a')||
'  and comcon.id = comcot.comcon_id'||unistr('\000a')||
'  and comcot.comped_id = comped.id'||unistr('\000a')||
'  and comped.comeco_id = comeco.id'||unistr('\000a')||
'  and comped.comcob_id = comcob.id'||unistr('\000a')||
'  and comprv.id = :P1_COMPRV_I';

s:=s||'D'||unistr('\000a')||
'  and (comcon.comcoe_estado = ''ACT'' '||unistr('\000a')||
'                and sysdate >= comcon.fecha_inicio_propuesta '||unistr('\000a')||
'                and sysdate <= comcon.fecha_fin_propuesta )'||unistr('\000a')||
'  and decode(comcon.comcoe_estado,''NUE'','''',''PEN'','''',comcon_pkg.comcon_comprv_ctzcnt(p_comcon_id => comcon.id, p_comprv_id => comprv.id)) = 0) value, ''f?p=COMCON:310:&SESSION.::NO:RIR,310:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P310_COMPRV_ID,P31';

s:=s||'0_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,&P1_COMPRV_ID.,PANC'' url,100 pct'||unistr('\000a')||
'from dual'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 107920142492935032 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Procesos Abiertos No Cotizados',
  p_region_name=>'',
  p_parent_plug_id=>71279923469342170 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 40,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_grid_column_span => 3,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_COM.ORACLE.APEX.BIG_VALUE_LIST',
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
  p_attribute_01=> 'LABEL',
  p_attribute_02 => 'VALUE',
  p_attribute_03 => 'PCT',
  p_attribute_04 => '&URL.',
  p_attribute_05 => '1',
  p_attribute_06 => 'B',
  p_plug_comment=> 'select ''Procesos Abiertos No Cotizados'' label, (select to_char(count(1)) cantidad'||unistr('\000a')||
'from com_contrataciones_inv comcoi'||unistr('\000a')||
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
'--  and comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'  and comcon.fecha_publicacion <= sysdate'||unistr('\000a')||
'  and comcon.comctt_id = comctt.id'||unistr('\000a')||
'  and comcoi.comprv_id = comprv.id'||unistr('\000a')||
'  and comcon.id = comcot.comcon_id'||unistr('\000a')||
'  and comcot.comped_id = comped.id'||unistr('\000a')||
'  and comped.comeco_id = comeco.id'||unistr('\000a')||
'  and comped.comcob_id = comcob.id'||unistr('\000a')||
'  and comprv.id = :P1_COMPRV_ID'||unistr('\000a')||
'  and (comcoe.estado = ''ACT'' '||unistr('\000a')||
'                and sysdate >= comcon.fecha_inicio_propuesta '||unistr('\000a')||
'                and sysdate <= comcon.fecha_fin_propuesta )'||unistr('\000a')||
'  and decode(comcoe.estado,''NUE'','''',''PEN'','''',comcon_pkg.comcon_comprv_ctzcnt(p_comcon_id => comcon.id, p_comprv_id => comprv.id)) = 0) value, ''f?p=COMCON:310:&SESSION.::NO:RIR,310:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P310_COMPRV_ID,P310_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,&P1_COMPRV_ID.,PANC'' url,100 pct'||unistr('\000a')||
'from dual'||unistr('\000a')||
'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 107910044487604504 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Menu Proveedores',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 107908630635600444 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 123941388010091810+ wwv_flow_api.g_id_offset,
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
  p_id=> 108857335051492152 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Video Introducción',
  p_region_name=>'dialog-video',
  p_region_attributes=> 'title="Video tutorial - Menú principal"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 123935170363091807+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 120,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
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
s:=s||'htp.print(:P1_NOTICIAS);';

wwv_flow_api.create_page_plug (
  p_id=> 146934768736165160 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Noticias',
  p_region_name=>'',
  p_region_attributes=> 'style="min-height:40px;"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 123935170363091807+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_header=> '<div style="float:right;margin: 0px 4px 0 0;"><a onclick="abrir_news(); return false;" href="f?p=&APP_ID.:1:&SESSION.::::"><img border="0" title="Ver Todas las Noticias" alt="Ver Todas las Noticias" src="#IMAGE_PREFIX#menu/go-small.png"></a></div>',
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
s:=s||'htp.print(:P1_NOTICIAS_TODAS);';

wwv_flow_api.create_page_plug (
  p_id=> 147724874679317380 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Todas las Noticias',
  p_region_name=>'dialog-modal',
  p_region_attributes=> 'title="Todas las Noticias"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 123935170363091807+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 110,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
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
s:=s||'22148815502294520';

wwv_flow_api.create_page_plug (
  p_id=> 413131597280110810 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Accesos',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 123935794660091807+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 413131300266102177 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 123943786089091811+ wwv_flow_api.g_id_offset,
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
 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>138456148463630111 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:1:&SESSION.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'Y',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>138920260884847577 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:1:&SESSION.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'Y',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>62223516604237840 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_HABILITADO_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 240,
  p_item_plug_id => 62222817859223521+wwv_flow_api.g_id_offset,
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
  p_id=>72890500748245417 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_COMPRV_ESTADO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 250,
  p_item_plug_id => 56243818912136972+wwv_flow_api.g_id_offset,
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
  p_attribute_01 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>108878526869921772 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_VIDEO_IFRAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 230,
  p_item_plug_id => 413131597280110810+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '<iframe width="670" height="430" src="//www.youtube.com/embed/p44uLxCIOhM" frameborder="0" allowfullscreen id="clearmySound"></iframe>',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'<iframe width="670" height="430" src="//www.youtube.com/embed/p44uLxCIOhM" frameborder="0" allowfullscreen id="clearmySound"></iframe>',
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
  p_id=>138506653310353783 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_COMPRV_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 210,
  p_item_plug_id => 56243818912136972+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Proveedor :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_POPUP_LOV',
  p_lov=> 'select nombre||'' - CUIT: ''||to_char(cuit) d, id r'||unistr('\000a')||
'from com_proveedores'||unistr('\000a')||
'where segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'  and id = :P1_COMPRV_ID',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> null,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_field_template=> 123945193986091812+wwv_flow_api.g_id_offset,
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
  p_id=>141410871232032179 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_NOTICIAS_TODAS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 200,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 4000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>146935279471168261 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_NOTICIAS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 190,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 4000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>146935453976170347 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGORG_COPYRIGHT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 170,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 4000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>324452850701673432 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_APP_THEME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 160,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'App Theme',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>413126616701993419 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_APP_ANTERIOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 130,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'App Anterior',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>413126789473995010 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_APP_ANTERIOR_PAG',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 140,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'App Anterior Pag',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>413126993975996246 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_PAG_ANTERIOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 150,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Pag Anterior',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>435181530641284289 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGAPL_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Segapl Id',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>435181742069287519 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGAPL_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Segapl Codigo',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>435181917612289936 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGAPL_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Segapl Nombre',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>435193424733831341 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGUSU_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Segusu Id',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>435194610974884183 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGUSU_DOCUMENTO_TIPO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 90,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Segusu Documento Tipo',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>435194816862885803 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGUSU_DOCUMENTO_NUMERO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 100,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Segusu Documento Numero',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>435195020325886853 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGUSU_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 110,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Segusu Nombre',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>435195224134887934 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGUSU_EMAIL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 120,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Segusu Email',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>457235921476041989 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGORG_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Segorg Id',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>457236126324043472 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGORG_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Segorg Nombre',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>457236332211045097 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGORG_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Segorg Codigo',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||':P1_HABILITADO_SN := ''SI'';';

wwv_flow_api.create_page_process(
  p_id     => 62223614311241446 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AsignarHabilitadoSNAlerta',
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
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'278569022172960254';

wwv_flow_api.create_page_process(
  p_id     => 137537339559577924 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'InicializarOrganizaciónPorDefault',
  p_process_sql_clob => 278569022172960254 + wwv_flow_api.g_id_offset,
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
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'137529441796464969';

wwv_flow_api.create_page_process(
  p_id     => 137537547524580166 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 20,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'InicializarTemaPorDefault',
  p_process_sql_clob => 137529441796464969 + wwv_flow_api.g_id_offset,
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
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'457237016805078558';

wwv_flow_api.create_page_process(
  p_id     => 137537756528582801 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 30,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'CargarDatosOrganizacion',
  p_process_sql_clob => 457237016805078558 + wwv_flow_api.g_id_offset,
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
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'IF :P1_APP_ANTERIOR is null then'||unistr('\000a')||
'  :P1_APP_ANTERIOR := v(''APP_ID'');'||unistr('\000a')||
'END IF;';

wwv_flow_api.create_page_process(
  p_id     => 137835356148624572 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 40,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AsignarAplicacionAnterior',
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
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'declare'||unistr('\000a')||
'  cursor cr_comprr is'||unistr('\000a')||
'  select comprv_id'||unistr('\000a')||
'  from com_proveedores_res'||unistr('\000a')||
'  where segusu_id = :P1_SEGUSU_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_dummy number;    '||unistr('\000a')||
'begin'||unistr('\000a')||
'  open cr_comprr;'||unistr('\000a')||
'  fetch cr_comprr into :P1_COMPRV_ID;'||unistr('\000a')||
'  close cr_comprr;'||unistr('\000a')||
'  --'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 138507257250364326 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 50,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ObtenerIdProveedor',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P1_COMPRV_ID',
  p_process_when_type=>'ITEM_IS_NULL',
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
p:=p||'DECLARE'||unistr('\000a')||
' CURSOR cr_compee IS'||unistr('\000a')||
' SELECT ESTADO'||unistr('\000a')||
' FROM COM_PROVEEDORES_EST'||unistr('\000a')||
' WHERE ID = COM_PKG.OBTN_COMPRE_ID(:P1_COMPRV_ID);'||unistr('\000a')||
' --'||unistr('\000a')||
' v_compree cr_compee%ROWTYPE;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  OPEN cr_compee;'||unistr('\000a')||
'  FETCH cr_compee INTO v_compree;'||unistr('\000a')||
'  IF v_compree.estado = ''PEN'' THEN'||unistr('\000a')||
'   COM_PKG.HAB_PRV(P_COMPRV_ID   =>  :P1_COMPRV_ID'||unistr('\000a')||
'                  ,P_DESCRIPCION => ''Habilitación Automatica desde el Portal Proveedores'''||unistr('\000a')||
'           ';

p:=p||'       );'||unistr('\000a')||
'   :P1_COMPRV_ESTADO := ''HAB'';'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'   :P1_COMPRV_ESTADO := v_compree.ESTADO;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  CLOSE cr_compee;'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 72885524663012371 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 60,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Habilitar Proveedor',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
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
p:=p||'146934173799157201';

wwv_flow_api.create_page_process(
  p_id     => 146946554163283954 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 110,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'ObtenerNoticias',
  p_process_sql_clob => 146934173799157201 + wwv_flow_api.g_id_offset,
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
-- ...updatable report columns for page 1
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
