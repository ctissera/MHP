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
--   Date and Time:   10:00 Lunes Junio 26, 2017
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

PROMPT ...Remove page 220
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>220);
 
end;
/

 
--application/pages/page_00220
prompt  ...PAGE 220: Tramite Proveedor - Cambio Nombre/Razon Social - Paso 1
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 220
 ,p_user_interface_id => 70527406842675 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'ADMINISTRACION'
 ,p_name => 'Tramite Proveedor - Cambio Nombre/Razon Social - Paso 1'
 ,p_step_title => 'Tramite Proveedor - Cambio Nombre/Razon Social - Paso 1'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Tramite Proveedor - Cambio Nombre/Razon Social - Paso 1'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_html_page_header => 
'<script language="JavaScript" type="text/javascript">'||unistr('\000a')||
'<!--'||unistr('\000a')||
''||unistr('\000a')||
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'||unistr('\000a')||
''||unistr('\000a')||
'//-->'||unistr('\000a')||
'</script>'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'FKASIAN'
 ,p_last_upd_yyyymmddhh24miss => '20170612182806'
  );
null;
 
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
'  AND rv_low_value = :P220_TIPO;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  CURSOR cr_comprv is'||unistr('\000a')||
'  SELECT *'||unistr('\000a')||
'  FROM COM_PROVEEDORES_V'||unistr('\000a')||
'  WHERE ID = :P220_COMPRV_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  CURSOR cr_comprt (p_comprv_comprt_id number)is'||unistr('\000a')||
'  SELECT ID'||unistr('\000a')||
'       , SEGORG_ID'||unistr('\000a')||
'       , DECODE(TIPO_PERSONA,''FIS'',''Apellido y Nombre'''||unistr('\000a')||
'                    ';

s:=s||'        ,''JUR'',''Razón Social'') codigo'||unistr('\000a')||
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
'  FETCH cr_comprv INTO';

s:=s||' v_comprv;'||unistr('\000a')||
'  CLOSE cr_comprv;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_comprt(p_comprv_comprt_id => v_comprv.comprt_id);'||unistr('\000a')||
'  FETCH cr_comprt INTO v_comprt;'||unistr('\000a')||
'  CLOSE cr_comprt;'||unistr('\000a')||
''||unistr('\000a')||
'htp.print(''<b>TIPO DEL TRÁMITE : ''||v_comtpt.RV_MEANING||'' </b><br><br>'');'||unistr('\000a')||
'htp.print(''<b>Datos de la ''||v_comprt.NOMBRE||'' </b><br>'');'||unistr('\000a')||
'htp.print(v_comprt.CODIGO||'' : <b>''||v_comprv.NOMBRE||''</b><br>'');'||unistr('\000a')||
'htp.print(''CUIT : <b>''||v_comprv.CUIT||''</b><br>'')';

s:=s||';'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_plug (
  p_id=> 18589832724585874 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 220,
  p_plug_name=> 'Paso 1: Datos para Actualizar',
  p_region_name=>'',
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
  p_id=> 18590031271585879 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 220,
  p_plug_name=> 'Indique el nuevo Nombre/Razón Social del &P1_COMETQ_PRVS.',
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
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => 'FUNCTION_BODY',
  p_plug_display_when_condition => 'declare'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_comprt is'||unistr('\000a')||
'   select *'||unistr('\000a')||
'   from com_proveedores_tipos_v'||unistr('\000a')||
'   where id = :P251_COMPRT_ID;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_segpfl is'||unistr('\000a')||
'   select *'||unistr('\000a')||
'   from seg_perfiles'||unistr('\000a')||
'   where codigo in (''AREA_CONTROL_GASTO_INFORMATICA'',''AREA_CONTROL_DOCUMENTACION_PE'',''AREA_JEFATURA'',''AREA_PROVEEDORES_OBRA_PUBLICA'',''AREA_PROVEEDORES_ESTADO'');'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_segusu is'||unistr('\000a')||
'   select *'||unistr('\000a')||
'   from seg_usuarios'||unistr('\000a')||
'   where usuario = v(''APP_USER'');'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_segpus (p_segusu_id number, p_segpfl_id number) is'||unistr('\000a')||
'   select *'||unistr('\000a')||
'   from seg_perfiles_usuarios'||unistr('\000a')||
'   where segusu_id = p_segusu_id'||unistr('\000a')||
'   and segpfl_id = p_segpfl_id;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   v_segusu  seg_usuarios%rowtype;'||unistr('\000a')||
'   v_perfil  boolean := false;'||unistr('\000a')||
'   --'||unistr('\000a')||
'begin'||unistr('\000a')||
''||unistr('\000a')||
'   open cr_segusu;'||unistr('\000a')||
'   fetch cr_segusu into v_segusu;'||unistr('\000a')||
'   close cr_segusu;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   for v_segpfl in cr_segpfl loop'||unistr('\000a')||
'      --'||unistr('\000a')||
'      for v_segpus in cr_segpus(v_segusu.id, v_segpfl.id) loop'||unistr('\000a')||
'         --si el usuario tiene los perfiles admitidos seteo en true'||unistr('\000a')||
'         v_perfil := true;'||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      --'||unistr('\000a')||
'   end loop;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   if v_perfil = true then        '||unistr('\000a')||
'      return true;'||unistr('\000a')||
'   end if;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   for v_comprt in cr_comprt loop'||unistr('\000a')||
'      --es físico pero soy admin'||unistr('\000a')||
'      if v_comprt.codigo = ''JUR'' then        '||unistr('\000a')||
'         return true;'||unistr('\000a')||
'      else '||unistr('\000a')||
'         return false;'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      --      '||unistr('\000a')||
'   end loop;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   return false;'||unistr('\000a')||
'   --'||unistr('\000a')||
'end;',
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
  p_id=> 18590221045585879 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 220,
  p_plug_name=> 'Pasos ',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 18215721080554147 + wwv_flow_api.g_id_offset,
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 18590426124585879 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 220,
  p_plug_name=> 'Ruta de Navegacion',
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
s:=s||'<style>'||unistr('\000a')||
'.msje {'||unistr('\000a')||
'  position: relative;'||unistr('\000a')||
'  top: 15px;'||unistr('\000a')||
'  color:red;'||unistr('\000a')||
'  font-stretch: expanded;'||unistr('\000a')||
'}'||unistr('\000a')||
'.msje-jus {'||unistr('\000a')||
'  padding: 5px;'||unistr('\000a')||
'  width: 620px;'||unistr('\000a')||
'  text-align: justify;'||unistr('\000a')||
'  text-justify: inter-word;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'.msje-der {'||unistr('\000a')||
'  padding: 5px;'||unistr('\000a')||
'  width: 620px;'||unistr('\000a')||
'  text-align: right;'||unistr('\000a')||
'}'||unistr('\000a')||
'</style>'||unistr('\000a')||
''||unistr('\000a')||
'<span class="msje">'||unistr('\000a')||
'   <p class="msje-jus">'||unistr('\000a')||
'      Sr. Proveedor para realizar el cambio de Razón Social para persona física debe hace';

s:=s||'rcarse al Registro de Proveedores del Estado - Programa Compras y Contrataciones con la debida identificación y Constancia de Inscripción de AFIP. Para cualquier consulta al respecto comunicarse al 2664-452010 interno 3149 - 3592 - 3593. '||unistr('\000a')||
'   </p>'||unistr('\000a')||
'   <p class="msje-der">'||unistr('\000a')||
'      Atte.'||unistr('\000a')||
'   </br>'||unistr('\000a')||
'      Programa Compras y Contrataciones'||unistr('\000a')||
'   </p>'||unistr('\000a')||
'</span>';

wwv_flow_api.create_page_plug (
  p_id=> 367720809877914915 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 220,
  p_plug_name=> 'Mensaje',
  p_region_name=>'',
  p_region_css_classes=>' style="width:665; height: 150px;"',
  p_region_attributes=> ' style="width:665; height: 150px;"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142028879771227099+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 50,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_1',
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
  p_plug_display_when_condition => 'declare'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_comprt is'||unistr('\000a')||
'   select *'||unistr('\000a')||
'   from com_proveedores_tipos_v'||unistr('\000a')||
'   where id = :P251_COMPRT_ID;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_segpfl is'||unistr('\000a')||
'   select *'||unistr('\000a')||
'   from seg_perfiles'||unistr('\000a')||
'   where codigo in (''AREA_CONTROL_GASTO_INFORMATICA'',''AREA_CONTROL_DOCUMENTACION_PE'',''AREA_JEFATURA'',''AREA_PROVEEDORES_OBRA_PUBLICA'',''AREA_PROVEEDORES_ESTADO'');'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_segusu is'||unistr('\000a')||
'   select *'||unistr('\000a')||
'   from seg_usuarios'||unistr('\000a')||
'   where usuario = v(''APP_USER'');'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_segpus (p_segusu_id number, p_segpfl_id number) is'||unistr('\000a')||
'   select *'||unistr('\000a')||
'   from seg_perfiles_usuarios'||unistr('\000a')||
'   where segusu_id = p_segusu_id'||unistr('\000a')||
'   and segpfl_id = p_segpfl_id;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   v_segusu  seg_usuarios%rowtype;'||unistr('\000a')||
'   v_perfil  boolean := false;'||unistr('\000a')||
'   --'||unistr('\000a')||
'begin'||unistr('\000a')||
''||unistr('\000a')||
'   open cr_segusu;'||unistr('\000a')||
'   fetch cr_segusu into v_segusu;'||unistr('\000a')||
'   close cr_segusu;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   for v_segpfl in cr_segpfl loop'||unistr('\000a')||
'      --'||unistr('\000a')||
'      for v_segpus in cr_segpus(v_segusu.id, v_segpfl.id) loop'||unistr('\000a')||
'         --si el usuario tiene los perfiles admitidos seteo en true'||unistr('\000a')||
'         v_perfil := true;'||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      --'||unistr('\000a')||
'   end loop;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   if v_perfil = true then        '||unistr('\000a')||
'      return false;'||unistr('\000a')||
'   end if;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   for v_comprt in cr_comprt loop'||unistr('\000a')||
'      if v_comprt.codigo = ''FIS'' then        '||unistr('\000a')||
'         --es físico'||unistr('\000a')||
'         return true;'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      --      '||unistr('\000a')||
'   end loop;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   return true;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   '||unistr('\000a')||
'end;',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 18591532374585885 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 220,
  p_button_sequence=> 10,
  p_button_plug_id => 18589832724585874+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancelar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:251:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 18590920901585885 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 220,
  p_button_sequence=> 20,
  p_button_name    => 'DELETE',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Suprimir',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:confirmDelete(htmldb_delete_message,''DELETE'');',
  p_button_condition=> 'P220_ID',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_database_action=>'DELETE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 18591109345585885 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 220,
  p_button_sequence=> 30,
  p_button_plug_id => 18589832724585874+wwv_flow_api.g_id_offset,
  p_button_name    => 'SAVE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Siguiente >',
  p_button_position=> 'REGION_TEMPLATE_NEXT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'declare'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_comprt is'||unistr('\000a')||
'   select *'||unistr('\000a')||
'   from com_proveedores_tipos_v'||unistr('\000a')||
'   where id = :P251_COMPRT_ID;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_segpfl is'||unistr('\000a')||
'   select *'||unistr('\000a')||
'   from seg_perfiles'||unistr('\000a')||
'   where codigo in (''AREA_CONTROL_GASTO_INFORMATICA'',''AREA_CONTROL_DOCUMENTACION_PE'',''AREA_JEFATURA'',''AREA_PROVEEDORES_OBRA_PUBLICA'',''AREA_PROVEEDORES_ESTADO'');'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_segusu is'||unistr('\000a')||
'   select *'||unistr('\000a')||
'   from seg_usuarios'||unistr('\000a')||
'   where usuario = v(''APP_USER'');'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_segpus (p_segusu_id number, p_segpfl_id number) is'||unistr('\000a')||
'   select *'||unistr('\000a')||
'   from seg_perfiles_usuarios'||unistr('\000a')||
'   where segusu_id = p_segusu_id'||unistr('\000a')||
'   and segpfl_id = p_segpfl_id;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   v_segusu  seg_usuarios%rowtype;'||unistr('\000a')||
'   v_perfil  boolean := false;'||unistr('\000a')||
'   --'||unistr('\000a')||
'begin'||unistr('\000a')||
'   --controlo id no nulo por la condición preexistente al 12/06/2017'||unistr('\000a')||
'   if(nvl(:P220_ID,0)=0) then'||unistr('\000a')||
'      return false;'||unistr('\000a')||
'   end if;'||unistr('\000a')||
'   --nuevo control 12/06/2017'||unistr('\000a')||
'   open cr_segusu;'||unistr('\000a')||
'   fetch cr_segusu into v_segusu;'||unistr('\000a')||
'   close cr_segusu;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   for v_segpfl in cr_segpfl loop'||unistr('\000a')||
'      --'||unistr('\000a')||
'      for v_segpus in cr_segpus(v_segusu.id, v_segpfl.id) loop'||unistr('\000a')||
'         --si el usuario tiene los perfiles admitidos seteo en true'||unistr('\000a')||
'         v_perfil := true;'||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      --'||unistr('\000a')||
'   end loop;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   if v_perfil = true then        '||unistr('\000a')||
'      return true;'||unistr('\000a')||
'   end if;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   for v_comprt in cr_comprt loop'||unistr('\000a')||
'      --es físico pero soy admin'||unistr('\000a')||
'      if v_comprt.codigo = ''JUR'' then        '||unistr('\000a')||
'         return true;'||unistr('\000a')||
'      else '||unistr('\000a')||
'         return false;'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      --      '||unistr('\000a')||
'   end loop;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   return false;'||unistr('\000a')||
'   --'||unistr('\000a')||
'end;',
  p_button_condition_type=> 'FUNCTION_BODY',
  p_database_action=>'UPDATE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>18599230763585901 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 220,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:221:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>18591109345585885+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 20,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>18599411064585901 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 220,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:220:&SESSION.::&DEBUG.:::',
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
  p_id=>18591701237585885 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 220,
  p_name=>'P220_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Id',
  p_source=>'ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
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
  p_id=>18591903043585887 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 220,
  p_name=>'P220_SEGORG_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Segorg Id',
  p_source=>'SEGORG_ID',
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
  p_id=>18592130928585887 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 220,
  p_name=>'P220_FECHA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 5,
  p_item_plug_id => 18590031271585879+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha del Trámite :',
  p_source=>'FECHA',
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
  p_read_only_when_type=>'ALWAYS',
  p_field_template=> 142039363292227113+wwv_flow_api.g_id_offset,
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
  p_id=>18592308872585888 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 220,
  p_name=>'P220_COMPRV_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_use_cache_before_default=> 'NO',
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
  p_id=>18592531619585888 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 220,
  p_name=>'P220_TIPO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'<b>Tipo de Trámite :</b>',
  p_source=>'TIPO',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
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
  p_id=>18592714766585888 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 220,
  p_name=>'P220_COMPRT_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tipo de Proveedor :',
  p_source=>'COMPRT_ID',
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
  p_read_only_when_type=>'ALWAYS',
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
  p_id=>18595301110585893 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 220,
  p_name=>'P220_SITUACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 150,
  p_item_plug_id => 18590031271585879+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Situación :',
  p_source=>'SITUACION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 3,
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
  p_field_template=> 142039774912227115+wwv_flow_api.g_id_offset,
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
  p_id=>18595506301585893 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 220,
  p_name=>'P220_MOTIVO_SITUACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 160,
  p_item_plug_id => 18590031271585879+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Motivo Situacion',
  p_source=>'MOTIVO_SITUACION',
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
  p_id=>18596927827585896 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 220,
  p_name=>'P220_RESULTADO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 185,
  p_item_plug_id => 18590031271585879+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Resultado',
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
  p_id=>18626226305571476 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 220,
  p_name=>'P220_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 18590031271585879+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Nombre/Razón Social :',
  p_source=>'NOMBRE',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 70,
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
  p_field_template=> 142039662225227115+wwv_flow_api.g_id_offset,
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

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 18598027592585897 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 220,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P220_NOMBRE',
  p_validation_sequence=> 160,
  p_validation => 'P220_NOMBRE',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Se debe especificar un valor.',
  p_when_button_pressed=> 18591109345585885 + wwv_flow_api.g_id_offset,
  p_associated_item=> 18626226305571476 + wwv_flow_api.g_id_offset,
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
p:=p||'COM_PKG.COMTPR_CREAR(P_COMPRV_ID   => :P220_COMPRV_ID'||unistr('\000a')||
'                    ,P_COMTPR_TIPO => ''ACRS'''||unistr('\000a')||
'                    ,P_COMTPR_ID   => :P220_ID'||unistr('\000a')||
'                    ,P_RESULTADO   => :P220_RESULTADO'||unistr('\000a')||
');';

wwv_flow_api.create_page_process(
  p_id     => 18598301812585897 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 220,
  p_process_sequence=> 5,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Generar Cabecera del Tramite',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P220_ID',
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
p:=p||'F|#OWNER#:COM_TRAMITES_PRV:P220_ID:ID';

wwv_flow_api.create_page_process(
  p_id     => 18598505652585897 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 220,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from COM_TRAMITES_PRV',
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
p:=p||'#OWNER#:COM_TRAMITES_PRV:P220_ID:ID|IUD';

wwv_flow_api.create_page_process(
  p_id     => 18598704117585897 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 220,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'DML_PROCESS_ROW',
  p_process_name=> 'Process Row of COM_TRAMITES_PRV',
  p_process_sql_clob => p,
  p_process_error_message=> 'No se ha podido procesar la fila de la tabla COM_TRAMITES_PRV.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> 'Acción procesada.',
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
p:=p||'214';

wwv_flow_api.create_page_process(
  p_id     => 18598919317585897 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 220,
  p_process_sequence=> 40,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'reset page',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>18590920901585885 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 220
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
