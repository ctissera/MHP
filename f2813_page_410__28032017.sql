set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end;
/
 
 
--application/set_environment
prompt  APPLICATION 2813 - Compras - Portal para Proveedor - Mobile
--
-- Application Export:
--   Application:     2813
--   Name:            Compras - Portal para Proveedor - Mobile
--   Date and Time:   10:58 Martes Marzo 28, 2017
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
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,2813);
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
 
end;
/

PROMPT ...Remove page 410
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>410);
 
end;
/

 
--application/pages/page_00410
prompt  ...PAGE 410: Ordenes
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 410
 ,p_user_interface_id => 60353909798266162 + wwv_flow_api.g_id_offset
 ,p_name => 'Ordenes'
 ,p_step_title => 'Ordenes'
 ,p_step_sub_title => 'Ordenes'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_page_is_public_y_n => 'N'
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'CTISSERA'
 ,p_last_upd_yyyymmddhh24miss => '20170328105809'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select comocm.id comocm_id'||unistr('\000a')||
'     , comocm.comprv_id comprv_id'||unistr('\000a')||
'     , comped.ejercicio comped_ejercicio'||unistr('\000a')||
'     , comped.codigo comped_codigo'||unistr('\000a')||
'     , comped.codigo||''/''||comped.ejercicio comped_codigo_ejercicio'||unistr('\000a')||
'     , comped.fecha_entrega comped_fecha_entrega'||unistr('\000a')||
'     , (select comcob.nombre'||unistr('\000a')||
'       from  com_catalogo_objetos comcob'||unistr('\000a')||
'       where comcob.id = comped.comcob_id ) comcob_nombre     '||unistr('\000a')||
'     , comctt';

s:=s||'.id comctt_id'||unistr('\000a')||
'     , comctt.nombre comctt_nombre'||unistr('\000a')||
'     , comcon.codigo comcon_codigo'||unistr('\000a')||
'     , comcon.codigo||''/''||comped.ejercicio comcon_codigo_ejercicio'||unistr('\000a')||
'     , gral_pkg.obtn_cfgabr(''COM_CONTRATACIONES_EST.ESTADO'',comcon.comcoe_estado) comcoe_estado_abr'||unistr('\000a')||
'     , comocm.codigo comocm_codigo'||unistr('\000a')||
'     , ''Orden de Compra: ''||comocm.codigo||''/''||comped.ejercicio orden'||unistr('\000a')||
'     , comocm.codigo||''/''||comped.ejercici';

s:=s||'o comocm_codigo_ejercicio'||unistr('\000a')||
'     , comocm.fecha_generacion fecha_generacion'||unistr('\000a')||
'     , comocm.fecha_max_calificacion fecha_entrega'||unistr('\000a')||
'     , comocm.monto comocm_monto'||unistr('\000a')||
'     , ''f?p=ADMCOM:OCMDET:&SESSION.::NO:891:P891_ID,P891_APP_ANTERIOR,P891_PAG_ANTERIOR:''||COMOCM.ID||'',&APP_ID.,&APP_PAGE_ID.'' LINK'||unistr('\000a')||
'     , gral_pkg.obtn_cfgabr(''COM_ORDENES_COMPRAS_EST.ESTADO'',comocm.comoce_estado) comoce_estado_abr'||unistr('\000a')||
'    , nv';

s:=s||'l(COM_PKG.OBTN_COMCLF_CLFMOT(COMOCM.ID),''PENDIENTE'') COMOCM_CLFMOT_IMG'||unistr('\000a')||
'    , nvl((select max(gral_pkg.obtn_cfgabr(''COM_CALIFICACIONES_TMO.CALIFICACION'',comclf.calificacion)) calificacion_abr'||unistr('\000a')||
'             from com_calificaciones comclf'||unistr('\000a')||
'            where comclf.comocm_id = comocm.id'||unistr('\000a')||
'              and comclf.situacion = ''VAL''),''PENDIENTE'') comocm_clf'||unistr('\000a')||
'   ,''#WORKSPACE_IMAGES#negativa.png'' image'||unistr('\000a')||
'   ,''<i';

s:=s||'mg src="#WORKSPACE_IMAGES#negativa.png">'' image2'||unistr('\000a')||
'   , decode(comocm.comoce_estado,''NUE'','''',''ANU'','''',''RCH'','''',''APR'','''',COM_PKG.COMREP_REPLICAR_SN(p_comocm_id => comocm.id,p_origen => ''PRV'')) comocm_clfrep_sn'||unistr('\000a')||
'from com_ordenes_compras comocm'||unistr('\000a')||
'-- , com_ordenes_compras_est comoce'||unistr('\000a')||
'   , com_contrataciones comcon'||unistr('\000a')||
'-- , com_contrataciones_est comcoe'||unistr('\000a')||
'   , com_contrataciones_tipos comctt'||unistr('\000a')||
'   , com_pedidos compe';

s:=s||'d'||unistr('\000a')||
'where comocm.comcon_id = comcon.id'||unistr('\000a')||
'--and comocm.comoce_id = comoce.id'||unistr('\000a')||
'  and comcon.comctt_id = comctt.id'||unistr('\000a')||
'  and comocm.comped_id = comped.id'||unistr('\000a')||
'--and comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'  and comocm.comoce_estado not in (''NUE'',''PEN'',''ANU'')  '||unistr('\000a')||
'  and trunc(sysdate) > trunc( com_pkg.DIA_HABIL_PROXIMO( comocm_pkg.OBTN_COMOCM_FECHA_GENERACION(comocm.comcon_id, comocm.comprv_id) ,to_number(:P1_SEGORG_ID), 5) )'||unistr('\000a')||
'  ';

s:=s||'and comocm.comprv_id = :P1_COMPRV_ID'||unistr('\000a')||
'  and comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'&P410_WHERE.';

wwv_flow_api.create_page_plug (
  p_id=> 60967821618123432 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_plug_name=> 'Ordenes',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 60352131206266104+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'NATIVE_JQM_LIST_VIEW',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 4,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'ADVANCED_FORMATTING',
  p_attribute_05 => '<a rel="external" href="&LINK.">'||unistr('\000a')||
'<h4>&ORDEN.</h4>'||unistr('\000a')||
'<p>Rubro: <b>&COMCOB_NOMBRE.</b></p>'||unistr('\000a')||
'<p>Expediente: <b>&COMPED_EXPEDIENTE.</b></p>'||unistr('\000a')||
'<P>Fecha Generada: <b>&FECHA_GENERACION.</b> Fecha Entrega: <b>&FECHA_ENTREGA.</b></p>'||unistr('\000a')||
'<p>Estado: <b>&COMOCE_ESTADO_ABR.</b> Calificación: <b>&COMOCM_CLF.</b></p>'||unistr('\000a')||
'</a>',
  p_attribute_08 => 'COMOCM_MONTO',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 60968232762123462 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 410,
  p_button_sequence=> 20,
  p_button_plug_id => 60356225485266240+wwv_flow_api.g_id_offset,
  p_button_name    => 'INICIO',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Inicio',
  p_button_position=> 'REGION_TEMPLATE_NEXT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::',
  p_button_css_classes=>'"ui-btn-right"',
  p_button_cattributes=>'data-icon="home"',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 60968428383123468 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 410,
  p_button_sequence=> 10,
  p_button_plug_id => 60356521260266245+wwv_flow_api.g_id_offset,
  p_button_name    => 'RETORNAR',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(60353421359266132+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Retornar',
  p_button_position=> 'TEMPLATE_DEFAULT',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::',
  p_button_cattributes=>'data-icon="back" ',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>60968000160123440 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 410,
  p_name=>'P410_FILTRO_PREDEFINIDO_SEL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 60967821618123432+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_post_element_text=>'<br>',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'STATIC2:Ordenes Pendientes de Entrega;OPDE,Ordenes con Calificaciones para Revisar;OCCPR',
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
  p_field_template=> 60353006479266128+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'SUBMIT',
  p_attribute_03 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>60969014858123470 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 410,
  p_name=>'P410_WHERE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
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
  p_attribute_01 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>61245425846216385 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 410,
  p_name=>'P410_COMOCE_ESTADO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 60967821618123432+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Estado',
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
  p_field_template=> 60353006479266128+wwv_flow_api.g_id_offset,
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
  p_id=>61245730579229464 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 410,
  p_name=>'P410_COMCLF_CALIFICACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 60967821618123432+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Calificacion',
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
  p_field_template=> 60353006479266128+wwv_flow_api.g_id_offset,
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
  p_id=>61245927547246060 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 410,
  p_name=>'P410_COMOCM_CLFREP_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 60967821618123432+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Replica Habilitada',
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
  p_field_template=> 60353006479266128+wwv_flow_api.g_id_offset,
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
p:=p||'P410_COMOCE_ESTADO,P410_COMCLF_CALIFICACION,P410_COMOCM_CLFREP_SN';

wwv_flow_api.create_page_process(
  p_id     => 61247716918290870 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 410,
  p_process_sequence=> 1,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'CLEAR_CACHE_FOR_ITEMS',
  p_process_name=> 'Restablecer',
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
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||':P410_WHERE := NULL;'||unistr('\000a')||
'if :P410_FILTRO_PREDEFINIDO_SEL = ''OPDE'' then'||unistr('\000a')||
'  :P410_COMOCE_ESTADO := ''APR'';'||unistr('\000a')||
'elsif :P410_FILTRO_PREDEFINIDO_SEL = ''OCCPR'' then'||unistr('\000a')||
'  :P410_COMOCM_CLFREP_SN := ''SI'';'||unistr('\000a')||
'  :P410_WHERE := :P410_WHERE||'' AND comocm.comoce_estado <>''''APR'''''';'||unistr('\000a')||
'end if;'||unistr('\000a')||
'if nvl(:P410_COMOCE_ESTADO,''0'') <> ''0'' then'||unistr('\000a')||
'  :P410_WHERE := :P410_WHERE||'' AND comocm.comoce_estado = ''''''||:P410_COMOCE_ESTADO||'''''''';'||unistr('\000a')||
'end i';

p:=p||'f;  '||unistr('\000a')||
'if nvl(:P410_COMOCM_CLFREP_SN,''0'') <> ''0'' then'||unistr('\000a')||
'  :P410_WHERE := :P410_WHERE||'' AND decode(comocm.comoce_estado,''''NUE'''','''''''',''''ANU'''','''''''',''''RCH'''','''''''',''''APR'''','''''''',COM_PKG.COMREP_REPLICAR_SN(p_comocm_id => comocm.id,p_origen => ''''PRV'''')) = ''''''||:P410_COMOCM_CLFREP_SN||'''''''';'||unistr('\000a')||
'end if;  '||unistr('\000a')||
'if nvl(:P410_COMCLF_CALIFICACION,''X'') <> ''X'' then'||unistr('\000a')||
'   IF :P410_COMCLF_CALIFICACION <> ''PENDIENTE'' then'||unistr('\000a')||
'    :P410';

p:=p||'_WHERE := :P410_WHERE||'' AND exists (select 1 from com_calificaciones comclf where comclf.comocm_id = comocm.id and comclf.situacion = ''''VAL'''' and comclf.calificacion = ''''''||:P410_COMCLF_CALIFICACION||'''''')'';'||unistr('\000a')||
'   else'||unistr('\000a')||
'    :P410_WHERE := :P410_WHERE||'' AND not exists (select 1 from com_calificaciones comclf where comclf.comocm_id = comocm.id and comclf.situacion = ''''VAL'''')'';'||unistr('\000a')||
'   end if;'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
':P4';

p:=p||'10_WHERE := :P410_WHERE||'' ORDER BY TO_NUMBER(decode(comocm.comoce_estado,''''APR'''',''''1'''',decode(COM_PKG.COMREP_REPLICAR_SN(p_comocm_id => comocm.id,p_origen => ''''PRV''''),''''SI'''',''''2'''',''''3''''))) asc, comocm.fecha_generacion desc'';';

wwv_flow_api.create_page_process(
  p_id     => 60969209990123473 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 410,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Asignar Where',
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
-- ...updatable report columns for page 410
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
