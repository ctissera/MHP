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
--   Date and Time:   13:25 Miércoles Julio 12, 2017
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

PROMPT ...Remove page 810
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>810);
 
end;
/

 
--application/pages/page_00810
prompt  ...PAGE 810: Contrataciones - Gestionar
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 810
 ,p_user_interface_id => 70527406842675 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'ADMINISTRACION'
 ,p_name => 'Contrataciones - Gestionar'
 ,p_step_title => 'Contrataciones - Gestionar'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Gestionar Contrataciones'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 15952704619548666 + wwv_flow_api.g_id_offset
 ,p_required_role => 8021229497997466 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'CTISSERA'
 ,p_last_upd_yyyymmddhh24miss => '20170712130935'
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
  p_id=> 2887610936816028 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 810,
  p_plug_name=> 'Operaciones Habilitadas',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142030956068227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 5,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 2887803449823268 + wwv_flow_api.g_id_offset,
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
  p_id=> 16285325428403390 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 810,
  p_plug_name=> 'Buscar',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142029450960227099+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 16287322320403405 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 810,
  p_plug_name=> 'Ruta de Navegacion',
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
s:=s||'select COMCON_ID'||unistr('\000a')||
'      ,COMPED_ID'||unistr('\000a')||
'      ,to_number(COMPED_CODIGO) COMPED_CODIGO'||unistr('\000a')||
'      ,COMPED_EJERCICIO'||unistr('\000a')||
'      ,''SOL: ''||COMPED_CODIGO||''/''||to_char(COMPED_EJERCICIO)||'' - ''||COMPEE_ESTADO_DESC||'' - ''||to_char(COMPEE_FECHA,''DD/MM/YYYY HH24:MI'') COMPED_CODIGO_ESTADO'||unistr('\000a')||
'      ,COMPED_FECHA_SOLICITUD'||unistr('\000a')||
'      ,COMPED_COMECO_ID'||unistr('\000a')||
'      ,COMECO.CODIGO COMECO_CODIGO'||unistr('\000a')||
'      ,COMECO.COMECP_CODIGO_PRESUPUESTARIO COD';

s:=s||'IGO_PRESUPUESTARIO'||unistr('\000a')||
'      ,COMPED_CONTRATANTE'||unistr('\000a')||
'      ,COMPED_EXPEDIENTE'||unistr('\000a')||
'      ,COMPED_PRECIO'||unistr('\000a')||
'      ,(SELECT COMCOB.CODIGO||'' - ''||COMCOB.NOMBRE FROM COM_CATALOGO_OBJETOS_V COMCOB WHERE COMCOB.ID = COMPED_COMCOB_ID) RUBRO'||unistr('\000a')||
'      ,COMPEE_ESTADO_DESC'||unistr('\000a')||
'      ,COMPEE_FECHA'||unistr('\000a')||
'      ,COMCON_PRIORIDAD_ABR  PRIORIDAD_ABR'||unistr('\000a')||
'      ,COMCON_COMCTT_ID'||unistr('\000a')||
'      ,decode(COMCON_PRIORIDAD, 0, ''<span style="color:red"><b>''||CO';

s:=s||'MCON_PRIORIDAD_ABR||''</b></span>'', COMCON_PRIORIDAD_ABR) PRIORIDAD'||unistr('\000a')||
'      ,decode(ltrim(rtrim(COMCTT_CODIGO||'': ''||COMCON_CODIGO)),'':'','''',ltrim(rtrim(COMCTT_CODIGO||'': ''||COMCON_CODIGO||''/''||to_char(COMPED_EJERCICIO)||'' - ''||COMCOE_ESTADO_DESC))) COMCON_CODIGO'||unistr('\000a')||
'      ,COMCON_OBJETO'||unistr('\000a')||
'      ,COMCON_MONTO_PRESUPUESTO'||unistr('\000a')||
'      ,COMCTT_CODIGO'||unistr('\000a')||
'      ,COMCTT_NOMBRE'||unistr('\000a')||
'      ,COMCOE_ID'||unistr('\000a')||
'      ,COMCOE_ESTADO_DESC CO';

s:=s||'MCOE_ESTADO'||unistr('\000a')||
'      ,COMCOE_FECHA'||unistr('\000a')||
'      ,COMCON_FECHA_FIN_PRO'||unistr('\000a')||
' from  COM_CONTRATACIONES_DET3_V'||unistr('\000a')||
'      ,COM_CONTRATANTES_V COMECO'||unistr('\000a')||
'WHERE  COMPEE_ESTADO <> ''NUE'' '||unistr('\000a')||
'  and COMECO.ID = COMPED_COMECO_ID'||unistr('\000a')||
'&P810_WHERE.';

wwv_flow_api.create_report_region (
  p_id=> 19191101580420690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 810,
  p_name=> '&P1_COMETQ_COM.',
  p_region_name=>'',
  p_template=> 142030053339227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 30,
  p_region_attributes=>'style="width:80%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 142033072101227104+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '10',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se ha encontrado ningún dato con los criterios indicados.',
  p_query_num_rows_item=> 'P810_ROWS',
  p_query_num_rows_type=> 'ROW_RANGES_WITH_LINKS',
  p_query_row_count_max=> '99999',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'Y',
  p_csv_output_link_text=> 'Descargar',
  p_prn_output=> 'N',
  p_prn_format=> 'PDF',
  p_prn_output_show_link=> 'Y',
  p_prn_output_link_text=> 'Imprimir',
  p_prn_output_file_name=> 'ComCON',
  p_prn_content_disposition=> 'ATTACHMENT',
  p_prn_document_header=> 'APEX',
  p_prn_units=> 'CENTIMETERS',
  p_prn_paper_size=> 'A4',
  p_prn_width_units=> 'PERCENTAGE',
  p_prn_width=> 29,
  p_prn_height=> 21,
  p_prn_orientation=> 'HORIZONTAL',
  p_prn_page_header=> '&P1_COMETQ_CON.'||unistr('\000a')||
'Listado de &P1_COMETQ_CON.'||unistr('\000a')||
''||unistr('\000a')||
'Filtros aplicados - Expediente: &P810_SEARCH. Tipo &P1_COMETQ_COMS.: &P810_TIPO_CONTRATACION. &P1_COMETQ_CONS.: &P810_CONTRATANTE. Proceso: &P810_NRO_CONTRATACION. Solicitud: &P810_NRO_SOLICITUD. Estado Proceso: &P810_ESTADO. Estado Solicitud: &P810_ESTADO_COMPED.',
  p_prn_page_header_font_color=> '#000000',
  p_prn_page_header_font_family=> 'Helvetica',
  p_prn_page_header_font_weight=> 'normal',
  p_prn_page_header_font_size=> '11',
  p_prn_page_footer_font_color=> '#000000',
  p_prn_page_footer_font_family=> 'Helvetica',
  p_prn_page_footer_font_weight=> 'normal',
  p_prn_page_footer_font_size=> '12',
  p_prn_header_bg_color=> '#cccccc',
  p_prn_header_font_color=> '#000000',
  p_prn_header_font_family=> 'Helvetica',
  p_prn_header_font_weight=> 'normal',
  p_prn_header_font_size=> '9',
  p_prn_body_bg_color=> '#ffffff',
  p_prn_body_font_color=> '#000000',
  p_prn_body_font_family=> 'Helvetica',
  p_prn_body_font_weight=> 'normal',
  p_prn_body_font_size=> '8',
  p_prn_border_width=> .5,
  p_prn_page_header_alignment=> 'CENTER',
  p_prn_page_footer_alignment=> 'LEFT',
  p_sort_null=> 'F',
  p_query_asc_image=> 'arrow_down_gray_dark.gif',
  p_query_asc_image_attr=> 'width="13" height="12" alt=""',
  p_query_desc_image=> 'arrow_up_gray_dark.gif',
  p_query_desc_image_attr=> 'width="13" height="12" alt=""',
  p_plug_query_exp_filename=> 'Contrataciones',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 25186027024135181 + wwv_flow_api.g_id_offset,
  p_region_id=> 19191101580420690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMCON_ID',
  p_column_display_sequence=> 12,
  p_column_heading=> 'Comcon Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 25186126863135183 + wwv_flow_api.g_id_offset,
  p_region_id=> 19191101580420690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_ID',
  p_column_display_sequence=> 27,
  p_column_heading=> 'Comped Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 25186220565135184 + wwv_flow_api.g_id_offset,
  p_region_id=> 19191101580420690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_CODIGO',
  p_column_display_sequence=> 13,
  p_column_heading=> 'Comped Codigo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 25186323080135184 + wwv_flow_api.g_id_offset,
  p_region_id=> 19191101580420690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_EJERCICIO',
  p_column_display_sequence=> 14,
  p_column_heading=> 'Comped Ejercicio',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20204217795230721 + wwv_flow_api.g_id_offset,
  p_region_id=> 19191101580420690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_CODIGO_ESTADO',
  p_column_display_sequence=> 2,
  p_column_heading=> '&P1_COMETQ_PEDS.',
  p_column_hit_highlight=>'&P810_NRO_SOLICITUD.',
  p_column_link=>'f?p=&APP_ID.:301:&SESSION.::&DEBUG.:RP,301:P301_ID,P301_APP_ANTERIOR,P301_PAG_ANTERIOR:#COMPED_ID#,&APP_ID.,&APP_PAGE_ID.',
  p_column_linktext=>'#COMPED_CODIGO_ESTADO#',
  p_column_link_attr=>'title="Detalle Solicitud"',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '10',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 25186410426135184 + wwv_flow_api.g_id_offset,
  p_region_id=> 19191101580420690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_FECHA_SOLICITUD',
  p_column_display_sequence=> 15,
  p_column_heading=> 'Comped Fecha Solicitud',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 25186519491135184 + wwv_flow_api.g_id_offset,
  p_region_id=> 19191101580420690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_COMECO_ID',
  p_column_display_sequence=> 16,
  p_column_heading=> 'Comped Comeco Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 51876310420178184 + wwv_flow_api.g_id_offset,
  p_region_id=> 19191101580420690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'COMECO_CODIGO',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Código UE',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '10',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 53562011989252060 + wwv_flow_api.g_id_offset,
  p_region_id=> 19191101580420690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'CODIGO_PRESUPUESTARIO',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Código Presupuestario',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 19191800795420726 + wwv_flow_api.g_id_offset,
  p_region_id=> 19191101580420690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_CONTRATANTE',
  p_column_display_sequence=> 7,
  p_column_heading=> '&P1_COMETQ_CONS.',
  p_column_hit_highlight=>'&P810_CONTRATANTE.',
  p_column_linktext=>'#COMPED_CONTRATANTE#',
  p_column_link_attr=>'title="Ver Detalle de Solicitud de Gasto"',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '10',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 19191929516420726 + wwv_flow_api.g_id_offset,
  p_region_id=> 19191101580420690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_EXPEDIENTE',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Expediente',
  p_column_hit_highlight=>'&P810_SEARCH.',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>4,
  p_default_sort_dir=>'desc',
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '10',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 46466626000912303 + wwv_flow_api.g_id_offset,
  p_region_id=> 19191101580420690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_PRECIO',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Precio',
  p_use_as_row_header=> 'N',
  p_column_format=> 'FML999G999G999G999G990D00',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '10',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 46466732709912303 + wwv_flow_api.g_id_offset,
  p_region_id=> 19191101580420690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'RUBRO',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Especialidad/Rubro',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '10',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 25186608724135184 + wwv_flow_api.g_id_offset,
  p_region_id=> 19191101580420690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'COMPEE_ESTADO_DESC',
  p_column_display_sequence=> 17,
  p_column_heading=> 'Compee Estado Desc',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 25186723786135184 + wwv_flow_api.g_id_offset,
  p_region_id=> 19191101580420690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 15,
  p_form_element_id=> null,
  p_column_alias=> 'COMPEE_FECHA',
  p_column_display_sequence=> 18,
  p_column_heading=> 'Compee Fecha',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 37632014879823467 + wwv_flow_api.g_id_offset,
  p_region_id=> 19191101580420690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 16,
  p_form_element_id=> null,
  p_column_alias=> 'PRIORIDAD_ABR',
  p_column_display_sequence=> 26,
  p_column_heading=> 'Prioridad',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'PLSQL_EXPRESSION',
  p_display_when_condition=> 'apex_application.g_excel_format = TRUE',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '10',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 25186809048135184 + wwv_flow_api.g_id_offset,
  p_region_id=> 19191101580420690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 17,
  p_form_element_id=> null,
  p_column_alias=> 'COMCON_COMCTT_ID',
  p_column_display_sequence=> 19,
  p_column_heading=> 'Comcon Comctt Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 36574507346731128 + wwv_flow_api.g_id_offset,
  p_region_id=> 19191101580420690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 18,
  p_form_element_id=> null,
  p_column_alias=> 'PRIORIDAD',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Prioridad',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'CENTER',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>1,
  p_default_sort_dir=>'desc',
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 19192121613420726 + wwv_flow_api.g_id_offset,
  p_region_id=> 19191101580420690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 19,
  p_form_element_id=> null,
  p_column_alias=> 'COMCON_CODIGO',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Proceso',
  p_use_as_row_header=> 'N',
  p_column_hit_highlight=>'P810_NRO_CONTRATACION	',
  p_column_link=>'f?p=&APP_ID.:811:&SESSION.::&DEBUG.:811:P811_ID,P811_COMPED_ID,P811_APP_ANTERIOR,P811_PAG_ANTERIOR:#COMCON_ID#,#COMPED_ID#,&APP_ID.,&APP_PAGE_ID.',
  p_column_linktext=>'#COMCON_CODIGO#',
  p_column_link_attr=>'title="Ver Detalle de Contrataciones"',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '10',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 25186918521135184 + wwv_flow_api.g_id_offset,
  p_region_id=> 19191101580420690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 20,
  p_form_element_id=> null,
  p_column_alias=> 'COMCON_OBJETO',
  p_column_display_sequence=> 20,
  p_column_heading=> 'Comcon Objeto',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 25187001307135184 + wwv_flow_api.g_id_offset,
  p_region_id=> 19191101580420690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 21,
  p_form_element_id=> null,
  p_column_alias=> 'COMCON_MONTO_PRESUPUESTO',
  p_column_display_sequence=> 21,
  p_column_heading=> 'Comcon Monto Presupuesto',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 25187100078135184 + wwv_flow_api.g_id_offset,
  p_region_id=> 19191101580420690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 22,
  p_form_element_id=> null,
  p_column_alias=> 'COMCTT_CODIGO',
  p_column_display_sequence=> 22,
  p_column_heading=> 'Comctt Codigo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 25187230739135184 + wwv_flow_api.g_id_offset,
  p_region_id=> 19191101580420690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 23,
  p_form_element_id=> null,
  p_column_alias=> 'COMCTT_NOMBRE',
  p_column_display_sequence=> 23,
  p_column_heading=> 'Comctt Nombre',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 25187304268135184 + wwv_flow_api.g_id_offset,
  p_region_id=> 19191101580420690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 24,
  p_form_element_id=> null,
  p_column_alias=> 'COMCOE_ID',
  p_column_display_sequence=> 24,
  p_column_heading=> 'Comcoe Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 25187412082135184 + wwv_flow_api.g_id_offset,
  p_region_id=> 19191101580420690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 25,
  p_form_element_id=> null,
  p_column_alias=> 'COMCOE_ESTADO',
  p_column_display_sequence=> 25,
  p_column_heading=> 'Comcoe Estado',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 19745200501086060 + wwv_flow_api.g_id_offset,
  p_region_id=> 19191101580420690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 26,
  p_form_element_id=> null,
  p_column_alias=> 'COMCOE_FECHA',
  p_column_display_sequence=> 10,
  p_column_heading=> 'FechaEstado',
  p_use_as_row_header=> 'N',
  p_column_format=> 'dd/mm/yyyy hh24:mi',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>2,
  p_default_sort_dir=>'desc',
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '10',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6757030998962202 + wwv_flow_api.g_id_offset,
  p_region_id=> 19191101580420690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 27,
  p_form_element_id=> null,
  p_column_alias=> 'COMCON_FECHA_FIN_PRO',
  p_column_display_sequence=> 11,
  p_column_heading=> 'FinPropuesta',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>3,
  p_default_sort_dir=>'desc',
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '10',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT ESTADO'||unistr('\000a')||
'      ,''<b>''||COUNT(CODIGO)||''</b>'' CANTIDAD'||unistr('\000a')||
'FROM ('||unistr('\000a')||
'      SELECT COMPED.CODIGO'||unistr('\000a')||
'           , DECODE(gral_pkg.obtn_cfgabr (''COM_PEDIDOS_EST.ESTADO'',comped.COMPEE_ESTADO),'||unistr('\000a')||
'            ''PARA INICIAR'',''RECEPCIONADO'',gral_pkg.obtn_cfgabr (''COM_PEDIDOS_EST.ESTADO'',comped.COMPEE_ESTADO)) ESTADO'||unistr('\000a')||
'      FROM com_pedidos comped'||unistr('\000a')||
'        --,com_pedidos_est compee'||unistr('\000a')||
'      WHERE comped.SEGORG_ID = :P1';

s:=s||'_SEGORG_ID'||unistr('\000a')||
'        AND comped.compee_estado IN (''PAU'',''AUT'',''RCH'')'||unistr('\000a')||
'      --AND comped.compee_id = compee.id'||unistr('\000a')||
'     )'||unistr('\000a')||
'GROUP BY ESTADO'||unistr('\000a')||
'ORDER BY ESTADO DESC';

wwv_flow_api.create_report_region (
  p_id=> 23682416933717900 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 810,
  p_name=> '&P1_COMETQ_PED. pendientes',
  p_region_name=>'',
  p_template=> 142030956068227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 15,
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'REGION_POSITION_03',
  p_item_display_point=> 'BELOW',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> 'P810_ACTIVAR_RESUMEN_SN',
  p_display_when_cond2=> 'SI',
  p_display_condition_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 142032157157227101+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'NO_HEADINGS',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se ha encontrado ningún dato',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_sort_null=> 'F',
  p_query_asc_image=> 'arrow_down_gray_dark.gif',
  p_query_asc_image_attr=> 'width="13" height="12" alt=""',
  p_query_desc_image=> 'arrow_up_gray_dark.gif',
  p_query_desc_image_attr=> 'width="13" height="12" alt=""',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 23682621230717934 + wwv_flow_api.g_id_offset,
  p_region_id=> 23682416933717900 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ESTADO',
  p_column_display_sequence=> 1,
  p_column_heading=> '',
  p_column_link=>'f?p=&APP_ID.:810:&SESSION.::&DEBUG.:RP,810:P810_ESTADO_COMPED,P810_ACTIVAR_RESUMEN_SN:#ESTADO#,&P810_ACTIVAR_RESUMEN_SN.',
  p_column_linktext=>'#ESTADO#',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 23682701572717937 + wwv_flow_api.g_id_offset,
  p_region_id=> 23682416933717900 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'CANTIDAD',
  p_column_display_sequence=> 2,
  p_column_heading=> '',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT  gral_pkg.obtn_cfgabr (''COM_CONTRATACIONES_EST.ESTADO'',COMCON.COMCOE_ESTADO) COMCOE_ESTADO_DESC'||unistr('\000a')||
'      , COMCON.COMCOE_ESTADO COMCOE_ESTADO'||unistr('\000a')||
'      ,''<b>''||COUNT(COMCON.COMCOE_ID)||''</b>'' CANTIDAD'||unistr('\000a')||
' from  COM_CONTRATACIONES     COMCON'||unistr('\000a')||
'--    ,COM_CONTRATACIONES_EST COMCOE'||unistr('\000a')||
' where COMCON.COMCOE_ESTADO IN (''PRE'',''INF'',''ADJ'',''ENV'',''PEN'',''DES'')'||unistr('\000a')||
'--   and COMCON.COMCOE_ID = COMCOE.ID'||unistr('\000a')||
'   AND COMCON.SEGO';

s:=s||'RG_ID = :P1_SEGORG_ID'||unistr('\000a')||
'GROUP BY 1, COMCON.COMCOE_ESTADO'||unistr('\000a')||
''||unistr('\000a')||
'UNION'||unistr('\000a')||
''||unistr('\000a')||
'SELECT  gral_pkg.obtn_cfgabr (''COM_CONTRATACIONES_EST.ESTADO'',COMCON.COMCOE_ESTADO) ||'' PARA EVALUAR'' COMCOE_ESTADO_DESC'||unistr('\000a')||
'      , COMCON.COMCOE_ESTADO COMCOE_ESTADO'||unistr('\000a')||
'      ,''<b><font color="red">''||COUNT(COMCON.COMCOE_ID)||''</b></font>'' CANTIDAD'||unistr('\000a')||
' from  COM_CONTRATACIONES      COMCON'||unistr('\000a')||
'--      ,COM_CONTRATACIONES_EST  COMCOE'||unistr('\000a')||
'where COMCON.CO';

s:=s||'MCOE_ESTADO IN (''ACT'')'||unistr('\000a')||
'   and COMCON.FECHA_FIN_PROPUESTA <= SYSDATE'||unistr('\000a')||
'--   and COMCON.COMCOE_ID = COMCOE.ID'||unistr('\000a')||
'   AND COMCON.SEGORG_ID = :P1_SEGORG_ID'||unistr('\000a')||
'GROUP BY 1, COMCON.COMCOE_ESTADO'||unistr('\000a')||
''||unistr('\000a')||
'UNION'||unistr('\000a')||
''||unistr('\000a')||
'SELECT  gral_pkg.obtn_cfgabr (''COM_CONTRATACIONES_EST.ESTADO'',COMCON.COMCOE_ESTADO) COMCOE_ESTADO_DESC'||unistr('\000a')||
'      , COMCON.COMCOE_ESTADO COMCOE_ESTADO'||unistr('\000a')||
'      ,''<b>''||COUNT(COMCON.COMCOE_ID)||''</b>'' CANTIDAD'||unistr('\000a')||
' from  COM_C';

s:=s||'ONTRATACIONES COMCON'||unistr('\000a')||
'--      ,COM_CONTRATACIONES_EST COMCOE'||unistr('\000a')||
'where COMCON.COMCOE_ESTADO = ''ACT'''||unistr('\000a')||
'   and COMCON.FECHA_FIN_PROPUESTA > SYSDATE'||unistr('\000a')||
'--   and COMCON.COMCOE_ID = COMCOE.ID'||unistr('\000a')||
'   AND COMCON.SEGORG_ID = :P1_SEGORG_ID'||unistr('\000a')||
'GROUP BY 1, COMCON.COMCOE_ESTADO';

wwv_flow_api.create_report_region (
  p_id=> 23683802145846061 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 810,
  p_name=> '&P1_COMETQ_COM. en curso',
  p_region_name=>'',
  p_template=> 142030956068227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 25,
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'REGION_POSITION_03',
  p_item_display_point=> 'BELOW',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> 'P810_ACTIVAR_RESUMEN_SN',
  p_display_when_cond2=> 'SI',
  p_display_condition_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 142032157157227101+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'NO_HEADINGS',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se ha encontrado ningún dato',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_sort_null=> 'F',
  p_query_asc_image=> 'arrow_down_gray_dark.gif',
  p_query_asc_image_attr=> 'width="13" height="12" alt=""',
  p_query_desc_image=> 'arrow_up_gray_dark.gif',
  p_query_desc_image_attr=> 'width="13" height="12" alt=""',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 23684615613897203 + wwv_flow_api.g_id_offset,
  p_region_id=> 23683802145846061 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMCOE_ESTADO_DESC',
  p_column_display_sequence=> 1,
  p_column_heading=> '',
  p_column_link=>'f?p=&APP_ID.:810:&SESSION.::&DEBUG.::P810_ESTADO,P810_ACTIVAR_RESUMEN_SN:#COMCOE_ESTADO_DESC#,&P810_ACTIVAR_RESUMEN_SN.',
  p_column_linktext=>'#COMCOE_ESTADO_DESC#',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 45263024530984006 + wwv_flow_api.g_id_offset,
  p_region_id=> 23683802145846061 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMCOE_ESTADO',
  p_column_display_sequence=> 3,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 23684120041846061 + wwv_flow_api.g_id_offset,
  p_region_id=> 23683802145846061 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'CANTIDAD',
  p_column_display_sequence=> 2,
  p_column_heading=> '',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT  gral_pkg.obtn_cfgabr (''COM_CONTRATACIONES_EST.ESTADO'',COMCON.COMCOE_ESTADO) COMCOE_ESTADO_DESC'||unistr('\000a')||
'      , COMCON.COMCOE_ESTADO COMCOE_ESTADO'||unistr('\000a')||
'      ,''<b>''||COUNT(COMCON.COMCOE_ID)||''</b>'' CANTIDAD'||unistr('\000a')||
' from  COM_CONTRATACIONES     COMCON'||unistr('\000a')||
'--      ,COM_CONTRATACIONES_EST COMCOE'||unistr('\000a')||
'where COMCON.COMCOE_ESTADO IN (''FIN'',''NAD'',''CAN'')'||unistr('\000a')||
'--   and COMCON.COMCOE_ID = COMCOE.ID'||unistr('\000a')||
'   AND COMCON.SEGORG_ID = :P1_SEGOR';

s:=s||'G_ID'||unistr('\000a')||
'GROUP BY 1, COMCON.COMCOE_ESTADO'||unistr('\000a')||
'ORDER BY COMCOE_ESTADO_DESC DESC'||unistr('\000a')||
'';

wwv_flow_api.create_report_region (
  p_id=> 23684902416940748 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 810,
  p_name=> '&P1_COMETQ_COM. cerradas',
  p_region_name=>'',
  p_template=> 142030956068227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 35,
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'REGION_POSITION_03',
  p_item_display_point=> 'BELOW',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> 'P810_ACTIVAR_RESUMEN_SN',
  p_display_when_cond2=> 'SI',
  p_display_condition_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 142032157157227101+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'NO_HEADINGS',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se ha encontrado ningún dato',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_sort_null=> 'F',
  p_query_asc_image=> 'arrow_down_gray_dark.gif',
  p_query_asc_image_attr=> 'width="13" height="12" alt=""',
  p_query_desc_image=> 'arrow_up_gray_dark.gif',
  p_query_desc_image_attr=> 'width="13" height="12" alt=""',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 23685610774971569 + wwv_flow_api.g_id_offset,
  p_region_id=> 23684902416940748 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMCOE_ESTADO_DESC',
  p_column_display_sequence=> 1,
  p_column_heading=> '',
  p_column_link=>'f?p=&APP_ID.:810:&SESSION.::&DEBUG.::P810_ESTADO,P810_ACTIVAR_RESUMEN_SN:#COMCOE_ESTADO_DESC#,&P810_ACTIVAR_RESUMEN_SN.',
  p_column_linktext=>'#COMCOE_ESTADO_DESC#',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 23686318964040098 + wwv_flow_api.g_id_offset,
  p_region_id=> 23684902416940748 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMCOE_ESTADO',
  p_column_display_sequence=> 3,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 23685207613940748 + wwv_flow_api.g_id_offset,
  p_region_id=> 23684902416940748 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'CANTIDAD',
  p_column_display_sequence=> 2,
  p_column_heading=> '',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 81579803912478771 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 810,
  p_plug_name=> 'Pedido de Compras',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 142030956068227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 81578929622467320 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 142037578156227112+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_required_role => 7397805760876468+ wwv_flow_api.g_id_offset,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 20224516276929146 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 810,
  p_button_sequence=> 10,
  p_button_plug_id => 16285325428403390+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREAR_CONTRATACIONES',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Crear &P1_COMETQ_COMS. >',
  p_button_position=> 'ABOVE_BOX',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 8021407120000462+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>20224820080929149 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 810,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:800:&SESSION.::&DEBUG.:800,801,802,803,805::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>20224516276929146+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>16290717172403408 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 810,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:810:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 50,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>3224217012188348 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 810,
  p_name=>'P810_ACTIVAR_RESUMEN_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 2,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Activar Resumen Sn',
  p_source=>'NO',
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
  p_id=>16288006787403407 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 810,
  p_name=>'P810_SEARCH',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 16285325428403390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Expediente',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 17,
  p_cMaxlength=> 100,
  p_cHeight=> 1,
  p_new_grid=> true,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039363292227113+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>16288221936403407 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 810,
  p_name=>'P810_ROWS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 16285325428403390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '10',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Mostrar ',
  p_source=>'10',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'P200_Fila de Informe por Página',
  p_lov=> '.'||to_char(23888849668243326 + wwv_flow_api.g_id_offset)||'.',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039363292227113+wwv_flow_api.g_id_offset,
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
  p_id=>16288404182403407 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 810,
  p_name=>'P810_GO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 41,
  p_item_plug_id => 16285325428403390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'GO',
  p_prompt=>'Buscar',
  p_source=>'GO',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 2,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
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
  p_id=>16288621429403407 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 810,
  p_name=>'P810_RESET',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 42,
  p_item_plug_id => 16285325428403390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'RESET',
  p_prompt=>'Restablecer',
  p_source=>'RESET',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
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
  p_id=>16288810204403407 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 810,
  p_name=>'P810_ESTADO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 16285325428403390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'  Estado',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'SELECT * '||unistr('\000a')||
'FROM'||unistr('\000a')||
'(select ''ACTIVO PARA EVALUAR'' d, ''ACTIVO PARA EVALUAR'' r'||unistr('\000a')||
'from   cg_ref_codes'||unistr('\000a')||
'where  rv_domain = ''COM_CONTRATACIONES_EST.ESTADO'''||unistr('\000a')||
'  and  rv_low_value <> ''NUE'''||unistr('\000a')||
'  and ROWNUM = 1)'||unistr('\000a')||
'UNION ALL'||unistr('\000a')||
'(select rv_abbreviation d, rv_abbreviation r'||unistr('\000a')||
'from   cg_ref_codes'||unistr('\000a')||
'where  rv_domain = ''COM_CONTRATACIONES_EST.ESTADO'''||unistr('\000a')||
'  and  rv_low_value <> ''NUE'')'||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'TODOS',
  p_lov_null_value=> 'TODOS',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039363292227113+wwv_flow_api.g_id_offset,
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
  p_id=>19293117753643069 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 810,
  p_name=>'P810_NRO_CONTRATACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 35,
  p_item_plug_id => 16285325428403390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Proceso',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 5,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039363292227113+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>19455115178181651 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 810,
  p_name=>'P810_NRO_SOLICITUD',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 59,
  p_item_plug_id => 16285325428403390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Solicitud',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 5,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039363292227113+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>19457117649210744 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 810,
  p_name=>'P810_CONTRATANTE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 16285325428403390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'&P1_COMETQ_CONS.',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_POPUP_LOV',
  p_lov=> 'select nombre||'' - ''||COMECE_ESTADO_DESC d, id r'||unistr('\000a')||
'  from com_contratantes_v'||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 65,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 5,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039363292227113+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
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
  p_id=>20037208707556368 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 810,
  p_name=>'P810_ESTADO_COMPED',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 95,
  p_item_plug_id => 16285325428403390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Estado Sol.',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select DECODE(rv_abbreviation,''PARA INICIAR'',''RECEPCIONADO'',rv_abbreviation)'||unistr('\000a')||
' d, DECODE(rv_abbreviation,''PARA INICIAR'',''RECEPCIONADO'',rv_abbreviation)'||unistr('\000a')||
' r'||unistr('\000a')||
'from   cg_ref_codes'||unistr('\000a')||
'where  rv_domain = ''COM_PEDIDOS_EST.ESTADO'''||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'TODOS',
  p_lov_null_value=> 'TODOS',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039363292227113+wwv_flow_api.g_id_offset,
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
  p_id=>20043128100561935 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 810,
  p_name=>'P810_TIPO_CONTRATACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 16285325428403390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tipo Contrat.',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'COMCTT_BUSQUEDA',
  p_lov=> 'select nombre||'' (''||situacion_desc||'')'' d, nombre r'||unistr('\000a')||
'  from com_contrataciones_tipos_v'||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'- TODOS -',
  p_lov_null_value=> 'TODOS',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 5,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039363292227113+wwv_flow_api.g_id_offset,
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
  p_id=>24645014217322946 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 810,
  p_name=>'P810_WHERE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Where : ',
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
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>36652306176295015 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 810,
  p_name=>'P810_PRIORIDAD',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 16285325428403390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Prioridad',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select rv_abbreviation d, rv_low_value r'||unistr('\000a')||
'from   cg_ref_codes'||unistr('\000a')||
'where  rv_domain = ''COM_CONTRATACIONES.PRIORIDAD''',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'TODAS',
  p_lov_null_value=> 'TODAS',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
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
  p_id=>51859326207851714 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 810,
  p_name=>'P810_COMECO_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 16285325428403390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Código UE',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 5,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 142039553452227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>53555923728866725 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 810,
  p_name=>'P810_COMECO_COMECP',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 16285325428403390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Cód. Presupuestario',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 5,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 142039553452227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
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
p:=p||':P1_PAG_ANTERIOR := :APP_PAGE_ID;';

wwv_flow_api.create_page_process(
  p_id     => 16290416856403408 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 810,
  p_process_sequence=> 40,
  p_process_point=> 'AFTER_FOOTER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AsignarPaginaAnterior',
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
p:=p||'reset_pagination';

wwv_flow_api.create_page_process(
  p_id     => 16290030338403408 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 810,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'RESET_PAGINATION',
  p_process_name=> 'Restablecer Paginación',
  p_process_sql_clob => p,
  p_process_error_message=> 'No se ha podido restablecer la paginación.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'GO,P810_SEARCH,RESET',
  p_process_when_type=>'REQUEST_IN_CONDITION',
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
p:=p||'P810_SEARCH,P810_ROWS,P810_ESTADO,P810_NRO_CONTRATACION,P810_NRO_SOLICITUD,P810_CONTRATANTE,P810_ESTADO_COMPED,P810_TIPO_CONTRATACION,P810_PRIORIDAD,P810_COMECO_CODIGO,P810_COMECO_COMECP';

wwv_flow_api.create_page_process(
  p_id     => 16290203576403408 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 810,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_ITEMS',
  p_process_name=> 'Restablecer Búsqueda de Informe',
  p_process_sql_clob => p,
  p_process_error_message=> 'No se ha podido limpiar la caché.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>16288621429403407 + wwv_flow_api.g_id_offset,
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
p:=p||':P810_WHERE := NULL;'||unistr('\000a')||
'if :P810_SEARCH is NULL and NVL(:P810_TIPO_CONTRATACION,''TODOS'') = ''TODOS'' and'||unistr('\000a')||
'   :P810_NRO_CONTRATACION is NULL and NVL(:P810_ESTADO,''TODOS'') = ''TODOS'' and'||unistr('\000a')||
'   nvl(:P810_PRIORIDAD,''TODAS'') = ''TODAS'' and'||unistr('\000a')||
'   :P810_CONTRATANTE is NULL and :P810_NRO_SOLICITUD is NULL and NVL(:P810_ESTADO_COMPED,''TODOS'') = ''TODOS'' and :P810_COMECO_CODIGO is null and :P810_COMECO_COMECP is null  the';

p:=p||'n'||unistr('\000a')||
'   --'||unistr('\000a')||
'   :P810_WHERE := :P810_WHERE||'' and 1 = 2'';'||unistr('\000a')||
'   --'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'if :P810_SEARCH is not NULL then'||unistr('\000a')||
'   :P810_WHERE := :P810_WHERE||'' and COMPED_EXPEDIENTE LIKE ''''%''||:P810_SEARCH||''%'''''';'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'if :P810_NRO_CONTRATACION is not null then '||unistr('\000a')||
'  :P810_WHERE := :P810_WHERE||'' and upper("COMCON_CODIGO") = upper(nvl(''''''||:P810_NRO_CONTRATACION||'''''',"COMCON_CODIGO"))'';'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'if :P810_COMECO_CODI';

p:=p||'GO is not null then '||unistr('\000a')||
'  :P810_WHERE := :P810_WHERE||'' and upper(COMECO.CODIGO) LIKE upper(''''%''||:P810_COMECO_CODIGO||''%'''')'';'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'if :P810_COMECO_COMECP is not null then '||unistr('\000a')||
'  :P810_WHERE := :P810_WHERE||'' and upper(COMECO.COMECP_CODIGO_PRESUPUESTARIO) LIKE upper(''''%''||:P810_COMECO_COMECP||''%'''')'';'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'if :P810_NRO_SOLICITUD is not null then'||unistr('\000a')||
'  :P810_WHERE := :P810_WHERE||'' and upper("COMPE';

p:=p||'D_CODIGO") = upper(nvl(''''''||:P810_NRO_SOLICITUD||'''''',"COMPED_CODIGO"))'';'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'if NVL(:P810_ESTADO,''TODOS'') <> ''TODOS'' then'||unistr('\000a')||
'  if :P810_ESTADO = ''ACTIVO PARA EVALUAR'' then'||unistr('\000a')||
'    :P810_WHERE  := :P810_WHERE||'' and COMCON_FECHA_FIN_PRO <= SYSDATE'';'||unistr('\000a')||
'    :P810_ESTADO := ''ACTIVO'';'||unistr('\000a')||
'  elsif :P810_ESTADO = ''ACTIVO EN COTIZACION'' then'||unistr('\000a')||
'    :P810_WHERE  := :P810_WHERE||'' and COMCON_FECHA_FIN_PRO > SYSDATE''';

p:=p||';'||unistr('\000a')||
'    :P810_ESTADO := ''ACTIVO'';'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  :P810_WHERE := :P810_WHERE||'' and COMCOE_ESTADO_DESC = ''''''||:P810_ESTADO||'''''''';'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'if nvl(:P810_CONTRATANTE,''TODOS'') <> ''TODOS'' then'||unistr('\000a')||
'  :P810_WHERE := :P810_WHERE||'' AND (COMPED_COMECO_ID = ''||:P810_CONTRATANTE||'' OR COMPED_COMECO_ID IN (SELECT VIN.COMECO_ID_HIJO FROM COM_CONTRATANTES_VINC VIN WHERE VIN.COMECO_ID_PADRE =''|| :P810_CONTRATANTE||''))''';

p:=p||';'||unistr('\000a')||
'end if;'||unistr('\000a')||
'if NVL(:P810_ESTADO_COMPED,''TODOS'') <> ''TODOS'' then'||unistr('\000a')||
'  :P810_WHERE := :P810_WHERE||'' and COMPEE_ESTADO_DESC = ''''''||:P810_ESTADO_COMPED||'''''''';'||unistr('\000a')||
'end if;'||unistr('\000a')||
'if NVL(:P810_TIPO_CONTRATACION,''TODOS'') <> ''TODOS'' then'||unistr('\000a')||
'  :P810_WHERE := :P810_WHERE||'' and COMCTT_NOMBRE = ''''''||:P810_TIPO_CONTRATACION||'''''''';'||unistr('\000a')||
'end if;'||unistr('\000a')||
'if nvl(:P810_PRIORIDAD,''TODAS'') <> ''TODAS'' then'||unistr('\000a')||
'  :P810_WHERE := :P810_WHERE||'' and COMCO';

p:=p||'N_PRIORIDAD = ''||:P810_PRIORIDAD;'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--';

wwv_flow_api.create_page_process(
  p_id     => 24645312532350865 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 810,
  p_process_sequence=> 1,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AsignarValorWhere',
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
p:=p||'IF :P810_ESTADO IS NULL THEN'||unistr('\000a')||
'   :P810_ESTADO:=''TODOS'';'||unistr('\000a')||
'END IF;';

wwv_flow_api.create_page_process(
  p_id     => 16289804717403408 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 810,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AsignarValorDefaultBusqueda',
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
-- ...updatable report columns for page 810
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
