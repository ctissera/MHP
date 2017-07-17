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

PROMPT ...Remove page 311
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>311);
 
end;
/

 
--application/pages/page_00311
prompt  ...PAGE 311: Proveedor - Inscripción - Paso 2 - Datos Generales
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 311
 ,p_user_interface_id => 277279709541279853 + wwv_flow_api.g_id_offset
 ,p_name => 'Proveedor - Inscripción - Paso 2 - Datos Generales'
 ,p_step_title => 'Proveedor - Inscripción - Paso 2 - Datos Generales'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Proveedor - Inscripción - Paso 2 - Datos Generales'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_step_template => 293265629026544649 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'CTISSERA'
 ,p_last_upd_yyyymmddhh24miss => '20170608120432'
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
  p_id=> 57483813043557795 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 311,
  p_plug_name=> 'Solicitud de Inscripción como Proveedor',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 57468021298257982+ wwv_flow_api.g_id_offset,
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
  p_plug_header=> 'Recuerde ,los datos ingresados tienen carácter de Declaración Jurada.<br>'||unistr('\000a')||
'Ingrese los datos que permitirán identificarlo:<br><br>',
  p_plug_footer=> 'Una vez finalizado el ingreso de los datos, presione el botón <b>"Siguiente>"</b> para continuar.',
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
s:=s||'9242117675798864';

wwv_flow_api.create_page_plug (
  p_id=> 57489825615557818 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 311,
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
  p_plug_item_display_point=> 'ABOVE',
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
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 57484031704557796 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 311,
  p_button_sequence=> 10,
  p_button_plug_id => 57483813043557795+wwv_flow_api.g_id_offset,
  p_button_name    => 'P311_CANCELAR',
  p_button_action  => 'DEFINED_BY_DA',
  p_button_image   => 'template:'||to_char(293296445888544665+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancelar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'N',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 57484225282557800 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 311,
  p_button_sequence=> 30,
  p_button_plug_id => 57483813043557795+wwv_flow_api.g_id_offset,
  p_button_name    => 'P311_SIGUIENTE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(293296445888544665+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Siguiente >',
  p_button_position=> 'REGION_TEMPLATE_NEXT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 57484410138557800 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 311,
  p_button_sequence=> 20,
  p_button_plug_id => 57483813043557795+wwv_flow_api.g_id_offset,
  p_button_name    => 'P311_ANTERIOR',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(293296445888544665+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> '<',
  p_button_position=> 'REGION_TEMPLATE_PREVIOUS',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> 'f?p=&APP_ID.:310:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>57597018066053143 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 311,
  p_branch_name=> 'Ir a Pagina - SIGUIENTE',
  p_branch_action=> 'f?p=&APP_ID.:312:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>57484225282557800+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 30,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Es un número de 11 dígitos por medio del cual el organismo fiscal AFIP (Administración Nacional de Ingresos Públicos), identifica a cada agente económico o persona, con el objeto de lograr un adecuado cobro y control del cumplimiento de las obligaciones tributarias y de la seguridad social.'||unistr('\000a')||
'<br><br>'||unistr('\000a')||
'Para poder inscribirse como Proveedor del Estado debe estar debidamente registrado y habilitado por';

h:=h||' la AFIP<br><br>'||unistr('\000a')||
'El número esta dividido en tres grupos.<br><br>'||unistr('\000a')||
'La primer parte se compone de dos dígitos: el 20 para varones, 27 para mujeres y el 30 para los demás sujetos tributarios.'||unistr('\000a')||
'<br>En determinados casos de excepción y por efecto del cálculo que define el número que compone la tercer parte (digito de control), se asigna en el caso de personas físicas el número 23 y en el caso de los demá';

h:=h||'s sujetos tributarios el 33.<br>'||unistr('\000a')||
'Muy excepcionalmente ocurre que el número de la CUIT ya fué otorgado a otro sujeto, en estos casos se asigna el 24 para las personas físicas y el 34 para los demás contribuyentes.'||unistr('\000a')||
'<br><br>'||unistr('\000a')||
'La segunda parte se encuentra integrada por ocho dígitos: En el caso de las personas físicas estos ocho dígitos se corresponden con el número de documento de identidad. En el cas';

h:=h||'o de los demás sujetos es un número que asigna la AFIP. '||unistr('\000a')||
'<br><br>'||unistr('\000a')||
'La tercer parte del número esta compuesta por un dígito: este dígito –llamado de control-, surge de un cálculo producto de un programa informático que posee la AFIP y que se realiza utilizando los  ocho dígitos que integran la segunda parte.'||unistr('\000a')||
'<br><br>'||unistr('\000a')||
'Este dígito  que integra la tercer parte es el que se tiene en cuenta al efecto de ';

h:=h||'determinar los vencimientos de las obligaciones tributarias y de la seguridad social.';

wwv_flow_api.create_page_item(
  p_id=>57484626925557801 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 311,
  p_name=>'P311_COMTPR_CUIT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 57483813043557795+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'CUIT',
  p_post_element_text=>'<img src="\i\libraries\jquery-ui\1.8\themes\base\images\ui-anim_basic_16x16.gif" id="processing">',
  p_format_mask=>'9999999999999',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 20,
  p_cMaxlength=> 13,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 293295628171544664+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '<div id="esagente" style="visibility: hidden;display: inline;padding: 10px;border: 1px solid #606;margin-left: 10px;">''La Persona Ingresada es Agente del Estado Provincial por lo que no puede ser Inscripta como proveedor del estado según el Artículo 3° Decreto N° 4248 – MHyOP-2013 Inciso A''</div>'||unistr('\000a')||
''||unistr('\000a')||
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">'''||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(\''uSuccessMessage\'')" class="uCloseMessage"></a>'';'||unistr('\000a')||
'    <img src="/i/f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'        New Message Record has been Added.'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Ingrese el Apellido y Nombre del Proveedor en caso de ser una persona física o la Razón Social en caso de ser una persona jurídica.<br><br>'||unistr('\000a')||
'Recuerde, los datos que ingresa tienen carácter de Declaración Jurada por lo cual deben ser exactos, en el caso del Apellido y Nombre tal cual figura en el Documento de Identidad correspondiente y en el caso de la Razón Social tal cual figura en la AFIP.';

wwv_flow_api.create_page_item(
  p_id=>57485106494557810 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 311,
  p_name=>'P311_COMTPR_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 57483813043557795+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Apellido y Nombre / Razón Social',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 70,
  p_cMaxlength=> 100,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 293295628171544664+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
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
  p_id=>57485606039557812 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 311,
  p_name=>'P311_COMPRT_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 57483813043557795+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tipo de Proveedor',
  p_source=>'P310_COMPRT_ID',
  p_source_type=> 'ITEM',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select comprt.nombre d, comprt.id r'||unistr('\000a')||
'from com_proveedores_tipos comprt'||unistr('\000a')||
'where comprt.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_field_template=> 293295628171544664+wwv_flow_api.g_id_offset,
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
h:=h||'Describa en un breve resumen cuales son las principales actividades a la que se dedica haciendo énfasis en aquellas que considera poseer cualidades que lo distingan.'||unistr('\000a')||
'';

wwv_flow_api.create_page_item(
  p_id=>57486130667557812 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 311,
  p_name=>'P311_COMTPR_DESCRIPCION_ACT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 57483813043557795+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Descripción Actividad',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 65,
  p_cMaxlength=> 2000,
  p_cHeight=> 4,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT-TOP',
  p_field_alignment=> 'LEFT',
  p_field_template=> 293295628171544664+wwv_flow_api.g_id_offset,
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
h := null;
h:=h||'Esta dirección de correo electrónico es muy importante pues será utilizada para enviarle información relevante como claves de acceso, avisos de procesos de compra disponibles para que Ud. pueda cotizar y mantenerlo informado en todo momento.<br>'||unistr('\000a')||
'<br>'||unistr('\000a')||
'Debe asegurarse de mantener esta casilla de correo disponible y en condiciones adecuadas para recibir estos comunicados.<br>';

wwv_flow_api.create_page_item(
  p_id=>57486622146557814 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 311,
  p_name=>'P311_COMTPR_EMAIL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 57483813043557795+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'E-mail principal',
  p_post_element_text=>' (indique un solo email)',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 50,
  p_cMaxlength=> 100,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 293295628171544664+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'EMAIL',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Permite indicar la condición tributaria que posee frente al Impuesto al Valor Agregado (IVA) en la AFIP.<br><br>'||unistr('\000a')||
'Recuerde que la información provista tiene carácter de Declaración Jurada.';

wwv_flow_api.create_page_item(
  p_id=>57487121040557814 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 311,
  p_name=>'P311_COMTPR_CONDICION_IB',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 57483813043557795+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Condición IVA',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select RV_MEANING display_value, RV_LOW_VALUE return_value '||unistr('\000a')||
'from CG_REF_CODES'||unistr('\000a')||
'where RV_DOMAIN = ''COM_TRAMITES_PRV.CONDICION_IB'''||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'- SELECCIONE SU CONDICION IMPOSITIVA -',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 293295628171544664+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
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
h:=h||'Es el Número que otorga la Dirección de Rentas de la Provincia al inscribirse para el pago del Impuesto a los Ingresos Brutos.<br><br>'||unistr('\000a')||
'Para poder inscribirse como Proveedor del Estado debe estar debidamente registrado y habilitado por la Dirección de Rentas de la Provincia.';

wwv_flow_api.create_page_item(
  p_id=>57487313628557814 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 311,
  p_name=>'P311_COMTPR_NUMERO_IB',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 57483813043557795+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'N° Inscripción IIBB',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 50,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 293295628171544664+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
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
h := null;
h:=h||'Es la fecha en la cual ha dado inicio sus actividades y se corresponde con la declarada en la AFIP y en la Dirección de Rentas de la Provincia.<br>';

wwv_flow_api.create_page_item(
  p_id=>57487822628557814 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 311,
  p_name=>'P311_COMTPR_FECHA_IB',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 57483813043557795+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Inicio Actividad',
  p_post_element_text=>' (en formato dd/mm/yyyy)',
  p_format_mask=>'dd/mm/yyyy',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DATE_PICKER',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 15,
  p_cMaxlength=> 15,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 293295628171544664+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
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
h := null;
h:=h||'Si el Proveeedor se encuentra adherido al Convenio Multilateral por ejercer una o mas actividades en otras jurisdicciones fuera de la Provincia de San Luis, indique el Número de Convenio Multilateral otorgado por la Comisión Arbitral.<br><br>'||unistr('\000a')||
'Si el Proveedor no ejerce actividades en otras jurisdicciones fuera de la Provincia de San Luis no necesita indicar este dato.';

wwv_flow_api.create_page_item(
  p_id=>57488308753557815 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 311,
  p_name=>'P311_COMTPR_NUMERO_CVML',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 90,
  p_item_plug_id => 57483813043557795+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'N° Convenio Multilateral',
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
  p_field_template=> 293295353096544664+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_help_text=> h,
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Esta dirección de correo electrónico será utilizada en forma adicional a la principar para enviarle información relevante como claves de acceso, avisos de procesos de compra disponibles para que Ud. pueda cotizar y mantenerlo informado en todo momento.<br>'||unistr('\000a')||
'En caso de no poseer una dirección de correo electrónico alternativo solo se remitirá la información relevante al correo principal.<br><br>'||unistr('\000a')||
'Deb';

h:=h||'e asegurarse de mantener esta casilla de correo disponible y en condiciones adecuadas para recibir estos comunicados.<br>';

wwv_flow_api.create_page_item(
  p_id=>57488817943557815 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 311,
  p_name=>'P311_COMTPR_EMAIL_ALTERNATIVO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 55,
  p_item_plug_id => 57483813043557795+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'E-mail alternativo',
  p_post_element_text=>' (indique un solo email)',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 50,
  p_cMaxlength=> 100,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P311_COMPRT_SOLICITAR_RESP',
  p_display_when2=>'NO',
  p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_field_template=> 293295353096544664+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'EMAIL',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Es la Clave Bancaria Unificada asignada a quienes poseen algún tipo de cuenta bancaria.'||unistr('\000a')||
'<br><br>'||unistr('\000a')||
'<b>Ingrese solo los 22 dígitos sin separadores de ningún tipo.</b>'||unistr('\000a')||
'<br><br>'||unistr('\000a')||
'Es una clave que sirve para que el titular de una cuenta bancaria pueda realizar o recibir depósitos de dinero entre cuentas y adherirse al pago de impuestos y servicios por débito automático.'||unistr('\000a')||
'<br><br>'||unistr('\000a')||
'Es importante tener prese';

h:=h||'nte que la Clave Bancaria Uniforme es única por cada cuenta. Es decir, quien posee una caja de ahorro y una cuenta corriente en un mismo banco, contará con una CBU diferente para cada una de ellas.'||unistr('\000a')||
'<br><br>'||unistr('\000a')||
'Por lo tanto, <b>aquellos titulares de varias cuentas deben especificar la CBU de la cuenta con la que quieren operar al momento de realizar una transferencia</b>.'||unistr('\000a')||
'<br><br>'||unistr('\000a')||
'La CBU es única en t';

h:=h||'odo el sistema financiero argentino.'||unistr('\000a')||
'<br><br>'||unistr('\000a')||
'La CBU puede obtenerse en el cajero automático a través del menú “Consultas”, y también puede pedirse por ventanilla. '||unistr('\000a')||
'<br><br>'||unistr('\000a')||
'La Clave Bancaria Uniforme está compuesta por 22 dígitos separados en dos bloques, según el siguiente detalle:'||unistr('\000a')||
'<br><br>'||unistr('\000a')||
'<b>Bloque 1:</b>'||unistr('\000a')||
'<br>'||unistr('\000a')||
' - Número de entidad (3 dígitos). Cada entidad del sistema financiero tiene asignado';

h:=h||' un número que la identifica.<br>'||unistr('\000a')||
' - Número de sucursal (4 dígitos).<br>'||unistr('\000a')||
' - Dígito verificador de los primeros 7 dígitos (1 dígito).<br>'||unistr('\000a')||
'<br><br>'||unistr('\000a')||
'<b>Bloque 2:</b>'||unistr('\000a')||
'<br>'||unistr('\000a')||
' - Identificación de la cuenta individual (13 dígitos, de los cuales los primeros dos identifican según el criterio de la entidad, por ejemplo, tipo y moneda de la cuenta, y los restantes 11 son para el número de cuenta).<br>'||unistr('\000a')||
' - Díg';

h:=h||'ito verificador de las anteriores 13 posiciones (1 dígito).<br>';

wwv_flow_api.create_page_item(
  p_id=>57489301901557817 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 311,
  p_name=>'P311_COMTPR_CBU',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 100,
  p_item_plug_id => 57483813043557795+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'CBU',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 22,
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
  p_display_when_type=>'NEVER',
  p_field_template=> 293295628171544664+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
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
  p_id=>57490425174557821 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 311,
  p_name=>'P311_COMTPR_NOMBRE_ETQ',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 2,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comtpr Nombre Etq',
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
  p_id=>57490605300557821 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 311,
  p_name=>'P311_COMPRT_TIPO_PERSONA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 4,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comprt Tipo Persona',
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
  p_id=>57490824576557821 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 311,
  p_name=>'P311_COMPRT_SOLICITAR_RESP',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 5,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comprt Solicitar Resp',
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
  p_id=>57491002063557821 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 311,
  p_name=>'P311_COMTPR_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 6,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comtpr Id',
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
  p_id=>57491224614557821 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 311,
  p_name=>'P311_SEGORG_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 7,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'SegOrg Id',
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
  p_id=>57491419567557821 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 311,
  p_name=>'P311_COMRST_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 8,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comrst Id',
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
  p_id=>57491625494557821 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 311,
  p_name=>'P311_COMRES_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 9,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comres Id',
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
  p_id=>57491812792557821 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 311,
  p_name=>'P311_COMTPS_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comtps Id',
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
  p_id=>366472332308825685 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 311,
  p_name=>'P311_CONTROL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 110,
  p_item_plug_id => 57483813043557795+wwv_flow_api.g_id_offset,
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

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 57492101336557826 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 311,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P311_COMTPR_CUIT',
  p_validation_sequence=> 10,
  p_validation => 'if :P311_COMTPR_CUIT is null then'||unistr('\000a')||
'   return (''Debe indicar el CUIT'');'||unistr('\000a')||
'elsif LENGTH(:P311_COMTPR_CUIT) <> 11 then'||unistr('\000a')||
'   return (''El CUIT indicado es incorrecto<br>Indique los 11 dígitos sin separadores'');'||unistr('\000a')||
'elsif LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(:P311_COMTPR_CUIT,''1'',''''),''2'',''''),''3'',''''),''4'',''''),''5'',''''),''6'',''''),''7'',''''),''8'',''''),''9'',''''),''0'',''''))) is not null then'||unistr('\000a')||
'  return (''El CUIT indicado es incorrecto<br>Solo se permiten números'');'||unistr('\000a')||
'elsif not  GRAL_PKG.VLDR_CUIT(p_cuit => REPLACE(:P311_COMTPR_CUIT,''-'','''')) then'||unistr('\000a')||
'   return (''El CUIT indicado es incorrecto'');'||unistr('\000a')||
'else  '||unistr('\000a')||
'  if (:P311_COMPRT_TIPO_PERSONA = ''FIS'') and (SUBSTR(:P311_COMTPR_CUIT,1,2) NOT IN (''20'',''23'',''24'',''27'')) THEN'||unistr('\000a')||
'   return (''El Cuit indicado es incorrecto, verifique que los primeros 2 (dos) dígitos correspondan a Personas Físicas'');'||unistr('\000a')||
'elsif (:P311_COMPRT_TIPO_PERSONA = ''JUR'') and (SUBSTR(:P311_COMTPR_CUIT,1,2) NOT IN (''30'',''33'',''34'')) THEN'||unistr('\000a')||
'   return (''El Cuit indicado es incorrecto, verifique que los primeros 2 (dos) dígitos correspondan a Personas Jurídicas'');'||unistr('\000a')||
'  else'||unistr('\000a')||
'    return null;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end if;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => 'Error al validar el CUIT.',
  p_always_execute=>'N',
  p_associated_item=> 57484626925557801 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 57492308675557829 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 311,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P311_COMTPR_NOMBRE',
  p_validation_sequence=> 20,
  p_validation => 'P311_COMTPR_NOMBRE',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Debe indicar el #LABEL#',
  p_always_execute=>'N',
  p_associated_item=> 57485106494557810 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 57492506475557829 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 311,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P311_COMTPR_DESCRIPCION_ACT',
  p_validation_sequence=> 30,
  p_validation => 'P311_COMTPR_DESCRIPCION_ACT',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Debe ingresar una #LABEL#',
  p_always_execute=>'N',
  p_associated_item=> 57486130667557812 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 57492711431557829 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 311,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P311_COMTPR_EMAIL es e-mail',
  p_validation_sequence=> 40,
  p_validation => 'P311_COMTPR_EMAIL',
  p_validation2 => '^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*\.(\w{2}|(com|co.in|in|net|org|edu|int|mil|gov|arpa|biz|aero|name|coop|info|pro|museum))$',
  p_validation_type => 'REGULAR_EXPRESSION',
  p_error_message => 'El #LABEL# indicado no es válido',
  p_always_execute=>'N',
  p_associated_item=> 57486622146557814 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 57492916097557829 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 311,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P311_COMTPR_EMAIL',
  p_validation_sequence=> 50,
  p_validation => 'P311_COMTPR_EMAIL',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Debe indicar el #LABEL#',
  p_always_execute=>'N',
  p_associated_item=> 57486622146557814 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 57493114184557831 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 311,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P311_COMTPR_CONDICION_IB',
  p_validation_sequence=> 60,
  p_validation => 'P311_COMTPR_CONDICION_IB',
  p_validation_type => 'ITEM_NOT_NULL_OR_ZERO',
  p_error_message => 'Debe indicar la #LABEL#.',
  p_always_execute=>'N',
  p_associated_item=> 57487121040557814 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 57493328339557831 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 311,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P311_COMTPR_NUMERO_IB',
  p_validation_sequence=> 70,
  p_validation => 'P311_COMTPR_NUMERO_IB',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Debe indicar el #LABEL#.',
  p_always_execute=>'N',
  p_associated_item=> 57487313628557814 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 57493513750557831 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 311,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P311_COMTPR_FECHA_IB',
  p_validation_sequence=> 80,
  p_validation => 'P311_COMTPR_FECHA_IB',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Debe indicar la #LABEL#',
  p_always_execute=>'N',
  p_associated_item=> 57487822628557814 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 57493917056557831 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 311,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P311_COMTPR_FECHA_IB',
  p_validation_sequence=> 100,
  p_validation => 'P311_COMTPR_FECHA_IB',
  p_validation_type => 'ITEM_IS_DATE',
  p_error_message => 'La #LABEL# indicada no es válida.',
  p_always_execute=>'N',
  p_associated_item=> 57487822628557814 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 57494127244557831 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 311,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P311_COMTPR_EMAIL_ALTERNATIVO es e-mail',
  p_validation_sequence=> 110,
  p_validation => 'P311_COMTPR_EMAIL_ALTERNATIVO',
  p_validation2 => '[-a-zA-Z0-9_.:][@]+[-a-zA-Z0-9_]+[.]+[-a-zA-Z0-9]',
  p_validation_type => 'REGULAR_EXPRESSION',
  p_error_message => 'El #LABEL# indicado no es válido.',
  p_always_execute=>'N',
  p_associated_item=> 57488817943557815 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 57494722926557831 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 311,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P311_COMTPR_NUMERO_IB solo numeros',
  p_validation_sequence=> 130,
  p_validation => 'P311_COMTPR_NUMERO_IB',
  p_validation_type => 'ITEM_IS_NUMERIC',
  p_error_message => 'El #LABEL# indicado no es válido. Solo se permiten números.',
  p_always_execute=>'N',
  p_associated_item=> 57487313628557814 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 366246317484187520 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 311,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'ValidarSiEsAgenteDelEstado',
  p_validation_sequence=> 140,
  p_validation => 'declare'||unistr('\000a')||
'   --'||unistr('\000a')||
'   v_retorno          varchar2(100);'||unistr('\000a')||
'   V_ESCALAFON        VARCHAR2(100);'||unistr('\000a')||
'   V_PLANTA           VARCHAR2(100);'||unistr('\000a')||
'   V_DEPENDENCIA      VARCHAR2(100);'||unistr('\000a')||
'   V_MINISTERIO       VARCHAR2(100);'||unistr('\000a')||
'   V_RAZONSOCIAL      VARCHAR2(100);'||unistr('\000a')||
'   V_FUNCIONCATEGORIA VARCHAR2(100);'||unistr('\000a')||
'   V_MOTIVO_ERROR     VARCHAR2(100);'||unistr('\000a')||
'   V_NRO_DOC          VARCHAR2(11);'||unistr('\000a')||
'   --'||unistr('\000a')||
'begin'||unistr('\000a')||
'   --'||unistr('\000a')||
'   V_NRO_DOC := trim( replace(replace(:P311_COMTPR_CUIT,''-'',''''),'' '','''') );'||unistr('\000a')||
'   --'||unistr('\000a')||
'   if length(V_NRO_DOC) < 11 then'||unistr('\000a')||
'      --'||unistr('\000a')||
'      V_NRO_DOC := V_NRO_DOC||''0''; '||unistr('\000a')||
'      -- '||unistr('\000a')||
'      while length(V_NRO_DOC) < 11 loop'||unistr('\000a')||
'         --'||unistr('\000a')||
'         V_NRO_DOC := ''0''||V_NRO_DOC;'||unistr('\000a')||
'         --'||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      -- '||unistr('\000a')||
'   end if;'||unistr('\000a')||
'    --'||unistr('\000a')||
'   comprv_pkg.COMPRV_VLDR_AGENTE (P_SEGORG_ID         => :P1_SEGORG_ID'||unistr('\000a')||
'                                 , P_COMTPR_CUIT      => V_NRO_DOC'||unistr('\000a')||
'                                 , P_ESCALAFON        => V_ESCALAFON'||unistr('\000a')||
'                                 , P_PLANTA           => V_PLANTA'||unistr('\000a')||
'                                 , P_DEPENDENCIA      => V_DEPENDENCIA'||unistr('\000a')||
'                                 , P_MINISTERIO       => V_MINISTERIO'||unistr('\000a')||
'                                 , P_RAZONSOCIAL      => V_RAZONSOCIAL'||unistr('\000a')||
'                                 , P_FUNCIONCATEGORIA => V_FUNCIONCATEGORIA'||unistr('\000a')||
'                                 , P_MOTIVO_ERROR     => V_MOTIVO_ERROR'||unistr('\000a')||
'                                   );'||unistr('\000a')||
'   --'||unistr('\000a')||
'   if V_RAZONSOCIAL is not null then'||unistr('\000a')||
'      return ''La Persona Ingresada ('' || V_RAZONSOCIAL || '') es Agente del Estado Provincial por lo que no puede ser Inscripta como proveedor del estado según el Artículo 3° Decreto N° 4248 – MHyOP-2013 Inciso A'';'||unistr('\000a')||
'   else'||unistr('\000a')||
'      return V_MOTIVO_ERROR;'||unistr('\000a')||
'   end if;'||unistr('\000a')||
'   --'||unistr('\000a')||
'end;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => '',
  p_always_execute=>'N',
  p_validation_condition_type=> 'NEVER',
  p_when_button_pressed=> 57484225282557800 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 57484626925557801 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> 'P311_COMPRT_TIPO_PERSONA == FIS');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 57595626013000385 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 311
 ,p_name => 'Cancelar'
 ,p_event_sequence => 10
 ,p_triggering_element_type => 'BUTTON'
 ,p_triggering_button_id => 57484031704557796 + wwv_flow_api.g_id_offset
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'click'
  );
wwv_flow_api.create_page_da_action (
  p_id => 57595919196000387 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 311
 ,p_event_id => 57595626013000385 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_CONFIRM'
 ,p_attribute_01 => '¿Esta seguro que desea cancelar la operación?'||unistr('\000a')||
'Perderá los datos que ha ingresado.'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 57596222416005621 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 311
 ,p_event_id => 57595626013000385 + wwv_flow_api.g_id_offset
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
 
wwv_flow_api.create_page_da_event (
  p_id => 366332522192023328 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 311
 ,p_name => 'ValidarAgenteDelEstado'
 ,p_event_sequence => 20
 ,p_triggering_element_type => 'ITEM'
 ,p_triggering_element => 'P311_COMTPR_CUIT'
 ,p_triggering_condition_type => 'JAVASCRIPT_EXPRESSION'
 ,p_triggering_expression => '$v(''P311_COMTPR_CUIT'') != '''';'
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'focusout'
  );
wwv_flow_api.create_page_da_action (
  p_id => 366472517859832404 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 311
 ,p_event_id => 366332522192023328 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 5
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => '$(''#P311_CONTROL'').val('''');'||unistr('\000a')||
'$(''#P311_COMTPR_NOMBRE'').val('''');'||unistr('\000a')||
'$(''#processing'').css({''visibility'': ''hidden''});'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 366364608776628904 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 311
 ,p_event_id => 366332522192023328 + wwv_flow_api.g_id_offset
 ,p_event_result => 'FALSE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => '$(''#uSuccessMessage'').css({''visibility'': ''hidden''});'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 366508507605247400 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 311
 ,p_event_id => 366332522192023328 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => '$(''#processing'').css({''visibility'': ''visible''});'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 366332821864023365 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 311
 ,p_event_id => 366332522192023328 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_EXECUTE_PLSQL_CODE'
 ,p_attribute_01 => 'declare'||unistr('\000a')||
'   --'||unistr('\000a')||
'   v_retorno          varchar2(100);'||unistr('\000a')||
'   V_ESCALAFON        VARCHAR2(100);'||unistr('\000a')||
'   V_PLANTA           VARCHAR2(100);'||unistr('\000a')||
'   V_DEPENDENCIA      VARCHAR2(100);'||unistr('\000a')||
'   V_MINISTERIO       VARCHAR2(100);'||unistr('\000a')||
'   V_RAZONSOCIAL      VARCHAR2(100);'||unistr('\000a')||
'   V_FUNCIONCATEGORIA VARCHAR2(100);'||unistr('\000a')||
'   V_MOTIVO_ERROR     VARCHAR2(400);'||unistr('\000a')||
'   V_NRO_DOC          VARCHAR2(11);'||unistr('\000a')||
'   --'||unistr('\000a')||
'begin'||unistr('\000a')||
'   --'||unistr('\000a')||
'   V_NRO_DOC := trim( replace(replace(:P311_COMTPR_CUIT,''-'',''''),'' '','''') );'||unistr('\000a')||
'   --'||unistr('\000a')||
'   if length(V_NRO_DOC) < 11 then'||unistr('\000a')||
'      --'||unistr('\000a')||
'      V_NRO_DOC := V_NRO_DOC||''0''; '||unistr('\000a')||
'      -- '||unistr('\000a')||
'      while length(V_NRO_DOC) < 11 loop'||unistr('\000a')||
'         --'||unistr('\000a')||
'         V_NRO_DOC := ''0''||V_NRO_DOC;'||unistr('\000a')||
'         --'||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      -- '||unistr('\000a')||
'   end if;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   comprv_pkg.COMPRV_VLDR_AGENTE (P_SEGORG_ID         => :P1_SEGORG_ID'||unistr('\000a')||
'                                 , P_COMTPR_CUIT      => V_NRO_DOC'||unistr('\000a')||
'                                 , P_ESCALAFON        => V_ESCALAFON'||unistr('\000a')||
'                                 , P_PLANTA           => V_PLANTA'||unistr('\000a')||
'                                 , P_DEPENDENCIA      => V_DEPENDENCIA'||unistr('\000a')||
'                                 , P_MINISTERIO       => V_MINISTERIO'||unistr('\000a')||
'                                 , P_RAZONSOCIAL      => V_RAZONSOCIAL'||unistr('\000a')||
'                                 , P_FUNCIONCATEGORIA => V_FUNCIONCATEGORIA'||unistr('\000a')||
'                                 ,P_MOTIVO_ERROR      => V_MOTIVO_ERROR'||unistr('\000a')||
'                                   );'||unistr('\000a')||
'   --'||unistr('\000a')||
'   if V_RAZONSOCIAL is not null then'||unistr('\000a')||
'      --'||unistr('\000a')||
'      :P311_COMTPR_NOMBRE := V_RAZONSOCIAL;'||unistr('\000a')||
'      :P311_CONTROL       := ''ES_AGENTE'';'||unistr('\000a')||
'      --'||unistr('\000a')||
'   else'||unistr('\000a')||
'      :P311_COMTPR_NOMBRE := '''';'||unistr('\000a')||
'      :P311_CONTROL       := '''';'||unistr('\000a')||
'      --'||unistr('\000a')||
'      if V_MOTIVO_ERROR is not null then '||unistr('\000a')||
'         :P311_CONTROL       := ''ERROR'';'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      --'||unistr('\000a')||
'   end if;'||unistr('\000a')||
'   --'||unistr('\000a')||
'end;'
 ,p_attribute_02 => 'P311_COMTPR_CUIT'
 ,p_attribute_03 => 'P311_COMTPR_NOMBRE,P311_CONTROL'
 ,p_attribute_04 => 'N'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 ,p_da_action_comment => '      apex_application.g_print_success_message := ''La Persona Ingresada ('' || V_RAZONSOCIAL || '') es Agente del Estado Provincial por lo que no puede ser Inscripta como proveedor del estado según el Artículo 3° Decreto N° 4248 – MHyOP-2013 Inciso A'';'||unistr('\000a')||
'      --'||unistr('\000a')||
'      APEX_ERROR.ADD_ERROR (p_message          => ''La Persona Ingresada ('' || V_RAZONSOCIAL || '') es Agente del Estado Provincial por lo que no puede ser Inscripta como proveedor del estado según el Artículo 3° Decreto N° 4248 – MHyOP-2013 Inciso A'''||unistr('\000a')||
'                          , p_display_location => apex_error.c_inline_in_notification);'
 );
wwv_flow_api.create_page_da_action (
  p_id => 366458308518654457 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 311
 ,p_event_id => 366332522192023328 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 30
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => 'if ($v(''P311_COMTPR_NOMBRE'') != '''' && $v(''P311_COMPRT_TIPO_PERSONA'') == ''FIS'') {'||unistr('\000a')||
'   var messageHtml = '''';'||unistr('\000a')||
''||unistr('\000a')||
'   messageHtml = ''<section class="uRegion uWhiteRegion uMessageRegion clearfix" style="border: 1px solid #f00 !important;"'';'||unistr('\000a')||
'   messageHtml += '' id="uSuccessMessage">'';'||unistr('\000a')||
'   messageHtml += ''  <div class="uRegionContent clearfix">'';'||unistr('\000a')||
'   messageHtml += ''    <a href="javascript:void(0)" '';'||unistr('\000a')||
'   messageHtml += ''      onclick="$x_Remove(\''uSuccessMessage\'')" '';'||unistr('\000a')||
'   messageHtml += ''      class="uCloseMessage"></a>'';'||unistr('\000a')||
'   messageHtml += ''    <img src="/i/alert_error.gif" class="uCheckmarkIcon" alt="" />'';'||unistr('\000a')||
'   messageHtml += ''    <div class="uMessageText">'';'||unistr('\000a')||
'   '||unistr('\000a')||
'   if($v(''P311_CONTROL'') == ''ERROR''){'||unistr('\000a')||
'      messageHtml += ''No se pudo validar si la Persona Ingresada es Agente del Estado Provincial'';'||unistr('\000a')||
'   }else{'||unistr('\000a')||
'      messageHtml += ''      La Persona Ingresada es Agente del Estado Provincial por lo que no puede ser Inscripta como proveedor del estado según el Artículo 3° Decreto N° 4248 – MHyOP-2013 Inciso A'';'||unistr('\000a')||
'   }'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'   messageHtml += ''    </div>'';'||unistr('\000a')||
'   messageHtml += ''  </div>'';'||unistr('\000a')||
'   messageHtml += ''</section>'';'||unistr('\000a')||
''||unistr('\000a')||
'   $("#uOneCol").after(messageHtml);'||unistr('\000a')||
'}'||unistr('\000a')||
'else {'||unistr('\000a')||
'   $(''#uSuccessMessage'').css({''visibility'': ''hidden''});'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'   $(''#processing'').css({''visibility'': ''hidden''});'
 ,p_stop_execution_on_error => 'Y'
 ,p_da_action_comment => 'if ($v(''P311_CONTROL'') == ''ES_AGENTE'') {'||unistr('\000a')||
'   var messageHtml = '''';'||unistr('\000a')||
''||unistr('\000a')||
'   messageHtml = ''<section class="uRegion uWhiteRegion uMessageRegion clearfix" style="border: 1px solid #f00 !important;"'';'||unistr('\000a')||
'   messageHtml += '' id="uSuccessMessage">'';'||unistr('\000a')||
'   messageHtml += ''  <div class="uRegionContent clearfix">'';'||unistr('\000a')||
'   messageHtml += ''    <a href="javascript:void(0)" '';'||unistr('\000a')||
'   messageHtml += ''      onclick="$x_Remove(\''uSuccessMessage\'')" '';'||unistr('\000a')||
'   messageHtml += ''      class="uCloseMessage"></a>'';'||unistr('\000a')||
'   messageHtml += ''    <img src="/i/alert_error.gif" class="uCheckmarkIcon" alt="" />'';'||unistr('\000a')||
'   messageHtml += ''    <div class="uMessageText">'';'||unistr('\000a')||
'   messageHtml += ''      La Persona Ingresada es Agente del Estado Provincial por lo que no puede ser Inscripta como proveedor del estado según el Artículo 3° Decreto N° 4248 – MHyOP-2013 Inciso A'';'||unistr('\000a')||
'   messageHtml += ''    </div>'';'||unistr('\000a')||
'   messageHtml += ''  </div>'';'||unistr('\000a')||
'   messageHtml += ''</section>'';'||unistr('\000a')||
''||unistr('\000a')||
'   $("#uOneCol").after(messageHtml);'||unistr('\000a')||
'}'||unistr('\000a')||
'else {'||unistr('\000a')||
'   $(''#uSuccessMessage'').css({''visibility'': ''hidden''});'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'   $(''#processing'').css({''visibility'': ''hidden''});'
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
p:=p||'DECLARE'||unistr('\000a')||
'  v_comtpr  COM_TRAMITES_PRV%rowtype;'||unistr('\000a')||
'  v_comres  COM_RESPONSABLES%rowtype;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_comtpr.COMPRT_ID := :P311_COMPRT_ID;'||unistr('\000a')||
'  v_comtpr.CUIT      := :P311_COMTPR_CUIT;'||unistr('\000a')||
'  v_comtpr.NOMBRE    := upper(:P311_COMTPR_NOMBRE);'||unistr('\000a')||
'  v_comtpr.EMAIL     := lower(:P311_COMTPR_EMAIL);'||unistr('\000a')||
'  v_comtpr.CBU       := upper(:P311_COMTPR_CBU);'||unistr('\000a')||
'  v_comtpr.DESCRIPCION_ACTIVIDAD := upper(:P311_COMTPR_DESCRIPCION_AC';

p:=p||'T);'||unistr('\000a')||
'  v_comtpr.CONDICION_IB          := :P311_COMTPR_CONDICION_IB;'||unistr('\000a')||
'  v_comtpr.NUMERO_INSCRIPCION_IB := :P311_COMTPR_NUMERO_IB;'||unistr('\000a')||
'  v_comtpr.FECHA_INSCRIPCION_IB  := :P311_COMTPR_FECHA_IB;'||unistr('\000a')||
'  v_comtpr.NUMERO_CONVENIO_MULTILATERAL := :P311_COMTPR_NUMERO_CVML;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  UPDATE COM_TRAMITES_PRV'||unistr('\000a')||
'  SET COMPRT_ID = v_comtpr.COMPRT_ID'||unistr('\000a')||
'     ,CUIT      = v_comtpr.CUIT'||unistr('\000a')||
'     ,NOMBRE    = v_comtpr.NOMBRE'||unistr('\000a')||
'     ,EMAIL';

p:=p||'     = v_comtpr.EMAIL'||unistr('\000a')||
'     ,CBU       = v_comtpr.CBU'||unistr('\000a')||
'     ,DESCRIPCION_ACTIVIDAD = v_comtpr.DESCRIPCION_ACTIVIDAD'||unistr('\000a')||
'     ,CONDICION_IB          = v_comtpr.CONDICION_IB'||unistr('\000a')||
'     ,NUMERO_INSCRIPCION_IB = v_comtpr.NUMERO_INSCRIPCION_IB'||unistr('\000a')||
'     ,FECHA_INSCRIPCION_IB  = v_comtpr.FECHA_INSCRIPCION_IB'||unistr('\000a')||
'     ,NUMERO_CONVENIO_MULTILATERAL = v_comtpr.NUMERO_CONVENIO_MULTILATERAL'||unistr('\000a')||
'  WHERE ID = :P311_COMTPR_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  I';

p:=p||'F :P311_COMPRT_SOLICITAR_RESP = ''NO'' and :P311_COMRES_ID is not null THEN'||unistr('\000a')||
'    --'||unistr('\000a')||
'    v_comres.NUMERO_DOCUMENTO := :P311_COMTPR_CUIT;'||unistr('\000a')||
'    v_comres.NOMBRE           := upper(:P311_COMTPR_NOMBRE);'||unistr('\000a')||
'    v_comres.EMAIL            := lower(:P311_COMTPR_EMAIL);'||unistr('\000a')||
'    v_comres.OBSERVACION      := null;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    UPDATE COM_RESPONSABLES'||unistr('\000a')||
'    SET NUMERO_DOCUMENTO = v_comres.NUMERO_DOCUMENTO'||unistr('\000a')||
'       ,NOMBRE = v_';

p:=p||'comres.NOMBRE'||unistr('\000a')||
'       ,EMAIL = v_comres.EMAIL'||unistr('\000a')||
'       ,OBSERVACION = v_comres.OBSERVACION'||unistr('\000a')||
'    WHERE ID = :P311_COMRES_ID;'||unistr('\000a')||
'    --'||unistr('\000a')||
'  ELSIF :P311_COMPRT_SOLICITAR_RESP = ''NO'' AND :P311_COMRES_ID IS NULL THEN'||unistr('\000a')||
'    --'||unistr('\000a')||
'    DECLARE'||unistr('\000a')||
'      v_comres  COM_RESPONSABLES%rowtype;'||unistr('\000a')||
'      v_comtps  COM_TRAMITES_PRV_RES%rowtype;'||unistr('\000a')||
'    BEGIN'||unistr('\000a')||
'      --'||unistr('\000a')||
'      SELECT COMRES_ID.NEXTVAL'||unistr('\000a')||
'      INTO v_comres.ID'||unistr('\000a')||
'      FROM DUAL;'||unistr('\000a')||
'';

p:=p||'      --'||unistr('\000a')||
'      v_comres.COMRST_ID        := :P311_COMRST_ID;'||unistr('\000a')||
'      v_comres.TIPO_DOCUMENTO   := ''CUIT'';'||unistr('\000a')||
'      v_comres.NUMERO_DOCUMENTO := :P311_COMTPR_CUIT;'||unistr('\000a')||
'      v_comres.NOMBRE           := upper(:P311_COMTPR_NOMBRE);'||unistr('\000a')||
'      v_comres.EMAIL            := lower(:P311_COMTPR_EMAIL);'||unistr('\000a')||
'      v_comres.OBSERVACION      := null;'||unistr('\000a')||
'      --'||unistr('\000a')||
'      SELECT COMTPS_ID.NEXTVAL'||unistr('\000a')||
'      INTO v_comtps.ID'||unistr('\000a')||
'      FROM DU';

p:=p||'AL;'||unistr('\000a')||
'      --'||unistr('\000a')||
'      v_comtps.COMTPR_ID := :P311_COMTPR_ID;'||unistr('\000a')||
'      v_comtps.COMRES_ID := v_comres.ID;'||unistr('\000a')||
'      v_comtps.OPERACION := ''REG'';'||unistr('\000a')||
'      --'||unistr('\000a')||
'      COM_PKG.INS_COMRES(p_comres=> v_comres);'||unistr('\000a')||
'      --'||unistr('\000a')||
'      COM_PKG.INS_COMTPS(p_comtps => v_comtps);'||unistr('\000a')||
'      --'||unistr('\000a')||
'      :P311_COMRES_ID := v_comres.ID;'||unistr('\000a')||
'      :P311_COMTPS_ID := v_comtps.ID;'||unistr('\000a')||
'      --'||unistr('\000a')||
'    END;'||unistr('\000a')||
'    --'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 57495630434557834 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 311,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ActualizarTrámite',
  p_process_sql_clob => p,
  p_process_error_message=> 'No se ha podido actualizar los datos de la solicitud.',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=>'P311_COMTPR_ID',
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
p:=p||'DECLARE'||unistr('\000a')||
'  v_comtpr  COM_TRAMITES_PRV%rowtype;'||unistr('\000a')||
'  v_comtpg  COM_TRAMITES_PRV_RGP%rowtype;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  --'||unistr('\000a')||
'  SELECT COMTPR_ID.NEXTVAL'||unistr('\000a')||
'  INTO   v_comtpr.ID'||unistr('\000a')||
'  FROM DUAL;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_comtpr.SEGORG_ID := :P1_SEGORG_ID;'||unistr('\000a')||
'  v_comtpr.FECHA     := sysdate;'||unistr('\000a')||
'  v_comtpr.COMPRV_ID := null;'||unistr('\000a')||
'  v_comtpr.TIPO      := ''INSC'';'||unistr('\000a')||
'  v_comtpr.COMPRT_ID := :P311_COMPRT_ID;'||unistr('\000a')||
'  v_comtpr.CUIT      := REPLACE(:P311_COMTPR_CUIT,''-'','''');'||unistr('\000a')||
' ';

p:=p||' v_comtpr.NOMBRE    := upper(:P311_COMTPR_NOMBRE);'||unistr('\000a')||
'  v_comtpr.DESCRIPCION_ACTIVIDAD := upper(:P311_COMTPR_DESCRIPCION_ACT);'||unistr('\000a')||
'  v_comtpr.EMAIL                 := lower(:P311_COMTPR_EMAIL);'||unistr('\000a')||
'  v_comtpr.CONDICION_IB          := :P311_COMTPR_CONDICION_IB;'||unistr('\000a')||
'  v_comtpr.NUMERO_INSCRIPCION_IB := :P311_COMTPR_NUMERO_IB;'||unistr('\000a')||
'  v_comtpr.FECHA_INSCRIPCION_IB  := :P311_COMTPR_FECHA_IB;'||unistr('\000a')||
'  v_comtpr.SITUACION           ';

p:=p||'  := ''NUE'';'||unistr('\000a')||
'  v_comtpr.MOTIVO_SITUACION      := null;'||unistr('\000a')||
'  v_comtpr.CBU                   := :P311_COMTPR_CBU;'||unistr('\000a')||
'  v_comtpr.NUMERO_CONVENIO_MULTILATERAL := :P311_COMTPR_NUMERO_CVML;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  COM_PKG.INS_COMTPR(p_comtpr => v_comtpr);'||unistr('\000a')||
'  --'||unistr('\000a')||
'  :P311_COMTPR_ID := v_comtpr.ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  -- Agrega un registro de proveedores'||unistr('\000a')||
'      '||unistr('\000a')||
'      select COMTPG_ID.nextval'||unistr('\000a')||
'      into v_comtpg.ID'||unistr('\000a')||
'      from dual;'||unistr('\000a')||
''||unistr('\000a')||
'      v_comt';

p:=p||'pg.COMTPR_ID   := nvl(:P311_COMTPR_ID, v_comtpr.ID);'||unistr('\000a')||
'      v_comtpg.COMRGP_ID   := nvl(:P310_COMPRG_ID, 1);'||unistr('\000a')||
'      v_comtpg.OPERACION   := ''REG'';'||unistr('\000a')||
'      v_comtpg.OBSERVACION := null;  '||unistr('\000a')||
'      COM_PKG.INS_COMTPG(p_comtpg => v_comtpg);'||unistr('\000a')||
'  --    '||unistr('\000a')||
'  -- Si no se solicita responsable, generar al proveedor como responsable de si mismo.'||unistr('\000a')||
'  IF :P311_COMPRT_SOLICITAR_RESP = ''NO'' AND :P311_COMRES_ID IS NULL THEN'||unistr('\000a')||
'';

p:=p||'    --'||unistr('\000a')||
'    DECLARE'||unistr('\000a')||
'      v_comres  COM_RESPONSABLES%rowtype;'||unistr('\000a')||
'      v_comtps  COM_TRAMITES_PRV_RES%rowtype;'||unistr('\000a')||
'      '||unistr('\000a')||
'    BEGIN'||unistr('\000a')||
'      --'||unistr('\000a')||
'      v_comres.ID := COMRES_ID.nextval;'||unistr('\000a')||
'      --'||unistr('\000a')||
'      v_comres.COMRST_ID        := :P311_COMRST_ID;'||unistr('\000a')||
'      v_comres.TIPO_DOCUMENTO   := ''CUIT'';'||unistr('\000a')||
'      v_comres.NUMERO_DOCUMENTO := :P311_COMTPR_CUIT;'||unistr('\000a')||
'      v_comres.NOMBRE           := upper(:P311_COMTPR_NOMBRE);'||unistr('\000a')||
'      ';

p:=p||'v_comres.EMAIL            := lower(:P311_COMTPR_EMAIL);'||unistr('\000a')||
'      v_comres.OBSERVACION      := null;'||unistr('\000a')||
'      --'||unistr('\000a')||
'      COM_PKG.INS_COMRES(p_comres=> v_comres);'||unistr('\000a')||
'      --      '||unistr('\000a')||
'      '||unistr('\000a')||
'      v_comtps.ID := COMTPS_ID.NEXTVAL;'||unistr('\000a')||
'      --'||unistr('\000a')||
'      v_comtps.COMTPR_ID := :P311_COMTPR_ID;'||unistr('\000a')||
'      v_comtps.COMRES_ID := v_comres.ID;'||unistr('\000a')||
'      v_comtps.OPERACION := ''REG'';      '||unistr('\000a')||
'      COM_PKG.INS_COMTPS(p_comtps => v_comtps);'||unistr('\000a')||
' ';

p:=p||'     --'||unistr('\000a')||
'      :P311_COMRES_ID := v_comres.ID;'||unistr('\000a')||
'      :P311_COMTPS_ID := v_comtps.ID;'||unistr('\000a')||
'      --'||unistr('\000a')||
'    END;'||unistr('\000a')||
'    --'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 57496022022557835 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 311,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'CrearTramite',
  p_process_sql_clob => p,
  p_process_error_message=> 'No se han podido registrar los datos de la solicitud.',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=>'P311_COMTPR_ID',
  p_process_when_type=>'ITEM_IS_NULL',
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
'  cursor cr_datos is'||unistr('\000a')||
'  select comrst.id'||unistr('\000a')||
'  from com_responsables_tipos comrst'||unistr('\000a')||
'  where comrst.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'    and comrst.codigo = ''RESPRV'';'||unistr('\000a')||
'begin'||unistr('\000a')||
'  open cr_datos;'||unistr('\000a')||
'  fetch cr_datos into :P311_COMRST_ID;'||unistr('\000a')||
'  close cr_datos;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 57495410127557832 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 311,
  p_process_sequence=> 100,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ObtenerTipoResponsableProveedor',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P205_COMRST_ID',
  p_process_when_type=>'ITEM_IS_NULL',
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
'  cursor cr_datos is'||unistr('\000a')||
'  select comprt.tipo_persona, comprt.solicitar_responsable_sn'||unistr('\000a')||
'  from com_proveedores_tipos comprt'||unistr('\000a')||
'  where comprt.ID = :P310_COMPRT_ID;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  open cr_datos;'||unistr('\000a')||
'  fetch cr_datos into :P311_COMPRT_TIPO_PERSONA,:P311_COMPRT_SOLICITAR_RESP;'||unistr('\000a')||
'  close cr_datos;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 57511612574775921 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 311,
  p_process_sequence=> 110,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ObtenerDatosTipoProveedor',
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
-- ...updatable report columns for page 311
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
