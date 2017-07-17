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
--   Date and Time:   14:01 Lunes Octubre 24, 2016
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

PROMPT ...Remove page 694
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>694);
 
end;
/

 
--application/pages/page_00694
prompt  ...PAGE 694: Documento de Proveedor
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 694
 ,p_user_interface_id => 70527406842675 + wwv_flow_api.g_id_offset
 ,p_name => 'Documento de Proveedor'
 ,p_step_title => 'Documento de Proveedor'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_javascript_code => 
'   function reload(tdoc_id) {'||unistr('\000a')||
'      //alert(tdoc_id);'||unistr('\000a')||
'      doSubmit(''reload'');'||unistr('\000a')||
'   }'||unistr('\000a')||
'   function setValueDateVenc(fecval) {'||unistr('\000a')||
'      //alert(fecval);'||unistr('\000a')||
'      //document.getElementById(''P694_FECHA_EMISION'').innerText = fecval;'||unistr('\000a')||
'      //document.getElementById(''P694_FECHA_EMISION'').value     = fecval;'||unistr('\000a')||
'   }'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'  function getfileextension(inputId) { '||unistr('\000a')||
'    var fileinput = document.getElementById("P694_DOCUMENT'||
'O"); '||unistr('\000a')||
'    if(!fileinput ) return ""; '||unistr('\000a')||
'    var filename = fileinput.value; '||unistr('\000a')||
'    if( filename.length == 0 ) return ""; '||unistr('\000a')||
'    var dot = filename.lastIndexOf("."); '||unistr('\000a')||
'    '||unistr('\000a')||
'    var extension = filename.substr(dot,filename.length); '||unistr('\000a')||
'    return extension; '||unistr('\000a')||
'  } '||unistr('\000a')||
''||unistr('\000a')||
'  function checkfileType() {     '||unistr('\000a')||
'    var ext = getfileextension(); '||unistr('\000a')||
'    ext = ext.toUpperCase();      '||unistr('\000a')||
'    //var allowedExt = document.getElementB'||
'yId("P202_DOCDOC_EXTENSIONES"); '||unistr('\000a')||
'    //if(!allowedExt ) return ""; 	'||unistr('\000a')||
'    //allowedExt = allowedExt.value.toUpperCase();                '||unistr('\000a')||
'    //if( allowedExt != "" ) {'||unistr('\000a')||
'      if( ext != ''.PDF'' ) {'||unistr('\000a')||
'        alert(''Recuerde: Solo se permiten archivos con extensión .PDF''); '||unistr('\000a')||
'      }'||unistr('\000a')||
'    //}else{'||unistr('\000a')||
'    //    return "";'||unistr('\000a')||
'    //}	'||unistr('\000a')||
'  }  '||unistr('\000a')||
''||unistr('\000a')||
'  function traerNombre(pThis, pThat){'||unistr('\000a')||
'    var filename = html_GetElement('||
'pThis).value;'||unistr('\000a')||
'    var barra = filename.lastIndexOf("\\");'||unistr('\000a')||
'    var punto = filename.lastIndexOf("."); '||unistr('\000a')||
'    '||unistr('\000a')||
'    if( punto == -1 ) {'||unistr('\000a')||
'      punto = filename.length;           '||unistr('\000a')||
'    }'||unistr('\000a')||
'    '||unistr('\000a')||
'    if( filename == "" ) {'||unistr('\000a')||
'      html_GetElement(pThat).value = "";     '||unistr('\000a')||
'      return "";'||unistr('\000a')||
'    }'||unistr('\000a')||
''||unistr('\000a')||
'    if(barra != -1){'||unistr('\000a')||
'      html_GetElement(pThat).value = filename.substr((barra+1),((punto-barra)-1));     '||unistr('\000a')||
'    }else{'||
''||unistr('\000a')||
'      html_GetElement(pThat).value = filename.substr(0,punto);    '||unistr('\000a')||
'    }     '||unistr('\000a')||
'    '||unistr('\000a')||
'  }   '
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'CTISSERA'
 ,p_last_upd_yyyymmddhh24miss => '20161024114022'
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
  p_id=> 14793404554939895 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 694,
  p_plug_name=> 'Datos de Documento',
  p_region_name=>'',
  p_region_attributes=> 'style="width:700px;"',
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
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 14798229421939953 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 694,
  p_plug_name=> 'Ruta de Navegación',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142026170261227095+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 14959725250524573 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 694,
  p_plug_name=> 'Pasos',
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
  p_plug_source_type=> 14958631999488648 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 142039054754227113+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
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
  p_id=> 15259724364038082 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 694,
  p_plug_name=> 'Datos del &P1_COMETQ_PRVS.',
  p_region_name=>'',
  p_region_attributes=> 'style="width:700px;"',
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
s:=s||'select	 ID,'||unistr('\000a')||
'         COMPRV_ID,'||unistr('\000a')||
'	 FECHA_EMISION,'||unistr('\000a')||
'	 FECHA_VENCIMIENTO,'||unistr('\000a')||
'	 FECHA_PRESENTACION,'||unistr('\000a')||
'	 COMENTARIO,'||unistr('\000a')||
'	 SITUACION,'||unistr('\000a')||
'            dbms_lob.getlength(DOCUMENTO) DOCUMENTO,'||unistr('\000a')||
'	 FILENAME,'||unistr('\000a')||
'	 MIMETYPE,'||unistr('\000a')||
'	 LAST_UPDATE_DATE,'||unistr('\000a')||
'	 SITUACION_ABR,'||unistr('\000a')||
'	 MOTIVO_SITUACION,'||unistr('\000a')||
'	 DATE_CREATED,'||unistr('\000a')||
'	 CREATED_BY,'||unistr('\000a')||
'	 DATE_MODIFIED,'||unistr('\000a')||
'	 MODIFIED_BY,'||unistr('\000a')||
'	 SEGORG_ID,'||unistr('\000a')||
'	 COMPDT_CODIGO,'||unistr('\000a')||
'	 COMPDT_NOMBRE,'||unistr('\000a')||
'	 COMPDT_DESCRIPCION,'||unistr('\000a')||
'	 COMPDT_DURACIO';

s:=s||'N_VALOR,'||unistr('\000a')||
'	 COMPDT_DURACION_TIPO,'||unistr('\000a')||
'	 COMPDT_TIPO,'||unistr('\000a')||
'	 COM_PKG.OBTN_COMDOC_ESTADO(p_segorg_id => :P1_SEGORG_ID, p_comprv_id => compdo.COMPRV_ID, p_compdt_id => compdo.COMPDT_ID) ESTADO'||unistr('\000a')||
'    ,replace(replace(COMPRV_PKG.COMPTT_OBTN_RUBROS(p_comprv_id => compdo.comprv_id, p_compdt_id => compdo.compdt_id, p_ver_obligatorio_sn => ''SI''),chr(10),''<br>''),''(OBLIGATORIO)'',''<font color="red">(OBLIGATORIO)</font>'')';

s:=s||' RUBRO_DOC'||unistr('\000a')||
' from	 COM_PROVEEDORES_DOC_V COMPDO'||unistr('\000a')||
'where  COMPRV_ID = :P694_COMPRV_ID'||unistr('\000a')||
'  and  COMPDO.id = COM_PKG.OBTN_COMPDO_PDTPRV2(compdo.COMPRV_ID,COMPDO.COMPDT_ID, COMPDO.COMPDE_ID)'||unistr('\000a')||
'  and  com_pkg.obtn_comdoc_no_fmt ( p_segorg_id => COMPDO.SEGORG_ID'||unistr('\000a')||
'                                 , p_comprv_id => COMPDO.COMPRV_ID     --:P694_COMPRV_ID'||unistr('\000a')||
'                                 , p_compdt_id => compdo.COMP';

s:=s||'DT_id) not in (''NO RELACIONADO'')';

wwv_flow_api.create_report_region (
  p_id=> 15278229073210825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 694,
  p_name=> 'Ultimos Documentos Presentados',
  p_region_name=>'',
  p_template=> 142027958134227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 30,
  p_region_attributes=>'style="width:700px;"',
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
  p_id=> 15281030989210839 + wwv_flow_api.g_id_offset,
  p_region_id=> 15278229073210825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 24,
  p_column_heading=> 'Id',
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
  p_id=> 31634018211149125 + wwv_flow_api.g_id_offset,
  p_region_id=> 15278229073210825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 26,
  p_column_heading=> 'Comprv Id',
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
  p_id=> 15278728014210837 + wwv_flow_api.g_id_offset,
  p_region_id=> 15278229073210825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_EMISION',
  p_column_display_sequence=> 25,
  p_column_heading=> 'Fecha<br>Emisión',
  p_column_format=> 'DD/MM/YYYY',
  p_column_css_style=>'style="width:10%"',
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 15278809912210837 + wwv_flow_api.g_id_offset,
  p_region_id=> 15278229073210825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VENCIMIENTO',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Fecha<br>Vencimiento',
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
  p_id=> 15278929933210837 + wwv_flow_api.g_id_offset,
  p_region_id=> 15278229073210825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_PRESENTACION',
  p_column_display_sequence=> 23,
  p_column_heading=> 'Fecha<br>Presentación',
  p_column_format=> 'DD/MM/YYYY',
  p_column_css_style=>'"width:10%;"',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_cattributes=> 'style="width:10%;"',
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
  p_id=> 15279023426210837 + wwv_flow_api.g_id_offset,
  p_region_id=> 15278229073210825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'COMENTARIO',
  p_column_display_sequence=> 3,
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
  p_id=> 15279127175210837 + wwv_flow_api.g_id_offset,
  p_region_id=> 15278229073210825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION',
  p_column_display_sequence=> 8,
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
  p_id=> 15280824255210839 + wwv_flow_api.g_id_offset,
  p_region_id=> 15278229073210825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Documento',
  p_column_format=> 'DOWNLOAD:COM_PROVEEDORES_DOC:DOCUMENTO:ID::MIMETYPE:FILENAME:LAST_UPDATE_DATE::attachment:Abrir Doc.',
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
  p_id=> 15279201411210839 + wwv_flow_api.g_id_offset,
  p_region_id=> 15278229073210825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'FILENAME',
  p_column_display_sequence=> 9,
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
  p_id=> 15279322768210839 + wwv_flow_api.g_id_offset,
  p_region_id=> 15278229073210825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'MIMETYPE',
  p_column_display_sequence=> 10,
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
  p_id=> 15279406052210839 + wwv_flow_api.g_id_offset,
  p_region_id=> 15278229073210825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'LAST_UPDATE_DATE',
  p_column_display_sequence=> 11,
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
  p_id=> 15279508321210839 + wwv_flow_api.g_id_offset,
  p_region_id=> 15278229073210825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION_ABR',
  p_column_display_sequence=> 7,
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
  p_id=> 15279617386210839 + wwv_flow_api.g_id_offset,
  p_region_id=> 15278229073210825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'MOTIVO_SITUACION',
  p_column_display_sequence=> 12,
  p_column_heading=> 'Motivo Situacion',
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
  p_id=> 15279732153210839 + wwv_flow_api.g_id_offset,
  p_region_id=> 15278229073210825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'DATE_CREATED',
  p_column_display_sequence=> 13,
  p_column_heading=> 'Date Created',
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
  p_id=> 15279825404210839 + wwv_flow_api.g_id_offset,
  p_region_id=> 15278229073210825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 15,
  p_form_element_id=> null,
  p_column_alias=> 'CREATED_BY',
  p_column_display_sequence=> 14,
  p_column_heading=> 'Created By',
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
  p_id=> 15279927969210839 + wwv_flow_api.g_id_offset,
  p_region_id=> 15278229073210825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 16,
  p_form_element_id=> null,
  p_column_alias=> 'DATE_MODIFIED',
  p_column_display_sequence=> 15,
  p_column_heading=> 'Date Modified',
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
  p_id=> 15280032068210839 + wwv_flow_api.g_id_offset,
  p_region_id=> 15278229073210825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 17,
  p_form_element_id=> null,
  p_column_alias=> 'MODIFIED_BY',
  p_column_display_sequence=> 16,
  p_column_heading=> 'Modified By',
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
  p_id=> 15280113834210839 + wwv_flow_api.g_id_offset,
  p_region_id=> 15278229073210825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 18,
  p_form_element_id=> null,
  p_column_alias=> 'SEGORG_ID',
  p_column_display_sequence=> 17,
  p_column_heading=> 'Segorg Id',
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
  p_id=> 15280224126210839 + wwv_flow_api.g_id_offset,
  p_region_id=> 15278229073210825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 19,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_CODIGO',
  p_column_display_sequence=> 18,
  p_column_heading=> 'Compdt Codigo',
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
  p_id=> 15280324296210839 + wwv_flow_api.g_id_offset,
  p_region_id=> 15278229073210825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 20,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_NOMBRE',
  p_column_display_sequence=> 1,
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
  p_id=> 15280417046210839 + wwv_flow_api.g_id_offset,
  p_region_id=> 15278229073210825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 21,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_DESCRIPCION',
  p_column_display_sequence=> 19,
  p_column_heading=> 'Compdt Descripcion',
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
  p_id=> 15280518933210839 + wwv_flow_api.g_id_offset,
  p_region_id=> 15278229073210825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 22,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_DURACION_VALOR',
  p_column_display_sequence=> 20,
  p_column_heading=> 'Compdt Duracion Valor',
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
  p_id=> 15280610396210839 + wwv_flow_api.g_id_offset,
  p_region_id=> 15278229073210825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 23,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_DURACION_TIPO',
  p_column_display_sequence=> 21,
  p_column_heading=> 'Compdt Duracion Tipo',
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
  p_id=> 15280724244210839 + wwv_flow_api.g_id_offset,
  p_region_id=> 15278229073210825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 24,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_TIPO',
  p_column_display_sequence=> 22,
  p_column_heading=> 'Compdt Tipo',
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
  p_id=> 41831209648209654 + wwv_flow_api.g_id_offset,
  p_region_id=> 15278229073210825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 25,
  p_form_element_id=> null,
  p_column_alias=> 'ESTADO',
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
  p_id=> 11308319936694932 + wwv_flow_api.g_id_offset,
  p_region_id=> 15278229073210825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 26,
  p_form_element_id=> null,
  p_column_alias=> 'RUBRO_DOC',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Tipo Documento',
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
s:=s||'SELECT COMPRB.comprv_id'||unistr('\000a')||
'      ,COMPRB.comrub_id'||unistr('\000a')||
'      ,COMPRB.comrub_codigo'||unistr('\000a')||
'      ,COMPRB.comrub_nombre comrub_nombre'||unistr('\000a')||
'      ,COMPRB.comrub_situacion'||unistr('\000a')||
'      ,'' <b>''||(select rv_abbreviation'||unistr('\000a')||
'         from   cg_ref_codes'||unistr('\000a')||
'        where  rv_domain = ''COM_PROVEEDORES_RUB.SITUACION'''||unistr('\000a')||
'          and rv_low_value = COMPRB.SITUACION)'||unistr('\000a')||
'      ||''</b> desde el: ''|| NVL(COMPRB.FECHA_VALIDEZ,COMPRB.FECHA_VIGENCIA) S';

s:=s||'ITUACIONES'||unistr('\000a')||
'      ,COMPRB.FECHA_VIGENCIA'||unistr('\000a')||
'      ,COMPRB.FECHA_VALIDEZ'||unistr('\000a')||
'     ,''<a href="javascript:popUp2(''''f?p=&APP_ID.:635:&SESSION.::&DEBUG.:635:P635_COMPRV_ID,P635_COMRUB_ID:''||COMPRB.COMPRV_ID||'',''||COMPRB.comrub_id||'''''',660,610)">'''||unistr('\000a')||
'       ||REPLACE((COM_PKG.OBTN_REPUTACION_URL(P_COMRUB_ID => COMPRB.comrub_id'||unistr('\000a')||
'                  ,P_COMPRV_ID => COMPRB.comprv_id'||unistr('\000a')||
'                  ,P_FECHA_VIGENCIA =';

s:=s||'> SYSDATE'||unistr('\000a')||
'                  ,P_COLOR_FONDO => ''G'')'||unistr('\000a')||
'                 ),''WORKSPACE_IMAGES.'',''#WORKSPACE_IMAGES#'')||''</a>'' REPUTACION'||unistr('\000a')||
' FROM COM_PROVEEDORES_RUB_V COMPRB '||unistr('\000a')||
'WHERE COMPRB.COMPRV_ID = :P694_COMPRV_ID'||unistr('\000a')||
'  AND instr(:P694_FILTRO_RUBROS,COMPRB.SITUACION) > 0';

wwv_flow_api.create_report_region (
  p_id=> 17014805525413076 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 694,
  p_name=> '&P1_COMETQ_RUB. del &P1_COMETQ_PRVS.',
  p_region_name=>'',
  p_template=> 142027958134227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 40,
  p_region_attributes=>'style="width:700px;"',
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
  p_id=> 17015015716413096 + wwv_flow_api.g_id_offset,
  p_region_id=> 17014805525413076 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 5,
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
  p_id=> 17015124214413100 + wwv_flow_api.g_id_offset,
  p_region_id=> 17014805525413076 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMRUB_ID',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Comrub Id',
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
  p_id=> 17015225733413100 + wwv_flow_api.g_id_offset,
  p_region_id=> 17014805525413076 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMRUB_CODIGO',
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 17015312278413100 + wwv_flow_api.g_id_offset,
  p_region_id=> 17014805525413076 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COMRUB_NOMBRE',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Nombre ',
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
  p_id=> 17015424833413100 + wwv_flow_api.g_id_offset,
  p_region_id=> 17014805525413076 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMRUB_SITUACION',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Comrub Situacion',
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
  p_id=> 17015522510413100 + wwv_flow_api.g_id_offset,
  p_region_id=> 17014805525413076 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACIONES',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Situación',
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
  p_id=> 17015625110413100 + wwv_flow_api.g_id_offset,
  p_region_id=> 17014805525413076 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VIGENCIA',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Fecha Vigencia',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2',
  p_display_when_condition=> 'P251_FILTRO_RUBROS',
  p_display_when_condition2=> 'ACT',
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
  p_id=> 17015712362413100 + wwv_flow_api.g_id_offset,
  p_region_id=> 17014805525413076 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VALIDEZ',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Fecha Validez',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2',
  p_display_when_condition=> 'P251_FILTRO_RUBROS',
  p_display_when_condition2=> 'ACT',
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
  p_id=> 17015805494413100 + wwv_flow_api.g_id_offset,
  p_region_id=> 17014805525413076 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'REPUTACION',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Reputación',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_report_column_required_role => 31685214962055744+ wwv_flow_api.g_id_offset,
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
s:=s||'select COMPDO.ID'||unistr('\000a')||
'     , COMTPR.ID COMTPR_ID'||unistr('\000a')||
'     , COMPDT_NOMBRE'||unistr('\000a')||
'     , COMENTARIO'||unistr('\000a')||
'     , COM_PKG.OBTN_COMDOC_ESTADO(p_segorg_id => :P1_SEGORG_ID, p_comprv_id => compdo.COMPRV_ID, p_compdt_id => compdo.COMPDT_ID) ESTADO'||unistr('\000a')||
'     , (case COMPDT_TIPO_DURACION '||unistr('\000a')||
'         when ''SIN'' then'||unistr('\000a')||
'           ''INDEFINIDA'''||unistr('\000a')||
'         else '||unistr('\000a')||
'           to_char(FECHA_VENCIMIENTO, ''dd/mm/yyyy'')'||unistr('\000a')||
'       end) FECHA_VENCIMIENTO';

s:=s||' 	 '||unistr('\000a')||
'     , (case when INSTR(COMPDO.MIMETYPE,''pdf'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/download_pdf_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''excel'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/download_csv_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''oct'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''word'') > 0 th';

s:=s||'en'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/download_rtf_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''plain'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''image'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/chart_32x24.gif">''    '||unistr('\000a')||
'         else'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'         end) ICONO'||unistr('\000a')||
'     , dbm';

s:=s||'s_lob.getlength(DOCUMENTO) DOCUMENTO'||unistr('\000a')||
'     , replace(replace(COMPRV_PKG.COMPTT_OBTN_RUBROS(p_comprv_id => compdo.comprv_id, p_compdt_id => compdo.compdt_id, p_ver_obligatorio_sn => ''SI''),chr(10),''<br>''),''(OBLIGATORIO)'',''<font color="red">(OBLIGATORIO)</font>'')    COMPDT_NECESARIO_COTIZAR_SN'||unistr('\000a')||
'     , FILENAME'||unistr('\000a')||
'     , MIMETYPE'||unistr('\000a')||
'     , LAST_UPDATE_DATE'||unistr('\000a')||
'     , COMTPR.SITUACION_DESC'||unistr('\000a')||
'  from COM_TRAMITES_PRV_';

s:=s||'DOC COMTDP'||unistr('\000a')||
'     , COM_PROVEEDORES_DOC_V COMPDO'||unistr('\000a')||
'     , COM_TRAMITES_PRV_V COMTPR'||unistr('\000a')||
' where COMTDP.COMTPR_ID = COMTPR.ID'||unistr('\000a')||
'   and COMTDP.COMPDO_ID = COMPDO.ID'||unistr('\000a')||
'   and COMTPR.COMPRV_ID = :P694_COMPRV_ID';

wwv_flow_api.create_report_region (
  p_id=> 32051410741833282 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 694,
  p_name=> 'Documentos en Tramites',
  p_region_name=>'',
  p_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 35,
  p_region_attributes=>'style="width:700px;"',
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
  p_query_num_rows=> '10',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se ha encontrado ningún dato',
  p_query_num_rows_type=> 'ROW_RANGES_WITH_LINKS',
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
  p_id=> 32052507344833286 + wwv_flow_api.g_id_offset,
  p_region_id=> 32051410741833282 + wwv_flow_api.g_id_offset,
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
  p_id=> 32054713259890703 + wwv_flow_api.g_id_offset,
  p_region_id=> 32051410741833282 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMTPR_ID',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Tramite',
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
  p_id=> 32052417882833284 + wwv_flow_api.g_id_offset,
  p_region_id=> 32051410741833282 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_NOMBRE',
  p_column_display_sequence=> 4,
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
  p_id=> 32051818779833284 + wwv_flow_api.g_id_offset,
  p_region_id=> 32051410741833282 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COMENTARIO',
  p_column_display_sequence=> 6,
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
  p_id=> 41829823444109535 + wwv_flow_api.g_id_offset,
  p_region_id=> 32051410741833282 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'ESTADO',
  p_column_display_sequence=> 7,
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
  p_id=> 32051918155833284 + wwv_flow_api.g_id_offset,
  p_region_id=> 32051410741833282 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VENCIMIENTO',
  p_column_display_sequence=> 8,
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
  p_id=> 32052223630833284 + wwv_flow_api.g_id_offset,
  p_region_id=> 32051410741833282 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'ICONO',
  p_column_display_sequence=> 9,
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
  p_id=> 32052004804833284 + wwv_flow_api.g_id_offset,
  p_region_id=> 32051410741833282 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 10,
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
  p_id=> 32052120425833284 + wwv_flow_api.g_id_offset,
  p_region_id=> 32051410741833282 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_NECESARIO_COTIZAR_SN',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Tipo Documento',
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
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32052602226833286 + wwv_flow_api.g_id_offset,
  p_region_id=> 32051410741833282 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'FILENAME',
  p_column_display_sequence=> 11,
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
  p_id=> 32051602066833284 + wwv_flow_api.g_id_offset,
  p_region_id=> 32051410741833282 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'MIMETYPE',
  p_column_display_sequence=> 12,
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
  p_id=> 32051716101833284 + wwv_flow_api.g_id_offset,
  p_region_id=> 32051410741833282 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'LAST_UPDATE_DATE',
  p_column_display_sequence=> 13,
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32055014429900557 + wwv_flow_api.g_id_offset,
  p_region_id=> 32051410741833282 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION_DESC',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Situación',
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
s:=s||'select DISTINCT  COMPDT.NOMBRE                                        COMPDT_NOMBRE'||unistr('\000a')||
'      ,replace(replace(COMPRV_PKG.COMPTT_OBTN_RUBROS(p_comprv_id => :P694_COMPRV_ID, p_compdt_id => compdt.id, p_ver_obligatorio_sn => ''SI''),chr(10),''<br>''),''(OBLIGATORIO)'',''<font color="red">(OBLIGATORIO)</font>'')                                               COMPDT_TIPO_ABR'||unistr('\000a')||
'      ,com_pkg.obtn_comdoc_estado ( p_s';

s:=s||'egorg_id => COMPDT.SEGORG_ID'||unistr('\000a')||
'                                  , p_comprv_id => :P694_COMPRV_ID'||unistr('\000a')||
'                                  , p_compdt_id => COMPDT.id  ) ESTADO'||unistr('\000a')||
''||unistr('\000a')||
' from COM_COMPDT_COMPRT_V    COMPTT'||unistr('\000a')||
'     ,COM_PROVEEDORES_DOT_V  COMPDT'||unistr('\000a')||
'where COMPTT.COMPDT_ID = COMPDT.ID'||unistr('\000a')||
'and COMPDT.COMPDE_ESTADO = ''HAB'''||unistr('\000a')||
'and COMPDT.TIPO = ''GEN'''||unistr('\000a')||
'and COMPTT.COMPRT_ID = :P694_COMPRT_ID'||unistr('\000a')||
'and com_pkg.obtn_comdoc_no_fm';

s:=s||'t ( p_segorg_id => COMPDT.SEGORG_ID'||unistr('\000a')||
'                                  , p_comprv_id => :P694_COMPRV_ID'||unistr('\000a')||
'                                  , p_compdt_id => COMPDT.id  ) in (''NO PRESENTADO'',''VENCIDO'')'||unistr('\000a')||
''||unistr('\000a')||
'union all'||unistr('\000a')||
''||unistr('\000a')||
'select distinct COMPDT.NOMBRE                                                  COMPDT_NOMBRE'||unistr('\000a')||
'      ,replace(replace(COMPRV_PKG.COMPTT_OBTN_RUBROS(p_comprv_id => :P694_COMPRV_ID, p_compdt_id ';

s:=s||'=> compdt.id, p_ver_obligatorio_sn => ''SI''),chr(10),''<br>''),''(OBLIGATORIO)'',''<font color="red">(OBLIGATORIO)</font>'')                    COMPDT_TIPO_ABR'||unistr('\000a')||
'      ,com_pkg.obtn_comdoc_estado ( p_segorg_id => COMPDT.SEGORG_ID'||unistr('\000a')||
'                                  , p_comprv_id => :P694_COMPRV_ID'||unistr('\000a')||
'                                  , p_compdt_id => COMPDT.id  ) ESTADO'||unistr('\000a')||
' from COM_COMPDT_COMRUB_V    COMTDR'||unistr('\000a')||
'     ';

s:=s||',COM_PROVEEDORES_DOT_V  COMPDT'||unistr('\000a')||
'     ,COM_PROVEEDORES_RUB    COMPRR'||unistr('\000a')||
'where compdt.id = comtdr.compdt_id'||unistr('\000a')||
'  and comtdr.comrub_id = comprr.comrub_id'||unistr('\000a')||
'  and comprr.situacion = ''ACT'''||unistr('\000a')||
'  and compdt.tipo = ''RUB'''||unistr('\000a')||
'  and compdt.compde_estado = ''HAB'''||unistr('\000a')||
'  and COMPRR.COMPRV_ID = :P694_COMPRV_ID'||unistr('\000a')||
'  and com_pkg.obtn_comdoc_no_fmt ( p_segorg_id => COMPDT.SEGORG_ID'||unistr('\000a')||
'                                  , p_comprv_id => :P694';

s:=s||'_COMPRV_ID'||unistr('\000a')||
'                                  , p_compdt_id => COMPDT.id  ) in (''NO PRESENTADO'',''VENCIDO'')';

wwv_flow_api.create_report_region (
  p_id=> 32055412136909325 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 694,
  p_name=> 'Documentos Vencidos / No Presentados',
  p_region_name=>'',
  p_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 36,
  p_region_attributes=>'style="width:700px;"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_required_role => 15665500970462082+ wwv_flow_api.g_id_offset,
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '500',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '1:2',
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
  p_comment=>'++++++++++++++'||unistr('\000a')||
'COMPDT.SEGORG_ID'||unistr('\000a')||
'      ,COMPDT.CODIGO'||unistr('\000a')||
'      ,COMPDT.NOMBRE'||unistr('\000a')||
'      ,COMPDT.DESCRIPCION'||unistr('\000a')||
'      ,COMPDT.TIPO'||unistr('\000a')||
'      ,COMPDT.TIPO_ABR'||unistr('\000a')||
'      ,COMPDT.SITUACION'||unistr('\000a')||
'      ,COMPDT.SITUACION_ABR'||unistr('\000a')||
'      ,COMPDT.ID'||unistr('\000a')||
'      ,COMTDR.COMRUB_NOMBRE RUB_NOMBRE'||unistr('\000a')||
'      ,case tipo'||unistr('\000a')||
'       when ''GEN'' then (select comptp.OBLIGATORIO_SN '||unistr('\000a')||
'                        from com_compdt_comprt comptp'||unistr('\000a')||
'                        where comptp.compdt_id = COMPDT.id '||unistr('\000a')||
'                        and comptp.comprt_id = (select prvtpr.comprt_id '||unistr('\000a')||
'                                         from com_proveedores prvtpr'||unistr('\000a')||
'                                         where prvtpr.id = :P251_ID)) '||unistr('\000a')||
'       when ''RUB'' then (select compdr.OBLIGATORIO_SN '||unistr('\000a')||
'                        from com_compdt_comrub compdr'||unistr('\000a')||
'                        where compdr.compdt_id = COMPDT.id'||unistr('\000a')||
'                        and compdr.comrub_id in (select prvrub.comrub_id '||unistr('\000a')||
'                                          from com_proveedores_rub prvrub'||unistr('\000a')||
'                                          where prvrub.comprv_id=:P251_ID)) '||unistr('\000a')||
'       end case'||unistr('\000a')||
'      ,com_pkg.obtn_comdoc_estado ( p_segorg_id => COMPDT.SEGORG_ID'||unistr('\000a')||
'                                  , p_comprv_id => :P251_ID'||unistr('\000a')||
'                                  , p_compdt_id => COMPDT.id  ) ESTADO'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'--            CASE'||unistr('\000a')||
''||unistr('\000a')||
'--            WHEN FECHA_VENCIMIENTO > sysdate THEN ''<font color="green"><b>VIGENTE</b></font>'''||unistr('\000a')||
'--            ELSE ''<font color="red"><b>VENCIDO</b></font>'''||unistr('\000a')||
'--            END CASE '||unistr('\000a')||
'------------------------------------------------------------------------------'||unistr('\000a')||
'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32055827791909336 + wwv_flow_api.g_id_offset,
  p_region_id=> 32055412136909325 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_NOMBRE',
  p_column_display_sequence=> 1,
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
  p_id=> 32055601788909331 + wwv_flow_api.g_id_offset,
  p_region_id=> 32055412136909325 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_TIPO_ABR',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Tipo Documento',
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
  p_id=> 32055716840909336 + wwv_flow_api.g_id_offset,
  p_region_id=> 32055412136909325 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
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
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 14793800130939909 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 694,
  p_button_sequence=> 10,
  p_button_plug_id => 15259724364038082+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancelar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&G_APP_ANTERIOR.:&G_APP_ANTERIOR_PAG.:&SESSION.',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 14793623777939907 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 694,
  p_button_sequence=> 40,
  p_button_plug_id => 15259724364038082+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Siguiente. >',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'if :P694_COMPRV_ID is null then'||unistr('\000a')||
'   return false;'||unistr('\000a')||
'end if;'||unistr('\000a')||
'if :P694_ID is null then'||unistr('\000a')||
'   return true;'||unistr('\000a')||
'else'||unistr('\000a')||
'   return false;'||unistr('\000a')||
'end if;',
  p_button_condition_type=> 'FUNCTION_BODY',
  p_button_cattributes=>'onclick="alert();"',
  p_database_action=>'INSERT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 15096103069447753 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 694,
  p_button_sequence=> 50,
  p_button_plug_id => 15259724364038082+wwv_flow_api.g_id_offset,
  p_button_name    => 'UPDATE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Siguiente >',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'if :P694_COMPRV_ID is null then'||unistr('\000a')||
'   return false;'||unistr('\000a')||
'end if;'||unistr('\000a')||
'if :P694_ID is not null and :P694_COMPRV_ID is not null then'||unistr('\000a')||
'   return true;'||unistr('\000a')||
'else'||unistr('\000a')||
'   return false;'||unistr('\000a')||
'end if;',
  p_button_condition_type=> 'FUNCTION_BODY',
  p_database_action=>'UPDATE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>14953503172149239 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:920:&SESSION.::&DEBUG.::P920_COMPDO_ID:&P694_ID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>14793623777939907+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'Y',
  p_branch_comment=> 'Created 23-FEB-2011 10:02 by CTISSERA');
 
wwv_flow_api.create_page_branch(
  p_id=>15097225597605523 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:920:&SESSION.::&DEBUG.::P920_COMPDO_ID:&P694_ID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>15096103069447753+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 20,
  p_save_state_before_branch_yn=>'Y',
  p_branch_comment=> 'Created 23-FEB-2011 10:02 by CTISSERA');
 
wwv_flow_api.create_page_branch(
  p_id=>16394809802715918 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:694:&SESSION.::&DEBUG.::P694_COMPDT_ID,P694_TIPO_DURACION,P694_FECHA_VENCIMIENTO:&P694_COMPDT_ID.,&P694_TIPO_DURACION.,&P694_FECHA_VENCIMIENTO.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 30,
  p_branch_condition_type=> 'REQUEST_EQUALS_CONDITION',
  p_branch_condition=> 'reload',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 31-MAR-2011 15:43 by CTISSERA');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>8691426002485529 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_SEGUSU_TIPO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 300,
  p_item_plug_id => 15259724364038082+wwv_flow_api.g_id_offset,
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
  p_id=>14794227235939920 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 5,
  p_item_plug_id => 14793404554939895+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Id',
  p_source=>'ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
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
  p_id=>14794401965939937 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_COMPDT_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 14793404554939895+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tipo de Documento ',
  p_source=>'COMPDT_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select NOMBRE d'||unistr('\000a')||
'      ,ID r'||unistr('\000a')||
'from (select compdt.NOMBRE'||unistr('\000a')||
'      ,compdt.ID'||unistr('\000a')||
'from   COM_PROVEEDORES_DOT compdt'||unistr('\000a')||
'      ,COM_PROVEEDORES_DTE compde   '||unistr('\000a')||
'      ,COM_COMPDT_COMPRT comptt'||unistr('\000a')||
'where  COMPTT.COMPDT_ID = compdt.ID'||unistr('\000a')||
'and    comptt.COMPRT_ID = :P694_COMPRT_ID'||unistr('\000a')||
'and    compde.ID = com_pkg.obtn_compde_id(compdt.ID)'||unistr('\000a')||
'and    compde.ESTADO = ''HAB'''||unistr('\000a')||
'and    COMPRV_PKG.COMPRV_COMPDT_REQUERIDO_SN(p_comprv_id => :P694_COMPRV_ID, p_compdt_id => compdt.ID) = ''SI'''||unistr('\000a')||
'and (compdt.PERMITE_DIGITALIZAR_SN = ''SI'' or (compdt.PERMITE_DIGITALIZAR_SN = ''NO'' and :P694_SEGUSU_TIPO <> ''PRVCOM''))'||unistr('\000a')||
'union'||unistr('\000a')||
'select compdt.NOMBRE'||unistr('\000a')||
'      ,compdt.ID'||unistr('\000a')||
'from   COM_PROVEEDORES_DOT compdt'||unistr('\000a')||
'      ,COM_COMPDT_COMRUB   comprr'||unistr('\000a')||
'      ,COM_PROVEEDORES_RUB comprb'||unistr('\000a')||
'      ,COM_PROVEEDORES_DTE compde'||unistr('\000a')||
'where  compdt.ID = comprr.COMPDT_ID'||unistr('\000a')||
'and    comprr.COMRUB_ID = comprb.COMRUB_ID'||unistr('\000a')||
'and    comprb.SITUACION = ''ACT'''||unistr('\000a')||
'and    comprb.COMPRV_ID = :P694_COMPRV_ID'||unistr('\000a')||
'and    compde.ID = com_pkg.obtn_compde_id(compdt.ID)'||unistr('\000a')||
'and    compde.ESTADO = ''HAB'''||unistr('\000a')||
'and    COMPRV_PKG.COMPRV_COMPDT_REQUERIDO_SN(p_comprv_id => :P694_COMPRV_ID, p_compdt_id => compdt.ID) = ''SI'''||unistr('\000a')||
'and (compdt.PERMITE_DIGITALIZAR_SN = ''SI'' or (compdt.PERMITE_DIGITALIZAR_SN = ''NO'' and :P694_SEGUSU_TIPO <> ''PRVCOM''))'||unistr('\000a')||
'union'||unistr('\000a')||
'select compdt.NOMBRE'||unistr('\000a')||
'      ,compdt.ID'||unistr('\000a')||
'from   COM_PROVEEDORES_DOT compdt'||unistr('\000a')||
'      ,COM_PROVEEDORES_DTE compde'||unistr('\000a')||
'where  compde.ID = com_pkg.obtn_compde_id(compdt.ID)'||unistr('\000a')||
'and    compde.ESTADO = ''HAB'''||unistr('\000a')||
'and    COMPRV_PKG.COMPRV_COMPDT_REQUERIDO_SN(p_comprv_id => :P694_COMPRV_ID, p_compdt_id => compdt.ID) = ''SI'''||unistr('\000a')||
'and (compdt.PERMITE_DIGITALIZAR_SN = ''NO'' and :P694_SEGUSU_TIPO = ''ADMCOM''))'||unistr('\000a')||
'order by 1 ',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>' - Seleccione el Tipo de Documento - ',
  p_lov_null_value=> '',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_tag_attributes  => 'onchange='' reload(this.value); ''  style="width:250px;"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when=>'IF :P694_ID IS NOT NULL AND :P694_EDICION = ''SI'' THEN'||unistr('\000a')||
'   RETURN TRUE;'||unistr('\000a')||
'ELSE'||unistr('\000a')||
'   RETURN FALSE;'||unistr('\000a')||
'END IF;',
  p_read_only_when_type=>'FUNCTION_BODY',
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '-- Obtener valor'||unistr('\000a')||
'select NOMBRE d, ID r'||unistr('\000a')||
'from   COM_PROVEEDORES_DOT_V'||unistr('\000a')||
'where COMPDE_ESTADO = ''HAB'''||unistr('\000a')||
'and COMPRV_PKG.COMPRV_COMPDT_REQUERIDO_SN(p_comprv_id => :P694_COMPRV_ID, p_compdt_id => ID) = ''SI'''||unistr('\000a')||
'and (PERMITE_DIGITALIZAR_SN = ''SI'' or (PERMITE_DIGITALIZAR_SN = ''NO'' and :P694_SEGUSU_TIPO <> ''PRVCOM''))'||unistr('\000a')||
'and  '||unistr('\000a')||
'order by 1');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>14794603751939939 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_COMPRV_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 5,
  p_item_plug_id => 15259724364038082+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
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
  p_colspan=> 1,
  p_rowspan=> 1,
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
h := null;
h:=h||'Ingrese la fecha en que fue emitido el Documento por el organismo correspondiente. Esta fecha se usará como parámetro para calcular la fecha de vencimiento del documento según el tipo de documento que este ingresando.';

wwv_flow_api.create_page_item(
  p_id=>14794811431939939 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_FECHA_EMISION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 14793404554939895+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha Emisión',
  p_format_mask=>'dd/mm/yyyy',
  p_source=>'FECHA_EMISION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DATE_PICKER',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 12,
  p_cMaxlength=> 12,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when=>'IF :P694_ID IS NOT NULL AND :P694_EDICION = ''SI'' THEN'||unistr('\000a')||
'   RETURN TRUE;'||unistr('\000a')||
'ELSE'||unistr('\000a')||
'   RETURN FALSE;'||unistr('\000a')||
'END IF;',
  p_read_only_when_type=>'FUNCTION_BODY',
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_04 => 'button',
  p_attribute_05 => 'N',
  p_attribute_07 => 'NONE',
  p_show_quick_picks=>'N',
  p_item_comment => 'onChange="document.getElementById(''P694_FEC_EMIS'').value=this.value;document.getElementById(''P694_FEC_EMIS'').innerText = fecval;"'||unistr('\000a')||
'onChange="setValueDateVenc(this.value);"');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>14795216370939946 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_COMENTARIO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 110,
  p_item_plug_id => 14793404554939895+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comentario',
  p_source=>'COMENTARIO',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 400,
  p_cHeight=> 4,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
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

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>14795416670939946 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_DOCUMENTO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 120,
  p_item_plug_id => 14793404554939895+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Documento',
  p_source=>'DOCUMENTO',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_FILE',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_tag_attributes  => 'onChange="checkfileType();"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P694_COMPDT_ID',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'DB_COLUMN',
  p_attribute_02 => 'MIMETYPE',
  p_attribute_03 => 'FILENAME',
  p_attribute_05 => 'LAST_UPDATE_DATE',
  p_attribute_06 => 'Y',
  p_attribute_08 => 'inline',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>14795623811939946 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_FILENAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Filename',
  p_source=>'FILENAME',
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
  p_colspan=> 1,
  p_rowspan=> 1,
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
  p_id=>14795824862939946 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_MIMETYPE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 90,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Mimetype',
  p_source=>'MIMETYPE',
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
  p_colspan=> 1,
  p_rowspan=> 1,
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
  p_id=>14796021809939946 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_LAST_UPDATE_DATE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 100,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Last Update Date',
  p_source=>'LAST_UPDATE_DATE',
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
  p_colspan=> 1,
  p_rowspan=> 1,
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
  p_id=>14796220407939946 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_SITUACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 110,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'NUE',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Situacion',
  p_source=>'SITUACION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 240,
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
  p_id=>14796406538939946 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_MOTIVO_SITUACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 120,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Motivo Situacion',
  p_source=>'MOTIVO_SITUACION',
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
  p_colspan=> 1,
  p_rowspan=> 1,
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
h := null;
h:=h||'Ingrese la fecha en que fue presentado el documento ante el Registro de Proveedores.';

wwv_flow_api.create_page_item(
  p_id=>14797408886939946 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_FECHA_PRESENTACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 14793404554939895+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'to_char(sysdate, ''dd/mm/yyyy'')',
  p_item_default_type=> 'PLSQL_EXPRESSION',
  p_prompt=>'Fecha Presentación',
  p_format_mask=>'DD/MM/YYYY',
  p_source=>'FECHA_PRESENTACION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DATE_PICKER',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 12,
  p_cMaxlength=> 12,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when=>'1 = 1',
  p_read_only_when_type=>'PLSQL_EXPRESSION',
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
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
  p_id=>15260510810038093 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_ID2',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 15259724364038082+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Proveedor ID',
  p_source_type=> 'STATIC',
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
  p_id=>15261112024038095 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_COMPRE_FECHA_VALIDEZ',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 175,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'<b>HASTA EL </b>',
  p_format_mask=>'DD/MM/YYYY',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
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
  p_display_when=>':P694_ESTADO_ACTUAL IN (''SUS'')',
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
  p_id=>15261300196038095 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_SEGORG_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 15259724364038082+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Segorg Id',
  p_source_type=> 'STATIC',
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
  p_id=>15261520761038095 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 15259724364038082+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Nombre / Razón Social',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 200,
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
  p_id=>15262314423038096 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_CUIT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 15259724364038082+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'CUIT',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
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
  p_id=>15372625088284476 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_EDICION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
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
  p_id=>16392405731695868 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_TIPO_DURACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 14793404554939895+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
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
  p_item_comment => 'declare'||unistr('\000a')||
'   cursor cr_compdt is'||unistr('\000a')||
'   select tipo_duracion '||unistr('\000a')||
'   from com_proveedores_dot'||unistr('\000a')||
'   where id = :P694_COMPDT_ID;'||unistr('\000a')||
'   --'||unistr('\000a')||
'begin'||unistr('\000a')||
'   open cr_compdt;'||unistr('\000a')||
'   fetch cr_compdt into :P694_TIPO_DURACION;'||unistr('\000a')||
'   close cr_compdt;'||unistr('\000a')||
'end;');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>16563613571163576 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_DURACION_TIPO',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 14793404554939895+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tipo de Duración',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'COMPDT_DURACION_TIPO',
  p_lov=> 'select rv_abbreviation d, rv_low_value r'||unistr('\000a')||
'from   cg_ref_codes'||unistr('\000a')||
'where  rv_domain = ''COM_PROVEEDORES_DOT.DURACION_TIPO'''||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 80,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT-TOP',
  p_display_when=>'P694_TIPO_DURACION',
  p_display_when2=>'NOD',
  p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_field_template=> 142039662225227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '<div id="duraciones">'||unistr('\000a')||
''||unistr('\000a')||
'IF :P691_TIPO_DURACION = ''FIJ'' THEN'||unistr('\000a')||
'   RETURN TRUE;'||unistr('\000a')||
'ELSE'||unistr('\000a')||
'   RETURN FALSE;'||unistr('\000a')||
'END IF;');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>16563923268166370 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_DURACION_VALOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 14793404554939895+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> '1',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Cantidad',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_NUMBER_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 5,
  p_cMaxlength=> 15,
  p_cHeight=> 5,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT-TOP',
  p_display_when=>'P694_TIPO_DURACION',
  p_display_when2=>'NOD',
  p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_read_only_when=>'P691_OPERACION',
  p_read_only_when2=>'CONSULTA',
  p_field_template=> 142039662225227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_03 => 'right',
  p_show_quick_picks=>'N',
  p_item_comment => 'IF :P691_TIPO_DURACION = ''FIJ'' THEN'||unistr('\000a')||
'   RETURN TRUE;'||unistr('\000a')||
'ELSE'||unistr('\000a')||
'   RETURN FALSE;'||unistr('\000a')||
'END IF;');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>16625511051556718 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_FECHA_VENCIMIENTO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 91,
  p_item_plug_id => 14793404554939895+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha Vencimiento',
  p_format_mask=>'DD/MM/YYYY',
  p_source=>'FECHA_VENCIMIENTO',
  p_source_type=> 'DB_COLUMN',
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
  p_id=>16660225445817962 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_FECHA_VENCIMIENTO_AUX',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 95,
  p_item_plug_id => 14793404554939895+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha de Vencimiento',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
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
  p_field_template=> 142039363292227113+wwv_flow_api.g_id_offset,
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
  p_id=>17011402558222965 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_COMPRT_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 15259724364038082+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tipo Proveedor',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select nombre d, id r'||unistr('\000a')||
'from com_proveedores_tipos'||unistr('\000a')||
'where id = :P694_COMPRT_ID',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 200,
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
  p_id=>17015920552413100 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_FILTRO_RUBROS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 250,
  p_item_plug_id => 17014805525413076+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'ACT',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Filtrado por :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
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
  p_security_scheme => 16291626728389510+ wwv_flow_api.g_id_offset,
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>31507608557530231 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_GENERAR_TRAMITE_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 260,
  p_item_plug_id => 14793404554939895+wwv_flow_api.g_id_offset,
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
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>31510004682699354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_RESULTADO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 270,
  p_item_plug_id => 14793404554939895+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 4000,
  p_cHeight=> null,
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
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>31523727968037303 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_COMTPR_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 280,
  p_item_plug_id => 14793404554939895+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
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
  p_attribute_01 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>32070329685406457 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 694,
  p_name=>'P694_COMTPR_TIPO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 290,
  p_item_plug_id => 14793404554939895+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'COMTPR_TIPO',
  p_source=>'select TIPO'||unistr('\000a')||
'from COM_TRAMITES_PRV_V'||unistr('\000a')||
'where ID = :P694_COMTPR_ID',
  p_source_type=> 'QUERY',
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

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 14802203609093410 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 694,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'COMPDT_ID not null',
  p_validation_sequence=> 20,
  p_validation => 'P694_COMPDT_ID',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#LABEL# debe tener algún valor.',
  p_always_execute=>'N',
  p_when_button_pressed=> 14793623777939907 + wwv_flow_api.g_id_offset,
  p_associated_item=> 14794401965939937 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 14802409974104662 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 694,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'FECHA_EMISION not null',
  p_validation_sequence=> 30,
  p_validation => 'P694_FECHA_EMISION',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#LABEL# debe tener algún valor.',
  p_always_execute=>'N',
  p_when_button_pressed=> 14793623777939907 + wwv_flow_api.g_id_offset,
  p_associated_item=> 14794811431939939 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 39701631683093748 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 694,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P694_FECHA_EMISION not null',
  p_validation_sequence=> 40,
  p_validation => 'if :P694_FECHA_EMISION is null then'||unistr('\000a')||
'  :P694_COMPDT_ID := null;'||unistr('\000a')||
'  return ''Fecha de Emisión debe tener algún valor antes de seleccionar el Tipo de Documento'';'||unistr('\000a')||
'end if;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => '',
  p_always_execute=>'N',
  p_associated_item=> 14794811431939939 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 15677227203888901 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 694,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Fecha Emision mayor Fecha Present',
  p_validation_sequence=> 70,
  p_validation => 'if to_date(:P694_FECHA_EMISION) > to_date(:P694_FECHA_PRESENTACION) then'||unistr('\000a')||
'   return ''La Fecha de Emisión ingresada ('' || :P694_FECHA_EMISION || '') NO puede ser mayor que la fecha de Presentación. ('' || :P694_FECHA_PRESENTACION || '')'';'||unistr('\000a')||
'else'||unistr('\000a')||
'   return null;'||unistr('\000a')||
'end if;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => 'Error',
  p_always_execute=>'N',
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 16401808492971109 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 694,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'FECHA_VENCIMIENTO Mayor Sysdate and not null ',
  p_validation_sequence=> 80,
  p_validation => 'if :P694_TIPO_DURACION = ''NOD'' and (:P694_FECHA_VENCIMIENTO is null or to_date(:P694_FECHA_VENCIMIENTO, ''dd/mm/yyyy'') < sysdate ) then'||unistr('\000a')||
'   return ''Para este tipo de Documento debe especificar la fecha de Vencimiento del mismo'';'||unistr('\000a')||
'end if;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => 'Error',
  p_always_execute=>'N',
  p_when_button_pressed=> 14793623777939907 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 16505810604742640 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 694,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'FECHA_PRESENTACION NO Mayor Hoy',
  p_validation_sequence=> 90,
  p_validation => 'if to_date(:P694_FECHA_PRESENTACION) > sysdate then'||unistr('\000a')||
'   return false;'||unistr('\000a')||
'else'||unistr('\000a')||
'   return true;'||unistr('\000a')||
'end if;',
  p_validation_type => 'FUNC_BODY_RETURNING_BOOLEAN',
  p_error_message => '#LABEL# no puede ser mayor que el dia actual.',
  p_always_execute=>'N',
  p_associated_item=> 14797408886939946 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 16506006926751018 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 694,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'FECHA_EMISION NO Mayor a Hoy',
  p_validation_sequence=> 100,
  p_validation => 'if to_date(:P694_FECHA_EMISION) > sysdate then'||unistr('\000a')||
'   return false;'||unistr('\000a')||
'else'||unistr('\000a')||
'   return true;'||unistr('\000a')||
'end if;',
  p_validation_type => 'FUNC_BODY_RETURNING_BOOLEAN',
  p_error_message => '#LABEL# no puede ser mayor a hoy.',
  p_always_execute=>'N',
  p_associated_item=> 14794811431939939 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 16575723127781361 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 694,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P694_DURACION_TIPO',
  p_validation_sequence=> 110,
  p_validation => 'P694_DURACION_TIPO',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#LABEL# debe tener algún valor.',
  p_always_execute=>'N',
  p_validation_condition=> 'P694_TIPO_DURACION',
  p_validation_condition2=> 'NOD',
  p_validation_condition_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_associated_item=> 16563613571163576 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 16579013346797504 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 694,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P694_DURACION_VALOR',
  p_validation_sequence=> 120,
  p_validation => 'P694_DURACION_VALOR',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#LABEL# debe tener algún valor.',
  p_always_execute=>'N',
  p_validation_condition=> 'P694_TIPO_DURACION',
  p_validation_condition2=> 'NOD',
  p_validation_condition_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_when_button_pressed=> 14793623777939907 + wwv_flow_api.g_id_offset,
  p_associated_item=> 16563923268166370 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 31788101375194610 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 694,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P694_DOCUMENTO is not null',
  p_validation_sequence=> 125,
  p_validation => 'P694_DOCUMENTO',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#LABEL# debe tener algún valor.',
  p_always_execute=>'N',
  p_validation_condition=> 'UPDATE,CREATE',
  p_validation_condition_type=> 'REQUEST_IN_CONDITION',
  p_associated_item=> 14795416670939946 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 31785007992149162 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 694,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Validar DOCUMENTO',
  p_validation_sequence=> 130,
  p_validation => 'declare'||unistr('\000a')||
'  -- obtener el tamaño en kb'||unistr('\000a')||
'  cursor cr_extension is'||unistr('\000a')||
'  select UPPER(SUBSTR(FILENAME,INSTR(FILENAME,''.''),(LENGTH(FILENAME)+1)-INSTR(FILENAME,''.''))) EXTENSION'||unistr('\000a')||
'    from wwv_flow_files'||unistr('\000a')||
'   where name = :P694_DOCUMENTO;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_extension       VARCHAR2(2000);'||unistr('\000a')||
'  v_retorno         VARCHAR2(2000);'||unistr('\000a')||
'begin'||unistr('\000a')||
'  v_retorno := NULL;'||unistr('\000a')||
'  -- Obtener extencion'||unistr('\000a')||
'  OPEN cr_extension; '||unistr('\000a')||
'  FETCH cr_extension into v_extension;'||unistr('\000a')||
'  CLOSE cr_extension;'||unistr('\000a')||
'  -- Validar extension'||unistr('\000a')||
'  IF INSTR(''.PDF'',v_extension) = 0  THEN'||unistr('\000a')||
'    v_retorno := v_retorno ||'' El documento ''||:P694_FILENAME||'' tiene una extensión inválida (''||v_extension||''). Sólo se pueden adjuntar archivos con extensiones .PDF.'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  RETURN v_retorno;'||unistr('\000a')||
'end;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => '',
  p_always_execute=>'N',
  p_validation_condition=> 'P694_DOCUMENTO',
  p_validation_condition_type=> 'ITEM_IS_NOT_NULL',
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
p:=p||'F|#OWNER#:COM_PROVEEDORES_DOC:P694_ID:ID';

wwv_flow_api.create_page_process(
  p_id     => 14797727278939948 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 694,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from COM_PROVEEDORES_DOC',
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
p:=p||'DECLARE'||unistr('\000a')||
'  CURSOR cr_comprv IS'||unistr('\000a')||
'  SELECT NOMBRE'||unistr('\000a')||
'        ,CUIT'||unistr('\000a')||
'        ,COMPRT_ID'||unistr('\000a')||
'  FROM COM_PROVEEDORES_V'||unistr('\000a')||
'  WHERE ID = :P694_COMPRV_ID;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  OPEN cr_comprv;'||unistr('\000a')||
'  FETCH cr_comprv INTO :P694_NOMBRE, '||unistr('\000a')||
'                       :P694_CUIT,'||unistr('\000a')||
'                       :P694_COMPRT_ID;'||unistr('\000a')||
'  CLOSE cr_comprv;'||unistr('\000a')||
''||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 15263309436081115 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 694,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ObtenerEstadoActualProveedor',
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
p:=p||'COM_PKG.COMTPR_CREAR(P_COMPRV_ID   => :P694_COMPRV_ID'||unistr('\000a')||
'                    ,P_COMTPR_TIPO => ''PDOC'''||unistr('\000a')||
'                    ,P_COMTPR_ID   => :P694_COMTPR_ID'||unistr('\000a')||
'                    ,P_RESULTADO   => :P694_RESULTADO'||unistr('\000a')||
');';

wwv_flow_api.create_page_process(
  p_id     => 31509609745691360 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 694,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Generar Cabecera del Tramite',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'--:P694_ID IS NULL AND'||unistr('\000a')||
':P694_COMTPR_ID IS NULL AND'||unistr('\000a')||
':P694_GENERAR_TRAMITE_SN = ''SI''',
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
p:=p||'declare'||unistr('\000a')||
'   cursor cr_compdt is'||unistr('\000a')||
'   select tipo_duracion '||unistr('\000a')||
'   from com_proveedores_dot'||unistr('\000a')||
'   where id = :P694_COMPDT_ID;'||unistr('\000a')||
'   --'||unistr('\000a')||
'begin'||unistr('\000a')||
'   open cr_compdt;'||unistr('\000a')||
'   fetch cr_compdt into :P694_TIPO_DURACION;'||unistr('\000a')||
'   close cr_compdt;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 16396215306764864 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 694,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ObtnTipoDuracion',
  p_process_sql_clob => p,
  p_process_error_message=> 'No se ha podido obtener el tipo de duracion del tipo de documento.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'reload',
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
'   cursor cr_compdt is'||unistr('\000a')||
'   select tipo_duracion '||unistr('\000a')||
'   from com_proveedores_dot'||unistr('\000a')||
'   where id = :P694_COMPDT_ID;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   v_valor      number;'||unistr('\000a')||
'begin'||unistr('\000a')||
'   open cr_compdt;'||unistr('\000a')||
'   fetch cr_compdt into :P694_TIPO_DURACION;'||unistr('\000a')||
'   close cr_compdt;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   if :P694_TIPO_DURACION = ''FIJ'' then'||unistr('\000a')||
'      :P694_FECHA_VENCIMIENTO := COM_PKG.OBTN_FECHA_VENC_DOC('||unistr('\000a')||
'                              P_SEGORG_ID     => :P1_SEGOR';

p:=p||'G_ID'||unistr('\000a')||
'                             ,P_COMPDT_ID     => :P694_COMPDT_ID'||unistr('\000a')||
'                             ,P_FECHA_EMISION => nvl(:P694_FECHA_EMISION,sysdate));'||unistr('\000a')||
''||unistr('\000a')||
'      :P694_FECHA_VENCIMIENTO_AUX := :P694_FECHA_VENCIMIENTO;'||unistr('\000a')||
'   end if;'||unistr('\000a')||
''||unistr('\000a')||
'   if :P694_TIPO_DURACION = ''SIN'' then'||unistr('\000a')||
'      :P694_FECHA_VENCIMIENTO     :=  NULL;'||unistr('\000a')||
'      :P694_FECHA_VENCIMIENTO_AUX := ''INDEFINIDO'';'||unistr('\000a')||
'   end if;'||unistr('\000a')||
''||unistr('\000a')||
'   if :P694_TIPO_DURACION';

p:=p||' = ''NOD'' then'||unistr('\000a')||
''||unistr('\000a')||
'      v_valor := to_number(:P694_DURACION_VALOR);'||unistr('\000a')||
'      IF :P694_DURACION_TIPO = ''AÑO'' THEN'||unistr('\000a')||
'         :P694_FECHA_VENCIMIENTO:=to_char(add_months(:P694_FECHA_EMISION, v_valor * 12), ''dd/mm/yyyy'');'||unistr('\000a')||
'      ELSIF :P694_DURACION_TIPO = ''MES'' THEN'||unistr('\000a')||
'         :P694_FECHA_VENCIMIENTO := to_char(add_months(to_date(:P694_FECHA_EMISION), v_valor), ''dd/mm/yyyy'');'||unistr('\000a')||
'      ELSIF :P694_DURACION_TIPO = ';

p:=p||'''DIA'' THEN'||unistr('\000a')||
'         :P694_FECHA_VENCIMIENTO := to_char(to_date(:P694_FECHA_EMISION) + v_valor, ''dd/mm/yyyy'');'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'      --'||unistr('\000a')||
'      :P694_FECHA_VENCIMIENTO_AUX := :P694_FECHA_VENCIMIENTO;'||unistr('\000a')||
'   end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 15008102625760635 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 694,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ObtenerFechaVencimiento',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error al Obtener Fecha de Vencimiento &P694_FECHA_VENCIMIENTO.',
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
p:=p||'#OWNER#:COM_PROVEEDORES_DOC:P694_ID:ID|U';

wwv_flow_api.create_page_process(
  p_id     => 14971028479083787 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 694,
  p_process_sequence=> 60,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'DML_PROCESS_ROW',
  p_process_name=> 'Update Row of COM_PROVEEDORES_DOC',
  p_process_sql_clob => p,
  p_process_error_message=> 'No se ha podido modificar la fila de la tabla COM_PROVEEDORES_DOC. #SQLERR#',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>15096103069447753 + wwv_flow_api.g_id_offset,
  p_process_when=>'IF :P694_ID IS NOT NULL THEN'||unistr('\000a')||
'   RETURN TRUE;'||unistr('\000a')||
'ELSE'||unistr('\000a')||
'   RETURN FALSE;'||unistr('\000a')||
'END IF;',
  p_process_when_type=>'FUNCTION_BODY',
  p_process_success_message=> 'Acción procesada.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'IF :P694_ID IS NOT NULL AND :P694_EDICION = ''NO'' THEN'||unistr('\000a')||
'');
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
p:=p||'#OWNER#:COM_PROVEEDORES_DOC:P694_ID:ID|I';

wwv_flow_api.create_page_process(
  p_id     => 14797918833939951 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 694,
  p_process_sequence=> 70,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'DML_PROCESS_ROW',
  p_process_name=> 'Create Row of COM_PROVEEDORES_DOC',
  p_process_sql_clob => p,
  p_process_error_message=> 'No se ha podido insertar la fila de la tabla COM_PROVEEDORES_DOC. Doc. Tipo:&P694_COMPDT_ID. - &P694_FECHA_VENCIMIENTO. - #SQLERRM#',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>14793623777939907 + wwv_flow_api.g_id_offset,
  p_process_when=>'P694_ID',
  p_process_when_type=>'ITEM_IS_NULL',
  p_process_success_message=> 'Acción procesada.',
  p_process_is_stateful_y_n=>'N',
  p_return_key_into_item1=>'P694_ID',
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
'   cursor cr_compdt is'||unistr('\000a')||
'   select tipo_duracion '||unistr('\000a')||
'   from com_proveedores_dot'||unistr('\000a')||
'   where id = :P694_COMPDT_ID;'||unistr('\000a')||
'   --'||unistr('\000a')||
'begin'||unistr('\000a')||
'   open cr_compdt;'||unistr('\000a')||
'   fetch cr_compdt into :P694_TIPO_DURACION;'||unistr('\000a')||
'   close cr_compdt;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 16591901337002206 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 694,
  p_process_sequence=> 60,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ObtnTipoDuracion',
  p_process_sql_clob => p,
  p_process_error_message=> 'No se ha podido obtener el tipo de duracion del tipo de documento.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'reload',
  p_process_when_type=>'',
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
p:=p||'declare '||unistr('\000a')||
'  cursor cr_segusu is'||unistr('\000a')||
'    select ID'||unistr('\000a')||
'    from SEG_USUARIOS'||unistr('\000a')||
'    where USUARIO = nvl(v(''APP_USER''),USER);'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_segusu_id number;    '||unistr('\000a')||
'begin'||unistr('\000a')||
'  open cr_segusu;'||unistr('\000a')||
'  fetch cr_segusu into v_segusu_id;'||unistr('\000a')||
'  close cr_segusu; '||unistr('\000a')||
'  --'||unistr('\000a')||
'  :P694_SEGUSU_TIPO := SEG_PKG.OBTN_SEGUSU_TIPO(p_id => v_segusu_id); '||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 8691625543504545 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 694,
  p_process_sequence=> 80,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ObtenerUsuario',
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
-- ...updatable report columns for page 694
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
