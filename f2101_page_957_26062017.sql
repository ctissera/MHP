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
--   Date and Time:   10:04 Lunes Junio 26, 2017
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

PROMPT ...Remove page 957
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>957);
 
end;
/

 
--application/pages/page_00957
prompt  ...PAGE 957: Actualización de Autoridades
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 957
 ,p_user_interface_id => 70527406842675 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'ADMINISTRACION'
 ,p_name => 'Actualización de Autoridades'
 ,p_step_title => 'Actualización de Autoridades'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_page_comment => 'APEX_SUCCESS_MESSAGE'
 ,p_last_updated_by => 'FKASIAN'
 ,p_last_upd_yyyymmddhh24miss => '20170315143739'
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
  p_id=> 49818405968237385 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 957,
  p_plug_name=> 'Ruta de Navegación',
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
  p_id=> 49818700941244620 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 957,
  p_plug_name=> 'Pasos',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 49530726133415231 + wwv_flow_api.g_id_offset,
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
s:=s||'declare'||unistr('\000a')||
'  cursor cr_comtpt is'||unistr('\000a')||
'    select RV_MEANING'||unistr('\000a')||
'    from cg_ref_codes'||unistr('\000a')||
'    where rv_domain = ''COM_TRAMITES_PRV.TIPO'''||unistr('\000a')||
'    and rv_low_value = :P957_TIPO;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  cursor cr_comprv is'||unistr('\000a')||
'    select *'||unistr('\000a')||
'    from COM_PROVEEDORES_V'||unistr('\000a')||
'    where ID = :P957_COMPRV_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  cursor cr_comprt (p_comprv_comprt_id number) is'||unistr('\000a')||
'    select ID'||unistr('\000a')||
'          ,SEGORG_ID'||unistr('\000a')||
'          ,DECODE(TIPO_PERSONA,''FIS'',''Apellido y Nombre''';

s:=s||''||unistr('\000a')||
'                              ,''JUR'',''Razón Social'') codigo'||unistr('\000a')||
'          ,NOMBRE'||unistr('\000a')||
'          ,TIPO_PERSONA'||unistr('\000a')||
'          ,SOLICITAR_RESPONSABLE_SN'||unistr('\000a')||
'    from COM_PROVEEDORES_TIPOS_V'||unistr('\000a')||
'    where ID = p_comprv_comprt_id;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  cursor cr_compct (p_compct_id number) is'||unistr('\000a')||
'    select ID'||unistr('\000a')||
'    from   COM_PROVEEDORES_CAT compct'||unistr('\000a')||
'    where  compct.ID = p_compct_id;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_comprv cr_comprv%rowtype;'||unistr('\000a')||
'  v_comprt cr_comprt%r';

s:=s||'owtype;'||unistr('\000a')||
'  v_comtpt cr_comtpt%rowtype;'||unistr('\000a')||
'  --v_compct cr_compct%rowtype;'||unistr('\000a')||
'  v_compct_id number;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  open cr_comtpt;'||unistr('\000a')||
'  fetch cr_comtpt into v_comtpt;'||unistr('\000a')||
'  close cr_comtpt;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  open cr_comprv;'||unistr('\000a')||
'  fetch cr_comprv into v_comprv;'||unistr('\000a')||
'  close cr_comprv;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  open cr_comprt(p_comprv_comprt_id => v_comprv.comprt_id);'||unistr('\000a')||
'  fetch cr_comprt into v_comprt;'||unistr('\000a')||
'  close cr_comprt;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  open cr_compct(p_compct_id => v_c';

s:=s||'omprv.COMPCT_ID);'||unistr('\000a')||
'  fetch cr_compct into v_compct_id;'||unistr('\000a')||
'  close cr_compct;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  :P957_COMPCT_ID := v_compct_id;'||unistr('\000a')||
'  --  '||unistr('\000a')||
'  htp.print(''<strong>TIPO DEL TRÁMITE : ''||v_comtpt.RV_MEANING||'' </strong><br><br>'');'||unistr('\000a')||
'  htp.print(''<strong>Datos de la ''||v_comprt.NOMBRE||'' </strong><br>'');'||unistr('\000a')||
'  htp.print(v_comprt.CODIGO||'' : <strong>''||v_comprv.NOMBRE||''</strong><br>'');'||unistr('\000a')||
'  htp.print(''CUIT : <strong>''||v_comprv.CUI';

s:=s||'T||''</strong><br>'');'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 49819007306255982 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 957,
  p_plug_name=> 'Paso 1: Datos Requeridos',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
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
  p_id=> 49819218865268789 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 957,
  p_plug_name=> 'Actualización de Autoridades',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
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
s:=s||'select compra.ID'||unistr('\000a')||
'      ,compra.COMPRV_ID'||unistr('\000a')||
'      ,compra.COMPCC_ID'||unistr('\000a')||
'      ,compra.COMPDO_ID'||unistr('\000a')||
'      ,compra.COMTPR_ID'||unistr('\000a')||
'      ,compra.APELLIDO||'' ''||compra.NOMBRE NOMBRE'||unistr('\000a')||
'      ,compra.TIPO_DOCUMENTO||'' : ''||compra.NUMERO_DOCUMENTO DOCUMENTO'||unistr('\000a')||
'      ,compra.FECHA_INICIO'||unistr('\000a')||
'      ,compra.FECHA_VENCIMIENTO'||unistr('\000a')||
'      ,compra.SITUACION'||unistr('\000a')||
'      ,case '||unistr('\000a')||
'         when compra.FECHA_VENCIMIENTO < SYSDATE then'||unistr('\000a')||
'           ''<spa';

s:=s||'n style="color:red">VENCIDO</span>'''||unistr('\000a')||
'         else compra.SITUACION_ABR'||unistr('\000a')||
'       end SITUACION_ABR'||unistr('\000a')||
'      ,compra.FECHA_SITUACION'||unistr('\000a')||
'      ,compra.COMPCC_NOMBRE'||unistr('\000a')||
'      ,''<a href="javascript:$x(''''P957_COMPRA_ID'''').value = ''||to_char(ID)||''; $x(''''P957_OPERACION'''').value = ''''EDITAR'''';doSubmit(''''EDITAR'''');"><img src="#IMAGE_PREFIX#/menu/pencil16x16.gif" alt="Eliminar Cargo" title="Editar Autoridad"/></a>'' EDI';

s:=s||'TAR'||unistr('\000a')||
'      ,decode((select 1'||unistr('\000a')||
'               from   COM_PROVEEDORES_AUT_V compra2'||unistr('\000a')||
'               where  compra2.COMTPR_ID = :P957_ID'||unistr('\000a')||
'               and    compra2.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'               and    compra2.COMPCC_ID = compra.COMPCC_ID'||unistr('\000a')||
'               and    compra2.TIPO_DOCUMENTO = compra.TIPO_DOCUMENTO'||unistr('\000a')||
'               and    compra2.NUMERO_DOCUMENTO = compra.NUMERO_DOCUMENTO           ';

s:=s||'    '||unistr('\000a')||
'               and    compra2.SITUACION = ''MAR'''||unistr('\000a')||
'               group by compra2.COMPCC_ID, compra2.TIPO_DOCUMENTO, compra2.NUMERO_DOCUMENTO), null, ''<a href="javascript:if (confirm(''''Desea Eliminar el Cargo Registrado?'''')) {$x(''''P957_COMPRA_ID'''').value = ''||to_char(ID)||'';doSubmit(''''ELIMINAR'''');}"><img src="#WORKSPACE_IMAGES#cross-circle.png" alt="Eliminar Cargo" title="Eliminar Cargo"/></a>''';

s:=s||', '''') ELIMINAR      '||unistr('\000a')||
'from   COM_PROVEEDORES_AUT_V compra'||unistr('\000a')||
'where  compra.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'and    compra.ID in (select max(compra2.ID)'||unistr('\000a')||
'                    from   COM_PROVEEDORES_AUT_V compra2'||unistr('\000a')||
'                    where  compra2.SITUACION not in (''NUE'',''ANU'')'||unistr('\000a')||
'                    and    compra2.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'                    group by compra2.COMPCC_ID, compra2.TIPO_DOCUMENTO,';

s:=s||' compra2.NUMERO_DOCUMENTO, compra2.COMPRV_ID)'||unistr('\000a')||
'and    compra.SITUACION in (''VIG'',''MAR'')';

wwv_flow_api.create_report_region (
  p_id=> 49835701642670668 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 957,
  p_name=> 'Autoridades Vigentes',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 30,
  p_region_attributes=>'style="width: 91%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
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
  p_query_no_data_found=> 'No se han actualizado autoridades durante este tramite.',
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
  p_id=> 49836025017670682 + wwv_flow_api.g_id_offset,
  p_region_id=> 49835701642670668 + wwv_flow_api.g_id_offset,
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
  p_id=> 49836128165670685 + wwv_flow_api.g_id_offset,
  p_region_id=> 49835701642670668 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 2,
  p_column_heading=> 'comprvId',
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
  p_id=> 49836231840670685 + wwv_flow_api.g_id_offset,
  p_region_id=> 49835701642670668 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMPCC_ID',
  p_column_display_sequence=> 3,
  p_column_heading=> 'compccId',
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
  p_id=> 49836301219670685 + wwv_flow_api.g_id_offset,
  p_region_id=> 49835701642670668 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDO_ID',
  p_column_display_sequence=> 4,
  p_column_heading=> 'compdoId',
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
  p_id=> 49836426483670685 + wwv_flow_api.g_id_offset,
  p_region_id=> 49835701642670668 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMTPR_ID',
  p_column_display_sequence=> 5,
  p_column_heading=> 'comtprId',
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
  p_id=> 49836524307670685 + wwv_flow_api.g_id_offset,
  p_region_id=> 49835701642670668 + wwv_flow_api.g_id_offset,
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
  p_id=> 49836625715670685 + wwv_flow_api.g_id_offset,
  p_region_id=> 49835701642670668 + wwv_flow_api.g_id_offset,
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
  p_id=> 49836712331670685 + wwv_flow_api.g_id_offset,
  p_region_id=> 49835701642670668 + wwv_flow_api.g_id_offset,
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
  p_id=> 49836821559670685 + wwv_flow_api.g_id_offset,
  p_region_id=> 49835701642670668 + wwv_flow_api.g_id_offset,
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
  p_id=> 49836903579670685 + wwv_flow_api.g_id_offset,
  p_region_id=> 49835701642670668 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Situación',
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
  p_id=> 49837015650670685 + wwv_flow_api.g_id_offset,
  p_region_id=> 49835701642670668 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION_ABR',
  p_column_display_sequence=> 13,
  p_column_heading=> 'Situación',
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
  p_id=> 49837123626670685 + wwv_flow_api.g_id_offset,
  p_region_id=> 49835701642670668 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_SITUACION',
  p_column_display_sequence=> 12,
  p_column_heading=> 'Fecha Situación',
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
  p_id=> 49837215338670685 + wwv_flow_api.g_id_offset,
  p_region_id=> 49835701642670668 + wwv_flow_api.g_id_offset,
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
  p_id=> 49897905688877740 + wwv_flow_api.g_id_offset,
  p_region_id=> 49835701642670668 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'EDITAR',
  p_column_display_sequence=> 14,
  p_column_heading=> 'Editar',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'CENTER',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'NEVER',
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
  p_id=> 49898622688915360 + wwv_flow_api.g_id_offset,
  p_region_id=> 49835701642670668 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 15,
  p_form_element_id=> null,
  p_column_alias=> 'ELIMINAR',
  p_column_display_sequence=> 15,
  p_column_heading=> 'Dar de baja',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'CENTER',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'ITEM_IS_NULL',
  p_display_when_condition=> 'P957_OPERACION',
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
s:=s||'select compra.ID'||unistr('\000a')||
'      ,compra.COMPRV_ID'||unistr('\000a')||
'      ,compra.COMPCC_ID'||unistr('\000a')||
'      ,compra.COMPDO_ID'||unistr('\000a')||
'      ,compra.COMTPR_ID'||unistr('\000a')||
'      ,compra.APELLIDO||'' ''||compra.NOMBRE NOMBRE'||unistr('\000a')||
'      ,compra.TIPO_DOCUMENTO||'' : ''||compra.NUMERO_DOCUMENTO DOCUMENTO'||unistr('\000a')||
'      ,compra.FECHA_INICIO'||unistr('\000a')||
'      ,compra.FECHA_VENCIMIENTO'||unistr('\000a')||
'      ,compra.SITUACION'||unistr('\000a')||
'      ,compra.SITUACION_ABR'||unistr('\000a')||
'      ,compra.FECHA_SITUACION'||unistr('\000a')||
'      ,compra.COMPCC_NOMB';

s:=s||'RE'||unistr('\000a')||
'      ,''<a href="javascript:if (confirm(''''Desea Eliminar el Cargo Registrado?'''')) {$x(''''P957_COMPRA_ID'''').value = ''||to_char(ID)||''; doSubmit(''''ELIMINAR'''');}"><img src="#WORKSPACE_IMAGES#cross-circle.png" alt="Eliminar Cargo" title="Eliminar Cargo"/></a>'' ELIMINAR         '||unistr('\000a')||
'  from   COM_PROVEEDORES_AUT_V compra'||unistr('\000a')||
'  where  compra.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'  and    compra.SITUACION = ''NUE'''||unistr('\000a')||
'  and  ';

s:=s||'COMTPR_ID = :P957_ID';

wwv_flow_api.create_report_region (
  p_id=> 50058216892602201 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 957,
  p_name=> 'Autoridades Registradas',
  p_region_name=>'',
  p_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 40,
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> '  select *'||unistr('\000a')||
'  from   COM_PROVEEDORES_AUT compra'||unistr('\000a')||
'  where  compra.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'  and    compra.SITUACION = ''NUE'''||unistr('\000a')||
'  and  COMTPR_ID = :P957_ID',
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
  p_id=> 50058503548602204 + wwv_flow_api.g_id_offset,
  p_region_id=> 50058216892602201 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 1,
  p_column_heading=> 'id',
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
  p_id=> 50058632077602206 + wwv_flow_api.g_id_offset,
  p_region_id=> 50058216892602201 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 2,
  p_column_heading=> 'comprvId',
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
  p_id=> 50058700795602206 + wwv_flow_api.g_id_offset,
  p_region_id=> 50058216892602201 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMPCC_ID',
  p_column_display_sequence=> 3,
  p_column_heading=> 'compccId',
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
  p_id=> 50058821843602206 + wwv_flow_api.g_id_offset,
  p_region_id=> 50058216892602201 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDO_ID',
  p_column_display_sequence=> 4,
  p_column_heading=> 'compdoId',
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
  p_id=> 50058901783602206 + wwv_flow_api.g_id_offset,
  p_region_id=> 50058216892602201 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMTPR_ID',
  p_column_display_sequence=> 5,
  p_column_heading=> 'comtprId',
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
  p_id=> 50059326013602206 + wwv_flow_api.g_id_offset,
  p_region_id=> 50058216892602201 + wwv_flow_api.g_id_offset,
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
  p_id=> 50063022454630801 + wwv_flow_api.g_id_offset,
  p_region_id=> 50058216892602201 + wwv_flow_api.g_id_offset,
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
  p_id=> 50059409056602206 + wwv_flow_api.g_id_offset,
  p_region_id=> 50058216892602201 + wwv_flow_api.g_id_offset,
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
  p_id=> 50059516484602207 + wwv_flow_api.g_id_offset,
  p_region_id=> 50058216892602201 + wwv_flow_api.g_id_offset,
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
  p_id=> 50059623060602207 + wwv_flow_api.g_id_offset,
  p_region_id=> 50058216892602201 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION',
  p_column_display_sequence=> 12,
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
  p_id=> 50063108442630801 + wwv_flow_api.g_id_offset,
  p_region_id=> 50058216892602201 + wwv_flow_api.g_id_offset,
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
  p_id=> 50059705058602207 + wwv_flow_api.g_id_offset,
  p_region_id=> 50058216892602201 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_SITUACION',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Fecha de Situación',
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
  p_id=> 50063225322630801 + wwv_flow_api.g_id_offset,
  p_region_id=> 50058216892602201 + wwv_flow_api.g_id_offset,
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
  p_id=> 50071902802733906 + wwv_flow_api.g_id_offset,
  p_region_id=> 50058216892602201 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'ELIMINAR',
  p_column_display_sequence=> 14,
  p_column_heading=> 'Eliminar',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'CENTER',
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
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select compra.ID'||unistr('\000a')||
'      ,compra.COMPRV_ID'||unistr('\000a')||
'      ,compra.COMPCC_ID'||unistr('\000a')||
'      ,compra.COMPDO_ID'||unistr('\000a')||
'      ,compra.COMTPR_ID'||unistr('\000a')||
'      ,compra.APELLIDO||'' ''||compra.NOMBRE NOMBRE'||unistr('\000a')||
'      ,compra.TIPO_DOCUMENTO||'' : ''||compra.NUMERO_DOCUMENTO DOCUMENTO'||unistr('\000a')||
'      ,compra.FECHA_INICIO'||unistr('\000a')||
'      ,compra.FECHA_VENCIMIENTO'||unistr('\000a')||
'      ,compra.SITUACION'||unistr('\000a')||
'      ,compra.SITUACION_ABR'||unistr('\000a')||
'      ,compra.FECHA_SITUACION'||unistr('\000a')||
'      ,compra.COMPCC_NOMB';

s:=s||'RE'||unistr('\000a')||
'      ,''<a href="javascript:if (confirm(''''Desea Eliminar el Cargo Registrado?'''')) {$x(''''P957_COMPRA_ID'''').value = ''||to_char(ID)||''; doSubmit(''''REVERTIR'''');}"><img src="#WORKSPACE_IMAGES#cross-circle.png" alt="Eliminar Cargo" title="Eliminar Cargo"/></a>'' REVERTIR       '||unistr('\000a')||
'  from   COM_PROVEEDORES_AUT_V compra'||unistr('\000a')||
'  where  compra.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'  and    compra.SITUACION = ''MAR'''||unistr('\000a')||
'  and  CO';

s:=s||'MTPR_ID = :P957_ID';

wwv_flow_api.create_report_region (
  p_id=> 50060331091606293 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 957,
  p_name=> 'Autoridades a dar de Baja',
  p_region_name=>'',
  p_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 50,
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> 'select *'||unistr('\000a')||
'  from   COM_PROVEEDORES_AUT compra'||unistr('\000a')||
'  where  compra.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'  and    compra.SITUACION = ''MAR'''||unistr('\000a')||
'  and  COMTPR_ID = :P957_ID',
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
  p_id=> 50061424362606300 + wwv_flow_api.g_id_offset,
  p_region_id=> 50060331091606293 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 1,
  p_column_heading=> 'id',
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
  p_id=> 50061517323606301 + wwv_flow_api.g_id_offset,
  p_region_id=> 50060331091606293 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 2,
  p_column_heading=> 'comprvId',
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
  p_id=> 50061621695606301 + wwv_flow_api.g_id_offset,
  p_region_id=> 50060331091606293 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMPCC_ID',
  p_column_display_sequence=> 3,
  p_column_heading=> 'compccId',
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
  p_id=> 50061707017606301 + wwv_flow_api.g_id_offset,
  p_region_id=> 50060331091606293 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDO_ID',
  p_column_display_sequence=> 4,
  p_column_heading=> 'compdoId',
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
  p_id=> 50061823560606301 + wwv_flow_api.g_id_offset,
  p_region_id=> 50060331091606293 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMTPR_ID',
  p_column_display_sequence=> 5,
  p_column_heading=> 'comtprId',
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
  p_id=> 50062221602606301 + wwv_flow_api.g_id_offset,
  p_region_id=> 50060331091606293 + wwv_flow_api.g_id_offset,
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
  p_id=> 50063420513631717 + wwv_flow_api.g_id_offset,
  p_region_id=> 50060331091606293 + wwv_flow_api.g_id_offset,
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
  p_id=> 50060503942606295 + wwv_flow_api.g_id_offset,
  p_region_id=> 50060331091606293 + wwv_flow_api.g_id_offset,
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
  p_id=> 50060623970606295 + wwv_flow_api.g_id_offset,
  p_region_id=> 50060331091606293 + wwv_flow_api.g_id_offset,
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
  p_id=> 50060706523606295 + wwv_flow_api.g_id_offset,
  p_region_id=> 50060331091606293 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION',
  p_column_display_sequence=> 12,
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
  p_id=> 50063507805631717 + wwv_flow_api.g_id_offset,
  p_region_id=> 50060331091606293 + wwv_flow_api.g_id_offset,
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
  p_id=> 50060811302606295 + wwv_flow_api.g_id_offset,
  p_region_id=> 50060331091606293 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_SITUACION',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Fecha de Situación',
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
  p_id=> 50063601832631717 + wwv_flow_api.g_id_offset,
  p_region_id=> 50060331091606293 + wwv_flow_api.g_id_offset,
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
  p_id=> 50815520108531493 + wwv_flow_api.g_id_offset,
  p_region_id=> 50060331091606293 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'REVERTIR',
  p_column_display_sequence=> 14,
  p_column_heading=> 'Revertir',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'CENTER',
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
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select  compcc.nombre'||unistr('\000a')||
'       ,compcc.cantidad_max'||unistr('\000a')||
'       ,compcc.cantidad_min'||unistr('\000a')||
'       ,compcd.compdt_nombre'||unistr('\000a')||
'from com_proveedores_cdt_v compcd'||unistr('\000a')||
'    ,com_proveedores_car_v compcc'||unistr('\000a')||
'where compcc_compct_id = :P957_COMPCT_ID'||unistr('\000a')||
'  and compcd.compcc_id = compcc.id';

wwv_flow_api.create_report_region (
  p_id=> 52969720604085373 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 957,
  p_name=> 'Requisitos',
  p_region_name=>'',
  p_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 60,
  p_region_attributes=>'style="width: 90%"',
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
  p_query_no_data_found=> 'no data found',
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
  p_id=> 52970224462085398 + wwv_flow_api.g_id_offset,
  p_region_id=> 52969720604085373 + wwv_flow_api.g_id_offset,
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
  p_id=> 52969929841085398 + wwv_flow_api.g_id_offset,
  p_region_id=> 52969720604085373 + wwv_flow_api.g_id_offset,
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
  p_id=> 52970028269085398 + wwv_flow_api.g_id_offset,
  p_region_id=> 52969720604085373 + wwv_flow_api.g_id_offset,
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
  p_id=> 52970109306085398 + wwv_flow_api.g_id_offset,
  p_region_id=> 52969720604085373 + wwv_flow_api.g_id_offset,
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
  p_id             => 50724410269054829 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 957,
  p_button_sequence=> 30,
  p_button_plug_id => 49819218865268789+wwv_flow_api.g_id_offset,
  p_button_name    => 'P957_AGREGAR',
  p_button_action  => 'SUBMIT',
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Agregar Autoridad',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P957_OPERACION',
  p_button_condition_type=> 'ITEM_IS_NULL',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 50725408453073181 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 957,
  p_button_sequence=> 40,
  p_button_plug_id => 49819218865268789+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCELAR_AUTORIDAD',
  p_button_action  => 'SUBMIT',
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancelar',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P957_OPERACION',
  p_button_condition2=> 'EDITAR',
  p_button_condition_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 50714004027277131 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 957,
  p_button_sequence=> 50,
  p_button_plug_id => 49819218865268789+wwv_flow_api.g_id_offset,
  p_button_name    => 'P957_APLICAR_CAMBIOS',
  p_button_action  => 'SUBMIT',
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Aplicar Cambios',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P957_OPERACION',
  p_button_condition2=> 'EDITAR',
  p_button_condition_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 49819631521268793 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 957,
  p_button_sequence=> 10,
  p_button_plug_id => 49819218865268789+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancelar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P957_OPERACION',
  p_button_condition_type=> 'ITEM_IS_NULL',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 49819426148268793 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 957,
  p_button_sequence=> 20,
  p_button_plug_id => 49819218865268789+wwv_flow_api.g_id_offset,
  p_button_name    => 'NEXT',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Siguiente >',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P957_OPERACION',
  p_button_condition_type=> 'ITEM_IS_NULL',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>49819830036268795 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:958:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>49819426148268793+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 20,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>50074603307970842 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:251:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>49819631521268793+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 30,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>49847525774385145 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:957:&SESSION.::&DEBUG.::P957_ID:&P957_ID.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 100,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49820030003268846 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 49819007306255982+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
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
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49820220226268860 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_SEGORG_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 49819007306255982+wwv_flow_api.g_id_offset,
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
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49820423515268862 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_FECHA',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 49819007306255982+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha',
  p_source=>'FECHA',
  p_source_type=> 'DB_COLUMN',
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
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49820627305268862 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_COMPRV_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 49819007306255982+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comprv Id',
  p_source=>'COMPRV_ID',
  p_source_type=> 'DB_COLUMN',
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
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49820828757268862 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_TIPO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 49819007306255982+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tipo',
  p_source=>'TIPO',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 5,
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
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49821009380268862 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_COMPRT_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 49819007306255982+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comprt Id',
  p_source=>'COMPRT_ID',
  p_source_type=> 'DB_COLUMN',
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
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49821205482268864 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_CUIT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 49819007306255982+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Cuit',
  p_source=>'CUIT',
  p_source_type=> 'DB_COLUMN',
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
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49821429727268864 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 49819007306255982+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Nombre',
  p_source=>'NOMBRE',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 200,
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
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49821602560268864 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_DESCRIPCION_ACTIVIDAD',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 90,
  p_item_plug_id => 49819007306255982+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Descripcion Actividad',
  p_source=>'DESCRIPCION_ACTIVIDAD',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 2000,
  p_cHeight=> 4,
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
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49821825919268864 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_EMAIL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 100,
  p_item_plug_id => 49819007306255982+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Email',
  p_source=>'EMAIL',
  p_source_type=> 'DB_COLUMN',
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
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49822001512268864 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_CONDICION_IB',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 110,
  p_item_plug_id => 49819007306255982+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Condicion Ib',
  p_source=>'CONDICION_IB',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 5,
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
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49822209104268865 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_NUMERO_INSCRIPCION_IB',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 120,
  p_item_plug_id => 49819007306255982+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Numero Inscripcion Ib',
  p_source=>'NUMERO_INSCRIPCION_IB',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 30,
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
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49822409444268865 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_FECHA_INSCRIPCION_IB',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 130,
  p_item_plug_id => 49819007306255982+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha Inscripcion Ib',
  p_source=>'FECHA_INSCRIPCION_IB',
  p_source_type=> 'DB_COLUMN',
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
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49822608368268865 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_NUMERO_CONVENIO_MULTILATE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 140,
  p_item_plug_id => 49819007306255982+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Numero Convenio Multilateral',
  p_source=>'NUMERO_CONVENIO_MULTILATERAL',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 30,
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
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49822819448268865 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_CBU',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 150,
  p_item_plug_id => 49819007306255982+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Cbu',
  p_source=>'CBU',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 50,
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
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49823009018268865 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_SITUACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 160,
  p_item_plug_id => 49819007306255982+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Situacion',
  p_source=>'SITUACION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
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
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49823229939268865 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_MOTIVO_SITUACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 170,
  p_item_plug_id => 49819007306255982+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Motivo Situacion',
  p_source=>'MOTIVO_SITUACION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 2000,
  p_cHeight=> 4,
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
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49823418933268865 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_DATE_CREATED',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 180,
  p_item_plug_id => 49819007306255982+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Date Created',
  p_source=>'DATE_CREATED',
  p_source_type=> 'DB_COLUMN',
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
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49823603133268865 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_CREATED_BY',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 190,
  p_item_plug_id => 49819007306255982+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Created By',
  p_source=>'CREATED_BY',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 200,
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
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49823820286268865 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_DATE_MODIFIED',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 200,
  p_item_plug_id => 49819007306255982+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Date Modified',
  p_source=>'DATE_MODIFIED',
  p_source_type=> 'DB_COLUMN',
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
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49824019682268867 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_MODIFIED_BY',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 210,
  p_item_plug_id => 49819007306255982+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Modified By',
  p_source=>'MODIFIED_BY',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 200,
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
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49824206323268867 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_ASUNTO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 220,
  p_item_plug_id => 49819007306255982+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Asunto',
  p_source=>'ASUNTO',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 1000,
  p_cHeight=> 4,
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
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49824418143268868 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_CUERPO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 230,
  p_item_plug_id => 49819007306255982+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Cuerpo',
  p_source=>'CUERPO',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 4000,
  p_cHeight=> 4,
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
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49824624353268868 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_PRIORIDAD',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 240,
  p_item_plug_id => 49819007306255982+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Prioridad',
  p_source=>'PRIORIDAD',
  p_source_type=> 'DB_COLUMN',
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
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49831126843336306 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_COMPRA_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 250,
  p_item_plug_id => 49819007306255982+wwv_flow_api.g_id_offset,
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
  p_id=>49831322529338218 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_RESULTADO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 260,
  p_item_plug_id => 49819007306255982+wwv_flow_api.g_id_offset,
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
  p_id=>49831805252376681 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_COMPCT_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 270,
  p_item_plug_id => 49819218865268789+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Categoria:',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select compcc.NOMBRE d, compcc.ID r'||unistr('\000a')||
'from   COM_PROVEEDORES_CAT_V compcc'||unistr('\000a')||
'where  compcc.ID = :P957_COMPCT_ID',
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
  p_id=>49832923115413951 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_COMPCC_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 280,
  p_item_plug_id => 49819218865268789+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Cargo',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select NOMBRE||'' '' ||decode(compcc2.OBLIGATORIO_SN,''SI'',''(OBLIGATORIO)'',''(OPCIONAL)'') d, compcc2.ID r'||unistr('\000a')||
'from   COM_PROVEEDORES_CAR compcc2'||unistr('\000a')||
'where  compcc2.COMPCT_ID = :P957_COMPCT_ID'||unistr('\000a')||
'and    compcc2.CANTIDAD_MAX > (select count(compcc.ID) '||unistr('\000a')||
'                               from   (select * -- Cantidad de Cargos de Autoridades que estan vigentes'||unistr('\000a')||
'                                    from   COM_PROVEEDORES_AUT compra '||unistr('\000a')||
'                                    where  compra.COMPRV_ID = :P957_COMPRV_ID                                    '||unistr('\000a')||
'                                    and    compra.ID in (select max(compra2.ID)'||unistr('\000a')||
'                                                         from   COM_PROVEEDORES_AUT compra2'||unistr('\000a')||
'                                                         where  compra2.SITUACION not in (''ANU'',''NUE'')'||unistr('\000a')||
'                                                         and    compra2.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'                                                         group by compra2.COMPCC_ID, compra2.TIPO_DOCUMENTO, compra2.NUMERO_DOCUMENTO, compra2.COMPRV_ID)'||unistr('\000a')||
'                                    and    compra.situacion in (''VIG'', ''MAR'')                                                          '||unistr('\000a')||
'                                    and    compra.ID not in (select compra3.ID'||unistr('\000a')||
'                                                             from   COM_PROVEEDORES_AUT compra3 '||unistr('\000a')||
'                                                             where  compra3.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'                                                             and    compra3.COMTPR_ID = :P957_ID'||unistr('\000a')||
'                                                             and    compra3.SITUACION = ''MAR'')                                                         '||unistr('\000a')||
'                                    union all                                                         '||unistr('\000a')||
'                                    select * -- Cantidad de Cargos de Autornidades que han sido agregadas'||unistr('\000a')||
'                                    from   COM_PROVEEDORES_AUT compra'||unistr('\000a')||
'                                    where  compra.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'                                    and    compra.SITUACION = ''NUE'''||unistr('\000a')||
'                                    and    compra.COMTPR_ID = :P957_ID) compcc'||unistr('\000a')||
'                             where compcc.COMPCC_ID = compcc2.ID)'||unistr('\000a')||
'and   :P957_OPERACION is null'||unistr('\000a')||
'union all'||unistr('\000a')||
'select NOMBRE||'' '' ||decode(compcc2.OBLIGATORIO_SN,''SI'',''(OBLIGATORIO)'','''') d, compcc2.ID r'||unistr('\000a')||
'from   COM_PROVEEDORES_CAR compcc2'||unistr('\000a')||
'where  compcc2.COMPCT_ID = :P957_COMPCT_ID'||unistr('\000a')||
'and    compcc2.ID = :P957_COMPCC_ID'||unistr('\000a')||
'and    :P957_OPERACION = ''EDITAR''',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'- SELECCIONE UN VALOR -',
  p_lov_null_value=> '',
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
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => 'select NOMBRE||'' '' ||decode(compcc2.OBLIGATORIO_SN,''SI'',''(OBLIGATORIO)'','''') d, compcc2.ID r'||unistr('\000a')||
'from   COM_PROVEEDORES_CAR compcc2'||unistr('\000a')||
'where  compcc2.COMPCT_ID = :P957_COMPCT_ID'||unistr('\000a')||
'and    compcc2.CANTIDAD_MAX > (select count(ID)'||unistr('\000a')||
'                               from (select * -- Cantidad de Cargos de Autoridades que estan vigentes'||unistr('\000a')||
'                                    from   COM_PROVEEDORES_AUT compra '||unistr('\000a')||
'                                    where  compra.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'                                    and    compra.SITUACION = ''VIG'''||unistr('\000a')||
'                                    and    compra.ID in (select max(compra2.ID)'||unistr('\000a')||
'                                                         from   COM_PROVEEDORES_AUT compra2'||unistr('\000a')||
'                                                         where  compra2.SITUACION not in (''ANU'',''NUE'')'||unistr('\000a')||
'                                                         and    compra2.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'                                                         group by compra2.TIPO_DOCUMENTO, compra2.NUMERO_DOCUMENTO, compra2.COMPRV_ID)'||unistr('\000a')||
'                                    -- y que no esten en los cargos obligatorios nuevos o marcados'||unistr('\000a')||
'                                    and    compra.COMPCC_ID not in (select compra.COMPCC_ID'||unistr('\000a')||
'                                                                    from   COM_PROVEEDORES_AUT compra'||unistr('\000a')||
'                                                                    where  compra.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'                                                                    and    compra.COMTPR_ID = :P957_ID'||unistr('\000a')||
'                                                                    and    compra.SITUACION in (''NUE'',''MAR'')'||unistr('\000a')||
'                                                                    and    compra.COMPCC_ID in (select compcc.ID'||unistr('\000a')||
'                                                                                                from   COM_PROVEEDORES_CAR compcc'||unistr('\000a')||
'                                                                                                where    compcc.COMPCT_ID = :P957_COMPCT_ID'||unistr('\000a')||
'                                                                                                and      compcc.OBLIGATORIO_SN = ''SI''))'||unistr('\000a')||
'                                    union all                                                         '||unistr('\000a')||
'                                    select * -- Cantidad de Cargos de Autornidades que han sido agregadas'||unistr('\000a')||
'                                    from   COM_PROVEEDORES_AUT compra'||unistr('\000a')||
'                                    where  compra.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'                                    and    compra.SITUACION = ''NUE'''||unistr('\000a')||
'                                    and    compra.COMTPR_ID = :P957_ID'||unistr('\000a')||
'                                    )'||unistr('\000a')||
'                                 where  COMPCC_ID = compcc2.ID)'||unistr('\000a')||
'and   :P957_OPERACION is null'||unistr('\000a')||
'union all'||unistr('\000a')||
'select NOMBRE||'' '' ||decode(compcc2.OBLIGATORIO_SN,''SI'',''(OBLIGATORIO)'','''') d, compcc2.ID r'||unistr('\000a')||
'from   COM_PROVEEDORES_CAR compcc2'||unistr('\000a')||
'where  compcc2.COMPCT_ID = :P957_COMPCT_ID'||unistr('\000a')||
'and    compcc2.ID = :P957_COMPCC_ID'||unistr('\000a')||
'and    :P957_OPERACION = ''EDITAR''');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49833312751433975 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_NOMBRE_AUTORIDAD',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 290,
  p_item_plug_id => 49819218865268789+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Nombre',
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
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49833500674439571 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_APELLIDO_AUTORIDAD',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 300,
  p_item_plug_id => 49819218865268789+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Apellido',
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
  p_id=>49833806268452156 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_TIPO_DOCUMENTO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 310,
  p_item_plug_id => 49819218865268789+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'DNI',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tipo Documento',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select RV_ABBREVIATION display_value, RV_LOW_VALUE return_value '||unistr('\000a')||
'from   CG_REF_CODES'||unistr('\000a')||
'where  RV_DOMAIN = ''COM_PROVEEDORES_AUT.TIPO_DOCUMENTO'''||unistr('\000a')||
'order by 1',
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
  p_id=>49834424334504582 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_NUMERO_DOCUMENTO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 320,
  p_item_plug_id => 49819218865268789+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Numero Documento',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_NUMBER_FIELD',
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
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_03 => 'right',
  p_show_quick_picks=>'N',
  p_item_comment => ''||unistr('\000a')||
'<div id="esagente" style="visibility: hidden;padding: 10px;border: 1px solid #606;margin-left: 10px;">''La Persona Ingresada es Agente del Estado Provincial por lo que no puede ser Inscripta como proveedor del estado según el Artículo 3° Decreto N° 4248 – MHyOP-2013 Inciso A''</div>');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49835023675520031 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_FECHA_INICIO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 330,
  p_item_plug_id => 49819218865268789+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha Inicio',
  p_format_mask=>'DD/MM/YYYY',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DATE_PICKER',
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
  p_id=>49835119285524348 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_CALCULAR_VENCIMIENTO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 340,
  p_item_plug_id => 49819218865268789+wwv_flow_api.g_id_offset,
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
  p_id=>49843211307148760 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_FECHA_VENCIMIENTO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 345,
  p_item_plug_id => 49819218865268789+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha Vencimiento',
  p_format_mask=>'DD/MM/YYYY',
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
  p_display_when=>'P957_FECHA_VENCIMIENTO',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
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
  p_id=>49899711985087418 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_OPERACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 360,
  p_item_plug_id => 49819007306255982+wwv_flow_api.g_id_offset,
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
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>50728204834148814 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_LIMPIAR_OPERACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 370,
  p_item_plug_id => 49819007306255982+wwv_flow_api.g_id_offset,
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
  p_id=>366690403996435359 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 957,
  p_name=>'P957_CONTROL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 380,
  p_item_plug_id => 49819218865268789+wwv_flow_api.g_id_offset,
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
  p_id => 49839805749090593 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P957_COMPCC_ID no es nulo',
  p_validation_sequence=> 10,
  p_validation => 'P957_COMPCC_ID',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#LABEL# debe tener algún valor.',
  p_always_execute=>'N',
  p_validation_condition=> 'P957_AGREGAR,P957_APLICAR_CAMBIOS',
  p_validation_condition_type=> 'REQUEST_IN_CONDITION',
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 49832923115413951 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 49840016304100842 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P957_NOMBRE_AUTORIDAD no es nulo',
  p_validation_sequence=> 20,
  p_validation => 'P957_NOMBRE_AUTORIDAD',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#LABEL# debe tener algún valor.',
  p_always_execute=>'N',
  p_validation_condition=> 'P957_AGREGAR,P957_APLICAR_CAMBIOS',
  p_validation_condition_type=> 'REQUEST_IN_CONDITION',
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 49833312751433975 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 49840602933107079 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P957_APELLIDO_AUTORIDAD no es nulo',
  p_validation_sequence=> 40,
  p_validation => 'P957_APELLIDO_AUTORIDAD',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#LABEL# debe tener algún valor.',
  p_always_execute=>'N',
  p_validation_condition=> 'P957_AGREGAR,P957_APLICAR_CAMBIOS',
  p_validation_condition_type=> 'REQUEST_IN_CONDITION',
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 49833500674439571 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 49840927291110964 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P957_TIPO_DOCUMENTO no es nulo',
  p_validation_sequence=> 50,
  p_validation => 'P957_TIPO_DOCUMENTO',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#LABEL# debe tener algún valor.',
  p_always_execute=>'N',
  p_validation_condition=> 'P957_AGREGAR,P957_APLICAR_CAMBIOS',
  p_validation_condition_type=> 'REQUEST_IN_CONDITION',
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 49833806268452156 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 49841221683113570 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P957_NUMERO_DOCUMENTO no es nulo',
  p_validation_sequence=> 60,
  p_validation => 'P957_NUMERO_DOCUMENTO',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#LABEL# debe tener algún valor.',
  p_always_execute=>'N',
  p_validation_condition=> 'P957_AGREGAR,P957_APLICAR_CAMBIOS',
  p_validation_condition_type=> 'REQUEST_IN_CONDITION',
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 49834424334504582 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 49841607881119950 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P957_FECHA_INICIO no es nulo',
  p_validation_sequence=> 70,
  p_validation => 'P957_FECHA_INICIO',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#LABEL# debe tener algún valor.',
  p_always_execute=>'N',
  p_validation_condition=> 'P957_AGREGAR,P957_APLICAR_CAMBIOS',
  p_validation_condition_type=> 'REQUEST_IN_CONDITION',
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 49835023675520031 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 49841921887128645 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'CargosObligatorios',
  p_validation_sequence=> 80,
  p_validation => 'declare'||unistr('\000a')||
'  cursor cr_compra(p_compcc_id number) is'||unistr('\000a')||
'    select count(compcc.COMPCC_ID) CANTIDAD'||unistr('\000a')||
'    from '||unistr('\000a')||
'        (select * -- Cargos de Autoridades que estan vigentes'||unistr('\000a')||
'         from   com_proveedores_aut compra'||unistr('\000a')||
'         where  compra.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'         and    compra.ID in (select max(compra2.ID)'||unistr('\000a')||
'                              from   COM_PROVEEDORES_AUT compra2 '||unistr('\000a')||
'                              where  compra2.SITUACION not in (''NUE'',''ANU'')'||unistr('\000a')||
'                                and  compra2.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'                              group by compra2.COMPCC_ID, compra2.NUMERO_DOCUMENTO, compra2.COMPRV_ID)'||unistr('\000a')||
'         and    compra.situacion in (''VIG'', ''MAR'')          '||unistr('\000a')||
'        and    compra.ID not in (select compra3.ID'||unistr('\000a')||
'                                 from   COM_PROVEEDORES_AUT compra3 '||unistr('\000a')||
'                                 where  compra3.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'                                 and    compra3.COMTPR_ID = :P957_ID'||unistr('\000a')||
'                                 and    compra3.SITUACION = ''MAR'')         '||unistr('\000a')||
'         union all                                                             '||unistr('\000a')||
'         select * -- Cargos de Autornidades que han sido agregadas'||unistr('\000a')||
'         from   COM_PROVEEDORES_AUT compra'||unistr('\000a')||
'         where  compra.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'         and    compra.SITUACION = ''NUE'''||unistr('\000a')||
'         and    compra.COMTPR_ID = :P957_ID) compcc'||unistr('\000a')||
'         where  compcc.COMPCC_ID = p_compcc_id;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  cursor cr_compcc is'||unistr('\000a')||
'    select compcc.ID'||unistr('\000a')||
'          ,compcc.CANTIDAD_MIN'||unistr('\000a')||
'          ,compcc.NOMBRE'||unistr('\000a')||
'    from   COM_PROVEEDORES_CAR compcc'||unistr('\000a')||
'    where    compcc.COMPCT_ID = :P957_COMPCT_ID'||unistr('\000a')||
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
  p_when_button_pressed=> 49819426148268793 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> 'declare'||unistr('\000a')||
'  cursor cr_compra is'||unistr('\000a')||
'    select count(ID)'||unistr('\000a')||
'    from '||unistr('\000a')||
'        -- Autoridades obligatorias ya vigentes'||unistr('\000a')||
'        (select compra.ID '||unistr('\000a')||
'        from   COM_PROVEEDORES_AUT compra'||unistr('\000a')||
'        where  compra.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'        and    compra.SITUACION = ''VIG'''||unistr('\000a')||
'        and    compra.COMPCC_ID in (select compcc.ID'||unistr('\000a')||
'                                    from   COM_PROVEEDORES_CAR compcc'||unistr('\000a')||
'                                    where    compcc.COMPCT_ID = :P957_COMPCT_ID'||unistr('\000a')||
'                                    and      compcc.OBLIGATORIO_SN = ''SI'')'||unistr('\000a')||
'        -- que pertences autoridades vigentes o de baja'||unistr('\000a')||
'        and    compra.ID in (select max(compra2.ID)'||unistr('\000a')||
'                             from   COM_PROVEEDORES_AUT compra2'||unistr('\000a')||
'                             where  compra2.SITUACION not in (''NUE'',''ANU'')'||unistr('\000a')||
'                             and    compra2.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'                             group by compra2.TIPO_DOCUMENTO, compra2.NUMERO_DOCUMENTO, compra2.COMPRV_ID)'||unistr('\000a')||
'        -- y que no esten en los cargos obligatorios nuevos o marcados'||unistr('\000a')||
'        and    compra.COMPCC_ID not in (select compra3.COMPCC_ID'||unistr('\000a')||
'                                        from   COM_PROVEEDORES_AUT compra3'||unistr('\000a')||
'                                        where  compra3.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'                                        and    compra3.COMTPR_ID = :P957_ID'||unistr('\000a')||
'                                        and    compra3.SITUACION in (''NUE'',''MAR'')'||unistr('\000a')||
'                                        and    compra3.COMPCC_ID in (select compcc.ID'||unistr('\000a')||
'                                                                    from   COM_PROVEEDORES_CAR compcc'||unistr('\000a')||
'                                                                    where    compcc.COMPCT_ID = :P957_COMPCT_ID'||unistr('\000a')||
'                                                                    and      compcc.OBLIGATORIO_SN = ''SI''))'||unistr('\000a')||
'        union all'||unistr('\000a')||
'        --  Autoridades obligatorias agregadas en el tramite actual'||unistr('\000a')||
'        select compra.ID'||unistr('\000a')||
'        from   COM_PROVEEDORES_AUT compra'||unistr('\000a')||
'        where  compra.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'        and    compra.COMTPR_ID = :P957_ID'||unistr('\000a')||
'        and    compra.SITUACION = ''NUE'''||unistr('\000a')||
'        and    compra.COMPCC_ID in (select compcc.ID'||unistr('\000a')||
'        from   COM_PROVEEDORES_CAR compcc'||unistr('\000a')||
'        where    compcc.COMPCT_ID = :P957_COMPCT_ID'||unistr('\000a')||
'        and      compcc.OBLIGATORIO_SN = ''SI''));'||unistr('\000a')||
'  --'||unistr('\000a')||
'  cursor cr_compcc is'||unistr('\000a')||
'    select count(compcc.ID)'||unistr('\000a')||
'    from   COM_PROVEEDORES_CAR compcc'||unistr('\000a')||
'    where    compcc.COMPCT_ID = :P957_COMPCT_ID'||unistr('\000a')||
'    and      compcc.OBLIGATORIO_SN = ''SI'';'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_compra_cant number;'||unistr('\000a')||
'  v_compcc_cant number;'||unistr('\000a')||
'  v_restantes number;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  open cr_compra;'||unistr('\000a')||
'  fetch cr_compra into v_compra_cant;'||unistr('\000a')||
'  close cr_compra;  '||unistr('\000a')||
'  --  '||unistr('\000a')||
'  open cr_compcc;'||unistr('\000a')||
'  fetch cr_compcc into v_compcc_cant;'||unistr('\000a')||
'  close cr_compcc;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  if nvl(v_compcc_cant, 0) <> nvl(v_compra_cant, 0) then'||unistr('\000a')||
'    v_restantes := nvl(v_compcc_cant, 0) - nvl(v_compra_cant, 0);'||unistr('\000a')||
'    return ''Aun quedan por registrar ''||v_restantes||'' cargo(s) obligatorio(s).'';    '||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  return null;'||unistr('\000a')||
'end;');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 51489325981415150 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'MaximoCargoSuperado',
  p_validation_sequence=> 85,
  p_validation => 'declare'||unistr('\000a')||
'  cursor cr_compra is'||unistr('\000a')||
'    select count(compcc.ID) '||unistr('\000a')||
'    from   (select * -- Cantidad de Cargos de Autoridades que estan vigentes'||unistr('\000a')||
'            from   COM_PROVEEDORES_AUT compra '||unistr('\000a')||
'            where  compra.COMPRV_ID = :P957_COMPRV_ID                                    '||unistr('\000a')||
'            and    compra.ID in (select max(compra2.ID)'||unistr('\000a')||
'                                  from   COM_PROVEEDORES_AUT compra2'||unistr('\000a')||
'                                  where  compra2.SITUACION not in (''ANU'',''NUE'')'||unistr('\000a')||
'                                  and    compra2.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'                                  group by compra2.COMPCC_ID, compra2.TIPO_DOCUMENTO, compra2.NUMERO_DOCUMENTO, compra2.COMPRV_ID)'||unistr('\000a')||
'            and    compra.situacion in (''VIG'', ''MAR'')                                                          '||unistr('\000a')||
'            and    compra.ID not in (select compra3.ID'||unistr('\000a')||
'                                     from   COM_PROVEEDORES_AUT compra3 '||unistr('\000a')||
'                                     where  compra3.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'                                     and    compra3.COMTPR_ID = :P957_ID'||unistr('\000a')||
'                                     and    compra3.SITUACION = ''MAR'')                                                         '||unistr('\000a')||
'            union all                                                         '||unistr('\000a')||
'            select * -- Cantidad de Cargos de Autornidades que han sido agregadas'||unistr('\000a')||
'            from   COM_PROVEEDORES_AUT compra'||unistr('\000a')||
'            where  compra.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'            and    compra.SITUACION = ''NUE'''||unistr('\000a')||
'            and    compra.COMTPR_ID = :P957_ID) compcc'||unistr('\000a')||
'where compcc.COMPCC_ID = :P957_COMPCC_ID;'||unistr('\000a')||
'--'||unistr('\000a')||
'  cursor cr_compcc is'||unistr('\000a')||
'    select compcc.CANTIDAD_MAX'||unistr('\000a')||
'    from COM_PROVEEDORES_CAR compcc'||unistr('\000a')||
'    where  compcc.ID = :P957_COMPCC_ID;'||unistr('\000a')||
'--'||unistr('\000a')||
' v_cargos_actuales number;'||unistr('\000a')||
' v_cargos_maximos number;'||unistr('\000a')||
'-- '||unistr('\000a')||
'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
'  open cr_compra;  '||unistr('\000a')||
'  fetch cr_compra into v_cargos_actuales;'||unistr('\000a')||
'  close cr_compra;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  open cr_compcc;'||unistr('\000a')||
'  fetch cr_compcc into v_cargos_maximos;'||unistr('\000a')||
'  close cr_compcc;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  if nvl(v_cargos_actuales, 0) >= nvl(v_cargos_maximos, 0) then'||unistr('\000a')||
'    return ''Se ha alcanzado la cantidad maxima de autoridades permitidas para este cargo.'';'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  '||unistr('\000a')||
'  return null;'||unistr('\000a')||
'end;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => '',
  p_always_execute=>'N',
  p_when_button_pressed=> 50724410269054829 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 51497921658654750 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'CargoMaximoSuperado',
  p_validation_sequence=> 87,
  p_validation => 'declare'||unistr('\000a')||
'  cursor cr_compcc is    '||unistr('\000a')||
'    select compcc.ID'||unistr('\000a')||
'          ,compcc.CANTIDAD_MAX'||unistr('\000a')||
'          ,compcc.NOMBRE'||unistr('\000a')||
'    from   COM_PROVEEDORES_CAR compcc'||unistr('\000a')||
'    where    compcc.COMPCT_ID = :P957_COMPCT_ID'||unistr('\000a')||
'    and      compcc.OBLIGATORIO_SN = ''SI'';'||unistr('\000a')||
'   --'||unistr('\000a')||
'  cursor cr_compra(p_compcc_id number) is'||unistr('\000a')||
'    select count(compcc.ID) '||unistr('\000a')||
'    from   (select * -- Cantidad de Cargos de Autoridades que estan vigentes'||unistr('\000a')||
'            from   COM_PROVEEDORES_AUT compra '||unistr('\000a')||
'            where  compra.COMPRV_ID = :P957_COMPRV_ID                                    '||unistr('\000a')||
'            and    compra.ID in (select max(compra2.ID)'||unistr('\000a')||
'                                  from   COM_PROVEEDORES_AUT compra2'||unistr('\000a')||
'                                  where  compra2.SITUACION not in (''ANU'',''NUE'')'||unistr('\000a')||
'                                  and    compra2.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'                                  group by compra2.COMPCC_ID, compra2.TIPO_DOCUMENTO, compra2.NUMERO_DOCUMENTO, compra2.COMPRV_ID)'||unistr('\000a')||
'            and    compra.situacion in (''VIG'', ''MAR'')                                                          '||unistr('\000a')||
'            and    compra.ID not in (select compra3.ID'||unistr('\000a')||
'                                     from   COM_PROVEEDORES_AUT compra3 '||unistr('\000a')||
'                                     where  compra3.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'                                     and    compra3.COMTPR_ID = :P957_ID'||unistr('\000a')||
'                                     and    compra3.SITUACION = ''MAR'')                                                         '||unistr('\000a')||
'            union all                                                         '||unistr('\000a')||
'            select * -- Cantidad de Cargos de Autornidades que han sido agregadas'||unistr('\000a')||
'            from   COM_PROVEEDORES_AUT compra'||unistr('\000a')||
'            where  compra.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'            and    compra.SITUACION = ''NUE'''||unistr('\000a')||
'            and    compra.COMTPR_ID = :P957_ID) compcc'||unistr('\000a')||
'where compcc.COMPCC_ID = p_compcc_id;'||unistr('\000a')||
'--'||unistr('\000a')||
' v_cargos_actuales number;'||unistr('\000a')||
' v_cargos_maximos number;'||unistr('\000a')||
'--    '||unistr('\000a')||
'  v_mensaje varchar2(2000) := null;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  for v_compcc in cr_compcc loop'||unistr('\000a')||
'    --'||unistr('\000a')||
'    v_cargos_maximos := v_compcc.CANTIDAD_MAX;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    open cr_compra(v_compcc.ID);'||unistr('\000a')||
'    fetch cr_compra into v_cargos_actuales;'||unistr('\000a')||
'    close cr_compra;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    if nvl(v_cargos_actuales, 0) > nvl(v_cargos_maximos, 0) then'||unistr('\000a')||
'      v_mensaje := v_mensaje||''Para el cargo ''||v_compcc.NOMBRE||'' la cantidad maxima es de ''||v_cargos_maximos||'' autoridades permitidas y ha registrado ''||v_cargos_actuales||''<br/>'';       '||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end loop;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  return v_mensaje;'||unistr('\000a')||
'  --'||unistr('\000a')||
'end;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => '',
  p_always_execute=>'N',
  p_when_button_pressed=> 49819426148268793 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 49842209594134407 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P957_COMPCC_ID no es nulo',
  p_validation_sequence=> 90,
  p_validation => 'P957_COMPCC_ID',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Para calcular la fecha de vencimiento, Cargo debe tener algún valor.',
  p_always_execute=>'N',
  p_when_button_pressed=> 49835119285524348 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 49832923115413951 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 49843716458176735 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P957_FECHA_VENCIMIENTO',
  p_validation_sequence=> 100,
  p_validation => 'P957_FECHA_VENCIMIENTO',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#LABEL# debe tener algún valor.',
  p_always_execute=>'N',
  p_when_button_pressed=> 50724410269054829 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 49843211307148760 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 50938216875714820 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'cambiosRealizados',
  p_validation_sequence=> 110,
  p_validation => 'declare'||unistr('\000a')||
'  cursor cr_compra is'||unistr('\000a')||
'  	select 1'||unistr('\000a')||
'    from com_proveedores_aut_v'||unistr('\000a')||
'    where comtpr_id = :P957_ID'||unistr('\000a')||
'    and   situacion in (''NUE'',''MAR'');'||unistr('\000a')||
'    '||unistr('\000a')||
'    '||unistr('\000a')||
'v_compra number;'||unistr('\000a')||
''||unistr('\000a')||
'begin'||unistr('\000a')||
''||unistr('\000a')||
'  open cr_compra;'||unistr('\000a')||
'  fetch cr_compra into v_compra;'||unistr('\000a')||
'  close cr_compra;'||unistr('\000a')||
'  '||unistr('\000a')||
'  if v_compra is null then'||unistr('\000a')||
'  	return ''No se ha realizado ninguna modificación'';'||unistr('\000a')||
'  else '||unistr('\000a')||
'  	return null;'||unistr('\000a')||
'  end if; '||unistr('\000a')||
'end;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => '',
  p_always_execute=>'N',
  p_when_button_pressed=> 49819426148268793 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 56418830560914728 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Cargo Vencido',
  p_validation_sequence=> 120,
  p_validation => 'declare '||unistr('\000a')||
'	v_fecha date;'||unistr('\000a')||
'begin'||unistr('\000a')||
'    v_fecha := :P957_FECHA_VENCIMIENTO;'||unistr('\000a')||
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
  p_validation_condition=> 'P957_AGREGAR',
  p_validation_condition_type=> 'REQUEST_EQUALS_CONDITION',
  p_only_for_changed_rows=> 'Y',
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 56550623409236965 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Autoridad Duplicada',
  p_validation_sequence=> 130,
  p_validation => '    select compra.COMPCC_ID'||unistr('\000a')||
'    from   COM_PROVEEDORES_AUT_V compra'||unistr('\000a')||
'    where  compra.TIPO_DOCUMENTO = :P957_TIPO_DOCUMENTO'||unistr('\000a')||
'    and    compra.NUMERO_DOCUMENTO = :P957_NUMERO_DOCUMENTO'||unistr('\000a')||
'    and    compra.COMPCC_ID = :P957_COMPCC_ID'||unistr('\000a')||
'    and    compra.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'    and    compra.COMTPR_ID <> :P957_ID'||unistr('\000a')||
'    and    compra.ID in (select max(compra2.ID)'||unistr('\000a')||
'                    from   COM_PROVEEDORES_AUT_V compra2'||unistr('\000a')||
'                    where  compra2.SITUACION not in (''NUE'',''ANU'')'||unistr('\000a')||
'                    and    compra2.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'                    group by compra2.COMPCC_ID, compra2.TIPO_DOCUMENTO, compra2.NUMERO_DOCUMENTO, compra2.COMPRV_ID)'||unistr('\000a')||
'    and    compra.SITUACION in (''VIG'',''MAR'')'||unistr('\000a')||
'    UNION'||unistr('\000a')||
'    select compra.COMPCC_ID'||unistr('\000a')||
'    from   COM_PROVEEDORES_AUT compra'||unistr('\000a')||
'    where  compra.TIPO_DOCUMENTO = :P957_TIPO_DOCUMENTO'||unistr('\000a')||
'    and    compra.NUMERO_DOCUMENTO = :P957_NUMERO_DOCUMENTO'||unistr('\000a')||
'    and    compra.COMPCC_ID = :P957_COMPCC_ID'||unistr('\000a')||
'    and    compra.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'    and    compra.COMTPR_ID = :P957_ID'||unistr('\000a')||
'    and    compra.SITUACION = ''NUE'';',
  p_validation_type => 'NOT_EXISTS',
  p_error_message => 'Ya se ha registrado esta autoridad con este cargo.',
  p_always_execute=>'N',
  p_when_button_pressed=> 50724410269054829 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 80228400829020229 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Revertir baja',
  p_validation_sequence=> 140,
  p_validation => 'declare'||unistr('\000a')||
'  cursor cr_compra_nue (p_compcc_id number) is'||unistr('\000a')||
'    select id id'||unistr('\000a')||
'    from com_proveedores_aut'||unistr('\000a')||
'    where comtpr_id = :P957_ID'||unistr('\000a')||
'    and   compcc_id = p_compcc_id '||unistr('\000a')||
'    and   situacion = ''NUE'';'||unistr('\000a')||
''||unistr('\000a')||
'v_compra_nue cr_compra_nue%rowtype;'||unistr('\000a')||
'v_compra com_proveedores_aut%rowtype;'||unistr('\000a')||
'begin'||unistr('\000a')||
'--'||unistr('\000a')||
'COMPRV_PKG.COMPRA_SET(p_id => :P957_COMPRA_ID);'||unistr('\000a')||
'COMPRV_PKG.COMPRA_GET(p_compra => v_compra);'||unistr('\000a')||
'COMPRV_PKG.COMPRA_INI;'||unistr('\000a')||
'--'||unistr('\000a')||
'open cr_compra_nue(v_compra.compcc_id);'||unistr('\000a')||
'fetch cr_compra_nue into v_compra_nue;'||unistr('\000a')||
'close cr_compra_nue;'||unistr('\000a')||
'--'||unistr('\000a')||
'if v_compra_nue.id is not null then'||unistr('\000a')||
'    return '' Para poder revertir la baja de una autoridad, debe eliminar la nueva autoridad registrada para el cargo.'';'||unistr('\000a')||
'end if;'||unistr('\000a')||
''||unistr('\000a')||
'end;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => '',
  p_always_execute=>'N',
  p_validation_condition=> 'REVERTIR',
  p_validation_condition_type=> 'REQUEST_EQUALS_CONDITION',
  p_only_for_changed_rows=> 'Y',
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 366254327452653864 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'ValidarSiEsAgenteDelEstado',
  p_validation_sequence=> 150,
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
'   V_NRO_DOC := trim( replace(replace(:P957_NUMERO_DOCUMENTO,''-'',''''),'' '','''') );'||unistr('\000a')||
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
'      return ''La Persona Ingresada ('' || V_RAZONSOCIAL || '') es Agente del Estado Provincial por lo que no puede ser Inscripta como proveedor del estado según el Artículo 3° Decreto N° 4248 – MHyOP-2013 Inciso A'';'||unistr('\000a')||
'   else'||unistr('\000a')||
'      return V_MOTIVO_ERROR;'||unistr('\000a')||
'   end if;'||unistr('\000a')||
'   --'||unistr('\000a')||
'end;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => '',
  p_always_execute=>'N',
  p_validation_condition_type=> 'NEVER',
  p_when_button_pressed=> 50724410269054829 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 49834424334504582 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 366368820006159193 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 957
 ,p_name => 'ValidarAgenteDelEstado_vieja'
 ,p_event_sequence => 10
 ,p_triggering_element_type => 'ITEM'
 ,p_triggering_element => 'P957_NUMERO_DOCUMENTO'
 ,p_triggering_condition_type => 'JAVASCRIPT_EXPRESSION'
 ,p_triggering_expression => '$v(''P957_NUMERO_DOCUMENTO'') != '''''
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'focusout'
 ,p_display_when_type => 'NEVER'
  );
wwv_flow_api.create_page_da_action (
  p_id => 366369123268159229 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 957
 ,p_event_id => 366368820006159193 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
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
'   V_NRO_DOC := trim( replace(replace(:P957_NUMERO_DOCUMENTO,''-'',''''),'' '','''') );'||unistr('\000a')||
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
'                                 , P_MOTIVO_ERROR     => V_MOTIVO_ERROR);'||unistr('\000a')||
'   --'||unistr('\000a')||
'   if V_RAZONSOCIAL is not null then'||unistr('\000a')||
'      --'||unistr('\000a')||
'      :P957_APELLIDO_AUTORIDAD := V_RAZONSOCIAL;'||unistr('\000a')||
'      --'||unistr('\000a')||
'   end if;'||unistr('\000a')||
'   --'||unistr('\000a')||
'end;'
 ,p_attribute_02 => 'P957_NUMERO_DOCUMENTO'
 ,p_attribute_03 => 'P957_APELLIDO_AUTORIDAD'
 ,p_attribute_04 => 'N'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 366369312140159231 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 957
 ,p_event_id => 366368820006159193 + wwv_flow_api.g_id_offset
 ,p_event_result => 'FALSE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => '$(''#esagente'').css({''visibility'': ''hidden''});'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 366369622134169723 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 957
 ,p_event_id => 366368820006159193 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => 'if($v(''P957_APELLIDO_AUTORIDAD'') != '''')'||unistr('\000a')||
'   $(''#esagente'').css({''visibility'': ''visible''});'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 366626227806013146 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 957
 ,p_name => 'ValidarAgenteDelEstado'
 ,p_event_sequence => 20
 ,p_triggering_element_type => 'ITEM'
 ,p_triggering_element => 'P957_NUMERO_DOCUMENTO'
 ,p_triggering_condition_type => 'JAVASCRIPT_EXPRESSION'
 ,p_triggering_expression => '$v(''P957_NUMERO_DOCUMENTO'') != '''''
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'focusout'
 ,p_display_when_type => 'NEVER'
  );
wwv_flow_api.create_page_da_action (
  p_id => 366628308690013303 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 957
 ,p_event_id => 366626227806013146 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 5
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => '$(''#P957_CONTROL'').val('''');'||unistr('\000a')||
'$(''#P957_APELLIDO_AUTORIDAD'').val('''');'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 366628506772013309 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 957
 ,p_event_id => 366626227806013146 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => '$(''#processing'').css({''visibility'': ''visible''});'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 366628926656013309 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 957
 ,p_event_id => 366626227806013146 + wwv_flow_api.g_id_offset
 ,p_event_result => 'FALSE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => '$(''#uSuccessMessage'').css({''visibility'': ''hidden''});'||unistr('\000a')||
'$("#t13MessageHolder").empty();'||unistr('\000a')||
'$("#t13MessageHolder").html("<span></span>");'||unistr('\000a')||
'$(''#P957_CONTROL'').val('''');'||unistr('\000a')||
'$(''#P957_APELLIDO_AUTORIDAD'').val('''');'||unistr('\000a')||
''
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 366628707157013309 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 957
 ,p_event_id => 366626227806013146 + wwv_flow_api.g_id_offset
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
'   V_NRO_DOC := trim( replace(replace(:P957_NUMERO_DOCUMENTO,''-'',''''),'' '','''') );'||unistr('\000a')||
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
'      :P957_APELLIDO_AUTORIDAD := V_RAZONSOCIAL;'||unistr('\000a')||
'      :P957_CONTROL  := '''';'||unistr('\000a')||
'      --'||unistr('\000a')||
'   else if V_MOTIVO_ERROR is not null then'||unistr('\000a')||
'           --'||unistr('\000a')||
'           :P957_APELLIDO_AUTORIDAD := '''';'||unistr('\000a')||
'           :P957_CONTROL  := ''ERROR'';'||unistr('\000a')||
'           -- '||unistr('\000a')||
'        else'||unistr('\000a')||
'           --'||unistr('\000a')||
'           :P957_APELLIDO_AUTORIDAD := '''';'||unistr('\000a')||
'           :P957_CONTROL  := '''';'||unistr('\000a')||
'           -- '||unistr('\000a')||
'       end if;'||unistr('\000a')||
'       -- '||unistr('\000a')||
'   end if;'||unistr('\000a')||
''||unistr('\000a')||
'      '||unistr('\000a')||
'   --'||unistr('\000a')||
'end;'
 ,p_attribute_02 => 'P957_NUMERO_DOCUMENTO'
 ,p_attribute_03 => 'P957_APELLIDO_AUTORIDAD,P957_CONTROL'
 ,p_attribute_04 => 'N'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 366629106088013309 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 957
 ,p_event_id => 366626227806013146 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 30
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => 'if ($v(''P957_APELLIDO_AUTORIDAD'') != '''') {'||unistr('\000a')||
'   var messageHtml = '''';'||unistr('\000a')||
''||unistr('\000a')||
'   messageHtml = ''<section class="uRegion uWhiteRegion uMessageRegion clearfix" '';'||unistr('\000a')||
'   messageHtml += '' id="uSuccessMessage">'';'||unistr('\000a')||
'   messageHtml += ''  <div class="t13Notification uRegionContent clearfix" style="border: 1px solid #f00 !important;">'';'||unistr('\000a')||
'   messageHtml += ''    <a href="javascript:void(0)" '';'||unistr('\000a')||
'   messageHtml += ''      onclick="$x_Remove(\''uSuccessMessage\'')" '';'||unistr('\000a')||
'   messageHtml += ''      class="uCloseMessage"></a>'';'||unistr('\000a')||
'   messageHtml += ''    <img src="/i/alert_error.gif" class="uCheckmarkIcon" alt="" />'';'||unistr('\000a')||
'   messageHtml += ''    <div class="uMessageText">'';'||unistr('\000a')||
''||unistr('\000a')||
'   if($v(''P957_CONTROL'') == ''ERROR''){'||unistr('\000a')||
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
'if ($v(''P957_CONTROL'') == ''ES_AGENTE'') {'||unistr('\000a')||
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
p:=p||'COM_PKG.COMTPR_CREAR(P_COMPRV_ID   => :P957_COMPRV_ID'||unistr('\000a')||
'                    ,P_COMTPR_TIPO => ''AIAU'''||unistr('\000a')||
'                    ,P_COMTPR_ID   => :P957_ID'||unistr('\000a')||
'                    ,P_RESULTADO   => :P957_RESULTADO'||unistr('\000a')||
');';

wwv_flow_api.create_page_process(
  p_id     => 49838413248711823 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'GenerarCabeceraTramite',
  p_process_sql_clob => p,
  p_process_error_message=> 'No se pudo generar la cabecera del tramite con éxito.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P957_ID',
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
p:=p||'F|#OWNER#:COM_TRAMITES_PRV:P957_ID:ID';

wwv_flow_api.create_page_process(
  p_id     => 49825031408268870 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from COM_TRAMITES_PRV',
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
p:=p||'#OWNER#:COM_TRAMITES_PRV:P957_ID:ID|U';

wwv_flow_api.create_page_process(
  p_id     => 49825215628268873 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'DML_PROCESS_ROW',
  p_process_name=> 'Process Row of COM_TRAMITES_PRV',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> 'Acción procesada.',
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
'  cursor cr_compra is'||unistr('\000a')||
'    select *'||unistr('\000a')||
'    from   COM_PROVEEDORES_AUT compra'||unistr('\000a')||
'    where    compra.ID = :P957_COMPRA_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_compra cr_compra%rowtype;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
'  open cr_compra;'||unistr('\000a')||
'  fetch cr_compra into v_compra;'||unistr('\000a')||
'  close cr_compra;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  if v_compra.ID is not null then'||unistr('\000a')||
'    /*'||unistr('\000a')||
'    if v_compra.SITUACION = ''NUE'' then'||unistr('\000a')||
'      delete COM_PROVEEDORES_AUT compra'||unistr('\000a')||
'      where  compra.ID = :P957_COMPR';

p:=p||'A_ID'||unistr('\000a')||
'      AND    compra.TIPO_DOCUMENTO = v_compra.TIPO_DOCUMENTO'||unistr('\000a')||
'      and    compra.NUMERO_DOCUMENTO = v_compra.NUMERO_DOCUMENTO'||unistr('\000a')||
'      and    compra.COMTPR_ID = :P957_ID     '||unistr('\000a')||
'      and    compra.SITUACION in (''NUE'', ''MAR'');'||unistr('\000a')||
'      --'||unistr('\000a')||
'    else'||unistr('\000a')||
'      v_compra.ID := null;'||unistr('\000a')||
'      v_compra.SITUACION := ''MAR'';'||unistr('\000a')||
'      v_compra.COMTPR_ID := :P957_ID;'||unistr('\000a')||
'      v_compra.FECHA_SITUACION := sysdate;      '||unistr('\000a')||
'      -';

p:=p||'-'||unistr('\000a')||
'      COMPRV_PKG.COMPRA_INS(p_compra => v_compra);'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    */'||unistr('\000a')||
'    --'||unistr('\000a')||
'    insert into com_proveedores_aut_est(compra_id,situacion,fecha_situacion)'||unistr('\000a')||
'    values (v_compra.id, ''BAJ'', sysdate);'||unistr('\000a')||
'    --'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  :P957_LIMPIAR_OPERACION := ''SI'';'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 49844210065231400 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'EliminarAutoridad',
  p_process_sql_clob => p,
  p_process_error_message=> 'No se puede eliminar la autoridad con éxito.',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=>'',
  p_process_when_type=>'NEVER',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'Solicitud = ELIMINAR');
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
'  cursor cr_compra is'||unistr('\000a')||
'    select *'||unistr('\000a')||
'    from   COM_PROVEEDORES_AUT compra'||unistr('\000a')||
'    where    compra.ID = :P957_COMPRA_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_compra cr_compra%rowtype;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
'  open cr_compra;'||unistr('\000a')||
'  fetch cr_compra into v_compra;'||unistr('\000a')||
'  close cr_compra;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  if v_compra.ID is not null then'||unistr('\000a')||
'    if v_compra.SITUACION = ''NUE'' then'||unistr('\000a')||
'      delete COM_PROVEEDORES_AUT compra'||unistr('\000a')||
'      where  compra.ID = :P957_COMPRA_ID'||unistr('\000a')||
'  ';

p:=p||'    AND    compra.TIPO_DOCUMENTO = v_compra.TIPO_DOCUMENTO'||unistr('\000a')||
'      and    compra.NUMERO_DOCUMENTO = v_compra.NUMERO_DOCUMENTO'||unistr('\000a')||
'      and    compra.COMTPR_ID = :P957_ID     '||unistr('\000a')||
'      and    compra.SITUACION in (''NUE'', ''MAR'');'||unistr('\000a')||
'      --'||unistr('\000a')||
'    else'||unistr('\000a')||
'      v_compra.ID := null;'||unistr('\000a')||
'      v_compra.SITUACION := ''MAR'';'||unistr('\000a')||
'      v_compra.COMTPR_ID := :P957_ID;'||unistr('\000a')||
'      v_compra.FECHA_SITUACION := sysdate;      '||unistr('\000a')||
'      --'||unistr('\000a')||
'     ';

p:=p||' COMPRV_PKG.COMPRA_INS(p_compra => v_compra);'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  :P957_LIMPIAR_OPERACION := ''SI'';'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 364838009554143657 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_process_sequence=> 21,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'EliminarAutoridadOriginal',
  p_process_sql_clob => p,
  p_process_error_message=> 'No se puede eliminar la autoridad con éxito.',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=>'ELIMINAR',
  p_process_when_type=>'REQUEST_EQUALS_CONDITION',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'Solicitud=Expresion1'||unistr('\000a')||
'ELIMINAR');
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
p:=p||'update COM_PROVEEDORES_AUT compra'||unistr('\000a')||
'set    compra.SITUACION = ''ANU'''||unistr('\000a')||
'where  compra.ID = :P957_COMPRA_ID'||unistr('\000a')||
'and    compra.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'and    compra.SITUACION = ''MAR'''||unistr('\000a')||
'and    compra.COMTPR_ID = :P957_ID;';

wwv_flow_api.create_page_process(
  p_id     => 50816320849607890 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_process_sequence=> 25,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'RevertirBaja',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=>'REVERTIR',
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
p:=p||'declare'||unistr('\000a')||
'  cursor cr_compra is'||unistr('\000a')||
'    select *'||unistr('\000a')||
'    from   COM_PROVEEDORES_AUT compra'||unistr('\000a')||
'    where  compra.ID = :P957_COMPRA_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_compra cr_compra%rowtype;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
'  open cr_compra;'||unistr('\000a')||
'  fetch cr_compra into v_compra;'||unistr('\000a')||
'  close cr_compra;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  :P957_COMPCC_ID := v_compra.COMPCC_ID;'||unistr('\000a')||
'  :P957_NOMBRE_AUTORIDAD := v_compra.NOMBRE;'||unistr('\000a')||
'  :P957_APELLIDO_AUTORIDAD := v_compra.APELLIDO;'||unistr('\000a')||
'  :P957_TIPO_DOCUMENTO ';

p:=p||':= v_compra.TIPO_DOCUMENTO;'||unistr('\000a')||
'  :P957_NUMERO_DOCUMENTO := v_compra.NUMERO_DOCUMENTO;'||unistr('\000a')||
'  :P957_FECHA_INICIO := v_compra.FECHA_INICIO;'||unistr('\000a')||
'  :P957_FECHA_VENCIMIENTO := null;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 49899024990054260 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'EditarAutoridad',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=>'',
  p_process_when_type=>'NEVER',
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
'  cursor cr_compra is'||unistr('\000a')||
'    select *'||unistr('\000a')||
'    from   COM_PROVEEDORES_AUT compra'||unistr('\000a')||
'    where    compra.ID = :P957_COMPRA_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_compra COM_PROVEEDORES_AUT%rowtype;'||unistr('\000a')||
'  t_compra COM_PROVEEDORES_AUT%rowtype;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_compra.COMPRV_ID        := :P957_COMPRV_ID;'||unistr('\000a')||
'  v_compra.COMPCC_ID        := :P957_COMPCC_ID;'||unistr('\000a')||
'  v_compra.COMPDO_ID        := :P957_COMPDO_ID;'||unistr('\000a')||
'  v_compra.COMTPR_ID        := :P957_';

p:=p||'ID;'||unistr('\000a')||
'  v_compra.NOMBRE           := upper(:P957_NOMBRE_AUTORIDAD);'||unistr('\000a')||
'  v_compra.APELLIDO         := upper(:P957_APELLIDO_AUTORIDAD);'||unistr('\000a')||
'  v_compra.TIPO_DOCUMENTO   := :P957_TIPO_DOCUMENTO;'||unistr('\000a')||
'  v_compra.NUMERO_DOCUMENTO := :P957_NUMERO_DOCUMENTO;'||unistr('\000a')||
'  v_compra.FECHA_INICIO     := :P957_FECHA_INICIO;  '||unistr('\000a')||
'  --'||unistr('\000a')||
'  if :P957_FECHA_VENCIMIENTO = ''INDEFINIDO'' then'||unistr('\000a')||
'    v_compra.FECHA_VENCIMIENTO := null;'||unistr('\000a')||
'  else'||unistr('\000a')||
'    v_co';

p:=p||'mpra.FECHA_VENCIMIENTO := :P957_FECHA_VENCIMIENTO;'||unistr('\000a')||
'  end if;  '||unistr('\000a')||
'  --'||unistr('\000a')||
'  open cr_compra;'||unistr('\000a')||
'  fetch cr_compra into t_compra;'||unistr('\000a')||
'  close cr_compra;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  t_compra.ID := null;'||unistr('\000a')||
'  t_compra.SITUACION := ''MAR'';'||unistr('\000a')||
'  t_compra.COMTPR_ID := :P957_ID;'||unistr('\000a')||
'  t_compra.FECHA_VENCIMIENTO := sysdate;'||unistr('\000a')||
'  t_compra.DATE_CREATED := null;'||unistr('\000a')||
'  t_compra.CREATED_BY := null;'||unistr('\000a')||
'  t_compra.DATE_MODIFIED := null;'||unistr('\000a')||
'  t_compra.MODIFIED_BY := null';

p:=p||';'||unistr('\000a')||
'  --'||unistr('\000a')||
'	COMPRV_PKG.COMPRA_INS(p_compra => t_compra);'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_compra.SITUACION := ''NUE'';'||unistr('\000a')||
'  v_compra.FECHA_SITUACION := sysdate;'||unistr('\000a')||
'  v_compra.COMPDO_ID := t_compra.COMPDO_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  COMPRV_PKG.COMPRA_INS(p_compra => v_compra);'||unistr('\000a')||
'  --'||unistr('\000a')||
'  :P957_LIMPIAR_OPERACION := ''SI'';'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 50715502744409157 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_process_sequence=> 40,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ModificarAutoridad',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>50714004027277131 + wwv_flow_api.g_id_offset,
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
p:=p||':P957_LIMPIAR_OPERACION := ''SI'';';

wwv_flow_api.create_page_process(
  p_id     => 50737711307755245 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_process_sequence=> 50,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'CancelarEdicion',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>50725408453073181 + wwv_flow_api.g_id_offset,
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
'  cursor cr_compra is'||unistr('\000a')||
'    select *'||unistr('\000a')||
'    from   COM_PROVEEDORES_AUT compra'||unistr('\000a')||
'    where    compra.ID = :P957_COMPRA_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_compra COM_PROVEEDORES_AUT%rowtype;'||unistr('\000a')||
'  t_compra COM_PROVEEDORES_AUT%rowtype;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_compra.COMPRV_ID        := :P957_COMPRV_ID;'||unistr('\000a')||
'  v_compra.COMPCC_ID        := :P957_COMPCC_ID;'||unistr('\000a')||
'  v_compra.COMPDO_ID        := :P957_COMPDO_ID;'||unistr('\000a')||
'  v_compra.COMTPR_ID        := :P957_';

p:=p||'ID;'||unistr('\000a')||
'  v_compra.NOMBRE           := upper(:P957_NOMBRE_AUTORIDAD);'||unistr('\000a')||
'  v_compra.APELLIDO         := upper(:P957_APELLIDO_AUTORIDAD);'||unistr('\000a')||
'  v_compra.TIPO_DOCUMENTO   := :P957_TIPO_DOCUMENTO;'||unistr('\000a')||
'  v_compra.NUMERO_DOCUMENTO := :P957_NUMERO_DOCUMENTO;'||unistr('\000a')||
'  v_compra.FECHA_INICIO     := :P957_FECHA_INICIO;  '||unistr('\000a')||
'  v_compra.SITUACION := ''NUE'';'||unistr('\000a')||
'  v_compra.FECHA_SITUACION := sysdate;  '||unistr('\000a')||
'  --'||unistr('\000a')||
'  if :P957_FECHA_VENCIMIENTO = ''';

p:=p||'INDEFINIDO'' then'||unistr('\000a')||
'    v_compra.FECHA_VENCIMIENTO := null;'||unistr('\000a')||
'  else'||unistr('\000a')||
'    v_compra.FECHA_VENCIMIENTO := :P957_FECHA_VENCIMIENTO;'||unistr('\000a')||
'  end if;  '||unistr('\000a')||
'  --'||unistr('\000a')||
'  COMPRV_PKG.COMPRA_INS(p_compra => v_compra);'||unistr('\000a')||
'  --'||unistr('\000a')||
'  :P957_LIMPIAR_OPERACION := ''SI'';'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 49845909813288051 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_process_sequence=> 60,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AgregarAutoridad',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>50724410269054829 + wwv_flow_api.g_id_offset,
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
'  cursor cr_compcc is'||unistr('\000a')||
'    select compcc.DURACION_MANDATO_MAX'||unistr('\000a')||
'    from   COM_PROVEEDORES_CAR_V compcc'||unistr('\000a')||
'    where  compcc.ID = :P957_COMPCC_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_duracion_mandato number;'||unistr('\000a')||
'  v_vencimiento varchar2(20);'||unistr('\000a')||
'  v_inicio date;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
'  open cr_compcc;'||unistr('\000a')||
'  fetch cr_compcc into v_duracion_mandato;'||unistr('\000a')||
'  close cr_compcc;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  if v_duracion_mandato is not null then'||unistr('\000a')||
'    v_vencimiento := to_char(add_';

p:=p||'months(:P957_FECHA_INICIO, v_duracion_mandato * 12),''DD/MM/YYYY'');'||unistr('\000a')||
'    :P957_FECHA_VENCIMIENTO := v_vencimiento;'||unistr('\000a')||
'  else'||unistr('\000a')||
'    :P957_FECHA_VENCIMIENTO := ''INDEFINIDO'';'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 49846725920330606 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_process_sequence=> 70,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'CalcularFechaVencimiento',
  p_process_sql_clob => p,
  p_process_error_message=> 'No se pudo calcular la fecha de vencimiento con éxito.',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>49835119285524348 + wwv_flow_api.g_id_offset,
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
p:=p||'update COM_PROVEEDORES_AUT compra'||unistr('\000a')||
'set    compra.SITUACION = ''ANU'''||unistr('\000a')||
'where  compra.COMPRV_ID = :P957_COMPRV_ID'||unistr('\000a')||
'and   compra.COMTPR_ID = :P957_ID'||unistr('\000a')||
'and   compra.SITUACION = ''MAR'';';

wwv_flow_api.create_page_process(
  p_id     => 50073011995322915 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_process_sequence=> 80,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'CancelarTramite',
  p_process_sql_clob => p,
  p_process_error_message=> 'No se pudieron anular los cambios realizados.',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>49819631521268793 + wwv_flow_api.g_id_offset,
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
p:=p||':P957_COMPCC_ID := null;'||unistr('\000a')||
':P957_NOMBRE_AUTORIDAD := null;'||unistr('\000a')||
':P957_APELLIDO_AUTORIDAD := null;'||unistr('\000a')||
':P957_TIPO_DOCUMENTO := null;'||unistr('\000a')||
':P957_NUMERO_DOCUMENTO := null;'||unistr('\000a')||
':P957_FECHA_INICIO := null;'||unistr('\000a')||
':P957_FECHA_VENCIMIENTO := null;'||unistr('\000a')||
':P957_OPERACION := null;'||unistr('\000a')||
'--'||unistr('\000a')||
':P957_LIMPIAR_OPERACION := ''NO'';';

wwv_flow_api.create_page_process(
  p_id     => 50729914854387326 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 957,
  p_process_sequence=> 90,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'LimpiarOperacion',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=>'P957_LIMPIAR_OPERACION',
  p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_process_when2=>'SI',
  p_process_when_type2=>'',
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
-- ...updatable report columns for page 957
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
