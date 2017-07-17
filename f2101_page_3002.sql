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

PROMPT ...Remove page 3002
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>3002);
 
end;
/

 
--application/pages/page_03002
prompt  ...PAGE 3002: Trámite Proveedor - Cambio Nombre/Razón Social - Paso 2
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 3002
 ,p_user_interface_id => 70527406842675 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'ADMINISTRACION'
 ,p_name => 'Trámite Proveedor - Cambio Nombre/Razón Social - Paso 2'
 ,p_step_title => 'Trámite Proveedor - Cambio Nombre/Razón Social - Paso 2'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Trámite Proveedor - Cambio Razón Social - Paso 2'
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
 ,p_last_upd_yyyymmddhh24miss => '20170321155246'
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
  p_id=> 366173508137739671 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3002,
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
  p_id=> 366177719650739701 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3002,
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
'  WHERE ID = :P3000_COMPRV_ID;'||unistr('\000a')||
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
  p_id=> 366177929230739703 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3002,
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
  p_id=> 366180705909739709 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3002,
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
  p_id             => 366178110365739703 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 3002,
  p_button_sequence=> 10,
  p_button_plug_id => 366177929230739703+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancelar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:251:&SESSION.::&DEBUG.:::',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 366178329101739706 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 3002,
  p_button_sequence=> 40,
  p_button_plug_id => 366177929230739703+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Siguiente. >',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P3002_ID',
  p_button_condition_type=> 'ITEM_IS_NULL',
  p_button_cattributes=>'onclick="alert();"',
  p_database_action=>'INSERT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 366178530608739706 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 3002,
  p_button_sequence=> 50,
  p_button_plug_id => 366177929230739703+wwv_flow_api.g_id_offset,
  p_button_name    => 'UPDATE',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Siguiente >',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:this.disabled=true;this.value=''Procesando...'';doSubmit(''UPDATE'');',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P3002_ID',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_database_action=>'UPDATE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 366178715431739706 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 3002,
  p_button_sequence=> 60,
  p_button_plug_id => 366177929230739703+wwv_flow_api.g_id_offset,
  p_button_name    => 'PREVIOUS',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> '< Anterior',
  p_button_position=> 'REGION_TEMPLATE_PREVIOUS',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:3000:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>366186723352739718 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:3004:&SESSION.::&DEBUG.::P3004_COMPDO_ID:&P3002_ID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>366178329101739706+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'Y',
  p_branch_comment=> 'Created 23-FEB-2011 10:02 by CTISSERA');
 
wwv_flow_api.create_page_branch(
  p_id=>366186908030739718 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:3004:&SESSION.::&DEBUG.::P3004_COMPDO_ID:&P3002_ID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>366178530608739706+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 20,
  p_save_state_before_branch_yn=>'Y',
  p_branch_comment=> 'Created 23-FEB-2011 10:02 by CTISSERA');
 
wwv_flow_api.create_page_branch(
  p_id=>366187125100739718 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:3002:&SESSION.::&DEBUG.::P3002_COMPDT_ID,P3002_TIPO_DURACION,P3002_FECHA_VENCIMIENTO:&P3002_COMPDT_ID.,&P3002_TIPO_DURACION.,&P3002_FECHA_VENCIMIENTO.',
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
h := null;
h:=h||'Ingrese la fecha en que fue presentado el documento ante el Registro de Proveedores.';

wwv_flow_api.create_page_item(
  p_id=>366173730013739675 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_FECHA_PRESENTACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 366173508137739671+wwv_flow_api.g_id_offset,
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
  p_read_only_when=>'IF :P3002_ID IS NOT NULL AND :P3002_EDICION = ''SI'' THEN'||unistr('\000a')||
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
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>366174229415739681 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_TIPO_DURACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 366173508137739671+wwv_flow_api.g_id_offset,
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
'   where id = :P3002_COMPDT_ID;'||unistr('\000a')||
'   --'||unistr('\000a')||
'begin'||unistr('\000a')||
'   open cr_compdt;'||unistr('\000a')||
'   fetch cr_compdt into :P3002_TIPO_DURACION;'||unistr('\000a')||
'   close cr_compdt;'||unistr('\000a')||
'end;');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>366174415364739682 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_DURACION_TIPO',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 366173508137739671+wwv_flow_api.g_id_offset,
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
  p_display_when=>'P3002_TIPO_DURACION',
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
  p_id=>366174605143739689 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_DURACION_VALOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 366173508137739671+wwv_flow_api.g_id_offset,
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
  p_display_when=>'P3002_TIPO_DURACION',
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
  p_id=>366174824366739689 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_FECHA_VENCIMIENTO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 91,
  p_item_plug_id => 366173508137739671+wwv_flow_api.g_id_offset,
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
  p_id=>366175028761739690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_FECHA_VENCIMIENTO_AUX',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 95,
  p_item_plug_id => 366173508137739671+wwv_flow_api.g_id_offset,
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
  p_id=>366175206600739690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_GENERAR_TRAMITE_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 260,
  p_item_plug_id => 366173508137739671+wwv_flow_api.g_id_offset,
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
  p_id=>366175424110739692 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_RESULTADO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 270,
  p_item_plug_id => 366173508137739671+wwv_flow_api.g_id_offset,
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
  p_id=>366175602085739692 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_COMTPR_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 280,
  p_item_plug_id => 366173508137739671+wwv_flow_api.g_id_offset,
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
  p_id=>366175820108739692 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_COMTPR_TIPO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 290,
  p_item_plug_id => 366173508137739671+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'COMTPR_TIPO',
  p_source=>'select TIPO'||unistr('\000a')||
'from COM_TRAMITES_PRV_V'||unistr('\000a')||
'where ID = :P3002_COMTPR_ID',
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

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>366176015641739695 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 5,
  p_item_plug_id => 366173508137739671+wwv_flow_api.g_id_offset,
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
  p_id=>366176226253739695 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_COMPDT_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 366173508137739671+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tipo de Documento ',
  p_source=>'COMPDT_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select COMDOT.NOMBRE d, COMDOT.ID r'||unistr('\000a')||
'from   COM_PROVEEDORES_DOT_V COMDOT'||unistr('\000a')||
'     , COM_TRAMITES_PRV_TIPO_V COMTPT'||unistr('\000a')||
'where COMDOT.COMTPT_ID = COMTPT.ID'||unistr('\000a')||
'and   COMPDE_ESTADO = ''HAB'''||unistr('\000a')||
'and   COMTPT.CODIGO = :P3000_TIPO'||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_tag_attributes  => 'onchange='' reload(this.value); ''',
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
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => 'onchange=''if(this.value=="FIJ") { $("#duraciones").show(); } else { $("#duraciones").hide();}'''||unistr('\000a')||
'--, P_SEGORG_ID => :P1_SEGORG_ID'||unistr('\000a')||
'--and situacion=''HAB'''||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'--and COM_PKG.OBTN_COMPDT_OBL( :P3002_SEGORG_ID, :P3002_COMPRV_ID , ID ) = 1'||unistr('\000a')||
'and COM_PKG.OBTN_COMPDT_OBL( 2, 4 , ID ) = 0');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Ingrese la fecha en que fue emitido el Documento por el organismo correspondiente. Esta fecha se usará como parámetro para calcular la fecha de vencimiento del documento según el tipo de documento que este ingresando.';

wwv_flow_api.create_page_item(
  p_id=>366176400589739695 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_FECHA_EMISION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 366173508137739671+wwv_flow_api.g_id_offset,
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
  p_read_only_when=>'IF :P3002_ID IS NOT NULL AND :P3002_EDICION = ''SI'' THEN'||unistr('\000a')||
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
  p_item_comment => 'onChange="document.getElementById(''P3002_FEC_EMIS'').value=this.value;document.getElementById(''P3002_FEC_EMIS'').innerText = fecval;"'||unistr('\000a')||
'onChange="setValueDateVenc(this.value);"');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>366176918069739696 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_COMENTARIO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 110,
  p_item_plug_id => 366173508137739671+wwv_flow_api.g_id_offset,
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
  p_id=>366177119068739696 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_DOCUMENTO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 120,
  p_item_plug_id => 366173508137739671+wwv_flow_api.g_id_offset,
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
  p_id=>366177301837739696 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 6,
  p_item_plug_id => 366173508137739671+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '&P3000_NOMBRE.',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Nueva Razón Social',
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
  p_field_template=> 142039553452227115+wwv_flow_api.g_id_offset,
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
  p_id=>366177514122739696 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_CALCULAR_VENCIMIENTO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 21,
  p_item_plug_id => 366173508137739671+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Calcular Vencimiento',
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
  p_id=>366178925203739706 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_SEGUSU_TIPO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 300,
  p_item_plug_id => 366177929230739703+wwv_flow_api.g_id_offset,
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
  p_id=>366179121113739706 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_ID2',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 366177929230739703+wwv_flow_api.g_id_offset,
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
  p_id=>366179316224739706 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_SEGORG_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 366177929230739703+wwv_flow_api.g_id_offset,
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
  p_id=>366179508504739706 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_NOMBRE_ANT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 366177929230739703+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Nombre / Razón Social',
  p_source_type=> 'STATIC',
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
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
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
  p_id=>366179729709739707 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_CUIT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 366177929230739703+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'CUIT',
  p_source_type=> 'STATIC',
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
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
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
  p_id=>366179914796739707 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_COMPRT_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 366177929230739703+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tipo Proveedor',
  p_source_type=> 'STATIC',
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
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
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
  p_id=>366180112969739707 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_COMPRV_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 5,
  p_item_plug_id => 366177929230739703+wwv_flow_api.g_id_offset,
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
wwv_flow_api.create_page_item(
  p_id=>366181020635739709 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_FILTRO_RUBROS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 250,
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
  p_id=>366181201937739709 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_COMPRE_FECHA_VALIDEZ',
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
  p_display_when=>':P3002_ESTADO_ACTUAL IN (''SUS'')',
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
  p_id=>366181404696739709 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_EDICION',
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
  p_id=>366181618829739709 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_FILENAME',
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
  p_id=>366181804190739709 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_MIMETYPE',
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
  p_id=>366182012172739709 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_LAST_UPDATE_DATE',
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
  p_id=>366182200105739709 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_SITUACION',
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
  p_id=>366182401800739709 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3002,
  p_name=>'P3002_MOTIVO_SITUACION',
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

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 366183307283739712 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 3002,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'COMPDT_ID not null',
  p_validation_sequence=> 20,
  p_validation => 'P3002_COMPDT_ID',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#LABEL# debe tener algún valor.',
  p_always_execute=>'N',
  p_when_button_pressed=> 366178329101739706 + wwv_flow_api.g_id_offset,
  p_associated_item=> 366176226253739695 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 366183519990739712 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 3002,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'FECHA_EMISION not null',
  p_validation_sequence=> 30,
  p_validation => 'P3002_FECHA_EMISION',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#LABEL# debe tener algún valor.',
  p_always_execute=>'N',
  p_when_button_pressed=> 366178329101739706 + wwv_flow_api.g_id_offset,
  p_associated_item=> 366176400589739695 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 366183728418739712 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 3002,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P3002_FECHA_EMISION not null',
  p_validation_sequence=> 40,
  p_validation => 'if :P3002_FECHA_EMISION is null then'||unistr('\000a')||
'  :P3002_COMPDT_ID := null;'||unistr('\000a')||
'  return ''Fecha de Emisión debe tener algún valor antes de seleccionar el Tipo de Documento'';'||unistr('\000a')||
'end if;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => '',
  p_always_execute=>'N',
  p_associated_item=> 366176400589739695 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 366183921710739712 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 3002,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Fecha Emision mayor Fecha Present',
  p_validation_sequence=> 70,
  p_validation => 'if to_date(:P3002_FECHA_EMISION) > to_date(:P3002_FECHA_PRESENTACION) then'||unistr('\000a')||
'   return ''La Fecha de Emisión ingresada ('' || :P3002_FECHA_EMISION || '') NO puede ser mayor que la fecha de Presentación. ('' || :P3002_FECHA_PRESENTACION || '')'';'||unistr('\000a')||
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
  p_id => 366184111194739712 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 3002,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'FECHA_VENCIMIENTO Mayor Sysdate and not null ',
  p_validation_sequence=> 80,
  p_validation => 'if :P3002_TIPO_DURACION = ''NOD'' and (:P3002_FECHA_VENCIMIENTO is null or to_date(:P3002_FECHA_VENCIMIENTO, ''dd/mm/yyyy'') < sysdate ) then'||unistr('\000a')||
'   return ''Para este tipo de Documento debe especificar la fecha de Vencimiento del mismo'';'||unistr('\000a')||
'end if;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => 'Error',
  p_always_execute=>'N',
  p_when_button_pressed=> 366178329101739706 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 366184317387739714 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 3002,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'FECHA_PRESENTACION NO Mayor Hoy',
  p_validation_sequence=> 90,
  p_validation => 'if to_date(:P3002_FECHA_PRESENTACION) > sysdate then'||unistr('\000a')||
'   return false;'||unistr('\000a')||
'else'||unistr('\000a')||
'   return true;'||unistr('\000a')||
'end if;',
  p_validation_type => 'FUNC_BODY_RETURNING_BOOLEAN',
  p_error_message => '#LABEL# no puede ser mayor que el dia actual.',
  p_always_execute=>'N',
  p_associated_item=> 366173730013739675 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 366184529815739714 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 3002,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'FECHA_EMISION NO Mayor a Hoy',
  p_validation_sequence=> 100,
  p_validation => 'if to_date(:P3002_FECHA_EMISION) > sysdate then'||unistr('\000a')||
'   return false;'||unistr('\000a')||
'else'||unistr('\000a')||
'   return true;'||unistr('\000a')||
'end if;',
  p_validation_type => 'FUNC_BODY_RETURNING_BOOLEAN',
  p_error_message => '#LABEL# no puede ser mayor a hoy.',
  p_always_execute=>'N',
  p_associated_item=> 366176400589739695 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 366184718595739714 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 3002,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P3002_DURACION_TIPO',
  p_validation_sequence=> 110,
  p_validation => 'P3002_DURACION_TIPO',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#LABEL# debe tener algún valor.',
  p_always_execute=>'N',
  p_validation_condition=> 'P3002_TIPO_DURACION',
  p_validation_condition2=> 'NOD',
  p_validation_condition_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_associated_item=> 366174415364739682 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 366182708912739710 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 3002,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P3002_DURACION_VALOR',
  p_validation_sequence=> 120,
  p_validation => 'P3002_DURACION_VALOR',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#LABEL# debe tener algún valor.',
  p_always_execute=>'N',
  p_validation_condition=> 'P3002_TIPO_DURACION',
  p_validation_condition2=> 'NOD',
  p_validation_condition_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_when_button_pressed=> 366178329101739706 + wwv_flow_api.g_id_offset,
  p_associated_item=> 366174605143739689 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 366182903067739710 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 3002,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P3002_DOCUMENTO is not null',
  p_validation_sequence=> 125,
  p_validation => 'P3002_DOCUMENTO',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#LABEL# debe tener algún valor.',
  p_always_execute=>'N',
  p_validation_condition=> 'UPDATE,CREATE',
  p_validation_condition_type=> 'REQUEST_IN_CONDITION',
  p_associated_item=> 366177119068739696 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 366183128336739710 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 3002,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Validar DOCUMENTO',
  p_validation_sequence=> 130,
  p_validation => 'declare'||unistr('\000a')||
'  -- obtener el tamaño en kb'||unistr('\000a')||
'  cursor cr_extension is'||unistr('\000a')||
'  select UPPER(SUBSTR(FILENAME,INSTR(FILENAME,''.''),(LENGTH(FILENAME)+1)-INSTR(FILENAME,''.''))) EXTENSION'||unistr('\000a')||
'    from wwv_flow_files'||unistr('\000a')||
'   where name = :P3002_DOCUMENTO;'||unistr('\000a')||
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
'    v_retorno := v_retorno ||'' El documento ''||:P3002_FILENAME||'' tiene una extensión inválida (''||v_extension||''). Sólo se pueden adjuntar archivos con extensiones .PDF.'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  RETURN v_retorno;'||unistr('\000a')||
'end;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => '',
  p_always_execute=>'N',
  p_validation_condition=> 'P3002_DOCUMENTO',
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
p:=p||'F|#OWNER#:COM_PROVEEDORES_DOC:P3002_ID:ID';

wwv_flow_api.create_page_process(
  p_id     => 366184816591739714 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 3002,
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
'        ,ID'||unistr('\000a')||
'  FROM COM_PROVEEDORES_V'||unistr('\000a')||
'  WHERE ID = :P3000_COMPRV_ID;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  OPEN cr_comprv;'||unistr('\000a')||
'  FETCH cr_comprv INTO :P3002_NOMBRE, '||unistr('\000a')||
'                       :P3002_CUIT,'||unistr('\000a')||
'                       :P3002_COMPRT_ID,'||unistr('\000a')||
'                       :P3002_COMPRV_ID;'||unistr('\000a')||
'  CLOSE cr_comprv;'||unistr('\000a')||
'  :P3002_COMPRV_ID := :P3000_COMPRV_ID;'||unistr('\000a')||
'  :P3002_NOMB';

p:=p||'RE := :P3000_NOMBRE;'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 366185029891739715 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 3002,
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
p:=p||'COM_PKG.COMTPR_CREAR(P_COMPRV_ID   => :P3002_COMPRV_ID'||unistr('\000a')||
'                    ,P_COMTPR_TIPO => ''PDOC'''||unistr('\000a')||
'                    ,P_COMTPR_ID   => :P3002_COMTPR_ID'||unistr('\000a')||
'                    ,P_RESULTADO   => :P3002_RESULTADO'||unistr('\000a')||
');';

wwv_flow_api.create_page_process(
  p_id     => 366185215311739715 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 3002,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Generar Cabecera del Tramite',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'--:P3002_ID IS NULL AND'||unistr('\000a')||
':P3002_COMTPR_ID IS NULL AND'||unistr('\000a')||
':P3002_GENERAR_TRAMITE_SN = ''SI''',
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
'   where id = :P3002_COMPDT_ID;'||unistr('\000a')||
'   --'||unistr('\000a')||
'begin'||unistr('\000a')||
'   open cr_compdt;'||unistr('\000a')||
'   fetch cr_compdt into :P3002_TIPO_DURACION;'||unistr('\000a')||
'   close cr_compdt;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 366185412240739715 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 3002,
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
'   where id = :P3002_COMPDT_ID;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   v_valor      number;'||unistr('\000a')||
'begin'||unistr('\000a')||
'   open cr_compdt;'||unistr('\000a')||
'   fetch cr_compdt into :P3002_TIPO_DURACION;'||unistr('\000a')||
'   close cr_compdt;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   if :P3002_TIPO_DURACION = ''FIJ'' then'||unistr('\000a')||
'      :P3002_FECHA_VENCIMIENTO := COM_PKG.OBTN_FECHA_VENC_DOC('||unistr('\000a')||
'                              P_SEGORG_ID     => :P1_S';

p:=p||'EGORG_ID'||unistr('\000a')||
'                             ,P_COMPDT_ID     => :P3002_COMPDT_ID'||unistr('\000a')||
'                             ,P_FECHA_EMISION => nvl(:P3002_FECHA_EMISION,sysdate));'||unistr('\000a')||
''||unistr('\000a')||
'      :P3002_FECHA_VENCIMIENTO_AUX := :P3002_FECHA_VENCIMIENTO;'||unistr('\000a')||
'   end if;'||unistr('\000a')||
''||unistr('\000a')||
'   if :P3002_TIPO_DURACION = ''SIN'' then'||unistr('\000a')||
'      :P3002_FECHA_VENCIMIENTO     :=  NULL;'||unistr('\000a')||
'      :P3002_FECHA_VENCIMIENTO_AUX := ''INDEFINIDO'';'||unistr('\000a')||
'   end if;'||unistr('\000a')||
''||unistr('\000a')||
'   if :P3002_T';

p:=p||'IPO_DURACION = ''NOD'' then'||unistr('\000a')||
''||unistr('\000a')||
'      v_valor := to_number(:P3002_DURACION_VALOR);'||unistr('\000a')||
'      IF :P3002_DURACION_TIPO = ''AÑO'' THEN'||unistr('\000a')||
'         :P3002_FECHA_VENCIMIENTO:=to_char(add_months(:P3002_FECHA_EMISION, v_valor * 12), ''dd/mm/yyyy'');'||unistr('\000a')||
'      ELSIF :P3002_DURACION_TIPO = ''MES'' THEN'||unistr('\000a')||
'         :P3002_FECHA_VENCIMIENTO := to_char(add_months(to_date(:P3002_FECHA_EMISION), v_valor), ''dd/mm/yyyy'');'||unistr('\000a')||
'      ELSIF :P3';

p:=p||'002_DURACION_TIPO = ''DIA'' THEN'||unistr('\000a')||
'         :P3002_FECHA_VENCIMIENTO := to_char(to_date(:P3002_FECHA_EMISION) + v_valor, ''dd/mm/yyyy'');'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'      --'||unistr('\000a')||
'      :P3002_FECHA_VENCIMIENTO_AUX := :P3002_FECHA_VENCIMIENTO;'||unistr('\000a')||
'   end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 366185613783739715 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 3002,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ObtenerFechaVencimiento',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error al Obtener Fecha de Vencimiento &P3002_FECHA_VENCIMIENTO.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>366177514122739696 + wwv_flow_api.g_id_offset,
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
p:=p||'#OWNER#:COM_PROVEEDORES_DOC:P3002_ID:ID|U';

wwv_flow_api.create_page_process(
  p_id     => 366185819285739715 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 3002,
  p_process_sequence=> 60,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'DML_PROCESS_ROW',
  p_process_name=> 'Update Row of COM_PROVEEDORES_DOC',
  p_process_sql_clob => p,
  p_process_error_message=> 'No se ha podido modificar la fila de la tabla COM_PROVEEDORES_DOC. #SQLERR#',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>366178530608739706 + wwv_flow_api.g_id_offset,
  p_process_when=>'IF :P3002_ID IS NOT NULL THEN'||unistr('\000a')||
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
p:=p||'#OWNER#:COM_PROVEEDORES_DOC:P3002_ID:ID|I';

wwv_flow_api.create_page_process(
  p_id     => 366186030498739717 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 3002,
  p_process_sequence=> 70,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'DML_PROCESS_ROW',
  p_process_name=> 'Create Row of COM_PROVEEDORES_DOC',
  p_process_sql_clob => p,
  p_process_error_message=> 'No se ha podido insertar la fila de la tabla COM_PROVEEDORES_DOC. Doc. Tipo:&P3002_COMPDT_ID. - &P3002_FECHA_VENCIMIENTO. - #SQLERRM#',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>366178329101739706 + wwv_flow_api.g_id_offset,
  p_process_when=>'P3002_ID',
  p_process_when_type=>'ITEM_IS_NULL',
  p_process_success_message=> 'Acción procesada.',
  p_process_is_stateful_y_n=>'N',
  p_return_key_into_item1=>'P3002_ID',
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
'   where id = :P3002_COMPDT_ID;'||unistr('\000a')||
'   --'||unistr('\000a')||
'begin'||unistr('\000a')||
'   open cr_compdt;'||unistr('\000a')||
'   fetch cr_compdt into :P3002_TIPO_DURACION;'||unistr('\000a')||
'   close cr_compdt;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 366186213920739717 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 3002,
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
'  :P3002_SEGUSU_TIPO := SEG_PKG.OBTN_SEGUSU_TIPO(p_id => v_segusu_id); '||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 366186417770739717 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 3002,
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
-- ...updatable report columns for page 3002
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
