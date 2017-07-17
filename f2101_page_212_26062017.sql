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
--   Date and Time:   09:59 Lunes Junio 26, 2017
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

PROMPT ...Remove page 212
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>212);
 
end;
/

 
--application/pages/page_00212
prompt  ...PAGE 212: Aceptar Trámites Inscripción Proveedores - Confirmado
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 212
 ,p_user_interface_id => 70527406842675 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'ADMINISTRACION'
 ,p_name => 'Aceptar Trámites Inscripción Proveedores - Confirmado'
 ,p_step_title => 'Aceptar Trámites Inscripción Proveedores - Confirmado'
 ,p_step_sub_title => 'Solicitud Aceptada'
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
 ,p_last_upd_yyyymmddhh24miss => '20170608123743'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'El Trámite ha sido Aceptado con éxito.<br><br>';

wwv_flow_api.create_page_plug (
  p_id=> 12227413944794530 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 212,
  p_plug_name=> 'Aceptación Realizada',
  p_region_name=>'',
  p_region_attributes=> '#IMAGE_PREFIX#themes/theme_13/success_w.gif',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142031870782227101+ wwv_flow_api.g_id_offset,
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
  p_id=> 15889213276850993 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 212,
  p_plug_name=> 'Ruta de Navegación',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142026170261227095+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
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
s:=s||'<style>'||unistr('\000a')||
'.msje {'||unistr('\000a')||
'  position: relative;'||unistr('\000a')||
'  top: 5px;'||unistr('\000a')||
'  color:red;'||unistr('\000a')||
'  font-stretch: expanded;'||unistr('\000a')||
'}'||unistr('\000a')||
'.msje-jus {'||unistr('\000a')||
'  padding: 5px;'||unistr('\000a')||
'  width: 600px;'||unistr('\000a')||
'  text-align: justify;'||unistr('\000a')||
'  text-justify: inter-word;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'.msje-der {'||unistr('\000a')||
'  padding: 5px;'||unistr('\000a')||
'  width: 600px;'||unistr('\000a')||
'  text-align: right;'||unistr('\000a')||
'}'||unistr('\000a')||
'</style>'||unistr('\000a')||
''||unistr('\000a')||
'<span class="msje">'||unistr('\000a')||
'   <p class="msje-jus">'||unistr('\000a')||
'      Sr. Proveedor se informa que, al ser <b>APROBADO</b> el Cambio de Razón Social por e';

s:=s||'l Registro de Proveedores del Estado, se deberá cargar nuevamente las <b>Autoridades</b> y la <b>Constancia de inscripción del AFIP</b>. Esto se debe a que dicha documentación se dará de baja al momento de ser aprobado el cambio. '||unistr('\000a')||
'   </p>'||unistr('\000a')||
'   <p class="msje-der">'||unistr('\000a')||
'      Atte.'||unistr('\000a')||
'   </br>'||unistr('\000a')||
'      Programa Compras y Contrataciones'||unistr('\000a')||
'   </p>'||unistr('\000a')||
'</span>';

wwv_flow_api.create_page_plug (
  p_id=> 367692912356276492 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 212,
  p_plug_name=> 'Mensaje',
  p_region_name=>'',
  p_region_css_classes=>' style="width:665;"',
  p_region_attributes=> ' style="width:665;"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_column_width => ' style="width:665;"',
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'FUNCTION_BODY',
  p_plug_display_when_condition => 'begin'||unistr('\000a')||
'   --'||unistr('\000a')||
'   return (:P212_TIPO=''ACRS'')and(:P212_TIPO_PERSONA=''JUR'');'||unistr('\000a')||
'end;',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 15831528642849493 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 212,
  p_button_sequence=> 50,
  p_button_plug_id => 12227413944794530+wwv_flow_api.g_id_offset,
  p_button_name    => 'NOTIFICAR_PROVEEDOR',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Notificar a Proveedor',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:popUp2(''f?p=&APP_ID.:213:&SESSION.::NO:213:P213_COMPRV_ID,P213_MSJMTP_CODIGO,P213_COMTPT_CODIGO,P213_BOTON:&P211_COMPRV_ID.,COMADM_PRVTRM_TRMAPR,&P211_COMTPT_CODIGO.,PRV'', 800, 700);',
  p_button_condition=> ':P211_COMTPT_CODIGO IN (''INSC'',''ACRP'');',
  p_button_condition_type=> 'PLSQL_EXPRESSION',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 18549330848424865 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 212,
  p_button_sequence=> 80,
  p_button_plug_id => 12227413944794530+wwv_flow_api.g_id_offset,
  p_button_name    => 'NOTIFICAR_TRAMITE',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Notificar Tramite',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:popUp2(''f?p=&APP_ID.:213:&SESSION.::NO:213:P213_COMPRV_ID,P213_MSJMTP_CODIGO,P213_COMTPT_CODIGO,P213_BOTON:&P211_COMPRV_ID.,COMADM_PRVTRM_TRMAPR,&P211_COMTPT_CODIGO.,TRM'', 800, 700);',
  p_button_condition=> ':P211_COMTPT_CODIGO NOT IN (''INSC'',''ACRP'');',
  p_button_condition_type=> 'PLSQL_EXPRESSION',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 12227625575794532 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 212,
  p_button_sequence=> 40,
  p_button_plug_id => 12227413944794530+wwv_flow_api.g_id_offset,
  p_button_name    => 'FINISH',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Listo',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 15863110312357857 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 212,
  p_button_sequence=> 70,
  p_button_plug_id => 12227413944794530+wwv_flow_api.g_id_offset,
  p_button_name    => 'NOTIFICAR_TODOS',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Notificar a Todos',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:popUp2(''f?p=&APP_ID.:213:&SESSION.::NO:213:P213_COMPRV_ID,P213_MSJMTP_CODIGO,P213_COMTPT_CODIGO,P213_BOTON:&P211_COMPRV_ID.,COMADM_PRVTRM_TRMAPR,&P211_COMTPT_CODIGO.,TOD'', 800, 700);',
  p_button_condition=> ':P211_COMTPT_CODIGO IN (''INSC'',''ACRP'');',
  p_button_condition_type=> 'PLSQL_EXPRESSION',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 15860231343957008 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 212,
  p_button_sequence=> 60,
  p_button_plug_id => 12227413944794530+wwv_flow_api.g_id_offset,
  p_button_name    => 'NOTIFICAR_RESPONSABLE',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Notificar a &P1_COMETQ_PRSS.',
  p_button_position=> 'REGION_TEMPLATE_EDIT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:popUp2(''f?p=&APP_ID.:213:&SESSION.::NO:213:P213_COMPRV_ID,P213_MSJMTP_CODIGO,P213_COMTPT_CODIGO,P213_BOTON:&P211_COMPRV_ID.,COMADM_PRVTRM_TRMAPR,&P211_COMTPT_CODIGO.,RES'', 800, 700);',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'DECLARE'||unistr('\000a')||
'  v_registros NUMBER;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  --'||unistr('\000a')||
'  SELECT COUNT(COMRES_EMAIL)'||unistr('\000a')||
'    INTO v_registros'||unistr('\000a')||
'    FROM COM_PROVEEDORES_RES_V COMPRS_V'||unistr('\000a')||
'   WHERE COMPRS_V.COMPRV_ID = :P211_COMPRV_ID;'||unistr('\000a')||
'  -- 	'||unistr('\000a')||
'  IF (v_registros > 0 and (:P211_COMTPT_CODIGO =''INSC'' OR :P211_COMTPT_CODIGO =''ACRP'')) THEN'||unistr('\000a')||
'    RETURN TRUE;'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'    RETURN FALSE;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END;',
  p_button_condition_type=> 'FUNCTION_BODY',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>12227923876794533 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 212,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:&P1_PAG_ANTERIOR.:&SESSION.::&DEBUG.:211,212,213::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>12227625575794532+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 1,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>367708511010218935 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 212,
  p_name=>'P212_TIPO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 12227413944794530+wwv_flow_api.g_id_offset,
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
  p_id=>367708703677222282 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 212,
  p_name=>'P212_TIPO_PERSONA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 12227413944794530+wwv_flow_api.g_id_offset,
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
 
---------------------------------------
-- ...updatable report columns for page 212
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
