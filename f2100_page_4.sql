set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end;
/
 
 
--application/set_environment
prompt  APPLICATION 2100 - Compras - Portal Público
--
-- Application Export:
--   Application:     2100
--   Name:            Compras - Portal Público
--   Date and Time:   14:06 Jueves Diciembre 1, 2016
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
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,2100);
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
 
end;
/

PROMPT ...Remove page 4
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>4);
 
end;
/

 
--application/pages/page_00004
prompt  ...PAGE 4: Procesos
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 4
 ,p_user_interface_id => 64514669000832 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'TS1'
 ,p_name => 'Procesos'
 ,p_alias => 'COMCON'
 ,p_step_title => 'Procesos'
 ,p_step_sub_title => 'Procesos'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'CTISSERA'
 ,p_last_upd_yyyymmddhh24miss => '20161201140442'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'htp.print(''&P4_MENSAJE_PORTADA_EXP.'');';

wwv_flow_api.create_page_plug (
  p_id=> 7050014114252637 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_plug_name=> '<br>',
  p_region_name=>'',
  p_region_attributes=> 'style="width:95%"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 40,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 2,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => 'ITEM_IS_NOT_NULL',
  p_plug_display_when_condition => 'P4_MENSAJE_PORTADA_EXP',
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
  p_id=> 31818723092123291 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_plug_name=> 'Ruta de Navegación',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142058753441083326+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(22263359203477533 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 142073150049083349+ wwv_flow_api.g_id_offset,
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
  p_id=> 31821132498157382 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_plug_name=> 'Buscar Expediente',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142062034140083330+ wwv_flow_api.g_id_offset,
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
  p_id=> 31822926358212475 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_plug_name=> 'Buscar',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142062034140083330+ wwv_flow_api.g_id_offset,
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
s:=s||'SELECT COMPED.EXPEDIENTE COMPED_EXPEDIENTE'||unistr('\000a')||
'     , UPPER(COMPED.DESCRIPCION) COMPED_DESCRIPCION'||unistr('\000a')||
'     , UPPER(COMPED.OBSERVACIONES) COMPED_OBSERVACIONES'||unistr('\000a')||
'     , COMECC.NOMBRE COMECC_NOMBRE'||unistr('\000a')||
'     , COMCON.FECHA_PUBLICACION COMCON_FECHA_PUBLICACION'||unistr('\000a')||
'     , COMCON.FECHA_FIN_PROPUESTA COMCON_FECHA_CIERRE'||unistr('\000a')||
'     , COMCTT.NOMBRE COMCTT_NOMBRE'||unistr('\000a')||
'     ,(SELECT DISTINCT DECODE(DECODE(RV_LOW_VALUE,''PRE'',''EVA'',''ENV'',';

s:=s||'''EVA'',''INF'',''EVA'',''FIN'',''ADJ'',RV_LOW_VALUE),''EVA'',''EN EVALUACION'',''ADJ'',''ADJUDICADO'',RV_ABBREVIATION)'||unistr('\000a')||
'FROM CG_REF_CODES'||unistr('\000a')||
'WHERE RV_DOMAIN = ''COM_CONTRATACIONES_EST.ESTADO'''||unistr('\000a')||
'  AND RV_LOW_VALUE NOT IN (''NUE'',''CAN'',''PEN'')'||unistr('\000a')||
'  AND RV_LOW_VALUE = comcon.COMCOE_ESTADO) COMCOE_ESTADO_ABR'||unistr('\000a')||
'     , COMCOB.NOMBRE COMCOB_NOMBRE'||unistr('\000a')||
'     , COMDOM.PROVINCIA||DECODE(COMDOM.DEPARTAMENTO,'''','''','' - ''||COMDOM.DEPARTAMENTO)||D';

s:=s||'ECODE(COMDOM.LOCALIDAD,'''','''','' - ''||COMDOM.LOCALIDAD) COMPED_UBICACION'||unistr('\000a')||
'  , COMCON.ID COMCON_ID'||unistr('\000a')||
'FROM com_contrataciones comcon,'||unistr('\000a')||
'          com_pedidos comped,'||unistr('\000a')||
'          com_contrataciones_detalles comcot,'||unistr('\000a')||
'          com_contrataciones_tipos comctt,'||unistr('\000a')||
'--        com_contrataciones_est comcoe,'||unistr('\000a')||
'--        com_pedidos_est compee,'||unistr('\000a')||
'          com_ejercicios comeje,'||unistr('\000a')||
'          com_contratantes comeco,'||unistr('\000a')||
'          c';

s:=s||'om_contratantes_cat comecc,'||unistr('\000a')||
'          com_catalogo_objetos comcob,'||unistr('\000a')||
'          com_domicilios comdom'||unistr('\000a')||
'    WHERE comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'--    AND comped.compee_id = compee.ID'||unistr('\000a')||
'      AND comped.ID = comcot.comped_id'||unistr('\000a')||
'      AND comcot.comcon_id = comcon.ID'||unistr('\000a')||
'      AND comcon.comctt_id = comctt.ID'||unistr('\000a')||
'--    AND comcon.comcoe_id = comcoe.ID '||unistr('\000a')||
'      AND comcon.comcoe_estado not in (''NUE'',''CAN'',''PEN'')'||unistr('\000a')||
'    ';

s:=s||'  AND comped.ejercicio = comeje.ejercicio'||unistr('\000a')||
'      AND comped.comeco_id = comeco.id'||unistr('\000a')||
'      AND comeco.comecc_id = comecc.id'||unistr('\000a')||
'      AND comped.comcob_id = comcob.id'||unistr('\000a')||
'      AND comped.comdom_id = comdom.id'||unistr('\000a')||
'      '||unistr('\000a')||
'      AND (:P4_COMPED_EXPEDIENTE IS NULL OR COMPED.EXPEDIENTE LIKE ''%''||:P4_COMPED_EXPEDIENTE||''%'')'||unistr('\000a')||
'      '||unistr('\000a')||
'      AND (:P4_COMPED_FINALIDAD IS NULL OR UPPER(COMPED.DESCRIPCION) LIKE UPPER(''%''||:P4';

s:=s||'_COMPED_FINALIDAD||''%''))'||unistr('\000a')||
''||unistr('\000a')||
'      AND (:P4_COMECC_NOMBRE IS NULL OR UPPER(COMECC.NOMBRE) LIKE UPPER(''%''||:P4_COMECC_NOMBRE||''%''))'||unistr('\000a')||
''||unistr('\000a')||
'      AND (NVL(:P4_COMCOE_ESTADO,''0'') = ''0'' OR'||unistr('\000a')||
'     DECODE(COMCON.COMCOE_ESTADO,''PRE'',''EVA'',''ENV'',''EVA'',''INF'',''EVA'',''FIN'',''ADJ'',COMCON.COMCOE_ESTADO) =  :P4_COMCOE_ESTADO)'||unistr('\000a')||
''||unistr('\000a')||
'      AND (:P4_COMCON_PUBLICACION_DESDE IS NULL OR TRUNC(COMCON.FECHA_PUBLICACION) >= TO_DATE(:P4_';

s:=s||'COMCON_PUBLICACION_DESDE,''DD/MM/YYYY''))'||unistr('\000a')||
''||unistr('\000a')||
'      AND (:P4_COMCON_PUBLICACION_HASTA IS NULL OR TRUNC(COMCON.FECHA_PUBLICACION) <= TO_DATE(:P4_COMCON_PUBLICACION_HASTA,''DD/MM/YYYY''))'||unistr('\000a')||
''||unistr('\000a')||
'      AND (SYSDATE >= TRUNC(COMCON.FECHA_PUBLICACION) )'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'     AND (NVL(:P4_COMCTT_ID,''0'') = ''0'' OR COMCTT.ID = :P4_COMCTT_ID)'||unistr('\000a')||
'     AND (NVL(:P4_COMCOB_ID,''0'') = ''0'' OR COMCOB.ID = :P4_COMCOB_ID)'||unistr('\000a')||
'     AND (NVL(:P4_UBICAC';

s:=s||'ION,''0'') = ''0'' OR COMDOM.PROVINCIA||DECODE(COMDOM.DEPARTAMENTO,'''','''','' - ''||COMDOM.DEPARTAMENTO)||DECODE(COMDOM.LOCALIDAD,'''','''','' - ''||COMDOM.LOCALIDAD) LIKE ''%''||:P4_UBICACION||''%'')'||unistr('\000a')||
''||unistr('\000a')||
'ORDER BY COMCON.FECHA_PUBLICACION DESC';

wwv_flow_api.create_report_region (
  p_id=> 31843219644951543 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_name=> 'Llamados',
  p_region_name=>'',
  p_template=> 142062636519083330+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 30,
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_2',
  p_item_display_point=> 'BELOW',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 142066259449083335+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '10',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se ha encontrado ningún llamado que cumpla los criterios indicados.',
  p_query_num_rows_type=> 'ROW_RANGES_WITH_LINKS',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_LEFT',
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
  p_id=> 31843508657951564 + wwv_flow_api.g_id_offset,
  p_region_id=> 31843219644951543 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_EXPEDIENTE',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Expediente',
  p_column_hit_highlight=>'&P4_COMPED_EXPEDIENTE.',
  p_column_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RP,5:P5_COMCON_ID,P5_PAG_ANTERIOR:#COMCON_ID#,&APP_PAGE_ID.',
  p_column_linktext=>'#COMPED_EXPEDIENTE#',
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
  p_id=> 31843618624951564 + wwv_flow_api.g_id_offset,
  p_region_id=> 31843219644951543 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_DESCRIPCION',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Finalidad',
  p_column_hit_highlight=>'&P4_COMPED_FINALIDAD.',
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31843725384951564 + wwv_flow_api.g_id_offset,
  p_region_id=> 31843219644951543 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_OBSERVACIONES',
  p_column_display_sequence=> 2,
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31843828441951564 + wwv_flow_api.g_id_offset,
  p_region_id=> 31843219644951543 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COMECC_NOMBRE',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Entidad',
  p_column_hit_highlight=>'&P4_COMECC_NOMBRE.',
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
  p_id=> 31843937403951564 + wwv_flow_api.g_id_offset,
  p_region_id=> 31843219644951543 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMCON_FECHA_PUBLICACION',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Publicacion',
  p_column_format=> 'DD/MM/YYYY',
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
  p_id=> 36644322777721339 + wwv_flow_api.g_id_offset,
  p_region_id=> 31843219644951543 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'COMCON_FECHA_CIERRE',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Cierre',
  p_column_format=> 'DD/MM/YYYY HH24:MI',
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
  p_id=> 31844019016951564 + wwv_flow_api.g_id_offset,
  p_region_id=> 31843219644951543 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'COMCTT_NOMBRE',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Modalidad',
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
  p_id=> 31844109350951564 + wwv_flow_api.g_id_offset,
  p_region_id=> 31843219644951543 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'COMCOE_ESTADO_ABR',
  p_column_display_sequence=> 10,
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
  p_id=> 31844233355951564 + wwv_flow_api.g_id_offset,
  p_region_id=> 31843219644951543 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'COMCOB_NOMBRE',
  p_column_display_sequence=> 3,
  p_column_heading=> '&P1_COMETQ_RUB.',
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
  p_id=> 31844327467951564 + wwv_flow_api.g_id_offset,
  p_region_id=> 31843219644951543 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_UBICACION',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Ubicación',
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
  p_id=> 31844432700951564 + wwv_flow_api.g_id_offset,
  p_region_id=> 31843219644951543 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
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
  p_column_comment=>'');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 31856122561931496 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 4,
  p_button_sequence=> 140,
  p_button_plug_id => 31822926358212475+wwv_flow_api.g_id_offset,
  p_button_name    => 'P4_BUSCAR',
  p_button_static_id=> 'P4_BUSCAR',
  p_button_action  => 'SUBMIT',
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Buscar',
  p_button_position=> 'BELOW_BOX',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 31858830293141938 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 4,
  p_button_sequence=> 150,
  p_button_plug_id => 31822926358212475+wwv_flow_api.g_id_offset,
  p_button_name    => 'P4_RESTABLECER',
  p_button_static_id=> 'P4_RESTABLECER',
  p_button_action  => 'SUBMIT',
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Limpiar',
  p_button_position=> 'BELOW_BOX',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>31856418309931500 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&FLOW_ID.:4:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>31856122561931496+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>31859123313141938 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&FLOW_ID.:4:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>31858830293141938+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>31822509433203794 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&FLOW_ID.:4:&SESSION.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 99,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6946121006476134 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_COMCOE_ESTADO_WHERE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comcoe Where',
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
  p_id=>7052822171011976 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_MENSAJE_PORTADA_EXP',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 120,
  p_item_plug_id => 7050014114252637+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Mensaje Portada',
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
  p_id=>31821431936166683 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_COMPED_EXPEDIENTE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 31821132498157382+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Expediente&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;',
  p_post_element_text=>'&nbsp;&nbsp;<i> Ej.:0000-2010-12345678</i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 27,
  p_cMaxlength=> 30,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142072043504083346+wwv_flow_api.g_id_offset,
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
  p_id=>31822329344203794 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_BUSCAR_EXPEDIENTE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 31821132498157382+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'Ir',
  p_prompt=>'Buscar',
  p_source=>'Ir',
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
  p_id=>31823420948220328 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_COMPED_FINALIDAD',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 31822926358212475+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Finalidad',
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
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142072043504083346+wwv_flow_api.g_id_offset,
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
  p_id=>31823934239233621 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_COMECC_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 31822926358212475+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Entidad',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 44,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142072043504083346+wwv_flow_api.g_id_offset,
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
  p_id=>31824727706260091 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_COMCOE_ESTADO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 31822926358212475+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'ACT',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Estado',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'SELECT DISPLAY, RETURN'||unistr('\000a')||
'FROM (SELECT DISTINCT DECODE(DECODE(RV_LOW_VALUE,''PRE'',''EVA'',''ENV'',''EVA'',''INF'',''EVA'',''FIN'',''ADJ'',RV_LOW_VALUE),''EVA'',''EN EVALUACION'',''ADJ'',''ADJUDICADO'',RV_ABBREVIATION) DISPLAY'||unistr('\000a')||
'            , DECODE(RV_LOW_VALUE,''PRE'',''EVA'',''ENV'',''EVA'',''INF'',''EVA'',''FIN'',''ADJ'',RV_LOW_VALUE) RETURN'||unistr('\000a')||
'FROM CG_REF_CODES'||unistr('\000a')||
'WHERE RV_DOMAIN = ''COM_CONTRATACIONES_EST.ESTADO'''||unistr('\000a')||
'AND RV_LOW_VALUE NOT IN (''NUE'',''CAN'',''PEN''))'||unistr('\000a')||
'WHERE NVL(:P4_COMCOE_ESTADO_WHERE,''TODOS'') = ''TODOS'' OR'||unistr('\000a')||
'       INSTR(:P4_COMCOE_ESTADO_WHERE,RETURN) > 0'||unistr('\000a')||
'ORDER BY 1',
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
  p_field_template=> 142072043504083346+wwv_flow_api.g_id_offset,
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
wwv_flow_api.create_page_item(
  p_id=>31826617719361330 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_COMCON_PUBLICACION_DESDE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 31822926358212475+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha Desde&nbsp;',
  p_format_mask=>'DD/MM/YYYY',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DATE_PICKER_CLASSIC',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 20,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142072043504083346+wwv_flow_api.g_id_offset,
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
  p_id=>31826935380366468 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_COMCON_PUBLICACION_HASTA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 31822926358212475+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha Hasta&nbsp;',
  p_format_mask=>'DD/MM/YYYY',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DATE_PICKER_CLASSIC',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 20,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142072136632083346+wwv_flow_api.g_id_offset,
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
  p_id=>31838120777658521 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_COMCTT_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 31822926358212475+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tipo de<br>Contratación',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'SELECT NOMBRE D, ID R'||unistr('\000a')||
'FROM COM_CONTRATACIONES_TIPOS'||unistr('\000a')||
'WHERE SEGORG_ID = :P1_SEGORG_ID'||unistr('\000a')||
'  AND SITUACION = ''VIG'''||unistr('\000a')||
'ORDER BY 1 ASC',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'Todas',
  p_lov_null_value=> '0',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 10,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT-CENTER',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142072043504083346+wwv_flow_api.g_id_offset,
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
wwv_flow_api.create_page_item(
  p_id=>31838509049683572 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_COMCOB_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 90,
  p_item_plug_id => 31822926358212475+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'&P1_COMETQ_RUB.',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'SELECT substr(NOMBRE,1,58) D, ID R'||unistr('\000a')||
'FROM COM_CATALOGO_OBJETOS'||unistr('\000a')||
'WHERE SEGORG_ID = :P1_SEGORG_ID'||unistr('\000a')||
'ORDER BY 1 desc',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'Todas',
  p_lov_null_value=> '0',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 10,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142072043504083346+wwv_flow_api.g_id_offset,
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
wwv_flow_api.create_page_item(
  p_id=>31840023172782186 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_UBICACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 100,
  p_item_plug_id => 31822926358212475+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '0',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Ubicación',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'SELECT COMDOM.PROVINCIA||DECODE(COMDOM.DEPARTAMENTO,'''','''','' - ''||COMDOM.DEPARTAMENTO)||DECODE(COMDOM.LOCALIDAD,'''','''','' - ''||COMDOM.LOCALIDAD) D, COMDOM.PROVINCIA||DECODE(COMDOM.DEPARTAMENTO,'''','''','' - ''||COMDOM.DEPARTAMENTO)||DECODE(COMDOM.LOCALIDAD,'''','''','' - ''||COMDOM.LOCALIDAD) R'||unistr('\000a')||
'FROM COM_PEDIDOS COMPED'||unistr('\000a')||
'    ,COM_DOMICILIOS COMDOM'||unistr('\000a')||
'WHERE COMPED.COMDOM_ID = COMDOM.ID'||unistr('\000a')||
'  AND COMPED.SEGORG_ID = :P1_SEGORG_ID'||unistr('\000a')||
'group by COMDOM.PROVINCIA,COMDOM.DEPARTAMENTO,COMDOM.LOCALIDAD'||unistr('\000a')||
'ORDER BY 1 ',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'Todas',
  p_lov_null_value=> '0',
  p_cSize=> 77,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 10,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 142072043504083346+wwv_flow_api.g_id_offset,
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
wwv_flow_api.create_page_item(
  p_id=>31858735356133949 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_RESTABLECER_EXPEDIENTE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 110,
  p_item_plug_id => 31821132498157382+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'Limpiar',
  p_prompt=>'Limpiar',
  p_source=>'Limpiar',
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
  p_is_persistent=> 'N',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 31858111919985269 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 4,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P4_COMPED_EXPEDIENTE not null',
  p_validation_sequence=> 10,
  p_validation => 'P4_COMPED_EXPEDIENTE',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Indique un valor.',
  p_when_button_pressed=> 31822329344203794 + wwv_flow_api.g_id_offset,
  p_associated_item=> 31821431936166683 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 31862136938323607 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 4,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P4_COMCON_PUBLICACION_DESDE valida',
  p_validation_sequence=> 20,
  p_validation => 'begin'||unistr('\000a')||
'if TO_DATE(:P4_COMCON_PUBLICACION_DESDE,''DD/MM/YYYY'') IS NOT NULL THEN'||unistr('\000a')||
'   return NULL;'||unistr('\000a')||
'END IF;'||unistr('\000a')||
'exception'||unistr('\000a')||
'  when others then'||unistr('\000a')||
'    :P4_COMCON_PUBLICACION_DESDE := null;'||unistr('\000a')||
'    return ''Indique una fecha válida'';'||unistr('\000a')||
'end;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => '',
  p_associated_item=> 31826617719361330 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 31862718471460211 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 4,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P4_COMCON_PUBLICACION_HASTA valida',
  p_validation_sequence=> 30,
  p_validation => 'begin'||unistr('\000a')||
'if TO_DATE(:P4_COMCON_PUBLICACION_HASTA,''DD/MM/YYYY'') IS NOT NULL THEN'||unistr('\000a')||
'   return NULL;'||unistr('\000a')||
'END IF;'||unistr('\000a')||
'exception'||unistr('\000a')||
'  when others then'||unistr('\000a')||
'    :P4_COMCON_PUBLICACION_HASTA := null;'||unistr('\000a')||
'    return ''Indique una fecha válida'';'||unistr('\000a')||
'end;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => '',
  p_associated_item=> 31826935380366468 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
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
p:=p||'P4_COMPED_EXPEDIENTE';

wwv_flow_api.create_page_process(
  p_id     => 31859516010156777 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 4,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_ITEMS',
  p_process_name=> 'Restablecer Expediente',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>31858735356133949 + wwv_flow_api.g_id_offset,
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
p:=p||'reset_pagination';

wwv_flow_api.create_page_process(
  p_id     => 31860339952192032 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 4,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'RESET_PAGINATION',
  p_process_name=> 'Restablecer Paginación',
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
p:=p||'4';

wwv_flow_api.create_page_process(
  p_id     => 31860011901183946 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 4,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'Restablecer',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>31858830293141938 + wwv_flow_api.g_id_offset,
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
p:=p||':P1_PAG_ANTERIOR := :APP_PAGE_ID;';

wwv_flow_api.create_page_process(
  p_id     => 31819221434123305 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 4,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AsignarPaginaAnterior',
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
'  IF :P1_SEGORG_CODIGO IS NULL THEN'||unistr('\000a')||
'    :P1_SEGORG_CODIGO := ''PCYCSL'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_SEGORG_ID IS NULL THEN'||unistr('\000a')||
'    SELECT ID'||unistr('\000a')||
'    INTO :P1_SEGORG_ID'||unistr('\000a')||
'    FROM SEG_ORGANIZACIONES'||unistr('\000a')||
'    WHERE CODIGO = :P1_SEGORG_CODIGO;  '||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'EXCEPTION'||unistr('\000a')||
'  WHEN NO_DATA_FOUND THEN'||unistr('\000a')||
'    raise_application_error(-20000,''No se posible acceder a esta página. La Organización designada es incorrecta, contacte al admi';

p:=p||'nistrador del sitio'');'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 31819412790123308 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 4,
  p_process_sequence=> 20,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AsignarOrganizacionDefault',
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
p:=p||'IF :P1_APP_THEME IS NULL THEN'||unistr('\000a')||
'   :P1_APP_THEME := ''#IMAGE_PREFIX#themes/theme_102/theme_red.css'';'||unistr('\000a')||
'END IF;';

wwv_flow_api.create_page_process(
  p_id     => 19970404959805558 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 4,
  p_process_sequence=> 30,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'VerificarTemaDefault',
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
'  FROM COM_ETIQUETAS'||unistr('\000a')||
'  WHERE CODIGO = p_codigo'||unistr('\000a')||
'    AND SEGORG_ID = :P1_SEGORG_ID;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''PED'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_PED;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''PRV'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_PRV;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''RUB'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_CO';

p:=p||'METQ_RUB;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''CAT'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_CAT;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''CON'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_CON;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''CONS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_CONS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''COM'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_COM;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  O';

p:=p||'PEN cr_etq(p_codigo => ''PRO'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_PRO;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''TRP'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_TRP;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''ECC'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_ECC;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  IF :P1_COMETQ_PED IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_PED :=''Pedidos de Compras'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_PRV IS NULL THEN'||unistr('\000a')||
'    :P1_COM';

p:=p||'ETQ_PRV :=''Proveeedores'';'||unistr('\000a')||
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
'  IF :P1_COMETQ_CONS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_CONS :=''Entidad Contratante'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_COM IS NUL';

p:=p||'L THEN'||unistr('\000a')||
'    :P1_COMETQ_COM :=''Compras'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_PRO IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_PRO :=''Productos'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_TRP IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_TRP :=''Tramites Proveedores'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_ECC IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_ECC :=''Categorías EC'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 31819607866123310 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 4,
  p_process_sequence=> 30,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Setear Etiquetas por Default',
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
p:=p||'begin'||unistr('\000a')||
'  :P4_COMCOE_ESTADO_WHERE :=SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo=>''PORCOM_EXPLORADOR_LLAMADOS_ESTADOS'',p_segorg_id=>:P1_SEGORG_ID);'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 6946706293509771 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 4,
  p_process_sequence=> 40,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'SetearComcoeEstadoWhere',
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
p:=p||':P4_MENSAJE_PORTADA_EXP:=SEG_PKG.OBTN_SEGCFG_VALOR(p_segorg_id => :P1_SEGORG_ID,p_codigo =>''PORCOM_MENSAJE_PORTADA_EXP'');';

wwv_flow_api.create_page_process(
  p_id     => 7052505549007128 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 4,
  p_process_sequence=> 50,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ObtenerMensajePortada',
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
p:=p||'1859426113747001';

wwv_flow_api.create_page_process(
  p_id     => 19845616755173482 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 4,
  p_process_sequence=> 60,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'InicializarTemaPorDefault',
  p_process_sql_clob => 1859426113747001 + wwv_flow_api.g_id_offset,
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
-- ...updatable report columns for page 4
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
