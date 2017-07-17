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
--   Date and Time:   09:54 Viernes Mayo 19, 2017
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

PROMPT ...Remove page 309
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>309);
 
end;
/

 
--application/pages/page_00309
prompt  ...PAGE 309: Pedidos de Compra - Detalle - Gestionar Detalles
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 309
 ,p_user_interface_id => 70527406842675 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'ADMINISTRACION'
 ,p_name => 'Pedidos de Compra - Detalle - Gestionar Detalles'
 ,p_step_title => 'Pedidos de Compra - Detalle - Gestionar'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Gestionar Detalle'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 15859511172273146 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'<script language="JavaScript" type="text/javascript">'||unistr('\000a')||
'<!--'||unistr('\000a')||
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'||unistr('\000a')||
''||unistr('\000a')||
'  function traePrecio(pThis, pThat, pSN, pFoco)'||unistr('\000a')||
' {'||unistr('\000a')||
''||unistr('\000a')||
'   //*************************************************'||unistr('\000a')||
'  html_GetElement(''P309_DESC_RO'').innerHTML = html_GetElement(''P309_COMCIT_ID'').value;'||unistr('\000a')||
'   //*************************************************'||unistr('\000a')||
''||unistr('\000a')||
'  var get = new htmldb_Get(null,$x(''pFlowId'||
''').value,''APPLICATION_PROCESS=traerPrecio_p309'',0);'||unistr('\000a')||
''||unistr('\000a')||
'  get.add(pThis,html_GetElement(pThis).value);'||unistr('\000a')||
'  gReturn = get.get();  '||unistr('\000a')||
''||unistr('\000a')||
'  if(gReturn)'||unistr('\000a')||
'    {  '||unistr('\000a')||
'       html_GetElement(pThat).value = gReturn;'||unistr('\000a')||
'       html_GetElement(pSN).value = ''NO''; // = ''SI''; Se modifica por Solicitus de Compras      '||unistr('\000a')||
''||unistr('\000a')||
'       html_GetElement(pThat).style.backgroundColor = ''#ebebe4'';'||unistr('\000a')||
'       document.getElementById(pThat).readO'||
'nly = false;  // = true; Se modifica por Solicitus de Compras      '||unistr('\000a')||
'    }'||unistr('\000a')||
'    else'||unistr('\000a')||
'    {'||unistr('\000a')||
'       html_GetElement(pThat).value = '''';'||unistr('\000a')||
'       html_GetElement(pSN).value = ''NO'';'||unistr('\000a')||
'       html_GetElement(pThat).style.backgroundColor = '''';   '||unistr('\000a')||
'       document.getElementById(pThat).readOnly = false;  '||unistr('\000a')||
'    }'||unistr('\000a')||
'  document.getElementById(pFoco).focus();  '||unistr('\000a')||
'  get = null;'||unistr('\000a')||
' }'||unistr('\000a')||
''||unistr('\000a')||
' function sacarFoco(pSN, pThat)'||unistr('\000a')||
' {'||unistr('\000a')||
'  if '||
'(html_GetElement(pSN).value == ''SI'')'||unistr('\000a')||
'  {'||unistr('\000a')||
'    document.getElementById(pThat).focus();'||unistr('\000a')||
'  }'||unistr('\000a')||
' }'||unistr('\000a')||
''||unistr('\000a')||
'//-->'||unistr('\000a')||
'</script>'||unistr('\000a')||
''
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'CTISSERA'
 ,p_last_upd_yyyymmddhh24miss => '20170519095350'
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
'     ,(SELECT C';

s:=s||'ANTIDAD * PRECIO_UNITARIO'||unistr('\000a')||
'         FROM COM_PEDIDOS_DETALLES '||unistr('\000a')||
'        WHERE COMPED_ID = COMCOB_V.COMPED_ID'||unistr('\000a')||
'          AND ID = COMCOB_V.ID)'||unistr('\000a')||
'            PRECIO_TOTAL '||unistr('\000a')||
'     , COMCOB_V.OBSERVACION'||unistr('\000a')||
'     , COMCIT_V.COMCTP_PRECIO'||unistr('\000a')||
' FROM COM_PEDIDOS_DETALLES COMCOB_V'||unistr('\000a')||
'     ,COM_CATALOGO_ITEMS_V COMCIT_V '||unistr('\000a')||
'WHERE COMCOB_V.COMPED_ID = :P309_COMPED_ID'||unistr('\000a')||
'  AND COMCOB_V.COMCIT_ID = COMCIT_V.ID(+)'||unistr('\000a')||
'ORDER BY COMCOB_V.R';

s:=s||'ENGLON';

wwv_flow_api.create_report_region (
  p_id=> 16135417204638916 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 309,
  p_name=> '&P1_COMETQ_PRO. solicitados',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 30,
  p_region_attributes=>'style="width:900px"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_1',
  p_item_display_point=> 'BELOW',
  p_source=> s,
  p_source_type=> 'UPDATABLE_SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 142033676269227104+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '10',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> '-',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se ha encontrado ningún dato.',
  p_query_num_rows_type=> 'ROW_RANGES_WITH_LINKS',
  p_query_row_count_max=> '999999',
  p_pagination_display_position=> 'TOP_AND_BOTTOM_LEFT',
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
  p_id=> 16137324803638929 + wwv_flow_api.g_id_offset,
  p_region_id=> 16135417204638916 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'CHECK$01',
  p_column_display_sequence=> 1,
  p_column_heading=> '&nbsp;',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'CHECKBOX',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_derived_column=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 16135718057638927 + wwv_flow_api.g_id_offset,
  p_region_id=> 16135417204638916 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'HIDDEN',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source_type=> 'T',
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_PEDIDOS_DETALLES',
  p_ref_column_name=> 'ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 16135906408638929 + wwv_flow_api.g_id_offset,
  p_region_id=> 16135417204638916 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_ID',
  p_column_display_sequence=> 12,
  p_column_heading=> 'Comped Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'TEXT',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_PEDIDOS_DETALLES',
  p_ref_column_name=> 'COMPED_ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 16136022453638929 + wwv_flow_api.g_id_offset,
  p_region_id=> 16135417204638916 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
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
  p_lov_show_nulls=> 'NO',
  p_column_width=> '5',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_PEDIDOS_DETALLES',
  p_ref_column_name=> 'RENGLON',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 16136114651638929 + wwv_flow_api.g_id_offset,
  p_region_id=> 16135417204638916 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
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
  p_display_as=>'TEXT',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_PEDIDOS_DETALLES',
  p_ref_column_name=> 'COMCCL_ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 16136219634638929 + wwv_flow_api.g_id_offset,
  p_region_id=> 16135417204638916 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
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
  p_display_as=>'TEXT',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_PEDIDOS_DETALLES',
  p_ref_column_name=> 'COMCIT_ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 16136331152638929 + wwv_flow_api.g_id_offset,
  p_region_id=> 16135417204638916 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
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
  p_lov_show_nulls=> 'NO',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_PEDIDOS_DETALLES',
  p_ref_column_name=> 'CODIGO',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20943407142275049 + wwv_flow_api.g_id_offset,
  p_region_id=> 16135417204638916 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'COMCOB_DESCRIPCION',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Descripción',
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
  p_id=> 16136505134638929 + wwv_flow_api.g_id_offset,
  p_region_id=> 16135417204638916 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'CANTIDAD',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Cantidad',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_column_width=> '10',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_PEDIDOS_DETALLES',
  p_ref_column_name=> 'CANTIDAD',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 16136613979638929 + wwv_flow_api.g_id_offset,
  p_region_id=> 16135417204638916 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'PRECIO_UNITARIO',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Precio Unitario',
  p_column_format=> 'FML999G999G999G999G990D00',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_column_width=> '10',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_PEDIDOS_DETALLES',
  p_ref_column_name=> 'PRECIO_UNITARIO',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 16135603025638922 + wwv_flow_api.g_id_offset,
  p_region_id=> 16135417204638916 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'PRECIO_TOTAL',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Precio Total Ref.',
  p_column_format=> 'FML999G999G999G999G990D00',
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
  p_id=> 16136723878638929 + wwv_flow_api.g_id_offset,
  p_region_id=> 16135417204638916 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'OBSERVACION',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Observación',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_column_width=> '15',
  p_column_height=> '4',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_PEDIDOS_DETALLES',
  p_ref_column_name=> 'OBSERVACION',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20943530101275049 + wwv_flow_api.g_id_offset,
  p_region_id=> 16135417204638916 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'COMCTP_PRECIO',
  p_column_display_sequence=> 13,
  p_column_heading=> 'Comctp Precio',
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 16137806614638929 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 309,
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
' WHERE ID = :P309_COMPED_ID;'||unistr('\000a')||
' --'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
' --'||unistr('\000a')||
' FOR v_comped IN cr_comped LOOP'||unistr('\000a')||
'   htp.print(''<table><tr><td>Número : <b>''||v_comped.CODIGO ||''</b></td>'');'||unistr('\000a')||
'   htp.';

s:=s||'print(''<td>Fecha de Solicitud : <b>''||v_comped.FECHA_SOLICITUD ||''</b></td>'');'||unistr('\000a')||
'   htp.print(''<td>Expediente : <b>''||v_comped.Expediente ||''</b><br></td></tr>'');'||unistr('\000a')||
'   htp.print(''<tr><td colspan="5">&P1_COMETQ_CONS. : <b>''||v_comped.Contratante||''</b><br></td></tr>'');'||unistr('\000a')||
'   htp.print(''<tr><td colspan="5">&P1_COMETQ_COBS. : <b>''||v_comped.COMCOB_NOMBRE ||''</b></td></tr></table>'');'||unistr('\000a')||
' END LOOP;'||unistr('\000a')||
' --'||unistr('\000a')||
'END;'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 16145823725651508 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 309,
  p_plug_name=> 'Datos Solicitud',
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
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 16148906502703290 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 309,
  p_plug_name=> 'Datos &P1_COMETQ_PROS.',
  p_region_name=>'',
  p_region_attributes=> 'style="width:900px"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_1',
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
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 16139312735638974 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 309,
  p_button_sequence=> 50,
  p_button_plug_id => 16148906502703290+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Agregar',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:this.disabled=true;'||unistr('\000a')||
'this.value=''Procesando...'';'||unistr('\000a')||
'doSubmit(''CREATE'');',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P309_ID',
  p_button_condition_type=> 'ITEM_IS_NULL',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 16139125292638974 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 309,
  p_button_sequence=> 40,
  p_button_plug_id => 16148906502703290+wwv_flow_api.g_id_offset,
  p_button_name    => 'SAVE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Aplicar Cambios',
  p_button_position=> 'REGION_TEMPLATE_CHANGE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_condition=> 'P309_ID',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_database_action=>'UPDATE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 16146125335651510 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 309,
  p_button_sequence=> 10,
  p_button_plug_id => 16145823725651508+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Retornar',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:301:&SESSION.::&DEBUG.:310,311,312,313,314::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 31631311393227407 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 309,
  p_button_sequence=> 60,
  p_button_plug_id => 16135417204638916+wwv_flow_api.g_id_offset,
  p_button_name    => 'EDITAR_CANT',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Editar Valores',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 16138308539638972 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 309,
  p_button_sequence=> 70,
  p_button_plug_id => 16135417204638916+wwv_flow_api.g_id_offset,
  p_button_name    => 'MULTI_ROW_DELETE',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Suprimir',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:confirmDelete(htmldb_delete_message,''MULTI_ROW_DELETE'');',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>31631623390227408 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 309,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:319:&SESSION.::&DEBUG.:RP,319:P319_ID:&P309_COMPED_ID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>31631311393227407+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>16144510202639013 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 309,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:309:&SESSION.::&DEBUG.::P309_COMPED_ID,P309_COMCOB_ID:&P309_COMPED_ID.,&P309_COMCOB_ID.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 30,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 06-ABR-2009 11:39 by FVALLEJO');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>16139516370638974 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 309,
  p_name=>'P309_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Id',
  p_source=>'ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
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
  p_id=>16139701474638980 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 309,
  p_name=>'P309_RENGLON',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 2,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Renglón',
  p_source=>'RENGLON',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 8,
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
  p_id=>16139919114638980 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 309,
  p_name=>'P309_COMCCL_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 16148906502703290+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'&P1_COMETQ_CCLS. :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select lpad(codigo,3,''0'')||'' - ''||nombre d, id r'||unistr('\000a')||
'from com_catalogo_clases_v comccl_v'||unistr('\000a')||
'where comcob_id = :P309_COMCOB_ID'||unistr('\000a')||
'  and situacion = ''HAB'''||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'- SELECCIONE UN VALOR -',
  p_lov_null_value=> '0',
  p_cSize=> 68,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 4,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'REDIRECT_SET_VALUE',
  p_attribute_02 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>16140113194638982 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 309,
  p_name=>'P309_COMCIT_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 16148906502703290+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'&P1_COMETQ_PROS. :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_POPUP_LOV',
  p_lov=> 'select to_char(CODIGO,''0000'')||'' - ''||DESCRIPCION d, ID r'||unistr('\000a')||
'from COM_CATALOGO_ITEMS_V'||unistr('\000a')||
'where SITUACION = ''VIG'''||unistr('\000a')||
'  and COMCOB_ID = :P309_COMCOB_ID'||unistr('\000a')||
'  and COMCCL_ID = :P309_COMCCL_ID'||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 87,
  p_cMaxlength=> 2000,
  p_cHeight=> 3,
  p_tag_attributes  => 'onChange="traePrecio(''P309_COMCIT_ID'',''P309_PRECIO_UNITARIO'',''P309_PRECIO_TESTIGO_SN'',''P309_CANTIDAD'')";',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P309_CON_NOMENCLADOR',
  p_display_when2=>'SI',
  p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'NOT_ENTERABLE',
  p_attribute_02 => 'FIRST_ROWSET',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>16140331597638982 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 309,
  p_name=>'P309_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 3,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Código',
  p_source=>'CODIGO',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 100,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P309_CON_NOMENCLADOR',
  p_display_when2=>'SI',
  p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
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
  p_id=>16140524371638982 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 309,
  p_name=>'P309_DESCRIPCION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 16148906502703290+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Descripción :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 87,
  p_cMaxlength=> 2000,
  p_cHeight=> 3,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 3,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P309_CON_NOMENCLADOR',
  p_display_when2=>'NO',
  p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>16140714285638982 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 309,
  p_name=>'P309_CANTIDAD',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 16148906502703290+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Cantidad :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 10,
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
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
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
  p_id=>16140919008638982 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 309,
  p_name=>'P309_PRECIO_UNITARIO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 16148906502703290+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Precio Referencia :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 10,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_tag_attributes  => 'onFocus="sacarFoco(''P309_PRECIO_TESTIGO_SN'',''P309_OBSERVACION'')";',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when=>'P309_PRECIO_TESTIGO_SN',
  p_read_only_when2=>'SI',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
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
  p_id=>16141102570638982 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 309,
  p_name=>'P309_OBSERVACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 100,
  p_item_plug_id => 16148906502703290+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Observación :',
  p_source=>'OBSERVACION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 10,
  p_cMaxlength=> 10,
  p_cHeight=> 3,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 2,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039553452227115+wwv_flow_api.g_id_offset,
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
  p_id=>16141309080638982 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 309,
  p_name=>'P309_SITUACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 110,
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
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
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
  p_id=>16141523844638982 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 309,
  p_name=>'P309_COMCOB_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 5,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'&P1_COMETQ_COB. :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 70,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
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
h := null;
h:=h||'Opciones:<br>'||unistr('\000a')||
' SI, se cargará el detalle usando el Nomenclador de &P1_COMETQ_PRD..<br>'||unistr('\000a')||
' NO, cargará el detalle del renglon sin Nomenclador. ';

wwv_flow_api.create_page_item(
  p_id=>16141704983638982 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 309,
  p_name=>'P309_CON_NOMENCLADOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 16148906502703290+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'SI',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Esta nomenclado<br>el &P1_COMETQ_PROS.? :',
  p_source=>'SI',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_RADIOGROUP',
  p_named_lov=> 'COMCOB_SOLO_ITEMS_NOMENCLADOS_SN',
  p_lov=> 'select RV_ABBREVIATION d, RV_LOW_VALUE r'||unistr('\000a')||
'from   CG_REF_CODES'||unistr('\000a')||
'where RV_DOMAIN = ''COM_CATALOGO_OBJETOS.SOLO_ITEMS_NOMENCLADOS_SN'''||unistr('\000a')||
'order by 1',
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
  p_read_only_when=>'declare'||unistr('\000a')||
'  cursor cr_comcob is'||unistr('\000a')||
'  select SOLO_ITEMS_NOMENCLADOS_SN'||unistr('\000a')||
'    from COM_CATALOGO_OBJETOS'||unistr('\000a')||
'   where ID = :P309_COMCOB_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_solo_items_nomenclados_sn VARCHAR2(2);'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_comcob;'||unistr('\000a')||
'  FETCH cr_comcob INTO v_solo_items_nomenclados_sn ;'||unistr('\000a')||
'  CLOSE cr_comcob;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  IF v_solo_items_nomenclados_sn = ''SI'' THEN'||unistr('\000a')||
'    RETURN TRUE;'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'    RETURN FALSE;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'end;',
  p_read_only_when_type=>'FUNCTION_BODY',
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'N',
  p_help_text=> h,
  p_attribute_01 => '2',
  p_attribute_02 => 'REDIRECT_SET_VALUE',
  p_attribute_04 => 'VERTICAL',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>16146602516664265 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 309,
  p_name=>'P309_COMPED_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 120,
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
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
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
  p_id=>16163828871324801 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 309,
  p_name=>'P309_DATOS_URL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 130,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Datos Url',
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
  p_id=>20408523460756332 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 309,
  p_name=>'P309_OBTN_PRECIO_TESTIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 65,
  p_item_plug_id => 16148906502703290+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'Obtener Precio Testigo',
  p_prompt=>'Obtener Precio Testigo',
  p_source=>'Obtener Precio Testigo',
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
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P309_COMCCL_ID',
  p_display_when_type=>'NEVER',
  p_is_persistent=> 'N',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>20408710432761996 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 309,
  p_name=>'P309_PRECIO_TESTIGO_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 140,
  p_item_plug_id => 16148906502703290+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Precio Testigo Sn',
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
  p_attribute_01 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>31488910027743726 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 309,
  p_name=>'P309_COMZON_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 135,
  p_item_plug_id => 16148906502703290+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'comzon Id',
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
  p_id=>31631102043224712 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 309,
  p_name=>'P309_DESC_RO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 35,
  p_item_plug_id => 16148906502703290+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 87,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
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
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_item_comment => 'nowrap="nowrap"');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 18747108928628001 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 309,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P309_PRECIO_UNITARIO Not Null',
  p_validation_sequence=> 1,
  p_validation => 'P309_PRECIO_UNITARIO',
  p_validation_type => 'ITEM_NOT_NULL_OR_ZERO',
  p_error_message => 'Debe indicar un valor.',
  p_when_button_pressed=> 16139312735638974 + wwv_flow_api.g_id_offset,
  p_associated_item=> 16140919008638982 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> 'generated 29-ABR-2009 12:23');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 16142706082639008 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 309,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Validar Con Nomenclador - Item Seleccionado',
  p_validation_sequence=> 10,
  p_validation => '(:P309_CON_NOMENCLADOR = ''SI'' AND :P309_COMCIT_ID IS NOT NULL) OR'||unistr('\000a')||
'(:P309_CON_NOMENCLADOR = ''NO'' AND :P309_COMCIT_ID IS NULL)',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'Debe seleccionar un valor',
  p_when_button_pressed=> 16139312735638974 + wwv_flow_api.g_id_offset,
  p_associated_item=> 16140714285638982 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 16142915359639008 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 309,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P309_CANTIDAD Not null',
  p_validation_sequence=> 20,
  p_validation => 'P309_CANTIDAD',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Debe indicar un valor.',
  p_when_button_pressed=> 16139312735638974 + wwv_flow_api.g_id_offset,
  p_associated_item=> 16140714285638982 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 16143112061639008 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 309,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P309_COMCCL_ID no nulo o cero',
  p_validation_sequence=> 30,
  p_validation => 'P309_COMCCL_ID',
  p_validation_type => 'ITEM_NOT_NULL_OR_ZERO',
  p_error_message => 'Debe seleccionar un valor',
  p_when_button_pressed=> 16139312735638974 + wwv_flow_api.g_id_offset,
  p_associated_item=> 16139919114638980 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 16143317202639008 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 309,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Validar Sin Nomenclador - Descripcion',
  p_validation_sequence=> 40,
  p_validation => '(:P309_CON_NOMENCLADOR = ''SI'') OR'||unistr('\000a')||
'(:P309_CON_NOMENCLADOR = ''NO'' AND :P309_DESCRIPCION IS NOT NULL)',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'Debe indicar un valor',
  p_when_button_pressed=> 16139312735638974 + wwv_flow_api.g_id_offset,
  p_associated_item=> 16140524371638982 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 16142309036639002 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 309,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P309_CANTIDAD numerico',
  p_validation_sequence=> 50,
  p_validation => 'P309_CANTIDAD',
  p_validation_type => 'ITEM_IS_NUMERIC',
  p_error_message => 'Debe indicar un número.',
  p_when_button_pressed=> 16139312735638974 + wwv_flow_api.g_id_offset,
  p_associated_item=> 16140714285638982 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 16142526052639008 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 309,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P309_PRECIO_UNITARIO es numerico',
  p_validation_sequence=> 60,
  p_validation => 'P309_PRECIO_UNITARIO',
  p_validation_type => 'ITEM_IS_NUMERIC',
  p_error_message => 'Debe indicar un número.',
  p_when_button_pressed=> 16139312735638974 + wwv_flow_api.g_id_offset,
  p_associated_item=> 16140919008638982 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 5672009763474846 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 309,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Validar ACTUALIZAR Pedido - Editar Cant',
  p_validation_sequence=> 70,
  p_validation => 'DECLARE'||unistr('\000a')||
' CURSOR cr_comped IS'||unistr('\000a')||
' SELECT * FROM COM_PEDIDOS_V'||unistr('\000a')||
' WHERE ID = :P309_COMPED_ID;'||unistr('\000a')||
' --'||unistr('\000a')||
' v_comped cr_comped%ROWTYPE;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  OPEN cr_comped;'||unistr('\000a')||
'  FETCH cr_comped INTO  v_comped;'||unistr('\000a')||
'  CLOSE cr_comped;'||unistr('\000a')||
'  -- '||unistr('\000a')||
'  IF v_comped.COMPEE_ESTADO IN (''PAU'',''RCH'')'||unistr('\000a')||
'   THEN'||unistr('\000a')||
'     RETURN TRUE;'||unistr('\000a')||
'   ELSE     '||unistr('\000a')||
'     RETURN FALSE;'||unistr('\000a')||
'  END IF;   '||unistr('\000a')||
'END;',
  p_validation_type => 'FUNC_BODY_RETURNING_BOOLEAN',
  p_error_message => 'Acción no permitida para el estado actual de la &P1_COMETQ_PEDS..',
  p_when_button_pressed=> 31631311393227407 + wwv_flow_api.g_id_offset,
  p_associated_item=> 20408710432761996 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 5676126152687760 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 309,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Validar ACTUALIZAR Pedido - Agregar',
  p_validation_sequence=> 80,
  p_validation => 'DECLARE'||unistr('\000a')||
' CURSOR cr_comped IS'||unistr('\000a')||
' SELECT * FROM COM_PEDIDOS_V'||unistr('\000a')||
' WHERE ID = :P309_COMPED_ID;'||unistr('\000a')||
' --'||unistr('\000a')||
' v_comped cr_comped%ROWTYPE;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  OPEN cr_comped;'||unistr('\000a')||
'  FETCH cr_comped INTO  v_comped;'||unistr('\000a')||
'  CLOSE cr_comped;'||unistr('\000a')||
'  -- '||unistr('\000a')||
'  IF v_comped.COMPEE_ESTADO IN (''PAU'',''RCH'')'||unistr('\000a')||
'   THEN'||unistr('\000a')||
'     RETURN TRUE;'||unistr('\000a')||
'   ELSE     '||unistr('\000a')||
'     RETURN FALSE;'||unistr('\000a')||
'  END IF;   '||unistr('\000a')||
'END;',
  p_validation_type => 'FUNC_BODY_RETURNING_BOOLEAN',
  p_error_message => 'Acción no permitida para el estado actual de la &P1_COMETQ_PEDS..',
  p_when_button_pressed=> 16139312735638974 + wwv_flow_api.g_id_offset,
  p_associated_item=> 20408710432761996 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 5676508621692151 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 309,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Validar ACTUALIZAR Pedido - Suprimir',
  p_validation_sequence=> 90,
  p_validation => 'DECLARE'||unistr('\000a')||
' CURSOR cr_comped IS'||unistr('\000a')||
' SELECT * FROM COM_PEDIDOS_V'||unistr('\000a')||
' WHERE ID = :P309_COMPED_ID;'||unistr('\000a')||
' --'||unistr('\000a')||
' v_comped cr_comped%ROWTYPE;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  OPEN cr_comped;'||unistr('\000a')||
'  FETCH cr_comped INTO  v_comped;'||unistr('\000a')||
'  CLOSE cr_comped;'||unistr('\000a')||
'  -- '||unistr('\000a')||
'  IF v_comped.COMPEE_ESTADO IN (''PAU'',''RCH'')'||unistr('\000a')||
'   THEN'||unistr('\000a')||
'     RETURN TRUE;'||unistr('\000a')||
'   ELSE     '||unistr('\000a')||
'     RETURN FALSE;'||unistr('\000a')||
'  END IF;   '||unistr('\000a')||
'END;',
  p_validation_type => 'FUNC_BODY_RETURNING_BOOLEAN',
  p_error_message => 'Acción no permitida para el estado actual de la &P1_COMETQ_PEDS..',
  p_when_button_pressed=> 16138308539638972 + wwv_flow_api.g_id_offset,
  p_associated_item=> 20408710432761996 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
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
'  v_compet COM_PEDIDOS_DETALLES%ROWTYPE;'||unistr('\000a')||
'  v_clase VARCHAR2(200);'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  v_compet.COMPED_ID := :P309_COMPED_ID;'||unistr('\000a')||
'  SELECT NVL(MAX(RENGLON),0)+1'||unistr('\000a')||
'  INTO :P309_RENGLON'||unistr('\000a')||
'  FROM COM_PEDIDOS_DETALLES'||unistr('\000a')||
'  WHERE COMPED_ID = :P309_COMPED_ID;'||unistr('\000a')||
'  --     '||unistr('\000a')||
'  v_compet.RENGLON   := :P309_RENGLON;    '||unistr('\000a')||
'  v_compet.COMCCL_ID := :P309_COMCCL_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  IF :P309_CON_NOMENCLADOR = ''SI'' AND :P309_COMCIT_ID IS NOT NU';

p:=p||'LL THEN'||unistr('\000a')||
'    --'||unistr('\000a')||
'    SELECT CODIGO_COMPLETO'||unistr('\000a')||
'          ,DESCRIPCION'||unistr('\000a')||
'    INTO :P309_CODIGO'||unistr('\000a')||
'        ,:P309_DESCRIPCION'||unistr('\000a')||
'    FROM COM_CATALOGO_ITEMS_V'||unistr('\000a')||
'    WHERE ID = :P309_COMCIT_ID;'||unistr('\000a')||
'    --'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'    :P309_CODIGO := NULL;'||unistr('\000a')||
'    :P309_COMCIT_ID := NULL;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  SELECT nombre INTO v_clase'||unistr('\000a')||
'  FROM com_catalogo_clases_v comccl_v'||unistr('\000a')||
'  WHERE comccl_v.id = :P309_COMCCL_ID; '||unistr('\000a')||
''||unistr('\000a')||
'  v_compet.COMCIT_ID       := :P309_C';

p:=p||'OMCIT_ID;'||unistr('\000a')||
'  v_compet.CODIGO          := :P309_CODIGO;'||unistr('\000a')||
'  v_compet.DESCRIPCION     := v_clase||''-''||:P309_DESCRIPCION;   '||unistr('\000a')||
'  v_compet.CANTIDAD        := :P309_CANTIDAD;'||unistr('\000a')||
'  v_compet.PRECIO_UNITARIO := :P309_PRECIO_UNITARIO;'||unistr('\000a')||
'  v_compet.OBSERVACION     := :P309_OBSERVACION;'||unistr('\000a')||
'  v_compet.SITUACION       := ''NUE'';'||unistr('\000a')||
'  --'||unistr('\000a')||
'  COM_PKG.INS_COMPET(p_compet => v_compet);'||unistr('\000a')||
'  --'||unistr('\000a')||
'  :P309_COMCCL_ID := NULL;'||unistr('\000a')||
'  :P309_COMCIT';

p:=p||'_ID := NULL;'||unistr('\000a')||
'  :P309_DESCRIPCION := NULL;'||unistr('\000a')||
'  :P309_CANTIDAD := NULL;'||unistr('\000a')||
'  :P309_PRECIO_UNITARIO := NULL;'||unistr('\000a')||
'  :P309_OBSERVACION := NULL;'||unistr('\000a')||
''||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 16143613011639008 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 309,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Agregar Detalle Pedido de Compras',
  p_process_sql_clob => p,
  p_process_error_message=> 'El detalle no ha podido ser agregado al pedido. Verifique el mensaje de error asociado.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>16139312735638974 + wwv_flow_api.g_id_offset,
  p_process_success_message=> 'El detalle ha sido agregado exitosamente al pedido.',
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
p:=p||'#OWNER#:COM_PEDIDOS_DETALLES:ID';

wwv_flow_api.create_page_process(
  p_id     => 16143827376639008 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 309,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_region_id=> 16135417204638916 + wwv_flow_api.g_id_offset,
  p_process_type=> 'MULTI_ROW_DELETE',
  p_process_name=> 'ApplyMRD',
  p_process_sql_clob => p,
  p_process_error_message=> 'No se ha podido procesar la supresión.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'MULTI_ROW_DELETE',
  p_process_when_type=>'REQUEST_EQUALS_CONDITION',
  p_process_success_message=> '#MRD_COUNT# fila(s) suprimida(s).',
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
' CURSOR cr_pedidos_det IS'||unistr('\000a')||
'  SELECT * FROM COM_PEDIDOS_DETALLES'||unistr('\000a')||
'  WHERE COMPED_ID = :P309_COMPED_ID'||unistr('\000a')||
'  ORDER BY RENGLON; '||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_renglon NUMBER := 1;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  FOR v_pedidos_det IN cr_pedidos_det LOOP'||unistr('\000a')||
'   UPDATE COM_PEDIDOS_DETALLES'||unistr('\000a')||
'   SET RENGLON = v_renglon'||unistr('\000a')||
'   WHERE ID = v_pedidos_det.ID;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   v_renglon := v_renglon + 1;'||unistr('\000a')||
'  END LOOP; '||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 16144004589639010 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 309,
  p_process_sequence=> 50,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ReIndexar_Renglones',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>16138308539638972 + wwv_flow_api.g_id_offset,
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
p:=p||':P309_DATOS_URL :=  owa_util.get_cgi_env(''QUERY_STRING'');';

wwv_flow_api.create_page_process(
  p_id     => 16163522292322910 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 309,
  p_process_sequence=> 60,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'RECUPERARDATOSURL',
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
p:=p||'BEGIN'||unistr('\000a')||
'  IF INSTR(:P309_DATOS_URL,''P309_COMCOB_ID'')>0 THEN'||unistr('\000a')||
'   :P309_COMCCL_ID := NULL;'||unistr('\000a')||
'   :P309_COMCIT_ID := NULL;'||unistr('\000a')||
'  ELSIF INSTR(:P309_DATOS_URL,''P309_COMCCL_ID'')>0 THEN'||unistr('\000a')||
'    :P309_COMCIT_ID := NULL;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 16164030172344051 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 309,
  p_process_sequence=> 60,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'LIMPIAR_COMBOS',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'',
  p_process_when_type=>'NEVER',
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
'   v_comped com_pedidos%rowtype;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  -- Obtener Domicilio de la Solicitud'||unistr('\000a')||
'  COM_PKG.SET_COMPED(p_id => :P309_COMPED_ID);'||unistr('\000a')||
'  COM_PKG.GET_COMPED(p_comped => v_comped);'||unistr('\000a')||
'  COM_PKG.INI_COMPED;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  :P309_COMZON_ID := COMCAT_PKG.COMZON_OBTN_ID(v_comped.comdom_id);'||unistr('\000a')||
'  --'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 31490301342864203 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 309,
  p_process_sequence=> 60,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Obtener Zona',
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
' CURSOR cr_comcit IS'||unistr('\000a')||
'  select SOLO_ITEMS_NOMENCLADOS_SN'||unistr('\000a')||
'  from COM_CATALOGO_ITEMS_V'||unistr('\000a')||
'  where SITUACION = ''VIG'''||unistr('\000a')||
'    and COMCOB_ID = :P309_COMCOB_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
' open cr_comcit;'||unistr('\000a')||
' fetch cr_comcit into :P309_CON_NOMENCLADOR;'||unistr('\000a')||
' close cr_comcit;'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 20704118565613832 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 309,
  p_process_sequence=> 90,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'DeterminarUsoNomenclador',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P309_CON_NOMENCLADOR',
  p_process_when_type=>'ITEM_IS_NULL',
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
p:=p||':P309_PRECIO_UNITARIO := REPLACE(:P309_PRECIO_UNITARIO,''.'','','');';

wwv_flow_api.create_page_process(
  p_id     => 5952926361306860 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 309,
  p_process_sequence=> 60,
  p_process_point=> 'ON_SUBMIT_BEFORE_COMPUTATION',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Convertir precio unitario',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>16139312735638974 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 309
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
