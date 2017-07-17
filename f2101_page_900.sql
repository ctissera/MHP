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
--   Date and Time:   17:21 Lunes Noviembre 7, 2016
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

PROMPT ...Remove page 900
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>900);
 
end;
/

 
--application/pages/page_00900
prompt  ...PAGE 900: Contrataciones - Detalle de Evaluación
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 900
 ,p_user_interface_id => 70527406842675 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'ADMINISTRACION'
 ,p_name => 'Contrataciones - Detalle de Evaluación'
 ,p_step_title => 'Contrataciones - Detalle de Evaluación'
 ,p_step_sub_title => 'Gestionar Comparativa de Precios'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 15952704619548666 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'CTISSERA'
 ,p_last_upd_yyyymmddhh24miss => '20161107171709'
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
  p_id=> 5400702649683151 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 900,
  p_plug_name=> 'Informes & Comprobantes',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142030956068227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 40,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 5401100702692007 + wwv_flow_api.g_id_offset,
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
  p_id=> 5410514189244712 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 900,
  p_plug_name=> 'Operaciones Habilitadas',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142030956068227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 5411324279276006 + wwv_flow_api.g_id_offset,
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
s:=s||'select DESCRIPCION'||unistr('\000a')||
'      , EVALUACION'||unistr('\000a')||
'      , comprv_nombre'||unistr('\000a')||
'      , DECODE(COMPRV_ID,0,''NO COTIZADO'','||unistr('\000a')||
'               REPLACE((COM_PKG.OBTN_REPUTACION_URL'||unistr('\000a')||
'                (P_COMRUB_ID      => :P811_COMRUB_ID'||unistr('\000a')||
'                ,P_COMPRV_ID      => COMPRV_ID'||unistr('\000a')||
'                ,P_FECHA_VIGENCIA => SYSDATE'||unistr('\000a')||
'                ,P_COLOR_FONDO    => ''G'''||unistr('\000a')||
'                )),''WORKSPACE_IMAGES.'',''#WORKSPACE_IMAGES#'')';

s:=s||') REPUTACION'||unistr('\000a')||
'      , DECODE(COMPRV_ID,0,''NO COTIZADO'','||unistr('\000a')||
'                REPLACE((COM_PKG.OBTN_CATEG_DOM_URL(P_COMPRV_ID => DECODE(COMPRV_ID,0,to_number(''''),COMPRV_ID)'||unistr('\000a')||
'                                  ,P_COMPED_ID => :P811_COMPED_ID'||unistr('\000a')||
'                                  ,P_COLOR_FONDO => ''G'''||unistr('\000a')||
'        )),''WORKSPACE_IMAGES.'',''#WORKSPACE_IMAGES#'')) CATEGORIZACION'||unistr('\000a')||
'      , MARCA'||unistr('\000a')||
'      , MODELO '||unistr('\000a')||
'      , OBSER';

s:=s||'VACION '||unistr('\000a')||
'      , PRECIO_UNITARIO_COTIZADO'||unistr('\000a')||
'      , PRECIO_TOTAL_COTIZADO'||unistr('\000a')||
'      , PRECIO_TOPE'||unistr('\000a')||
'      , COMPET_RENGLON'||unistr('\000a')||
'      , COMCTZ_OBSERVACION'||unistr('\000a')||
'from ('||unistr('\000a')||
'SELECT ''<b><font color="red">ITEM: ''||comczd.compet_renglon||'||unistr('\000a')||
'''</font> - ''||comczd.compet_codigo||'' ''||'||unistr('\000a')||
'comczd.compet_descripcion||'||unistr('\000a')||
'substr(DECODE(comczd.COMPET_OBSERVACION, '''', '''', '' - ''||comczd.COMPET_OBSERVACION),1,1000)||'||unistr('\000a')||
'''</b><br>Cantidad Solicitad';

s:=s||'a: <b>''||to_char(comczd.COMPET_CANTIDAD)||'||unistr('\000a')||
'''</b> - Precio Unitario Referencia: <b>''||TO_CHAR(comczd.compet_precio_unitario,''$999,999,990.99'')||'||unistr('\000a')||
'''</b> - Precio Total Sugerido: <b>''||TO_CHAR(comczd.compet_cantidad*comczd.compet_precio_unitario,''$999,999,990.99'') ||''</b>'' DESCRIPCION'||unistr('\000a')||
'      , comczd.EVALUACION'||unistr('\000a')||
'      , NVL((SELECT NOMBRE FROM COM_PROVEEDORES_V COMPRV_V WHERE COMPRV_V.ID = COMCZD.COMPRV';

s:=s||'_ID AND comczd.EVALUACION > 0),''NO SE PRESENTARON COTIZACIONES'') comprv_nombre'||unistr('\000a')||
'      , COMCZD.COMPRV_ID COMPRV_ID'||unistr('\000a')||
'      , comczd.MARCA'||unistr('\000a')||
'      , comczd.MODELO '||unistr('\000a')||
'      , comczd.OBSERVACION '||unistr('\000a')||
'      ,DECODE(:P811_PRECIO_TESTIGO_SN , ''SI'','||unistr('\000a')||
'              DECODE(COM_PKG.OBTN_COMPARATIVA_CTP(P_PRECIO_TESTIGO => comczd.COMPET_PRECIO_UNITARIO,P_PRECIO_COTIZADO => comczd.PRECIO_UNITARIO_FINAL)'||unistr('\000a')||
'              ,1,';

s:=s||'''<b><font color="RED">''||DECODE(TO_CHAR(comczd.PRECIO_UNITARIO_FINAL),'''','''',''$''||LTRIM (TO_CHAR(comczd.PRECIO_UNITARIO_FINAL,''999,999,990.99'')))||''</b></font>'''||unistr('\000a')||
'              ,0,''<b><font color="Darkorange">''||DECODE(TO_CHAR(comczd.PRECIO_UNITARIO_FINAL),'''','''',''$''||LTRIM (TO_CHAR(comczd.PRECIO_UNITARIO_FINAL,''999,999,990.99'')))||''</b></font>'''||unistr('\000a')||
'              ,-1,''<b><font color="GREEN">''||DECODE(TO_C';

s:=s||'HAR(comczd.PRECIO_UNITARIO_FINAL),'''','''',''$''||LTRIM (TO_CHAR(comczd.PRECIO_UNITARIO_FINAL,''999,999,990.99'')))||''</b></font>'' '||unistr('\000a')||
'                    ),''$''||LTRIM (TO_CHAR(comczd.PRECIO_UNITARIO_FINAL,''999,999,990.99''))'||unistr('\000a')||
'             ) PRECIO_UNITARIO_COTIZADO'||unistr('\000a')||
'      , DECODE(TO_CHAR(comczd.COMPET_CANTIDAD * comczd.PRECIO_UNITARIO_FINAL),'''','''',''$''||LTRIM (TO_CHAR(comczd.COMPET_CANTIDAD * comczd.PRECIO_UN';

s:=s||'ITARIO_FINAL,''999,999,990.99''))) PRECIO_TOTAL_COTIZADO'||unistr('\000a')||
'      '||unistr('\000a')||
'      '||unistr('\000a')||
'      ,decode(comczd.COMPET_COMCIT_ID,'''','''', replace(comczd.INFORME_EVALUACION,''IMAGE_PREFIX.'',''#IMAGE_PREFIX#'')) PRECIO_TOPE'||unistr('\000a')||
'      , comczd.COMPET_RENGLON'||unistr('\000a')||
'      , comczd.comctz_observacion COMCTZ_OBSERVACION'||unistr('\000a')||
'   FROM COM_COTIZACIONES_DET_V comczd'||unistr('\000a')||
' WHERE comczd.COMCON_ID = :P900_COMCON_ID'||unistr('\000a')||
'     AND comczd.COMCTZ_SITUACION = ''PRE'''||unistr('\000a')||
' ';

s:=s||'    AND COMCZD.PRECIO_UNITARIO_FINAL IS NOT NULL     '||unistr('\000a')||
'--   AND comczd.COMPED_ID = :P900_COMPED_ID'||unistr('\000a')||
'--   AND comczd.EVALUACION IS NOT NULL'||unistr('\000a')||
'UNION ALL'||unistr('\000a')||
'SELECT ''<b><font color="red">ITEM: ''||comczd.compet_renglon||'||unistr('\000a')||
'''</font> - ''||comczd.compet_codigo||'' ''||'||unistr('\000a')||
'comczd.compet_descripcion||'||unistr('\000a')||
'DECODE(comczd.COMPET_OBSERVACION, '''', '''', '' - ''||comczd.COMPET_OBSERVACION)||'||unistr('\000a')||
'''</b><br>Cantidad Solicitada: <b>''||to_char';

s:=s||'(comczd.COMPET_CANTIDAD)||'||unistr('\000a')||
'''</b> - Precio Unitario Referencia: <b>''||TO_CHAR(comczd.compet_precio_unitario,''$999,999,990.99'')||'||unistr('\000a')||
'''</b> - Precio Total Sugerido: <b>''||TO_CHAR(comczd.compet_cantidad*comczd.compet_precio_unitario,''$999,999,990.99'') ||''</b>''  DESCRIPCION'||unistr('\000a')||
'      , 0 EVALUACION'||unistr('\000a')||
'      , ''NO COTIZADO'' comprv_nombre'||unistr('\000a')||
'      , 0 comprv_id'||unistr('\000a')||
'      , ''NO COTIZADO'' MARCA'||unistr('\000a')||
'      , ''NO COTIZADO'' MODELO';

s:=s||' '||unistr('\000a')||
'      , ''NO COTIZADO'' OBSERVACION '||unistr('\000a')||
'      , '''' PRECIO_UNITARIO_COTIZADO'||unistr('\000a')||
'      , '''' PRECIO_TOTAL_COTIZADO'||unistr('\000a')||
'      , '''' PRECIO_TOPE'||unistr('\000a')||
'      , comczd.COMPET_RENGLON'||unistr('\000a')||
'      , '' '' COMCTZ_OBSERVACION'||unistr('\000a')||
'   FROM COM_COTIZACIONES_DET2_V comczd'||unistr('\000a')||
' WHERE comczd.COMCON_ID = :P900_COMCON_ID'||unistr('\000a')||
'--   AND comczd.COMPED_ID = :P900_COMPED_ID'||unistr('\000a')||
')'||unistr('\000a')||
'ORDER BY compet_renglon, to_number(EVALUACION)';

wwv_flow_api.create_report_region (
  p_id=> 5459032400507640 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 900,
  p_name=> 'Detalle de &P1_COMETQ_PRO.',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 30,
  p_region_attributes=>'style="width:98%"',
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
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '999999',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '1',
  p_query_no_data_found=> 'No se ha encontrado ningún dato',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '999999',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'REPEAT_HEADINGS_ON_BREAK_1',
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
  p_id=> 5464523780508379 + wwv_flow_api.g_id_offset,
  p_region_id=> 5459032400507640 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'DESCRIPCION',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Item',
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
  p_print_col_width=> '5',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 5464909401508391 + wwv_flow_api.g_id_offset,
  p_region_id=> 5459032400507640 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'EVALUACION',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Ranking',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '5',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 5465017718508391 + wwv_flow_api.g_id_offset,
  p_region_id=> 5459032400507640 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_NOMBRE',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Proveedor',
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
  p_print_col_width=> '5',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31206411770679138 + wwv_flow_api.g_id_offset,
  p_region_id=> 5459032400507640 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'REPUTACION',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Reputación',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_report_column_required_role => 31685214962055744+ wwv_flow_api.g_id_offset,
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '5',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31206501481679140 + wwv_flow_api.g_id_offset,
  p_region_id=> 5459032400507640 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'CATEGORIZACION',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Ubicación',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_report_column_required_role => 31685102018042522+ wwv_flow_api.g_id_offset,
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '5',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 5465128920508391 + wwv_flow_api.g_id_offset,
  p_region_id=> 5459032400507640 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'MARCA',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Marca',
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
  p_print_col_width=> '5',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 5465218536508391 + wwv_flow_api.g_id_offset,
  p_region_id=> 5459032400507640 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'MODELO',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Modelo',
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
  p_print_col_width=> '5',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 5465318125508393 + wwv_flow_api.g_id_offset,
  p_region_id=> 5459032400507640 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'OBSERVACION',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Observación',
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
  p_print_col_width=> '5',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 5465418415508393 + wwv_flow_api.g_id_offset,
  p_region_id=> 5459032400507640 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'PRECIO_UNITARIO_COTIZADO',
  p_column_display_sequence=> 10,
  p_column_heading=> 'P.Unit.Ct.',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
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
  p_print_col_width=> '5',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 5465525675508393 + wwv_flow_api.g_id_offset,
  p_region_id=> 5459032400507640 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'PRECIO_TOTAL_COTIZADO',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Total Cot.',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
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
  p_print_col_width=> '5',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 51201929015948409 + wwv_flow_api.g_id_offset,
  p_region_id=> 5459032400507640 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'PRECIO_TOPE',
  p_column_display_sequence=> 13,
  p_column_heading=> 'Informe',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'PLSQL_EXPRESSION',
  p_display_when_condition=> ':P1_SEGUSU_TIPO = ''ADM''',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '5',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7100000553643126 + wwv_flow_api.g_id_offset,
  p_region_id=> 5459032400507640 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_RENGLON',
  p_column_display_sequence=> 12,
  p_column_heading=> 'Compet Renglon',
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
  p_id=> 51203329125343398 + wwv_flow_api.g_id_offset,
  p_region_id=> 5459032400507640 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'COMCTZ_OBSERVACION',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Cotización',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '5',
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
  p_id=> 20723931416882366 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 900,
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
s:=s||'DECLARE'||unistr('\000a')||
' --'||unistr('\000a')||
' CURSOR cr_comcot IS'||unistr('\000a')||
' SELECT *     '||unistr('\000a')||
'   FROM COM_CONTRATACIONES_DET_V'||unistr('\000a')||
'  WHERE COMCON_ID = :P900_COMCON_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_comcot cr_comcot%rowtype;'||unistr('\000a')||
'  v_comcon COM_CONTRATACIONES%rowtype;'||unistr('\000a')||
'  --'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
' OPEN cr_comcot;'||unistr('\000a')||
' FETCH cr_comcot INTO v_comcot;'||unistr('\000a')||
' CLOSE cr_comcot;'||unistr('\000a')||
' --'||unistr('\000a')||
' --COM_PKG.SET_COMCON(p_comcon_id => :P900_COMCON_ID);'||unistr('\000a')||
' --COM_PKG.GET_COMCON(p_comcon => v_comcon);'||unistr('\000a')||
' --COM_PKG.INI_COMCON;'||unistr('\000a')||
' --';

s:=s||''||unistr('\000a')||
' htp.print(''<table width="%100">'');'||unistr('\000a')||
' htp.print(''<tr><td> Número &P1_COMETQ_COMS. : <b>''||v_comcot.COMCON_CODIGO||''/''||v_comcot.COMPED_EJERCICIO||''</b></tr>'');'||unistr('\000a')||
' htp.print(''<tr><td>Tipo de &P1_COMETQ_COMS. : <b>''||v_comcot.COMCTT_NOMBRE||'' </b></td></tr>'');'||unistr('\000a')||
' htp.print(''<tr><td>Método de Adjudicación : <b>''||gral_pkg.obtn_cfgdes (''COM_CONTRATACIONES.METODO_ADJUDICACION'', v_comcot.COMCON_METODO_ADJUD';

s:=s||'ICACION)||'' </b></td></tr>'');'||unistr('\000a')||
' htp.print(''<tr><td>Estado &P1_COMETQ_COMS. : <b>''||v_comcot.COMCOE_ESTADO_DESC||''</b></td></tr>'');'||unistr('\000a')||
' htp.print(''<tr><td>&P1_COMETQ_PEDS. Expediente : <b>''||v_comcot.COMPED_EXPEDIENTE||''</b></td></tr>'');'||unistr('\000a')||
' if :P811_PRECIO_TESTIGO_SN = ''SI'' then'||unistr('\000a')||
'   htp.print(''<tr><td> Recuerde : <font color="red"><b>&P811_MENSAJE_PRECIO_TESTIGO.</b></font><br></td></tr>'');'||unistr('\000a')||
' end if;'||unistr('\000a')||
'-- if';

s:=s||' (v_comcon.PRIORIDAD = 0) then'||unistr('\000a')||
' if (v_comcot.comcon_prioridad = 0) then'||unistr('\000a')||
' '||unistr('\000a')||
'   --htp.print(''<tr><td>Prioridad: <span style="color:red"><b>''||GRAL_PKG.OBTN_CFGABR(''COM_CONTRATACIONES.PRIORIDAD'',v_comcon.PRIORIDAD)||''</b></span></td></tr>'');'||unistr('\000a')||
'   htp.print(''<tr><td>Prioridad: <span style="color:red"><b>''||GRAL_PKG.OBTN_CFGABR(''COM_CONTRATACIONES.PRIORIDAD'',v_comcot.comcon_prioridad)||''</b></span></td></';

s:=s||'tr>'');'||unistr('\000a')||
' else'||unistr('\000a')||
'   --htp.print(''<tr><td>Prioridad: <b>''||GRAL_PKG.OBTN_CFGABR(''COM_CONTRATACIONES.PRIORIDAD'',v_comcon.PRIORIDAD)||''</b></td></tr>'');'||unistr('\000a')||
'   htp.print(''<tr><td>Prioridad: <b>''||GRAL_PKG.OBTN_CFGABR(''COM_CONTRATACIONES.PRIORIDAD'',v_comcot.comcon_prioridad)||''</b></td></tr>'');'||unistr('\000a')||
' end if;'||unistr('\000a')||
' htp.print(''</table>'');'||unistr('\000a')||
' :P900_COMCON_METODO_ADJ := v_comcot.COMCON_METODO_ADJUDICACION;'||unistr('\000a')||
'END;'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 20747430256674462 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 900,
  p_plug_name=> 'Detalle de Evaluación',
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
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 142033072101227104+ wwv_flow_api.g_id_offset,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 5,
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
  p_id             => 20957326908456708 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 900,
  p_button_sequence=> 1,
  p_button_plug_id => 20747430256674462+wwv_flow_api.g_id_offset,
  p_button_name    => 'RETORNAR',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Retornar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 20982302863639026 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 900,
  p_button_sequence=> 5,
  p_button_plug_id => 20747430256674462+wwv_flow_api.g_id_offset,
  p_button_name    => 'IMPRIMIR',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Imprimir Evaluación',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=INFCOM:1003:&SESSION.::&DEBUG.:1003:P1_SEGORG_CODIGO,P1003_COMCON_ID:&P1_SEGORG_CODIGO.,&P900_COMCON_ID.',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 8027628169101132+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 4632900449624732 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 900,
  p_button_sequence=> 20,
  p_button_plug_id => 20747430256674462+wwv_flow_api.g_id_offset,
  p_button_name    => 'ADJUDICAR',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Ver Adjudicación',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:910:&SESSION.::&DEBUG.:910:P910_COMCON_ID,P910_PAG_ANTERIOR:&P900_COMCON_ID.,900',
  p_button_condition=> ':P811_ESTADO IN (''PRE'',''ADJ'',''DES'',''FIN'',''ENV'',''INF'')',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 8027702327103176+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>20957627030456710 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 900,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:811:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>20957326908456708+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>20725227276882402 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 900,
  p_name=>'P900_COMCON_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'COMCON_ID',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 7,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039553452227115+wwv_flow_api.g_id_offset,
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
  p_id=>20768604872234887 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 900,
  p_name=>'P900_COMPED_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comped Id',
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
  p_field_template=> 142039553452227115+wwv_flow_api.g_id_offset,
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
  p_id=>20768815953238080 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 900,
  p_name=>'P900_COMPET_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Compet Id',
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
  p_field_template=> 142039553452227115+wwv_flow_api.g_id_offset,
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
  p_id=>35484929078549179 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 900,
  p_name=>'P900_COMCON_METODO_ADJ',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 20747430256674462+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'COMCON_METODO_ADJUDICACION',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 7,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039553452227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
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
p:=p||'BEGIN'||unistr('\000a')||
'  SELECT detped.renglon'||unistr('\000a')||
'  INTO :P900_ITEMS'||unistr('\000a')||
'  FROM COM_CONTRATACIONES_DETPED_V detped   '||unistr('\000a')||
'  WHERE detped.COMPET_ID = :P900_COMPET_ID'||unistr('\000a')||
'    AND detped.COMCON_ID = :P900_COMCON_ID;'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 20934802612295332 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 900,
  p_process_sequence=> 30,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Asignar Items',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P900_COMPET_ID',
  p_process_when_type=>'ITEM_IS_NOT_NULL',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 900
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
