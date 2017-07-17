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
--   Date and Time:   13:35 Lunes Junio 5, 2017
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

PROMPT ...Remove page 808
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>808);
 
end;
/

 
--application/pages/page_00808
prompt  ...PAGE 808: Contrataciones - Verificar - Enviar a Tramix - Resumen
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 808
 ,p_user_interface_id => 70527406842675 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'ADMINISTRACION'
 ,p_name => 'Contrataciones - Verificar - Enviar a Tramix - Resumen'
 ,p_step_title => 'Contrataciones - Verificar - Enviar a Tramix - Resumen'
 ,p_allow_duplicate_submissions => 'N'
 ,p_on_dup_submission_goto_url => 'f?p=&APP_ID.:2:&SESSION.:::::'
 ,p_step_sub_title => 'Contrataciones - Verificar - Enviar a Tramix - Resumen'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
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
'  '||unistr('\000a')||
'<div id="AjaxLoading" style="display:none;">Procesando.... Por favor espere...<br />'||unistr('\000a')||
'   <img src="#IMAGE_PREFIX#processing3.gif" id="wait" />'||unistr('\000a')||
'</div> '
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 15952704619548666 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'<script type="text/javascript">   '||unistr('\000a')||
''||unistr('\000a')||
'   function html_Submit_Progress(pThis){   '||unistr('\000a')||
'     $x_Show(''AjaxLoading'');  '||unistr('\000a')||
'     $s("AjaxLoading",$x("AjaxLoading").innerHTML);'||unistr('\000a')||
'     doSubmit(''APPLY_CHANGES'');   '||unistr('\000a')||
'   }   '||unistr('\000a')||
''||unistr('\000a')||
'</script>'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'CTISSERA'
 ,p_last_upd_yyyymmddhh24miss => '20170426083545'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'if :P1_COMCON_ACTUACION_SN = ''SI'' then'||unistr('\000a')||
'   htp.print('''||unistr('\000a')||
'      <table>'||unistr('\000a')||
'         <tr>'||unistr('\000a')||
'            <td>'||unistr('\000a')||
'               <img src="#IMAGE_PREFIX#menu/TramixA_t.png" width="60px" height="60px"/>'||unistr('\000a')||
'            </td>'||unistr('\000a')||
'            <td>'||unistr('\000a')||
'               <font color="red"><b>ATENCIÓN!!</b></font><br>'||unistr('\000a')||
'               Ha solicitado enviar a Tramix como Actuación los Documentos del Proceso de Contratación.<br><br>'||unistr('\000a')||
'    ';

s:=s||'           La presente operación generará como Actuación en el Sistema Tramix el Documento de:'||unistr('\000a')||
'               <br><br>'||unistr('\000a')||
'               <ol>'||unistr('\000a')||
'                  <li> <b>PROCESO DE CONTRATACION</b></li>'||unistr('\000a')||
'                  <li> <b>EVALUACION DE CONTRATACION</b></li>'||unistr('\000a')||
'                  <ul>'||unistr('\000a')||
'                     <li> <b>y sus correspondientes archivos adjuntos.</b></li>'||unistr('\000a')||
'                  </ul>'||unistr('\000a')||
'             ';

s:=s||'     <li> <b>COTIZACIONES DE LOS PROVEEDORES</b></li>'||unistr('\000a')||
'                  <ul>'||unistr('\000a')||
'                     <li> <b>y sus correspondientes archivos adjuntos.</b></li>'||unistr('\000a')||
'                  </ul>'||unistr('\000a')||
'               </ol>'||unistr('\000a')||
'               <br>'||unistr('\000a')||
'               <br><br>'||unistr('\000a')||
'            </td>'||unistr('\000a')||
'         </tr>'||unistr('\000a')||
'      </table>'');'||unistr('\000a')||
'end if;';

wwv_flow_api.create_page_plug (
  p_id=> 24844406859552155 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 808,
  p_plug_name=> 'Enviar a Tramix Contratación Verificada',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 40,
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 24845608007552177 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 808,
  p_plug_name=> 'Detalle de &P1_COMETQ_COM.',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_2',
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
  p_id=> 24848815624552183 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 808,
  p_plug_name=> 'Detalle de Fechas Pautadas',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_2',
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
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => ':P808_FECHA_PUBLICACION IS NOT NULL',
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
  p_id=> 24850815111552188 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 808,
  p_plug_name=> 'Contrataciones - Verificar - Enviar a Tramix - Resumen',
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
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 24844806608552169 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 808,
  p_button_sequence=> 10,
  p_button_plug_id => 24844406859552155+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancelar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:811:&SESSION.::&DEBUG.:808::',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 24844625750552163 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 808,
  p_button_sequence=> 40,
  p_button_plug_id => 24844406859552155+wwv_flow_api.g_id_offset,
  p_button_name    => 'Anular',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Enviar a Tramix',
  p_button_position=> 'REGION_TEMPLATE_NEXT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:html_Submit_Progress(this);',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'if :P1_COMCON_ACTUACION_SN = ''NO'' then'||unistr('\000a')||
'   return true;'||unistr('\000a')||
'else'||unistr('\000a')||
'   return false;'||unistr('\000a')||
'end if;',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>24853602275552227 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:809:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 20,
  p_branch_condition_type=> 'REQUEST_EQUALS_CONDITION',
  p_branch_condition=> 'APPLY_CHANGES',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>24845208787552170 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_MOTIVO_SITUACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 190,
  p_item_plug_id => 24844406859552155+wwv_flow_api.g_id_offset,
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
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>24845402812552177 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_COMPED_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_item_plug_id => 24844406859552155+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comped Id',
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
  p_id=>24845805422552178 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_COMCOE_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 230,
  p_item_plug_id => 24845608007552177+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comcoe Id',
  p_source=>'COMCOE_ID',
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
  p_id=>24846018005552178 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_CONSULTAS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 96,
  p_item_plug_id => 24845608007552177+wwv_flow_api.g_id_offset,
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
  p_id=>24846204183552178 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_PLAZO_ENTREGA_DIAS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 55,
  p_item_plug_id => 24845608007552177+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Plazo de Entrega :',
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
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
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
  p_id=>24846405381552178 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_METODO_ADJUDICACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 95,
  p_item_plug_id => 24845608007552177+wwv_flow_api.g_id_offset,
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
  p_colspan=> 3,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>24846627555552180 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_OBSERVACIONES',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 97,
  p_item_plug_id => 24845608007552177+wwv_flow_api.g_id_offset,
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
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
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
  p_id=>24846808751552180 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 15,
  p_item_plug_id => 24845608007552177+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
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
  p_id=>24847011869552180 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_VIGENCIA_OFERTA_DIAS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 90,
  p_item_plug_id => 24845608007552177+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Vigencia de la Oferta :',
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
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
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
  p_id=>24847205255552181 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_COMCTT_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 24845608007552177+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tipo de Contrataciones :',
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
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'style="font-weight:bold;"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>24847422132552181 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_FORMA_PAGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 24845608007552177+wwv_flow_api.g_id_offset,
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
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'style="font-weight:bold;"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
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
  p_id=>24847628770552181 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_MONTO_PRESUPUESTO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 24845608007552177+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Monto Presupuestado :',
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
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
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
  p_id=>24847827384552181 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_OBJETO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 35,
  p_item_plug_id => 24845608007552177+wwv_flow_api.g_id_offset,
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
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
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
  p_id=>24848001539552181 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_MOTIVO2',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 170,
  p_item_plug_id => 24845608007552177+wwv_flow_api.g_id_offset,
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
  p_id=>24848216843552181 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_ESTADO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 165,
  p_item_plug_id => 24845608007552177+wwv_flow_api.g_id_offset,
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
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>24848426385552183 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_ESPACIO_BLANCO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 163,
  p_item_plug_id => 24845608007552177+wwv_flow_api.g_id_offset,
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
  p_field_template=> 142039363292227113+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>24848601525552183 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_COMCON_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 24845608007552177+wwv_flow_api.g_id_offset,
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
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
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
  p_id=>24849026722552184 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_FECHA_FIN_ACLARACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 137,
  p_item_plug_id => 24848815624552183+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha Fin Aclaración : ',
  p_format_mask=>'DD/MM/YYYY HH24:MI',
  p_source=>'FECHA_FIN_ACLARACION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DATE_PICKER',
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
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039553452227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
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
  p_id=>24849229629552184 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_FECHA_LIMITE_PREGUNTA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 105,
  p_item_plug_id => 24848815624552183+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
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
  p_colspan=> 1,
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
  p_id=>24849407919552184 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_FECHA_APERTURA_PROPUESTA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 139,
  p_item_plug_id => 24848815624552183+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
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
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>24849614934552184 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_FECHA_INICIO_PROPUESTA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 110,
  p_item_plug_id => 24848815624552183+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Inicio de la Propuesta :',
  p_format_mask=>'MM/DD/YYYY HH24:MI',
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
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>24849832272552184 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_FECHA_FIN_PROPUESTA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 135,
  p_item_plug_id => 24848815624552183+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fin de la Propuesta :',
  p_format_mask=>'DD/MM/YYYY HH24:MI',
  p_source=>'FECHA_INICIO_PROPUESTA',
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
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>24850012863552184 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_FECHA_PUBLICACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 100,
  p_item_plug_id => 24848815624552183+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
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
  p_colspan=> 1,
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
  p_id=>24850208059552184 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_FECHA_ESTIMADA_ADJUDICACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 150,
  p_item_plug_id => 24848815624552183+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Adjudicación :',
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
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>24850403840552186 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_FECHA_INICIO_EVALUACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 140,
  p_item_plug_id => 24848815624552183+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
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
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>24851307360552213 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_INTENV_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 180,
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
  p_id=>24851516034552213 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_INTENE_ESTADO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 200,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'INTENE_ESTADO',
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
  p_id=>24851709363552213 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_INTENE_ESTADO_ABR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 210,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'INTENE_ESTADO_ABR',
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
  p_id=>24851927211552213 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_INTENE_MOTIVO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 220,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'INTENE_MOTIVO',
  p_source_type=> 'STATIC',
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
  p_id=>25063019369972745 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_INTENV_ID2',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 240,
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
  p_id=>25063227334975108 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_INTENE_ESTADO2',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 250,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'INTENE_ESTADO',
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
  p_id=>25063409457979339 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_INTENE_ESTADO_ABR2',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 260,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'INTENE_ESTADO_ABR',
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
  p_id=>25063618115981883 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_INTENE_MOTIVO2',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 270,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'INTENE_MOTIVO',
  p_source_type=> 'STATIC',
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
  p_id=>36787417026802909 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 808,
  p_name=>'P808_INTENE_MOTIVO3',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 280,
  p_item_plug_id => 24850815111552188+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'INTENE_ESTADO',
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

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'F|#OWNER#:COM_CONTRATACIONES_V:P808_COMCON_ID:ID';

wwv_flow_api.create_page_process(
  p_id     => 24852708360552223 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 808,
  p_process_sequence=> 50,
  p_process_point=> 'AFTER_HEADER',
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
p:=p||'DECLARE'||unistr('\000a')||
'   --A pedido de Sebastián Anzulovich al momento de enviar a Tramix se cambia el orden de envío de comprobantes'||unistr('\000a')||
'   --	1) Primero en enviar actuación código PROSEC '||unistr('\000a')||
'   --	2) a continuación seguir con el siguiente orden COTZAC (cotizaciones existentes) '||unistr('\000a')||
'   --	3) y por ultimo INFSEC'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_conf is'||unistr('\000a')||
'   select valor '||unistr('\000a')||
'   from seg_configuraciones'||unistr('\000a')||
'   where segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'   a';

p:=p||'nd codigo = ''COMCON_SRVINT_TRAMIX_HABILITADO_SN'';'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_comctz (p_comcon_id number) is'||unistr('\000a')||
'   select * '||unistr('\000a')||
'   from com_cotizaciones'||unistr('\000a')||
'   where comcon_id = p_comcon_id'||unistr('\000a')||
'   and situacion=''PRE'';'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_intenv (p_intenv_id number) is'||unistr('\000a')||
'   select intene_estado, intene_estado_abr, intene_motivo_estado '||unistr('\000a')||
'   from int_envios_v'||unistr('\000a')||
'   where id = p_intenv_id;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_comprv (p_comprv_id nu';

p:=p||'mber) is'||unistr('\000a')||
'   select * '||unistr('\000a')||
'   from com_proveedores'||unistr('\000a')||
'   where id = p_comprv_id;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   v_comctz              com_cotizaciones%ROWTYPE;'||unistr('\000a')||
'   v_comprv              com_proveedores%ROWTYPE;'||unistr('\000a')||
'   v_habilitado          varchar2(10);'||unistr('\000a')||
'   --'||unistr('\000a')||
'   v_intene_estado       varchar2(200);'||unistr('\000a')||
'   v_intene_estado_abr   varchar2(200);'||unistr('\000a')||
'   v_intene_motivo       varchar2(200);'||unistr('\000a')||
'   v_intenv_id           number;'||unistr('\000a')||
'   --'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'   --'||unistr('\000a')||
'   f';

p:=p||'or v_conf in cr_conf loop'||unistr('\000a')||
'         if v_conf.valor = ''SI'' then'||unistr('\000a')||
'            v_habilitado := ''SI'';'||unistr('\000a')||
'         else'||unistr('\000a')||
'            v_habilitado := ''NO'';'||unistr('\000a')||
'         end if;'||unistr('\000a')||
'   end loop;'||unistr('\000a')||
''||unistr('\000a')||
'   --++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'||unistr('\000a')||
'   -- Si la Integracion esta habilitada entonces enviamos el informe de Evaluación.'||unistr('\000a')||
'   --+++++++++++++++++++++++++++++++++++++++++++++';

p:=p||'+++++++++++++++++++++++++++++++++++++++'||unistr('\000a')||
''||unistr('\000a')||
'   if v_habilitado = ''SI'' then'||unistr('\000a')||
'      --++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'||unistr('\000a')||
'      --Enviamos el PROCESO DE CONTRATACION  ''PROSEC'''||unistr('\000a')||
'      --++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'||unistr('\000a')||
'      begin'||unistr('\000a')||
'      com_pkg.comcon_verificar_transmitir ( P_SEGORG_ID  => :P1_SEGORG_ID'||unistr('\000a')||
'  ';

p:=p||'                                        , P_COMCON_ID  => :P808_COMCON_ID '||unistr('\000a')||
'                                          , P_INTENV_ID  => :P808_INTENV_ID );'||unistr('\000a')||
'      exception'||unistr('\000a')||
'        when others then'||unistr('\000a')||
'            raise_application_error(-20000,''Error al Enviar el Proceso de Contratación'',true);'||unistr('\000a')||
'      end;'||unistr('\000a')||
'      --'||unistr('\000a')||
'   end if;'||unistr('\000a')||
''||unistr('\000a')||
'   --+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++';

p:=p||'+++++++++++'||unistr('\000a')||
'   -- Para todas las cotizaciones presentadas en una contratación  ''COTZAC'''||unistr('\000a')||
'   --++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'||unistr('\000a')||
''||unistr('\000a')||
'      for v_comctz in cr_comctz (:P808_COMCON_ID) loop'||unistr('\000a')||
'         --'||unistr('\000a')||
'         begin'||unistr('\000a')||
'         COM_PKG.comctz_transmitir(P_SEGORG_ID => :P1_SEGORG_ID,'||unistr('\000a')||
'                                   P_COMCTZ_ID => v_comctz.id,'||unistr('\000a')||
'           ';

p:=p||'                        P_MOTIVO    => :P808_MOTIVO3,'||unistr('\000a')||
'                                   P_INTENV_ID => v_intenv_id);'||unistr('\000a')||
'         exception'||unistr('\000a')||
'          when others then'||unistr('\000a')||
'              raise_application_error(-20000,''Error al Enviar la Cotización ID: ''||v_comctz.id||'' presentada'',true);'||unistr('\000a')||
'         end;'||unistr('\000a')||
'         --'||unistr('\000a')||
'         --'||unistr('\000a')||
'         -- Obtengo el estado del envío para mostrarlos en la pantalla'||unistr('\000a')||
'         -';

p:=p||'- '||unistr('\000a')||
'         open cr_intenv(v_intenv_id);'||unistr('\000a')||
'         fetch cr_intenv'||unistr('\000a')||
'         into  v_intene_estado'||unistr('\000a')||
'             , v_intene_estado_abr'||unistr('\000a')||
'             , v_intene_motivo;'||unistr('\000a')||
'         close cr_intenv;'||unistr('\000a')||
'         --'||unistr('\000a')||
'         open cr_comprv(v_comctz.comprv_id);'||unistr('\000a')||
'         fetch cr_comprv into v_comprv;'||unistr('\000a')||
'         close cr_comprv;'||unistr('\000a')||
'         --'||unistr('\000a')||
'         if v_intene_estado = ''ENV'' then'||unistr('\000a')||
'            :P808_INTENE_MOTIVO3 :';

p:=p||'= :P808_INTENE_MOTIVO3 || ''Cotización : ''     || v_comctz.observacion || ''<br>'' '||unistr('\000a')||
'                                                         || ''<font color="green" size="14"><b>'' '||unistr('\000a')||
'                                                         || ''Proveedor : ''      || v_comprv.nombre      || ''<br>'''||unistr('\000a')||
'                                                         || '' ha sido realizado con éxito'' || ''<br>'''||unistr('\000a')||
'       ';

p:=p||'                                                  || ''</b></font><br>'';'||unistr('\000a')||
'         else'||unistr('\000a')||
'            :P808_INTENE_MOTIVO3 := :P808_INTENE_MOTIVO3 || ''Cotización : ''  || v_comctz.observacion    || ''<br>'''||unistr('\000a')||
'                                                         || ''Proveedor : ''   || v_comprv.nombre         || ''<br>'''||unistr('\000a')||
'                                                         || ''Motivo: ''       || ''<font';

p:=p||' color="red" size="14"><b>'' || v_intene_motivo '||unistr('\000a')||
'                                                         || ''</b></font><br><br>'';'||unistr('\000a')||
''||unistr('\000a')||
'         end if;'||unistr('\000a')||
'         --'||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      --'||unistr('\000a')||
'   if v_habilitado = ''SI'' then'||unistr('\000a')||
'      --'||unistr('\000a')||
'      --++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'||unistr('\000a')||
'      -- Enviamos la EVALUACIÓN DE CONTRATACIÓN ''INFSEC'''||unistr('\000a')||
'      --++++++++++++++++';

p:=p||'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'||unistr('\000a')||
'      begin'||unistr('\000a')||
'      com_pkg.comctz_verificar ( P_SEGORG_ID  => :P1_SEGORG_ID'||unistr('\000a')||
'                               , P_COMCON_ID  => :P808_COMCON_ID '||unistr('\000a')||
'                               , P_INTENV_ID  => :P808_INTENV_ID2 );'||unistr('\000a')||
'      exception'||unistr('\000a')||
'        when others then'||unistr('\000a')||
'            raise_application_error(-20000,''Error al Enviar la Evaluación de la ';

p:=p||'Contratación'',true);'||unistr('\000a')||
'      end;'||unistr('\000a')||
'      --'||unistr('\000a')||
'   end if;'||unistr('\000a')||
'   --'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 24852521555552220 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 808,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Enviar a Tramix',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'APPLY_CHANGES',
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
p:=p||'DECLARE'||unistr('\000a')||
'   cursor cr_conf is'||unistr('\000a')||
'   select valor '||unistr('\000a')||
'   from seg_configuraciones'||unistr('\000a')||
'   where segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'   and codigo = ''COMCON_SRVINT_TRAMIX_HABILITADO_SN'';'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_comctz (p_comcon_id number) is'||unistr('\000a')||
'   select * '||unistr('\000a')||
'   from com_cotizaciones'||unistr('\000a')||
'   where comcon_id = p_comcon_id'||unistr('\000a')||
'   and situacion=''PRE'';'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_intenv (p_intenv_id number) is'||unistr('\000a')||
'   select intene_estado, intene_estado_abr';

p:=p||', intene_motivo_estado '||unistr('\000a')||
'   from int_envios_v'||unistr('\000a')||
'   where id = p_intenv_id;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_comprv (p_comprv_id number) is'||unistr('\000a')||
'   select * '||unistr('\000a')||
'   from com_proveedores'||unistr('\000a')||
'   where id = p_comprv_id;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   v_comctz              com_cotizaciones%ROWTYPE;'||unistr('\000a')||
'   v_comprv              com_proveedores%ROWTYPE;'||unistr('\000a')||
'   v_habilitado          varchar2(10);'||unistr('\000a')||
'   --'||unistr('\000a')||
'   v_intene_estado       varchar2(200);'||unistr('\000a')||
'   v_intene_estado_abr';

p:=p||'   varchar2(200);'||unistr('\000a')||
'   v_intene_motivo       varchar2(200);'||unistr('\000a')||
'   v_intenv_id           number;'||unistr('\000a')||
'   --'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'   --'||unistr('\000a')||
'   for v_conf in cr_conf loop'||unistr('\000a')||
'         if v_conf.valor = ''SI'' then'||unistr('\000a')||
'            v_habilitado := ''SI'';'||unistr('\000a')||
'         else'||unistr('\000a')||
'            v_habilitado := ''NO'';'||unistr('\000a')||
'         end if;'||unistr('\000a')||
'   end loop;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   -- Si la Integracion esta habilitada entonces enviamos el informe de Evaluación.'||unistr('\000a')||
'   --'||unistr('\000a')||
'   if v_habilita';

p:=p||'do = ''SI'' then'||unistr('\000a')||
'      --'||unistr('\000a')||
'      --Enviamos el PROCESO DE CONTRATACION '||unistr('\000a')||
'      --'||unistr('\000a')||
'      begin'||unistr('\000a')||
'      com_pkg.comcon_verificar_transmitir ( P_SEGORG_ID  => :P1_SEGORG_ID'||unistr('\000a')||
'                                          , P_COMCON_ID  => :P808_COMCON_ID '||unistr('\000a')||
'                                          , P_INTENV_ID  => :P808_INTENV_ID );'||unistr('\000a')||
'      exception'||unistr('\000a')||
'        when others then'||unistr('\000a')||
'            raise_application_error(-20';

p:=p||'000,''Error al Enviar el Proceso de Contratación'',true);'||unistr('\000a')||
'      end;'||unistr('\000a')||
'      --'||unistr('\000a')||
'      -- Enviamos la EVALUACION DE CONTRATACION '||unistr('\000a')||
'      --'||unistr('\000a')||
'      begin'||unistr('\000a')||
'      com_pkg.comctz_verificar ( P_SEGORG_ID  => :P1_SEGORG_ID'||unistr('\000a')||
'                               , P_COMCON_ID  => :P808_COMCON_ID '||unistr('\000a')||
'                               , P_INTENV_ID  => :P808_INTENV_ID2 );'||unistr('\000a')||
'      exception'||unistr('\000a')||
'        when others then'||unistr('\000a')||
'            rai';

p:=p||'se_application_error(-20000,''Error al Enviar la Evaluación de la Contratación'',true);'||unistr('\000a')||
'      end;'||unistr('\000a')||
'      --'||unistr('\000a')||
'   end if;'||unistr('\000a')||
''||unistr('\000a')||
'   --'||unistr('\000a')||
'   -- Para todas las cotizaciones presentadas en una contratacion'||unistr('\000a')||
'   --'||unistr('\000a')||
''||unistr('\000a')||
'      for v_comctz in cr_comctz (:P808_COMCON_ID) loop'||unistr('\000a')||
'         --'||unistr('\000a')||
'         begin'||unistr('\000a')||
'         COM_PKG.comctz_transmitir(P_SEGORG_ID => :P1_SEGORG_ID,'||unistr('\000a')||
'                                   P_COMCTZ_ID => v_comc';

p:=p||'tz.id,'||unistr('\000a')||
'                                   P_MOTIVO    => :P808_MOTIVO3,'||unistr('\000a')||
'                                   P_INTENV_ID => v_intenv_id);'||unistr('\000a')||
'         exception'||unistr('\000a')||
'          when others then'||unistr('\000a')||
'              raise_application_error(-20000,''Error al Enviar la Cotización ID: ''||v_comctz.id||'' presentada'',true);'||unistr('\000a')||
'         end;'||unistr('\000a')||
'         --'||unistr('\000a')||
'         --'||unistr('\000a')||
'         -- Obtengo el estado del envio para mostrarlos en la p';

p:=p||'antalla'||unistr('\000a')||
'         -- '||unistr('\000a')||
'         open cr_intenv(v_intenv_id);'||unistr('\000a')||
'         fetch cr_intenv'||unistr('\000a')||
'         into  v_intene_estado'||unistr('\000a')||
'             , v_intene_estado_abr'||unistr('\000a')||
'             , v_intene_motivo;'||unistr('\000a')||
'         close cr_intenv;'||unistr('\000a')||
'         --'||unistr('\000a')||
'         open cr_comprv(v_comctz.comprv_id);'||unistr('\000a')||
'         fetch cr_comprv into v_comprv;'||unistr('\000a')||
'         close cr_comprv;'||unistr('\000a')||
'         --'||unistr('\000a')||
'         if v_intene_estado = ''ENV'' then'||unistr('\000a')||
'            :P80';

p:=p||'8_INTENE_MOTIVO3 := :P808_INTENE_MOTIVO3 || ''Cotización : ''     || v_comctz.observacion || ''<br>'' '||unistr('\000a')||
'                                                         || ''<font color="green" size="14"><b>'' '||unistr('\000a')||
'                                                         || ''Proveedor : ''      || v_comprv.nombre      || ''<br>'''||unistr('\000a')||
'                                                         || '' ha sido realizado con éxito''';

p:=p||' || ''<br>'''||unistr('\000a')||
'                                                         || ''</b></font><br>'';'||unistr('\000a')||
'         else'||unistr('\000a')||
'            :P808_INTENE_MOTIVO3 := :P808_INTENE_MOTIVO3 || ''Cotización : ''  || v_comctz.observacion    || ''<br>'''||unistr('\000a')||
'                                                         || ''Proveedor : ''   || v_comprv.nombre         || ''<br>'''||unistr('\000a')||
'                                                         || ''Motivo:';

p:=p||' ''       || ''<font color="red" size="14"><b>'' || v_intene_motivo '||unistr('\000a')||
'                                                         || ''</b></font><br><br>'';'||unistr('\000a')||
''||unistr('\000a')||
'         end if;'||unistr('\000a')||
'         --'||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 367352325816317865 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 808,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Enviar a Tramix - BAK',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'',
  p_process_when_type=>'NEVER',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'-- condicion'||unistr('\000a')||
'--Solicitud = Expresion1'||unistr('\000a')||
'--APPLY_CHANGES');
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
'   v_estado         varchar2(10);'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_intenv(P_INTENV_ID number) is'||unistr('\000a')||
'   select intene_estado, intene_estado_abr, intene_motivo_estado '||unistr('\000a')||
'   from int_envios_v'||unistr('\000a')||
'   where id = P_INTENV_ID;'||unistr('\000a')||
'   --'||unistr('\000a')||
'begin'||unistr('\000a')||
'      --'||unistr('\000a')||
'      -- Obtenemos el estado del envio del PROCESO DE CONTRATACION '||unistr('\000a')||
'      --'||unistr('\000a')||
'      -- Obtengo el estado del envio para mostrarlos en la pantalla'||unistr('\000a')||
'      -- '||unistr('\000a')||
''||unistr('\000a')||
'      open c';

p:=p||'r_intenv(:P808_INTENV_ID);'||unistr('\000a')||
'      fetch cr_intenv '||unistr('\000a')||
'      into  :P808_INTENE_ESTADO'||unistr('\000a')||
'          , :P808_INTENE_ESTADO_ABR'||unistr('\000a')||
'          , :P808_INTENE_MOTIVO;'||unistr('\000a')||
'      close cr_intenv;'||unistr('\000a')||
''||unistr('\000a')||
'      --'||unistr('\000a')||
'      -- Obtenemos el estado del envio de la EVALUACION DE CONTRATACION '||unistr('\000a')||
'      --'||unistr('\000a')||
'      -- Obtengo el estado del envio para mostrarlos en la pantalla'||unistr('\000a')||
'      -- '||unistr('\000a')||
''||unistr('\000a')||
'      open cr_intenv(:P808_INTENV_ID2);'||unistr('\000a')||
'      fetch cr_';

p:=p||'intenv '||unistr('\000a')||
'      into  :P808_INTENE_ESTADO2'||unistr('\000a')||
'          , :P808_INTENE_ESTADO_ABR2'||unistr('\000a')||
'          , :P808_INTENE_MOTIVO2;'||unistr('\000a')||
'      close cr_intenv;'||unistr('\000a')||
'      --'||unistr('\000a')||
''||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 24852321804552219 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 808,
  p_process_sequence=> 50,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'VerificarEstadoDelEnvio',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error en proceso: VerificarEstadoDelEnvio - &P806_INTENV_ID.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'APPLY_CHANGES',
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
'   --'||unistr('\000a')||
'   v_estado         varchar2(10);'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_comcoe is'||unistr('\000a')||
'   select estado '||unistr('\000a')||
'   from com_contrataciones_est'||unistr('\000a')||
'   where id = :P808_COMCOE_ID;'||unistr('\000a')||
'   --'||unistr('\000a')||
'begin'||unistr('\000a')||
'      --'||unistr('\000a')||
'      -- Obtengo el estado del envio para mostrarlos en la pantalla'||unistr('\000a')||
'      -- '||unistr('\000a')||
'      open cr_comcoe;'||unistr('\000a')||
'      fetch cr_comcoe '||unistr('\000a')||
'      into  :P808_ESTADO;'||unistr('\000a')||
'      close cr_comcoe;'||unistr('\000a')||
'      --'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 24853331227552225 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 808,
  p_process_sequence=> 160,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'VerificarEstadoDeLaContratacion',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error en proceso: VerificarEstadoDelEnvio - &P806_INTENV_ID.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'APPLY_CHANGES',
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
p:=p||' DECLARE'||unistr('\000a')||
'--'||unistr('\000a')||
'  CURSOR cr_comcon IS'||unistr('\000a')||
'  SELECT COMCOE_ESTADO'||unistr('\000a')||
'       , COMCOE_MOTIVO'||unistr('\000a')||
'   FROM COM_CONTRATACIONES_V'||unistr('\000a')||
'  WHERE ID = :P808_COMCON_ID;'||unistr('\000a')||
' --'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
' --'||unistr('\000a')||
'  OPEN cr_comcon;'||unistr('\000a')||
'  FETCH cr_comcon INTO :P808_ESTADO, :P808_MOTIVO2;'||unistr('\000a')||
'  CLOSE cr_comcon;'||unistr('\000a')||
' --'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 24852911446552223 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 808,
  p_process_sequence=> 50,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Traer Situacion Motivo Domicilio',
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
'  cursor cr_datos is'||unistr('\000a')||
'  select valor'||unistr('\000a')||
'  from seg_configuraciones_v'||unistr('\000a')||
'  where codigo = ''COMPED_SRVINT_CONDIS_CONTROLA_SN'';'||unistr('\000a')||
'  --'||unistr('\000a')||
'  cursor cr_comped_actuaciones is'||unistr('\000a')||
'  select valor'||unistr('\000a')||
'  from seg_configuraciones_v'||unistr('\000a')||
'  where codigo = ''COMPED_SRVINT_TRAMIX_HABILITADO_SN'';'||unistr('\000a')||
'  --'||unistr('\000a')||
'  cursor cr_comcon_actuaciones is'||unistr('\000a')||
'  select valor'||unistr('\000a')||
'  from seg_configuraciones_v'||unistr('\000a')||
'  where codigo = ''COMCON_SRVINT_TRAMIX_HABILITADO_SN''';

p:=p||';'||unistr('\000a')||
'  --'||unistr('\000a')||
''||unistr('\000a')||
'begin'||unistr('\000a')||
'  for v_datos in cr_datos loop'||unistr('\000a')||
'    :P1_CONTROLA_SN := v_datos.valor;'||unistr('\000a')||
'  end loop;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  for v_comped_actuaciones in cr_comped_actuaciones loop'||unistr('\000a')||
'    :P1_ENVIO_ACTUACION_SN := v_comped_actuaciones.valor;'||unistr('\000a')||
'  end loop;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  for v_comcon_actuaciones in cr_comcon_actuaciones loop'||unistr('\000a')||
'    :P1_COMCON_ACTUACION_SN := v_comcon_actuaciones.valor;'||unistr('\000a')||
'  end loop;'||unistr('\000a')||
'  --'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 24853117138552223 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 808,
  p_process_sequence=> 150,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ObtenerValorParametroControlaSN',
  p_process_sql_clob => p,
  p_process_error_message=> 'Los Parámetros no han podido ser actualizados.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'CHANGE_ACTUACION'||unistr('\000a')||
'',
  p_process_when_type=>'',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'&P1_COMCON_ACTUACION_SN.');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 808
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
