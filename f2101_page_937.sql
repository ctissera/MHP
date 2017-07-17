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
--   Date and Time:   14:50 Tuesday March 21, 2017
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

PROMPT ...Remove page 937
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>937);
 
end;
/

 
--application/pages/page_00937
prompt  ...PAGE 937: Cargar Autoridades
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 937
 ,p_user_interface_id => 70527406842675 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'ADMINISTRACION'
 ,p_name => 'Cargar Autoridades'
 ,p_step_title => 'Cargar Autoridades'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_javascript_code => 
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
 ,p_page_is_public_y_n => 'N'
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'FKASIAN'
 ,p_last_upd_yyyymmddhh24miss => '20170315143709'
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
  p_id=> 48133810917759521 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 937,
  p_plug_name=> 'Cargar Autoridades',
  p_region_name=>'',
  p_region_attributes=> 'style="width=600px;"',
  p_escape_on_http_output=>'N',
  p_plug_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
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
  p_id=> 48139527815759653 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 937,
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
  p_id=> 48139924143802053 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 937,
  p_plug_name=> 'Pasos ',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 48070032132406778 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 142039054754227113+ wwv_flow_api.g_id_offset,
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
s:=s||'DECLARE'||unistr('\000a')||
'  CURSOR cr_comtpt IS'||unistr('\000a')||
'  SELECT RV_MEANING'||unistr('\000a')||
'  FROM cg_ref_codes'||unistr('\000a')||
'  WHERE rv_domain = ''COM_TRAMITES_PRV.TIPO'''||unistr('\000a')||
'  AND rv_low_value = :P936_TIPO;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  CURSOR cr_comprv is'||unistr('\000a')||
'  SELECT *'||unistr('\000a')||
'  FROM COM_PROVEEDORES_V'||unistr('\000a')||
'  WHERE ID = :P937_COMPRV_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  CURSOR cr_comprt (p_comprv_comprt_id number)is'||unistr('\000a')||
'  SELECT ID'||unistr('\000a')||
'       , SEGORG_ID'||unistr('\000a')||
'       , DECODE(TIPO_PERSONA,''FIS'',''Apellido y Nombre'''||unistr('\000a')||
'                    ';

s:=s||'        ,''JUR'',''Razón Social'') codigo'||unistr('\000a')||
'       , NOMBRE'||unistr('\000a')||
'       , TIPO_PERSONA'||unistr('\000a')||
'       , SOLICITAR_RESPONSABLE_SN'||unistr('\000a')||
'  FROM COM_PROVEEDORES_TIPOS_V'||unistr('\000a')||
'  WHERE ID = p_comprv_comprt_id;'||unistr('\000a')||
'  --  '||unistr('\000a')||
'  v_comprv COM_PROVEEDORES_V%ROWTYPE;'||unistr('\000a')||
'  v_comprt cr_comprt%ROWTYPE;'||unistr('\000a')||
'  v_comtpt cr_comtpt%ROWTYPE;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  OPEN cr_comtpt;'||unistr('\000a')||
'  FETCH cr_comtpt INTO v_comtpt;'||unistr('\000a')||
'  CLOSE cr_comtpt;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_comprv;'||unistr('\000a')||
'  FETCH cr_comprv INTO';

s:=s||' v_comprv;'||unistr('\000a')||
'  CLOSE cr_comprv;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_comprt(p_comprv_comprt_id => v_comprv.comprt_id);'||unistr('\000a')||
'  FETCH cr_comprt INTO v_comprt;'||unistr('\000a')||
'  CLOSE cr_comprt;'||unistr('\000a')||
'htp.print(''<b>TIPO DEL TRÁMITE : ''||v_comtpt.RV_MEANING||'' </b><br><br>'');'||unistr('\000a')||
'htp.print(''<b>Datos de la ''||v_comprt.NOMBRE||'' </b><br>'');'||unistr('\000a')||
'htp.print(v_comprt.CODIGO||'' : <b>''||v_comprv.NOMBRE||''</b><br>'');'||unistr('\000a')||
'htp.print(''CUIT : <b>''||v_comprv.CUIT||''</b><br>'');';

s:=s||''||unistr('\000a')||
'END;';

wwv_flow_api.create_page_plug (
  p_id=> 48140225659812018 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 937,
  p_plug_name=> 'Datos del Proveedor',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
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
s:=s||'Select id'||unistr('\000a')||
'      ,comprv_id'||unistr('\000a')||
'      ,compcc_id '||unistr('\000a')||
'      ,compdo_id'||unistr('\000a')||
'      ,comtpr_id'||unistr('\000a')||
'      ,nombre||'' ''||apellido NOMBRE'||unistr('\000a')||
'      ,tipo_documento||'' - ''||numero_documento documento'||unistr('\000a')||
'      ,fecha_inicio'||unistr('\000a')||
'      ,fecha_vencimiento'||unistr('\000a')||
'      ,situacion'||unistr('\000a')||
'      ,situacion_abr'||unistr('\000a')||
'      ,fecha_situacion'||unistr('\000a')||
'      ,compcc_nombre'||unistr('\000a')||
'      ,''<a href="javascript:if (confirm(''''Desea Eliminar el Cargo Registrado?'''')) {$x(''''P937_ID'''').va';

s:=s||'lue = ''||to_char(ID)||''; doSubmit(''''ELIMINAR'''');}"><img src="#WORKSPACE_IMAGES#cross-circle.png" alt="Eliminar Cargo" title="Eliminar Cargo"/></a>'' ACCION'||unistr('\000a')||
''||unistr('\000a')||
'from com_proveedores_aut_v '||unistr('\000a')||
'where comtpr_id = :P937_COMTPR_ID';

wwv_flow_api.create_report_region (
  p_id=> 48184300768351728 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 937,
  p_name=> 'Autoridades Registradas',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 30,
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> 'select 1'||unistr('\000a')||
'from com_proveedores_aut'||unistr('\000a')||
'where comtpr_id = :P937_COMTPR_ID',
  p_display_condition_type=> 'EXISTS',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 142033072101227104+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> 'INDEFINIDO',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se han encontrado autoridades registradas.',
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
  p_id=> 48184612494351762 + wwv_flow_api.g_id_offset,
  p_region_id=> 48184300768351728 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 2,
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
  p_id=> 48184711577351764 + wwv_flow_api.g_id_offset,
  p_region_id=> 48184300768351728 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 1,
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 48184812503351764 + wwv_flow_api.g_id_offset,
  p_region_id=> 48184300768351728 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMPCC_ID',
  p_column_display_sequence=> 3,
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 48184920845351764 + wwv_flow_api.g_id_offset,
  p_region_id=> 48184300768351728 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDO_ID',
  p_column_display_sequence=> 4,
  p_column_heading=> 'COMPDO_ID',
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
  p_id=> 48185017458351764 + wwv_flow_api.g_id_offset,
  p_region_id=> 48184300768351728 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMTPR_ID',
  p_column_display_sequence=> 5,
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 48185411459351764 + wwv_flow_api.g_id_offset,
  p_region_id=> 48184300768351728 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'NOMBRE',
  p_column_display_sequence=> 6,
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
  p_id=> 48207509382987235 + wwv_flow_api.g_id_offset,
  p_region_id=> 48184300768351728 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 7,
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
  p_id=> 48185529628351764 + wwv_flow_api.g_id_offset,
  p_region_id=> 48184300768351728 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_INICIO',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Fecha Inicio',
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
  p_id=> 48185615188351764 + wwv_flow_api.g_id_offset,
  p_region_id=> 48184300768351728 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VENCIMIENTO',
  p_column_display_sequence=> 10,
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
  p_id=> 48185727534351764 + wwv_flow_api.g_id_offset,
  p_region_id=> 48184300768351728 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Situación',
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
  p_id=> 48390316446355364 + wwv_flow_api.g_id_offset,
  p_region_id=> 48184300768351728 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION_ABR',
  p_column_display_sequence=> 13,
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
  p_id=> 48185818675351764 + wwv_flow_api.g_id_offset,
  p_region_id=> 48184300768351728 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_SITUACION',
  p_column_display_sequence=> 12,
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 48390410337355370 + wwv_flow_api.g_id_offset,
  p_region_id=> 48184300768351728 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'COMPCC_NOMBRE',
  p_column_display_sequence=> 8,
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
  p_id=> 48250001755209051 + wwv_flow_api.g_id_offset,
  p_region_id=> 48184300768351728 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'ACCION',
  p_column_display_sequence=> 14,
  p_column_heading=> '<BR>',
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
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select  compcc.nombre'||unistr('\000a')||
'       ,compcc.cantidad_max'||unistr('\000a')||
'       ,compcc.cantidad_min'||unistr('\000a')||
'       ,compcd.compdt_nombre'||unistr('\000a')||
'from com_proveedores_cdt_v compcd'||unistr('\000a')||
'    ,com_proveedores_car_v compcc'||unistr('\000a')||
'where compcc_compct_id = :P937_COMPCT_ID'||unistr('\000a')||
'  and compcd.compcc_id = compcc.id';

wwv_flow_api.create_report_region (
  p_id=> 52959909111552198 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 937,
  p_name=> 'Requisitos',
  p_region_name=>'',
  p_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 20,
  p_region_attributes=>'style="width:90%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => true,
  p_display_column=> 2,
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
  p_query_break_cols=> '1:2:3',
  p_query_no_data_found=> 'Aún no se han registrado requisitos.',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_column_text_format=> '#SUM_COLUMN_HEADER#',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_break_repeat_heading_format=> '#COLUMN_VALUE#',
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
  p_id=> 52968310106043673 + wwv_flow_api.g_id_offset,
  p_region_id=> 52959909111552198 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'NOMBRE',
  p_column_display_sequence=> 1,
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
  p_id=> 52968426594043673 + wwv_flow_api.g_id_offset,
  p_region_id=> 52959909111552198 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'CANTIDAD_MAX',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Cantidad<br>Máxima',
  p_column_alignment=>'RIGHT',
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
  p_id=> 52968524364043676 + wwv_flow_api.g_id_offset,
  p_region_id=> 52959909111552198 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'CANTIDAD_MIN',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Cantidad<br>Mínima',
  p_column_alignment=>'RIGHT',
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
  p_id=> 52967927781012835 + wwv_flow_api.g_id_offset,
  p_region_id=> 52959909111552198 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_NOMBRE',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Tipo de Documento a adjuntar',
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
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 48134111617759526 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 937,
  p_button_sequence=> 30,
  p_button_plug_id => 48133810917759521+wwv_flow_api.g_id_offset,
  p_button_name    => 'SAVE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Apply Changes',
  p_button_position=> 'REGION_TEMPLATE_CHANGE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition_type=> 'NEVER',
  p_database_action=>'UPDATE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 48134411488759528 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 937,
  p_button_sequence=> 10,
  p_button_plug_id => 48133810917759521+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancelar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:251:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 48134008010759526 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 937,
  p_button_sequence=> 40,
  p_button_plug_id => 48133810917759521+wwv_flow_api.g_id_offset,
  p_button_name    => 'SIGUIENTE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Siguiente >',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 48134225999759526 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 937,
  p_button_sequence=> 20,
  p_button_plug_id => 48133810917759521+wwv_flow_api.g_id_offset,
  p_button_name    => 'PREVIOUS',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> '< Anterior',
  p_button_position=> 'REGION_TEMPLATE_PREVIOUS',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.confirm(''IMPORTANTE! Si desea cambiar de categoría, se eliminarán las autoridades cargadas hasta el momento.\n Desea continuar con el cambio?'',''ANTERIOR'');',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>48314110827127612 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 937,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:938:&SESSION.::&DEBUG.:938::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>48134008010759526+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 5,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>48134901554759543 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 937,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:936:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_branch_condition_type=> 'REQUEST_EQUALS_CONDITION',
  p_branch_condition=> 'ANTERIOR',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>48135129004759601 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 937,
  p_name=>'P937_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 48133810917759521+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Id',
  p_source=>'ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> null,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039553452227115+wwv_flow_api.g_id_offset,
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
  p_id=>48135315204759612 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 937,
  p_name=>'P937_COMPRV_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 48133810917759521+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comprv Id',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
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
  p_id=>48135511630759620 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 937,
  p_name=>'P937_COMPCC_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 48133810917759521+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Cargo',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'Select compcc.Nombre||'' '' ||decode(compcc.OBLIGATORIO_SN,''SI'',''(OBLIGATORIO)'',''(OPCIONAL)'') d, id r'||unistr('\000a')||
'from com_proveedores_car_v compcc'||unistr('\000a')||
'where compcc.compct_id = :P937_COMPCT_ID'||unistr('\000a')||
'and   compcc.situacion = ''VIG'''||unistr('\000a')||
'and  compcc.cantidad_max > (select count(compcc_id)'||unistr('\000a')||
'                              from com_proveedores_aut_v'||unistr('\000a')||
'                              where compcc_id = compcc.id'||unistr('\000a')||
'                              and comtpr_id = :P937_COMTPR_ID)      '||unistr('\000a')||
'              ',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'- SELECCIONE UN VALOR -',
  p_lov_null_value=> '',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 4,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
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
  p_id=>48135728134759620 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 937,
  p_name=>'P937_COMPDO_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 48133810917759521+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Compdo Id',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
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
  p_id=>48135909357759620 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 937,
  p_name=>'P937_COMTPR_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 48133810917759521+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comtpr Id',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
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
  p_id=>48136102701759620 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 937,
  p_name=>'P937_TIPO_DOCUMENTO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 48133810917759521+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'DNI',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tipo de Documento',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select RV_ABBREVIATION display_value, RV_LOW_VALUE return_value '||unistr('\000a')||
'from CG_REF_CODES'||unistr('\000a')||
'where  RV_DOMAIN = ''COM_PROVEEDORES_AUT.TIPO_DOCUMENTO'''||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 3,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
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
  p_id=>48136302931759621 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 937,
  p_name=>'P937_NUMERO_DOCUMENTO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 90,
  p_item_plug_id => 48133810917759521+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Número Documento',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 20,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'NO',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
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
  p_id=>48136516291759623 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 937,
  p_name=>'P937_APELLIDO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 48133810917759521+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Apellido',
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
  p_colspan=> 4,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
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
  p_id=>48136719266759625 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 937,
  p_name=>'P937_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 48133810917759521+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Nombre',
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
  p_colspan=> 4,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
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
  p_id=>48136907385759628 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 937,
  p_name=>'P937_FECHA_INICIO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 100,
  p_item_plug_id => 48133810917759521+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha Inicio',
  p_format_mask=>'DD/MM/YYYY',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DATE_PICKER',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 15,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 4,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
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
  p_id=>48137113596759629 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 937,
  p_name=>'P937_FECHA_VENCIMIENTO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 110,
  p_item_plug_id => 48133810917759521+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha de Vencimiento',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 15,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'NO',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P937_FECHA_VENCIMIENTO',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_field_template=> 142039553452227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>48137307568759631 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 937,
  p_name=>'P937_SITUACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 120,
  p_item_plug_id => 48133810917759521+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Situacion',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 3,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 4,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
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
  p_id=>48137503602759631 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 937,
  p_name=>'P937_FECHA_SITUACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 130,
  p_item_plug_id => 48133810917759521+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha Situacion',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 4,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
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
  p_id=>48137702404759631 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 937,
  p_name=>'P937_MOTIVO_SITUACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 140,
  p_item_plug_id => 48133810917759521+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Motivo Situacion',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 240,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039553452227115+wwv_flow_api.g_id_offset,
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
  p_id=>48137932591759631 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 937,
  p_name=>'P937_DATE_CREATED',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 150,
  p_item_plug_id => 48133810917759521+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Date Created',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
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
  p_id=>48138122267759631 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 937,
  p_name=>'P937_CREATED_BY',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 160,
  p_item_plug_id => 48133810917759521+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Created By',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 100,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
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
  p_id=>48138313958759635 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 937,
  p_name=>'P937_DATE_MODIFIED',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 170,
  p_item_plug_id => 48133810917759521+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Date Modified',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039553452227115+wwv_flow_api.g_id_offset,
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
  p_id=>48138532012759637 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 937,
  p_name=>'P937_MODIFIED_BY',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 180,
  p_item_plug_id => 48133810917759521+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Modified By',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 100,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039553452227115+wwv_flow_api.g_id_offset,
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
  p_id=>48175826981225300 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 937,
  p_name=>'P937_COMPCT_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 5,
  p_item_plug_id => 48133810917759521+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Categoría',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'Select Nombre d, id r'||unistr('\000a')||
'from   com_proveedores_cat_V'||unistr('\000a')||
'where id = :P937_COMPCT_ID',
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
  p_id=>48196405560599115 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 937,
  p_name=>'P937_AGREGAR_AUT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 190,
  p_item_plug_id => 48133810917759521+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Registrar Autoridad',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
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
  p_id=>48237821525724735 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 937,
  p_name=>'P937_CALCULAR_VENCIMIENTO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 100,
  p_item_plug_id => 48133810917759521+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Calcular Vencimiento',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
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
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>366550417969941235 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 937,
  p_name=>'P937_CONTROL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 200,
  p_item_plug_id => 48133810917759521+wwv_flow_api.g_id_offset,
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
 
wwv_flow_api.create_page_validation(
  p_id => 48271318950395445 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 937,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P937_NOMBRE not null',
  p_validation_sequence=> 10,
  p_validation => 'P937_NOMBRE',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Nombre debe tener un valor',
  p_always_execute=>'N',
  p_when_button_pressed=> 48196405560599115 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 48136719266759625 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 48272232056450193 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 937,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P937_APELLIDO not null',
  p_validation_sequence=> 20,
  p_validation => 'P937_APELLIDO',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Apellido debe tener un valor',
  p_always_execute=>'N',
  p_when_button_pressed=> 48196405560599115 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 48136516291759623 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 48272519763455840 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 937,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P937_TIPO_DOCUMENTO not null',
  p_validation_sequence=> 30,
  p_validation => 'P937_TIPO_DOCUMENTO',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Tipo de Documento debe tener algún valor.',
  p_always_execute=>'N',
  p_when_button_pressed=> 48196405560599115 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 48136102701759620 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 48272708333461175 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 937,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P937_NUMERO_DOCUMENTO not null',
  p_validation_sequence=> 40,
  p_validation => 'P937_NUMERO_DOCUMENTO',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Numero Documento debe tener algún valor.',
  p_always_execute=>'N',
  p_when_button_pressed=> 48196405560599115 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 48136302931759621 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 48272930749466012 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 937,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P937_FECHA_INICIO not null',
  p_validation_sequence=> 50,
  p_validation => 'P937_FECHA_INICIO',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Fecha Inicio debe tener algún valor.',
  p_always_execute=>'N',
  p_when_button_pressed=> 48196405560599115 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 48136907385759628 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 48273316947472403 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 937,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P937_COMPCC_ID not null',
  p_validation_sequence=> 60,
  p_validation => 'P937_COMPCC_ID',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Cargo debe tener algún valor.',
  p_always_execute=>'N',
  p_when_button_pressed=> 48196405560599115 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 48135511630759620 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 48274109146521545 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 937,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P937_COMPCC_ID',
  p_validation_sequence=> 70,
  p_validation => 'P937_COMPCC_ID',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Para poder calcular la fecha de vencimiento, Cargo debe tener algún valor.',
  p_always_execute=>'N',
  p_when_button_pressed=> 48237821525724735 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 48135511630759620 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 48274332425525967 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 937,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P937_FECHA_INICIO',
  p_validation_sequence=> 80,
  p_validation => 'P937_FECHA_INICIO',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Para poder calcular la fecha de Vencimiento, fecha de inicio debe tener algún valor.',
  p_always_execute=>'N',
  p_when_button_pressed=> 48237821525724735 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 48136907385759628 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 48296408330524834 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 937,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'cargosObligatorios',
  p_validation_sequence=> 90,
  p_validation => 'declare'||unistr('\000a')||
'  cursor cr_compra(p_compcc_id number) is'||unistr('\000a')||
'    select count(compcc2.COMPCC_ID) CANTIDAD'||unistr('\000a')||
'          ,(select NOMBRE '||unistr('\000a')||
'            from COM_PROVEEDORES_CAR '||unistr('\000a')||
'            where ID = compcc2.COMPCC_ID) NOMBRE'||unistr('\000a')||
'    from   (select *'||unistr('\000a')||
'             from COM_PROVEEDORES_AUT compra'||unistr('\000a')||
'		    where compra.COMTPR_ID = :P937_COMTPR_ID) compcc2'||unistr('\000a')||
'           where compcc2.COMPCC_ID = p_compcc_id'||unistr('\000a')||
'           group by COMPCC_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  cursor cr_compcc is'||unistr('\000a')||
'    select compcc.ID'||unistr('\000a')||
'          ,compcc.CANTIDAD_MIN'||unistr('\000a')||
'          ,compcc.NOMBRE'||unistr('\000a')||
'    from   COM_PROVEEDORES_CAR compcc'||unistr('\000a')||
'    where    compcc.COMPCT_ID = :P937_COMPCT_ID'||unistr('\000a')||
'    and      compcc.OBLIGATORIO_SN = ''SI'';'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_restantes number;'||unistr('\000a')||
'  v_compra cr_compra%rowtype;'||unistr('\000a')||
'  v_mensaje varchar2(4000) := null;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
'  for v_compcc in cr_compcc loop'||unistr('\000a')||
'    --'||unistr('\000a')||
'    open cr_compra(p_compcc_id => v_compcc.ID);'||unistr('\000a')||
'    fetch cr_compra into v_compra;'||unistr('\000a')||
'    close cr_compra;'||unistr('\000a')||
'    --     '||unistr('\000a')||
'    v_restantes :=  v_compcc.CANTIDAD_MIN - nvl(v_compra.CANTIDAD, 0);'||unistr('\000a')||
'    if v_restantes > 0 then '||unistr('\000a')||
'       v_mensaje := v_mensaje||'' Aun quedan por registrar ''||v_restantes||'' cargo(s) de ''||v_compcc.NOMBRE||'' obligatorio(s).<br>'';    '||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    --'||unistr('\000a')||
''||unistr('\000a')||
'    v_compra := null;'||unistr('\000a')||
'  end loop;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  if v_mensaje is not null then'||unistr('\000a')||
'    return v_mensaje;'||unistr('\000a')||
'  else'||unistr('\000a')||
'    return null;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  --'||unistr('\000a')||
'end;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => '',
  p_always_execute=>'N',
  p_when_button_pressed=> 48134008010759526 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 49509300826220046 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 937,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P937_FECHA_VENCIMIENTO not null',
  p_validation_sequence=> 100,
  p_validation => 'P937_FECHA_VENCIMIENTO',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Debe calcular el vencimiento del Cargo',
  p_always_execute=>'N',
  p_when_button_pressed=> 48196405560599115 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 48137113596759629 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 49664126721997110 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 937,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'ExisteUnaAutoridad',
  p_validation_sequence=> 110,
  p_validation => 'select 1'||unistr('\000a')||
'from com_proveedores_aut_v'||unistr('\000a')||
'where comtpr_id = :P937_COMTPR_ID',
  p_validation_type => 'EXISTS',
  p_error_message => 'Debe registrar al menos una autoridad para continuar',
  p_always_execute=>'N',
  p_validation_condition=> 'SIGUIENTE',
  p_validation_condition_type=> 'REQUEST_EQUALS_CONDITION',
  p_only_for_changed_rows=> 'Y',
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 51476527353728370 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 937,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'ValidarCantidadCargos',
  p_validation_sequence=> 120,
  p_validation => 'declare'||unistr('\000a')||
'  cursor cr_compra is'||unistr('\000a')||
'    select compra.COMPCC_ID'||unistr('\000a')||
'    from   COM_PROVEEDORES_AUT compra'||unistr('\000a')||
'    where  compra.TIPO_DOCUMENTO = :P937_TIPO_DOCUMENTO'||unistr('\000a')||
'    and    compra.NUMERO_DOCUMENTO = :P937_NUMERO_DOCUMENTO'||unistr('\000a')||
'    and    compra.COMPRV_ID = :P937_COMPRV_ID'||unistr('\000a')||
'    and    compra.COMTPR_ID = :P937_COMTPR_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_compcc_id number;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  open cr_compra;'||unistr('\000a')||
'  fetch cr_compra into v_compcc_id;'||unistr('\000a')||
'  close cr_compra;'||unistr('\000a')||
'  '||unistr('\000a')||
'  if v_compcc_id = :P937_COMPCC_ID then'||unistr('\000a')||
'    return ''Ya se ha registrado esta autoridad con este cargo.'';'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => '',
  p_always_execute=>'N',
  p_when_button_pressed=> 48196405560599115 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 56463928642459061 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 937,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Cargo vencido',
  p_validation_sequence=> 130,
  p_validation => 'declare '||unistr('\000a')||
'	v_fecha date;'||unistr('\000a')||
'begin'||unistr('\000a')||
'    v_fecha := :P937_FECHA_VENCIMIENTO;'||unistr('\000a')||
'     if to_date(to_char(v_fecha,''DD/MM/YYYY'')) <= to_date(to_char(SYSDATE,''DD/MM/YYYY'')) then'||unistr('\000a')||
'    	return ''El cargo se encuentra vencido. Verifique la fecha de Inicio'';'||unistr('\000a')||
'    else '||unistr('\000a')||
'    	return null;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
''||unistr('\000a')||
'end;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => '',
  p_always_execute=>'N',
  p_when_button_pressed=> 48196405560599115 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 366388425196709329 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 937,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'ValidarSiEsAgenteDelEstado',
  p_validation_sequence=> 140,
  p_validation => 'declare'||unistr('\000a')||
'   --'||unistr('\000a')||
'   v_retorno          varchar2(100);'||unistr('\000a')||
'   V_ESCALAFON        VARCHAR2(100);'||unistr('\000a')||
'   V_PLANTA           VARCHAR2(100);'||unistr('\000a')||
'   V_DEPENDENCIA      VARCHAR2(100);'||unistr('\000a')||
'   V_MINISTERIO       VARCHAR2(100);'||unistr('\000a')||
'   V_RAZONSOCIAL      VARCHAR2(100);'||unistr('\000a')||
'   V_FUNCIONCATEGORIA VARCHAR2(100);'||unistr('\000a')||
'   V_MOTIVO_ERROR     VARCHAR2(100);'||unistr('\000a')||
'   V_NRO_DOC          VARCHAR2(11);'||unistr('\000a')||
'   --'||unistr('\000a')||
'begin'||unistr('\000a')||
'   --'||unistr('\000a')||
'   V_NRO_DOC := trim( replace(replace(:P937_NUMERO_DOCUMENTO,''-'',''''),'' '','''') );'||unistr('\000a')||
'   --'||unistr('\000a')||
'   if length(V_NRO_DOC) < 11 then'||unistr('\000a')||
'      --'||unistr('\000a')||
'      V_NRO_DOC := V_NRO_DOC||''0''; '||unistr('\000a')||
'      -- '||unistr('\000a')||
'      while length(V_NRO_DOC) < 11 loop'||unistr('\000a')||
'         --'||unistr('\000a')||
'         V_NRO_DOC := ''0''||V_NRO_DOC;'||unistr('\000a')||
'         --'||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      -- '||unistr('\000a')||
'   end if;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   comprv_pkg.COMPRV_VLDR_AGENTE (P_SEGORG_ID         => :P1_SEGORG_ID'||unistr('\000a')||
'                                 , P_COMTPR_CUIT      => V_NRO_DOC '||unistr('\000a')||
'                                 , P_ESCALAFON        => V_ESCALAFON'||unistr('\000a')||
'                                 , P_PLANTA           => V_PLANTA'||unistr('\000a')||
'                                 , P_DEPENDENCIA      => V_DEPENDENCIA'||unistr('\000a')||
'                                 , P_MINISTERIO       => V_MINISTERIO'||unistr('\000a')||
'                                 , P_RAZONSOCIAL      => V_RAZONSOCIAL'||unistr('\000a')||
'                                 , P_FUNCIONCATEGORIA => V_FUNCIONCATEGORIA'||unistr('\000a')||
'                                 , P_MOTIVO_ERROR     => V_MOTIVO_ERROR'||unistr('\000a')||
'                                   );'||unistr('\000a')||
'   --'||unistr('\000a')||
'   if V_RAZONSOCIAL is not null then'||unistr('\000a')||
'      return ''La Persona Ingresada ('' || V_RAZONSOCIAL || '') es Agente del Estado Provincial por lo que no puede ser Inscripta como proveedor del estado según el Artículo 3° Decreto N° 4248 – MHyOP-2013 Inciso A'';'||unistr('\000a')||
'   else'||unistr('\000a')||
'      return V_MOTIVO_ERROR;'||unistr('\000a')||
'   end if;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   exception'||unistr('\000a')||
'      when others then'||unistr('\000a')||
'        return  ''Error al validar el número de documento'';'||unistr('\000a')||
'end;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => '',
  p_always_execute=>'N',
  p_validation_condition_type=> 'NEVER',
  p_when_button_pressed=> 48196405560599115 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 48136302931759621 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 366390209981725581 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 937
 ,p_name => 'ValidarAgenteDelEstado'
 ,p_event_sequence => 10
 ,p_triggering_element_type => 'ITEM'
 ,p_triggering_element => 'P937_NUMERO_DOCUMENTO'
 ,p_triggering_condition_type => 'JAVASCRIPT_EXPRESSION'
 ,p_triggering_expression => '$v(''P937_NUMERO_DOCUMENTO'') != '''''
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'focusout'
 ,p_display_when_type => 'NEVER'
  );
wwv_flow_api.create_page_da_action (
  p_id => 366512327624283759 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 937
 ,p_event_id => 366390209981725581 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 5
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => '$(''#P937_CONTROL'').val('''');'||unistr('\000a')||
'$(''#P937_APELLIDO'').val('''');'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 366390721664725620 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 937
 ,p_event_id => 366390209981725581 + wwv_flow_api.g_id_offset
 ,p_event_result => 'FALSE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => '$(''#uSuccessMessage'').css({''visibility'': ''hidden''});'||unistr('\000a')||
'$("#t13MessageHolder").empty();'||unistr('\000a')||
'$("#t13MessageHolder").html("<span></span>");'||unistr('\000a')||
'$(''#P937_CONTROL'').val('''');'||unistr('\000a')||
'$(''#P937_APELLIDO'').val('''');'||unistr('\000a')||
''
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 366514514672304935 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 937
 ,p_event_id => 366390209981725581 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => '$(''#processing'').css({''visibility'': ''visible''});'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 366390502972725617 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 937
 ,p_event_id => 366390209981725581 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_EXECUTE_PLSQL_CODE'
 ,p_attribute_01 => 'declare'||unistr('\000a')||
'   --'||unistr('\000a')||
'   v_retorno          varchar2(100);'||unistr('\000a')||
'   V_ESCALAFON        VARCHAR2(100);'||unistr('\000a')||
'   V_PLANTA           VARCHAR2(100);'||unistr('\000a')||
'   V_DEPENDENCIA      VARCHAR2(100);'||unistr('\000a')||
'   V_MINISTERIO       VARCHAR2(100);'||unistr('\000a')||
'   V_RAZONSOCIAL      VARCHAR2(100);'||unistr('\000a')||
'   V_FUNCIONCATEGORIA VARCHAR2(100);'||unistr('\000a')||
'   V_MOTIVO_ERROR     VARCHAR2(100);'||unistr('\000a')||
'   V_NRO_DOC          VARCHAR2(11);'||unistr('\000a')||
'   --'||unistr('\000a')||
'begin'||unistr('\000a')||
'   --'||unistr('\000a')||
'   V_NRO_DOC := trim( replace(replace(:P937_NUMERO_DOCUMENTO,''-'',''''),'' '','''') );'||unistr('\000a')||
'   --'||unistr('\000a')||
'   if length(V_NRO_DOC) < 11 then'||unistr('\000a')||
'      --'||unistr('\000a')||
'      V_NRO_DOC := V_NRO_DOC||''0''; '||unistr('\000a')||
'      -- '||unistr('\000a')||
'      while length(V_NRO_DOC) < 11 loop'||unistr('\000a')||
'         --'||unistr('\000a')||
'         V_NRO_DOC := ''0''||V_NRO_DOC;'||unistr('\000a')||
'         --'||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      -- '||unistr('\000a')||
'   end if;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   comprv_pkg.COMPRV_VLDR_AGENTE (P_SEGORG_ID         => :P1_SEGORG_ID'||unistr('\000a')||
'                                 , P_COMTPR_CUIT      => V_NRO_DOC'||unistr('\000a')||
'                                 , P_ESCALAFON        => V_ESCALAFON'||unistr('\000a')||
'                                 , P_PLANTA           => V_PLANTA'||unistr('\000a')||
'                                 , P_DEPENDENCIA      => V_DEPENDENCIA'||unistr('\000a')||
'                                 , P_MINISTERIO       => V_MINISTERIO'||unistr('\000a')||
'                                 , P_RAZONSOCIAL      => V_RAZONSOCIAL'||unistr('\000a')||
'                                 , P_FUNCIONCATEGORIA => V_FUNCIONCATEGORIA'||unistr('\000a')||
'                                 , P_MOTIVO_ERROR     => V_MOTIVO_ERROR'||unistr('\000a')||
'                                   );'||unistr('\000a')||
'   --'||unistr('\000a')||
'   if V_RAZONSOCIAL is not null then'||unistr('\000a')||
'      --'||unistr('\000a')||
'      :P937_APELLIDO := V_RAZONSOCIAL;'||unistr('\000a')||
'      :P937_CONTROL  := '''';'||unistr('\000a')||
'      --'||unistr('\000a')||
'   else if V_MOTIVO_ERROR is not null then'||unistr('\000a')||
'           --'||unistr('\000a')||
'           :P937_APELLIDO := '''';'||unistr('\000a')||
'           :P937_CONTROL  := ''ERROR'';'||unistr('\000a')||
'           -- '||unistr('\000a')||
'        else'||unistr('\000a')||
'           --'||unistr('\000a')||
'           :P937_APELLIDO := '''';'||unistr('\000a')||
'           :P937_CONTROL  := '''';'||unistr('\000a')||
'           -- '||unistr('\000a')||
'       end if;'||unistr('\000a')||
'       -- '||unistr('\000a')||
'   end if;'||unistr('\000a')||
''||unistr('\000a')||
'      '||unistr('\000a')||
'   --'||unistr('\000a')||
'end;'
 ,p_attribute_02 => 'P937_NUMERO_DOCUMENTO'
 ,p_attribute_03 => 'P937_APELLIDO,P937_CONTROL'
 ,p_attribute_04 => 'N'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 366390906095725623 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 937
 ,p_event_id => 366390209981725581 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 30
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => 'if ($v(''P937_APELLIDO'') != '''') {'||unistr('\000a')||
'   var messageHtml = '''';'||unistr('\000a')||
''||unistr('\000a')||
'   messageHtml = ''<section class="uRegion uWhiteRegion uMessageRegion clearfix"'';'||unistr('\000a')||
'   messageHtml += '' id="uSuccessMessage">'';'||unistr('\000a')||
'   messageHtml += ''  <div class="t13Notification uRegionContent clearfix" style="border: 1px solid #f00 !important;">'';'||unistr('\000a')||
'   messageHtml += ''    <a href="javascript:void(0)" '';'||unistr('\000a')||
'   messageHtml += ''      onclick="$x_Remove(\''uSuccessMessage\'')" '';'||unistr('\000a')||
'   messageHtml += ''      class="uCloseMessage"></a>'';'||unistr('\000a')||
'   messageHtml += ''    <img src="/i/alert_error.gif" class="uCheckmarkIcon" alt="" />'';'||unistr('\000a')||
'   messageHtml += ''    <div class="uMessageText">'';'||unistr('\000a')||
''||unistr('\000a')||
'   if($v(''P937_CONTROL'') == ''ERROR''){'||unistr('\000a')||
'      messageHtml += ''No se pudo validar si la Persona Ingresada es Agente del Estado Provincial'';'||unistr('\000a')||
'   }else{'||unistr('\000a')||
'      messageHtml += ''      La Persona Ingresada es Agente del Estado Provincial por lo que no puede ser Inscripta como proveedor del estado según el Artículo 3° Decreto N° 4248 – MHyOP-2013 Inciso A'';'||unistr('\000a')||
'   }'||unistr('\000a')||
''||unistr('\000a')||
'   messageHtml += ''    </div>'';'||unistr('\000a')||
'   messageHtml += ''  </div>'';'||unistr('\000a')||
'   messageHtml += ''</section>'';'||unistr('\000a')||
''||unistr('\000a')||
'   $("#t13MessageHolder").html(messageHtml);'||unistr('\000a')||
'   $(''#t13MessageHolder'').css({''visibility'': ''visible''});'||unistr('\000a')||
'   $(''#uSuccessMessage'').css({''visibility'': ''visible''});'||unistr('\000a')||
''||unistr('\000a')||
'}'||unistr('\000a')||
'else {'||unistr('\000a')||
'   $(''#t13MessageHolder'').css({''visibility'': ''hidden''});'||unistr('\000a')||
'   $(''#uSuccessMessage'').css({''visibility'': ''hidden''});'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'$(''#processing'').css({''visibility'': ''visible''});'
 ,p_stop_execution_on_error => 'Y'
 ,p_da_action_comment => 'prepend(messageHtml);'||unistr('\000a')||
't13BodyMargin'||unistr('\000a')||
'if ($v(''P937_CONTROL'') == ''ES_AGENTE'') {'||unistr('\000a')||
''
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
p:=p||'937';

wwv_flow_api.create_page_process(
  p_id     => 48139314323759650 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 937,
  p_process_sequence=> 40,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'reset page',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>48134225999759526 + wwv_flow_api.g_id_offset,
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
'v_compra COM_PROVEEDORES_AUT%ROWTYPE;'||unistr('\000a')||
'begin'||unistr('\000a')||
''||unistr('\000a')||
'  if :P937_FECHA_VENCIMIENTO = ''INDEFINIDO'' then'||unistr('\000a')||
'    :P937_FECHA_VENCIMIENTO := NULL;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
''||unistr('\000a')||
'  v_compra.COMPRV_ID		  := :P937_COMPRV_ID;'||unistr('\000a')||
'  v_compra.COMPCC_ID 		  := :P937_COMPCC_ID;'||unistr('\000a')||
'  v_compra.COMPDO_ID 		  := :P937_COMPDO_ID;'||unistr('\000a')||
'  v_compra.COMTPR_ID 		  := :P937_COMTPR_ID;'||unistr('\000a')||
'  v_compra.NOMBRE    		  := UPPER(:P937_NOMBRE);'||unistr('\000a')||
'  v_compra.APELLIDO  	';

p:=p||'	  := UPPER(:P937_APELLIDO);'||unistr('\000a')||
'  v_compra.TIPO_DOCUMENTO   := :P937_TIPO_DOCUMENTO;'||unistr('\000a')||
'  v_compra.NUMERO_DOCUMENTO := :P937_NUMERO_DOCUMENTO;'||unistr('\000a')||
'  v_compra.FECHA_INICIO     := :P937_FECHA_INICIO;'||unistr('\000a')||
'  v_compra.FECHA_VENCIMIENTO:= :P937_FECHA_VENCIMIENTO;'||unistr('\000a')||
'  v_compra.SITUACION        := ''NUE'';'||unistr('\000a')||
'  v_compra.FECHA_SITUACION  := SYSDATE;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  COMPRV_PKG.COMPRA_INS ( p_compra => v_compra);'||unistr('\000a')||
'  --'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 48195424130594998 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 937,
  p_process_sequence=> 50,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AgregarAutoridad',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>48196405560599115 + wwv_flow_api.g_id_offset,
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
p:=p||'P937_COMPCC_ID,P937_NOMBRE,P937_APELLIDO,P937_TIPO_DOCUMENTO,P937_NUMERO_DOCUMENTO,P937_FECHA_INICIO,P937_FECHA_VENCIMIENTO';

wwv_flow_api.create_page_process(
  p_id     => 48202608723696137 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 937,
  p_process_sequence=> 60,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_ITEMS',
  p_process_name=> 'limpiarCampos',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>48196405560599115 + wwv_flow_api.g_id_offset,
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
p:=p||'declare'||unistr('\000a')||
' cursor cr_compcc is'||unistr('\000a')||
'     select duracion_mandato_max'||unistr('\000a')||
'      from com_proveedores_car'||unistr('\000a')||
'     where id = :P937_COMPCC_ID;'||unistr('\000a')||
''||unistr('\000a')||
'v_mandato number;'||unistr('\000a')||
'v_vencimiento varchar(20);'||unistr('\000a')||
'v_inicio date;'||unistr('\000a')||
''||unistr('\000a')||
'begin'||unistr('\000a')||
''||unistr('\000a')||
'open cr_compcc;'||unistr('\000a')||
'fetch cr_compcc into v_mandato;'||unistr('\000a')||
'close cr_compcc;'||unistr('\000a')||
''||unistr('\000a')||
'if v_mandato is not null then'||unistr('\000a')||
'    v_inicio := :P937_FECHA_INICIO;'||unistr('\000a')||
'    v_vencimiento:= to_char(add_months(v_inicio, v_mandato * 12), ''dd/mm/';

p:=p||'yyyy'');'||unistr('\000a')||
'    :P937_FECHA_VENCIMIENTO := v_vencimiento;'||unistr('\000a')||
'else '||unistr('\000a')||
'	:P937_FECHA_VENCIMIENTO:= ''INDEFINIDO'';'||unistr('\000a')||
'end if;'||unistr('\000a')||
''||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 48220401085592889 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 937,
  p_process_sequence=> 70,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'CalcularFechaVencimientoAutoridad',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>48237821525724735 + wwv_flow_api.g_id_offset,
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
p:=p||'begin'||unistr('\000a')||
'    delete '||unistr('\000a')||
'      from com_proveedores_aut'||unistr('\000a')||
'     where id = :P937_ID;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 48260125454777746 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 937,
  p_process_sequence=> 80,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'EliminarAutoridad',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=>'ELIMINAR',
  p_process_when_type=>'REQUEST_EQUALS_CONDITION',
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
p:=p||'Begin'||unistr('\000a')||
'    :P937_COMPCT_ID := :P936_COMPCT_ID;'||unistr('\000a')||
'    :P937_COMPRV_ID := :P936_COMPRV_ID;'||unistr('\000a')||
'    :P937_COMTPR_ID := :P936_ID;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 48177725169245228 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 937,
  p_process_sequence=> 50,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'asignarValores',
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
-- ...updatable report columns for page 937
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
