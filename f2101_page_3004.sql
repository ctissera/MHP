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
--   Date and Time:   16:04 Martes Marzo 21, 2017
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

PROMPT ...Remove page 3004
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>3004);
 
end;
/

 
--application/pages/page_03004
prompt  ...PAGE 3004: Trámite Proveedor - Cambio Nombre/Razón Social - Resumen
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 3004
 ,p_user_interface_id => 70527406842675 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'ADMINISTRACION'
 ,p_name => 'Trámite Proveedor - Cambio Nombre/Razón Social - Resumen'
 ,p_step_title => 'Trámite Proveedor - Cambio Nombre/Razón Social - Resumen'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Trámite Proveedor - Cambio Razón Social - Resumen'
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
 ,p_last_updated_by => 'CTISSERA'
 ,p_last_upd_yyyymmddhh24miss => '20170321155433'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'DECLARE'||unistr('\000a')||
'  CURSOR cr_comprv is'||unistr('\000a')||
'  SELECT *'||unistr('\000a')||
'  FROM COM_PROVEEDORES_V'||unistr('\000a')||
'  WHERE ID = :P3000_COMPRV_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  CURSOR cr_comtpr IS'||unistr('\000a')||
'  SELECT *'||unistr('\000a')||
'  FROM COM_TRAMITES_PRV_V'||unistr('\000a')||
'  WHERE ID = :P3000_ID;'||unistr('\000a')||
'  --  '||unistr('\000a')||
'  v_comprv cr_comprv%ROWTYPE;'||unistr('\000a')||
'  v_comtpr cr_comtpr%ROWTYPE;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  OPEN cr_comtpr;'||unistr('\000a')||
'  FETCH cr_comtpr INTO v_comtpr;'||unistr('\000a')||
'  CLOSE cr_comtpr;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_comprv;'||unistr('\000a')||
'  FETCH cr_comprv INTO v_comprv;'||unistr('\000a')||
'  CLOSE cr_compr';

s:=s||'v;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  IF v_comtpr.NOMBRE <> nvl(v_comprv.NOMBRE,''#'') THEN'||unistr('\000a')||
'      htp.print(''<font color="red"><b>IMPORTANTE ! </font>:</b> Solo se muestra la información de los datos que ha solicitado cambiar, los mismos se encuentran resaltados en color <b><font color="red">ROJO</font>.</b><br><br>'');'||unistr('\000a')||
'      htp.print(''Razón Social : <b><font color="red">''||v_comtpr.NOMBRE||''</font></b><br>'');'||unistr('\000a')||
'   ELSE'||unistr('\000a')||
'      ht';

s:=s||'p.print(''<br><font color="red"><b>NOTA: </font> No se han realizado ajustes a la Razón Social. Si usted solo agregó documentación vencida presione Confirmar<br><br>''); '||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_plug (
  p_id=> 366188004505749857 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3004,
  p_plug_name=> 'Resumen Datos Generales del &P1_COMETQ_PRVS.',
  p_region_name=>'',
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
s:=s||'DECLARE'||unistr('\000a')||
'  CURSOR cr_comtpt IS'||unistr('\000a')||
'  SELECT RV_MEANING'||unistr('\000a')||
'  FROM cg_ref_codes'||unistr('\000a')||
'  WHERE rv_domain = ''COM_TRAMITES_PRV.TIPO'''||unistr('\000a')||
'  AND rv_low_value = :P3000_TIPO;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  CURSOR cr_comprv is'||unistr('\000a')||
'  SELECT *'||unistr('\000a')||
'  FROM COM_PROVEEDORES_V'||unistr('\000a')||
'  WHERE ID = :P3002_COMPRV_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  CURSOR cr_comprt (p_comprv_comprt_id number)is'||unistr('\000a')||
'  SELECT ID'||unistr('\000a')||
'       , SEGORG_ID'||unistr('\000a')||
'       , DECODE(TIPO_PERSONA,''FIS'',''Apellido y Nombre'''||unistr('\000a')||
'                  ';

s:=s||'          ,''JUR'',''Razón Social'') codigo'||unistr('\000a')||
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
'  FETCH cr_comprv IN';

s:=s||'TO v_comprv;'||unistr('\000a')||
'  CLOSE cr_comprv;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_comprt(p_comprv_comprt_id => v_comprv.comprt_id);'||unistr('\000a')||
'  FETCH cr_comprt INTO v_comprt;'||unistr('\000a')||
'  CLOSE cr_comprt;'||unistr('\000a')||
''||unistr('\000a')||
'htp.print(''<b>TIPO DEL TRÁMITE : ''||v_comtpt.RV_MEANING||'' </b><br><br>'');'||unistr('\000a')||
'htp.print(''<b>Datos de la ''||v_comprt.NOMBRE||'' </b><br>'');'||unistr('\000a')||
'htp.print(v_comprt.CODIGO||'' : <b>''||v_comprv.NOMBRE||''</b><br>'');'||unistr('\000a')||
'htp.print(''CUIT : <b>''||v_comprv.CUIT||''</b><br>';

s:=s||''');'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_plug (
  p_id=> 366188602717749859 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3004,
  p_plug_name=> 'Resumen',
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 366189404799749860 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3004,
  p_plug_name=> 'Pasos ',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 366197004162051621 + wwv_flow_api.g_id_offset,
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
s:=s||'SELECT ID             '||unistr('\000a')||
'     , COMTPT_ID      '||unistr('\000a')||
'     , ORDEN'||unistr('\000a')||
'     , NOMBRE||'' : ''||DESCRIPCION DESCRIPCION    '||unistr('\000a')||
'     , SITUACION'||unistr('\000a')||
'FROM COM_TRAMITES_PRV_TIPOR_V'||unistr('\000a')||
'WHERE COMTPT_CODIGO = :P220_TIPO'||unistr('\000a')||
'ORDER BY ORDEN ASC ';

wwv_flow_api.create_report_region (
  p_id=> 366189631538749860 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3004,
  p_name=> 'Para aprobar este Trámite debe presentar los siguientes requisitos',
  p_region_name=>'',
  p_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 40,
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
  p_query_no_data_found=> '<b>No es necesario presentar requisitos para conseguir la aprobación de este trámite.</b>',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '99999',
  p_pagination_display_position=> 'BOTTOM_LEFT',
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
  p_id=> 366189808530749865 + wwv_flow_api.g_id_offset,
  p_region_id=> 366189631538749860 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Editar',
  p_column_link=>'f?p=&APP_ID.:245:&SESSION.::&DEBUG.::P245_ID:#ID#',
  p_column_linktext=>'<img src="#IMAGE_PREFIX#e2.gif" alt="Edit">',
  p_column_alignment=>'CENTER',
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
  p_id=> 366189929121749870 + wwv_flow_api.g_id_offset,
  p_region_id=> 366189631538749860 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMTPT_ID',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Comtpt Id',
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
  p_id=> 366190007000749870 + wwv_flow_api.g_id_offset,
  p_region_id=> 366189631538749860 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'ORDEN',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Orden',
  p_column_alignment=>'CENTER',
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
  p_id=> 366190117372749870 + wwv_flow_api.g_id_offset,
  p_region_id=> 366189631538749860 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'DESCRIPCION',
  p_column_display_sequence=> 3,
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
  p_id=> 366190227565749870 + wwv_flow_api.g_id_offset,
  p_region_id=> 366189631538749860 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION',
  p_column_display_sequence=> 4,
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
  l_clob clob;
  l_length number := 1;
begin
s:=s||'DECLARE'||unistr('\000a')||
'  CURSOR cr_compdo is'||unistr('\000a')||
'  SELECT *'||unistr('\000a')||
'  FROM COM_PROVEEDORES_DOC'||unistr('\000a')||
'  WHERE ID = :P3004_COMPDO_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  CURSOR cr_compdt (v_compdt_id number) is'||unistr('\000a')||
'  SELECT *'||unistr('\000a')||
'  FROM COM_PROVEEDORES_DOT'||unistr('\000a')||
'  WHERE ID = v_compdt_id;'||unistr('\000a')||
'  --'||unistr('\000a')||
''||unistr('\000a')||
'  v_compdo     com_proveedores_doc%ROWTYPE;'||unistr('\000a')||
'  v_compdt     com_proveedores_dot%ROWTYPE;'||unistr('\000a')||
''||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'   OPEN cr_compdo;'||unistr('\000a')||
'   FETCH cr_compdo INTO v_compdo;'||unistr('\000a')||
'   CLOSE cr_compdo;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   OPEN c';

s:=s||'r_compdt(v_compdo.COMPDT_ID);'||unistr('\000a')||
'   FETCH cr_compdt INTO v_compdt;'||unistr('\000a')||
'   CLOSE cr_compdt;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   htp.print(''<table width="100%">'');'||unistr('\000a')||
''||unistr('\000a')||
'   htp.print(''<tr><td width="25%"><b>Fecha de Presentación </b>'' || ''</td><td>'' || to_char(v_compdo.FECHA_PRESENTACION, ''dd/mm/yyyy'') || ''</td></tr>'');'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'   htp.print(''<tr><td width="25%"><b>Tipo de Documento </b>'' || ''</td><td>''  || v_compdt.NOMBRE  || ''</td></tr>'');'||unistr('\000a')||
''||unistr('\000a')||
' ';

s:=s||'  htp.print(''<tr><td width="25%"><b>Fecha de Emisión </b>'' || ''</td><td>'' || to_char(v_compdo.FECHA_EMISION, ''dd/mm/yyyy'') || ''</td></tr>'');'||unistr('\000a')||
''||unistr('\000a')||
'   htp.print(''<tr><td width="25%"><b>Comentarios </b>'' || ''</td><td>'' || v_compdo.COMENTARIO || '' - '' || :P620_COMENTARIO || ''</td></tr>'');'||unistr('\000a')||
''||unistr('\000a')||
'   --'||unistr('\000a')||
'   if v_compdt.TIPO_DURACION != ''SIN'' then'||unistr('\000a')||
'      if v_compdo.FECHA_VENCIMIENTO > sysdate then'||unistr('\000a')||
'         htp.prin';

s:=s||'t(''<tr><td width="25%"><b>Fecha de Vencimiento </b>'' || ''</td><td>'' || '||unistr('\000a')||
'                    to_char(v_compdo.FECHA_VENCIMIENTO,''dd/mm/yyyy'') || ''</td></tr>'');'||unistr('\000a')||
'      else'||unistr('\000a')||
'         htp.print(''<tr><td width="25%"><b>Fecha de Vencimiento </b>'' || ''</td><td>'' || '||unistr('\000a')||
'                   ''<b><font color="red">Documento Vencido el '' || to_char(v_compdo.FECHA_VENCIMIENTO, ''dd/mm/yyyy'')'||unistr('\000a')||
'                    || ''';

s:=s||'</font></b></td></tr>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      --'||unistr('\000a')||
'   else'||unistr('\000a')||
'      htp.print(''<tr><td width="25%"><b>Fecha de Vencimiento </b>'' || ''</td><td>'' || '||unistr('\000a')||
'                    ''INDEFINIDO'' || ''</td></tr>'');'||unistr('\000a')||
'   end if;'||unistr('\000a')||
'   if v_compdo.FILENAME is null then'||unistr('\000a')||
'      htp.print(''<tr><td width="25%"><b>Documento</b>'' || ''</td><td>''  || ''<font color="red">No se ha adjuntado ningun Documento digitalizado</font>'' || ''</td>';

s:=s||'</tr>'');'||unistr('\000a')||
'   end if;'||unistr('\000a')||
''||unistr('\000a')||
'   htp.print(''</table>'');'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_plug (
  p_id=> 366190505053749870 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3004,
  p_plug_name=> 'Datos del Documento',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 50,
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
  p_plug_comment=> '      htp.print(''<tr><td width="30%"><b>Documento </b>'' || ''</td><td>''  || v_compdo.FILENAME || ''</td><td>'' || '||unistr('\000a')||
''||unistr('\000a')||
'''<a href="'' || APEX_UTIL.GET_BLOB_FILE_SRC(''P694_DOCUMENTO'',:P920_ID) || ''alt="Abrir Doc." title="Abrir Doc. 39KB">.</a>'' '||unistr('\000a')||
''||unistr('\000a')||
'|| ''</td></tr>'');'||unistr('\000a')||
'   else'||unistr('\000a')||
''||unistr('\000a')||
'/*'||unistr('\000a')||
'   if to_date(v_compdo.FECHA_VENCIMIENTO, ''dd/mm/yyyy'') < to_date(sysdate, ''dd/mm/yyyy'') then'||unistr('\000a')||
'      htp.print(''<tr><td width="30%"><b>Fecha de Vencimiento </b>'' || ''</td><td>''  || to_char(v_compdo.FECHA_VENCIMIENTO, ''dd/mm/yyyy'')   || ''</td></tr>'');'||unistr('\000a')||
'      :P920_ESTADO := ''VIGENTE'';'||unistr('\000a')||
'   else'||unistr('\000a')||
'      htp.print(''<tr><td width="30%"><b>Fecha de Vencimiento </b>'' || ''</td><td>'' || ''<b><font color="red">Documento Vencido el '' || to_char(v_compdo.FECHA_VENCIMIENTO,''dd/mm/yyyy'') || ''</font></b></td></tr>'');'||unistr('\000a')||
'      :P920_ESTADO := ''VENCIDO'';'||unistr('\000a')||
'   end if;'||unistr('\000a')||
'*/');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select	 ID,'||unistr('\000a')||
'          COMPRV_ID,'||unistr('\000a')||
'	 SITUACION,'||unistr('\000a')||
'          ''<b>Documento</b>'' label_doc,'||unistr('\000a')||
'          dbms_lob.getlength(DOCUMENTO) DOCUMENTO,'||unistr('\000a')||
'	 FILENAME,'||unistr('\000a')||
'	 MIMETYPE,'||unistr('\000a')||
'	 LAST_UPDATE_DATE,'||unistr('\000a')||
'         (case when INSTR(COMPDO.MIMETYPE,''pdf'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/download_pdf_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''excel'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/excel';

s:=s||'.png">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''oct'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''word'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/download_rtf_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''plain'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''image'') > 0 then';

s:=s||''||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/chart_32x24.gif">''    '||unistr('\000a')||
'         else'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'         end) ICONO'||unistr('\000a')||
' from	 COM_PROVEEDORES_DOC_V COMPDO'||unistr('\000a')||
'where id = :P3004_COMPDO_ID;';

wwv_flow_api.create_report_region (
  p_id=> 366191130939749875 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3004,
  p_name=> 'Documentos Presentados',
  p_region_name=>'',
  p_parent_plug_id=>366190505053749870 + wwv_flow_api.g_id_offset,
  p_template=> 0+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 110,
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> 'declare'||unistr('\000a')||
'   cursor cur_file is'||unistr('\000a')||
'   select	FILENAME'||unistr('\000a')||
'   from COM_PROVEEDORES_DOC_V COMPDO'||unistr('\000a')||
'   where id = :P3004_COMPDO_ID;'||unistr('\000a')||
'   --'||unistr('\000a')||
'begin'||unistr('\000a')||
'   open cur_file;'||unistr('\000a')||
'   fetch cur_file into :P3004_FILE_NAME;'||unistr('\000a')||
'   close cur_file;'||unistr('\000a')||
'   if :P3004_FILE_NAME is null then'||unistr('\000a')||
'      return false;'||unistr('\000a')||
'   else'||unistr('\000a')||
'      return true;'||unistr('\000a')||
'   end if;'||unistr('\000a')||
'end;',
  p_display_condition_type=> 'FUNCTION_BODY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 13,
  p_query_headings_type=> 'NO_HEADINGS',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se ha encontrado ningún dato',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
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
  p_id=> 366191306375749878 + wwv_flow_api.g_id_offset,
  p_region_id=> 366191130939749875 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 366191417227749878 + wwv_flow_api.g_id_offset,
  p_region_id=> 366191130939749875 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 9,
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 366191527076749878 + wwv_flow_api.g_id_offset,
  p_region_id=> 366191130939749875 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION',
  p_column_display_sequence=> 5,
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 366191601408749878 + wwv_flow_api.g_id_offset,
  p_region_id=> 366191130939749875 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'LABEL_DOC',
  p_column_display_sequence=> 1,
  p_column_heading=> '',
  p_column_css_style=>'width:140px;',
  p_column_alignment=>'LEFT',
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
  p_id=> 366191710890749878 + wwv_flow_api.g_id_offset,
  p_region_id=> 366191130939749875 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 4,
  p_column_heading=> '',
  p_column_format=> 'DOWNLOAD:COM_PROVEEDORES_DOC:DOCUMENTO:ID::MIMETYPE:FILENAME:LAST_UPDATE_DATE::attachment: Ver Documento.',
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
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 366191817323749878 + wwv_flow_api.g_id_offset,
  p_region_id=> 366191130939749875 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'FILENAME',
  p_column_display_sequence=> 3,
  p_column_heading=> '',
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
  p_id=> 366191911648749878 + wwv_flow_api.g_id_offset,
  p_region_id=> 366191130939749875 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'MIMETYPE',
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 366192026312749878 + wwv_flow_api.g_id_offset,
  p_region_id=> 366191130939749875 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'LAST_UPDATE_DATE',
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 366192101777749878 + wwv_flow_api.g_id_offset,
  p_region_id=> 366191130939749875 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'ICONO',
  p_column_display_sequence=> 2,
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
  p_id=> 366192403331749879 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3004,
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
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 366188823943749859 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 3004,
  p_button_sequence=> 10,
  p_button_plug_id => 366188602717749859+wwv_flow_api.g_id_offset,
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
  p_id             => 366189000402749860 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 3004,
  p_button_sequence=> 30,
  p_button_plug_id => 366188602717749859+wwv_flow_api.g_id_offset,
  p_button_name    => 'NEXT',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Confirmar',
  p_button_position=> 'REGION_TEMPLATE_NEXT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:this.disabled=true;this.value=''Procesando...'';doSubmit(''NEXT'');',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 366189223543749860 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 3004,
  p_button_sequence=> 20,
  p_button_plug_id => 366188602717749859+wwv_flow_api.g_id_offset,
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
  p_id=>366193215748749881 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3004,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:216:&SESSION.::&DEBUG.::P216_RUTA_NAVEGACION,P216_COMTPR_ID,P216_COMTPR_TIPO:Solicitud de Cambio Nombre/Razon Social,&P3000_ID.,&P3000_TIPO.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>366189000402749860+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 20,
  p_branch_condition_type=> 'REQUEST_EQUALS_CONDITION',
  p_branch_condition=> 'NEXT',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>366193401549749881 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3004,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:3002:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'BEFORE_VALIDATION',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>366189223543749860+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>366188217418749859 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3004,
  p_name=>'P3004_RESULTADO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 185,
  p_item_plug_id => 366188004505749857+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Resultado',
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
  p_id=>366188429981749859 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3004,
  p_name=>'P3004_ACTIVAR_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 195,
  p_item_plug_id => 366188004505749857+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Activar Sn',
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
  p_id=>366190715844749875 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3004,
  p_name=>'P3004_COMPDO_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 366190505053749870+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'COMTPR_ID',
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
  p_id=>366190914513749875 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3004,
  p_name=>'P3004_FILE_NAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 366190505053749870+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'P3004_FILE_NAME',
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

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 366192828527749879 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 3004,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'ValidarUnicoArchivo',
  p_validation_sequence=> 10,
  p_validation => 'select 1'||unistr('\000a')||
'from   COM_TRAMITES_PRV_DOC compdt'||unistr('\000a')||
'where  compdt.COMTPR_ID = :P3000_ID;',
  p_validation_type => 'NOT_EXISTS',
  p_error_message => 'Este tramite ya fue confirmado. Su numero de Tramite es: &P3000_ID.',
  p_always_execute=>'N',
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
p:=p||'DECLARE'||unistr('\000a')||
'   CURSOR cr_comtpt is'||unistr('\000a')||
'   SELECT *'||unistr('\000a')||
'   FROM COM_TRAMITES_PRV_TIPO_V'||unistr('\000a')||
'   WHERE CODIGO = :P3000_TIPO;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   v_comtpt cr_comtpt%ROWTYPE;'||unistr('\000a')||
'   v_comtdp COM_TRAMITES_PRV_DOC%rowtype;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'   -- Obtengo si se Auto_Acepta el trámite'||unistr('\000a')||
'   OPEN cr_comtpt;'||unistr('\000a')||
'   FETCH cr_comtpt INTO v_comtpt;'||unistr('\000a')||
'   CLOSE cr_comtpt;'||unistr('\000a')||
'   -- '||unistr('\000a')||
'   IF v_comtpt.AUTOACEPTAR_SN = ''NO'' THEN'||unistr('\000a')||
''||unistr('\000a')||
'      UPDATE COM_TRAMITES_PRV'||unistr('\000a')||
'      SET SIT';

p:=p||'UACION = ''PEN'''||unistr('\000a')||
'      WHERE ID = :P3000_ID;'||unistr('\000a')||
''||unistr('\000a')||
'   ELSE'||unistr('\000a')||
''||unistr('\000a')||
'      UPDATE COM_TRAMITES_PRV'||unistr('\000a')||
'      SET SITUACION = ''REC'''||unistr('\000a')||
'      WHERE ID = :P3000_ID;'||unistr('\000a')||
''||unistr('\000a')||
'      -- Aprobar el Tramite'||unistr('\000a')||
'      COM_PKG.COMTPR_ACEPTAR(p_comtpr_id => :P3000_ID'||unistr('\000a')||
'                            ,p_comprv_id => :P3000_COMPRV_ID'||unistr('\000a')||
'                            ,p_resultado => :P3000_resultado);'||unistr('\000a')||
'      --'||unistr('\000a')||
'   END IF;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   --INSERTAR COM_TRAMITES_P';

p:=p||'RV_DOC'||unistr('\000a')||
'   v_comtdp.COMTPR_ID   := :P3000_ID;'||unistr('\000a')||
'   v_comtdp.COMPDO_ID   := :P3004_COMPDO_ID;'||unistr('\000a')||
'   v_comtdp.OBSERVACION := NULL;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   COMPRV_PKG.COMTDP_INS(P_COMTDP => v_comtdp); '||unistr('\000a')||
'   --'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 366192930208749879 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 3004,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Confirmo Tramite',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>366189000402749860 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 3004
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
