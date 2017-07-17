set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end;
/
 
 
--application/set_environment
prompt  APPLICATION 2800 - Compras - Publico
--
-- Application Export:
--   Application:     2800
--   Name:            Compras - Publico
--   Date and Time:   10:03 Lunes Junio 26, 2017
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
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,2800);
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
 
end;
/

PROMPT ...Remove page 310
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>310);
 
end;
/

 
--application/pages/page_00310
prompt  ...PAGE 310: Proveedor - Inscripción - Paso 1 - Tipo de Proveedor
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 310
 ,p_user_interface_id => 277279709541279853 + wwv_flow_api.g_id_offset
 ,p_name => 'Proveedor - Inscripción - Paso 1 - Tipo de Proveedor'
 ,p_step_title => 'Proveedor - Inscripción - Paso 1 - Tipo de Proveedor'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Proveedor - Inscripción - Paso 1 - Tipo de Proveedor'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_step_template => 293265629026544649 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'FKASIAN'
 ,p_last_upd_yyyymmddhh24miss => '20170607181827'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'9242117675798864';

wwv_flow_api.create_page_plug (
  p_id=> 57433303633978064 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_plug_name=> 'Pasos',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 57435626080978145 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 293292144970544663+ wwv_flow_api.g_id_offset,
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
  p_id=> 57479017862484123 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_plug_name=> 'Solicitud de Inscripción como Proveedor',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 57468021298257982+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
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
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_header=> 'Mediante este formulario Ud. podrá solicitar su inscripción como proveedor en el Sistema Electrónico de Compras.<br>'||unistr('\000a')||
'Complete todos los datos solicitados en cada paso de este formulario y recuerde ,los datos ingresados tienen carácter de Declaración Jurada.<br><br>'||unistr('\000a')||
''||unistr('\000a')||
'A continuación seleccione el tipo de proveedor que le corresponda:<br><br>'||unistr('\000a')||
'',
  p_plug_footer=> '<br>'||unistr('\000a')||
'Una vez seleccionado el tipo de proveedor presione el botón <b>"Siguiente>"</b> para continuar.',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 57452112406113521 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 310,
  p_button_sequence=> 10,
  p_button_plug_id => 57479017862484123+wwv_flow_api.g_id_offset,
  p_button_name    => 'P310_CANCELAR',
  p_button_action  => 'DEFINED_BY_DA',
  p_button_image   => 'template:'||to_char(293296445888544665+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancelar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'N',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 57474829752406806 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 310,
  p_button_sequence=> 20,
  p_button_plug_id => 57479017862484123+wwv_flow_api.g_id_offset,
  p_button_name    => 'P310_SIGUIENTE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(293296445888544665+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Siguiente >',
  p_button_position=> 'REGION_TEMPLATE_NEXT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>57500211273597643 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_branch_name=> 'Ir a Página',
  p_branch_action=> 'f?p=&APP_ID.:311:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>57474829752406806+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>57480017373518914 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_COMPRT_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 57479017862484123+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tipo de Proveedor',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_RADIOGROUP',
  p_lov=> 'select comprt.nombre d, comprt.id r'||unistr('\000a')||
'from com_proveedores_tipos comprt'||unistr('\000a')||
'where comprt.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'  and comprt.situacion = ''ACT'''||unistr('\000a')||
'order by 1',
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
  p_field_template=> 293295628171544664+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => '1',
  p_attribute_02 => 'NONE',
  p_attribute_04 => 'VERTICAL',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Seleccione el Registro de Proveedores al cual desea asociarse.<br><br>'||unistr('\000a')||
'El Sistema Electrónico de Compras le permite asociarse en varios de los registros de proveedores habilitados por el Gobierno de la Provincia de San Luis.<br><br>'||unistr('\000a')||
'Al realizar su inscripción por primera vez, debe seleccionar inicialmente uno de los registros habilitados al cual será asociado en forma automática.<br><br>'||unistr('\000a')||
'Al comple';

h:=h||'tarse el formulario de inscripción, el sistema le remitirá un correo electrónico con su usuario y contraseña para acceder al portal de proveedores desde el cual podrá asociarse a otros registros en los cuales Ud. desee pertenecer o desasociarse de aquellos a los cuales ya no desea pertenecer.<br><br>'||unistr('\000a')||
'Cada registro de proveedores es gestionado por diferentes organismos del Gobierno de la Provincia ';

h:=h||'de San Luis por lo cual, verifique adecuadamente en cuales de estos registros Ud. deseará participar.<br><br>'||unistr('\000a')||
'Cada registro maneja sus propias reglamentaciones en cuanto a la documentación requerida para participar en los procesos de compras y contrataciones; asesórese adecuadamente con los responsables de cada registro sobre los requisitos que debe cumplimentar en cada caso.<br><br>';

wwv_flow_api.create_page_item(
  p_id=>75528203313622167 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_COMPRG_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 57479017862484123+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Registro',
  p_source_type=> 'STATIC',
  p_display_as=> 'PLUGIN_BE.CTB.SELECT2',
  p_lov=> 'select comrgp.NOMBRE d, comrgp.ID r'||unistr('\000a')||
'from   COM_REGISTROS_PRV comrgp'||unistr('\000a')||
'where  comrgp.SITUACION = ''HAB'''||unistr('\000a')||
'order by 1 desc',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 63,
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
  p_field_template=> 293295628171544664+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'SINGLE',
  p_attribute_08 => 'CIC',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 57500018174594492 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 310,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P310_COMPRT_ID not null',
  p_validation_sequence=> 10,
  p_validation => 'P310_COMPRT_ID',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Debe seleccionar un valor para #LABEL#.',
  p_always_execute=>'N',
  p_when_button_pressed=> 57474829752406806 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 57480017373518914 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 75529523764658218 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 310,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P310_COMPRG_ID',
  p_validation_sequence=> 20,
  p_validation => 'P310_COMPRG_ID',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Debe seleccionar un valor para #LABEL#',
  p_always_execute=>'N',
  p_when_button_pressed=> 57474829752406806 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 75528203313622167 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 57535505429420921 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 310,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Cabecera Generada',
  p_validation_sequence=> 30,
  p_validation => ':P310_COMPRT_ID is not null and :P311_COMPRT_ID is not null and :P311_COMTPR_ID is not null and :P310_COMPRT_ID = :P311_COMPRT_ID',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'No se permite cambiar el Tipo de Proveedor una vez que ha ingresado los Datos Generales.<br>Si desea solicitar la inscripción de otro Tipo de Proveedor cancele esta solicitud y vuelva a iniciar el formulario.',
  p_always_execute=>'N',
  p_validation_condition_type=> 'NEVER',
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 57561206189663540 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 310
 ,p_name => 'Cancelar'
 ,p_event_sequence => 10
 ,p_triggering_element_type => 'BUTTON'
 ,p_triggering_button_id => 57452112406113521 + wwv_flow_api.g_id_offset
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'click'
  );
wwv_flow_api.create_page_da_action (
  p_id => 57561519469663542 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 310
 ,p_event_id => 57561206189663540 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_CONFIRM'
 ,p_attribute_01 => '¿Esta seguro que desea cancelar la operación?'||unistr('\000a')||
'Perderá los datos que ha ingresado.'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 57561704369664529 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 310
 ,p_event_id => 57561206189663540 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => 'javascript:window.parent.$("#ModalRegion").dialog("close");'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 310
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
