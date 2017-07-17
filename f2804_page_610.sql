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
--   Date and Time:   14:47 Martes Noviembre 1, 2016
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

PROMPT ...Remove page 610
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>610);
 
end;
/

 
--application/pages/page_00610
prompt  ...PAGE 610: Calendario Proveedor
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 610
 ,p_user_interface_id => 220650599908639021 + wwv_flow_api.g_id_offset
 ,p_name => 'Calendario Proveedor'
 ,p_step_title => 'Calendario Proveedor'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Calendario Proveedor'
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
'function abrir_video (){'||unistr('\000a')||
' $( "#dialog-video" ).html($("#P610_VIDEO_IFRAME").val());'||unistr('\000a')||
' $( "#dialog-video" ).dialog({'||unistr('\000a')||
'   width: 700,'||unistr('\000a')||
'   height: 500,'||unistr('\000a')||
'   modal: true,'||unistr('\000a')||
'   close: function() {'||unistr('\000a')||
'     $( "#dialog-video" ).empty();'||unistr('\000a')||
'   }'||unistr('\000a')||
' });'||unistr('\000a')||
'}'||unistr('\000a')||
''
 ,p_step_template => 236630318532903813 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'CTISSERA'
 ,p_last_upd_yyyymmddhh24miss => '20161031150553'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select rownum id, etiqueta, fecha'||unistr('\000a')||
'from (select trunc(comcon.fecha_fin_propuesta) fecha'||unistr('\000a')||
'             ,''<a href="f?p=2102:200:&SESSION.::NO:200:P200_COMCON_ID,G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P200_MUESTRO_MSJ_SN:''||comcon.id||'',&APP_ID.,&APP_PAGE_ID.,&P610_COMPRV_ID.,SI">Cierre de Proceso no Cotizado: ''||comcon.codigo||''/''||comcon.comped_ejercicio||''</a>'' etiqueta'||unistr('\000a')||
'from com_contrataciones_inv comcoi';

s:=s||''||unistr('\000a')||
'    ,com_contrataciones_v comcon'||unistr('\000a')||
'where comcoi.situacion = ''ACT'''||unistr('\000a')||
'  and comcoi.comcon_id = comcon.id'||unistr('\000a')||
'  and comcon.fecha_publicacion <= sysdate'||unistr('\000a')||
'  and comcoi.comprv_id = :P610_COMPRV_ID'||unistr('\000a')||
'  and comcon_pkg.comcon_comprv_estado(p_comcon_id => comcon.id, p_comprv_id => comcoi.comprv_id) = ''ABIERTO'''||unistr('\000a')||
'  and comcon_pkg.comcon_comprv_ctzcnt(p_comcon_id => comcon.id, p_comprv_id => comcoi.comprv_id) = 0'||unistr('\000a')||
'union a';

s:=s||'ll   '||unistr('\000a')||
'select trunc(comcon.fecha_fin_propuesta) fecha'||unistr('\000a')||
'       ,''<a href="f?p=2102:200:&SESSION.::NO:200:P200_COMCON_ID,G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P200_MUESTRO_MSJ_SN:''||comcon.id||'',&APP_ID.,&APP_PAGE_ID.,&P610_COMPRV_ID.,SI">Cierre de Proceso Cotizado: ''||comcon.codigo||''/''||comcon.comped_ejercicio||''</a>'' etiqueta'||unistr('\000a')||
'from com_contrataciones_inv comcoi'||unistr('\000a')||
'    ,com_contrataciones_v comcon'||unistr('\000a')||
'where com';

s:=s||'coi.situacion = ''ACT'''||unistr('\000a')||
'  and comcoi.comcon_id = comcon.id'||unistr('\000a')||
'  and comcon.fecha_publicacion <= sysdate'||unistr('\000a')||
'  and comcoi.comprv_id = :P610_COMPRV_ID'||unistr('\000a')||
'  and comcon_pkg.comcon_comprv_estado(p_comcon_id => comcon.id, p_comprv_id => comcoi.comprv_id) = ''ABIERTO'''||unistr('\000a')||
'  and comcon_pkg.comcon_comprv_ctzcnt(p_comcon_id => comcon.id, p_comprv_id => comcoi.comprv_id) > 0'||unistr('\000a')||
''||unistr('\000a')||
'union all'||unistr('\000a')||
''||unistr('\000a')||
'select comcet.fecha_vencimiento fecha'||unistr('\000a')||
'';

s:=s||'      , ''<a href="f?p=ADMCOM:891:&SESSION.::NO:891:P891_ID,P891_APP_ANTERIOR,P891_PAG_ANTERIOR:''||comcet.comocm_id||'',&APP_ID.,&APP_PAGE_ID."><font color="red">Vencimiento Entrega Orden: ''||comcet.comocm_codigo||''/''||comcet.COMPED_EJERCICIO||''</font></a>'' etiqueta'||unistr('\000a')||
'from   COM_COMPROBANTES_ENT_V comcet'||unistr('\000a')||
'where  comcet.comprv_id = :P610_COMPRV_ID'||unistr('\000a')||
'and    comcet.COMCEE_ESTADO not in (''NUE'',''ANU'') '||unistr('\000a')||
'union ';

s:=s||'all'||unistr('\000a')||
'select trunc(comcon.fecha_fin_propuesta) fecha'||unistr('\000a')||
'      ,''<a href="f?p=2102:200:&SESSION.::NO:200:P200_COMCON_ID,G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P200_MUESTRO_MSJ_SN:''||comcon.id||'',&APP_ID.,&APP_PAGE_ID.,&P610_COMPRV_ID.,SI">Proceso en Aclaración: ''||comcon.codigo||''/''||comcon.comped_ejercicio||''</a>'' etiqueta'||unistr('\000a')||
'from com_contrataciones_inv comcoi'||unistr('\000a')||
'    ,com_contrataciones_v comcon'||unistr('\000a')||
'where comcoi.situ';

s:=s||'acion = ''ACT'''||unistr('\000a')||
'  and comcoi.comcon_id = comcon.id'||unistr('\000a')||
'  and comcon.fecha_publicacion <= sysdate'||unistr('\000a')||
'  and comcoi.comprv_id = :P610_COMPRV_ID'||unistr('\000a')||
'  and comcon_pkg.comcon_comprv_estado(p_comcon_id => comcon.id, p_comprv_id => comcoi.comprv_id) = ''EN ACLARACION'''||unistr('\000a')||
'union all'||unistr('\000a')||
'select trunc(sysdate) fecha'||unistr('\000a')||
'      ,''<a href="f?p=2102:200:&SESSION.::NO:200:P200_COMCON_ID,G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P200_MUESTRO_MSJ_S';

s:=s||'N:''||comcon.id||'',&APP_ID.,&APP_PAGE_ID.,&P610_COMPRV_ID.,SI">Proceso en Análisis de Oferta: ''||comcon.codigo||''/''||comcon.comped_ejercicio||''</a>'' etiqueta'||unistr('\000a')||
'from com_contrataciones_inv comcoi'||unistr('\000a')||
'    ,com_contrataciones_v comcon'||unistr('\000a')||
'where comcoi.situacion = ''ACT'''||unistr('\000a')||
'  and comcoi.comcon_id = comcon.id'||unistr('\000a')||
'  and comcon.fecha_publicacion <= sysdate'||unistr('\000a')||
'  and comcoi.comprv_id = :P610_COMPRV_ID'||unistr('\000a')||
'  and comcon_pkg.comcon_co';

s:=s||'mprv_estado(p_comcon_id => comcon.id, p_comprv_id => comcoi.comprv_id) = ''EN ANALISIS'''||unistr('\000a')||
'union all'||unistr('\000a')||
'select trunc(comocm.fecha_ultima_entrega) fecha'||unistr('\000a')||
', ''<a href="f?p=COMCON:410:&SESSION.::NO:RP,410:P410_APP_ANTERIOR,P410_APP_ANTERIOR_PAG,P410_COMPRV_ID,P410_COMOCE_ESTADO,P410_FECHA_ENTREGA_DESDE,P410_FECHA_ENTREGA_HASTA:&APP_ID.,&APP_PAGE_ID.,&P610_COMPRV_ID.,APR,''||to_char(trunc(comocm.fecha_ultima_en';

s:=s||'trega),''DD/MM/YYYY'')||'',''||to_char(trunc(comocm.fecha_ultima_entrega),''DD/MM/YYYY'')||''">''||'||unistr('\000a')||
'decode(to_char(count(1)),''1'','' Vence la Entrega de 1 Orden'','' Vence la Entrega de ''||to_char(count(1))||'' Ordenes'')||''</a>'' etiqueta'||unistr('\000a')||
'from com_ordenes_compras comocm'||unistr('\000a')||
'   , com_ordenes_compras_est comoce'||unistr('\000a')||
'where comocm.comoce_id = comoce.id'||unistr('\000a')||
'  and comocm.comprv_id = :P610_COMPRV_ID'||unistr('\000a')||
'  and comocm.segorg_id = :P1_SE';

s:=s||'GORG_ID'||unistr('\000a')||
'  and comoce.estado = ''APR'''||unistr('\000a')||
'group by trunc(comocm.fecha_ultima_entrega)'||unistr('\000a')||
'union all'||unistr('\000a')||
'select trunc(sysdate) fecha'||unistr('\000a')||
'     , decode(cantidad,''0'','''',''<a href="f?p=COMCON:510:&SESSION.::NO:RP,510:P510_APP_ANTERIOR,P510_APP_ANTERIOR_PAG,P510_COMPRV_ID:&APP_ID.,&APP_PAGE_ID.,&P610_COMPRV_ID."><font color="red">Ud. adeuda presentar ''||cantidad||'' documentos</font></a>'') etiqueta'||unistr('\000a')||
'from '||unistr('\000a')||
'(select to_char(c';

s:=s||'ount(1)) cantidad'||unistr('\000a')||
'from ( select distinct compdt.id'||unistr('\000a')||
'from com_proveedores_dot_v compdt'||unistr('\000a')||
'    ,com_compdt_comprt_v comptt'||unistr('\000a')||
'where compdt.id = comptt.compdt_id'||unistr('\000a')||
'  and compdt.tipo = ''GEN'''||unistr('\000a')||
'  and compdt.compde_estado = ''HAB'''||unistr('\000a')||
'  and comptt.comprt_id = (select comprt_id from com_proveedores comprv where comprv.id = :P610_COMPRV_ID)'||unistr('\000a')||
'  and com_pkg.obtn_comdoc_no_fmt ( p_segorg_id => COMPDT.SEGORG_ID'||unistr('\000a')||
'              ';

s:=s||'                   , p_comprv_id => :P610_COMPRV_ID'||unistr('\000a')||
'                                 , p_compdt_id => COMPDT.id) in (''NO PRESENTADO'',''VENCIDO'')'||unistr('\000a')||
'union all'||unistr('\000a')||
'select distinct compdt.id'||unistr('\000a')||
'from com_proveedores_dot_v compdt'||unistr('\000a')||
'    ,com_compdt_comrub_v comtdr'||unistr('\000a')||
'    ,com_proveedores_rub comprr'||unistr('\000a')||
'where compdt.id = comtdr.compdt_id'||unistr('\000a')||
'  and comtdr.comrub_id = comprr.comrub_id'||unistr('\000a')||
'  and comprr.situacion = ''ACT'''||unistr('\000a')||
'  and compdt.t';

s:=s||'ipo = ''RUB'''||unistr('\000a')||
'  and compdt.compde_estado = ''HAB'''||unistr('\000a')||
'  and comprr.comprv_id = :P610_COMPRV_ID'||unistr('\000a')||
'  and com_pkg.obtn_comdoc_no_fmt ( p_segorg_id => COMPDT.SEGORG_ID'||unistr('\000a')||
'                                 , p_comprv_id => comprr.comprv_id --:P610_COMPRV_ID'||unistr('\000a')||
'                                 , p_compdt_id => COMPDT.id) in (''NO PRESENTADO'',''VENCIDO'')'||unistr('\000a')||
'union all'||unistr('\000a')||
'select comode_id'||unistr('\000a')||
'from ('||unistr('\000a')||
'select distinct comode.comobj_codi';

s:=s||'go comobj_codigo'||unistr('\000a')||
'               ,comode.nombre'||unistr('\000a')||
'               ,comode.id comode_id'||unistr('\000a')||
'from   com_objetos_doc_estado_v comode'||unistr('\000a')||
'      ,com_proveedores_rub_v comprr'||unistr('\000a')||
'where  comode.COMOBJ_COMPRV_ID = :P610_COMPRV_ID'||unistr('\000a')||
'and    comprr.comrub_id = comode.COMOBJ_COMRUB_ID'||unistr('\000a')||
'and    comode.comobj_comprv_id = comprr.comprv_id'||unistr('\000a')||
'and    comode.ESTADO <> ''PRESENTADO'''||unistr('\000a')||
'and    comprr.situacion = ''ACT'''||unistr('\000a')||
'and    comprr.comrub_sit';

s:=s||'uacion = ''VIG'')))'||unistr('\000a')||
'union all'||unistr('\000a')||
'SELECT  (COMPRA.FECHA_VENCIMIENTO) fecha'||unistr('\000a')||
'      , ''<a href="f?p=ADMCOM:PRVDET:&SESSION.::NO::P251_ID,P251_APP_ANTERIOR,P251_PAG_ANTERIOR:&P610_COMPRV_ID.,&APP_ID.,&APP_PAGE_ID.">Vencimiento de Cargo: ''||compra.compcc_nombre||'' - ''||compra.apellido||'' ''||compra.nombre||''</a>'' etiqueta'||unistr('\000a')||
'FROM COM_PROVEEDORES_AUT_V COMPRA'||unistr('\000a')||
'WHERE COMPRA.COMPRV_ID = :P610_COMPRV_ID'||unistr('\000a')||
'  AND COMPRA.';

s:=s||'ID in (SELECT  MAX(COMPRA1.ID)'||unistr('\000a')||
'                      FROM (COM_PROVEEDORES_AUT COMPRA1)'||unistr('\000a')||
'                     WHERE COMPRA1.SITUACION not in (''NUE'',''ANU'')'||unistr('\000a')||
'                       AND COMPRA1.COMPRV_ID = COMPRA.COMPRV_ID --:P610_COMPRV_ID'||unistr('\000a')||
'                  GROUP BY COMPRA1.COMPCC_ID, COMPRA1.NUMERO_DOCUMENTO,COMPRA1.COMPRV_ID,COMPRA1.TIPO_DOCUMENTO)'||unistr('\000a')||
'  AND compra.situacion <> ''BAJ'''||unistr('\000a')||
')'||unistr('\000a')||
'';

wwv_flow_api.create_calendar (
  p_id=> 56528923818315976 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 610,
  p_plug_name=> 'Calendario',
  p_region_name=>'',
  p_plug_source=> s,
  p_plug_source_type  => 'CALENDAR',
  p_plug_template=> 236656219840903827+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column  => null,
  p_plug_display_point   => 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_display_condition_type => '',
  p_plug_display_when_condition => '',
  p_plug_display_when_cond2=>'',
  p_plug_read_only_when_type => '',
  p_plug_read_only_when => '',
  p_plug_read_only_when2 =>'',
  p_plug_caching => 'NOT_CACHED',
  p_plug_header=> '',
  p_plug_footer=> '',
  p_plug_override_reg_pos=>'',
  p_plug_customized=>'0',
  p_plug_customized_name=>'',
  p_translate_title=>'Y',
  p_rest_enabled=>'',
  p_plug_comment=> '',
  p_cal_id=>56529132653315996 + wwv_flow_api.g_id_offset,
  p_start_date=>'',
  p_end_date=>'',
  p_begin_at_start_of_interval=>'Y',
  p_date_item=>'P610_CALENDAR_DATE',
  p_display_as=>'M',
  p_display_item=>'',
  p_display_type=>'COL',
  p_item_format=>'',
  p_easy_sql_owner=>'',
  p_easy_sql_table=>'',
  p_date_column=>'FECHA',
  p_end_date_column=>'',
  p_display_column=>'ETIQUETA',
  p_start_of_week=>'19721105',
  p_day_link=>'',
  p_item_link=>'&URL.',
  p_start_time=>'0',
  p_end_time=>'23',
  p_time_format=>'24HOUR',
  p_week_start_day=>'19721105',
  p_week_end_day=>'19721111',
  p_date_type_column=>'P610_CALENDAR_TYPE',
  p_end_date_item=>'P610_CALENDAR_END_DATE',
  p_include_custom_cal=>'N',
  p_custom_cal_days=>3,
  p_primary_key_column=>'ID',
  p_data_background_color=>'',
  p_item_link_primary_key_item=>'',
  p_item_link_date_item=>'',
  p_item_link_open_in=>'W',
  p_include_time_with_date=>'N',
  p_data_text_color=>'',
  p_agenda_cal_days_type=>'MONTH',
  p_agenda_cal_days=>30,
  p_calendar_type=>'A',
  p_template_id=>236668047639903833 + wwv_flow_api.g_id_offset,
  p_calendar_comments=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 56533325956316048 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 610,
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 69374214638030210 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 610,
  p_plug_name=> 'Acerca de',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 236656844137903827+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
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
  p_plug_header=> '<b>Pantalla Calendario de Proveedores.</b><br>'||unistr('\000a')||
'Desde aquí se podrá visualizar fechas y eventos del proveedor conectado. '||unistr('\000a')||
'<br><br> '||unistr('\000a')||
'<b>Vencimiento Entrega Orden:</b> Indica en qué orden se vencen las fechas de  1 o más entregas ese día.'||unistr('\000a')||
'<br>'||unistr('\000a')||
'<b>Adeuda presentar documentos:</b> Indica la cantidad de documentos que adeuda al día de hoy. '||unistr('\000a')||
'<br>'||unistr('\000a')||
'<b>Cierre de Proceso Cotizado:</b> Indica qué Proceso con cotización cierra ese día.'||unistr('\000a')||
'<br>'||unistr('\000a')||
'<b>Cierre de Proceso no Cotizado:</b> Indica qué Proceso sin cotización cierra ese día.'||unistr('\000a')||
'<br>'||unistr('\000a')||
'<b>Proceso en Análisis de Oferta:</b> Indica qué Proceso se encuentra en Análisis de Oferta ese día.'||unistr('\000a')||
'<br>'||unistr('\000a')||
'<b>Proceso en Aclaración:</b> Indica qué Proceso se encuentra en Aclaración ese día.',
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
  p_id=> 69385529610184034 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 610,
  p_plug_name=> 'Video tutorial',
  p_region_name=>'dialog-video',
  p_region_attributes=> 'title="Video tutorial - Calendario"',
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
  p_id             => 56529532006316007 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 610,
  p_button_sequence=> 10,
  p_button_plug_id => 56528923818315976+wwv_flow_api.g_id_offset,
  p_button_name    => 'MONTHLY',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(236667336255903833+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Mensual',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.widget.calendar.ajax_calendar(''M'',''same''); void(0);',
  p_button_condition=> 'NVL(:P610_CALENDAR_TYPE, ''M'') <> ''M''',
  p_button_comment=>'Generated 02/10/14',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 56529306298316001 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 610,
  p_button_sequence=> 20,
  p_button_plug_id => 56528923818315976+wwv_flow_api.g_id_offset,
  p_button_name    => 'WEEKLY',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(236667336255903833+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Semanal',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.widget.calendar.ajax_calendar(''W'',''same''); void(0);',
  p_button_condition=> 'P610_CALENDAR_TYPE',
  p_button_condition2=> 'W',
  p_button_condition_type=> 'NEVER',
  p_button_comment=>'Generated 02/10/14',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 56529706884316009 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 610,
  p_button_sequence=> 30,
  p_button_plug_id => 56528923818315976+wwv_flow_api.g_id_offset,
  p_button_name    => 'DAILY',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(236667336255903833+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Diario',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.widget.calendar.ajax_calendar(''D'',''same''); void(0);',
  p_button_condition=> 'P610_CALENDAR_TYPE',
  p_button_condition2=> 'D',
  p_button_condition_type=> 'NEVER',
  p_button_comment=>'Generated 02/10/14',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 56529905712316009 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 610,
  p_button_sequence=> 40,
  p_button_plug_id => 56528923818315976+wwv_flow_api.g_id_offset,
  p_button_name    => 'LISTVIEW',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(236667336255903833+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Lista',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.widget.calendar.ajax_calendar(''A'',''same''); void(0);',
  p_button_condition=> 'P610_CALENDAR_TYPE',
  p_button_condition2=> 'A',
  p_button_comment=>'Generated 02/10/14',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 56530107559316009 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 610,
  p_button_sequence=> 50,
  p_button_plug_id => 56528923818315976+wwv_flow_api.g_id_offset,
  p_button_name    => 'PREVIOUS',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(236667336255903833+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> '< Anterior',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.widget.calendar.ajax_calendar(''S'',''previous''); void(0);',
  p_button_comment=>'Generated 02/10/14',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 56530311531316009 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 610,
  p_button_sequence=> 60,
  p_button_plug_id => 56528923818315976+wwv_flow_api.g_id_offset,
  p_button_name    => 'TODAY',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(236667336255903833+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Hoy',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.widget.calendar.ajax_calendar(''S'',''today''); void(0);',
  p_button_comment=>'Generated 02/10/14',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 56530507690316009 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 610,
  p_button_sequence=> 70,
  p_button_plug_id => 56528923818315976+wwv_flow_api.g_id_offset,
  p_button_name    => 'NEXT',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(236667336255903833+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Siguiente >',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.widget.calendar.ajax_calendar(''S'',''next''); void(0);',
  p_button_comment=>'Generated 02/10/14',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 56531509528316020 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 610,
  p_button_sequence=> 100,
  p_button_plug_id => 56528923818315976+wwv_flow_api.g_id_offset,
  p_button_name    => 'P610_RETORNAR',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(236667336255903833+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Retornar',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&G_APP_ANTERIOR.:&G_APP_ANTERIOR_PAG.:&SESSION.',
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
  p_id=>56530712368316009 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 610,
  p_name=>'P610_CALENDAR_TYPE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 56528923818315976+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'P610_CALENDAR_DISPLAY',
  p_source=>'P610_CALENDAR_TYPE',
  p_source_type=> 'ITEM',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'N',
  p_item_comment => 'Generated by Calendar wizard on 02/10/14');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>56530907765316017 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 610,
  p_name=>'P610_CALENDAR_DATE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 56528923818315976+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'return sysdate;',
  p_item_default_type=> 'PLSQL_FUNCTION_BODY',
  p_prompt=>'Fecha de Inicio',
  p_source=>'P610_CALENDAR_DATE',
  p_source_type=> 'ITEM',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'N',
  p_item_comment => 'Generated by Calendar wizard on 02/10/14');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>56531132083316017 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 610,
  p_name=>'P610_CALENDAR_END_DATE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 56528923818315976+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'return sysdate+3;',
  p_item_default_type=> 'PLSQL_FUNCTION_BODY',
  p_prompt=>'Fecha de Finalización',
  p_source=>'P610_CALENDAR_END_DATE',
  p_source_type=> 'ITEM',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'N',
  p_item_comment => 'Generated by Calendar wizard on 02/10/14');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>56532118372316023 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 610,
  p_name=>'P610_COMPRV_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 56528923818315976+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Proveedor :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_POPUP_LOV',
  p_lov=> 'select nombre||'' - CUIT: ''||cuit d, id r'||unistr('\000a')||
'from com_proveedores'||unistr('\000a')||
'where segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'- TODOS -',
  p_lov_null_value=> '',
  p_cSize=> 50,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when=>'NVL(:P610_COMPRV_SELECCIONAR_SN,''SI'') = ''NO''',
  p_read_only_when_type=>'PLSQL_EXPRESSION',
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
  p_id=>56532321994316023 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 610,
  p_name=>'P610_APLICAR_FILTRO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 56528923818315976+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Aplicar Filtro',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(236666722652903832 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'NVL(:P610_COMPRV_SELECCIONAR_SN,''SI'') = ''SI''',
  p_display_when_type=>'PLSQL_EXPRESSION',
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
  p_id=>56532526815316023 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 610,
  p_name=>'P610_COMPRV_SELECCIONAR_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 56528923818315976+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'SI',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'SI',
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
  p_id=>56532729437316023 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 610,
  p_name=>'P610_WHERE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 56528923818315976+wwv_flow_api.g_id_offset,
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
  p_id=>69384913869887142 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 610,
  p_name=>'P610_VIDEO_IFRAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 56528923818315976+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '<iframe width="670" height="430" src="//www.youtube.com/embed/Jl6AMnLVPJI" frameborder="0" allowfullscreen id="clearmySound"></iframe>',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'<iframe width="670" height="430" src="" frameborder="0" allowfullscreen id="clearmySound"></iframe>',
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
 
---------------------------------------
-- ...updatable report columns for page 610
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
