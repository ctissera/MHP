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
--   Date and Time:   13:33 Miércoles Junio 28, 2017
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

PROMPT ...Remove page 811
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>811);
 
end;
/

 
--application/pages/page_00811
prompt  ...PAGE 811: Contrataciones - Detalle
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 811
 ,p_user_interface_id => 70527406842675 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'ADMINISTRACION'
 ,p_name => 'Contrataciones - Detalle'
 ,p_alias => 'CONDET'
 ,p_step_title => 'Contrataciones - Detalle'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Detalle de &P1_COMETQ_COM.'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_welcome_text => '<style>   '||unistr('\000a')||
'   #AjaxLoading{'||unistr('\000a')||
'      padding          : 5px;'||unistr('\000a')||
'      font-size        : 14px;'||unistr('\000a')||
'      width            : 400px;'||unistr('\000a')||
'      text-align       : center;'||unistr('\000a')||
'      left             : 30%;'||unistr('\000a')||
'      top              : 40%;'||unistr('\000a')||
'      position         : absolute;'||unistr('\000a')||
'      border           : 1px solid #666;'||unistr('\000a')||
'      background-color : #FFF;'||unistr('\000a')||
'   }'||unistr('\000a')||
'</style>  '
 ,p_footer_text => '<div id="AjaxLoading" style="display:none;">Procesando.... Por favor espere...<br />'||unistr('\000a')||
'   <img src="#IMAGE_PREFIX#processing3.gif" id="wait" />'||unistr('\000a')||
'</div>'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 15952704619548666 + wwv_flow_api.g_id_offset
 ,p_javascript_code => 
'function confirmar_envio(envio){'||unistr('\000a')||
''||unistr('\000a')||
'   if (envio == null) {'||unistr('\000a')||
'      val = confirm(''Aun No ha enviado la Documentacion a Tramix. Esta seguro que desea continuar ?'');'||unistr('\000a')||
''||unistr('\000a')||
'      if (val == true)'||unistr('\000a')||
'         doSubmit(''REMITIR_UE'');'||unistr('\000a')||
''||unistr('\000a')||
'   }'||unistr('\000a')||
'   else {'||unistr('\000a')||
'      doSubmit(''REMITIR_UE'');'||unistr('\000a')||
'   }'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'function abrirDialogo() {'||unistr('\000a')||
'    $(''#dialogo'')'||unistr('\000a')||
'                 .html(''Seleccione la operacion a realizar.'')'||unistr('\000a')||
'                 .dial'||
'og({autoOpen: false'||unistr('\000a')||
'                          ,title: ''Evaluacion'''||unistr('\000a')||
'                          ,modal: true'||unistr('\000a')||
'                          ,width: 425'||unistr('\000a')||
'                          ,buttons: [{text:"Evaluar", click: function() {evaluarContratacion();}},'||unistr('\000a')||
'                                     {text:"Evaluar y Verificar", click: function() {evaluarVerificarContratacion();}},'||unistr('\000a')||
'                                     '||
'{text:"Cancelar", click: function() {cerrarDialogo();}}]'||unistr('\000a')||
'                });'||unistr('\000a')||
'  $(''#dialogo'').dialog(''open'');'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'function cerrarDialogo() {'||unistr('\000a')||
'  $(''#dialogo'').dialog(''close'');'||unistr('\000a')||
'}    '||unistr('\000a')||
''||unistr('\000a')||
'function evaluarContratacion() {'||unistr('\000a')||
'  $(''#dialogo'').dialog(''close'');	      '||unistr('\000a')||
'  $x_Show(''AjaxLoading'');  '||unistr('\000a')||
'  $s("AjaxLoading",$x("AjaxLoading").innerHTML);'||unistr('\000a')||
'  doSubmit(''EVALUAR'');'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'function evaluarVerificarContratacion() {'||unistr('\000a')||
'  $'||
'(''#dialogo'').dialog(''close'');	          '||unistr('\000a')||
'  $x_Show(''AjaxLoading'');  '||unistr('\000a')||
'  $s("AjaxLoading",$x("AjaxLoading").innerHTML);'||unistr('\000a')||
'  doSubmit(''EVALUAR_VERIFICAR'');'||unistr('\000a')||
'}'
 ,p_required_role => 9000803490644662 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_deep_linking => 'Y'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_page_comment => '<script language="JavaScript" type="text/javascript">'||unistr('\000a')||
'<!-- htmldb_cancel_message=''Seguro desea Evaluar la &P1_COMETQ_COMS. ?''; //-->'||unistr('\000a')||
'</script>'
 ,p_last_updated_by => 'CTISSERA'
 ,p_last_upd_yyyymmddhh24miss => '20170606131150'
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
  p_id=> 2274727354274710 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 811,
  p_plug_name=> 'Operaciones Habilitadas',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142030956068227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 2276003160296157 + wwv_flow_api.g_id_offset,
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
  p_id=> 2274931856276028 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 811,
  p_plug_name=> 'Informes & Comprobantes',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142030956068227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 2277110778298354 + wwv_flow_api.g_id_offset,
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
  p_id=> 5775123114807767 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 811,
  p_plug_name=> 'Menu de Accesos',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142030956068227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 5,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 5775531556819714 + wwv_flow_api.g_id_offset,
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
s:=s||'select decode(COMCLF.COMOCM_CODIGO,'''','''',''ORDEN:''||COMCLF.COMOCM_CODIGO||''/''||TO_CHAR(COMCLF.COMPED_EJERCICIO)||'' - ''||COMCLF.COMOCE_ESTADO_DESC) COMOCM_CODIGO_DESC'||unistr('\000a')||
'      ,COMCLF.COMECO_NOMBRE COMECO_CODIGO_NOMBRE'||unistr('\000a')||
'      --,comclf.COMECO_CODIGO||'' - ''||COMCLF.COMECO_NOMBRE COMECO_CODIGO_NOMBRE'||unistr('\000a')||
'      ,replace(nvl(COM_PKG.OBTN_COMCLF_CLFMOT(COMOCM_ID),'' ''),''WORKSPACE_IMAGES.'',''#WORKSPACE_IMAGES#'') CO';

s:=s||'MCLF_CALIFICACION_IMG'||unistr('\000a')||
'      ,replace(COM_PKG.OBTN_COMREP_ESTADO(COMOCM_ID),''WORKSPACE_IMAGES.'',''#WORKSPACE_IMAGES#'') COMREP_ESTADO_IMG'||unistr('\000a')||
'      ,comclf.TIPO'||unistr('\000a')||
'      ,comclf.CALIFICACION'||unistr('\000a')||
'      ,comclf.CALIFICACION_ABR'||unistr('\000a')||
'      ,comclf.COMENTARIO'||unistr('\000a')||
'      ,comclf.FECHA CALIF_FECHA'||unistr('\000a')||
'      ,comclf.COMOCM_ID COMOCM_ID'||unistr('\000a')||
'      ,null fecha_publicacion'||unistr('\000a')||
'from   COM_CALIFICACIONES_V comclf'||unistr('\000a')||
'where  SITUACION = ''VAL'''||unistr('\000a')||
'and    ';

s:=s||'COMOCE_ESTADO in (''CON'',''NOC'')'||unistr('\000a')||
'and    COMCON_ID = :P811_ID'||unistr('\000a')||
'union all'||unistr('\000a')||
'select decode(COMOCM.CODIGO,'''','''',''ORDEN:''||COMOCM.CODIGO||''/''||TO_CHAR(COMOCM.COMPED_EJERCICIO)||'' - ''||COMOCM.COMOCE_ESTADO_DESC) COMOCM_CODIGO_DESC'||unistr('\000a')||
'      ,COMOCM.COMECO_CODIGO||'' - ''||COMOCM.COMECO_NOMBRE COMECO_CODIGO_NOMBRE'||unistr('\000a')||
'      ,'' '' COMCLF_CALIFICACION_IMG'||unistr('\000a')||
'      ,'' '' COMREP_ESTADO_IMG'||unistr('\000a')||
'      ,'' '' TIPO'||unistr('\000a')||
'      ,NULL CALIFICACI';

s:=s||'ON'||unistr('\000a')||
'      ,NULL CALIFICACION_ABR'||unistr('\000a')||
'      ,'' '' COMENTARIO'||unistr('\000a')||
'      ,NULL CALIF_FECHA'||unistr('\000a')||
'      ,COMOCM.ID COMOCM_ID'||unistr('\000a')||
'      ,nvl(COMOCM.fecha_visualiza, com_pkg.DIA_HABIL_PROXIMO(FECHA_GENERACION, COMOCM.segorg_id, 5) )  fecha_publicacion'||unistr('\000a')||
'--      ,FECHA_GENERACION fecha_publicacion'||unistr('\000a')||
''||unistr('\000a')||
'from   COM_ORDENES_COMPRAS_V comocm'||unistr('\000a')||
'where  COMOCM.COMOCE_ESTADO = ''APR'''||unistr('\000a')||
'and    COMOCM.COMCON_ID = :P811_ID';

wwv_flow_api.create_report_region (
  p_id=> 11363501650753082 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 811,
  p_name=> '&P1_COMETQ_OCM.',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 70,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> ':P811_ESTADO IN (''ADJ'',''DES'',''FIN'',''CAN'',''ACR'',''VRF'',''RES'')',
  p_display_condition_type=> 'PLSQL_EXPRESSION',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '99999',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se han encontrado Ordenes de provisión asociadas',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '99999',
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
  p_id=> 11364024958753103 + wwv_flow_api.g_id_offset,
  p_region_id=> 11363501650753082 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMOCM_CODIGO_DESC',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Orden',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ID.:891:&SESSION.::&DEBUG.:891:P891_ID,P1_PAG_ANTERIOR:#COMOCM_ID#,&APP_PAGE_ID.',
  p_column_linktext=>'#COMOCM_CODIGO_DESC#',
  p_column_link_attr=>'title="Ver Detalle Orden"',
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
  p_id=> 11364119601753103 + wwv_flow_api.g_id_offset,
  p_region_id=> 11363501650753082 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMECO_CODIGO_NOMBRE',
  p_column_display_sequence=> 2,
  p_column_heading=> '&P1_COMETQ_CONS.',
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
  p_id=> 11365716524790665 + wwv_flow_api.g_id_offset,
  p_region_id=> 11363501650753082 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMCLF_CALIFICACION_IMG',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Calificación',
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 11366902925812117 + wwv_flow_api.g_id_offset,
  p_region_id=> 11363501650753082 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COMREP_ESTADO_IMG',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Descargo',
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 11364230312753103 + wwv_flow_api.g_id_offset,
  p_region_id=> 11363501650753082 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'TIPO',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Tipo',
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
  p_id=> 11364328882753103 + wwv_flow_api.g_id_offset,
  p_region_id=> 11363501650753082 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'CALIFICACION',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Calificación',
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
  p_id=> 11364425120753103 + wwv_flow_api.g_id_offset,
  p_region_id=> 11363501650753082 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'CALIFICACION_ABR',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Calificación Abr',
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
  p_id=> 11364527107753103 + wwv_flow_api.g_id_offset,
  p_region_id=> 11363501650753082 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'COMENTARIO',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Comentario',
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
  p_id=> 11364617830753103 + wwv_flow_api.g_id_offset,
  p_region_id=> 11363501650753082 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'CALIF_FECHA',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Fecha de Estado',
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
  p_id=> 11786701823656148 + wwv_flow_api.g_id_offset,
  p_region_id=> 11363501650753082 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'COMOCM_ID',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Comocm Id',
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
  p_id=> 367671104391976718 + wwv_flow_api.g_id_offset,
  p_region_id=> 11363501650753082 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_PUBLICACION',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Fecha Publicación',
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
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 16311308238597347 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 811,
  p_plug_name=> 'Datos Proceso &P1_COMETQ_COMS.',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
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
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 16311513213597349 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 811,
  p_plug_name=> 'Información de Auditoría',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142027958134227099+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 80,
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
s:=s||'SELECT '||unistr('\000a')||
'  comcon_id, '||unistr('\000a')||
'  comped_id,'||unistr('\000a')||
'  ''SOL: ''||comped_codigo||''/''||to_char(comped_ejercicio) comped_codigo,'||unistr('\000a')||
'  to_char(comped_fecha_solicitud,''DD/MM/YYYY'') comped_fecha_solicitud,'||unistr('\000a')||
'  comped_comcob_id,'||unistr('\000a')||
'  comped_ejercicio,'||unistr('\000a')||
'  comped_contratante,'||unistr('\000a')||
'  comped_solicitante,'||unistr('\000a')||
'  comped_precio,'||unistr('\000a')||
'  comped_partida_presupuestaria,'||unistr('\000a')||
'  comped_expediente,'||unistr('\000a')||
'  comped_observaciones'||unistr('\000a')||
'  ,''Detalle'' DETALLE'||unistr('\000a')||
'FROM COM_CONTRATACIONES';

s:=s||'_DET_V'||unistr('\000a')||
'WHERE COMCON_ID = :P811_ID;';

wwv_flow_api.create_report_region (
  p_id=> 16311720964597351 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 811,
  p_name=> '&P1_COMETQ_PEDS. afectada',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 40,
  p_region_attributes=>'style="width:95%"',
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
  p_query_num_rows=> '99999',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se han indicado &P1_COMETQ_PRO. ',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '99999',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_report_total_text_format=> 'Total',
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
  p_id=> 16340602957766108 + wwv_flow_api.g_id_offset,
  p_region_id=> 16311720964597351 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMCON_ID',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Comcon Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '5',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 18539126440472219 + wwv_flow_api.g_id_offset,
  p_region_id=> 16311720964597351 + wwv_flow_api.g_id_offset,
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
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '5',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 18539214216472219 + wwv_flow_api.g_id_offset,
  p_region_id=> 16311720964597351 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_CODIGO',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Solicitud',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '5',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 18539319046472219 + wwv_flow_api.g_id_offset,
  p_region_id=> 16311720964597351 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_FECHA_SOLICITUD',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Fecha Solicitud',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '5',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 18539402761472219 + wwv_flow_api.g_id_offset,
  p_region_id=> 16311720964597351 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_COMCOB_ID',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Comped Comcob Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '5',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 18539513138472219 + wwv_flow_api.g_id_offset,
  p_region_id=> 16311720964597351 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_EJERCICIO',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Comped Ejercicio',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '5',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 18539629283472219 + wwv_flow_api.g_id_offset,
  p_region_id=> 16311720964597351 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_CONTRATANTE',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Unidad Ejecutora',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '5',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 18539731623472219 + wwv_flow_api.g_id_offset,
  p_region_id=> 16311720964597351 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_SOLICITANTE',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Comped Solicitante',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '5',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 18539802925472219 + wwv_flow_api.g_id_offset,
  p_region_id=> 16311720964597351 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_PRECIO',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Importe Referencia',
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
  p_print_col_width=> '5',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 18539929788472219 + wwv_flow_api.g_id_offset,
  p_region_id=> 16311720964597351 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_PARTIDA_PRESUPUESTARIA',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Comped Partida Presupuestaria',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '5',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 18540003495472219 + wwv_flow_api.g_id_offset,
  p_region_id=> 16311720964597351 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_EXPEDIENTE',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Expediente',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '5',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 18540125091472219 + wwv_flow_api.g_id_offset,
  p_region_id=> 16311720964597351 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_OBSERVACIONES',
  p_column_display_sequence=> 12,
  p_column_heading=> 'Comped Observaciones',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '5',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 19089128695210943 + wwv_flow_api.g_id_offset,
  p_region_id=> 16311720964597351 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'DETALLE',
  p_column_display_sequence=> 13,
  p_column_heading=> 'Acciones',
  p_column_link=>'f?p=&APP_ID.:301:&SESSION.::&DEBUG.:RP,301:P301_ID:#COMPED_ID#',
  p_column_linktext=>'Ver Solicitud',
  p_column_link_attr=>'target="_blank" title="Detalle Solicitud"',
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
  p_print_col_width=> '5',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select '||unistr('\000a')||
'  COMCOD.ID COMCOD_ID'||unistr('\000a')||
' ,COMCOD.COMCON_ID'||unistr('\000a')||
' ,COMCOD.COMDOC_ID'||unistr('\000a')||
' ,COMDOC.ID ID'||unistr('\000a')||
' ,COMDOC.COMDCT_ID'||unistr('\000a')||
' ,(case when INSTR(COMDOC.TIPO_ARCHIVO,''pdf'') > 0 then'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/download_pdf_32x24.gif" width="20" height="20">'''||unistr('\000a')||
'   when INSTR(COMDOC.TIPO_ARCHIVO,''excel'') > 0 then'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/download_csv_32x24.gif" width="20" height="20">'''||unistr('\000a')||
'   when INSTR(COMDOC.TIPO_ARC';

s:=s||'HIVO,''oct'') > 0 or INSTR(COMDOC.TIPO_ARCHIVO,''word'') > 0 then'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/download_rtf_32x24.gif" width="20" height="20">'''||unistr('\000a')||
'   when INSTR(COMDOC.TIPO_ARCHIVO,''word'') > 0 then'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/download_rtf_32x24.gif" width="20" height="20">'''||unistr('\000a')||
'   when INSTR(COMDOC.TIPO_ARCHIVO,''plain'') > 0 then'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif" width="20" height="20">'' ';

s:=s||'  '||unistr('\000a')||
'   when INSTR(COMDOC.TIPO_ARCHIVO,''image'') > 0 then'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/chart_32x24.gif" width="20" height="20">''  '||unistr('\000a')||
'   else'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif" width="20" height="20">''   '||unistr('\000a')||
'   end) ICONO'||unistr('\000a')||
' ,to_char(comcod.FECHA, ''DD/MM/YYYY HH24:MI'')||'' - ''||(SELECT NOMBRE FROM COM_DOCUMENTOS_TIPOS WHERE ID = COMDOC.COMDCT_ID)TIPO'||unistr('\000a')||
' ,dbms_lob.getlength(COMDOC.DOCUMENTO) DOCU';

s:=s||'MENTO'||unistr('\000a')||
' ,COMDOC.NOMBRE_ARCHIVO'||unistr('\000a')||
' ,COMDOC.TIPO_ARCHIVO'||unistr('\000a')||
' ,to_char(COMCOD.FECHA,''DD/MM/YY'') FECHA'||unistr('\000a')||
'from COM_CONTRATACIONES_DOC COMCOD,'||unistr('\000a')||
'     COM_DOCUMENTOS  COMDOC'||unistr('\000a')||
'where COMCOD.COMDOC_ID = COMDOC.ID'||unistr('\000a')||
'  and COMCOD.COMCON_ID = :P811_ID'||unistr('\000a')||
''||unistr('\000a')||
'';

wwv_flow_api.create_report_region (
  p_id=> 16313210519597354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 811,
  p_name=> 'Documentos del Proceso',
  p_region_name=>'',
  p_template=> 142030956068227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 30,
  p_region_attributes=>'align="center"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'REGION_POSITION_03',
  p_item_display_point=> 'BELOW',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'N',
  p_rest_enabled=> 'N',
  p_query_row_template=> 13,
  p_query_headings_type=> 'NO_HEADINGS',
  p_query_num_rows=> '99999',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se han adjuntado documentos al Proceso.',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '99999',
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
  p_id=> 16342929323802069 + wwv_flow_api.g_id_offset,
  p_region_id=> 16313210519597354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMCOD_ID',
  p_column_display_sequence=> 10,
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 16343013005802069 + wwv_flow_api.g_id_offset,
  p_region_id=> 16313210519597354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMCON_ID',
  p_column_display_sequence=> 11,
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 16314004604597355 + wwv_flow_api.g_id_offset,
  p_region_id=> 16313210519597354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMDOC_ID',
  p_column_display_sequence=> 4,
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 16314109573597355 + wwv_flow_api.g_id_offset,
  p_region_id=> 16313210519597354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 16314223429597355 + wwv_flow_api.g_id_offset,
  p_region_id=> 16313210519597354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMDCT_ID',
  p_column_display_sequence=> 6,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'TEXT_FROM_LOV',
  p_named_lov=>14940416616444296 + wwv_flow_api.g_id_offset,
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'DOC_DOCUMENTOS',
  p_ref_column_name=> 'COMDCT_ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 16313420124597355 + wwv_flow_api.g_id_offset,
  p_region_id=> 16313210519597354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'ICONO',
  p_column_display_sequence=> 1,
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 16313725169597355 + wwv_flow_api.g_id_offset,
  p_region_id=> 16313210519597354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'TIPO',
  p_column_display_sequence=> 7,
  p_column_heading=> '',
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
  p_id=> 16314433033597355 + wwv_flow_api.g_id_offset,
  p_region_id=> 16313210519597354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 8,
  p_column_heading=> '',
  p_column_format=> 'DOWNLOAD:COM_DOCUMENTOS:DOCUMENTO:ID::TIPO_ARCHIVO:NOMBRE_ARCHIVO:::attachment:Abrir<br>Doc.',
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
  p_id=> 16313521662597355 + wwv_flow_api.g_id_offset,
  p_region_id=> 16313210519597354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'NOMBRE_ARCHIVO',
  p_column_display_sequence=> 2,
  p_column_heading=> '',
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
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'DOC_DOCUMENTO',
  p_ref_column_name=> 'NOMBRE_ARCHIVO',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 16313607305597355 + wwv_flow_api.g_id_offset,
  p_region_id=> 16313210519597354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'TIPO_ARCHIVO',
  p_column_display_sequence=> 3,
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 16314310262597355 + wwv_flow_api.g_id_offset,
  p_region_id=> 16313210519597354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA',
  p_column_display_sequence=> 9,
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
s:=s||'SELECT COMCON_V.ID'||unistr('\000a')||
'      ,COMCON_V.COMCON_ID'||unistr('\000a')||
'      ,COMCON_V.FECHA'||unistr('\000a')||
'      ,'' <b>''||(select rv_abbreviation from   cg_ref_codes'||unistr('\000a')||
'                 where  rv_domain = ''COM_CONTRATACIONES_EST.ESTADO'''||unistr('\000a')||
'                   and rv_low_value = COMCON_V.ESTADO)||''</b>'' ESTADO'||unistr('\000a')||
'      ,COMCON_V.MOTIVO  '||unistr('\000a')||
'      ,COMCON_V.ESTADO_ACTUAL_SN'||unistr('\000a')||
'      ,COMCON_V.DATE_CREATED'||unistr('\000a')||
'      ,COMCON_V.CREATED_BY'||unistr('\000a')||
'      ,SEG_PKG.OBTN_SE';

s:=s||'GUSU_NOMBRE(COMCON_V.CREATED_BY) CREADO_POR_USUARIO'||unistr('\000a')||
'      ,COMCON_V.DATE_MODIFIED'||unistr('\000a')||
'      ,COMCON_V.MODIFIED_BY'||unistr('\000a')||
'  FROM COM_CONTRATACIONES_EST_V COMCON_V'||unistr('\000a')||
' WHERE COMCON_V.COMCON_ID = :P811_ID'||unistr('\000a')||
'   AND ( (:P811_FILTRO_ESTADO = ''VIG'' AND COMCON_V.ID = COM_PKG.OBTN_COMCOE_ID(:P811_ID)) '||unistr('\000a')||
'    OR (:P811_FILTRO_ESTADO = ''HIS'' AND COMCON_V.ID <> COM_PKG.OBTN_COMCOE_ID(:P811_ID)) '||unistr('\000a')||
'    OR (:P811_FILTRO_ESTADO = ''';

s:=s||'VIGHIS''))'||unistr('\000a')||
' ORDER BY COMCON_V.ESTADO_ACTUAL_SN DESC, COMCON_V.ID DESC'||unistr('\000a')||
'';

wwv_flow_api.create_report_region (
  p_id=> 16314513635597355 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 811,
  p_name=> 'Estados Proceso de &P1_COMETQ_COMS.',
  p_region_name=>'',
  p_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 30,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_required_role => 14704115594259404+ wwv_flow_api.g_id_offset,
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '99999',
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
  p_id=> 16315124951597355 + wwv_flow_api.g_id_offset,
  p_region_id=> 16314513635597355 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 1,
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
  p_id=> 16328806711663107 + wwv_flow_api.g_id_offset,
  p_region_id=> 16314513635597355 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMCON_ID',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Comcon Id',
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
  p_id=> 16315422058597355 + wwv_flow_api.g_id_offset,
  p_region_id=> 16314513635597355 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA',
  p_column_display_sequence=> 2,
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
  p_id=> 16315215548597355 + wwv_flow_api.g_id_offset,
  p_region_id=> 16314513635597355 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'ESTADO',
  p_column_display_sequence=> 3,
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
  p_id=> 16315623949597355 + wwv_flow_api.g_id_offset,
  p_region_id=> 16314513635597355 + wwv_flow_api.g_id_offset,
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
  p_id=> 16315526755597355 + wwv_flow_api.g_id_offset,
  p_region_id=> 16314513635597355 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'ESTADO_ACTUAL_SN',
  p_column_display_sequence=> 9,
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
  p_id=> 16314728123597355 + wwv_flow_api.g_id_offset,
  p_region_id=> 16314513635597355 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'DATE_CREATED',
  p_column_display_sequence=> 5,
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
  p_id=> 16314832275597355 + wwv_flow_api.g_id_offset,
  p_region_id=> 16314513635597355 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'CREATED_BY',
  p_column_display_sequence=> 6,
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
  p_id=> 7628326464720838 + wwv_flow_api.g_id_offset,
  p_region_id=> 16314513635597355 + wwv_flow_api.g_id_offset,
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
  p_id=> 16314928915597355 + wwv_flow_api.g_id_offset,
  p_region_id=> 16314513635597355 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'DATE_MODIFIED',
  p_column_display_sequence=> 7,
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
  p_id=> 16315017188597355 + wwv_flow_api.g_id_offset,
  p_region_id=> 16314513635597355 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'MODIFIED_BY',
  p_column_display_sequence=> 8,
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
s:=s||'select COMCOI.COMCON_ID'||unistr('\000a')||
'      ,COMCOI.COMPRV_ID'||unistr('\000a')||
'      ,COMPRV.CUIT   CUIT'||unistr('\000a')||
'      ,COMPRV.NOMBRE PROVEEDOR'||unistr('\000a')||
'      ,COMPRV.EMAIL  EMAIL'||unistr('\000a')||
'      ,decode(COMPRV_PKG.COMPRV_HABILITADO_COTIZAR_SN(p_comprv_id => COMCOI.COMPRV_ID'||unistr('\000a')||
'                                                     ,p_comrub_id => to_number(:P811_COMRUB_ID)                                                '||unistr('\000a')||
'                                      ';

s:=s||'               ,p_comctt_id => to_number(:P811_COMCTT_ID)),''SI'', ''<font color=green><b>AL DIA</b></font>'',''<a href="javascript:popUp2(''''f?p=&APP_ID.:636:&SESSION.::&DEBUG.:636:P636_COMPRV_ID,P636_COMRUB_ID,P636_COMCTT_ID:''||COMPRV_ID||'',&P811_COMRUB_ID.,&P811_COMCTT_ID.'''',670,610)"><font color=red><b>DEBE</b></font></a>'') HABILITADO_COTIZAR'||unistr('\000a')||
'      ,''<a href="javascript:popUp2(''''f?p=&APP_ID.:635:&SE';

s:=s||'SSION.::&DEBUG.:635:P635_COMPRV_ID,P635_COMRUB_ID:''||COMPRV_ID||'',&P811_COMRUB_ID.'''',670,610)">'''||unistr('\000a')||
'       ||replace((COM_PKG.OBTN_REPUTACION_URL(P_COMRUB_ID=> :P811_COMRUB_ID'||unistr('\000a')||
'                  ,P_COMPRV_ID=> comprv_id'||unistr('\000a')||
'                  ,P_FECHA_VIGENCIA => SYSDATE'||unistr('\000a')||
'                 ,P_COLOR_FONDO => ''G'')'||unistr('\000a')||
'                 ),''WORKSPACE_IMAGES.'',''#WORKSPACE_IMAGES#'')||''</a>'' REPUTACION'||unistr('\000a')||
'      ,replace((C';

s:=s||'OM_PKG.OBTN_CATEG_DOM_URL(P_COMPRV_ID => COMPRV_ID'||unistr('\000a')||
'                                  ,P_COMPED_ID => :P811_COMPED_ID'||unistr('\000a')||
'                                  ,P_COLOR_FONDO => ''G'''||unistr('\000a')||
'        )),''WORKSPACE_IMAGES.'',''#WORKSPACE_IMAGES#'') CATEGORIZACION'||unistr('\000a')||
',case (COMPRV_PKG.COMPRV_RUBRO_SITUACION(p_comprv_id => COMCOI.COMPRV_ID'||unistr('\000a')||
'                                  ,p_comcon_id =>to_number(:P811_ID))) '||unistr('\000a')||
'  when ''INVITA';

s:=s||'DO'' then'||unistr('\000a')||
'       ''<font color="green"><b>INVITADO</b></font>''  '||unistr('\000a')||
' when ''INSCRIPTO'' then'||unistr('\000a')||
'       ''<font color="green"><b>INSCRIPTO</b></font>'' '||unistr('\000a')||
' when ''NO INSCRIPTO'' then'||unistr('\000a')||
'       ''<font color="red"><b>NO INSCRIPTO</b></font>'''||unistr('\000a')||
' else                                              '||unistr('\000a')||
'   ''''                                '||unistr('\000a')||
' end  INSCRIPTO_RUBRO_ABR'||unistr('\000a')||
'from com_contrataciones_inv comcoi,'||unistr('\000a')||
'     com_proveedores        ';

s:=s||'comprv'||unistr('\000a')||
'where comcoi.comprv_id = comprv.ID'||unistr('\000a')||
'  and comprv.segorg_id = seg_pkg.obtn_orgusu (NVL (v (''APP_USER''), USER))'||unistr('\000a')||
'  and comcoi.comcon_id = :P811_ID'||unistr('\000a')||
'  and comcoi.SITUACION = ''ACT'''||unistr('\000a')||
'order by comprv.NOMBRE;';

wwv_flow_api.create_report_region (
  p_id=> 16413503004212352 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 811,
  p_name=> 'Invitaciones cursadas',
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
  p_required_role => 14704223213261630+ wwv_flow_api.g_id_offset,
  p_display_condition_type=> 'NEVER',
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
  p_query_no_data_found=> 'No se ha encontrado ningúna invitacion.',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '9999',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
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
  p_id=> 16413909481212369 + wwv_flow_api.g_id_offset,
  p_region_id=> 16413503004212352 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMCON_ID',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Comcon Id',
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
  p_id=> 16414002419212369 + wwv_flow_api.g_id_offset,
  p_region_id=> 16413503004212352 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 2,
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
  p_id=> 18485130830265287 + wwv_flow_api.g_id_offset,
  p_region_id=> 16413503004212352 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'CUIT',
  p_column_display_sequence=> 4,
  p_column_heading=> 'CUIT',
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
  p_id=> 18485201665265288 + wwv_flow_api.g_id_offset,
  p_region_id=> 16413503004212352 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'PROVEEDOR',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Proveedor',
  p_use_as_row_header=> 'N',
  p_column_link=>'javascript:popupURL(''f?p=&APP_ID.:842:&SESSION.::&DEBUG.:842:P842_COMPRV_ID:#COMPRV_ID#'');',
  p_column_linktext=>'#PROVEEDOR#',
  p_column_link_attr=>'title="Ver Detalle del Proveedor"',
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
  p_id=> 18485421575265288 + wwv_flow_api.g_id_offset,
  p_region_id=> 16413503004212352 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'EMAIL',
  p_column_display_sequence=> 5,
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
  p_id=> 7990910279162271 + wwv_flow_api.g_id_offset,
  p_region_id=> 16413503004212352 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'HABILITADO_COTIZAR',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Documentación',
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
  p_id=> 31159312998324846 + wwv_flow_api.g_id_offset,
  p_region_id=> 16413503004212352 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'REPUTACION',
  p_column_display_sequence=> 6,
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31156218287033004 + wwv_flow_api.g_id_offset,
  p_region_id=> 16413503004212352 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'CATEGORIZACION',
  p_column_display_sequence=> 7,
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32884424143107506 + wwv_flow_api.g_id_offset,
  p_region_id=> 16413503004212352 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'INSCRIPTO_RUBRO_ABR',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Rubro',
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
s:=s||'SELECT '||unistr('\000a')||
'     detped.comcon_id'||unistr('\000a')||
'   , detped.comped_id'||unistr('\000a')||
'   , detped.comcot_id'||unistr('\000a')||
'   , detped.renglon'||unistr('\000a')||
'   , detped.comccl_id'||unistr('\000a')||
'   , detped.comcit_id'||unistr('\000a')||
'   , detped.codigo'||unistr('\000a')||
'   , detped.descripcion||DECODE(detped.observacion,'''','''','' - ''||detped.observacion) descripcion'||unistr('\000a')||
'   , detped.cantidad'||unistr('\000a')||
'   -- -- Si el item no existe muestra el precio del pedido      '||unistr('\000a')||
'   ,DECODE(DETPED.COMCIT_ID,NULL,''$ ''||TO_CHAR(DETPED.PRECIO_';

s:=s||'UNITARIO,''999,999,999.99'')'||unistr('\000a')||
'          -- Si el precio sugerido es igual al precio del pedido, verificar si es de referencia'||unistr('\000a')||
'          ,DECODE(DETPED.PRECIO_UNITARIO - COMCAT_PKG.COMCIT_OBTN_PRECIO(DETPED.COMCIT_ID, (SELECT FECHA_SOLICITUD'||unistr('\000a')||
'                                                                                           FROM   COM_PEDIDOS'||unistr('\000a')||
'                                                    ';

s:=s||'                                       WHERE  ID = DETPED.COMPED_ID)), 0             '||unistr('\000a')||
'             -- Si el item existe y el precio del item no esta definido en el catalodog de precios mustra el precio del pedido como precio de referencia'||unistr('\000a')||
'            ,(SELECT DECODE(COMCIT_V.COMCTP_PRECIO,'''',''<font color=RED><b>$ ''||TO_CHAR(detped.precio_unitario,''999,999,999.99'')||'' <img src="#IMAGE_PREFIX#menu/i';

s:=s||'_status_gray_16x16.gif"  title="Es Precio de Referencia"</></b></font>'''||unistr('\000a')||
'                -- Si el item existe y el precio del item es igual al precio en el catalogo de precios muestra el precio del pedido como precio testigo'||unistr('\000a')||
'                    ,DECODE(SIGN(NVL(detped.precio_unitario,0)-NVL(COMCIT_V.COMCTP_PRECIO,0)),0,''<font color=BLUE><b>$ ''|| TO_CHAR(detped.precio_unitario,''999,999,999.99'')||'' <';

s:=s||'img src="#IMAGE_PREFIX#menu/blue_info_16x16.gif"  title="Es Precio Testigo Vigente"</></b></font>'''||unistr('\000a')||
'                -- Caso contrario mostrar el precio del pedido normal'||unistr('\000a')||
'                                                                                               ,''<b>$ ''||TO_CHAR(detped.precio_unitario,''999,999,999.99'')||'' <img src="#IMAGE_PREFIX#menu/i_status_16x16.gif"  title="Es Precio Testigo';

s:=s||'"</></b>''))'||unistr('\000a')||
'              FROM COM_CATALOGO_ITEMS_V  COMCIT_V '||unistr('\000a')||
'              WHERE DETPED.COMCIT_ID = COMCIT_V.ID(+))'||unistr('\000a')||
'            , ''$ ''||TO_CHAR(DETPED.PRECIO_UNITARIO,''999,999,999.99'')'||unistr('\000a')||
'           )) PRECIO_UNITARIO   '||unistr('\000a')||
'   , detped.cantidad*detped.precio_unitario precio_total'||unistr('\000a')||
'   , detped.observacion'||unistr('\000a')||
'FROM SIS_OWNER.COM_CONTRATACIONES_DETPED_V DETPED'||unistr('\000a')||
'WHERE COMCON_ID = :P811_ID'||unistr('\000a')||
'  AND detped.cantidad ';

s:=s||'> 0'||unistr('\000a')||
'ORDER BY detped.comped_id, detped.renglon';

wwv_flow_api.create_report_region (
  p_id=> 16435619608415933 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 811,
  p_name=> '&P1_COMETQ_PRO. requeridos',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 50,
  p_region_attributes=>'style="width:95%"',
  p_report_attributes=>'style="width:80%"',
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
  p_rest_enabled=> 'N',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '99999',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se han indicado &P1_COMETQ_PRO. ',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '99999',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_report_total_text_format=> 'Total',
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
  p_comment=>'SELECT '||unistr('\000a')||
'     detped.comcon_id'||unistr('\000a')||
'   , detped.comped_id'||unistr('\000a')||
'   , detped.comcot_id'||unistr('\000a')||
'   , detped.renglon'||unistr('\000a')||
'   , detped.comccl_id'||unistr('\000a')||
'   , detped.comcit_id'||unistr('\000a')||
'   , detped.codigo'||unistr('\000a')||
'   , detped.descripcion||DECODE(detped.observacion,'''','''','' - ''||detped.observacion) descripcion'||unistr('\000a')||
'   , detped.cantidad'||unistr('\000a')||
'   ,DECODE(DETPED.COMCIT_ID,NULL,''$ ''||TO_CHAR(detped.precio_unitario,''999,999,999.99'')'||unistr('\000a')||
'            , (SELECT DECODE(COMCIT_V.COMCTP_PRECIO,'''','||unistr('\000a')||
'     ''<font color=RED><b>$ ''||TO_CHAR(detped.precio_unitario,''999,999,999.99'')'||unistr('\000a')||
'            ||'' <img src="#IMAGE_PREFIX#menu/i_status_gray_16x16.gif"  title="Es Precio de Referencia"</></b></font>'''||unistr('\000a')||
'     ,DECODE(SIGN(NVL(detped.precio_unitario,0)-NVL(COMCIT_V.COMCTP_PRECIO,0))'||unistr('\000a')||
'           ,0'||unistr('\000a')||
'           ,''<font color=BLUE><b>$ '''||unistr('\000a')||
'            || TO_CHAR(detped.precio_unitario,''999,999,999.99'')'||unistr('\000a')||
'            ||'' <img src="#IMAGE_PREFIX#menu/blue_info_16x16.gif"  title="Es Precio Testigo Vigente"</></b></font>'''||unistr('\000a')||
'          ,''<b>$ ''||TO_CHAR(detped.precio_unitario,''999,999,999.99'')'||unistr('\000a')||
'            ||'' <img src="#IMAGE_PREFIX#menu/i_status_16x16.gif"  title="Es Precio Testigo"</></b>'''||unistr('\000a')||
')) FROM COM_CATALOGO_ITEMS_V        COMCIT_V '||unistr('\000a')||
'  WHERE DETPED.COMCIT_ID = COMCIT_V.ID(+)'||unistr('\000a')||
'))'||unistr('\000a')||
'PRECIO_UNITARIO  '||unistr('\000a')||
'   , detped.cantidad*detped.precio_unitario precio_total'||unistr('\000a')||
'   , detped.observacion'||unistr('\000a')||
'FROM SIS_OWNER.COM_CONTRATACIONES_DETPED_V DETPED'||unistr('\000a')||
'WHERE COMCON_ID = :P811_ID'||unistr('\000a')||
'  AND detped.cantidad > 0'||unistr('\000a')||
'ORDER BY detped.comped_id, detped.renglon');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 18609111511515258 + wwv_flow_api.g_id_offset,
  p_region_id=> 16435619608415933 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMCON_ID',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Comcon Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '3',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 16435907411415937 + wwv_flow_api.g_id_offset,
  p_region_id=> 16435619608415933 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_ID',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Comped Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '3',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 18609219786515258 + wwv_flow_api.g_id_offset,
  p_region_id=> 16435619608415933 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMCOT_ID',
  p_column_display_sequence=> 12,
  p_column_heading=> 'Comcot Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '3',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 16436025014415937 + wwv_flow_api.g_id_offset,
  p_region_id=> 16435619608415933 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'RENGLON',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Item',
  p_column_alignment=>'CENTER',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '3',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 16436120419415937 + wwv_flow_api.g_id_offset,
  p_region_id=> 16435619608415933 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMCCL_ID',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Comccl Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '3',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 16436216139415937 + wwv_flow_api.g_id_offset,
  p_region_id=> 16435619608415933 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'COMCIT_ID',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Comcit Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '3',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 16436300641415937 + wwv_flow_api.g_id_offset,
  p_region_id=> 16435619608415933 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'CODIGO',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Código',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '3',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 16436423737415937 + wwv_flow_api.g_id_offset,
  p_region_id=> 16435619608415933 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'DESCRIPCION',
  p_column_display_sequence=> 3,
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
  p_print_col_width=> '3',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 16436527363415937 + wwv_flow_api.g_id_offset,
  p_region_id=> 16435619608415933 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'CANTIDAD',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Cantidad',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '3',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 16436629781415937 + wwv_flow_api.g_id_offset,
  p_region_id=> 16435619608415933 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'PRECIO_UNITARIO',
  p_column_display_sequence=> 5,
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
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '3',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20522815896970987 + wwv_flow_api.g_id_offset,
  p_region_id=> 16435619608415933 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'PRECIO_TOTAL',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Precio Total',
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
  p_print_col_width=> '3',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 16436715855415937 + wwv_flow_api.g_id_offset,
  p_region_id=> 16435619608415933 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'OBSERVACION',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Observacion',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '3',
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
  p_id=> 16517809788179527 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 811,
  p_plug_name=> 'Fechas del Proceso de &P1_COMETQ_COMS.',
  p_region_name=>'',
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
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_required_role => 14698128969253802+ wwv_flow_api.g_id_offset,
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => ':P811_FECHA_PUBLICACION IS NOT NULL and  (:P1_COMECO_ID is null or COMECO_PKG.COMECO_COMCTT_HAB_SN(p_comeco_id => :P1_COMECO_ID '||unistr('\000a')||
'                                ,p_comctt_id => :P811_COMCTT_ID) = ''SI'')',
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
  p_id=> 19631003272586658 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 811,
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
s:=s||'select '||unistr('\000a')||
' COMPEC.ID COMPEC_ID'||unistr('\000a')||
' ,COMPEC.COMPED_ID'||unistr('\000a')||
' ,COMPEC.COMDOC_ID'||unistr('\000a')||
' ,COMDOC.ID ID'||unistr('\000a')||
' ,COMDOC.COMDCT_ID'||unistr('\000a')||
' ,(case when INSTR(COMDOC.TIPO_ARCHIVO,''pdf'') > 0 then'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/download_pdf_32x24.gif" width="20" height="20">'''||unistr('\000a')||
'   when INSTR(COMDOC.TIPO_ARCHIVO,''excel'') > 0 then'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/download_csv_32x24.gif" width="20" height="20">'''||unistr('\000a')||
'   when INSTR(COMDOC.TIPO_ARCH';

s:=s||'IVO,''oct'') > 0 then'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif" width="20" height="20">'''||unistr('\000a')||
'   when INSTR(COMDOC.TIPO_ARCHIVO,''word'') > 0 then'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/download_rtf_32x24.gif" width="20" height="20">'''||unistr('\000a')||
'   when INSTR(COMDOC.TIPO_ARCHIVO,''plain'') > 0 then'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif" width="20" height="20">''    '||unistr('\000a')||
'   when INSTR(COMDOC.TIPO_ARCHIVO,''image'') > 0';

s:=s||' then'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/chart_32x24.gif" width="20" height="20">''   '||unistr('\000a')||
'   else'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif" width="20" height="20">''    '||unistr('\000a')||
'   end) ICONO'||unistr('\000a')||
' ,to_char(COMPEC.FECHA,''DD/MM/YYYY HH24:MI'')||'' - ''||(SELECT NOMBRE FROM COM_DOCUMENTOS_TIPOS WHERE ID = COMDOC.COMDCT_ID)TIPO'||unistr('\000a')||
' ,dbms_lob.getlength(COMDOC.DOCUMENTO) DOCUMENTO'||unistr('\000a')||
' ,COMDOC.NOMBRE_ARCHIVO'||unistr('\000a')||
' ,COMDOC.TIPO_ARCH';

s:=s||'IVO'||unistr('\000a')||
' ,to_char(COMPEC.FECHA,''DD/MM/YY'') FECHA'||unistr('\000a')||
'from COM_PEDIDOS_DOC COMPEC,'||unistr('\000a')||
'     COM_DOCUMENTOS  COMDOC'||unistr('\000a')||
'where COMPEC.COMDOC_ID = COMDOC.ID'||unistr('\000a')||
'  and COMPEC.COMPED_ID = :P811_COMPED_ID'||unistr('\000a')||
'order by compec.fecha';

wwv_flow_api.create_report_region (
  p_id=> 20305500793157712 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 811,
  p_name=> 'Documentos de la <br>&P1_COMETQ_PEDS.',
  p_region_name=>'',
  p_template=> 142030956068227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 40,
  p_region_attributes=>'align="center"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'REGION_POSITION_03',
  p_item_display_point=> 'BELOW',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 13,
  p_query_headings_type=> 'NO_HEADINGS',
  p_query_num_rows=> '99999',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se han adjuntado documento a la &P1_COMETQ_PEDS..',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '99999',
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
  p_id=> 20305830772157737 + wwv_flow_api.g_id_offset,
  p_region_id=> 20305500793157712 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMPEC_ID',
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20305908573157737 + wwv_flow_api.g_id_offset,
  p_region_id=> 20305500793157712 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_ID',
  p_column_display_sequence=> 3,
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20306030490157737 + wwv_flow_api.g_id_offset,
  p_region_id=> 20305500793157712 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMDOC_ID',
  p_column_display_sequence=> 4,
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20306110717157737 + wwv_flow_api.g_id_offset,
  p_region_id=> 20305500793157712 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20306216767157737 + wwv_flow_api.g_id_offset,
  p_region_id=> 20305500793157712 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMDCT_ID',
  p_column_display_sequence=> 6,
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20306309691157737 + wwv_flow_api.g_id_offset,
  p_region_id=> 20305500793157712 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'ICONO',
  p_column_display_sequence=> 1,
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20306407257157737 + wwv_flow_api.g_id_offset,
  p_region_id=> 20305500793157712 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'TIPO',
  p_column_display_sequence=> 9,
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20306503192157737 + wwv_flow_api.g_id_offset,
  p_region_id=> 20305500793157712 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 10,
  p_column_heading=> '',
  p_column_format=> 'DOWNLOAD:COM_DOCUMENTOS:DOCUMENTO:ID::TIPO_ARCHIVO:NOMBRE_ARCHIVO:::attachment:Abrir<br>Doc.',
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
  p_id=> 20306619486157737 + wwv_flow_api.g_id_offset,
  p_region_id=> 20305500793157712 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'NOMBRE_ARCHIVO',
  p_column_display_sequence=> 7,
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20306732961157737 + wwv_flow_api.g_id_offset,
  p_region_id=> 20305500793157712 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'TIPO_ARCHIVO',
  p_column_display_sequence=> 8,
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20306823229157737 + wwv_flow_api.g_id_offset,
  p_region_id=> 20305500793157712 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA',
  p_column_display_sequence=> 11,
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
s:=s||'select ID'||unistr('\000a')||
'     , COMPRV_ID'||unistr('\000a')||
'     , (SELECT NOMBRE '||unistr('\000a')||
'          FROM COM_PROVEEDORES_V'||unistr('\000a')||
'         WHERE ID = COMCTZ_V.COMPRV_ID) NOMBRE_PROVEEDOR'||unistr('\000a')||
'     , CODIGO'||unistr('\000a')||
'     , FECHA'||unistr('\000a')||
'     , OBSERVACION'||unistr('\000a')||
'     , COMCON_ID'||unistr('\000a')||
'     , SITUACION_DESC||DECODE(MOTIVO,'''','''','' - ''||MOTIVO) SITUACION_DESC'||unistr('\000a')||
'     , case SITUACION'||unistr('\000a')||
'        when ''PRE'' THEN '||unistr('\000a')||
'              ''<a href="f?p=&APP_ID.:866:&SESSION.::&DEBUG.:866:P866_ID:''||to';

s:=s||'_char(ID)||''" >Desestimar</a>'''||unistr('\000a')||
'        end ACCION'||unistr('\000a')||
'     , case SITUACION'||unistr('\000a')||
'        when ''RCH'' THEN ''<a href="f?p=&APP_ID.:868:&SESSION.::&DEBUG.:868:P868_ID:''||to_char(ID)||''" >Incorporar</a>'' '||unistr('\000a')||
'       end ACCION2'||unistr('\000a')||
'     ,''<a href="javascript:popUp2(''''f?p=&APP_ID.:843:&SESSION.::&DEBUG.:843:P843_COMCON_ID,P843_COMCTZ_ID,P843_COMPRV_ID:''||to_char(COMCON_ID)||'',''||to_char(ID)||'',''||to_char(COMPRV_ID)||''''''';

s:=s||',890,610)">Ver Detalle</a>'' ACCION3'||unistr('\000a')||
'from COM_COTIZACIONES_V COMCTZ_V'||unistr('\000a')||
'where COMCON_ID = :P811_ID'||unistr('\000a')||
'  AND SITUACION NOT IN (''NUE'',''ANU'')'||unistr('\000a')||
'ORDER BY NOMBRE_PROVEEDOR';

wwv_flow_api.create_report_region (
  p_id=> 20534426913144437 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 811,
  p_name=> 'Ofertas Presentadas',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 60,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> ':P811_ESTADO IN (''EVA'',''PRE'',''ADJ'',''DES'',''FIN'',''NAD'',''INF'',''ENV'',''CAN'',''ACR'',''VRF'',''RES'') OR'||unistr('\000a')||
'(:P811_ESTADO IN (''ACT'') AND :P811_FECHA_INICIO_EVALUACION <= SYSDATE)',
  p_display_condition_type=> 'PLSQL_EXPRESSION',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '99999',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols=> '1',
  p_query_no_data_found=> 'No se han encontrado cotizaciones presentadas.',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '99999',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'REPEAT_HEADINGS_ON_BREAK_1',
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
  p_id=> 21275519128036276 + wwv_flow_api.g_id_offset,
  p_region_id=> 20534426913144437 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 10,
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
  p_id=> 20534725974144446 + wwv_flow_api.g_id_offset,
  p_region_id=> 20534426913144437 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Comprv Id',
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
  p_id=> 20587115249699374 + wwv_flow_api.g_id_offset,
  p_region_id=> 20534426913144437 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'NOMBRE_PROVEEDOR',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Nombre',
  p_column_link=>'javascript:popupURL(''f?p=&APP_ID.:842:&SESSION.::&DEBUG.:842:P842_COMPRV_ID:#COMPRV_ID#'');',
  p_column_linktext=>'#NOMBRE_PROVEEDOR#',
  p_column_link_attr=>'title="Ver Detalle del Proveedor"',
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
  p_id=> 21284209797184901 + wwv_flow_api.g_id_offset,
  p_region_id=> 20534426913144437 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'CODIGO',
  p_column_display_sequence=> 2,
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
  p_id=> 21284322658184901 + wwv_flow_api.g_id_offset,
  p_region_id=> 20534426913144437 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Fecha Presentación',
  p_column_format=> 'DD/MM/YYYY HH24:MI',
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
  p_id=> 21284427546184901 + wwv_flow_api.g_id_offset,
  p_region_id=> 20534426913144437 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'OBSERVACION',
  p_column_display_sequence=> 3,
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20535112845144446 + wwv_flow_api.g_id_offset,
  p_region_id=> 20534426913144437 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'COMCON_ID',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Comcon Id',
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
  p_id=> 21284519992184901 + wwv_flow_api.g_id_offset,
  p_region_id=> 20534426913144437 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION_DESC',
  p_column_display_sequence=> 4,
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
  p_id=> 23970507636258176 + wwv_flow_api.g_id_offset,
  p_region_id=> 20534426913144437 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'ACCION',
  p_column_display_sequence=> 9,
  p_column_heading=> '<br>',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'PLSQL_EXPRESSION',
  p_display_when_condition=> ':P811_ESTADO IN (''ACT'') AND :P811_FECHA_INICIO_EVALUACION <= SYSDATE',
  p_report_column_required_role => 24028303656343896+ wwv_flow_api.g_id_offset,
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
  p_id=> 23970618706258176 + wwv_flow_api.g_id_offset,
  p_region_id=> 20534426913144437 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'ACCION2',
  p_column_display_sequence=> 11,
  p_column_heading=> '<br>',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'PLSQL_EXPRESSION',
  p_display_when_condition=> ':P811_ESTADO IN (''ACT'') AND :P811_FECHA_INICIO_EVALUACION <= SYSDATE',
  p_report_column_required_role => 24028230883342319+ wwv_flow_api.g_id_offset,
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
  p_id=> 5375603521953203 + wwv_flow_api.g_id_offset,
  p_region_id=> 20534426913144437 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'ACCION3',
  p_column_display_sequence=> 8,
  p_column_heading=> '<br>',
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
s:=s||'PRUEBA';

wwv_flow_api.create_page_plug (
  p_id=> 51535401854634987 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 811,
  p_plug_name=> 'Confirmación',
  p_region_name=>'dialogo',
  p_region_attributes=> 'style="display:none;"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 90,
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
s:=s||'SELECT '||unistr('\000a')||
'     detped.comcon_id'||unistr('\000a')||
'   , detped.comped_id'||unistr('\000a')||
'   , detped.comcot_id'||unistr('\000a')||
'   , detped.renglon'||unistr('\000a')||
'   , detped.comccl_id'||unistr('\000a')||
'   , detped.comcit_id'||unistr('\000a')||
'   , detped.codigo'||unistr('\000a')||
'   , detped.descripcion||DECODE(detped.observacion,'''','''','' - ''||detped.observacion) descripcion'||unistr('\000a')||
'   , detped.cantidad'||unistr('\000a')||
'   -- -- Si el item no existe muestra el precio del pedido      '||unistr('\000a')||
''||unistr('\000a')||
'   ,DECODE(DETPED.COMCIT_ID,NULL,''$ ''||TO_CHAR(DETPED.PRECIO';

s:=s||'_UNITARIO,''999,999,999.99'')'||unistr('\000a')||
''||unistr('\000a')||
'          -- Si el precio sugerido es igual al precio del pedido, verificar si es de referencia'||unistr('\000a')||
'   ,DECODE(DETPED.PRECIO_UNITARIO - COMCAT_PKG.COMCIT_OBTN_PRECIO(DETPED.COMCIT_ID, (SELECT FECHA_SOLICITUD'||unistr('\000a')||
'                                                                                       FROM COM_PEDIDOS'||unistr('\000a')||
'                                                               ';

s:=s||'                       WHERE ID = DETPED.COMPED_ID)), 0             '||unistr('\000a')||
'          -- Si el item existe y el precio del item no esta definido en el catalodog de precios mustra el precio del pedido como precio de referencia'||unistr('\000a')||
'            ,(SELECT DECODE(COMCIT_V.COMCTP_PRECIO,'''',''<font color=RED><b>$ ''||TO_CHAR(detped.precio_unitario,''999,999,999.99'')||'' <img src="#IMAGE_PREFIX#menu/i_status_gray_16x16.g';

s:=s||'if"  title="Es Precio de Referencia"</></b></font>'''||unistr('\000a')||
'                -- Si el item existe y el precio del item es igual al precio en el catalogo de precios muestra el precio del pedido como precio testigo'||unistr('\000a')||
'   ,DECODE(SIGN(NVL(detped.precio_unitario,0)-NVL(COMCIT_V.COMCTP_PRECIO,0)),0,''<font color=BLUE><b>$ ''|| TO_CHAR(detped.precio_unitario,''999,999,999.99'')||'' <img src="#IMAGE_PREFIX#menu/blue_info';

s:=s||'_16x16.gif"  title="Es Precio Testigo Vigente"</></b></font>'''||unistr('\000a')||
'                -- Caso contrario mostrar el precio del pedido normal'||unistr('\000a')||
'                                                                                               ,''<b>$ ''||TO_CHAR(detped.precio_unitario,''999,999,999.99'')||'' <img src="#IMAGE_PREFIX#menu/i_status_16x16.gif"  title="Es Precio Testigo"</></b>''))'||unistr('\000a')||
'              FROM COM_CA';

s:=s||'TALOGO_ITEMS_V  COMCIT_V '||unistr('\000a')||
'              WHERE DETPED.COMCIT_ID = COMCIT_V.ID(+))'||unistr('\000a')||
'            , ''$ ''||TO_CHAR(DETPED.PRECIO_UNITARIO,''999,999,999.99'')'||unistr('\000a')||
'           )) PRECIO_UNITARIO  '||unistr('\000a')||
''||unistr('\000a')||
'   , detped.cantidad*detped.precio_unitario precio_total'||unistr('\000a')||
'   , detped.observacion'||unistr('\000a')||
'FROM SIS_OWNER.COM_CONTRATACIONES_DETPED_V DETPED'||unistr('\000a')||
'WHERE COMCON_ID = :P811_ID'||unistr('\000a')||
'  AND detped.cantidad > 0'||unistr('\000a')||
'ORDER BY detped.comped_id, detped';

s:=s||'.renglon';

wwv_flow_api.create_report_region (
  p_id=> 365189028846021557 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 811,
  p_name=> '&P1_COMETQ_PRO. requeridos 2',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 51,
  p_region_attributes=>'style="width:95%"',
  p_report_attributes=>'style="width:80%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_condition_type=> 'NEVER',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '99999',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se han indicado &P1_COMETQ_PRO. ',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '99999',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_report_total_text_format=> 'Total',
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
  p_comment=>'SELECT '||unistr('\000a')||
'     detped.comcon_id'||unistr('\000a')||
'   , detped.comped_id'||unistr('\000a')||
'   , detped.comcot_id'||unistr('\000a')||
'   , detped.renglon'||unistr('\000a')||
'   , detped.comccl_id'||unistr('\000a')||
'   , detped.comcit_id'||unistr('\000a')||
'   , detped.codigo'||unistr('\000a')||
'   , detped.descripcion||DECODE(detped.observacion,'''','''','' - ''||detped.observacion) descripcion'||unistr('\000a')||
'   , detped.cantidad'||unistr('\000a')||
'   ,DECODE(DETPED.COMCIT_ID,NULL,''$ ''||TO_CHAR(detped.precio_unitario,''999,999,999.99'')'||unistr('\000a')||
'            , (SELECT DECODE(COMCIT_V.COMCTP_PRECIO,'''','||unistr('\000a')||
'     ''<font color=RED><b>$ ''||TO_CHAR(detped.precio_unitario,''999,999,999.99'')'||unistr('\000a')||
'            ||'' <img src="#IMAGE_PREFIX#menu/i_status_gray_16x16.gif"  title="Es Precio de Referencia"</></b></font>'''||unistr('\000a')||
'     ,DECODE(SIGN(NVL(detped.precio_unitario,0)-NVL(COMCIT_V.COMCTP_PRECIO,0))'||unistr('\000a')||
'           ,0'||unistr('\000a')||
'           ,''<font color=BLUE><b>$ '''||unistr('\000a')||
'            || TO_CHAR(detped.precio_unitario,''999,999,999.99'')'||unistr('\000a')||
'            ||'' <img src="#IMAGE_PREFIX#menu/blue_info_16x16.gif"  title="Es Precio Testigo Vigente"</></b></font>'''||unistr('\000a')||
'          ,''<b>$ ''||TO_CHAR(detped.precio_unitario,''999,999,999.99'')'||unistr('\000a')||
'            ||'' <img src="#IMAGE_PREFIX#menu/i_status_16x16.gif"  title="Es Precio Testigo"</></b>'''||unistr('\000a')||
')) FROM COM_CATALOGO_ITEMS_V        COMCIT_V '||unistr('\000a')||
'  WHERE DETPED.COMCIT_ID = COMCIT_V.ID(+)'||unistr('\000a')||
'))'||unistr('\000a')||
'PRECIO_UNITARIO  '||unistr('\000a')||
'   , detped.cantidad*detped.precio_unitario precio_total'||unistr('\000a')||
'   , detped.observacion'||unistr('\000a')||
'FROM SIS_OWNER.COM_CONTRATACIONES_DETPED_V DETPED'||unistr('\000a')||
'WHERE COMCON_ID = :P811_ID'||unistr('\000a')||
'  AND detped.cantidad > 0'||unistr('\000a')||
'ORDER BY detped.comped_id, detped.renglon');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365189232009021564 + wwv_flow_api.g_id_offset,
  p_region_id=> 365189028846021557 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMCON_ID',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Comcon Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '2',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365189318447021568 + wwv_flow_api.g_id_offset,
  p_region_id=> 365189028846021557 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_ID',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Comped Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '2',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365189411486021568 + wwv_flow_api.g_id_offset,
  p_region_id=> 365189028846021557 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMCOT_ID',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Comcot Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '2',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365189528668021568 + wwv_flow_api.g_id_offset,
  p_region_id=> 365189028846021557 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'RENGLON',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Item',
  p_column_alignment=>'CENTER',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '2',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365189613303021568 + wwv_flow_api.g_id_offset,
  p_region_id=> 365189028846021557 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMCCL_ID',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Comccl Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '2',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365189723299021568 + wwv_flow_api.g_id_offset,
  p_region_id=> 365189028846021557 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'COMCIT_ID',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Comcit Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '2',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365189806845021568 + wwv_flow_api.g_id_offset,
  p_region_id=> 365189028846021557 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'CODIGO',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Código',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '2',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365189904941021568 + wwv_flow_api.g_id_offset,
  p_region_id=> 365189028846021557 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'DESCRIPCION',
  p_column_display_sequence=> 3,
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
  p_print_col_width=> '2',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365190029963021568 + wwv_flow_api.g_id_offset,
  p_region_id=> 365189028846021557 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'CANTIDAD',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Cantidad',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '2',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365190609646191764 + wwv_flow_api.g_id_offset,
  p_region_id=> 365189028846021557 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'PRECIO_UNITARIO',
  p_column_display_sequence=> 12,
  p_column_heading=> 'Precio Unitario',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '2',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365190226736021568 + wwv_flow_api.g_id_offset,
  p_region_id=> 365189028846021557 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'PRECIO_TOTAL',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Precio Total',
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
  p_print_col_width=> '2',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365190329546021568 + wwv_flow_api.g_id_offset,
  p_region_id=> 365189028846021557 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'OBSERVACION',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Observacion',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '2',
  p_column_comment=>'');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 16316229972597357 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 811,
  p_button_sequence=> 50,
  p_button_plug_id => 16313210519597354+wwv_flow_api.g_id_offset,
  p_button_name    => 'ADJUNTAR_DOCUMENTOS',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Adjuntar Documentos',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> ':P811_ESTADO NOT IN (''CAN'') AND'||unistr('\000a')||
'SYSDATE < NVL(:P811_FECHA_FIN_PROPUESTA,SYSDATE+1)',
  p_button_condition_type=> 'PLSQL_EXPRESSION',
  p_button_comment=>':P811_ESTADO NOT IN (''CAN'') AND'||unistr('\000a')||
'SYSDATE < NVL(:P811_FECHA_FIN_PROPUESTA,SYSDATE+1)',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 16316813333597358 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 811,
  p_button_sequence=> 1,
  p_button_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCELAR',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cerrar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:close();',
  p_button_condition=> 'P811_APP_ANTERIOR',
  p_button_condition_type=> 'ITEM_IS_NULL',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 4513104334463510 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 811,
  p_button_sequence=> 2,
  p_button_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_button_name    => 'RETORNAR',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Retornar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&P811_APP_ANTERIOR.:&P811_PAG_ANTERIOR.:&SESSION.:811',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P811_APP_ANTERIOR',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 16316605919597358 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 811,
  p_button_sequence=> 20,
  p_button_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_button_name    => 'ACTIVAR',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Activar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_condition=> ':P811_ESTADO IN (''PEN'')',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 8026524575090668+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 16317027896597358 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 811,
  p_button_sequence=> 30,
  p_button_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_button_name    => 'ANULAR',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Anular',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_condition=> 'IF :P811_ESTADO NOT IN (''CAN'',''FIN'',''NAD'') THEN'||unistr('\000a')||
'  DECLARE'||unistr('\000a')||
'    v_dummy number;'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    SELECT COUNT(1)'||unistr('\000a')||
'    INTO v_dummy'||unistr('\000a')||
'    FROM COM_ADJUDICACIONES_DET_V'||unistr('\000a')||
'    WHERE COMCON_ID = :P811_ID'||unistr('\000a')||
'      AND SITUACION = ''GEN'';'||unistr('\000a')||
'    IF NVL(v_dummy,0) > 0 THEN'||unistr('\000a')||
'      RETURN FALSE;'||unistr('\000a')||
'    ELSE'||unistr('\000a')||
'      RETURN TRUE;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'  END;'||unistr('\000a')||
'END IF;'||unistr('\000a')||
'RETURN FALSE;',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 8026730116092299+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 20607514678983035 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 811,
  p_button_sequence=> 70,
  p_button_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_button_name    => 'EVALUAR',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Evaluar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_condition=> ':P811_ESTADO IN (''ACT'',''DES'') AND :P811_FECHA_INICIO_EVALUACION <= SYSDATE',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 8027007391095202+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 16571312716766994 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 811,
  p_button_sequence=> 40,
  p_button_plug_id => 16517809788179527+wwv_flow_api.g_id_offset,
  p_button_name    => 'GESTIONAR_FECHAS',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Gestionar Fechas',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> ':P811_ESTADO NOT IN (''CAN'',''ADJ'',''NAD'',''ENV'',''INF'',''FIN'',''RES'')  and (:P1_COMECO_ID is null or COMECO_PKG.COMECO_COMCTT_HAB_SN(p_comeco_id => :P1_COMECO_ID '||unistr('\000a')||
'                                ,p_comctt_id => :P811_COMCTT_ID) = ''SI'')',
  p_button_condition_type=> 'PLSQL_EXPRESSION',
  p_security_scheme => 8027213278096871+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 7044714644870435 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 811,
  p_button_sequence=> 90,
  p_button_plug_id => 16413503004212352+wwv_flow_api.g_id_offset,
  p_button_name    => 'GESTIONAR_INVITACIONES',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Gestionar Invitaciones',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> ':P811_ESTADO IN (''ACT'')',
  p_button_condition_type=> 'PLSQL_EXPRESSION',
  p_security_scheme => 29203617276666602+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 23999312071197699 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 811,
  p_button_sequence=> 100,
  p_button_plug_id => 20534426913144437+wwv_flow_api.g_id_offset,
  p_button_name    => 'REVERTIR_EVA',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Revertir Evaluación',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_condition=> ':P811_ESTADO IN (''PRE'');',
  p_button_condition_type=> 'PLSQL_EXPRESSION',
  p_security_scheme => 24028107896326218+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 16317208672597358 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 811,
  p_button_sequence=> 60,
  p_button_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_button_name    => 'IMPRIMIR',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Imprimir Comprobante',
  p_button_position=> 'REGION_TEMPLATE_NEXT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=INFCOM:1002:&SESSION.::&DEBUG.:1002:P1_SEGORG_CODIGO,P1002_COMCON_ID:&P1_SEGORG_CODIGO.,&P811_ID.',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 8026902196093658+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 7006930864703238 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 811,
  p_button_sequence=> 40,
  p_button_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_button_name    => 'FORZAR_DESIERTO',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Forzar Desierto',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_condition=> ':P811_ESTADO IN (''PRE'')',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 8027806829104463+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 20956421014360124 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 811,
  p_button_sequence=> 67,
  p_button_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_button_name    => 'REVERTIR_FIN',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Revertir Finalización',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_condition=> ':P811_ESTADO IN (''FIN'');',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 21454902188752327+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 20912914379486137 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 811,
  p_button_sequence=> 68,
  p_button_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_button_name    => 'FINALIZAR',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Finalizar',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_condition=> 'DECLARE'||unistr('\000a')||
' CURSOR cr_comocm IS'||unistr('\000a')||
' SELECT count(COMOCE_ESTADO) Cant_Ord'||unistr('\000a')||
' FROM COM_ORDENES_COMPRAS_V'||unistr('\000a')||
' WHERE COMCON_ID = :P811_ID'||unistr('\000a')||
'   AND COMOCE_ESTADO = ''PEN'';'||unistr('\000a')||
' --'||unistr('\000a')||
' v_comocm cr_comocm%ROWTYPE;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  OPEN  cr_comocm;'||unistr('\000a')||
'  FETCH cr_comocm INTO v_comocm;'||unistr('\000a')||
'  CLOSE cr_comocm;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  IF ((v_comocm.Cant_Ord = 0) AND (:P811_ESTADO IN (''ADJ'',''DES'')))'||unistr('\000a')||
'    OR ((TO_DATE(:P811_COMCOE_FECHA)+ TO_NUMBER(NVL(SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo    => ''COM_PLAZO_FIN_PRC'' ,p_segorg_id => :P1_SEGORG_ID),0)) > SYSDATE) AND (:P811_ESTADO IN (''ADJ'',''DES'')))'||unistr('\000a')||
' THEN'||unistr('\000a')||
'   RETURN TRUE;'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'   RETURN FALSE;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END;',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 21454830800751196+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 7990227796105996 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 811,
  p_button_sequence=> 69,
  p_button_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_button_name    => 'NO_ADJUDICADA',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Declarar No Adjudicada',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_condition=> 'IF :P811_ESTADO IN (''PRE'',''DES'',''INF'') THEN'||unistr('\000a')||
'  DECLARE'||unistr('\000a')||
'    v_dummy number;'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    SELECT COUNT(1)'||unistr('\000a')||
'    INTO v_dummy'||unistr('\000a')||
'    FROM COM_ADJUDICACIONES_DET_V'||unistr('\000a')||
'    WHERE COMCON_ID = :P811_ID'||unistr('\000a')||
'      AND SITUACION = ''GEN'';'||unistr('\000a')||
'    IF NVL(v_dummy,0) > 0 THEN'||unistr('\000a')||
'      RETURN FALSE;'||unistr('\000a')||
'    ELSE'||unistr('\000a')||
'      RETURN TRUE;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'  END;'||unistr('\000a')||
'END IF;'||unistr('\000a')||
'RETURN FALSE;',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 8027912370106104+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 10130910961476887 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 811,
  p_button_sequence=> 71,
  p_button_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_button_name    => 'SOLICITAR_CONFIRMACION',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Remitir a la &P1_COMETQ_CONS.',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_condition=> ':P811_ESTADO IN (''PRE'',''INF'') AND :P1_COMECO_ID IS NULL',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 10231823725852538+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 10135520536545893 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 811,
  p_button_sequence=> 72,
  p_button_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_button_name    => 'INFORMAR_CONFIRMACION',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Remitir a la Administración',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_condition=> ':P811_ESTADO IN (''ENV'');',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 10231929266854140+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 23859112666998880 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 811,
  p_button_sequence=> 73,
  p_button_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_button_name    => 'REVERTIR_NAD',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Revertir No Adjudicado',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_condition=> ':P811_ESTADO IN (''NAD'');',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 24026211958270665+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 23881701878654305 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 811,
  p_button_sequence=> 74,
  p_button_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_button_name    => 'REVERTIR_ANU',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Revertir Anulación',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_condition=> ':P811_ESTADO IN (''CAN'');',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 24026128665256513+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>7045007379870440 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:825:&SESSION.::&DEBUG.::P825_COMCON_ID:&P811_ID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>7044714644870435+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>16571622454766994 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:840:&SESSION.::&DEBUG.::P840_COMCON_ID:&P811_ID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>16571312716766994+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>16324915523597365 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:830:&SESSION.::&DEBUG.:830:P830_COMCON_ID,P830_COMPED_ID:&P811_ID.,&P811_COMPED_ID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>16317027896597358+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 20,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>16325106645597365 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:839:&SESSION.::&DEBUG.:RP,839,820,821,822,823:P839_COMCON_ID,P839_COMCTT_PRECIO_TESTIGO_SN:&P811_ID.,&P811_PRECIO_TESTIGO_SN.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>16316605919597358+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 30,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>16324524126597365 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:845:&SESSION.::&DEBUG.:845:P845_COMCON_ID:&P811_ID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>16316229972597357+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 40,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>7007830995712752 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:835:&SESSION.::&DEBUG.:835:P835_COMCON_ID,P835_COMPED_ID:&P811_ID.,&P811_COMPED_ID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>7006930864703238+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 60,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 03-JUN-2009 17:57 by JPREDA');
 
wwv_flow_api.create_page_branch(
  p_id=>7990432083116655 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:816:&SESSION.::&DEBUG.:816:P816_COMCON_ID,P816_COMPED_ID:&P811_ID.,&P811_COMPED_ID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>7990227796105996+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 80,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>23868507650035240 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:846:&SESSION.::&DEBUG.:846:P846_COMCON_ID:&P811_ID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>23859112666998880+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 81,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 23-NOV-2009 11:32 by FVALLEJO');
 
wwv_flow_api.create_page_branch(
  p_id=>23890710975713726 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:848:&SESSION.::&DEBUG.:848:P848_COMCON_ID:&P811_ID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>23881701878654305+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 82,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 23-NOV-2009 11:32 by FVALLEJO');
 
wwv_flow_api.create_page_branch(
  p_id=>24024331285565826 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:869:&SESSION.::&DEBUG.:869:P869_COMCON_ID:&P811_ID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>23999312071197699+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 83,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 23-NOV-2009 11:32 by FVALLEJO');
 
wwv_flow_api.create_page_branch(
  p_id=>10160426665765287 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:818:&SESSION.::&DEBUG.:818:P818_COMCON_ID,P818_COMPED_ID:&P811_ID.,&P811_COMPED_ID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>10130910961476887+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 90,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 23-JUL-2009 13:56 by FVALLEJO');
 
wwv_flow_api.create_page_branch(
  p_id=>10181031121088291 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:828:&SESSION.::&DEBUG.:828:P828_COMCON_ID,P828_COMPED_ID:&P811_ID.,&P811_COMPED_ID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>10135520536545893+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 91,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 23-JUL-2009 14:50 by FVALLEJO');
 
wwv_flow_api.create_page_branch(
  p_id=>20923607509588296 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:832:&SESSION.::&DEBUG.:832:P832_COMCON_ID,P832_DESDE_LISTO_SN:&P811_ID.,NO',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>20912914379486137+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 92,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 23-JUL-2009 14:50 by FVALLEJO');
 
wwv_flow_api.create_page_branch(
  p_id=>20978418084472888 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:837:&SESSION.::&DEBUG.:837:P837_COMCON_ID:&P811_ID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>20956421014360124+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 96,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 03-JUN-2009 17:57 by JPREDA');
 
wwv_flow_api.create_page_branch(
  p_id=>22694512001318999 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:811:&SESSION.::&DEBUG.::P811_OPERACION:EDITAR',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>22694114640310346+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 97,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 16-NOV-2009 10:53 by FVALLEJO');
 
wwv_flow_api.create_page_branch(
  p_id=>22711904981610365 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:811:&SESSION.::&DEBUG.::P811_OPERACION:CONSULTA',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>22705625104568801+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 98,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 16-NOV-2009 10:53 by FVALLEJO');
 
wwv_flow_api.create_page_branch(
  p_id=>23700922584724647 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:811:&SESSION.::&DEBUG.::P811_OPERACION:EDITAR',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>23700013535693640+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 99,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 16-NOV-2009 10:53 by FVALLEJO');
 
wwv_flow_api.create_page_branch(
  p_id=>20785814148453080 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:811:&SESSION.::&DEBUG.::P811_COMCON_EDITAR_SN:NO',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>20776520972322561+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 100,
  p_save_state_before_branch_yn=>'Y',
  p_branch_comment=> 'Created 03-AGO-2011 16:27 by FVALLEJO');
 
wwv_flow_api.create_page_branch(
  p_id=>25636017094386581 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:818:&SESSION.::&DEBUG.:818:P818_COMCON_ID,P818_COMPED_ID:&P811_ID.,&P811_COMPED_ID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 400,
  p_branch_condition_type=> 'REQUEST_EQUALS_CONDITION',
  p_branch_condition=> 'REMITIR_UE',
  p_save_state_before_branch_yn=>'Y',
  p_branch_comment=> 'Created 13-DIC-2011 15:02 by CTISSERA');
 
wwv_flow_api.create_page_branch(
  p_id=>16325531494597365 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:811:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 500,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>41901129684355406 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:1017:&SESSION.::&DEBUG.:1017:P1017_COMCON_ID,P1_PAG_ANTERIOR:&P811_ID.,&_APP_PAGE_ID.',
  p_branch_point=> 'BEFORE_HEADER',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 200,
  p_branch_condition_type=> 'SQL_EXPRESSION',
  p_branch_condition=> ':REQUEST =''ENVIO_TRAMIX'' and COM_PKG.COMCON_TRAMIX_HAB_SN(P_SEGORG_ID => SEG_PKG.OBTN_ORGUSU(nvl(v(''APP_USER''),user))) = ''SI''',
  p_save_state_before_branch_yn=>'Y',
  p_branch_comment=> 'Created 23-OCT-2012 10:41 by SLUCERO'||unistr('\000a')||
':REQUEST =''ENVIO_TRAMIX'' and COM_PKG.COMCON_TRAMIX_HAB_SN(P_SEGORG_ID => :P1_SEGORG_ID) = ''SI'' and :P811_APP_ANTERIOR is null'||unistr('\000a')||
'');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4511008012455029 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_APP_ANTERIOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 3,
  p_item_plug_id => 16311513213597349+wwv_flow_api.g_id_offset,
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
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4511213553456627 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_PAG_ANTERIOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 4,
  p_item_plug_id => 16311513213597349+wwv_flow_api.g_id_offset,
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
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>5579021814809049 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_COMCTT_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 280,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tipo de Contrataciones :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 80,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
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
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
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
  p_id=>15167024743872455 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_FECHA_FIN_PROPUESTA2',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 180,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fin de la Propuesta :',
  p_format_mask=>'DD/MM/YYYY HH24:MI',
  p_source=>'P811_FECHA_FIN_PROPUESTA',
  p_source_type=> 'ITEM',
  p_display_as=> 'NATIVE_DATE_PICKER_CLASSIC',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 2,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_security_scheme => '!'||(14698128969253802+ wwv_flow_api.g_id_offset),
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>16317426185597358 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_CONSULTAS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 90,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Consultas :',
  p_source=>'CONSULTAS',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 3,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P811_CONSULTAS',
  p_read_only_when=>'P811_COMCON_EDITAR_SN',
  p_read_only_when2=>'NO',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_read_only_disp_attr=>'style="font-weight:bold;"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
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
  p_id=>16317628860597358 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_FECHA_LIMITE_PREGUNTA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 143,
  p_item_plug_id => 16517809788179527+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Limite de Preguntas :',
  p_format_mask=>'DD/MM/YYYY HH24:MI',
  p_source=>'FECHA_LIMITE_PREGUNTA',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DATE_PICKER_CLASSIC',
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
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>16317831682597360 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_FILTRO_ESTADO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 2,
  p_item_plug_id => 16314513635597355+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'VIG',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Filtrado por :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_RADIOGROUP',
  p_named_lov=> 'TIPO_FILTRADO_EST',
  p_lov=> '.'||to_char(13070007029497230 + wwv_flow_api.g_id_offset)||'.',
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
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
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
  p_id=>16318005526597360 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_PLAZO_ENTREGA_DIAS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Plazo de Entrega :',
  p_post_element_text=>' DIAS',
  p_source=>'PLAZO_ENTREGA_DIAS',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 5,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 3,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P811_PLAZO_ENTREGA_DIAS',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_read_only_when_type=>'ALWAYS',
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
  p_id=>16318813335597360 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_METODO_ADJUDICACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Metodo de Adjudicación:',
  p_source=>'METODO_ADJUDICACION',
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
  p_colspan=> 5,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_read_only_when=>':P811_OPERACION = ''CONSULTA''',
  p_read_only_when_type=>'PLSQL_EXPRESSION',
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
  p_id=>16319023215597360 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_OBSERVACIONES',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 100,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Observaciones :',
  p_source=>'OBSERVACIONES',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 3,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P811_OBSERVACIONES',
  p_read_only_when=>'P811_COMCON_EDITAR_SN',
  p_read_only_when2=>'NO',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
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
  p_id=>16319418733597360 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Número :',
  p_post_element_text=>' /&P811_COMPED_EJERCICIO.',
  p_source=>'CODIGO',
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
  p_colspan=> 2,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold;color:red;"',
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
  p_id=>16319617604597360 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_FECHA_APERTURA_PROPUESTA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 150,
  p_item_plug_id => 16517809788179527+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Apertura de la Propuesta :',
  p_format_mask=>'DD/MM/YYYY HH24:MI',
  p_source=>'FECHA_APERTURA_PROPUESTA',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DATE_PICKER_CLASSIC',
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
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
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
  p_id=>16319804076597360 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_VIGENCIA_OFERTA_DIAS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Vigencia de la Oferta :',
  p_post_element_text=>' días.',
  p_source=>'VIGENCIA_OFERTA_DIAS',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 5,
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
  p_display_when=>'P811_VIGENCIA_OFERTA_DIAS',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_read_only_when_type=>'ALWAYS',
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
  p_id=>16320014965597360 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_COMCTT_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 15,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tipo de &P1_COMETQ_COMS. :',
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
  p_colspan=> 3,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_read_only_when=>':P811_OPERACION = ''CONSULTA''',
  p_read_only_when_type=>'PLSQL_EXPRESSION',
  p_read_only_disp_attr=>'style="font-weight:bold;"',
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
  p_id=>16320230131597362 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_FORMA_PAGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Forma de Pago :',
  p_source=>'FORMA_PAGO',
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
  p_colspan=> 3,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P811_FORMA_PAGO',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'style="font-weight:bold;"',
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
  p_id=>16320818551597362 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_MONTO_PRESUPUESTO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Monto Preventivo :',
  p_format_mask=>'FML999G999G999G999G990D00',
  p_source=>'MONTO_PRESUPUESTO',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 15,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 3,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P811_MONTO_PRESUPUESTO',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_read_only_when_type=>'ALWAYS',
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
  p_id=>16321019649597362 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_OBJETO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Objeto :',
  p_source=>'OBJETO',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 3,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P811_OBJETO',
  p_read_only_when=>'P811_COMCON_EDITAR_SN',
  p_read_only_when2=>'NO',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
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
  p_id=>16321204621597362 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_FECHA_INICIO_PROPUESTA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 130,
  p_item_plug_id => 16517809788179527+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Inicio de la Propuesta :',
  p_format_mask=>'DD/MM/YYYY HH24:MI',
  p_source=>'FECHA_INICIO_PROPUESTA',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DATE_PICKER_CLASSIC',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 5,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 2,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
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
  p_id=>16321820532597362 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_FECHA_FIN_PROPUESTA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 140,
  p_item_plug_id => 16517809788179527+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fin de la Propuesta :',
  p_format_mask=>'DD/MM/YYYY HH24:MI',
  p_source=>'FECHA_FIN_PROPUESTA',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DATE_PICKER_CLASSIC',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 2,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
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
  p_id=>16322016647597363 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_FECHA_PUBLICACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 110,
  p_item_plug_id => 16517809788179527+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Publicación :',
  p_format_mask=>'DD/MM/YYYY HH24:MI',
  p_source=>'FECHA_PUBLICACION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DATE_PICKER_CLASSIC',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 100,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 2,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
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
  p_id=>16322201905597363 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_FECHA_ESTIMADA_ADJUDICACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 170,
  p_item_plug_id => 16517809788179527+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Estimada Adjudicación :',
  p_format_mask=>'DD/MM/YYYY HH24:MI',
  p_source=>'FECHA_ESTIMADA_ADJUDICACION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DATE_PICKER_CLASSIC',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 2,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
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
  p_id=>16322416996597363 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_DATE_CREATED',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 230,
  p_item_plug_id => 16311513213597349+wwv_flow_api.g_id_offset,
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
  p_id=>16322620274597363 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_CREATED_BY',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 240,
  p_item_plug_id => 16311513213597349+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Creado por :',
  p_source=>'CREATED_BY',
  p_source_type=> 'DB_COLUMN',
  p_source_post_computation => 'NVL(SEG_PKG.OBTN_SEGUSU_NOMBRE(:P811_CREATED_BY),:P811_CREATED_BY)',
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
  p_id=>16322809120597363 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_DATE_MODIFIED',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 250,
  p_item_plug_id => 16311513213597349+wwv_flow_api.g_id_offset,
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
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>16323019643597363 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_MODIFIED_BY',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 260,
  p_item_plug_id => 16311513213597349+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Actualizado por :',
  p_source=>'MODIFIED_BY',
  p_source_type=> 'DB_COLUMN',
  p_source_post_computation => 'NVL(SEG_PKG.OBTN_SEGUSU_NOMBRE(:P811_MODIFIED_BY),:P811_MODIFIED_BY)',
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
  p_id=>16323218155597363 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_item_plug_id => 16311513213597349+wwv_flow_api.g_id_offset,
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
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
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
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>16323423549597363 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_FECHA_INICIO_EVALUACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 160,
  p_item_plug_id => 16517809788179527+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Inicio de la Evaluación :',
  p_format_mask=>'DD/MM/YYYY HH24:MI',
  p_source=>'FECHA_INICIO_EVALUACION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DATE_PICKER_CLASSIC',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 30,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 2,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
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
  p_id=>16384414451666933 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_MOTIVO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 220,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Motivo :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
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
  p_display_when=>'P811_MOTIVO',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
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
  p_id=>16384621031668819 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_ESTADO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 200,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'<b>ESTADO ACTUAL :</b>',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'COMCONTRATACIONES ESTADO',
  p_lov=> 'select rv_abbreviation d, rv_low_value r'||unistr('\000a')||
'from   cg_ref_codes'||unistr('\000a')||
'where  rv_domain = ''COM_CONTRATACIONES_EST.ESTADO'''||unistr('\000a')||
'  and  rv_low_value <> ''NUE'''||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 30,
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
  p_id=>16396229061850907 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_ESPACIO_BLANCO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 190,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'<br>',
  p_pre_element_text=>'<br>',
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
  p_id=>19471325193307491 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_COMPED_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 270,
  p_item_plug_id => 16314513635597355+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'COMPED_ID',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
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
  p_id=>20433731519165488 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_PRECIO_TESTIGO_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 290,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Precio Testigo Sn',
  p_source=>'COMCTT_PRECIO_TESTIGO_SN',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
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
  p_id=>20434912781207435 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_MENSAJE_PRECIO_TESTIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 310,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Recuerde : ',
  p_source=>'PARA ESTE PROCESO SE TIENE EN CUENTA EL PRECIO TESTIGO VIGENTE!',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P811_PRECIO_TESTIGO_SN',
  p_display_when2=>'SI',
  p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold;color:red;"',
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
  p_id=>20626716645811073 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_FECHA_FIN_ACLARACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 145,
  p_item_plug_id => 16517809788179527+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fin de Aclaraciones :',
  p_format_mask=>'DD/MM/YYYY HH24:MI',
  p_source=>'FECHA_FIN_ACLARACION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DATE_PICKER_CLASSIC',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 2,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>20770408355158123 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_COMCON_EDITAR_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 7,
  p_item_plug_id => 16311513213597349+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Editar Contratacion',
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
  p_id=>20776218070312298 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_COMCON_ACTUALIZAR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 110,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'COMCON_ACTUALIZAR',
  p_prompt=>'Confirmar',
  p_source=>'COMCON_ACTUALIZAR',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P811_COMCON_EDITAR_SN',
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
  p_id=>20776520972322561 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_COMCON_DATOS_CANCELAR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 120,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'COMCON_CANCELAR',
  p_prompt=>'Cancelar',
  p_source=>'COMCON_CANCELAR',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P811_COMCON_EDITAR_SN',
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
  p_id=>21387006137375846 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_COMCOE_FECHA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 210,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comcoe Fecha',
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
  p_id=>22681617617226004 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_OPERACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 5,
  p_item_plug_id => 16311513213597349+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
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
  p_id=>22705409866564477 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_CAMBIAR_COMCTT_CONFIRMAR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 21,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'CAMBIAR_COMCTT_CONFIRMAR',
  p_prompt=>'Confirmar',
  p_source=>'CAMBIAR_COMCTT_CONFIRMAR',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P811_OPERACION',
  p_display_when2=>'EDITAR',
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
  p_id=>22705625104568801 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_CAMBIAR_CONCTT_CANCELAR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 22,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'CAMBIAR_CONCTT_CANCELAR',
  p_prompt=>'Cancelar',
  p_source=>'CAMBIAR_CONCTT_CANCELAR',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P811_OPERACION',
  p_display_when2=>'EDITAR',
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
  p_id=>22751729792383905 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_X',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 300,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
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
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>25634631367296080 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_COMCDG_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 330,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'COMCDG_ID : ',
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
  p_id=>25680910158239944 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_ID_ADJ',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 340,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'ID_ADJ :',
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
  p_id=>26090514704923046 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_COMPED_EJERCICIO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 6,
  p_item_plug_id => 16311513213597349+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comped Ejercicio',
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
  p_id=>31161532148462865 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_COMRUB_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 320,
  p_item_plug_id => 16314513635597355+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'COMRUB_ID',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
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
  p_id=>36076626393714959 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_LIMITE_MIN_COMCTZ',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 31,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Limite de Cotizaciones: MInimo:',
  p_source=>'LIMITE_MIN_COMCTZ',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 5,
  p_cMaxlength=> 10,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_read_only_when=>':P811_OPERACION = ''CONSULTA''',
  p_read_only_when_type=>'PLSQL_EXPRESSION',
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
  p_id=>36080324408771148 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_LIMITE_MAX_COMCTZ',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 32,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Máximo:',
  p_source=>'LIMITE_MAX_COMCTZ',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 5,
  p_cMaxlength=> 10,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_read_only_when=>':P811_OPERACION = ''CONSULTA''',
  p_read_only_when_type=>'PLSQL_EXPRESSION',
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
  p_id=>36082113242786807 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_X1',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 34,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
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
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>36574819959862098 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_COMCON_PRIORIDAD',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 12,
  p_item_plug_id => 16311308238597347+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Prioridad:',
  p_source=>'PRIORIDAD',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select rv_abbreviation d, rv_low_value r'||unistr('\000a')||
'from   cg_ref_codes'||unistr('\000a')||
'where  rv_domain = ''COM_CONTRATACIONES.PRIORIDAD''',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when=>':P811_COMCON_EDITAR_SN = ''NO''',
  p_read_only_when_type=>'PLSQL_EXPRESSION',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
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
  p_id=>77545818284507017 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 811,
  p_name=>'P811_XD',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 350,
  p_item_plug_id => 16311513213597349+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> ' COMECO_PKG.COMECO_COMCTT_HAB_SN(p_comeco_id => 138'||unistr('\000a')||
'                                ,p_comctt_id => 1)',
  p_item_default_type=> 'PLSQL_EXPRESSION',
  p_prompt=>'Xd',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 80,
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
  p_field_template=> 142039553452227115+wwv_flow_api.g_id_offset,
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

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 36616305023273321 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 811
 ,p_name => 'ResaltarPrioridad'
 ,p_event_sequence => 10
 ,p_triggering_condition_type => 'JAVASCRIPT_EXPRESSION'
 ,p_triggering_expression => '$(''#P811_COMCON_PRIORIDAD'').val() == 0'
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'ready'
  );
wwv_flow_api.create_page_da_action (
  p_id => 36616614752273346 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 811
 ,p_event_id => 36616305023273321 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => '$(''#P811_COMCON_PRIORIDAD_DISPLAY'').css("color","red");'||unistr('\000a')||
'$(''#P811_COMCON_PRIORIDAD_DISPLAY'').css("font-weight","700");'
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
p:=p||'IF :P301_FILTRO_ESTADO IS NULL THEN'||unistr('\000a')||
'   :P301_FILTRO_ESTADO := ''VIG'';'||unistr('\000a')||
'END IF;'||unistr('\000a')||
''||unistr('\000a')||
'IF :P811_OPERACION IS NULL THEN'||unistr('\000a')||
'   :P811_OPERACION := ''CONSULTA'';'||unistr('\000a')||
'END IF;'||unistr('\000a')||
''||unistr('\000a')||
'IF :P811_COMCON_EDITAR_SN IS NULL THEN'||unistr('\000a')||
'   :P811_COMCON_EDITAR_SN := ''NO'';'||unistr('\000a')||
'END IF;';

wwv_flow_api.create_page_process(
  p_id     => 16346009115862451 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 811,
  p_process_sequence=> 50,
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
p:=p||'-- Anulamos la Pre-Adjudicacion'||unistr('\000a')||
' --'||unistr('\000a')||
' UPDATE COM_ADJUDICACIONES A'||unistr('\000a')||
' SET A.SITUACION = ''ANU'''||unistr('\000a')||
'   , A.OBSERVACION = ''Re-Evaluación del Proceso'''||unistr('\000a')||
' WHERE A.ID IN (SELECT B.ID FROM COM_ADJUDICACIONES B WHERE B.COMCON_ID = :P811_ID)'||unistr('\000a')||
'   AND A.SITUACION =''NUE'';'||unistr('\000a')||
' -- '||unistr('\000a')||
' UPDATE COM_ADJUDICACIONES_DET A'||unistr('\000a')||
' SET A.SITUACION = ''ANU'''||unistr('\000a')||
'   , A.MOTIVO_SITUACION = ''Re-Evaluación del Proceso'''||unistr('\000a')||
' WHERE A.COMADJ_ID IN (SELECT B.I';

p:=p||'D FROM COM_ADJUDICACIONES B WHERE B.COMCON_ID = :P811_ID)'||unistr('\000a')||
'   AND A.SITUACION =''PEN'';'||unistr('\000a')||
' --'||unistr('\000a')||
' UPDATE COM_COTIZACIONES_DETALLES A'||unistr('\000a')||
' SET A.EVALUACION = NULL'||unistr('\000a')||
' WHERE A.COMPED_ID IN (SELECT B.COMPED_ID FROM COM_CONTRATACIONES_DETALLES B WHERE B.COMCON_ID = :P811_ID);'||unistr('\000a')||
'-- Llamamos al Proceso de Evaluar'||unistr('\000a')||
'COM_PKG.COMCON_EVAL (p_comcon_id => :P811_ID);';

wwv_flow_api.create_page_process(
  p_id     => 20607808838009788 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 811,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Evaluar Proceso de Contratación',
  p_process_sql_clob => p,
  p_process_error_message=> 'La Evaluación no ha podido ser realizada. Verifique el mensaje de error asociado.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'EVALUAR',
  p_process_when_type=>'REQUEST_EQUALS_CONDITION',
  p_process_success_message=> 'La Evaluación ha sido realizada con éxito.',
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
'CURSOR cr_comcon IS'||unistr('\000a')||
'  SELECT COMCOE_ESTADO'||unistr('\000a')||
'   FROM COM_CONTRATACIONES_V'||unistr('\000a')||
'  WHERE ID = :P811_ID;  '||unistr('\000a')||
'begin'||unistr('\000a')||
'-- Anulamos la Pre-Adjudicacion'||unistr('\000a')||
' UPDATE COM_ADJUDICACIONES A'||unistr('\000a')||
' SET A.SITUACION = ''ANU'''||unistr('\000a')||
'   , A.OBSERVACION = ''Re-Evaluación del Proceso'''||unistr('\000a')||
' WHERE A.ID IN (SELECT B.ID FROM COM_ADJUDICACIONES B WHERE B.COMCON_ID = :P811_ID)'||unistr('\000a')||
'   AND A.SITUACION =''NUE'';'||unistr('\000a')||
' -- '||unistr('\000a')||
' UPDATE COM_ADJUDICACIONES_DET A'||unistr('\000a')||
' SET ';

p:=p||'A.SITUACION = ''ANU'''||unistr('\000a')||
'   , A.MOTIVO_SITUACION = ''Re-Evaluación del Proceso'''||unistr('\000a')||
' WHERE A.COMADJ_ID IN (SELECT B.ID FROM COM_ADJUDICACIONES B WHERE B.COMCON_ID = :P811_ID)'||unistr('\000a')||
' AND A.SITUACION =''PEN'';'||unistr('\000a')||
' --'||unistr('\000a')||
' UPDATE COM_COTIZACIONES_DETALLES A'||unistr('\000a')||
' SET A.EVALUACION = NULL'||unistr('\000a')||
' WHERE A.COMPED_ID IN (SELECT B.COMPED_ID FROM COM_CONTRATACIONES_DETALLES B WHERE B.COMCON_ID = :P811_ID);'||unistr('\000a')||
'  -- Llamamos al Proceso de Evaluar'||unistr('\000a')||
' ';

p:=p||' COM_PKG.COMCON_EVAL (p_comcon_id => :P811_ID);'||unistr('\000a')||
'  -- Llamaos al Proceso de Verificacion solo si la contratacion esta evaluada'||unistr('\000a')||
'  open cr_comcon;'||unistr('\000a')||
'  fetch cr_comcon into :P811_ESTADO;'||unistr('\000a')||
'  close cr_comcon;'||unistr('\000a')||
'  if :P811_ESTADO = ''PRE'' then   '||unistr('\000a')||
'  COM_PKG.COMCON_VERIFICAR(P_SEGORG_ID  => :P1_SEGORG_ID'||unistr('\000a')||
'                          ,P_COMCON_ID  => :P811_ID '||unistr('\000a')||
'                          ,P_MOTIVO     => ''Evaluacion y';

p:=p||' Verificación'');'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 51541602638742220 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 811,
  p_process_sequence=> 15,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Evaluar y Verificar Proceso de Contratación',
  p_process_sql_clob => p,
  p_process_error_message=> 'La Evaluación y Verificación no ha podido ser realizada. Verifique el mensaje de error asociado.',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=>'EVALUAR_VERIFICAR',
  p_process_when_type=>'REQUEST_EQUALS_CONDITION',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> 'La Evaluación y Verificación ha sido realizada con éxito.',
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
' -- Actualizo cabecera de la contratacion '||unistr('\000a')||
' UPDATE COM_CONTRATACIONES'||unistr('\000a')||
' SET COMCTT_ID = :P811_COMCTT_ID'||unistr('\000a')||
'   , METODO_ADJUDICACION = :P811_METODO_ADJUDICACION'||unistr('\000a')||
'   , LIMITE_MIN_COMCTZ   = :P811_LIMITE_MIN_COMCTZ'||unistr('\000a')||
'   , LIMITE_MAX_COMCTZ   = :P811_LIMITE_MAX_COMCTZ'||unistr('\000a')||
' WHERE ID = :P811_ID;'||unistr('\000a')||
' -- '||unistr('\000a')||
' -- Controlo despliegue de Botones'||unistr('\000a')||
' :P811_OPERACION := ''CONSULTA'';'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 22705022764549224 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 811,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Acualizar Tipo Contratacion',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>22705409866564477 + wwv_flow_api.g_id_offset,
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
' -- Actualizo cabecera de la contratacion '||unistr('\000a')||
' UPDATE COM_CONTRATACIONES'||unistr('\000a')||
' SET OBJETO = :P811_OBJETO'||unistr('\000a')||
'   ,CONSULTAS = :P811_CONSULTAS	'||unistr('\000a')||
'   ,OBSERVACIONES = :P811_OBSERVACIONES'||unistr('\000a')||
'   ,PRIORIDAD = :P811_COMCON_PRIORIDAD '||unistr('\000a')||
' WHERE ID = :P811_ID;'||unistr('\000a')||
' -- '||unistr('\000a')||
' -- Controlo despliegue de Botones'||unistr('\000a')||
' :P811_COMCON_EDITAR_SN := ''NO'';'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 20775402870260569 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 811,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Acualizar Datos Contratacion',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>20776218070312298 + wwv_flow_api.g_id_offset,
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
  p_id     => 3169610218795426 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 811,
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
p:=p||'2643130914745059';

wwv_flow_api.create_page_process(
  p_id     => 5618415297650207 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 811,
  p_process_sequence=> 20,
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
p:=p||'2638809097738751';

wwv_flow_api.create_page_process(
  p_id     => 5618619799651539 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 811,
  p_process_sequence=> 30,
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
  p_id     => 5635227876861989 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 811,
  p_process_sequence=> 40,
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
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'1827920554893846';

wwv_flow_api.create_page_process(
  p_id     => 3170021993798796 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 811,
  p_process_sequence=> 80,
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
'  CURSOR cr_comeco IS'||unistr('\000a')||
'  SELECT COMCNR.COMECO_ID'||unistr('\000a')||
'        ,COMCNR.COMECO_NOMBRE'||unistr('\000a')||
'  FROM  COM_CONTRATANTES_RES_V COMCNR'||unistr('\000a')||
'  WHERE COMCNR.SEGUSU_USUARIO = v(''APP_USER'');'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
'  IF :P1_COMECO_ID IS NULL THEN'||unistr('\000a')||
'    OPEN cr_comeco;'||unistr('\000a')||
'    FETCH cr_comeco INTO :P1_COMECO_ID'||unistr('\000a')||
'                       , :P1_COMECO_NOMBRE;'||unistr('\000a')||
'    CLOSE cr_comeco;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 10121107648286673 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 811,
  p_process_sequence=> 100,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ObtenerEntidadContratante',
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
  p_id     => 10121613189288279 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 811,
  p_process_sequence=> 110,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'SetearEtiquetasDefault',
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
p:=p||' DECLARE'||unistr('\000a')||
'  CURSOR cr_comcon IS'||unistr('\000a')||
'  SELECT COMCOE_ESTADO'||unistr('\000a')||
'       , COMCOE_MOTIVO'||unistr('\000a')||
'       , COMCOE_FECHA'||unistr('\000a')||
'       , COMCTT_NOMBRE'||unistr('\000a')||
'       , COMPED_EJERCICIO'||unistr('\000a')||
'   FROM COM_CONTRATACIONES_V'||unistr('\000a')||
'  WHERE ID = :P811_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  CURSOR cr_comrcb IS'||unistr('\000a')||
'  SELECT COMRCB.COMRUB_ID'||unistr('\000a')||
'   FROM COM_CONTRATACIONES_DET_V COMCOT'||unistr('\000a')||
'       ,COM_RUBCOB_V         COMRCB'||unistr('\000a')||
'  WHERE COMRCB.COMCOB_ID = COMCOT.COMPED_COMCOB_ID'||unistr('\000a')||
'    AND COMCOT.COMCO';

p:=p||'N_ID = :P811_ID'||unistr('\000a')||
'    AND COMRCB.SITUACION = ''VIG'';'||unistr('\000a')||
'  --'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
' --'||unistr('\000a')||
'  OPEN cr_comcon;'||unistr('\000a')||
'  FETCH cr_comcon INTO :P811_ESTADO'||unistr('\000a')||
'                     , :P811_MOTIVO'||unistr('\000a')||
'                     , :P811_COMCOE_FECHA'||unistr('\000a')||
'                     , :P811_COMCTT_NOMBRE'||unistr('\000a')||
'                     , :P811_COMPED_EJERCICIO;'||unistr('\000a')||
'  CLOSE cr_comcon;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_comrcb;'||unistr('\000a')||
'  FETCH cr_comrcb INTO :P811_COMRUB_ID;'||unistr('\000a')||
'  CLOSE cr_comrcb;'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 16324013355597365 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 811,
  p_process_sequence=> 120,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Traer Datos de la Contratacion',
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
p:=p||'F|#OWNER#:COM_CONTRATACIONES_V:P811_ID:ID';

wwv_flow_api.create_page_process(
  p_id     => 16323629435597363 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 811,
  p_process_sequence=> 130,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from COM_CONTRATACIONES',
  p_process_sql_clob => p,
  p_process_error_message=> 'No se ha podido recuperar la fila.',
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
p:=p||'begin'||unistr('\000a')||
'   if :P811_FECHA_FIN_ACLARACION is null or :P811_FECHA_FIN_ACLARACION = '''' then'||unistr('\000a')||
'      :P811_FECHA_FIN_ACLARACION := :P811_FECHA_FIN_PROPUESTA;'||unistr('\000a')||
'   end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 21496023385457947 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 811,
  p_process_sequence=> 140,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AsignarFechaFinAclaracion',
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
p:=p||'declare'||unistr('\000a')||
''||unistr('\000a')||
'begin'||unistr('\000a')||
'   --'||unistr('\000a')||
'   select max(id)'||unistr('\000a')||
'   into :P811_COMCDG_ID '||unistr('\000a')||
'   from com_contrataciones_docgen'||unistr('\000a')||
'   where comcon_id = :P811_ID'||unistr('\000a')||
'   AND COMDCT_ID = (SELECT ID '||unistr('\000a')||
'                    FROM COM_DOCUMENTOS_TIPOS '||unistr('\000a')||
'                    WHERE CODIGO = ''COM_CONTRATACION'');'||unistr('\000a')||
'   --'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 25634217038282575 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 811,
  p_process_sequence=> 150,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Obtener_Id_DocumentoGenerado',
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
'   --'||unistr('\000a')||
'   cursor cur_adj is'||unistr('\000a')||
'   select max(id) '||unistr('\000a')||
'   from com_adjudicaciones '||unistr('\000a')||
'   where COMCON_ID=:P811_ID'||unistr('\000a')||
'   and situacion not in (''ANU'');'||unistr('\000a')||
'   --'||unistr('\000a')||
'   '||unistr('\000a')||
'begin'||unistr('\000a')||
'   --'||unistr('\000a')||
'   open cur_adj;'||unistr('\000a')||
'   fetch cur_adj into :P811_ID_ADJ;'||unistr('\000a')||
'   close cur_adj;'||unistr('\000a')||
'   --'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 25681210420258913 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 811,
  p_process_sequence=> 160,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ObtenerIdAdjudicacion',
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
-- ...updatable report columns for page 811
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
