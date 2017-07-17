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

PROMPT ...Remove page 211
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>211);
 
end;
/

 
--application/pages/page_00211
prompt  ...PAGE 211: Aceptar Trámites Inscripción Proveedores - Resumen
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 211
 ,p_user_interface_id => 70527406842675 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'ADMINISTRACION'
 ,p_name => 'Aceptar Trámites Inscripción Proveedores - Resumen'
 ,p_step_title => 'Aceptar Trámites Inscripción Proveedores - Resumen'
 ,p_allow_duplicate_submissions => 'N'
 ,p_on_dup_submission_goto_url => 'f?p=&APP_ID.:2:&SESSION.:::::'
 ,p_step_sub_title => 'Confirmar Solicitud'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 15883602747762769 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'FKASIAN'
 ,p_last_upd_yyyymmddhh24miss => '20170315143629'
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
  p_id=> 12219007875710547 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 211,
  p_plug_name=> 'Confirmar Solicitud',
  p_region_name=>'',
  p_region_attributes=> '#IMAGE_PREFIX#menu/page_32.gif',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142031870782227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 90,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT_ESCAPE_SC',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_header=> '<font color="red"><b>ATENCIÓN!!</b></font><br>Ha solicitado Aceptar el Trámite.<br><br>'||unistr('\000a')||
'<b>Verifique los datos del trámite que esta Aceptando.'||unistr('\000a')||
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 12219604235710554 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 211,
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
s:=s||'select COMPDO.ID'||unistr('\000a')||
'     , COMPDT_NOMBRE'||unistr('\000a')||
'     , COMENTARIO'||unistr('\000a')||
'     , CASE WHEN nvl(FECHA_VENCIMIENTO, sysdate + 1 ) > sysdate THEN ''<font color="green"><b>VIGENTE</b></font>'''||unistr('\000a')||
'            ELSE ''<font color="red"><b>VENCIDO</b></font>'''||unistr('\000a')||
'       END CASE'||unistr('\000a')||
'     , (case COMPDT_TIPO_DURACION '||unistr('\000a')||
'         when ''SIN'' then'||unistr('\000a')||
'           ''INDEFINIDA'''||unistr('\000a')||
'         else '||unistr('\000a')||
'           to_char(FECHA_VENCIMIENTO, ''dd/mm/yyyy'')'||unistr('\000a')||
'     ';

s:=s||'  end) FECHA_VENCIMIENTO 	 '||unistr('\000a')||
'     , (case when INSTR(COMPDO.MIMETYPE,''pdf'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/download_pdf_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''excel'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/download_csv_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''oct'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO';

s:=s||'.MIMETYPE,''word'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/download_rtf_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''plain'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''image'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/chart_32x24.gif">''    '||unistr('\000a')||
'         else'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'      ';

s:=s||'   end) ICONO'||unistr('\000a')||
'     , dbms_lob.getlength(DOCUMENTO) DOCUMENTO'||unistr('\000a')||
'     , FILENAME'||unistr('\000a')||
'     , MIMETYPE'||unistr('\000a')||
'     , LAST_UPDATE_DATE'||unistr('\000a')||
'  from COM_TRAMITES_PRV_DOC COMTDP'||unistr('\000a')||
'     , COM_PROVEEDORES_DOC_V COMPDO'||unistr('\000a')||
' where COMTDP.COMTPR_ID = :P211_COMTPR_ID'||unistr('\000a')||
'   and COMTDP.COMPDO_ID = COMPDO.ID';

wwv_flow_api.create_report_region (
  p_id=> 31652215327990442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 211,
  p_name=> 'Documentos',
  p_region_name=>'',
  p_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 100,
  p_region_attributes=>'style="width:600px"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> 'declare'||unistr('\000a')||
'  v_comtpr COM_TRAMITES_PRV%rowtype;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Obtener los datos del trámite de proveedor'||unistr('\000a')||
'  COM_PKG.SET_COMTPR(p_id     => :P211_COMTPR_ID);'||unistr('\000a')||
'  COM_PKG.GET_COMTPR(p_comtpr => v_comtpr);'||unistr('\000a')||
'  COM_PKG.INI_COMTPR;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  IF v_comtpr.TIPO in (''PDOC'',''ACCB'',''PDOI'') THEN'||unistr('\000a')||
'    RETURN TRUE;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  RETURN FALSE;'||unistr('\000a')||
'  --'||unistr('\000a')||
'end;',
  p_display_condition_type=> 'FUNCTION_BODY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
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
  p_id=> 31653312450990443 + wwv_flow_api.g_id_offset,
  p_region_id=> 31652215327990442 + wwv_flow_api.g_id_offset,
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
  p_id=> 31653202163990443 + wwv_flow_api.g_id_offset,
  p_region_id=> 31652215327990442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_NOMBRE',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Documento',
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31652615181990442 + wwv_flow_api.g_id_offset,
  p_region_id=> 31652215327990442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMENTARIO',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Comentario',
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31653102641990442 + wwv_flow_api.g_id_offset,
  p_region_id=> 31652215327990442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'CASE',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Estado',
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
  p_id=> 31652702204990442 + wwv_flow_api.g_id_offset,
  p_region_id=> 31652215327990442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VENCIMIENTO',
  p_column_display_sequence=> 5,
  p_column_heading=> 'FechaVencimiento',
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31653015550990442 + wwv_flow_api.g_id_offset,
  p_region_id=> 31652215327990442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'ICONO',
  p_column_display_sequence=> 6,
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31652813373990442 + wwv_flow_api.g_id_offset,
  p_region_id=> 31652215327990442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Documento',
  p_column_format=> 'DOWNLOAD:COM_PROVEEDORES_DOC:DOCUMENTO:ID::MIMETYPE:FILENAME:LAST_UPDATE_DATE::attachment:Abrir Doc.',
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31653426686990443 + wwv_flow_api.g_id_offset,
  p_region_id=> 31652215327990442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'FILENAME',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Filename',
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
  p_id=> 31652407035990442 + wwv_flow_api.g_id_offset,
  p_region_id=> 31652215327990442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'MIMETYPE',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Mimetype',
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
  p_id=> 31652503571990442 + wwv_flow_api.g_id_offset,
  p_region_id=> 31652215327990442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'LAST_UPDATE_DATE',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Last Update Date',
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
  l_clob clob;
  l_length number := 1;
begin
s:=s||'declare'||unistr('\000a')||
'  cursor cr_comtpr is'||unistr('\000a')||
'    select comtpr.*'||unistr('\000a')||
'    from COM_TRAMITES_PRV_V comtpr'||unistr('\000a')||
'    where ID = :P211_COMTPR_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  cursor cr_comprt (p_comtpr_comprt_id number) is'||unistr('\000a')||
'    select ID'||unistr('\000a')||
'       , SEGORG_ID'||unistr('\000a')||
'       , DECODE(TIPO_PERSONA,''FIS'',''Apellido y Nombre'''||unistr('\000a')||
'                            ,''JUR'',''Razón Social'') codigo'||unistr('\000a')||
'       , NOMBRE'||unistr('\000a')||
'       , TIPO_PERSONA'||unistr('\000a')||
'       , SOLICITAR_RESPONSABLE_SN'||unistr('\000a')||
'    ,GENER';

s:=s||'AR_USUARIO_SN'||unistr('\000a')||
'    ,SITUACION'||unistr('\000a')||
'    ,DATE_CREATED                   '||unistr('\000a')||
'    ,CREATED_BY                     '||unistr('\000a')||
'    ,DATE_MODIFIED                  '||unistr('\000a')||
'    ,MODIFIED_BY       '||unistr('\000a')||
'    from COM_PROVEEDORES_TIPOS'||unistr('\000a')||
'    where ID = p_comtpr_comprt_id;'||unistr('\000a')||
'  --  '||unistr('\000a')||
'  v_comtpr cr_comtpr%ROWTYPE;'||unistr('\000a')||
'  v_comprt cr_comprt%ROWTYPE;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  open cr_comtpr;'||unistr('\000a')||
'  fetch cr_comtpr INTO v_comtpr;'||unistr('\000a')||
'  close cr_comtpr;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  open cr_comprt(p_com';

s:=s||'tpr_comprt_id => v_comtpr.comprt_id);'||unistr('\000a')||
'  fetch cr_comprt INTO v_comprt;'||unistr('\000a')||
'  close cr_comprt;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  htp.print(''<b>Datos de la ''||v_comprt.NOMBRE||'' Solicitante </b><br><br>'');'||unistr('\000a')||
'  htp.print(''<b>N° de Trámite : ''||v_comtpr.ID||''</b><br>'');'||unistr('\000a')||
'  htp.print(''<b>Tipo de Trámite : ''||v_comtpr.TIPO_DESC||''</b><br><br>'');'||unistr('\000a')||
'  htp.print(v_comprt.CODIGO||'' : <b>''||v_comtpr.NOMBRE||''</b><br>'');'||unistr('\000a')||
'  htp.print(''CUIT : <b>';

s:=s||'''||v_comtpr.CUIT||''</b><br>'');'||unistr('\000a')||
'  htp.print(''Descripción de la Actividad : <b>''||v_comtpr.DESCRIPCION_ACTIVIDAD||''</b><br>'');'||unistr('\000a')||
'  htp.print(''Email principal : <b>''||v_comtpr.EMAIL||''</b><br>'');'||unistr('\000a')||
'  :P211_COMPRV_ID := v_comtpr.COMPRV_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  --agregado: control de tipo de tramite en oculto '||unistr('\000a')||
'  :P211_TIPO_TRAMITE := v_comtpr.TIPO;'||unistr('\000a')||
'  --agregado: control de tipo de persona en oculto  '||unistr('\000a')||
'  :P211_TIPO_PERSON';

s:=s||'A := v_comprt.TIPO_PERSONA;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  declare'||unistr('\000a')||
'    cursor cr_dom is'||unistr('\000a')||
'      select rv_meaning'||unistr('\000a')||
'      from cg_ref_codes'||unistr('\000a')||
'      where rv_domain = ''COM_TRAMITES_PRV.CONDICION_IB'''||unistr('\000a')||
'      and rv_low_value = v_comtpr.CONDICION_IB;'||unistr('\000a')||
'  v_dummy cg_ref_codes.rv_meaning%type;'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    open cr_dom;'||unistr('\000a')||
'    fetch cr_dom into v_dummy;'||unistr('\000a')||
'    close cr_dom;'||unistr('\000a')||
'    htp.print(''Condición frente al IVA : <b>''||v_dummy||''</b><br>'');'||unistr('\000a')||
' ';

s:=s||' end;'||unistr('\000a')||
'  htp.print(''N° Inscripcion IB : <b>''||v_comtpr.NUMERO_INSCRIPCION_IB||''</b><br>'');'||unistr('\000a')||
'  htp.print(''Fecha Inicio Actividad  : <b>''||v_comtpr.FECHA_INSCRIPCION_IB||''</b><br>'');'||unistr('\000a')||
'  htp.print(''CBU : <b>''||v_comtpr.CBU_DESC||''</b><br>'');'||unistr('\000a')||
'end;'||unistr('\000a')||
'htp.print(''<br>'');'||unistr('\000a')||
'htp.print(''<br>'');';

wwv_flow_api.create_page_plug (
  p_id=> 34764103871199462 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 211,
  p_plug_name=> 'Detalle de la Solicitud',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 90,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
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
s:=s||'declare'||unistr('\000a')||
''||unistr('\000a')||
'cursor cr_comtpr is'||unistr('\000a')||
' select comtpr.*'||unistr('\000a')||
' from com_tramites_prv comtpr'||unistr('\000a')||
' where comtpr.ID = :P211_COMTPR_ID;'||unistr('\000a')||
''||unistr('\000a')||
'v_comtpr com_tramites_prv%rowtype;'||unistr('\000a')||
'v_prioridad varchar2(29); '||unistr('\000a')||
''||unistr('\000a')||
'begin'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'open cr_comtpr;'||unistr('\000a')||
'fetch cr_comtpr into v_comtpr;'||unistr('\000a')||
'close cr_comtpr;'||unistr('\000a')||
''||unistr('\000a')||
'select rv_abbreviation into v_prioridad'||unistr('\000a')||
'  from   cg_ref_codes'||unistr('\000a')||
'  where  rv_domain = ''COM_TRAMITES_PRV.PRIORIDAD'''||unistr('\000a')||
'  and rv_low_value = v_comtpr.PRIORIDA';

s:=s||'D;'||unistr('\000a')||
''||unistr('\000a')||
'htp.print(''<b>  Prioridad :   </b> ''|| V_PRIORIDAD||'' <br>'');'||unistr('\000a')||
'htp.print(''<b>  Asunto :   </b> ''|| v_comtpr.ASUNTO||'' <br>'');'||unistr('\000a')||
'htp.print(''<b>  Cuerpo:   </b> ''|| v_comtpr.CUERPO ||'' <br><br>'');'||unistr('\000a')||
''||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 34764713567202214 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 211,
  p_plug_name=> 'Detalle Documentación Interna ',
  p_region_name=>'',
  p_region_attributes=> 'style="width:60%"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 95,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => ':P211_TIPO IN (''PDOI'')',
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
s:=s||'SELECT COMTPD_V.COMTPR_ID'||unistr('\000a')||
'      ,COMTPD_V.COMDMT_ID'||unistr('\000a')||
'      ,''<b>''||COMTPD_V.COMDMT_NOMBRE||''</b>'' COMDMT_NOMBRE'||unistr('\000a')||
'      ,LTRIM(RTRIM(COMTPD_V.COMDOM_PAIS||'' - ''||COMTPD_V.COMDOM_PROVINCIA||'' - ''||COMTPD_V.COMDOM_DEPARTAMENTO||'' - ''||COMTPD_V.COMDOM_LOCALIDAD)) UBICACION'||unistr('\000a')||
'      ,COMTPD_V.COMDOM_CALLE||'' ''||COMTPD_V.COMDOM_NUMERO_CASA||'' ''||COMTPD_V.COMDOM_PISO||'' ''||COMTPD_V.COMDOM_DPTO||'' ''||COMTPD_V.';

s:=s||'COMDOM_OBSERVACION||'' ''||DECODE(COMTPD_V.COMDOM_CODIGO_POSTAL,'''','''',''C.P.:''||COMTPD_V.COMDOM_CODIGO_POSTAL)  DIRECCION'||unistr('\000a')||
'      ,COMTPD_V.COMDOM_TELEFONO_CODIGO_AREA'||unistr('\000a')||
'       ||''-''||COMTPD_V.COMDOM_TELEFONO_NUMERO TELEFONO'||unistr('\000a')||
'      ,COMTPD_V.COMDOM_FAX_CODIGO_AREA||''-''||COMTPD_V.COMDOM_FAX_NUMERO FAX'||unistr('\000a')||
'      ,COMTPD_V.OPERACION'||unistr('\000a')||
'      ,''<hr>'' linea '||unistr('\000a')||
' FROM COM_TRAMITES_PRV_DOM_V COMTPD_V'||unistr('\000a')||
'  WHERE COMTPD_V.COMT';

s:=s||'PR_ID = :P211_COMTPR_ID';

wwv_flow_api.create_report_region (
  p_id=> 34766000885208035 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 211,
  p_name=> 'Detalle de Domicilios',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 130,
  p_region_attributes=>'style="width:60%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> ':P211_TIPO NOT IN (''PDOI'',''AIAU'',''INCT'',''BAJC'',''ADAU'')',
  p_display_condition_type=> 'PLSQL_EXPRESSION',
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
  p_query_no_data_found=> 'No se han indicado domicilios.',
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
  p_prn_page_header_alignment=> 'LEFT',
  p_prn_page_footer_alignment=> 'LEFT',
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
  p_id=> 34766207089208037 + wwv_flow_api.g_id_offset,
  p_region_id=> 34766000885208035 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMTPR_ID',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Comtpr Id',
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
  p_id=> 34766326995208039 + wwv_flow_api.g_id_offset,
  p_region_id=> 34766000885208035 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMDMT_ID',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Comdmt Id',
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
  p_id=> 34766401127208039 + wwv_flow_api.g_id_offset,
  p_region_id=> 34766000885208035 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMDMT_NOMBRE',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Tipo',
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
  p_print_col_width=> '12',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34766514197208042 + wwv_flow_api.g_id_offset,
  p_region_id=> 34766000885208035 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'UBICACION',
  p_column_display_sequence=> 5,
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
  p_include_in_export=> 'Y',
  p_print_col_width=> '12',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34766628925208042 + wwv_flow_api.g_id_offset,
  p_region_id=> 34766000885208035 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'DIRECCION',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Dirección',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '12',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34766729069208042 + wwv_flow_api.g_id_offset,
  p_region_id=> 34766000885208035 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'TELEFONO',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Teléfono',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '12',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34766831197208042 + wwv_flow_api.g_id_offset,
  p_region_id=> 34766000885208035 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'FAX',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Fax',
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
  p_print_col_width=> '12',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34766921826208042 + wwv_flow_api.g_id_offset,
  p_region_id=> 34766000885208035 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'OPERACION',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Operación a realizar',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'TEXT_FROM_LOV',
  p_named_lov=>12413722067523687 + wwv_flow_api.g_id_offset,
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '12',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34767021516208042 + wwv_flow_api.g_id_offset,
  p_region_id=> 34766000885208035 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'LINEA',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Linea',
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
  p_print_col_width=> '12',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT comtpr_id'||unistr('\000a')||
'      ,comrub_id'||unistr('\000a')||
'      ,observacion'||unistr('\000a')||
'      ,comrub_codigo||'' - ''||comrub_nombre comrub_nombre'||unistr('\000a')||
'      ,comrub_descripcion'||unistr('\000a')||
'      ,comrub_situacion'||unistr('\000a')||
'      ,operacion'||unistr('\000a')||
'      ,''<hr>'' linea '||unistr('\000a')||
' FROM COM_TRAMITES_PRV_RUB_V   '||unistr('\000a')||
'WHERE COMTPR_ID = :P211_COMTPR_ID'||unistr('\000a')||
'ORDER BY observacion desc';

wwv_flow_api.create_report_region (
  p_id=> 34768111274211028 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 211,
  p_name=> 'Detalle de &P1_COMETQ_RUB.',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 140,
  p_region_attributes=>'style="width:60%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> ':P211_TIPO NOT IN (''PDOI'',''AIAU'',''INCT'',''BAJC'',''ADAU'')',
  p_display_condition_type=> 'PLSQL_EXPRESSION',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se ha indicado &P1_COMETQ_RUB.',
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
  p_id=> 34768902911211029 + wwv_flow_api.g_id_offset,
  p_region_id=> 34768111274211028 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMTPR_ID',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Comtpr Id',
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
  p_id=> 34769005009211029 + wwv_flow_api.g_id_offset,
  p_region_id=> 34768111274211028 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMRUB_ID',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Comrub Id',
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
  p_id=> 34768523189211029 + wwv_flow_api.g_id_offset,
  p_region_id=> 34768111274211028 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'OBSERVACION',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Tipo',
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
  p_id=> 34768609097211029 + wwv_flow_api.g_id_offset,
  p_region_id=> 34768111274211028 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COMRUB_NOMBRE',
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
  p_id=> 34768715583211029 + wwv_flow_api.g_id_offset,
  p_region_id=> 34768111274211028 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMRUB_DESCRIPCION',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Comrub Descripcion',
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
  p_id=> 34768821342211029 + wwv_flow_api.g_id_offset,
  p_region_id=> 34768111274211028 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'COMRUB_SITUACION',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Comrub Situacion',
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
  p_id=> 34768304966211029 + wwv_flow_api.g_id_offset,
  p_region_id=> 34768111274211028 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'OPERACION',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Operación a realizar',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'TEXT_FROM_LOV',
  p_named_lov=>12413302674518099 + wwv_flow_api.g_id_offset,
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
  p_id=> 34768425155211029 + wwv_flow_api.g_id_offset,
  p_region_id=> 34768111274211028 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'LINEA',
  p_column_display_sequence=> 8,
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
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT comres_nombre'||unistr('\000a')||
'      ,comres_tipo_documento||'': ''||comres_numero_documento Documento'||unistr('\000a')||
'      ,comres_email'||unistr('\000a')||
'      ,operacion'||unistr('\000a')||
'      ,''<hr>'' linea '||unistr('\000a')||
'  FROM COM_TRAMITES_PRV_RES_V'||unistr('\000a')||
' WHERE COMTPR_ID = :P211_COMTPR_ID';

wwv_flow_api.create_report_region (
  p_id=> 34769115084212151 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 211,
  p_name=> 'Detalle de &P1_COMETQ_PRS.',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 150,
  p_region_attributes=>'style="width:60%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> ':P211_TIPO NOT IN (''PDOI'',''AIAU'',''INCT'',''BAJC'',''ADAU'')',
  p_display_condition_type=> 'PLSQL_EXPRESSION',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se han indicado &P1_COMETQ_PRS..',
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
  p_id=> 34769326032212151 + wwv_flow_api.g_id_offset,
  p_region_id=> 34769115084212151 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMRES_NOMBRE',
  p_column_display_sequence=> 1,
  p_column_heading=> '&P1_COMETQ_PRSS.',
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
  p_id=> 34769414649212151 + wwv_flow_api.g_id_offset,
  p_region_id=> 34769115084212151 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Documento',
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
  p_id=> 34769508341212151 + wwv_flow_api.g_id_offset,
  p_region_id=> 34769115084212151 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMRES_EMAIL',
  p_column_display_sequence=> 3,
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
  p_id=> 34769624704212151 + wwv_flow_api.g_id_offset,
  p_region_id=> 34769115084212151 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'OPERACION',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Operación a realizar',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'TEXT_FROM_LOV',
  p_named_lov=>12452008448501587 + wwv_flow_api.g_id_offset,
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
  p_id=> 34769732536212151 + wwv_flow_api.g_id_offset,
  p_region_id=> 34769115084212151 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'LINEA',
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
  l_clob clob;
  l_length number := 1;
begin
s:=s||'  select COMPDO.ID'||unistr('\000a')||
'     , COMPDO.COMPDT_NOMBRE'||unistr('\000a')||
'     , COMPDO.COMENTARIO'||unistr('\000a')||
'     , CASE WHEN nvl(COMPDO.FECHA_VENCIMIENTO, sysdate + 1 ) > sysdate THEN ''<font color="green"><b>VIGENTE</b></font>'''||unistr('\000a')||
'            ELSE ''<font color="red"><b>VENCIDO</b></font>'''||unistr('\000a')||
'       END CASE'||unistr('\000a')||
'     , (case COMPDO.COMPDT_TIPO_DURACION '||unistr('\000a')||
'         when ''SIN'' then'||unistr('\000a')||
'           ''INDEFINIDA'''||unistr('\000a')||
'         else '||unistr('\000a')||
'           to_char(COMPDO.F';

s:=s||'ECHA_VENCIMIENTO, ''dd/mm/yyyy'')'||unistr('\000a')||
'       end) FECHA_VENCIMIENTO 	 '||unistr('\000a')||
'     , (case when INSTR(COMPDO.MIMETYPE,''pdf'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/download_pdf_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''excel'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/download_csv_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''oct'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/page_32';

s:=s||'x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''word'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/download_rtf_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''plain'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''image'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/chart_32x24.gif">''    '||unistr('\000a')||
'         else'||unistr('\000a')||
'          ''<img src="#IMAGE_P';

s:=s||'REFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'         end) ICONO'||unistr('\000a')||
'     , dbms_lob.getlength(DOCUMENTO) DOCUMENTO'||unistr('\000a')||
'     , FILENAME'||unistr('\000a')||
'     , MIMETYPE'||unistr('\000a')||
'     , LAST_UPDATE_DATE'||unistr('\000a')||
'     , COMPRA.COMPCC_NOMBRE'||unistr('\000a')||
'     ,compra.apellido||'' ''||COMPRA.NOMBRE||'' - ''||compra.tipo_documento||'' ''||compra.numero_documento compra_datos_completos'||unistr('\000a')||
'from com_proveedores_aut_v compra'||unistr('\000a')||
'    ,com_proveedores_doc_v compdo'||unistr('\000a')||
'    ,com_proveedores_ado_';

s:=s||'v compad'||unistr('\000a')||
'where COMPRA.COMPRV_ID = COMPDO.COMPRV_ID'||unistr('\000a')||
'  and COMPRA.COMTPR_ID = :P211_COMTPR_ID'||unistr('\000a')||
'  and COMPAD.COMPDO_ID = COMPDO.id'||unistr('\000a')||
'  and COMPAD.COMPRA_ID = COMPRA.id'||unistr('\000a')||
'  and COMPAD.SITUACION = ''NUE'''||unistr('\000a')||
'  and COMPDO.SITUACION = ''NUE'''||unistr('\000a')||
'union -- Buscamos los documentos que se hayan actualizado mediante el tramite de Actualizacion de Documentación, mostrando a que autoridad pertenecen.'||unistr('\000a')||
'  select COMPDO.ID'||unistr('\000a')||
'     ,';

s:=s||' COMPDO.COMPDT_NOMBRE'||unistr('\000a')||
'     , COMPDO.COMENTARIO'||unistr('\000a')||
'     , CASE WHEN nvl(COMPDO.FECHA_VENCIMIENTO, sysdate + 1 ) > sysdate THEN ''<font color="green"><b>VIGENTE</b></font>'''||unistr('\000a')||
'            ELSE ''<font color="red"><b>VENCIDO</b></font>'''||unistr('\000a')||
'       END CASE'||unistr('\000a')||
'     , (case COMPDO.COMPDT_TIPO_DURACION '||unistr('\000a')||
'         when ''SIN'' then'||unistr('\000a')||
'           ''INDEFINIDA'''||unistr('\000a')||
'         else '||unistr('\000a')||
'           to_char(COMPDO.FECHA_VENCIMIENTO, ''dd/mm/';

s:=s||'yyyy'')'||unistr('\000a')||
'       end) FECHA_VENCIMIENTO 	 '||unistr('\000a')||
'     , (case when INSTR(COMPDO.MIMETYPE,''pdf'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/download_pdf_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''excel'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/download_csv_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''oct'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">'''||unistr('\000a')||
'         when ';

s:=s||'INSTR(COMPDO.MIMETYPE,''word'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/download_rtf_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''plain'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''image'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/chart_32x24.gif">''    '||unistr('\000a')||
'         else'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">';

s:=s||'''    '||unistr('\000a')||
'         end) ICONO'||unistr('\000a')||
'     , dbms_lob.getlength(DOCUMENTO) DOCUMENTO'||unistr('\000a')||
'     , FILENAME'||unistr('\000a')||
'     , MIMETYPE'||unistr('\000a')||
'     , LAST_UPDATE_DATE'||unistr('\000a')||
'     ,COMPRA.COMPCC_NOMBRE'||unistr('\000a')||
'     ,compra.apellido||'' ''||COMPRA.NOMBRE||'' - ''||compra.tipo_documento||'' ''||compra.numero_documento compra_datos_completos'||unistr('\000a')||
'from com_proveedores_aut_v compra'||unistr('\000a')||
'    ,com_proveedores_doc_v compdo'||unistr('\000a')||
'    ,com_proveedores_ado compad'||unistr('\000a')||
'    ,com_tramites_p';

s:=s||'rv_doc comtdp'||unistr('\000a')||
'where COMPRA.ID = compad.compra_id'||unistr('\000a')||
'  anD COMPDO.ID = COMPAD.COMPDO_ID'||unistr('\000a')||
'  and COMTDP.COMTPR_ID = :P211_COMTPR_ID'||unistr('\000a')||
'  and COMTDP.COMPDO_ID = COMPDO.ID  '||unistr('\000a')||
'  and COMPAD.SITUACION = ''NUE'''||unistr('\000a')||
'  and COMPDO.SITUACION = ''NUE''  ';

wwv_flow_api.create_report_region (
  p_id=> 49446630608558259 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 211,
  p_name=> 'Documentos de Autoridades',
  p_region_name=>'',
  p_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 170,
  p_region_attributes=>'style="width:60%"',
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> ':P211_TIPO in (''INCT'',''AIAU'',''ADAU'')',
  p_display_condition_type=> 'PLSQL_EXPRESSION',
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
  p_query_no_data_found=> 'no data found',
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
  p_id=> 49447418137558260 + wwv_flow_api.g_id_offset,
  p_region_id=> 49446630608558259 + wwv_flow_api.g_id_offset,
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
  p_id=> 49447521648558260 + wwv_flow_api.g_id_offset,
  p_region_id=> 49446630608558259 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_NOMBRE',
  p_column_display_sequence=> 2,
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
  p_id=> 49446825107558260 + wwv_flow_api.g_id_offset,
  p_region_id=> 49446630608558259 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMENTARIO',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Comentario',
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
  p_id=> 49446928564558260 + wwv_flow_api.g_id_offset,
  p_region_id=> 49446630608558259 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'CASE',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Estado',
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
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 49447620057558260 + wwv_flow_api.g_id_offset,
  p_region_id=> 49446630608558259 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VENCIMIENTO',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Fecha Vencimiento',
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
  p_id=> 49447011241558260 + wwv_flow_api.g_id_offset,
  p_region_id=> 49446630608558259 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'ICONO',
  p_column_display_sequence=> 8,
  p_column_heading=> '',
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
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 49447723885558260 + wwv_flow_api.g_id_offset,
  p_region_id=> 49446630608558259 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Documento',
  p_use_as_row_header=> 'N',
  p_column_format=> 'DOWNLOAD:COM_PROVEEDORES_DOC:DOCUMENTO:ID::MIMETYPE:FILENAME:LAST_UPDATE_DATE::Attachment:Abrir Doc.',
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 49447124972558260 + wwv_flow_api.g_id_offset,
  p_region_id=> 49446630608558259 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'FILENAME',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Filename',
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
  p_id=> 49447212930558260 + wwv_flow_api.g_id_offset,
  p_region_id=> 49446630608558259 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'MIMETYPE',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Mimetype',
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
  p_id=> 49447308212558260 + wwv_flow_api.g_id_offset,
  p_region_id=> 49446630608558259 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'LAST_UPDATE_DATE',
  p_column_display_sequence=> 12,
  p_column_heading=> 'Last Update Date',
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
  p_id=> 56393809540863956 + wwv_flow_api.g_id_offset,
  p_region_id=> 49446630608558259 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'COMPCC_NOMBRE',
  p_column_display_sequence=> 4,
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
  p_id=> 57905523720482468 + wwv_flow_api.g_id_offset,
  p_region_id=> 49446630608558259 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRA_DATOS_COMPLETOS',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Autoridad',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'EXISTS',
  p_display_when_condition=> 'select 1'||unistr('\000a')||
'from com_proveedores_aut_v compra'||unistr('\000a')||
'    ,com_proveedores_doc_v compdo'||unistr('\000a')||
'    ,com_proveedores_ado compad'||unistr('\000a')||
'    ,com_tramites_prv_doc comtdp'||unistr('\000a')||
'where COMPRA.ID = compad.compra_id'||unistr('\000a')||
'  anD COMPDO.ID = COMPAD.COMPDO_ID'||unistr('\000a')||
'  and COMTDP.COMTPR_ID = :P211_COMTPR_ID'||unistr('\000a')||
'  and COMTDP.COMPDO_ID = COMPDO.ID  ',
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
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 50133703350970400 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 211,
  p_plug_name=> 'Autoridades',
  p_region_name=>'',
  p_region_attributes=> 'style="width:60%"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 155,
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
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => ':P211_TIPO in (''INCT'',''AIAU'',''BAJC'')',
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
s:=s||'select compad.COMPDT_NOMBRE'||unistr('\000a')||
'      ,to_char(compad.COMPDO_FECHA_EMISION,''DD/MM/YYYY'')||'' - ''||nvl(to_char(compad.COMPDO_FECHA_VENCIMIENTO,''DD/MM/YYYY''),''INDEFINIDO'') VENC_DOC'||unistr('\000a')||
'      ,compad.COMPDT_NOMBRE||'' ''||to_char(compad.COMPDO_FECHA_EMISION,''DD/MM/YYYY'')||'' - ''||nvl(to_char(compad.COMPDO_FECHA_VENCIMIENTO,''DD/MM/YYYY''),''INDEFINIDO'') TIPO_DOC_COMPLETO'||unistr('\000a')||
'      ,compad.COMPDO_FECHA_PRESENTACION'||unistr('\000a')||
'    ';

s:=s||'  ,compra.id compra_id'||unistr('\000a')||
'      ,compra.comprv_id'||unistr('\000a')||
'      ,compra.compcc_id '||unistr('\000a')||
'      ,compra.comtpr_id'||unistr('\000a')||
'      ,compra.nombre||'' ''||compra.apellido||'' ''||compra.tipo_documento||'' - ''||compra.numero_documento AUTORIDAD'||unistr('\000a')||
'      ,to_char(compra.fecha_inicio,''DD/MM/YYYY'')||'' - ''||to_char(compra.fecha_vencimiento,''DD/MM/YYYY'') VENC_AUT'||unistr('\000a')||
'      ,compra.situacion'||unistr('\000a')||
'      ,compra.situacion_abr'||unistr('\000a')||
'      ,compra.fecha_situac';

s:=s||'ion'||unistr('\000a')||
'      ,compra.compcc_nombre'||unistr('\000a')||
'      ,compra.compcc_nombre||'' - ''||compra.nombre||'' ''||compra.apellido||'' ''||compra.tipo_documento||'': ''||compra.numero_documento||'' - ''||to_char(compra.fecha_inicio,''DD/MM/YYYY'')||'' - ''||to_char(compra.fecha_vencimiento,''DD/MM/YYYY'') AUTORIDAD_COMPLETA'||unistr('\000a')||
'from com_proveedores_aut_v compra'||unistr('\000a')||
'    ,com_proveedores_ado_v compad'||unistr('\000a')||
'where compra.ID = compad.compra_id'||unistr('\000a')||
'  anD COMP';

s:=s||'RA.COMTPR_ID = :P211_COMTPR_ID'||unistr('\000a')||
'  and compra.SITUACION = ''NUE'''||unistr('\000a')||
'  and compad.situacion = ''NUE'''||unistr('\000a')||
'order by compra_id';

wwv_flow_api.create_report_region (
  p_id=> 49444902642531235 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 211,
  p_name=> 'Autoridades Registradas',
  p_region_name=>'',
  p_parent_plug_id=>50133703350970400 + wwv_flow_api.g_id_offset,
  p_template=> 142030053339227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 163,
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> 'select 1'||unistr('\000a')||
'from com_proveedores_aut_v compra'||unistr('\000a')||
'    ,com_proveedores_ado_v compad'||unistr('\000a')||
'where compra.ID = compad.compra_id'||unistr('\000a')||
'  anD COMPRA.COMTPR_ID = :P211_COMTPR_ID'||unistr('\000a')||
'  and compra.SITUACION = ''NUE'''||unistr('\000a')||
'and   :P211_TIPO in (''INCT'',''AIAU'')',
  p_display_condition_type=> 'EXISTS',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 3,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '1',
  p_query_no_data_found=> 'no data found',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_LEFT',
  p_break_column_text_format=> '#SUM_COLUMN_HEADER#',
  p_break_generic_column=> '#COLUMN_VALUE#',
  p_break_type_flag=> 'REPEAT_HEADINGS_ON_BREAK_1',
  p_break_repeat_heading_format=> '<span style="color: #35668d;"><strong><b>#COLUMN_VALUE#</b></strong></span>',
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
  p_id=> 49445212363531239 + wwv_flow_api.g_id_offset,
  p_region_id=> 49444902642531235 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_NOMBRE',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Tipo documento',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '24',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 49445405331531240 + wwv_flow_api.g_id_offset,
  p_region_id=> 49444902642531235 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'VENC_DOC',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Validez',
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
  p_include_in_export=> 'Y',
  p_print_col_width=> '24',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 56323900605002370 + wwv_flow_api.g_id_offset,
  p_region_id=> 49444902642531235 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'TIPO_DOC_COMPLETO',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Tipo de Documento',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
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
  p_id=> 56324026612002372 + wwv_flow_api.g_id_offset,
  p_region_id=> 49444902642531235 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDO_FECHA_PRESENTACION',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Compdo Fecha Presentacion',
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
  p_id=> 49445501935531240 + wwv_flow_api.g_id_offset,
  p_region_id=> 49444902642531235 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRA_ID',
  p_column_display_sequence=> 14,
  p_column_heading=> 'Compra Id',
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
  p_id=> 49445612217531240 + wwv_flow_api.g_id_offset,
  p_region_id=> 49444902642531235 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 11,
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
  p_id=> 49445710562531240 + wwv_flow_api.g_id_offset,
  p_region_id=> 49444902642531235 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'COMPCC_ID',
  p_column_display_sequence=> 6,
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
  p_id=> 49445929165531240 + wwv_flow_api.g_id_offset,
  p_region_id=> 49444902642531235 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'COMTPR_ID',
  p_column_display_sequence=> 7,
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
  p_id=> 49446529536531240 + wwv_flow_api.g_id_offset,
  p_region_id=> 49444902642531235 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'AUTORIDAD',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Autoridad',
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
  p_id=> 49446031560531240 + wwv_flow_api.g_id_offset,
  p_region_id=> 49444902642531235 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'VENC_AUT',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Duración',
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
  p_include_in_export=> 'Y',
  p_print_col_width=> '24',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 49446102728531240 + wwv_flow_api.g_id_offset,
  p_region_id=> 49444902642531235 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION',
  p_column_display_sequence=> 12,
  p_column_heading=> 'SITUACION',
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
  p_id=> 49446204313531240 + wwv_flow_api.g_id_offset,
  p_region_id=> 49444902642531235 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION_ABR',
  p_column_display_sequence=> 13,
  p_column_heading=> 'SITUACION_ABR',
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
  p_id=> 49446315234531240 + wwv_flow_api.g_id_offset,
  p_region_id=> 49444902642531235 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_SITUACION',
  p_column_display_sequence=> 15,
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
  p_id=> 49446428545531240 + wwv_flow_api.g_id_offset,
  p_region_id=> 49444902642531235 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'COMPCC_NOMBRE',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Cargo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '24',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 56324121865002372 + wwv_flow_api.g_id_offset,
  p_region_id=> 49444902642531235 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 15,
  p_form_element_id=> null,
  p_column_alias=> 'AUTORIDAD_COMPLETA',
  p_column_display_sequence=> 1,
  p_column_heading=> '<br>',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
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
s:=s||'select compra.COMPCC_NOMBRE'||unistr('\000a')||
'      ,compra.APELLIDO||'' ''||compra.NOMBRE||'' ''||compra.TIPO_DOCUMENTO||'':''||compra.NUMERO_DOCUMENTO AUTORIDAD'||unistr('\000a')||
'      ,to_char(compra.FECHA_INICIO,''DD/MM/YYYY'')||'' - ''||to_char(compra.FECHA_VENCIMIENTO,''DD/MM/YYYY'') DURACION'||unistr('\000a')||
'      ,compra.compcc_nombre||'' - ''||compra.nombre||'' ''||compra.apellido||'' ''||compra.tipo_documento||'': ''||compra.numero_documento||'' - ''||to_char(c';

s:=s||'ompra.fecha_inicio,''DD/MM/YYYY'')||'' - ''||to_char(compra.fecha_vencimiento,''DD/MM/YYYY'') AUTORIDAD_COMPLETA'||unistr('\000a')||
'      ,compad.COMPDT_NOMBRE'||unistr('\000a')||
'      ,to_char(compad.COMPDO_FECHA_EMISION,''DD/MM/YYYY'')||'' - ''||nvl(to_char(compad.COMPDO_FECHA_VENCIMIENTO,''DD/MM/YYYY''),''INDEFINIDO'') VENC_DOC'||unistr('\000a')||
'      ,compad.COMPDT_NOMBRE||'' ''||to_char(compad.COMPDO_FECHA_EMISION,''DD/MM/YYYY'')||'' - ''||nvl(to_char(compad.COMPDO_F';

s:=s||'ECHA_VENCIMIENTO,''DD/MM/YYYY''),''INDEFINIDO'') TIPO_DOC_COMPLETO'||unistr('\000a')||
'from com_proveedores_aut_v compra'||unistr('\000a')||
'    ,com_proveedores_ado_v compad'||unistr('\000a')||
'    ,(select COMPRA.COMPCC_ID, COMPRA.NUMERO_DOCUMENTO, COMPRA.TIPO_DOCUMENTO,compra.situacion '||unistr('\000a')||
'      from  com_proveedores_aut_v compra'||unistr('\000a')||
'    where compra.comprv_id = :P211_COMPRV_ID    '||unistr('\000a')||
'    and   compra.comtpr_id = :P211_COMTPR_ID'||unistr('\000a')||
'    and   compra.SITUACION in(''MAR'',''B';

s:=s||'AJ'')) compra2'||unistr('\000a')||
'where compra.ID = COMPAD.COMPRA_ID'||unistr('\000a')||
'and   COMPRA.COMPRV_ID = :P211_COMPRV_ID '||unistr('\000a')||
'and   COMPRA.COMPCC_ID = compra2.compcc_id'||unistr('\000a')||
'and   COMPRA.NUMERO_DOCUMENTO = compra2.numero_documento'||unistr('\000a')||
'and   COMPRA.TIPO_DOCUMENTO = compra2.tipo_documento'||unistr('\000a')||
'and   COMPRA.SITUACION = ''VIG'''||unistr('\000a')||
'and   COMPAD.situacion = ''VIG'''||unistr('\000a')||
'order by compra_id';

wwv_flow_api.create_report_region (
  p_id=> 50134225514976832 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 211,
  p_name=> 'Autoridades marcadas para dar de Baja',
  p_region_name=>'',
  p_parent_plug_id=>50133703350970400 + wwv_flow_api.g_id_offset,
  p_template=> 142030053339227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 165,
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> 'select 1'||unistr('\000a')||
'from com_proveedores_aut_v compra'||unistr('\000a')||
'where compra.comprv_id = :P211_COMPRV_ID'||unistr('\000a')||
'and   compra.comtpr_id = :P211_COMTPR_ID'||unistr('\000a')||
'and   COMPRA.SITUACION in (''MAR'',''BAJ'')'||unistr('\000a')||
'and  :P211_TIPO in (''AIAU'',''BAJC'')',
  p_display_condition_type=> 'EXISTS',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 3,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '1',
  p_query_no_data_found=> 'no data found',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_LEFT',
  p_break_column_text_format=> '#SUM_COLUMN_HEADER#',
  p_break_generic_column=> '#COLUMN_VALUE#',
  p_break_type_flag=> 'REPEAT_HEADINGS_ON_BREAK_1',
  p_break_repeat_heading_format=> '<span style="color: #35668d;"><strong><b>#COLUMN_VALUE#</b></strong></span>',
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
  p_id=> 50135710503976832 + wwv_flow_api.g_id_offset,
  p_region_id=> 50134225514976832 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMPCC_NOMBRE',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Cargo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '32',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 50135809342976832 + wwv_flow_api.g_id_offset,
  p_region_id=> 50134225514976832 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'AUTORIDAD',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Autoridad',
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
  p_id=> 56386907162606772 + wwv_flow_api.g_id_offset,
  p_region_id=> 50134225514976832 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'DURACION',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Duracion',
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
  p_id=> 56387006670606772 + wwv_flow_api.g_id_offset,
  p_region_id=> 50134225514976832 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'AUTORIDAD_COMPLETA',
  p_column_display_sequence=> 1,
  p_column_heading=> '<br>',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
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
  p_id=> 50134523605976832 + wwv_flow_api.g_id_offset,
  p_region_id=> 50134225514976832 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_NOMBRE',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Tipo documento',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '32',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 50134715109976832 + wwv_flow_api.g_id_offset,
  p_region_id=> 50134225514976832 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'VENC_DOC',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Validez',
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
  p_include_in_export=> 'Y',
  p_print_col_width=> '32',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 56387129064606772 + wwv_flow_api.g_id_offset,
  p_region_id=> 50134225514976832 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'TIPO_DOC_COMPLETO',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Tipo de Documento',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
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
s:=s||'select compad.COMPDT_NOMBRE'||unistr('\000a')||
'      ,to_char(compad.COMPDO_FECHA_EMISION,''DD/MM/YYYY'')||'' - ''||nvl(to_char(compad.COMPDO_FECHA_VENCIMIENTO,''DD/MM/YYYY''),''INDEFINIDO'') VENC_DOC'||unistr('\000a')||
'      ,compad.COMPDT_NOMBRE||'' ''||to_char(compad.COMPDO_FECHA_EMISION,''DD/MM/YYYY'')||'' - ''||nvl(to_char(compad.COMPDO_FECHA_VENCIMIENTO,''DD/MM/YYYY''),''INDEFINIDO'') TIPO_DOC_COMPLETO'||unistr('\000a')||
'      ,compad.COMPDO_FECHA_PRESENTACION'||unistr('\000a')||
'    ';

s:=s||'  ,compra.id compra_id'||unistr('\000a')||
'      ,compra.comprv_id'||unistr('\000a')||
'      ,compra.compcc_id '||unistr('\000a')||
'      ,compra.comtpr_id'||unistr('\000a')||
'      ,compra.nombre||'' ''||compra.apellido||'' ''||compra.tipo_documento||'' - ''||compra.numero_documento AUTORIDAD'||unistr('\000a')||
'      ,CASE '||unistr('\000a')||
'         WHEN ((compra.fecha_vencimiento < SYSDATE) AND compra.SITUACION = ''VIG'') THEN ''<span style="color: red;"><strong>VENCIDO</strong></span>'''||unistr('\000a')||
'         ELSE to_char(compra.fe';

s:=s||'cha_inicio,''DD/MM/YYYY'')||'' - ''||to_char(compra.fecha_vencimiento,''DD/MM/YYYY'')'||unistr('\000a')||
'       END VENC_AUT'||unistr('\000a')||
'      ,compra.situacion'||unistr('\000a')||
'      ,compra.situacion_abr'||unistr('\000a')||
'      ,compra.fecha_situacion'||unistr('\000a')||
'      ,compra.compcc_nombre'||unistr('\000a')||
'      ,compra.compcc_nombre||'' - ''||compra.nombre||'' ''||compra.apellido||'' ''||compra.tipo_documento||'': ''||compra.numero_documento||'' - ''||to_char(compra.fecha_inicio,''DD/MM/YYYY'')||'' - ''||t';

s:=s||'o_char(compra.fecha_vencimiento,''DD/MM/YYYY'') AUTORIDAD_COMPLETA'||unistr('\000a')||
'from com_proveedores_aut_v compra'||unistr('\000a')||
'    ,com_proveedores_ado_v compad'||unistr('\000a')||
'where compra.ID = compad.COMPRA_ID'||unistr('\000a')||
'and   compra.ID in (select max(compra2.ID)'||unistr('\000a')||
'                   from COM_PROVEEDORES_AUT compra2'||unistr('\000a')||
'                   where compra2.SITUACION not in (''NUE'',''ANU'',''MAR'')'||unistr('\000a')||
'                   and   compra2.COMPRV_ID = :P211_COMPRV_ID'||unistr('\000a')||
'      ';

s:=s||'             group by compra2.COMPCC_ID, compra2.TIPO_DOCUMENTO, compra2.NUMERO_DOCUMENTO, compra2.COMPRV_ID)'||unistr('\000a')||
'and   compra.SITUACION = ''VIG'''||unistr('\000a')||
'and   compad.situacion = ''VIG'''||unistr('\000a')||
'order by compra_id'||unistr('\000a')||
'--and   compra.FECHA_VENCIMIENTO > sysdate  ';

wwv_flow_api.create_report_region (
  p_id=> 50193418733072121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 211,
  p_name=> 'Autoridades Vigentes',
  p_region_name=>'',
  p_parent_plug_id=>50133703350970400 + wwv_flow_api.g_id_offset,
  p_template=> 142030053339227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 160,
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> 'select 1'||unistr('\000a')||
'from com_proveedores_aut_v compra'||unistr('\000a')||
'    ,com_proveedores_ado_v compad'||unistr('\000a')||
'where compra.ID = compad.COMPRA_ID'||unistr('\000a')||
'and   compra.ID in (select max(compra2.ID)'||unistr('\000a')||
'                   from COM_PROVEEDORES_AUT compra2'||unistr('\000a')||
'                   where compra2.SITUACION not in (''NUE'',''ANU'',''MAR'')'||unistr('\000a')||
'                   and   compra2.COMPRV_ID = :P211_COMPRV_ID'||unistr('\000a')||
'                   group by compra2.COMPCC_ID, compra2.TIPO_DOCUMENTO, compra2.NUMERO_DOCUMENTO, compra2.COMPRV_ID)'||unistr('\000a')||
'and   compra.SITUACION = ''VIG'''||unistr('\000a')||
'and :P211_TIPO in (''INCT'',''AIAU'')',
  p_display_condition_type=> 'EXISTS',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 3,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '1',
  p_query_no_data_found=> 'no data found',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_LEFT',
  p_break_column_text_format=> '#SUM_COLUMN_HEADER#',
  p_break_generic_column=> '#COLUMN_VALUE#',
  p_break_type_flag=> 'REPEAT_HEADINGS_ON_BREAK_1',
  p_break_repeat_heading_format=> '<span style="color: #35668d;"><strong><b>#COLUMN_VALUE#</b></strong></span>',
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
  p_id=> 50193707681072153 + wwv_flow_api.g_id_offset,
  p_region_id=> 50193418733072121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_NOMBRE',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Tipo documento',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '24',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 50193918758072153 + wwv_flow_api.g_id_offset,
  p_region_id=> 50193418733072121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'VENC_DOC',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Validez',
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
  p_include_in_export=> 'Y',
  p_print_col_width=> '24',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 56322311832981936 + wwv_flow_api.g_id_offset,
  p_region_id=> 50193418733072121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'TIPO_DOC_COMPLETO',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Tipo de Documento',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
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
  p_id=> 56322408286981939 + wwv_flow_api.g_id_offset,
  p_region_id=> 50193418733072121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDO_FECHA_PRESENTACION',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Compdo Fecha Presentacion',
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
  p_id=> 50194027268072153 + wwv_flow_api.g_id_offset,
  p_region_id=> 50193418733072121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRA_ID',
  p_column_display_sequence=> 14,
  p_column_heading=> 'Compra Id',
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
  p_id=> 50194119999072153 + wwv_flow_api.g_id_offset,
  p_region_id=> 50193418733072121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 11,
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
  p_id=> 50194232641072153 + wwv_flow_api.g_id_offset,
  p_region_id=> 50193418733072121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'COMPCC_ID',
  p_column_display_sequence=> 6,
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
  p_id=> 50194404182072153 + wwv_flow_api.g_id_offset,
  p_region_id=> 50193418733072121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'COMTPR_ID',
  p_column_display_sequence=> 7,
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
  p_id=> 50195024442072154 + wwv_flow_api.g_id_offset,
  p_region_id=> 50193418733072121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'AUTORIDAD',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Autoridad',
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
  p_id=> 50194508215072153 + wwv_flow_api.g_id_offset,
  p_region_id=> 50193418733072121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'VENC_AUT',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Duración',
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
  p_include_in_export=> 'Y',
  p_print_col_width=> '24',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 50194619737072153 + wwv_flow_api.g_id_offset,
  p_region_id=> 50193418733072121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION',
  p_column_display_sequence=> 12,
  p_column_heading=> 'SITUACION',
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
  p_id=> 50194722506072153 + wwv_flow_api.g_id_offset,
  p_region_id=> 50193418733072121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION_ABR',
  p_column_display_sequence=> 13,
  p_column_heading=> 'SITUACION_ABR',
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
  p_id=> 50194812656072153 + wwv_flow_api.g_id_offset,
  p_region_id=> 50193418733072121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_SITUACION',
  p_column_display_sequence=> 15,
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
  p_id=> 50194914670072153 + wwv_flow_api.g_id_offset,
  p_region_id=> 50193418733072121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'COMPCC_NOMBRE',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Cargo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '24',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 56322508167981939 + wwv_flow_api.g_id_offset,
  p_region_id=> 50193418733072121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 15,
  p_form_element_id=> null,
  p_column_alias=> 'AUTORIDAD_COMPLETA',
  p_column_display_sequence=> 1,
  p_column_heading=> '<br>',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
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
s:=s||'select comrgp.NOMBRE'||unistr('\000a')||
'from   COM_TRAMITES_PRV_RGP comtpg'||unistr('\000a')||
'      ,COM_REGISTROS_PRV comrgp'||unistr('\000a')||
'where  comtpg.COMTPR_ID = :P211_COMTPR_ID'||unistr('\000a')||
'and    comtpg.COMRGP_ID = comrgp.ID';

wwv_flow_api.create_report_region (
  p_id=> 75863014781111670 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 211,
  p_name=> 'Registro de Proveedores',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 180,
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> 'select 1'||unistr('\000a')||
'from   COM_TRAMITES_PRV_RGP comtpg'||unistr('\000a')||
'      ,COM_REGISTROS_PRV comrgp'||unistr('\000a')||
'where  comtpg.COMTPR_ID = :P211_COMTPR_ID'||unistr('\000a')||
'and    comtpg.COMRGP_ID = comrgp.ID',
  p_display_condition_type=> 'EXISTS',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 13,
  p_query_headings_type=> 'NO_HEADINGS',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se encontró un registro de proveedor asociado en este Tramite.',
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
  p_id=> 75863311193111675 + wwv_flow_api.g_id_offset,
  p_region_id=> 75863014781111670 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'NOMBRE',
  p_column_display_sequence=> 1,
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
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 12220109458710554 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 211,
  p_button_sequence=> 10,
  p_button_plug_id => 12219007875710547+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancelar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:&P1_PAG_ANTERIOR.:&SESSION.::&DEBUG.:435,436::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 12220325652710555 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 211,
  p_button_sequence=> 30,
  p_button_plug_id => 12219007875710547+wwv_flow_api.g_id_offset,
  p_button_name    => 'NEXT',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Aceptar',
  p_button_position=> 'REGION_TEMPLATE_NEXT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 12220528873710555 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 211,
  p_button_sequence=> 20,
  p_button_plug_id => 12219007875710547+wwv_flow_api.g_id_offset,
  p_button_name    => 'PREVIOUS',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> '< Anterior',
  p_button_position=> 'REGION_TEMPLATE_PREVIOUS',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_condition=> 'NVL(:P211_ANTERIOR,''SI'') = ''SI''',
  p_button_condition_type=> 'PLSQL_EXPRESSION',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>12221411906710557 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 211,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:212:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>12220325652710555+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 20,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>12221230238710557 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 211,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:201:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'BEFORE_VALIDATION',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>12220528873710555+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 30,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>12220717060710555 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 211,
  p_name=>'P211_COMTPR_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
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
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>12357306803241918 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 211,
  p_name=>'P211_COMPRV_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'COMPRV_ID',
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
  p_id=>12357518231245199 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 211,
  p_name=>'P211_RESULTADO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'RESULTADO',
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
  p_id=>18551908834579407 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 211,
  p_name=>'P211_COMTPT_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'COMPRV_ID',
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
  p_id=>34764324100199467 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 211,
  p_name=>'P211_TIPO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 330,
  p_item_plug_id => 34764103871199462+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'select TIPO'||unistr('\000a')||
'from COM_TRAMITES_PRV_V'||unistr('\000a')||
'where ID = :P211_COMTPR_ID;',
  p_source_type=> 'QUERY',
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
  p_id=>366762329758547481 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 211,
  p_name=>'P211_TIPO_TRAMITE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 340,
  p_item_plug_id => 50133703350970400+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
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
  p_id=>366948423226869185 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 211,
  p_name=>'P211_TIPO_PERSONA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 350,
  p_item_plug_id => 50133703350970400+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
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

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 366768329573775496 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 211,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'ValidarSiEsAgenteDelEstado',
  p_validation_sequence=> 10,
  p_validation => 'declare'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_comtpr is'||unistr('\000a')||
'   select to_char(comtpr.CUIT) CUIT'||unistr('\000a')||
'   from COM_TRAMITES_PRV_V comtpr'||unistr('\000a')||
'   where ID = :P211_COMTPR_ID;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_autoridades_reg is'||unistr('\000a')||
'   select '||unistr('\000a')||
'      compra.numero_documento'||unistr('\000a')||
'   from com_proveedores_aut_v compra'||unistr('\000a')||
'       ,com_proveedores_ado_v compad'||unistr('\000a')||
'   where compra.ID = compad.compra_id'||unistr('\000a')||
'     anD COMPRA.COMTPR_ID = :P211_COMTPR_ID'||unistr('\000a')||
'     and compra.SITUACION = ''NUE'''||unistr('\000a')||
'     and compad.situacion = ''NUE'''||unistr('\000a')||
'   order by compra_id;'||unistr('\000a')||
''||unistr('\000a')||
'   --'||unistr('\000a')||
'   v_retorno          varchar2(100);'||unistr('\000a')||
'   V_ESCALAFON        VARCHAR2(100);'||unistr('\000a')||
'   V_PLANTA           VARCHAR2(100);'||unistr('\000a')||
'   V_DEPENDENCIA      VARCHAR2(100);'||unistr('\000a')||
'   V_MINISTERIO       VARCHAR2(100);'||unistr('\000a')||
'   V_RAZONSOCIAL      VARCHAR2(100);'||unistr('\000a')||
'   V_FUNCIONCATEGORIA VARCHAR2(100);'||unistr('\000a')||
'   V_MOTIVO_ERROR     VARCHAR2(100) := '''';'||unistr('\000a')||
'   V_NRO_DOC          VARCHAR2(11);'||unistr('\000a')||
'   --'||unistr('\000a')||
'   v_comtpr cr_comtpr%ROWTYPE;'||unistr('\000a')||
'   --  '||unistr('\000a')||
'begin'||unistr('\000a')||
'   --'||unistr('\000a')||
'   --si no es persona física retorno sin error'||unistr('\000a')||
'   if :P211_TIPO_PERSONA<>''FIS'' then'||unistr('\000a')||
'      return '''';'||unistr('\000a')||
'   end if;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   open cr_comtpr;'||unistr('\000a')||
'   fetch cr_comtpr INTO V_NRO_DOC;'||unistr('\000a')||
'   close cr_comtpr;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   comprv_pkg.COMPRV_VLDR_AGENTE (P_SEGORG_ID         => :P1_SEGORG_ID'||unistr('\000a')||
'                                , P_COMTPR_CUIT      => V_NRO_DOC'||unistr('\000a')||
'                                , P_ESCALAFON        => V_ESCALAFON'||unistr('\000a')||
'                                , P_PLANTA           => V_PLANTA'||unistr('\000a')||
'                                , P_DEPENDENCIA      => V_DEPENDENCIA'||unistr('\000a')||
'                                , P_MINISTERIO       => V_MINISTERIO'||unistr('\000a')||
'                                , P_RAZONSOCIAL      => V_RAZONSOCIAL'||unistr('\000a')||
'                                , P_FUNCIONCATEGORIA => V_FUNCIONCATEGORIA'||unistr('\000a')||
'                                , P_MOTIVO_ERROR     => V_MOTIVO_ERROR'||unistr('\000a')||
'                                  );'||unistr('\000a')||
'   --'||unistr('\000a')||
'   if V_RAZONSOCIAL is not null then'||unistr('\000a')||
'      return ''La Persona Ingresada ('' || V_RAZONSOCIAL || '') es Agente del Estado Provincial por lo que no puede ser Inscripta como proveedor del estado según el Artículo 3° Decreto N° 4248 – MHyOP-2013 Inciso A'';'||unistr('\000a')||
'   end if;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   return V_MOTIVO_ERROR;   '||unistr('\000a')||
'   --'||unistr('\000a')||
'end;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => '',
  p_always_execute=>'N',
  p_validation_condition=> 'P211_TIPO_TRAMITE',
  p_validation_condition2=> 'INSC',
  p_validation_condition_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_when_button_pressed=> 12220325652710555 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> ',INCT,AIAU,INSC,'||unistr('\000a')||
'   '||unistr('\000a')||
''||unistr('\000a')||
'validación para per. física y autoridades'||unistr('\000a')||
''||unistr('\000a')||
'declare'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_comtpr is'||unistr('\000a')||
'   select to_char(comtpr.CUIT) CUIT'||unistr('\000a')||
'   from COM_TRAMITES_PRV_V comtpr'||unistr('\000a')||
'   where ID = :P211_COMTPR_ID;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_autoridades_reg is'||unistr('\000a')||
'   select '||unistr('\000a')||
'      compra.numero_documento'||unistr('\000a')||
'   from com_proveedores_aut_v compra'||unistr('\000a')||
'       ,com_proveedores_ado_v compad'||unistr('\000a')||
'   where compra.ID = compad.compra_id'||unistr('\000a')||
'     anD COMPRA.COMTPR_ID = :P211_COMTPR_ID'||unistr('\000a')||
'     and compra.SITUACION = ''NUE'''||unistr('\000a')||
'     and compad.situacion = ''NUE'''||unistr('\000a')||
'   order by compra_id;'||unistr('\000a')||
''||unistr('\000a')||
'   --'||unistr('\000a')||
'   v_retorno          varchar2(100);'||unistr('\000a')||
'   V_ESCALAFON        VARCHAR2(100);'||unistr('\000a')||
'   V_PLANTA           VARCHAR2(100);'||unistr('\000a')||
'   V_DEPENDENCIA      VARCHAR2(100);'||unistr('\000a')||
'   V_MINISTERIO       VARCHAR2(100);'||unistr('\000a')||
'   V_RAZONSOCIAL      VARCHAR2(100);'||unistr('\000a')||
'   V_FUNCIONCATEGORIA VARCHAR2(100);'||unistr('\000a')||
'   V_MOTIVO_ERROR     VARCHAR2(100) := '''';'||unistr('\000a')||
'   V_NRO_DOC          VARCHAR2(11);'||unistr('\000a')||
'   --'||unistr('\000a')||
'   v_comtpr cr_comtpr%ROWTYPE;'||unistr('\000a')||
'   --  '||unistr('\000a')||
'begin'||unistr('\000a')||
'   --'||unistr('\000a')||
'   --return ''TIPO: ''||:P211_TIPO_TRAMITE;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   if :P211_TIPO_TRAMITE = ''INSC'' then'||unistr('\000a')||
'   --'||unistr('\000a')||
'      open cr_comtpr;'||unistr('\000a')||
'      fetch cr_comtpr INTO V_NRO_DOC;'||unistr('\000a')||
'      close cr_comtpr;'||unistr('\000a')||
'      --'||unistr('\000a')||
'      comprv_pkg.COMPRV_VLDR_AGENTE (P_SEGORG_ID         => :P1_SEGORG_ID'||unistr('\000a')||
'                                    , P_COMTPR_CUIT      => V_NRO_DOC'||unistr('\000a')||
'                                    , P_ESCALAFON        => V_ESCALAFON'||unistr('\000a')||
'                                    , P_PLANTA           => V_PLANTA'||unistr('\000a')||
'                                    , P_DEPENDENCIA      => V_DEPENDENCIA'||unistr('\000a')||
'                                    , P_MINISTERIO       => V_MINISTERIO'||unistr('\000a')||
'                                    , P_RAZONSOCIAL      => V_RAZONSOCIAL'||unistr('\000a')||
'                                    , P_FUNCIONCATEGORIA => V_FUNCIONCATEGORIA'||unistr('\000a')||
'                                    , P_MOTIVO_ERROR     => V_MOTIVO_ERROR'||unistr('\000a')||
'                                      );'||unistr('\000a')||
'      --'||unistr('\000a')||
'      if V_RAZONSOCIAL is not null then'||unistr('\000a')||
'         return ''La Persona Ingresada ('' || V_RAZONSOCIAL || '') es Agente del Estado Provincial por lo que no puede ser Inscripta como proveedor del estado según el Artículo 3° Decreto N° 4248 – MHyOP-2013 Inciso A'';'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      --'||unistr('\000a')||
'      --return ''Entra por insc'';'||unistr('\000a')||
'      --'||unistr('\000a')||
'   else'||unistr('\000a')||
'      --'||unistr('\000a')||
'      for v_autoridades_reg in cr_autoridades_reg loop'||unistr('\000a')||
'         --'||unistr('\000a')||
'         V_NRO_DOC := trim( replace(replace(v_autoridades_reg.numero_documento,''-'',''''),'' '','''') );'||unistr('\000a')||
'         --'||unistr('\000a')||
'         if length(V_NRO_DOC) < 11 then'||unistr('\000a')||
'            --'||unistr('\000a')||
'            V_NRO_DOC := V_NRO_DOC||''0''; '||unistr('\000a')||
'            -- '||unistr('\000a')||
'            while length(V_NRO_DOC) < 11 loop'||unistr('\000a')||
'               --'||unistr('\000a')||
'               V_NRO_DOC := ''0''||V_NRO_DOC;'||unistr('\000a')||
'               --'||unistr('\000a')||
'            end loop;'||unistr('\000a')||
'            -- '||unistr('\000a')||
'         end if;'||unistr('\000a')||
'         --'||unistr('\000a')||
'         comprv_pkg.COMPRV_VLDR_AGENTE (P_SEGORG_ID         => :P1_SEGORG_ID'||unistr('\000a')||
'                                       , P_COMTPR_CUIT      => V_NRO_DOC'||unistr('\000a')||
'                                       , P_ESCALAFON        => V_ESCALAFON'||unistr('\000a')||
'                                       , P_PLANTA           => V_PLANTA'||unistr('\000a')||
'                                       , P_DEPENDENCIA      => V_DEPENDENCIA'||unistr('\000a')||
'                                       , P_MINISTERIO       => V_MINISTERIO'||unistr('\000a')||
'                                       , P_RAZONSOCIAL      => V_RAZONSOCIAL'||unistr('\000a')||
'                                       , P_FUNCIONCATEGORIA => V_FUNCIONCATEGORIA'||unistr('\000a')||
'                                       , P_MOTIVO_ERROR     => V_MOTIVO_ERROR'||unistr('\000a')||
'                                         );'||unistr('\000a')||
'         --'||unistr('\000a')||
'         if V_RAZONSOCIAL is not null then'||unistr('\000a')||
'         return ''La Persona Ingresada ('' || V_RAZONSOCIAL || '') es Agente del Estado Provincial por lo que no puede ser Inscripta como proveedor del estado según el Artículo 3° Decreto N° 4248 – MHyOP-2013 Inciso A'';'||unistr('\000a')||
'         end if;'||unistr('\000a')||
'      -- '||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   end if;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   return V_MOTIVO_ERROR;   '||unistr('\000a')||
'   --'||unistr('\000a')||
'end;   ');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 366798309029119250 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 211,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'falso',
  p_validation_sequence=> 20,
  p_validation => 'select 1 from dual where 1=2;',
  p_validation_type => 'EXISTS',
  p_error_message => 'reparado',
  p_always_execute=>'N',
  p_validation_condition_type=> 'NEVER',
  p_when_button_pressed=> 12220325652710555 + wwv_flow_api.g_id_offset,
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
'  v_comprv_id NUMBER;'||unistr('\000a')||
'  v_resultado VARCHAR2(2000);'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  --'||unistr('\000a')||
'  COM_PKG.COMTPR_ACEPTAR(p_comtpr_id => :P211_COMTPR_ID'||unistr('\000a')||
'                      ,p_comprv_id => v_comprv_id'||unistr('\000a')||
'                      ,p_resultado => v_resultado);'||unistr('\000a')||
'  --'||unistr('\000a')||
'  :P211_COMPRV_ID := v_comprv_id;'||unistr('\000a')||
'  :P211_RESULTADO := v_resultado;'||unistr('\000a')||
'  --'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 12220906684710555 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 211,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Aceptar Solicitud de Inscripción',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error al intentar generar el registro del proveedor.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>12220325652710555 + wwv_flow_api.g_id_offset,
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
'   :P211_TIPO_TRAMITE:= :P211_TIPO;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 366764229122557731 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 211,
  p_process_sequence=> 20,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'SET_TIPO_TRAMITE',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
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
 
---------------------------------------
-- ...updatable report columns for page 211
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
