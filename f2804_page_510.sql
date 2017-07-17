set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end;
/
 
 
--application/set_environment
prompt  APPLICATION 2804 - Compras - Procesos de Compras
--
-- Application Export:
--   Application:     2804
--   Name:            Compras - Procesos de Compras
--   Date and Time:   12:46 Lunes Diciembre 26, 2016
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
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,2804);
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
 
end;
/

PROMPT ...Remove page 510
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>510);
 
end;
/

 
--application/pages/page_00510
prompt  ...PAGE 510: Registro de Proveedores - Documentación adeudada
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 510
 ,p_user_interface_id => 220650599908639021 + wwv_flow_api.g_id_offset
 ,p_name => 'Registro de Proveedores - Documentación adeudada'
 ,p_step_title => 'Registro de Proveedores - Documentación adeudada'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Registro de Proveedores - Documentación adeudada'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_html_page_header => 
'<style>'||unistr('\000a')||
'#dialog-modal{display:none;}'||unistr('\000a')||
'</style>'||unistr('\000a')||
'<style>'||unistr('\000a')||
'#dialog-video{display:none;}'||unistr('\000a')||
'</style>'
 ,p_javascript_code => 
'/* -------------------- Video Introducción ------------------*/'||unistr('\000a')||
''||unistr('\000a')||
'function abrir_video (){'||unistr('\000a')||
' $( "#dialog-video" ).html($("#P510_VIDEO_IFRAME").val());'||unistr('\000a')||
' $( "#dialog-video" ).dialog({'||unistr('\000a')||
'   width: 700,'||unistr('\000a')||
'   height: 500,'||unistr('\000a')||
'   modal: true,'||unistr('\000a')||
'   close: function() {'||unistr('\000a')||
'     $( "#dialog-video" ).empty();'||unistr('\000a')||
'   }'||unistr('\000a')||
' });'||unistr('\000a')||
'}'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'HSANCHEZ'
 ,p_last_upd_yyyymmddhh24miss => '20161222102955'
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
  p_id=> 59947415271969501 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_plug_name=> 'Ruta de Navegación',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 236652436221903825+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(569946071879134348 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 236667932049903833+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select compdt_id'||unistr('\000a')||
'     , compdt_codigo'||unistr('\000a')||
'     , compdt_nombre'||unistr('\000a')||
'     , compdt_tipo_abr'||unistr('\000a')||
'     , compdt_estado'||unistr('\000a')||
'     , compdt_situacion'||unistr('\000a')||
'     , compdt_clase'||unistr('\000a')||
'     --, compdt_obligatorio_sn'||unistr('\000a')||
'     , accion'||unistr('\000a')||
'from (select distinct compdt.id compdt_id'||unistr('\000a')||
'      , compdt.codigo compdt_codigo'||unistr('\000a')||
'      , upper(compdt.nombre) compdt_nombre'||unistr('\000a')||
'      , replace(replace(COMPRV_PKG.COMPTT_OBTN_RUBROS(p_comprv_id => :P510_COMPRV_ID'||unistr('\000a')||
'  ';

s:=s||'                                  , p_compdt_id => compdt.id'||unistr('\000a')||
'                                    , p_ver_obligatorio_sn => ''SI''),''GENERAL -'',''''),chr(10),''<br>'') compdt_tipo_abr'||unistr('\000a')||
'     , com_pkg.obtn_comdoc_estado2 ( p_segorg_id => compdt.segorg_id'||unistr('\000a')||
'                                  , p_comprv_id => :P510_COMPRV_ID'||unistr('\000a')||
'                                  , p_compdt_id => compdt.id'||unistr('\000a')||
'                          ';

s:=s||'        , p_compdt_tipo_duracion => compdt.tipo_duracion'||unistr('\000a')||
'                                  , p_compde_estado => compdt.compde_estado  ) compdt_estado'||unistr('\000a')||
'     , com_pkg.obtn_comdoc_no_fmt2 ( p_segorg_id => compdt.segorg_id'||unistr('\000a')||
'                                  , p_comprv_id => :P510_COMPRV_ID'||unistr('\000a')||
'                                  , p_compdt_id => compdt.id'||unistr('\000a')||
'                                  , p_compdt_tipo => ';

s:=s||'compdt.tipo'||unistr('\000a')||
'                                  , p_compdt_tipo_duracion => compdt.tipo_duracion'||unistr('\000a')||
'                                  , p_compde_estado => compdt.compde_estado) compdt_situacion'||unistr('\000a')||
'     ,''GENERAL'' compdt_clase'||unistr('\000a')||
'     --, comptt.obligatorio_sn compdt_obligatorio_sn'||unistr('\000a')||
'     ,''<a href="f?p=2101:694:&SESSION.::NO:694:P694_COMPRV_ID,P694_EDICION,P694_GENERAR_TRAMITE_SN,G_APP_ANTERIOR_PAG,G_APP_ANTER';

s:=s||'IOR:''||:P510_COMPRV_ID||'',NO,SI,&APP_PAGE_ID.,&APP_ID." title="Presentar el documento" alt="Presentar el documento"><img src="#IMAGE_PREFIX#/htmldb/icons/pt_dataload.png"></a>'' ACCION'||unistr('\000a')||
'     --, to_number(decode(comptt.obligatorio_sn,''SI'',''1'',''10'')) orden'||unistr('\000a')||
'from com_proveedores_dot_v compdt'||unistr('\000a')||
'    ,com_compdt_comprt_v comptt'||unistr('\000a')||
'where compdt.id = comptt.compdt_id'||unistr('\000a')||
'  and compdt.tipo = ''GEN'''||unistr('\000a')||
'  and compdt.compde';

s:=s||'_estado = ''HAB'''||unistr('\000a')||
'  and comptt.comprt_id = (select comprt_id from com_proveedores comprv where comprv.id = :P510_COMPRV_ID)'||unistr('\000a')||
'  and com_pkg.obtn_comdoc_no_fmt2 ( p_segorg_id => COMPDT.SEGORG_ID'||unistr('\000a')||
'                                 , p_comprv_id => :P510_COMPRV_ID'||unistr('\000a')||
'                                 , p_compdt_id => COMPDT.id'||unistr('\000a')||
'                                 , p_compdt_tipo => compdt.tipo'||unistr('\000a')||
'                    ';

s:=s||'             , p_compdt_tipo_duracion => compdt.tipo_duracion'||unistr('\000a')||
'                                 , p_compde_estado => compdt.compde_estado) in (''NO PRESENTADO'',''VENCIDO'')'||unistr('\000a')||
''||unistr('\000a')||
'union all'||unistr('\000a')||
''||unistr('\000a')||
'select distinct compdt.id compdt_id'||unistr('\000a')||
'      , compdt.codigo compdt_codigo'||unistr('\000a')||
'      , upper(compdt.nombre) compdt_nombre'||unistr('\000a')||
'      , replace(replace(COMPRV_PKG.COMPTT_OBTN_RUBROS(p_comprv_id => comprr.comprv_id --:P510_COMPRV_ID'||unistr('\000a')||
'';

s:=s||'                                    , p_compdt_id => compdt.id'||unistr('\000a')||
'                                    , p_ver_obligatorio_sn => ''SI''),''RUBRO -'',''''),chr(10),''<br>'') compdt_tipo_abr'||unistr('\000a')||
'     , com_pkg.obtn_comdoc_estado2 ( p_segorg_id => compdt.segorg_id'||unistr('\000a')||
'                                  , p_comprv_id => comprr.comprv_id --:P510_COMPRV_ID'||unistr('\000a')||
'                                  , p_compdt_id => compdt.id  '||unistr('\000a')||
'     ';

s:=s||'                             , p_compdt_tipo_duracion => compdt.tipo_duracion'||unistr('\000a')||
'                                  , p_compde_estado => compdt.compde_estado) compdt_estado'||unistr('\000a')||
'     , com_pkg.obtn_comdoc_no_fmt2 ( p_segorg_id => compdt.segorg_id'||unistr('\000a')||
'                                  , p_comprv_id => comprr.comprv_id --:P510_COMPRV_ID'||unistr('\000a')||
'                                  , p_compdt_id => compdt.id'||unistr('\000a')||
'               ';

s:=s||'                   , p_compdt_tipo => compdt.tipo'||unistr('\000a')||
'                                  , p_compdt_tipo_duracion => compdt.tipo_duracion'||unistr('\000a')||
'                                  , p_compde_estado => compdt.compde_estado) compdt_situacion'||unistr('\000a')||
'     , ''RUBRO'' compdt_clase'||unistr('\000a')||
'     --, comtdr.obligatorio_sn compdt_obligatorio_sn'||unistr('\000a')||
'     ,''<a href="f?p=2101:694:&SESSION.::NO:694:P694_COMPRV_ID,P694_EDICION,P694_GENERAR_TRAM';

s:=s||'ITE_SN,G_APP_ANTERIOR_PAG,G_APP_ANTERIOR:''||comprr.comprv_id||'',NO,SI,&APP_PAGE_ID.,&APP_ID." title="Presentar el documento" alt="Presentar el documento"><img src="#IMAGE_PREFIX#/htmldb/icons/pt_dataload.png"></a>''  ACCION'||unistr('\000a')||
'     --, to_number(decode(comtdr.obligatorio_sn,''SI'',''2'',''20'')) orden'||unistr('\000a')||
'from com_proveedores_dot_v compdt'||unistr('\000a')||
'    ,com_compdt_comrub_v comtdr'||unistr('\000a')||
'    ,com_proveedores_rub comprr'||unistr('\000a')||
'where com';

s:=s||'pdt.id = comtdr.compdt_id'||unistr('\000a')||
'  and comtdr.comrub_id = comprr.comrub_id'||unistr('\000a')||
'  and comprr.situacion = ''ACT'''||unistr('\000a')||
'  and compdt.tipo = ''RUB'''||unistr('\000a')||
'  and compdt.compde_estado = ''HAB'''||unistr('\000a')||
'  and comprr.comprv_id = :P510_COMPRV_ID'||unistr('\000a')||
'  and com_pkg.obtn_comdoc_no_fmt2 ( p_segorg_id => COMPDT.SEGORG_ID'||unistr('\000a')||
'                                 , p_comprv_id => comprr.comprv_id --:P510_COMPRV_ID'||unistr('\000a')||
'                                 , p_compdt_id';

s:=s||' => COMPDT.id'||unistr('\000a')||
'                                 , p_compdt_tipo => compdt.tipo'||unistr('\000a')||
'                                 , p_compdt_tipo_duracion => compdt.tipo_duracion'||unistr('\000a')||
'                                 , p_compde_estado => compdt.compde_estado) in (''NO PRESENTADO'',''VENCIDO'')'||unistr('\000a')||
''||unistr('\000a')||
'union all'||unistr('\000a')||
''||unistr('\000a')||
'select distinct comode.ID comodt_id'||unistr('\000a')||
'       ,comode.codigo comodt_codigo'||unistr('\000a')||
'       ,upper(comode.nombre) comodt_nombre'||unistr('\000a')||
'      ';

s:=s||' ,upper(comode.comobt_nombre||'' ''||comode.COMOBJ_NOMBRE||'' - ''||comode.COMOBJ_CODIGO||'' ''||decode(comode.COMOTT_OBLIGATORIO_SN,''SI'',''(OBLIGATORIO)'',''(OPCIONAL)'')) comodt_tipo_abr'||unistr('\000a')||
'       ,comode.estado comodt_estado'||unistr('\000a')||
'       ,comode.situacion_abr comodt_situacion'||unistr('\000a')||
'       ,''OBJETO'' comodt_clase'||unistr('\000a')||
'       --, comode.COMOTT_OBLIGATORIO_SN comodt_obligatorio_sn'||unistr('\000a')||
'       ,''<a href="f?p=2101:933:&SESSION.::&DEBU';

s:=s||'G.:933:P933_COMPRV_ID,P933_COMRUB_ID,P933_COMODT_ID,P933_COMOBJ_ID,P933_COMOBJ_SN,G_APP_ANTERIOR,G_APP_ANTERIOR_PAG:''||comprr.comprv_id||'',''||comprr.comrub_id||'',''||comode.ID||'',''||comode.COMOBJ_ID||'',SI''||'',&APP_ID.,&APP_PAGE_ID." title="Presentar el documento" alt="Presentar el documento"><img src="#IMAGE_PREFIX#/htmldb/icons/pt_dataload.png"></a>'' ACCION'||unistr('\000a')||
'      --, TO_NUMBER(decode(comode.COMOTT';

s:=s||'_OBLIGATORIO_SN,''SI'',''3'',''30'')) orden'||unistr('\000a')||
'from   com_objetos_doc_estado_v2 comode'||unistr('\000a')||
'      ,com_proveedores_rub2_v comprr'||unistr('\000a')||
'where  comode.COMOBJ_COMPRV_ID = comprr.comprv_id --:P510_COMPRV_ID'||unistr('\000a')||
'and    comprr.comrub_id = comode.COMOBJ_COMRUB_ID'||unistr('\000a')||
'and    comode.comobj_comprv_id = comprr.comprv_id'||unistr('\000a')||
'and    comode.ESTADO <> ''PRESENTADO'''||unistr('\000a')||
'and    comprr.situacion = ''ACT'''||unistr('\000a')||
''||unistr('\000a')||
'and    comprr.comprv_id = :P510_COMPRV_ID'||unistr('\000a')||
''||unistr('\000a')||
'and ';

s:=s||'   comprr.comrub_situacion = ''VIG'')'||unistr('\000a')||
'order by compdt_nombre';

wwv_flow_api.create_page_plug (
  p_id=> 59947631278969501 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_plug_name=> 'Documentación Adeudada',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 236655221462903826+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_translate_title=> 'Y',
  p_rest_enabled=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_prn_output_show_link=> 'Y',
  p_prn_content_disposition=> 'ATTACHMENT',
  p_prn_document_header=> 'APEX',
  p_prn_units=> 'MILLIMETERS',
  p_prn_paper_size=> 'A4',
  p_prn_width=> 297,
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
  p_prn_page_header_alignment=> 'CENTER',
  p_prn_page_footer_alignment=> 'CENTER',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> 'select distinct compdt.id compdt_id'||unistr('\000a')||
'      , compdt.codigo compdt_codigo'||unistr('\000a')||
'      , compdt.nombre compdt_nombre'||unistr('\000a')||
'      , COMPRV_PKG.COMPTT_OBTN_RUBROS(p_comprv_id => :P510_COMPRV_ID'||unistr('\000a')||
'                                    , p_compdt_id => compdt.id'||unistr('\000a')||
'                                    , p_ver_obligatorio_sn => ''SI'') compdt_tipo_abr'||unistr('\000a')||
'     , com_pkg.obtn_comdoc_estado ( p_segorg_id => compdt.segorg_id'||unistr('\000a')||
'                                  , p_comprv_id => :P510_COMPRV_ID'||unistr('\000a')||
'                                  , p_compdt_id => compdt.id  ) compdt_estado'||unistr('\000a')||
'     , com_pkg.obtn_comdoc_no_fmt ( p_segorg_id => compdt.segorg_id'||unistr('\000a')||
'                                  , p_comprv_id => :P510_COMPRV_ID'||unistr('\000a')||
'                                  , p_compdt_id => compdt.id) compdt_situacion'||unistr('\000a')||
'from com_proveedores_dot_v compdt'||unistr('\000a')||
'    ,com_compdt_comprt_v comptt'||unistr('\000a')||
'where compdt.id = comptt.compdt_id'||unistr('\000a')||
'  and compdt.tipo = ''GEN'''||unistr('\000a')||
'  and compdt.compde_estado = ''HAB'''||unistr('\000a')||
'  and comptt.comprt_id = (select comprt_id from com_proveedores comprv where comprv.id = :P510_COMPRV_ID)'||unistr('\000a')||
'  and com_pkg.obtn_comdoc_no_fmt ( p_segorg_id => COMPDT.SEGORG_ID'||unistr('\000a')||
'                                 , p_comprv_id => :P510_COMPRV_ID'||unistr('\000a')||
'                                 , p_compdt_id => COMPDT.id) in (''NO PRESENTADO'',''VENCIDO'')'||unistr('\000a')||
'&P510_WHERE.'||unistr('\000a')||
'union all'||unistr('\000a')||
'select distinct compdt.id compdt_id'||unistr('\000a')||
'      , compdt.codigo compdt_codigo'||unistr('\000a')||
'      , compdt.nombre compdt_nombre'||unistr('\000a')||
'      , COMPRV_PKG.COMPTT_OBTN_RUBROS(p_comprv_id => :P510_COMPRV_ID'||unistr('\000a')||
'                                    , p_compdt_id => compdt.id'||unistr('\000a')||
'                                    , p_ver_obligatorio_sn => ''SI'') compdt_tipo_abr'||unistr('\000a')||
'     , com_pkg.obtn_comdoc_estado ( p_segorg_id => compdt.segorg_id'||unistr('\000a')||
'                                  , p_comprv_id => :P510_COMPRV_ID'||unistr('\000a')||
'                                  , p_compdt_id => compdt.id  ) compdt_estado'||unistr('\000a')||
'     , com_pkg.obtn_comdoc_no_fmt ( p_segorg_id => compdt.segorg_id'||unistr('\000a')||
'                                  , p_comprv_id => :P510_COMPRV_ID'||unistr('\000a')||
'                                  , p_compdt_id => compdt.id) compdt_situacion'||unistr('\000a')||
'from com_proveedores_dot_v compdt'||unistr('\000a')||
'    ,com_compdt_comrub_v comtdr'||unistr('\000a')||
'    ,com_proveedores_rub comprr'||unistr('\000a')||
'where compdt.id = comtdr.compdt_id'||unistr('\000a')||
'  and comtdr.comrub_id = comprr.comrub_id'||unistr('\000a')||
'  and comprr.situacion = ''ACT'''||unistr('\000a')||
'  and compdt.tipo = ''RUB'''||unistr('\000a')||
'  and compdt.compde_estado = ''HAB'''||unistr('\000a')||
'  and comprr.comprv_id = :P510_COMPRV_ID'||unistr('\000a')||
'  and com_pkg.obtn_comdoc_no_fmt ( p_segorg_id => COMPDT.SEGORG_ID'||unistr('\000a')||
'                                 , p_comprv_id => :P510_COMPRV_ID'||unistr('\000a')||
'                                 , p_compdt_id => COMPDT.id) in (''NO PRESENTADO'',''VENCIDO'')'||unistr('\000a')||
'&P510_WHERE.');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'select compdt_id'||unistr('\000a')||
'     , compdt_codigo'||unistr('\000a')||
'     , compdt_nombre'||unistr('\000a')||
'     , compdt_tipo_abr'||unistr('\000a')||
'     , compdt_estado'||unistr('\000a')||
'     , compdt_situacion'||unistr('\000a')||
'     , compdt_clase'||unistr('\000a')||
'     --, compdt_obligatorio_sn'||unistr('\000a')||
'     , accion'||unistr('\000a')||
'from (select distinct compdt.id compdt_id'||unistr('\000a')||
'      , compdt.codigo compdt_codigo'||unistr('\000a')||
'      , upper(compdt.nombre) compdt_nombre'||unistr('\000a')||
'      , replace(replace(COMPRV_PKG.COMPTT_OBTN_RUBROS(p_comprv_id => :P510_COMPRV_ID'||unistr('\000a')||
'  ';

a1:=a1||'                                  , p_compdt_id => compdt.id'||unistr('\000a')||
'                                    , p_ver_obligatorio_sn => ''SI''),''GENERAL -'',''''),chr(10),''<br>'') compdt_tipo_abr'||unistr('\000a')||
'     , com_pkg.obtn_comdoc_estado2 ( p_segorg_id => compdt.segorg_id'||unistr('\000a')||
'                                  , p_comprv_id => :P510_COMPRV_ID'||unistr('\000a')||
'                                  , p_compdt_id => compdt.id'||unistr('\000a')||
'                          ';

a1:=a1||'        , p_compdt_tipo_duracion => compdt.tipo_duracion'||unistr('\000a')||
'                                  , p_compde_estado => compdt.compde_estado  ) compdt_estado'||unistr('\000a')||
'     , com_pkg.obtn_comdoc_no_fmt2 ( p_segorg_id => compdt.segorg_id'||unistr('\000a')||
'                                  , p_comprv_id => :P510_COMPRV_ID'||unistr('\000a')||
'                                  , p_compdt_id => compdt.id'||unistr('\000a')||
'                                  , p_compdt_tipo => ';

a1:=a1||'compdt.tipo'||unistr('\000a')||
'                                  , p_compdt_tipo_duracion => compdt.tipo_duracion'||unistr('\000a')||
'                                  , p_compde_estado => compdt.compde_estado) compdt_situacion'||unistr('\000a')||
'     ,''GENERAL'' compdt_clase'||unistr('\000a')||
'     --, comptt.obligatorio_sn compdt_obligatorio_sn'||unistr('\000a')||
'     ,''<a href="f?p=2101:694:&SESSION.::NO:694:P694_COMPRV_ID,P694_EDICION,P694_GENERAR_TRAMITE_SN,G_APP_ANTERIOR_PAG,G_APP_ANTER';

a1:=a1||'IOR:''||:P510_COMPRV_ID||'',NO,SI,&APP_PAGE_ID.,&APP_ID." title="Presentar el documento" alt="Presentar el documento"><img src="#IMAGE_PREFIX#/htmldb/icons/pt_dataload.png"></a>'' ACCION'||unistr('\000a')||
'     --, to_number(decode(comptt.obligatorio_sn,''SI'',''1'',''10'')) orden'||unistr('\000a')||
'from com_proveedores_dot_v compdt'||unistr('\000a')||
'    ,com_compdt_comprt_v comptt'||unistr('\000a')||
'where compdt.id = comptt.compdt_id'||unistr('\000a')||
'  and compdt.tipo = ''GEN'''||unistr('\000a')||
'  and compdt.compde';

a1:=a1||'_estado = ''HAB'''||unistr('\000a')||
'  and comptt.comprt_id = (select comprt_id from com_proveedores comprv where comprv.id = :P510_COMPRV_ID)'||unistr('\000a')||
'  and com_pkg.obtn_comdoc_no_fmt2 ( p_segorg_id => COMPDT.SEGORG_ID'||unistr('\000a')||
'                                 , p_comprv_id => :P510_COMPRV_ID'||unistr('\000a')||
'                                 , p_compdt_id => COMPDT.id'||unistr('\000a')||
'                                 , p_compdt_tipo => compdt.tipo'||unistr('\000a')||
'                    ';

a1:=a1||'             , p_compdt_tipo_duracion => compdt.tipo_duracion'||unistr('\000a')||
'                                 , p_compde_estado => compdt.compde_estado) in (''NO PRESENTADO'',''VENCIDO'')'||unistr('\000a')||
''||unistr('\000a')||
'union all'||unistr('\000a')||
''||unistr('\000a')||
'select distinct compdt.id compdt_id'||unistr('\000a')||
'      , compdt.codigo compdt_codigo'||unistr('\000a')||
'      , upper(compdt.nombre) compdt_nombre'||unistr('\000a')||
'      , replace(replace(COMPRV_PKG.COMPTT_OBTN_RUBROS(p_comprv_id => comprr.comprv_id --:P510_COMPRV_ID'||unistr('\000a')||
'';

a1:=a1||'                                    , p_compdt_id => compdt.id'||unistr('\000a')||
'                                    , p_ver_obligatorio_sn => ''SI''),''RUBRO -'',''''),chr(10),''<br>'') compdt_tipo_abr'||unistr('\000a')||
'     , com_pkg.obtn_comdoc_estado2 ( p_segorg_id => compdt.segorg_id'||unistr('\000a')||
'                                  , p_comprv_id => comprr.comprv_id --:P510_COMPRV_ID'||unistr('\000a')||
'                                  , p_compdt_id => compdt.id  '||unistr('\000a')||
'     ';

a1:=a1||'                             , p_compdt_tipo_duracion => compdt.tipo_duracion'||unistr('\000a')||
'                                  , p_compde_estado => compdt.compde_estado) compdt_estado'||unistr('\000a')||
'     , com_pkg.obtn_comdoc_no_fmt2 ( p_segorg_id => compdt.segorg_id'||unistr('\000a')||
'                                  , p_comprv_id => comprr.comprv_id --:P510_COMPRV_ID'||unistr('\000a')||
'                                  , p_compdt_id => compdt.id'||unistr('\000a')||
'               ';

a1:=a1||'                   , p_compdt_tipo => compdt.tipo'||unistr('\000a')||
'                                  , p_compdt_tipo_duracion => compdt.tipo_duracion'||unistr('\000a')||
'                                  , p_compde_estado => compdt.compde_estado) compdt_situacion'||unistr('\000a')||
'     , ''RUBRO'' compdt_clase'||unistr('\000a')||
'     --, comtdr.obligatorio_sn compdt_obligatorio_sn'||unistr('\000a')||
'     ,''<a href="f?p=2101:694:&SESSION.::NO:694:P694_COMPRV_ID,P694_EDICION,P694_GENERAR_TRAM';

a1:=a1||'ITE_SN,G_APP_ANTERIOR_PAG,G_APP_ANTERIOR:''||comprr.comprv_id||'',NO,SI,&APP_PAGE_ID.,&APP_ID." title="Presentar el documento" alt="Presentar el documento"><img src="#IMAGE_PREFIX#/htmldb/icons/pt_dataload.png"></a>''  ACCION'||unistr('\000a')||
'     --, to_number(decode(comtdr.obligatorio_sn,''SI'',''2'',''20'')) orden'||unistr('\000a')||
'from com_proveedores_dot_v compdt'||unistr('\000a')||
'    ,com_compdt_comrub_v comtdr'||unistr('\000a')||
'    ,com_proveedores_rub comprr'||unistr('\000a')||
'where com';

a1:=a1||'pdt.id = comtdr.compdt_id'||unistr('\000a')||
'  and comtdr.comrub_id = comprr.comrub_id'||unistr('\000a')||
'  and comprr.situacion = ''ACT'''||unistr('\000a')||
'  and compdt.tipo = ''RUB'''||unistr('\000a')||
'  and compdt.compde_estado = ''HAB'''||unistr('\000a')||
'  and comprr.comprv_id = :P510_COMPRV_ID'||unistr('\000a')||
'  and com_pkg.obtn_comdoc_no_fmt2 ( p_segorg_id => COMPDT.SEGORG_ID'||unistr('\000a')||
'                                 , p_comprv_id => comprr.comprv_id --:P510_COMPRV_ID'||unistr('\000a')||
'                                 , p_compdt_id';

a1:=a1||' => COMPDT.id'||unistr('\000a')||
'                                 , p_compdt_tipo => compdt.tipo'||unistr('\000a')||
'                                 , p_compdt_tipo_duracion => compdt.tipo_duracion'||unistr('\000a')||
'                                 , p_compde_estado => compdt.compde_estado) in (''NO PRESENTADO'',''VENCIDO'')'||unistr('\000a')||
''||unistr('\000a')||
'union all'||unistr('\000a')||
''||unistr('\000a')||
'select distinct comode.ID comodt_id'||unistr('\000a')||
'       ,comode.codigo comodt_codigo'||unistr('\000a')||
'       ,upper(comode.nombre) comodt_nombre'||unistr('\000a')||
'      ';

a1:=a1||' ,upper(comode.comobt_nombre||'' ''||comode.COMOBJ_NOMBRE||'' - ''||comode.COMOBJ_CODIGO||'' ''||decode(comode.COMOTT_OBLIGATORIO_SN,''SI'',''(OBLIGATORIO)'',''(OPCIONAL)'')) comodt_tipo_abr'||unistr('\000a')||
'       ,comode.estado comodt_estado'||unistr('\000a')||
'       ,comode.situacion_abr comodt_situacion'||unistr('\000a')||
'       ,''OBJETO'' comodt_clase'||unistr('\000a')||
'       --, comode.COMOTT_OBLIGATORIO_SN comodt_obligatorio_sn'||unistr('\000a')||
'       ,''<a href="f?p=2101:933:&SESSION.::&DEBU';

a1:=a1||'G.:933:P933_COMPRV_ID,P933_COMRUB_ID,P933_COMODT_ID,P933_COMOBJ_ID,P933_COMOBJ_SN,G_APP_ANTERIOR,G_APP_ANTERIOR_PAG:''||comprr.comprv_id||'',''||comprr.comrub_id||'',''||comode.ID||'',''||comode.COMOBJ_ID||'',SI''||'',&APP_ID.,&APP_PAGE_ID." title="Presentar el documento" alt="Presentar el documento"><img src="#IMAGE_PREFIX#/htmldb/icons/pt_dataload.png"></a>'' ACCION'||unistr('\000a')||
'      --, TO_NUMBER(decode(comode.COMOTT';

a1:=a1||'_OBLIGATORIO_SN,''SI'',''3'',''30'')) orden'||unistr('\000a')||
'from   com_objetos_doc_estado_v2 comode'||unistr('\000a')||
'      ,com_proveedores_rub2_v comprr'||unistr('\000a')||
'where  comode.COMOBJ_COMPRV_ID = comprr.comprv_id --:P510_COMPRV_ID'||unistr('\000a')||
'and    comprr.comrub_id = comode.COMOBJ_COMRUB_ID'||unistr('\000a')||
'and    comode.comobj_comprv_id = comprr.comprv_id'||unistr('\000a')||
'and    comode.ESTADO <> ''PRESENTADO'''||unistr('\000a')||
'and    comprr.situacion = ''ACT'''||unistr('\000a')||
''||unistr('\000a')||
'and    comprr.comprv_id = :P510_COMPRV_ID'||unistr('\000a')||
''||unistr('\000a')||
'and ';

a1:=a1||'   comprr.comrub_situacion = ''VIG'')'||unistr('\000a')||
'order by compdt_nombre';

wwv_flow_api.create_worksheet(
  p_id=> 59947816176969503+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_region_id=> 59947631278969501+wwv_flow_api.g_id_offset,
  p_name=> 'Procesos de Compras Proveedores',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '1000000',
  p_max_row_count_message=> 'El recuento máximo de filas de este informe es #MAX_ROW_COUNT# filas. Aplique un filtro para reducir el número de registros de la consulta.',
  p_no_data_found_message=> 'No se ha encontrado ningún dato.',
  p_max_rows_per_page=>'',
  p_search_button_label=>'Buscar',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'',
  p_sql_query => a1,
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'Y',
  p_allow_save_rpt_public=>'N',
  p_allow_report_categories=>'N',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'N',
  p_show_search_bar=>'Y',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'N',
  p_show_select_columns=>'Y',
  p_show_rows_per_page=>'Y',
  p_show_filter=>'N',
  p_show_sort=>'Y',
  p_show_control_break=>'N',
  p_show_highlight=>'N',
  p_show_computation=>'N',
  p_show_aggregate=>'N',
  p_show_chart=>'N',
  p_show_group_by=>'Y',
  p_show_notify=>'N',
  p_show_calendar=>'N',
  p_show_flashback=>'N',
  p_show_reset=>'Y',
  p_show_download=>'N',
  p_show_help=>'Y',
  p_download_formats=>'CSV:HTML:EMAIL',
  p_allow_exclude_null_values=>'N',
  p_allow_hide_extra_columns=>'N',
  p_icon_view_enabled_yn=>'N',
  p_icon_view_use_custom=>'N',
  p_icon_view_columns_per_row=>1,
  p_detail_view_enabled_yn=>'N',
  p_owner=>'JPREDA',
  p_internal_uid=> 59947816176969503);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 59957400755006487+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_worksheet_id => 59947816176969503+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPDT_ID',
  p_display_order          =>1,
  p_column_identifier      =>'A',
  p_column_label           =>'Compdt Id',
  p_report_label           =>'Compdt Id',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 59957520299006489+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_worksheet_id => 59947816176969503+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPDT_CODIGO',
  p_display_order          =>2,
  p_column_identifier      =>'B',
  p_column_label           =>'Codigo',
  p_report_label           =>'Codigo',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 59957611956006489+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_worksheet_id => 59947816176969503+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPDT_NOMBRE',
  p_display_order          =>3,
  p_column_identifier      =>'C',
  p_column_label           =>'Tipo de Documento',
  p_report_label           =>'Tipo de Documento',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'N',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'N',
  p_allow_aggregations     =>'N',
  p_allow_computations     =>'N',
  p_allow_charting         =>'N',
  p_allow_group_by         =>'N',
  p_allow_hide             =>'N',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'LEFT',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 59957729314006489+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_worksheet_id => 59947816176969503+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPDT_TIPO_ABR',
  p_display_order          =>4,
  p_column_identifier      =>'D',
  p_column_label           =>'Para',
  p_report_label           =>'Para',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'N',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'N',
  p_allow_aggregations     =>'N',
  p_allow_computations     =>'N',
  p_allow_charting         =>'N',
  p_allow_group_by         =>'N',
  p_allow_hide             =>'N',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'WITHOUT_MODIFICATION',
  p_heading_alignment      =>'LEFT',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 59957806991006489+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_worksheet_id => 59947816176969503+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPDT_ESTADO',
  p_display_order          =>5,
  p_column_identifier      =>'E',
  p_column_label           =>'Situación',
  p_report_label           =>'Situación',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'N',
  p_allow_filtering        =>'N',
  p_allow_highlighting     =>'N',
  p_allow_ctrl_breaks      =>'N',
  p_allow_aggregations     =>'N',
  p_allow_computations     =>'N',
  p_allow_charting         =>'N',
  p_allow_group_by         =>'N',
  p_allow_hide             =>'N',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'WITHOUT_MODIFICATION',
  p_heading_alignment      =>'LEFT',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 59957921713006489+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_worksheet_id => 59947816176969503+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPDT_SITUACION',
  p_display_order          =>6,
  p_column_identifier      =>'F',
  p_column_label           =>'Situacion',
  p_report_label           =>'Situacion',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 60249502363299982+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_worksheet_id => 59947816176969503+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMPDT_CLASE',
  p_display_order          =>7,
  p_column_identifier      =>'G',
  p_column_label           =>'Clase',
  p_report_label           =>'Clase',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 60250815709324203+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_worksheet_id => 59947816176969503+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ACCION',
  p_display_order          =>8,
  p_column_identifier      =>'H',
  p_column_label           =>'Accion',
  p_report_label           =>'Accion',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'N',
  p_allow_filtering        =>'N',
  p_allow_highlighting     =>'N',
  p_allow_ctrl_breaks      =>'N',
  p_allow_aggregations     =>'N',
  p_allow_computations     =>'N',
  p_allow_charting         =>'N',
  p_allow_group_by         =>'N',
  p_allow_hide             =>'N',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'WITHOUT_MODIFICATION',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'COMPDT_NOMBRE:COMPDT_TIPO_ABR:COMPDT_ESTADO:ACCION';

wwv_flow_api.create_worksheet_rpt(
  p_id => 59951006908969518+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_worksheet_id => 59947816176969503+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_type             =>'REPORT',
  p_report_alias            =>'599511',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>100000,
  p_report_columns          =>rc1,
  p_sort_column_1           =>'0',
  p_sort_direction_1        =>'ASC',
  p_sort_column_2           =>'0',
  p_sort_direction_2        =>'ASC',
  p_sort_column_3           =>'0',
  p_sort_direction_3        =>'ASC',
  p_sort_column_4           =>'0',
  p_sort_direction_4        =>'ASC',
  p_sort_column_5           =>'0',
  p_sort_direction_5        =>'ASC',
  p_sort_column_6           =>'0',
  p_sort_direction_6        =>'ASC',
  p_break_on                =>'0:0:0:0:0',
  p_break_enabled_on        =>'0:0:0:0:0',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 60259812229716948+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_worksheet_id => 59947816176969503+wwv_flow_api.g_id_offset,
  p_report_id => 59951006908969518+wwv_flow_api.g_id_offset,
  p_name                    =>'Documentos Obligatorios para Cotizar',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'COMPDT_TIPO_ABR',
  p_operator                =>'contains',
  p_expr                    =>'(OBLIGATORIO)',
  p_condition_sql           =>' (case when (upper("COMPDT_TIPO_ABR") like ''%''||upper(#APXWS_EXPR#)||''%'') then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# #APXWS_OP_NAME# ''(OBLIGATORIO)''  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_row_font_color          =>'#FA3200',
  p_column_format           =>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 59951832486969528 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_plug_name=> 'TopBar',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236656219840903827+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
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
  p_id=> 59952229689969540 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_plug_name=> 'Buscar',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236656219840903827+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_2',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
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
  p_id=> 59961531515195703 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_plug_name=> 'Operaciones Habilitadas',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 236656544011903827+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 59961708097198325 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 236664835566903831+ wwv_flow_api.g_id_offset,
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
  p_id=> 69366630317691089 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_plug_name=> 'Acerca de',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236656844137903827+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 69354013641763893 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 236663920507903831+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_header=> 'Sr. Proveedor a continuación se encuentran listados los <b>Documentos que Adeuda</b>, ordenados según su importancia, recuerde que al no tener al día algunos de sus <b> Documentos </b>, puede tener restricciones a distintos accesos en el <b>Sistema</b>.<br>'||unistr('\000a')||
'Para más detalle sobre esta pantalla acceda al video tutorial.<br><br>',
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
s:=s||'htp.print('''');';

wwv_flow_api.create_page_plug (
  p_id=> 69367012571704982 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_plug_name=> 'Video tutorial',
  p_region_name=>'dialog-video',
  p_region_attributes=> 'title="Video tutorial - Documentación adeudada"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236656219840903827+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 40,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_list_template_id=> 236663920507903831+ wwv_flow_api.g_id_offset,
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
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 59952009750969531 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 510,
  p_button_sequence=> 100,
  p_button_plug_id => 59951832486969528+wwv_flow_api.g_id_offset,
  p_button_name    => 'P510_RETORNAR',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(236667336255903833+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Retornar',
  p_button_position=> 'TEMPLATE_DEFAULT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&P510_APP_ANTERIOR.:&P510_APP_ANTERIOR_PAG.:&SESSION.',
  p_button_execute_validations=>'Y',
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
  p_id=>59953010023969545 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 510,
  p_name=>'P510_FILTRO_PREDEFINIDO_SEL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 15,
  p_item_plug_id => 59952229689969540+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Filtro Predefinido :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'STATIC2:Procesos Abiertos No Cotizados;PANC,Procesos Abiertos Cotizados;PAC,Procesos Cotizados En Aclaración;PCEAC,Procesos Cotizados En Análisis;PCEA',
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
  p_display_when=>'P510_FILTRO_PREDEFINIDO_SEL',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_read_only_when_type=>'ALWAYS',
  p_field_template=> 236666243463903832+wwv_flow_api.g_id_offset,
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

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>59953816478969546 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 510,
  p_name=>'P510_COMPRV_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 59952229689969540+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Proveedor :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_POPUP_LOV',
  p_lov=> 'select nombre||'' - CUIT: ''||to_char(cuit) d, id r'||unistr('\000a')||
'from com_proveedores'||unistr('\000a')||
'where segorg_id = :p1_segorg_id',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'- TODOS -',
  p_lov_null_value=> '',
  p_cSize=> 80,
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
  p_read_only_when=>'P510_COMPRV_SELECCIONAR_SN',
  p_read_only_when2=>'NO',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_field_template=> 236666243463903832+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NOT_ENTERABLE',
  p_attribute_02 => 'FIRST_ROWSET',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>59954024318969546 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 510,
  p_name=>'P510_WHERE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_item_plug_id => 59952229689969540+wwv_flow_api.g_id_offset,
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
  p_id=>59954218080969546 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 510,
  p_name=>'P510_COMPRV_SELECCIONAR_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 2,
  p_item_plug_id => 59952229689969540+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'NO',
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
  p_id=>59954622755969548 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 510,
  p_name=>'P510_APP_ANTERIOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 3,
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
  p_id=>59954828479969548 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 510,
  p_name=>'P510_APP_ANTERIOR_PAG',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 4,
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
  p_id=>69227310513489825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 510,
  p_name=>'P510_FECHA_INICIO_FIRMA_DIG',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 35,
  p_item_plug_id => 59952229689969540+wwv_flow_api.g_id_offset,
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
  p_id=>69366915546701509 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 510,
  p_name=>'P510_VIDEO_IFRAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 25,
  p_item_plug_id => 59952229689969540+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '<iframe width="670" height="430" src="//www.youtube.com/embed/QJbrfOV3FEI" frameborder="0" allowfullscreen id="clearmySound"></iframe>',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'<iframe width="670" height="430" src="//www.youtube.com/embed/QJbrfOV3FEI" frameborder="0" allowfullscreen id="clearmySound"></iframe>',
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

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'declare'||unistr('\000a')||
'  cursor cr_comprv is'||unistr('\000a')||
'    select comprv.FECHA_INICIO_FIRMA_DIGITAL'||unistr('\000a')||
'      from com_proveedores comprv'||unistr('\000a')||
'     where comprv.id = :P510_COMPRV_ID;'||unistr('\000a')||
'    '||unistr('\000a')||
'  v_comprv_inicio date;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Obtener Datos Proveedor'||unistr('\000a')||
'  open cr_comprv;'||unistr('\000a')||
'  fetch cr_comprv into v_comprv_inicio;'||unistr('\000a')||
'  close cr_comprv;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  :P510_FECHA_INICIO_FIRMA_DIG := v_comprv_inicio;'||unistr('\000a')||
'  --'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 69232928129523554 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 510,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Obtener Datos',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P510_FECHA_INICIO_FIRMA_DIG',
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
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'IF :P510_APP_ANTERIOR IS NULL THEN'||unistr('\000a')||
'   :P510_APP_ANTERIOR := :G_APP_ANTERIOR;'||unistr('\000a')||
'   :P510_APP_ANTERIOR_PAG := :G_APP_ANTERIOR_PAG;'||unistr('\000a')||
'END IF;';

wwv_flow_api.create_page_process(
  p_id     => 59955004965969548 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 510,
  p_process_sequence=> 20,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AsignarAppAnterior',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P510_APP_ANTERIOR',
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
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||':P510_WHERE := NULL;';

wwv_flow_api.create_page_process(
  p_id     => 59955419521969551 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 510,
  p_process_sequence=> 30,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AsignarWhere',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error al asignar filtro al informe.',
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
-- ...updatable report columns for page 510
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
