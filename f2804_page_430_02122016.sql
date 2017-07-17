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
--   Date and Time:   11:38 Viernes Diciembre 2, 2016
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

PROMPT ...Remove page 430
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>430);
 
end;
/

 
--application/pages/page_00430
prompt  ...PAGE 430: Detalle de Ordenes de Compras
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 430
 ,p_user_interface_id => 220650599908639021 + wwv_flow_api.g_id_offset
 ,p_name => 'Detalle de Ordenes de Compras'
 ,p_step_title => 'Detalle de Ordenes de Compras'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Detalle de Ordenes de Compras'
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
' $( "#dialog-video" ).html($("#P420_VIDEO_IFRAME").val());'||unistr('\000a')||
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
' $( "#dialog-video2" ).html($("#P420_VIDEO_IFRAME2").val());'||unistr('\000a')||
' $( "#dialog-video2" ).dialog({'||unistr('\000a')||
'   width: 700,'||unistr('\000a')||
'   height: 500,'||unistr('\000a')||
'   modal: true,'||unistr('\000a')||
'  '||
' close: function() {'||unistr('\000a')||
'     $( "#dialog-video2" ).empty();'||unistr('\000a')||
'   }'||unistr('\000a')||
' });'||unistr('\000a')||
'}'||unistr('\000a')||
''
 ,p_inline_css => 
'  #estados tbody tr.fila {         '||unistr('\000a')||
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
 ,p_last_upd_yyyymmddhh24miss => '20161202113340'
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
  p_id=> 72428110133994323 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 430,
  p_plug_name=> 'Buscar',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236656219840903827+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_2',
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
s:=s||'SELECT *'||unistr('\000a')||
'FROM(select COMOCM_V.ID'||unistr('\000a')||
'      ,COMOCM_V.COMPED_EXPEDIENTE COMPED_EXPEDIENTE'||unistr('\000a')||
'      ,DECODE(COMOCM_V.CODIGO,'''','''',''ORDEN:''||COMOCM_V.CODIGO) ORDEN'||unistr('\000a')||
'      ,COMOCM_V.CODIGO COMOCM_CODIGO'||unistr('\000a')||
'      ,COMOCM_V.COMOCE_ESTADO_DESC COMOCM_CODIGO_DESC'||unistr('\000a')||
'      ,COMOCM_V.COMPRV_NOMBRE COMPRV_NOMBRE'||unistr('\000a')||
'      ,COMOCD_V.COMPET_DESCRIPCION||'' Marca/Modelo: ''||COMOCD_V.COMCZD_MARCA||COMOCD_V.COMCZD_MODELO DESCRIPCIO';

s:=s||'N'||unistr('\000a')||
'      ,COMOCD_V.COMADD_CANTIDAD_ADJUDICADA'||unistr('\000a')||
'      ,COMOCD_V.COMCZD_PRECIO_UNITARIO_FINAL PRECIO_UNITARIO'||unistr('\000a')||
'      ,COMOCD_V.COMADD_CANTIDAD_ADJUDICADA*COMOCD_V.COMCZD_PRECIO_UNITARIO_FINAL TOTAL'||unistr('\000a')||
'      ,COMOCM_V.FECHA_GENERACION FECHA_ORDEN      '||unistr('\000a')||
'      ,COMOCM_V.COMPEE_FECHA COMPEE_FECHA'||unistr('\000a')||
'      ,COMOCM_V.COMPRV_ID'||unistr('\000a')||
'from  COM_ORDENES_COMPRAS_V COMOCM_V'||unistr('\000a')||
'     ,COM_ORDENES_COMPRAS_DET_V COMOCD_V'||unistr('\000a')||
''||unistr('\000a')||
'where COM';

s:=s||'OCM_V.COMOCE_ESTADO in (''APR'',''CON'')'||unistr('\000a')||
'and   COMOCD_V.COMOCM_ID = COMOCM_V.ID'||unistr('\000a')||
'and   COMOCM_V.COMECO_ID = :P420_COMECO_ID'||unistr('\000a')||
''||unistr('\000a')||
'union '||unistr('\000a')||
'select COMOCM_V.ID'||unistr('\000a')||
'      ,COMOCM_V.COMPED_EXPEDIENTE'||unistr('\000a')||
'      ,DECODE(COMOCM_V.CODIGO,'''','''',''ORDEN:''||COMOCM_V.CODIGO) ORDEN'||unistr('\000a')||
'      ,COMOCM_V.CODIGO COMOCM_CODIGO'||unistr('\000a')||
'      ,COMOCM_V.COMOCE_ESTADO_DESC COMOCM_CODIGO_DESC'||unistr('\000a')||
'      ,COMOCM_V.COMPRV_NOMBRE COMPRV_NOMBRE'||unistr('\000a')||
'      ,COMOCD_V.';

s:=s||'COMPET_DESCRIPCION||'' Marca/Modelo: ''||COMOCD_V.COMCZD_MARCA||COMOCD_V.COMCZD_MODELO DESCRIPCION'||unistr('\000a')||
'      ,COMOCD_V.COMADD_CANTIDAD_ADJUDICADA'||unistr('\000a')||
'      ,COMOCD_V.COMCZD_PRECIO_UNITARIO_FINAL PRECIO_UNITARIO'||unistr('\000a')||
'      ,COMOCD_V.COMADD_CANTIDAD_ADJUDICADA*COMOCD_V.COMCZD_PRECIO_UNITARIO_FINAL TOTAL'||unistr('\000a')||
'      ,COMOCM_V.FECHA_GENERACION FECHA_ORDEN      '||unistr('\000a')||
'      ,COMOCM_V.COMPEE_FECHA COMPEE_FECHA'||unistr('\000a')||
'      ,COMOCM_V.COM';

s:=s||'PRV_ID'||unistr('\000a')||
'from  COM_ORDENES_COMPRAS_V COMOCM_V'||unistr('\000a')||
'     ,COM_ORDENES_COMPRAS_DET_V COMOCD_V '||unistr('\000a')||
''||unistr('\000a')||
'where COMOCM_V.COMOCE_ESTADO in (''APR'',''CON'')'||unistr('\000a')||
'and   COMOCD_V.COMOCM_ID = COMOCM_V.ID'||unistr('\000a')||
'and   comocm_v.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'                                   FROM com_contratantes_vinc vin'||unistr('\000a')||
'                                  WHERE vin.comeco_id_padre = :P420_COMECO_ID)'||unistr('\000a')||
')'||unistr('\000a')||
'&P430_WHERE.';

wwv_flow_api.create_page_plug (
  p_id=> 72432017197994356 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 430,
  p_plug_name=> 'Ordenes de Compras',
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
a1:=a1||'SELECT *'||unistr('\000a')||
'FROM(select COMOCM_V.ID'||unistr('\000a')||
'      ,COMOCM_V.COMPED_EXPEDIENTE COMPED_EXPEDIENTE'||unistr('\000a')||
'      ,DECODE(COMOCM_V.CODIGO,'''','''',''ORDEN:''||COMOCM_V.CODIGO) ORDEN'||unistr('\000a')||
'      ,COMOCM_V.CODIGO COMOCM_CODIGO'||unistr('\000a')||
'      ,COMOCM_V.COMOCE_ESTADO_DESC COMOCM_CODIGO_DESC'||unistr('\000a')||
'      ,COMOCM_V.COMPRV_NOMBRE COMPRV_NOMBRE'||unistr('\000a')||
'      ,COMOCD_V.COMPET_DESCRIPCION||'' Marca/Modelo: ''||COMOCD_V.COMCZD_MARCA||COMOCD_V.COMCZD_MODELO DESCRIPCIO';

a1:=a1||'N'||unistr('\000a')||
'      ,COMOCD_V.COMADD_CANTIDAD_ADJUDICADA'||unistr('\000a')||
'      ,COMOCD_V.COMCZD_PRECIO_UNITARIO_FINAL PRECIO_UNITARIO'||unistr('\000a')||
'      ,COMOCD_V.COMADD_CANTIDAD_ADJUDICADA*COMOCD_V.COMCZD_PRECIO_UNITARIO_FINAL TOTAL'||unistr('\000a')||
'      ,COMOCM_V.FECHA_GENERACION FECHA_ORDEN      '||unistr('\000a')||
'      ,COMOCM_V.COMPEE_FECHA COMPEE_FECHA'||unistr('\000a')||
'      ,COMOCM_V.COMPRV_ID'||unistr('\000a')||
'from  COM_ORDENES_COMPRAS_V COMOCM_V'||unistr('\000a')||
'     ,COM_ORDENES_COMPRAS_DET_V COMOCD_V'||unistr('\000a')||
''||unistr('\000a')||
'where COM';

a1:=a1||'OCM_V.COMOCE_ESTADO in (''APR'',''CON'')'||unistr('\000a')||
'and   COMOCD_V.COMOCM_ID = COMOCM_V.ID'||unistr('\000a')||
'and   COMOCM_V.COMECO_ID = :P420_COMECO_ID'||unistr('\000a')||
''||unistr('\000a')||
'union '||unistr('\000a')||
'select COMOCM_V.ID'||unistr('\000a')||
'      ,COMOCM_V.COMPED_EXPEDIENTE'||unistr('\000a')||
'      ,DECODE(COMOCM_V.CODIGO,'''','''',''ORDEN:''||COMOCM_V.CODIGO) ORDEN'||unistr('\000a')||
'      ,COMOCM_V.CODIGO COMOCM_CODIGO'||unistr('\000a')||
'      ,COMOCM_V.COMOCE_ESTADO_DESC COMOCM_CODIGO_DESC'||unistr('\000a')||
'      ,COMOCM_V.COMPRV_NOMBRE COMPRV_NOMBRE'||unistr('\000a')||
'      ,COMOCD_V.';

a1:=a1||'COMPET_DESCRIPCION||'' Marca/Modelo: ''||COMOCD_V.COMCZD_MARCA||COMOCD_V.COMCZD_MODELO DESCRIPCION'||unistr('\000a')||
'      ,COMOCD_V.COMADD_CANTIDAD_ADJUDICADA'||unistr('\000a')||
'      ,COMOCD_V.COMCZD_PRECIO_UNITARIO_FINAL PRECIO_UNITARIO'||unistr('\000a')||
'      ,COMOCD_V.COMADD_CANTIDAD_ADJUDICADA*COMOCD_V.COMCZD_PRECIO_UNITARIO_FINAL TOTAL'||unistr('\000a')||
'      ,COMOCM_V.FECHA_GENERACION FECHA_ORDEN      '||unistr('\000a')||
'      ,COMOCM_V.COMPEE_FECHA COMPEE_FECHA'||unistr('\000a')||
'      ,COMOCM_V.COM';

a1:=a1||'PRV_ID'||unistr('\000a')||
'from  COM_ORDENES_COMPRAS_V COMOCM_V'||unistr('\000a')||
'     ,COM_ORDENES_COMPRAS_DET_V COMOCD_V '||unistr('\000a')||
''||unistr('\000a')||
'where COMOCM_V.COMOCE_ESTADO in (''APR'',''CON'')'||unistr('\000a')||
'and   COMOCD_V.COMOCM_ID = COMOCM_V.ID'||unistr('\000a')||
'and   comocm_v.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'                                   FROM com_contratantes_vinc vin'||unistr('\000a')||
'                                  WHERE vin.comeco_id_padre = :P420_COMECO_ID)'||unistr('\000a')||
')'||unistr('\000a')||
'&P430_WHERE.';

wwv_flow_api.create_worksheet(
  p_id=> 72432223050994362+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 430,
  p_region_id=> 72432017197994356+wwv_flow_api.g_id_offset,
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
  p_internal_uid=> 72432223050994362);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 72434331647994404+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 430,
  p_worksheet_id => 72432223050994362+wwv_flow_api.g_id_offset,
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
  p_id => 72435111562994404+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 430,
  p_worksheet_id => 72432223050994362+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMOCM_CODIGO',
  p_display_order          =>24,
  p_column_identifier      =>'X',
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
  p_id => 72432523053994398+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 430,
  p_worksheet_id => 72432223050994362+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMOCM_CODIGO_DESC',
  p_display_order          =>29,
  p_column_identifier      =>'AC',
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
  p_id => 72624811860335270+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 430,
  p_worksheet_id => 72432223050994362+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ID',
  p_display_order          =>30,
  p_column_identifier      =>'AD',
  p_column_label           =>'Id',
  p_report_label           =>'Id',
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
  p_id => 72624926183335276+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 430,
  p_worksheet_id => 72432223050994362+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ORDEN',
  p_display_order          =>31,
  p_column_identifier      =>'AE',
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
  p_id => 72625009324335276+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 430,
  p_worksheet_id => 72432223050994362+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPRV_NOMBRE',
  p_display_order          =>32,
  p_column_identifier      =>'AF',
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
  p_id => 72625111276335276+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 430,
  p_worksheet_id => 72432223050994362+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'DESCRIPCION',
  p_display_order          =>33,
  p_column_identifier      =>'AG',
  p_column_label           =>'Descripcion',
  p_report_label           =>'Descripcion',
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
  p_id => 72625224363335276+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 430,
  p_worksheet_id => 72432223050994362+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMADD_CANTIDAD_ADJUDICADA',
  p_display_order          =>34,
  p_column_identifier      =>'AH',
  p_column_label           =>'Cantidad',
  p_report_label           =>'Cantidad',
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
  p_id => 72625306369335276+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 430,
  p_worksheet_id => 72432223050994362+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'PRECIO_UNITARIO',
  p_display_order          =>35,
  p_column_identifier      =>'AI',
  p_column_label           =>'Precio Unitario',
  p_report_label           =>'Precio Unitario',
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
  p_id => 72625429976335276+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 430,
  p_worksheet_id => 72432223050994362+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'TOTAL',
  p_display_order          =>36,
  p_column_identifier      =>'AJ',
  p_column_label           =>'Precio Total',
  p_report_label           =>'Precio Total',
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
  p_id => 72625518623335276+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 430,
  p_worksheet_id => 72432223050994362+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'FECHA_ORDEN',
  p_display_order          =>37,
  p_column_identifier      =>'AK',
  p_column_label           =>'Fecha Orden',
  p_report_label           =>'Fecha Orden',
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
  p_format_mask            =>'DD/MM/YYYY',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 72625628079335276+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 430,
  p_worksheet_id => 72432223050994362+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPEE_FECHA',
  p_display_order          =>38,
  p_column_identifier      =>'AL',
  p_column_label           =>'Fecha Estado',
  p_report_label           =>'Fecha Estado',
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
  p_id => 365449625981118975+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 430,
  p_worksheet_id => 72432223050994362+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPRV_ID',
  p_display_order          =>39,
  p_column_identifier      =>'AM',
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
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'COMPED_EXPEDIENTE:FECHA_ORDEN:ORDEN:COMPRV_NOMBRE:DESCRIPCION:COMADD_CANTIDAD_ADJUDICADA:PRECIO_UNITARIO:TOTAL:COMOCM_CODIGO_DESC:COMPRV_ID';

wwv_flow_api.create_worksheet_rpt(
  p_id => 72435404956994406+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 430,
  p_worksheet_id => 72432223050994362+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_type             =>'REPORT',
  p_report_alias            =>'724355',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_sort_column_1           =>'0',
  p_sort_direction_1        =>'ASC',
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
  p_chart_label_title       =>'Año/Mes',
  p_chart_value_column      =>'COMPED_EJERCICIO',
  p_chart_aggregate         =>'COUNT',
  p_chart_value_title       =>'Ordenes de Compras',
  p_chart_sorting           =>'LABEL_ASC',
  p_calendar_display_column =>'');
end;
/
begin
wwv_flow_api.create_worksheet_computation(
  p_id => 72648229276580925+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 430,
  p_worksheet_id => 72432223050994362+wwv_flow_api.g_id_offset,
  p_report_id => 72435404956994406+wwv_flow_api.g_id_offset,
  p_db_column_name    =>'APXWS_CC_001',
  p_column_identifier =>'C01',
  p_computation_expr  =>'to_char(AL,''YYYY-MM'')',
  p_format_mask       =>'',
  p_column_type       =>'STRING',
  p_column_label      =>'Año-Mes',
  p_report_label      =>'Año-Mes');
end;
/
begin
wwv_flow_api.create_worksheet_group_by(
  p_id => 72648312356580929+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 430,
  p_worksheet_id => 72432223050994362+wwv_flow_api.g_id_offset,
  p_report_id => 72435404956994406+wwv_flow_api.g_id_offset,
  p_group_by_columns =>'COMOCE_ESTADO_DESC',
  p_function_01 =>'COUNT',
  p_function_column_01 =>'COMPED_EXPEDIENTE',
  p_function_db_column_name_01 =>'APXWS_GBFC_01',
  p_function_label_01 =>'Ordenes de Compras',
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
  p_id=> 72436219953994412 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 430,
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
  p_id=> 72436626494994418 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 430,
  p_plug_name=> 'Breadcrumb',
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
  p_id=> 72436818038994421 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 430,
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
  p_plug_source_type=> 70469730105710367 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 236663920507903831+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_header=> 'Detalle de los Bienes y/o Servicios de las Ordenes seleccionadas.<br>Use los filtros para extraer la información deseada.'||unistr('\000a')||
'<br><br>'||unistr('\000a')||
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
s:=s||'htp.print('''');';

wwv_flow_api.create_page_plug (
  p_id=> 72437407111994557 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 430,
  p_plug_name=> 'Video tutorial',
  p_region_name=>'dialog-video',
  p_region_attributes=> 'title="Video tutorial - Entrega de bienes y servicios"',
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
  p_id             => 72436417060994412 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 430,
  p_button_sequence=> 100,
  p_button_plug_id => 72436219953994412+wwv_flow_api.g_id_offset,
  p_button_name    => 'P430_RETORNAR',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(236667336255903833+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Retornar',
  p_button_position=> 'TEMPLATE_DEFAULT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&P430_APP_ANTERIOR.:&P430_APP_ANTERIOR_PAG.:&SESSION.',
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
h:=h||'Listado de Proveedores.';

wwv_flow_api.create_page_item(
  p_id=>72428317283994323 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 430,
  p_name=>'P430_COMPRV_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 72428110133994323+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Proveedor:',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select NOMBRE||'' - CUIT: ''||CUIT d, id r'||unistr('\000a')||
'from   com_proveedores_v'||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'- TODOS -',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_tag_attributes  => 'style=" width:400px"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_display_when=>'P430_FILTRO_PREDEFINIDO_SEL',
  p_display_when_type=>'ITEM_IS_NULL',
  p_field_template=> 236666243463903832+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'REDIRECT_SET_VALUE',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Número de Orden de compra.';

wwv_flow_api.create_page_item(
  p_id=>72428808324994350 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 430,
  p_name=>'P430_COMOCM_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 21,
  p_item_plug_id => 72428110133994323+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Orden:',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 20,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 4,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_display_when=>'P430_FILTRO_PREDEFINIDO_SEL',
  p_display_when_type=>'ITEM_IS_NULL',
  p_field_template=> 236666243463903832+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
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
  p_id=>72429300019994351 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 430,
  p_name=>'P430_FECHA_INICIAL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 23,
  p_item_plug_id => 72428110133994323+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha inicial:',
  p_format_mask=>'DD/MM/YYYY',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DATE_PICKER',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 20,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 4,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 236666243463903832+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
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
h:=h||'Número de Expediente.';

wwv_flow_api.create_page_item(
  p_id=>72430002254994353 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 430,
  p_name=>'P430_COMPED_EXPEDIENTE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 72428110133994323+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Expediente:',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 20,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 4,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_display_when=>'P430_FILTRO_PREDEFINIDO_SEL',
  p_display_when_type=>'ITEM_IS_NULL',
  p_field_template=> 236666243463903832+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
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
  p_id=>72430703639994353 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 430,
  p_name=>'P430_WHERE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_item_plug_id => 72428110133994323+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 5,
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
  p_id=>72430930738994354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 430,
  p_name=>'P430_COMECO_SELECCIONAR_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 2,
  p_item_plug_id => 72428110133994323+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'NO',
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
  p_id=>72431108960994354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 430,
  p_name=>'P430_BUSCAR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 72428110133994323+wwv_flow_api.g_id_offset,
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
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> null,
  p_grid_column=> 7,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P430_FILTRO_PREDEFINIDO_SEL',
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
  p_id=>72437002155994421 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 430,
  p_name=>'P430_VIDEO_IFRAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 72436818038994421+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '<iframe width="670" height="430" src="//www.youtube.com/embed/xxevJ0onE9Q" frameborder="0" allowfullscreen id="clearmySound"></iframe>',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'<iframe width="670" height="430" src="//www.youtube.com/embed/xxevJ0onE9Q" frameborder="0" allowfullscreen id="clearmySound"></iframe>',
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
  p_id=>72437806276994621 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 430,
  p_name=>'P430_APP_ANTERIOR',
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
  p_id=>72438027555994621 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 430,
  p_name=>'P430_APP_ANTERIOR_PAG',
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
  p_id=>72643221649287903 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 430,
  p_name=>'P430_FECHA_FINAL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 25,
  p_item_plug_id => 72428110133994323+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha Final',
  p_format_mask=>'DD/MM/YYYY',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DATE_PICKER',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 20,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 4,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 236666243463903832+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
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
  p_id=>72644200175449753 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 430,
  p_name=>'P430_RESTABLECER',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 72428110133994323+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Restablecer',
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
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> null,
  p_grid_column=> 8,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P430_FILTRO_PREDEFINIDO_SEL',
  p_display_when_type=>'ITEM_IS_NULL',
  p_is_persistent=> 'N',
  p_button_execute_validations=>'Y',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'P430_COMPED_EXPEDIENTE,P430_COMOCM_CODIGO,P430_FECHA_INICIAL,P430_FECHA_FINAL,P430_COMPRV_ID';

wwv_flow_api.create_page_process(
  p_id     => 72644701563497143 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 430,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_ITEMS',
  p_process_name=> 'Restablecer filtros',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>72644200175449753 + wwv_flow_api.g_id_offset,
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
p:=p||'P430_COMPED_EXPEDIENTE,'||unistr('\000a')||
'P430_COMOCM_CODIGO,'||unistr('\000a')||
'P430_COMOCM_ESTADO,'||unistr('\000a')||
'P430_COMPRV_ID';

wwv_flow_api.create_page_process(
  p_id     => 72438202816994621 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 430,
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
p:=p||'IF :P430_APP_ANTERIOR IS NULL THEN'||unistr('\000a')||
'   :P430_APP_ANTERIOR := :G_APP_ANTERIOR;'||unistr('\000a')||
'   :P430_APP_ANTERIOR_PAG := :G_APP_ANTERIOR_PAG;'||unistr('\000a')||
'END IF;';

wwv_flow_api.create_page_process(
  p_id     => 72438620689994723 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 430,
  p_process_sequence=> 20,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AsignarAppAnterior',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P430_APP_ANTERIOR',
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
p:=p||'if :P430_FECHA_INICIAL is null'||unistr('\000a')||
' and :P430_FECHA_FINAL is null '||unistr('\000a')||
' and :P430_COMPED_EXPEDIENTE is null'||unistr('\000a')||
' and :P430_COMOCM_CODIGO is null'||unistr('\000a')||
' and :P430_COMPRV_ID is null then'||unistr('\000a')||
'  --'||unistr('\000a')||
'  :P430_WHERE := ''WHERE 1 = 2 '';'||unistr('\000a')||
'else'||unistr('\000a')||
'  :P430_WHERE := ''WHERE 1 = 1 '';'||unistr('\000a')||
'end if;  '||unistr('\000a')||
'--'||unistr('\000a')||
'if :P430_COMPED_EXPEDIENTE is not null then'||unistr('\000a')||
'  :P430_WHERE := :P430_WHERE||'' AND instr(upper(COMPED_EXPEDIENTE),upper(nvl(''''''||:P430_COMPED_EXPED';

p:=p||'IENTE||'''''',COMPED_EXPEDIENTE))) > 0'';'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'if :P430_COMOCM_CODIGO is not null then'||unistr('\000a')||
'  :P430_WHERE := :P430_WHERE||'' and upper(COMOCM_CODIGO) = upper(nvl(''''''||:P430_COMOCM_CODIGO||'''''',COMOCM_CODIGO))'';'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'if nvl(:P430_COMPRV_ID,''0'') <> ''0'' then'||unistr('\000a')||
'  :P430_WHERE := :P430_WHERE||'' AND COMPRV_ID = ''||:P430_COMPRV_ID;  '||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'  if :P430_FECHA_INICIAL is not null and :P430_FECHA_FINAL is ';

p:=p||'not null then'||unistr('\000a')||
'-- :P430_WHERE := :P430_WHERE ||'' and FECHA_ORDEN between ''''''||to_char(to_date(:P430_FECHA_INICIAL, ''DD/MM/YYYY''))||'''''' and ''''''||to_char(to_date(:P430_FECHA_FINAL, ''DD/MM/YYYY''))||'''''''';'||unistr('\000a')||
'   :P430_WHERE := :P430_WHERE ||'' and FECHA_ORDEN between to_date('''''' || :P430_FECHA_INICIAL  || '''''',''''dd/mm/yyyy'''') and to_date('''''' || :P430_FECHA_FINAL || '''''',''''dd/mm/yyyy'''')'';'||unistr('\000a')||
''||unistr('\000a')||
'  end if;';

wwv_flow_api.create_page_process(
  p_id     => 72438801712994723 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 430,
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
-- ...updatable report columns for page 430
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
