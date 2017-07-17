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
--   Date and Time:   15:09 Miércoles Abril 5, 2017
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

PROMPT ...Remove page 312
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>312);
 
end;
/

 
--application/pages/page_00312
prompt  ...PAGE 312: Pedido de Compra - Crear - Paso 4
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 312
 ,p_user_interface_id => 70527406842675 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'ADMINISTRACION'
 ,p_name => 'Pedido de Compra - Crear - Paso 4'
 ,p_step_title => 'Pedido de Compra - Crear - Paso 4'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Crear Pedido de Compra'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 15859511172273146 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'<script language="JavaScript" type="text/javascript">'||unistr('\000a')||
'<!--'||unistr('\000a')||
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"''; '||unistr('\000a')||
' function traePrecio(pThis, pThat, pSN, pFoco)'||unistr('\000a')||
' {'||unistr('\000a')||
'   //*************************************************'||unistr('\000a')||
'  html_GetElement(''P312_DESC_RO'').innerHTML = html_GetElement(''P312_COMCIT_ID'').value;'||unistr('\000a')||
'   //*************************************************'||unistr('\000a')||
''||unistr('\000a')||
'  var get = new htmldb_Get(null,$x(''pFlowId'')'||
'.value,''APPLICATION_PROCESS=traerPrecio_p312'',0);'||unistr('\000a')||
''||unistr('\000a')||
'  get.add(pThis,html_GetElement(pThis).value);'||unistr('\000a')||
'  gReturn = get.get();  '||unistr('\000a')||
'  '||unistr('\000a')||
' if(gReturn)'||unistr('\000a')||
'    {  '||unistr('\000a')||
'       html_GetElement(pThat).value = gReturn;'||unistr('\000a')||
'       html_GetElement(pSN).value = ''NO''; // = ''SI''; Se modifica por Solicitus de Compras      '||unistr('\000a')||
''||unistr('\000a')||
'       html_GetElement(pThat).style.backgroundColor = ''#ebebe4'';'||unistr('\000a')||
'       document.getElementById(pThat).readOn'||
'ly = false;  // = true; Se modifica por Solicitus de Compras      '||unistr('\000a')||
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
' '||unistr('\000a')||
' function sacarFoco(pSN, pThat)'||unistr('\000a')||
' {'||unistr('\000a')||
'  if '||
'(html_GetElement(pSN).value == ''SI'')'||unistr('\000a')||
'  {'||unistr('\000a')||
'    document.getElementById(pThat).focus();'||unistr('\000a')||
'  }'||unistr('\000a')||
' }'||unistr('\000a')||
' //-->'||unistr('\000a')||
'</script>'
 ,p_required_role => 7397805760876468 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'CTISSERA'
 ,p_last_upd_yyyymmddhh24miss => '20170309113138'
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
  p_id=> 15273500427362824 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 312,
  p_plug_name=> 'Paso 4 : &P1_COMETQ_PRO.',
  p_region_name=>'',
  p_region_attributes=> 'style="width:90%"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
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
  p_plug_header=> '<b>Expediente:</b> &P310_EXPEDIENTE. <br>'||unistr('\000a')||
'<b>&P1_COMETQ_CONS.:</b> &P310_CONTRATANTE. <br>',
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
s:=s||'SELECT COMCOB_V.ID'||unistr('\000a')||
'     , COMCOB_V.COMPED_ID'||unistr('\000a')||
'     , COMCOB_V.RENGLON'||unistr('\000a')||
'     , COMCOB_V.COMCCL_ID'||unistr('\000a')||
'     , COMCOB_V.COMCIT_ID'||unistr('\000a')||
'     , COMCOB_V.CODIGO'||unistr('\000a')||
'     ,(SELECT C.NOMBRE FROM COM_CATALOGO_CLASES C WHERE C.ID = COMCOB_V.COMCCL_ID) COMCCL_NOMBRE'||unistr('\000a')||
'     , COMCOB_V.DESCRIPCION||DECODE(COMCOB_V.OBSERVACION'||unistr('\000a')||
'                      ,'''''||unistr('\000a')||
'                      ,'''''||unistr('\000a')||
'                      ,'' - ''||COMCOB_V.OBSERVACION';

s:=s||''||unistr('\000a')||
'                      ) COMCOB_DESCRIPCION'||unistr('\000a')||
'     , COMCOB_V.CANTIDAD'||unistr('\000a')||
'     , DECODE(NVL(COMCOB_V.PRECIO_UNITARIO - COMCIT_V.COMCTP_PRECIO,-1)'||unistr('\000a')||
'             , 0'||unistr('\000a')||
'             , ''<font color=BLUE><b>$ ''||'||unistr('\000a')||
'             TO_CHAR(COMCOB_V.PRECIO_UNITARIO,''999,999,999.99'')'||unistr('\000a')||
'               ||'' <img src="#IMAGE_PREFIX#menu/blue_info_16x16.gif" title="Precio Testigo Vigente"</>''||''</b></font>'',''$ ''||'||unistr('\000a')||
'          ';

s:=s||''||unistr('\000a')||
'             TO_CHAR(COMCOB_V.PRECIO_UNITARIO,''999,999,999.99'')) PRECIO_UNITARIO'||unistr('\000a')||
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

s:=s||'OMCOB_V.COMPED_ID = :P310_ID'||unistr('\000a')||
'  AND COMCOB_V.COMCIT_ID = COMCIT_V.ID(+)'||unistr('\000a')||
'ORDER BY COMCOB_V.RENGLON desc';

wwv_flow_api.create_report_region (
  p_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 312,
  p_name=> 'Detalle de &P1_COMETQ_PRO. solicitados',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 15,
  p_region_attributes=>'style="width:91%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'UPDATABLE_SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'N',
  p_query_row_template=> 142033676269227104+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '20',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> '-',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se ha encontrado ningún dato.',
  p_query_num_rows_type=> 'ROW_RANGES_WITH_LINKS',
  p_query_row_count_max=> '999999',
  p_pagination_display_position=> 'TOP_AND_BOTTOM_LEFT',
  p_report_total_text_format=> 'Total:',
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
  p_id=> 15275931856362841 + wwv_flow_api.g_id_offset,
  p_region_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
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
  p_id=> 15274312596362838 + wwv_flow_api.g_id_offset,
  p_region_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
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
  p_id=> 15274513267362841 + wwv_flow_api.g_id_offset,
  p_region_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
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
  p_id=> 15274632346362841 + wwv_flow_api.g_id_offset,
  p_region_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'RENGLON',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Item',
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
  p_id=> 15274723963362841 + wwv_flow_api.g_id_offset,
  p_region_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMCCL_ID',
  p_column_display_sequence=> 13,
  p_column_heading=> 'Id Clase',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
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
  p_id=> 15274825398362841 + wwv_flow_api.g_id_offset,
  p_region_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'COMCIT_ID',
  p_column_display_sequence=> 4,
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
  p_id=> 15274927388362841 + wwv_flow_api.g_id_offset,
  p_region_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'CODIGO',
  p_column_display_sequence=> 5,
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
  p_id=> 16649608617221494 + wwv_flow_api.g_id_offset,
  p_region_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'COMCCL_NOMBRE',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Clase',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
  p_id=> 20941120466251765 + wwv_flow_api.g_id_offset,
  p_region_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
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
  p_id=> 15275125381362841 + wwv_flow_api.g_id_offset,
  p_region_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
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
  p_id=> 15275210921362841 + wwv_flow_api.g_id_offset,
  p_region_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'PRECIO_UNITARIO',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Precio Referencia',
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
  p_id=> 15619517406906049 + wwv_flow_api.g_id_offset,
  p_region_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'PRECIO_TOTAL',
  p_column_display_sequence=> 10,
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
  p_id=> 15275324493362841 + wwv_flow_api.g_id_offset,
  p_region_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
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
  p_id=> 20941213220251766 + wwv_flow_api.g_id_offset,
  p_region_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'COMCTP_PRECIO',
  p_column_display_sequence=> 14,
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
  p_id=> 15276013465362841 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 312,
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
  p_plug_source_type=> 14818912116042676 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 142039054754227113+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'ITEM_IS_NULL',
  p_plug_display_when_condition => 'P312_ID',
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
  p_id=> 15276228539362841 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 312,
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
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 15278105023362843 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 312,
  p_button_sequence=> 50,
  p_button_plug_id => 15273500427362824+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Agregar Item',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_condition=> ':P312_COMCCL_ID IS NOT NULL',
  p_button_condition_type=> 'PLSQL_EXPRESSION',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 15277924711362843 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 312,
  p_button_sequence=> 40,
  p_button_plug_id => 15273500427362824+wwv_flow_api.g_id_offset,
  p_button_name    => 'SAVE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Aplicar Cambios',
  p_button_position=> 'REGION_TEMPLATE_CHANGE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_condition=> 'P312_ID',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_database_action=>'UPDATE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 15277315168362841 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 312,
  p_button_sequence=> 10,
  p_button_plug_id => 15273500427362824+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancelar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:&P1_PAG_ANTERIOR.:&SESSION.::&DEBUG.:310,311,312,313,314,315,316::',
  p_button_condition=> 'P310_APP_ANTERIOR',
  p_button_condition_type=> 'ITEM_IS_NULL',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 9140929280833002 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 312,
  p_button_sequence=> 70,
  p_button_plug_id => 15273500427362824+wwv_flow_api.g_id_offset,
  p_button_name    => 'Retornar',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancelar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&P310_APP_ANTERIOR.:&P310_PAG_ANTERIOR.:&SESSION.',
  p_button_condition=> 'P310_APP_ANTERIOR',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 15276903581362841 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 312,
  p_button_sequence=> 60,
  p_button_plug_id => 15274123832362829+wwv_flow_api.g_id_offset,
  p_button_name    => 'MULTI_ROW_DELETE',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Suprimir',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:confirmDelete(htmldb_delete_message,''MULTI_ROW_DELETE'');',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 15277731389362843 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 312,
  p_button_sequence=> 30,
  p_button_plug_id => 15273500427362824+wwv_flow_api.g_id_offset,
  p_button_name    => 'NEXT',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Siguiente >',
  p_button_position=> 'REGION_TEMPLATE_NEXT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_condition=> 'SELECT 1'||unistr('\000a')||
'FROM COM_PEDIDOS_DETALLES'||unistr('\000a')||
'WHERE COMPED_ID = :P310_ID;',
  p_button_condition_type=> 'EXISTS',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 15277520002362843 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 312,
  p_button_sequence=> 20,
  p_button_plug_id => 15273500427362824+wwv_flow_api.g_id_offset,
  p_button_name    => 'PREVIOUS',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> '< Anterior',
  p_button_position=> 'REGION_TEMPLATE_PREVIOUS',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>15285401190362862 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 312,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:313:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>15277731389362843+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 20,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>15285017549362862 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 312,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:312:&SESSION.::&DEBUG.::P312_CON_NOMENCLADOR:SI',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 30,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 06-ABR-2009 11:39 by FVALLEJO');
 
wwv_flow_api.create_page_branch(
  p_id=>15285221681362862 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 312,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:311:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'BEFORE_VALIDATION',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>15277520002362843+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>15278506415362843 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 312,
  p_name=>'P312_ID',
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
  p_id=>15278912188362843 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 312,
  p_name=>'P312_RENGLON',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 2,
  p_item_plug_id => 15273500427362824+wwv_flow_api.g_id_offset,
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
h := null;
h:=h||'Indique &P1_COMETQ_CCL. ';

wwv_flow_api.create_page_item(
  p_id=>15279113260362843 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 312,
  p_name=>'P312_COMCCL_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 15273500427362824+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'&P1_COMETQ_CCLS. :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_POPUP_LOV',
  p_lov=> 'select to_char(codigo,''00000'')||'' - ''||nombre d, id r'||unistr('\000a')||
'from com_catalogo_clases_v comccl_v'||unistr('\000a')||
'where comcob_id = :P312_COMCOB_ID'||unistr('\000a')||
'  and situacion = ''HAB'''||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 90,
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
  p_read_only_when=>'P312_COMCCL_ID',
  p_read_only_when_type=>'ITEM_IS_NOT_NULL',
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_help_text=> h,
  p_attribute_01 => 'NOT_ENTERABLE',
  p_attribute_02 => 'FIRST_ROWSET',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Seleccione y agregue los ítems de la Clase fijada anteriormente.'||unistr('\000a')||
'De ser necesario luego cambie la Clase y agregue mas ítems.';

wwv_flow_api.create_page_item(
  p_id=>15279311991362843 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 312,
  p_name=>'P312_COMCIT_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 15273500427362824+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'&P1_COMETQ_PROS. :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_POPUP_LOV',
  p_lov=> 'select to_char(CODIGO,''0000'')||'' - ''||DESCRIPCION d, ID r'||unistr('\000a')||
'from COM_CATALOGO_ITEMS_V'||unistr('\000a')||
'where SITUACION = ''VIG'''||unistr('\000a')||
'  and COMCOB_ID = :P312_COMCOB_ID'||unistr('\000a')||
'  and COMCCL_ID = :P312_COMCCL_ID'||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 70,
  p_cMaxlength=> 2000,
  p_cHeight=> 3,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 2,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>':P312_CON_NOMENCLADOR = ''SI'' AND :P312_COMCCL_ID IS NOT NULL',
  p_display_when_type=>'PLSQL_EXPRESSION',
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
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
  p_id=>15279517022362844 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 312,
  p_name=>'P312_CODIGO',
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
  p_display_when=>'P312_CON_NOMENCLADOR',
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
h := null;
h:=h||'Descripción y catacterísticas del Bien o Servicio.';

wwv_flow_api.create_page_item(
  p_id=>15279711491362844 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 312,
  p_name=>'P312_DESCRIPCION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 15273500427362824+wwv_flow_api.g_id_offset,
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
  p_display_when=>':P312_CON_NOMENCLADOR = ''NO'' AND :P312_COMCCL_ID IS NOT NULL',
  p_display_when_type=>'PLSQL_EXPRESSION',
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_help_text=> h,
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
  p_id=>15279931873362846 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 312,
  p_name=>'P312_CANTIDAD',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 15273500427362824+wwv_flow_api.g_id_offset,
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
  p_display_when=>'P312_COMCCL_ID',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
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
  p_id=>15280127234362846 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 312,
  p_name=>'P312_PRECIO_UNITARIO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 15273500427362824+wwv_flow_api.g_id_offset,
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
  p_tag_attributes  => 'onFocus="sacarFoco(''P312_PRECIO_TESTIGO_SN'',''P312_OBSERVACION'')";',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P312_COMCCL_ID',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
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
  p_id=>15280307154362846 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 312,
  p_name=>'P312_OBSERVACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 100,
  p_item_plug_id => 15273500427362824+wwv_flow_api.g_id_offset,
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
  p_display_when=>'P312_COMCCL_ID',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
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
  p_id=>15280503969362846 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 312,
  p_name=>'P312_SITUACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 110,
  p_item_plug_id => 15273500427362824+wwv_flow_api.g_id_offset,
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
  p_id=>15280706401362846 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 312,
  p_name=>'P312_COMCOB_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 5,
  p_item_plug_id => 15273500427362824+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'&P1_COMETQ_COBS. :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select to_char(codigo,''000'')||'' - ''||nombre d, id r'||unistr('\000a')||
'from com_catalogo_objetos_v'||unistr('\000a')||
'where id = :P312_COMCOB_ID'||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 120,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-CENTER',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_field_template=> 142039662225227115+wwv_flow_api.g_id_offset,
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
h := null;
h:=h||'Opciones:<br>'||unistr('\000a')||
' SI, se cargará el detalle usando el Nomenclador de &P1_COMETQ_PRO..<br>'||unistr('\000a')||
' NO, cargará el detalle del renglon sin Nomenclador. ';

wwv_flow_api.create_page_item(
  p_id=>15281204338362849 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 312,
  p_name=>'P312_CON_NOMENCLADOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 35,
  p_item_plug_id => 15273500427362824+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'SI',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Se encuentra nomenclado<br> el &P1_COMETQ_PROS.?:',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_RADIOGROUP',
  p_named_lov=> 'COMCOB_CON_NOMENCLADOR_SN',
  p_lov=> '.'||to_char(15152506695335841 + wwv_flow_api.g_id_offset)||'.',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 2,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P312_COMCCL_ID',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_read_only_when=>'declare'||unistr('\000a')||
'  cursor cr_comcob is'||unistr('\000a')||
'  select SOLO_ITEMS_NOMENCLADOS_SN'||unistr('\000a')||
'    from COM_CATALOGO_OBJETOS'||unistr('\000a')||
'   where ID = :P310_COMCOB_ID;'||unistr('\000a')||
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
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>16345618681855788 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 312,
  p_name=>'P312_CONFIRMAR_CLASE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 15,
  p_item_plug_id => 15273500427362824+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'Submmit',
  p_prompt=>'Fijar Clase',
  p_source=>'Submmit',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(142039853364227115 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P312_COMCCL_ID',
  p_display_when_type=>'ITEM_IS_NULL',
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
  p_id=>16346826346886394 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 312,
  p_name=>'P312_LIMPIAR_CLASE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 16,
  p_item_plug_id => 15273500427362824+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'Change',
  p_prompt=>'Cambiar Clase',
  p_source=>'Change',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(142039853364227115 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P312_COMCCL_ID',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
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
  p_id=>20384502651528588 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 312,
  p_name=>'P312_OBTN_PRECIO_TESTIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 65,
  p_item_plug_id => 15273500427362824+wwv_flow_api.g_id_offset,
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
  p_display_when=>'P312_COMCCL_ID',
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
  p_id=>20387618899006451 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 312,
  p_name=>'P312_PRECIO_TESTIGO_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 120,
  p_item_plug_id => 15273500427362824+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
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
  p_attribute_01 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>21250625895801618 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 312,
  p_name=>'P312_AYUDA_CLASE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 6,
  p_item_plug_id => 15273500427362824+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_post_element_text=>'<b>Seleccione la &P1_COMETQ_CCLS. de los Items a cargar y fijela</b>',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 2,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P312_COMCCL_ID',
  p_display_when_type=>'ITEM_IS_NULL',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>21262030668897647 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 312,
  p_name=>'P312_AYUDA_ITEMS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 25,
  p_item_plug_id => 15273500427362824+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_post_element_text=>'<b>Seleccione los &P1_COMETQ_PRO. o cargue sus características completas, indique cantidad solicitada, precio y agregue el item. </b>',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 2,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>':P312_CON_NOMENCLADOR = ''SI'' AND :P312_COMCCL_ID IS NOT NULL',
  p_display_when_type=>'PLSQL_EXPRESSION',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>31500820678183625 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 312,
  p_name=>'P312_COMZON_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 4,
  p_item_plug_id => 15273500427362824+wwv_flow_api.g_id_offset,
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
  p_id=>31638731067403397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 312,
  p_name=>'P312_DESC_RO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 33,
  p_item_plug_id => 15273500427362824+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_pre_element_text=>'<b>',
  p_post_element_text=>'</b>',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
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
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_item_comment => 'nowrap="nowrap"');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 7888429543682535 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 312,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P312_CANTIDAD',
  p_validation_sequence=> 10,
  p_validation => 'P312_CANTIDAD',
  p_validation_type => 'ITEM_NOT_NULL_OR_ZERO',
  p_error_message => 'Ingrese un Número mayor que 0',
  p_when_button_pressed=> 15278105023362843 + wwv_flow_api.g_id_offset,
  p_associated_item=> 15279931873362846 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 20870828083278937 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 312,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P312_CANTIDAD',
  p_validation_sequence=> 15,
  p_validation => 'P312_CANTIDAD',
  p_validation_type => 'ITEM_IS_NUMERIC',
  p_error_message => 'El valor debe ser numerico.',
  p_when_button_pressed=> 15278105023362843 + wwv_flow_api.g_id_offset,
  p_associated_item=> 15279931873362846 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 16349512457929665 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 312,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P312_CANTIDAD numero positivo',
  p_validation_sequence=> 20,
  p_validation => ':P312_CANTIDAD > 0',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'Debe indicar un valor válido.',
  p_validation_condition=> 'P312_CANTIDAD',
  p_validation_condition_type=> 'ITEM_IS_NUMERIC',
  p_when_button_pressed=> 15278105023362843 + wwv_flow_api.g_id_offset,
  p_associated_item=> 15279931873362846 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 15350118061366932 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 312,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P312_COMCCL_ID no nulo o cero',
  p_validation_sequence=> 30,
  p_validation => 'P312_COMCCL_ID',
  p_validation_type => 'ITEM_NOT_NULL_OR_ZERO',
  p_error_message => 'Debe seleccionar un valor',
  p_when_button_pressed=> 15278105023362843 + wwv_flow_api.g_id_offset,
  p_associated_item=> 15279113260362843 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 15350514991394368 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 312,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Validar Sin Nomenclador - Descripcion',
  p_validation_sequence=> 40,
  p_validation => '(:P312_CON_NOMENCLADOR = ''SI'') OR'||unistr('\000a')||
'(:P312_CON_NOMENCLADOR = ''NO'' AND :P312_DESCRIPCION IS NOT NULL)',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'Debe indicar un valor',
  p_when_button_pressed=> 15278105023362843 + wwv_flow_api.g_id_offset,
  p_associated_item=> 15279711491362844 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 15349215937337935 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 312,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Validar Con Nomenclador - Item Seleccionado',
  p_validation_sequence=> 50,
  p_validation => '(:P312_CON_NOMENCLADOR = ''SI'' AND :P312_COMCIT_ID IS NOT NULL) OR'||unistr('\000a')||
'(:P312_CON_NOMENCLADOR = ''NO'' AND :P312_COMCIT_ID IS NULL)',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'Debe seleccionar un valor',
  p_when_button_pressed=> 15278105023362843 + wwv_flow_api.g_id_offset,
  p_associated_item=> 15279311991362843 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 15617307500894463 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 312,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P312_PRECIO_UNITARIO es numerico',
  p_validation_sequence=> 60,
  p_validation => 'P312_PRECIO_UNITARIO',
  p_validation_type => 'ITEM_IS_NUMERIC',
  p_error_message => 'Debe indicar un número.',
  p_when_button_pressed=> 15278105023362843 + wwv_flow_api.g_id_offset,
  p_associated_item=> 15280127234362846 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 16348026262905268 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 312,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P312_PRECIO_UNITARIO not null o cero',
  p_validation_sequence=> 70,
  p_validation => 'P312_PRECIO_UNITARIO',
  p_validation_type => 'ITEM_NOT_NULL_OR_ZERO',
  p_error_message => 'Debe indicar un valor.',
  p_when_button_pressed=> 15278105023362843 + wwv_flow_api.g_id_offset,
  p_associated_item=> 15280127234362846 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 17289607442309918 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 312,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Verificar Estado del Pedido',
  p_validation_sequence=> 180,
  p_validation => 'DECLARE'||unistr('\000a')||
' v_dummy NUMBER;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  SELECT 1'||unistr('\000a')||
'  INTO v_dummy'||unistr('\000a')||
'  FROM COM_PEDIDOS_V'||unistr('\000a')||
'  WHERE ID = :P310_ID'||unistr('\000a')||
'  AND COMPEE_ESTADO = ''NUE'';'||unistr('\000a')||
'  return TRUE;'||unistr('\000a')||
'EXCEPTION'||unistr('\000a')||
'  WHEN NO_DATA_FOUND THEN'||unistr('\000a')||
'  return FALSE;'||unistr('\000a')||
'END;',
  p_validation_type => 'FUNC_BODY_RETURNING_BOOLEAN',
  p_error_message => '<font color="red"><b>NO SE PERMITEN MODIFICAR DATOS YA CONFIRMADOS!!</b></font>',
  p_associated_item=> 15280307154362846 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 79078128652476610 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 312
 ,p_name => 'prueba'
 ,p_event_sequence => 10
 ,p_triggering_element_type => 'ITEM'
 ,p_triggering_element => 'P312_COMCIT_ID'
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'change'
  );
wwv_flow_api.create_page_da_action (
  p_id => 79078427900476676 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 312
 ,p_event_id => 79078128652476610 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => 'traePrecio(''P312_COMCIT_ID'',''P312_PRECIO_UNITARIO'',''P312_PRECIO_TESTIGO_SN'',''P312_CANTIDAD'');'
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
p:=p||'DECLARE'||unistr('\000a')||
'  v_compet COM_PEDIDOS_DETALLES%ROWTYPE;'||unistr('\000a')||
'  v_clase VARCHAR2(200);'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  v_compet.COMPED_ID := :P310_ID;'||unistr('\000a')||
'  SELECT NVL(MAX(RENGLON),0)+1'||unistr('\000a')||
'  INTO :P312_RENGLON'||unistr('\000a')||
'  FROM COM_PEDIDOS_DETALLES'||unistr('\000a')||
'  WHERE COMPED_ID = :P310_ID;'||unistr('\000a')||
'  --     '||unistr('\000a')||
'  v_compet.RENGLON   := :P312_RENGLON;    '||unistr('\000a')||
'  v_compet.COMCCL_ID := :P312_COMCCL_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  IF :P312_CON_NOMENCLADOR = ''SI'' AND :P312_COMCIT_ID IS NOT NULL THEN'||unistr('\000a')||
'    --';

p:=p||''||unistr('\000a')||
'    SELECT CODIGO_COMPLETO'||unistr('\000a')||
'          ,DESCRIPCION'||unistr('\000a')||
'    INTO :P312_CODIGO'||unistr('\000a')||
'        ,:P312_DESCRIPCION'||unistr('\000a')||
'    FROM COM_CATALOGO_ITEMS_V'||unistr('\000a')||
'    WHERE ID = :P312_COMCIT_ID;'||unistr('\000a')||
'    --'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'    :P312_CODIGO := NULL;'||unistr('\000a')||
'    :P312_COMCIT_ID := NULL;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  SELECT nombre INTO v_clase'||unistr('\000a')||
'  FROM com_catalogo_clases_v comccl_v'||unistr('\000a')||
'  WHERE comccl_v.id = :P312_COMCCL_ID; '||unistr('\000a')||
'  :P312_PRECIO_UNITARIO := replace(:P312_PRECIO_UNIT';

p:=p||'ARIO,''.'','','');'||unistr('\000a')||
'  :P312_CANTIDAD := replace(:P312_CANTIDAD,''.'','','');'||unistr('\000a')||
'  v_compet.COMCIT_ID       := :P312_COMCIT_ID;'||unistr('\000a')||
'  v_compet.CODIGO          := :P312_CODIGO;'||unistr('\000a')||
'  v_compet.DESCRIPCION     :=  v_clase||''-''||:P312_DESCRIPCION;   '||unistr('\000a')||
'  v_compet.CANTIDAD        := :P312_CANTIDAD;'||unistr('\000a')||
'  v_compet.PRECIO_UNITARIO := :P312_PRECIO_UNITARIO;'||unistr('\000a')||
'  v_compet.OBSERVACION     := :P312_OBSERVACION;'||unistr('\000a')||
'  v_compet.SITUACION      ';

p:=p||' := ''NUE'';'||unistr('\000a')||
'  --'||unistr('\000a')||
'  COM_PKG.INS_COMPET(p_compet => v_compet);'||unistr('\000a')||
'  --'||unistr('\000a')||
'  :P312_CANTIDAD := NULL;'||unistr('\000a')||
'  :P312_COMCIT_ID := NULL;'||unistr('\000a')||
'  :P312_DESCRIPCION := NULL;'||unistr('\000a')||
'  :P312_PRECIO_UNITARIO := NULL;'||unistr('\000a')||
'  :P312_OBSERVACION := NULL;'||unistr('\000a')||
'  :P312_PRECIO_TESTIGO_SN := ''NO'';'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 15283915976362862 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 312,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Agregar Detalle Pedido de Compras',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>15278105023362843 + wwv_flow_api.g_id_offset,
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
p:=p||'#OWNER#:COM_PEDIDOS_DETALLES:ID';

wwv_flow_api.create_page_process(
  p_id     => 15284324481362862 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 312,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_region_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
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
'  WHERE COMPED_ID = :P310_ID'||unistr('\000a')||
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
  p_id     => 15363423396821233 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 312,
  p_process_sequence=> 50,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ReIndexar_Renglones',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>15276903581362841 + wwv_flow_api.g_id_offset,
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
p:=p||':P312_COMCCL_ID := NULL;'||unistr('\000a')||
':P312_COMCIT_ID := NULL;'||unistr('\000a')||
':P312_PRECIO_UNITARIO := NULL;';

wwv_flow_api.create_page_process(
  p_id     => 16347119551893852 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 312,
  p_process_sequence=> 60,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'LimpiarClase',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>16346826346886394 + wwv_flow_api.g_id_offset,
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
p:=p||'IF :P312_COMCOB_ID IS NULL OR :P312_COMCOB_ID <> :P310_COMCOB_ID THEN'||unistr('\000a')||
'  :P312_COMCOB_ID := :P310_COMCOB_ID;'||unistr('\000a')||
'END IF;';

wwv_flow_api.create_page_process(
  p_id     => 15333422160913927 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 312,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Obtener el Objeto de Gasto',
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
'  --'||unistr('\000a')||
'  CURSOR cr_comcit IS'||unistr('\000a')||
'  select 1'||unistr('\000a')||
'  from COM_CATALOGO_ITEMS_V'||unistr('\000a')||
'  where SITUACION = ''VIG'''||unistr('\000a')||
'    and COMCOB_ID = :P312_COMCOB_ID'||unistr('\000a')||
'    and COMCCL_ID = :P312_COMCCL_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_dummy number;'||unistr('\000a')||
'  --'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  :P312_COMCIT_ID := NULL;'||unistr('\000a')||
'  :P312_PRECIO_TESTIGO_SN := ''NO'';'||unistr('\000a')||
'  if :P312_CON_NOMENCLADOR is null then'||unistr('\000a')||
'    :P312_CON_NOMENCLADOR := ''SI'';'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  -- '||unistr('\000a')||
'  IF :P312_COMCCL_ID IS NOT NULL AND NVL';

p:=p||'(:P312_CON_NOMENCLADOR,''SI'') = ''SI'' THEN'||unistr('\000a')||
'    OPEN cr_comcit;'||unistr('\000a')||
'    FETCH cr_comcit INTO v_dummy;'||unistr('\000a')||
'    IF cr_comcit%NOTFOUND THEN'||unistr('\000a')||
'      :P312_CON_NOMENCLADOR := ''NO'';'||unistr('\000a')||
'      :P312_PRECIO_TESTIGO_SN := ''NO'';'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    CLOSE cr_comcit;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 16427410763299796 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 312,
  p_process_sequence=> 20,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'DeterminarUsoCatalogo',
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
'   v_comped com_pedidos%rowtype;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  -- Obtener Domicilio de la Solicitud'||unistr('\000a')||
'  COM_PKG.SET_COMPED(p_id => :P310_ID);'||unistr('\000a')||
'  COM_PKG.GET_COMPED(p_comped => v_comped);'||unistr('\000a')||
'  COM_PKG.INI_COMPED;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  :P312_COMZON_ID := COMCAT_PKG.COMZON_OBTN_ID(v_comped.comdom_id);'||unistr('\000a')||
'  --'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 31500331629177309 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 312,
  p_process_sequence=> 30,
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
 
---------------------------------------
-- ...updatable report columns for page 312
--
 
begin
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 50606104539022403 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 1,
  p_query_column_name=> 'ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 50606200191022409 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 2,
  p_query_column_name=> 'COMPED_ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 50606329425022409 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 3,
  p_query_column_name=> 'RENGLON',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 50606406209022409 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 4,
  p_query_column_name=> 'COMCCL_ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 50606525664022409 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 5,
  p_query_column_name=> 'COMCIT_ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 50606622819022409 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 6,
  p_query_column_name=> 'CODIGO',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 50606700984022409 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 7,
  p_query_column_name=> 'COMCCL_NOMBRE',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 50606816475022409 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 8,
  p_query_column_name=> 'COMCOB_DESCRIPCION',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 50606926204022409 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 9,
  p_query_column_name=> 'CANTIDAD',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 50607022959022409 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 10,
  p_query_column_name=> 'PRECIO_UNITARIO',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 50607121871022409 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 11,
  p_query_column_name=> 'PRECIO_TOTAL',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 50607221608022409 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 12,
  p_query_column_name=> 'OBSERVACION',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 50607331860022409 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 15274123832362829 + wwv_flow_api.g_id_offset,
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
