set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end;
/
 
 
--application/set_environment
prompt  APPLICATION 2800 - Compras - Publico
--
-- Application Export:
--   Application:     2800
--   Name:            Compras - Publico
--   Date and Time:   15:44 Miércoles Noviembre 30, 2016
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
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,2800);
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
 
end;
/

PROMPT ...Remove page 340
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>340);
 
end;
/

 
--application/pages/page_00340
prompt  ...PAGE 340: Proveedores - Consulta Pública
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 340
 ,p_user_interface_id => 277279709541279853 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'T_PRINCIPAL'
 ,p_name => 'Proveedores - Consulta Pública'
 ,p_step_title => 'Proveedores - Consulta Pública'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Proveedores - Consulta Pública'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_inline_css => 
'@media only screen '||unistr('\000a')||
'and (min-width : 0px)'||unistr('\000a')||
'and (max-width : 768px) {'||unistr('\000a')||
'/* Styles */'||unistr('\000a')||
' #desktop{display:none !important;}'||unistr('\000a')||
'}'||unistr('\000a')||
'@media only screen '||unistr('\000a')||
'and (min-width : 769px) {'||unistr('\000a')||
'/* Styles */'||unistr('\000a')||
' #smartphone{display:none !important;}'||unistr('\000a')||
'}'
 ,p_step_template => 293256741960544644 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'CTISSERA'
 ,p_last_upd_yyyymmddhh24miss => '20161130153657'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'Los Proveedores son aquellas personas o empresas cuya solicitud de inscripción ha sido aprobada por el Registro de Proveedores.<br>'||unistr('\000a')||
'Esta página le permitirá consultar quienes son los proveedores registrados actualmente.';

wwv_flow_api.create_page_plug (
  p_id=> 59742824082862567 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 340,
  p_plug_name=> 'Los Proveedores',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 293285329473544659+ wwv_flow_api.g_id_offset,
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 59743001501862578 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 340,
  p_plug_name=> 'Filtros Pre-Definidos',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 293285653644544659+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 40,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 59748030849909443 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 293293945199544663+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => 'NEVER',
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
  p_id=> 59743232310862578 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 340,
  p_plug_name=> 'Proveedores',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> 1,
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 59743431883862581 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 340,
  p_plug_name=> 'Filtros',
  p_region_name=>'',
  p_parent_plug_id=>59743232310862578 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 293285329473544659+ wwv_flow_api.g_id_offset,
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
s:=s||'select comprv.id comprv_id'||unistr('\000a')||
'     , comprv.cuit comprv_cuit'||unistr('\000a')||
'     , comprv.nombre comprv_nombre'||unistr('\000a')||
'     , comprv.date_created comprv_fecha_registro'||unistr('\000a')||
'     , compre.estado compre_estado'||unistr('\000a')||
'     , gral_pkg.obtn_cfgabr(''COM_PROVEEDORES_EST.ESTADO'',compre.estado) compre_estado_abr'||unistr('\000a')||
'     , comprv.comprt_id comprt_id'||unistr('\000a')||
'     , comprt.nombre comprt_nombre'||unistr('\000a')||
'     , comprv.compct_id compct_id'||unistr('\000a')||
'     , compct.nombre compct_no';

s:=s||'mbre'||unistr('\000a')||
'     , replace(COMPRV_PKG.COMPRV_OBTN_COMRUB(p_comprv_id => comprv.id),chr(10),'' <br>'') comprv_rubros'||unistr('\000a')||
'     , decode(compre.estado, ''SUS'', '''',''BAJ'','''', decode(COMPRV_PKG.COMPRV_HABILITADO_COTIZAR_SN(p_comprv_id => comprv.ID'||unistr('\000a')||
'                                        ,p_comctt_id => NULL'||unistr('\000a')||
'                                        ,p_comrub_id => NULL),''SI'', ''AL DIA'',''<font color=red>DEBE</font>'')) co';

s:=s||'mprv_documentacion_al_dia'||unistr('\000a')||
'     ,replace(COMPRV_PKG.COMPRV_COMPRG_OBT_SIT(p_comprv_id => comprv.id),chr(10),''<br>'') situacion_registro'||unistr('\000a')||
'     ,replace(decode(compre.estado,''BAJ'',COMPRV_PKG.COMPRV_OBTN_BAJ(p_comprv_id => comprv.id),'''')||COMPRV_PKG.COMPRV_OBTN_SUS(p_comprv_id => comprv.id),chr(10),''<br>'') COMPRV_OBSERVACION'||unistr('\000a')||
'from com_proveedores comprv'||unistr('\000a')||
'   , com_proveedores_est compre'||unistr('\000a')||
'   , com_proveedore';

s:=s||'s_tipos comprt'||unistr('\000a')||
'   , com_proveedores_cat compct'||unistr('\000a')||
'where compre.id = COM_PKG.OBTN_COMPRE_ID(comprv.id)'||unistr('\000a')||
'  and comprv.comprt_id = comprt.id'||unistr('\000a')||
'  and comprv.compct_id = compct.id (+)'||unistr('\000a')||
'  and comprv.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'&P340_WHERE.';

wwv_flow_api.create_page_plug (
  p_id=> 59744200375862589 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 340,
  p_plug_name=> 'Proveedores',
  p_region_name=>'',
  p_parent_plug_id=>59743232310862578 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'N',
  p_plug_template=> 293284331095544658+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
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
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'select comprv.id comprv_id'||unistr('\000a')||
'     , comprv.cuit comprv_cuit'||unistr('\000a')||
'     , comprv.nombre comprv_nombre'||unistr('\000a')||
'     , comprv.date_created comprv_fecha_registro'||unistr('\000a')||
'     , compre.estado compre_estado'||unistr('\000a')||
'     , gral_pkg.obtn_cfgabr(''COM_PROVEEDORES_EST.ESTADO'',compre.estado) compre_estado_abr'||unistr('\000a')||
'     , comprv.comprt_id comprt_id'||unistr('\000a')||
'     , comprt.nombre comprt_nombre'||unistr('\000a')||
'     , comprv.compct_id compct_id'||unistr('\000a')||
'     , compct.nombre compct_no';

a1:=a1||'mbre'||unistr('\000a')||
'     , replace(COMPRV_PKG.COMPRV_OBTN_COMRUB(p_comprv_id => comprv.id),chr(10),'' <br>'') comprv_rubros'||unistr('\000a')||
'     , decode(compre.estado, ''SUS'', '''',''BAJ'','''', decode(COMPRV_PKG.COMPRV_HABILITADO_COTIZAR_SN(p_comprv_id => comprv.ID'||unistr('\000a')||
'                                        ,p_comctt_id => NULL'||unistr('\000a')||
'                                        ,p_comrub_id => NULL),''SI'', ''AL DIA'',''<font color=red>DEBE</font>'')) co';

a1:=a1||'mprv_documentacion_al_dia'||unistr('\000a')||
'     ,replace(COMPRV_PKG.COMPRV_COMPRG_OBT_SIT(p_comprv_id => comprv.id),chr(10),''<br>'') situacion_registro'||unistr('\000a')||
'     ,replace(decode(compre.estado,''BAJ'',COMPRV_PKG.COMPRV_OBTN_BAJ(p_comprv_id => comprv.id),'''')||COMPRV_PKG.COMPRV_OBTN_SUS(p_comprv_id => comprv.id),chr(10),''<br>'') COMPRV_OBSERVACION'||unistr('\000a')||
'from com_proveedores comprv'||unistr('\000a')||
'   , com_proveedores_est compre'||unistr('\000a')||
'   , com_proveedore';

a1:=a1||'s_tipos comprt'||unistr('\000a')||
'   , com_proveedores_cat compct'||unistr('\000a')||
'where compre.id = COM_PKG.OBTN_COMPRE_ID(comprv.id)'||unistr('\000a')||
'  and comprv.comprt_id = comprt.id'||unistr('\000a')||
'  and comprv.compct_id = compct.id (+)'||unistr('\000a')||
'  and comprv.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'&P340_WHERE.';

wwv_flow_api.create_worksheet(
  p_id=> 59744421365862590+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 340,
  p_region_id=> 59744200375862589+wwv_flow_api.g_id_offset,
  p_name=> 'Procesos de Compras Publicados',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '1000000',
  p_max_row_count_message=> 'El recuento máximo de filas de este informe es #MAX_ROW_COUNT# filas. Aplique un filtro para reducir el número de registros de la consulta.',
  p_no_data_found_message=> 'No se ha encontrado ningún dato.',
  p_max_rows_per_page=>'',
  p_search_button_label=>'Buscar',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'',
  p_sql_query => a1,
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'N',
  p_allow_save_rpt_public=>'N',
  p_allow_report_categories=>'N',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y_OF_Z',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'Y',
  p_show_search_bar=>'Y',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'N',
  p_show_select_columns=>'Y',
  p_show_rows_per_page=>'Y',
  p_show_filter=>'N',
  p_show_sort=>'N',
  p_show_control_break=>'N',
  p_show_highlight=>'N',
  p_show_computation=>'N',
  p_show_aggregate=>'N',
  p_show_chart=>'N',
  p_show_group_by=>'N',
  p_show_notify=>'N',
  p_show_calendar=>'N',
  p_show_flashback=>'N',
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
  p_internal_uid=> 59744421365862590);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 59749620874961779+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 340,
  p_worksheet_id => 59744421365862590+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPRV_ID',
  p_display_order          =>1,
  p_column_identifier      =>'A',
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
  p_id => 59749718432961781+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 340,
  p_worksheet_id => 59744421365862590+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPRV_CUIT',
  p_display_order          =>2,
  p_column_identifier      =>'B',
  p_column_label           =>'CUIT',
  p_report_label           =>'CUIT',
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
  p_heading_alignment      =>'LEFT',
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
  p_id => 59749809091961781+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 340,
  p_worksheet_id => 59744421365862590+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPRV_NOMBRE',
  p_display_order          =>3,
  p_column_identifier      =>'C',
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
  p_heading_alignment      =>'LEFT',
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
  p_id => 59749920222961781+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 340,
  p_worksheet_id => 59744421365862590+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPRV_FECHA_REGISTRO',
  p_display_order          =>4,
  p_column_identifier      =>'D',
  p_column_label           =>'Registrado',
  p_report_label           =>'Registrado',
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
  p_heading_alignment      =>'LEFT',
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
  p_id => 59750020749961781+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 340,
  p_worksheet_id => 59744421365862590+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPRE_ESTADO',
  p_display_order          =>5,
  p_column_identifier      =>'E',
  p_column_label           =>'Compre Estado',
  p_report_label           =>'Compre Estado',
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
  p_heading_alignment      =>'LEFT',
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
  p_id => 59750106331961781+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 340,
  p_worksheet_id => 59744421365862590+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPRE_ESTADO_ABR',
  p_display_order          =>6,
  p_column_identifier      =>'F',
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
  p_heading_alignment      =>'LEFT',
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
  p_id => 59750217106961781+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 340,
  p_worksheet_id => 59744421365862590+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPRT_ID',
  p_display_order          =>7,
  p_column_identifier      =>'G',
  p_column_label           =>'Comprt Id',
  p_report_label           =>'Comprt Id',
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
  p_heading_alignment      =>'LEFT',
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
  p_id => 59750315683961782+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 340,
  p_worksheet_id => 59744421365862590+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPRT_NOMBRE',
  p_display_order          =>8,
  p_column_identifier      =>'H',
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
  p_heading_alignment      =>'LEFT',
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
  p_id => 59750417566961782+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 340,
  p_worksheet_id => 59744421365862590+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPCT_ID',
  p_display_order          =>9,
  p_column_identifier      =>'I',
  p_column_label           =>'Compct Id',
  p_report_label           =>'Compct Id',
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
  p_heading_alignment      =>'RIGHT',
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
  p_id => 59750500426961782+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 340,
  p_worksheet_id => 59744421365862590+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPCT_NOMBRE',
  p_display_order          =>10,
  p_column_identifier      =>'J',
  p_column_label           =>'Categoría',
  p_report_label           =>'Categoría',
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
  p_heading_alignment      =>'LEFT',
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
  p_id => 59760532488260271+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 340,
  p_worksheet_id => 59744421365862590+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPRV_RUBROS',
  p_display_order          =>11,
  p_column_identifier      =>'K',
  p_column_label           =>'Rubros',
  p_report_label           =>'Rubros',
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
  p_display_text_as        =>'WITHOUT_MODIFICATION',
  p_heading_alignment      =>'LEFT',
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
  p_id => 59761029672276787+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 340,
  p_worksheet_id => 59744421365862590+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPRV_DOCUMENTACION_AL_DIA',
  p_display_order          =>12,
  p_column_identifier      =>'L',
  p_column_label           =>'Documentacion',
  p_report_label           =>'Documentacion',
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
  p_id => 59774111716619337+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 340,
  p_worksheet_id => 59744421365862590+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPRV_OBSERVACION',
  p_display_order          =>13,
  p_column_identifier      =>'M',
  p_column_label           =>'Historial',
  p_report_label           =>'Historial',
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
  p_display_text_as        =>'WITHOUT_MODIFICATION',
  p_heading_alignment      =>'LEFT',
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
  p_id => 77946802671641295+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 340,
  p_worksheet_id => 59744421365862590+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SITUACION_REGISTRO',
  p_display_order          =>14,
  p_column_identifier      =>'N',
  p_column_label           =>'Situación ante Registros',
  p_report_label           =>'Situación ante Registros',
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
  p_display_text_as        =>'WITHOUT_MODIFICATION',
  p_heading_alignment      =>'LEFT',
  p_column_alignment       =>'LEFT',
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
rc1:=rc1||'COMPRV_CUIT:COMPRV_NOMBRE:COMPRV_RUBROS:COMPRV_DOCUMENTACION_AL_DIA:COMPRE_ESTADO_ABR:COMPRV_OBSERVACION:SITUACION_REGISTRO:';

wwv_flow_api.create_worksheet_rpt(
  p_id => 59746328129862610+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 340,
  p_worksheet_id => 59744421365862590+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'597464',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>10,
  p_report_columns          =>rc1,
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
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
  p_id=>59743630101862581 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 340,
  p_name=>'P340_WHERE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_item_plug_id => 59743431883862581+wwv_flow_api.g_id_offset,
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
  p_id=>59743828757862587 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 340,
  p_name=>'P340_FILTRO_PREDEFINIDO_SEL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 59743431883862581+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Filtro Predefinido :',
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
  p_display_when=>'P340_FILTRO_PREDEFINIDO_SEL',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_field_template=> 293295353096544664+wwv_flow_api.g_id_offset,
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
  p_id=>59744015138862587 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 340,
  p_name=>'P340_COMPRT_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 59743431883862581+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tipo de Proveedor',
  p_source_type=> 'STATIC',
  p_display_as=> 'PLUGIN_BE.CTB.SELECT2',
  p_lov=> 'select comprt.nombre d, comprt.id r'||unistr('\000a')||
'from com_proveedores_tipos comprt'||unistr('\000a')||
'where comprt.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
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
  p_colspan=> 3,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 293295443705544664+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'SINGLE',
  p_attribute_08 => 'CIC',
  p_attribute_10 => '100%',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>59758514410223018 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 340,
  p_name=>'P340_COMPCT_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 15,
  p_item_plug_id => 59743431883862581+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Categoría Proveedor',
  p_source_type=> 'STATIC',
  p_display_as=> 'PLUGIN_BE.CTB.SELECT2',
  p_lov=> 'select compct.nombre d, compct.id r'||unistr('\000a')||
'from com_proveedores_cat compct'||unistr('\000a')||
'   , com_proveedores_tipos comprt'||unistr('\000a')||
'where compct.comprt_id = comprt.id '||unistr('\000a')||
'  and comprt.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'order by 1',
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
  p_colspan=> 3,
  p_rowspan=> null,
  p_grid_column=> 4,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 293295443705544664+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'SINGLE',
  p_attribute_08 => 'CIC',
  p_attribute_10 => '100%',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>59761816289298201 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 340,
  p_name=>'P340_COMPRE_ESTADO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 59743431883862581+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Estado Proveedor',
  p_source_type=> 'STATIC',
  p_display_as=> 'PLUGIN_BE.CTB.SELECT2',
  p_lov=> 'select rv_abbreviation d, rv_low_value r'||unistr('\000a')||
'from cg_ref_codes'||unistr('\000a')||
'where rv_domain = ''COM_PROVEEDORES_EST.ESTADO'''||unistr('\000a')||
'order by 1',
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
  p_colspan=> 2,
  p_rowspan=> null,
  p_grid_column=> 7,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 293295443705544664+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'SINGLE',
  p_attribute_08 => 'CIC',
  p_attribute_10 => '100%',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>59763414323329481 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 340,
  p_name=>'P340_COMRUB_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 59743431883862581+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Rubro del Proveedor',
  p_source_type=> 'STATIC',
  p_display_as=> 'PLUGIN_BE.CTB.SELECT2',
  p_lov=> 'select comrub.nombre d, comrub.nombre r'||unistr('\000a')||
'from com_rubros comrub'||unistr('\000a')||
'where comrub.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'  and comrub.situacion = ''VIG'''||unistr('\000a')||
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
  p_colspan=> 6,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 293295443705544664+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'SINGLE',
  p_attribute_08 => 'CIC',
  p_attribute_10 => '100%',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>59765616443374068 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 340,
  p_name=>'P340_COMPRV_DOCUMENTACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 35,
  p_item_plug_id => 59743431883862581+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Docum. Proveedor',
  p_source_type=> 'STATIC',
  p_display_as=> 'PLUGIN_BE.CTB.SELECT2',
  p_lov=> 'STATIC2:AL DIA;AL DIA,DEBE;DEBE',
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
  p_colspan=> 2,
  p_rowspan=> null,
  p_grid_column=> 7,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 293295443705544664+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'SINGLE',
  p_attribute_08 => 'CIC',
  p_attribute_10 => '100%',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>59769604689488542 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 340,
  p_name=>'P340_RESTABLECER',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 59743431883862581+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Restablecer',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_css_classes=> 'fa-refresh',
  p_tag_attributes  => 'template:'||to_char(59780315311983625 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> 10,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
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
  p_id=>59779000242943762 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 340,
  p_name=>'P340_RETORNAR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 45,
  p_item_plug_id => 59743431883862581+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Retornar',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(293296445888544665 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'N',
  p_button_execute_validations=>'Y',
  p_button_action => 'REDIRECT_URL',
  p_button_redirect_url => 'f?p=&G_APP_ANTERIOR.:1:&SESSION.:::340:P1_SEGORG_CODIGO:&G_SEGORG_CODIGO.',
  p_button_is_hot=>'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>67853203181572739 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 340,
  p_name=>'P340_SANCIONADOS_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 25,
  p_item_plug_id => 59743431883862581+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Sancionados',
  p_source_type=> 'STATIC',
  p_display_as=> 'PLUGIN_BE.CTB.SELECT2',
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
  p_colspan=> 2,
  p_rowspan=> null,
  p_grid_column=> 9,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 293295443705544664+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'SINGLE',
  p_attribute_08 => 'CIC',
  p_attribute_10 => '100%',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>77951726967721187 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 340,
  p_name=>'P340_COMRGP_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 59743431883862581+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Registros del Proveedor',
  p_source_type=> 'STATIC',
  p_display_as=> 'PLUGIN_BE.CTB.SELECT2',
  p_lov=> 'select comrgp.nombre d, comrgp.nombre r'||unistr('\000a')||
'from com_registros_prv comrgp'||unistr('\000a')||
'where comrgp.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'  and comrgp.situacion = ''HAB'''||unistr('\000a')||
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
  p_colspan=> 6,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 293295443705544664+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'SINGLE',
  p_attribute_08 => 'CIC',
  p_attribute_10 => '100%',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 59757012270187945 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 340
 ,p_name => 'Refrescar Tipo de Proveedor'
 ,p_event_sequence => 10
 ,p_triggering_element_type => 'ITEM'
 ,p_triggering_element => 'P340_COMPRT_ID'
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'change'
  );
wwv_flow_api.create_page_da_action (
  p_id => 59757314481187948 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 340
 ,p_event_id => 59757012270187945 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_SUBMIT_PAGE'
 ,p_attribute_02 => 'Y'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 59759120890237714 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 340
 ,p_name => 'Refrescar Categoria Proveedor'
 ,p_event_sequence => 20
 ,p_triggering_element_type => 'ITEM'
 ,p_triggering_element => 'P340_COMPCT_ID'
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'change'
  );
wwv_flow_api.create_page_da_action (
  p_id => 59759403586237717 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 340
 ,p_event_id => 59759120890237714 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_SUBMIT_PAGE'
 ,p_attribute_02 => 'Y'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 59762501637317321 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 340
 ,p_name => 'Refrescar Estado Proveedor'
 ,p_event_sequence => 30
 ,p_triggering_element_type => 'ITEM'
 ,p_triggering_element => 'P340_COMPRE_ESTADO'
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'change'
  );
wwv_flow_api.create_page_da_action (
  p_id => 59762826835317323 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 340
 ,p_event_id => 59762501637317321 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_SUBMIT_PAGE'
 ,p_attribute_02 => 'Y'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 59764412897358478 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 340
 ,p_name => 'Refrescar Rubro Proveedor'
 ,p_event_sequence => 40
 ,p_triggering_element_type => 'ITEM'
 ,p_triggering_element => 'P340_COMRUB_NOMBRE'
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'change'
  );
wwv_flow_api.create_page_da_action (
  p_id => 59764724555358478 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 340
 ,p_event_id => 59764412897358478 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_SUBMIT_PAGE'
 ,p_attribute_02 => 'Y'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 59766703594384206 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 340
 ,p_name => 'Refrescar Documentación Proveedor'
 ,p_event_sequence => 50
 ,p_triggering_element_type => 'ITEM'
 ,p_triggering_element => 'P340_COMPRV_DOCUMENTACION'
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'change'
  );
wwv_flow_api.create_page_da_action (
  p_id => 59767005509384206 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 340
 ,p_event_id => 59766703594384206 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_SUBMIT_PAGE'
 ,p_attribute_02 => 'Y'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 67854007530609850 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 340
 ,p_name => 'Refrescar Sancionado'
 ,p_event_sequence => 60
 ,p_triggering_element_type => 'ITEM'
 ,p_triggering_element => 'P340_SANCIONADOS_SN'
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'change'
  );
wwv_flow_api.create_page_da_action (
  p_id => 67854301957609896 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 340
 ,p_event_id => 67854007530609850 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_SUBMIT_PAGE'
 ,p_attribute_02 => 'Y'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'P340_COMPRT_ID,P340_COMPCT_ID,P340_COMPRE_ESTADO,P340_COMRUB_NOMBRE,P340_COMPRV_DOCUMENTACION,P340_SANCIONADOS_SN';

wwv_flow_api.create_page_process(
  p_id     => 59770817633501762 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 340,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_ITEMS',
  p_process_name=> 'Restablecer',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>59769604689488542 + wwv_flow_api.g_id_offset,
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
p:=p||':P340_WHERE := NULL;'||unistr('\000a')||
'--'||unistr('\000a')||
'if :P340_FILTRO_PREDEFINIDO_SEL = ''TODOS'' then'||unistr('\000a')||
'  :P340_COMPRT_ID := NULL;'||unistr('\000a')||
'  :P340_COMPCT_ID := NULL;'||unistr('\000a')||
'  :P340_COMPRE_ESTADO := NULL;'||unistr('\000a')||
'  :P340_FILTRO_PREDEFINIDO_SEL := NULL;'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'if nvl(:P340_COMPRT_ID,''0'')  <> ''0'' then'||unistr('\000a')||
'  :P340_WHERE := :P340_WHERE||'' AND comprt.id = ''||:P340_COMPRT_ID;'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'if nvl(:P340_COMPCT_ID,''0'')  <> ''0'' then'||unistr('\000a')||
'  :P340_WHERE := :P340_WHERE||'' ';

p:=p||'AND compct.id = ''||:P340_COMPCT_ID;'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'if nvl(:P340_COMPRE_ESTADO,''0'')  <> ''0'' then'||unistr('\000a')||
'  :P340_WHERE := :P340_WHERE||'' AND compre.estado = ''''''||:P340_COMPRE_ESTADO||'''''''';'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'if nvl(:P340_COMRUB_NOMBRE,''0'')  <> ''0'' then'||unistr('\000a')||
'  :P340_WHERE := :P340_WHERE||'' AND INSTR(COMPRV_PKG.COMPRV_OBTN_COMRUB(comprv.id),''''''||:P340_COMRUB_NOMBRE||'''''') > 0 '';'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'if nvl(:P340_COMRGP_NOMBRE,''0'')  <> ';

p:=p||'''0'' then'||unistr('\000a')||
'  :P340_WHERE := :P340_WHERE||'' AND INSTR(COMPRV_PKG.COMPRV_COMPRG_OBT_SIT(p_comprv_id => comprv.id),''''''||:P340_COMRGP_NOMBRE||'''''') > 0 '';'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'if nvl(:P340_COMPRV_DOCUMENTACION,''0'')  <> ''0'' then'||unistr('\000a')||
'  :P340_WHERE := :P340_WHERE||'' AND decode(compre.estado, ''''SUS'''', '''''''',''''BAJ'''','''''''', decode(COMPRV_PKG.COMPRV_HABILITADO_COTIZAR_SN(p_comprv_id => comprv.id,p_comctt_id => NULL,p_comrub_id';

p:=p||' => NULL),''''SI'''', ''''AL DIA'''',''''DEBE'''')) =  ''''''||:P340_COMPRV_DOCUMENTACION||'''''''';'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'if nvl(:P340_SANCIONADOS_SN,''0'') <> ''0'' then'||unistr('\000a')||
'  if nvl(:P340_SANCIONADOS_SN,''0'') = ''SI'' then'||unistr('\000a')||
'    :P340_WHERE := :P340_WHERE||'' AND COMPRV_PKG.COMPRV_OBTN_SUS(p_comprv_id => comprv.id) is not null'';'||unistr('\000a')||
'  else'||unistr('\000a')||
'    :P340_WHERE := :P340_WHERE||'' AND COMPRV_PKG.COMPRV_OBTN_SUS(p_comprv_id => comprv.id) is null'';'||unistr('\000a')||
'  ';

p:=p||'end if;'||unistr('\000a')||
'end if;'||unistr('\000a')||
''||unistr('\000a')||
'if :P340_WHERE is null then'||unistr('\000a')||
'   :P340_WHERE := '' and 1=2 '';'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--';

wwv_flow_api.create_page_process(
  p_id     => 59746730570862618 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 340,
  p_process_sequence=> 20,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Asignar Where',
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
-- ...updatable report columns for page 340
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
