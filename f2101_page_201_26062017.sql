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
--   Date and Time:   09:57 Lunes Junio 26, 2017
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

PROMPT ...Remove page 201
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>201);
 
end;
/

 
--application/pages/page_00201
prompt  ...PAGE 201: Detalle Trámites Inscripción Proveedores
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 201
 ,p_user_interface_id => 70527406842675 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'ADMINISTRACION'
 ,p_name => 'Detalle Trámites Inscripción Proveedores'
 ,p_step_title => 'Detalle Trámites Inscripción Proveedores'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Detalle de Solicitud de Inscripción'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 15883602747762769 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'FKASIAN'
 ,p_last_upd_yyyymmddhh24miss => '20170607170026'
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
  p_id=> 11868518781470271 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_plug_name=> 'Información de Auditoría',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142027958134227099+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 40,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_2',
  p_plug_item_display_point=> 'BELOW',
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
  p_id=> 11869616170470287 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 12029130264692171 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_plug_name=> 'Detalle del Trámite',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_2',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_footer=> '<a href="javascript:popupURL(''f?p=2101:842:&SESSION.::NO:842:P842_COMPRV_ID:&P201_COMPRV_ID.'');"" title="Ver Detalle del Proveedor" style="margin-left:10px;">Ver Detalle del Proveedor</a>',
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
s:=s||'SELECT COMTPD_V.COMTPR_ID'||unistr('\000a')||
'      ,COMTPD_V.COMDMT_ID'||unistr('\000a')||
'      ,''<b>''||COMTPD_V.COMDMT_NOMBRE||''</b>'' COMDMT_NOMBRE'||unistr('\000a')||
'      ,LTRIM(RTRIM(COMTPD_V.COMDOM_PAIS||'' - ''||COMTPD_V.COMDOM_PROVINCIA||'' - ''||COMTPD_V.COMDOM_DEPARTAMENTO||'' - ''||COMTPD_V.COMDOM_LOCALIDAD)) UBICACION'||unistr('\000a')||
'      ,COMTPD_V.COMDOM_CALLE||'' ''||COMTPD_V.COMDOM_NUMERO_CASA||'' ''||COMTPD_V.COMDOM_PISO||'' ''||COMTPD_V.COMDOM_DPTO||'' ''||COMTPD_V.';

s:=s||'COMDOM_OBSERVACION||'' ''||DECODE(COMTPD_V.COMDOM_CODIGO_POSTAL,'''','''',''C.P.:''||COMTPD_V.COMDOM_CODIGO_POSTAL)  DIRECCION'||unistr('\000a')||
'      ,COMTPD_V.COMDOM_TELEFONO_CODIGO_AREA'||unistr('\000a')||
'       ||''-''||COMTPD_V.COMDOM_TELEFONO_NUMERO TELEFONO'||unistr('\000a')||
'      ,COMTPD_V.COMDOM_FAX_CODIGO_AREA||''-''||COMTPD_V.COMDOM_FAX_NUMERO FAX'||unistr('\000a')||
'      ,COMTPD_V.OPERACION'||unistr('\000a')||
'      ,''<hr>'' linea '||unistr('\000a')||
' FROM COM_TRAMITES_PRV_DOM_V COMTPD_V'||unistr('\000a')||
'  WHERE COMTPD_V.COMT';

s:=s||'PR_ID = :P201_ID';

wwv_flow_api.create_report_region (
  p_id=> 12104226340883249 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_name=> 'Detalle de Domicilios',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 30,
  p_region_attributes=>'style="width:60%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> ':P201_TIPO NOT IN (''PDOI'',''INCT'',''AIAU'',''BAJC'',''ADAU'')',
  p_display_condition_type=> 'PLSQL_EXPRESSION',
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
  p_query_no_data_found=> 'No se han indicado domicilios.',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_prn_format=> 'PDF',
  p_prn_output_show_link=> 'Y',
  p_prn_output_link_text=> 'Imprimir',
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
  p_prn_page_header_alignment=> 'LEFT',
  p_prn_page_footer_alignment=> 'LEFT',
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
  p_id=> 12118123579958166 + wwv_flow_api.g_id_offset,
  p_region_id=> 12104226340883249 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMTPR_ID',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Comtpr Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
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
  p_id=> 12104603264883262 + wwv_flow_api.g_id_offset,
  p_region_id=> 12104226340883249 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMDMT_ID',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Comdmt Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
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
  p_id=> 12122910943992354 + wwv_flow_api.g_id_offset,
  p_region_id=> 12104226340883249 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMDMT_NOMBRE',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Tipo',
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
  p_print_col_width=> '12',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12665818436073651 + wwv_flow_api.g_id_offset,
  p_region_id=> 12104226340883249 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'UBICACION',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Ubicación',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '12',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12128102951113032 + wwv_flow_api.g_id_offset,
  p_region_id=> 12104226340883249 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'DIRECCION',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Dirección',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '12',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12128616588126426 + wwv_flow_api.g_id_offset,
  p_region_id=> 12104226340883249 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'TELEFONO',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Teléfono',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '12',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12392824698089204 + wwv_flow_api.g_id_offset,
  p_region_id=> 12104226340883249 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'FAX',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Fax',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '12',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12412114879502769 + wwv_flow_api.g_id_offset,
  p_region_id=> 12104226340883249 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'OPERACION',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Operación a realizar',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'TEXT_FROM_LOV',
  p_named_lov=>12413722067523687 + wwv_flow_api.g_id_offset,
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '12',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1251011567416506 + wwv_flow_api.g_id_offset,
  p_region_id=> 12104226340883249 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'LINEA',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Linea',
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
  p_print_col_width=> '12',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT comtpr_id'||unistr('\000a')||
'      ,comrub_id'||unistr('\000a')||
'      ,observacion'||unistr('\000a')||
'      ,comrub_codigo||'' - ''||comrub_nombre comrub_nombre'||unistr('\000a')||
'      ,comrub_descripcion'||unistr('\000a')||
'      ,comrub_situacion'||unistr('\000a')||
'      ,operacion'||unistr('\000a')||
'      ,''<hr>'' linea '||unistr('\000a')||
' FROM COM_TRAMITES_PRV_RUB_V   '||unistr('\000a')||
'WHERE COMTPR_ID = :P201_ID'||unistr('\000a')||
'ORDER BY observacion desc';

wwv_flow_api.create_report_region (
  p_id=> 12129110747153102 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_name=> 'Detalle de &P1_COMETQ_RUB.',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 40,
  p_region_attributes=>'style="width:60%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> ':P201_TIPO NOT IN (''PDOI'',''INCT'',''AIAU'',''BAJC'',''ADAU'')',
  p_display_condition_type=> 'PLSQL_EXPRESSION',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se ha indicado &P1_COMETQ_RUB.',
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
  p_id=> 12129907843153104 + wwv_flow_api.g_id_offset,
  p_region_id=> 12129110747153102 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMTPR_ID',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Comtpr Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
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
  p_id=> 12135112226210357 + wwv_flow_api.g_id_offset,
  p_region_id=> 12129110747153102 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMRUB_ID',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Comrub Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
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
  p_id=> 12135311999210357 + wwv_flow_api.g_id_offset,
  p_region_id=> 12129110747153102 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'OBSERVACION',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Tipo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12135403564210357 + wwv_flow_api.g_id_offset,
  p_region_id=> 12129110747153102 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COMRUB_NOMBRE',
  p_column_display_sequence=> 3,
  p_column_heading=> '&P1_COMETQ_RUB.',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12135502728210357 + wwv_flow_api.g_id_offset,
  p_region_id=> 12129110747153102 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMRUB_DESCRIPCION',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Comrub Descripcion',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
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
  p_id=> 12135620939210357 + wwv_flow_api.g_id_offset,
  p_region_id=> 12129110747153102 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'COMRUB_SITUACION',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Comrub Situacion',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
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
  p_id=> 12135710934210357 + wwv_flow_api.g_id_offset,
  p_region_id=> 12129110747153102 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'OPERACION',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Operación a realizar',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'TEXT_FROM_LOV',
  p_named_lov=>12413302674518099 + wwv_flow_api.g_id_offset,
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
  p_id=> 12625205073054282 + wwv_flow_api.g_id_offset,
  p_region_id=> 12129110747153102 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'LINEA',
  p_column_display_sequence=> 8,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
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
s:=s||'SELECT comres_nombre'||unistr('\000a')||
'      ,comres_tipo_documento||'': ''||comres_numero_documento Documento'||unistr('\000a')||
'      ,comres_email'||unistr('\000a')||
'      ,operacion'||unistr('\000a')||
'      ,''<hr>'' linea '||unistr('\000a')||
'  FROM COM_TRAMITES_PRV_RES_V'||unistr('\000a')||
' WHERE COMTPR_ID = :P201_ID';

wwv_flow_api.create_report_region (
  p_id=> 12139432358244558 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_name=> 'Detalle de &P1_COMETQ_PRS.',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 50,
  p_region_attributes=>'style="width:60%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> ':P201_TIPO NOT IN (''PDOI'',''INCT'',''AIAU'',''BAJC'',''ADAU'')',
  p_display_condition_type=> 'PLSQL_EXPRESSION',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se han indicado &P1_COMETQ_PRS..',
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
  p_id=> 12145532210298812 + wwv_flow_api.g_id_offset,
  p_region_id=> 12139432358244558 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMRES_NOMBRE',
  p_column_display_sequence=> 1,
  p_column_heading=> '&P1_COMETQ_PRSS.',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12148508950322899 + wwv_flow_api.g_id_offset,
  p_region_id=> 12139432358244558 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Documento',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12145630802298812 + wwv_flow_api.g_id_offset,
  p_region_id=> 12139432358244558 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMRES_EMAIL',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Email',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12456317732534977 + wwv_flow_api.g_id_offset,
  p_region_id=> 12139432358244558 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'OPERACION',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Operación a realizar',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'TEXT_FROM_LOV',
  p_named_lov=>12452008448501587 + wwv_flow_api.g_id_offset,
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
  p_id=> 12625408882055390 + wwv_flow_api.g_id_offset,
  p_region_id=> 12139432358244558 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'LINEA',
  p_column_display_sequence=> 5,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
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
s:=s||':P201_INFORMACION := NULL;'||unistr('\000a')||
'IF :P201_SITUACION IN (''REC'',''PEN'') AND :P201_TIPO = ''INSC'' THEN'||unistr('\000a')||
'DECLARE'||unistr('\000a')||
'  CURSOR cr_comprv is'||unistr('\000a')||
'  SELECT *'||unistr('\000a')||
'  FROM COM_PROVEEDORES'||unistr('\000a')||
'  WHERE CUIT = :P201_CUIT;'||unistr('\000a')||
'  v_comprv COM_PROVEEDORES%ROWTYPE;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  OPEN cr_comprv;'||unistr('\000a')||
'  FETCH cr_comprv INTO v_comprv;'||unistr('\000a')||
'  CLOSE cr_comprv;'||unistr('\000a')||
'  IF v_comprv.NOMBRE IS NOT NULL THEN'||unistr('\000a')||
'   htp.print(''<img src="#IMAGE_PREFIX#warningicon_pagetitle.gif">'||unistr('\000a')||
'<';

s:=s||'font color="red"><b>ATENCIÓN!!</b></font><br>El Trámite no puede ser Aceptado.<br><br><b>¿Por qué?:</b><br>Porque YA EXISTE un proveedor inscripto con el mismo CUIT.<br><br>'||unistr('\000a')||
'<b>..y qué debo hacer?</b><br>'||unistr('\000a')||
'. Si el Proveedor que solicita la inscripción es el mismo que se encuentra inscripto, rechace este trámite pues ya fue realizado.<br>'||unistr('\000a')||
'. Si el Proveedor que solicita la inscripción ha indicado mal';

s:=s||' el CUIT, rechace este trámite y solicite una nueva inscripción con los datos correctos.'');'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END;'||unistr('\000a')||
'END IF;';

wwv_flow_api.create_page_plug (
  p_id=> 12630731851270235 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_plug_name=> 'Mensajes del Sistema',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 2,
  p_plug_display_point=> 'BODY_2',
  p_plug_item_display_point=> 'BELOW',
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
  p_plug_header=> ' '||unistr('\000a')||
''||unistr('\000a')||
'',
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
  p_id=> 15808218612171816 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_plug_name=> 'Datos Generales',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 50,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_2',
  p_plug_item_display_point=> 'BELOW',
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
  p_id=> 16066918511964955 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_plug_name=> 'Notificaciones',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142030956068227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 70,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 16065401496931657 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 142037578156227112+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_required_role => 7358918341970096+ wwv_flow_api.g_id_offset,
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => ':P201_SITUACION IN (''APR'',''RCH'',''REC'')',
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
  p_id=> 16114624257631960 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_plug_name=> 'Informes & Comprobantes',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142030956068227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 60,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 16115620579640277 + wwv_flow_api.g_id_offset,
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
  p_id=> 16117920279668649 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_plug_name=> 'Operaciones Habilitadas',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142030956068227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 50,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 16118825259679562 + wwv_flow_api.g_id_offset,
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
s:=s||'SELECT COMPRD_V.COMPRV_ID'||unistr('\000a')||
'      ,''<b>''||COMPRD_V.COMDMT_NOMBRE||''<b>'' COMDMT_NOMBRE'||unistr('\000a')||
'      ,''  ''||LTRIM(RTRIM(COMPRD_V.COMDOM_PAIS||''  ''||COMPRD_V.COMDOM_PROVINCIA||'' <br> ''||COMPRD_V.COMDOM_DEPARTAMENTO||''  ''||COMPRD_V.COMDOM_LOCALIDAD)) UBICACION'||unistr('\000a')||
'      ,COMPRD_V.COMDOM_CALLE||'' ''||COMPRD_V.COMDOM_NUMERO_CASA||'' ''|| COMPRD_V.COMDOM_PISO||'' ''||COMPRD_V.COMDOM_DPTO||'' ''||COMPRD_V.COMDOM_OBSERVACION|';

s:=s||'|'' ''||DECODE(COMPRD_V.COMDOM_CODIGO_POSTAL,'''','''',''<br>  C.P.:''||COMPRD_V.COMDOM_CODIGO_POSTAL)  DIRECCION'||unistr('\000a')||
'      ,'' Tel: ''||COMPRD_V.COMDOM_TELEFONO_CODIGO_AREA'||unistr('\000a')||
'       ||''-''||COMPRD_V.COMDOM_TELEFONO_NUMERO||''<br>Fax: ''||'||unistr('\000a')||
'      COMPRD_V.COMDOM_FAX_CODIGO_AREA||'' ''||COMPRD_V.COMDOM_FAX_NUMERO TELEFONO'||unistr('\000a')||
'      ,'' <b>''||(select rv_abbreviation'||unistr('\000a')||
'         from   cg_ref_codes'||unistr('\000a')||
'        where  rv_domain = ''COM';

s:=s||'_PROVEEDORES_DOM.SITUACION'''||unistr('\000a')||
'          and rv_low_value = COMPRD_V.SITUACION)'||unistr('\000a')||
'      ||''</b> desde el: ''|| NVL(COMPRD_V.FECHA_VALIDEZ,COMPRD_V.FECHA_VIGENCIA) SITUACIONES'||unistr('\000a')||
'      ,COMPRD_V.SITUACION'||unistr('\000a')||
'      ,COMPRD_V.FECHA_VIGENCIA'||unistr('\000a')||
'      ,COMPRD_V.FECHA_VALIDEZ'||unistr('\000a')||
'      ,COMPRD_V.COMDOM_PAIS'||unistr('\000a')||
'      ,COMPRD_V.COMDOM_PROVINCIA'||unistr('\000a')||
'      ,COMPRD_V.COMDOM_LOCALIDAD'||unistr('\000a')||
'      ,LTRIM(RTRIM(COMPRD_V.COMDOM_NUMERO_CASA||'' ';

s:=s||'''||COMPRD_V.COMDOM_CALLE)) COMDOM_CALLE'||unistr('\000a')||
'      ,(case when COMPRD_V.COMDOM_NUMERO_CASA IS NOT NULL AND'||unistr('\000a')||
'                  COMPRD_V.COMDOM_CALLE IS NOT NULL then'||unistr('\000a')||
'         ''Ver en Google Maps'''||unistr('\000a')||
'       else'||unistr('\000a')||
'         '''''||unistr('\000a')||
'       end) ACCIONES'||unistr('\000a')||
'      ,''<hr>'' linea'||unistr('\000a')||
' FROM COM_PROVEEDORES_DOM_V COMPRD_V'||unistr('\000a')||
'  WHERE COMPRD_V.COMPRV_ID = :P201_COMPRV_ID;';

wwv_flow_api.create_report_region (
  p_id=> 20045810689052005 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_name=> 'Detalle de Domicilios Actuales',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 35,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> ':P201_TIPO IN (''ACDL'',''ALDC'')',
  p_display_condition_type=> 'PLSQL_EXPRESSION',
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
  p_query_no_data_found=> 'No se ha encontrado ningún dato',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_prn_format=> 'PDF',
  p_prn_output_show_link=> 'Y',
  p_prn_output_link_text=> 'Imprimir',
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
  p_prn_page_header_alignment=> 'LEFT',
  p_prn_page_footer_alignment=> 'LEFT',
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
  p_id=> 20048329221095241 + wwv_flow_api.g_id_offset,
  p_region_id=> 20045810689052005 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Comprv Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '6',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20046221260052016 + wwv_flow_api.g_id_offset,
  p_region_id=> 20045810689052005 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMDMT_NOMBRE',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Tipo',
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
  p_print_col_width=> '6',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20046328411052016 + wwv_flow_api.g_id_offset,
  p_region_id=> 20045810689052005 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'UBICACION',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Ubicación',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '6',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20046412571052016 + wwv_flow_api.g_id_offset,
  p_region_id=> 20045810689052005 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'DIRECCION',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Dirección',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '6',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20046527059052016 + wwv_flow_api.g_id_offset,
  p_region_id=> 20045810689052005 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'TELEFONO',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Teléfono',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '6',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20048432628095243 + wwv_flow_api.g_id_offset,
  p_region_id=> 20045810689052005 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACIONES',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Situaciones',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '6',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20048507080095243 + wwv_flow_api.g_id_offset,
  p_region_id=> 20045810689052005 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Situacion',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '6',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20048607861095243 + wwv_flow_api.g_id_offset,
  p_region_id=> 20045810689052005 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VIGENCIA',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Fecha Vigencia',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '6',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20048705319095243 + wwv_flow_api.g_id_offset,
  p_region_id=> 20045810689052005 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VALIDEZ',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Fecha Validez',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '6',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20048817782095243 + wwv_flow_api.g_id_offset,
  p_region_id=> 20045810689052005 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'COMDOM_PAIS',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Comdom Pais',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '6',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20048931544095243 + wwv_flow_api.g_id_offset,
  p_region_id=> 20045810689052005 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'COMDOM_PROVINCIA',
  p_column_display_sequence=> 12,
  p_column_heading=> 'Comdom Provincia',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '6',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20049026135095243 + wwv_flow_api.g_id_offset,
  p_region_id=> 20045810689052005 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'COMDOM_LOCALIDAD',
  p_column_display_sequence=> 13,
  p_column_heading=> 'Comdom Localidad',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '6',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20049112845095243 + wwv_flow_api.g_id_offset,
  p_region_id=> 20045810689052005 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'COMDOM_CALLE',
  p_column_display_sequence=> 14,
  p_column_heading=> 'Comdom Calle',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '6',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20049227346095243 + wwv_flow_api.g_id_offset,
  p_region_id=> 20045810689052005 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'ACCIONES',
  p_column_display_sequence=> 15,
  p_column_heading=> 'Acciones',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '6',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20046800813052016 + wwv_flow_api.g_id_offset,
  p_region_id=> 20045810689052005 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 15,
  p_form_element_id=> null,
  p_column_alias=> 'LINEA',
  p_column_display_sequence=> 5,
  p_column_heading=> '</>',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '6',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT COMPRB.comprv_id'||unistr('\000a')||
'      ,COMPRB.comrub_id'||unistr('\000a')||
'      ,COMPRB.comrub_codigo'||unistr('\000a')||
'      ,COMPRB.observacion'||unistr('\000a')||
'      ,COMPRB.comrub_codigo||'' - ''||COMPRB.comrub_nombre comrub_nombre'||unistr('\000a')||
'      ,COMPRB.comrub_situacion'||unistr('\000a')||
'      ,'' <b>''||(select rv_abbreviation'||unistr('\000a')||
'         from   cg_ref_codes'||unistr('\000a')||
'        where  rv_domain = ''COM_PROVEEDORES_RUB.SITUACION'''||unistr('\000a')||
'          and rv_low_value = COMPRB.SITUACION)'||unistr('\000a')||
'      ||''</b> desde el';

s:=s||': ''|| NVL(COMPRB.FECHA_VALIDEZ,COMPRB.FECHA_VIGENCIA) SITUACIONES'||unistr('\000a')||
'      ,COMPRB.FECHA_VIGENCIA'||unistr('\000a')||
'      ,COMPRB.FECHA_VALIDEZ'||unistr('\000a')||
' FROM COM_PROVEEDORES_RUB_V COMPRB '||unistr('\000a')||
'WHERE COMPRB.COMPRV_ID = :P201_COMPRV_ID'||unistr('\000a')||
'  AND COMPRB.SITUACION = ''ACT'''||unistr('\000a')||
'ORDER BY COMPRB.observacion desc;';

wwv_flow_api.create_report_region (
  p_id=> 20050026974132418 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_name=> 'Detalle de &P1_COMETQ_RUB. Actuales',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 45,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> ':P201_TIPO IN (''ALRB'')',
  p_display_condition_type=> 'PLSQL_EXPRESSION',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
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
  p_id=> 20051312561137724 + wwv_flow_api.g_id_offset,
  p_region_id=> 20050026974132418 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Comprv Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
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
  p_id=> 20050313513132421 + wwv_flow_api.g_id_offset,
  p_region_id=> 20050026974132418 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMRUB_ID',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Comrub Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
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
  p_id=> 20051406509137726 + wwv_flow_api.g_id_offset,
  p_region_id=> 20050026974132418 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMRUB_CODIGO',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Comrub Codigo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
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
  p_id=> 20056417530423087 + wwv_flow_api.g_id_offset,
  p_region_id=> 20050026974132418 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'OBSERVACION',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Tipo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20050503639132421 + wwv_flow_api.g_id_offset,
  p_region_id=> 20050026974132418 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMRUB_NOMBRE',
  p_column_display_sequence=> 1,
  p_column_heading=> '&P1_COMETQ_RUB.',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20050729945132421 + wwv_flow_api.g_id_offset,
  p_region_id=> 20050026974132418 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'COMRUB_SITUACION',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Comrub Situacion',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
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
  p_id=> 20051531606137726 + wwv_flow_api.g_id_offset,
  p_region_id=> 20050026974132418 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACIONES',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Situaciones',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20051630936137726 + wwv_flow_api.g_id_offset,
  p_region_id=> 20050026974132418 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VIGENCIA',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Fecha Vigencia',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
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
  p_id=> 20051706570137726 + wwv_flow_api.g_id_offset,
  p_region_id=> 20050026974132418 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VALIDEZ',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Fecha Validez',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
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
s:=s||'SELECT COMPRS.COMRES_TIPO_DOCUMENTO||'': ''||COMPRS.COMRES_NUMERO_DOCUMENTO Documento'||unistr('\000a')||
'      ,COMPRS.COMRES_NOMBRE'||unistr('\000a')||
'      ,COMPRS.COMRES_EMAIL '||unistr('\000a')||
'      ,''<b>''||(select rv_abbreviation'||unistr('\000a')||
'         from   cg_ref_codes'||unistr('\000a')||
'        where  rv_domain = ''COM_PROVEEDORES_RES.SITUACION'''||unistr('\000a')||
'          and rv_low_value = COMPRS.SITUACION)'||unistr('\000a')||
'      ||''</b> desde el: ''||NVL(COMPRS.FECHA_VALIDEZ,COMPRS.FECHA_VIGENCIA) SITUACIONES'||unistr('\000a')||
'';

s:=s||'      ,COMPRS.FECHA_VIGENCIA'||unistr('\000a')||
'      ,COMPRS.FECHA_VALIDEZ'||unistr('\000a')||
'      ,COMPRV_ID'||unistr('\000a')||
'      ,COMRES_ID'||unistr('\000a')||
'  FROM COM_PROVEEDORES_RES_V COMPRS'||unistr('\000a')||
' WHERE COMPRS.COMPRV_ID = :P201_COMPRV_ID'||unistr('\000a')||
'   AND COMPRS.SITUACION = ''ACT'';';

wwv_flow_api.create_report_region (
  p_id=> 20053005728192544 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_name=> 'Detalle de &P1_COMETQ_PRS. Actuales',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 55,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> ':P201_TIPO IN (''ACRP'',''ACDR'',''ACER'')',
  p_display_condition_type=> 'PLSQL_EXPRESSION',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
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
  p_id=> 20053314657192544 + wwv_flow_api.g_id_offset,
  p_region_id=> 20053005728192544 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Documento',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20053219399192544 + wwv_flow_api.g_id_offset,
  p_region_id=> 20053005728192544 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMRES_NOMBRE',
  p_column_display_sequence=> 1,
  p_column_heading=> '&P1_COMETQ_PRSS.',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20053416973192544 + wwv_flow_api.g_id_offset,
  p_region_id=> 20053005728192544 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMRES_EMAIL',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Email',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20053916089318591 + wwv_flow_api.g_id_offset,
  p_region_id=> 20053005728192544 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACIONES',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Situaciones',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20054009811318591 + wwv_flow_api.g_id_offset,
  p_region_id=> 20053005728192544 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VIGENCIA',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Fecha Vigencia',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
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
  p_id=> 20054123761318591 + wwv_flow_api.g_id_offset,
  p_region_id=> 20053005728192544 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VALIDEZ',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Fecha Validez',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
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
  p_id=> 20054205199318591 + wwv_flow_api.g_id_offset,
  p_region_id=> 20053005728192544 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Comprv Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
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
  p_id=> 20054305802318591 + wwv_flow_api.g_id_offset,
  p_region_id=> 20053005728192544 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'COMRES_ID',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Comres Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
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
s:=s||'select COMPDO.ID'||unistr('\000a')||
'     , COMPDT_NOMBRE'||unistr('\000a')||
'     , COMENTARIO'||unistr('\000a')||
'     , CASE WHEN nvl(FECHA_VENCIMIENTO, sysdate + 1 ) > sysdate THEN ''<font color="green"><b>VIGENTE</b></font>'''||unistr('\000a')||
'            ELSE ''<font color="red"><b>VENCIDO</b></font>'''||unistr('\000a')||
'       END CASE'||unistr('\000a')||
'     , (case COMPDT_TIPO_DURACION '||unistr('\000a')||
'         when ''SIN'' then'||unistr('\000a')||
'           ''INDEFINIDA'''||unistr('\000a')||
'         else '||unistr('\000a')||
'           to_char(FECHA_VENCIMIENTO, ''dd/mm/yyyy'')'||unistr('\000a')||
'     ';

s:=s||'  end) FECHA_VENCIMIENTO 	 '||unistr('\000a')||
'     , (case when INSTR(COMPDO.MIMETYPE,''pdf'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/download_pdf_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''excel'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/download_csv_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''oct'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO';

s:=s||'.MIMETYPE,''word'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/download_rtf_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''plain'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''image'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/chart_32x24.gif">''    '||unistr('\000a')||
'         else'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'      ';

s:=s||'   end) ICONO'||unistr('\000a')||
'     , dbms_lob.getlength(DOCUMENTO) DOCUMENTO'||unistr('\000a')||
'     , FILENAME'||unistr('\000a')||
'     , MIMETYPE'||unistr('\000a')||
'     , LAST_UPDATE_DATE'||unistr('\000a')||
'  from COM_TRAMITES_PRV_DOC COMTDP'||unistr('\000a')||
'     , COM_PROVEEDORES_DOC_V COMPDO'||unistr('\000a')||
' where COMTDP.COMTPR_ID = :P201_ID'||unistr('\000a')||
'   and COMTDP.COMPDO_ID = COMPDO.ID';

wwv_flow_api.create_report_region (
  p_id=> 32044630855716067 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_name=> 'Documentos',
  p_region_name=>'',
  p_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 80,
  p_region_attributes=>'style="width:60%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> ':P201_TIPO not in (''INCT'',''AIAU'',''BAJC'',''ADAU'')',
  p_display_condition_type=> 'PLSQL_EXPRESSION',
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
  p_query_no_data_found=> 'No se ha encontrado ningún dato',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'Condición Anterior--'||unistr('\000a')||
'--'||unistr('\000a')||
'Function Body Returning a Boolean'||unistr('\000a')||
'--'||unistr('\000a')||
'declare'||unistr('\000a')||
'  v_comtpr COM_TRAMITES_PRV%rowtype;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Obtener los datos del trámite de proveedor'||unistr('\000a')||
'  COM_PKG.SET_COMTPR(p_id     => :P201_ID);'||unistr('\000a')||
'  COM_PKG.GET_COMTPR(p_comtpr => v_comtpr);'||unistr('\000a')||
'  COM_PKG.INI_COMTPR;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  IF v_comtpr.TIPO in(''PDOC'',''ACCB'',''PDOI'') THEN'||unistr('\000a')||
'    RETURN TRUE;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  RETURN FALSE;'||unistr('\000a')||
'  --'||unistr('\000a')||
'end;'||unistr('\000a')||
'--');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32045714596716076 + wwv_flow_api.g_id_offset,
  p_region_id=> 32044630855716067 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Id',
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
  p_id=> 32045602028716076 + wwv_flow_api.g_id_offset,
  p_region_id=> 32044630855716067 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_NOMBRE',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Documento',
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
  p_id=> 32045012046716076 + wwv_flow_api.g_id_offset,
  p_region_id=> 32044630855716067 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMENTARIO',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Comentario',
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
  p_id=> 32045519246716076 + wwv_flow_api.g_id_offset,
  p_region_id=> 32044630855716067 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'CASE',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Estado',
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
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32045121336716076 + wwv_flow_api.g_id_offset,
  p_region_id=> 32044630855716067 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VENCIMIENTO',
  p_column_display_sequence=> 5,
  p_column_heading=> 'FechaVencimiento',
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
  p_id=> 32045419658716076 + wwv_flow_api.g_id_offset,
  p_region_id=> 32044630855716067 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'ICONO',
  p_column_display_sequence=> 6,
  p_column_heading=> '',
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
  p_id=> 32045216153716076 + wwv_flow_api.g_id_offset,
  p_region_id=> 32044630855716067 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Documento',
  p_column_format=> 'DOWNLOAD:COM_PROVEEDORES_DOC:DOCUMENTO:ID::MIMETYPE:FILENAME:LAST_UPDATE_DATE::attachment:Abrir Doc.',
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
  p_id=> 32045813452716076 + wwv_flow_api.g_id_offset,
  p_region_id=> 32044630855716067 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'FILENAME',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Filename',
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
  p_id=> 32044825444716073 + wwv_flow_api.g_id_offset,
  p_region_id=> 32044630855716067 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'MIMETYPE',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Mimetype',
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
  p_id=> 32044911689716076 + wwv_flow_api.g_id_offset,
  p_region_id=> 32044630855716067 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'LAST_UPDATE_DATE',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Last Update Date',
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
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select comobj.ID'||unistr('\000a')||
'     , COMOBJ.COMOBT_ID'||unistr('\000a')||
'     , COMOBJ.COMPRV_ID'||unistr('\000a')||
'     , COMOBJ.COMRUB_ID'||unistr('\000a')||
'     , COMOBJ.CODIGO'||unistr('\000a')||
'     , COMOBJ.NOMBRE'||unistr('\000a')||
'     , COMOBJ.DESCRIPCION'||unistr('\000a')||
'     , comobt.NOMBRE OBJETO_TIPO'||unistr('\000a')||
'     , COMOBJ.COMOBE_ESTADO_DESC'||unistr('\000a')||
'  from COM_TRAMITES_PRV_OBJ comtpo '||unistr('\000a')||
'     , COM_OBJETOS_V comobj   '||unistr('\000a')||
'     , COM_OBJETOS_TIPOS_V comobt'||unistr('\000a')||
' where comtpo.COMTPR_ID = :P201_ID'||unistr('\000a')||
'   and comobj.ID = comtpo.COMOBJ_ID'||unistr('\000a')||
'   an';

s:=s||'d comobt.ID = comobj.COMOBT_ID';

wwv_flow_api.create_report_region (
  p_id=> 32360421128708871 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_name=> 'Detalle del Objeto',
  p_region_name=>'',
  p_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 90,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> ':P201_TIPO in (''INOB'',''PROB'',''BJOB'')',
  p_display_condition_type=> 'PLSQL_EXPRESSION',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 3,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
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
  p_id=> 32360725623708909 + wwv_flow_api.g_id_offset,
  p_region_id=> 32360421128708871 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 1,
  p_column_heading=> 'ID',
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
  p_id=> 32362517351739768 + wwv_flow_api.g_id_offset,
  p_region_id=> 32360421128708871 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMOBT_ID',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Comobt Id',
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
  p_id=> 32362603883739771 + wwv_flow_api.g_id_offset,
  p_region_id=> 32360421128708871 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Comprv Id',
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
  p_id=> 32362716494739771 + wwv_flow_api.g_id_offset,
  p_region_id=> 32360421128708871 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COMRUB_ID',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Comrub Id',
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
  p_id=> 32362820189739771 + wwv_flow_api.g_id_offset,
  p_region_id=> 32360421128708871 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'CODIGO',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Código',
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
  p_id=> 32362929957739771 + wwv_flow_api.g_id_offset,
  p_region_id=> 32360421128708871 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'NOMBRE',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Nombre',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
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
  p_id=> 32363029233739771 + wwv_flow_api.g_id_offset,
  p_region_id=> 32360421128708871 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'DESCRIPCION',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Descripción',
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
  p_id=> 32375207176321959 + wwv_flow_api.g_id_offset,
  p_region_id=> 32360421128708871 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'OBJETO_TIPO',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Tipo de Objeto',
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
  p_id=> 32382607194565029 + wwv_flow_api.g_id_offset,
  p_region_id=> 32360421128708871 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'COMOBE_ESTADO_DESC',
  p_column_display_sequence=> 9,
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select comobd.ID'||unistr('\000a')||
'     , comobd.CODIGO'||unistr('\000a')||
'     , dbms_lob.getlength(comobd.DOCUMENTO) DOCUMENTO'||unistr('\000a')||
'     , comobd.FECHA_EMISION'||unistr('\000a')||
'     , comobd.FECHA_PRESENTACION'||unistr('\000a')||
'     , comobd.FECHA_VENCIMIENTO'||unistr('\000a')||
'     , comobd.SITUACION_ABR     '||unistr('\000a')||
'     , comobd.COMODT_NOMBRE'||unistr('\000a')||
'  from COM_TRAMITES_PRV_OBJ comtpo'||unistr('\000a')||
'     , COM_TRAMITES_PRV_OBD comtod     '||unistr('\000a')||
'     , COM_OBJETOS_DOC_V comobd    '||unistr('\000a')||
' where comtpo.COMTPR_ID = :P201_ID'||unistr('\000a')||
'   and c';

s:=s||'omtod.COMTPR_ID = comtpo.COMTPR_ID'||unistr('\000a')||
'   and comobd.ID = comtod.COMOBD_ID';

wwv_flow_api.create_report_region (
  p_id=> 32384917514597329 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_name=> 'Detalle de los Documentos del Objeto',
  p_region_name=>'',
  p_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 110,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> ':P201_TIPO in (''INOB'',''PROB'',''BJOB'')',
  p_display_condition_type=> 'PLSQL_EXPRESSION',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '9999',
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
  p_id=> 32385231029597331 + wwv_flow_api.g_id_offset,
  p_region_id=> 32384917514597329 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Id',
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
  p_id=> 32385318449597331 + wwv_flow_api.g_id_offset,
  p_region_id=> 32384917514597329 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'CODIGO',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Código',
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
  p_id=> 32385403234597331 + wwv_flow_api.g_id_offset,
  p_region_id=> 32384917514597329 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Documento',
  p_use_as_row_header=> 'N',
  p_column_format=> 'DOWNLOAD:COM_OBJETOS_DOC:DOCUMENTO:ID::MIMETYPE:FILENAME:LAST_UPDATE_DATE::Attachment:Ver Documento',
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
  p_id=> 32385527690597331 + wwv_flow_api.g_id_offset,
  p_region_id=> 32384917514597329 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_EMISION',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Fecha Emisión',
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
  p_id=> 32385600066597331 + wwv_flow_api.g_id_offset,
  p_region_id=> 32384917514597329 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_PRESENTACION',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Fecha Presentación',
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
  p_id=> 32385714413597331 + wwv_flow_api.g_id_offset,
  p_region_id=> 32384917514597329 + wwv_flow_api.g_id_offset,
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
  p_id=> 32385803084597331 + wwv_flow_api.g_id_offset,
  p_region_id=> 32384917514597329 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION_ABR',
  p_column_display_sequence=> 7,
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
  p_id=> 32385927394597331 + wwv_flow_api.g_id_offset,
  p_region_id=> 32384917514597329 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'COMODT_NOMBRE',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Tipo de Documento',
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
  p_id=> 33902007337598385 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_plug_name=> 'Detalle Documentación Interna ',
  p_region_name=>'',
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
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => ':P201_TIPO in (''PDOI'')',
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
s:=s||'select comtrn.ID COMTRN_ID'||unistr('\000a')||
'     , comtrn.COMTPR_ID'||unistr('\000a')||
'     , comtrn.NOTA     '||unistr('\000a')||
'     , comtrn.SITUACION'||unistr('\000a')||
'     , comtrn.SITUACION_ABR'||unistr('\000a')||
'     , comtrn.FECHA_SITUACION'||unistr('\000a')||
'     , comtrn.MOTIVO_SITUACION '||unistr('\000a')||
'     , compdo.ID ID'||unistr('\000a')||
'     , dbms_lob.getlength(compdo.DOCUMENTO) DOCUMENTO'||unistr('\000a')||
'  from COM_TRAMITES_PRV_NOT_V comtrn'||unistr('\000a')||
'     , COM_PROVEEDORES_DOC_V compdo'||unistr('\000a')||
' where comtrn.COMTPR_ID = :P201_ID'||unistr('\000a')||
'   and compdo.ID(+) = comtrn.';

s:=s||'COMPDO_ID'||unistr('\000a')||
' order by COMTRN_ID DESC'||unistr('\000a')||
' ';

wwv_flow_api.create_report_region (
  p_id=> 34878816648123992 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_name=> 'Notas del Trámite',
  p_region_name=>'',
  p_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 120,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> ':P201_TIPO = ''PDOI''',
  p_display_condition_type=> 'PLSQL_EXPRESSION',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '9999',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se ha encontrado ningún dato',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '9999',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
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
  p_id=> 34933620182418475 + wwv_flow_api.g_id_offset,
  p_region_id=> 34878816648123992 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMTRN_ID',
  p_column_display_sequence=> 1,
  p_column_heading=> '<BR>',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ID.:278:&SESSION.::&DEBUG.:278:P278_COMTPR_ID,P278_COMTRN_ID:#COMTPR_ID#,#COMTRN_ID#',
  p_column_linktext=>'<img src="#IMAGE_PREFIX#menu/pencil2_16x16.gif" alt="">',
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
  p_id=> 34932602726411364 + wwv_flow_api.g_id_offset,
  p_region_id=> 34878816648123992 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMTPR_ID',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Comtpr Id',
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
  p_id=> 34932723120411364 + wwv_flow_api.g_id_offset,
  p_region_id=> 34878816648123992 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'NOTA',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Nota',
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
  p_id=> 34932811448411364 + wwv_flow_api.g_id_offset,
  p_region_id=> 34878816648123992 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Situación',
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
  p_id=> 34934708296454317 + wwv_flow_api.g_id_offset,
  p_region_id=> 34878816648123992 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION_ABR',
  p_column_display_sequence=> 7,
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
  p_id=> 34932907243411364 + wwv_flow_api.g_id_offset,
  p_region_id=> 34878816648123992 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_SITUACION',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Fecha',
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
  p_id=> 34933023554411364 + wwv_flow_api.g_id_offset,
  p_region_id=> 34878816648123992 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'MOTIVO_SITUACION',
  p_column_display_sequence=> 9,
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34932411999407045 + wwv_flow_api.g_id_offset,
  p_region_id=> 34878816648123992 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Compdo Id',
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
  p_id=> 34880016321124014 + wwv_flow_api.g_id_offset,
  p_region_id=> 34878816648123992 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Documento',
  p_use_as_row_header=> 'N',
  p_column_format=> 'DOWNLOAD:COM_PROVEEDORES_DOC:DOCUMENTO:ID::MIMETYPE:FILENAME:LAST_UPDATE_DATE::Attachment:Ver Documento',
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
  l_clob clob;
  l_length number := 1;
begin
s:=s||'  select COMPDO.ID'||unistr('\000a')||
'     , COMPDO.COMPDT_NOMBRE'||unistr('\000a')||
'     , COMPDO.COMENTARIO'||unistr('\000a')||
'     , CASE WHEN nvl(COMPDO.FECHA_VENCIMIENTO, sysdate + 1 ) > sysdate THEN ''<font color="green"><b>VIGENTE</b></font>'''||unistr('\000a')||
'            ELSE ''<font color="red"><b>VENCIDO</b></font>'''||unistr('\000a')||
'       END CASE'||unistr('\000a')||
'     , (case COMPDO.COMPDT_TIPO_DURACION '||unistr('\000a')||
'         when ''SIN'' then'||unistr('\000a')||
'           ''INDEFINIDA'''||unistr('\000a')||
'         else '||unistr('\000a')||
'           to_char(COMPDO.F';

s:=s||'ECHA_VENCIMIENTO, ''dd/mm/yyyy'')'||unistr('\000a')||
'       end) FECHA_VENCIMIENTO 	 '||unistr('\000a')||
'     , (case when INSTR(COMPDO.MIMETYPE,''pdf'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/download_pdf_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''excel'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/download_csv_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''oct'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/page_32';

s:=s||'x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''word'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/download_rtf_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''plain'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''image'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/chart_32x24.gif">''    '||unistr('\000a')||
'         else'||unistr('\000a')||
'          ''<img src="#IMAGE_P';

s:=s||'REFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'         end) ICONO'||unistr('\000a')||
'     , dbms_lob.getlength(DOCUMENTO) DOCUMENTO'||unistr('\000a')||
'     , FILENAME'||unistr('\000a')||
'     , MIMETYPE'||unistr('\000a')||
'     , LAST_UPDATE_DATE'||unistr('\000a')||
'     ,COMPRA.COMPCC_NOMBRE'||unistr('\000a')||
'     ,compra.apellido||'' ''||COMPRA.NOMBRE||'' - ''||compra.tipo_documento||'' ''||compra.numero_documento compra_datos_completos'||unistr('\000a')||
'from com_proveedores_aut_v compra'||unistr('\000a')||
'    ,com_proveedores_doc_v compdo'||unistr('\000a')||
'    ,com_proveedores_ado c';

s:=s||'ompad'||unistr('\000a')||
'where COMPRA.ID = compad.compra_id'||unistr('\000a')||
'  anD COMPDO.ID = COMPAD.COMPDO_ID'||unistr('\000a')||
'  and COMPRA.COMTPR_ID = :P201_ID'||unistr('\000a')||
'union -- Buscamos los documentos que se hayan actualizado mediante el tramite de Actualizacion de Documentación, mostrando a que autoridad pertenecen.'||unistr('\000a')||
'  select COMPDO.ID'||unistr('\000a')||
'     , COMPDO.COMPDT_NOMBRE'||unistr('\000a')||
'     , COMPDO.COMENTARIO'||unistr('\000a')||
'     , CASE WHEN nvl(COMPDO.FECHA_VENCIMIENTO, sysdate + 1 ) > sysd';

s:=s||'ate THEN ''<font color="green"><b>VIGENTE</b></font>'''||unistr('\000a')||
'            ELSE ''<font color="red"><b>VENCIDO</b></font>'''||unistr('\000a')||
'       END CASE'||unistr('\000a')||
'     , (case COMPDO.COMPDT_TIPO_DURACION '||unistr('\000a')||
'         when ''SIN'' then'||unistr('\000a')||
'           ''INDEFINIDA'''||unistr('\000a')||
'         else '||unistr('\000a')||
'           to_char(COMPDO.FECHA_VENCIMIENTO, ''dd/mm/yyyy'')'||unistr('\000a')||
'       end) FECHA_VENCIMIENTO 	 '||unistr('\000a')||
'     , (case when INSTR(COMPDO.MIMETYPE,''pdf'') > 0 then'||unistr('\000a')||
'          ''<img sr';

s:=s||'c="#IMAGE_PREFIX#ws/download_pdf_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''excel'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/download_csv_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''oct'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''word'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/download_rtf_32x24.gif">'''||unistr('\000a')||
'         wh';

s:=s||'en INSTR(COMPDO.MIMETYPE,''plain'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''image'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/chart_32x24.gif">''    '||unistr('\000a')||
'         else'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'         end) ICONO'||unistr('\000a')||
'     , dbms_lob.getlength(DOCUMENTO) DOCUMENTO'||unistr('\000a')||
'     , FILENAME'||unistr('\000a')||
'     , MIMETYPE'||unistr('\000a')||
'     , LA';

s:=s||'ST_UPDATE_DATE'||unistr('\000a')||
'     ,COMPRA.COMPCC_NOMBRE'||unistr('\000a')||
'     ,compra.apellido||'' ''||COMPRA.NOMBRE||'' - ''||compra.tipo_documento||'' ''||compra.numero_documento compra_datos_completos'||unistr('\000a')||
'from com_proveedores_aut_v compra'||unistr('\000a')||
'    ,com_proveedores_doc_v compdo'||unistr('\000a')||
'    ,com_proveedores_ado compad'||unistr('\000a')||
'    ,com_tramites_prv_doc comtdp'||unistr('\000a')||
'where COMPRA.ID = compad.compra_id'||unistr('\000a')||
'  anD COMPDO.ID = COMPAD.COMPDO_ID'||unistr('\000a')||
'  and COMTDP.COMTPR_ID = :P201';

s:=s||'_ID'||unistr('\000a')||
'  and COMTDP.COMPDO_ID = COMPDO.ID';

wwv_flow_api.create_report_region (
  p_id=> 49392116433880778 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_name=> 'Documentos de Autoridades',
  p_region_name=>'',
  p_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 140,
  p_region_attributes=>'style="width:65%"',
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> ':P201_TIPO in (''INCT'',''AIAU'',''ADAU'')',
  p_display_condition_type=> 'PLSQL_EXPRESSION',
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
  p_query_no_data_found=> 'No se han subido Documentos.',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
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
  p_id=> 49392429734880784 + wwv_flow_api.g_id_offset,
  p_region_id=> 49392116433880778 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 1,
  p_column_heading=> 'ID',
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
  p_id=> 49392529935880785 + wwv_flow_api.g_id_offset,
  p_region_id=> 49392116433880778 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_NOMBRE',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Tipo de Documento',
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
  p_id=> 49394222908830907 + wwv_flow_api.g_id_offset,
  p_region_id=> 49392116433880778 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMENTARIO',
  p_column_display_sequence=> 5,
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
  p_id=> 49394318895830928 + wwv_flow_api.g_id_offset,
  p_region_id=> 49392116433880778 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'CASE',
  p_column_display_sequence=> 6,
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
  p_id=> 49392804039880785 + wwv_flow_api.g_id_offset,
  p_region_id=> 49392116433880778 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VENCIMIENTO',
  p_column_display_sequence=> 7,
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
  p_id=> 49394426774830928 + wwv_flow_api.g_id_offset,
  p_region_id=> 49392116433880778 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'ICONO',
  p_column_display_sequence=> 8,
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
  p_id=> 49392931261880785 + wwv_flow_api.g_id_offset,
  p_region_id=> 49392116433880778 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Documento',
  p_use_as_row_header=> 'N',
  p_column_format=> 'DOWNLOAD:COM_PROVEEDORES_DOC:DOCUMENTO:ID::MIMETYPE:FILENAME:LAST_UPDATE_DATE::Attachment:Abrir Doc.',
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
  p_id=> 49394514499830928 + wwv_flow_api.g_id_offset,
  p_region_id=> 49392116433880778 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'FILENAME',
  p_column_display_sequence=> 10,
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
  p_id=> 49394621808830928 + wwv_flow_api.g_id_offset,
  p_region_id=> 49392116433880778 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'MIMETYPE',
  p_column_display_sequence=> 11,
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
  p_id=> 49394729289830928 + wwv_flow_api.g_id_offset,
  p_region_id=> 49392116433880778 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'LAST_UPDATE_DATE',
  p_column_display_sequence=> 12,
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
  p_id=> 52959118981203901 + wwv_flow_api.g_id_offset,
  p_region_id=> 49392116433880778 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'COMPCC_NOMBRE',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Cargo',
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
  p_id=> 57717315654165000 + wwv_flow_api.g_id_offset,
  p_region_id=> 49392116433880778 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRA_DATOS_COMPLETOS',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Autoridad',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'EXISTS',
  p_display_when_condition=> 'select 1'||unistr('\000a')||
'from com_proveedores_aut_v compra'||unistr('\000a')||
'    ,com_proveedores_doc_v compdo'||unistr('\000a')||
'    ,com_proveedores_ado compad'||unistr('\000a')||
'    ,com_tramites_prv_doc comtdp'||unistr('\000a')||
'where COMPRA.ID = compad.compra_id'||unistr('\000a')||
'  anD COMPDO.ID = COMPAD.COMPDO_ID'||unistr('\000a')||
'  and COMTDP.COMTPR_ID = :P201_ID'||unistr('\000a')||
'  and COMTDP.COMPDO_ID = COMPDO.ID',
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 50129619533918248 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_plug_name=> 'Autoridades',
  p_region_name=>'',
  p_region_attributes=> 'style="width:60%"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 125,
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
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => ':P201_TIPO in (''INCT'',''AIAU'',''BAJC'')',
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
s:=s||'select compad.compdt_nombre'||unistr('\000a')||
'      ,to_char(compad.compdo_fecha_emision,''DD/MM/YYYY'')||'' - ''||nvl(to_char(compad.compdo_fecha_vencimiento,''DD/MM/YYYY''),''INDEFINIDO'') VENC_DOC'||unistr('\000a')||
'      ,compad.compdt_nombre||'' ''||to_char(compad.compdo_fecha_emision,''DD/MM/YYYY'')||'' - ''||nvl(to_char(compad.compdo_fecha_vencimiento,''DD/MM/YYYY''),''INDEFINIDO'') TIPO_DOC_COMPLETO'||unistr('\000a')||
'      ,compad.compdo_fecha_presentacion'||unistr('\000a')||
'    ';

s:=s||'  ,compra.id compra_id'||unistr('\000a')||
'      ,compra.comprv_id'||unistr('\000a')||
'      ,compra.compcc_id '||unistr('\000a')||
'      ,compra.comtpr_id'||unistr('\000a')||
'      ,compra.nombre||'' ''||compra.apellido||'' ''||compra.tipo_documento||'' - ''||compra.numero_documento AUTORIDAD'||unistr('\000a')||
'      ,to_char(compra.fecha_inicio,''DD/MM/YYYY'')||'' - ''||to_char(compra.fecha_vencimiento,''DD/MM/YYYY'') VENC_AUT'||unistr('\000a')||
'      ,compra.situacion'||unistr('\000a')||
'      ,compra.situacion_abr'||unistr('\000a')||
'      ,compra.fecha_situac';

s:=s||'ion'||unistr('\000a')||
'      ,compra.compcc_nombre'||unistr('\000a')||
'      ,compra.compcc_nombre||'' - ''||compra.nombre||'' ''||compra.apellido||'' ''||compra.tipo_documento||'': ''||compra.numero_documento||'' - ''||to_char(compra.fecha_inicio,''DD/MM/YYYY'')||'' - ''||to_char(compra.fecha_vencimiento,''DD/MM/YYYY'') AUTORIDAD_COMPLETA'||unistr('\000a')||
'from com_proveedores_aut_v compra'||unistr('\000a')||
'    ,com_proveedores_ado_v compad'||unistr('\000a')||
'where compra.ID = compad.compra_id'||unistr('\000a')||
'  and comp';

s:=s||'ra.comtpr_id = :P201_ID'||unistr('\000a')||
'  and compra.situacion in (''NUE'',''ANU'')'||unistr('\000a')||
'  order by compra_id';

wwv_flow_api.create_report_region (
  p_id=> 49398823975027906 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_name=> 'Autoridades Registradas',
  p_region_name=>'',
  p_parent_plug_id=>50129619533918248 + wwv_flow_api.g_id_offset,
  p_template=> 142030053339227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 133,
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> 'select 1'||unistr('\000a')||
'from com_proveedores_aut_v compra'||unistr('\000a')||
'    ,com_proveedores_ado_v compad'||unistr('\000a')||
'where compra.ID = compad.compra_id'||unistr('\000a')||
'  and compra.COMTPR_ID = :P201_ID'||unistr('\000a')||
'  and compra.SITUACION in (''NUE'',''ANU'')'||unistr('\000a')||
'  and :P201_TIPO in (''INCT'',''AIAU'')',
  p_display_condition_type=> 'EXISTS',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 3,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '1',
  p_query_no_data_found=> 'no data found',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_LEFT',
  p_break_column_text_format=> '#SUM_COLUMN_HEADER#',
  p_break_generic_column=> '#COLUMN_VALUE#',
  p_break_type_flag=> 'REPEAT_HEADINGS_ON_BREAK_1',
  p_break_repeat_heading_format=> '<span style="color: #35668d;"><strong><b>#COLUMN_VALUE#</b></strong></span>',
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
  p_id=> 49399104204027910 + wwv_flow_api.g_id_offset,
  p_region_id=> 49398823975027906 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_NOMBRE',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Tipo documento',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '24',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 49399325547027910 + wwv_flow_api.g_id_offset,
  p_region_id=> 49398823975027906 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'VENC_DOC',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Validez',
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
  p_include_in_export=> 'Y',
  p_print_col_width=> '24',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 56314202565712776 + wwv_flow_api.g_id_offset,
  p_region_id=> 49398823975027906 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'TIPO_DOC_COMPLETO',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Tipo de Documento',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
  p_id=> 56260013585216132 + wwv_flow_api.g_id_offset,
  p_region_id=> 49398823975027906 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDO_FECHA_PRESENTACION',
  p_column_display_sequence=> 15,
  p_column_heading=> 'Compdo Fecha Presentacion',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
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
  p_id=> 49399426986027910 + wwv_flow_api.g_id_offset,
  p_region_id=> 49398823975027906 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRA_ID',
  p_column_display_sequence=> 13,
  p_column_heading=> 'Compra Id',
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
  p_id=> 49399509584027910 + wwv_flow_api.g_id_offset,
  p_region_id=> 49398823975027906 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 10,
  p_column_heading=> 'COMPRV_ID',
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
  p_id=> 49399624918027910 + wwv_flow_api.g_id_offset,
  p_region_id=> 49398823975027906 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'COMPCC_ID',
  p_column_display_sequence=> 5,
  p_column_heading=> 'COMPCC_ID',
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
  p_id=> 49399814613027910 + wwv_flow_api.g_id_offset,
  p_region_id=> 49398823975027906 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'COMTPR_ID',
  p_column_display_sequence=> 6,
  p_column_heading=> 'COMTPR_ID',
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
  p_id=> 49400409113027910 + wwv_flow_api.g_id_offset,
  p_region_id=> 49398823975027906 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'AUTORIDAD',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Autoridad',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
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
  p_id=> 49399930669027910 + wwv_flow_api.g_id_offset,
  p_region_id=> 49398823975027906 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'VENC_AUT',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Duración',
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
  p_include_in_export=> 'Y',
  p_print_col_width=> '24',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 49400014677027910 + wwv_flow_api.g_id_offset,
  p_region_id=> 49398823975027906 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION',
  p_column_display_sequence=> 11,
  p_column_heading=> 'SITUACION',
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
  p_id=> 49400101257027910 + wwv_flow_api.g_id_offset,
  p_region_id=> 49398823975027906 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION_ABR',
  p_column_display_sequence=> 12,
  p_column_heading=> 'SITUACION_ABR',
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
  p_id=> 49400205694027910 + wwv_flow_api.g_id_offset,
  p_region_id=> 49398823975027906 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_SITUACION',
  p_column_display_sequence=> 14,
  p_column_heading=> 'FECHA_SITUACION',
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
  p_id=> 49400304489027910 + wwv_flow_api.g_id_offset,
  p_region_id=> 49398823975027906 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'COMPCC_NOMBRE',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Cargo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '24',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 56314324099712778 + wwv_flow_api.g_id_offset,
  p_region_id=> 49398823975027906 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 15,
  p_form_element_id=> null,
  p_column_alias=> 'AUTORIDAD_COMPLETA',
  p_column_display_sequence=> 1,
  p_column_heading=> '<br>',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select compra.compcc_nombre'||unistr('\000a')||
'      ,compra.apellido||'' ''||compra.nombre||'' ''||compra.tipo_documento||'':''||compra.numero_documento AUTORIDAD'||unistr('\000a')||
'      ,to_char(compra.fecha_inicio,''DD/MM/YYYY'')||'' - ''||to_char(compra.fecha_vencimiento,''DD/MM/YYYY'') DURACION'||unistr('\000a')||
'      ,compra.compcc_nombre||'' - ''||compra.nombre||'' ''||compra.apellido||'' ''||compra.tipo_documento||'': ''||compra.numero_documento||'' - ''||to_char(c';

s:=s||'ompra.fecha_inicio,''DD/MM/YYYY'')||'' - ''||to_char(compra.fecha_vencimiento,''DD/MM/YYYY'') AUTORIDAD_COMPLETA'||unistr('\000a')||
'      ,compad.compdt_nombre'||unistr('\000a')||
'      ,to_char(compad.compdo_fecha_emision,''DD/MM/YYYY'')||'' - ''||nvl(to_char(compad.compdo_fecha_vencimiento,''DD/MM/YYYY''),''INDEFINIDO'') VENC_DOC'||unistr('\000a')||
'      ,compad.compdt_nombre||'' ''||to_char(compad.compdo_fecha_emision,''DD/MM/YYYY'')||'' - ''||nvl(to_char(compad.compdo_f';

s:=s||'echa_vencimiento,''DD/MM/YYYY''),''INDEFINIDO'') TIPO_DOC_COMPLETO'||unistr('\000a')||
'from com_proveedores_aut_v compra'||unistr('\000a')||
'    ,com_proveedores_ado_v compad'||unistr('\000a')||
'    ,(select compra.compcc_id, compra.numero_documento, compra.tipo_documento,compra.situacion '||unistr('\000a')||
'        from com_proveedores_aut_v compra'||unistr('\000a')||
'       where compra.comprv_id = :P201_COMPRV_ID    '||unistr('\000a')||
'         and compra.comtpr_id = :P201_ID'||unistr('\000a')||
'         and compra.situacion in(''MAR''';

s:=s||',''BAJ'')) compra2'||unistr('\000a')||
'where compra.id = compad.compra_id'||unistr('\000a')||
'  and compra.comprv_id = :P201_COMPRV_ID'||unistr('\000a')||
'  and compra.compcc_id = compra2.compcc_id'||unistr('\000a')||
'  and compra.numero_documento = compra2.numero_documento'||unistr('\000a')||
'  and compra.tipo_documento = compra2.tipo_documento'||unistr('\000a')||
'  and compra.situacion = ''VIG'''||unistr('\000a')||
'  and compad.situacion = ''VIG'''||unistr('\000a')||
'order by compra_id';

wwv_flow_api.create_report_region (
  p_id=> 50131101357950937 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_name=> '&P201_TITULO_REGION_BAJA.',
  p_region_name=>'',
  p_parent_plug_id=>50129619533918248 + wwv_flow_api.g_id_offset,
  p_template=> 142030053339227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 135,
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> 'select 1'||unistr('\000a')||
'  from com_proveedores_aut_v compra'||unistr('\000a')||
' where compra.comprv_id = :P201_COMPRV_ID'||unistr('\000a')||
'   and compra.comtpr_id = :P201_ID'||unistr('\000a')||
'   and compra.situacion in (''MAR'',''BAJ'')'||unistr('\000a')||
'   and :P201_TIPO in (''AIAU'',''BAJC'')',
  p_display_condition_type=> 'EXISTS',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 3,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '1',
  p_query_no_data_found=> 'no data found',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_LEFT',
  p_break_column_text_format=> '#SUM_COLUMN_HEADER#',
  p_break_generic_column=> '#COLUMN_VALUE#',
  p_break_type_flag=> 'REPEAT_HEADINGS_ON_BREAK_1',
  p_break_repeat_heading_format=> '<span style="color: #35668d;"><strong><b>#COLUMN_VALUE#</b></strong></span>',
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
  p_comment=>'select compra.COMPCC_NOMBRE'||unistr('\000a')||
'      ,compra.APELLIDO||'' ''||compra.NOMBRE||'' ''||compra.TIPO_DOCUMENTO||'':''||compra.NUMERO_DOCUMENTO AUTORIDAD'||unistr('\000a')||
'      ,to_char(compra.FECHA_INICIO,''DD/MM/YYYY'')||'' - ''||to_char(compra.FECHA_VENCIMIENTO,''DD/MM/YYYY'') DURACION'||unistr('\000a')||
'      ,compra.compcc_nombre||'' - ''||compra.nombre||'' ''||compra.apellido||'' ''||compra.tipo_documento||'': ''||compra.numero_documento||'' - ''||to_char(compra.fecha_inicio,''DD/MM/YYYY'')||'' - ''||to_char(compra.fecha_vencimiento,''DD/MM/YYYY'') AUTORIDAD_COMPLETA'||unistr('\000a')||
'from com_proveedores_aut_v compra'||unistr('\000a')||
'where compra.comprv_id = :P201_COMPRV_ID    '||unistr('\000a')||
'and   compra.comtpr_id = :P201_ID'||unistr('\000a')||
'and   compra.SITUACION in(''MAR'',''BAJ'')');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 50132623899950943 + wwv_flow_api.g_id_offset,
  p_region_id=> 50131101357950937 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMPCC_NOMBRE',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Cargo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '96',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 50132708519950943 + wwv_flow_api.g_id_offset,
  p_region_id=> 50131101357950937 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'AUTORIDAD',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Autoridad',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
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
  p_id=> 56365108589117131 + wwv_flow_api.g_id_offset,
  p_region_id=> 50131101357950937 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'DURACION',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Duracion',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
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
  p_id=> 56365223626117134 + wwv_flow_api.g_id_offset,
  p_region_id=> 50131101357950937 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'AUTORIDAD_COMPLETA',
  p_column_display_sequence=> 1,
  p_column_heading=> '<br>',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
  p_id=> 56665903272366848 + wwv_flow_api.g_id_offset,
  p_region_id=> 50131101357950937 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_NOMBRE',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Compdt Nombre',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
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
  p_id=> 56666014653366851 + wwv_flow_api.g_id_offset,
  p_region_id=> 50131101357950937 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'VENC_DOC',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Venc Doc',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
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
  p_id=> 56666127365366851 + wwv_flow_api.g_id_offset,
  p_region_id=> 50131101357950937 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'TIPO_DOC_COMPLETO',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Tipo de Documento',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select compad.compdt_nombre'||unistr('\000a')||
'      ,to_char(compad.compdo_fecha_emision,''DD/MM/YYYY'')||'' - ''||nvl(to_char(compad.compdo_fecha_vencimiento,''DD/MM/YYYY''),''INDEFINIDO'') VENC_DOC'||unistr('\000a')||
'      ,compad.compdt_nombre||'' ''||to_char(compad.compdo_fecha_emision,''DD/MM/YYYY'')||'' - ''||nvl(to_char(compad.compdo_fecha_vencimiento,''DD/MM/YYYY''),''INDEFINIDO'') TIPO_DOC_COMPLETO'||unistr('\000a')||
'      ,compad.compdo_fecha_presentacion'||unistr('\000a')||
'    ';

s:=s||'  ,compra.id compra_id'||unistr('\000a')||
'      ,compra.comprv_id'||unistr('\000a')||
'      ,compra.compcc_id '||unistr('\000a')||
'      ,compra.comtpr_id'||unistr('\000a')||
'      ,compra.nombre||'' ''||compra.apellido||'' ''||compra.tipo_documento||'' - ''||compra.numero_documento AUTORIDAD'||unistr('\000a')||
'      ,CASE '||unistr('\000a')||
'         WHEN ((compra.fecha_vencimiento < SYSDATE) AND compra.situacion = ''VIG'') THEN ''<span style="color: red;"><strong>VENCIDO</strong></span>'''||unistr('\000a')||
'         ELSE to_char(compra.fe';

s:=s||'cha_inicio,''DD/MM/YYYY'')||'' - ''||to_char(compra.fecha_vencimiento,''DD/MM/YYYY'')'||unistr('\000a')||
'       END VENC_AUT'||unistr('\000a')||
'      ,compra.situacion'||unistr('\000a')||
'      ,compra.situacion_abr'||unistr('\000a')||
'      ,compra.fecha_situacion'||unistr('\000a')||
'      ,compra.compcc_nombre'||unistr('\000a')||
'      ,compra.compcc_nombre||'' - ''||compra.nombre||'' ''||compra.apellido||'' ''||compra.tipo_documento||'': ''||compra.numero_documento||'' - ''||to_char(compra.fecha_inicio,''DD/MM/YYYY'')||'' - ''||t';

s:=s||'o_char(compra.fecha_vencimiento,''DD/MM/YYYY'') AUTORIDAD_COMPLETA'||unistr('\000a')||
'from   com_proveedores_aut_v compra'||unistr('\000a')||
'      ,com_proveedores_ado_v compad'||unistr('\000a')||
'where compra.id = compad.compra_id'||unistr('\000a')||
'and   compra.ID in (select max(compra2.id)'||unistr('\000a')||
'                      from com_proveedores_aut_v compra2'||unistr('\000a')||
'                     where compra2.situacion not in (''NUE'',''ANU'',''MAR'')'||unistr('\000a')||
'                       and compra2.comprv_id = :P201_COM';

s:=s||'PRV_ID'||unistr('\000a')||
'                  group by compra2.compcc_id, compra2.tipo_documento, compra2.numero_documento, compra2.comprv_id)'||unistr('\000a')||
'and   compra.situacion = ''VIG'''||unistr('\000a')||
'and   compad.situacion = ''VIG'''||unistr('\000a')||
'order by compra_id'||unistr('\000a')||
'--and   compra.FECHA_VENCIMIENTO > sysdate  ';

wwv_flow_api.create_report_region (
  p_id=> 50149005746811809 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_name=> 'Autoridades Vigentes',
  p_region_name=>'',
  p_parent_plug_id=>50129619533918248 + wwv_flow_api.g_id_offset,
  p_template=> 142030053339227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 130,
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> 'select 1'||unistr('\000a')||
'from com_proveedores_aut_v compra'||unistr('\000a')||
'    ,com_proveedores_ado_v compad'||unistr('\000a')||
'where compra.ID = compad.compra_id'||unistr('\000a')||
'and   compra.ID in (select max(compra2.ID)'||unistr('\000a')||
'                   from COM_PROVEEDORES_AUT compra2'||unistr('\000a')||
'                   where compra2.SITUACION not in (''NUE'',''ANU'',''MAR'')'||unistr('\000a')||
'                   and   compra2.COMPRV_ID = :P201_COMPRV_ID'||unistr('\000a')||
'                   group by compra2.COMPCC_ID, compra2.TIPO_DOCUMENTO, compra2.NUMERO_DOCUMENTO, compra2.COMPRV_ID)'||unistr('\000a')||
'and   compra.SITUACION = ''VIG'''||unistr('\000a')||
'and   compra.FECHA_VENCIMIENTO > sysdate  '||unistr('\000a')||
'and :P201_TIPO in (''INCT'',''AIAU'')',
  p_display_condition_type=> 'EXISTS',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 3,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '1',
  p_query_no_data_found=> 'no data found',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_LEFT',
  p_break_column_text_format=> '#SUM_COLUMN_HEADER#',
  p_break_generic_column=> '#COLUMN_VALUE#',
  p_break_type_flag=> 'REPEAT_HEADINGS_ON_BREAK_1',
  p_break_repeat_heading_format=> '<span style="color: #35668d;"><strong><b>#COLUMN_VALUE#</b></strong></span>',
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
  p_comment=>'select compdo.ID compdo_id'||unistr('\000a')||
'      ,compdo.COMPDT_NOMBRE'||unistr('\000a')||
'      ,decode(compdo.FECHA_VENCIMIENTO, null, ''INDEFINIDO'', to_char(compdo.FECHA_EMISION,''DD/MM/YYYY'')||'' - ''||to_char(compdo.FECHA_VENCIMIENTO,''DD/MM/YYYY'')) VENC_DOC'||unistr('\000a')||
'      ,compdo.FECHA_PRESENTACION'||unistr('\000a')||
'      ,compra.id compra_id'||unistr('\000a')||
'      ,compra.comprv_id'||unistr('\000a')||
'      ,compra.compcc_id '||unistr('\000a')||
'      ,compra.comtpr_id'||unistr('\000a')||
'      ,compra.nombre||'' ''||compra.apellido||'' ''||compra.tipo_documento||'' - ''||compra.numero_documento AUTORIDAD'||unistr('\000a')||
'      ,to_char(compra.fecha_inicio,''DD/MM/YYYY'')||'' - ''||to_char(compra.fecha_vencimiento,''DD/MM/YYYY'') VENC_AUT'||unistr('\000a')||
'      ,compra.situacion'||unistr('\000a')||
'      ,compra.situacion_abr'||unistr('\000a')||
'      ,compra.fecha_situacion'||unistr('\000a')||
'      ,compra.compcc_nombre'||unistr('\000a')||
'from com_proveedores_aut_v compra'||unistr('\000a')||
'    ,com_proveedores_doc_v compdo'||unistr('\000a')||
'where COMPRA.COMPDO_ID = compdo.id(+)'||unistr('\000a')||
'  anD COMPRA.COMPRV_ID = COMPDO.COMPRV_ID'||unistr('\000a')||
'  and COMPRA.COMTPR_ID = :P201_ID'||unistr('\000a')||
'  and COMPRA.SITUACION = ''VIG''');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 50149200811811814 + wwv_flow_api.g_id_offset,
  p_region_id=> 50149005746811809 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_NOMBRE',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Tipo documento',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '24',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 50149529247811818 + wwv_flow_api.g_id_offset,
  p_region_id=> 50149005746811809 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'VENC_DOC',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Validez',
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
  p_include_in_export=> 'Y',
  p_print_col_width=> '24',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 56313617662705782 + wwv_flow_api.g_id_offset,
  p_region_id=> 50149005746811809 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'TIPO_DOC_COMPLETO',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Tipo de Documento',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
  p_id=> 56259311009202197 + wwv_flow_api.g_id_offset,
  p_region_id=> 50149005746811809 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDO_FECHA_PRESENTACION',
  p_column_display_sequence=> 15,
  p_column_heading=> 'Compdo Fecha Presentacion',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
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
  p_id=> 50149607389811818 + wwv_flow_api.g_id_offset,
  p_region_id=> 50149005746811809 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRA_ID',
  p_column_display_sequence=> 13,
  p_column_heading=> 'Compra Id',
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
  p_id=> 50149712610811818 + wwv_flow_api.g_id_offset,
  p_region_id=> 50149005746811809 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 10,
  p_column_heading=> 'COMPRV_ID',
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
  p_id=> 50149807299811818 + wwv_flow_api.g_id_offset,
  p_region_id=> 50149005746811809 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'COMPCC_ID',
  p_column_display_sequence=> 5,
  p_column_heading=> 'COMPCC_ID',
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
  p_id=> 50150004720811818 + wwv_flow_api.g_id_offset,
  p_region_id=> 50149005746811809 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'COMTPR_ID',
  p_column_display_sequence=> 6,
  p_column_heading=> 'COMTPR_ID',
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
  p_id=> 50150627490811818 + wwv_flow_api.g_id_offset,
  p_region_id=> 50149005746811809 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'AUTORIDAD',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Autoridad',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
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
  p_id=> 50150117429811818 + wwv_flow_api.g_id_offset,
  p_region_id=> 50149005746811809 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'VENC_AUT',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Duración',
  p_use_as_row_header=> 'N',
  p_column_format=> 'DD/MM/YYYY',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '24',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 50150215231811818 + wwv_flow_api.g_id_offset,
  p_region_id=> 50149005746811809 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION',
  p_column_display_sequence=> 11,
  p_column_heading=> 'SITUACION',
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
  p_id=> 50150303813811818 + wwv_flow_api.g_id_offset,
  p_region_id=> 50149005746811809 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION_ABR',
  p_column_display_sequence=> 12,
  p_column_heading=> 'SITUACION_ABR',
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
  p_id=> 50150404139811818 + wwv_flow_api.g_id_offset,
  p_region_id=> 50149005746811809 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_SITUACION',
  p_column_display_sequence=> 14,
  p_column_heading=> 'FECHA_SITUACION',
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
  p_id=> 50150528087811818 + wwv_flow_api.g_id_offset,
  p_region_id=> 50149005746811809 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'COMPCC_NOMBRE',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Cargo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '24',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 56313718132705784 + wwv_flow_api.g_id_offset,
  p_region_id=> 50149005746811809 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 15,
  p_form_element_id=> null,
  p_column_alias=> 'AUTORIDAD_COMPLETA',
  p_column_display_sequence=> 1,
  p_column_heading=> '<br>',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select comrgp.NOMBRE'||unistr('\000a')||
'from   COM_TRAMITES_PRV_RGP comtpg'||unistr('\000a')||
'      ,COM_REGISTROS_PRV comrgp'||unistr('\000a')||
'where  comtpg.COMTPR_ID = :P201_ID'||unistr('\000a')||
'and    comtpg.COMRGP_ID = comrgp.ID';

wwv_flow_api.create_report_region (
  p_id=> 75847925245302318 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_name=> 'Registros de Proveedores',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 150,
  p_region_attributes=>'style="width:60%"',
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> 'select 1'||unistr('\000a')||
'from   COM_TRAMITES_PRV_RGP comtpg'||unistr('\000a')||
'      ,COM_REGISTROS_PRV comrgp'||unistr('\000a')||
'where  comtpg.COMTPR_ID = :P201_ID'||unistr('\000a')||
'and    comtpg.COMRGP_ID = comrgp.ID',
  p_display_condition_type=> 'EXISTS',
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
  p_query_no_data_found=> 'No se encontró un registro de proveedor asociado en este Tramite.',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
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
  p_id=> 75848420315304526 + wwv_flow_api.g_id_offset,
  p_region_id=> 75847925245302318 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'NOMBRE',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Registro de Proveedor',
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
s:=s||'<style>'||unistr('\000a')||
'.msje {'||unistr('\000a')||
'  position: relative;'||unistr('\000a')||
'  top: 5px;'||unistr('\000a')||
'  color:red;'||unistr('\000a')||
'  font-stretch: expanded;'||unistr('\000a')||
'}'||unistr('\000a')||
'.msje-jus {'||unistr('\000a')||
'  padding: 5px;'||unistr('\000a')||
'  width: 600px;'||unistr('\000a')||
'  text-align: justify;'||unistr('\000a')||
'  text-justify: inter-word;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'.msje-der {'||unistr('\000a')||
'  padding: 5px;'||unistr('\000a')||
'  width: 600px;'||unistr('\000a')||
'  text-align: right;'||unistr('\000a')||
'}'||unistr('\000a')||
'</style>'||unistr('\000a')||
''||unistr('\000a')||
'<span class="msje">'||unistr('\000a')||
'   <p class="msje-jus">'||unistr('\000a')||
'      Sr. Proveedor se informa que, al ser <b>APROBADO</b> el Cambio de Razón Social por e';

s:=s||'l Registro de Proveedores del Estado, se deberá cargar nuevamente las <b>Autoridades</b> y la <b>Constancia de inscripción del AFIP</b>. Esto se debe a que dicha documentación se dará de baja al momento de ser aprobado el cambio. '||unistr('\000a')||
'   </p>'||unistr('\000a')||
'   <p class="msje-der">'||unistr('\000a')||
'      Atte.'||unistr('\000a')||
'   </br>'||unistr('\000a')||
'      Programa Compras y Contrataciones'||unistr('\000a')||
'   </p>'||unistr('\000a')||
'</span>';

wwv_flow_api.create_page_plug (
  p_id=> 367686211233944985 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_plug_name=> 'Mensaje',
  p_region_name=>'',
  p_region_css_classes=>' style="width:665;"',
  p_region_attributes=> ' style="width:665;"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 55,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_2',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_column_width => ' style="width:665;"',
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'FUNCTION_BODY',
  p_plug_display_when_condition => 'declare'||unistr('\000a')||
'   cursor cr_tipo_prov is'||unistr('\000a')||
'   select codigo'||unistr('\000a')||
'   from   com_proveedores_tipos'||unistr('\000a')||
'   where id=:P201_COMPRT_ID;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   v_codigo varchar2(4):= null;'||unistr('\000a')||
'   --'||unistr('\000a')||
'begin'||unistr('\000a')||
'   --'||unistr('\000a')||
'   open cr_tipo_prov;'||unistr('\000a')||
'   fetch cr_tipo_prov into v_codigo;'||unistr('\000a')||
'   close cr_tipo_prov;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   return (:P201_TIPO=''ACRS'')and(v_codigo=''JUR'');'||unistr('\000a')||
'end;',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 16100727799503212 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 201,
  p_button_sequence=> 5,
  p_button_plug_id => 12029130264692171+wwv_flow_api.g_id_offset,
  p_button_name    => 'NEXT',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Solicitud Inscripción',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=COM:1001:&SESSION.::&DEBUG.::P1001_COMTPR_ID,P1001_COMPRT_ID:&P201_ID.,&P201_COMPRT_ID.',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 7357132436841763+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 18895829339934469 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 201,
  p_button_sequence=> 7,
  p_button_plug_id => 12029130264692171+wwv_flow_api.g_id_offset,
  p_button_name    => 'IMPRIMIR_COMPROBANTE',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Imprimir Comprobante',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=INFCOM:1010:&SESSION.::&DEBUG.::P1_SEGORG_CODIGO,P1010_COMTPR_ID,P1010_COMTPT_CODIGO:&P1_SEGORG_CODIGO.,&P201_ID.,&P201_TIPO.',
  p_button_condition=> ':P201_TIPO NOT IN (''INSC'');',
  p_button_condition_type=> 'NEVER',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 11870319610470304 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 201,
  p_button_sequence=> 10,
  p_button_plug_id => 12029130264692171+wwv_flow_api.g_id_offset,
  p_button_name    => 'Cancelar',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Retornar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&P201_APP_ANTERIOR.:&P201_PAG_ANTERIOR.:&SESSION.',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 11870711260470304 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 201,
  p_button_sequence=> 30,
  p_button_plug_id => 12029130264692171+wwv_flow_api.g_id_offset,
  p_button_name    => 'Rechazar',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Rechazar',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:207:&SESSION.::&DEBUG.:207:P207_COMTPR_ID:&P201_ID.',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 7357205556843405+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 11870913610470304 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 201,
  p_button_sequence=> 40,
  p_button_plug_id => 12029130264692171+wwv_flow_api.g_id_offset,
  p_button_name    => 'Anular',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Anular',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:205:&SESSION.::&DEBUG.:205:P205_COMTPR_ID:&P201_ID.',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 7356918930837849+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 11870131631470299 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 201,
  p_button_sequence=> 45,
  p_button_plug_id => 12029130264692171+wwv_flow_api.g_id_offset,
  p_button_name    => 'Recepcionar',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Recepcionar',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:209:&SESSION.::&DEBUG.:209:P209_COMTPR_ID:&P201_ID.',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 7357026895840126+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 11870522575470304 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 201,
  p_button_sequence=> 50,
  p_button_plug_id => 12029130264692171+wwv_flow_api.g_id_offset,
  p_button_name    => 'Aceptar',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Aceptar',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:211:&SESSION.::&DEBUG.:211,212,213:P211_COMTPR_ID,P211_COMTPT_CODIGO:&P201_ID.,&P201_TIPO.',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 7357312135845326+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 15873308448047980 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 201,
  p_button_sequence=> 70,
  p_button_plug_id => 12029130264692171+wwv_flow_api.g_id_offset,
  p_button_name    => 'NOTIFICAR_PROVEEDOR',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Notificar a Proveedor',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:popUp2(''f?p=&APP_ID.:213:&SESSION.::NO:213:P213_COMPRV_ID,P213_MSJMTP_CODIGO,P213_COMTPT_CODIGO,P213_BOTON:&P201_COMPRV_ID.,COMADM_PRVTRM_TRMAPR,&P201_TIPO.,PRV'', 800, 700);',
  p_button_condition=> ':P201_SITUACION IN(''APR'') '||unistr('\000a')||
'AND (:P201_TIPO  IN(''INSC'') '||unistr('\000a')||
' OR :P201_TIPO  IN(''ACRP''));',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 7358918341970096+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 15873611912049068 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 201,
  p_button_sequence=> 80,
  p_button_plug_id => 12029130264692171+wwv_flow_api.g_id_offset,
  p_button_name    => 'NOTIFICAR_RESPONSABLE',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Notificar a &P1_COMETQ_PRS.',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:popUp2(''f?p=&APP_ID.:213:&SESSION.::NO:213:P213_COMPRV_ID,P213_MSJMTP_CODIGO,P213_COMTPT_CODIGO,P213_BOTON:&P201_COMPRV_ID.,COMADM_PRVTRM_TRMAPR,&P201_TIPO.,RES'', 800, 700);',
  p_button_execute_validations=>'Y',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 7358918341970096+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 15873815721050115 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 201,
  p_button_sequence=> 90,
  p_button_plug_id => 12029130264692171+wwv_flow_api.g_id_offset,
  p_button_name    => 'NOTIFICAR_TODOS',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Notificar a Todos',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:popUp2(''f?p=&APP_ID.:213:&SESSION.::NO:213:P213_COMPRV_ID,P213_MSJMTP_CODIGO,P213_COMTPT_CODIGO,P213_BOTON:&P201_COMPRV_ID.,COMADM_PRVTRM_TRMAPR,&P201_TIPO.,TOD'', 800, 700);',
  p_button_condition=> ':P201_SITUACION IN (''APR'') '||unistr('\000a')||
'AND (:P201_TIPO IN(''INSC'')'||unistr('\000a')||
' OR :P201_TIPO = ''ACRP'');',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 7358918341970096+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 18567101280107038 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 201,
  p_button_sequence=> 100,
  p_button_plug_id => 12029130264692171+wwv_flow_api.g_id_offset,
  p_button_name    => 'NOTIFICAR_TRAMITE',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Notificar Tramite',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:popUp2(''f?p=&APP_ID.:213:&SESSION.::NO:213:P213_COMPRV_ID,P213_MSJMTP_CODIGO,P213_COMTPT_CODIGO,P213_BOTON:&P201_COMPRV_ID.,COMADM_PRVTRM_TRMAPR,&P201_TIPO.,TRM'', 800, 700);',
  p_button_condition=> ':P201_SITUACION IN (''APR'') AND :P201_TIPO NOT IN (''INSC'',''ACRP'');',
  p_button_condition_type=> 'NEVER',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>11877429761470322 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:RP,200::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>16100727799503212+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 20,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>18455805738563929 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:201:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 99,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>11593000738188439 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_APP_ANTERIOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 4,
  p_item_plug_id => 15808218612171816+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'APP_ANTERIOR',
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
  p_id=>11871517195470307 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_DATE_CREATED',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 180,
  p_item_plug_id => 11868518781470271+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Creado el :',
  p_source=>'DATE_CREATED',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>11871723614470307 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_CREATED_BY',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 190,
  p_item_plug_id => 11868518781470271+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Creado por :',
  p_source=>'CREATED_BY',
  p_source_type=> 'DB_COLUMN',
  p_source_post_computation => 'NVL(SEG_PKG.OBTN_SEGUSU_NOMBRE(:P201_CREATED_BY),:P201_CREATED_BY)',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 30,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>11871927265470307 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_DATE_MODIFIED',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 200,
  p_item_plug_id => 11868518781470271+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Actualizado el :',
  p_source=>'DATE_MODIFIED',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>11872110252470307 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_MODIFIED_BY',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 210,
  p_item_plug_id => 11868518781470271+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Actualizado por :',
  p_source=>'MODIFIED_BY',
  p_source_type=> 'DB_COLUMN',
  p_source_post_computation => 'NVL(SEG_PKG.OBTN_SEGUSU_NOMBRE(:P201_MODIFIED_BY),:P201_MODIFIED_BY)',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 30,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>11872303062470307 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 12029130264692171+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Número de trámite :',
  p_source=>'ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 30,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
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
  p_id=>11990910927072904 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_SITUACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 150,
  p_item_plug_id => 12029130264692171+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Situación :',
  p_source=>'SITUACION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'COMTPR SITUACION',
  p_lov=> 'select rv_meaning d, rv_low_value r'||unistr('\000a')||
'from   cg_ref_codes'||unistr('\000a')||
'where  rv_domain = ''COM_TRAMITES_PRV.SITUACION'''||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 30,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P201_SITUACION',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_read_only_when=>'P201_OPERACION  ',
  p_read_only_when2=>'CONSULTA',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>12029924801692196 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_SEGORG_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 5,
  p_item_plug_id => 12029130264692171+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Segorg Id',
  p_source=>'SEGORG_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
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
  p_id=>12030323528692201 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_FECHA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 12029130264692171+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha y Hora solicitud :',
  p_pre_element_text=>'<b>',
  p_post_element_text=>'</b>',
  p_source=>'FECHA',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>12030914602692201 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_TIPO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 12029130264692171+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tipo de Trámite :',
  p_source=>'TIPO',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'COMTRP TIPO',
  p_lov=> 'select rv_abbreviation d, rv_low_value r'||unistr('\000a')||
'from   cg_ref_codes'||unistr('\000a')||
'where  rv_domain = ''COM_TRAMITES_PRV.TIPO'''||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 5,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
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
  p_id=>12031128535692201 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_COMPRT_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 15808218612171816+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tipo Solicitante :',
  p_source=>'COMPRT_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'COMPRT',
  p_lov=> 'select nombre d, id r'||unistr('\000a')||
'from   com_proveedores_tipos_v'||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>12031317582692201 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_CUIT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 15808218612171816+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'CUIT :',
  p_source=>'CUIT',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when=>'P201_OPERACION',
  p_read_only_when2=>'EDITAR',
  p_read_only_when_type=>'VALUE_OF_ITEM_IN_CONDITION_NOT_IN_COLON_DELIMITED_LIST',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_attribute_04 => 'TEXT',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>12031522362692201 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 15808218612171816+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Nombre / Razón Social :',
  p_source=>'NOMBRE',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 200,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when=>'P201_OPERACION',
  p_read_only_when2=>'EDITAR',
  p_read_only_when_type=>'VALUE_OF_ITEM_IN_CONDITION_NOT_IN_COLON_DELIMITED_LIST',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
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
  p_id=>12031703029692201 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_DESCRIPCION_ACTIVIDAD',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 90,
  p_item_plug_id => 15808218612171816+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Descripción de la Actividad :',
  p_source=>'DESCRIPCION_ACTIVIDAD',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 2000,
  p_cHeight=> 4,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P201_DESCRIPCION_ACTIVIDAD',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_read_only_when=>'P201_OPERACION',
  p_read_only_when2=>'CONSULTA',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_attribute_04 => 'TEXT',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>12031928167692201 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_EMAIL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 100,
  p_item_plug_id => 15808218612171816+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Email :',
  p_source=>'EMAIL',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 100,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P201_EMAIL',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_read_only_when=>'P201_OPERACION',
  p_read_only_when2=>'CONSULTA',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_attribute_04 => 'TEXT',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>12032101486692201 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_CONDICION_IB',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 110,
  p_item_plug_id => 15808218612171816+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Condición frente al IVA :',
  p_source=>'CONDICION_IB',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'COMTPR CONDICION IB',
  p_lov=> 'select rv_meaning d, rv_low_value r'||unistr('\000a')||
'from   cg_ref_codes'||unistr('\000a')||
'where  rv_domain = ''COM_TRAMITES_PRV.CONDICION_IB'''||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 5,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P201_CONDICION_IB',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_read_only_when=>'P201_OPERACION',
  p_read_only_when2=>'CONSULTA',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>12032306478692201 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_NUMERO_INSCRIPCION_IB',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 120,
  p_item_plug_id => 15808218612171816+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Nº Inscripción IB : ',
  p_source=>'NUMERO_INSCRIPCION_IB',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 30,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P201_NUMERO_INSCRIPCION_IB',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_read_only_when=>'P201_OPERACION',
  p_read_only_when2=>'CONSULTA',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
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
  p_id=>12032502467692204 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_FECHA_INSCRIPCION_IB',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 130,
  p_item_plug_id => 15808218612171816+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha inicio Actividad : ',
  p_format_mask=>'DD/MM/YYYY',
  p_source=>'FECHA_INSCRIPCION_IB',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P201_FECHA_INSCRIPCION_IB',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_read_only_when=>'P201_OPERACION',
  p_read_only_when2=>'CONSULTA',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_attribute_04 => 'TEXT',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>12032706354692205 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_NRO_CONV_MULTILATERAL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 140,
  p_item_plug_id => 15808218612171816+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Nº Convenio Multilateral :',
  p_source=>'NUMERO_CONVENIO_MULTILATERAL',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 30,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P201_NRO_CONV_MULTILATERAL',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_read_only_when=>'P201_OPERACION  ',
  p_read_only_when2=>'CONSULTA',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_attribute_04 => 'TEXT',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>12033313166692205 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_MOTIVO_SITUACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 160,
  p_item_plug_id => 12029130264692171+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Motivo situación :',
  p_source=>'MOTIVO_SITUACION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 2000,
  p_cHeight=> 4,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P201_MOTIVO_SITUACION',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_read_only_when=>'P201_OPERACION  ',
  p_read_only_when2=>'CONSULTA',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_attribute_04 => 'TEXT',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>12399209703302537 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_OPERACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'CONSULTA',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Operacion',
  p_source=>'CONSULTA',
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
  p_id=>12399515937304310 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_OPERACIONES_HABILITADAS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 2,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Operaciones Habilitadas',
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
  p_id=>12631023324277241 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_INFORMACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 220,
  p_item_plug_id => 12630731851270235+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 80,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>15990227577502835 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_PAG_ANTERIOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 3,
  p_item_plug_id => 15808218612171816+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'PAG_ANTERIOR',
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
  p_id=>18457431346563951 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_NOMBRE_PRV',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 75,
  p_item_plug_id => 15808218612171816+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Dato Original:',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 200,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>':P201_NOMBRE <> :P201_NOMBRE_PRV',
  p_display_when_type=>'PLSQL_EXPRESSION',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'style="font-weight:bold;color:red"',
  p_field_template=> 142039363292227113+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_attribute_04 => 'TEXT',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>18457828115563951 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_DESCRIPCION_ACTIVIDAD_PRV',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 95,
  p_item_plug_id => 15808218612171816+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Dato Original:',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 2000,
  p_cHeight=> 4,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_display_when=>':P201_DESCRIPCION_ACTIVIDAD_PRV <> :P201_DESCRIPCION_ACTIVIDAD',
  p_display_when_type=>'PLSQL_EXPRESSION',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'style="font-weight:bold;color:red"',
  p_field_template=> 142039363292227113+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_attribute_04 => 'TEXT',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>18458022705563951 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_EMAIL_PRV',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 105,
  p_item_plug_id => 15808218612171816+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Dato Original:',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 100,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>':P201_EMAIL_PRV <> :P201_EMAIL',
  p_display_when_type=>'PLSQL_EXPRESSION',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'style="font-weight:bold;color:red"',
  p_field_template=> 142039363292227113+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_attribute_04 => 'TEXT',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>18458426692563951 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_CONDICION_IB_PRV',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 115,
  p_item_plug_id => 15808218612171816+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Dato Original:',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 5,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>':P201_CONDICION_IB_PRV <> :P201_CONDICION_IB',
  p_display_when_type=>'PLSQL_EXPRESSION',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'style="font-weight:bold;color:red"',
  p_field_template=> 142039363292227113+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_attribute_04 => 'TEXT',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>18458825903563952 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_NUMERO_INSCRIPCION_IB_PRV',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 125,
  p_item_plug_id => 15808218612171816+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Dato Original:',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 30,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>':P201_NUMERO_INSCRIPCION_IB_PRV <> :P201_NUMERO_INSCRIPCION_IB',
  p_display_when_type=>'PLSQL_EXPRESSION',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'style="font-weight:bold;color:red"',
  p_field_template=> 142039363292227113+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_attribute_04 => 'TEXT',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>18459020142563952 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_FECHA_INSCRIPCION_IB_PRV',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 135,
  p_item_plug_id => 15808218612171816+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Dato Original:',
  p_format_mask=>'DD/MM/YYYY',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>':P201_FECHA_INSCRIPCION_IB_PRV <> :P201_FECHA_INSCRIPCION_IB',
  p_display_when_type=>'PLSQL_EXPRESSION',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'style="font-weight:bold;color:red"',
  p_field_template=> 142039363292227113+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_attribute_04 => 'TEXT',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>18459200686563952 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_NRO_CONV_MULTILATERAL_PRV',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 145,
  p_item_plug_id => 15808218612171816+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Dato Original:',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 30,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>':P201_NRO_CONV_MULTILATERAL_PRV <> :P201_NRO_CONV_MULTILATERAL',
  p_display_when_type=>'PLSQL_EXPRESSION',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'style="font-weight:bold;color:red"',
  p_field_template=> 142039363292227113+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_attribute_04 => 'TEXT',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>20324608089654012 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_MSJMTP_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 230,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Msjmtp Codigo',
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
  p_id=>29386205961992381 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_CBU',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 240,
  p_item_plug_id => 15808218612171816+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'CBU :',
  p_source=>'CBU',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_read_only_when=>'P201_OPERACION',
  p_read_only_when2=>'EDITAR',
  p_read_only_when_type=>'VALUE_OF_ITEM_IN_CONDITION_NOT_IN_COLON_DELIMITED_LIST',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
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
  p_id=>30520829871204009 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_BANCO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 250,
  p_item_plug_id => 15808218612171816+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>' ',
  p_pre_element_text=>'(',
  p_post_element_text=>')',
  p_source=>'COMCFG_PKG.OBTN_BANCO(:P201_CBU)',
  p_source_type=> 'FUNCTION',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_display_when=>'P201_CBU',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
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
  p_id=>33888418509098284 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_ASUNTO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 310,
  p_item_plug_id => 33902007337598385+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Asunto :',
  p_source=>'ASUNTO',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>':P201_TIPO = ''PDOI''',
  p_display_when_type=>'PLSQL_EXPRESSION',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
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
  p_id=>33888612780098287 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_CUERPO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 320,
  p_item_plug_id => 33902007337598385+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Cuerpo :',
  p_source=>'CUERPO',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>':P201_TIPO = ''PDOI''',
  p_display_when_type=>'PLSQL_EXPRESSION',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
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
  p_id=>33888810803098287 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_PRIORIDAD',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 300,
  p_item_plug_id => 33902007337598385+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Prioridad :',
  p_source=>'PRIORIDAD',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select rv_abbreviation d, rv_low_value r'||unistr('\000a')||
'  from   cg_ref_codes'||unistr('\000a')||
'  where  rv_domain = ''COM_TRAMITES_PRV.PRIORIDAD''',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>':P201_TIPO = ''PDOI''',
  p_display_when_type=>'PLSQL_EXPRESSION',
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
  p_id=>41244821548267481 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_COMPRV_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 15808218612171816+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'COMPRV_ID',
  p_source_type=> 'DB_COLUMN',
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
  p_id=>50809406289762957 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_TITULO_REGION_BAJA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 330,
  p_item_plug_id => 50131101357950937+wwv_flow_api.g_id_offset,
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
  p_id=>69591316587049589 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_COMPRV_COMPCT_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 340,
  p_item_plug_id => 50129619533918248+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'<b>Categoría: <b>',
  p_source_type=> 'STATIC',
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
  p_id=>75582525537456721 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_COMRGP_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 5,
  p_item_plug_id => 15808218612171816+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Registro de Proveedores',
  p_source=>'select comrgp.NOMBRE d, comrgp.id r'||unistr('\000a')||
'from   COM_TRAMITES_PRV_RGP comtpg'||unistr('\000a')||
'      ,COM_REGISTROS_PRV comrgp'||unistr('\000a')||
'where  comtpg.COMTPR_ID = :P201_ID'||unistr('\000a')||
'and    comtpg.COMRGP_ID = comrgp.ID',
  p_source_type=> 'QUERY',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 63,
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
  p_display_when_type=>'NEVER',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
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
  p_id=>77441915925247298 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_COMECO_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 350,
  p_item_plug_id => 15808218612171816+wwv_flow_api.g_id_offset,
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

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||':P1_PAG_ANTERIOR := :APP_PAGE_ID;';

wwv_flow_api.create_page_process(
  p_id     => 13500612840224722 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 201,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_FOOTER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AsignarPaginaAnterior',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>':P201_PAG_ANTERIOR NOT IN(''251'',''204'')',
  p_process_when_type=>'PLSQL_EXPRESSION',
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
p:=p||'F|#OWNER#:COM_TRAMITES_PRV:P201_ID:ID';

wwv_flow_api.create_page_process(
  p_id     => 12034808187692207 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 201,
  p_process_sequence=> 5,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from COM_TRAMITES_PRV',
  p_process_sql_clob => p,
  p_process_error_message=> 'No se ha podido recuperar la fila.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_return_key_into_item1=>'P201_ID',
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
p:=p||'IF :P201_OPERACION IS NULL THEN'||unistr('\000a')||
'   :P201_OPERACION := ''CONSULTA'';'||unistr('\000a')||
'END IF;'||unistr('\000a')||
'IF :P201_OPERACIONES_HABILITADAS IS NULL THEN'||unistr('\000a')||
'   :P201_OPERACIONES_HABILITADAS := ''CONSULTA'';'||unistr('\000a')||
'END IF;';

wwv_flow_api.create_page_process(
  p_id     => 12400113297313026 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 201,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AsignarOperacionDefault',
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
'  CURSOR cr_comprv is'||unistr('\000a')||
'  SELECT *'||unistr('\000a')||
'  FROM COM_PROVEEDORES'||unistr('\000a')||
'  WHERE CUIT = :P201_CUIT;'||unistr('\000a')||
'  v_comprv COM_PROVEEDORES%ROWTYPE;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  :P201_INFORMACION := NULL;'||unistr('\000a')||
'  OPEN cr_comprv;'||unistr('\000a')||
'  FETCH cr_comprv INTO v_comprv;'||unistr('\000a')||
'  CLOSE cr_comprv;'||unistr('\000a')||
'  IF v_comprv.NOMBRE IS NOT NULL AND :P201_TIPO = ''INSC'' THEN'||unistr('\000a')||
'   :P201_INFORMACION := ''Esta Solicitud no podrá ser <b>Aceptada</b> dado que el Proveedor : ''||v_comprv.N';

p:=p||'OMBRE||'' ya está dado de alta con el CUIT : ''||v_comprv.CUIT||''.'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 12631701993356182 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 201,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Verifica_Existe_CUIT',
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
'cursor cr_compra is '||unistr('\000a')||
'	select compct_nombre'||unistr('\000a')||
'      from com_proveedores_aut_v'||unistr('\000a')||
'      where comtpr_id = :P201_ID'||unistr('\000a')||
'        and rownum = 1;'||unistr('\000a')||
'     '||unistr('\000a')||
'v_compra cr_compra%rowtype;    '||unistr('\000a')||
'begin'||unistr('\000a')||
'open cr_compra;'||unistr('\000a')||
'fetch cr_compra into v_compra;'||unistr('\000a')||
'close cr_compra;'||unistr('\000a')||
''||unistr('\000a')||
':P201_COMPRV_COMPCT_ID := v_compra.compct_nombre;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 69591603606351812 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 201,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Obtener Categoría de Autoridades',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>':P201_TIPO in (''INCT'',''AIAU'',''BAJC'')',
  p_process_when_type=>'PLSQL_EXPRESSION',
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
p:=p||'DECLARE  '||unistr('\000a')||
'  -- Obtiene los Datos del Proveedor'||unistr('\000a')||
'  CURSOR cr_comprv IS'||unistr('\000a')||
'  SELECT *'||unistr('\000a')||
'  FROM COM_PROVEEDORES'||unistr('\000a')||
'  WHERE ID = :P201_COMPRV_ID;'||unistr('\000a')||
'  -- Declaración de Variables'||unistr('\000a')||
'  v_comprv cr_comprv%rowtype;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  -- Obtengo los datos del Proveedor'||unistr('\000a')||
'  OPEN  cr_comprv;'||unistr('\000a')||
'  FETCH cr_comprv INTO v_comprv;'||unistr('\000a')||
'  CLOSE cr_comprv;'||unistr('\000a')||
'  --  Si existe, Cargo los datos del Proveedor'||unistr('\000a')||
' -- IF v_comprv.id IS NOT NULL THEN'||unistr('\000a')||
'   :P201_C';

p:=p||'OMPRV_ID := v_comprv.ID;'||unistr('\000a')||
'   '||unistr('\000a')||
'   :P201_NOMBRE_PRV '||unistr('\000a')||
'       := v_comprv.NOMBRE;'||unistr('\000a')||
'   :P201_DESCRIPCION_ACTIVIDAD_PRV'||unistr('\000a')||
'       := v_comprv.DESCRIPCION_ACTIVIDAD;'||unistr('\000a')||
'   :P201_EMAIL_PRV'||unistr('\000a')||
'       := v_comprv.EMAIL;'||unistr('\000a')||
'   :P201_CONDICION_IB_PRV'||unistr('\000a')||
'       := v_comprv.CONDICION_IB;'||unistr('\000a')||
'   :P201_NUMERO_INSCRIPCION_IB_PRV'||unistr('\000a')||
'       := v_comprv.NUMERO_INSCRIPCION_IB;'||unistr('\000a')||
'   :P201_FECHA_INSCRIPCION_IB_PRV'||unistr('\000a')||
'       := TO_CHAR(v_comprv.FECH';

p:=p||'A_INSCRIPCION_IB,''DD/MM/YYYY'');'||unistr('\000a')||
'   :P201_NRO_CONV_MULTILATERAL_PRV'||unistr('\000a')||
'       := v_comprv.NUMERO_CONVENIO_MULTILATERAL;'||unistr('\000a')||
' -- END IF;'||unistr('\000a')||
'   --'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 18537629585008218 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 201,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Obtener Datos Proveedor',
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
p:=p||'begin    '||unistr('\000a')||
'  if :P201_SITUACION = ''APR'' then'||unistr('\000a')||
'    :P201_TITULO_REGION_BAJA  := ''Autoridades dadas de Baja'';'||unistr('\000a')||
'  else'||unistr('\000a')||
'    :P201_TITULO_REGION_BAJA := ''Autoridades marcadas para dar de Baja'';'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 50809604171798820 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 201,
  p_process_sequence=> 40,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'EstablecerTituloRegionBaja',
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
p:=p||'IF :P201_APP_ANTERIOR IS NULL THEN'||unistr('\000a')||
'   :P201_APP_ANTERIOR := v(''APP_ID'');'||unistr('\000a')||
'END IF;'||unistr('\000a')||
':G_COMECO_ID := :P201_COMECO_ID;';

wwv_flow_api.create_page_process(
  p_id     => 11593710482219720 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 201,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AplicacionPorDefault',
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
-- ...updatable report columns for page 201
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
