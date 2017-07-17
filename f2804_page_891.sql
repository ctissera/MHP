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
--   Date and Time:   09:48 Jueves Enero 19, 2017
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

PROMPT ...Remove page 891
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>891);
 
end;
/

 
--application/pages/page_00891
prompt  ...PAGE 891: Detalle de &P1_COMETQ_OCM. - Detalle
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 891
 ,p_user_interface_id => 220650599908639021 + wwv_flow_api.g_id_offset
 ,p_name => 'Detalle de &P1_COMETQ_OCM. - Detalle'
 ,p_alias => 'OCMDET'
 ,p_step_title => 'Detalle de &P1_COMETQ_OCM. - Detalle'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Detalle de &P1_COMETQ_OCM. - Detalle'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_html_page_header => 
'<script language="JavaScript" type="text/javascript">'||unistr('\000a')||
'<!--'||unistr('\000a')||
''||unistr('\000a')||
' htmldb_cancel_message=''¿Desea Anular la Calificación de &P1_COMETQ_OCMS. ?'';'||unistr('\000a')||
''||unistr('\000a')||
'//-->'||unistr('\000a')||
'</script>'||unistr('\000a')||
''||unistr('\000a')||
'<script language="JavaScript" type="text/javascript">'||unistr('\000a')||
'   function anular(ID) {'||unistr('\000a')||
'      var conf;'||unistr('\000a')||
'      document.getElementById(''P891_REP_ANULAR'').value = ID;'||unistr('\000a')||
''||unistr('\000a')||
'      conf = confirm(''¿Desea Eliminar su replicar?'');'||unistr('\000a')||
'      if (conf == true) {'||unistr('\000a')||
'       '||
'  doSubmit(''anular'');'||unistr('\000a')||
'      };'||unistr('\000a')||
'   }'||unistr('\000a')||
''||unistr('\000a')||
'   function replicar(origen) {'||unistr('\000a')||
'      document.getElementById(''P891_ORIGEN'').value = origen;'||unistr('\000a')||
'      conf = confirm(''¿Desea Confirmar su replica? '');'||unistr('\000a')||
'      if (conf == true) {'||unistr('\000a')||
'         doSubmit(''replicar'');'||unistr('\000a')||
'      }'||unistr('\000a')||
'   }'||unistr('\000a')||
''||unistr('\000a')||
'</script>'
 ,p_javascript_code => 
'function refresh()  {'||unistr('\000a')||
'  doSubmit();'||unistr('\000a')||
'}    '||unistr('\000a')||
''||unistr('\000a')||
'function aceptarEntrega(ID) {'||unistr('\000a')||
'  document.getElementById(''P891_COMCPD_ID'').value = ID;'||unistr('\000a')||
'  abrir_ventana(''ACEPTA'',''P891_MOTIVO_SITUACION'',''Aceptar Entrega'',''Desea confirmar la recepción de la entrega pactada? <br> Puede indicar un motivo si lo desea:'','''','''');'||unistr('\000a')||
'    '||unistr('\000a')||
'      /*'||unistr('\000a')||
'      var conf;'||unistr('\000a')||
'      conf = confirm(''Desea confirmar la recepción de la entrega pacta'||
'da? <br> Puede indicar un motivo si lo desea:'');'||unistr('\000a')||
'      if (conf == true) {'||unistr('\000a')||
'         doSubmit(''ACEPTAR'');'||unistr('\000a')||
'      };*/'||unistr('\000a')||
'}'
 ,p_step_template => 236627632327903812 + wwv_flow_api.g_id_offset
 ,p_required_role => 69561725387820335 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'CTISSERA'
 ,p_last_upd_yyyymmddhh24miss => '20161031113558'
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
  p_id=> 69491322736820076 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 891,
  p_plug_name=> 'Ruta de Navegacion',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236652436221903825+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(39997262003400368 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 236667932049903833+ wwv_flow_api.g_id_offset,
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
s:=s||'SELECT ID'||unistr('\000a')||
'      , comocm_id'||unistr('\000a')||
'	 , comadd_id'||unistr('\000a')||
'	 , compet_id'||unistr('\000a')||
'	 , comczd_id'||unistr('\000a')||
'	 , observacion'||unistr('\000a')||
'	 , comadj_id'||unistr('\000a')||
'	 , comadd_cantidad_adjudicada'||unistr('\000a')||
'	 , comadd_situacion'||unistr('\000a')||
'	 , comctz_id'||unistr('\000a')||
'	 , comczd_precio_unitario_final'||unistr('\000a')||
'	 , comczd_observacion'||unistr('\000a')||
'	 , comczd_evaluacion'||unistr('\000a')||
'	 , comczd_motivo_evaluacion'||unistr('\000a')||
'	 , comped_id'||unistr('\000a')||
'	 , compet_renglon'||unistr('\000a')||
'	 , comccl_id'||unistr('\000a')||
'	 , comcit_id'||unistr('\000a')||
'	 , compet_codigo'||unistr('\000a')||
'	 , compet_descripcion||'' Marca/Modelo: ''||comcz';

s:=s||'d_marca||comczd_modelo DESCRIPCION'||unistr('\000a')||
'     , comadd_cantidad_adjudicada*comczd_precio_unitario_final TOTAL'||unistr('\000a')||
'	 , compet_cantidad'||unistr('\000a')||
'	 , compet_precio_unitario'||unistr('\000a')||
'	 , compet_observacion'||unistr('\000a')||
'	 , compet_situacion'||unistr('\000a')||
'	 , comcob_id'||unistr('\000a')||
'	 , comccl_codigo'||unistr('\000a')||
'	 , comccl_nombre'||unistr('\000a')||
'	 , comcob_codigo'||unistr('\000a')||
'	 , comcob_nombre'||unistr('\000a')||
'     , saldo_cantidad'||unistr('\000a')||
'     , saldo_monto'||unistr('\000a')||
'FROM COM_ORDENES_COMPRAS_DET_V'||unistr('\000a')||
'WHERE COMOCM_ID = :P891_ID'||unistr('\000a')||
'ORDER BY compet_reng';

s:=s||'lon';

wwv_flow_api.create_report_region (
  p_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 891,
  p_name=> 'Bienes y/o Servicios a proveer',
  p_region_name=>'',
  p_template=> 236653927375903826+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 40,
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
  p_query_row_template=> 236660639678903829+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '99999',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se ha encontrado ningún dato.',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '99999',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_report_total_text_format=> 'Total',
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
  p_id=> 69491932104820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Id',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
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
  p_id=> 69492002200820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMOCM_ID',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Comocm Id',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
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
  p_id=> 69492106762820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMADD_ID',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Comadd Id',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
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
  p_id=> 69492222081820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_ID',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Compet Id',
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
  p_id=> 69492328984820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMCZD_ID',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Comczd Id',
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
  p_id=> 69492401159820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'OBSERVACION',
  p_column_display_sequence=> 22,
  p_column_heading=> 'Observacion',
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
  p_id=> 69492516941820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'COMADJ_ID',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Comadj Id',
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
  p_id=> 69492607795820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'COMADD_CANTIDAD_ADJUDICADA',
  p_column_display_sequence=> 14,
  p_column_heading=> 'Cantidad',
  p_column_alignment=>'CENTER',
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
  p_id=> 69492715069820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'COMADD_SITUACION',
  p_column_display_sequence=> 24,
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 69492822633820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'COMCTZ_ID',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Comctz Id',
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
  p_id=> 69492919307820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'COMCZD_PRECIO_UNITARIO_FINAL',
  p_column_display_sequence=> 17,
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
  p_id=> 69493024072820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'COMCZD_OBSERVACION',
  p_column_display_sequence=> 23,
  p_column_heading=> 'Observacion Adjudicacion',
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
  p_id=> 69493123610820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'COMCZD_EVALUACION',
  p_column_display_sequence=> 25,
  p_column_heading=> 'Evaluacion',
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
  p_id=> 69493216072820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'COMCZD_MOTIVO_EVALUACION',
  p_column_display_sequence=> 21,
  p_column_heading=> 'Motivo Evaluacion',
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
  p_id=> 69493326718820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 15,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_ID',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Comped Id',
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
  p_id=> 69493430265820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 16,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_RENGLON',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Item',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'CENTER',
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
  p_id=> 69493509613820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 17,
  p_form_element_id=> null,
  p_column_alias=> 'COMCCL_ID',
  p_column_display_sequence=> 11,
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
  p_id=> 69493603572820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 18,
  p_form_element_id=> null,
  p_column_alias=> 'COMCIT_ID',
  p_column_display_sequence=> 12,
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
  p_id=> 69493709365820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 19,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_CODIGO',
  p_column_display_sequence=> 26,
  p_column_heading=> 'Codigo',
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
  p_id=> 69493803739820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 20,
  p_form_element_id=> null,
  p_column_alias=> 'DESCRIPCION',
  p_column_display_sequence=> 16,
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
  p_id=> 69493917781820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 21,
  p_form_element_id=> null,
  p_column_alias=> 'TOTAL',
  p_column_display_sequence=> 19,
  p_column_heading=> 'Precio Total',
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
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 69494012925820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 22,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_CANTIDAD',
  p_column_display_sequence=> 13,
  p_column_heading=> 'Cantidad',
  p_column_alignment=>'CENTER',
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
  p_id=> 69494102213820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 23,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_PRECIO_UNITARIO',
  p_column_display_sequence=> 20,
  p_column_heading=> 'Precio Unitario',
  p_column_format=> 'FML999G999G999G999G990D00',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
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
  p_id=> 69494224506820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 24,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_OBSERVACION',
  p_column_display_sequence=> 27,
  p_column_heading=> 'Observacion',
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
  p_id=> 69494317218820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 25,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_SITUACION',
  p_column_display_sequence=> 28,
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 69494410483820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 26,
  p_form_element_id=> null,
  p_column_alias=> 'COMCOB_ID',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Comcob Id',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
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
  p_id=> 69494505646820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 27,
  p_form_element_id=> null,
  p_column_alias=> 'COMCCL_CODIGO',
  p_column_display_sequence=> 29,
  p_column_heading=> 'Codigo',
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
  p_id=> 69494617141820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 28,
  p_form_element_id=> null,
  p_column_alias=> 'COMCCL_NOMBRE',
  p_column_display_sequence=> 30,
  p_column_heading=> 'Nombre',
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
  p_id=> 69494720354820092 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 29,
  p_form_element_id=> null,
  p_column_alias=> 'COMCOB_CODIGO',
  p_column_display_sequence=> 31,
  p_column_heading=> 'Codigo',
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
  p_id=> 69494821213820092 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 30,
  p_form_element_id=> null,
  p_column_alias=> 'COMCOB_NOMBRE',
  p_column_display_sequence=> 32,
  p_column_heading=> 'Nombre',
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
  p_id=> 69491810550820090 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 31,
  p_form_element_id=> null,
  p_column_alias=> 'SALDO_CANTIDAD',
  p_column_display_sequence=> 15,
  p_column_heading=> 'Cantidad Pendiente de entrega',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'CENTER',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'FUNCTION_BODY',
  p_display_when_condition=> 'declare'||unistr('\000a')||
'  v_comocm COM_ORDENES_COMPRAS%rowtype;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
'  COM_PKG.SET_COMOCM(:P891_ID);'||unistr('\000a')||
'  COM_PKG.GET_COMOCM(v_comocm);'||unistr('\000a')||
'  COM_PKG.INI_COMOCM;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  if v_comocm.TIPO_ENTREGA = ''CNT'' then'||unistr('\000a')||
'    return true;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  return false;'||unistr('\000a')||
'end;',
  p_display_as=>'ESCAPE_SC',
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
  p_id=> 69491725553820085 + wwv_flow_api.g_id_offset,
  p_region_id=> 69491523063820078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 32,
  p_form_element_id=> null,
  p_column_alias=> 'SALDO_MONTO',
  p_column_display_sequence=> 18,
  p_column_heading=> 'Monto Pendiente de entrega',
  p_use_as_row_header=> 'N',
  p_column_format=> 'FML999G999G999G999G990D00',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'FUNCTION_BODY',
  p_display_when_condition=> 'declare'||unistr('\000a')||
'  v_comocm COM_ORDENES_COMPRAS%rowtype;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
'  COM_PKG.SET_COMOCM(:P891_ID);'||unistr('\000a')||
'  COM_PKG.GET_COMOCM(v_comocm);'||unistr('\000a')||
'  COM_PKG.INI_COMOCM;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  if v_comocm.TIPO_ENTREGA is not null then'||unistr('\000a')||
'    return true;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  return false;'||unistr('\000a')||
'end;',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT ID'||unistr('\000a')||
'     , COMOCM_ID'||unistr('\000a')||
'     , FECHA'||unistr('\000a')||
'     , '' <b>''||(select rv_abbreviation from   cg_ref_codes'||unistr('\000a')||
'                 where  rv_domain = ''COM_ORDENES_COMPRAS_EST.ESTADO'''||unistr('\000a')||
'                   and rv_low_value = COMOCE_V.ESTADO)||''</b>'' ESTADO'||unistr('\000a')||
'     , MOTIVO  '||unistr('\000a')||
'     , ESTADO_ACTUAL_SN'||unistr('\000a')||
'     , DATE_CREATED'||unistr('\000a')||
'     , CREATED_BY'||unistr('\000a')||
'     ,SEG_PKG.OBTN_SEGUSU_NOMBRE(CREATED_BY) CREADO_POR_USUARIO'||unistr('\000a')||
'     , DATE_MODIFIED';

s:=s||''||unistr('\000a')||
'     , MODIFIED_BY'||unistr('\000a')||
'   FROM COM_ORDENES_COMPRAS_EST_V COMOCE_V'||unistr('\000a')||
'  WHERE COMOCE_V.COMOCM_ID = :P891_ID'||unistr('\000a')||
'    AND ((:P891_FILTRO_ESTADO = ''VIG''AND COMOCE_V.ID = COM_PKG.OBTN_COMOCE_ID(:P891_ID))OR (:P891_FILTRO_ESTADO = ''HIS'' AND COMOCE_V.ID <> COM_PKG.OBTN_COMOCE_ID(:P891_ID))OR (:P891_FILTRO_ESTADO = ''VIGHIS''))'||unistr('\000a')||
'  ORDER BY COMOCE_V.ESTADO_ACTUAL_SN DESC, COMOCE_V.ID DESC';

wwv_flow_api.create_report_region (
  p_id=> 69495105833820095 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 891,
  p_name=> 'Detalle de Estados',
  p_region_name=>'',
  p_template=> 236653927375903826+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 20,
  p_region_attributes=>'style="width:700px" class="TABLA-ASP-3"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_required_role => 69557614686820331+ wwv_flow_api.g_id_offset,
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 236660639678903829+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '99999',
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
  p_id=> 69495300223820095 + wwv_flow_api.g_id_offset,
  p_region_id=> 69495105833820095 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
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
  p_id=> 69495411593820095 + wwv_flow_api.g_id_offset,
  p_region_id=> 69495105833820095 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMOCM_ID',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Comocm Id',
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
  p_id=> 69495500704820095 + wwv_flow_api.g_id_offset,
  p_region_id=> 69495105833820095 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Fecha',
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
  p_id=> 69495623729820095 + wwv_flow_api.g_id_offset,
  p_region_id=> 69495105833820095 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'ESTADO',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Estado',
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
  p_id=> 69495707356820095 + wwv_flow_api.g_id_offset,
  p_region_id=> 69495105833820095 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'MOTIVO',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Motivo',
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
  p_id=> 69495821372820095 + wwv_flow_api.g_id_offset,
  p_region_id=> 69495105833820095 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'ESTADO_ACTUAL_SN',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Estado Actual Sn',
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
  p_id=> 69495905488820095 + wwv_flow_api.g_id_offset,
  p_region_id=> 69495105833820095 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'DATE_CREATED',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Registrado el',
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
  p_id=> 69496025316820095 + wwv_flow_api.g_id_offset,
  p_region_id=> 69495105833820095 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'CREATED_BY',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Registrado por',
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
  p_id=> 69496100116820095 + wwv_flow_api.g_id_offset,
  p_region_id=> 69495105833820095 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'CREADO_POR_USUARIO',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Creado Por',
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
  p_id=> 69496203706820095 + wwv_flow_api.g_id_offset,
  p_region_id=> 69495105833820095 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'DATE_MODIFIED',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Actualizado el',
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
  p_id=> 69496319153820095 + wwv_flow_api.g_id_offset,
  p_region_id=> 69495105833820095 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'MODIFIED_BY',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Actualizado por',
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
s:=s||'DECLARE'||unistr('\000a')||
' CURSOR cr_cursor IS'||unistr('\000a')||
'  SELECT ''realizado por <b>''||InitCap(NVL(MODIFIED_BY_NOMBRE,CREATED_BY_NOMBRE))||'' (''||upper(ORIGEN_DESC)||'')</b> el ''||FECHA||''<br>Comentario: ''||COMENTARIO'||unistr('\000a')||
'||'' <br>'' COMENTARIO_DESC '||unistr('\000a')||
'FROM COM_REPLICAS_DET_V'||unistr('\000a')||
'WHERE COMREP_ID = :P891_COMREP_ID'||unistr('\000a')||
'  AND SITUACION = ''VIG'''||unistr('\000a')||
'  AND ID = (select max(ID) from COM_REPLICAS_DET where comrep_id = :P891_COMREP_ID);'||unistr('\000a')||
'--'||unistr('\000a')||
'v_replica VARCH';

s:=s||'AR2(3000) := null;'||unistr('\000a')||
'--'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  OPEN cr_cursor;'||unistr('\000a')||
'  FETCH cr_cursor INTO v_replica;'||unistr('\000a')||
'  CLOSE cr_cursor;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  IF v_replica IS NOT NULL THEN'||unistr('\000a')||
'    htp.print(''Ingrese la respuesta al descargo ''||v_replica||''<br>'');'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'    htp.print(''Ingrese a continuación su Descargo justificando los motivos por los cuales no está deacuerdo con la calificación otorgada. Recuerde solo realice un descargo si no esta de ';

s:=s||'acuerdo.<br>'');'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END;'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 69496610600820100 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 891,
  p_plug_name=> 'Registro de Descargos',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236653927375903826+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 70,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 9,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'FUNCTION_BODY',
  p_plug_display_when_condition => 'IF :P891_VER_REPLICAR = ''NO'' THEN'||unistr('\000a')||
'   RETURN FALSE;'||unistr('\000a')||
'ELSE'||unistr('\000a')||
'   RETURN TRUE;'||unistr('\000a')||
'END IF;',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> 'IF :P891_COMREP_ESTADO = ''RES'' OR ('||unistr('\000a')||
'   COM_PKG.COMREP_REPLICAR_SN(:P891_ID,''PRV'') = ''NO'' AND '||unistr('\000a')||
'   COM_PKG.COMREP_REPLICAR_SN(:P891_ID,''ECO'') = ''NO'' AND'||unistr('\000a')||
'   COM_PKG.COMREP_REPLICAR_SN(:P891_ID,''ADM'') = ''NO'') THEN'||unistr('\000a')||
'   RETURN FALSE;'||unistr('\000a')||
'ELSE'||unistr('\000a')||
'   RETURN TRUE;'||unistr('\000a')||
'END IF;');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 69497414178820104 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 891,
  p_plug_name=> 'Comentario',
  p_region_name=>'',
  p_parent_plug_id=>69496610600820100 + wwv_flow_api.g_id_offset,
  p_region_attributes=> 'style="width:250px"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 60,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
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
  p_id=> 69497832654820107 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 891,
  p_plug_name=> 'Acciones',
  p_region_name=>'',
  p_parent_plug_id=>69496610600820100 + wwv_flow_api.g_id_offset,
  p_region_attributes=> 'style="width:280px"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 90,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 69499018513820120 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 891,
  p_plug_name=> 'Descargos Ingresados',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236653927375903826+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 100,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 9,
  p_plug_display_point=> 'BODY_1',
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
  p_plug_display_condition_type => 'EXISTS',
  p_plug_display_when_condition => 'SELECT 1'||unistr('\000a')||
'FROM COM_REPLICAS_DET comred'||unistr('\000a')||
'    ,COM_REPLICAS comrep'||unistr('\000a')||
'WHERE comred.COMREP_ID = comrep.ID'||unistr('\000a')||
'and   comred.SITUACION = ''VIG'''||unistr('\000a')||
'and   comrep.COMOCM_ID = :P891_ID'||unistr('\000a')||
'and   COMREP.ESTADO <> ''ANU''',
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
s:=s||'SELECT comred.COMREP_ID'||unistr('\000a')||
'      ,comred.ID COMRED_ID'||unistr('\000a')||
'      ,comred.SEGORG_ID  '||unistr('\000a')||
'      ,comred.FECHA'||unistr('\000a')||
'      ,comred.ORIGEN'||unistr('\000a')||
'      ,comred.ORIGEN_DESC'||unistr('\000a')||
'      ,comred.COMENTARIO'||unistr('\000a')||
'      ,comred.COMREP_COMOCM_ID'||unistr('\000a')||
'      ,comred.COMREP_COMCLF_ID'||unistr('\000a')||
'      ,comred.COMREP_FECHA_GENERACION'||unistr('\000a')||
'      ,comred.SITUACION'||unistr('\000a')||
'      ,comred.DATE_CREATED'||unistr('\000a')||
'      ,comred.CREATED_BY_NOMBRE'||unistr('\000a')||
'      ,comred.DATE_MODIFIED'||unistr('\000a')||
'      ,comred.MODIFI';

s:=s||'ED_BY_NOMBRE'||unistr('\000a')||
'      ,NVL(comred.MODIFIED_BY_NOMBRE,comred.CREATED_BY_NOMBRE) COMENTADO_POR'||unistr('\000a')||
'      ,comred.COMREP_COMECO_ID'||unistr('\000a')||
'      ,comred.COMREP_COMPRV_ID'||unistr('\000a')||
'      ,comred.COMREP_COMENTARIO'||unistr('\000a')||
'      ,comred.COMREP_ESTADO'||unistr('\000a')||
'      ,(case comred.SITUACION '||unistr('\000a')||
'           when ''ANU'' then'||unistr('\000a')||
'              ''ANULADA'''||unistr('\000a')||
'           else (case COM_PKG.COMREP_ANULA_REP_SN(comred.ID,comred.COMREP_ID,:P1_SEGUSU_TIPO) '||unistr('\000a')||
'           ';

s:=s||'         when ''SI'' then'||unistr('\000a')||
'                       ''<a href="#"  onclick="javascript:anular('' ||comred.ID|| '');" title="Eliminar Descargo"><img  src="#WORKSPACE_IMAGES#delete2.png"><br><font color="red">Eliminar<br>Descargo</font></a>'''||unistr('\000a')||
'                    when ''NO'' then'||unistr('\000a')||
'                       '''''||unistr('\000a')||
'                    end)'||unistr('\000a')||
'        end) ANULAR'||unistr('\000a')||
'        ,(case COM_PKG.COMREP_ANULA_REP_SN(comred.ID,comred.CO';

s:=s||'MREP_ID,:P1_SEGUSU_TIPO) '||unistr('\000a')||
'          when ''SI'' then '||unistr('\000a')||
'            ''<a href="#" onclick=''''popUp2("f?p=&APP_ID.:1060:&SESSION.::&DEBUG.:1060:P1060_COMRED_ID:''||comred.ID||''",640,480);'''' title="Adjuntar Doc."><img src="#WORKSPACE_IMAGES#arrow-transition-090.png" alt="Adjuntar Doc." title="Adjuntar Documento"><br><font color="blue">Adjuntar<br>Documento</font></a>'''||unistr('\000a')||
'          when ''NO'' then'||unistr('\000a')||
'            ''';

s:=s||''''||unistr('\000a')||
'        end) ADJUNTAR'||unistr('\000a')||
'      ,comred.COMREP_ESTADO_DESC '||unistr('\000a')||
'      ,(case comred.ORIGEN'||unistr('\000a')||
'            when ''PRV'' then'||unistr('\000a')||
'              ''<img src="#WORKSPACE_IMAGES#replica_pre.png">'''||unistr('\000a')||
'            when ''ECO'' then'||unistr('\000a')||
'              ''<img src="#WORKSPACE_IMAGES#replica_rep.png">'''||unistr('\000a')||
'            when ''ADM'' then'||unistr('\000a')||
'              ''<img src="#WORKSPACE_IMAGES#replica_res.png">'''||unistr('\000a')||
'            end)||'' Calificación:''||COMREP_CO';

s:=s||'MCLF_DESC||'' <strong>''||ORIGEN_DESC || ''</strong>: '' ||'||unistr('\000a')||
'              NVL(comred.MODIFIED_BY_NOMBRE, comred.CREATED_BY_NOMBRE)||''<br> <strong>Fecha:</strong> ''||comred.FECHA||''<br><span style="color:blue;">''||htmldb_util.get_since(comred.FECHA)|| '||unistr('\000a')||
'               ''</span><br><strong>Comentario:</strong> ''||comred.COMENTARIO||'' <br>'' COMENTARIO_DESC'||unistr('\000a')||
'      ,(select DBMS_LOB.GETLENGTH(COMDOC.DOCUMENTO';

s:=s||')      '||unistr('\000a')||
'        from   COM_REPLICAS_DOC comrdc'||unistr('\000a')||
'              ,COM_DOCUMENTOS   comdoc'||unistr('\000a')||
'        where  comrdc.COMRED_ID = comred.ID '||unistr('\000a')||
'        and    comrdc.COMDOC_ID = comdoc.ID'||unistr('\000a')||
'        and    SITUACION = ''VIG'''||unistr('\000a')||
'        and    comrdc.ID = (select max(comrdc2.ID)'||unistr('\000a')||
'                            from COM_REPLICAS_DOC comrdc2'||unistr('\000a')||
'                            where comrdc2.FECHA_SITUACION = (select max(comrdc3.FEC';

s:=s||'HA_SITUACION)'||unistr('\000a')||
'                                                             from   COM_REPLICAS_DOC comrdc3'||unistr('\000a')||
'                                                             where  comrdc3.COMRED_ID = comred.ID))) DOCUMENTO'||unistr('\000a')||
'      ,(select COMDOC.ID      '||unistr('\000a')||
'        from   COM_REPLICAS_DOC comrdc'||unistr('\000a')||
'              ,COM_DOCUMENTOS   comdoc'||unistr('\000a')||
'        where  comrdc.COMRED_ID = comred.ID '||unistr('\000a')||
'        and    comrdc.COMDOC';

s:=s||'_ID = comdoc.ID'||unistr('\000a')||
'        and    SITUACION = ''VIG'''||unistr('\000a')||
'        and    comrdc.ID = (select max(comrdc2.ID)'||unistr('\000a')||
'                            from COM_REPLICAS_DOC comrdc2'||unistr('\000a')||
'                            where comrdc2.FECHA_SITUACION = (select max(comrdc3.FECHA_SITUACION)'||unistr('\000a')||
'                                                             from   COM_REPLICAS_DOC comrdc3'||unistr('\000a')||
'                                                    ';

s:=s||'         where  comrdc3.COMRED_ID = comred.ID))) ID'||unistr('\000a')||
'FROM COM_REPLICAS_DET_V comred'||unistr('\000a')||
'where comred.COMREP_COMOCM_ID = :P891_ID'||unistr('\000a')||
'and comred.SITUACION = ''VIG'''||unistr('\000a')||
'and comred.COMREP_ESTADO <> ''ANU'''||unistr('\000a')||
'ORDER BY comred.comrep_ID desc,comred.FECHA desc';

wwv_flow_api.create_report_region (
  p_id=> 69499207673820121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 891,
  p_name=> 'Descargos Registrados',
  p_region_name=>'',
  p_parent_plug_id=>69499018513820120 + wwv_flow_api.g_id_offset,
  p_template=> 236656544011903827+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 80,
  p_region_attributes=>'style="width:350px;"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'BELOW',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 236660639678903829+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'NO_HEADINGS',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols=> '0',
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
  p_prn_page_header_alignment=> 'CENTER',
  p_prn_page_footer_alignment=> 'CENTER',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'SELECT comred.COMREP_ID'||unistr('\000a')||
'      ,comred.ID COMRED_ID'||unistr('\000a')||
'      ,comred.SEGORG_ID  '||unistr('\000a')||
'      ,comred.FECHA'||unistr('\000a')||
'      ,comred.ORIGEN'||unistr('\000a')||
'      ,comred.ORIGEN_DESC'||unistr('\000a')||
'      ,comred.COMENTARIO'||unistr('\000a')||
'      ,comred.COMREP_COMOCM_ID'||unistr('\000a')||
'      ,comred.COMREP_COMCLF_ID'||unistr('\000a')||
'      ,comred.COMREP_FECHA_GENERACION'||unistr('\000a')||
'      ,comred.SITUACION'||unistr('\000a')||
'      ,comred.DATE_CREATED'||unistr('\000a')||
'      ,comred.CREATED_BY_NOMBRE'||unistr('\000a')||
'      ,comred.DATE_MODIFIED'||unistr('\000a')||
'      ,comred.MODIFIED_BY_NOMBRE'||unistr('\000a')||
'      ,NVL(comred.MODIFIED_BY_NOMBRE,comred.CREATED_BY_NOMBRE) COMENTADO_POR'||unistr('\000a')||
'      ,comred.COMREP_COMECO_ID'||unistr('\000a')||
'      ,comred.COMREP_COMPRV_ID'||unistr('\000a')||
'      ,comred.COMREP_COMENTARIO'||unistr('\000a')||
'      ,comred.COMREP_ESTADO'||unistr('\000a')||
'      ,(case comred.SITUACION '||unistr('\000a')||
'           when ''ANU'' then'||unistr('\000a')||
'              ''ANULADA'''||unistr('\000a')||
'           else (case COM_PKG.COMREP_ANULA_REP_SN(comred.ID,comred.COMREP_ID,:P1_SEGUSU_TIPO) '||unistr('\000a')||
'                    when ''SI'' then'||unistr('\000a')||
'                       ''<a href="#"  onclick="javascript:anular('' ||comred.ID|| '');" title="Eliminar"><img  src="#WORKSPACE_IMAGES#delete2.png"><br><font color="red">Eliminar</font></a>'''||unistr('\000a')||
'                    when ''NO'' then'||unistr('\000a')||
'                       '''''||unistr('\000a')||
'                    end)'||unistr('\000a')||
'        end) ANULAR'||unistr('\000a')||
'        ,(case COM_PKG.COMREP_ANULA_REP_SN(comred.ID,comred.COMREP_ID,:P1_SEGUSU_TIPO) '||unistr('\000a')||
'          when ''SI'' then '||unistr('\000a')||
'            ''<a href="#" onclick=''''popUp2("f?p=&APP_ID.:1060:&SESSION.::&DEBUG.:1060:P1060_COMRED_ID:''||comred.ID||''",640,480);'''' title="Adjuntar Doc."><img src="#WORKSPACE_IMAGES#arrow-transition-090.png" alt="Adjuntar Doc." title="Adjuntar Doc."><br><font color="blue">Adjuntar</font></a>'''||unistr('\000a')||
'          when ''NO'' then'||unistr('\000a')||
'            '''''||unistr('\000a')||
'        end) ADJUNTAR'||unistr('\000a')||
'      ,comred.COMREP_ESTADO_DESC '||unistr('\000a')||
'      ,''<b>''||ORIGEN_DESC || ''</b> '' || '||unistr('\000a')||
'           (case comred.ORIGEN'||unistr('\000a')||
'            when ''PRV'' then'||unistr('\000a')||
'              ''<img src="#WORKSPACE_IMAGES#replica_pre.png">'''||unistr('\000a')||
'            when ''ECO'' then'||unistr('\000a')||
'              ''<img src="#WORKSPACE_IMAGES#replica_rep.png">'''||unistr('\000a')||
'            when ''ADM'' then'||unistr('\000a')||
'              ''<img src="#WORKSPACE_IMAGES#replica_res.png">'''||unistr('\000a')||
'            end) || ''<br>'' ||comred.FECHA || '||unistr('\000a')||
'               ''<br>Comentó: ''||comred.COMENTARIO||'' <br>''||'||unistr('\000a')||
'              NVL(comred.MODIFIED_BY_NOMBRE, comred.CREATED_BY_NOMBRE) COMENTARIO_DESC'||unistr('\000a')||
'      ,(select DBMS_LOB.GETLENGTH(COMDOC.DOCUMENTO)      '||unistr('\000a')||
'        from   COM_REPLICAS_DOC comrdc'||unistr('\000a')||
'              ,COM_DOCUMENTOS   comdoc'||unistr('\000a')||
'        where  comrdc.COMRED_ID = comred.ID '||unistr('\000a')||
'        and    comrdc.COMDOC_ID = comdoc.ID'||unistr('\000a')||
'        and    SITUACION = ''VIG'''||unistr('\000a')||
'        and    comrdc.ID = (select max(comrdc2.ID)'||unistr('\000a')||
'                            from COM_REPLICAS_DOC comrdc2'||unistr('\000a')||
'                            where comrdc2.FECHA_SITUACION = (select max(comrdc3.FECHA_SITUACION)'||unistr('\000a')||
'                                                             from   COM_REPLICAS_DOC comrdc3'||unistr('\000a')||
'                                                             where  comrdc3.COMRED_ID = comred.ID))) DOCUMENTO'||unistr('\000a')||
'      ,(select COMDOC.ID      '||unistr('\000a')||
'        from   COM_REPLICAS_DOC comrdc'||unistr('\000a')||
'              ,COM_DOCUMENTOS   comdoc'||unistr('\000a')||
'        where  comrdc.COMRED_ID = comred.ID '||unistr('\000a')||
'        and    comrdc.COMDOC_ID = comdoc.ID'||unistr('\000a')||
'        and    SITUACION = ''VIG'''||unistr('\000a')||
'        and    comrdc.ID = (select max(comrdc2.ID)'||unistr('\000a')||
'                            from COM_REPLICAS_DOC comrdc2'||unistr('\000a')||
'                            where comrdc2.FECHA_SITUACION = (select max(comrdc3.FECHA_SITUACION)'||unistr('\000a')||
'                                                             from   COM_REPLICAS_DOC comrdc3'||unistr('\000a')||
'                                                             where  comrdc3.COMRED_ID = comred.ID))) ID'||unistr('\000a')||
'FROM COM_REPLICAS_DET_V comred'||unistr('\000a')||
'--WHERE comred.COMREP_ID = :P891_COMREP_ID'||unistr('\000a')||
'where comred.COMREP_COMOCM_ID = :P891_ID'||unistr('\000a')||
'and comred.SITUACION = ''VIG'''||unistr('\000a')||
'ORDER BY comred.ID');
end;
/
 
-- maintain plug_column_width attribute for 2.2 and greater
begin
execute immediate 'begin wwv_flow_api.set_region_column_width (
  p_id=>69499207673820121 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_page_id=>891,
  p_plug_column_width=>''style="width:1500px;"''); end;';
exception when others then null;
end;
/
 
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 69499412392820123 + wwv_flow_api.g_id_offset,
  p_region_id=> 69499207673820121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMREP_ID',
  p_column_display_sequence=> 10,
  p_column_heading=> '',
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
  p_id=> 69499527214820123 + wwv_flow_api.g_id_offset,
  p_region_id=> 69499207673820121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMRED_ID',
  p_column_display_sequence=> 25,
  p_column_heading=> '',
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
  p_id=> 69499612982820123 + wwv_flow_api.g_id_offset,
  p_region_id=> 69499207673820121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'SEGORG_ID',
  p_column_display_sequence=> 12,
  p_column_heading=> '',
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
  p_id=> 69499716072820123 + wwv_flow_api.g_id_offset,
  p_region_id=> 69499207673820121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA',
  p_column_display_sequence=> 2,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
  p_id=> 69499812945820123 + wwv_flow_api.g_id_offset,
  p_region_id=> 69499207673820121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'ORIGEN',
  p_column_display_sequence=> 3,
  p_column_heading=> '',
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
  p_id=> 69499925793820123 + wwv_flow_api.g_id_offset,
  p_region_id=> 69499207673820121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'ORIGEN_DESC',
  p_column_display_sequence=> 5,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
  p_id=> 69500027208820125 + wwv_flow_api.g_id_offset,
  p_region_id=> 69499207673820121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'COMENTARIO',
  p_column_display_sequence=> 4,
  p_column_heading=> '',
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
  p_id=> 69500114906820125 + wwv_flow_api.g_id_offset,
  p_region_id=> 69499207673820121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'COMREP_COMOCM_ID',
  p_column_display_sequence=> 6,
  p_column_heading=> '',
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
  p_id=> 69500216628820125 + wwv_flow_api.g_id_offset,
  p_region_id=> 69499207673820121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'COMREP_COMCLF_ID',
  p_column_display_sequence=> 7,
  p_column_heading=> '',
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
  p_id=> 69500311342820125 + wwv_flow_api.g_id_offset,
  p_region_id=> 69499207673820121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'COMREP_FECHA_GENERACION',
  p_column_display_sequence=> 8,
  p_column_heading=> '',
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
  p_id=> 69500429492820125 + wwv_flow_api.g_id_offset,
  p_region_id=> 69499207673820121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION',
  p_column_display_sequence=> 11,
  p_column_heading=> '',
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
  p_id=> 69500515650820125 + wwv_flow_api.g_id_offset,
  p_region_id=> 69499207673820121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'DATE_CREATED',
  p_column_display_sequence=> 14,
  p_column_heading=> '',
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
  p_id=> 69500612914820125 + wwv_flow_api.g_id_offset,
  p_region_id=> 69499207673820121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'CREATED_BY_NOMBRE',
  p_column_display_sequence=> 13,
  p_column_heading=> '',
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
  p_id=> 69500710153820125 + wwv_flow_api.g_id_offset,
  p_region_id=> 69499207673820121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'DATE_MODIFIED',
  p_column_display_sequence=> 15,
  p_column_heading=> '',
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
  p_id=> 69500800443820125 + wwv_flow_api.g_id_offset,
  p_region_id=> 69499207673820121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 15,
  p_form_element_id=> null,
  p_column_alias=> 'MODIFIED_BY_NOMBRE',
  p_column_display_sequence=> 16,
  p_column_heading=> '',
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
  p_id=> 69500910567820125 + wwv_flow_api.g_id_offset,
  p_region_id=> 69499207673820121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 16,
  p_form_element_id=> null,
  p_column_alias=> 'COMENTADO_POR',
  p_column_display_sequence=> 9,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
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
  p_id=> 69501001663820125 + wwv_flow_api.g_id_offset,
  p_region_id=> 69499207673820121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 17,
  p_form_element_id=> null,
  p_column_alias=> 'COMREP_COMECO_ID',
  p_column_display_sequence=> 17,
  p_column_heading=> '',
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
  p_id=> 69501100387820125 + wwv_flow_api.g_id_offset,
  p_region_id=> 69499207673820121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 18,
  p_form_element_id=> null,
  p_column_alias=> 'COMREP_COMPRV_ID',
  p_column_display_sequence=> 18,
  p_column_heading=> '',
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
  p_id=> 69501214554820125 + wwv_flow_api.g_id_offset,
  p_region_id=> 69499207673820121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 19,
  p_form_element_id=> null,
  p_column_alias=> 'COMREP_COMENTARIO',
  p_column_display_sequence=> 19,
  p_column_heading=> '',
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
  p_id=> 69501315942820125 + wwv_flow_api.g_id_offset,
  p_region_id=> 69499207673820121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 20,
  p_form_element_id=> null,
  p_column_alias=> 'COMREP_ESTADO',
  p_column_display_sequence=> 20,
  p_column_heading=> '',
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
  p_id=> 69501410812820125 + wwv_flow_api.g_id_offset,
  p_region_id=> 69499207673820121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 21,
  p_form_element_id=> null,
  p_column_alias=> 'ANULAR',
  p_column_display_sequence=> 26,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'CENTER',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'PLSQL_EXPRESSION',
  p_display_when_condition=> ':P1_SEGUSU_TIPO <> ''ADM'' or :P891_COMREP_ESTADO <> ''RES''',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 69501532597820125 + wwv_flow_api.g_id_offset,
  p_region_id=> 69499207673820121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 22,
  p_form_element_id=> null,
  p_column_alias=> 'ADJUNTAR',
  p_column_display_sequence=> 22,
  p_column_heading=> '',
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
  p_include_in_export=> 'Y',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 69501619074820125 + wwv_flow_api.g_id_offset,
  p_region_id=> 69499207673820121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 23,
  p_form_element_id=> null,
  p_column_alias=> 'COMREP_ESTADO_DESC',
  p_column_display_sequence=> 21,
  p_column_heading=> '',
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
  p_id=> 69501703591820125 + wwv_flow_api.g_id_offset,
  p_region_id=> 69499207673820121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 24,
  p_form_element_id=> null,
  p_column_alias=> 'COMENTARIO_DESC',
  p_column_display_sequence=> 1,
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
  p_print_col_width=> '96',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 69501831449820126 + wwv_flow_api.g_id_offset,
  p_region_id=> 69499207673820121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 25,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 23,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_format=> 'DOWNLOAD:COM_DOCUMENTOS:DOCUMENTO:ID::TIPO_ARCHIVO:NOMBRE_ARCHIVO:::Attachment:Doc. Adjunto',
  p_column_alignment=>'CENTER',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 69501901644820126 + wwv_flow_api.g_id_offset,
  p_region_id=> 69499207673820121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 26,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 24,
  p_column_heading=> '',
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
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 69502200299820129 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 891,
  p_plug_name=> 'Realice su Descargo',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236653927375903826+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 40,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 9,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_required_role => 69557020444820331+ wwv_flow_api.g_id_offset,
  p_plug_display_condition_type => 'FUNCTION_BODY',
  p_plug_display_when_condition => 'if COM_PKG.COMREP_REPLICAR_SN(:P891_ID,:P1_SEGUSU_TIPO) = ''SI'' and :P1_SEGUSU_TIPO = ''PRV'' and :P891_VER_REPLICAR = ''NO'' and :P891_ESTADO in (''CON'',''NOC'') then'||unistr('\000a')||
'   return TRUE;'||unistr('\000a')||
'else'||unistr('\000a')||
'   return FALSE;'||unistr('\000a')||
'end if;',
  p_plug_header=> '<b>Sr. Proveedor</b> : En el caso de no estar de acuerdo con la calificación otorgada, puede ejercer su derecho y realizar un descargo justificando sus motivos. Para hacerlo presione el siguiente boton.<br>',
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
  p_id=> 69502821087820131 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 891,
  p_plug_name=> 'Contestar el Descargo',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236656544011903827+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 41,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 9,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_required_role => 69555822424820329+ wwv_flow_api.g_id_offset,
  p_plug_display_condition_type => 'FUNCTION_BODY',
  p_plug_display_when_condition => '  if (COM_PKG.COMREP_REPLICAR_SN(:P891_ID, :P1_SEGUSU_TIPO) = ''SI'') and (:P1_SEGUSU_TIPO = ''ECO'') AND (:P891_VER_REPLICAR = ''NO'') then'||unistr('\000a')||
'   return TRUE;'||unistr('\000a')||
'  else'||unistr('\000a')||
'   return FALSE;'||unistr('\000a')||
'  end if;',
  p_plug_header=> 'Puede contestar el descargo realizado justificando sus motivos. Para hacerlo presione el siguiente boton.<br>',
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
  p_id=> 69503405190820131 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 891,
  p_plug_name=> 'Resolución de Calificaciones',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236653927375903826+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 42,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 9,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_required_role => 69556431960820331+ wwv_flow_api.g_id_offset,
  p_plug_display_condition_type => 'FUNCTION_BODY',
  p_plug_display_when_condition => 'if COM_PKG.COMREP_REPLICAR_SN(:P891_ID,''ADM'') = ''SI'' and :P1_SEGUSU_TIPO = ''ADM'' and :P891_VER_REPLICAR = ''NO'' then'||unistr('\000a')||
'   return TRUE;'||unistr('\000a')||
'else'||unistr('\000a')||
'   return FALSE;'||unistr('\000a')||
'end if;',
  p_plug_header=> 'Ingrese la resolución tomada con respecto a la calificación en base a los motivos justificados. Recuerde, en caso de variar la calificación deberá realizar ademas el cambio de la misma.<br>',
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
  p_id=> 69503803875820134 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 891,
  p_plug_name=> 'Calificación de la Operación',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236653927375903826+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 9,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => '(:P891_ESTADO IN (''APR'') AND :P891_EDITAR_SN = ''SI'') OR :P891_ESTADO IN (''CON'',''NOC'')',
  p_plug_header=> '<a name="CALIF"></a>',
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
s:=s||'SELECT APEX_ITEM.CHECKBOX(1,ID) " "  '||unistr('\000a')||
'      ,APEX_ITEM.HIDDEN(2,ID) ID '||unistr('\000a')||
'      ,COMCTM_NOMBRE'||unistr('\000a')||
'      ,COMCTM_DESCRIPCION'||unistr('\000a')||
'      ,DECODE(VALOR_SN,''SI'',''<img src="#IMAGE_PREFIX#check.gif"/>'','''') VALOR_SN'||unistr('\000a')||
'FROM COM_CALIFICACIONES_MOT_V'||unistr('\000a')||
'WHERE COMCLF_ID = :P891_COMCLF_ID'||unistr('\000a')||
'  AND comctm_calificacion = :P891_COMCLF_CALIFICACION';

wwv_flow_api.create_report_region (
  p_id=> 69508416386820145 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 891,
  p_name=> 'Motivos de la Calificación',
  p_region_name=>'',
  p_parent_plug_id=>69503803875820134 + wwv_flow_api.g_id_offset,
  p_template=> 0+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 31,
  p_region_attributes=>'style="width:99%" ',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> 'declare'||unistr('\000a')||
'  cursor cr_comclm is'||unistr('\000a')||
'  select 1'||unistr('\000a')||
'  from COM_CALIFICACIONES_MOT_V'||unistr('\000a')||
'  where comclf_id = :P891_COMCLF_ID'||unistr('\000a')||
'    and comctm_calificacion = :P891_COMCLF_CALIFICACION;'||unistr('\000a')||
'  v_dummy number;'||unistr('\000a')||
'  v_retorno boolean:= false;'||unistr('\000a')||
'begin'||unistr('\000a')||
'    open cr_comclm;'||unistr('\000a')||
'    fetch cr_comclm into v_dummy;'||unistr('\000a')||
'    if cr_comclm%found then'||unistr('\000a')||
'       v_retorno := true;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    close cr_comclm;    '||unistr('\000a')||
'    if (:P891_ESTADO IN (''APR'') AND :P891_EDITAR_SN = ''NO'')  then'||unistr('\000a')||
'       v_retorno := false;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    return v_retorno;'||unistr('\000a')||
'    --'||unistr('\000a')||
'end;',
  p_display_condition_type=> 'FUNCTION_BODY',
  p_plug_caching=> 'NOT_CACHED',
  p_header=> '<b>¿Cuales son los Motivos de la Calificación?</b><br>',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 1,
  p_query_headings_type=> 'NO_HEADINGS',
  p_query_num_rows=> '99999',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se ha encontrado ningún dato',
  p_query_num_rows_item=> '99999',
  p_query_num_rows_type=> '0',
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
  p_sort_null=> 'F',
  p_query_asc_image=> 'arrow_down_gray_dark.gif',
  p_query_asc_image_attr=> 'width="13" height="12" alt=""',
  p_query_desc_image=> 'arrow_up_gray_dark.gif',
  p_query_desc_image_attr=> 'width="13" height="12" alt=""',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'Indique los motivos de su calificación marcándolos.');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 69508605067820145 + wwv_flow_api.g_id_offset,
  p_region_id=> 69508416386820145 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> ' ',
  p_column_display_sequence=> 1,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'PLSQL_EXPRESSION',
  p_display_when_condition=> ':P891_ESTADO NOT IN (''CON'',''NOC'') OR :P891_EDITAR_SN=''SI''',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '33',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 69508718541820145 + wwv_flow_api.g_id_offset,
  p_region_id=> 69508416386820145 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 2,
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
  p_id=> 69508816259820146 + wwv_flow_api.g_id_offset,
  p_region_id=> 69508416386820145 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMCTM_NOMBRE',
  p_column_display_sequence=> 4,
  p_column_heading=> '',
  p_column_html_expression=>'<a title="#COMCTM_DESCRIPCION#">#COMCTM_NOMBRE#</a>',
  p_column_link_attr=>'title="#COMCTM_DESCRIPCION#"',
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
  p_print_col_width=> '33',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 69508922842820146 + wwv_flow_api.g_id_offset,
  p_region_id=> 69508416386820145 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COMCTM_DESCRIPCION',
  p_column_display_sequence=> 5,
  p_column_heading=> '',
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
  p_id=> 69509030277820146 + wwv_flow_api.g_id_offset,
  p_region_id=> 69508416386820145 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'VALOR_SN',
  p_column_display_sequence=> 3,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'PLSQL_EXPRESSION',
  p_display_when_condition=> ':P891_ESTADO IN (''CON'',''NOC'')',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '33',
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
  p_id=> 69509325825820150 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 891,
  p_plug_name=> 'Datos Adicionales de Contrato',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236653927375903826+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 110,
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
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_plug_display_when_condition => 'P891_COMCTT_FORMATO_ORDEN',
  p_plug_display_when_cond2=>'CON',
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
  p_id=> 69517008566820175 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 891,
  p_plug_name=> 'Recibir entrega',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236655517815903826+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 130,
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 69517230267820176 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 891,
  p_plug_name=> 'Operaciones Habilitadas',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236653927375903826+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 15,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 9,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 69550231919820292 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 236663920507903831+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => '(:P1_SEGUSU_TIPO = ''PRV'' and :P891_ESTADO = ''APR'') or (:P1_SEGUSU_TIPO in (''ADM'',''ECO''))',
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
  p_id=> 69517416635820178 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 891,
  p_plug_name=> 'Informes & Comprobantes',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236653927375903826+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 9,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 69548929221820282 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 236663920507903831+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_required_role => 69560622867820335+ wwv_flow_api.g_id_offset,
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_footer=> '<br>',
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
  p_id=> 69517611486820178 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 891,
  p_plug_name=> 'Datos Orden de Compra',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236653927375903826+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => false,
  p_plug_grid_column_span => 8,
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
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 69490304903820035 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 891,
  p_plug_name=> 'Información de Auditoría',
  p_region_name=>'',
  p_parent_plug_id=>69517611486820178 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236654632828903826+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => false,
  p_plug_grid_column_span => 6,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
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
  p_plug_required_role => 69555411035820301+ wwv_flow_api.g_id_offset,
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
  p_id=> 69595021163992379 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 891,
  p_plug_name=> 'ORDEN',
  p_region_name=>'',
  p_parent_plug_id=>69517611486820178 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236652136205903825+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1000,
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 69597318402067298 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 891,
  p_plug_name=> 'CONTRATACIÓN',
  p_region_name=>'',
  p_parent_plug_id=>69517611486820178 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236652136205903825+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1000,
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 69605608377915954 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 891,
  p_plug_name=> 'SOLICITUD DE GASTO',
  p_region_name=>'',
  p_parent_plug_id=>69517611486820178 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236652136205903825+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1010,
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 69606908424944368 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 891,
  p_plug_name=> 'PROVEEDOR',
  p_region_name=>'',
  p_parent_plug_id=>69517611486820178 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236652136205903825+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1020,
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 69652525545872764 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 891,
  p_plug_name=> '<br>',
  p_region_name=>'',
  p_parent_plug_id=>69517611486820178 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236652136205903825+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1030,
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
s:=s||'select id id'||unistr('\000a')||
'      ,to_char(fecha_prorroga,''DD/MM/YYYY'') fecha_prorroga'||unistr('\000a')||
'      ,situacion_abr situacion'||unistr('\000a')||
'      ,to_char(fecha_situacion,''DD/MM/YYYY'') fecha_situacion'||unistr('\000a')||
'      ,to_char(fecha_prorrogada,''DD/MM/YYYY'') fecha_prorrogada'||unistr('\000a')||
'      ,ceil(fecha_prorroga - fecha_prorrogada) Dias'||unistr('\000a')||
'      ,motivo_prorroga motivo_prorroga'||unistr('\000a')||
'      ,motivo_anulacion motivo_anulacion'||unistr('\000a')||
'      ,decode((select max(id)'||unistr('\000a')||
'           ';

s:=s||'    from com_ordenes_compras_pro_v'||unistr('\000a')||
'               where comocm_id = :P891_ID'||unistr('\000a')||
'                 and situacion = ''VIG''),id,''<a href="f?p=&APP_ID.:985.:&SESSION.:::985:P985_ID:''||id||''">Anular</a>'',null) acciones'||unistr('\000a')||
'from com_ordenes_compras_pro_v comocp'||unistr('\000a')||
'where comocp.comocm_id = :P891_ID'||unistr('\000a')||
'order by id';

wwv_flow_api.create_report_region (
  p_id=> 69526628808820196 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 891,
  p_name=> 'Prórrogas de Entregas',
  p_region_name=>'',
  p_template=> 236653927375903826+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 990,
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => true,
  p_grid_column_span => 8,
  p_display_column=> 1,
  p_display_point=> 'BODY_1',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 236660639678903829+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se han registrado prórrogas.',
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
  p_id=> 69527422832820196 + wwv_flow_api.g_id_offset,
  p_region_id=> 69526628808820196 + wwv_flow_api.g_id_offset,
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
  p_id=> 69527012921820196 + wwv_flow_api.g_id_offset,
  p_region_id=> 69526628808820196 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_PRORROGA',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Fecha de<br> Prórroga',
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
  p_id=> 69527508285820196 + wwv_flow_api.g_id_offset,
  p_region_id=> 69526628808820196 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION',
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
  p_id=> 69527617297820196 + wwv_flow_api.g_id_offset,
  p_region_id=> 69526628808820196 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_SITUACION',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Fecha Situación',
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
  p_id=> 69527118573820196 + wwv_flow_api.g_id_offset,
  p_region_id=> 69526628808820196 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_PRORROGADA',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Fecha de entrega anterior',
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
  p_id=> 69526829967820196 + wwv_flow_api.g_id_offset,
  p_region_id=> 69526628808820196 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'DIAS',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Días',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'RIGHT',
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
  p_id=> 69527230723820196 + wwv_flow_api.g_id_offset,
  p_region_id=> 69526628808820196 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'MOTIVO_PRORROGA',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Motivo de <br> Prorroga',
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
  p_id=> 69527326362820196 + wwv_flow_api.g_id_offset,
  p_region_id=> 69526628808820196 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'MOTIVO_ANULACION',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Motivo de <br> Anulación',
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
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 69526916909820196 + wwv_flow_api.g_id_offset,
  p_region_id=> 69526628808820196 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'ACCIONES',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Acciones',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_display_when_condition=> 'P891_ESTADO',
  p_display_when_condition2=> 'APR',
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
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select  comcet.ID,'||unistr('\000a')||
'        comcet.SEGORG_ID,'||unistr('\000a')||
'        comcet.COMOCM_ID,'||unistr('\000a')||
'        comcet.CODIGO,'||unistr('\000a')||
'        comcet.FECHA_VENCIMIENTO,'||unistr('\000a')||
'        comcet.FECHA_RECEPCION,'||unistr('\000a')||
'        comcet.MONTO,'||unistr('\000a')||
'        comcet.OBSERVACION,'||unistr('\000a')||
'        comcet.COMCEE_ID,'||unistr('\000a')||
'        GRAL_PKG.OBTN_CFGABR(''COM_COMPROBANTES_ENT.TIPO_ENTREGA'', comcet.TIPO_ENTREGA) TIPO_ENTREGA,'||unistr('\000a')||
'        case comcet.SEGUSU_TIPO'||unistr('\000a')||
'          when ''ADM'' then ''Admi';

s:=s||'nistración'''||unistr('\000a')||
'          when ''ECO'' then ''Entidad Contratante'''||unistr('\000a')||
'          when ''PRV'' then ''Proveedor'''||unistr('\000a')||
'        else'||unistr('\000a')||
'          '''''||unistr('\000a')||
'        end SEGUSU_TIPO,'||unistr('\000a')||
'        comcet.COMCEE_ESTADO,'||unistr('\000a')||
'        comcet.COMCEE_ESTADO_ABR,'||unistr('\000a')||
'        comcet.COMCEE_MOTIVO,'||unistr('\000a')||
'        case :P891_ESTADO'||unistr('\000a')||
'          when ''APR'' then decode(comcet.COMCEE_ESTADO, ''ENT'', ''<a href="f?p=INFCOM:1015:&SESSION.::&DEBUG.::P1015_COMCET_ID,P1015_C';

s:=s||'OMOCM_ID:''||comcet.ID||'',''||comcet.COMOCM_ID||''"><img src="#IMAGE_PREFIX#menu/pt_print_20.png" alt="Imprimir" title="Imprimir"></a>'', '''')'||unistr('\000a')||
'          when ''CON'' then decode(comcet.COMCEE_ESTADO, ''ENT'', ''<a href="f?p=INFCOM:1015:&SESSION.::&DEBUG.::P1015_COMCET_ID,P1015_COMOCM_ID:''||comcet.ID||'',''||comcet.COMOCM_ID||''"><img src="#IMAGE_PREFIX#menu/pt_print_20.png" alt="Imprimir" title="Imprimir"></a>';

s:=s||''', '''')'||unistr('\000a')||
'          when ''NOC'' then decode(comcet.COMCEE_ESTADO, ''ENT'', ''<a href="f?p=INFCOM:1015:&SESSION.::&DEBUG.::P1015_COMCET_ID,P1015_COMOCM_ID:''||comcet.ID||'',''||comcet.COMOCM_ID||''"><img src="#IMAGE_PREFIX#menu/pt_print_20.png" alt="Imprimir" title="Imprimir"></a>'', '''')'||unistr('\000a')||
'          else'||unistr('\000a')||
'            '''''||unistr('\000a')||
'        end COMPROBANTE'||unistr('\000a')||
'from   COM_COMPROBANTES_ENT_V comcet'||unistr('\000a')||
'where  comcet.COMOCM_ID = :P891_I';

s:=s||'D'||unistr('\000a')||
'and    (instr(:P891_FILTRO_ESTADO_ENTREGA, comcet.COMCEE_ESTADO)) > 0'||unistr('\000a')||
'and    comcet.COMCEE_ESTADO <> ''NUE'' '||unistr('\000a')||
'order by FECHA_VENCIMIENTO desc, ID desc;';

wwv_flow_api.create_report_region (
  p_id=> 69527923617820196 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 891,
  p_name=> 'Entregas del Proveedor',
  p_region_name=>'',
  p_template=> 236653927375903826+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 50,
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_required_role => 69558930672820332+ wwv_flow_api.g_id_offset,
  p_display_when_condition=> 'declare'||unistr('\000a')||
'  cursor cr_segcfg is'||unistr('\000a')||
'    select valor'||unistr('\000a')||
'    from   SEG_CONFIGURACIONES segcfg'||unistr('\000a')||
'    where  segcfg.CODIGO = ''COMCET_ENTREGAS_ACTIVAR_SN'';'||unistr('\000a')||
' --'||unistr('\000a')||
'  v_segcfg cr_segcfg%rowtype;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
'  open cr_segcfg;'||unistr('\000a')||
'  fetch cr_segcfg into v_segcfg;'||unistr('\000a')||
'  close cr_segcfg;'||unistr('\000a')||
'  apex_debug.message(''VALOR=%s'',v_segcfg.valor);'||unistr('\000a')||
'  --'||unistr('\000a')||
'  if nvl(v_segcfg.valor, ''NO'') = ''SI'' then'||unistr('\000a')||
'    return true;'||unistr('\000a')||
'  else'||unistr('\000a')||
'    return false;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;',
  p_display_condition_type=> 'FUNCTION_BODY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 236660639678903829+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se han registrado Comprobantes de entrega',
  p_query_num_rows_type=> 'NEXT_PREVIOUS_LINKS',
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
  p_id=> 69528312773820203 + wwv_flow_api.g_id_offset,
  p_region_id=> 69527923617820196 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 1,
  p_column_heading=> '<br>',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ID.:983:&SESSION.::&DEBUG.:983:P983_ID,P983_COMOCM_ID,P983_PAG_ANTERIOR:#ID#,#COMOCM_ID#,&APP_PAGE_ID.',
  p_column_linktext=>'<img src="#IMAGE_PREFIX#e2.gif" alt="">',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'PLSQL_EXPRESSION',
  p_display_when_condition=> ':P891_ESTADO = ''APR''',
  p_display_as=>'ESCAPE_SC',
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
  p_id=> 69528424607820203 + wwv_flow_api.g_id_offset,
  p_region_id=> 69527923617820196 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'SEGORG_ID',
  p_column_display_sequence=> 2,
  p_column_heading=> 'SegorgId',
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
  p_id=> 69528531192820204 + wwv_flow_api.g_id_offset,
  p_region_id=> 69527923617820196 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMOCM_ID',
  p_column_display_sequence=> 3,
  p_column_heading=> 'ComocmId',
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
  p_id=> 69528625370820204 + wwv_flow_api.g_id_offset,
  p_region_id=> 69527923617820196 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'CODIGO',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Código',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
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
  p_id=> 69528720073820204 + wwv_flow_api.g_id_offset,
  p_region_id=> 69527923617820196 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VENCIMIENTO',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Fecha de Entrega',
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
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 69528226888820203 + wwv_flow_api.g_id_offset,
  p_region_id=> 69527923617820196 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_RECEPCION',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Fecha de Recepción',
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
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 69528807575820204 + wwv_flow_api.g_id_offset,
  p_region_id=> 69527923617820196 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'MONTO',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Monto',
  p_use_as_row_header=> 'N',
  p_column_format=> 'FML999G999G999G999G990D00',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
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
  p_id=> 69528923116820204 + wwv_flow_api.g_id_offset,
  p_region_id=> 69527923617820196 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'OBSERVACION',
  p_column_display_sequence=> 12,
  p_column_heading=> 'Observación',
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
  p_id=> 69529030026820204 + wwv_flow_api.g_id_offset,
  p_region_id=> 69527923617820196 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'COMCEE_ID',
  p_column_display_sequence=> 9,
  p_column_heading=> 'ComceeId',
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
  p_id=> 69528107956820200 + wwv_flow_api.g_id_offset,
  p_region_id=> 69527923617820196 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'TIPO_ENTREGA',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Entrega',
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
  p_id=> 69529328377820204 + wwv_flow_api.g_id_offset,
  p_region_id=> 69527923617820196 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'SEGUSU_TIPO',
  p_column_display_sequence=> 15,
  p_column_heading=> 'Generado por',
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
  p_id=> 69529123669820204 + wwv_flow_api.g_id_offset,
  p_region_id=> 69527923617820196 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'COMCEE_ESTADO',
  p_column_display_sequence=> 10,
  p_column_heading=> 'ComceeEstado',
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
  p_id=> 69529219021820204 + wwv_flow_api.g_id_offset,
  p_region_id=> 69527923617820196 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'COMCEE_ESTADO_ABR',
  p_column_display_sequence=> 11,
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 69529424947820204 + wwv_flow_api.g_id_offset,
  p_region_id=> 69527923617820196 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'COMCEE_MOTIVO',
  p_column_display_sequence=> 13,
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
  p_id=> 69529505247820204 + wwv_flow_api.g_id_offset,
  p_region_id=> 69527923617820196 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 15,
  p_form_element_id=> null,
  p_column_alias=> 'COMPROBANTE',
  p_column_display_sequence=> 14,
  p_column_heading=> 'Comprobante',
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
  p_id=> 69669928968252317 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 891,
  p_plug_name=> 'Top Bar',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236656219840903827+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
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
  p_id=> 69670606158274087 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 891,
  p_plug_name=> 'Acerca de ...',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236653927375903826+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 2,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> 9,
  p_plug_display_point=> 'BODY_1',
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
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 69502429728820131 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 891,
  p_button_sequence=> 110,
  p_button_plug_id => 69502200299820129+wwv_flow_api.g_id_offset,
  p_button_name    => 'REPLICA_PRV',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(236666722652903832+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Realizar Descargo',
  p_button_position=> 'BELOW_BOX',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:891:&SESSION.::&DEBUG.::P891_VER_REPLICAR:SI',
  p_button_condition=> 'IF COM_PKG.COMREP_REPLICAR_SN(:P891_ID,:P1_SEGUSU_TIPO) = ''SI'' AND :P891_VER_REPLICAR = ''NO'' and :P891_ESTADO IN (''CON'',''NOC'') THEN'||unistr('\000a')||
'   RETURN TRUE;'||unistr('\000a')||
'ELSE'||unistr('\000a')||
'   RETURN FALSE;'||unistr('\000a')||
'END IF;',
  p_button_condition_type=> 'FUNCTION_BODY',
  p_security_scheme => 69557020444820331+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 69503017132820131 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 891,
  p_button_sequence=> 130,
  p_button_plug_id => 69502821087820131+wwv_flow_api.g_id_offset,
  p_button_name    => 'REPLICA_ECO',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(236666722652903832+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Contestar',
  p_button_position=> 'BELOW_BOX',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:891:&SESSION.::&DEBUG.::P891_VER_REPLICAR:SI',
  p_button_condition=> 'IF COM_PKG.COMREP_REPLICAR_SN(:P891_ID,:P1_SEGUSU_TIPO) = ''SI'' AND :P891_VER_REPLICAR = ''NO'' THEN'||unistr('\000a')||
'   RETURN TRUE;'||unistr('\000a')||
'ELSE'||unistr('\000a')||
'   RETURN FALSE;'||unistr('\000a')||
'END IF;',
  p_button_condition_type=> 'FUNCTION_BODY',
  p_security_scheme => 69555822424820329+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 69503625549820132 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 891,
  p_button_sequence=> 140,
  p_button_plug_id => 69503405190820131+wwv_flow_api.g_id_offset,
  p_button_name    => 'REPLICA_ADM',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(236666722652903832+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Ingrese la Resolución',
  p_button_position=> 'BELOW_BOX',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:891:&SESSION.::&DEBUG.::P891_VER_REPLICAR:SI',
  p_button_condition=> 'IF COM_PKG.COMREP_REPLICAR_SN(:P891_ID,:P1_SEGUSU_TIPO) = ''SI'' AND :P891_VER_REPLICAR = ''NO'' THEN'||unistr('\000a')||
'   RETURN TRUE;'||unistr('\000a')||
'ELSE'||unistr('\000a')||
'   RETURN FALSE;'||unistr('\000a')||
'END IF;',
  p_button_condition_type=> 'FUNCTION_BODY',
  p_security_scheme => 69556431960820331+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 69502011028820126 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 891,
  p_button_sequence=> 70,
  p_button_plug_id => 69499207673820121+wwv_flow_api.g_id_offset,
  p_button_name    => 'ANULAR',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(236666722652903832+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Anular Descargo',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:confirmDelete(htmldb_cancel_message,''COMCLF_ANULAR'');',
  p_button_execute_validations=>'Y',
  p_button_condition=> ':P891_ESTADO IN (''CON'',''NOC'') and :P891_EDITAR_SN = ''NO''',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 69561102524820335+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 69504015256820134 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 891,
  p_button_sequence=> 70,
  p_button_plug_id => 69503803875820134+wwv_flow_api.g_id_offset,
  p_button_name    => 'ANULAR',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(236666722652903832+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Anular Calificación',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:confirmDelete(htmldb_cancel_message,''COMCLF_ANULAR'');',
  p_button_condition=> ':P891_ESTADO IN (''CON'',''NOC'') and :P891_EDITAR_SN = ''NO''',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 69561102524820335+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 69498029685820107 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 891,
  p_button_sequence=> 80,
  p_button_plug_id => 69497832654820107+wwv_flow_api.g_id_offset,
  p_button_name    => 'REPLICA_PRV',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(236666722652903832+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Confirmar',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:replicar(''PRV'');',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'if (COM_PKG.COMREP_REPLICAR_SN(:P891_ID,:P1_SEGUSU_TIPO) = ''SI'') and (:P1_SEGUSU_TIPO = ''PRV'') then'||unistr('\000a')||
'   return TRUE;'||unistr('\000a')||
'else'||unistr('\000a')||
'   return FALSE;'||unistr('\000a')||
'end if;',
  p_button_condition_type=> 'FUNCTION_BODY',
  p_security_scheme => 69557020444820331+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 69498218145820118 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 891,
  p_button_sequence=> 90,
  p_button_plug_id => 69497832654820107+wwv_flow_api.g_id_offset,
  p_button_name    => 'REPLICA_ECO',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(236666722652903832+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Confirmar',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:replicar(''ECO'');',
  p_button_execute_validations=>'N',
  p_button_condition=> 'if (COM_PKG.COMREP_REPLICAR_SN(:P891_ID,:P1_SEGUSU_TIPO) = ''SI'') and (:P1_SEGUSU_TIPO = ''ECO'') then'||unistr('\000a')||
'   return TRUE;'||unistr('\000a')||
'else'||unistr('\000a')||
'   return FALSE;'||unistr('\000a')||
'end if;',
  p_button_condition_type=> 'FUNCTION_BODY',
  p_security_scheme => 69555822424820329+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 69498411379820118 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 891,
  p_button_sequence=> 100,
  p_button_plug_id => 69497832654820107+wwv_flow_api.g_id_offset,
  p_button_name    => 'REPLICA_ADM',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(236666722652903832+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Confirmar',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:replicar(''ADM'');',
  p_button_execute_validations=>'N',
  p_button_condition=> 'if (COM_PKG.COMREP_REPLICAR_SN(:P891_ID,:P1_SEGUSU_TIPO) = ''SI'') and (:P1_SEGUSU_TIPO = ''ADM'') then'||unistr('\000a')||
'   return TRUE;'||unistr('\000a')||
'else'||unistr('\000a')||
'   return FALSE;'||unistr('\000a')||
'end if;',
  p_button_condition_type=> 'FUNCTION_BODY',
  p_security_scheme => 69556431960820331+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 69498611839820118 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 891,
  p_button_sequence=> 120,
  p_button_plug_id => 69497832654820107+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(236666722652903832+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancelar',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 69518225939820181 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 891,
  p_button_sequence=> 20,
  p_button_plug_id => 69517611486820178+wwv_flow_api.g_id_offset,
  p_button_name    => 'ACEPTAR',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(236666722652903832+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Aprobar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_condition=> ':P891_ESTADO NOT IN (''APR'',''RCH'',''ANU'',''CON'',''NOC'')',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 69559811447820334+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 69518416213820181 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 891,
  p_button_sequence=> 30,
  p_button_plug_id => 69517611486820178+wwv_flow_api.g_id_offset,
  p_button_name    => 'ANULAR',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(236666722652903832+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Anular',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_condition=> ':P891_ESTADO NOT IN (''ANU'',''PEN'',''CON'',''NOC'')',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 69561102524820335+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 69518615191820181 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 891,
  p_button_sequence=> 40,
  p_button_plug_id => 69517611486820178+wwv_flow_api.g_id_offset,
  p_button_name    => 'RECHAZAR',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(236666722652903832+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Rechazar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_condition=> ':P891_ESTADO NOT IN (''APR'',''RCH'', ''ANU'',''CON'',''NOC'')',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 69560214977820335+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 69529609134820204 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 891,
  p_button_sequence=> 200,
  p_button_plug_id => 69527923617820196+wwv_flow_api.g_id_offset,
  p_button_name    => 'COMCET_CREAR',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(236667336255903833+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Registrar Entrega',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> ':P891_ESTADO = ''APR''',
  p_button_condition_type=> 'PLSQL_EXPRESSION',
  p_security_scheme => 69558930672820332+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 69527707866820196 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 891,
  p_button_sequence=> 210,
  p_button_plug_id => 69526628808820196+wwv_flow_api.g_id_offset,
  p_button_name    => 'AGREGAR_PRORROGA',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(236667336255903833+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Agregar Prórroga',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P891_ESTADO',
  p_button_condition2=> 'APR',
  p_button_condition_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_security_scheme => 69558008934820331+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 69518802133820181 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 891,
  p_button_sequence=> 60,
  p_button_plug_id => 69517611486820178+wwv_flow_api.g_id_offset,
  p_button_name    => 'IMPRIMIR',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(236666722652903832+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Imprimir Comprobante',
  p_button_position=> 'REGION_TEMPLATE_NEXT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=INFCOM:1005:&SESSION.::&DEBUG.:1005:P1_SEGORG_CODIGO,P1005_COMOCM_ID:&P1_SEGORG_CODIGO.,&P891_ID.',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 69560622867820335+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 69509520090820150 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 891,
  p_button_sequence=> 160,
  p_button_plug_id => 69509325825820150+wwv_flow_api.g_id_offset,
  p_button_name    => 'APPLY_CHANGES',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(236666722652903832+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Aplicar Cambios',
  p_button_position=> 'REGION_TEMPLATE_NEXT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 69509732329820151 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 891,
  p_button_sequence=> 150,
  p_button_plug_id => 69509325825820150+wwv_flow_api.g_id_offset,
  p_button_name    => 'EDITAR',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(236666722652903832+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Editar',
  p_button_position=> 'REGION_TEMPLATE_PREVIOUS',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 69518028577820179 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 891,
  p_button_sequence=> 100,
  p_button_plug_id => 69669928968252317+wwv_flow_api.g_id_offset,
  p_button_name    => 'Cancelar',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(236666722652903832+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Retornar',
  p_button_position=> 'TEMPLATE_DEFAULT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:&P1_PAG_ANTERIOR.:&SESSION.::&DEBUG.:::',
  p_button_condition=> 'P891_APP_ANTERIOR',
  p_button_condition_type=> 'ITEM_IS_NULL',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 69517815543820179 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 891,
  p_button_sequence=> 101,
  p_button_plug_id => 69669928968252317+wwv_flow_api.g_id_offset,
  p_button_name    => 'RETORNAR',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(236667336255903833+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Retornar',
  p_button_position=> 'TEMPLATE_DEFAULT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&P891_APP_ANTERIOR.:&P891_PAG_ANTERIOR.:&SESSION.:::::',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P891_APP_ANTERIOR',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_button_comment=>'f?p=&P891_APP_ANTERIOR.:&P891_PAG_ANTERIOR.:&SESSION.:::&P891_PAG_ANTERIOR.::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>69542309751820251 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:891:&SESSION.::&DEBUG.::P891_ID:&P891_ID.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>2882413109823112+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>69542528891820256 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:892:&SESSION.::&DEBUG.:892:P892_COMOCM_ID:&P891_ID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>69518225939820181+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>69542716438820256 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:894:&SESSION.::&DEBUG.:894:P894_COMOCM_ID:&P891_ID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>69518615191820181+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 20,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>69542914862820257 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:896:&SESSION.::&DEBUG.:896:P896_COMOCM_ID:&P891_ID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>69518416213820181+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 30,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>69543104098820257 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:891:&SESSION.::&DEBUG.::P891_EDITAR_SN:SI',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>69507402629820143+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 40,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 17-MAR-2010 11:15 by FVALLEJO');
 
wwv_flow_api.create_page_branch(
  p_id=>69543314897820257 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:891:&SESSION.::&DEBUG.::P891_EDITAR_SN:NO',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>69507829206820143+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 50,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 17-MAR-2010 11:15 by FVALLEJO');
 
wwv_flow_api.create_page_branch(
  p_id=>69543506898820257 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:891:&SESSION.::&DEBUG.:891:P891_EDITAR_SN,P891_ID,P891_APP_ANTERIOR,P891_PAG_ANTERIOR:NO,&P891_ID.,&P891_APP_ANTERIOR.,&P891_PAG_ANTERIOR.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>69506626450820142+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 60,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 17-MAR-2010 11:15 by FVALLEJO'||unistr('\000a')||
'P891_EDITAR_SN,P891_ID, P891_APP_ANTERIOR,  P891_PAG_ANTERIOR'||unistr('\000a')||
'NO,          &P891_ID., &P891_APP_ANTERIOR.,&P891_PAG_ANTERIOR.');
 
wwv_flow_api.create_page_branch(
  p_id=>69543710995820257 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:898:&SESSION.::&DEBUG.:898:P898_APP_ANTERIOR,P898_PAG_ANTERIOR,P898_ID:&APP_ID.,&APP_PAGE_ID.,&P891_ID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>13220023048126785+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 70,
  p_save_state_before_branch_yn=>'Y',
  p_branch_comment=> 'Created 17-ENE-2011 11:51 by CTISSERA');
 
wwv_flow_api.create_page_branch(
  p_id=>69543906524820257 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:891:&SESSION.::&DEBUG.:898:P891_VER_REPLICAR:NO',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 80,
  p_branch_condition_type=> 'REQUEST_EQUALS_CONDITION',
  p_branch_condition=> 'replicar',
  p_save_state_before_branch_yn=>'Y',
  p_branch_comment=> 'Created 17-ENE-2011 11:51 by CTISSERA');
 
wwv_flow_api.create_page_branch(
  p_id=>69544130406820257 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:891:&SESSION.::&DEBUG.::P891_VER_REPLICAR:NO',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>13796718767246117+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 90,
  p_save_state_before_branch_yn=>'Y',
  p_branch_comment=> 'Created 28-ENE-2011 12:06 by CTISSERA');
 
wwv_flow_api.create_page_branch(
  p_id=>69544305798820257 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:891:&SESSION.::&DEBUG.::P891_EDICION:SI',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>35174710484976376+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 100,
  p_save_state_before_branch_yn=>'Y',
  p_branch_comment=> 'Created 18-MAY-2012 16:38 by CTISSERA');
 
wwv_flow_api.create_page_branch(
  p_id=>69544902141820259 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_branch_name=> 'Agregar Entrega',
  p_branch_action=> 'f?p=&APP_ID.:980:&SESSION.::&DEBUG.:980,981,982:P980_COMOCM_ID:&P891_ID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>69529609134820204+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 110,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>69544725035820259 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_branch_name=> 'agregar prorroga',
  p_branch_action=> 'f?p=&APP_ID.:985:&SESSION.::&DEBUG.:985::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>60198903574896103+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 115,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>69544528676820259 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:891:&SESSION.::&DEBUG.::P891_APP_ANTERIOR,P891_PAG_ANTERIOR,P891_EDICION:&P891_APP_ANTERIOR.,&P891_PAG_ANTERIOR.,NO',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 999,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>69490523489820048 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_DATE_CREATED',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 180,
  p_item_plug_id => 69490304903820035+wwv_flow_api.g_id_offset,
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
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
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
  p_id=>69490701861820071 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_CREATED_BY',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 190,
  p_item_plug_id => 69490304903820035+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Creado por :',
  p_source=>'CREATED_BY',
  p_source_type=> 'DB_COLUMN',
  p_source_post_computation => 'NVL(SEG_PKG.OBTN_SEGUSU_NOMBRE(:P891_CREATED_BY),:P891_CREATED_BY)',
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
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
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
  p_id=>69490931656820073 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_DATE_MODIFIED',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 200,
  p_item_plug_id => 69490304903820035+wwv_flow_api.g_id_offset,
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
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
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
  p_id=>69491132492820073 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_MODIFIED_BY',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 210,
  p_item_plug_id => 69490304903820035+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Actualizado por :',
  p_source=>'MODIFIED_BY',
  p_source_type=> 'DB_COLUMN',
  p_source_post_computation => 'NVL(SEG_PKG.OBTN_SEGUSU_NOMBRE(:P891_MODIFIED_BY),:P891_MODIFIED_BY)',
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
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
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
  p_id=>69494910091820092 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_VER_REPLICAR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 398,
  p_item_plug_id => 69491523063820078+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
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
  p_id=>69496420951820095 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_FILTRO_ESTADO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 69495105833820095+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'VIG',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Filtrado por :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_RADIOGROUP',
  p_named_lov=> 'TIPO_FILTRADO_EST',
  p_lov=> '.'||to_char(69545021495820260 + wwv_flow_api.g_id_offset)||'.',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 3,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'CENTER-TOP',
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'N',
  p_attribute_01 => '4',
  p_attribute_02 => 'REDIRECT_SET_VALUE',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>69496808306820101 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMRED_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 578,
  p_item_plug_id => 69496610600820100+wwv_flow_api.g_id_offset,
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
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>69497015779820103 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMRED_DESTINO_ECO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 748,
  p_item_plug_id => 69496610600820100+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'<b>¿A quién dirigirá su descargo?</b>',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_RADIOGROUP',
  p_lov=> 'STATIC:Administración;ADM,Proveedor;PRV',
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
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT-CENTER',
  p_display_when=>':P1_SEGUSU_TIPO = ''ECO''',
  p_display_when_type=>'PLSQL_EXPRESSION',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => '2',
  p_attribute_02 => 'NONE',
  p_attribute_04 => 'VERTICAL',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>69497217601820104 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMRED_DESTINO_ADM',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 758,
  p_item_plug_id => 69496610600820100+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'<b>¿A quién dirigirá su descargo?</b>',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_RADIOGROUP',
  p_lov=> 'STATIC:Unidad Ejecutora;ECO,Proveedor;PRV',
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
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT-CENTER',
  p_display_when=>':P1_SEGUSU_TIPO = ''ADM'' AND :P891_RESOLVER = ''NO''',
  p_display_when_type=>'PLSQL_EXPRESSION',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => '2',
  p_attribute_02 => 'NONE',
  p_attribute_04 => 'VERTICAL',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>69497606060820106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMENTARIO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 69497414178820104+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Detalle del Descargo (hasta 400 caracteres)',
  p_post_element_text=>'<br>'||unistr('\000a')||
'Confirme el registro y le permitiremos adjuntar un documento para indicar mayores detalles.',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 57,
  p_cMaxlength=> 400,
  p_cHeight=> 8,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>69498813709820118 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_RESOLVER',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 588,
  p_item_plug_id => 69497832654820107+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'SI',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'<b>¿Dará por resuelta la calificación?</b>',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_RADIOGROUP',
  p_lov=> 'STATIC2:SI;SI,NO;NO',
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
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT-CENTER',
  p_display_when=>'if (COM_PKG.COMREP_REPLICAR_SN(:P891_ID,:P1_SEGUSU_TIPO) = ''SI'') and (:P1_SEGUSU_TIPO = ''ADM'') then'||unistr('\000a')||
'   return TRUE;'||unistr('\000a')||
'else'||unistr('\000a')||
'   return FALSE;'||unistr('\000a')||
'end if;',
  p_display_when_type=>'FUNCTION_BODY',
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
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
  p_id=>69502608841820131 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_REPLICAR_HS_PRV',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 728,
  p_item_plug_id => 69502200299820129+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'<b>Horas restantes para poder replicar:  </b> ',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
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
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
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
  p_id=>69503206894820131 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_REPLICAR_HS_ECO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 738,
  p_item_plug_id => 69502821087820131+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'<b>Horas restantes para poder replicar:  </b> ',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
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
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
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
  p_id=>69504220606820134 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_TEXTO_TITULO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 418,
  p_item_plug_id => 69503803875820134+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'declare'||unistr('\000a')||
'  cursor cr_comclm is'||unistr('\000a')||
'  select 1'||unistr('\000a')||
'  from COM_CALIFICACIONES_MOT_V'||unistr('\000a')||
'  where comclf_id = :P891_COMCLF_ID'||unistr('\000a')||
'    and comctm_calificacion = :P891_COMCLF_CALIFICACION;'||unistr('\000a')||
'  v_dummy number;'||unistr('\000a')||
'  v_retorno VARCHAR2(100);'||unistr('\000a')||
'begin'||unistr('\000a')||
'    open cr_comclm;'||unistr('\000a')||
'    fetch cr_comclm into v_dummy;'||unistr('\000a')||
'    if cr_comclm%found then'||unistr('\000a')||
'       v_retorno := ''Motivos que justificaron la calificación.'';'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    close cr_comclm;    '||unistr('\000a')||
'    if (:P891_ESTADO IN (''APR'') AND :P891_EDITAR_SN = ''NO'')  then'||unistr('\000a')||
'       v_retorno := ''Indique los motivos de su calificación marcándolos.'';'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    return v_retorno;'||unistr('\000a')||
'    --'||unistr('\000a')||
'end;',
  p_source_type=> 'FUNCTION_BODY',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
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
  p_id=>69504423684820135 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMCLF_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 311,
  p_item_plug_id => 69503803875820134+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'COMCLF_ID',
  p_source_type=> 'STATIC',
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
  p_id=>69504622758820135 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMCLF_TIPO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 316,
  p_item_plug_id => 69503803875820134+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'PRV',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tipo',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 3,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 236666431064903832+wwv_flow_api.g_id_offset,
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
h:=h||'<b>Calificar</b> es el último paso de una &P1_COMETQ_OCMS. y es el reporte<br> de cómo resultó una operación entre <b>&P1_COMETQ_PRV.</b> y <b>&P1_COMETQ_CON.</b>.';

wwv_flow_api.create_page_item(
  p_id=>69504830364820135 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMCLF_CALIFICACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 320,
  p_item_plug_id => 69503803875820134+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'¿Cómo calificaría al &P1_COMETQ_PRVS. en esta operación?',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_RADIOGROUP',
  p_lov=> 'select ''<font  color="red"><b>''||rv_meaning||''</font></b>''  d'||unistr('\000a')||
'       ,TO_NUMBER(rv_low_value) r '||unistr('\000a')||
'from   cg_ref_codes'||unistr('\000a')||
'where  rv_domain = ''COM_CALIFICACIONES.CALIFICACION'''||unistr('\000a')||
'  AND  rv_low_value = -1'||unistr('\000a')||
'UNION'||unistr('\000a')||
'select ''<font><b>''||rv_meaning||''</font></b>''  d'||unistr('\000a')||
'       ,TO_NUMBER(rv_low_value) r '||unistr('\000a')||
'from   cg_ref_codes'||unistr('\000a')||
'where  rv_domain = ''COM_CALIFICACIONES.CALIFICACION'''||unistr('\000a')||
'  AND  rv_low_value = 0'||unistr('\000a')||
'  AND  ''NOC'' = :P891_COMOCM_CONCRETRADA_SN'||unistr('\000a')||
'UNION'||unistr('\000a')||
'select ''<font color="green"><b>''||rv_meaning||''</font></b>''  d'||unistr('\000a')||
'       ,TO_NUMBER(rv_low_value) r '||unistr('\000a')||
'from   cg_ref_codes'||unistr('\000a')||
'where  rv_domain = ''COM_CALIFICACIONES.CALIFICACION'''||unistr('\000a')||
'  AND  rv_low_value = 1'||unistr('\000a')||
'  AND  ''CON'' = :P891_COMOCM_CONCRETRADA_SN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_read_only_when=>':P891_ESTADO IN (''CON'',''NOC'') AND (:P891_EDITAR_SN=''NO'')',
  p_read_only_when_type=>'PLSQL_EXPRESSION',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'N',
  p_help_text=> h,
  p_attribute_01 => '3',
  p_attribute_02 => 'SUBMIT',
  p_attribute_03 => 'N',
  p_attribute_04 => 'VERTICAL',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Indique la justificación de su Calificación';

wwv_flow_api.create_page_item(
  p_id=>69505315397820140 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMCLF_COMENTARIO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 321,
  p_item_plug_id => 69503803875820134+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comentarios sobre esta operación:',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 50,
  p_cMaxlength=> 2000,
  p_cHeight=> 3,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_display_when=>'(SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo    => ''COMADM_OCMGES_ACTIVAR_MOTIVO_CLF'''||unistr('\000a')||
'                          ,p_segorg_id => :P1_SEGORG_ID) = ''SI'')'||unistr('\000a')||
'AND ((:P891_ESTADO IN (''APR'')) OR (:P891_ESTADO IN (''CON'',''NOC'')'||unistr('\000a')||
'       AND :P891_COMCLF_COMENTARIO IS NOT NULL) OR :P891_EDITAR_SN = ''SI'')',
  p_display_when_type=>'PLSQL_EXPRESSION',
  p_read_only_when=>':P891_ESTADO IN (''CON'',''NOC'') AND :P891_EDITAR_SN = ''NO''',
  p_read_only_when_type=>'PLSQL_EXPRESSION',
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>69505830613820142 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMCLF_FECHA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 322,
  p_item_plug_id => 69503803875820134+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Calificado el:',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 8,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>':P891_ESTADO IN (''CON'',''NOC'') AND (:P891_EDITAR_SN=''SI'');',
  p_display_when_type=>'NEVER',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
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
  p_id=>69506013768820142 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMCLF_SITUACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 323,
  p_item_plug_id => 69503803875820134+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'VIG',
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
  p_colspan=> 8,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 236666431064903832+wwv_flow_api.g_id_offset,
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
  p_id=>69506232689820142 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMOCM_CONCRETRADA_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 318,
  p_item_plug_id => 69503803875820134+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'CON',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'¿Recibió los Bienes y/o Servicios solicitados?',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_RADIOGROUP',
  p_lov=> 'STATIC2:SI;CON,NO;NOC',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 8,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_read_only_when=>':P891_ESTADO IN (''CON'',''NOC'') AND (:P891_EDITAR_SN=''NO'')',
  p_read_only_when_type=>'PLSQL_EXPRESSION',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'N',
  p_attribute_01 => '2',
  p_attribute_02 => 'SUBMIT',
  p_attribute_03 => 'Y',
  p_attribute_04 => 'VERTICAL',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>69506413788820142 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_SEPARACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 319,
  p_item_plug_id => 69503803875820134+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_STOP_AND_START_HTML_TABLE',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>69506626450820142 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_CALIFICAR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 337,
  p_item_plug_id => 69503803875820134+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'Calificar',
  p_prompt=>'Calificar',
  p_source=>'Calificar',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(236666722652903832 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> null,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_display_when=>':P891_ESTADO IN (''APR'')',
  p_display_when_type=>'PLSQL_EXPRESSION',
  p_is_persistent=> 'N',
  p_security_scheme => 69558008934820331+ wwv_flow_api.g_id_offset,
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
  p_id=>69506820613820143 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMCLF_COMOCM_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 313,
  p_item_plug_id => 69503803875820134+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'COMOCM_ID',
  p_source=>'ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
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
  p_read_only_when_type=>'ALWAYS',
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
  p_id=>69507032684820143 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMCLF_COMPRV_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 314,
  p_item_plug_id => 69503803875820134+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'COMPRV_ID',
  p_source=>'COMPRV_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when_type=>'ALWAYS',
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
  p_id=>69507228090820143 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMCLF_COMECO_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 315,
  p_item_plug_id => 69503803875820134+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'COMECO_ID',
  p_source=>'COMECO_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when_type=>'ALWAYS',
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
  p_id=>69507402629820143 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_EDITAR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 326,
  p_item_plug_id => 69503803875820134+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'Editar',
  p_prompt=>'Cambiar Calificación',
  p_source=>'Editar',
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
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_display_when=>':P891_ESTADO IN (''CON'',''NOC'') AND (:P891_EDITAR_SN=''NO'');',
  p_display_when_type=>'NEVER',
  p_is_persistent=> 'N',
  p_security_scheme => 69558503455820332+ wwv_flow_api.g_id_offset,
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>69507611754820143 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_EDITAR_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 317,
  p_item_plug_id => 69503803875820134+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Editar Sn',
  p_source=>'NO',
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
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
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
  p_id=>69507829206820143 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_RECALIFICAR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 327,
  p_item_plug_id => 69503803875820134+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'RECALIFICAR',
  p_prompt=>'Calificar',
  p_source=>'RECALIFICAR',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_new_grid=> true,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> null,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_display_when=>':P891_ESTADO IN (''CON'',''NOC'') AND (:P891_EDITAR_SN=''SI'')',
  p_display_when_type=>'PLSQL_EXPRESSION',
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
  p_id=>69508024123820143 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_CANCELAR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 338,
  p_item_plug_id => 69503803875820134+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'CANCEL',
  p_prompt=>'Cancelar',
  p_source=>'CANCEL',
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
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P891_EDITAR_SN',
  p_display_when2=>'SI',
  p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
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
  p_id=>69508200479820143 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_FECHA_PRORROGA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 688,
  p_item_plug_id => 69503803875820134+wwv_flow_api.g_id_offset,
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
  p_id=>69509131524820148 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_MSJ',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 282,
  p_item_plug_id => 69508416386820145+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_display_as=> 'NATIVE_STOP_AND_START_HTML_TABLE',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>69509913609820153 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_NOMBRE_COMITENTE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 428,
  p_item_plug_id => 69509325825820150+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Nombre Comitente : ',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 80,
  p_cMaxlength=> 4000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when=>'P891_EDICION',
  p_read_only_when2=>'NO',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>69510110062820153 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMCTT_FORMATO_ORDEN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 438,
  p_item_plug_id => 69509325825820150+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'COMCTT_FORMATO_ORDEN',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
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
  p_id=>69510302939820153 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMPANIA_ASEGURADORA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 448,
  p_item_plug_id => 69509325825820150+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Compañia Aseguradora : ',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 75,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when=>'P891_EDICION',
  p_read_only_when2=>'NO',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
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
  p_id=>69510501178820153 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_NRO_POLIZA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 458,
  p_item_plug_id => 69509325825820150+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Número de Poliza : ',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when=>'P891_EDICION',
  p_read_only_when2=>'NO',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
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
  p_id=>69510720952820153 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_MONTO_SEGURO_CAUCION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 468,
  p_item_plug_id => 69509325825820150+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Monto Seguro de Caución : ',
  p_format_mask=>'FML999G999G999G999G990D00',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_NUMBER_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when=>'P891_EDICION',
  p_read_only_when2=>'NO',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_03 => 'right',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>69510922484820153 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_DENOMINACION_DE_OBRA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 478,
  p_item_plug_id => 69509325825820150+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Denominación de Obra : ',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 75,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when=>'P891_EDICION',
  p_read_only_when2=>'NO',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
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
  p_id=>69511118829820153 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_DECRETO_NRO_ADJ',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 488,
  p_item_plug_id => 69509325825820150+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Número de Decreto : ',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when=>'P891_EDICION',
  p_read_only_when2=>'NO',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
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
  p_id=>69511302566820153 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_DECRETO_FECHA_ADJ',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 498,
  p_item_plug_id => 69509325825820150+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha del Decreto : ',
  p_format_mask=>'DD/MM/RRRR',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DATE_PICKER',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 12,
  p_cMaxlength=> 4000,
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
  p_read_only_when=>'P891_EDICION',
  p_read_only_when2=>'NO',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
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
  p_id=>69511524543820154 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_DOC_A_PRESENTAR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 508,
  p_item_plug_id => 69509325825820150+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Documentación a Presentar : ',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 80,
  p_cMaxlength=> 4000,
  p_cHeight=> 4,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when=>'P891_EDICION',
  p_read_only_when2=>'NO',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>69511721072820154 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_PLAZO_EJEC_OBRA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 518,
  p_item_plug_id => 69509325825820150+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Plazo de Ejecución de Obra : ',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 80,
  p_cMaxlength=> 4000,
  p_cHeight=> 4,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when=>'P891_EDICION',
  p_read_only_when2=>'NO',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>69511904944820154 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_PORC_ANT_FINANC',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 528,
  p_item_plug_id => 69509325825820150+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Porcentaje Anticipo Financiero : ',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when=>'P891_EDICION',
  p_read_only_when2=>'NO',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
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
  p_id=>69512117611820154 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_NOMBRE_REPR_PROV',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 548,
  p_item_plug_id => 69509325825820150+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Representante del Proveedor : ',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 75,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when=>'P891_EDICION',
  p_read_only_when2=>'NO',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
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
  p_id=>69512316176820154 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_DOC_REPR_PROV',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 558,
  p_item_plug_id => 69509325825820150+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tipo y Número de Documento : ',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when=>'P891_EDICION',
  p_read_only_when2=>'NO',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
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
  p_id=>69512521952820154 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_CARACTER_REPR_PROV',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 568,
  p_item_plug_id => 69509325825820150+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Carácter : ',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when=>'P891_EDICION',
  p_read_only_when2=>'NO',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
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
  p_id=>69519029519820181 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMPED_DOMICILIO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 262,
  p_item_plug_id => 69605608377915954+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Domicilio de Entrega: ',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_tag_attributes  => 'style="font-weight:bold"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 7,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>69519202497820181 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMCON_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 253,
  p_item_plug_id => 69597318402067298+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Proceso de Contratación: ',
  p_pre_element_text=>'<span style="font-weight:bold;color:red">',
  p_post_element_text=>' / &P891_COMPED_EJERCICIO. </span>',
  p_source=>'COMCON_CODIGO',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 100,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 3,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold;"',
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
  p_id=>69519401823820181 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMPED_EXPEDIENTE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 257,
  p_item_plug_id => 69605608377915954+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Expediente: ',
  p_source=>'COMPED_EXPEDIENTE',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 5,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_tag_attributes  => 'style="font-weight:bold"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 4,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
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
  p_id=>69519608186820181 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMCTT_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 254,
  p_item_plug_id => 69597318402067298+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tipo de Contratación: ',
  p_pre_element_text=>'<span style="font-weight:bold">',
  p_post_element_text=>'</span>',
  p_source=>'COMCTT_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'COMCTT',
  p_lov=> 'select nombre d, id r'||unistr('\000a')||
'  from com_contrataciones_tipos_v'||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 80,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 8,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'style="font-weight:bold;"',
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
  p_id=>69519820643820181 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMPRV_EMAIL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 268,
  p_item_plug_id => 69606908424944368+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Email: ',
  p_source=>'COMPRV_EMAIL',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_tag_attributes  => 'style="font-weight:bold"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 3,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'style="font-weight:bold;"',
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
  p_id=>69520003678820181 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMPRV_CUIT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 267,
  p_item_plug_id => 69606908424944368+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'CUIT: ',
  p_source=>'COMPRV_CUIT',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 15,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_tag_attributes  => 'style="font-weight:bold"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 3,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
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
  p_id=>69520227018820182 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMPRV_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 266,
  p_item_plug_id => 69606908424944368+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Proveedor: ',
  p_source=>'COMPRV_NOMBRE',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 80,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_tag_attributes  => 'style="font-weight:bold"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 3,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
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
  p_id=>69520409285820182 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 300,
  p_item_plug_id => 69517611486820178+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'ID :',
  p_source=>'ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 30,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
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
  p_id=>69520619572820182 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMPED_FECHA_SOLICITUD',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 258,
  p_item_plug_id => 69605608377915954+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha de Solicitud: ',
  p_format_mask=>'DD/MM/YYYY',
  p_source=>'COMPED_FECHA_SOLICITUD',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_tag_attributes  => 'style="font-weight:bold"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 3,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'style="font-weight:bold;"',
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
  p_id=>69520822844820184 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_MOTIVO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 272,
  p_item_plug_id => 69652525545872764+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Motivo: ',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 50,
  p_cMaxlength=> 2000,
  p_cHeight=> 4,
  p_tag_attributes  => 'style="font-weight:bold"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P891_MOTIVO',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>69521029514820184 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_ESTADO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 271,
  p_item_plug_id => 69652525545872764+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Estado: ',
  p_pre_element_text=>'<span style="font-weight:bold">',
  p_post_element_text=>'</span>',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'COMOCE_ESTADOS',
  p_lov=> 'select rv_abbreviation d, rv_low_value r'||unistr('\000a')||
'from   cg_ref_codes'||unistr('\000a')||
'where  rv_domain = ''COM_ORDENES_COMPRAS_EST.ESTADO'''||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 30,
  p_cHeight=> 1,
  p_tag_attributes2=> 'style="font-weight:bold"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 2,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
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
  p_id=>69521215489820185 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_ESPACIO_BLANCO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 270,
  p_item_plug_id => 69517611486820178+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'<br>',
  p_pre_element_text=>'<br>',
  p_source_type=> 'ALWAYS_NULL',
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
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
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
  p_id=>69521428382820187 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 250,
  p_item_plug_id => 69595021163992379+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Orden de Provisión: ',
  p_pre_element_text=>'<span style="font-weight:bold;color:red">',
  p_post_element_text=>' / &P891_COMPED_EJERCICIO.</span>',
  p_source=>'CODIGO',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 2,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'style="font-weight:bold;color:red"',
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
  p_id=>69521621439820187 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_FECHA_GENERACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 251,
  p_item_plug_id => 69595021163992379+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha: ',
  p_format_mask=>'DD/MM/YYYY',
  p_source=>'FECHA_GENERACION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_tag_attributes  => 'style="font-weight:bold"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 2,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'style="font-weight:bold"',
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
  p_id=>69521813252820187 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMPED_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 256,
  p_item_plug_id => 69605608377915954+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Solicitud de Gasto: ',
  p_pre_element_text=>'<span style="font-weight:bold;color:red">',
  p_post_element_text=>' / &P891_COMPED_EJERCICIO.</span>',
  p_source=>'COMPED_CODIGO',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 3,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'style="font-weight:bold"',
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
  p_id=>69522017674820189 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMPED_OBJETO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 261,
  p_item_plug_id => 69605608377915954+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Objeto: ',
  p_pre_element_text=>'<span style="font-weight:bold">',
  p_post_element_text=>'</span>',
  p_source=>'COMCOB_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'COMCOB',
  p_lov=> 'select to_char(a.codigo,''000'')||'' - ''||a.nombre d, a.id r'||unistr('\000a')||
'from com_catalogo_objetos_v a'||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_tag_attributes2=> 'style="font-weight:bold"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 8,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold;"',
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
  p_id=>69522206256820189 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_FINALIDAD',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 265,
  p_item_plug_id => 69605608377915954+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Finalidad: ',
  p_source=>'COMPED_DESCRIPCION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_tag_attributes  => 'style="font-weight:bold"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 8,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold;"',
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
  p_id=>69522426654820189 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_DESTINO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 263,
  p_item_plug_id => 69605608377915954+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Destino: ',
  p_source=>'COMPED_OBSERVACIONES',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_tag_attributes  => 'style="font-weight:bold"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 8,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold;"',
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
  p_id=>69522616529820189 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_CONTACTO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 264,
  p_item_plug_id => 69605608377915954+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Contacto: ',
  p_source=>'COMPED_CONTACTO',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_tag_attributes  => 'style="font-weight:bold"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 8,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold;"',
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
  p_id=>69522806868820190 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_FECHA_ENTREGA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 259,
  p_item_plug_id => 69605608377915954+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha de Entrega: ',
  p_format_mask=>'DD/MM/YYYY',
  p_source=>'COMPED_FECHA_ENTREGA',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_tag_attributes  => 'style="font-weight:bold"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 3,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold;"',
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
  p_id=>69523029101820190 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMPRV_DOMICILIO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 269,
  p_item_plug_id => 69606908424944368+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Domicilio: ',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_tag_attributes  => 'style="font-weight:bold"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 8,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'style="font-weight:bold;"',
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
  p_id=>69523229926820190 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMREP_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 368,
  p_item_plug_id => 69517611486820178+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Replica Id :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
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
  p_id=>69523403325820192 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMREP_ESTADO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 378,
  p_item_plug_id => 69517611486820178+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'COMREP_ESTADO ',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
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
  p_id=>69523614052820192 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_REP_ANULAR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 388,
  p_item_plug_id => 69517611486820178+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Rep Anular : ',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
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
  p_id=>69523810891820192 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMPED_EJERCICIO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 310,
  p_item_plug_id => 69517611486820178+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Ejercicio : ',
  p_source=>'COMPED_EJERCICIO',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
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
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'style="font-weight:bold"',
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
  p_id=>69524004214820192 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_MONTO_DESCUENTO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 348,
  p_item_plug_id => 69517611486820178+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Monto Descuento :',
  p_source=>'MONTO_DESCUENTO',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'style="font-weight:bold"',
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
  p_id=>69524204490820192 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_ESTADO_FECHA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 273,
  p_item_plug_id => 69517611486820178+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha Estado :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 50,
  p_cMaxlength=> 2000,
  p_cHeight=> 4,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 3,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
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
  p_id=>69524406611820192 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_ESTADO_TIEMPO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 274,
  p_item_plug_id => 69517611486820178+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Estado Tiempo Trancurrido:',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 50,
  p_cMaxlength=> 2000,
  p_cHeight=> 4,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 3,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
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
  p_id=>69524602550820192 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMPED_CONTRATANTE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 260,
  p_item_plug_id => 69605608377915954+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Entidad Contratante: ',
  p_source=>'COMPED_CONTRATANTE',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 5,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_tag_attributes  => 'style="font-weight:bold"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 8,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
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
  p_id=>69524807298820192 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_METODO_ADJUDICACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 255,
  p_item_plug_id => 69597318402067298+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Metodo de Adjudicación: ',
  p_pre_element_text=>'<span style="font-weight:bold">',
  p_post_element_text=>'</span>',
  p_source=>'COMCON_METODO_ADJUDICACION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'TIPO_METODO_ADJUDICACION',
  p_lov=> 'select rv_meaning d, rv_low_value r'||unistr('\000a')||
'from   cg_ref_codes'||unistr('\000a')||
'where  rv_domain = ''COM_CONTRATACIONES.METODO_ADJUDICACION'''||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 8,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
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
h := null;
h:=h||'Saldo pendiente de entrega sobre el Monto total de la Orden de compra.';

wwv_flow_api.create_page_item(
  p_id=>69525017260820192 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_SALDO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 778,
  p_item_plug_id => 69595021163992379+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Saldo: ',
  p_format_mask=>'FML999G999G999G999G990D00',
  p_source=>'SALDO',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_tag_attributes  => 'style="font-weight:bold;"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 2,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_display_when=>'P891_SALDO',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_read_only_when_type=>'ALWAYS',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
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
  p_id=>69525508375820193 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_FECHA_ULTIMA_ENTREGA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 788,
  p_item_plug_id => 69517611486820178+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha Ultima Entrega',
  p_format_mask=>'DD/MM/YYYY',
  p_source=>'FECHA_ULTIMA_ENTREGA',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_tag_attributes  => 'style="font-weight:bold;"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_display_when=>'P891_FECHA_ULTIMA_ENTREGA',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_read_only_when_type=>'ALWAYS',
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
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
h := null;
h:=h||'Monto de la orden de compra.';

wwv_flow_api.create_page_item(
  p_id=>69525727708820193 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_MONTO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 768,
  p_item_plug_id => 69595021163992379+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Monto: ',
  p_format_mask=>'FML999G999G999G999G990D00',
  p_source=>'MONTO',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_tag_attributes  => 'style="font-weight:bold;"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 2,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when_type=>'ALWAYS',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
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
  p_id=>69526222496820193 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_TIPO_ENTREGA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 808,
  p_item_plug_id => 69517611486820178+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'TIPO_ENTREGA',
  p_source_type=> 'DB_COLUMN',
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
  p_id=>69526410883820193 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_FECHA_CALIFICACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 252,
  p_item_plug_id => 69595021163992379+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha estimada de Entrega: ',
  p_format_mask=>'DD/MM/YYYY',
  p_source=>'FECHA_MAX_CALIFICACION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_tag_attributes  => 'style="font-weight:bold"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 3,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'style="font-weight:bold"',
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
  p_id=>69529811490820204 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_FILTRO_ESTADO_ENTREGA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 798,
  p_item_plug_id => 69527923617820196+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'PENENTPAPPAE',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Filtrado por:',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_RADIOGROUP',
  p_named_lov=> 'TIPO_FILTRO_ESTADO_ENT',
  p_lov=> '.'||to_char(69547124089820278 + wwv_flow_api.g_id_offset)||'.',
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
  p_field_template=> 236666119854903832+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => '4',
  p_attribute_02 => 'REDIRECT_SET_VALUE',
  p_attribute_04 => 'HORIZONTAL',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>69530014784820206 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_ORIGEN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 408,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'ORIGEN : ',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
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
  p_id=>69530212149820206 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_APP_ANTERIOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
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
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
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
  p_id=>69530402396820206 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_PAG_ANTERIOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 2,
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
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
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
  p_id=>69530616370820206 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_COMCLF_SEGORG_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 312,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'SEGORG_ID',
  p_source=>'SEGORG_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
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
  p_read_only_when_type=>'ALWAYS',
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
  p_id=>69530802481820206 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_EDICION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 538,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
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
  p_id=>69586007093263857 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_DESISTE_COMPRA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 818,
  p_item_plug_id => 69496610600820100+wwv_flow_api.g_id_offset,
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
  p_id=>69587423446301851 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_AGREGAR_PRORROGA_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 828,
  p_item_plug_id => 69496610600820100+wwv_flow_api.g_id_offset,
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
  p_id=>69587800802312354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 891,
  p_name=>'P891_EDITAR_PRORROGAS_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 838,
  p_item_plug_id => 69496610600820100+wwv_flow_api.g_id_offset,
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
 
wwv_flow_api.create_page_validation(
  p_id => 69531307662820217 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P891_TIPO not null',
  p_validation_sequence=> 60,
  p_validation => 'P891_COMCLF_TIPO',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Tipo debe tener algún valor.',
  p_always_execute=>'N',
  p_when_button_pressed=> 69506626450820142 + wwv_flow_api.g_id_offset,
  p_associated_item=> 69504622758820135 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 69531501942820217 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P891_CALIFICACION not null',
  p_validation_sequence=> 70,
  p_validation => 'P891_COMCLF_CALIFICACION',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Indique una Calificación.',
  p_always_execute=>'N',
  p_when_button_pressed=> 69506626450820142 + wwv_flow_api.g_id_offset,
  p_associated_item=> 69504830364820135 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 69531708913820217 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Existen Motivos',
  p_validation_sequence=> 105,
  p_validation => 'APEX_APPLICATION.G_F01.COUNT <> 0',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'Debe marcar al menos un motivo justificando su calificación.',
  p_always_execute=>'N',
  p_validation_condition=> 'declare'||unistr('\000a')||
'  cursor cr_comclm is'||unistr('\000a')||
'  select 1'||unistr('\000a')||
'  from COM_CALIFICACIONES_MOT_V'||unistr('\000a')||
'  where comclf_id = :P891_COMCLF_ID'||unistr('\000a')||
'    and comctm_calificacion = :P891_COMCLF_CALIFICACION;'||unistr('\000a')||
'  v_dummy number;'||unistr('\000a')||
'  v_retorno boolean:= false;'||unistr('\000a')||
'begin'||unistr('\000a')||
'    open cr_comclm;'||unistr('\000a')||
'    fetch cr_comclm into v_dummy;'||unistr('\000a')||
'    if cr_comclm%found then'||unistr('\000a')||
'       v_retorno := true;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    close cr_comclm;    '||unistr('\000a')||
'    --'||unistr('\000a')||
'  return v_retorno;'||unistr('\000a')||
'end;',
  p_validation_condition_type=> 'FUNCTION_BODY',
  p_when_button_pressed=> 69506626450820142 + wwv_flow_api.g_id_offset,
  p_associated_item=> 69509131524820148 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 69531926430820217 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Solo un motivo',
  p_validation_sequence=> 110,
  p_validation => 'APEX_APPLICATION.G_F01.COUNT = 1',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'Debe elegir sólo un motivo para justificar su calificación',
  p_always_execute=>'N',
  p_validation_condition=> 'begin'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'   if APEX_APPLICATION.G_F01.COUNT <> 0 AND  (v (''REQUEST'') = ''Calificar'' or v (''REQUEST'') = ''RECALIFICAR'') and :P891_COMOCM_CONCRETRADA_SN = ''NOC'' AND :P891_COMCLF_CALIFICACION = 0  then '||unistr('\000a')||
'      return true;'||unistr('\000a')||
'    else '||unistr('\000a')||
'      return false;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'end;',
  p_validation_condition_type=> 'FUNCTION_BODY',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 69532106490820217 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Existen Motivos',
  p_validation_sequence=> 115,
  p_validation => 'APEX_APPLICATION.G_F01.COUNT <> 0',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'Debe marcar al menos un motivo justificando su calificación.',
  p_always_execute=>'N',
  p_validation_condition=> 'declare'||unistr('\000a')||
'  cursor cr_comclm is'||unistr('\000a')||
'  select 1'||unistr('\000a')||
'  from COM_CALIFICACIONES_MOT_V'||unistr('\000a')||
'  where comclf_id = :P891_COMCLF_ID'||unistr('\000a')||
'    and comctm_calificacion = :P891_COMCLF_CALIFICACION;'||unistr('\000a')||
'  v_dummy number;'||unistr('\000a')||
'  v_retorno boolean:= false;'||unistr('\000a')||
'begin'||unistr('\000a')||
'    open cr_comclm;'||unistr('\000a')||
'    fetch cr_comclm into v_dummy;'||unistr('\000a')||
'    if cr_comclm%found then'||unistr('\000a')||
'       v_retorno := true;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    close cr_comclm;    '||unistr('\000a')||
'   --'||unistr('\000a')||
'  return v_retorno;'||unistr('\000a')||
'end;',
  p_validation_condition_type=> 'FUNCTION_BODY',
  p_when_button_pressed=> 69507829206820143 + wwv_flow_api.g_id_offset,
  p_associated_item=> 69509131524820148 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 69532310328820218 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Comentario Replica Not Null',
  p_validation_sequence=> 135,
  p_validation => 'P891_COMENTARIO',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#LABEL# debe ingresar un texto.',
  p_always_execute=>'N',
  p_validation_condition=> 'replicar',
  p_validation_condition_type=> 'REQUEST_IN_CONDITION',
  p_associated_item=> 69497606060820106 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 69532523347820220 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Comentario no null',
  p_validation_sequence=> 145,
  p_validation => 'P891_COMCLF_COMENTARIO',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Debe indicar un comentario a su calificación',
  p_always_execute=>'N',
  p_validation_condition=> '(SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo    => ''COMADM_OCMGES_ACTIVAR_MOTIVO_CLF'''||unistr('\000a')||
'                          ,p_segorg_id => :P1_SEGORG_ID) = ''SI'')'||unistr('\000a')||
'AND (:P891_COMCLF_CALIFICACION <= 0)',
  p_validation_condition_type=> 'PLSQL_EXPRESSION',
  p_when_button_pressed=> 69506626450820142 + wwv_flow_api.g_id_offset,
  p_associated_item=> 69505315397820140 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 69532717036820220 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Comentario no null',
  p_validation_sequence=> 155,
  p_validation => 'P891_COMCLF_COMENTARIO',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Debe indicar un comentario a su calificación',
  p_always_execute=>'N',
  p_validation_condition=> '(SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo    => ''COMADM_OCMGES_ACTIVAR_MOTIVO_CLF'''||unistr('\000a')||
'                          ,p_segorg_id => :P1_SEGORG_ID) = ''SI'')'||unistr('\000a')||
'AND (:P891_COMCLF_CALIFICACION <= 0)',
  p_validation_condition_type=> 'PLSQL_EXPRESSION',
  p_when_button_pressed=> 69507829206820143 + wwv_flow_api.g_id_offset,
  p_associated_item=> 69505315397820140 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 69532916245820220 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Anticipo Financiero es numerico',
  p_validation_sequence=> 165,
  p_validation => 'P891_PORC_ANT_FINANC',
  p_validation_type => 'ITEM_IS_NUMERIC',
  p_error_message => '#LABEL# debe ser un valor numérico.',
  p_always_execute=>'N',
  p_when_button_pressed=> 35174924336980307 + wwv_flow_api.g_id_offset,
  p_associated_item=> 69511904944820154 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> 'begin'||unistr('\000a')||
'   if :P891_PORC_ANT_FINANC is null then'||unistr('\000a')||
'      return true;'||unistr('\000a')||
'   else'||unistr('\000a')||
'      return false;'||unistr('\000a')||
'   end if;'||unistr('\000a')||
'end;');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 69533114143820220 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Monto Seguro Caucion es numérico',
  p_validation_sequence=> 175,
  p_validation => 'P891_MONTO_SEGURO_CAUCION',
  p_validation_type => 'ITEM_IS_NUMERIC',
  p_error_message => '#LABEL# debe ser numérico.',
  p_always_execute=>'N',
  p_when_button_pressed=> 35174924336980307 + wwv_flow_api.g_id_offset,
  p_associated_item=> 69510720952820153 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 69533321205820220 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Monto Seguro Caucion formato',
  p_validation_sequence=> 185,
  p_validation => 'declare'||unistr('\000a')||
'   v_monto    varchar2(100);'||unistr('\000a')||
'   v_ocur     number;'||unistr('\000a')||
'begin'||unistr('\000a')||
'   v_ocur := instr(:P891_MONTO_SEGURO_CAUCION, '','', 1, 2);'||unistr('\000a')||
'   if v_ocur > 1 then'||unistr('\000a')||
'      return ''El formato del monto es incorrecto. Ej 1.234,56'';'||unistr('\000a')||
'   end if;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   if instr(:P891_MONTO_SEGURO_CAUCION, '','', 1, 1) > 0 and substr(:P891_MONTO_SEGURO_CAUCION, -3, 1) <> '','' then'||unistr('\000a')||
'      return ''El formato del monto es incorrecto. Ej 1.234,56'';'||unistr('\000a')||
'   end if;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   if instr(:P891_MONTO_SEGURO_CAUCION, ''.'', 1, 1) > 0 and substr(:P891_MONTO_SEGURO_CAUCION, -3, 1) = ''.'' then'||unistr('\000a')||
'      return ''El formato del monto es incorrecto. Ej 1.234,56'';'||unistr('\000a')||
'   end if;'||unistr('\000a')||
'   --'||unistr('\000a')||
'end;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => '#LABEL# debe ser numerico con (,) decimal.',
  p_always_execute=>'N',
  p_when_button_pressed=> 35174924336980307 + wwv_flow_api.g_id_offset,
  p_associated_item=> 69510720952820153 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 69533531837820220 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P891_COMCLP_COMCPT_ID',
  p_validation_sequence=> 195,
  p_validation => 'P891_COMCLP_COMCPT_ID',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Debe indicar un motivo para la Calificación con Prórroga.',
  p_always_execute=>'N',
  p_when_button_pressed=> 69516602696820175 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 69513526621820156 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 69533716395820220 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P891_COMCPD_FECHA_ENTREGA',
  p_validation_sequence=> 205,
  p_validation => 'P891_COMCPD_FECHA_ENTREGA',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Fecha de Entrega debe tener algún valor.',
  p_always_execute=>'N',
  p_when_button_pressed=> 69516602696820175 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 69516218430820173 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 69533921864820220 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P891_COMCPD_DESCRIPCION',
  p_validation_sequence=> 215,
  p_validation => 'P891_COMCPD_DESCRIPCION',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Detalle de Entrega debe tener algún valor.',
  p_always_execute=>'N',
  p_when_button_pressed=> 69516602696820175 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 69516428438820173 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 69534129827820220 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Max_dias_Prórroga',
  p_validation_sequence=> 225,
  p_validation => 'declare'||unistr('\000a')||
'	v_fecha_max date;'||unistr('\000a')||
'    v_fecha_min date;'||unistr('\000a')||
'begin'||unistr('\000a')||
'	v_fecha_max := to_date(:P891_FECHA_GENERACION) + SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => ''COMADM_COMCLF_CANT_MAX_CLP'''||unistr('\000a')||
'                                                               ,P_SEGORG_ID => :P1_SEGORG_ID);'||unistr('\000a')||
'    v_fecha_min := :P891_FECHA_GENERACION;'||unistr('\000a')||
''||unistr('\000a')||
'                                                               '||unistr('\000a')||
'	if (:P891_COMCPD_FECHA_ENTREGA > v_fecha_max) then'||unistr('\000a')||
'   		 return ''La fecha de entrega no puede ser mayor a ''||TO_CHAR(TRUNC(v_fecha_max),''DD/MM/YYYY'');'||unistr('\000a')||
'    else if :P891_COMCPD_FECHA_ENTREGA < v_fecha_min then'||unistr('\000a')||
'    		return ''La fecha de entrega no puede ser menor a la fecha de Orden: ''||TO_CHAR(TRUNC(v_fecha_min),''DD/MM/YYYY'');'||unistr('\000a')||
'         else '||unistr('\000a')||
'   		      return null;'||unistr('\000a')||
'         end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'                                                               '||unistr('\000a')||
'end;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => '',
  p_always_execute=>'N',
  p_when_button_pressed=> 69516602696820175 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 69534318114820223 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Existe prorroga',
  p_validation_sequence=> 235,
  p_validation => 'declare'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_id number;'||unistr('\000a')||
'  v_codigo varchar2 (30);'||unistr('\000a')||
'  v_cant_comclp number;'||unistr('\000a')||
'  v_cant_comcpd number;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  cursor cr_comclp is'||unistr('\000a')||
'  	select count(id)'||unistr('\000a')||
'    from com_calificaciones_pro_v'||unistr('\000a')||
'    where comclf_id = :P891_COMCLF_ID;'||unistr('\000a')||
'    '||unistr('\000a')||
'  cursor cr_comcpd is'||unistr('\000a')||
'  	select count(id)'||unistr('\000a')||
'    from com_calificaciones_prd_v'||unistr('\000a')||
'    where comclp_id = :P891_COMCLP_ID;'||unistr('\000a')||
''||unistr('\000a')||
'begin'||unistr('\000a')||
'    '||unistr('\000a')||
'     open cr_comclp;'||unistr('\000a')||
'     fetch cr_comclp into v_cant_comclp;'||unistr('\000a')||
'     close cr_comclp;'||unistr('\000a')||
'  --'||unistr('\000a')||
'    IF :P891_COMCLF_CALIFICACION = 0 THEN'||unistr('\000a')||
'     FOR i in 1..APEX_APPLICATION.G_F01.COUNT LOOP'||unistr('\000a')||
'       --'||unistr('\000a')||
'       v_id := to_number(APEX_APPLICATION.G_F01(i));'||unistr('\000a')||
'         --'||unistr('\000a')||
'     END LOOP;'||unistr('\000a')||
'    '||unistr('\000a')||
'      '||unistr('\000a')||
'    --'||unistr('\000a')||
'    select comctm_codigo into v_codigo'||unistr('\000a')||
'    from COM_CALIFICACIONES_MOT_V'||unistr('\000a')||
'    where id = v_id;'||unistr('\000a')||
'      '||unistr('\000a')||
'      --'||unistr('\000a')||
'      '||unistr('\000a')||
'      if v_cant_comclp > 0 then'||unistr('\000a')||
'      	open cr_comcpd;'||unistr('\000a')||
'        fetch cr_comcpd into v_cant_comcpd;'||unistr('\000a')||
'        close cr_comcpd;'||unistr('\000a')||
'     end if;'||unistr('\000a')||
'      '||unistr('\000a')||
'      if v_codigo = ''PRORROGA'' and (v_cant_comclp = 0 or v_cant_comcpd = 0) then '||unistr('\000a')||
'      	return ''Debe agregar al menos una fecha de prórroga'';'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'end;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => '',
  p_always_execute=>'N',
  p_validation_condition=> 'begin'||unistr('\000a')||
''||unistr('\000a')||
'	if APEX_APPLICATION.G_F01.COUNT <> 0 AND  (v (''REQUEST'') = ''Calificar'' or v (''REQUEST'') = ''RECALIFICAR'') then '||unistr('\000a')||
'      return true;'||unistr('\000a')||
'    else '||unistr('\000a')||
'      return false;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'end;',
  p_validation_condition_type=> 'FUNCTION_BODY',
  p_only_for_changed_rows=> 'Y',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 69534519784820223 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P891_COMRED_DESTINO_ECO not  null',
  p_validation_sequence=> 245,
  p_validation => 'P891_COMRED_DESTINO_ECO',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Debe elegir un destino para su descargo.',
  p_always_execute=>'N',
  p_validation_condition=> ':REQUEST = ''replicar'' and :P1_SEGUSU_TIPO = ''ECO'' and :P891_RESOLVER = ''NO''',
  p_validation_condition_type=> 'PLSQL_EXPRESSION',
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 69497015779820103 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 69534703895820223 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P891_COMRED_DESTINO_ADM not null',
  p_validation_sequence=> 255,
  p_validation => 'P891_COMRED_DESTINO_ADM',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Debe elegir un destino para su descargo.',
  p_always_execute=>'N',
  p_validation_condition=> ':REQUEST = ''replicar'' and :P1_SEGUSU_TIPO = ''ADM'' and :P891_RESOLVER = ''NO''',
  p_validation_condition_type=> 'PLSQL_EXPRESSION',
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 69497217601820104 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 69535121454820225 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Validar Entregas',
  p_validation_sequence=> 275,
  p_validation => 'declare'||unistr('\000a')||
'  --'||unistr('\000a')||
'  cursor cr_comcet_tipo_entrega is'||unistr('\000a')||
'    select comcet.TIPO_ENTREGA'||unistr('\000a')||
'    from   COM_COMPROBANTES_ENT comcet'||unistr('\000a')||
'          ,COM_COMPROBANTES_EST comcee'||unistr('\000a')||
'    where  comcet.COMOCM_ID = :P891_ID    '||unistr('\000a')||
'    and    comcet.COMCEE_ID = comcee.ID'||unistr('\000a')||
'    and    comcee.ESTADO in (''ENT'',''PEN'', ''PAE'', ''PAP'')'||unistr('\000a')||
'    and    rownum = 1'||unistr('\000a')||
'    order  by comcet.ID desc;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_entrega_parcial_sn varchar2(2);'||unistr('\000a')||
'  v_tipo_entrega varchar2(3);  '||unistr('\000a')||
'  --'||unistr('\000a')||
'begin  '||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_entrega_parcial_sn := COMOCM_PKG.COMOCM_ENTREGAS_PENDIENTES_SN(p_comocm_id => :P891_ID);'||unistr('\000a')||
'  --  '||unistr('\000a')||
'  if v_entrega_parcial_sn = ''NO'' then'||unistr('\000a')||
'    --'||unistr('\000a')||
'    if :P891_TIPO_ENTREGA is null then'||unistr('\000a')||
'      --'||unistr('\000a')||
'      open cr_comcet_tipo_entrega;'||unistr('\000a')||
'      fetch cr_comcet_tipo_entrega into v_tipo_entrega;'||unistr('\000a')||
'      close cr_comcet_tipo_entrega;'||unistr('\000a')||
'      --'||unistr('\000a')||
'    else'||unistr('\000a')||
'      v_tipo_entrega := :P891_TIPO_ENTREGA;              '||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    if v_tipo_entrega = ''CNT'' then'||unistr('\000a')||
'      return ''No se pueden registrar entregas adicionales, si se han registrado como pendientes o entregadas el total de las cantidades adjudicadas.'';        '||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    if v_tipo_entrega = ''MNT'' then'||unistr('\000a')||
'      return ''No se pueden registrar entregas adicionales, si se han registrado como pendientes o entregadas el total de los montos adjudicados.'';'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  return null;'||unistr('\000a')||
'  --'||unistr('\000a')||
'end;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => '',
  p_always_execute=>'N',
  p_when_button_pressed=> 69529609134820204 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 69531113031820210 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'ValidarCalificacion',
  p_validation_sequence=> 285,
  p_validation => 'declare'||unistr('\000a')||
'  v_entrega_total_sn varchar2(2);'||unistr('\000a')||
'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_entrega_total_sn := COMOCM_PKG.COMOCM_ENTREGAS_TOTALES_SN(p_comocm_id => :P891_ID);'||unistr('\000a')||
'  --'||unistr('\000a')||
'  if v_entrega_total_sn = ''NO'' and :P891_COMOCM_CONCRETRADA_SN = ''CON'' then'||unistr('\000a')||
'    return ''No es posible calificar una Orden como CONCRETADA si posee Entregas pendientes o Saldo pendiente.'';'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  return null;'||unistr('\000a')||
'end;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => '',
  p_always_execute=>'N',
  p_validation_condition=> 'Calificar',
  p_validation_condition_type=> 'REQUEST_EQUALS_CONDITION',
  p_only_for_changed_rows=> 'Y',
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
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
p:=p||'F|#OWNER#:COM_ORDENES_COMPRAS_V:P891_ID:ID';

wwv_flow_api.create_page_process(
  p_id     => 69536813139820234 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from COM_ORDENES_COMPRAS_V',
  p_process_sql_clob => p,
  p_process_error_message=> 'No se ha podido recuperar las fila COM_OREDENES_COMPRAS_V.',
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
'  CURSOR cr_comclf IS '||unistr('\000a')||
'  SELECT *'||unistr('\000a')||
'  FROM  COM_CALIFICACIONES_V COMCLF'||unistr('\000a')||
'  WHERE COMCLF.COMOCM_ID = :P891_ID'||unistr('\000a')||
'    AND COMCLF.ID = (SELECT max(comclf2.ID)'||unistr('\000a')||
'                       FROM COM_CALIFICACIONES_V comclf2'||unistr('\000a')||
'                      WHERE comclf2.COMOCM_ID = :P891_ID'||unistr('\000a')||
'                        AND comclf2.SITUACION in (''NUE'',''VAL'')'||unistr('\000a')||
'                        AND comclf2.FECHA = (SELECT MAX(comclf3.F';

p:=p||'ECHA)'||unistr('\000a')||
'                                               FROM COM_CALIFICACIONES_V comclf3'||unistr('\000a')||
'                                              WHERE comclf3.COMOCM_ID = :P891_ID));'||unistr('\000a')||
'  --'||unistr('\000a')||
'  CURSOR cr_get_comclf(p_comclf_id NUMBER) IS'||unistr('\000a')||
'  SELECT *'||unistr('\000a')||
'  FROM  COM_CALIFICACIONES_V COMCLF'||unistr('\000a')||
'  WHERE COMCLF.ID = p_comclf_id;'||unistr('\000a')||
'  --'||unistr('\000a')||
''||unistr('\000a')||
'  v_comclf cr_comclf%rowtype;'||unistr('\000a')||
'  v_comclf_id NUMBER;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
''||unistr('\000a')||
'  OPEN cr_comclf;'||unistr('\000a')||
'  FETCH cr';

p:=p||'_comclf INTO v_comclf;'||unistr('\000a')||
'  CLOSE cr_comclf;'||unistr('\000a')||
'  -- Si no esta inicializada la Calificacion llamamos el PROC de INIC'||unistr('\000a')||
'  IF v_comclf.ID is null THEN'||unistr('\000a')||
'      COM_PKG.COMCLF_INIC(p_comocm_id => :P891_ID'||unistr('\000a')||
'                         ,p_comclf_id => v_comclf_id);'||unistr('\000a')||
'      --'||unistr('\000a')||
'      OPEN cr_get_comclf(p_comclf_id => v_comclf_id);'||unistr('\000a')||
'      FETCH cr_get_comclf INTO v_comclf;'||unistr('\000a')||
'      CLOSE cr_get_comclf;'||unistr('\000a')||
'      --'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
' ';

p:=p||'   --'||unistr('\000a')||
'    :P891_COMCLF_ID              := v_comclf.ID;'||unistr('\000a')||
'    :P891_COMCLF_TIPO            := v_comclf.TIPO;'||unistr('\000a')||
'    :P891_COMCLF_CALIFICACION    := v_comclf.CALIFICACION;'||unistr('\000a')||
'    :P891_COMCLF_COMENTARIO      := v_comclf.COMENTARIO;'||unistr('\000a')||
'    :P891_COMOCM_CONCRETRADA_SN  := :P891_ESTADO;'||unistr('\000a')||
'    :P891_COMCLF_FECHA           := v_comclf.FECHA;'||unistr('\000a')||
'    :P891_COMCLF_SITUACION       := v_comclf.SITUACION;'||unistr('\000a')||
'    :P891_COMREP_ID ';

p:=p||'             := v_comclf.COMREP_ID;'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'    --'||unistr('\000a')||
'    IF :P891_COMOCM_CONCRETRADA_SN = ''APR''  THEN'||unistr('\000a')||
'        :P891_COMOCM_CONCRETRADA_SN  := ''CON'';'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'--    IF :P891_COMOCM_CONCRETRADA_SN = ''CON'' AND :P891_COMCLF_CALIFICACION = 0 THEN'||unistr('\000a')||
'--      :P891_COMCLF_CALIFICACION := NULL;'||unistr('\000a')||
'--    END IF;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    IF :P891_EDITAR_SN IS NULL THEN'||unistr('\000a')||
'        :P891_EDITAR_SN  := ''NO'';'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    --'||unistr('\000a')||
'   ';

p:=p||' IF :P891_EDITAR_PRORROGAS_SN IS NULL THEN'||unistr('\000a')||
'        :P891_EDITAR_PRORROGAS_SN  := ''NO'';'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    --'||unistr('\000a')||
'    IF :P891_AGREGAR_PRORROGA_SN IS NULL THEN'||unistr('\000a')||
'    	:P891_AGREGAR_PRORROGA_SN := ''NO'';'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    --'||unistr('\000a')||
'    IF :P891_DESISTE_COMPRA IS NULL THEN'||unistr('\000a')||
'        :P891_DESISTE_COMPRA:= ''NO'';'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    '||unistr('\000a')||
'    '||unistr('\000a')||
'    '||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 69537017840820234 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Cargar Calificacion',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>':P891_COMCLF_CALIFICACION is NULL and :P891_COMOCM_CONCRETRADA_SN is NULL',
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
p:=p||'DECLARE'||unistr('\000a')||
'   CURSOR cr_replicas IS'||unistr('\000a')||
'   select *'||unistr('\000a')||
'   from com_replicas'||unistr('\000a')||
'   where id = :P891_COMREP_ID;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   v_com_replicas    com_replicas%ROWTYPE;'||unistr('\000a')||
'   --'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'   open cr_replicas;'||unistr('\000a')||
'   fetch cr_replicas into v_com_replicas;'||unistr('\000a')||
'   close cr_replicas;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   :P891_COMREP_ESTADO := v_com_replicas.ESTADO;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   '||unistr('\000a')||
'   '||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 69537203834820235 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 130,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ObtenerDatosReplicasCabecera',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P891_COMREP_ID',
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
p:=p||'declare'||unistr('\000a')||
''||unistr('\000a')||
'begin'||unistr('\000a')||
'   --'||unistr('\000a')||
''||unistr('\000a')||
'   select gral_pkg.obtn_valorparametro(''NOMBRE_COMITENTE'',     datos_contrato)'||unistr('\000a')||
'        , gral_pkg.obtn_valorparametro(''COMPANIA_ASEGURADORA'', datos_contrato)'||unistr('\000a')||
'        , gral_pkg.obtn_valorparametro(''NRO_POLIZA'',           datos_contrato)'||unistr('\000a')||
'        , gral_pkg.obtn_valorparametro(''MONTO_SEGURO_CAUCION'', datos_contrato)'||unistr('\000a')||
'        , gral_pkg.obtn_valorparametro(''DENOMINACION_DE_OBRA'',';

p:=p||' datos_contrato)'||unistr('\000a')||
'        , gral_pkg.obtn_valorparametro(''DECRETO_NRO_ADJ'',      datos_contrato)'||unistr('\000a')||
'        , gral_pkg.obtn_valorparametro(''DECRETO_FECHA_ADJ'',    datos_contrato)'||unistr('\000a')||
'        , gral_pkg.obtn_valorparametro(''DOC_A_PRESENTAR'',      datos_contrato)'||unistr('\000a')||
'        , gral_pkg.obtn_valorparametro(''PLAZO_EJEC_OBRA'',      datos_contrato)'||unistr('\000a')||
'        , gral_pkg.obtn_valorparametro(''PORC_ANT_FINANC'',      dato';

p:=p||'s_contrato)'||unistr('\000a')||
'        , gral_pkg.obtn_valorparametro(''NOMBRE_REPR_PROV'',     datos_contrato)'||unistr('\000a')||
'        , gral_pkg.obtn_valorparametro(''DOC_REPR_PROV'',        datos_contrato)'||unistr('\000a')||
'        , gral_pkg.obtn_valorparametro(''CARACTER_REPR_PROV'',   datos_contrato)'||unistr('\000a')||
''||unistr('\000a')||
'   into :P891_NOMBRE_COMITENTE'||unistr('\000a')||
'       ,:P891_COMPANIA_ASEGURADORA'||unistr('\000a')||
'       ,:P891_NRO_POLIZA'||unistr('\000a')||
'       ,:P891_MONTO_SEGURO_CAUCION'||unistr('\000a')||
'       ,:P891_DENOMINACI';

p:=p||'ON_DE_OBRA'||unistr('\000a')||
'       ,:P891_DECRETO_NRO_ADJ'||unistr('\000a')||
'       ,:P891_DECRETO_FECHA_ADJ'||unistr('\000a')||
'       ,:P891_DOC_A_PRESENTAR'||unistr('\000a')||
'       ,:P891_PLAZO_EJEC_OBRA'||unistr('\000a')||
'       ,:P891_PORC_ANT_FINANC'||unistr('\000a')||
'       ,:P891_NOMBRE_REPR_PROV'||unistr('\000a')||
'       ,:P891_DOC_REPR_PROV'||unistr('\000a')||
'       ,:P891_CARACTER_REPR_PROV'||unistr('\000a')||
''||unistr('\000a')||
'   from com_ordenes_compras'||unistr('\000a')||
'   where id = :P891_ID;'||unistr('\000a')||
''||unistr('\000a')||
'   --'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 69537417968820235 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 150,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ObtenerDatosAdicionalesContrato',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P891_ID',
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
p:=p||'declare'||unistr('\000a')||
''||unistr('\000a')||
'v_estado varchar2 (3);'||unistr('\000a')||
'v_comcpt_id number;'||unistr('\000a')||
'v_descripcion varchar2 (2000);'||unistr('\000a')||
'begin'||unistr('\000a')||
''||unistr('\000a')||
'select estado,comcpt_id,descripcion into v_estado,v_comcpt_id,v_descripcion'||unistr('\000a')||
'from com_calificaciones_pro'||unistr('\000a')||
'where id = :P891_COMCLP_ID;'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
':P891_COMCLP_ESTADO := v_estado;'||unistr('\000a')||
':P891_COMCLP_COMCPT_ID := v_comcpt_id;'||unistr('\000a')||
':P891_COMCLP_DESCRIPCION := v_descripcion;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 69537823742820237 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 170,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AsignarEstadoProrroga',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P891_COMCLP_ID',
  p_process_when_type=>'ITEM_IS_NOT_NULL',
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
'v_comclm varchar2(30);'||unistr('\000a')||
' cursor cr_comclm is'||unistr('\000a')||
'	select codigo'||unistr('\000a')||
'    from COM_CALIFICACIONES_MOT comclm'||unistr('\000a')||
'         ,COM_CALIFICACIONES_TMO comctm'||unistr('\000a')||
'    where comclm.COMCLF_ID = :P891_COMCLF_ID'||unistr('\000a')||
'        and comctm.ID = comclm.COMCTM_ID'||unistr('\000a')||
'        and comctm.CALIFICACION = :P891_COMCLF_CALIFICACION'||unistr('\000a')||
'        and comclm.VALOR_SN = ''SI'';'||unistr('\000a')||
' '||unistr('\000a')||
'begin'||unistr('\000a')||
'	open cr_comclm;'||unistr('\000a')||
'    fetch cr_comclm into v_comclm;'||unistr('\000a')||
'    close cr';

p:=p||'_comclm;'||unistr('\000a')||
'    '||unistr('\000a')||
'    '||unistr('\000a')||
''||unistr('\000a')||
'    '||unistr('\000a')||
'-- asignar un valor a :P891_DESISTE_COMPRA para saber que debemos deshabilitar luego de la calificación.'||unistr('\000a')||
'-- REG = DESHABILITAR LA REGION '||unistr('\000a')||
'-- ITE = DESHABILITAR ITEMS O CONTROLES SEGUN CORRESPONDA'||unistr('\000a')||
'-- NO = NO DESHABILITAR NADA. '||unistr('\000a')||
''||unistr('\000a')||
'    '||unistr('\000a')||
'    if (:P891_COMCLF_SITUACION = ''VAL'' and v_comclm <> ''PRORROGA'' and :P891_COMCLP_ID is not null) or (:P891_COMCLF_CALIFICACION = 1 OR :P891_';

p:=p||'COMCLF_CALIFICACION = -1)  then '||unistr('\000a')||
'    	:P891_DESISTE_COMPRA := ''ITE'';'||unistr('\000a')||
'    else if :P891_COMCLF_SITUACION = ''VAL'' and v_comclm <> ''PRORROGA'' and :P891_COMCLP_ID is null then'||unistr('\000a')||
'    		:P891_DESISTE_COMPRA := ''REG'';'||unistr('\000a')||
'         else :P891_DESISTE_COMPRA := ''NO'';'||unistr('\000a')||
'         end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 69538018289820237 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 240,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Desiste Compra',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P891_COMCLF_SITUACION',
  p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_process_when2=>'VAL',
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
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||unistr('\000a')||
':P891_REPLICAR_HS_PRV:= COMOCM_PKG.COMREP_REPLICA_HS(:P891_ID,:P1_SEGUSU_TIPO);'||unistr('\000a')||
':P891_REPLICAR_HS_ECO:= COMOCM_PKG.COMREP_REPLICA_HS(:P891_ID,:P1_SEGUSU_TIPO);'||unistr('\000a')||
':P891_VER_REPLICAR := nvl(:P891_VER_REPLICAR,''NO'');'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 69538225185820239 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 240,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'obtenerHorasParaReplicar',
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
p:=p||'P891_COMCLF_CALIFICACION,P891_COMOCM_CONCRETRADA_SN';

wwv_flow_api.create_page_process(
  p_id     => 69538412211820240 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_ITEMS',
  p_process_name=> 'Limpiar Campos',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=>'COMCLF_ANULAR',
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
p:=p||'BEGIN'||unistr('\000a')||
'      '||unistr('\000a')||
' COM_PKG.COMCLF_ANULAR(P_COMCLF_ID => :P891_COMCLF_ID);'||unistr('\000a')||
'  '||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 69538621689820240 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Anular Calificación',
  p_process_sql_clob => p,
  p_process_error_message=> 'Fallo de Anulación de Calificación.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'COMCLF_ANULAR',
  p_process_when_type=>'REQUEST_EQUALS_CONDITION',
  p_process_success_message=> 'Anulación de Calificación exitosa !',
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
' v_cont NUMBER := 0;'||unistr('\000a')||
' v_datos varchar2(100);'||unistr('\000a')||
' v_codigo varchar2(30);'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF :P891_COMCLF_CALIFICACION IN( -1,0) THEN'||unistr('\000a')||
'   FOR i in 1..APEX_APPLICATION.G_F01.COUNT LOOP'||unistr('\000a')||
'     '||unistr('\000a')||
'     --'||unistr('\000a')||
'     UPDATE COM_CALIFICACIONES_MOT'||unistr('\000a')||
'     SET VALOR_SN = ''SI'''||unistr('\000a')||
'     WHERE ID = to_number(APEX_APPLICATION.G_F01(i));'||unistr('\000a')||
'     --'||unistr('\000a')||
'     v_cont  := v_cont+1;'||unistr('\000a')||
'     v_datos := v_datos||'',''||APEX_APPLICATION.G_F01(i);'||unistr('\000a')||
'   ';

p:=p||'END LOOP;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  --'||unistr('\000a')||
'  COM_PKG.COMOCM_CALIFICAR('||unistr('\000a')||
'     P_COMCLF_ID     => :P891_COMCLF_ID'||unistr('\000a')||
'    ,P_COMOCM_ID     => :P891_COMCLF_COMOCM_ID'||unistr('\000a')||
'    ,P_FECHA         => SYSDATE'||unistr('\000a')||
'    ,P_CALIFICACION  => :P891_COMCLF_CALIFICACION'||unistr('\000a')||
'    ,P_COMENTARIO    => :P891_COMCLF_COMENTARIO'||unistr('\000a')||
'    ,P_COMOCE_ESTADO => :P891_COMOCM_CONCRETRADA_SN );'||unistr('\000a')||
'    --'||unistr('\000a')||
'    :P891_EDITAR_SN := ''NO'';'||unistr('\000a')||
'    :P891_COMCLF_CALIFICACION := n';

p:=p||'ull;'||unistr('\000a')||
'    --'||unistr('\000a')||
''||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 69538826485820240 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 50,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Calificar',
  p_process_sql_clob => p,
  p_process_error_message=> 'No se pudo confirmar su Calificación',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>69506626450820142 + wwv_flow_api.g_id_offset,
  p_process_success_message=> 'ok',
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
' v_cont NUMBER :=0;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF :P891_COMCLF_CALIFICACION in( -1,0) THEN'||unistr('\000a')||
'   -- Inicializo a null todos los valores de la calificacion anterior'||unistr('\000a')||
'   COM_PKG.COMCMO_INIC(P_COMCLF_ID => :P891_COMCLF_ID);'||unistr('\000a')||
'   -- '||unistr('\000a')||
'   FOR i in 1..APEX_APPLICATION.G_F01.COUNT LOOP'||unistr('\000a')||
'     --'||unistr('\000a')||
'     UPDATE COM_CALIFICACIONES_MOT'||unistr('\000a')||
'     SET VALOR_SN = ''SI'''||unistr('\000a')||
'     WHERE ID = to_number(APEX_APPLICATION.G_F01(i));'||unistr('\000a')||
'     --'||unistr('\000a')||
'     v_c';

p:=p||'ont := v_cont+1;'||unistr('\000a')||
'   END LOOP;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  COM_PKG.COMOCM_RECALIFICAR('||unistr('\000a')||
'     P_COMCLF_ID     => :P891_COMCLF_ID'||unistr('\000a')||
'    ,P_CALIFICACION  => :P891_COMCLF_CALIFICACION'||unistr('\000a')||
'    ,P_COMENTARIO    => :P891_COMCLF_COMENTARIO||'' '''||unistr('\000a')||
'    ,P_COMOCE_ESTADO => :P891_COMOCM_CONCRETRADA_SN '||unistr('\000a')||
'    );'||unistr('\000a')||
'  --'||unistr('\000a')||
'  :P891_EDITAR_SN := ''NO'';'||unistr('\000a')||
'  --'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 69539019614820240 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 60,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ReCalificar',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>69507829206820143 + wwv_flow_api.g_id_offset,
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
'cursor cr_comoce_fecha is'||unistr('\000a')||
'   select min(fecha) fecha'||unistr('\000a')||
'     from com_ordenes_compras_est'||unistr('\000a')||
'    where comocm_id = :P891_ID'||unistr('\000a')||
'      and estado = ''APR'''||unistr('\000a')||
'      and situacion = ''VAL'';'||unistr('\000a')||
'      '||unistr('\000a')||
'   cursor cr_comctt is'||unistr('\000a')||
'   	select comctt.limite_max_calificar fecha '||unistr('\000a')||
'  	from com_contrataciones_tipos comctt '||unistr('\000a')||
'  	where comctt.id = :P891_COMCTT_ID;'||unistr('\000a')||
'         '||unistr('\000a')||
'  v_comctt cr_comctt%rowtype;'||unistr('\000a')||
'  v_comoce_fecha  cr_como';

p:=p||'ce_fecha%ROWTYPE;'||unistr('\000a')||
'  v_plazo_max number;'||unistr('\000a')||
''||unistr('\000a')||
'BEGIN'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'-- Obtener la fecha de la primera aprobación de la orden'||unistr('\000a')||
'   open cr_comoce_fecha;'||unistr('\000a')||
'   fetch cr_comoce_fecha into v_comoce_fecha;'||unistr('\000a')||
'   close cr_comoce_fecha;'||unistr('\000a')||
'   '||unistr('\000a')||
'   --'||unistr('\000a')||
'   open cr_comctt;'||unistr('\000a')||
'   fetch cr_comctt into v_comctt;'||unistr('\000a')||
'   close cr_comctt;'||unistr('\000a')||
'    '||unistr('\000a')||
'  --'||unistr('\000a')||
'  if v_comctt.fecha is null then'||unistr('\000a')||
'        --Obtener el máximo de días para calificar '||unistr('\000a')||
'        v_plazo_max';

p:=p||' := SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => ''COMADM_OCMGES_PLAZO_MAX_CLF'''||unistr('\000a')||
'                                            ,P_SEGORG_ID => :P1_SEGORG_ID); '||unistr('\000a')||
'   else '||unistr('\000a')||
'        v_plazo_max := v_comctt.fecha;                                         '||unistr('\000a')||
'   end if;'||unistr('\000a')||
''||unistr('\000a')||
'if :P891_COMCLP_ID is not null then'||unistr('\000a')||
'    delete from COM_CALIFICACIONES_PRD'||unistr('\000a')||
'    where COMCLP_ID = :P891_COMCLP_ID;'||unistr('\000a')||
'    '||unistr('\000a')||
'    delete from COM_CALIFICACIO';

p:=p||'NES_PRO'||unistr('\000a')||
'    where ID = :P891_COMCLP_ID;'||unistr('\000a')||
'    '||unistr('\000a')||
'    update com_ordenes_compras'||unistr('\000a')||
'    set FECHA_MAX_CALIFICACION = (v_comoce_fecha.fecha + v_plazo_max)'||unistr('\000a')||
'    WHERE id = :P891_ID; '||unistr('\000a')||
'end if;'||unistr('\000a')||
''||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 69539207474820240 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 80,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Cancelar prórroga',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>69508024123820143 + wwv_flow_api.g_id_offset,
  p_process_when=>'P891_COMCLF_SITUACION',
  p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_process_when2=>'NUE',
  p_process_when_type2=>'',
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
p:=p||'P891_COMCLF_CALIFICACION,P891_COMOCM_CONCRETRADA_SN';

wwv_flow_api.create_page_process(
  p_id     => 69539431229820240 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 90,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_ITEMS',
  p_process_name=> 'Limpiar Campos',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>69508024123820143 + wwv_flow_api.g_id_offset,
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
p:=p||'DECLARE'||unistr('\000a')||
'    CURSOR cr_replicas IS'||unistr('\000a')||
'    select *'||unistr('\000a')||
'    from com_replicas'||unistr('\000a')||
'    where id = :P891_COMREP_ID;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    CURSOR cr_replicas_ult IS'||unistr('\000a')||
'    select max(id),ESTADO'||unistr('\000a')||
'    from com_replicas'||unistr('\000a')||
'    where comocm_id = :P891_ID'||unistr('\000a')||
'    and estado not in (''RES'',''NUE'',''ANU'')'||unistr('\000a')||
'    group by id,ESTADO ;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    v_com_replicas com_replicas%ROWTYPE;'||unistr('\000a')||
'    v_com_replicas_d com_replicas_det%ROWTYPE;'||unistr('\000a')||
'    v_prox_estado var';

p:=p||'char2(3);'||unistr('\000a')||
'    v_origen varchar2(3);'||unistr('\000a')||
'    v_comentario varchar2(4000) := null;'||unistr('\000a')||
'    v_destino_replica varchar (3);'||unistr('\000a')||
'--'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'     IF COM_PKG.COMREP_REPLICAR_SN(:P891_ID, :P891_ORIGEN) = ''NO'' THEN'||unistr('\000a')||
'    	raise_application_error(-20000, ''No se puede ingresar una réplica'' , true );'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    open cr_replicas;'||unistr('\000a')||
'    fetch cr_replicas into v_com_replicas;'||unistr('\000a')||
'    close cr_replicas;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    if v_com';

p:=p||'_replicas.ID is null and :P1_SEGUSU_TIPO = ''PRV'' then'||unistr('\000a')||
'    --'||unistr('\000a')||
'        select COMREP_ID.NEXTVAL into v_com_replicas.ID from dual;'||unistr('\000a')||
'        --'||unistr('\000a')||
'        v_com_replicas.SEGORG_ID := :P891_COMCLF_SEGORG_ID;'||unistr('\000a')||
'        v_com_replicas.COMOCM_ID := :P891_ID;'||unistr('\000a')||
'        v_com_replicas.COMCLF_ID := :P891_COMCLF_ID;'||unistr('\000a')||
'        v_com_replicas.COMECO_ID := :P891_COMCLF_COMECO_ID;'||unistr('\000a')||
'        v_com_replicas.COMPRV_ID := :P891_';

p:=p||'COMCLF_COMPRV_ID;'||unistr('\000a')||
'        v_com_replicas.FECHA_GENERACION := SYSDATE;'||unistr('\000a')||
'        v_com_replicas.COMENTARIO := '' '';'||unistr('\000a')||
'        v_com_replicas.ESTADO := ''NUE'';'||unistr('\000a')||
'        v_com_replicas.FECHA_ESTADO := SYSDATE;'||unistr('\000a')||
'        v_prox_estado := ''NUE'';'||unistr('\000a')||
'        v_origen := ''PRV'';'||unistr('\000a')||
'        v_comentario := :P891_COMENTARIO;'||unistr('\000a')||
'        --'||unistr('\000a')||
'        COM_PKG.COMREP_INS(p_comrep => v_com_replicas);'||unistr('\000a')||
'    else'||unistr('\000a')||
'        -- Obtener Ulti';

p:=p||'ma Replica no Resuelta'||unistr('\000a')||
'        open cr_replicas_ult;'||unistr('\000a')||
'        fetch cr_replicas_ult into v_com_replicas.ID,v_com_replicas.ESTADO;'||unistr('\000a')||
'        close cr_replicas_ult;'||unistr('\000a')||
'        --'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    if v_com_replicas.ESTADO = ''NUE'' and :P1_SEGUSU_TIPO = ''PRV'' then'||unistr('\000a')||
'        v_prox_estado := ''PRE'';'||unistr('\000a')||
'        v_destino_replica:= ''ECO'';'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    if v_com_replicas.ESTADO = ''PRE'' and :P1_SEGUSU_TIPO = ''E';

p:=p||'CO'' then'||unistr('\000a')||
'        v_prox_estado := ''REP'';'||unistr('\000a')||
'        v_destino_replica:= :P891_COMRED_DESTINO_ECO;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    if v_com_replicas.ESTADO = ''PRE'' and :P1_SEGUSU_TIPO = ''ADM'' then'||unistr('\000a')||
'        if :P891_RESOLVER = ''SI'' then'||unistr('\000a')||
'    		v_prox_estado := ''RES'';'||unistr('\000a')||
'    	else'||unistr('\000a')||
'        	v_prox_estado := ''REP'';'||unistr('\000a')||
'       		v_destino_replica:= :P891_COMRED_DESTINO_ADM;'||unistr('\000a')||
'    	end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    if v_com_replicas.ESTADO = ''';

p:=p||'REP'' and :P1_SEGUSU_TIPO = ''PRV'' then'||unistr('\000a')||
'        v_prox_estado := ''PRE'';'||unistr('\000a')||
'        v_destino_replica:= ''ECO'';'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    if v_com_replicas.ESTADO = ''REP'' and :P1_SEGUSU_TIPO = ''ECO'' then'||unistr('\000a')||
'        v_prox_estado := ''REP'';'||unistr('\000a')||
'        v_destino_replica:= :P891_COMRED_DESTINO_ECO;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    if v_com_replicas.ESTADO = ''REP'' and :P1_SEGUSU_TIPO = ''ADM'' then'||unistr('\000a')||
'        if :P891_RESOLVER = ''SI'' then'||unistr('\000a')||
'       ';

p:=p||' 	v_prox_estado := ''RES'';'||unistr('\000a')||
'        else'||unistr('\000a')||
'            v_prox_estado := ''REP'';'||unistr('\000a')||
'            v_destino_replica:= :P891_COMRED_DESTINO_ADM;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'    end if; '||unistr('\000a')||
'    --'||unistr('\000a')||
'     update com_replicas'||unistr('\000a')||
'     set ESTADO = v_prox_estado'||unistr('\000a')||
'     , COMENTARIO = v_comentario'||unistr('\000a')||
'     where id = v_com_replicas.ID;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    v_com_replicas_d.ID := COMRED_ID.nextval;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    v_com_replicas_d.COMREP_ID := v_com_replic';

p:=p||'as.ID;'||unistr('\000a')||
'    v_com_replicas_d.FECHA := SYSDATE;'||unistr('\000a')||
'    v_com_replicas_d.ORIGEN := :P891_ORIGEN;'||unistr('\000a')||
'    v_com_replicas_d.DESTINO := v_destino_replica;'||unistr('\000a')||
'    v_com_replicas_d.COMENTARIO := :P891_COMENTARIO;'||unistr('\000a')||
'    v_com_replicas_d.SITUACION := ''VIG'';'||unistr('\000a')||
'    '||unistr('\000a')||
'    '||unistr('\000a')||
'    -- '||unistr('\000a')||
'    COM_PKG.COMRED_INS(p_comred => v_com_replicas_d);'||unistr('\000a')||
'    --'||unistr('\000a')||
'    :P891_COMRED_ID := v_com_replicas_d.ID;'||unistr('\000a')||
'    --'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 69539626781820242 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 100,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'InsertarReplica',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'replicar',
  p_process_when_type=>'REQUEST_IN_CONDITION',
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
'  cursor cr_comred is'||unistr('\000a')||
'    select count(comrep.ID)'||unistr('\000a')||
'    from COM_REPLICAS_DET comred'||unistr('\000a')||
'        ,COM_REPLICAS comrep'||unistr('\000a')||
'    where comred.COMREP_ID = comrep.ID'||unistr('\000a')||
'    and   comred.SITUACION = ''VIG'''||unistr('\000a')||
'    and   comrep.COMOCM_ID = :P891_ID;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   v_comred_cantidad number;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   v_prev_estado     varchar2(3);'||unistr('\000a')||
'   --   '||unistr('\000a')||
'begin'||unistr('\000a')||
'   --'||unistr('\000a')||
'   case :P891_COMREP_ESTADO  '||unistr('\000a')||
'      when ''PRE'' then '||unistr('\000a')||
'         open cr_c';

p:=p||'omred;'||unistr('\000a')||
'         fetch cr_comred into v_comred_cantidad;'||unistr('\000a')||
'         close cr_comred;'||unistr('\000a')||
'         --'||unistr('\000a')||
'         if v_comred_cantidad > 1 then'||unistr('\000a')||
'           v_prev_estado := ''REP'';'||unistr('\000a')||
'         else'||unistr('\000a')||
'           v_prev_estado := ''NUE'';'||unistr('\000a')||
'         end if;         '||unistr('\000a')||
'         --'||unistr('\000a')||
'      when ''REP'' then '||unistr('\000a')||
'         v_prev_estado := ''PRE'';'||unistr('\000a')||
'      when ''RES'' then '||unistr('\000a')||
'         v_prev_estado := ''PRE'';'||unistr('\000a')||
'      when ''NUE'' then'||unistr('\000a')||
'         v_';

p:=p||'prev_estado := ''NUE'';'||unistr('\000a')||
'   end case;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   update com_replicas'||unistr('\000a')||
'   set ESTADO = v_prev_estado'||unistr('\000a')||
'   where id = :P891_COMREP_ID;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   update com_replicas_det'||unistr('\000a')||
'   set situacion = ''ANU'''||unistr('\000a')||
'   where id = :P891_REP_ANULAR;'||unistr('\000a')||
'   -- Invalidar los documentos asociados al detalle'||unistr('\000a')||
'   update COM_REPLICAS_DOC'||unistr('\000a')||
'   set    SITUACION = ''ANU'''||unistr('\000a')||
'   where  comred_id = :P891_REP_ANULAR;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 69539808431820242 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 130,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AnularReplica',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error al anular &P891_COMREP_ESTADO. : ',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'anular',
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
p:=p||'declare'||unistr('\000a')||
'   v_datos_contrato    varchar2(4000);'||unistr('\000a')||
'begin'||unistr('\000a')||
'   v_datos_contrato := null;'||unistr('\000a')||
'   v_datos_contrato := v_datos_contrato || ''<NOMBRE_COMITENTE>''     || :P891_NOMBRE_COMITENTE     || ''</NOMBRE_COMITENTE>'';'||unistr('\000a')||
'   v_datos_contrato := v_datos_contrato || ''<COMPANIA_ASEGURADORA>'' || :P891_COMPANIA_ASEGURADORA || ''</COMPANIA_ASEGURADORA>'';'||unistr('\000a')||
'   v_datos_contrato := v_datos_contrato || ''<NRO_POLIZA>''         ';

p:=p||'  || :P891_NRO_POLIZA           || ''</NRO_POLIZA>'';'||unistr('\000a')||
'   v_datos_contrato := v_datos_contrato || ''<MONTO_SEGURO_CAUCION>'' || :P891_MONTO_SEGURO_CAUCION || ''</MONTO_SEGURO_CAUCION>'';'||unistr('\000a')||
'   v_datos_contrato := v_datos_contrato || ''<DENOMINACION_DE_OBRA>'' || :P891_DENOMINACION_DE_OBRA || ''</DENOMINACION_DE_OBRA>'';'||unistr('\000a')||
'   v_datos_contrato := v_datos_contrato || ''<DECRETO_NRO_ADJ>''      || :P891_DECRETO_NRO_ADJ';

p:=p||'      || ''</DECRETO_NRO_ADJ>'';'||unistr('\000a')||
'   v_datos_contrato := v_datos_contrato || ''<DECRETO_FECHA_ADJ>''    || :P891_DECRETO_FECHA_ADJ    || ''</DECRETO_FECHA_ADJ>'';'||unistr('\000a')||
'   v_datos_contrato := v_datos_contrato || ''<DOC_A_PRESENTAR>''      || :P891_DOC_A_PRESENTAR      || ''</DOC_A_PRESENTAR>'';'||unistr('\000a')||
'   v_datos_contrato := v_datos_contrato || ''<PLAZO_EJEC_OBRA>''      || :P891_PLAZO_EJEC_OBRA      || ''</PLAZO_EJEC_OBRA>''';

p:=p||';'||unistr('\000a')||
'   v_datos_contrato := v_datos_contrato || ''<PORC_ANT_FINANC>''      || :P891_PORC_ANT_FINANC      || ''</PORC_ANT_FINANC>'';'||unistr('\000a')||
'   v_datos_contrato := v_datos_contrato || ''<NOMBRE_REPR_PROV>''     || :P891_NOMBRE_REPR_PROV     || ''</NOMBRE_REPR_PROV>'';'||unistr('\000a')||
'   v_datos_contrato := v_datos_contrato || ''<DOC_REPR_PROV>''        || :P891_DOC_REPR_PROV        || ''</DOC_REPR_PROV>'';'||unistr('\000a')||
'   v_datos_contrato := v_datos';

p:=p||'_contrato || ''<CARACTER_REPR_PROV>''   || :P891_CARACTER_REPR_PROV   || ''</CARACTER_REPR_PROV>'';'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'   --'||unistr('\000a')||
'   update com_ordenes_compras'||unistr('\000a')||
'   set datos_contrato = v_datos_contrato'||unistr('\000a')||
'   where id = :P891_ID;'||unistr('\000a')||
'   --'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 69540025311820242 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 140,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'GrabarDatosAdicionalesContrato',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>35174924336980307 + wwv_flow_api.g_id_offset,
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
'  v_comclp COM_CALIFICACIONES_PRO%rowtype;'||unistr('\000a')||
'  v_comcpd COM_CALIFICACIONES_PRD%rowtype;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  if :P891_COMCLP_ID is null then'||unistr('\000a')||
'   -- Agregar Cabecera Prorroga'||unistr('\000a')||
'   select  COMCLP_ID.NEXTVAL into v_comclp.ID from dual;'||unistr('\000a')||
'   v_comclp.COMCLF_ID    := :P891_COMCLF_ID;'||unistr('\000a')||
'   v_comclp.COMCPT_ID    := :P891_COMCLP_COMCPT_ID;'||unistr('\000a')||
'   v_comclp.FECHA        := SYSDATE;'||unistr('\000a')||
'   v_comclp.DESCRIPCION  := :P891_COMCLP_DE';

p:=p||'SCRIPCION;'||unistr('\000a')||
'   v_comclp.ESTADO       := ''NUE'';'||unistr('\000a')||
'   v_comclp.FECHA_ESTADO := SYSDATE;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   COMOCM_PKG.COMCLP_INS(p_comclp => v_comclp);'||unistr('\000a')||
'   --'||unistr('\000a')||
'   :P891_COMCLP_ID := v_comclp.ID;'||unistr('\000a')||
'   --'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  '||unistr('\000a')||
'  -- Agregar fechas de Entrega'||unistr('\000a')||
'  v_comcpd.COMCLP_ID       := :P891_COMCLP_ID;'||unistr('\000a')||
'  v_comcpd.FECHA_ENTREGA   := :P891_COMCPD_FECHA_ENTREGA;'||unistr('\000a')||
'  v_comcpd.DESCRIPCION     := :P891_COMCPD_DESCRIPCION;'||unistr('\000a')||
'  v_co';

p:=p||'mcpd.SITUACION       := ''PEN'';'||unistr('\000a')||
'  v_comcpd.FECHA_SITUACION := SYSDATE;  '||unistr('\000a')||
'  --'||unistr('\000a')||
'  COMOCM_PKG.COMCPD_INS(p_comcpd => v_comcpd);'||unistr('\000a')||
'  --'||unistr('\000a')||
'  :P891_COMCPD_FECHA_ENTREGA := null;'||unistr('\000a')||
'  :P891_COMCPD_DESCRIPCION := null;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 69540221530820243 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 150,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Agregar Prorroga',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>69516602696820175 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> 'Se registró la entrega',
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
''||unistr('\000a')||
'  cursor cr_comclp is'||unistr('\000a')||
'      SELECT count(id)'||unistr('\000a')||
'      FROM COM_CALIFICACIONES_PRD_V'||unistr('\000a')||
'      WHERE COMCLP_ID = :P891_COMCLP_ID;'||unistr('\000a')||
''||unistr('\000a')||
'  v_cant number;'||unistr('\000a')||
''||unistr('\000a')||
'begin'||unistr('\000a')||
'	'||unistr('\000a')||
'    open cr_comclp;'||unistr('\000a')||
'    fetch cr_comclp into v_cant;'||unistr('\000a')||
'    close cr_comclp;'||unistr('\000a')||
'  --  '||unistr('\000a')||
'  -- Actualizar Estado de Cabecera'||unistr('\000a')||
'    if :P891_COMCLF_SITUACION != ''VAL'' then'||unistr('\000a')||
'        update COM_CALIFICACIONES_PRO'||unistr('\000a')||
'        set ESTADO = ''PEN'''||unistr('\000a')||
'        where id ';

p:=p||'= :P891_COMCLP_ID;'||unistr('\000a')||
'    ELSE '||unistr('\000a')||
'        update COM_CALIFICACIONES_PRO'||unistr('\000a')||
'        set ESTADO = ''APR'''||unistr('\000a')||
'        where id = :P891_COMCLP_ID;'||unistr('\000a')||
'   end if;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   -- Actualizar descripción'||unistr('\000a')||
'   '||unistr('\000a')||
'   update COM_CALIFICACIONES_PRO'||unistr('\000a')||
'   set DESCRIPCION = :P891_COMCLP_DESCRIPCION'||unistr('\000a')||
'   where id = :P891_COMCLP_ID;	'||unistr('\000a')||
'   --'||unistr('\000a')||
'     '||unistr('\000a')||
'   -- Colocar ultima fecha de prórroga a la calificación.'||unistr('\000a')||
'   /*if :P891_FECHA_PRORROGA is not nul';

p:=p||'l then'||unistr('\000a')||
'   		update COM_CALIFICACIONES'||unistr('\000a')||
'        SET FECHA_PRORROGA = :P891_FECHA_PRORROGA'||unistr('\000a')||
'        WHERE ID = :P891_COMCLF_ID;'||unistr('\000a')||
'   END IF;'||unistr('\000a')||
'   '||unistr('\000a')||
'   if v_cant = 0 then'||unistr('\000a')||
'      :P891_FECHA_PRORROGA := null;'||unistr('\000a')||
'      update COM_CALIFICACIONES'||unistr('\000a')||
'      SET FECHA_PRORROGA = :P891_FECHA_PRORROGA'||unistr('\000a')||
'      WHERE ID = :P891_COMCLF_ID;'||unistr('\000a')||
'   end if;  */'||unistr('\000a')||
'  --'||unistr('\000a')||
'                      '||unistr('\000a')||
'  :P891_EDITAR_PRORROGAS_SN := ''NO'';'||unistr('\000a')||
'  '||unistr('\000a')||
'    '||unistr('\000a')||
'e';

p:=p||'nd;';

wwv_flow_api.create_page_process(
  p_id     => 69540421011820243 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 160,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Confirmar entregas',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>69514704824820157 + wwv_flow_api.g_id_offset,
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
'p_comcpd_id number;'||unistr('\000a')||
'Begin'||unistr('\000a')||
'  -- Eliminar fechas de Entrega'||unistr('\000a')||
'  p_comcpd_id := :P891_COMCPD_ID;'||unistr('\000a')||
'  DELETE from COM_CALIFICACIONES_PRD'||unistr('\000a')||
'  WHERE ID = p_comcpd_id;'||unistr('\000a')||
'  --'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 69540626701820243 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 170,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'EliminarFechaProrroga',
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
p:=p||'declare'||unistr('\000a')||
'v_comcpd_id number;'||unistr('\000a')||
'v_comcpd_motivo varchar2 (200);'||unistr('\000a')||
'begin'||unistr('\000a')||
''||unistr('\000a')||
'-- Actualizar Entregas'||unistr('\000a')||
'    v_comcpd_id := :P891_COMCPD_ID;'||unistr('\000a')||
'    v_comcpd_motivo := :P891_MOTIVO_SITUACION;'||unistr('\000a')||
'	update COM_CALIFICACIONES_PRD'||unistr('\000a')||
'    set SITUACION = ''ENT'''||unistr('\000a')||
'        , FECHA_SITUACION = SYSDATE'||unistr('\000a')||
'        , MOTIVO_SITUACION = v_comcpd_motivo'||unistr('\000a')||
'    where id = v_comcpd_id;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 69540801022820243 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 180,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'aceptarEntrega',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=>'ACEPTA',
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
p:=p||'begin'||unistr('\000a')||
'	'||unistr('\000a')||
'	:P891_EDITAR_PRORROGAS_SN := ''SI'';'||unistr('\000a')||
''||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 69541023895820243 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 190,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'EditarPrórroga',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>42100724483545282 + wwv_flow_api.g_id_offset,
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
'  cursor cr_comclp is'||unistr('\000a')||
'      SELECT count(id)'||unistr('\000a')||
'      FROM COM_CALIFICACIONES_PRD_V'||unistr('\000a')||
'      WHERE COMCLP_ID = :P891_COMCLP_ID;'||unistr('\000a')||
'      '||unistr('\000a')||
'  cursor cr_comoce_fecha is'||unistr('\000a')||
'   select min(fecha) fecha'||unistr('\000a')||
'     from com_ordenes_compras_est'||unistr('\000a')||
'    where comocm_id = :P891_ID'||unistr('\000a')||
'      and estado = ''APR'''||unistr('\000a')||
'      and situacion = ''VAL'';'||unistr('\000a')||
'      '||unistr('\000a')||
'   cursor cr_comctt is'||unistr('\000a')||
'   	select comctt.limite_max_calificar fecha '||unistr('\000a')||
'  	from com_c';

p:=p||'ontrataciones_tipos comctt '||unistr('\000a')||
'  	where comctt.id = :P891_COMCTT_ID;'||unistr('\000a')||
'         '||unistr('\000a')||
'  v_comctt cr_comctt%rowtype;'||unistr('\000a')||
'  v_comoce_fecha  cr_comoce_fecha%ROWTYPE;'||unistr('\000a')||
'  v_cant number;'||unistr('\000a')||
'  v_fecha date;'||unistr('\000a')||
'  v_plazo_max number;'||unistr('\000a')||
'begin'||unistr('\000a')||
'   '||unistr('\000a')||
'    open cr_comclp;'||unistr('\000a')||
'    fetch cr_comclp into v_cant;'||unistr('\000a')||
'    close cr_comclp;'||unistr('\000a')||
'    '||unistr('\000a')||
'   -- Obtener la fecha de la primera aprobación de la orden'||unistr('\000a')||
'   open cr_comoce_fecha;'||unistr('\000a')||
'   fetch cr_comoce_fec';

p:=p||'ha into v_comoce_fecha;'||unistr('\000a')||
'   close cr_comoce_fecha;'||unistr('\000a')||
'   '||unistr('\000a')||
'   --'||unistr('\000a')||
'   open cr_comctt;'||unistr('\000a')||
'   fetch cr_comctt into v_comctt;'||unistr('\000a')||
'   close cr_comctt;'||unistr('\000a')||
'    '||unistr('\000a')||
'  --'||unistr('\000a')||
'  if v_comctt.fecha is null then'||unistr('\000a')||
'        --Obtener el máximo de días para calificar '||unistr('\000a')||
'        v_plazo_max := SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => ''COMADM_OCMGES_PLAZO_MAX_CLF'''||unistr('\000a')||
'                                            ,P_SEGORG_ID => :P1_SEGORG_ID); '||unistr('\000a')||
'   e';

p:=p||'lse '||unistr('\000a')||
'        v_plazo_max := v_comctt.fecha;                                         '||unistr('\000a')||
'   end if;'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'   -- Recuperar Máxima fecha de prorroga realizada'||unistr('\000a')||
'    v_fecha := null;'||unistr('\000a')||
'	select max(fecha_entrega) into v_fecha'||unistr('\000a')||
'	from COM_CALIFICACIONES_PRD_V comcpd	'||unistr('\000a')||
'	where COMCPD.COMCLP_ID = :P891_COMCLP_ID'||unistr('\000a')||
'	order by fecha_entrega desc;'||unistr('\000a')||
'    '||unistr('\000a')||
'    :P891_FECHA_PRORROGA := v_fecha;'||unistr('\000a')||
'    '||unistr('\000a')||
'    -- Colocar ultima fecha de p';

p:=p||'rórroga a la calificación.'||unistr('\000a')||
'   if :P891_FECHA_PRORROGA is not null then'||unistr('\000a')||
'   		update COM_CALIFICACIONES'||unistr('\000a')||
'        SET FECHA_PRORROGA = :P891_FECHA_PRORROGA'||unistr('\000a')||
'        WHERE ID = :P891_COMCLF_ID;'||unistr('\000a')||
'        '||unistr('\000a')||
'       --Colocar la fecha máxima de calificación en la orden'||unistr('\000a')||
'       update com_ordenes_compras'||unistr('\000a')||
'       set FECHA_MAX_CALIFICACION = (v_fecha + v_plazo_max)'||unistr('\000a')||
'       WHERE id = :P891_ID;'||unistr('\000a')||
'        '||unistr('\000a')||
'   END IF;'||unistr('\000a')||
'';

p:=p||'   '||unistr('\000a')||
'   if v_cant = 0 then'||unistr('\000a')||
'      :P891_FECHA_PRORROGA := null;'||unistr('\000a')||
'      update COM_CALIFICACIONES'||unistr('\000a')||
'      SET FECHA_PRORROGA = :P891_FECHA_PRORROGA'||unistr('\000a')||
'      WHERE ID = :P891_COMCLF_ID;'||unistr('\000a')||
'      '||unistr('\000a')||
'      --Colocar la fecha máxima de calificación en la orden  '||unistr('\000a')||
'      update com_ordenes_compras'||unistr('\000a')||
'      set FECHA_MAX_CALIFICACION = (v_comoce_fecha.fecha + v_plazo_max)'||unistr('\000a')||
'      WHERE id = :P891_ID;'||unistr('\000a')||
'          '||unistr('\000a')||
'   end if;  ';

p:=p||''||unistr('\000a')||
'  --'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 69541213331820243 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 200,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Obtn_maxfecha_prorroga',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=>'ELIMINAR,AGREGAR_ENTREGA',
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
p:=p||'begin'||unistr('\000a')||
'	:P891_AGREGAR_PRORROGA_SN := ''SI'';	'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 69541414376820245 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 210,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Agregar prorroga sn',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>43078713877067018 + wwv_flow_api.g_id_offset,
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
p:=p||'BEGIN'||unistr('\000a')||
'	:P891_AGREGAR_PRORROGA_SN := ''NO'';'||unistr('\000a')||
''||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 69541606311820245 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 220,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Agregar prorroga sn 2',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>43080402898196378 + wwv_flow_api.g_id_offset,
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
p:=p||'P891_COMCPD_FECHA_ENTREGA,P891_COMCPD_DESCRIPCION';

wwv_flow_api.create_page_process(
  p_id     => 69541802603820245 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 230,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_ITEMS',
  p_process_name=> 'Limpiar Campos',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>42100724483545282 + wwv_flow_api.g_id_offset,
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
p:=p||':P891_EDITAR_SN := ''NO'';';

wwv_flow_api.create_page_process(
  p_id     => 69542029553820245 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 240,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'cancelar',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>69508024123820143 + wwv_flow_api.g_id_offset,
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
p:=p||'2643303687746645';

wwv_flow_api.create_page_process(
  p_id     => 69535232559820226 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'CargarDatosUsuario',
  p_process_sql_clob => 2643303687746645 + wwv_flow_api.g_id_offset,
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
p:=p||'1827920554893846';

wwv_flow_api.create_page_process(
  p_id     => 69535405096820229 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 20,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'InicializarTemaPorDefault',
  p_process_sql_clob => 1827920554893846 + wwv_flow_api.g_id_offset,
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
'  CURSOR cr_comecores IS'||unistr('\000a')||
'  SELECT COMCNR.COMECO_ID'||unistr('\000a')||
'        ,COMCNR.SEGORG_CODIGO||'' - ''||InitCap(COMCNR.COMECO_NOMBRE||'' - Conectado: ''||NVL(NVL(COMCNR.COMRES_NOMBRE,COMCNR.SEGPRS_NOMBRE),SUBSTR(COMCNR.SEGUSU_USUARIO,INSTR(COMCNR.SEGUSU_USUARIO,''.'',-1)+1)))'||unistr('\000a')||
'        ,COMCNR.COMECO_NOMBRE'||unistr('\000a')||
'  FROM  COM_CONTRATANTES_RES_V COMCNR'||unistr('\000a')||
'  WHERE COMCNR.SEGUSU_USUARIO = v(''APP_USER'')'||unistr('\000a')||
'    AND NVL(COMCNR.S';

p:=p||'ITUACION,''ACT'') = ''ACT'';'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
'  IF :P1_COMECO_ID IS NULL THEN'||unistr('\000a')||
'    OPEN cr_comecores;'||unistr('\000a')||
'    FETCH cr_comecores INTO :P1_COMECO_ID'||unistr('\000a')||
'                          , :P1_USUARIO      '||unistr('\000a')||
'                          , :P1_COMECO_NOMBRE;'||unistr('\000a')||
'    CLOSE cr_comecores;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'exception'||unistr('\000a')||
'  when others then'||unistr('\000a')||
'   null;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 69535632065820229 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 30,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ObtenerDatosConexion',
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
p:=p||'2643130914745059';

wwv_flow_api.create_page_process(
  p_id     => 69535807066820229 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 50,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'CargarOrganizacionUsuario',
  p_process_sql_clob => 2643130914745059 + wwv_flow_api.g_id_offset,
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
p:=p||' DECLARE'||unistr('\000a')||
'--'||unistr('\000a')||
'  CURSOR cr_comocm IS'||unistr('\000a')||
'  SELECT COMOCE_ESTADO'||unistr('\000a')||
'       , COMOCE_MOTIVO'||unistr('\000a')||
'       , COMOCE_FECHA'||unistr('\000a')||
'       , ( SYSDATE - COMOCE_FECHA ) ESTADO_TIEMPO'||unistr('\000a')||
'       , (SELECT DECODE(CALLE,'''','''',''Calle: ''||CALLE||'' '')||'||unistr('\000a')||
'                 DECODE(NUMERO_CASA,'''','''',''Nro: ''||NUMERO_CASA||'' '')||'||unistr('\000a')||
'                 DECODE(PISO,'''','''',''Piso: ''||PISO||'' '')||'||unistr('\000a')||
'                 DECODE(DPTO,'''','''',''Dpto: ''||DPTO||'' '')||'||unistr('\000a')||
'';

p:=p||'                 DECODE(OBSERVACION,'''','''',''(''||OBSERVACION||''). '')||'||unistr('\000a')||
'                 DECODE(LOCALIDAD,'''','''',LOCALIDAD||'', '')||'||unistr('\000a')||
'                 DECODE(DEPARTAMENTO,'''','''',DEPARTAMENTO||'', '')|| PROVINCIA||'' - ''|| PAIS  '||unistr('\000a')||
'            FROM COM_DOMICILIOS'||unistr('\000a')||
'           WHERE ID = comped_comdom_id) DOMICILIO_ENTREGA'||unistr('\000a')||
'       , (SELECT COMDOM_CALLE||'' ''||'||unistr('\000a')||
'                 COMDOM_NUMERO_CASA||'' - ''||'||unistr('\000a')||
'         ';

p:=p||'        COMDOM_LOCALIDAD||'' - ''||'||unistr('\000a')||
'                 COMDOM_DEPARTAMENTO||'' - (''||'||unistr('\000a')||
'                 COMDOM_PROVINCIA||'') - CP:''||'||unistr('\000a')||
'                 COMDOM_CODIGO_POSTAL||'' ''||'||unistr('\000a')||
'                 COMDOM_OBSERVACION||'' Teléfono : (''||'||unistr('\000a')||
'                 COMDOM_TELEFONO_CODIGO_AREA||'') ''||to_char('||unistr('\000a')||
'                 COMDOM_TELEFONO_NUMERO) '||unistr('\000a')||
'            FROM COM_PROVEEDORES_DOM_V'||unistr('\000a')||
'           WHERE COMDMT_CODIGO';

p:=p||' = ''PRV_COMERCIAL'''||unistr('\000a')||
'             AND COMPRV_ID = COMOCM_V.COMPRV_ID'||unistr('\000a')||
'             AND ROWNUM = 1) COMPRV_DOMICILIO'||unistr('\000a')||
'    FROM COM_ORDENES_COMPRAS_V COMOCM_V'||unistr('\000a')||
'   WHERE ID = :P891_ID;'||unistr('\000a')||
' --'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
' --'||unistr('\000a')||
'   OPEN cr_comocm;'||unistr('\000a')||
'  FETCH cr_comocm INTO :P891_ESTADO'||unistr('\000a')||
'                     , :P891_MOTIVO'||unistr('\000a')||
'                     , :P891_ESTADO_FECHA'||unistr('\000a')||
'                     , :P891_ESTADO_TIEMPO'||unistr('\000a')||
'                     , :P891_COMP';

p:=p||'ED_DOMICILIO'||unistr('\000a')||
'                     , :P891_COMPRV_DOMICILIO;'||unistr('\000a')||
'  CLOSE cr_comocm;'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 69536022158820229 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 50,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Traer Situacion Motivo Domicilio',
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
'  cursor cr_etq (p_codigo IN VARCHAR2) IS'||unistr('\000a')||
'  SELECT VALOR'||unistr('\000a')||
'  FROM COM_ETIQUETAS_V'||unistr('\000a')||
'  WHERE CODIGO = p_codigo;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''PRV'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_PRV;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''RUB'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_RUB;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''CAT'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_CAT;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
' ';

p:=p||' OPEN cr_etq(p_codigo => ''CON'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_CON;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''PED'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_PED;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''PRO'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_PRO;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''TRP'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_TRP;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''ECC'');'||unistr('\000a')||
'  F';

p:=p||'ETCH cr_etq into :P1_COMETQ_ECC;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''COB'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_COB;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''CCL'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_CCL;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''COM'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_COM;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''OCM'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_OCM;'||unistr('\000a')||
'  C';

p:=p||'LOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  -- Singulares'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''PRVS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_PRVS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''RUBS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_RUBS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''CATS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_CATS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''CONS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_CONS;'||unistr('\000a')||
'  CLOSE cr_etq;';

p:=p||''||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''PEDS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_PEDS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''PROS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_PROS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''TRPS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_TRPS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''ECCS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_ECCS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo';

p:=p||' => ''COBS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_COBS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''CCLS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_CCLS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''COMS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_COMS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''OCMS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_OCMS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  IF :P1_COMETQ_PRV IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_PR';

p:=p||'V :=''Proveedores'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_RUB IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_RUB :=''Rubros'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_CAT IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_CAT :=''Categorías Rubros'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_CON IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_CON :=''Entidades Contratantes'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_PED IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_PED :=''Pedidos de Compras'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_PRO IS NULL THEN'||unistr('\000a')||
'   ';

p:=p||' :P1_COMETQ_PRO :=''Productos'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_TRP IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_TRP :=''Tramites Proveedores'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_ECC IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_ECC :=''Categorías EC'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_COB IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_COB :=''Objetos de Gastos'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_CCL IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_CCL :=''Clases Genéricas'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_COM I';

p:=p||'S NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_COM :=''Procesos de Compras'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_OCM IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_OCM :=''Ordenes de Compras'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  -- Singulares'||unistr('\000a')||
'  IF :P1_COMETQ_PRVS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_PRVS :=''Proveedor'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_RUBS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_RUBS :=''Rubro'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_CATS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_CATS :=''Categoría Rubro'';'||unistr('\000a')||
'  E';

p:=p||'ND IF;'||unistr('\000a')||
'  IF :P1_COMETQ_CONS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_CONS :=''Entidad Contratante'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_PEDS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_PEDS :=''Pedido de Compra'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_PROS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_PROS :=''Producto'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_TRPS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_TRPS :=''Trámite Proveedor'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_ECCS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_ECCS';

p:=p||' :=''Categoría EC'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_COBS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_COBS :=''Objeto de Gasto'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_CCLS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_CCLS :=''Clase Genérica'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_COMS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_COMS :=''Proceso de Compra'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_OCMS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_OCMS :=''Orden de Compra'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 69536205861820231 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 50,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'SetearEtiquetasDefault',
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
p:=p||'2638809097738751';

wwv_flow_api.create_page_process(
  p_id     => 69536409871820234 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 60,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'InicializarAplicacion',
  p_process_sql_clob => 2638809097738751 + wwv_flow_api.g_id_offset,
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
p:=p||'2643509228748190';

wwv_flow_api.create_page_process(
  p_id     => 69536631096820234 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 891,
  p_process_sequence=> 70,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'CargarDatosAplicacion',
  p_process_sql_clob => 2643509228748190 + wwv_flow_api.g_id_offset,
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
-- ...updatable report columns for page 891
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
