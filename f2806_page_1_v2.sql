set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end;
/
 
 
--application/set_environment
prompt  APPLICATION 2806 - Compras - Portal para Entidades Contratantes
--
-- Application Export:
--   Application:     2806
--   Name:            Compras - Portal para Entidades Contratantes
--   Date and Time:   16:22 Martes Noviembre 1, 2016
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
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,2806);
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
 ,p_user_interface_id => 170453256197545135 + wwv_flow_api.g_id_offset
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
'</style>'||unistr('\000a')||
'<style>'||unistr('\000a')||
'#Cambiar_Ejercicio{display:none;}'||unistr('\000a')||
'</style>    '
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
'/* -------------------- Cambiar Ejercicio ------------------*/'||unistr('\000a')||
''||unistr('\000a')||
'function cambiar_ejercicio (){'||unistr('\000a')||
' $( "#Cambiar_Ejercicio" ).dialog({'||unistr('\000a')||
'   width: 500,'||unistr('\000a')||
'   height: 200,'||unistr('\000a')||
'   modal: true,'||unistr('\000a')||
'   close: function() {'||unistr('\000a')||
'     $( "#Cambiar_Ejercic'||
'io" ).empty();'||unistr('\000a')||
'   }'||unistr('\000a')||
' });'||unistr('\000a')||
'}'||unistr('\000a')||
''
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'CTISSERA'
 ,p_last_upd_yyyymmddhh24miss => '20161101162148'
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
  p_id=> 70428902330578286 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Acerca de',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186459500426809941+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 140,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 70428320769564636 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 186466576796809945+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_header=> '<b>Pantalla principal del Portal de Entidades Contratantes</b>.<br> Desde aquí se podrá gestionar toda la información de la Entidad Contratante. <br>Para más detalle acceda al video Tutorial<br><br>',
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
  p_id=> 71299303036404006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Panel de Control del Ejercicio : &P1_COMPED_EJERCICIO.',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186459500426809941+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 40,
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
s:=s||'SELECT ''Pedidos Rechazados para Revisar '' label, COUNT (comped_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:220:&SESSION.::NO:RIR,220:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P220_COMECO_ID,P220_COMPED_EJERCICIO,P220_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,&P1_COMPED_EJERCICIO.,RCH'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comped.ID comped_id'||unistr('\000a')||
'    ';

s:=s||'      FROM com_pedidos comped'||unistr('\000a')||
'--              ,com_pedidos_est compee'||unistr('\000a')||
'         WHERE comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'--           AND comped.compee_id = compee.ID'||unistr('\000a')||
'           AND comped.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'--           AND compee.estado = ''RCH'''||unistr('\000a')||
'           AND comped.compee_estado = ''RCH'''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
'        SELECT comped.ID comped_';

s:=s||'id'||unistr('\000a')||
'          FROM com_pedidos comped'||unistr('\000a')||
'--             , com_pedidos_est compee'||unistr('\000a')||
'         WHERE comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'--           AND comped.compee_id = compee.ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'--           AND compee.estado = ''RCH'''||unistr('\000a')||
'           AND comped.compee_estado = ''RCH'''||unistr('\000a')||
'           AND comped.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'                             ';

s:=s||'         FROM com_contratantes_vinc vin'||unistr('\000a')||
'                                     WHERE vin.comeco_id_padre = :P1_COMECO_ID))';

wwv_flow_api.create_page_plug (
  p_id=> 71298312255397270 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Pedidos Rechazados para Revisar',
  p_region_name=>'',
  p_parent_plug_id=>71299303036404006 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 52,
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
  p_plug_comment=> 'SELECT ''Pedidos Rechazados para Revisar '' label, COUNT (comped_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:220:&SESSION.::NO:RIR,220:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P220_COMECO_ID,P220_COMPED_EJERCICIO,P220_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,&P1_COMPED_EJERCICIO.,RCH'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comped.ID comped_id'||unistr('\000a')||
'          FROM com_pedidos comped,'||unistr('\000a')||
'               com_pedidos_est compee'||unistr('\000a')||
'         WHERE comped.compee_id = compee.ID'||unistr('\000a')||
'           AND comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comped.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND compee.estado = ''RCH'''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
'        SELECT comped.ID comped_id'||unistr('\000a')||
'          FROM com_pedidos comped,'||unistr('\000a')||
'               com_pedidos_est compee'||unistr('\000a')||
'         WHERE comped.compee_id = compee.ID'||unistr('\000a')||
'           AND comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND compee.estado = ''RCH'''||unistr('\000a')||
'           AND comped.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'                                      FROM com_contratantes_vinc vin'||unistr('\000a')||
'                                     WHERE vin.comeco_id_padre = :P1_COMECO_ID))');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT ''Proceso para Informar '' label, COUNT (comcon_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:220:&SESSION.::NO:RIR,220:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P220_COMECO_ID,P220_COMPED_EJERCICIO,P220_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,&P1_COMPED_EJERCICIO.,PPI'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comcon.ID comcon_id'||unistr('\000a')||
'          FROM';

s:=s||' com_pedidos comped'||unistr('\000a')||
'              ,com_contrataciones comcon'||unistr('\000a')||
'              ,com_contrataciones_detalles comcot'||unistr('\000a')||
'--              ,com_contrataciones_est comcoe       '||unistr('\000a')||
'         WHERE comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comped.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND comped.id = comcot.comped_id'||unistr('\000a')||
'           AND comcot.comcon_id = comcon';

s:=s||'.id'||unistr('\000a')||
'--           AND comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'--           AND comcoe.estado = ''ENV'''||unistr('\000a')||
'           AND comcon.comcoe_estado = ''ENV'''||unistr('\000a')||
''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
''||unistr('\000a')||
'        SELECT comcon.ID comcon_id'||unistr('\000a')||
'          FROM com_pedidos comped'||unistr('\000a')||
'              ,com_contrataciones comcon'||unistr('\000a')||
'              ,com_contrataciones_detalles comcot'||unistr('\000a')||
'--              ,com_contrataciones_est comcoe       '||unistr('\000a')||
'         WHERE comped.segorg_id =';

s:=s||' :P1_SEGORG_ID'||unistr('\000a')||
'           AND comped.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND comped.id = comcot.comped_id'||unistr('\000a')||
'           AND comcot.comcon_id = comcon.id'||unistr('\000a')||
'--           AND comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'--           AND comcoe.estado = ''ENV'''||unistr('\000a')||
'           AND comcon.comcoe_estado = ''ENV'''||unistr('\000a')||
'           AND comped.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'   ';

s:=s||'                                   FROM com_contratantes_vinc vin'||unistr('\000a')||
'                                     WHERE vin.comeco_id_padre = :P1_COMECO_ID))';

wwv_flow_api.create_page_plug (
  p_id=> 71300003991423193 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Proceso para Informar ',
  p_region_name=>'',
  p_parent_plug_id=>71299303036404006 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 53,
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
  p_plug_comment=> 'SELECT ''Proceso para Informar '' label, COUNT (comcon_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:220:&SESSION.::NO:RIR,220:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P220_COMECO_ID,P220_COMPED_EJERCICIO,P220_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,&P1_COMPED_EJERCICIO.,PPI'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comcon.ID comcon_id'||unistr('\000a')||
'          FROM com_pedidos comped'||unistr('\000a')||
'              ,com_contrataciones comcon'||unistr('\000a')||
'              ,com_contrataciones_detalles comcot'||unistr('\000a')||
'              ,com_contrataciones_est comcoe       '||unistr('\000a')||
'         WHERE comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comped.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND comped.id = comcot.comped_id'||unistr('\000a')||
'           AND comcot.comcon_id = comcon.id'||unistr('\000a')||
'           AND comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'           AND comcoe.estado = ''ENV'''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
'        SELECT comcon.ID comcon_id'||unistr('\000a')||
'          FROM com_pedidos comped'||unistr('\000a')||
'              ,com_contrataciones comcon'||unistr('\000a')||
'              ,com_contrataciones_detalles comcot'||unistr('\000a')||
'              ,com_contrataciones_est comcoe       '||unistr('\000a')||
'         WHERE comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comped.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND comped.id = comcot.comped_id'||unistr('\000a')||
'           AND comcot.comcon_id = comcon.id'||unistr('\000a')||
'           AND comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'           AND comcoe.estado = ''ENV'''||unistr('\000a')||
'           AND comped.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'                                      FROM com_contratantes_vinc vin'||unistr('\000a')||
'                                     WHERE vin.comeco_id_padre = :P1_COMECO_ID))');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT ''Procesos Acordados '' label, COUNT (comcon_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:220:&SESSION.::NO:RIR,220:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P220_COMECO_ID,P220_COMPED_EJERCICIO,P220_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,&P1_COMPED_EJERCICIO.,PAC'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comcon.ID comcon_id'||unistr('\000a')||
'          FROM co';

s:=s||'m_pedidos comped'||unistr('\000a')||
'              ,com_contrataciones comcon'||unistr('\000a')||
'              ,com_contrataciones_detalles comcot'||unistr('\000a')||
'--              ,com_contrataciones_est comcoe       '||unistr('\000a')||
'         WHERE comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comped.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND comped.id = comcot.comped_id'||unistr('\000a')||
'           AND comcot.comcon_id = comcon.id';

s:=s||''||unistr('\000a')||
'--           AND comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'--           AND comcoe.estado = ''ACR'''||unistr('\000a')||
'           AND comcon.comcoe_estado = ''ACR'''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
'        SELECT comcon.ID comcon_id'||unistr('\000a')||
'          FROM com_pedidos comped'||unistr('\000a')||
'              ,com_contrataciones comcon'||unistr('\000a')||
'              ,com_contrataciones_detalles comcot'||unistr('\000a')||
'--              ,com_contrataciones_est comcoe       '||unistr('\000a')||
'         WHERE comped.segorg_id = :P1_';

s:=s||'SEGORG_ID'||unistr('\000a')||
'           AND comped.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND comped.id = comcot.comped_id'||unistr('\000a')||
'           AND comcot.comcon_id = comcon.id'||unistr('\000a')||
'--           AND comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'--           AND comcoe.estado = ''ACR'''||unistr('\000a')||
'           AND comcon.comcoe_estado = ''ACR'''||unistr('\000a')||
'           AND comped.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'        ';

s:=s||'                              FROM com_contratantes_vinc vin'||unistr('\000a')||
'                                     WHERE vin.comeco_id_padre = :P1_COMECO_ID))';

wwv_flow_api.create_page_plug (
  p_id=> 71301207388594553 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Procesos Acordados ',
  p_region_name=>'',
  p_parent_plug_id=>71299303036404006 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 54,
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
  p_plug_comment=> 'SELECT ''Procesos Acordados '' label, COUNT (comcon_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:220:&SESSION.::NO:RIR,220:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P220_COMECO_ID,P220_COMPED_EJERCICIO,P220_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,&P1_COMPED_EJERCICIO.,PAC'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comcon.ID comcon_id'||unistr('\000a')||
'          FROM com_pedidos comped'||unistr('\000a')||
'              ,com_contrataciones comcon'||unistr('\000a')||
'              ,com_contrataciones_detalles comcot'||unistr('\000a')||
'              ,com_contrataciones_est comcoe       '||unistr('\000a')||
'         WHERE comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comped.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND comped.id = comcot.comped_id'||unistr('\000a')||
'           AND comcot.comcon_id = comcon.id'||unistr('\000a')||
'           AND comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'           AND comcoe.estado = ''ACR'''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
'        SELECT comcon.ID comcon_id'||unistr('\000a')||
'          FROM com_pedidos comped'||unistr('\000a')||
'              ,com_contrataciones comcon'||unistr('\000a')||
'              ,com_contrataciones_detalles comcot'||unistr('\000a')||
'              ,com_contrataciones_est comcoe       '||unistr('\000a')||
'         WHERE comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comped.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND comped.id = comcot.comped_id'||unistr('\000a')||
'           AND comcot.comcon_id = comcon.id'||unistr('\000a')||
'           AND comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'           AND comcoe.estado = ''ACR'''||unistr('\000a')||
'           AND comped.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'                                      FROM com_contratantes_vinc vin'||unistr('\000a')||
'                                     WHERE vin.comeco_id_padre = :P1_COMECO_ID))');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT ''Ordenes con Entregas Pendientes '' label, COUNT (comocm_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:420:&SESSION.::NO:RIR,420:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P420_COMECO_ID,P420_COMPED_EJERCICIO,P420_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,&P1_COMPED_EJERCICIO.,OPE'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comocm.ID comocm_id'||unistr('\000a')||
'    ';

s:=s||'      FROM com_ordenes_compras comocm'||unistr('\000a')||
'--             , com_ordenes_compras_est comoce'||unistr('\000a')||
'             , com_pedidos comped'||unistr('\000a')||
'         WHERE comocm.comped_id = comped.id'||unistr('\000a')||
'--           AND comocm.comoce_id = comoce.ID'||unistr('\000a')||
'--           AND comoce.estado = ''APR'''||unistr('\000a')||
'           AND comocm.comoce_estado = ''APR'''||unistr('\000a')||
'           AND comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comocm.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           ';

s:=s||'AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND comocm_pkg.comocm_ent_pen_sn (p_comocm_id => comocm.ID) = ''SI'''||unistr('\000a')||
''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
''||unistr('\000a')||
'        SELECT comocm.ID comocm_id'||unistr('\000a')||
'          FROM com_ordenes_compras comocm'||unistr('\000a')||
'--             , com_ordenes_compras_est comoce'||unistr('\000a')||
'             , com_pedidos comped'||unistr('\000a')||
'         WHERE comocm.comped_id = comped.id'||unistr('\000a')||
'--           AND comocm.comoce_id = comoce.ID'||unistr('\000a')||
'--       ';

s:=s||'    AND comoce.estado = ''APR'''||unistr('\000a')||
'           AND comocm.comoce_estado = ''APR'''||unistr('\000a')||
'           AND comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND comocm.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'                                      FROM com_contratantes_vinc vin'||unistr('\000a')||
'                                     WHERE vin.comeco_id_padre = :P1_COMECO_ID)'||unistr('\000a')||
'           A';

s:=s||'ND comocm_pkg.comocm_ent_pen_sn (p_comocm_id => comocm.ID) = ''SI'')'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 71301603017602761 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Ordenes con Entregas Pendientes',
  p_region_name=>'',
  p_parent_plug_id=>71299303036404006 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 55,
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
  p_plug_comment=> 'SELECT ''Ordenes con Entregas Pendientes '' label, COUNT (comocm_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:420:&SESSION.::NO:RIR,420:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P420_COMECO_ID,P420_COMPED_EJERCICIO,P420_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,&P1_COMPED_EJERCICIO.,OPE'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comocm.ID comocm_id'||unistr('\000a')||
'          FROM com_ordenes_compras comocm'||unistr('\000a')||
'             , com_ordenes_compras_est comoce'||unistr('\000a')||
'             , com_pedidos comped'||unistr('\000a')||
'         WHERE comocm.comoce_id = comoce.ID'||unistr('\000a')||
'           AND comocm.comped_id = comped.id'||unistr('\000a')||
'           AND comoce.estado = ''APR'''||unistr('\000a')||
'           AND comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comocm.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND comocm_pkg.comocm_ent_pen_sn (p_comocm_id => comocm.ID) = ''SI'''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
'        SELECT comocm.ID comocm_id'||unistr('\000a')||
'          FROM com_ordenes_compras comocm'||unistr('\000a')||
'             , com_ordenes_compras_est comoce'||unistr('\000a')||
'             , com_pedidos comped'||unistr('\000a')||
'         WHERE comocm.comoce_id = comoce.ID'||unistr('\000a')||
'           AND comocm.comped_id = comped.id'||unistr('\000a')||
'           AND comoce.estado = ''APR'''||unistr('\000a')||
'           AND comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND comocm.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'                                      FROM com_contratantes_vinc vin'||unistr('\000a')||
'                                     WHERE vin.comeco_id_padre = :P1_COMECO_ID)'||unistr('\000a')||
'           AND comocm_pkg.comocm_ent_pen_sn (p_comocm_id => comocm.ID) = ''SI'')'||unistr('\000a')||
'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT ''Calificación para Revisar '' label, COUNT (comocm_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:420:&SESSION.::NO:RIR,420:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P420_COMECO_ID,P420_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,CPR'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comocm.ID comocm_id'||unistr('\000a')||
'          FROM com_ordenes_compras comocm,'||unistr('\000a')||
'--         ';

s:=s||'      com_ordenes_compras_est comoce,'||unistr('\000a')||
'               com_calificaciones comclf,'||unistr('\000a')||
'               com_replicas comrep'||unistr('\000a')||
'         WHERE comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'--           AND comocm.comoce_id = comoce.ID'||unistr('\000a')||
'           AND comocm.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comclf.comocm_id = comocm.ID'||unistr('\000a')||
'           AND comclf.ID = comocm_pkg.comocm_obtn_clf (p_comocm_id=> comocm.ID)'||unistr('\000a')||
'           AND comr';

s:=s||'ep.comclf_id = comclf.ID'||unistr('\000a')||
'           AND comrep.comocm_id = comocm.ID'||unistr('\000a')||
'           AND comrep.estado IN (''PRE'', ''REP'')'||unistr('\000a')||
'           AND comocm.comoce_estado IN (''CON'', ''NOC'')'||unistr('\000a')||
'           AND comocm.comoce_fecha > (SYSDATE - 365)'||unistr('\000a')||
'           AND comocm_pkg.comocm_replica_est (comocm.ID) = ''PARA REVISAR POR EL PROVEEDOR'''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
'        SELECT comocm.ID comocm_id'||unistr('\000a')||
'          FROM com_ordenes_compra';

s:=s||'s comocm'||unistr('\000a')||
'--             , com_ordenes_compras_est comoce'||unistr('\000a')||
'             , com_calificaciones comclf'||unistr('\000a')||
'             , com_replicas comrep'||unistr('\000a')||
'         WHERE comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comocm.comoce_estado = ''APR'''||unistr('\000a')||
'--           AND comocm.comoce_id = comoce.ID'||unistr('\000a')||
'           AND comocm.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'                                      FROM com_contratantes_vinc vi';

s:=s||'n'||unistr('\000a')||
'                                     WHERE vin.comeco_id_padre = :P1_COMECO_ID)'||unistr('\000a')||
'           AND comclf.comocm_id = comocm.ID'||unistr('\000a')||
'           AND comclf.ID = comocm_pkg.comocm_obtn_clf (p_comocm_id => comocm.ID)'||unistr('\000a')||
'           AND comrep.comclf_id = comclf.ID'||unistr('\000a')||
'           AND comrep.comocm_id = comocm.ID'||unistr('\000a')||
'           AND comrep.estado IN (''PRE'', ''REP'')'||unistr('\000a')||
'           AND comocm.comoce_estado IN (''CON'', ''NOC'')'||unistr('\000a')||
'    ';

s:=s||'       AND comocm.comoce_fecha > (SYSDATE - 365)'||unistr('\000a')||
'           AND comocm_pkg.comocm_replica_est (comocm.ID) = ''PARA REVISAR POR EL PROVEEDOR'')';

wwv_flow_api.create_page_plug (
  p_id=> 71301922326627251 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Calificación para Revisar ',
  p_region_name=>'',
  p_parent_plug_id=>71299303036404006 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 56,
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
s:=s||'SELECT ''Ordenes con Entregas Vencidas '' label, COUNT (comocm_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:420:&SESSION.::NO:RIR,420:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P420_COMECO_ID,P420_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,OEV'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comocm.ID comocm_id'||unistr('\000a')||
'          FROM com_ordenes_compras comocm'||unistr('\000a')||
'--      ';

s:=s||'       , com_ordenes_compras_est comoce'||unistr('\000a')||
'         WHERE comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'--           AND comocm.comoce_id = comoce.ID'||unistr('\000a')||
'--           AND comoce.estado = ''APR'''||unistr('\000a')||
'           AND comocm.comoce_estado = ''APR'''||unistr('\000a')||
'           AND comocm.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comocm_pkg.comocm_ent_venc_sn (p_comocm_id => comocm.ID) = ''SI'''||unistr('\000a')||
''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
''||unistr('\000a')||
'        SELECT comocm.ID comocm_id'||unistr('\000a')||
' ';

s:=s||'         FROM com_ordenes_compras comocm'||unistr('\000a')||
'--             , com_ordenes_compras_est comoce'||unistr('\000a')||
'         WHERE comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'--           AND comoce.estado = ''APR'''||unistr('\000a')||
'--           AND comocm.comoce_id = comoce.ID'||unistr('\000a')||
'           AND comocm.comoce_estado = ''APR'''||unistr('\000a')||
'           AND comocm.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'                                      FROM com_contratantes_vinc vin'||unistr('\000a')||
'   ';

s:=s||'                                  WHERE vin.comeco_id_padre = :P1_COMECO_ID)'||unistr('\000a')||
'           AND comocm_pkg.comocm_ent_venc_sn (p_comocm_id => comocm.ID) = ''SI'')'||unistr('\000a')||
''||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 71302206527632145 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Ordenes con Entregas Vencidas',
  p_region_name=>'',
  p_parent_plug_id=>71299303036404006 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 57,
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
  p_plug_comment=> 'SELECT ''Ordenes con Entregas Vencidas '' label, COUNT (comocm_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:420:&SESSION.::NO:RIR,420:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P420_COMECO_ID,P420_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,OEV'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comocm.ID comocm_id'||unistr('\000a')||
'          FROM com_ordenes_compras comocm, com_ordenes_compras_est comoce'||unistr('\000a')||
'         WHERE comocm.comoce_id = comoce.ID'||unistr('\000a')||
'           AND comoce.estado = ''APR'''||unistr('\000a')||
'           AND comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comocm.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comocm_pkg.comocm_ent_venc_sn (p_comocm_id => comocm.ID) = ''SI'''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
'        SELECT comocm.ID comocm_id'||unistr('\000a')||
'          FROM com_ordenes_compras comocm, com_ordenes_compras_est comoce'||unistr('\000a')||
'         WHERE comocm.comoce_id = comoce.ID'||unistr('\000a')||
'           AND comoce.estado = ''APR'''||unistr('\000a')||
'           AND comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comocm.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'                                      FROM com_contratantes_vinc vin'||unistr('\000a')||
'                                     WHERE vin.comeco_id_padre = :P1_COMECO_ID)'||unistr('\000a')||
'           AND comocm_pkg.comocm_ent_venc_sn (p_comocm_id => comocm.ID) = ''SI'')'||unistr('\000a')||
'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT ''Ordenes con Entregas para Autorizar '' label, COUNT (comocm_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:420:&SESSION.::NO:RIR,420:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P420_COMECO_ID,P420_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,OER'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comocm.ID comocm_id'||unistr('\000a')||
'          FROM com_ordenes_compras comocm'||unistr('\000a')||
'--';

s:=s||'             , com_ordenes_compras_est comoce'||unistr('\000a')||
'         WHERE comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comocm.comoce_estado = ''APR'''||unistr('\000a')||
'--           AND comoce.estado = ''APR'''||unistr('\000a')||
'--           AND comocm.comoce_id = comoce.ID'||unistr('\000a')||
'           AND comocm.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comocm_pkg.comocm_ent_aut_sn (p_comocm_id => comocm.ID) = ''SI'''||unistr('\000a')||
''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
''||unistr('\000a')||
'        SELECT comocm.ID comocm';

s:=s||'_id'||unistr('\000a')||
'          FROM com_ordenes_compras comocm'||unistr('\000a')||
'--             , com_ordenes_compras_est comoce'||unistr('\000a')||
'         WHERE comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'--           AND comoce.estado = ''APR'''||unistr('\000a')||
'           AND comocm.comoce_estado = ''APR'''||unistr('\000a')||
'--           AND comocm.comoce_id = comoce.ID'||unistr('\000a')||
'           AND comocm.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'                                      FROM com_contratantes_vinc vi';

s:=s||'n'||unistr('\000a')||
'                                     WHERE vin.comeco_id_padre = :P1_COMECO_ID)'||unistr('\000a')||
'           AND comocm_pkg.comocm_ent_aut_sn (p_comocm_id => comocm.ID) = ''SI'')'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 71302522457636759 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Ordenes con Entregas para Autorizar',
  p_region_name=>'',
  p_parent_plug_id=>71299303036404006 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 58,
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
  p_plug_comment=> 'SELECT ''Ordenes con Entregas para Autorizar '' label, COUNT (comocm_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:420:&SESSION.::NO:RIR,420:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P420_COMECO_ID,P420_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,OER'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comocm.ID comocm_id'||unistr('\000a')||
'          FROM com_ordenes_compras comocm'||unistr('\000a')||
'             , com_ordenes_compras_est comoce'||unistr('\000a')||
'         WHERE comocm.comoce_id = comoce.ID'||unistr('\000a')||
'           AND comoce.estado = ''APR'''||unistr('\000a')||
'           AND comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comocm.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comocm_pkg.comocm_ent_aut_sn (p_comocm_id => comocm.ID) = ''SI'''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
'        SELECT comocm.ID comocm_id'||unistr('\000a')||
'          FROM com_ordenes_compras comocm'||unistr('\000a')||
'             , com_ordenes_compras_est comoce'||unistr('\000a')||
'         WHERE comocm.comoce_id = comoce.ID'||unistr('\000a')||
'           AND comoce.estado = ''APR'''||unistr('\000a')||
'           AND comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comocm.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'                                      FROM com_contratantes_vinc vin'||unistr('\000a')||
'                                     WHERE vin.comeco_id_padre = :P1_COMECO_ID)'||unistr('\000a')||
'           AND comocm_pkg.comocm_ent_aut_sn (p_comocm_id => comocm.ID) = ''SI'')'||unistr('\000a')||
'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT ''Ordenes Vencidas a Calificar '' label, COUNT (comocm_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:420:&SESSION.::NO:RIR,420:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P420_COMECO_ID,P420_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,OVC'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comocm.ID comocm_id'||unistr('\000a')||
'          FROM com_ordenes_compras comocm'||unistr('\000a')||
'--       ';

s:=s||'      , com_ordenes_compras_est comoce'||unistr('\000a')||
'         WHERE comocm.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'--           AND comocm.comoce_id = comoce.ID'||unistr('\000a')||
'           AND comocm.comoce_estado = ''APR'''||unistr('\000a')||
'           AND comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comocm_pkg.comocm_vencida_sn (p_segorg_id      => :P1_SEGORG_ID,'||unistr('\000a')||
'                                             p_comocm_id      => comocm.ID'||unistr('\000a')||
'                    ';

s:=s||'                        ) = ''SI'')';

wwv_flow_api.create_page_plug (
  p_id=> 71302821895646068 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Ordenes Vencidas a Calificar',
  p_region_name=>'',
  p_parent_plug_id=>71299303036404006 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 59,
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
  p_plug_comment=> 'SELECT ''Ordenes Vencidas a Calificar '' label, COUNT (comocm_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:420:&SESSION.::NO:RIR,420:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P420_COMECO_ID,P420_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,OVC'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comocm.ID comocm_id'||unistr('\000a')||
'          FROM com_ordenes_compras comocm'||unistr('\000a')||
'             , com_ordenes_compras_est comoce'||unistr('\000a')||
'         WHERE comocm.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comocm.comoce_id = comoce.ID'||unistr('\000a')||
'           AND comoce.estado = ''APR'''||unistr('\000a')||
'           AND comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comocm_pkg.comocm_vencida_sn (p_segorg_id      => :P1_SEGORG_ID,'||unistr('\000a')||
'                                             p_comocm_id      => comocm.ID'||unistr('\000a')||
'                                            ) = ''SI'')');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT ''Trámites Proveedores para Atender '' label, COUNT (comtpr_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMPRV:210:&SESSION.::NO:RIR,210:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P210_COMECO_ID,P210_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,&P1_COMECO_ID.,TPE'' url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (select comtpr.id comtpr_id'||unistr('\000a')||
'from com_tramites_prv comtpr'||unistr('\000a')||
'   , com_tramites_prv_rgp comtpg'||unistr('\000a')||
'where comtpg.comtpr_id = comtpr.id'||unistr('\000a')||
'and com';

s:=s||'tpg.comrgp_id = (select max(comrgp_id)'||unistr('\000a')||
'    from com_contratantes_rgp'||unistr('\000a')||
'    where comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'      and validez_fch is null) '||unistr('\000a')||
'and comtpr.situacion <> ''NUE'''||unistr('\000a')||
'and comtpr.comprv_id is null'||unistr('\000a')||
'and comtpr.situacion in (''PEN'',''REC'',''CUR'')'||unistr('\000a')||
'union all'||unistr('\000a')||
'select comtpr.id comtpr_id'||unistr('\000a')||
'from com_tramites_prv comtpr'||unistr('\000a')||
'   , com_proveedores_rgp comprg '||unistr('\000a')||
'where comprg.comprv_id = comtpr.comprv_id'||unistr('\000a')||
'and comprg.comrgp_i';

s:=s||'d = (select max(comrgp_id)'||unistr('\000a')||
'    from com_contratantes_rgp'||unistr('\000a')||
'    where comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'      and validez_fch is null) '||unistr('\000a')||
'and comprg.validez_fch is null'||unistr('\000a')||
'and comprg.situacion <> ''BAJ'''||unistr('\000a')||
'and comtpr.situacion <> ''NUE'''||unistr('\000a')||
'and comtpr.comprv_id is not null'||unistr('\000a')||
'and comtpr.situacion in (''PEN'',''REC'',''CUR'')) comtpr';

wwv_flow_api.create_page_plug (
  p_id=> 77087923035453985 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Trámites para Atender',
  p_region_name=>'',
  p_parent_plug_id=>71299303036404006 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 41,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
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
  p_plug_required_role => 76028231631522937+ wwv_flow_api.g_id_offset,
  p_plug_display_condition_type => 'EXISTS',
  p_plug_display_when_condition => 'select 1'||unistr('\000a')||
'from   COM_CONTRATANTES comeco'||unistr('\000a')||
'where  comeco.ID = :P1_COMECO_ID'||unistr('\000a')||
'and    comeco.REGISTROPRV_SN = ''SI''',
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
s:=s||'SELECT ''Proveedores Habilitados en el Registro '' label, COUNT (comprv_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMPRV:200:&SESSION.::NO:RIR,200:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P200_COMECO_ID,P200_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,&P1_COMECO_ID.,PAC'' url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (select comprv.id comprv_id'||unistr('\000a')||
'        from com_proveedores comprv'||unistr('\000a')||
'           , com_proveedores_est compre'||unistr('\000a')||
'           , com_regist';

s:=s||'ros_prv comrgp'||unistr('\000a')||
'           , com_proveedores_rgp comprg'||unistr('\000a')||
'where comprv.id = compre.comprv_id'||unistr('\000a')||
'  and compre.id = com_pkg.obtn_compre_id (comprv.id)'||unistr('\000a')||
'  and comprg.comprv_id = comprv.id'||unistr('\000a')||
'  and comprg.comrgp_id = comrgp.id'||unistr('\000a')||
'  and comprg.validez_fch is null'||unistr('\000a')||
'  and comrgp.id = (select max(comrgp_id)'||unistr('\000a')||
'    from com_contratantes_rgp'||unistr('\000a')||
'    where comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'      and validez_fch is null)'||unistr('\000a')||
'  and (compre.es';

s:=s||'tado not in (''BAJ'',''SUS'') and comprg.situacion = ''VIG'')'||unistr('\000a')||
' ) comprv';

wwv_flow_api.create_page_plug (
  p_id=> 77105107657714540 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Proveedores Activos',
  p_region_name=>'',
  p_parent_plug_id=>71299303036404006 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 42,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
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
  p_plug_required_role => 76028401642552000+ wwv_flow_api.g_id_offset,
  p_plug_display_condition_type => 'EXISTS',
  p_plug_display_when_condition => 'select 1'||unistr('\000a')||
'from   COM_CONTRATANTES comeco'||unistr('\000a')||
'where  comeco.ID = :P1_COMECO_ID'||unistr('\000a')||
'and    comeco.REGISTROPRV_SN = ''SI''',
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
s:=s||'SELECT ''Proveedores Suspendidos en el Registro '' label, COUNT (comprv_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMPRV:200:&SESSION.::NO:RIR,200:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P200_COMECO_ID,P200_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,&P1_COMECO_ID.,PSU'' url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (select comprv.id comprv_id'||unistr('\000a')||
'        from com_proveedores comprv'||unistr('\000a')||
'           , com_proveedores_est compre'||unistr('\000a')||
'           , com_regist';

s:=s||'ros_prv comrgp'||unistr('\000a')||
'           , com_proveedores_rgp comprg'||unistr('\000a')||
'where comprv.id = compre.comprv_id'||unistr('\000a')||
'  and compre.id = com_pkg.obtn_compre_id (comprv.id)'||unistr('\000a')||
'  and comprg.comprv_id = comprv.id'||unistr('\000a')||
'  and comprg.comrgp_id = comrgp.id'||unistr('\000a')||
'  and comprg.validez_fch is null'||unistr('\000a')||
'  and comrgp.id = (select max(comrgp_id)'||unistr('\000a')||
'    from com_contratantes_rgp'||unistr('\000a')||
'    where comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'      and validez_fch is null)'||unistr('\000a')||
'  and (compre.es';

s:=s||'tado = ''SUS'' or comprg.situacion = ''SUS'')'||unistr('\000a')||
' ) comprv';

wwv_flow_api.create_page_plug (
  p_id=> 77109713638772982 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Proveedores Suspendidos',
  p_region_name=>'',
  p_parent_plug_id=>71299303036404006 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 43,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
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
  p_plug_required_role => 76028401642552000+ wwv_flow_api.g_id_offset,
  p_plug_display_condition_type => 'EXISTS',
  p_plug_display_when_condition => 'select 1'||unistr('\000a')||
'from   COM_CONTRATANTES comeco'||unistr('\000a')||
'where  comeco.ID = :P1_COMECO_ID'||unistr('\000a')||
'and    comeco.REGISTROPRV_SN = ''SI''',
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
s:=s||'SELECT ''Pedidos Pendientes de Autorización '' label, COUNT (comped_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:220:&SESSION.::NO:RIR,220:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P220_COMECO_ID,P220_COMPED_EJERCICIO,P220_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,&P1_COMPED_EJERCICIO.,PAU'' url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comped.ID comped_id'||unistr('\000a')||
'          FROM com_pedidos comped'||unistr('\000a')||
'--             , com_pedidos_est compee'||unistr('\000a')||
' ';

s:=s||'        WHERE comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'--           AND comped.compee_id = compee.ID'||unistr('\000a')||
'           AND comped.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'--           AND compee.estado = ''PAU'''||unistr('\000a')||
'           AND comped.compee_estado = ''PAU'''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
'        SELECT comped.ID comped_id'||unistr('\000a')||
'          FROM com_pedidos comped'||unistr('\000a')||
'--             , com_pedidos_est c';

s:=s||'ompee'||unistr('\000a')||
'         WHERE comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'--           AND comped.compee_id = compee.ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'--           AND compee.estado = ''PAU'''||unistr('\000a')||
'           AND comped.compee_estado = ''PAU'''||unistr('\000a')||
'           AND comped.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'                                      FROM com_contratantes_vinc vin'||unistr('\000a')||
'                               ';

s:=s||'      WHERE vin.comeco_id_padre =  :P1_COMECO_ID'||unistr('\000a')||
'         ))';

wwv_flow_api.create_page_plug (
  p_id=> 170443848259653166 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Pedidos Pendientes de Autorización',
  p_region_name=>'',
  p_parent_plug_id=>71299303036404006 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 51,
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
  p_plug_comment=> 'SELECT ''Pedidos Pendientes de Autorización '' label, COUNT (comped_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:220:&SESSION.::NO:RIR,220:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P220_COMECO_ID,P220_COMPED_EJERCICIO,P220_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,&P1_COMPED_EJERCICIO.,PAU'' url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comped.ID comped_id'||unistr('\000a')||
'          FROM com_pedidos comped,'||unistr('\000a')||
'               com_pedidos_est compee'||unistr('\000a')||
'         WHERE comped.compee_id = compee.ID'||unistr('\000a')||
'           AND comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comped.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND compee.estado = ''PAU'''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
'        SELECT comped.ID comped_id'||unistr('\000a')||
'          FROM com_pedidos comped,'||unistr('\000a')||
'               com_pedidos_est compee'||unistr('\000a')||
'         WHERE comped.compee_id = compee.ID'||unistr('\000a')||
'           AND comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND compee.estado = ''PAU'''||unistr('\000a')||
'           AND comped.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'                                      FROM com_contratantes_vinc vin'||unistr('\000a')||
'                                     WHERE vin.comeco_id_padre = :P1_COMECO_ID))');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'htp.print(''Los valores obtenidos por los indicadores son SOLO del Ejercicio seleecionado.'');';

wwv_flow_api.create_page_plug (
  p_id=> 72216009611200142 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Cambiar Ejercicio',
  p_region_name=>'Cambiar_Ejercicio',
  p_region_attributes=> 'title="Cambiar Ejercicio de los Indicadores"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186458876129809941+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 160,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 118767524678855106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Entidad Contratante',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186458876129809941+ wwv_flow_api.g_id_offset,
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
  p_id=> 124746523625941655 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Alertas',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186454190715809938+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 130,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_ALERT',
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 170433750254322638 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Menú Entidades Contratantes',
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
  p_plug_source_type=> 170432336402318578 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 186465093776809944+ wwv_flow_api.g_id_offset,
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
  p_id=> 171381040818210286 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Video Introducción',
  p_region_name=>'dialog-video',
  p_region_attributes=> 'title="Video Introducción"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186458876129809941+ wwv_flow_api.g_id_offset,
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
  p_id=> 209458474502883294 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Noticias',
  p_region_name=>'',
  p_region_attributes=> 'style="min-height:40px;"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186458876129809941+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
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
  p_id=> 210248580446035514 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Todas las Noticias',
  p_region_name=>'dialog-modal',
  p_region_attributes=> 'title="Todas las Noticias"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186458876129809941+ wwv_flow_api.g_id_offset,
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
  p_id=> 475655303046828944 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Accesos',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186459500426809941+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 150,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 475655006032820311 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 186467491855809945+ wwv_flow_api.g_id_offset,
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
 
wwv_flow_api.create_page_button(
  p_id             => 72215823332194645 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1,
  p_button_sequence=> 10,
  p_button_plug_id => 71299303036404006+wwv_flow_api.g_id_offset,
  p_button_name    => 'CAMBIAR_EJERCICIO',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => '#IMAGE_PREFIX#asfdcldr.gif',
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Cambiar Ejercicio',
  p_button_position=> 'RIGHT_OF_TITLE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:cambiar_ejercicio();',
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
  p_id=>63273912824240329 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_COMECO_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 250,
  p_item_plug_id => 118767524678855106+wwv_flow_api.g_id_offset,
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
  p_id=>72182431452714731 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_COMPED_EJERCICIO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 260,
  p_item_plug_id => 72216009611200142+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Ejercicio activo : ',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select EJERCICIO d, EJERCICIO r'||unistr('\000a')||
'from   COM_EJERCICIOS_V'||unistr('\000a')||
'order by 1 DESC',
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
  p_field_template=> 186468899752809946+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'REDIRECT_SET_VALUE',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>124747222370955974 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_HABILITADO_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 240,
  p_item_plug_id => 124746523625941655+wwv_flow_api.g_id_offset,
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
  p_id=>171402232636639906 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_VIDEO_IFRAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 230,
  p_item_plug_id => 475655303046828944+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '<iframe width="670" height="430" src="//www.youtube.com/embed/YArO_LqW2Sk" frameborder="0" allowfullscreen id="clearmySound"></iframe>',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'<iframe width="670" height="430" src="//www.youtube.com/embed/YArO_LqW2Sk" frameborder="0" allowfullscreen id="clearmySound"></iframe>',
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
  p_attribute_01 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>201030359077071917 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_COMECO_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 210,
  p_item_plug_id => 118767524678855106+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Entidad Contratante:',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select NOMBRE d'||unistr('\000a')||
'     --NOMBRE||'' - CODIGO: ''||to_char(CODIGO) d'||unistr('\000a')||
'     , ID r'||unistr('\000a')||
'  from COM_CONTRATANTES'||unistr('\000a')||
' where SEGORG_ID = :P1_SEGORG_ID'||unistr('\000a')||
'   and ID = :P1_COMECO_ID',
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
  p_field_template=> 186468899752809946+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
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
  p_id=>203934576998750313 + wwv_flow_api.g_id_offset,
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
  p_id=>209458985237886395 + wwv_flow_api.g_id_offset,
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
  p_id=>209459159742888481 + wwv_flow_api.g_id_offset,
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
  p_id=>386976556468391566 + wwv_flow_api.g_id_offset,
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
  p_id=>475650322468711553 + wwv_flow_api.g_id_offset,
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
  p_id=>475650495240713144 + wwv_flow_api.g_id_offset,
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
  p_id=>475650699742714380 + wwv_flow_api.g_id_offset,
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
  p_id=>497705236408002423 + wwv_flow_api.g_id_offset,
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
  p_id=>497705447836005653 + wwv_flow_api.g_id_offset,
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
  p_id=>497705623379008070 + wwv_flow_api.g_id_offset,
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
  p_id=>497717130500549475 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGUSU_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 475655303046828944+wwv_flow_api.g_id_offset,
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
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>497718316741602317 + wwv_flow_api.g_id_offset,
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
  p_id=>497718522629603937 + wwv_flow_api.g_id_offset,
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
  p_id=>497718726092604987 + wwv_flow_api.g_id_offset,
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
  p_id=>497718929901606068 + wwv_flow_api.g_id_offset,
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
  p_id=>519759627242760123 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGORG_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 475655303046828944+wwv_flow_api.g_id_offset,
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
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>519759832090761606 + wwv_flow_api.g_id_offset,
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
  p_id=>519760037977763231 + wwv_flow_api.g_id_offset,
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
p:=p||'341092727939678388';

wwv_flow_api.create_page_process(
  p_id     => 200061045326296058 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'InicializarOrganizaciónPorDefault',
  p_process_sql_clob => 341092727939678388 + wwv_flow_api.g_id_offset,
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
p:=p||'200053147563183103';

wwv_flow_api.create_page_process(
  p_id     => 200061253291298300 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 20,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'InicializarTemaPorDefault',
  p_process_sql_clob => 200053147563183103 + wwv_flow_api.g_id_offset,
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
p:=p||'519760722571796692';

wwv_flow_api.create_page_process(
  p_id     => 200061462295300935 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 30,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'CargarDatosOrganizacion',
  p_process_sql_clob => 519760722571796692 + wwv_flow_api.g_id_offset,
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
  p_id     => 200359061915342706 + wwv_flow_api.g_id_offset,
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
'  cursor cr_comcnr is'||unistr('\000a')||
'  select comeco_id'||unistr('\000a')||
'  from COM_CONTRATANTES_RES'||unistr('\000a')||
'  where segusu_id = :P1_SEGUSU_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_dummy number; '||unistr('\000a')||
'  --   '||unistr('\000a')||
'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
'  open cr_comcnr;'||unistr('\000a')||
'  fetch cr_comcnr into :P1_COMECO_ID;'||unistr('\000a')||
'  close cr_comcnr;'||unistr('\000a')||
'  --'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 201030963017082460 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 50,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ObtenerIdEntidadContratante',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P1_COMECO_ID',
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
p:=p||'63304007524640245';

wwv_flow_api.create_page_process(
  p_id     => 77453519559689976 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 100,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'Cambiar Entidad Contratante',
  p_process_sql_clob => 63304007524640245 + wwv_flow_api.g_id_offset,
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
p:=p||'209457879565875335';

wwv_flow_api.create_page_process(
  p_id     => 209470259930002088 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 110,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'ObtenerNoticias',
  p_process_sql_clob => 209457879565875335 + wwv_flow_api.g_id_offset,
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
p:=p||':P1_HABILITADO_SN := ''SI'';';

wwv_flow_api.create_page_process(
  p_id     => 124747320077959580 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 120,
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
p:=p||'declare '||unistr('\000a')||
'  cursor cr_comejr is'||unistr('\000a')||
'   select MIN(EJERCICIO)  EJERCICIO'||unistr('\000a')||
'     from   COM_EJERCICIOS_V'||unistr('\000a')||
'    where  SITUACION = ''ABI'';'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_comejr cr_comejr%rowtype;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'   open cr_comejr;'||unistr('\000a')||
'   fetch cr_comejr into v_comejr;'||unistr('\000a')||
'   close cr_comejr;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   :P1_COMPED_EJERCICIO := nvl(v_comejr.EJERCICIO,2015); '||unistr('\000a')||
'   --'||unistr('\000a')||
'  '||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 72203003172933390 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 999,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Obtener Datos Generales',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P1_COMPED_EJERCICIO',
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
