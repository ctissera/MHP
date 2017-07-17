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
--   Date and Time:   13:54 Jueves Noviembre 24, 2016
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

PROMPT ...Remove page 1
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>1);
 
end;
/

 
--application/pages/page_00001
prompt  ...PAGE 1: Inicio
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 1
 ,p_user_interface_id => 60353909798266162 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'TS1'
 ,p_name => 'Inicio'
 ,p_alias => 'HOME'
 ,p_step_title => 'Inicio'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Inicio'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_step_template => 60350632696266081 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'HSANCHEZ'
 ,p_last_upd_yyyymmddhh24miss => '20161117134955'
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
  p_id=> 60366121783546862 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Proveedor',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 60352131206266104+ wwv_flow_api.g_id_offset,
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
s:=s||' select ''Para Cotizar'' label'||unistr('\000a')||
'      , ''Procesos Abiertos No Cotizados'' descripcion'||unistr('\000a')||
'      ,(select to_char(count(1)) cantidad'||unistr('\000a')||
'        from com_contrataciones_inv comcoi'||unistr('\000a')||
'            ,com_contrataciones comcon'||unistr('\000a')||
'            ,com_contrataciones_tipos comctt'||unistr('\000a')||
'            ,com_proveedores comprv'||unistr('\000a')||
'            ,com_contrataciones_detalles comcot'||unistr('\000a')||
'            ,com_pedidos comped'||unistr('\000a')||
'            ,com_contratantes com';

s:=s||'eco'||unistr('\000a')||
'            ,com_catalogo_objetos comcob'||unistr('\000a')||
'        where comcon.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'          and comcoi.situacion = ''ACT'''||unistr('\000a')||
'          AND comcoi.comcon_id = comcon.ID'||unistr('\000a')||
'          and comcon.fecha_publicacion <= sysdate'||unistr('\000a')||
'          and comcon.comctt_id = comctt.id'||unistr('\000a')||
'          and comcoi.comprv_id = comprv.id'||unistr('\000a')||
'          and comcon.id = comcot.comcon_id'||unistr('\000a')||
'          and comcot.comped_id = comped.id'||unistr('\000a')||
'    ';

s:=s||'      and comped.comeco_id = comeco.id'||unistr('\000a')||
'          and comped.comcob_id = comcob.id'||unistr('\000a')||
'          AND comprv.ID = :P1_COMPRV_ID'||unistr('\000a')||
'          AND (comcon.comcoe_estado = ''ACT'' AND SYSDATE >= comcon.fecha_inicio_propuesta AND SYSDATE <= comcon.fecha_fin_propuesta)'||unistr('\000a')||
'          and decode(comcon.comcoe_estado,''NUE'','''',''PEN'','''',comcon_pkg.comcon_comprv_ctzcnt(p_comcon_id => comcon.id, p_comprv_id => comprv.id)) =';

s:=s||' 0) value'||unistr('\000a')||
'     , ''f?p=&APP_ID.:310:&SESSION.::NO:RP,310:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P310_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,PANC'' url'||unistr('\000a')||
'     ,''#WORKSPACE_IMAGES#PCYCSL_Procesos_Procesos.png'' image'||unistr('\000a')||
'     '||unistr('\000a')||
' from dual'||unistr('\000a')||
'union all'||unistr('\000a')||
' select ''Cotizados'' label'||unistr('\000a')||
'      , ''Procesos Abiertos Cotizados'' descripcion'||unistr('\000a')||
'      , (select to_char(count(1)) cantidad'||unistr('\000a')||
'        from com_contrataciones_inv comcoi';

s:=s||''||unistr('\000a')||
'            ,com_contrataciones comcon'||unistr('\000a')||
'            ,com_contrataciones_tipos comctt'||unistr('\000a')||
'            ,com_proveedores comprv'||unistr('\000a')||
'            ,com_contrataciones_detalles comcot'||unistr('\000a')||
'            ,com_pedidos comped'||unistr('\000a')||
'            ,com_contratantes comeco'||unistr('\000a')||
'            ,com_catalogo_objetos comcob'||unistr('\000a')||
'        where comcon.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'          and comcoi.situacion = ''ACT'''||unistr('\000a')||
'          AND comcoi.comcon_id = co';

s:=s||'mcon.ID'||unistr('\000a')||
'          and comcon.fecha_publicacion <= sysdate'||unistr('\000a')||
'          and comcon.comctt_id = comctt.id'||unistr('\000a')||
'          and comcoi.comprv_id = comprv.id'||unistr('\000a')||
'          and comcon.id = comcot.comcon_id'||unistr('\000a')||
'          and comcot.comped_id = comped.id'||unistr('\000a')||
'          and comped.comeco_id = comeco.id'||unistr('\000a')||
'          and comped.comcob_id = comcob.id'||unistr('\000a')||
'          AND comprv.ID = :P1_COMPRV_ID'||unistr('\000a')||
'          AND (comcon.comcoe_estado = ''ACT'' ';

s:=s||'and sysdate >= comcon.fecha_inicio_propuesta and sysdate <= comcon.fecha_fin_propuesta)'||unistr('\000a')||
'          and decode(comcon.comcoe_estado,''NUE'','''',''PEN'','''',comcon_pkg.comcon_comprv_ctzcnt(p_comcon_id => comcon.id, p_comprv_id => comprv.id)) > 0)  value'||unistr('\000a')||
'      , ''f?p=&APP_ID.:310:&SESSION.::NO:RP,310:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P310_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,PAC''  url'||unistr('\000a')||
'      ,''#WORK';

s:=s||'SPACE_IMAGES#PCYCSL_Procesos_Procesos.png'' image'||unistr('\000a')||
' from dual'||unistr('\000a')||
'union all'||unistr('\000a')||
' select ''En Análisis'' label'||unistr('\000a')||
'      , ''Procesos Cotizados En Análisis'' descripcion'||unistr('\000a')||
'      , (select to_char(count(1)) cantidad'||unistr('\000a')||
'        from com_contrataciones_inv comcoi'||unistr('\000a')||
'            ,com_contrataciones comcon'||unistr('\000a')||
'            ,com_contrataciones_tipos comctt'||unistr('\000a')||
'            ,com_proveedores comprv'||unistr('\000a')||
'            ,com_contrataciones_detalles co';

s:=s||'mcot'||unistr('\000a')||
'            ,com_pedidos comped'||unistr('\000a')||
'            ,com_contratantes comeco'||unistr('\000a')||
'            ,com_catalogo_objetos comcob'||unistr('\000a')||
'        where comcon.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'          and comcoi.situacion = ''ACT'''||unistr('\000a')||
'          AND comcoi.comcon_id = comcon.ID'||unistr('\000a')||
'          and comcon.fecha_publicacion <= sysdate'||unistr('\000a')||
'          and comcon.comctt_id = comctt.id'||unistr('\000a')||
'          and comcoi.comprv_id = comprv.id'||unistr('\000a')||
'          and comcon';

s:=s||'.id = comcot.comcon_id'||unistr('\000a')||
'          and comcot.comped_id = comped.id'||unistr('\000a')||
'          and comped.comeco_id = comeco.id'||unistr('\000a')||
'          and comped.comcob_id = comcob.id'||unistr('\000a')||
'          AND comprv.ID = :P1_COMPRV_ID'||unistr('\000a')||
'          AND (comcon.comcoe_estado = ''VRF'' AND comcon_pkg.comcon_comprv_ctzcnt(p_comcon_id => comcon.id, p_comprv_id => comprv.id) > 0)'||unistr('\000a')||
'          and decode(comcon.comcoe_estado,''NUE'','''',''PEN'','''',comcon_pkg.';

s:=s||'comcon_comprv_ctzcnt(p_comcon_id => comcon.id, p_comprv_id => comprv.id)) > 0)  value'||unistr('\000a')||
'      , ''f?p=&APP_ID.:310:&SESSION.::NO:RP,310:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P310_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,PCEA'' url'||unistr('\000a')||
'      ,''#WORKSPACE_IMAGES#PCYCSL_Procesos_Procesos.png'' image'||unistr('\000a')||
' from dual'||unistr('\000a')||
'union all'||unistr('\000a')||
' select ''Para Entregar'' label'||unistr('\000a')||
'      , ''Ordenes Pendientes de Entrega'' descripcion'||unistr('\000a')||
'      ,';

s:=s||' (select to_char(count(1)) cantidad'||unistr('\000a')||
'        FROM com_ordenes_compras comocm'||unistr('\000a')||
'           , com_contrataciones comcon'||unistr('\000a')||
'           , com_contrataciones_tipos comctt'||unistr('\000a')||
'           , com_proveedores comprv'||unistr('\000a')||
'           , com_pedidos comped'||unistr('\000a')||
'            ,com_contratantes comeco'||unistr('\000a')||
'            ,com_catalogo_objetos comcob'||unistr('\000a')||
'        WHERE comocm.comcon_id = comcon.id'||unistr('\000a')||
'          and comcon.comctt_id = comctt.id'||unistr('\000a')||
'        ';

s:=s||'  and comocm.comprv_id = comprv.id'||unistr('\000a')||
'          and comocm.comped_id = comped.id'||unistr('\000a')||
'          and comocm.comeco_id = comeco.id'||unistr('\000a')||
'          AND comped.comcob_id = comcob.ID'||unistr('\000a')||
'          and comocm.comoce_estado not in (''NUE'',''PEN'',''ANU'')  '||unistr('\000a')||
'          and comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'          and comocm.comprv_id = :P1_COMPRV_ID'||unistr('\000a')||
'          and comocm.comoce_estado = ''APR'') value'||unistr('\000a')||
'      , ''f?p=&APP_ID.:410:&S';

s:=s||'ESSION.::NO:RP,410:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P410_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,OPDE'' url'||unistr('\000a')||
'      ,''#WORKSPACE_IMAGES#PCYCSL_Procesos_Ordenes.png'' image'||unistr('\000a')||
' from dual'||unistr('\000a')||
'union all'||unistr('\000a')||
' select ''Réplicas'' label'||unistr('\000a')||
'      , ''Calificaciones para Revisar'' descripcion'||unistr('\000a')||
'      , (select to_char(count(1)) cantidad'||unistr('\000a')||
'        FROM com_ordenes_compras comocm'||unistr('\000a')||
'           , com_contrataciones comcon'||unistr('\000a')||
'       ';

s:=s||'    , com_contrataciones_tipos comctt'||unistr('\000a')||
'           , com_proveedores comprv'||unistr('\000a')||
'           , com_pedidos comped'||unistr('\000a')||
'            ,com_contratantes comeco'||unistr('\000a')||
'            ,com_catalogo_objetos comcob'||unistr('\000a')||
'        WHERE comocm.comcon_id = comcon.id'||unistr('\000a')||
'          and comcon.comctt_id = comctt.id'||unistr('\000a')||
'          and comocm.comprv_id = comprv.id'||unistr('\000a')||
'          and comocm.comped_id = comped.id'||unistr('\000a')||
'          and comocm.comeco_id = comeco.id'||unistr('\000a')||
' ';

s:=s||'         AND comped.comcob_id = comcob.ID'||unistr('\000a')||
'          and comocm.comoce_estado not in (''NUE'',''PEN'',''ANU'')  '||unistr('\000a')||
'          and comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'          and comocm.comprv_id = :P1_COMPRV_ID'||unistr('\000a')||
'          and comocm.comoce_estado <> ''APR'''||unistr('\000a')||
'          and decode(comocm.comoce_estado,''NUE'','''',''ANU'','''',''RCH'','''',''APR'','''',COM_PKG.COMREP_REPLICAR_SN(p_comocm_id => comocm.id,p_origen => ''PRV''))= ''SI'')';

s:=s||' value'||unistr('\000a')||
'      , ''f?p=&APP_ID.:410:&SESSION.::NO:RP,410:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P410_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,OCCPR'' url'||unistr('\000a')||
'      ,''#WORKSPACE_IMAGES#PCYCSL_Procesos_Ordenes.png'' image'||unistr('\000a')||
' from dual'||unistr('\000a')||
'union all'||unistr('\000a')||
' select ''Documentación Adeudada'' label'||unistr('\000a')||
'      , ''Documentos Requeridos No Presentados'' descripcion'||unistr('\000a')||
'      , (select to_char(count(1)) cantidad'||unistr('\000a')||
'        from ('||unistr('\000a')||
'        sele';

s:=s||'ct distinct compdt.id'||unistr('\000a')||
'        from com_proveedores_dot_v compdt'||unistr('\000a')||
'            ,com_compdt_comprt_v comptt'||unistr('\000a')||
'        where compdt.id = comptt.compdt_id'||unistr('\000a')||
'          and compdt.tipo = ''GEN'''||unistr('\000a')||
'          and compdt.compde_estado = ''HAB'''||unistr('\000a')||
'          AND comptt.comprt_id = (SELECT comprt_id FROM com_proveedores comprv WHERE comprv.ID = :P1_COMPRV_ID)'||unistr('\000a')||
'          and (Select com_pkg.obtn_comdoc_no_fmt2 ( p_segorg_id ';

s:=s||'=> COMPDT.SEGORG_ID'||unistr('\000a')||
'                                         , p_comprv_id => :P1_COMPRV_ID'||unistr('\000a')||
'                                         , p_compdt_id => COMPDT.id'||unistr('\000a')||
'                                         , P_COMPDT_TIPO => COMPDT.TIPO'||unistr('\000a')||
'                                         , P_COMPDT_TIPO_DURACION => COMPDT.DURACION_TIPO '||unistr('\000a')||
'                                         , P_COMPDE_ESTADO => COMPDT.COMPDE_E';

s:=s||'STADO) From dual) in (''NO PRESENTADO'',''VENCIDO'')'||unistr('\000a')||
'        union all'||unistr('\000a')||
'        select distinct compdt.id'||unistr('\000a')||
'        from com_proveedores_dot_v compdt'||unistr('\000a')||
'            ,com_compdt_comrub_v comtdr'||unistr('\000a')||
'            ,com_proveedores_rub comprr'||unistr('\000a')||
'        where compdt.id = comtdr.compdt_id'||unistr('\000a')||
'          and comtdr.comrub_id = comprr.comrub_id'||unistr('\000a')||
'          and comprr.situacion = ''ACT'''||unistr('\000a')||
'          and compdt.tipo = ''RUB'''||unistr('\000a')||
'          a';

s:=s||'nd compdt.compde_estado = ''HAB'''||unistr('\000a')||
'          AND comprr.comprv_id = :P1_COMPRV_ID'||unistr('\000a')||
'          AND (select com_pkg.obtn_comdoc_no_fmt2 ( p_segorg_id => COMPDT.SEGORG_ID'||unistr('\000a')||
'                                         , p_comprv_id => comprr.comprv_id'||unistr('\000a')||
'                                         , p_compdt_id => COMPDT.id'||unistr('\000a')||
'                                         , P_COMPDT_TIPO => COMPDT.TIPO'||unistr('\000a')||
'                      ';

s:=s||'                   , P_COMPDT_TIPO_DURACION => COMPDT.DURACION_TIPO '||unistr('\000a')||
'                                         , P_COMPDE_ESTADO => COMPDT.COMPDE_ESTADO) from dual) in (''NO PRESENTADO'',''VENCIDO''))'||unistr('\000a')||
'         )  value'||unistr('\000a')||
'      , ''f?p=&APP_ID.:510:&SESSION.::NO:RP,510:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG:&APP_ID.,&APP_PAGE_ID.'' url'||unistr('\000a')||
'      ,''#WORKSPACE_IMAGES#ADMCAT_Administracion_ConfServ_Tramites.png'' image'||unistr('\000a')||
'';

s:=s||' from dual';

wwv_flow_api.create_page_plug (
  p_id=> 60521408996071679 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Indicadores',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 60352131206266104+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 40,
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
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'INSET:ADVANCED_FORMATTING:IMAGE',
  p_attribute_05 => '<h3>&LABEL.</h3>'||unistr('\000a')||
'<p>&DESCRIPCION.</p>',
  p_attribute_08 => 'VALUE',
  p_attribute_09 => 'IMAGE_URL',
  p_attribute_13 => 'IMAGE',
  p_attribute_16 => '&URL.',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||' select ''Para Cotizar'' label'||unistr('\000a')||
'      , ''Procesos Abiertos No Cotizados'' descripcion'||unistr('\000a')||
'      ,(select to_char(count(1)) cantidad'||unistr('\000a')||
'        from com_contrataciones_inv comcoi'||unistr('\000a')||
'            ,com_contrataciones comcon'||unistr('\000a')||
'            ,com_contrataciones_est comcoe'||unistr('\000a')||
'            ,com_contrataciones_tipos comctt'||unistr('\000a')||
'            ,com_proveedores comprv'||unistr('\000a')||
'            ,com_contrataciones_detalles comcot'||unistr('\000a')||
'            ,com_pedid';

s:=s||'os comped'||unistr('\000a')||
'            ,com_contratantes comeco'||unistr('\000a')||
'            ,com_catalogo_objetos comcob'||unistr('\000a')||
'        where comcon.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'          and comcoi.situacion = ''ACT'''||unistr('\000a')||
'          and comcoi.comcon_id = comcon.id'||unistr('\000a')||
'          and comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'          and comcon.fecha_publicacion <= sysdate'||unistr('\000a')||
'          and comcon.comctt_id = comctt.id'||unistr('\000a')||
'          and comcoi.comprv_id = comprv.id'||unistr('\000a')||
'    ';

s:=s||'      and comcon.id = comcot.comcon_id'||unistr('\000a')||
'          and comcot.comped_id = comped.id'||unistr('\000a')||
'          and comped.comeco_id = comeco.id'||unistr('\000a')||
'          and comped.comcob_id = comcob.id'||unistr('\000a')||
'          and comprv.id = :P1_COMPRV_ID'||unistr('\000a')||
'          and comcon_pkg.comcon_comprv_estado(p_comcon_id => comcon.id, p_comprv_id => comprv.id) = ''ABIERTO'''||unistr('\000a')||
'          and decode(comcoe.estado,''NUE'','''',''PEN'','''',comcon_pkg.comcon_comprv_ctzc';

s:=s||'nt(p_comcon_id => comcon.id, p_comprv_id => comprv.id)) = 0) value'||unistr('\000a')||
'     , ''f?p=&APP_ID.:310:&SESSION.::NO:RP,310:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P310_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,PANC'' url'||unistr('\000a')||
'     ,''#WORKSPACE_IMAGES#PCYCSL_Procesos_Procesos.png'' image'||unistr('\000a')||
'     '||unistr('\000a')||
' from dual'||unistr('\000a')||
'union all'||unistr('\000a')||
' select ''Cotizados'' label'||unistr('\000a')||
'      , ''Procesos Abiertos Cotizados'' descripcion'||unistr('\000a')||
'      , (select to_char(coun';

s:=s||'t(1)) cantidad'||unistr('\000a')||
'        from com_contrataciones_inv comcoi'||unistr('\000a')||
'            ,com_contrataciones comcon'||unistr('\000a')||
'            ,com_contrataciones_est comcoe'||unistr('\000a')||
'            ,com_contrataciones_tipos comctt'||unistr('\000a')||
'            ,com_proveedores comprv'||unistr('\000a')||
'            ,com_contrataciones_detalles comcot'||unistr('\000a')||
'            ,com_pedidos comped'||unistr('\000a')||
'            ,com_contratantes comeco'||unistr('\000a')||
'            ,com_catalogo_objetos comcob'||unistr('\000a')||
'        where comcon.';

s:=s||'segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'          and comcoi.situacion = ''ACT'''||unistr('\000a')||
'          and comcoi.comcon_id = comcon.id'||unistr('\000a')||
'          and comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'          and comcon.fecha_publicacion <= sysdate'||unistr('\000a')||
'          and comcon.comctt_id = comctt.id'||unistr('\000a')||
'          and comcoi.comprv_id = comprv.id'||unistr('\000a')||
'          and comcon.id = comcot.comcon_id'||unistr('\000a')||
'          and comcot.comped_id = comped.id'||unistr('\000a')||
'          and comped.comeco';

s:=s||'_id = comeco.id'||unistr('\000a')||
'          and comped.comcob_id = comcob.id'||unistr('\000a')||
'          and comprv.id = :P1_COMPRV_ID'||unistr('\000a')||
'          and comcon_pkg.comcon_comprv_estado(p_comcon_id => comcon.id, p_comprv_id => comprv.id) = ''ABIERTO'''||unistr('\000a')||
'          and decode(comcoe.estado,''NUE'','''',''PEN'','''',comcon_pkg.comcon_comprv_ctzcnt(p_comcon_id => comcon.id, p_comprv_id => comprv.id)) > 0)  value'||unistr('\000a')||
'      , ''f?p=&APP_ID.:310:&SESSION.::NO:R';

s:=s||'P,310:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P310_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,PAC''  url'||unistr('\000a')||
'      ,''#WORKSPACE_IMAGES#PCYCSL_Procesos_Procesos.png'' image'||unistr('\000a')||
' from dual'||unistr('\000a')||
'union all'||unistr('\000a')||
' select ''En Análisis'' label'||unistr('\000a')||
'      , ''Procesos Cotizados En Análisis'' descripcion'||unistr('\000a')||
'      , (select to_char(count(1)) cantidad'||unistr('\000a')||
'        from com_contrataciones_inv comcoi'||unistr('\000a')||
'            ,com_contrataciones comcon'||unistr('\000a')||
'          ';

s:=s||'  ,com_contrataciones_est comcoe'||unistr('\000a')||
'            ,com_contrataciones_tipos comctt'||unistr('\000a')||
'            ,com_proveedores comprv'||unistr('\000a')||
'            ,com_contrataciones_detalles comcot'||unistr('\000a')||
'            ,com_pedidos comped'||unistr('\000a')||
'            ,com_contratantes comeco'||unistr('\000a')||
'            ,com_catalogo_objetos comcob'||unistr('\000a')||
'        where comcon.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'          and comcoi.situacion = ''ACT'''||unistr('\000a')||
'          and comcoi.comcon_id = comcon.id';

s:=s||''||unistr('\000a')||
'          and comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'          and comcon.fecha_publicacion <= sysdate'||unistr('\000a')||
'          and comcon.comctt_id = comctt.id'||unistr('\000a')||
'          and comcoi.comprv_id = comprv.id'||unistr('\000a')||
'          and comcon.id = comcot.comcon_id'||unistr('\000a')||
'          and comcot.comped_id = comped.id'||unistr('\000a')||
'          and comped.comeco_id = comeco.id'||unistr('\000a')||
'          and comped.comcob_id = comcob.id'||unistr('\000a')||
'          and comprv.id = :P1_COMPRV_ID'||unistr('\000a')||
'        ';

s:=s||'  and comcon_pkg.comcon_comprv_estado(p_comcon_id => comcon.id, p_comprv_id => comprv.id) = ''EN ANALISIS'''||unistr('\000a')||
'          and decode(comcoe.estado,''NUE'','''',''PEN'','''',comcon_pkg.comcon_comprv_ctzcnt(p_comcon_id => comcon.id, p_comprv_id => comprv.id)) > 0)  value'||unistr('\000a')||
'      , ''f?p=&APP_ID.:310:&SESSION.::NO:RP,310:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P310_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,PCEA'' url'||unistr('\000a')||
'  ';

s:=s||'    ,''#WORKSPACE_IMAGES#PCYCSL_Procesos_Procesos.png'' image'||unistr('\000a')||
' from dual'||unistr('\000a')||
'union all'||unistr('\000a')||
' select ''Para Entregar'' label'||unistr('\000a')||
'      , ''Ordenes Pendientes de Entrega'' descripcion'||unistr('\000a')||
'      , (select to_char(count(1)) cantidad'||unistr('\000a')||
'        from com_ordenes_compras comocm'||unistr('\000a')||
'           , com_ordenes_compras_est comoce'||unistr('\000a')||
'           , com_contrataciones comcon'||unistr('\000a')||
'           , com_contrataciones_est comcoe'||unistr('\000a')||
'           , com_contratacio';

s:=s||'nes_tipos comctt'||unistr('\000a')||
'           , com_proveedores comprv'||unistr('\000a')||
'           , com_pedidos comped'||unistr('\000a')||
'            ,com_contratantes comeco'||unistr('\000a')||
'            ,com_catalogo_objetos comcob'||unistr('\000a')||
'        where comocm.comoce_id = comoce.id'||unistr('\000a')||
'          and comocm.comcon_id = comcon.id'||unistr('\000a')||
'          and comcon.comctt_id = comctt.id'||unistr('\000a')||
'          and comocm.comprv_id = comprv.id'||unistr('\000a')||
'          and comocm.comped_id = comped.id'||unistr('\000a')||
'          and comocm.c';

s:=s||'omeco_id = comeco.id'||unistr('\000a')||
'          and comped.comcob_id = comcob.id'||unistr('\000a')||
'          and comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'          and comoce.estado not in (''NUE'',''PEN'',''ANU'')  '||unistr('\000a')||
'          and comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'          and comocm.comprv_id = :P1_COMPRV_ID'||unistr('\000a')||
'          and comoce.estado = ''APR'') value'||unistr('\000a')||
'      , ''f?p=&APP_ID.:410:&SESSION.::NO:RP,410:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P410_FILTRO_PREDEF';

s:=s||'INIDO_SEL:&APP_ID.,&APP_PAGE_ID.,OPDE'' url'||unistr('\000a')||
'      ,''#WORKSPACE_IMAGES#PCYCSL_Procesos_Ordenes.png'' image'||unistr('\000a')||
' from dual'||unistr('\000a')||
'union all'||unistr('\000a')||
' select ''Réplicas'' label'||unistr('\000a')||
'      , ''Calificaciones para Revisar'' descripcion'||unistr('\000a')||
'      , (select to_char(count(1)) cantidad'||unistr('\000a')||
'        from com_ordenes_compras comocm'||unistr('\000a')||
'           , com_ordenes_compras_est comoce'||unistr('\000a')||
'           , com_contrataciones comcon'||unistr('\000a')||
'           , com_contrataciones_es';

s:=s||'t comcoe'||unistr('\000a')||
'           , com_contrataciones_tipos comctt'||unistr('\000a')||
'           , com_proveedores comprv'||unistr('\000a')||
'           , com_pedidos comped'||unistr('\000a')||
'            ,com_contratantes comeco'||unistr('\000a')||
'            ,com_catalogo_objetos comcob'||unistr('\000a')||
'        where comocm.comoce_id = comoce.id'||unistr('\000a')||
'          and comocm.comcon_id = comcon.id'||unistr('\000a')||
'          and comcon.comctt_id = comctt.id'||unistr('\000a')||
'          and comocm.comprv_id = comprv.id'||unistr('\000a')||
'          and comocm.comped_';

s:=s||'id = comped.id'||unistr('\000a')||
'          and comocm.comeco_id = comeco.id'||unistr('\000a')||
'          and comped.comcob_id = comcob.id'||unistr('\000a')||
'          and comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'          and comoce.estado not in (''NUE'',''PEN'',''ANU'')  '||unistr('\000a')||
'          and comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'          and comocm.comprv_id = :P1_COMPRV_ID'||unistr('\000a')||
'          and comoce.estado <> ''APR'''||unistr('\000a')||
'          and decode(comoce.estado,''NUE'','''',''ANU'','''',''RCH'','''',''APR'',';

s:=s||''''',COM_PKG.COMREP_REPLICAR_SN(p_comocm_id => comocm.id,p_origen => ''PRV''))= ''SI'') value'||unistr('\000a')||
'      , ''f?p=&APP_ID.:410:&SESSION.::NO:RP,410:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P410_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,OCCPR'' url'||unistr('\000a')||
'      ,''#WORKSPACE_IMAGES#PCYCSL_Procesos_Ordenes.png'' image'||unistr('\000a')||
' from dual'||unistr('\000a')||
'union all'||unistr('\000a')||
' select ''Documentación Adeudada'' label'||unistr('\000a')||
'      , ''Documentos Requeridos No Presentados'' d';

s:=s||'escripcion'||unistr('\000a')||
'      , (select to_char(count(1)) cantidad'||unistr('\000a')||
'        from ('||unistr('\000a')||
'        select distinct compdt.id'||unistr('\000a')||
'        from com_proveedores_dot_v compdt'||unistr('\000a')||
'            ,com_compdt_comprt_v comptt'||unistr('\000a')||
'        where compdt.id = comptt.compdt_id'||unistr('\000a')||
'          and compdt.tipo = ''GEN'''||unistr('\000a')||
'          and compdt.compde_estado = ''HAB'''||unistr('\000a')||
'          and comptt.comprt_id = (select comprt_id from com_proveedores comprv where comprv.id ';

s:=s||'= :P1_COMPRV_ID)'||unistr('\000a')||
'          and com_pkg.obtn_comdoc_no_fmt ( p_segorg_id => COMPDT.SEGORG_ID'||unistr('\000a')||
'                                         , p_comprv_id => :P1_COMPRV_ID'||unistr('\000a')||
'                                         , p_compdt_id => COMPDT.id) in (''NO PRESENTADO'',''VENCIDO'')'||unistr('\000a')||
'        union all'||unistr('\000a')||
'        select distinct compdt.id'||unistr('\000a')||
'        from com_proveedores_dot_v compdt'||unistr('\000a')||
'            ,com_compdt_comrub_v comtdr'||unistr('\000a')||
'  ';

s:=s||'          ,com_proveedores_rub comprr'||unistr('\000a')||
'        where compdt.id = comtdr.compdt_id'||unistr('\000a')||
'          and comtdr.comrub_id = comprr.comrub_id'||unistr('\000a')||
'          and comprr.situacion = ''ACT'''||unistr('\000a')||
'          and compdt.tipo = ''RUB'''||unistr('\000a')||
'          and compdt.compde_estado = ''HAB'''||unistr('\000a')||
'          and comprr.comprv_id = :P1_COMPRV_ID'||unistr('\000a')||
'          and com_pkg.obtn_comdoc_no_fmt ( p_segorg_id => COMPDT.SEGORG_ID'||unistr('\000a')||
'                               ';

s:=s||'          , p_comprv_id => :P1_COMPRV_ID'||unistr('\000a')||
'                                         , p_compdt_id => COMPDT.id) in (''NO PRESENTADO'',''VENCIDO''))'||unistr('\000a')||
'         )  value'||unistr('\000a')||
'      , ''f?p=&APP_ID.:510:&SESSION.::NO:RP,510:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG:&APP_ID.,&APP_PAGE_ID.'' url'||unistr('\000a')||
'      ,''#WORKSPACE_IMAGES#ADMCAT_Administracion_ConfServ_Tramites.png'' image'||unistr('\000a')||
' from dual'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 365224520149513023 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Indicadores_original',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 60352131206266104+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 50,
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
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'NEVER',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'INSET:ADVANCED_FORMATTING:IMAGE',
  p_attribute_05 => '<h3>&LABEL.</h3>'||unistr('\000a')||
'<p>&DESCRIPCION.</p>',
  p_attribute_08 => 'VALUE',
  p_attribute_09 => 'IMAGE_URL',
  p_attribute_13 => 'IMAGE',
  p_attribute_16 => '&URL.',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 60530115164243715 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1,
  p_button_sequence=> 10,
  p_button_plug_id => 60356225485266240+wwv_flow_api.g_id_offset,
  p_button_name    => 'MI_PERFIL',
  p_button_action  => 'SUBMIT',
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Mi Perfil',
  p_button_position=> 'REGION_TEMPLATE_NEXT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_css_classes=>'class="ui-btn-right ui-btn-hidden"',
  p_button_cattributes=>'data-icon="info"',
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
  p_id=>60366402775549373 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGORG_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_item_plug_id => 60366121783546862+wwv_flow_api.g_id_offset,
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
  p_id=>60366624532569729 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGORG_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 2,
  p_item_plug_id => 60366121783546862+wwv_flow_api.g_id_offset,
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
  p_id=>60366820865571396 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGORG_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 3,
  p_item_plug_id => 60366121783546862+wwv_flow_api.g_id_offset,
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
  p_id=>60424510989970725 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGAPL_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 4,
  p_item_plug_id => 60366121783546862+wwv_flow_api.g_id_offset,
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
  p_id=>60424706676972684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGAPL_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 5,
  p_item_plug_id => 60366121783546862+wwv_flow_api.g_id_offset,
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
  p_id=>60424901500975125 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGAPL_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 6,
  p_item_plug_id => 60366121783546862+wwv_flow_api.g_id_offset,
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
  p_id=>60425129308977400 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGUSU_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 7,
  p_item_plug_id => 60366121783546862+wwv_flow_api.g_id_offset,
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
  p_id=>60425323917979925 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGUSU_DOCUMENTO_TIPO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 8,
  p_item_plug_id => 60366121783546862+wwv_flow_api.g_id_offset,
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
  p_id=>60425518957982225 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGUSU_DOCUMENTO_NUMERO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 9,
  p_item_plug_id => 60366121783546862+wwv_flow_api.g_id_offset,
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
  p_id=>60425710546986129 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGUSU_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 60366121783546862+wwv_flow_api.g_id_offset,
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
  p_id=>60425905154988576 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGUSU_EMAIL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 11,
  p_item_plug_id => 60366121783546862+wwv_flow_api.g_id_offset,
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
  p_id=>60426100625990696 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_APP_ANTERIOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 12,
  p_item_plug_id => 60366121783546862+wwv_flow_api.g_id_offset,
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
  p_id=>60426326492993907 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_APP_ANTERIOR_PAG',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 13,
  p_item_plug_id => 60366121783546862+wwv_flow_api.g_id_offset,
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
  p_id=>60426520885996490 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_PAG_ANTERIOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 14,
  p_item_plug_id => 60366121783546862+wwv_flow_api.g_id_offset,
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
  p_id=>60426717003998286 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_APP_THEME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 15,
  p_item_plug_id => 60366121783546862+wwv_flow_api.g_id_offset,
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
  p_id=>60426911180000968 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGORG_COPYRIGHT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 16,
  p_item_plug_id => 60366121783546862+wwv_flow_api.g_id_offset,
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
  p_id=>60483702664785562 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_COMPRV_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 26,
  p_item_plug_id => 60366121783546862+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Proveedor<br>',
  p_pre_element_text=>'<b>',
  p_post_element_text=>'</b>',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select nombre||'' - CUIT: ''||to_char(cuit) d, id r'||unistr('\000a')||
'from com_proveedores'||unistr('\000a')||
'where segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'  and id = :P1_COMPRV_ID',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'',
  p_lov_null_value=> '',
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
  p_read_only_when_type=>'ALWAYS',
  p_field_template=> 60353006479266128+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
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
p:=p||'60361211691454156';

wwv_flow_api.create_page_process(
  p_id     => 60482702195746929 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'InicializarTemaPorDefault',
  p_process_sql_clob => 60361211691454156 + wwv_flow_api.g_id_offset,
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
p:=p||'60361503496457867';

wwv_flow_api.create_page_process(
  p_id     => 60482917779751429 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 20,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'CargarDatosOrganizacion',
  p_process_sql_clob => 60361503496457867 + wwv_flow_api.g_id_offset,
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
p:=p||'60517727688214179';

wwv_flow_api.create_page_process(
  p_id     => 60518032227217351 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 30,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'CargarDatosUsuario',
  p_process_sql_clob => 60517727688214179 + wwv_flow_api.g_id_offset,
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
p:=p||'IF :P1_APP_ANTERIOR is null then'||unistr('\000a')||
'  :P1_APP_ANTERIOR := v(''APP_ID'');'||unistr('\000a')||
'END IF;';

wwv_flow_api.create_page_process(
  p_id     => 60483121719762046 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 40,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AsignarAplicacionAnterior',
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
p:=p||'declare'||unistr('\000a')||
'  cursor cr_comprr is'||unistr('\000a')||
'  select comprv_id'||unistr('\000a')||
'  from com_proveedores_res'||unistr('\000a')||
'  where segusu_id = :P1_SEGUSU_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_dummy number;    '||unistr('\000a')||
'begin'||unistr('\000a')||
'  open cr_comprr;'||unistr('\000a')||
'  fetch cr_comprr into :P1_COMPRV_ID;'||unistr('\000a')||
'  close cr_comprr;'||unistr('\000a')||
'  --'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 60483417348770170 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 50,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ObtenerIdProveedor',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P1_COMPRV_ID',
  p_process_when_type=>'ITEM_IS_NULL',
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
-- ...updatable report columns for page 1
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
