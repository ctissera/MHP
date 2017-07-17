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
--   Date and Time:   13:22 Martes Enero 17, 2017
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

PROMPT ...Remove page 268
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>268);
 
end;
/

 
--application/pages/page_00268
prompt  ...PAGE 268: Detalle de Rubro por Objeto
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 268
 ,p_user_interface_id => 70527406842675 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'ADMINISTRACION'
 ,p_name => 'Detalle de Rubro por Objeto'
 ,p_step_title => 'Detalle de Rubro por Objeto'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_javascript_code => 
'function darBajaDocObjeto(ID) {'||unistr('\000a')||
'  document.getElementById(''P268_COMOBD_ID'').value = ID;'||unistr('\000a')||
'  abrir_ventana(''BAJA_COMOBD'',''P268_MOTIVO'',''Dar de Baja Documento'',''¿Desea Dar de Baja el Documento ?'','''','''');'||unistr('\000a')||
'}'
 ,p_step_template => 142024063791227091 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'CTISSERA'
 ,p_last_upd_yyyymmddhh24miss => '20170117131609'
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
  p_id=> 32422403620976035 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 268,
  p_plug_name=> 'Breadcrumb',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 142026170261227095+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(39997262003400368 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 142040566869227118+ wwv_flow_api.g_id_offset,
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
  p_id=> 32426626685299493 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 268,
  p_plug_name=> 'Datos del &P1_COMETQ_PRVS.',
  p_region_name=>'',
  p_region_attributes=> 'style="width:95%"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
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
s:=s||'select comobj.CODIGO'||unistr('\000a')||
'      ,comobj.comobt_nombre tipo_objeto '||unistr('\000a')||
'      ,comobj.DESCRIPCION'||unistr('\000a')||
'      ,REPLACE(comobj.DESCRIPCION,''<br>'',chr(10)) hint'||unistr('\000a')||
'      ,comobj.NOMBRE'||unistr('\000a')||
'      ,decode(comobj.COMOBE_ESTADO,''ANU'',''DE BAJA'',''BAJ'',comobj.COMOBE_ESTADO_DESC,''HAB'',comobj.COMOBE_ESTADO_DESC) COMOBE_ESTADO_DESC'||unistr('\000a')||
'      ,decode(COMPRV_PKG.COMOBJ_DEBE_SN(p_comprv_id => :P268_COMPRV_ID'||unistr('\000a')||
'                              ';

s:=s||'  ,p_comobj_id => comobj.ID),''NO'',''<span style="color:green"><b>AL DIA</b></span>'',''SI'',''<span style="color:red"><b>DEBE</b></span>'') DOCUMENTACION_OBJETO'||unistr('\000a')||
'      ,comobj.CREATED_BY_NOMBRE  '||unistr('\000a')||
'      ,comobj.COMOBE_MOTIVO MOTIVO_ESTADO'||unistr('\000a')||
'      ,comobj.ID'||unistr('\000a')||
'from COM_OBJETOS_V2 comobj'||unistr('\000a')||
'where comobj.COMPRV_ID = :P268_COMPRV_ID'||unistr('\000a')||
'and comobj.COMRUB_ID = :P268_COMRUB_ID'||unistr('\000a')||
'and comobj.COMOBE_ESTADO in (''HAB'',''ANU'',''BAJ';

s:=s||''')'||unistr('\000a')||
'/*and comobj.COMOBE_ID = (select max(comobe2.ID)'||unistr('\000a')||
'                        from   COM_OBJETOS_EST comobe2'||unistr('\000a')||
'                        where  comobe2.COMOBJ_ID = comobj.ID)*/'||unistr('\000a')||
'order by comobj.CODIGO';

wwv_flow_api.create_report_region (
  p_id=> 32433323325781131 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 268,
  p_name=> 'Objetos Por &P1_COMETQ_RUBS.',
  p_region_name=>'',
  p_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 30,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se encontraron Objetos por especialidad.',
  p_query_num_rows_type=> 'ROW_RANGES_WITH_LINKS',
  p_query_row_count_max=> '99999',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_prn_format=> 'PDF',
  p_prn_output_show_link=> 'Y',
  p_prn_output_link_text=> 'Print',
  p_prn_content_disposition=> 'ATTACHMENT',
  p_prn_document_header=> 'APEX',
  p_prn_units=> 'MILLIMETERS',
  p_prn_paper_size=> 'A4',
  p_prn_width_units=> 'PERCENTAGE',
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
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32433606356781164 + wwv_flow_api.g_id_offset,
  p_region_id=> 32433323325781131 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'CODIGO',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Código',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ID.:933:&SESSION.::&DEBUG.::P933_COMPRV_ID,P933_COMRUB_ID,P933_COMOBJ_ID,P933_COMOBJ_SN,G_APP_ANTERIOR,G_APP_ANTERIOR_PAG:&P268_COMPRV_ID.,&P268_COMRUB_ID.,#ID#,SI,&APP_ID.,&APP_PAGE_ID.',
  p_column_linktext=>'#CODIGO#',
  p_column_link_attr=>'title="#HINT#"',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
  p_print_col_width=> '8',
  p_column_comment=>':P933_COMPRV_ID,P933_COMRUB_ID,P933_COMODT_ID,P933_COMOBJ_ID,P933_COMOBJ_SN,G_APP_ANTERIOR,G_APP_ANTERIOR_PAG:'||unistr('\000a')||
'''||comprr.comprv_id||'',''||comprr.comrub_id||'',''||comode.ID||'',''||comode.COMOBJ_ID||'',SI''||'',&APP_ID.,&APP_PAGE_ID.');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32793206959796529 + wwv_flow_api.g_id_offset,
  p_region_id=> 32433323325781131 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'TIPO_OBJETO',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Objeto',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '8',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32433703190781167 + wwv_flow_api.g_id_offset,
  p_region_id=> 32433323325781131 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'DESCRIPCION',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Descripción',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_report_column_width=> '40',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '8',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32792227902756362 + wwv_flow_api.g_id_offset,
  p_region_id=> 32433323325781131 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'HINT',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Hint',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '8',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32433825389781168 + wwv_flow_api.g_id_offset,
  p_region_id=> 32433323325781131 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'NOMBRE',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Nombre',
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
  p_print_col_width=> '8',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32433914935781168 + wwv_flow_api.g_id_offset,
  p_region_id=> 32433323325781131 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'COMOBE_ESTADO_DESC',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Estado',
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
  p_print_col_width=> '8',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32438801553232864 + wwv_flow_api.g_id_offset,
  p_region_id=> 32433323325781131 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTACION_OBJETO',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Documentación',
  p_use_as_row_header=> 'N',
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
  p_print_col_width=> '8',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32825410313566731 + wwv_flow_api.g_id_offset,
  p_region_id=> 32433323325781131 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'CREATED_BY_NOMBRE',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Creado por',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '8',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 35122004341364043 + wwv_flow_api.g_id_offset,
  p_region_id=> 32433323325781131 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'MOTIVO_ESTADO',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Motivo Estado',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '8',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 366063529997925373 + wwv_flow_api.g_id_offset,
  p_region_id=> 32433323325781131 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '8',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select comobd.ID'||unistr('\000a')||
'      ,comobd.COMPRV_ID'||unistr('\000a')||
'      ,comobd.COMODT_NOMBRE  '||unistr('\000a')||
'      ,comobd.FECHA_PRESENTACION'||unistr('\000a')||
'      ,comobd.COMOBJ_CODIGO CODIGO'||unistr('\000a')||
'      ,comobd.COMOBJ_NOMBRE NOMBRE'||unistr('\000a')||
'      ,decode(comobd.COMODT_VENCIMIENTO_SN, ''SI'', to_char(comobd.FECHA_VENCIMIENTO,''DD/MM/YYYY''), ''INDEFINIDA'') FECHA_VENCIMIENTO'||unistr('\000a')||
'      ,comobd.OBSERVACION'||unistr('\000a')||
'      ,(case '||unistr('\000a')||
'          when INSTR(comobd.MIMETYPE,''pdf'') > 0 then ''<i';

s:=s||'mg src="#IMAGE_PREFIX#ws/download_pdf_32x24.gif">'''||unistr('\000a')||
'          when INSTR(comobd.MIMETYPE,''excel'') > 0 then ''<img src="#IMAGE_PREFIX#ws/download_csv_32x24.gif">'''||unistr('\000a')||
'          when INSTR(comobd.MIMETYPE,''oct'') > 0 then ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">'''||unistr('\000a')||
'          when INSTR(comobd.MIMETYPE,''word'') > 0 then ''<img src="#IMAGE_PREFIX#ws/download_rtf_32x24.gif">'''||unistr('\000a')||
'          when INSTR(comobd.MIMET';

s:=s||'YPE,''plain'') > 0 then ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'          when INSTR(comobd.MIMETYPE,''image'') > 0 then ''<img src="#IMAGE_PREFIX#ws/chart_32x24.gif">''    '||unistr('\000a')||
'          else'||unistr('\000a')||
'            ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'          end) ICONO'||unistr('\000a')||
'       /*,COMPRV_PKG.COMOBD_OBTN_ESTADO(p_segorg_id => SEGORG_ID --:P1_SEGORG_ID'||unistr('\000a')||
'                                     ,p_com';

s:=s||'prv_id => COMPRV_ID --:P268_COMPRV_ID'||unistr('\000a')||
'                                     ,p_comodt_id => comobd.COMODT_ID'||unistr('\000a')||
'                                     ,p_comobj_id => comobd.COMOBJ_ID) SITUACION*/'||unistr('\000a')||
'       ,''<span style="color:green"><b>VIGENTE</b></span>'' SITUACION'||unistr('\000a')||
'       ,''<a href="f?p=&APP_ID.:933:&SESSION.::&DEBUG.:933:P933_COMPRV_ID,P933_COMRUB_ID,P933_COMODT_ID,P933_COMOBJ_ID,P933_COMOBJ_SN,G_APP_AN';

s:=s||'TERIOR,G_APP_ANTERIOR_PAG:''||:P268_COMPRV_ID||'',''||:P268_COMRUB_ID||'',''||comobd.COMODT_ID||'',''||comobd.COMOBJ_ID||'',SI''||'',''||:APP_ID||'',''||:APP_PAGE_ID||''">Presentar</a>'' PRESENTAR'||unistr('\000a')||
'      ,DBMS_LOB.GETLENGTH(comobd.DOCUMENTO) DOCUMENTO'||unistr('\000a')||
'      ,(select comrub.NOMBRE '||unistr('\000a')||
'        from   COM_RUBROS comrub'||unistr('\000a')||
'        where  comrub.ID = comobd.COMRUB_ID)||decode(OBLIGATORIO_SN,''SI'','' - <span style="color:red">';

s:=s||'(OBLIGATORIO)</span>'','' - (OPCIONAL)'') RUBRO'||unistr('\000a')||
'      ,(decode(comobd.SITUACION,''VAL'',''<a href="#" onclick="darBajaDocObjeto(''||comobd.ID||'');return false;" alt="Dar de Baja Documento" title="Dar de Baja de Documento"><img src="#WORKSPACE_IMAGES#delete2.png"></a>'')) ANULAR_DOC'||unistr('\000a')||
'      ,comobd.COMOBT_NOMBRE OBJETO      '||unistr('\000a')||
'from   COM_OBJETOS_DOC_V comobd'||unistr('\000a')||
'where  COMPRV_ID = :P268_COMPRV_ID'||unistr('\000a')||
''||unistr('\000a')||
'--and   comobd.I';

s:=s||'D = COMPRV_PKG.COMOBD_COMPRV_OBTN_ID(p_comodt_id => comobd.COMODT_ID'||unistr('\000a')||
'--                                                  ,p_comprv_id => COMPRV_ID  --:P268_COMPRV_ID'||unistr('\000a')||
'--                                                  ,p_comobj_id => comobd.COMOBJ_ID)'||unistr('\000a')||
'--and    COMPRV_PKG.COMOBD_PRESENTADO_SN(p_segorg_id => SEGORG_ID  --:P1_SEGORG_ID'||unistr('\000a')||
'--                                      ,p_comprv_id => COMPRV_ID';

s:=s||'  --:P268_COMPRV_ID'||unistr('\000a')||
'--                                      ,p_comodt_id => comobd.COMODT_ID'||unistr('\000a')||
'--                                      ,p_comobj_id => comobd.COMOBJ_ID) <> ''NO PRESENTADO'''||unistr('\000a')||
'and   (select comodt.SITUACION from COM_OBJETOS_DOT_V comodt where comodt.ID = comobd.COMODT_ID) = ''VIG'''||unistr('\000a')||
'and     comobd.ID =  COMPRV_PKG.COMOBD_PRESENTADO_SN2(p_segorg_id => SEGORG_ID  --:P1_SEGORG_ID'||unistr('\000a')||
'             ';

s:=s||'                                        ,p_comprv_id => COMPRV_ID  --:P268_COMPRV_ID'||unistr('\000a')||
'                                                     ,p_comodt_id => comobd.COMODT_ID'||unistr('\000a')||
'                                                     ,p_comobj_id => comobd.COMOBJ_ID)'||unistr('\000a')||
'and   comobd.COMRUB_ID = :P268_COMRUB_ID                                     '||unistr('\000a')||
'order by comobd.COMOBJ_NOMBRE, comobd.COMODT_NOMBRE';

wwv_flow_api.create_report_region (
  p_id=> 32466532374212481 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 268,
  p_name=> 'Ultimos Documentos Presentados',
  p_region_name=>'',
  p_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 40,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se encontraron Documentos asociados.',
  p_query_num_rows_type=> 'ROW_RANGES_WITH_LINKS',
  p_query_row_count_max=> '99999',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'EXIST'||unistr('\000a')||
'select 1'||unistr('\000a')||
'from   COM_OBJETOS_DOC_V comobd'||unistr('\000a')||
'where comobd.COMPRV_ID = :P251_ID'||unistr('\000a')||
'and   comobd.COMRUB_ID = :P268_COMRUB_ID'||unistr('\000a')||
'and   comobd.SITUACION = ''VAL'''||unistr('\000a')||
'and   COMPRV_PKG.COMOBD_PRESENTADO_SN(p_segorg_id => comobd.SEGORG_ID  --:P1_SEGORG_ID'||unistr('\000a')||
'                                     ,p_comprv_id => comobd.COMPRV_ID  --:P268_COMPRV_ID'||unistr('\000a')||
'                                     ,p_comodt_id => comobd.COMODT_ID'||unistr('\000a')||
'                                     ,p_comobj_id => comobd.COMOBJ_ID) = ''PRESENTADO''');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32466806273212521 + wwv_flow_api.g_id_offset,
  p_region_id=> 32466532374212481 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 1,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ID.:928:&SESSION.::&DEBUG.:928:P928_ID,P928_COMPRV_ID,P928_PAG_ANTERIOR:#ID#,#COMPRV_ID#,&APP_PAGE_ID.',
  p_column_linktext=>'<img src="#IMAGE_PREFIX#e2.gif" alt="">',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
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
  p_id=> 32466917807212526 + wwv_flow_api.g_id_offset,
  p_region_id=> 32466532374212481 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Id Proveedor',
  p_use_as_row_header=> 'N',
  p_column_linktext=>'<img src="#IMAGE_PREFIX#e2.gif" alt="">',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
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
  p_id=> 32467032397212526 + wwv_flow_api.g_id_offset,
  p_region_id=> 32466532374212481 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMODT_NOMBRE',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Documento',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
  p_id=> 32467116996212526 + wwv_flow_api.g_id_offset,
  p_region_id=> 32466532374212481 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_PRESENTACION',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Fecha Presentación',
  p_use_as_row_header=> 'N',
  p_column_format=> 'DD/MM/YYYY',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
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
  p_id=> 32735032014961904 + wwv_flow_api.g_id_offset,
  p_region_id=> 32466532374212481 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'CODIGO',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Codigo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
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
  p_id=> 32800931167982793 + wwv_flow_api.g_id_offset,
  p_region_id=> 32466532374212481 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'NOMBRE',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Nombre',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
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
  p_id=> 32467322700212526 + wwv_flow_api.g_id_offset,
  p_region_id=> 32466532374212481 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VENCIMIENTO',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Fecha Vencimiento',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
  p_id=> 32467417200212526 + wwv_flow_api.g_id_offset,
  p_region_id=> 32466532374212481 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'OBSERVACION',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Comentario',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
  p_id=> 32467510831212526 + wwv_flow_api.g_id_offset,
  p_region_id=> 32466532374212481 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'ICONO',
  p_column_display_sequence=> 11,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32467610909212526 + wwv_flow_api.g_id_offset,
  p_region_id=> 32466532374212481 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION',
  p_column_display_sequence=> 12,
  p_column_heading=> 'Estado',
  p_use_as_row_header=> 'N',
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 36746824412443467 + wwv_flow_api.g_id_offset,
  p_region_id=> 32466532374212481 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'PRESENTAR',
  p_column_display_sequence=> 13,
  p_column_heading=> 'Presentar',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_report_column_required_role => 32355302792351493+ wwv_flow_api.g_id_offset,
  p_display_as=>'WITHOUT_MODIFICATION',
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
  p_id=> 32467705332212526 + wwv_flow_api.g_id_offset,
  p_region_id=> 32466532374212481 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 14,
  p_column_heading=> 'Documento',
  p_use_as_row_header=> 'N',
  p_column_format=> 'DOWNLOAD:COM_OBJETOS_DOC:DOCUMENTO:ID::MIMETYPE:FILENAME:LAST_UPDATE_DATE::Attachment:Abrir Doc.',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
  p_id=> 32467827360212526 + wwv_flow_api.g_id_offset,
  p_region_id=> 32466532374212481 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'RUBRO',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Rubro',
  p_use_as_row_header=> 'N',
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32467930430212526 + wwv_flow_api.g_id_offset,
  p_region_id=> 32466532374212481 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'ANULAR_DOC',
  p_column_display_sequence=> 15,
  p_column_heading=> 'Anular Doc',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_report_column_required_role => 32355302792351493+ wwv_flow_api.g_id_offset,
  p_display_as=>'WITHOUT_MODIFICATION',
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
  p_id=> 32467228234212526 + wwv_flow_api.g_id_offset,
  p_region_id=> 32466532374212481 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 15,
  p_form_element_id=> null,
  p_column_alias=> 'OBJETO',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Objeto',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select distinct comode.ID'||unistr('\000a')||
'       ,comode.COMOBJ_ID'||unistr('\000a')||
'       ,comode.COMOBJ_COMPRV_ID '||unistr('\000a')||
'       ,comode.SEGORG_ID '||unistr('\000a')||
'       ,comode.NOMBRE DOCUMENTO'||unistr('\000a')||
'       ,comode.comobt_nombre objeto'||unistr('\000a')||
'       ,comode.COMOBJ_CODIGO '||unistr('\000a')||
'       ,comode.COMOBJ_NOMBRE'||unistr('\000a')||
'       ,(select comrub.NOMBRE'||unistr('\000a')||
'        from   COM_RUBROS comrub'||unistr('\000a')||
'        where  comrub.ID = comode.COMOBJ_COMRUB_ID)||decode(comode.COMOTT_OBLIGATORIO_SN,''SI'','' - <s';

s:=s||'pan style="color:red">(OBLIGATORIO)</span>'''||unistr('\000a')||
'                                                                                             ,'' - (OPCIONAL)'') RUBRO'||unistr('\000a')||
'       ,ESTADO'||unistr('\000a')||
'       ,REPLACE(comode.NOMBRE,''<br>'',chr(10)) || chr(10) || REPLACE(comode.COMOBJ_DESCRIPCION,''<br>'',chr(10)) hint'||unistr('\000a')||
'from   COM_OBJETOS_DOC_ESTADO_V2 comode'||unistr('\000a')||
'where  comode.COMOBJ_COMPRV_ID = :P268_COMPRV_ID'||unistr('\000a')||
'and    comode.COMOBJ';

s:=s||'_COMRUB_ID = :P268_COMRUB_ID'||unistr('\000a')||
'and    comode.SEGORG_ID = :P1_SEGORG_ID'||unistr('\000a')||
'and    comode.ESTADO <> ''PRESENTADO'''||unistr('\000a')||
'and    COMODE.COMOBJ_COMRUB_ID IN (select comprr.comrub_id from COM_PROVEEDORES_RUB comprr where comprr.comprv_id = comode.COMOBJ_COMPRV_ID and SITUACION=''ACT'')'||unistr('\000a')||
'--and    comode.COMOTT_OBLIGATORIO_SN = ''NO'''||unistr('\000a')||
'order by comode.COMOBJ_CODIGO, comode.NOMBRE'||unistr('\000a')||
''||unistr('\000a')||
'';

wwv_flow_api.create_report_region (
  p_id=> 32483616209416031 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 268,
  p_name=> 'Documentos Vencidos / No Presentados',
  p_region_name=>'',
  p_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 50,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '99999',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se encontraron documentos asociados.',
  p_query_num_rows_type=> 'ROW_RANGES_WITH_LINKS',
  p_query_row_count_max=> '99999',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'and    comode.ESTADO = ''NO PRESENTADO'''||unistr('\000a')||
'--'||unistr('\000a')||
'union all'||unistr('\000a')||
'--'||unistr('\000a')||
'select  comobd.COMODT_ID COMODT_ID'||unistr('\000a')||
'       ,comobj.ID        COMOBJ_ID'||unistr('\000a')||
'       ,comobj.COMPRV_ID COMPRV_ID'||unistr('\000a')||
'       ,comobj.SEGORG_ID SEGORG_ID'||unistr('\000a')||
'       ,(select comodt.NOMBRE COMODT_NOMBRE'||unistr('\000a')||
'        from   COM_OBJETOS_DOT comodt'||unistr('\000a')||
'        where  comodt.ID = comobd.COMODT_ID) DOCUMENTO'||unistr('\000a')||
'       ,(select comobt.NOMBRE'||unistr('\000a')||
'         from   COM_OBJETOS_TIPOS comobt'||unistr('\000a')||
'         where  comobt.ID = comobj.COMOBT_ID) OBJETO'||unistr('\000a')||
'      ,comobj.CODIGO COMOBJ_CODIGO '||unistr('\000a')||
'      ,comobj.NOMBRE COMOBJ_NOMBRE'||unistr('\000a')||
'      ,(select comrub.NOMBRE'||unistr('\000a')||
'        from   COM_RUBROS comrub'||unistr('\000a')||
'        where  comrub.ID = comobj.COMRUB_ID)||decode((select OBLIGATORIO_SN'||unistr('\000a')||
'                                                      from   COM_OBJETOS_OTT comott'||unistr('\000a')||
'                                                       where  comott.COMOBT_ID = comobj.COMOBT_ID'||unistr('\000a')||
'                                                       and    comott.COMODT_ID = comobd.COMODT_ID)'||unistr('\000a')||
'                                                       ,''SI'','' - <span style="color:red">(OBLIGATORIO)</span>'','' - (OPCIONAL)'') RUBRO'||unistr('\000a')||
'      /*,comprv_pkg.comobd_obtn_estado(p_segorg_id      => comobj.segorg_id'||unistr('\000a')||
'                                   ,p_comprv_id      => comobj.comprv_id'||unistr('\000a')||
'                                   ,p_comodt_id      => comobd.comodt_id'||unistr('\000a')||
'                                   ,p_comobj_id      => comobj.ID) ESTADO_DESC  */ '||unistr('\000a')||
'      ,COMPRV_PKG.COMOBD_PRESENTADO_SN3(comobj.segorg_id,comobj.COMPRV_ID,comobd.comodt_id ,comobj.ID) ESTADO_DESC                                                    '||unistr('\000a')||
'      ,''<a href="f?p=&APP_ID.:933:&SESSION.::&DEBUG.:933:P933_COMPRV_ID,P933_COMRUB_ID,P933_COMODT_ID,P933_COMOBJ_ID,P933_COMOBJ_SN,G_APP_ANTERIOR,G_APP_ANTERIOR_PAG:''||:P268_COMPRV_ID||'',''||:P268_COMRUB_ID||'',''||comobd.COMODT_ID||'',''||comobd.COMOBJ_ID||'',SI''||'',''||:APP_ID||'',''||:APP_PAGE_ID||''">Presentar</a>'' PRESENTAR                                                       '||unistr('\000a')||
'      ,DBMS_LOB.GETLENGTH(comobd.DOCUMENTO) DESCARGA     '||unistr('\000a')||
'      ,comobd.ID ID'||unistr('\000a')||
'from   COM_OBJETOS_DOC comobd'||unistr('\000a')||
'      ,COM_OBJETOS     comobj                                                                               '||unistr('\000a')||
'where  comobd.COMOBJ_ID = comobj.ID'||unistr('\000a')||
'and    comobj.COMPRV_ID = :P268_COMPRV_ID'||unistr('\000a')||
'and    comobj.COMRUB_ID = :P268_COMRUB_ID'||unistr('\000a')||
'and    comobd.ID =comprv_pkg.comobd_presentado_sn2 (comobj.segorg_id,'||unistr('\000a')||
'                                        comobj.comprv_id,'||unistr('\000a')||
'                                        comobd.comodt_id,'||unistr('\000a')||
'                                        comobj.ID)'||unistr('\000a')||
'/*and    comprv_pkg.comobd_presentado_sn (comobj.segorg_id,'||unistr('\000a')||
'                                        comobj.comprv_id,'||unistr('\000a')||
'                                        comobd.comodt_id,'||unistr('\000a')||
'                                        comobj.ID) not in (''PRESENTADO'', ''NO PRESENTADO'')'||unistr('\000a')||
'and    comobd.ID = COMPRV_PKG.COMOBD_COMPRV_OBTN_ID(p_comodt_id => comobd.comodt_id'||unistr('\000a')||
'                                                   ,p_comprv_id => :P268_COMPRV_ID'||unistr('\000a')||
'                                                   ,p_comobj_id => comobd.COMOBJ_ID)*/'||unistr('\000a')||
''||unistr('\000a')||
')'||unistr('\000a')||
''||unistr('\000a')||
'order by COMOBJ_CODIGO, DOCUMENTO                                                   '||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'EXIST'||unistr('\000a')||
'select 1'||unistr('\000a')||
'from   COM_OBJETOS_V comobj'||unistr('\000a')||
'where  comobj.COMPRV_ID = :P268_COMPRV_ID'||unistr('\000a')||
'and    comobj.COMRUB_ID = :P268_COMRUB_ID'||unistr('\000a')||
'and    comobj.COMOBE_ESTADO = ''HAB''');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 36108305240007028 + wwv_flow_api.g_id_offset,
  p_region_id=> 32483616209416031 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Id',
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
  p_id=> 32484023413416065 + wwv_flow_api.g_id_offset,
  p_region_id=> 32483616209416031 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMOBJ_ID',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Comobj Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
  p_id=> 366060912880766160 + wwv_flow_api.g_id_offset,
  p_region_id=> 32483616209416031 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMOBJ_COMPRV_ID',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Comobj Comprv Id',
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
  p_id=> 32484207631416065 + wwv_flow_api.g_id_offset,
  p_region_id=> 32483616209416031 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'SEGORG_ID',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Segorg Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
  p_id=> 32484317460416065 + wwv_flow_api.g_id_offset,
  p_region_id=> 32483616209416031 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Documento',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
  p_id=> 32800604235964914 + wwv_flow_api.g_id_offset,
  p_region_id=> 32483616209416031 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'OBJETO',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Objeto',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
  p_id=> 32484415470416065 + wwv_flow_api.g_id_offset,
  p_region_id=> 32483616209416031 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'COMOBJ_CODIGO',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Código',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ID.:933:&SESSION.::&DEBUG.:933:P933_COMPRV_ID,P933_COMRUB_ID,P933_COMODT_ID,P933_COMOBJ_ID,P933_COMOBJ_SN,G_APP_ANTERIOR,G_APP_ANTERIOR_PAG:&P268_COMPRV_ID.,&P268_COMRUB_ID.,#ID#,#COMOBJ_ID#,SI,&APP_ID.,&APP_PAGE_ID.',
  p_column_linktext=>'#COMOBJ_CODIGO#',
  p_column_link_attr=>'title="#HINT#"',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
  p_id=> 32484512406416065 + wwv_flow_api.g_id_offset,
  p_region_id=> 32483616209416031 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'COMOBJ_NOMBRE',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Nombre',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
  p_id=> 32484616218416065 + wwv_flow_api.g_id_offset,
  p_region_id=> 32483616209416031 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'RUBRO',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Rubro',
  p_use_as_row_header=> 'N',
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 366060205597708762 + wwv_flow_api.g_id_offset,
  p_region_id=> 32483616209416031 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'ESTADO',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Estado',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 366070310123506192 + wwv_flow_api.g_id_offset,
  p_region_id=> 32483616209416031 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'HINT',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Hint',
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
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select comobd.COMODT_NOMBRE'||unistr('\000a')||
'      ,comobd.OBSERVACION COMENTARIO'||unistr('\000a')||
'      ,comobd.COMOBT_NOMBRE OBJETO'||unistr('\000a')||
'      ,comobd.COMOBJ_CODIGO CODIGO'||unistr('\000a')||
'      ,comobd.COMOBJ_NOMBRE NOMBRE'||unistr('\000a')||
'      ,comobd.FECHA_VENCIMIENTO'||unistr('\000a')||
'      ,(case '||unistr('\000a')||
'          when INSTR(comobd.MIMETYPE,''pdf'') > 0 then ''<img src="#IMAGE_PREFIX#ws/download_pdf_32x24.gif">'''||unistr('\000a')||
'          when INSTR(comobd.MIMETYPE,''excel'') > 0 then ''<img src="#IMAGE_PREF';

s:=s||'IX#ws/download_csv_32x24.gif">'''||unistr('\000a')||
'          when INSTR(comobd.MIMETYPE,''oct'') > 0 then ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">'''||unistr('\000a')||
'          when INSTR(comobd.MIMETYPE,''word'') > 0 then ''<img src="#IMAGE_PREFIX#ws/download_rtf_32x24.gif">'''||unistr('\000a')||
'          when INSTR(comobd.MIMETYPE,''plain'') > 0 then ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'          when INSTR(comobd.MIMETYPE,''image'') > 0 then ''';

s:=s||'<img src="#IMAGE_PREFIX#ws/chart_32x24.gif">''    '||unistr('\000a')||
'          else'||unistr('\000a')||
'            ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'          end) ICONO      '||unistr('\000a')||
'      ,DBMS_LOB.GETLENGTH(comobd.DOCUMENTO) DOCUMENTO'||unistr('\000a')||
'      ,comobd.FILENAME'||unistr('\000a')||
'      ,comobd.MIMETYPE'||unistr('\000a')||
'      ,comobd.LAST_UPDATE_DATE'||unistr('\000a')||
'      ,comobd.SITUACION_ABR'||unistr('\000a')||
'      ,comobd.MOTIVO_SITUACION'||unistr('\000a')||
'from   COM_OBJETOS_DOC_V comobd'||unistr('\000a')||
'where  comobd.COMPRV_ID ';

s:=s||'= :P268_COMPRV_ID'||unistr('\000a')||
'and    comobd.SITUACION = ''BAJ'''||unistr('\000a')||
'and    comobd.COMRUB_ID = :P268_COMRUB_ID'||unistr('\000a')||
'order by comobd.FECHA_PRESENTACION';

wwv_flow_api.create_report_region (
  p_id=> 32487015610472626 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 268,
  p_name=> 'Documentos Dados de Baja',
  p_region_name=>'',
  p_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 60,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se encontraron Documentos asociados.',
  p_query_num_rows_type=> 'ROW_RANGES_WITH_LINKS',
  p_query_row_count_max=> '99999',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'EXIST'||unistr('\000a')||
'select 1'||unistr('\000a')||
'from   COM_OBJETOS_DOC_V comobd'||unistr('\000a')||
'where comobd.COMPRV_ID = :P268_COMPRV_ID'||unistr('\000a')||
'and   comobd.COMRUB_ID = :P268_COMRUB_ID'||unistr('\000a')||
'and   comobd.SITUACION = ''BAJ''');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32487300693472637 + wwv_flow_api.g_id_offset,
  p_region_id=> 32487015610472626 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMODT_NOMBRE',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Documento',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
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
  p_id=> 32487407114472640 + wwv_flow_api.g_id_offset,
  p_region_id=> 32487015610472626 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMENTARIO',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Comentario',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
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
  p_id=> 32800024507955514 + wwv_flow_api.g_id_offset,
  p_region_id=> 32487015610472626 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'OBJETO',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Objeto',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
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
  p_id=> 32800129779955514 + wwv_flow_api.g_id_offset,
  p_region_id=> 32487015610472626 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'CODIGO',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Codigo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
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
  p_id=> 32800217398955514 + wwv_flow_api.g_id_offset,
  p_region_id=> 32487015610472626 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'NOMBRE',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Nombre',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
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
  p_id=> 32487522813472640 + wwv_flow_api.g_id_offset,
  p_region_id=> 32487015610472626 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VENCIMIENTO',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Fecha Vencimiento',
  p_use_as_row_header=> 'N',
  p_column_format=> 'DD/MM/YYYY',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
  p_id=> 32487607135472640 + wwv_flow_api.g_id_offset,
  p_region_id=> 32487015610472626 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'ICONO',
  p_column_display_sequence=> 7,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32487713674472640 + wwv_flow_api.g_id_offset,
  p_region_id=> 32487015610472626 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Documento',
  p_use_as_row_header=> 'N',
  p_column_format=> 'DOWNLOAD:COM_OBJETOS_DOC:DOCUMENTO:ID::MIMETYPE:FILENAME:LAST_UPDATE_DATE::Attachment:Abrir Doc.',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
  p_id=> 36374510792267107 + wwv_flow_api.g_id_offset,
  p_region_id=> 32487015610472626 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'FILENAME',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Filename',
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
  p_id=> 36374622690267112 + wwv_flow_api.g_id_offset,
  p_region_id=> 32487015610472626 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'MIMETYPE',
  p_column_display_sequence=> 12,
  p_column_heading=> 'Mimetype',
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
  p_id=> 36374712392267112 + wwv_flow_api.g_id_offset,
  p_region_id=> 32487015610472626 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'LAST_UPDATE_DATE',
  p_column_display_sequence=> 13,
  p_column_heading=> 'Last Update Date',
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
  p_id=> 32487801737472640 + wwv_flow_api.g_id_offset,
  p_region_id=> 32487015610472626 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION_ABR',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Situación',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
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
  p_id=> 32487920621472640 + wwv_flow_api.g_id_offset,
  p_region_id=> 32487015610472626 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'MOTIVO_SITUACION',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Motivo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
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
  p_id=> 32492106494611934 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 268,
  p_plug_name=> 'Ventana Confirmar',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 34680714813439912+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 70,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 13,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 32523606913556617 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 268,
  p_plug_name=> 'Operaciones Habilitadas',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 142030956068227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 80,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 32523106175556600 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 142037578156227112+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_required_role => 32355302792351493+ wwv_flow_api.g_id_offset,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 32434401554803265 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 268,
  p_button_sequence=> 10,
  p_button_plug_id => 32426626685299493+wwv_flow_api.g_id_offset,
  p_button_name    => 'RETORNAR',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Retornar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:251:&SESSION.::&DEBUG.:::',
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
  p_id=>32426901013306192 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 268,
  p_name=>'P268_COMPRV_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 32426626685299493+wwv_flow_api.g_id_offset,
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
  p_id=>32429432554489156 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 268,
  p_name=>'P268_COMPRT_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 32426626685299493+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tipo &P1_COMETQ_PRVS.:',
  p_source=>'COMPRT_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select comprt.NOMBRE d, comprt.ID r'||unistr('\000a')||
'from   COM_PROVEEDORES_TIPOS_V comprt'||unistr('\000a')||
'where  comprt.ID = :P268_COMPRT_ID',
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
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
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
  p_id=>32429808604515410 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 268,
  p_name=>'P268_COMPRV_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 32426626685299493+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'&P1_COMETQ_RUB.:',
  p_source=>'NOMBRE',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
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
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
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
  p_id=>32430001487518725 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 268,
  p_name=>'P268_COMPRV_CUIT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 32426626685299493+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'CUIT:',
  p_source=>'CUIT',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
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
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
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
  p_id=>32430228216521578 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 268,
  p_name=>'P268_COMRUB_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 32426626685299493+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'&P1_COMETQ_RUBS.:',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select comrub.NOMBRE d, comrub.ID r'||unistr('\000a')||
'from   COM_RUBROS comrub'||unistr('\000a')||
'where  comrub.ID = :P268_COMRUB_ID',
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
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
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
  p_id=>32491312123549792 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 268,
  p_name=>'P268_COMOBD_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 32426626685299493+wwv_flow_api.g_id_offset,
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
  p_id=>32491505438552957 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 268,
  p_name=>'P268_MOTIVO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 32426626685299493+wwv_flow_api.g_id_offset,
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

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||unistr('\000a')||
'  update COM_OBJETOS_DOC comobd'||unistr('\000a')||
'  set    comobd.SITUACION = ''BAJ'''||unistr('\000a')||
'        ,comobd.FECHA_SITUACION = sysdate'||unistr('\000a')||
'        ,comobd.MOTIVO_SITUACION = :P268_MOTIVO'||unistr('\000a')||
'  where  comobd.ID = :P268_COMOBD_ID;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 32491819522606200 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 268,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'DarBajaDocumentoObjeto',
  p_process_sql_clob => p,
  p_process_error_message=> 'El Documento no ha podido ser dado de baja.',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=>'BAJA_COMOBD',
  p_process_when_type=>'REQUEST_EQUALS_CONDITION',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> 'El Documento ha sido dado de baja con éxito.',
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
p:=p||'F|#OWNER#:COM_PROVEEDORES:P268_COMPRV_ID:ID';

wwv_flow_api.create_page_process(
  p_id     => 32429110821474714 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 268,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from COM_PROVEEDORES_DOC',
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
 
---------------------------------------
-- ...updatable report columns for page 268
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
