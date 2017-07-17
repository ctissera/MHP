set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end;
/
 
 
--application/set_environment
prompt  APPLICATION 2101 - Compras - Administración
--
-- Application Export:
--   Application:     2101
--   Name:            Compras - Administración
--   Date and Time:   12:26 Lunes Diciembre 19, 2016
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
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,2101);
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
 
end;
/

PROMPT ...Remove page 290
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>290);
 
end;
/

 
--application/pages/page_00290
prompt  ...PAGE 290: Indice Tutoriales
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 290
 ,p_user_interface_id => 70527406842675 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'ADMINISTRACION'
 ,p_name => 'Indice Tutoriales'
 ,p_alias => 'PRVTUT'
 ,p_step_title => 'Indice Tutoriales'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Indice Tutoriales'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
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
'function estadoProveedor() {'||unistr('\000a')||
'    $("#estadoProveedores").dialog({'||unistr('\000a')||
'         width:  800'||unistr('\000a')||
'        ,height: 300'||unistr('\000a')||
'        ,modal: true'||unistr('\000a')||
'        ,title: ''Detalle de Estados de Expedientes'''||unistr('\000a')||
'    })'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'/* -------------------- Video Introducción ------------------*/'||unistr('\000a')||
''||unistr('\000a')||
'function abrir_video( video_id , titulo) {'||unistr('\000a')||
''||unistr('\000a')||
'   $("#P290_VIDEO_IFRAME").val(''<iframe width="670" height="430" src="//www.youtube.com/embed/''+vide'||
'o_id+''" frameborder="0" allowfullscreen id="clearmySound"></iframe>'');'||unistr('\000a')||
''||unistr('\000a')||
'   $("#dialog-video").prop(''title'', "Video tutorial - " + titulo);'||unistr('\000a')||
''||unistr('\000a')||
' $( "#dialog-video" ).html($("#P290_VIDEO_IFRAME").val());'||unistr('\000a')||
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
'        border-bottom: 1px solid black;'||unistr('\000a')||
'        border-top: 0px none black;'||unistr('\000a')||
'		border-left: 0px none black;'||unistr('\000a')||
'		border-right: 0px none black;'||unistr('\000a')||
'		border-collapse: collapse;'||unistr('\000a')||
'      }'||unistr('\000a')||
''
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'LPULIDO'
 ,p_last_upd_yyyymmddhh24miss => '20161216100215'
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
  p_id=> 35640719871881479 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 290,
  p_plug_name=> 'Ruta de Navegación',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142026170261227095+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(39997262003400368 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 142040566869227118+ wwv_flow_api.g_id_offset,
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
s:=s||'<table id="estados">'||unistr('\000a')||
'  <tr class="cabecera">'||unistr('\000a')||
'    <th>Estado</th>'||unistr('\000a')||
'    <th>Explicacion del Estado</th>      '||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr class="fila">'||unistr('\000a')||
'    <td>ABIERTO</td>'||unistr('\000a')||
'    <td>Procesos disponibles para cotizar (Periodo de cotización: Fechas que van desde el Inicio y hasta el Fin de la Propuesta)'||unistr('\000a')||
'    </td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr class="fila">'||unistr('\000a')||
'    <td>EN ACLARACION</td>'||unistr('\000a')||
'    <td>Procesos que están en el Período de Aclara';

s:=s||'ción (Fechas que van desde el Fin de la Propuesta y hasta el Fin de la Aclaración), mayormente para Licitaciones.'||unistr('\000a')||
'    </td>'||unistr('\000a')||
'  </tr>    '||unistr('\000a')||
'  <tr class="fila">'||unistr('\000a')||
'    <td>CERRADO</td>'||unistr('\000a')||
'    <td>Los procesos en los que no realizo cotización lo visualizará en el estado CERRADO desde el cierre de la cotización hasta el final del mismo</td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr class="fila">'||unistr('\000a')||
'    <td>EN EVALUACION</td>'||unistr('\000a')||
'    <td>Los pro';

s:=s||'cesos que están en el periodo de evaluación una vez finalizado el Período de Cotización. (Fechas que van desde el Inicio y hasta el Fin de la Propuesta). Visualizará los procesos si realizó alguna oferta'||unistr('\000a')||
'    </td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr class="fila">'||unistr('\000a')||
'    <td>EVALUADO</td>'||unistr('\000a')||
'    <td>Los procesos en el estado EVALUADO.  Visualizará los procesos si realizó alguna oferta</td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr class="fila">'||unistr('\000a')||
'    <td>';

s:=s||'ANALISIS DE OFERTA</td>'||unistr('\000a')||
'    <td>Los procesos en el estado ANALISIS DE OFERTA cuando este analizando la pre adjudicación la UE o la Administración (Compras)</td>'||unistr('\000a')||
'  </tr>    '||unistr('\000a')||
'<tr class="fila">'||unistr('\000a')||
'  	<td>ADJUDICADO C/ORDEN</td>'||unistr('\000a')||
'    <td>Los procesos en los que Ud. realizó alguna cotización y fue adjudicado</td>'||unistr('\000a')||
'  </tr>    '||unistr('\000a')||
'  <tr class="fila">'||unistr('\000a')||
'    <td>NO ADJUDICADO</td>'||unistr('\000a')||
'    <td>Los procesos en los cuales ';

s:=s||'Ud. realizó alguna oferta y  no fueron adjudicados aningún oferente que cotizó indicando el motivo correspondiente </td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr class="fila">'||unistr('\000a')||
'    <td>FINALIZADO S/ORDEN</td>'||unistr('\000a')||
'    <td>Los procesos en los cuales Ud. no realizó cotización</td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr class="fila">'||unistr('\000a')||
'    <td>ANULADO</td>'||unistr('\000a')||
'    <td>Los procesos anulados por la Administración indicando el motivo correspondiente</td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <';

s:=s||'tr class="fila">'||unistr('\000a')||
'    <td>DESIERTO</td>'||unistr('\000a')||
'    <td>Los procesos en los que no se registró cotización de ningún oferente</td>'||unistr('\000a')||
'  </tr>    '||unistr('\000a')||
'</table>';

wwv_flow_api.create_page_plug (
  p_id=> 38260624113045701 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 290,
  p_plug_name=> '<br>',
  p_region_name=>'estadoProveedores',
  p_region_attributes=> 'style="display:none;"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142030053339227099+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 60,
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 365751629759279609 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 290,
  p_plug_name=> 'Frame_03',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 10,
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
  p_plug_display_condition_type => 'NEVER',
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
s:=s||'26753727047786629';

wwv_flow_api.create_page_plug (
  p_id=> 35639912294881476 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 290,
  p_plug_name=> 'Proceso de Contratación',
  p_region_name=>'',
  p_parent_plug_id=>365751629759279609 + wwv_flow_api.g_id_offset,
  p_region_attributes=> 'style="width:450px;"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142030053339227099+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> 2,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 35645918178928581 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 142037578156227112+ wwv_flow_api.g_id_offset,
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
  p_id=> 35640116390881478 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 290,
  p_plug_name=> 'Mi Registro',
  p_region_name=>'',
  p_parent_plug_id=>365751629759279609 + wwv_flow_api.g_id_offset,
  p_region_attributes=> 'style="width:450px;"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142030053339227099+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 35648303202943170 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 142037578156227112+ wwv_flow_api.g_id_offset,
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
  p_id=> 35640301812881478 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 290,
  p_plug_name=> 'Ordenes de Provisión',
  p_region_name=>'',
  p_parent_plug_id=>365751629759279609 + wwv_flow_api.g_id_offset,
  p_region_attributes=> 'style="width:450px;"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142030053339227099+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 50,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 35652005065953209 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 142037578156227112+ wwv_flow_api.g_id_offset,
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
  p_id=> 43057124137292575 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 290,
  p_plug_name=> 'Cotizaciones',
  p_region_name=>'',
  p_parent_plug_id=>365751629759279609 + wwv_flow_api.g_id_offset,
  p_region_attributes=> 'style="width:450px;"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142030053339227099+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 55,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 43058215264299423 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 142037578156227112+ wwv_flow_api.g_id_offset,
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
  p_id=> 365753931537308526 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 290,
  p_plug_name=> 'Frame_01',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
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
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
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
  p_id=> 365758313024416631 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 290,
  p_plug_name=> 'Menú Principal',
  p_region_name=>'',
  p_parent_plug_id=>365753931537308526 + wwv_flow_api.g_id_offset,
  p_region_attributes=> 'style="width:450px;"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142030053339227099+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 365757814624407695 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 142037578156227112+ wwv_flow_api.g_id_offset,
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
  p_id=> 365790218293023387 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 290,
  p_plug_name=> 'Procesos de Compras Proveedores',
  p_region_name=>'',
  p_parent_plug_id=>365753931537308526 + wwv_flow_api.g_id_offset,
  p_region_attributes=> 'width:450px;',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142030053339227099+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 40,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 365789621625014981 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 142037578156227112+ wwv_flow_api.g_id_offset,
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
  p_id=> 365808226070262104 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 290,
  p_plug_name=> 'Información del Estado de Contratación de los Proveedores',
  p_region_name=>'',
  p_parent_plug_id=>365753931537308526 + wwv_flow_api.g_id_offset,
  p_region_attributes=> 'style="width:450px;"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142030053339227099+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> 2,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 365807631134254071 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 142037578156227112+ wwv_flow_api.g_id_offset,
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
  p_id=> 365855611720561593 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 290,
  p_plug_name=> 'Ordenes de Provisión',
  p_region_name=>'',
  p_parent_plug_id=>365753931537308526 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142030053339227099+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 50,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> 2,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 365839602567983567 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 142037578156227112+ wwv_flow_api.g_id_offset,
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
  p_id=> 365859603324578064 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 290,
  p_plug_name=> 'Documentación Adeudada',
  p_region_name=>'',
  p_parent_plug_id=>365753931537308526 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142030053339227099+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 60,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 365846001631115657 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 142037578156227112+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
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
  p_id=> 365771618583569610 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 290,
  p_plug_name=> 'Video Introducción',
  p_region_name=>'dialog-video',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142028879771227099+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 70,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_list_template_id=> 142038759119227113+ wwv_flow_api.g_id_offset,
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
  p_plug_comment=> 'title="Video tutorial - Menú principal"');
end;
/
 
begin
 
null;
 
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
  p_id=>365764119323454118 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 290,
  p_name=>'P290_VIDEO_IFRAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 365753931537308526+wwv_flow_api.g_id_offset,
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
  p_attribute_01 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '<iframe width="670" height="430" src="//www.youtube.com/embed/p44uLxCIOhM" frameborder="0" allowfullscreen id="clearmySound"></iframe>');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'2643303687746645';

wwv_flow_api.create_page_process(
  p_id     => 35653632254998842 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 290,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'CargarDatosUsuario',
  p_process_sql_clob => 2643303687746645 + wwv_flow_api.g_id_offset,
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
p:=p||'2643130914745059';

wwv_flow_api.create_page_process(
  p_id     => 35653812992002740 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 290,
  p_process_sequence=> 20,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'CargarOrganizacionUsuario',
  p_process_sql_clob => 2643130914745059 + wwv_flow_api.g_id_offset,
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
p:=p||'2638809097738751';

wwv_flow_api.create_page_process(
  p_id     => 35654017148003984 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 290,
  p_process_sequence=> 30,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'InicializarAplicacion',
  p_process_sql_clob => 2638809097738751 + wwv_flow_api.g_id_offset,
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
p:=p||'2643509228748190';

wwv_flow_api.create_page_process(
  p_id     => 35654225459006318 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 290,
  p_process_sequence=> 40,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'CargarDatosAplicacion',
  p_process_sql_clob => 2643509228748190 + wwv_flow_api.g_id_offset,
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
p:=p||'1827920554893846';

wwv_flow_api.create_page_process(
  p_id     => 35654400310008582 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 290,
  p_process_sequence=> 50,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'InicializarTemaPorDefault',
  p_process_sql_clob => 1827920554893846 + wwv_flow_api.g_id_offset,
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
p:=p||'DECLARE'||unistr('\000a')||
'  cursor cr_etq (p_codigo IN VARCHAR2) IS'||unistr('\000a')||
'  SELECT VALOR'||unistr('\000a')||
'  FROM COM_ETIQUETAS_V'||unistr('\000a')||
'  WHERE CODIGO = p_codigo;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''PRV'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_PRV;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''RUB'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_RUB;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''CAT'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_CAT;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
' ';

p:=p||' OPEN cr_etq(p_codigo => ''CON'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_CON;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''PED'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_PED;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''PRO'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_PRO;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''TRP'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_TRP;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''ECC'');'||unistr('\000a')||
'  F';

p:=p||'ETCH cr_etq into :P1_COMETQ_ECC;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''COB'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_COB;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''CCL'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_CCL;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''COM'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_COM;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''OCM'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_OCM;'||unistr('\000a')||
'  C';

p:=p||'LOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  -- Singulares'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''PRVS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_PRVS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''RUBS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_RUBS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''CATS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_CATS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''CONS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_CONS;'||unistr('\000a')||
'  CLOSE cr_etq;';

p:=p||''||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''PEDS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_PEDS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''PROS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_PROS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''TRPS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_TRPS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''ECCS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_ECCS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo';

p:=p||' => ''COBS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_COBS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''CCLS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_CCLS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''COMS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_COMS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''OCMS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_OCMS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  IF :P1_COMETQ_PRV IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_PR';

p:=p||'V :=''Proveedores'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_RUB IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_RUB :=''Rubros'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_CAT IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_CAT :=''Categorías Rubros'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_CON IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_CON :=''Entidades Contratantes'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_PED IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_PED :=''Pedidos de Compras'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_PRO IS NULL THEN'||unistr('\000a')||
'   ';

p:=p||' :P1_COMETQ_PRO :=''Productos'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_TRP IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_TRP :=''Tramites Proveedores'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_ECC IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_ECC :=''Categorías EC'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_COB IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_COB :=''Objetos de Gastos'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_CCL IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_CCL :=''Clases Genéricas'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_COM I';

p:=p||'S NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_COM :=''Procesos de Compras'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_OCM IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_OCM :=''Ordenes de Compras'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  -- Singulares'||unistr('\000a')||
'  IF :P1_COMETQ_PRVS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_PRVS :=''Proveedor'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_RUBS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_RUBS :=''Rubro'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_CATS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_CATS :=''Categoría Rubro'';'||unistr('\000a')||
'  E';

p:=p||'ND IF;'||unistr('\000a')||
'  IF :P1_COMETQ_CONS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_CONS :=''Entidad Contratante'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_PEDS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_PEDS :=''Pedido de Compra'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_PROS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_PROS :=''Producto'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_TRPS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_TRPS :=''Trámite Proveedor'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_ECCS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_ECCS';

p:=p||' :=''Categoría EC'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_COBS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_COBS :=''Objeto de Gasto'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_CCLS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_CCLS :=''Clase Genérica'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_COMS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_COMS :=''Proceso de Compra'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_OCMS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_OCMS :=''Orden de Compra'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 35654606890010425 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 290,
  p_process_sequence=> 60,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'SetearEtiquetasDefault',
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
p:=p||'DECLARE'||unistr('\000a')||
'  CURSOR cr_comprv IS'||unistr('\000a')||
'  SELECT COMPRE_ESTADO'||unistr('\000a')||
'        ,COMPRE_FECHA_VALIDEZ'||unistr('\000a')||
'  FROM COM_PROVEEDORES_V'||unistr('\000a')||
'  WHERE ID = :P251_ID;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  OPEN cr_comprv;'||unistr('\000a')||
'  FETCH cr_comprv INTO :P251_COMPRE_ESTADO, :P251_COMPRE_FECHA_VALIDEZ;'||unistr('\000a')||
'  CLOSE cr_comprv;'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 35654816240013156 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 290,
  p_process_sequence=> 70,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ObtenerEstadoActualProveedor',
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
'  CURSOR cr_comecores IS'||unistr('\000a')||
'  SELECT COMCNR.COMECO_ID'||unistr('\000a')||
'        ,COMCNR.SEGORG_CODIGO||'' - ''||InitCap(COMCNR.COMECO_NOMBRE||'' - Conectado: ''||NVL(NVL(COMCNR.COMRES_NOMBRE,COMCNR.SEGPRS_NOMBRE),SUBSTR(COMCNR.SEGUSU_USUARIO,INSTR(COMCNR.SEGUSU_USUARIO,''.'',-1)+1)))'||unistr('\000a')||
'        ,COMCNR.COMECO_NOMBRE'||unistr('\000a')||
'  FROM  COM_CONTRATANTES_RES_V COMCNR'||unistr('\000a')||
'  WHERE COMCNR.SEGUSU_USUARIO = v(''APP_USER'')'||unistr('\000a')||
'    AND NVL(COMCNR.S';

p:=p||'ITUACION,''ACT'') = ''ACT'';'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
'  IF :P1_COMECO_ID IS NULL THEN'||unistr('\000a')||
'    OPEN cr_comecores;'||unistr('\000a')||
'    FETCH cr_comecores INTO :P1_COMECO_ID'||unistr('\000a')||
'                          , :P1_USUARIO      '||unistr('\000a')||
'                          , :P1_COMECO_NOMBRE;'||unistr('\000a')||
'    CLOSE cr_comecores;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'exception'||unistr('\000a')||
'  when others then'||unistr('\000a')||
'   null;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 35655024205015471 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 290,
  p_process_sequence=> 80,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ObtenerDatosConexion',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>':P1_COMRES_ID IS NULL',
  p_process_when_type=>'PLSQL_EXPRESSION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 290
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
