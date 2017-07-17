set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end;
/
 
 
--application/set_environment
prompt  APPLICATION 2102 - Compras - Portal Proveedores
--
-- Application Export:
--   Application:     2102
--   Name:            Compras - Portal Proveedores
--   Date and Time:   16:43 Miércoles Noviembre 16, 2016
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
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,2102);
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
 
end;
/

PROMPT ...Remove page 200
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>200);
 
end;
/

 
--application/pages/page_00200
prompt  ...PAGE 200: Contrataciones - Detalle
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 200
 ,p_user_interface_id => 71209302842675 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'ADMINISTRACION'
 ,p_name => 'Contrataciones - Detalle'
 ,p_step_title => 'Contrataciones - Detalle'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Contrataciones - Detalle'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_footer_text => '<style>   '||unistr('\000a')||
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
'</style>  '||unistr('\000a')||
''||unistr('\000a')||
'<div id="AjaxLoading" style="display:none;">Se está consultando su situación Tributaria. Espere un momento por favor...<br />'||unistr('\000a')||
'   <img src="#IMAGE_PREFIX#processing3.gif" id="wait" />'||unistr('\000a')||
'</div> '
 ,p_autocomplete_on_off => 'ON'
 ,p_html_page_header => 
'<script language="JavaScript" type="text/javascript">'||unistr('\000a')||
'  htmldb_delete_message=''"ANULAR_CONFIRM_MSG"'';'||unistr('\000a')||
'  htmldb_cancel_message=''Se han cotizado Items con valor cero. Confirma que los proveerá en forma Gratuita ?'';'||unistr('\000a')||
'    '||unistr('\000a')||
'function html_Submit_Progress(pThis){   '||unistr('\000a')||
'  $x_Show(''AjaxLoading'');  '||unistr('\000a')||
'  $s("AjaxLoading",$x("AjaxLoading").innerHTML);'||unistr('\000a')||
'};'||unistr('\000a')||
'</script>'
 ,p_step_template => 2859022364748089 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'CTISSERA'
 ,p_last_upd_yyyymmddhh24miss => '20161116162923'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'14328408396634264';

wwv_flow_api.create_page_plug (
  p_id=> 5786317675638870 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 200,
  p_plug_name=> 'Menu de Accesos',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 2866205739748095+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 5,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 2,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 5786623347650040 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 2872830348748101+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => 'COM_PKG.OBTN_COMCON_ESTADO(p_comcon_id => :P200_COMCON_ID'||unistr('\000a')||
'                          ,p_comprv_id => :P1_COMPRV_ID) IN (''FINALIZADO S/ORDEN'',''ADJUDICADO C/ORDEN'')',
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
  p_id=> 20995737521280390 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 200,
  p_plug_name=> 'Detalle del Proceso',
  p_region_name=>'',
  p_region_attributes=> 'style="width:625px"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 2862618902748092+ wwv_flow_api.g_id_offset,
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
s:=s||'Select distinct id,comdoc_id, icono, tipo, documento'||unistr('\000a')||
'from'||unistr('\000a')||
'(select '||unistr('\000a')||
'  COMCOD.ID COMCOD_ID'||unistr('\000a')||
' ,COMCOD.COMCON_ID'||unistr('\000a')||
' ,COMCOD.COMDOC_ID'||unistr('\000a')||
' ,COMDOC.ID ID'||unistr('\000a')||
' ,COMDOC.COMDCT_ID'||unistr('\000a')||
' ,(case when INSTR(COMDOC.TIPO_ARCHIVO,''pdf'') > 0 then'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/download_pdf_32x24.gif">'''||unistr('\000a')||
'   when INSTR(COMDOC.TIPO_ARCHIVO,''excel'') > 0 then'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/download_csv_32x24.gif">'''||unistr('\000a')||
'   when INSTR(CO';

s:=s||'MDOC.TIPO_ARCHIVO,''oct'') > 0 then'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">'''||unistr('\000a')||
'   when INSTR(COMDOC.TIPO_ARCHIVO,''word'') > 0 then'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/download_rtf_32x24.gif">'''||unistr('\000a')||
'   when INSTR(COMDOC.TIPO_ARCHIVO,''plain'') > 0 then'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'   when INSTR(COMDOC.TIPO_ARCHIVO,''image'') > 0 then'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/chart_32x24.gif">';

s:=s||'''    '||unistr('\000a')||
'   else'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'   end) ICONO'||unistr('\000a')||
' ,(SELECT NOMBRE FROM COM_DOCUMENTOS_TIPOS WHERE ID = COMDOC.COMDCT_ID) TIPO'||unistr('\000a')||
' ,dbms_lob.getlength(COMDOC.DOCUMENTO) DOCUMENTO'||unistr('\000a')||
' ,COMDOC.NOMBRE_ARCHIVO'||unistr('\000a')||
' ,COMDOC.TIPO_ARCHIVO'||unistr('\000a')||
' ,COMCOD.FECHA'||unistr('\000a')||
'from COM_CONTRATACIONES_DOC COMCOD,'||unistr('\000a')||
'     COM_DOCUMENTOS  COMDOC'||unistr('\000a')||
'where COMCOD.COMDOC_ID = COMDOC.ID'||unistr('\000a')||
'  and COMCOD.COMCON_ID = :P200_C';

s:=s||'OMCON_ID'||unistr('\000a')||
'union all'||unistr('\000a')||
'select '||unistr('\000a')||
' COMPEC.ID COMPEC_ID'||unistr('\000a')||
' ,COMPEC.COMPED_ID'||unistr('\000a')||
' ,COMPEC.COMDOC_ID'||unistr('\000a')||
' ,COMDOC.ID ID'||unistr('\000a')||
' ,COMDOC.COMDCT_ID'||unistr('\000a')||
' ,(case when INSTR(COMDOC.TIPO_ARCHIVO,''pdf'') > 0 then'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/download_pdf_32x24.gif">'''||unistr('\000a')||
'   when INSTR(COMDOC.TIPO_ARCHIVO,''excel'') > 0 then'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/download_csv_32x24.gif">'''||unistr('\000a')||
'   when INSTR(COMDOC.TIPO_ARCHIVO,''oct'') > 0 then'||unistr('\000a')||
'    ''<i';

s:=s||'mg src="#IMAGE_PREFIX#ws/page_32x24.gif">'''||unistr('\000a')||
'   when INSTR(COMDOC.TIPO_ARCHIVO,''word'') > 0 then'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/download_rtf_32x24.gif">'''||unistr('\000a')||
'   when INSTR(COMDOC.TIPO_ARCHIVO,''plain'') > 0 then'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'   when INSTR(COMDOC.TIPO_ARCHIVO,''image'') > 0 then'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/chart_32x24.gif">''    '||unistr('\000a')||
'   else'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFI';

s:=s||'X#ws/page_32x24.gif">''    '||unistr('\000a')||
'   end) ICONO'||unistr('\000a')||
' ,(SELECT NOMBRE FROM COM_DOCUMENTOS_TIPOS WHERE ID = COMDOC.COMDCT_ID) TIPO'||unistr('\000a')||
' ,dbms_lob.getlength(COMDOC.DOCUMENTO) DOCUMENTO'||unistr('\000a')||
' ,COMDOC.NOMBRE_ARCHIVO'||unistr('\000a')||
' ,COMDOC.TIPO_ARCHIVO'||unistr('\000a')||
' ,COMPEC.FECHA'||unistr('\000a')||
'from COM_PEDIDOS_DOC COMPEC,'||unistr('\000a')||
'     COM_DOCUMENTOS  COMDOC'||unistr('\000a')||
'where COMPEC.COMDOC_ID = COMDOC.ID'||unistr('\000a')||
'  and COMPEC.COMPED_ID IN (SELECT COMPED_ID FROM COM_CONTRATACIONES_DETALLES'||unistr('\000a')||
'   ';

s:=s||'                        WHERE COMCON_ID = :P200_COMCON_ID)'||unistr('\000a')||
'union'||unistr('\000a')||
'select '||unistr('\000a')||
'  comctd.id comctd_id'||unistr('\000a')||
' ,comctd.id comcon_id'||unistr('\000a')||
' ,comdoc.id '||unistr('\000a')||
' ,COMDOC.ID ID'||unistr('\000a')||
' ,COMDOC.COMDCT_ID'||unistr('\000a')||
' ,(case '||unistr('\000a')||
'          when INSTR(comdoc.TIPO_ARCHIVO,''pdf'') > 0 then ''<img src="#IMAGE_PREFIX#ws/download_pdf_32x24.gif">'''||unistr('\000a')||
'          when INSTR(comdoc.TIPO_ARCHIVO,''excel'') > 0 then ''<img src="#IMAGE_PREFIX#ws/download_csv_32x24.gif">'''||unistr('\000a')||
'   ';

s:=s||'       when INSTR(comdoc.TIPO_ARCHIVO,''oct'') > 0 then ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">'''||unistr('\000a')||
'          when INSTR(comdoc.TIPO_ARCHIVO,''word'') > 0 then ''<img src="#IMAGE_PREFIX#ws/download_rtf_32x24.gif">'''||unistr('\000a')||
'          when INSTR(comdoc.TIPO_ARCHIVO,''plain'') > 0 then ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'          when INSTR(comdoc.TIPO_ARCHIVO,''image'') > 0 then ''<img src="#IMAGE_PR';

s:=s||'EFIX#ws/chart_32x24.gif">''    '||unistr('\000a')||
'          else'||unistr('\000a')||
'            ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'  end) ICONO'||unistr('\000a')||
' ,comctd.comdct_nombre tipo '||unistr('\000a')||
' ,dbms_lob.getlength(comdoc.DOCUMENTO) DOCUMENTO'||unistr('\000a')||
' ,comdoc.TIPO_ARCHIVO'||unistr('\000a')||
' ,comctd.comdct_nombre nombre'||unistr('\000a')||
' ,comctd.fecha_situacion fecha'||unistr('\000a')||
'  from com_contrataciones_tipdot_v comctd'||unistr('\000a')||
'      ,com_documentos comdoc'||unistr('\000a')||
' where comctd.COMCTT_ID = :P200_COMCTT_ID'||unistr('\000a')||
'   an';

s:=s||'d comdoc.comdct_id = comctd.comdct_id'||unistr('\000a')||
'   and comctd.situacion = ''HAB'')';

wwv_flow_api.create_report_region (
  p_id=> 20997636695280393 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 200,
  p_name=> 'Documentación Adjunta',
  p_region_name=>'',
  p_template=> 2866205739748095+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 20,
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 2,
  p_display_point=> 'REGION_POSITION_03',
  p_item_display_point=> 'BELOW',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> 'select 1'||unistr('\000a')||
'from COM_CONTRATACIONES_DOC COMCOD,'||unistr('\000a')||
'     COM_DOCUMENTOS  COMDOC'||unistr('\000a')||
'where COMCOD.COMDOC_ID = COMDOC.ID'||unistr('\000a')||
'  and COMCOD.COMCON_ID = :P200_COMCON_ID'||unistr('\000a')||
'union all'||unistr('\000a')||
'select 1'||unistr('\000a')||
'from COM_PEDIDOS_DOC COMPEC,'||unistr('\000a')||
'     COM_DOCUMENTOS  COMDOC'||unistr('\000a')||
'where COMPEC.COMDOC_ID = COMDOC.ID'||unistr('\000a')||
'  and COMPEC.COMPED_ID IN (SELECT COMPED_ID FROM COM_CONTRATACIONES_DETALLES'||unistr('\000a')||
'                           WHERE COMCON_ID = :P200_COMCON_ID)'||unistr('\000a')||
'union all'||unistr('\000a')||
'select 1'||unistr('\000a')||
'from COM_CONTRATACIONES_TIPDOT COMCTD,'||unistr('\000a')||
'     COM_DOCUMENTOS  COMDOC'||unistr('\000a')||
'where COMCTD.COMDCT_ID = COMDOC.COMDCT_ID'||unistr('\000a')||
'  AND COMCTD.COMCTT_ID = :P200_COMCTT_ID'||unistr('\000a')||
'  and COMCTD.SITUACION = ''HAB''',
  p_display_condition_type=> 'EXISTS',
  p_plug_caching=> 'NOT_CACHED',
  p_header=> '<font color="red">Sr. Proveedor: Recuerde abrir la documentación pues contiene información importante para realizar una adecuada oferta.</font><br>',
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
  p_query_no_data_found=> 'No se han adjuntado documentos.',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '99999',
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
  p_id=> 20998550721280395 + wwv_flow_api.g_id_offset,
  p_region_id=> 20997636695280393 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
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
  p_id=> 20998428090280395 + wwv_flow_api.g_id_offset,
  p_region_id=> 20997636695280393 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMDOC_ID',
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
  p_id=> 20998039571280395 + wwv_flow_api.g_id_offset,
  p_region_id=> 20997636695280393 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
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
  p_id=> 20998336498280395 + wwv_flow_api.g_id_offset,
  p_region_id=> 20997636695280393 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'TIPO',
  p_column_display_sequence=> 4,
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
  p_id=> 20998846221280395 + wwv_flow_api.g_id_offset,
  p_region_id=> 20997636695280393 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 5,
  p_column_heading=> '',
  p_column_format=> 'DOWNLOAD:COM_DOCUMENTOS:DOCUMENTO:ID::TIPO_ARCHIVO:NOMBRE_ARCHIVO:::attachment:Abrir Doc.',
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
s:=s||'SELECT comcon_id'||unistr('\000a')||
'      ,comped_id'||unistr('\000a')||
'      ,comcot_id'||unistr('\000a')||
'      ,renglon'||unistr('\000a')||
'      ,comccl_id'||unistr('\000a')||
'      ,comcit_id'||unistr('\000a')||
'      ,codigo'||unistr('\000a')||
'      ,descripcion||DECODE(observacion, '''', '''', '' OBS: ''||observacion) descripcion'||unistr('\000a')||
'      ,cantidad'||unistr('\000a')||
'      ,precio_unitario'||unistr('\000a')||
'      ,''$''||LTRIM(TO_CHAR(cantidad*precio_unitario,''999,999.99'')) precio_total'||unistr('\000a')||
'      ,observacion'||unistr('\000a')||
'FROM COM_CONTRATACIONES_DETPED_V'||unistr('\000a')||
'WHERE COMCON_ID = :P200_COMCON_ID';

s:=s||''||unistr('\000a')||
'order by renglon';

wwv_flow_api.create_report_region (
  p_id=> 21000830247280396 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 200,
  p_name=> '&P1_COMETQ_PRO. solicitados',
  p_region_name=>'',
  p_template=> 2862618902748092+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 40,
  p_region_attributes=>'style="width:80%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_1',
  p_item_display_point=> 'BELOW',
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
  p_comment=>'style="width:95%"');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21001044877280396 + wwv_flow_api.g_id_offset,
  p_region_id=> 21000830247280396 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMCON_ID',
  p_column_display_sequence=> 10,
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
  p_print_col_width=> '6',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21001230747280396 + wwv_flow_api.g_id_offset,
  p_region_id=> 21000830247280396 + wwv_flow_api.g_id_offset,
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
  p_print_col_width=> '6',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21001153272280396 + wwv_flow_api.g_id_offset,
  p_region_id=> 21000830247280396 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMCOT_ID',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Comcot Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '6',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21001334933280396 + wwv_flow_api.g_id_offset,
  p_region_id=> 21000830247280396 + wwv_flow_api.g_id_offset,
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
  p_print_col_width=> '6',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21001447559280396 + wwv_flow_api.g_id_offset,
  p_region_id=> 21000830247280396 + wwv_flow_api.g_id_offset,
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
  p_print_col_width=> '6',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21001547919280396 + wwv_flow_api.g_id_offset,
  p_region_id=> 21000830247280396 + wwv_flow_api.g_id_offset,
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
  p_print_col_width=> '6',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21001646979280396 + wwv_flow_api.g_id_offset,
  p_region_id=> 21000830247280396 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'CODIGO',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Código',
  p_column_alignment=>'CENTER',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '6',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21001746475280396 + wwv_flow_api.g_id_offset,
  p_region_id=> 21000830247280396 + wwv_flow_api.g_id_offset,
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
  p_print_col_width=> '6',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21001836551280396 + wwv_flow_api.g_id_offset,
  p_region_id=> 21000830247280396 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'CANTIDAD',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Cnt.Solicitada',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '6',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21001930784280396 + wwv_flow_api.g_id_offset,
  p_region_id=> 21000830247280396 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'PRECIO_UNITARIO',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Precio Test.Unit.',
  p_column_format=> 'FML999G999G999G999G990D00',
  p_column_css_style=>'font-weight: bold',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_display_when_condition=> 'P200_COMCTT_PRECIO_TESTIGO_SN',
  p_display_when_condition2=> 'SI',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '6',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21409131731344207 + wwv_flow_api.g_id_offset,
  p_region_id=> 21000830247280396 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'PRECIO_TOTAL',
  p_column_display_sequence=> 12,
  p_column_heading=> 'Precio Total Ref.',
  p_use_as_row_header=> 'N',
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
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '6',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21002053244280396 + wwv_flow_api.g_id_offset,
  p_region_id=> 21000830247280396 + wwv_flow_api.g_id_offset,
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
  p_print_col_width=> '6',
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
  p_id=> 21002344696280398 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 200,
  p_plug_name=> 'Ruta de Navegación',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 2861103529748090+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(51836110691216902 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 2875904658748101+ wwv_flow_api.g_id_offset,
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
s:=s||'SELECT  ''<img src="#IMAGE_PREFIX#ws/attach_32x24.gif">'' ICONO'||unistr('\000a')||
'       ,ID'||unistr('\000a')||
'       ,COMCON_ID'||unistr('\000a')||
'       ,COMPRV_ID'||unistr('\000a')||
'       ,CODIGO'||unistr('\000a')||
'       ,FECHA'||unistr('\000a')||
'       ,TO_CHAR(FECHA,''DD/MM/YYYY HH24:MI'')|| '' - ''||OBSERVACION OBSERVACION'||unistr('\000a')||
'       ,SITUACION'||unistr('\000a')||
'       ,''Ver Oferta'' ACCIONES'||unistr('\000a')||
'       ,DATE_CREATED'||unistr('\000a')||
'       ,CREATED_BY'||unistr('\000a')||
'       ,DATE_MODIFIED'||unistr('\000a')||
'       ,MODIFIED_BY '||unistr('\000a')||
'FROM COM_COTIZACIONES '||unistr('\000a')||
'WHERE COMCON_ID = :P200_COMCON_';

s:=s||'ID'||unistr('\000a')||
'  AND SITUACION NOT IN (''NUE'',''ANU'')'||unistr('\000a')||
'  AND COMPRV_ID = :P1_COMPRV_ID';

wwv_flow_api.create_report_region (
  p_id=> 21117035500467173 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 200,
  p_name=> 'Ofertas Presentadas',
  p_region_name=>'',
  p_template=> 2866205739748095+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 10,
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 2,
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
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> '<font color="red">No ha presentado Ofertas.</font><br><br>',
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
  p_id=> 21411330870381832 + wwv_flow_api.g_id_offset,
  p_region_id=> 21117035500467173 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
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
  p_id=> 21117348812467196 + wwv_flow_api.g_id_offset,
  p_region_id=> 21117035500467173 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
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
  p_id=> 21117540871467196 + wwv_flow_api.g_id_offset,
  p_region_id=> 21117035500467173 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMCON_ID',
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
  p_id=> 21117633031467196 + wwv_flow_api.g_id_offset,
  p_region_id=> 21117035500467173 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
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
  p_id=> 21117753465467196 + wwv_flow_api.g_id_offset,
  p_region_id=> 21117035500467173 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'CODIGO',
  p_column_display_sequence=> 6,
  p_column_heading=> '',
  p_column_link=>'f?p=&APP_ID.:201:&SESSION.::&DEBUG.::P201_ID:#ID#',
  p_column_linktext=>'#CODIGO#',
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
  p_id=> 21117830139467196 + wwv_flow_api.g_id_offset,
  p_region_id=> 21117035500467173 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA',
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
  p_id=> 21117951658467196 + wwv_flow_api.g_id_offset,
  p_region_id=> 21117035500467173 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'OBSERVACION',
  p_column_display_sequence=> 7,
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
  p_id=> 21118034837467196 + wwv_flow_api.g_id_offset,
  p_region_id=> 21117035500467173 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION',
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21411949702396706 + wwv_flow_api.g_id_offset,
  p_region_id=> 21117035500467173 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'ACCIONES',
  p_column_display_sequence=> 2,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ID.:201:&SESSION.::&DEBUG.:RP,201:P201_ID,P201_APP_ANTERIOR,P201_PAG_ANTERIOR:#ID#,&P200_APP_ANTERIOR.,&P200_PAG_ANTERIOR.',
  p_column_linktext=>'#ACCIONES#',
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
  p_id=> 21118130606467196 + wwv_flow_api.g_id_offset,
  p_region_id=> 21117035500467173 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'DATE_CREATED',
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
  p_id=> 21118231953467196 + wwv_flow_api.g_id_offset,
  p_region_id=> 21117035500467173 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'CREATED_BY',
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
  p_id=> 21118354166467196 + wwv_flow_api.g_id_offset,
  p_region_id=> 21117035500467173 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'DATE_MODIFIED',
  p_column_display_sequence=> 12,
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
  p_id=> 21118450395467196 + wwv_flow_api.g_id_offset,
  p_region_id=> 21117035500467173 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'MODIFIED_BY',
  p_column_display_sequence=> 13,
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 21213540506705168 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 200,
  p_plug_name=> 'Información de Auditoría',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 2862904472748093+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
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
s:=s||'SELECT COMCON_ID'||unistr('\000a')||
'      ,COMPED_ID'||unistr('\000a')||
'      ,COMPED_CODIGO'||unistr('\000a')||
'      ,COMPED_FECHA_SOLICITUD'||unistr('\000a')||
'      ,COMPED_COMECO_ID'||unistr('\000a')||
'      ,COMPED_COMCOB_ID'||unistr('\000a')||
'      ,COMPED_EJERCICIO'||unistr('\000a')||
'      ,''<b>''||COMPED_EXPEDIENTE||''</b>'' COMPED_EXPEDIENTE'||unistr('\000a')||
'      ,''<b>''||COMPED_CONTRATANTE||''</b>'' COMPED_CONTRATANTE'||unistr('\000a')||
'      ,''<b>''||COMPED_SOLICITANTE||''</b>'' COMPED_SOLICITANTE'||unistr('\000a')||
'      ,COMPED_CONTACTO'||unistr('\000a')||
'      ,''<b>''||COMPED_CONTRATANTE||''</b><br';

s:=s||'>''||COMPED_SOLICITANTE||''<br>''||'||unistr('\000a')||
'       COMPED_CONTACTO   COMPED_CONTRATANTE_DESC'||unistr('\000a')||
'      ,LTRIM(RTRIM(COMPED_DESCRIPCION)) COMPED_DESCRIPCION'||unistr('\000a')||
'      ,''<b>''||LTRIM(RTRIM(COMPED_OBSERVACIONES))||''</b>'' COMPED_OBSERVACIONES'||unistr('\000a')||
'      ,COMPED_TIPO_ENTREGA'||unistr('\000a')||
'      ,COMPED_PLAZO_ENTREGA_CANTIDAD'||unistr('\000a')||
'      ,COMPED_PLAZO_ENTREGA_UNIDAD'||unistr('\000a')||
'      ,COMPED_PERIODO_ENTREGA'||unistr('\000a')||
'      ,to_char(COMPED_FECHA_ENTREGA,''DD/MM/YYYY'') CO';

s:=s||'MPED_FECHA_ENTREGA'||unistr('\000a')||
'      ,COMPED_PRECIO'||unistr('\000a')||
'      ,COMPEE_ESTADO_DESC'||unistr('\000a')||
'      ,COMPED_COMDOM_ID'||unistr('\000a')||
'      ,(SELECT DECODE(LOCALIDAD,'''','''',LOCALIDAD||'', '')||'||unistr('\000a')||
'         DECODE(DEPARTAMENTO,'''','''',DEPARTAMENTO||'', '')|| PROVINCIA'||unistr('\000a')||
'        FROM COM_DOMICILIOS'||unistr('\000a')||
'        WHERE ID = COMPED_COMDOM_ID) COMPED_LOCALIDAD_ENTREGA'||unistr('\000a')||
'      ,(SELECT LTRIM(RTRIM(DECODE(CALLE,'''','''',CALLE||'' '')||'||unistr('\000a')||
'        DECODE(NUMERO_CASA,'''','''',''Nr';

s:=s||'o: ''||NUMERO_CASA||'' '')||'||unistr('\000a')||
'        DECODE(PISO,'''','''',''Piso: ''||PISO||'' '')||'||unistr('\000a')||
'        DECODE(DPTO,'''','''',''Dpto: ''||DPTO||'' '')||'||unistr('\000a')||
'        DECODE(OBSERVACION,'''','''',''(''||OBSERVACION||''). '')))  '||unistr('\000a')||
'       FROM COM_DOMICILIOS'||unistr('\000a')||
'       WHERE ID = COMPED_COMDOM_ID) COMPED_DOMICILIO_ENTREGA'||unistr('\000a')||
' FROM COM_CONTRATACIONES_DET_V'||unistr('\000a')||
'WHERE COMCON_ID = :P200_COMCON_ID';

wwv_flow_api.create_report_region (
  p_id=> 21334047316948313 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 200,
  p_name=> 'Información Adicional',
  p_region_name=>'',
  p_template=> 2862618902748092+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 20,
  p_region_attributes=>'style="width:625px"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_1',
  p_item_display_point=> 'BELOW',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 3,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '99999',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' -',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se ha encontrado ningún dato',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '99999',
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
  p_id=> 21339254074988085 + wwv_flow_api.g_id_offset,
  p_region_id=> 21334047316948313 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMCON_ID',
  p_column_display_sequence=> 19,
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
  p_id=> 21334329881948341 + wwv_flow_api.g_id_offset,
  p_region_id=> 21334047316948313 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_ID',
  p_column_display_sequence=> 20,
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
  p_id=> 21334443883948341 + wwv_flow_api.g_id_offset,
  p_region_id=> 21334047316948313 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_CODIGO',
  p_column_display_sequence=> 18,
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
  p_id=> 21334551051948341 + wwv_flow_api.g_id_offset,
  p_region_id=> 21334047316948313 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_FECHA_SOLICITUD',
  p_column_display_sequence=> 21,
  p_column_heading=> 'Fecha Solicitud',
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
  p_id=> 21334630558948341 + wwv_flow_api.g_id_offset,
  p_region_id=> 21334047316948313 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_COMECO_ID',
  p_column_display_sequence=> 22,
  p_column_heading=> 'Comeco Id',
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
  p_id=> 21334750848948341 + wwv_flow_api.g_id_offset,
  p_region_id=> 21334047316948313 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_COMCOB_ID',
  p_column_display_sequence=> 23,
  p_column_heading=> 'Comcob Id',
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
  p_id=> 21334838168948341 + wwv_flow_api.g_id_offset,
  p_region_id=> 21334047316948313 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_EJERCICIO',
  p_column_display_sequence=> 24,
  p_column_heading=> 'Ejercicio :',
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
  p_id=> 21336034321948341 + wwv_flow_api.g_id_offset,
  p_region_id=> 21334047316948313 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_EXPEDIENTE',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Expediente :',
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
  p_id=> 21334953288948341 + wwv_flow_api.g_id_offset,
  p_region_id=> 21334047316948313 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_CONTRATANTE',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Solicitante :',
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
  p_id=> 21335043561948341 + wwv_flow_api.g_id_offset,
  p_region_id=> 21334047316948313 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_SOLICITANTE',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Solicitante :',
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
  p_id=> 21335230105948341 + wwv_flow_api.g_id_offset,
  p_region_id=> 21334047316948313 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_CONTACTO',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Contacto :',
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
  p_id=> 21402231413221082 + wwv_flow_api.g_id_offset,
  p_region_id=> 21334047316948313 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_CONTRATANTE_DESC',
  p_column_display_sequence=> 13,
  p_column_heading=> 'Solicitante :',
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
  p_id=> 21335124911948341 + wwv_flow_api.g_id_offset,
  p_region_id=> 21334047316948313 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_DESCRIPCION',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Finalidad :',
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
  p_id=> 21336134642948341 + wwv_flow_api.g_id_offset,
  p_region_id=> 21334047316948313 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_OBSERVACIONES',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Destino :',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_condition=> 'COMPED_OBSERVACIONES',
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
  p_id=> 21335425122948341 + wwv_flow_api.g_id_offset,
  p_region_id=> 21334047316948313 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 15,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_TIPO_ENTREGA',
  p_column_display_sequence=> 12,
  p_column_heading=> 'COMPED_Tipo Entrega',
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
  p_id=> 21402337470221082 + wwv_flow_api.g_id_offset,
  p_region_id=> 21334047316948313 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 16,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_PLAZO_ENTREGA_CANTIDAD',
  p_column_display_sequence=> 16,
  p_column_heading=> 'Comped Plazo Entrega Cantidad',
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
  p_id=> 21402449407221082 + wwv_flow_api.g_id_offset,
  p_region_id=> 21334047316948313 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 17,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_PLAZO_ENTREGA_UNIDAD',
  p_column_display_sequence=> 17,
  p_column_heading=> 'Comped Plazo Entrega Unidad',
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
  p_id=> 21335849697948341 + wwv_flow_api.g_id_offset,
  p_region_id=> 21334047316948313 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 18,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_PERIODO_ENTREGA',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Periodo :',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_condition=> 'COMPED_PERIODO_ENTREGA',
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
  p_id=> 21335744107948341 + wwv_flow_api.g_id_offset,
  p_region_id=> 21334047316948313 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 19,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_FECHA_ENTREGA',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Fecha Entrega :',
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
  p_id=> 21335948482948341 + wwv_flow_api.g_id_offset,
  p_region_id=> 21334047316948313 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 20,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_PRECIO',
  p_column_display_sequence=> 14,
  p_column_heading=> 'Precio',
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
  p_id=> 21336254405948341 + wwv_flow_api.g_id_offset,
  p_region_id=> 21334047316948313 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 21,
  p_form_element_id=> null,
  p_column_alias=> 'COMPEE_ESTADO_DESC',
  p_column_display_sequence=> 15,
  p_column_heading=> 'Estado',
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
  p_id=> 21335345669948341 + wwv_flow_api.g_id_offset,
  p_region_id=> 21334047316948313 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 22,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_COMDOM_ID',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Comdom Id',
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
  p_id=> 21417246454103951 + wwv_flow_api.g_id_offset,
  p_region_id=> 21334047316948313 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 23,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_LOCALIDAD_ENTREGA',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Lugar de Entrega :',
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
  p_id=> 21402543424221082 + wwv_flow_api.g_id_offset,
  p_region_id=> 21334047316948313 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 24,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_DOMICILIO_ENTREGA',
  p_column_display_sequence=> 4,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_condition=> 'COMPED_DOMICILIO_ENTREGA',
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
s:=s||'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
'  if :P1_COMPRV_ESTADO in (''BAJ'',''SUS'') then'||unistr('\000a')||
'     htp.print(''<font color=RED><b>ADVERTENCIA:</b><br>Sr. Proveedor usted se encuentra <b>''||:P1_COMPRV_ESTADO_ABR||''</b> por "''||:P1_COMPRV_ESTADO_MOTIVO||''" no pudiendo operar en su registro, debe contactarse con el Registro de Proveedores del Estado para más información.<br>'');'||unistr('\000a')||
'     htp.print(:P1_COMPRV_ESTADO_ABR||'' desde ''||:P1_COMPRV_E';

s:=s||'STADO_FECHA_VIG); '||unistr('\000a')||
'     if :P1_COMPRV_ESTADO_MOTIVO = ''SUS'' then'||unistr('\000a')||
'        htp.print('' hasta ''||:P1_COMPRV_ESTADO_FECHA_VAL); '||unistr('\000a')||
'     end if;'||unistr('\000a')||
'  else   '||unistr('\000a')||
'  if :P200_ADEUDA_DOCUMENTACION_SN = ''SI'' then'||unistr('\000a')||
'      if :P200_ADVERTIR_COTIZAR_SN = ''SI'' and :P200_BLOQUEAR_COTIZAR_SN = ''NO'' then'||unistr('\000a')||
'       htp.print(''<font color=RED><b>ADVERTENCIA:</b><br>Tiene Documentación Vencida y/o No Presentada y es Necesaria par';

s:=s||'a Cotizar. Recuerde que si no presenta esta documentación no podrá COTIZAR este tipo de llamados. Ingrese a su Registro e incorpórela en forma online presentando el original en Compras en caso de ser necesario.</font><br>'');'||unistr('\000a')||
'        elsif :P200_BLOQUEAR_COTIZAR_SN = ''SI'' then'||unistr('\000a')||
'         htp.print(''<font color=RED>ATENCION:<br>Tiene Documentación Vencida y/o No Presentada y es Necesaria para Cotizar.';

s:=s||' Recuerde que si no presenta esta documentación no será invitado a futuros llamados de este tipo. Ingrese a su Registro e incoporela en forma online presentando el original en Compras en caso de ser necesario.</font><br>'');'||unistr('\000a')||
'       end if;  '||unistr('\000a')||
'       --'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    if :P1_ADEUDA_DPIP_SN = ''SI'' then'||unistr('\000a')||
'                 htp.print(''<br><font color=RED><br><b>Consulta en linea DPIP:</b> Ud regist';

s:=s||'ra deuda vencida en Dirección Provincial de Ingresos Públicos. Regularice esta situación para poder cotizar.</font><br><br>'');        '||unistr('\000a')||
'                 '||unistr('\000a')||
'    else	'||unistr('\000a')||
'     -- '||unistr('\000a')||
'      if COMPRV_PKG.COMPRV_RUBRO_SITUACION(p_comprv_id => :P1_COMPRV_ID'||unistr('\000a')||
'                                          ,p_comcon_id =>to_number(:P200_COMCON_ID)) = ''NO INSCRIPTO'' then'||unistr('\000a')||
'           htp.print(''<br><font color=RED><b>ATEN';

s:=s||'CION:</b> Ud no se encuentra Inscripto en la Especialidad o se ha DADO DE BAJA en la misma luego del inicio del llamado a cotizar. Regularice esta situación para poder cotizar.</font></br></br>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'/*      if :P200_RUBRO_HABILITADO_SN = ''SI'' then'||unistr('\000a')||
'        htp.print(''<span style="color:red">Usted ya no se encuentra inscripto en el rubro de este proceso por haberse dado de baja del mismo';

s:=s||'. No se permite realizar cotización por dado motivo</span></br></br>'');'||unistr('\000a')||
'      end if;*/'||unistr('\000a')||
'    --'||unistr('\000a')||
'      if :P200_AUTORIDADES_VIGENTES_SN = ''NO'' then'||unistr('\000a')||
'        htp.print(''<font color=RED><b>ATENCION:</b><br>Tiene Autoridades con Documentación Vencida y es necesaria para Cotizar. Recuerde que si no presenta esta documentación no podrá COTIZAR este tipo de llamados. Ingrese a su Registro e incorpórela en ';

s:=s||'forma online presentando el original en Compras en caso de ser necesario.</font><br><br>'');        '||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end if;  '||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 31772907909236839 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 200,
  p_plug_name=> 'Avisos Importantes',
  p_region_name=>'',
  p_region_attributes=> 'style="width:625px"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 2863228104748093+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_new_grid         => true,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'FUNCTION_BODY',
  p_plug_display_when_condition => 'if :P1_COMPRV_ESTADO in (''BAJ'',''SUS'') '||unistr('\000a')||
'  or :P200_ADEUDA_DOCUMENTACION_SN = ''SI'''||unistr('\000a')||
'  or :P1_ADEUDA_DPIP_SN = ''SI'''||unistr('\000a')||
'  or COMPRV_PKG.COMPRV_RUBRO_SITUACION(p_comprv_id => :P1_COMPRV_ID'||unistr('\000a')||
'                                      ,p_comcon_id =>to_number(:P200_COMCON_ID)) = ''NO INSCRIPTO'' then'||unistr('\000a')||
'   return TRUE;'||unistr('\000a')||
'else'||unistr('\000a')||
'   return false;'||unistr('\000a')||
'end if;',
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
'	cursor cr_comprt is'||unistr('\000a')||
'    select *'||unistr('\000a')||
'    from com_proveedores_tipos'||unistr('\000a')||
'    where id = :P1_COMPRT_ID;'||unistr('\000a')||
'--'||unistr('\000a')||
'v_comprt cr_comprt%rowtype;'||unistr('\000a')||
'--'||unistr('\000a')||
'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
'  open cr_comprt;'||unistr('\000a')||
'  fetch cr_comprt into v_comprt;'||unistr('\000a')||
'  close cr_comprt;'||unistr('\000a')||
'  --'||unistr('\000a')||
''||unistr('\000a')||
'    if v_comprt.codigo = ''JUR'' and :P200_FECHA_LIMITE >= TRUNC(SYSDATE) then'||unistr('\000a')||
'    htp.print(''<b><font color=RED>ATENCION:<br>Se comunica a las personas jurídicas inscriptas en e';

s:=s||'l Registro de Proveedores del Estado que está disponible un nuevo módulo de Registro de autoridades para mejorar la presentación de la documentación requerida hasta el momento e incorporar nueva información relevante para el registro. Se informa que tendrán hasta el día ''||:P200_FECHA_LIMITE ||'' para completar la misma, posterior a esa fecha será obligatorio y necesario para cotizar.<br> Tutorial ';

s:=s||'disponible en su portal en  Mi Registro – Capítulo 19. <br>Ante cualquier consulta comunicarse de 8 a 14hs con el Registro de Proveedores del Estado 2664452010 interno 3149/3154.<br>Saludos cordiales</b><br><br>'');'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    '||unistr('\000a')||
''||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 51110129681258625 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 200,
  p_plug_name=> 'Avisos Importantes',
  p_region_name=>'',
  p_region_attributes=> 'style="width:625px"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 2863228104748093+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 5,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'FUNCTION_BODY',
  p_plug_display_when_condition => 'declare'||unistr('\000a')||
'	cursor cr_comprt is'||unistr('\000a')||
'    select *'||unistr('\000a')||
'    from com_proveedores_tipos'||unistr('\000a')||
'    where id = :P1_COMPRT_ID;'||unistr('\000a')||
'--'||unistr('\000a')||
'v_comprt cr_comprt%rowtype;'||unistr('\000a')||
'--'||unistr('\000a')||
'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
'  open cr_comprt;'||unistr('\000a')||
'  fetch cr_comprt into v_comprt;'||unistr('\000a')||
'  close cr_comprt;'||unistr('\000a')||
'  --'||unistr('\000a')||
' if SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo => ''COMADM_COMPRV_COMPRA_HABILITADO_SN'','||unistr('\000a')||
'                                 p_segorg_id => SEG_PKG.OBTN_ORGUSU(nvl(v(''APP_USER''),user)) ) = ''NO'' then '||unistr('\000a')||
'    return false;'||unistr('\000a')||
' else '||unistr('\000a')||
'    if v_comprt.codigo = ''JUR'' and :P200_FECHA_LIMITE >= TRUNC(SYSDATE) then'||unistr('\000a')||
'      return true;'||unistr('\000a')||
'    else '||unistr('\000a')||
'      return false;'||unistr('\000a')||
'   end if;'||unistr('\000a')||
' end if;'||unistr('\000a')||
'end;',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 19799604803878357 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 200,
  p_button_sequence=> 60,
  p_button_plug_id => 21117035500467173+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREAR_COTIZACION2',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(2875100477748101+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Presentar Oferta',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'DECLARE'||unistr('\000a')||
' V_RETORNO BOOLEAN := FALSE;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
' IF :P1_COMPRV_ESTADO in (''SUS'',''BAJ'') THEN'||unistr('\000a')||
'    --'||unistr('\000a')||
'    V_RETORNO := FALSE;'||unistr('\000a')||
'    --'||unistr('\000a')||
' ELSE'||unistr('\000a')||
'  --'||unistr('\000a')||
'  IF COM_PKG.OBTN_COMCON_ESTADO(p_comcon_id => :P200_COMCON_ID'||unistr('\000a')||
'                               ,p_comprv_id => :P1_COMPRV_ID) = ''ABIERTO'' THEN'||unistr('\000a')||
'   --                              '||unistr('\000a')||
'   V_RETORNO := TRUE;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   IF (:P200_PUEDE_COTIZAR_SN = ''NO'' AND  :P200_BLOQUEAR_COTIZAR_SN = ''SI'') or :P1_ADEUDA_DPIP_SN = ''SI''  THEN '||unistr('\000a')||
'    --'||unistr('\000a')||
'    V_RETORNO := FALSE;'||unistr('\000a')||
'    --'||unistr('\000a')||
'   END IF;'||unistr('\000a')||
'   --'||unistr('\000a')||
'  END IF; '||unistr('\000a')||
'  --'||unistr('\000a')||
' END IF;'||unistr('\000a')||
' --'||unistr('\000a')||
' RETURN V_RETORNO;'||unistr('\000a')||
' --'||unistr('\000a')||
'END;',
  p_button_condition_type=> 'FUNCTION_BODY',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 21003244633280412 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 200,
  p_button_sequence=> 10,
  p_button_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_button_name    => 'Cancelar',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(2875100477748101+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cerrar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:close();',
  p_button_execute_validations=>'Y',
  p_button_condition=> ':P200_APP_ANTERIOR IS NULL AND :G_APP_ANTERIOR IS NULL',
  p_button_condition_type=> 'PLSQL_EXPRESSION',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 5220953292630182 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 200,
  p_button_sequence=> 20,
  p_button_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_button_name    => 'Cancelar2',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(2875100477748101+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Retornar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&P200_APP_ANTERIOR.:&P200_PAG_ANTERIOR.:&SESSION.',
  p_button_condition=> 'P200_APP_ANTERIOR',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 56492903722412717 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 200,
  p_button_sequence=> 70,
  p_button_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_button_name    => 'Cancelar3',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(2875100477748101+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Retornar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&G_APP_ANTERIOR.:&G_APP_ANTERIOR_PAG.:&SESSION.',
  p_button_execute_validations=>'Y',
  p_button_condition=> ':P200_APP_ANTERIOR IS NULL AND :G_APP_ANTERIOR IS NOT NULL',
  p_button_condition_type=> 'PLSQL_EXPRESSION',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>19801725888929298 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:201:&SESSION.::&DEBUG.:RP,201:P201_APP_ANTERIOR,P201_PAG_ANTERIOR:&P200_APP_ANTERIOR.,&P200_PAG_ANTERIOR.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>19799604803878357+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>21557053714780891 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 30,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 05-MAY-2009 13:28 by FVALLEJO');
 
wwv_flow_api.create_page_branch(
  p_id=>62236925995151570 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_branch_name=> 'Refrescar',
  p_branch_action=> 'f?p=&APP_ID.:200:&SESSION.::&DEBUG.::P200_REFRESCAR_SN:NO',
  p_branch_point=> 'BEFORE_HEADER',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 40,
  p_branch_condition_type=> 'PLSQL_EXPRESSION',
  p_branch_condition=> ':P200_REFRESCAR_SN = ''SI''',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>5212954416611598 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_APP_ANTERIOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 400,
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
  p_field_template=> 2874826071748101+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>5214929613613871 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_PAG_ANTERIOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 410,
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
  p_field_template=> 2874826071748101+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>9102125095672241 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_MUESTRO_MSJ_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 420,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Muestra Msj Sn',
  p_post_element_text=>'<SCRIPT LANGUAGE="JavaScript">'||unistr('\000a')||
'<!--//'||unistr('\000a')||
'if ("&P200_MUESTRO_MSJ_SN."=="SI") {'||unistr('\000a')||
'  javascript:popupURL(''f?p=&APP_ID.:105:&SESSION.::NO::P105_COMCTT_ID,P105_COMCON_ID:&P200_COMCTT_ID.,&P200_COMCON_ID.'',1000,700 );'||unistr('\000a')||
'}'||unistr('\000a')||
'//-->'||unistr('\000a')||
'</script>',
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
  p_field_template=> 2874826071748101+wwv_flow_api.g_id_offset,
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
  p_id=>20684900431436864 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_FECHA_FIN_ACLARACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 225,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
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
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id=>21004051482280412 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_CONSULTAS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Consultas :',
  p_source=>'CONSULTAS',
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
  p_field_alignment=> 'LEFT',
  p_display_when=>'P200_COMCON_CONSULTAS',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'style="font-weight:bold;"',
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id=>21004225830280413 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_FECHA_LIMITE_PREGUNTA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 200,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Limite de Preguntas :',
  p_format_mask=>'DD/MM/YYYY HH24:MI',
  p_source=>'COMCON_FECHA_LIMITE_PREGUNTA',
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
  p_display_when=>'P1_SEGORG_CODIGO',
  p_display_when2=>'PCYCSL',
  p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id=>21004654136280413 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_PLAZO_ENTREGA_DIAS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Plazo de Entrega :',
  p_post_element_text=>' DIAS',
  p_source=>'PLAZO_ENTREGA_DIAS',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
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
  p_display_when=>'P200_COMCON_PLAZO_ENTREGA_DIAS',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_read_only_when=>'P200_COMCON_PLAZO_ENTREGA_DIAS',
  p_read_only_when_type=>'ITEM_IS_NOT_NULL',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id=>21004828212280413 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_METODO_ADJUDICACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Metodo de Adjudicación:',
  p_source=>'METODO_ADJUDICACION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 3,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id=>21005053013280415 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_OBSERVACIONES',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 90,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Observaciones :',
  p_source=>'OBSERVACIONES',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 3,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P200_COMCON_OBSERVACIONES',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>21005240438280415 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_PROCESO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '&P200_COMCTT_NOMBRE.  : &P200_CODIGO.',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Proceso :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 100,
  p_cMaxlength=> 2000,
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
  p_read_only_disp_attr=>'span style="font-weight:bold;color:red;"',
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id=>21005450439280415 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_FECHA_APERTURA_PROPUESTA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 230,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Apertura de la Propuesta :',
  p_format_mask=>'DD/MM/YYYY HH24:MI',
  p_source=>'COMCON_FECHA_APERTURA_PRO',
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
  p_display_when=>'P1_SEGORG_CODIGO',
  p_display_when2=>'PCYCSL',
  p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id=>21005651433280415 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_VIGENCIA_OFERTA_DIAS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Vigencia de la Oferta :',
  p_post_element_text=>' DIAS',
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
  p_display_when=>'P200_COMCON_VIGENCIA_OFERTA_DIAS',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id=>21006052446280416 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_FORMA_PAGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
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
  p_display_when=>'P200_COMCON_FORMA_PAGO',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'style="font-weight:bold;"',
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id=>21006223159280416 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_MONTO_PRESUPUESTO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Monto Presupuestado :',
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
  p_display_when=>'P1_SEGORG_CODIGO',
  p_display_when2=>'PCYCSL',
  p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id=>21006432061280416 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_OBJETO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Objeto :',
  p_source=>'OBJETO',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
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
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P1_SEGORG_CODIGO',
  p_display_when2=>'PCYCSL',
  p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id=>21006648580280416 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_FECHA_INICIO_PROPUESTA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 210,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Inicio de Ofertas :',
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
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id=>21006836536280416 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_FECHA_FIN_PROPUESTA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 220,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Cierre de Ofertas :',
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
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id=>21007050754280416 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_FECHA_PUBLICACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 199,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Publicación :',
  p_format_mask=>'DD/MM/YYYY HH24:MI',
  p_source=>'COMCON_FECHA_PUBLICACION',
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
  p_display_when=>'P1_SEGORG_CODIGO',
  p_display_when2=>'PCYCSL',
  p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id=>21007238420280416 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_FECHA_ESTIMADA_ADJUDICACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 250,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Adjudicación :',
  p_format_mask=>'DD/MM/YYYY HH24:MI',
  p_source=>'COMCON_FECHA_ESTIMADA_ADJ',
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
  p_display_when=>'P1_SEGORG_CODIGO',
  p_display_when2=>'PCYCSL',
  p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id=>21008433038280416 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_FECHA_INICIO_EVALUACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 240,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Inicio de la Evaluación :',
  p_format_mask=>'DD/MM/YYYY HH24:MI',
  p_source=>'COMCON_FECHA_INICIO_EVA',
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
  p_display_when=>'P1_SEGORG_CODIGO',
  p_display_when2=>'PCYCSL',
  p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id=>21008845214280418 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_COMCOE_MOTIVO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 110,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Motivo :',
  p_source=>'COMCOE_MOTIVO',
  p_source_type=> 'DB_COLUMN',
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
  p_display_when=>'P200_MOTIVO',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>21009249148280420 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_ESPACIO_BLANCO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 115,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'<b>Fechas de :</b><br>',
  p_pre_element_text=>'<br>',
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
  p_display_when=>'P1_SEGORG_CODIGO',
  p_display_when2=>'PCYCSL',
  p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2',
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id=>21214346591705198 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_COMCON_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 2,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Id',
  p_source=>'ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
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
  p_field_template=> 2874826071748101+wwv_flow_api.g_id_offset,
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
  p_id=>21214950328705204 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_OBSERVACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 255,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Observación :',
  p_source=>'OBSERVACION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 2000,
  p_cHeight=> 4,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P200_OBSERVACION',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_read_only_when_type=>'ALWAYS',
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id=>21215130004705204 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_DATE_CREATED',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 301,
  p_item_plug_id => 21213540506705168+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
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
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id=>21215329024705204 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_DATE_MODIFIED',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 303,
  p_item_plug_id => 21213540506705168+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
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
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id=>21215540265705204 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_CREATED_BY',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 302,
  p_item_plug_id => 21213540506705168+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Creado por :',
  p_source=>'CREATED_BY',
  p_source_type=> 'DB_COLUMN',
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
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id=>21215735060705204 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_MODIFIED_BY',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 304,
  p_item_plug_id => 21213540506705168+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Actualizado por :',
  p_source=>'MODIFIED_BY',
  p_source_type=> 'DB_COLUMN',
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
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id=>21222554252705209 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_COMCTT_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 5,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comcon Comctt Id',
  p_source=>'COMCTT_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
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
  p_field_template=> 2874826071748101+wwv_flow_api.g_id_offset,
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
  p_id=>21222737529705209 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 4,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comcon Codigo',
  p_source=>'CODIGO',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 100,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 2874826071748101+wwv_flow_api.g_id_offset,
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
  p_id=>21226747667705212 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_COMCTT_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 5,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comctt Nombre',
  p_source=>'COMCTT_NOMBRE',
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
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 2874826071748101+wwv_flow_api.g_id_offset,
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
  p_id=>21228538300705213 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_COMCOE_ESTADO_DESC',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 260,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Estado actual :',
  p_source=>'COM_PKG.OBTN_COMCON_ESTADO(p_comcon_id => :P200_COMCON_ID'||unistr('\000a')||
'                          ,p_comprv_id => :P1_COMPRV_ID);',
  p_source_type=> 'FUNCTION',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 240,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id=>22009750221778116 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_COMCTT_PRECIO_TESTIGO_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 7,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comcon Comctt Id',
  p_source=>'COMCTT_PRECIO_TESTIGO_SN',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
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
  p_field_template=> 2874826071748101+wwv_flow_api.g_id_offset,
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
  p_id=>32580718514093568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_BLOQUEAR_COTIZAR_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 440,
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
  p_id=>32581803621115634 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_ADVERTIR_COTIZAR_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 450,
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
  p_id=>32582227978119504 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_ADEUDA_DOCUMENTACION_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 460,
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
  p_id=>32585813418262990 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_CONTROLA_DPIP_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 470,
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
  p_id=>32587411236294392 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_DPIP_CONTROLADO_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 480,
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
  p_id=>42239601755436576 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_PUEDE_COTIZAR_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 490,
  p_item_plug_id => 31772907909236839+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Puede Cotizar Sn',
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
  p_field_template=> 2874826071748101+wwv_flow_api.g_id_offset,
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
  p_id=>51086224911761901 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_AUTORIDADES_VIGENTES_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 500,
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
  p_id=>51101906319949651 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_FECHA_LIMITE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 510,
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
  p_id=>51106819885763842 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_AAA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 520,
  p_item_plug_id => 21000830247280396+wwv_flow_api.g_id_offset,
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
  p_id=>52026617127495468 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_RUBRO_HABILITADO_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 530,
  p_item_plug_id => 31772907909236839+wwv_flow_api.g_id_offset,
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
  p_id=>62236413715142012 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_REFRESCAR_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 540,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'NO',
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
  p_id=>365112315553410215 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_COMCOE_FECHA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 112,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha Estado :',
  p_source=>'COMCOE_FECHA',
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
  p_colspan=> 3,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id=>365116300180493307 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 200,
  p_name=>'P200_SEGORG_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 550,
  p_item_plug_id => 20995737521280390+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Organizacion :',
  p_source=>'SEGORG_ID',
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
  p_colspan=> 3,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id => 19799123134869828 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 200,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Validar Adeuda DPIP',
  p_validation_sequence=> 10,
  p_validation => 'begin'||unistr('\000a')||
'  if :P1_ADEUDA_DPIP_SN = ''SI'' then'||unistr('\000a')||
'    return ''No es posible Cotizar, presenta deuda en DPIP'';'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  return null;'||unistr('\000a')||
'end;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => '',
  p_always_execute=>'N',
  p_when_button_pressed=> 19799604803878357 + wwv_flow_api.g_id_offset,
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
p:=p||'#OWNER#:COM_CONTRATACIONES_V:P200_COMCON_ID:ID';

wwv_flow_api.create_page_process(
  p_id     => 21009448286280421 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 200,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from COM_CONTRATACIONES',
  p_process_sql_clob => p,
  p_process_error_message=> 'No se ha podido recuperar la fila de la contratación.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_return_key_into_item1=>'P200_COMCON_ID',
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
p:=p||':P201_APP_ANTERIOR := :P200_APP_ANTERIOR;'||unistr('\000a')||
':P201_PAG_ANTERIOR := :P200_PAG_ANTERIOR;';

wwv_flow_api.create_page_process(
  p_id     => 5366826345502448 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 200,
  p_process_sequence=> 40,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Asignar Pagina Anterior',
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
'  IF :P200_MUESTRO_MSJ_SN = ''SI'' THEN'||unistr('\000a')||
'    :P200_MUESTRO_MSJ_SN := COM_PKG.OBTN_MUESTRO_MSJ_SN(p_comcon_id => :P200_COMCON_ID,p_comprv_id => :P1_COMPRV_ID);'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 9102347174697509 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 200,
  p_process_sequence=> 100,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Verificar despliegue de mensaje',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'Y',
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
p:=p||'32491727207558057';

wwv_flow_api.create_page_process(
  p_id     => 32494414814689987 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 200,
  p_process_sequence=> 120,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'Consultar estado DPIP',
  p_process_sql_clob => 32491727207558057 + wwv_flow_api.g_id_offset,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'BEGIN'||unistr('\000a')||
'  IF COM_PKG.OBTN_COMCON_ESTADO'||unistr('\000a')||
'       (p_comcon_id => :P200_COMCON_ID'||unistr('\000a')||
'       ,p_comprv_id => :P1_COMPRV_ID) = ''ABIERTO''  and'||unistr('\000a')||
'(SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => ''COMPRV_SRVINT_DPIP_HABILITADO_SN'''||unistr('\000a')||
'                        , P_SEGORG_ID => :P1_SEGORG_ID) = ''SI'''||unistr('\000a')||
')   '||unistr('\000a')||
'  THEN'||unistr('\000a')||
'    IF :P1_COMPRV_ESTADO in (''SUS'',''BAJ'') THEN'||unistr('\000a')||
'      RETURN FALSE;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    RETURN TRUE;'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'    RETURN FALSE;'||unistr('\000a')||
'  END IF;  '||unistr('\000a')||
'END;',
  p_process_when_type=>'FUNCTION_BODY',
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
p:=p||'32502820141297084';

wwv_flow_api.create_page_process(
  p_id     => 32588916729322671 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 200,
  p_process_sequence=> 200,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'Cargar Variables Control Cotizar',
  p_process_sql_clob => 32502820141297084 + wwv_flow_api.g_id_offset,
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
-- ...updatable report columns for page 200
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
