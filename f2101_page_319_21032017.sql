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
--   Date and Time:   14:44 Tuesday March 21, 2017
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
begin wwv_flow.g_browser_language := 'en'; end;
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

PROMPT ...Remove page 319
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>319);
 
end;
/

 
--application/pages/page_00319
prompt  ...PAGE 319: Editar Cantidades
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 319
 ,p_user_interface_id => 70527406842675 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'ADMINISTRACION'
 ,p_name => 'Editar Cantidades'
 ,p_step_title => 'Editar Cantidades'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Editar Cantidades'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_html_page_header => 
'<script language="JavaScript" type="text/javascript">'||unistr('\000a')||
'<!--'||unistr('\000a')||
''||unistr('\000a')||
' htmldb_delete_message=''"ACTUALIZAR"'';'||unistr('\000a')||
''||unistr('\000a')||
'//-->'||unistr('\000a')||
''||unistr('\000a')||
'  function limitarObservacion() {'||unistr('\000a')||
''||unistr('\000a')||
'    $(".observ").attr("maxlength", "10");'||unistr('\000a')||
'}'||unistr('\000a')||
'</script>'
 ,p_javascript_code_onload => 
'limitarObservacion();'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'LPULIDO'
 ,p_last_upd_yyyymmddhh24miss => '20170315090923'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT COMCOB_V.ID'||unistr('\000a')||
'     , COMCOB_V.COMPED_ID'||unistr('\000a')||
'     , COMCOB_V.RENGLON'||unistr('\000a')||
'     , COMCOB_V.COMCCL_ID'||unistr('\000a')||
'     , COMCOB_V.COMCIT_ID'||unistr('\000a')||
'     , COMCOB_V.CODIGO'||unistr('\000a')||
'     , COMCOB_V.DESCRIPCION||DECODE(COMCOB_V.OBSERVACION'||unistr('\000a')||
'                      ,'''''||unistr('\000a')||
'                      ,'''''||unistr('\000a')||
'                      ,'' - ''||COMCOB_V.OBSERVACION'||unistr('\000a')||
'                      ) COMCOB_DESCRIPCION'||unistr('\000a')||
'     , COMCOB_V.CANTIDAD'||unistr('\000a')||
'     , DECODE(NVL(COMCOB_V.P';

s:=s||'RECIO_UNITARIO - COMCIT_V.COMCTP_PRECIO,-1)'||unistr('\000a')||
'             , 0'||unistr('\000a')||
'             , ''<font color=BLUE><b>$ ''||'||unistr('\000a')||
'             TO_CHAR(COMCOB_V.PRECIO_UNITARIO,''999,999,999.99'')'||unistr('\000a')||
'               ||'' <img src="#IMAGE_PREFIX#menu/blue_info_16x16.gif" title="Precio Testigo Vigente"</>''||''</b></font>'',''$ ''||'||unistr('\000a')||
'          '||unistr('\000a')||
'             TO_CHAR(COMCOB_V.PRECIO_UNITARIO,''999,999,999.99'')) PRECIO_UNITARIO'||unistr('\000a')||
'    ,  trim(TO_';

s:=s||'CHAR(COMCOB_V.PRECIO_UNITARIO,''999999999.99''))                PRECIO_UNITARIO_EDI'||unistr('\000a')||
'     ,(SELECT CANTIDAD * PRECIO_UNITARIO'||unistr('\000a')||
'         FROM COM_PEDIDOS_DETALLES '||unistr('\000a')||
'        WHERE COMPED_ID = COMCOB_V.COMPED_ID'||unistr('\000a')||
'          AND ID = COMCOB_V.ID)'||unistr('\000a')||
'            PRECIO_TOTAL '||unistr('\000a')||
'     , COMCOB_V.OBSERVACION'||unistr('\000a')||
'     , COMCIT_V.COMCTP_PRECIO'||unistr('\000a')||
' FROM COM_PEDIDOS_DETALLES COMCOB_V'||unistr('\000a')||
'     ,COM_CATALOGO_ITEMS_V COMCIT_V '||unistr('\000a')||
'WHERE C';

s:=s||'OMCOB_V.COMPED_ID = :P309_COMPED_ID'||unistr('\000a')||
'  AND COMCOB_V.COMCIT_ID = COMCIT_V.ID(+)'||unistr('\000a')||
'ORDER BY COMCOB_V.RENGLON';

wwv_flow_api.create_report_region (
  p_id=> 31593017826166233 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 319,
  p_name=> '&P1_COMETQ_PRO. solicitados',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 20,
  p_region_attributes=>'style="width:900px"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_2',
  p_item_display_point=> 'BELOW',
  p_source=> s,
  p_source_type=> 'UPDATABLE_SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_header=> '<b>IMPORTANTE:</b> Confirme los cambios "ANTES" de pasar al siguiente juego de registros.<br><br>',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 142033676269227104+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '10',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se ha encontrado ningún dato.',
  p_query_num_rows_type=> 'ROW_RANGES_WITH_LINKS',
  p_query_row_count_max=> '999999',
  p_pagination_display_position=> 'BOTTOM_LEFT',
  p_report_total_text_format=> 'Totales',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
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
  p_id=> 31593228135166233 + wwv_flow_api.g_id_offset,
  p_region_id=> 31593017826166233 + wwv_flow_api.g_id_offset,
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
  p_display_as=>'HIDDEN',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source_type=> 'T',
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31593512215166233 + wwv_flow_api.g_id_offset,
  p_region_id=> 31593017826166233 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_ID',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Comped Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPED_ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31630110870217999 + wwv_flow_api.g_id_offset,
  p_region_id=> 31593017826166233 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'RENGLON',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Renglón',
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31630208764218001 + wwv_flow_api.g_id_offset,
  p_region_id=> 31593017826166233 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COMCCL_ID',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Comccl Id',
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
  p_id=> 31630301001218001 + wwv_flow_api.g_id_offset,
  p_region_id=> 31593017826166233 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMCIT_ID',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Comcit Id',
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
  p_id=> 31630431174218001 + wwv_flow_api.g_id_offset,
  p_region_id=> 31593017826166233 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
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
  p_id=> 31630504564218001 + wwv_flow_api.g_id_offset,
  p_region_id=> 31593017826166233 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'COMCOB_DESCRIPCION',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Descripción',
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
  p_id=> 31630603858218001 + wwv_flow_api.g_id_offset,
  p_region_id=> 31593017826166233 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'CANTIDAD',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Cantidad',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'TEXT',
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
  p_id=> 31630707701218001 + wwv_flow_api.g_id_offset,
  p_region_id=> 31593017826166233 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'PRECIO_UNITARIO',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Precio Unitario',
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 36416404537648265 + wwv_flow_api.g_id_offset,
  p_region_id=> 31593017826166233 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'PRECIO_UNITARIO_EDI',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Precio Nuevo',
  p_use_as_row_header=> 'N',
  p_column_format=> '999G999G999G999G990D00',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'TEXT',
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
  p_id=> 31630823129218001 + wwv_flow_api.g_id_offset,
  p_region_id=> 31593017826166233 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'PRECIO_TOTAL',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Precio Total Ref.',
  p_column_format=> 'FML999G999G999G999G990D00',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'Y',
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
  p_id=> 31594107154166233 + wwv_flow_api.g_id_offset,
  p_region_id=> 31593017826166233 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'OBSERVACION',
  p_column_display_sequence=> 13,
  p_column_heading=> 'Observación',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'TEXT',
  p_lov_show_nulls=> 'NO',
  p_column_width=> '10',
  p_column_height=> '2',
  p_css_classes=> 'observ',
  p_cattributes=> 'title="Máximo 10 caracteres. Para más detalles adjunte un Documento."',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'OBSERVACION',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31630922251218001 + wwv_flow_api.g_id_offset,
  p_region_id=> 31593017826166233 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'COMCTP_PRECIO',
  p_column_display_sequence=> 12,
  p_column_heading=> 'Comctp Precio',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 31604424085166237 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 319,
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
s:=s||'DECLARE'||unistr('\000a')||
' --'||unistr('\000a')||
' CURSOR cr_comped IS'||unistr('\000a')||
' SELECT CODIGO'||unistr('\000a')||
'      , TO_CHAR(FECHA_SOLICITUD,''dd/mm/yyyy'')FECHA_SOLICITUD'||unistr('\000a')||
'      , EXPEDIENTE'||unistr('\000a')||
'      , to_char(COMCOB_codigo,''000'')||'' - ''||COMCOB_nombre  COMCOB_NOMBRE'||unistr('\000a')||
'      , CONTRATANTE'||unistr('\000a')||
' FROM COM_PEDIDOS_V'||unistr('\000a')||
' WHERE ID = :P319_ID;'||unistr('\000a')||
' --'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
' --'||unistr('\000a')||
' FOR v_comped IN cr_comped LOOP'||unistr('\000a')||
'   htp.print(''<table><tr><td>Número : <b>''||v_comped.CODIGO ||''</b></td>'');'||unistr('\000a')||
'   htp.print(''';

s:=s||'<td>Fecha de Solicitud : <b>''||v_comped.FECHA_SOLICITUD ||''</b></td>'');'||unistr('\000a')||
'   htp.print(''<td>Expediente : <b>''||v_comped.Expediente ||''</b><br></td></tr>'');'||unistr('\000a')||
'   htp.print(''<tr><td colspan="5">&P1_COMETQ_CONS. : <b>''||v_comped.Contratante||''</b><br></td></tr>'');'||unistr('\000a')||
'   htp.print(''<tr><td colspan="5">&P1_COMETQ_COBS. : <b>''||v_comped.COMCOB_NOMBRE ||''</b></td></tr></table>'');'||unistr('\000a')||
' END LOOP;'||unistr('\000a')||
' --'||unistr('\000a')||
'END;'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 31619122166183246 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 319,
  p_plug_name=> 'Datos de Identificación',
  p_region_name=>'',
  p_region_attributes=> 'style="width:900px"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
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
  p_id             => 31619420408183247 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 319,
  p_button_sequence=> 10,
  p_button_plug_id => 31619122166183246+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Retornar',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:309:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 31605718189166238 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 319,
  p_button_sequence=> 80,
  p_button_plug_id => 31619122166183246+wwv_flow_api.g_id_offset,
  p_button_name    => 'Confirmar',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Confirmar',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 31605507842166238 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 319,
  p_button_sequence=> 100,
  p_button_plug_id => 31593017826166233+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCELAR_2',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Retornar',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:309:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 36422014518715673 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 319,
  p_button_sequence=> 105,
  p_button_plug_id => 31593017826166233+wwv_flow_api.g_id_offset,
  p_button_name    => 'Actualizar_precios',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Actualizar Precios',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.confirm (''Seguro desea Actualizar Todos los Precios de Items Nomenclados ?'',''ACTUALIZAR'');',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 31605917429166238 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 319,
  p_button_sequence=> 110,
  p_button_plug_id => 31593017826166233+wwv_flow_api.g_id_offset,
  p_button_name    => 'Confirmar_2',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Confirmar',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>31612825556166249 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 319,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:319:&SESSION.::&DEBUG.::P319_ID,P319_OPERACION:&P319_ID.,EDICION&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 30,
  p_branch_condition_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_branch_condition=> 'P319_ERROR_VALIDACION',
  p_branch_condition_text=>'TRUE',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>31613000892166249 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 319,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:319:&SESSION.::&DEBUG.::P319_ID,P319_OPERACION:&P319_ID.,EDICION&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 35,
  p_branch_condition_type=> 'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2',
  p_branch_condition=> 'P319_ERROR_VALIDACION',
  p_branch_condition_text=>'TRUE',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>31614206772166249 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 319,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:319:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 150,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>31606522563166240 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 319,
  p_name=>'P319_APP_ANTERIOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 3,
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
  p_field_template=> 142039553452227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>31606722908166240 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 319,
  p_name=>'P319_PAG_ANTERIOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 4,
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
  p_field_template=> 142039553452227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>31609618566166241 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 319,
  p_name=>'P319_OPERACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Operacion',
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
  p_field_template=> 142039363292227113+wwv_flow_api.g_id_offset,
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
  p_id=>31622706283207035 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 319,
  p_name=>'P319_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 14,
  p_item_plug_id => 31619122166183246+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Id',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039553452227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>31641002745650754 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 319,
  p_name=>'P319_ERROR_VALIDACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 24,
  p_item_plug_id => 31619122166183246+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Error Validacion',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039553452227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>31641320752655969 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 319,
  p_name=>'P319_SE_PUEDE_COTIZAR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 34,
  p_item_plug_id => 31619122166183246+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Se Puede Cotizar',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039553452227115+wwv_flow_api.g_id_offset,
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
p:=p||'DECLARE'||unistr('\000a')||
'  v_cantidad  NUMBER:=0;'||unistr('\000a')||
'  v_mensaje   VARCHAR2(2000);'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  -- Recorrer los detalles del Pedido a confirmar  '||unistr('\000a')||
'  FOR i in 1..apex_application.g_f01.count LOOP'||unistr('\000a')||
'    DECLARE'||unistr('\000a')||
'      v_compet_correcto VARCHAR2(2) := ''SI'';'||unistr('\000a')||
'      v_compet_cantidad NUMBER;'||unistr('\000a')||
'      v_compet_precio NUMBER;'||unistr('\000a')||
'      v_compet_observacion varchar2(10);'||unistr('\000a')||
'    BEGIN'||unistr('\000a')||
'     -- g_f02 (Cantidad)'||unistr('\000a')||
'     -- Verificar Cantidad en Blanco';

p:=p||''||unistr('\000a')||
'     IF replace(htmldb_application.g_f02(i),''%''||''null%'',NULL) IS NULL THEN'||unistr('\000a')||
'       v_compet_correcto := ''NO'';'||unistr('\000a')||
'       v_mensaje := v_mensaje ||''Debe indicar la cantidad para confirmar el detalle: ''|| i ||'||unistr('\000a')||
'                    ''<br>'';'||unistr('\000a')||
'     ELSE'||unistr('\000a')||
'       -- Verificar que la Cantidad sea numerico y de  2 decimales'||unistr('\000a')||
'       BEGIN'||unistr('\000a')||
'         v_compet_cantidad := to_number(replace('||unistr('\000a')||
'            replace(htmldb_a';

p:=p||'pplication.g_f02(i),''%''||''null%'',NULL),'','',''.''),''999999999999990.00'');'||unistr('\000a')||
'       EXCEPTION'||unistr('\000a')||
'         WHEN OTHERS THEN'||unistr('\000a')||
'           v_mensaje := v_mensaje || ''Debe indicar un valor numérico en la cantidad del detalle: ''|| i||''<br>'';'||unistr('\000a')||
'           v_compet_correcto := ''NO'';'||unistr('\000a')||
'       END;'||unistr('\000a')||
'       -- Verificar que la Cantidad sea numerico y mayor que cero'||unistr('\000a')||
'       IF htmldb_application.g_f02(i) <= 0 THEN'||unistr('\000a')||
'          ';

p:=p||'v_mensaje := v_mensaje || ''Debe indicar un valor numérico mayor a cero en la cantidad del detalle: ''|| i||''<br>'';'||unistr('\000a')||
'          v_compet_correcto := ''NO'';'||unistr('\000a')||
'       END IF;'||unistr('\000a')||
'     END IF;'||unistr('\000a')||
'    --'||unistr('\000a')||
'     -- g_f03 (Precio)'||unistr('\000a')||
'     -- Verificar Precio en Blanco'||unistr('\000a')||
'     IF replace(htmldb_application.g_f03(i),''%''||''null%'',NULL) IS NULL THEN'||unistr('\000a')||
'       v_compet_correcto := ''NO'';'||unistr('\000a')||
'       v_mensaje := v_mensaje ||''Debe indicar ';

p:=p||'el Precio Nuevo para confirmar el detalle: ''|| i ||'||unistr('\000a')||
'                    ''<br>'';'||unistr('\000a')||
'     ELSE'||unistr('\000a')||
'       -- Verificar que la Precio sea numerico y de  2 decimales'||unistr('\000a')||
'       BEGIN'||unistr('\000a')||
'         v_compet_precio := to_number(replace('||unistr('\000a')||
'            replace(htmldb_application.g_f03(i),''%''||''null%'',NULL),'','',''.''),''999999999999999.00'');'||unistr('\000a')||
'       EXCEPTION'||unistr('\000a')||
'         WHEN OTHERS THEN'||unistr('\000a')||
'           v_mensaje := v_mensaje || ''Debe ';

p:=p||'indicar un valor numérico en el precio del detalle: ''|| i||''<br>'';'||unistr('\000a')||
'           v_compet_correcto := ''NO'';'||unistr('\000a')||
'       END;'||unistr('\000a')||
'     END IF;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    -- g_f04 (Observación)'||unistr('\000a')||
'    --'||unistr('\000a')||
'    v_compet_observacion := htmldb_application.g_f04(i);'||unistr('\000a')||
'    --'||unistr('\000a')||
'    -- Si el detalle es correcto (pasa todas las validaciones), confirmar'||unistr('\000a')||
'      IF v_compet_correcto = ''SI'' THEN'||unistr('\000a')||
'       UPDATE COM_PEDIDOS_DETALLES'||unistr('\000a')||
'       SET CANTID';

p:=p||'AD = v_compet_cantidad'||unistr('\000a')||
'          ,PRECIO_UNITARIO = v_compet_precio'||unistr('\000a')||
'          ,OBSERVACION = v_compet_observacion'||unistr('\000a')||
'       WHERE id = apex_application.g_f01(i);'||unistr('\000a')||
'       --'||unistr('\000a')||
'       v_cantidad := v_cantidad + 1;'||unistr('\000a')||
'       --'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    END;'||unistr('\000a')||
'    --'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  -- Desplegar el mensaje de Error si corresponde'||unistr('\000a')||
'  IF v_mensaje IS NULL THEN'||unistr('\000a')||
'     :P319_ERROR_VALIDACION := ''FALSE'';'||unistr('\000a')||
'     apex_ap';

p:=p||'plication.g_print_success_message := ''Se ha actualizado ''||v_cantidad||'' detalle(s) con éxito.'';'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'     :P319_ERROR_VALIDACION := ''TRUE'';'||unistr('\000a')||
'     IF v_cantidad <> 0 THEN'||unistr('\000a')||
'         v_mensaje := v_mensaje ||''Se ha actualizado ''||v_cantidad||'' detalle(s) con éxito.'';  '||unistr('\000a')||
'     END IF; '||unistr('\000a')||
'     apex_application.g_print_success_message := v_mensaje||'||unistr('\000a')||
'     ''<br>Los detalles con error han sido restaurados con';

p:=p||' su información original.'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
' --'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 31611323534166244 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 319,
  p_process_sequence=> 40,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Confirmar Edicion',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>31605718189166238 + wwv_flow_api.g_id_offset,
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
'  v_cantidad  NUMBER:=0;'||unistr('\000a')||
'  v_mensaje   VARCHAR2(2000);'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  -- Recorrer los detalles del Pedido a confirmar  '||unistr('\000a')||
'  FOR i in 1..apex_application.g_f01.count LOOP'||unistr('\000a')||
'    DECLARE'||unistr('\000a')||
'      v_compet_correcto VARCHAR2(2) := ''SI'';'||unistr('\000a')||
'      v_compet_cantidad NUMBER;'||unistr('\000a')||
'      v_compet_precio NUMBER;'||unistr('\000a')||
'      v_compet_observacion varchar2(10);'||unistr('\000a')||
'    BEGIN'||unistr('\000a')||
'     -- g_f02 (Cantidad)'||unistr('\000a')||
'     -- Verificar Cantidad en Blanco';

p:=p||''||unistr('\000a')||
'     IF replace(htmldb_application.g_f02(i),''%''||''null%'',NULL) IS NULL THEN'||unistr('\000a')||
'       v_compet_correcto := ''NO'';'||unistr('\000a')||
'       v_mensaje := v_mensaje ||''Debe indicar la cantidad para confirmar el detalle: ''|| i ||'||unistr('\000a')||
'                    ''<br>'';'||unistr('\000a')||
'     ELSE'||unistr('\000a')||
'       -- Verificar que la Cantidad sea numerico y de  2 decimales'||unistr('\000a')||
'       BEGIN'||unistr('\000a')||
'         v_compet_cantidad := to_number(replace('||unistr('\000a')||
'            replace(htmldb_a';

p:=p||'pplication.g_f02(i),''%''||''null%'',NULL),'','',''.''),''999999999999990.00'');'||unistr('\000a')||
'       EXCEPTION'||unistr('\000a')||
'         WHEN OTHERS THEN'||unistr('\000a')||
'           v_mensaje := v_mensaje || ''Debe indicar un valor numérico en la cantidad del detalle: ''|| i||''<br>'';'||unistr('\000a')||
'           v_compet_correcto := ''NO'';'||unistr('\000a')||
'       END;'||unistr('\000a')||
'       -- Verificar que la Cantidad sea numerico y mayor que cero'||unistr('\000a')||
'       IF htmldb_application.g_f02(i) <= 0 THEN'||unistr('\000a')||
'          ';

p:=p||'v_mensaje := v_mensaje || ''Debe indicar un valor numérico mayor a cero en la cantidad del detalle: ''|| i||''<br>'';'||unistr('\000a')||
'          v_compet_correcto := ''NO'';'||unistr('\000a')||
'       END IF;'||unistr('\000a')||
'       '||unistr('\000a')||
'     END IF;'||unistr('\000a')||
'    --'||unistr('\000a')||
'     -- g_f03 (Precio)'||unistr('\000a')||
'     -- Verificar Precio en Blanco'||unistr('\000a')||
'     IF replace(htmldb_application.g_f03(i),''%''||''null%'',NULL) IS NULL THEN'||unistr('\000a')||
'       v_compet_correcto := ''NO'';'||unistr('\000a')||
'       v_mensaje := v_mensaje ||''Debe ';

p:=p||'indicar el Precio Nuevo para confirmar el detalle: ''|| i ||'||unistr('\000a')||
'                    ''<br>'';'||unistr('\000a')||
'     ELSE'||unistr('\000a')||
'       -- Verificar que la Precio sea numerico y de  2 decimales'||unistr('\000a')||
'       BEGIN'||unistr('\000a')||
'         v_compet_precio := to_number(replace('||unistr('\000a')||
'            replace(htmldb_application.g_f03(i),''%''||''null%'',NULL),'','',''.''),''999999999999999.00'');'||unistr('\000a')||
'       EXCEPTION'||unistr('\000a')||
'         WHEN OTHERS THEN'||unistr('\000a')||
'           v_mensaje := v_mensaje |';

p:=p||'| ''Debe indicar un valor numérico en el precio del detalle: ''|| i||''<br>'';'||unistr('\000a')||
'           v_compet_correcto := ''NO'';'||unistr('\000a')||
'       END;'||unistr('\000a')||
'     END IF;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    -- g_f04 (Observación)'||unistr('\000a')||
'    --'||unistr('\000a')||
'    v_compet_observacion := htmldb_application.g_f04(i);'||unistr('\000a')||
'    --'||unistr('\000a')||
'    -- Si el detalle es correcto (pasa todas las validaciones), confirmar'||unistr('\000a')||
'      IF v_compet_correcto = ''SI'' THEN'||unistr('\000a')||
'       UPDATE COM_PEDIDOS_DETALLES'||unistr('\000a')||
'       SE';

p:=p||'T CANTIDAD = v_compet_cantidad'||unistr('\000a')||
'          ,PRECIO_UNITARIO = v_compet_precio'||unistr('\000a')||
'          ,OBSERVACION = v_compet_observacion'||unistr('\000a')||
'       WHERE id = apex_application.g_f01(i);'||unistr('\000a')||
'       --'||unistr('\000a')||
'       v_cantidad := v_cantidad + 1;'||unistr('\000a')||
'       --'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    END;'||unistr('\000a')||
'    --'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  -- Desplegar el mensaje de Error si corresponde'||unistr('\000a')||
'  IF v_mensaje IS NULL THEN'||unistr('\000a')||
'     :P319_ERROR_VALIDACION := ''FALSE'';'||unistr('\000a')||
'    ';

p:=p||' apex_application.g_print_success_message := ''Se ha actualizado ''||v_cantidad||'' detalle(s) con éxito.'';'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'     :P319_ERROR_VALIDACION := ''TRUE'';'||unistr('\000a')||
'     IF v_cantidad <> 0 THEN'||unistr('\000a')||
'         v_mensaje := v_mensaje ||''Se ha actualizado ''||v_cantidad||'' detalle(s) con éxito.'';  '||unistr('\000a')||
'     END IF; '||unistr('\000a')||
'     apex_application.g_print_success_message := v_mensaje||'||unistr('\000a')||
'     ''<br>Los detalles con error han sido restaur';

p:=p||'ados con su información original.'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
' --'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 31611516734166246 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 319,
  p_process_sequence=> 50,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Confirmar Edicion 2',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>31605917429166238 + wwv_flow_api.g_id_offset,
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
'  CURSOR cr_compet IS'||unistr('\000a')||
'  SELECT COMPET.ID'||unistr('\000a')||
'       , COMPET.COMPED_ID'||unistr('\000a')||
'       , COMPET.COMCIT_ID'||unistr('\000a')||
'       , COMPET.CODIGO'||unistr('\000a')||
'  FROM COM_PEDIDOS_DETALLES COMPET'||unistr('\000a')||
'  WHERE COMPET.COMPED_ID = :P309_COMPED_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_cantidad  NUMBER:=0;'||unistr('\000a')||
'  v_compet_precio NUMBER;'||unistr('\000a')||
'  v_mensaje   VARCHAR2(2000);'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  -- Recorrer los detalles del Pedido a confirmar  '||unistr('\000a')||
'  FOR v_compet in cr_compet LOOP'||unistr('\000a')||
'     if v_compet.com';

p:=p||'cit_id is not null then'||unistr('\000a')||
'      --'||unistr('\000a')||
'      v_compet_precio := COMCAT_PKG.COMCIT_OBTN_PRECIO(p_comcit_id => v_compet.comcit_id'||unistr('\000a')||
'                                                     ,p_comzon_id => :P309_COMZON_ID);'||unistr('\000a')||
'      if nvl(v_compet_precio,0) <> 0 then'||unistr('\000a')||
'      -- Actualizo Precio '||unistr('\000a')||
'      UPDATE COM_PEDIDOS_DETALLES'||unistr('\000a')||
'        SET PRECIO_UNITARIO = v_compet_precio '||unistr('\000a')||
'        WHERE id = v_compet.id;'||unistr('\000a')||
'        -';

p:=p||'-'||unistr('\000a')||
'        v_cantidad := v_cantidad + 1;'||unistr('\000a')||
'        --'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      --'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    --'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  -- Desplegar el mensaje de Error si corresponde'||unistr('\000a')||
'  IF v_mensaje IS NULL THEN'||unistr('\000a')||
'     :P319_ERROR_VALIDACION := ''FALSE'';'||unistr('\000a')||
'     apex_application.g_print_success_message := ''Se ha actualizado ''||v_cantidad||'' detalle(s) con éxito.'';'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'     :P319_ERROR_VALIDACION := ''TRUE'';'||unistr('\000a')||
'     IF v_cantida';

p:=p||'d <> 0 THEN'||unistr('\000a')||
'         v_mensaje := v_mensaje ||''Se ha actualizado ''||v_cantidad||'' detalle(s) con éxito.'';  '||unistr('\000a')||
'     END IF; '||unistr('\000a')||
'     apex_application.g_print_success_message := v_mensaje||'||unistr('\000a')||
'     ''<br>Los detalles con error han sido restaurados con su información original.'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
' --'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 36422302182721637 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 319,
  p_process_sequence=> 60,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Actualizar Precios',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'ACTUALIZAR',
  p_process_when_type=>'REQUEST_EQUALS_CONDITION',
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
p:=p||'BEGIN'||unistr('\000a')||
'   --'||unistr('\000a')||
'	update com_pedidos comped'||unistr('\000a')||
'	set    comped.precio = (select sum(compet.cantidad*compet.precio_unitario) from com_pedidos_detalles compet where compet.comped_id = :P309_COMPED_ID)'||unistr('\000a')||
'	where  comped.id = :P309_COMPED_ID;'||unistr('\000a')||
'   --'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 365711611411940895 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 319,
  p_process_sequence=> 70,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Confirmar Edicion 2 Com_Pedidos',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>31605917429166238 + wwv_flow_api.g_id_offset,
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
p:=p||'IF :P319_OPERACION IS NULL THEN'||unistr('\000a')||
'   :P319_OPERACION := ''CONSULTA'';'||unistr('\000a')||
'END IF;';

wwv_flow_api.create_page_process(
  p_id     => 31612124680166247 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 319,
  p_process_sequence=> 20,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AsignarOperacion',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P319_ID',
  p_process_when_type=>'ITEM_IS_NOT_NULL',
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
p:=p||':P200_APP_ANTERIOR := :P319_APP_ANTERIOR;'||unistr('\000a')||
':P200_PAG_ANTERIOR := :P319_PAG_ANTERIOR;';

wwv_flow_api.create_page_process(
  p_id     => 31612323331166247 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 319,
  p_process_sequence=> 30,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Asignar Página Anterior',
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
-- ...updatable report columns for page 319
--
 
begin
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 366722413081582834 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 31593017826166233 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 1,
  p_query_column_name=> 'ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 366722516869582845 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 31593017826166233 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 2,
  p_query_column_name=> 'COMPED_ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 366722623364582845 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 31593017826166233 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 3,
  p_query_column_name=> 'RENGLON',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 366722726046582845 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 31593017826166233 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 4,
  p_query_column_name=> 'COMCCL_ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 366722806725582845 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 31593017826166233 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 5,
  p_query_column_name=> 'COMCIT_ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 366722904834582845 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 31593017826166233 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 6,
  p_query_column_name=> 'CODIGO',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 366723026790582845 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 31593017826166233 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 7,
  p_query_column_name=> 'COMCOB_DESCRIPCION',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 366723127480582845 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 31593017826166233 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 8,
  p_query_column_name=> 'CANTIDAD',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 366723217581582845 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 31593017826166233 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 9,
  p_query_column_name=> 'PRECIO_UNITARIO',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 366723302067582845 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 31593017826166233 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 10,
  p_query_column_name=> 'PRECIO_UNITARIO_EDI',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 366723417828582845 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 31593017826166233 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 11,
  p_query_column_name=> 'PRECIO_TOTAL',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 366723510176582845 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 31593017826166233 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 12,
  p_query_column_name=> 'OBSERVACION',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 366723632650582845 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 31593017826166233 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 13,
  p_query_column_name=> 'COMCTP_PRECIO',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
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
