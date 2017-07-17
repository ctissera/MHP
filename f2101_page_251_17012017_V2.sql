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
--   Date and Time:   15:21 Martes Enero 17, 2017
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

PROMPT ...Remove page 251
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>251);
 
end;
/

 
--application/pages/page_00251
prompt  ...PAGE 251: Detalle de Proveedores
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 251
 ,p_user_interface_id => 70527406842675 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'ADMINISTRACION'
 ,p_name => 'Detalle de Proveedores'
 ,p_alias => 'PRVDET'
 ,p_step_title => 'Detalle de Proveedores'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Detalle del Proveedor'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 15894629861903129 + wwv_flow_api.g_id_offset
 ,p_javascript_code => 
'function darbaja(ID) {'||unistr('\000a')||
'  document.getElementById(''P251_DOC_ID_ANULAR'').value = ID;'||unistr('\000a')||
'  abrir_ventana(''BAJA'',''P251_MOTIVO'',''Dar de Baja Documento'',''¿Desea Dar de Baja el Documento ?'','''','''');'||unistr('\000a')||
'    '||unistr('\000a')||
'      /*'||unistr('\000a')||
'      var conf;'||unistr('\000a')||
'      conf = confirm(''¿Desea Dar de Baja el Documento ?'');'||unistr('\000a')||
'      if (conf == true) {'||unistr('\000a')||
'         doSubmit(''anular'');'||unistr('\000a')||
'      };*/'||unistr('\000a')||
'}'||unistr('\000a')||
'function darBajaDocObjeto(ID) {'||unistr('\000a')||
'  document.getElementBy'||
'Id(''P251_COMOBD_ID'').value = ID;'||unistr('\000a')||
'  abrir_ventana(''BAJA_COMOBD'',''P251_MOTIVO'',''Dar de Baja Documento'',''¿Desea Dar de Baja el Documento ?'','''','''');'||unistr('\000a')||
'}'||unistr('\000a')||
'function suspenderRegistro(ID,NOMBRE) {'||unistr('\000a')||
'      document.getElementById(''P251_COMRGP_ID'').value = ID;'||unistr('\000a')||
'    abrir_ventana(''SUS_COMRGP'',''P251_MOTIVO'',''Suspender Proveedor'',''Desea suspender al Proveedor del Registro de Proveedores: ''+NOMBRE+''? <br> <span styl'||
'e="color:red;font-weight:bold;">*</span> Ingrese el motivo de la Suspensión'','''','''');'||unistr('\000a')||
'}'||unistr('\000a')||
'function habilitarRegistro(ID,NOMBRE) {'||unistr('\000a')||
'      document.getElementById(''P251_COMPRG_ID'').value = ID;'||unistr('\000a')||
'    abrir_ventana(''HAB_COMRGP'',''P251_MOTIVO'',''Habilitar Proveedor'',''Desea habilitar al Proveedor del Registro de Proveedores: ''+NOMBRE+''?'','''','''');'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
''
 ,p_required_role => 8492620586476910 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'CTISSERA'
 ,p_last_upd_yyyymmddhh24miss => '20170117151546'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT COMPRS.COMRES_TIPO_DOCUMENTO||'': ''||COMPRS.COMRES_NUMERO_DOCUMENTO Documento'||unistr('\000a')||
'      ,COMPRS.COMRES_NOMBRE'||unistr('\000a')||
'      ,COMPRS.COMRES_EMAIL '||unistr('\000a')||
'      ,''<b>''||(select rv_abbreviation'||unistr('\000a')||
'         from   cg_ref_codes'||unistr('\000a')||
'        where  rv_domain = ''COM_PROVEEDORES_RES.SITUACION'''||unistr('\000a')||
'          and rv_low_value = COMPRS.SITUACION)'||unistr('\000a')||
'      ||''</b> desde el: ''||NVL(COMPRS.FECHA_VALIDEZ,COMPRS.FECHA_VIGENCIA) SITUACIONES'||unistr('\000a')||
'';

s:=s||'      ,COMPRS.FECHA_VIGENCIA'||unistr('\000a')||
'      ,COMPRS.FECHA_VALIDEZ'||unistr('\000a')||
'      ,COMPRV_ID'||unistr('\000a')||
'      ,COMRES_ID'||unistr('\000a')||
'  FROM COM_PROVEEDORES_RES_V COMPRS'||unistr('\000a')||
' WHERE COMPRS.COMPRV_ID = :P251_ID'||unistr('\000a')||
'   AND instr(:P251_FILTRO_RESPONSABLES,COMPRS.SITUACION) > 0';

wwv_flow_api.create_report_region (
  p_id=> 1334332750289275 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 251,
  p_name=> '&P1_COMETQ_PRS.  del &P1_COMETQ_PRVS.',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 50,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se ha encontrado ningún dato',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_sort_null=> 'F',
  p_query_asc_image=> 'arrow_down_gray_dark.gif',
  p_query_asc_image_attr=> 'width="13" height="12" alt=""',
  p_query_desc_image=> 'arrow_up_gray_dark.gif',
  p_query_desc_image_attr=> 'width="13" height="12" alt=""',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1336105870291067 + wwv_flow_api.g_id_offset,
  p_region_id=> 1334332750289275 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Documento',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1336227357291067 + wwv_flow_api.g_id_offset,
  p_region_id=> 1334332750289275 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMRES_NOMBRE',
  p_column_display_sequence=> 3,
  p_column_heading=> '&P1_COMETQ_PRSS.',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1336318072291071 + wwv_flow_api.g_id_offset,
  p_region_id=> 1334332750289275 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMRES_EMAIL',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Mail',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1335011934289312 + wwv_flow_api.g_id_offset,
  p_region_id=> 1334332750289275 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACIONES',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Situación',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1335213818289312 + wwv_flow_api.g_id_offset,
  p_region_id=> 1334332750289275 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VIGENCIA',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Fecha Vigencia',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_when_cond_type=> 'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2',
  p_display_when_condition=> 'P251_FILTRO_DOMICILIOS',
  p_display_when_condition2=> 'ACT',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1335311622289314 + wwv_flow_api.g_id_offset,
  p_region_id=> 1334332750289275 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VALIDEZ',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Fecha Validez',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_when_cond_type=> 'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2',
  p_display_when_condition=> 'P251_FILTRO_DOMICILIOS',
  p_display_when_condition2=> 'ACT',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1334531024289306 + wwv_flow_api.g_id_offset,
  p_region_id=> 1334332750289275 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Comprv Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1336401625291073 + wwv_flow_api.g_id_offset,
  p_region_id=> 1334332750289275 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'COMRES_ID',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Comres Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1336918645342010 + wwv_flow_api.g_id_offset,
  p_region_id=> 1334332750289275 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'LINK$01',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Acciones',
  p_column_link=>'f?p=&APP_ID.:246:&SESSION.::&DEBUG.:246:P246_COMPRV_ID,P246_COMRES_ID:#COMPRV_ID#,#COMRES_ID#',
  p_column_linktext=>'Restablecer Contraseña',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_report_column_required_role => 7359024920971988+ wwv_flow_api.g_id_offset,
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_derived_column=> 'Y',
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT COMPRB.comprv_id'||unistr('\000a')||
'      ,COMPRB.comrub_id'||unistr('\000a')||
'      ,COMPRB.comrub_codigo'||unistr('\000a')||
'      ,decode((select distinct 1'||unistr('\000a')||
'               from   COM_PROVEEDORES_RUB_V comprr'||unistr('\000a')||
'               where comprr.SITUACION = ''ACT'''||unistr('\000a')||
'               and   comprr.COMRUB_SITUACION = ''VIG'''||unistr('\000a')||
'               and   comprr.COMRUB_CONTIENE_OBJETOS_SN = ''SI'''||unistr('\000a')||
'               and   comprr.COMPRV_ID = :P251_ID'||unistr('\000a')||
'               and   comprr.CO';

s:=s||'MRUB_ID = comprb.COMRUB_ID),null,'' '',''<a href="f?p=&APP_ID.:268:&SESSION.::&DEBUG.:268:P268_COMPRV_ID,P268_COMRUB_ID:&P251_ID.,''||comprb.COMRUB_ID||''"><img src="#IMAGE_PREFIX#e2.gif"></a>'') ICONO'||unistr('\000a')||
'      ,COMPRB.comrub_nombre comrub_nombre'||unistr('\000a')||
'      ,COMPRB.comrub_situacion'||unistr('\000a')||
'      ,'' <b>''||(select rv_abbreviation'||unistr('\000a')||
'         from   cg_ref_codes'||unistr('\000a')||
'        where  rv_domain = ''COM_PROVEEDORES_RUB.SITUACION'''||unistr('\000a')||
'    ';

s:=s||'      and rv_low_value = COMPRB.SITUACION)'||unistr('\000a')||
'      ||''</b> desde el: ''|| NVL(COMPRB.FECHA_VALIDEZ,COMPRB.FECHA_VIGENCIA) SITUACIONES'||unistr('\000a')||
'      ,COMPRB.FECHA_VIGENCIA'||unistr('\000a')||
'      ,COMPRB.FECHA_VALIDEZ'||unistr('\000a')||
'     ,''<a href="javascript:popUp2(''''f?p=&APP_ID.:635:&SESSION.::&DEBUG.:635:P635_COMPRV_ID,P635_COMRUB_ID:''||COMPRB.COMPRV_ID||'',''||COMPRB.comrub_id||'''''',660,610)">'''||unistr('\000a')||
'       ||REPLACE((COM_PKG.OBTN_REPUTACION_URL(';

s:=s||'P_COMRUB_ID => COMPRB.comrub_id'||unistr('\000a')||
'                  ,P_COMPRV_ID => COMPRB.comprv_id'||unistr('\000a')||
'                  ,P_FECHA_VIGENCIA => SYSDATE'||unistr('\000a')||
'                  ,P_COLOR_FONDO => ''G'')'||unistr('\000a')||
'                 ),''WORKSPACE_IMAGES.'',''#WORKSPACE_IMAGES#'')||''</a>'' REPUTACION'||unistr('\000a')||
'     ,decode(COMPRV_PKG.COMPRV_COMRUB_COTIZAR_SN(p_comprv_id => :P251_ID'||unistr('\000a')||
'                                      ,p_comrub_id => comprb.comrub_id'||unistr('\000a')||
'     ';

s:=s||'                                 ,p_fecha     => sysdate),''NO'',''<font color="red"><b>DEBE</b></font>'',''<font color="green"><b>AL DIA</b></font>'') DOCUMENTACION'||unistr('\000a')||
' FROM COM_PROVEEDORES_RUB_V comprb'||unistr('\000a')||
'WHERE COMPRB.COMPRV_ID = :P251_ID'||unistr('\000a')||
'  AND instr(NVL(:P251_FILTRO_RUBROS,''ACT''),COMPRB.SITUACION) > 0'||unistr('\000a')||
'ORDER BY COMPRB.comrub_codigo,COMPRB.FECHA_VIGENCIA,COMPRB.FECHA_VALIDEZ';

wwv_flow_api.create_report_region (
  p_id=> 12608312213772551 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 251,
  p_name=> '&P1_COMETQ_RUB. del &P1_COMETQ_PRVS.',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 40,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '20',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se ha encontrado ningún dato',
  p_query_num_rows_item=> '20',
  p_query_num_rows_type=> 'ROW_RANGES_WITH_LINKS',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_sort_null=> 'F',
  p_query_asc_image=> 'arrow_down_gray_dark.gif',
  p_query_asc_image_attr=> 'width="13" height="12" alt=""',
  p_query_desc_image=> 'arrow_up_gray_dark.gif',
  p_query_desc_image_attr=> 'width="13" height="12" alt=""',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12827623591103568 + wwv_flow_api.g_id_offset,
  p_region_id=> 12608312213772551 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Comprv Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12608619059772557 + wwv_flow_api.g_id_offset,
  p_region_id=> 12608312213772551 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMRUB_ID',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Comrub Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12925717262445371 + wwv_flow_api.g_id_offset,
  p_region_id=> 12608312213772551 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMRUB_CODIGO',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Código',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32425313583224448 + wwv_flow_api.g_id_offset,
  p_region_id=> 12608312213772551 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'ICONO',
  p_column_display_sequence=> 4,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'CENTER',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12608924260772557 + wwv_flow_api.g_id_offset,
  p_region_id=> 12608312213772551 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMRUB_NOMBRE',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Nombre ',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12609104084772557 + wwv_flow_api.g_id_offset,
  p_region_id=> 12608312213772551 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'COMRUB_SITUACION',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Comrub Situacion',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 13363610654079488 + wwv_flow_api.g_id_offset,
  p_region_id=> 12608312213772551 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACIONES',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Situación',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 13364612432108394 + wwv_flow_api.g_id_offset,
  p_region_id=> 12608312213772551 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VIGENCIA',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Fecha Vigencia',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2',
  p_display_when_condition=> 'P251_FILTRO_RUBROS',
  p_display_when_condition2=> 'ACT',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 13364711210108394 + wwv_flow_api.g_id_offset,
  p_region_id=> 12608312213772551 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VALIDEZ',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Fecha Validez',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2',
  p_display_when_condition=> 'P251_FILTRO_RUBROS',
  p_display_when_condition2=> 'ACT',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31200215990792344 + wwv_flow_api.g_id_offset,
  p_region_id=> 12608312213772551 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'REPUTACION',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Reputación',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_report_column_required_role => 31685214962055744+ wwv_flow_api.g_id_offset,
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 8314003277023585 + wwv_flow_api.g_id_offset,
  p_region_id=> 12608312213772551 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTACION',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Documentación Específica',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 12609930123772557 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 251,
  p_plug_name=> 'Datos del &P1_COMETQ_PRVS.',
  p_region_name=>'',
  p_region_attributes=> 'style="width:95%"',
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
  p_id=> 12610125386772557 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 251,
  p_plug_name=> 'Información de Auditoría',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142027958134227099+ wwv_flow_api.g_id_offset,
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
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_required_role => 16289720148387654+ wwv_flow_api.g_id_offset,
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
  p_id=> 12612126359772560 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 251,
  p_plug_name=> 'Ruta de Navegación',
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
s:=s||'SELECT COMPRD_V.COMPRV_ID'||unistr('\000a')||
'      ,''<b>''||COMPRD_V.COMDMT_NOMBRE||''<b>'' COMDMT_NOMBRE'||unistr('\000a')||
'      ,''  ''||LTRIM(RTRIM(COMPRD_V.COMDOM_PAIS||''  ''||COMPRD_V.COMDOM_PROVINCIA||'' <br> ''||COMPRD_V.COMDOM_DEPARTAMENTO||''  ''||COMPRD_V.COMDOM_LOCALIDAD)) UBICACION'||unistr('\000a')||
'      ,COMPRD_V.COMDOM_CALLE||'' ''||COMPRD_V.COMDOM_NUMERO_CASA||'' ''|| COMPRD_V.COMDOM_PISO||'' ''||COMPRD_V.COMDOM_DPTO||'' ''||COMPRD_V.COMDOM_OBSERVACION|';

s:=s||'|'' ''||DECODE(COMPRD_V.COMDOM_CODIGO_POSTAL,'''','''',''<br>  C.P.:''||COMPRD_V.COMDOM_CODIGO_POSTAL)  DIRECCION'||unistr('\000a')||
'      ,'' Tel: ''||COMPRD_V.COMDOM_TELEFONO_CODIGO_AREA'||unistr('\000a')||
'       ||''-''||COMPRD_V.COMDOM_TELEFONO_NUMERO||''<br>Fax: ''||'||unistr('\000a')||
'      COMPRD_V.COMDOM_FAX_CODIGO_AREA||'' ''||COMPRD_V.COMDOM_FAX_NUMERO TELEFONO'||unistr('\000a')||
'      ,'' <b>''||(select rv_abbreviation'||unistr('\000a')||
'         from   cg_ref_codes'||unistr('\000a')||
'        where  rv_domain = ''COM';

s:=s||'_PROVEEDORES_DOM.SITUACION'''||unistr('\000a')||
'          and rv_low_value = COMPRD_V.SITUACION)'||unistr('\000a')||
'      ||''</b> desde el: ''|| NVL(COMPRD_V.FECHA_VALIDEZ,COMPRD_V.FECHA_VIGENCIA) SITUACIONES'||unistr('\000a')||
'      ,COMPRD_V.SITUACION'||unistr('\000a')||
'      ,COMPRD_V.FECHA_VIGENCIA'||unistr('\000a')||
'      ,COMPRD_V.FECHA_VALIDEZ'||unistr('\000a')||
'      ,COMPRD_V.COMDOM_PAIS'||unistr('\000a')||
'      ,COMPRD_V.COMDOM_PROVINCIA'||unistr('\000a')||
'      ,COMPRD_V.COMDOM_LOCALIDAD'||unistr('\000a')||
'      ,LTRIM(RTRIM(COMPRD_V.COMDOM_NUMERO_CASA||'' ';

s:=s||'''||COMPRD_V.COMDOM_CALLE)) COMDOM_CALLE'||unistr('\000a')||
'      ,(case when COMPRD_V.COMDOM_NUMERO_CASA IS NOT NULL AND'||unistr('\000a')||
'                  COMPRD_V.COMDOM_CALLE IS NOT NULL then'||unistr('\000a')||
'         ''Ver en Google Maps'''||unistr('\000a')||
'       else'||unistr('\000a')||
'         '''''||unistr('\000a')||
'       end) ACCIONES'||unistr('\000a')||
'      ,''<hr>'' linea'||unistr('\000a')||
' FROM COM_PROVEEDORES_DOM_V COMPRD_V'||unistr('\000a')||
'  WHERE COMPRD_V.COMPRV_ID = :P251_ID'||unistr('\000a')||
'    AND instr(NVL(:P251_FILTRO_DOMICILIOS,''ACT''),SITUACION) > 0';

wwv_flow_api.create_report_region (
  p_id=> 12828806369155322 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 251,
  p_name=> 'Domicilios declarados por el &P1_COMETQ_PRVS.',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 30,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se ha encontrado ningún dato',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_sort_null=> 'F',
  p_query_asc_image=> 'arrow_down_gray_dark.gif',
  p_query_asc_image_attr=> 'width="13" height="12" alt=""',
  p_query_desc_image=> 'arrow_up_gray_dark.gif',
  p_query_desc_image_attr=> 'width="13" height="12" alt=""',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12830200931155335 + wwv_flow_api.g_id_offset,
  p_region_id=> 12828806369155322 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Comprv Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12829018221155333 + wwv_flow_api.g_id_offset,
  p_region_id=> 12828806369155322 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMDMT_NOMBRE',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Domicilio',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12833515906271610 + wwv_flow_api.g_id_offset,
  p_region_id=> 12828806369155322 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'UBICACION',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Ubicación ',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12830027730155335 + wwv_flow_api.g_id_offset,
  p_region_id=> 12828806369155322 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'DIRECCION',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Calle ',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12829129090155335 + wwv_flow_api.g_id_offset,
  p_region_id=> 12828806369155322 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'TELEFONO',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Teléfono / Fax',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12888009006846826 + wwv_flow_api.g_id_offset,
  p_region_id=> 12828806369155322 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACIONES',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Situación',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12907525723258513 + wwv_flow_api.g_id_offset,
  p_region_id=> 12828806369155322 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Situacion',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 13364228793094226 + wwv_flow_api.g_id_offset,
  p_region_id=> 12828806369155322 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VIGENCIA',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Fecha Vigencia',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2',
  p_display_when_condition=> 'P251_FILTRO_DOMICILIOS',
  p_display_when_condition2=> 'ACT',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 13364309066094226 + wwv_flow_api.g_id_offset,
  p_region_id=> 12828806369155322 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VALIDEZ',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Fecha Validez',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2',
  p_display_when_condition=> 'P251_FILTRO_DOMICILIOS',
  p_display_when_condition2=> 'ACT',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 15839824851999802 + wwv_flow_api.g_id_offset,
  p_region_id=> 12828806369155322 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'COMDOM_PAIS',
  p_column_display_sequence=> 12,
  p_column_heading=> 'Comdom Pais',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 15839904897999802 + wwv_flow_api.g_id_offset,
  p_region_id=> 12828806369155322 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'COMDOM_PROVINCIA',
  p_column_display_sequence=> 13,
  p_column_heading=> 'Comdom Provincia',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 15840021116999802 + wwv_flow_api.g_id_offset,
  p_region_id=> 12828806369155322 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'COMDOM_LOCALIDAD',
  p_column_display_sequence=> 14,
  p_column_heading=> 'Comdom Localidad',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 15840125674999802 + wwv_flow_api.g_id_offset,
  p_region_id=> 12828806369155322 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'COMDOM_CALLE',
  p_column_display_sequence=> 15,
  p_column_heading=> 'Comdom Calle',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 15839403811974799 + wwv_flow_api.g_id_offset,
  p_region_id=> 12828806369155322 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'ACCIONES',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Acciones',
  p_column_link=>'f?p=GGMSRV:200:&SESSION.::&DEBUG.::P200_PAIS,P200_PROVINCIA,P200_CIUDAD,P200_CALLE,P200_VER_PARAMETROS:#COMDOM_PAIS#,#COMDOM_PROVINCIA#,#COMDOM_LOCALIDAD#,#COMDOM_CALLE#,NO',
  p_column_linktext=>'#ACCIONES#',
  p_column_link_attr=>'target="_blank"',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12829517028155335 + wwv_flow_api.g_id_offset,
  p_region_id=> 12828806369155322 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 15,
  p_form_element_id=> null,
  p_column_alias=> 'LINEA',
  p_column_display_sequence=> 11,
  p_column_heading=> '<hr>',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT ID'||unistr('\000a')||
',(select rv_abbreviation'||unistr('\000a')||
'from cg_ref_codes'||unistr('\000a')||
'where rv_domain = ''COM_PROVEEDORES_EST.ESTADO'''||unistr('\000a')||
'and rv_low_value = COMPRE_V.ESTADO) ESTADO'||unistr('\000a')||
',COMPRE_V.FECHA_VIGENCIA'||unistr('\000a')||
',COMPRE_V.FECHA_VALIDEZ'||unistr('\000a')||
',DECODE(GRAL_PKG.OBTN_VALORPARAMETRO(''NORMATIVA'',COMPRE_V.DESCRIPCION),'''',COMPRE_V.DESCRIPCION,''NORMATIVA: ''||GRAL_PKG.OBTN_VALORPARAMETRO(''NORMATIVA'',COMPRE_V.DESCRIPCION)||'||unistr('\000a')||
'''<br>DESCRIPCION: ''||GRAL_PKG.OBT';

s:=s||'N_VALORPARAMETRO(''DESCRIPCION'',COMPRE_V.DESCRIPCION)) DESCRIPCION'||unistr('\000a')||
','' <b>''||(select rv_abbreviation from cg_ref_codes'||unistr('\000a')||
'where rv_domain = ''COM_PROVEEDORES_EST.SITUACION'''||unistr('\000a')||
'and rv_low_value = COMPRE_V.SITUACION)||''</b> '''||unistr('\000a')||
'||'' ''||COMPRE_V.MOTIVO_SITUACION SITUACIONES'||unistr('\000a')||
',COMPRE_V.SITUACION'||unistr('\000a')||
',(case when (ID = COM_PKG.OBTN_COMPRE_ID(p_comprv_id => :P251_id) AND COMPRE_V.ESTADO <> ''PEN'') then'||unistr('\000a')||
'''<a href="f?p=&APP_';

s:=s||'ID.:258:&SESSION.::NO::P258_COMPRV_ID:''||to_char(:P251_id)||''" title="Anular Estado"> Anular Estado'''||unistr('\000a')||
'else '''' end) ACCIONES'||unistr('\000a')||
',COMPRE_V.DATE_CREATED'||unistr('\000a')||
',COMPRE_V.CREATED_BY'||unistr('\000a')||
',COMPRE_V.DATE_MODIFIED'||unistr('\000a')||
',COMPRE_V.MODIFIED_BY'||unistr('\000a')||
'FROM COM_PROVEEDORES_EST_V COMPRE_V'||unistr('\000a')||
'WHERE COMPRV_ID = :P251_ID'||unistr('\000a')||
'AND ( (:P251_FILTRO_ESTADO = ''VIG'' AND COMPRE_V.ID = COM_PKG.OBTN_COMPRE_ID(:P251_ID)) OR (:P251_FILTRO_ESTADO = ''HIS'' AND C';

s:=s||'OMPRE_V.ID <> COM_PKG.OBTN_COMPRE_ID(:P251_ID)) OR (:P251_FILTRO_ESTADO = ''VIGHIS''))'||unistr('\000a')||
'AND ( (:P251_FILTRO_ESTADO2 = ''VAL'' AND COMPRE_V.SITUACION = ''VAL'') OR (:P251_FILTRO_ESTADO2 = ''ANU'' AND COMPRE_V.SITUACION = ''ANU'') OR (:P251_FILTRO_ESTADO2 = ''ALL''))'||unistr('\000a')||
'ORDER BY COMPRE_V.ESTADO_ACTUAL_SN DESC, COMPRE_V.ID DESC'||unistr('\000a')||
'';

wwv_flow_api.create_report_region (
  p_id=> 13064301694410488 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 251,
  p_name=> 'Detalle de Estados del &P1_COMETQ_PRVS.',
  p_region_name=>'',
  p_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 10,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_required_role => 16136604423269591+ wwv_flow_api.g_id_offset,
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se ha encontrado ningún dato',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_sort_null=> 'F',
  p_query_asc_image=> 'arrow_down_gray_dark.gif',
  p_query_asc_image_attr=> 'width="13" height="12" alt=""',
  p_query_desc_image=> 'arrow_up_gray_dark.gif',
  p_query_desc_image_attr=> 'width="13" height="12" alt=""',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 13065428360418222 + wwv_flow_api.g_id_offset,
  p_region_id=> 13064301694410488 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 13065513679418222 + wwv_flow_api.g_id_offset,
  p_region_id=> 13064301694410488 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'ESTADO',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Estado',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 13388506236127088 + wwv_flow_api.g_id_offset,
  p_region_id=> 13064301694410488 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VIGENCIA',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Fecha Vigencia',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 13388623534127088 + wwv_flow_api.g_id_offset,
  p_region_id=> 13064301694410488 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VALIDEZ',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Fecha Validez',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2',
  p_display_when_condition=> 'P251_FILTRO_ESTADO',
  p_display_when_condition2=> 'VIG',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 13388709902127088 + wwv_flow_api.g_id_offset,
  p_region_id=> 13064301694410488 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'DESCRIPCION',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Motivo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 13073011063564647 + wwv_flow_api.g_id_offset,
  p_region_id=> 13064301694410488 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACIONES',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Situación',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2',
  p_display_when_condition=> 'P251_FILTRO_ESTADO',
  p_display_when_condition2=> 'VIG',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 13064618099410501 + wwv_flow_api.g_id_offset,
  p_region_id=> 13064301694410488 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Situacion',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 13372821688771993 + wwv_flow_api.g_id_offset,
  p_region_id=> 13064301694410488 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'ACCIONES',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Acciones',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_report_column_required_role => 7359130115973512+ wwv_flow_api.g_id_offset,
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 13407806590253187 + wwv_flow_api.g_id_offset,
  p_region_id=> 13064301694410488 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'DATE_CREATED',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Registrado el',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2',
  p_display_when_condition=> 'P251_FILTRO_ESTADO',
  p_display_when_condition2=> 'VIG',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 13407919816253187 + wwv_flow_api.g_id_offset,
  p_region_id=> 13064301694410488 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'CREATED_BY',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Registrado por',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 13408020975253187 + wwv_flow_api.g_id_offset,
  p_region_id=> 13064301694410488 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'DATE_MODIFIED',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Actualizado el',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2',
  p_display_when_condition=> 'P251_FILTRO_ESTADO',
  p_display_when_condition2=> 'VIG',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 13408103748253187 + wwv_flow_api.g_id_offset,
  p_region_id=> 13064301694410488 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'MODIFIED_BY',
  p_column_display_sequence=> 12,
  p_column_heading=> 'Actualizado por',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select COMPDO.ID'||unistr('\000a')||
'      ,COMPDO.COMPRV_ID'||unistr('\000a')||
'      ,COMPDO.FECHA_EMISION'||unistr('\000a')||
'      ,COMPDO.FECHA_VENCIMIENTO'||unistr('\000a')||
'      ,COMPDO.FECHA_PRESENTACION'||unistr('\000a')||
'      ,COMPDO.COMENTARIO'||unistr('\000a')||
'      ,(case '||unistr('\000a')||
'          when INSTR(COMPDO.MIMETYPE,''pdf'') > 0 then ''<img src="#IMAGE_PREFIX#ws/download_pdf_32x24.gif">'''||unistr('\000a')||
'          when INSTR(COMPDO.MIMETYPE,''excel'') > 0 then ''<img src="#IMAGE_PREFIX#ws/download_csv_32x24.gif">'''||unistr('\000a')||
'          w';

s:=s||'hen INSTR(COMPDO.MIMETYPE,''oct'') > 0 then ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">'''||unistr('\000a')||
'          when INSTR(COMPDO.MIMETYPE,''word'') > 0 then ''<img src="#IMAGE_PREFIX#ws/download_rtf_32x24.gif">'''||unistr('\000a')||
'          when INSTR(COMPDO.MIMETYPE,''plain'') > 0 then ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'          when INSTR(COMPDO.MIMETYPE,''image'') > 0 then ''<img src="#IMAGE_PREFIX#ws/chart_32x24.gif"';

s:=s||'>''    '||unistr('\000a')||
'          else'||unistr('\000a')||
'            ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'          end) ICONO'||unistr('\000a')||
'      ,COMPDO.SITUACION'||unistr('\000a')||
'      ,dbms_lob.getlength(COMPDO.DOCUMENTO) DOCUMENTO'||unistr('\000a')||
'      ,COMPDO.FILENAME'||unistr('\000a')||
'      ,COMPDO.MIMETYPE'||unistr('\000a')||
'      ,COMPDO.LAST_UPDATE_DATE'||unistr('\000a')||
'      ,COMPDO.SITUACION_ABR'||unistr('\000a')||
'      ,COMPDO.MOTIVO_SITUACION'||unistr('\000a')||
'      ,COMPDO.DATE_CREATED'||unistr('\000a')||
'      ,COMPDO.CREATED_BY'||unistr('\000a')||
'      ,COMPDO.DATE_MODIFIED'||unistr('\000a')||
' ';

s:=s||'     ,COMPDO.MODIFIED_BY'||unistr('\000a')||
'      ,COMPDO.SEGORG_ID'||unistr('\000a')||
'      ,COMPDO.COMPDT_CODIGO'||unistr('\000a')||
'      ,COMPDO.COMPDT_NOMBRE'||unistr('\000a')||
'      ,COMPDT_DESCRIPCION'||unistr('\000a')||
'      ,COMPDT_DURACION_VALOR'||unistr('\000a')||
'      ,COMPDT_DURACION_TIPO'||unistr('\000a')||
'      ,COMPDT_TIPO_DURACION'||unistr('\000a')||
'      ,(case COMPDO.COMPDT_TIPO_DURACION '||unistr('\000a')||
'          when ''SIN'' then ''INDEFINIDA'''||unistr('\000a')||
'          else '||unistr('\000a')||
'           to_char(COMPDO.FECHA_VENCIMIENTO, ''dd/mm/yyyy'')'||unistr('\000a')||
'        end) COMPDT_DURACION';

s:=s||'_TIPO_T'||unistr('\000a')||
'      ,COMPDT_TIPO'||unistr('\000a')||
'      ,COMPDE_ESTADO'||unistr('\000a')||
'      ,(case COMPDE_ESTADO '||unistr('\000a')||
'          when ''ANU'' then ''ANULADA'''||unistr('\000a')||
'          else ''<a href="#"  onclick="darbaja(''||compdo.ID||'');return false;" alt="Dar de Baja Documento" title="Dar de Baja Documento" ><img  src="#WORKSPACE_IMAGES#delete2.png"></a>'''||unistr('\000a')||
'      end) ANULAR_DOC'||unistr('\000a')||
'     ,COM_PKG.OBTN_COMDOC_ESTADO2(p_segorg_id => COMPDO.SEGORG_ID'||unistr('\000a')||
'               ';

s:=s||'                 ,p_comprv_id => COMPDO.COMPRV_ID'||unistr('\000a')||
'                                ,p_compdt_id => COMPDO.COMPDT_ID'||unistr('\000a')||
'                                ,P_COMPDT_TIPO_DURACION => COMPDO.COMPDT_TIPO_DURACION'||unistr('\000a')||
'                                ,P_COMPDE_ESTADO => COMPDO.COMPDE_ESTADO) ESTADO'||unistr('\000a')||
'     ,replace(replace(COMPRV_PKG.COMPTT_OBTN_RUBROS(p_comprv_id => compdo.comprv_id, p_compdt_id => compdo.compdt_id,';

s:=s||' p_ver_obligatorio_sn => ''SI''),chr(10),''<br>''),''(OBLIGATORIO)'',''<font color="red">(OBLIGATORIO)</font>'')  RUBRO_DOC'||unistr('\000a')||
' from  COM_PROVEEDORES_DOC_V COMPDO'||unistr('\000a')||
' where  COMPRV_ID = :P251_ID'||unistr('\000a')||
' and COMPDO.COMPDT_TIPO_DURACION = ''SIN'''||unistr('\000a')||
' and COMPDO.SITUACION = ''ACT'''||unistr('\000a')||
' and COMPDO.id = (select max(ID) '||unistr('\000a')||
'                  from COM_PROVEEDORES_DOC_V  '||unistr('\000a')||
'                  where COMPRV_ID = compdo.comprv_id'||unistr('\000a')||
'              ';

s:=s||'    and SITUACION = ''ACT'' '||unistr('\000a')||
'                  and COMPDT_CODIGO = COMPDO.COMPDT_CODIGO)'||unistr('\000a')||
''||unistr('\000a')||
'  and     com_pkg.obtn_comdoc_no_fmt3 ( p_segorg_id => COMPDO.SEGORG_ID'||unistr('\000a')||
'                                     , p_comprv_id => compdo.comprv_id'||unistr('\000a')||
'                                     , p_compdt_id => compdo.COMPDT_id'||unistr('\000a')||
'                                     , P_COMPDT_TIPO => COMPDO.COMPDT_TIPO'||unistr('\000a')||
'                       ';

s:=s||'              , P_COMPDT_TIPO_DURACION => COMPDO.COMPDT_TIPO_DURACION'||unistr('\000a')||
'                                     , P_COMPDE_ESTADO => COMPDO.COMPDE_ESTADO'||unistr('\000a')||
'                                     , P_FECHA_VENCIMIENTO => COMPDO.FECHA_VENCIMIENTO) not in (''NO RELACIONADO'')'||unistr('\000a')||
'UNION ALL  '||unistr('\000a')||
'select COMPDO.ID'||unistr('\000a')||
'      ,COMPDO.COMPRV_ID'||unistr('\000a')||
'      ,COMPDO.FECHA_EMISION'||unistr('\000a')||
'      ,COMPDO.FECHA_VENCIMIENTO'||unistr('\000a')||
'      ,COMPDO.FECHA_PRES';

s:=s||'ENTACION'||unistr('\000a')||
'      ,COMPDO.COMENTARIO'||unistr('\000a')||
'      ,(case '||unistr('\000a')||
'          when INSTR(COMPDO.MIMETYPE,''pdf'') > 0 then ''<img src="#IMAGE_PREFIX#ws/download_pdf_32x24.gif">'''||unistr('\000a')||
'          when INSTR(COMPDO.MIMETYPE,''excel'') > 0 then ''<img src="#IMAGE_PREFIX#ws/download_csv_32x24.gif">'''||unistr('\000a')||
'          when INSTR(COMPDO.MIMETYPE,''oct'') > 0 then ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">'''||unistr('\000a')||
'          when INSTR(COMPDO.MIMETYPE,';

s:=s||'''word'') > 0 then ''<img src="#IMAGE_PREFIX#ws/download_rtf_32x24.gif">'''||unistr('\000a')||
'          when INSTR(COMPDO.MIMETYPE,''plain'') > 0 then ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'          when INSTR(COMPDO.MIMETYPE,''image'') > 0 then ''<img src="#IMAGE_PREFIX#ws/chart_32x24.gif">''    '||unistr('\000a')||
'          else'||unistr('\000a')||
'            ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'          end) ICONO'||unistr('\000a')||
'      ,COMPDO.SITUAC';

s:=s||'ION'||unistr('\000a')||
'      ,dbms_lob.getlength(COMPDO.DOCUMENTO) DOCUMENTO'||unistr('\000a')||
'      ,COMPDO.FILENAME'||unistr('\000a')||
'      ,COMPDO.MIMETYPE'||unistr('\000a')||
'      ,COMPDO.LAST_UPDATE_DATE'||unistr('\000a')||
'      ,COMPDO.SITUACION_ABR'||unistr('\000a')||
'      ,COMPDO.MOTIVO_SITUACION'||unistr('\000a')||
'      ,COMPDO.DATE_CREATED'||unistr('\000a')||
'      ,COMPDO.CREATED_BY'||unistr('\000a')||
'      ,COMPDO.DATE_MODIFIED'||unistr('\000a')||
'      ,COMPDO.MODIFIED_BY'||unistr('\000a')||
'      ,COMPDO.SEGORG_ID'||unistr('\000a')||
'      ,COMPDO.COMPDT_CODIGO'||unistr('\000a')||
'      ,COMPDO.COMPDT_NOMBRE'||unistr('\000a')||
'      ,COMPDO.COMPDT';

s:=s||'_DESCRIPCION'||unistr('\000a')||
'      ,COMPDO.COMPDT_DURACION_VALOR'||unistr('\000a')||
'      ,COMPDO.COMPDT_DURACION_TIPO'||unistr('\000a')||
'      ,COMPDO.COMPDT_TIPO_DURACION'||unistr('\000a')||
'      ,(case COMPDO.COMPDT_TIPO_DURACION '||unistr('\000a')||
'          when ''SIN'' then ''INDEFINIDA'''||unistr('\000a')||
'          else '||unistr('\000a')||
'           to_char(FECHA_VENCIMIENTO, ''dd/mm/yyyy'')'||unistr('\000a')||
'        end) COMPDT_DURACION_TIPO_T'||unistr('\000a')||
'      ,COMPDO.COMPDT_TIPO'||unistr('\000a')||
'      ,COMPDO.COMPDE_ESTADO'||unistr('\000a')||
'      ,(case COMPDO.COMPDE_ESTADO '||unistr('\000a')||
'       ';

s:=s||'   when ''ANU'' then ''ANULADA'''||unistr('\000a')||
'          else ''<a href="#"  onclick="darbaja(''||COMPDO.ID||'');return false;" alt="Dar de Baja Documento" title="Dar de Baja Documento" ><img  src="#WORKSPACE_IMAGES#delete2.png"></a>'''||unistr('\000a')||
'      end) ANULAR_DOC'||unistr('\000a')||
'      ,COM_PKG.OBTN_COMDOC_ESTADO2(p_segorg_id => COMPDO.SEGORG_ID'||unistr('\000a')||
'                                  ,p_comprv_id => COMPDO.COMPRV_ID'||unistr('\000a')||
'                              ';

s:=s||'    ,p_compdt_id => COMPDO.COMPDT_ID'||unistr('\000a')||
'                                  ,P_COMPDT_TIPO_DURACION => COMPDO.COMPDT_TIPO_DURACION'||unistr('\000a')||
'                                  ,P_COMPDE_ESTADO => COMPDO.COMPDE_ESTADO) ESTADO'||unistr('\000a')||
'          ,replace(replace(COMPRV_PKG.COMPTT_OBTN_RUBROS(p_comprv_id => compdo.comprv_id, p_compdt_id => compdo.compdt_id, p_ver_obligatorio_sn => ''SI''),chr(10),''<br>''),''(OBLIGATORIO)'',''<font';

s:=s||' color="red">(OBLIGATORIO)</font>'')  RUBRO_DOC'||unistr('\000a')||
' from  COM_PROVEEDORES_DOC_V COMPDO'||unistr('\000a')||
' where   compdo.comprv_id = :P251_ID'||unistr('\000a')||
' --and COMPDO.id = COM_PKG.OBTN_COMPDO_PDTPRV(to_number(:P251_ID),COMPDO.COMPDT_ID)'||unistr('\000a')||
'  and compdo.id in com_pkg.obtn_compdo_pdtprv2(compdo.comprv_id,compdo.compdt_id,compdo.compde_id)'||unistr('\000a')||
' and COMPDO.compdt_tipo_duracion <> ''SIN'''||unistr('\000a')||
' and SITUACION <> ''BAJ'''||unistr('\000a')||
' and com_pkg.obtn_comdoc_no_fmt';

s:=s||'3 ( p_segorg_id => COMPDO.SEGORG_ID'||unistr('\000a')||
'                                  , p_comprv_id => compdo.comprv_id'||unistr('\000a')||
'                                  , p_compdt_id => compdo.COMPDT_id                                  '||unistr('\000a')||
'                                  , P_COMPDT_TIPO => COMPDO.COMPDT_TIPO'||unistr('\000a')||
'                                  , P_COMPDT_TIPO_DURACION => COMPDO.COMPDT_TIPO_DURACION'||unistr('\000a')||
'                                ';

s:=s||'  , P_COMPDE_ESTADO => COMPDO.COMPDE_ESTADO'||unistr('\000a')||
'                                  , P_FECHA_VENCIMIENTO => COMPDO.FECHA_VENCIMIENTO) not in (''NO RELACIONADO'')';

wwv_flow_api.create_report_region (
  p_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 251,
  p_name=> 'Ultimos Documentos Presentados',
  p_region_name=>'',
  p_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 60,
  p_region_attributes=>'style="width:95%"',
  p_report_attributes=>'style="width:80%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '99999',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se ha encontrado ningún dato',
  p_query_num_rows_type=> 'ROW_RANGES_WITH_LINKS',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_prn_format=> 'PDF',
  p_prn_output_show_link=> 'Y',
  p_prn_output_link_text=> 'Imprimir',
  p_prn_content_disposition=> 'ATTACHMENT',
  p_prn_document_header=> 'APEX',
  p_prn_units=> 'MILLIMETERS',
  p_prn_paper_size=> 'A4',
  p_prn_width_units=> 'PERCENTAGE',
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
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'	 COMPDT_SITUACION_ABR,'||unistr('\000a')||
'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 14810001446811914 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 1,
  p_column_heading=> '',
  p_column_link=>'f?p=&APP_ID.:921:&SESSION.::&DEBUG.:921:P921_ID,P921_EDICION:#ID#,SI',
  p_column_linktext=>'<img src="#IMAGE_PREFIX#e2.gif" alt="Editar">',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_report_column_required_role => 15666331444470826+ wwv_flow_api.g_id_offset,
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '13',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31633825352141675 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 31,
  p_column_heading=> 'Comprv Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 14586107518070635 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_EMISION',
  p_column_display_sequence=> 27,
  p_column_heading=> 'Fecha<br>Emisión',
  p_column_format=> 'DD/MM/YYYY',
  p_column_css_style=>'style="width:10%"',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 14586208583070637 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VENCIMIENTO',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Fecha<br>Vencimiento',
  p_column_format=> 'DD/MM/YYYY',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 14586310421070637 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_PRESENTACION',
  p_column_display_sequence=> 26,
  p_column_heading=> 'Fecha<br>Presentación',
  p_column_format=> 'DD/MM/YYYY',
  p_column_css_style=>'"width:10%;"',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_cattributes=> 'style="width:10%;"',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 14586406359070637 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'COMENTARIO',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Comentario',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '13',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 15293520059832742 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'ICONO',
  p_column_display_sequence=> 8,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '13',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 14586520935070637 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION',
  p_column_display_sequence=> 13,
  p_column_heading=> 'Situación',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 14809809280804685 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Documento',
  p_column_format=> 'DOWNLOAD:COM_PROVEEDORES_DOC:DOCUMENTO:ID::MIMETYPE:FILENAME:LAST_UPDATE_DATE::attachment:Abrir Doc.',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '13',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 14586603831070637 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'FILENAME',
  p_column_display_sequence=> 14,
  p_column_heading=> 'Filename',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 14586710932070637 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'MIMETYPE',
  p_column_display_sequence=> 15,
  p_column_heading=> 'Mimetype',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 14586829956070637 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'LAST_UPDATE_DATE',
  p_column_display_sequence=> 16,
  p_column_heading=> 'Last Update Date',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 14586904637070637 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION_ABR',
  p_column_display_sequence=> 12,
  p_column_heading=> 'Situación !!',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 14587010176070637 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'MOTIVO_SITUACION',
  p_column_display_sequence=> 17,
  p_column_heading=> 'Motivo Situacion',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 14587110447070637 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 15,
  p_form_element_id=> null,
  p_column_alias=> 'DATE_CREATED',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Fecha Presentación',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 14587220900070637 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 16,
  p_form_element_id=> null,
  p_column_alias=> 'CREATED_BY',
  p_column_display_sequence=> 18,
  p_column_heading=> 'Created By',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 14587308167070637 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 17,
  p_form_element_id=> null,
  p_column_alias=> 'DATE_MODIFIED',
  p_column_display_sequence=> 19,
  p_column_heading=> 'Date Modified',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 14587409853070637 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 18,
  p_form_element_id=> null,
  p_column_alias=> 'MODIFIED_BY',
  p_column_display_sequence=> 20,
  p_column_heading=> 'Modified By',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 14587520054070637 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 19,
  p_form_element_id=> null,
  p_column_alias=> 'SEGORG_ID',
  p_column_display_sequence=> 21,
  p_column_heading=> 'Segorg Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 14587615179070637 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 20,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_CODIGO',
  p_column_display_sequence=> 22,
  p_column_heading=> 'Compdt Codigo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 14587728129070637 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 21,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_NOMBRE',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Documento',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '13',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 14587812113070637 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 22,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_DESCRIPCION',
  p_column_display_sequence=> 23,
  p_column_heading=> 'Compdt Descripcion',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 14587901763070637 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 23,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_DURACION_VALOR',
  p_column_display_sequence=> 24,
  p_column_heading=> 'Compdt Duracion Valor',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 14588031650070637 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 24,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_DURACION_TIPO',
  p_column_display_sequence=> 25,
  p_column_heading=> 'Compdt Duracion Tipo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 16421930064527643 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 25,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_TIPO_DURACION',
  p_column_display_sequence=> 30,
  p_column_heading=> 'Compdt Tipo Duracion',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 16418627416460698 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 26,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_DURACION_TIPO_T',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Fecha Vencimiento',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '13',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 14588116251070637 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 27,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_TIPO',
  p_column_display_sequence=> 28,
  p_column_heading=> 'Compdt Tipo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 15774405024306634 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 28,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDE_ESTADO',
  p_column_display_sequence=> 29,
  p_column_heading=> 'Compde Estado !!',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 15256714538975523 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 29,
  p_form_element_id=> null,
  p_column_alias=> 'ANULAR_DOC',
  p_column_display_sequence=> 10,
  p_column_heading=> 'DarBaja',
  p_column_alignment=>'CENTER',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_report_column_required_role => 15666129020470128+ wwv_flow_api.g_id_offset,
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '13',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 41817816883908937 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 30,
  p_form_element_id=> null,
  p_column_alias=> 'ESTADO',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Estado',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 11280227344354775 + wwv_flow_api.g_id_offset,
  p_region_id=> 14575727483442442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 31,
  p_form_element_id=> null,
  p_column_alias=> 'RUBRO_DOC',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Tipo Documento',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select comobd.ID'||unistr('\000a')||
'      ,comobd.COMPRV_ID'||unistr('\000a')||
'      ,comobd.COMODT_NOMBRE  '||unistr('\000a')||
'      ,comobd.FECHA_PRESENTACION'||unistr('\000a')||
'      ,comobd.COMOBJ_CODIGO CODIGO'||unistr('\000a')||
'      ,comobd.COMOBJ_NOMBRE NOMBRE'||unistr('\000a')||
'      ,comobd.COMOBJ_NOMBRE OBJETO'||unistr('\000a')||
'      ,decode(comobd.COMODT_VENCIMIENTO_SN, ''SI'', to_char(comobd.FECHA_VENCIMIENTO,''DD/MM/YYYY''), ''INDEFINIDA'') FECHA_VENCIMIENTO'||unistr('\000a')||
'      ,comobd.OBSERVACION'||unistr('\000a')||
'      ,(case '||unistr('\000a')||
'          when INSTR(';

s:=s||'comobd.MIMETYPE,''pdf'') > 0 then ''<img src="#IMAGE_PREFIX#ws/download_pdf_32x24.gif">'''||unistr('\000a')||
'          when INSTR(comobd.MIMETYPE,''excel'') > 0 then ''<img src="#IMAGE_PREFIX#ws/download_csv_32x24.gif">'''||unistr('\000a')||
'          when INSTR(comobd.MIMETYPE,''oct'') > 0 then ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">'''||unistr('\000a')||
'          when INSTR(comobd.MIMETYPE,''word'') > 0 then ''<img src="#IMAGE_PREFIX#ws/download_rtf_32x24.gif">';

s:=s||''''||unistr('\000a')||
'          when INSTR(comobd.MIMETYPE,''plain'') > 0 then ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'          when INSTR(comobd.MIMETYPE,''image'') > 0 then ''<img src="#IMAGE_PREFIX#ws/chart_32x24.gif">''    '||unistr('\000a')||
'          else'||unistr('\000a')||
'            ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'          end) ICONO'||unistr('\000a')||
'       /* ,COMPRV_PKG.COMOBD_OBTN_ESTADO(p_segorg_id => :P1_SEGORG_ID'||unistr('\000a')||
'                   ';

s:=s||'                  ,p_comprv_id => comobd.COMPRV_ID --:P251_ID'||unistr('\000a')||
'                                     ,p_comodt_id => comobd.COMODT_ID'||unistr('\000a')||
'                                     ,p_comobj_id => comobd.COMOBJ_ID) SITUACION */'||unistr('\000a')||
'      ,''<span style="color:green"><b>VIGENTE</b></span>'' SITUACION'||unistr('\000a')||
'      ,DBMS_LOB.GETLENGTH(comobd.DOCUMENTO) DOCUMENTO'||unistr('\000a')||
'      ,(select comrub.NOMBRE '||unistr('\000a')||
'        from   COM_RUBROS comrub'||unistr('\000a')||
'';

s:=s||'        where  comrub.ID = comobd.COMRUB_ID)||decode(OBLIGATORIO_SN,''SI'','' - <span style="color:red">(OBLIGATORIO)</span>'','' - (OPCIONAL)'') RUBRO'||unistr('\000a')||
'      ,(decode(comobd.SITUACION,''VAL'',''<a href="#" onclick="darBajaDocObjeto(''||comobd.ID||'');return false;" alt="Dar de Baja Documento" title="Dar de Baja de Documento"><img src="#WORKSPACE_IMAGES#delete2.png"></a>'')) ANULAR_DOC'||unistr('\000a')||
'      ,(select comobj.CO';

s:=s||'MOBT_NOMBRE'||unistr('\000a')||
'        from   COM_OBJETOS_V comobj'||unistr('\000a')||
'        where  comobj.ID = comobd.COMOBJ_ID) COMOBT_NOMBRE'||unistr('\000a')||
'from   COM_OBJETOS_DOC_V comobd'||unistr('\000a')||
'      ,COM_OBJETOS comobj'||unistr('\000a')||
'      ,COM_OBJETOS_EST_V comobe'||unistr('\000a')||
'where  comobd.COMPRV_ID = :P251_ID'||unistr('\000a')||
'and    comobd.COMOBJ_ID = comobj.ID'||unistr('\000a')||
'and    comobj.COMOBE_ID = comobe.ID'||unistr('\000a')||
'and    comobe.ESTADO = ''HAB'''||unistr('\000a')||
'and    comobd.ID = COMPRV_PKG.COMOBD_COMPRV_OBTN_ID(p_comodt_id => ';

s:=s||'comobd.COMODT_ID'||unistr('\000a')||
'                                                   ,p_comprv_id => comobd.COMPRV_ID --:P251_ID'||unistr('\000a')||
'                                                   ,p_comobj_id => comobd.COMOBJ_ID)'||unistr('\000a')||
'and   (select comodt.SITUACION from COM_OBJETOS_DOT_V comodt where comodt.ID = comobd.COMODT_ID) = ''VIG'''||unistr('\000a')||
'and    COMPRV_PKG.COMOBD_PRESENTADO_SN(p_segorg_id => :P1_SEGORG_ID'||unistr('\000a')||
'                              ';

s:=s||'        ,p_comprv_id => comobd.COMPRV_ID --:P251_ID'||unistr('\000a')||
'                                      ,p_comodt_id => comobd.COMODT_ID'||unistr('\000a')||
'                                      ,p_comobj_id => comobd.COMOBJ_ID) = ''PRESENTADO'''||unistr('\000a')||
'order by comobd.COMOBJ_CODIGO, comobd.COMODT_NOMBRE                   ';

wwv_flow_api.create_report_region (
  p_id=> 31774524775459354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 251,
  p_name=> 'Documentos por Objeto de &P1_COMETQ_RUB. backup',
  p_region_name=>'',
  p_parent_plug_id=>14575727483442442 + wwv_flow_api.g_id_offset,
  p_template=> 142030053339227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 65,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_required_role => 32355302792351493+ wwv_flow_api.g_id_offset,
  p_display_condition_type=> 'NEVER',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '10',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se encontraron documentos de Objetos de Rubro asociados.',
  p_query_num_rows_type=> 'ROW_RANGES_WITH_LINKS',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'EXISTS'||unistr('\000a')||
''||unistr('\000a')||
'select 1'||unistr('\000a')||
'from   COM_OBJETOS_DOC_V comobd'||unistr('\000a')||
'where comobd.COMPRV_ID = :P251_ID'||unistr('\000a')||
'and   comobd.SITUACION = ''VAL'''||unistr('\000a')||
'and   COMPRV_PKG.COMOBD_PRESENTADO_SN(p_segorg_id => comobd.SEGORG_ID   --:P1_SEGORG_ID'||unistr('\000a')||
'                                     ,p_comprv_id => comobd.COMPRV_ID   --:P251_ID'||unistr('\000a')||
'                                     ,p_comodt_id => comobd.COMODT_ID'||unistr('\000a')||
'                                     ,p_comobj_id => comobd.COMOBJ_ID) = ''PRESENTADO''');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31774818831459390 + wwv_flow_api.g_id_offset,
  p_region_id=> 31774524775459354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 1,
  p_column_heading=> '<br>',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ID.:928:&SESSION.::&DEBUG.:928:P928_ID,P928_COMPRV_ID:#ID#,#COMPRV_ID#',
  p_column_linktext=>'<img src="#IMAGE_PREFIX#e2.gif" alt="">',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31774901918459393 + wwv_flow_api.g_id_offset,
  p_region_id=> 31774524775459354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Id Proveedor',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31776729400459396 + wwv_flow_api.g_id_offset,
  p_region_id=> 31774524775459354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMODT_NOMBRE',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Documento',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32112513760160325 + wwv_flow_api.g_id_offset,
  p_region_id=> 31774524775459354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_PRESENTACION',
  p_column_display_sequence=> 14,
  p_column_heading=> 'Fecha Presentacion',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32701204099172670 + wwv_flow_api.g_id_offset,
  p_region_id=> 31774524775459354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'CODIGO',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Codigo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32795928056832315 + wwv_flow_api.g_id_offset,
  p_region_id=> 31774524775459354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'NOMBRE',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Nombre',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31788309785871648 + wwv_flow_api.g_id_offset,
  p_region_id=> 31774524775459354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'OBJETO',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Tipo Objeto',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31775126229459393 + wwv_flow_api.g_id_offset,
  p_region_id=> 31774524775459354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VENCIMIENTO',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Fecha Vencimiento',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31777206847508331 + wwv_flow_api.g_id_offset,
  p_region_id=> 31774524775459354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'OBSERVACION',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Comentario',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31775427222459393 + wwv_flow_api.g_id_offset,
  p_region_id=> 31774524775459354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'ICONO',
  p_column_display_sequence=> 12,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31775501239459395 + wwv_flow_api.g_id_offset,
  p_region_id=> 31774524775459354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Estado',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31775616612459395 + wwv_flow_api.g_id_offset,
  p_region_id=> 31774524775459354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 13,
  p_column_heading=> 'Documento',
  p_use_as_row_header=> 'N',
  p_column_format=> 'DOWNLOAD:COM_OBJETOS_DOC:DOCUMENTO:ID::MIMETYPE:FILENAME:LAST_UPDATE_DATE::Attachment:Abrir Doc.',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32238602685032854 + wwv_flow_api.g_id_offset,
  p_region_id=> 31774524775459354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'RUBRO',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Rubro',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32356209809469842 + wwv_flow_api.g_id_offset,
  p_region_id=> 31774524775459354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'ANULAR_DOC',
  p_column_display_sequence=> 15,
  p_column_heading=> 'Anular Doc',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32743212929897650 + wwv_flow_api.g_id_offset,
  p_region_id=> 31774524775459354 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 15,
  p_form_element_id=> null,
  p_column_alias=> 'COMOBT_NOMBRE',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Objeto',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select comobd.ID'||unistr('\000a')||
'      ,comobd.COMPRV_ID'||unistr('\000a')||
'      ,comobd.COMODT_NOMBRE  '||unistr('\000a')||
'      ,comobd.FECHA_PRESENTACION'||unistr('\000a')||
'      ,comobd.COMOBJ_CODIGO CODIGO'||unistr('\000a')||
'      ,comobd.COMOBJ_NOMBRE NOMBRE'||unistr('\000a')||
'      ,comobd.COMOBJ_NOMBRE OBJETO'||unistr('\000a')||
'      ,decode(comobd.COMODT_VENCIMIENTO_SN, ''SI'', to_char(comobd.FECHA_VENCIMIENTO,''DD/MM/YYYY''), ''INDEFINIDA'') FECHA_VENCIMIENTO'||unistr('\000a')||
'      ,comobd.OBSERVACION'||unistr('\000a')||
'      ,(case '||unistr('\000a')||
'          when INSTR(';

s:=s||'comobd.MIMETYPE,''pdf'') > 0 then ''<img src="#IMAGE_PREFIX#ws/download_pdf_32x24.gif">'''||unistr('\000a')||
'          when INSTR(comobd.MIMETYPE,''excel'') > 0 then ''<img src="#IMAGE_PREFIX#ws/download_csv_32x24.gif">'''||unistr('\000a')||
'          when INSTR(comobd.MIMETYPE,''oct'') > 0 then ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">'''||unistr('\000a')||
'          when INSTR(comobd.MIMETYPE,''word'') > 0 then ''<img src="#IMAGE_PREFIX#ws/download_rtf_32x24.gif">';

s:=s||''''||unistr('\000a')||
'          when INSTR(comobd.MIMETYPE,''plain'') > 0 then ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'          when INSTR(comobd.MIMETYPE,''image'') > 0 then ''<img src="#IMAGE_PREFIX#ws/chart_32x24.gif">''    '||unistr('\000a')||
'          else'||unistr('\000a')||
'            ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'          end) ICONO'||unistr('\000a')||
'      ,''<span style="color:green"><b>VIGENTE</b></span>'' SITUACION'||unistr('\000a')||
'      ,DBMS_LOB.GETLEN';

s:=s||'GTH(comobd.DOCUMENTO) DOCUMENTO'||unistr('\000a')||
'      ,(select comrub.NOMBRE '||unistr('\000a')||
'        from   COM_RUBROS comrub'||unistr('\000a')||
'        where  comrub.ID = comobd.COMRUB_ID)||decode(OBLIGATORIO_SN,''SI'','' - <span style="color:red">(OBLIGATORIO)</span>'','' - (OPCIONAL)'') RUBRO'||unistr('\000a')||
'      ,(decode(comobd.SITUACION,''VAL'',''<a href="#" onclick="darBajaDocObjeto(''||comobd.ID||'');return false;" alt="Dar de Baja Documento" title="Dar de Baja de ';

s:=s||'Documento"><img src="#WORKSPACE_IMAGES#delete2.png"></a>'')) ANULAR_DOC'||unistr('\000a')||
'      ,(select comobj.COMOBT_NOMBRE'||unistr('\000a')||
'        from   COM_OBJETOS_V comobj'||unistr('\000a')||
'        where  comobj.ID = comobd.COMOBJ_ID) COMOBT_NOMBRE'||unistr('\000a')||
'from   COM_OBJETOS_DOC_V comobd'||unistr('\000a')||
'      ,COM_OBJETOS comobj'||unistr('\000a')||
'--      ,COM_OBJETOS_EST_V comobe'||unistr('\000a')||
'where  comobj.COMPRV_ID = :P251_ID'||unistr('\000a')||
'and    comobd.SEGORG_ID = :P1_SEGORG_ID'||unistr('\000a')||
'and    comobd.COMOBJ_ID = comob';

s:=s||'j.ID'||unistr('\000a')||
'--and    comobj.COMOBE_ID = comobe.ID'||unistr('\000a')||
'and    COMOBD.COMRUB_ID IN (select comprr.comrub_id from COM_PROVEEDORES_RUB comprr where comprr.comprv_id = comobj.COMPRV_ID and SITUACION=''ACT'')'||unistr('\000a')||
'and    comobe_ESTADO = ''HAB'''||unistr('\000a')||
'and   (select comodt.SITUACION from COM_OBJETOS_DOT comodt where comodt.ID = comobd.COMODT_ID) = ''VIG'''||unistr('\000a')||
''||unistr('\000a')||
'and    comobd.ID = COMPRV_PKG.COMOBD_PRESENTADO_SN2(p_segorg_id => comobd.seg';

s:=s||'org_id --:P1_SEGORG_ID'||unistr('\000a')||
'                                        ,p_comodt_id => comobd.COMODT_ID'||unistr('\000a')||
'                                        ,p_comprv_id => comobj.COMPRV_ID --:P251_ID'||unistr('\000a')||
'                                        ,p_comobj_id => comobj.ID)'||unistr('\000a')||
''||unistr('\000a')||
'order by comobd.COMOBJ_CODIGO, comobd.COMODT_NOMBRE                   ';

wwv_flow_api.create_report_region (
  p_id=> 365319803815061142 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 251,
  p_name=> 'Documentos por Objeto de &P1_COMETQ_RUB.',
  p_region_name=>'',
  p_parent_plug_id=>14575727483442442 + wwv_flow_api.g_id_offset,
  p_template=> 142030053339227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 150,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_required_role => 32355302792351493+ wwv_flow_api.g_id_offset,
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '10',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se encontraron documentos de Objetos de Rubro asociados.',
  p_query_num_rows_type=> 'ROW_RANGES_WITH_LINKS',
  p_query_row_count_max=> '300',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'EXISTS'||unistr('\000a')||
''||unistr('\000a')||
'select 1'||unistr('\000a')||
'from   COM_OBJETOS_DOC_V comobd'||unistr('\000a')||
'where comobd.COMPRV_ID = :P251_ID'||unistr('\000a')||
'and   comobd.SITUACION = ''VAL'''||unistr('\000a')||
'and   COMPRV_PKG.COMOBD_PRESENTADO_SN(p_segorg_id => comobd.SEGORG_ID   --:P1_SEGORG_ID'||unistr('\000a')||
'                                     ,p_comprv_id => comobd.COMPRV_ID   --:P251_ID'||unistr('\000a')||
'                                     ,p_comodt_id => comobd.COMODT_ID'||unistr('\000a')||
'                                     ,p_comobj_id => comobd.COMOBJ_ID) = ''PRESENTADO''');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365320027910061179 + wwv_flow_api.g_id_offset,
  p_region_id=> 365319803815061142 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 1,
  p_column_heading=> '<br>',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ID.:928:&SESSION.::&DEBUG.:928:P928_ID,P928_COMPRV_ID:#ID#,#COMPRV_ID#',
  p_column_linktext=>'<img src="#IMAGE_PREFIX#e2.gif" alt="">',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365320126269061185 + wwv_flow_api.g_id_offset,
  p_region_id=> 365319803815061142 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Id Proveedor',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365320225635061185 + wwv_flow_api.g_id_offset,
  p_region_id=> 365319803815061142 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMODT_NOMBRE',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Documento',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365320329544061185 + wwv_flow_api.g_id_offset,
  p_region_id=> 365319803815061142 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_PRESENTACION',
  p_column_display_sequence=> 14,
  p_column_heading=> 'Fecha Presentacion',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365320405348061185 + wwv_flow_api.g_id_offset,
  p_region_id=> 365319803815061142 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'CODIGO',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Codigo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365320517163061185 + wwv_flow_api.g_id_offset,
  p_region_id=> 365319803815061142 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'NOMBRE',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Nombre',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365320624043061185 + wwv_flow_api.g_id_offset,
  p_region_id=> 365319803815061142 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'OBJETO',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Tipo Objeto',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365320728148061185 + wwv_flow_api.g_id_offset,
  p_region_id=> 365319803815061142 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VENCIMIENTO',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Fecha Vencimiento',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365320817432061185 + wwv_flow_api.g_id_offset,
  p_region_id=> 365319803815061142 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'OBSERVACION',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Comentario',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365320919733061187 + wwv_flow_api.g_id_offset,
  p_region_id=> 365319803815061142 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'ICONO',
  p_column_display_sequence=> 12,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365321019315061187 + wwv_flow_api.g_id_offset,
  p_region_id=> 365319803815061142 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Estado',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365321123016061187 + wwv_flow_api.g_id_offset,
  p_region_id=> 365319803815061142 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 13,
  p_column_heading=> 'Documento',
  p_use_as_row_header=> 'N',
  p_column_format=> 'DOWNLOAD:COM_OBJETOS_DOC:DOCUMENTO:ID::MIMETYPE:FILENAME:LAST_UPDATE_DATE::Attachment:Abrir Doc.',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365321201625061187 + wwv_flow_api.g_id_offset,
  p_region_id=> 365319803815061142 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'RUBRO',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Rubro',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365321320649061187 + wwv_flow_api.g_id_offset,
  p_region_id=> 365319803815061142 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'ANULAR_DOC',
  p_column_display_sequence=> 15,
  p_column_heading=> 'Anular Doc',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365321407118061187 + wwv_flow_api.g_id_offset,
  p_region_id=> 365319803815061142 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 15,
  p_form_element_id=> null,
  p_column_alias=> 'COMOBT_NOMBRE',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Objeto',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select distinct compdt.nombre compdt_nombre'||unistr('\000a')||
'     , replace(replace(COMPRV_PKG.COMPTT_OBTN_RUBROS(p_comprv_id => :P251_ID, p_compdt_id => compdt.id, p_ver_obligatorio_sn => ''SI''),chr(10),''<br>''),''(OBLIGATORIO)'',''<font color="red">(OBLIGATORIO)</font>'') compdt_tipo_abr'||unistr('\000a')||
'     , com_pkg.obtn_comdoc_estado2 ( p_segorg_id => COMPDT.SEGORG_ID'||unistr('\000a')||
'                                  , p_comprv_id => :P251_ID'||unistr('\000a')||
'   ';

s:=s||'                               , p_compdt_id => COMPDT.id  '||unistr('\000a')||
'                                  , P_COMPDT_TIPO_DURACION => COMPDT.TIPO_DURACION'||unistr('\000a')||
'                                  , P_COMPDE_ESTADO => COMPDT.COMPDE_ESTADO ) ESTADO'||unistr('\000a')||
'     /*, obtn_comdoc_no_fmt2 ( p_segorg_id => COMPDT.SEGORG_ID'||unistr('\000a')||
'                            , p_comprv_id => :P251_ID'||unistr('\000a')||
'                            , p_compdt_id => COMPDT.id'||unistr('\000a')||
'';

s:=s||'                            , p_compdt_tipo => compdt.tipo'||unistr('\000a')||
'                            , P_COMPDT_TIPO_DURACION => COMPDT.TIPO_DURACION'||unistr('\000a')||
'                            , P_COMPDE_ESTADO => COMPDT.COMPDE_ESTADO'||unistr('\000a')||
'                            --, P_COMPRT_ID => comptt.comprt_id'||unistr('\000a')||
'                            ) SITUACION*/'||unistr('\000a')||
'from com_proveedores_dot_v compdt'||unistr('\000a')||
'    ,com_compdt_comprt_v comptt'||unistr('\000a')||
'where compdt.id = comp';

s:=s||'tt.compdt_id'||unistr('\000a')||
'  and compdt.tipo = ''GEN'''||unistr('\000a')||
'  and compdt.compde_estado = ''HAB'''||unistr('\000a')||
'  and comptt.comprt_id = :P251_COMPRT_ID'||unistr('\000a')||
'  and com_pkg.obtn_comdoc_no_fmt2 ( p_segorg_id => COMPDT.SEGORG_ID'||unistr('\000a')||
'                           , p_comprv_id => :P251_ID'||unistr('\000a')||
'                           , p_compdt_id => COMPDT.id'||unistr('\000a')||
'                           , p_compdt_tipo => compdt.tipo'||unistr('\000a')||
'                           , P_COMPDT_TIPO_DURACION ';

s:=s||'=> COMPDT.TIPO_DURACION'||unistr('\000a')||
'                           , P_COMPDE_ESTADO => COMPDT.COMPDE_ESTADO'||unistr('\000a')||
'                           --, P_COMPRT_ID => comptt.comprt_id'||unistr('\000a')||
'                            ) in (''NO PRESENTADO'',''VENCIDO'')'||unistr('\000a')||
'union all'||unistr('\000a')||
'select distinct compdt.nombre compdt_nombre'||unistr('\000a')||
'     , replace(replace(COMPRV_PKG.COMPTT_OBTN_RUBROS(p_comprv_id => :P251_ID, p_compdt_id => compdt.id, p_ver_obligatorio_sn => ''';

s:=s||'SI''),chr(10),''<br>''),''(OBLIGATORIO)'',''<font color="red">(OBLIGATORIO)</font>'') compdt_tipo_abr'||unistr('\000a')||
'     , com_pkg.obtn_comdoc_estado2 ( p_segorg_id => COMPDT.SEGORG_ID'||unistr('\000a')||
'                                  , p_comprv_id => comprr.comprv_id'||unistr('\000a')||
'                                  , p_compdt_id => COMPDT.id '||unistr('\000a')||
'                                  , P_COMPDT_TIPO_DURACION => COMPDT.TIPO_DURACION'||unistr('\000a')||
'                       ';

s:=s||'           , P_COMPDE_ESTADO => COMPDT.COMPDE_ESTADO  ) ESTADO'||unistr('\000a')||
'     /*,obtn_comdoc_no_fmt2 ( p_segorg_id => COMPDT.SEGORG_ID'||unistr('\000a')||
'                                  , p_comprv_id => comprr.comprv_id'||unistr('\000a')||
'                                  , p_compdt_id => COMPDT.id'||unistr('\000a')||
'                                  , p_compdt_tipo => compdt.tipo'||unistr('\000a')||
'                                  , P_COMPDT_TIPO_DURACION => COMPDT.TIPO_DURACIO';

s:=s||'N'||unistr('\000a')||
'                                  , P_COMPDE_ESTADO => COMPDT.COMPDE_ESTADO) SITUACION*/'||unistr('\000a')||
'from com_proveedores_dot_v compdt'||unistr('\000a')||
'    ,com_compdt_comrub_v comtdr'||unistr('\000a')||
'    ,com_proveedores_rub comprr'||unistr('\000a')||
'where compdt.id = comtdr.compdt_id'||unistr('\000a')||
'  and comtdr.comrub_id = comprr.comrub_id'||unistr('\000a')||
'  and comprr.situacion = ''ACT'''||unistr('\000a')||
'  and compdt.tipo = ''RUB'''||unistr('\000a')||
'  and compdt.compde_estado = ''HAB'''||unistr('\000a')||
'  and comprr.comprv_id = :P251_ID'||unistr('\000a')||
'  and co';

s:=s||'m_pkg.obtn_comdoc_no_fmt2 ( p_segorg_id => COMPDT.SEGORG_ID'||unistr('\000a')||
'                                  , p_comprv_id => comprr.comprv_id'||unistr('\000a')||
'                                  , p_compdt_id => COMPDT.id'||unistr('\000a')||
'                                  , p_compdt_tipo => compdt.tipo'||unistr('\000a')||
'                                  , P_COMPDT_TIPO_DURACION => COMPDT.TIPO_DURACION'||unistr('\000a')||
'                                  , P_COMPDE_ESTADO => COMPDT.C';

s:=s||'OMPDE_ESTADO) in (''NO PRESENTADO'',''VENCIDO'')'||unistr('\000a')||
' --and SITUACION in (''NO PRESENTADO'',''VENCIDO'')';

wwv_flow_api.create_report_region (
  p_id=> 14725616277486725 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 251,
  p_name=> 'Documentos Vencidos / No Presentados',
  p_region_name=>'',
  p_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 70,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '500',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '1:2',
  p_query_no_data_found=> 'No se han encontrado documentos vencidos o no presentados',
  p_query_num_rows_type=> 'ROW_RANGES_WITH_LINKS',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'++++++++++++++'||unistr('\000a')||
'COMPDT.SEGORG_ID'||unistr('\000a')||
'      ,COMPDT.CODIGO'||unistr('\000a')||
'      ,COMPDT.NOMBRE'||unistr('\000a')||
'      ,COMPDT.DESCRIPCION'||unistr('\000a')||
'      ,COMPDT.TIPO'||unistr('\000a')||
'      ,COMPDT.TIPO_ABR'||unistr('\000a')||
'      ,COMPDT.SITUACION'||unistr('\000a')||
'      ,COMPDT.SITUACION_ABR'||unistr('\000a')||
'      ,COMPDT.ID'||unistr('\000a')||
'      ,COMTDR.COMRUB_NOMBRE RUB_NOMBRE'||unistr('\000a')||
'      ,case tipo'||unistr('\000a')||
'       when ''GEN'' then (select comptp.OBLIGATORIO_SN '||unistr('\000a')||
'                        from com_compdt_comprt comptp'||unistr('\000a')||
'                        where comptp.compdt_id = COMPDT.id '||unistr('\000a')||
'                        and comptp.comprt_id = (select prvtpr.comprt_id '||unistr('\000a')||
'                                         from com_proveedores prvtpr'||unistr('\000a')||
'                                         where prvtpr.id = :P251_ID)) '||unistr('\000a')||
'       when ''RUB'' then (select compdr.OBLIGATORIO_SN '||unistr('\000a')||
'                        from com_compdt_comrub compdr'||unistr('\000a')||
'                        where compdr.compdt_id = COMPDT.id'||unistr('\000a')||
'                        and compdr.comrub_id in (select prvrub.comrub_id '||unistr('\000a')||
'                                          from com_proveedores_rub prvrub'||unistr('\000a')||
'                                          where prvrub.comprv_id=:P251_ID)) '||unistr('\000a')||
'       end case'||unistr('\000a')||
'      ,com_pkg.obtn_comdoc_estado ( p_segorg_id => COMPDT.SEGORG_ID'||unistr('\000a')||
'                                  , p_comprv_id => :P251_ID'||unistr('\000a')||
'                                  , p_compdt_id => COMPDT.id  ) ESTADO'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'--            CASE'||unistr('\000a')||
''||unistr('\000a')||
'--            WHEN FECHA_VENCIMIENTO > sysdate THEN ''<font color="green"><b>VIGENTE</b></font>'''||unistr('\000a')||
'--            ELSE ''<font color="red"><b>VENCIDO</b></font>'''||unistr('\000a')||
'--            END CASE '||unistr('\000a')||
'------------------------------------------------------------------------------'||unistr('\000a')||
'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 14729531914575251 + wwv_flow_api.g_id_offset,
  p_region_id=> 14725616277486725 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_NOMBRE',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Documento',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 16972527516812764 + wwv_flow_api.g_id_offset,
  p_region_id=> 14725616277486725 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_TIPO_ABR',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Tipo Documento',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 14758500824191868 + wwv_flow_api.g_id_offset,
  p_region_id=> 14725616277486725 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'ESTADO',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Estado',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select distinct comode.ID'||unistr('\000a')||
'       ,comode.COMOBJ_ID'||unistr('\000a')||
'       ,comode.COMOBJ_COMPRV_ID '||unistr('\000a')||
'       ,comode.SEGORG_ID '||unistr('\000a')||
'       ,comode.NOMBRE DOCUMENTO'||unistr('\000a')||
'       ,comode.comobt_nombre objeto'||unistr('\000a')||
'       ,comode.COMOBJ_CODIGO '||unistr('\000a')||
'       ,comode.COMOBJ_NOMBRE'||unistr('\000a')||
'       ,(select comrub.NOMBRE'||unistr('\000a')||
'        from   COM_RUBROS comrub'||unistr('\000a')||
'        where  comrub.ID = comode.COMOBJ_COMRUB_ID)||decode(comode.COMOTT_OBLIGATORIO_SN,''SI'','' - <s';

s:=s||'pan style="color:red">(OBLIGATORIO)</span>'''||unistr('\000a')||
'                                                                                             ,'' - (OPCIONAL)'') RUBRO'||unistr('\000a')||
'       ,ESTADO'||unistr('\000a')||
'from   COM_OBJETOS_DOC_ESTADO_V2 comode'||unistr('\000a')||
'where  comode.COMOBJ_COMPRV_ID = :P251_ID'||unistr('\000a')||
'and    comode.SEGORG_ID = :P1_SEGORG_ID'||unistr('\000a')||
'and    comode.ESTADO <> ''PRESENTADO'''||unistr('\000a')||
'and    COMODE.COMOBJ_COMRUB_ID IN (select comprr.comrub_id from C';

s:=s||'OM_PROVEEDORES_RUB comprr where comprr.comprv_id = comode.COMOBJ_COMPRV_ID and SITUACION=''ACT'')'||unistr('\000a')||
'--and    comode.COMOTT_OBLIGATORIO_SN = ''NO'''||unistr('\000a')||
'order by comode.COMOBJ_CODIGO, comode.NOMBRE';

wwv_flow_api.create_report_region (
  p_id=> 31940206473939846 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 251,
  p_name=> 'Documentos por Objeto de &P1_COMETQ_RUB. +',
  p_region_name=>'',
  p_parent_plug_id=>14725616277486725 + wwv_flow_api.g_id_offset,
  p_template=> 142030053339227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 75,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_required_role => 32355302792351493+ wwv_flow_api.g_id_offset,
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '500',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se han encontrado Documentos de Objetos vencidos o no presentados',
  p_query_num_rows_type=> 'ROW_RANGES_WITH_LINKS',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'EXISTS'||unistr('\000a')||
''||unistr('\000a')||
'select 1'||unistr('\000a')||
'from   COM_OBJETOS comobj'||unistr('\000a')||
'      ,COM_OBJETOS_EST comobe'||unistr('\000a')||
'where  comobj.COMPRV_ID = :P251_ID'||unistr('\000a')||
'and    comobj.COMOBE_ID = comobe.ID'||unistr('\000a')||
'and    comobe.ESTADO = ''HAB'';');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32236415750822845 + wwv_flow_api.g_id_offset,
  p_region_id=> 31940206473939846 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32243225267630117 + wwv_flow_api.g_id_offset,
  p_region_id=> 31940206473939846 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMOBJ_ID',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Comobj Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32243301291630121 + wwv_flow_api.g_id_offset,
  p_region_id=> 31940206473939846 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMOBJ_COMPRV_ID',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Comprv Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32236605599822845 + wwv_flow_api.g_id_offset,
  p_region_id=> 31940206473939846 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'SEGORG_ID',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Segorg Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32236722692822845 + wwv_flow_api.g_id_offset,
  p_region_id=> 31940206473939846 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Documento',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32796309497856071 + wwv_flow_api.g_id_offset,
  p_region_id=> 31940206473939846 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'OBJETO',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Objeto',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32243430165630121 + wwv_flow_api.g_id_offset,
  p_region_id=> 31940206473939846 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'COMOBJ_CODIGO',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Código',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32243508241630121 + wwv_flow_api.g_id_offset,
  p_region_id=> 31940206473939846 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'COMOBJ_NOMBRE',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Nombre',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31941019014939870 + wwv_flow_api.g_id_offset,
  p_region_id=> 31940206473939846 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'RUBRO',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Rubro',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31941102513939870 + wwv_flow_api.g_id_offset,
  p_region_id=> 31940206473939846 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'ESTADO',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Estado',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 15861909095319655 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 251,
  p_plug_name=> 'Trámites Habilitados',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142030956068227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 80,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 15863723734380646 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 142037578156227112+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => '(:P251_COMPRE_ESTADO IN (''HAB'',''PEN'') and (:P1_SEGUSU_TIPO = ''PRV'') ) or'||unistr('\000a')||
'((:P1_SEGUSU_TIPO <> ''PRV'') ) or (v (''APP_USER'') = ''PCYCSL.PRVCOM.27249451423.CUIT.27249451423'')',
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
  p_id=> 16150713044997657 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 251,
  p_plug_name=> 'Operaciones Habilitadas',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142030956068227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 70,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 16151102440004018 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 142037578156227112+ wwv_flow_api.g_id_offset,
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
s:=s||'select comppf.ID'||unistr('\000a')||
'      ,comppf.COMPRV_ID'||unistr('\000a')||
'      ,(select compcf.NOMBRE '||unistr('\000a')||
'        from   COM_PROVEEDORES_CLF compcf '||unistr('\000a')||
'        where  compcf.ID = comppf.COMPCF_ID) CLASIFICADOR'||unistr('\000a')||
'      ,comppf.COMPCF_ID'||unistr('\000a')||
'      ,comppf.FECHA_VIGENCIA'||unistr('\000a')||
'      ,comppf.FECHA_VALIDEZ'||unistr('\000a')||
'      ,comppf.SITUACION_ABR'||unistr('\000a')||
'from COM_COMPRV_COMPCF_V comppf'||unistr('\000a')||
'where comppf.COMPRV_ID = :P251_ID'||unistr('\000a')||
'and   ((comppf.SITUACION = ''VIG'' AND NVL(:P251_FILTRO';

s:=s||'_CLASIFICADORES,''VIG'') = ''VIG'') '||unistr('\000a')||
'   or (comppf.SITUACION = ''BAJ'' AND :P251_FILTRO_CLASIFICADORES = ''HIS'')'||unistr('\000a')||
'   or (:P251_FILTRO_CLASIFICADORES = ''VIGHIS''))'||unistr('\000a')||
'order by FECHA_VIGENCIA DESC';

wwv_flow_api.create_report_region (
  p_id=> 29244311309040309 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 251,
  p_name=> 'Clasificadores Asociados',
  p_region_name=>'',
  p_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 20,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_required_role => 27176030172856954+ wwv_flow_api.g_id_offset,
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se han encontrado Clasificadores asociados',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '999',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 29244619412040329 + wwv_flow_api.g_id_offset,
  p_region_id=> 29244311309040309 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 1,
  p_column_heading=> 'ID',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 29244731593040332 + wwv_flow_api.g_id_offset,
  p_region_id=> 29244311309040309 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 2,
  p_column_heading=> 'COMPRV_ID',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 29244828148040332 + wwv_flow_api.g_id_offset,
  p_region_id=> 29244311309040309 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'CLASIFICADOR',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Clasificador',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 29244909742040332 + wwv_flow_api.g_id_offset,
  p_region_id=> 29244311309040309 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COMPCF_ID',
  p_column_display_sequence=> 4,
  p_column_heading=> 'COMPCF_ID',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 29245032711040332 + wwv_flow_api.g_id_offset,
  p_region_id=> 29244311309040309 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VIGENCIA',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Fecha Vigencia',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 29245131549040332 + wwv_flow_api.g_id_offset,
  p_region_id=> 29244311309040309 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VALIDEZ',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Fecha Validez',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 29245204361040332 + wwv_flow_api.g_id_offset,
  p_region_id=> 29244311309040309 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION_ABR',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Situación',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT COMOCM.ID COMOCM_ID'||unistr('\000a')||
'     , COMOCM.CODIGO'||unistr('\000a')||
'     , ''<a href="''||apex_util.prepare_url(''f?p=ADMCOM:OCMDET:&SESSION.::NO:891:P891_ID,P891_APP_ANTERIOR,P891_PAG_ANTERIOR:''||to_char(COMOCM.ID)||'',&APP_ID.,&APP_PAGE_ID.'',''utf-8'',''2'')||''" title="Detalle Orden">''||DECODE(COMOCM.CODIGO,'''','''',''ORDEN: ''||COMOCM.CODIGO||''/''||TO_CHAR(COMOCM.COMPED_EJERCICIO)) COMOCM_CODIGO_DESC'||unistr('\000a')||
'     , COMOCM.COMPED_ID'||unistr('\000a')||
'   ';

s:=s||'  , COMOCM.COMECO_ID'||unistr('\000a')||
'     , COMPED_CODIGO||''/''||COMPED_EJERCICIO COMPED_CODIGO	 '||unistr('\000a')||
'     , COMOCM.COMPED_EJERCICIO'||unistr('\000a')||
'     , ''<a href="''||apex_util.prepare_url(''f?p=ADMCOM:PEDDET:&SESSION.::NO:301:P301_ID,P301_APP_ANTERIOR,P301_PAG_ANTERIOR:''||to_char(COMOCM.COMPED_ID)||'',&APP_ID.,&APP_PAGE_ID.'',''utf-8'',''2'')||''" title="Detalle Solicitud">SOL: ''||COMOCM.COMPED_CODIGO||''/''||TO_CHAR(COMOCM.COMPED_EJERCICIO';

s:=s||') COMPED_CODIGO_ESTADO'||unistr('\000a')||
'     , COMOCM.COMPED_FECHA_SOLICITUD COMPED_FECHA_SOLICITUD'||unistr('\000a')||
'     , COMOCM.COMPED_DESCRIPCION COMPED_DESCRIPCION'||unistr('\000a')||
'     , COMOCM.COMPED_CONTRATANTE COMPED_CONTRATANTE'||unistr('\000a')||
'     , COMOCM.COMPED_EXPEDIENTE COMPED_EXPEDIENTE'||unistr('\000a')||
'     , COMOCM.COMPEE_ESTADO_DESC COMPEE_ESTADO_DESC'||unistr('\000a')||
'     , COMOCM.COMPEE_FECHA COMPEE_FECHA'||unistr('\000a')||
'     , COMOCM.COMCTT_ID COMCTT_ID'||unistr('\000a')||
'     , COMOCM.COMCTT_CODIGO COMCTT_CO';

s:=s||'DIGO'||unistr('\000a')||
'     , COMOCM.COMCTT_NOMBRE COMCTT_NOMBRE'||unistr('\000a')||
'     , COMOCM.COMCON_CODIGO COMCON_CODIGO'||unistr('\000a')||
'     , COMOCM.COMCON_ID COMCON_ID'||unistr('\000a')||
'     ,''<a href="''||apex_util.prepare_url(''f?p=ADMCOM:CONDET:&SESSION.::NO:811:P811_ID,P811_COMPED_ID,P811_APP_ANTERIOR,P811_PAG_ANTERIOR:''||to_char(COMOCM.COMCON_ID)||'',''||to_char(COMOCM.COMPED_ID) ||'',&APP_ID.,&APP_PAGE_ID.'',''utf-8'',''2'')||''" title="Detalle Proceso">''||DECODE(';

s:=s||'LTRIM(RTRIM(COMOCM.COMCTT_CODIGO||'': ''||COMOCM.COMCON_CODIGO)),'':'','''',LTRIM(RTRIM(COMOCM.COMCTT_CODIGO||'': ''||COMOCM.COMCON_CODIGO||''/''||TO_CHAR(COMOCM.COMPED_EJERCICIO)))) COMCON_CODIGO_DESC'||unistr('\000a')||
'     , COMOCM.COMCON_OBJETO CONCON_OBJETO'||unistr('\000a')||
'     , COMOCM.COMCON_MONTO_PRESUPUESTO CONCON_MONTO_PRESUPUESTO'||unistr('\000a')||
'     , COMOCM.COMCOE_ID COMCOE_ID'||unistr('\000a')||
'     , COMOCM.COMCOE_ESTADO_DESC COMCOE_ESTADO_DESC'||unistr('\000a')||
'     , COMOCM.CO';

s:=s||'MCOE_FECHA COMCOE_FECHA'||unistr('\000a')||
'     , COMOCM.COMOCE_ESTADO COMOCE_ESTADO'||unistr('\000a')||
'     , COMOCM.COMOCE_ESTADO_DESC COMOCE_ESTADO_DESC'||unistr('\000a')||
'     , COMOCM.COMOCE_FECHA COMOCE_FECHA'||unistr('\000a')||
'     , COMOCM.FECHA_GENERACION COMOCM_FECHA_GENERACION'||unistr('\000a')||
'     , COM_PKG.OBTN_COMOCM_TOTAL(COMOCM.ID) COMOCM_TOTAL'||unistr('\000a')||
'     , COMOCM.COMPRV_ID'||unistr('\000a')||
'     , COMOCM.COMPRV_NOMBRE||'' CUIT:''||COMOCM.COMPRV_CUIT COMPRV_NOMBRE'||unistr('\000a')||
'     ,''<a href="''||apex_util.prepa';

s:=s||'re_url(''f?p=ADMCOM:PEDDET:&SESSION.::NO:301:P301_ID,P301_APP_ANTERIOR,P301_PAG_ANTERIOR:''||to_char(COMOCM.COMPED_ID)||'',&APP_ID.,&APP_PAGE_ID.'',''utf-8'',''2'')||''"><font color="blue">Solicitud<font>'' ACCION_VERSOLICITUD'||unistr('\000a')||
'     ,(case when COMOCM.COMCOE_ESTADO NOT IN (''NUE'',''PEN'',''PRE'',''ACT'')then ''<a href="''||apex_util.prepare_url(''f?p=ADMCOM:CONDET:&SESSION.::NO:811:P811_ID,P811_COMPED_ID,P811_APP_ANTE';

s:=s||'RIOR,P811_PAG_ANTERIOR:''||to_char(COMOCM.COMCON_ID)||'',''||to_char(COMOCM.COMPED_ID) ||'',&APP_ID.,&APP_PAGE_ID.'',''utf-8'',''2'')||''"><font color="blue">Proceso<font>'' else '''' end) ACCION_VERPROCESO   '||unistr('\000a')||
'     ,(case when COMOCM.COMOCE_ESTADO IN (''APR'',''CON'',''NOC'')then ''<a href="''||apex_util.prepare_url(''f?p=ADMCOM:OCMDET:&SESSION.::NO:891:P891_ID,P891_APP_ANTERIOR,P891_PAG_ANTERIOR:''||to_char(COMOCM.ID)|';

s:=s||'|'',&APP_ID.,&APP_PAGE_ID.'',''utf-8'',''2'')||''"><font color="blue">''||DECODE(COMOCM.COMOCE_ESTADO,''APR'',''<font color="red">Ver/Calificar Orden'',''Ver Orden'')||''<font>'' else '''' end) ACCION_VERORDEN  '||unistr('\000a')||
'     ,''<a href="''||apex_util.prepare_url(''f?p=ADMCOM:PEDDET:&SESSION.::NO:301:P301_ID,P301_APP_ANTERIOR,P301_PAG_ANTERIOR:''||to_char(COMOCM.COMPED_ID)||'',&APP_ID.,&APP_PAGE_ID.'',''utf-8'',''2'')||''">Ver Solicit';

s:=s||'ud<br>''||'||unistr('\000a')||
'     (case when COMOCM.COMCOE_ESTADO NOT IN (''NUE'',''PEN'',''PRE'',''ACT'')then ''<a href="''||apex_util.prepare_url(''f?p=ADMCOM:CONDET:&SESSION.::NO:811:P811_ID,P811_COMPED_ID,P811_APP_ANTERIOR,P811_PAG_ANTERIOR:''||to_char(COMOCM.COMCON_ID)||'',''||to_char(COMOCM.COMPED_ID) ||'',&APP_ID.,&APP_PAGE_ID.'',''utf-8'',''2'')||''">Ver Proceso'' else '''' end)||''<br>''||   '||unistr('\000a')||
'     (case when COMOCM.COMOCE_ESTADO IN ';

s:=s||'(''APR'',''CON'',''NOC'')then ''<a href="''||apex_util.prepare_url(''f?p=ADMCOM:OCMDET:&SESSION.::NO:891:P891_ID,P891_APP_ANTERIOR,P891_PAG_ANTERIOR:''||to_char(COMOCM.ID)||'',&APP_ID.,&APP_PAGE_ID.'',''utf-8'',''2'')||''">''||DECODE(COMOCM.COMOCE_ESTADO,''APR'',''Ver Orden'',''Ver Orden'')||'''' else '''' end) ACCIONES'||unistr('\000a')||
',REPLACE(nvl(COM_PKG.OBTN_COMCLF_CLFMOT(COMOCM.ID),''No Calificada''),''WORKSPACE_IMAGES.'',''#WORKSPACE_IMAGES';

s:=s||'#'') CALIFICACION'||unistr('\000a')||
',REPLACE(COM_PKG.OBTN_COMREP_ESTADO(COMOCM.ID),''WORKSPACE_IMAGES.'',''#WORKSPACE_IMAGES#'') REPLICA'||unistr('\000a')||
'FROM COM_ORDENES_COMPRAS_V COMOCM'||unistr('\000a')||
'WHERE COMOCM.COMOCE_ESTADO IN (''APR'',''CON'',''NOC'')'||unistr('\000a')||
'  AND COMOCM.COMPRV_ID = :P251_ID'||unistr('\000a')||
'ORDER BY COMOCM_FECHA_GENERACION DESC';

wwv_flow_api.create_report_region (
  p_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 251,
  p_name=> '&P1_COMETQ_OCM. Adjudicadas al &P1_COMETQ_PRVS.',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 100,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_required_role => 30734829938083629+ wwv_flow_api.g_id_offset,
  p_display_when_condition=> 'select 1'||unistr('\000a')||
'FROM COM_ORDENES_COMPRAS_V COMOCM'||unistr('\000a')||
'WHERE COMOCM.COMOCE_ESTADO IN (''APR'',''CON'',''NOC'')'||unistr('\000a')||
'  AND COMOCM.COMPRV_ID = :P251_ID'||unistr('\000a')||
'  AND ROWNUM <=1',
  p_display_condition_type=> 'EXISTS',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '20',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se ha encontrado ningún dato',
  p_query_num_rows_item=> '20',
  p_query_num_rows_type=> 'ROW_RANGES_WITH_LINKS',
  p_query_row_count_max=> '9999999',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_sort_null=> 'F',
  p_query_asc_image=> 'arrow_down_gray_dark.gif',
  p_query_asc_image_attr=> 'width="13" height="12" alt=""',
  p_query_desc_image=> 'arrow_up_gray_dark.gif',
  p_query_desc_image_attr=> 'width="13" height="12" alt=""',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30595322642037399 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMOCM_ID',
  p_column_display_sequence=> 36,
  p_column_heading=> 'Comocm Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30595408132037399 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'CODIGO',
  p_column_display_sequence=> 34,
  p_column_heading=> 'Codigo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30595502186037399 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMOCM_CODIGO_DESC',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Orden',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30595625195037399 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_ID',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Comped Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30595724602037399 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMECO_ID',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Comeco Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30595824753037399 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_CODIGO',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Comped Codigo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30595913789037399 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_EJERCICIO',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Comped Ejercicio',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30596032103037399 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_CODIGO_ESTADO',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Solicitud',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30596116086037399 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_FECHA_SOLICITUD',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Comped Fecha Solicitud',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30596209379037399 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_DESCRIPCION',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Comped Descripcion',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30596327723037399 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_CONTRATANTE',
  p_column_display_sequence=> 12,
  p_column_heading=> '&P1_COMETQ_CONS.',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30596400686037399 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_EXPEDIENTE',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Expediente',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30596519570037399 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'COMPEE_ESTADO_DESC',
  p_column_display_sequence=> 13,
  p_column_heading=> 'Compee Estado Desc',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30596632440037399 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'COMPEE_FECHA',
  p_column_display_sequence=> 14,
  p_column_heading=> 'Compee Fecha',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30596709058037399 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 15,
  p_form_element_id=> null,
  p_column_alias=> 'COMCTT_ID',
  p_column_display_sequence=> 15,
  p_column_heading=> 'Comctt Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30596825060037399 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 16,
  p_form_element_id=> null,
  p_column_alias=> 'COMCTT_CODIGO',
  p_column_display_sequence=> 16,
  p_column_heading=> 'Comctt Codigo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30596927931037399 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 17,
  p_form_element_id=> null,
  p_column_alias=> 'COMCTT_NOMBRE',
  p_column_display_sequence=> 17,
  p_column_heading=> 'Tipo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30597005958037401 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 18,
  p_form_element_id=> null,
  p_column_alias=> 'COMCON_CODIGO',
  p_column_display_sequence=> 18,
  p_column_heading=> 'Comcon Codigo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30597123250037401 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 19,
  p_form_element_id=> null,
  p_column_alias=> 'COMCON_ID',
  p_column_display_sequence=> 19,
  p_column_heading=> 'Comcon Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30597205093037401 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 20,
  p_form_element_id=> null,
  p_column_alias=> 'COMCON_CODIGO_DESC',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Proceso',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30597329880037401 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 21,
  p_form_element_id=> null,
  p_column_alias=> 'CONCON_OBJETO',
  p_column_display_sequence=> 20,
  p_column_heading=> 'Concon Objeto',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30597417895037401 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 22,
  p_form_element_id=> null,
  p_column_alias=> 'CONCON_MONTO_PRESUPUESTO',
  p_column_display_sequence=> 21,
  p_column_heading=> 'Concon Monto Presupuesto',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30597509968037401 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 23,
  p_form_element_id=> null,
  p_column_alias=> 'COMCOE_ID',
  p_column_display_sequence=> 22,
  p_column_heading=> 'Comcoe Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30597630828037401 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 24,
  p_form_element_id=> null,
  p_column_alias=> 'COMCOE_ESTADO_DESC',
  p_column_display_sequence=> 23,
  p_column_heading=> 'Comcoe Estado Desc',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30597729573037401 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 25,
  p_form_element_id=> null,
  p_column_alias=> 'COMCOE_FECHA',
  p_column_display_sequence=> 24,
  p_column_heading=> 'Comcoe Fecha',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30597830149037401 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 26,
  p_form_element_id=> null,
  p_column_alias=> 'COMOCE_ESTADO',
  p_column_display_sequence=> 25,
  p_column_heading=> 'Comoce Estado',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30597907276037401 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 27,
  p_form_element_id=> null,
  p_column_alias=> 'COMOCE_ESTADO_DESC',
  p_column_display_sequence=> 26,
  p_column_heading=> 'Comoce Estado Desc',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30598027653037401 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 28,
  p_form_element_id=> null,
  p_column_alias=> 'COMOCE_FECHA',
  p_column_display_sequence=> 27,
  p_column_heading=> 'Comoce Fecha',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30598110230037401 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 29,
  p_form_element_id=> null,
  p_column_alias=> 'COMOCM_FECHA_GENERACION',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Fecha',
  p_column_format=> 'DD/MM/YYYY',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30598216423037401 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 30,
  p_form_element_id=> null,
  p_column_alias=> 'COMOCM_TOTAL',
  p_column_display_sequence=> 29,
  p_column_heading=> 'Importe',
  p_column_format=> 'FML999G999G999G999G990D00',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30598330543037401 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 31,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 30,
  p_column_heading=> 'Comprv Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30598408758037401 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 32,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_NOMBRE',
  p_column_display_sequence=> 28,
  p_column_heading=> 'Proveedor',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30598504555037401 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 33,
  p_form_element_id=> null,
  p_column_alias=> 'ACCION_VERSOLICITUD',
  p_column_display_sequence=> 31,
  p_column_heading=> '<br>',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30598626940037401 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 34,
  p_form_element_id=> null,
  p_column_alias=> 'ACCION_VERPROCESO',
  p_column_display_sequence=> 32,
  p_column_heading=> '<br>',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 30598706456037401 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 35,
  p_form_element_id=> null,
  p_column_alias=> 'ACCION_VERORDEN',
  p_column_display_sequence=> 33,
  p_column_heading=> '<br>',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 3250920857910154 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 36,
  p_form_element_id=> null,
  p_column_alias=> 'ACCIONES',
  p_column_display_sequence=> 35,
  p_column_heading=> 'Acciones',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 13153313362276646 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 37,
  p_form_element_id=> null,
  p_column_alias=> 'CALIFICACION',
  p_column_display_sequence=> 37,
  p_column_heading=> 'Calificación',
  p_column_alignment=>'CENTER',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 13392612744267964 + wwv_flow_api.g_id_offset,
  p_region_id=> 30595123009037397 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 38,
  p_form_element_id=> null,
  p_column_alias=> 'REPLICA',
  p_column_display_sequence=> 38,
  p_column_heading=> 'Replica',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 30673923382267315 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 251,
  p_plug_name=> 'Documentación',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 142030956068227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 110,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 30673420082267295 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 142037578156227112+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_required_role => 31632225231921093+ wwv_flow_api.g_id_offset,
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
s:=s||'select comcer.ID'||unistr('\000a')||
'      ,comcer.CODIGO'||unistr('\000a')||
'      ,(select comcrt.NOMBRE'||unistr('\000a')||
'        from COM_CERTIFICADOS_TIPOS_V comcrt'||unistr('\000a')||
'        where  comcrt.ID = comcer.COMCRT_ID) CERTIFICADO_TIPO'||unistr('\000a')||
'      ,comcer.FECHA_EMISION'||unistr('\000a')||
'      ,comcer.FECHA_VENCIMIENTO'||unistr('\000a')||
'      ,GRAL_PKG.OBTN_CFGABR(''COM_CERTIFICADOS.ESTADO'',comcer.ESTADO) ESTADO'||unistr('\000a')||
'from   COM_CERTIFICADOS_V  comcer'||unistr('\000a')||
'where  comcer.COMPRV_ID = :P251_ID'||unistr('\000a')||
'order by comcer.CODIG';

s:=s||'O desc';

wwv_flow_api.create_report_region (
  p_id=> 31087508892366484 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 251,
  p_name=> 'Certificados del Proveedor',
  p_region_name=>'',
  p_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 130,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_required_role => 45107006520568231+ wwv_flow_api.g_id_offset,
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '10',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se encontraron Certificados asociados a este Proveedor.',
  p_query_num_rows_type=> 'ROW_RANGES_WITH_LINKS',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31136226567046645 + wwv_flow_api.g_id_offset,
  p_region_id=> 31087508892366484 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 1,
  p_column_heading=> '<br>',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ID.:266:&SESSION.::&DEBUG.:266:P266_COMPRV_ID,P266_COMCER_ID,P266_PAG_ANTERIOR:&P251_ID.,#ID#,&APP_PAGE_ID.',
  p_column_linktext=>'<img src="#IMAGE_PREFIX#e2.gif" alt="">',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31087802750366525 + wwv_flow_api.g_id_offset,
  p_region_id=> 31087508892366484 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'CODIGO',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Código',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31429916527989281 + wwv_flow_api.g_id_offset,
  p_region_id=> 31087508892366484 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'CERTIFICADO_TIPO',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Tipo de Certificado',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31087923567366529 + wwv_flow_api.g_id_offset,
  p_region_id=> 31087508892366484 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_EMISION',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Fecha de Emisión',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31088009931366529 + wwv_flow_api.g_id_offset,
  p_region_id=> 31087508892366484 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VENCIMIENTO',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Fecha de Vencimiento',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31088101260366529 + wwv_flow_api.g_id_offset,
  p_region_id=> 31087508892366484 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'ESTADO',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Estado',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select ID,'||unistr('\000a')||
'     COMPRV_ID,'||unistr('\000a')||
'     FECHA_EMISION,'||unistr('\000a')||
'     FECHA_VENCIMIENTO,'||unistr('\000a')||
'     FECHA_PRESENTACION,'||unistr('\000a')||
'     COMENTARIO,'||unistr('\000a')||
'     (case when INSTR(COMPDO.MIMETYPE,''pdf'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/download_pdf_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''excel'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/download_csv_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''oct'') > 0 then';

s:=s||''||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''word'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/download_rtf_32x24.gif">'''||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''plain'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'         when INSTR(COMPDO.MIMETYPE,''image'') > 0 then'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/chart_32x24.gif">''  ';

s:=s||'  '||unistr('\000a')||
'         else'||unistr('\000a')||
'          ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'         end) ICONO ,'||unistr('\000a')||
'     SITUACION,'||unistr('\000a')||
'     dbms_lob.getlength(DOCUMENTO) DOCUMENTO,'||unistr('\000a')||
'     FILENAME,'||unistr('\000a')||
'     MIMETYPE,'||unistr('\000a')||
'     LAST_UPDATE_DATE,'||unistr('\000a')||
'     SITUACION_ABR,'||unistr('\000a')||
'     MOTIVO_SITUACION,'||unistr('\000a')||
'     DATE_CREATED,'||unistr('\000a')||
'     CREATED_BY,'||unistr('\000a')||
'     DATE_MODIFIED,'||unistr('\000a')||
'     MODIFIED_BY,'||unistr('\000a')||
'     SEGORG_ID,'||unistr('\000a')||
'     COMPDT_CODIGO,'||unistr('\000a')||
'     COMPDT_NOMBRE,'||unistr('\000a')||
'     COMPDT_D';

s:=s||'ESCRIPCION,'||unistr('\000a')||
'     COMPDT_DURACION_VALOR,'||unistr('\000a')||
'     COMPDT_DURACION_TIPO,'||unistr('\000a')||
'     COMPDT_TIPO_DURACION,'||unistr('\000a')||
'     (case COMPDT_TIPO_DURACION '||unistr('\000a')||
'          when ''SIN'' then'||unistr('\000a')||
'               ''INDEFINIDA'''||unistr('\000a')||
'          else '||unistr('\000a')||
'              to_char(FECHA_VENCIMIENTO, ''dd/mm/yyyy'')'||unistr('\000a')||
'          end) COMPDT_DURACION_TIPO_T,'||unistr('\000a')||
'     COMPDT_TIPO,'||unistr('\000a')||
'     COMPDE_ESTADO,'||unistr('\000a')||
'     (case COMPDE_ESTADO '||unistr('\000a')||
'         when ''ANU'' then'||unistr('\000a')||
'              ''ANULA';

s:=s||'DA'''||unistr('\000a')||
'         else '||unistr('\000a')||
'              ''<a href="#"  onclick="javascript:anular('' || ID || '');" alt="Dar de Baja Documento" title="Dar de Baja Documento"><img  src="#WORKSPACE_IMAGES#delete2.png"></a>'''||unistr('\000a')||
'         end) ANULAR_DOC,'||unistr('\000a')||
'     CASE'||unistr('\000a')||
'        WHEN nvl(FECHA_VENCIMIENTO, sysdate + 1 ) > sysdate THEN ''<font color="green"><b>VIGENTE</b></font>'''||unistr('\000a')||
'        ELSE ''<font color="red"><b>VENCIDO</b></font>'''||unistr('\000a')||
'    ';

s:=s||'     END CASE '||unistr('\000a')||
' from COM_PROVEEDORES_DOC_V COMPDO'||unistr('\000a')||
'where COMPRV_ID = :P251_ID '||unistr('\000a')||
'  and SITUACION = ''BAJ'''||unistr('\000a')||
'order by FECHA_PRESENTACION DESC'||unistr('\000a')||
'';

wwv_flow_api.create_report_region (
  p_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 251,
  p_name=> 'Documentos Dados de Baja',
  p_region_name=>'',
  p_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 80,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_required_role => 15665500970462082+ wwv_flow_api.g_id_offset,
  p_display_when_condition=> 'select 1'||unistr('\000a')||
' from COM_PROVEEDORES_DOC_V COMPDO'||unistr('\000a')||
'where COMPRV_ID = :P251_ID '||unistr('\000a')||
'  and SITUACION = ''BAJ''',
  p_display_condition_type=> 'EXISTS',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '10',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se ha encontrado ningún dato',
  p_query_num_rows_type=> 'ROW_RANGES_WITH_LINKS',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_prn_format=> 'PDF',
  p_prn_output_show_link=> 'Y',
  p_prn_output_link_text=> 'Imprimir',
  p_prn_content_disposition=> 'ATTACHMENT',
  p_prn_document_header=> 'APEX',
  p_prn_units=> 'MILLIMETERS',
  p_prn_paper_size=> 'A4',
  p_prn_width_units=> 'PERCENTAGE',
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
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'	 COMPDT_SITUACION_ABR,'||unistr('\000a')||
'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34649828362055609 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 1,
  p_column_heading=> '',
  p_column_link=>'f?p=&APP_ID.:921:&SESSION.::&DEBUG.:921:P921_ID,P921_EDICION:#ID#,SI',
  p_column_linktext=>'<img src="#IMAGE_PREFIX#e2.gif" alt="Editar">',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_report_column_required_role => 15666331444470826+ wwv_flow_api.g_id_offset,
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '12',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34649622301055607 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 30,
  p_column_heading=> 'Comprv Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34647225221055601 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_EMISION',
  p_column_display_sequence=> 27,
  p_column_heading=> 'Fecha<br>Emisión',
  p_column_format=> 'DD/MM/YYYY',
  p_column_css_style=>'style="width:10%"',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34647322752055601 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VENCIMIENTO',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Fecha<br>Vencimiento',
  p_column_format=> 'DD/MM/YYYY',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34647401583055601 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_PRESENTACION',
  p_column_display_sequence=> 26,
  p_column_heading=> 'Fecha<br>Presentación',
  p_column_format=> 'DD/MM/YYYY',
  p_column_css_style=>'"width:10%;"',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_cattributes=> 'style="width:10%;"',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34647512070055601 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'COMENTARIO',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Comentario',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '12',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34649308716055603 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'ICONO',
  p_column_display_sequence=> 6,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '12',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34647609191055601 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION',
  p_column_display_sequence=> 12,
  p_column_heading=> 'Situación',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34649527267055607 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Documento',
  p_column_format=> 'DOWNLOAD:COM_PROVEEDORES_DOC:DOCUMENTO:ID::MIMETYPE:FILENAME:LAST_UPDATE_DATE::attachment:Abrir Doc.',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '12',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34647703892055601 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'FILENAME',
  p_column_display_sequence=> 13,
  p_column_heading=> 'Filename',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34647805773055601 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'MIMETYPE',
  p_column_display_sequence=> 14,
  p_column_heading=> 'Mimetype',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34647922999055601 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'LAST_UPDATE_DATE',
  p_column_display_sequence=> 15,
  p_column_heading=> 'Last Update Date',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34648026476055601 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION_ABR',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Situación',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34648113448055603 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'MOTIVO_SITUACION',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Motivo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34648208037055603 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 15,
  p_form_element_id=> null,
  p_column_alias=> 'DATE_CREATED',
  p_column_display_sequence=> 16,
  p_column_heading=> 'Date Created',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34648308315055603 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 16,
  p_form_element_id=> null,
  p_column_alias=> 'CREATED_BY',
  p_column_display_sequence=> 17,
  p_column_heading=> 'Created By',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34648428166055603 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 17,
  p_form_element_id=> null,
  p_column_alias=> 'DATE_MODIFIED',
  p_column_display_sequence=> 18,
  p_column_heading=> 'Date Modified',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34648519102055603 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 18,
  p_form_element_id=> null,
  p_column_alias=> 'MODIFIED_BY',
  p_column_display_sequence=> 19,
  p_column_heading=> 'Modified By',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34648624069055603 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 19,
  p_form_element_id=> null,
  p_column_alias=> 'SEGORG_ID',
  p_column_display_sequence=> 20,
  p_column_heading=> 'Segorg Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34648708276055603 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 20,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_CODIGO',
  p_column_display_sequence=> 21,
  p_column_heading=> 'Compdt Codigo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34648823272055603 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 21,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_NOMBRE',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Documento',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '12',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34648915875055603 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 22,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_DESCRIPCION',
  p_column_display_sequence=> 22,
  p_column_heading=> 'Compdt Descripcion',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34649013753055603 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 23,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_DURACION_VALOR',
  p_column_display_sequence=> 23,
  p_column_heading=> 'Compdt Duracion Valor',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34649119403055603 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 24,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_DURACION_TIPO',
  p_column_display_sequence=> 24,
  p_column_heading=> 'Compdt Duracion Tipo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34647126988055601 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 25,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_TIPO_DURACION',
  p_column_display_sequence=> 29,
  p_column_heading=> 'Compdt Tipo Duracion',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34647006158055598 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 26,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_DURACION_TIPO_T',
  p_column_display_sequence=> 5,
  p_column_heading=> 'FechaVencimiento',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '12',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34649212051055603 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 27,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDT_TIPO',
  p_column_display_sequence=> 25,
  p_column_heading=> 'Compdt Tipo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34649425334055603 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 28,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDE_ESTADO',
  p_column_display_sequence=> 28,
  p_column_heading=> 'Compde Estado !!',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34649713335055607 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 29,
  p_form_element_id=> null,
  p_column_alias=> 'ANULAR_DOC',
  p_column_display_sequence=> 8,
  p_column_heading=> 'DarBaja',
  p_column_alignment=>'CENTER',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_report_column_required_role => 15666129020470128+ wwv_flow_api.g_id_offset,
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '12',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 34650014148055609 + wwv_flow_api.g_id_offset,
  p_region_id=> 34646827103055568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 30,
  p_form_element_id=> null,
  p_column_alias=> 'CASE',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Estado',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '12',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select comobd.COMODT_NOMBRE'||unistr('\000a')||
'      ,comobd.COMOBT_NOMBRE OBJETO'||unistr('\000a')||
'      ,comobd.COMOBJ_CODIGO CODIGO'||unistr('\000a')||
'      ,comobd.COMOBJ_NOMBRE NOMBRE'||unistr('\000a')||
'      ,comobd.OBSERVACION COMENTARIO'||unistr('\000a')||
'      ,comobd.FECHA_VENCIMIENTO'||unistr('\000a')||
'      ,(case '||unistr('\000a')||
'          when INSTR(comobd.MIMETYPE,''pdf'') > 0 then ''<img src="#IMAGE_PREFIX#ws/download_pdf_32x24.gif">'''||unistr('\000a')||
'          when INSTR(comobd.MIMETYPE,''excel'') > 0 then ''<img src="#IMAGE_PREF';

s:=s||'IX#ws/download_csv_32x24.gif">'''||unistr('\000a')||
'          when INSTR(comobd.MIMETYPE,''oct'') > 0 then ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">'''||unistr('\000a')||
'          when INSTR(comobd.MIMETYPE,''word'') > 0 then ''<img src="#IMAGE_PREFIX#ws/download_rtf_32x24.gif">'''||unistr('\000a')||
'          when INSTR(comobd.MIMETYPE,''plain'') > 0 then ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'          when INSTR(comobd.MIMETYPE,''image'') > 0 then ''';

s:=s||'<img src="#IMAGE_PREFIX#ws/chart_32x24.gif">''    '||unistr('\000a')||
'          else'||unistr('\000a')||
'            ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'          end) ICONO      '||unistr('\000a')||
'      ,DBMS_LOB.GETLENGTH(comobd.DOCUMENTO) DOCUMENTO'||unistr('\000a')||
'      ,comobd.SITUACION_ABR'||unistr('\000a')||
'      ,comobd.MOTIVO_SITUACION'||unistr('\000a')||
'from   COM_OBJETOS_DOC_V comobd'||unistr('\000a')||
'where  comobd.COMPRV_ID = :P251_ID'||unistr('\000a')||
'and    comobd.SITUACION = ''BAJ'''||unistr('\000a')||
'order by comobd.FECHA_PRESENTACION';

wwv_flow_api.create_report_region (
  p_id=> 31960426035975384 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 251,
  p_name=> 'Documentos por Objeto de &P1_COMETQ_RUB.',
  p_region_name=>'',
  p_parent_plug_id=>34646827103055568 + wwv_flow_api.g_id_offset,
  p_template=> 142030053339227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 85,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_required_role => 32355302792351493+ wwv_flow_api.g_id_offset,
  p_display_when_condition=> 'select 1'||unistr('\000a')||
'from   COM_OBJETOS_DOC_V comobd'||unistr('\000a')||
'where comobd.COMPRV_ID = :P251_ID'||unistr('\000a')||
'and   comobd.SITUACION = ''BAJ''',
  p_display_condition_type=> 'EXISTS',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se encontraron Documentos dados de baja asociados.',
  p_query_num_rows_type=> 'ROW_RANGES_WITH_LINKS',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_prn_format=> 'PDF',
  p_prn_output_show_link=> 'Y',
  p_prn_output_link_text=> 'Print',
  p_prn_content_disposition=> 'ATTACHMENT',
  p_prn_document_header=> 'APEX',
  p_prn_units=> 'MILLIMETERS',
  p_prn_paper_size=> 'A4',
  p_prn_width_units=> 'PERCENTAGE',
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
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31968323377125142 + wwv_flow_api.g_id_offset,
  p_region_id=> 31960426035975384 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMODT_NOMBRE',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Documento',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '9',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32798717618943529 + wwv_flow_api.g_id_offset,
  p_region_id=> 31960426035975384 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'OBJETO',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Objeto',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '9',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32798805506943531 + wwv_flow_api.g_id_offset,
  p_region_id=> 31960426035975384 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'CODIGO',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Codigo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '9',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 32798924761943531 + wwv_flow_api.g_id_offset,
  p_region_id=> 31960426035975384 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'NOMBRE',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Nombre',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '9',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31964729730000645 + wwv_flow_api.g_id_offset,
  p_region_id=> 31960426035975384 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMENTARIO',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Comentario',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '9',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31962818001975434 + wwv_flow_api.g_id_offset,
  p_region_id=> 31960426035975384 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_VENCIMIENTO',
  p_column_display_sequence=> 6,
  p_column_heading=> 'FechaVencimiento',
  p_use_as_row_header=> 'N',
  p_column_format=> 'DD/MM/YYYY',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '9',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31967532281045018 + wwv_flow_api.g_id_offset,
  p_region_id=> 31960426035975384 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'ICONO',
  p_column_display_sequence=> 7,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '9',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31963005807975434 + wwv_flow_api.g_id_offset,
  p_region_id=> 31960426035975384 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Documento',
  p_use_as_row_header=> 'N',
  p_column_format=> 'DOWNLOAD:COM_OBJETOS_DOC:DOCUMENTO:ID::MIMETYPE:FILENAME:LAST_UPDATE_DATE::Attachment:Abrir Doc.',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '9',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31976225582595110 + wwv_flow_api.g_id_offset,
  p_region_id=> 31960426035975384 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION_ABR',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Situación',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '9',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 31963626394975435 + wwv_flow_api.g_id_offset,
  p_region_id=> 31960426035975384 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'MOTIVO_SITUACION',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Motivo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '9',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 34686227243490840 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 251,
  p_plug_name=> 'Ventana Confirmar',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 34680714813439912+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 110,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
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
  p_id=> 35627219591806009 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 251,
  p_plug_name=> 'Accesos',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142030956068227101+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 120,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 35626422530768948 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 142037578156227112+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_required_role => 45117118467988140+ wwv_flow_api.g_id_offset,
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
s:=s||'select   compra.id '||unistr('\000a')||
'        ,compra.segorg_id '||unistr('\000a')||
'        ,compra.comtpr_tipo'||unistr('\000a')||
'        ,compra.comtpr_fecha'||unistr('\000a')||
'        ,compra.comprv_id'||unistr('\000a')||
'        ,compra.compct_id'||unistr('\000a')||
'        ,compra.compcc_id'||unistr('\000a')||
'        ,compra.compdo_id'||unistr('\000a')||
'        ,compra.comtpr_id'||unistr('\000a')||
'        ,compra.tipo_documento'||unistr('\000a')||
'        ,compra.numero_documento'||unistr('\000a')||
'        ,compra.tipo_documento||'': ''||compra.numero_documento documento'||unistr('\000a')||
'        ,compra.apellido||'' ''|';

s:=s||'|compra.nombre compra_apellido_nombre'||unistr('\000a')||
'        ,to_char(compra.fecha_inicio,''DD/MM/YYYY'')||'' - ''||to_char(compra.fecha_vencimiento,''DD/MM/YYYY'') compra_duracion'||unistr('\000a')||
'        ,compra.situacion'||unistr('\000a')||
'        ,(case '||unistr('\000a')||
'            when ((compra.fecha_vencimiento < sysdate) and (compra.situacion = ''VIG'' or compra.situacion = ''MAR'')) then ''<span style="color: red;"><strong>VENCIDO</strong></span>'''||unistr('\000a')||
'            when c';

s:=s||'ompra.situacion = ''VIG'' then ''<span style="color:green"><b>''||situacion_abr||''</b></span>'''||unistr('\000a')||
'            when compra.situacion = ''MAR'' then ''<span style="color:red"><b>''||situacion_abr||''</b></span>'''||unistr('\000a')||
'            when compra.situacion = ''APE'' then ''<span style="color:rgb(255, 131, 0)"><b>''||situacion_abr||''</b></span>'''||unistr('\000a')||
'            when compra.situacion = ''SUS'' then ''<span style="color:red"><b>''||situ';

s:=s||'acion_abr||''</b></span>'''||unistr('\000a')||
'            else compra.situacion_abr'||unistr('\000a')||
'         end)situacion_abr'||unistr('\000a')||
'        ,compra.fecha_situacion'||unistr('\000a')||
'        ,compra.motivo_situacion'||unistr('\000a')||
'        ,compra.comprv_cuit'||unistr('\000a')||
'        ,compra.comprv_nombre'||unistr('\000a')||
'        ,compra.compcc_codigo'||unistr('\000a')||
'        ,compra.compcc_nombre'||unistr('\000a')||
'        ,compra.compct_codigo'||unistr('\000a')||
'        ,compra.compct_nombre  '||unistr('\000a')||
'        ,decode(comprv_pkg.compra_debe_sn(p_compra_id => compra.i';

s:=s||'d),''SI'',''<span style="color:red"><b>DEBE</b></span>'',''<span style="color:green"><b>AL DIA</b></span>'') debe'||unistr('\000a')||
'from com_proveedores_aut_v compra'||unistr('\000a')||
'where compra.comprv_id = :P251_ID'||unistr('\000a')||
'  and compra.id in (select  max(compra1.id)'||unistr('\000a')||
'                      from com_proveedores_aut_v compra1'||unistr('\000a')||
'                     where compra1.situacion not in (''NUE'',''ANU'')'||unistr('\000a')||
'                       and compra1.comprv_id = :P251_ID'||unistr('\000a')||
' ';

s:=s||'                 group by compra1.compcc_id, compra1.numero_documento,compra1.comprv_id,compra1.tipo_documento)'||unistr('\000a')||
'  and compra.compct_id = :P251_COMPCT_ID'||unistr('\000a')||
'  and compra.situacion in (''VIG'',''MAR'',''APE'',''SUS'')'||unistr('\000a')||
'  and (NVL(:P251_FILTRO_ESTADO3,''VIG'') = ''VIG'' or :P251_FILTRO_ESTADO3 = ''VIGHIS'')'||unistr('\000a')||
'union'||unistr('\000a')||
'select   compra.id '||unistr('\000a')||
'        ,compra.segorg_id '||unistr('\000a')||
'        ,compra.comtpr_tipo'||unistr('\000a')||
'        ,compra.comtpr_fecha'||unistr('\000a')||
'  ';

s:=s||'      ,compra.comprv_id'||unistr('\000a')||
'        ,compra.compct_id'||unistr('\000a')||
'        ,compra.compcc_id'||unistr('\000a')||
'        ,compra.compdo_id'||unistr('\000a')||
'        ,compra.comtpr_id'||unistr('\000a')||
'        ,compra.tipo_documento'||unistr('\000a')||
'        ,compra.numero_documento'||unistr('\000a')||
'        ,compra.tipo_documento||'': ''||compra.numero_documento documento'||unistr('\000a')||
'        ,compra.apellido||'' ''||compra.nombre compra_apellido_nombre'||unistr('\000a')||
'        ,to_char(compra.fecha_inicio,''DD/MM/YYYY'')||'' - ''||to_char(c';

s:=s||'ompra.fecha_vencimiento,''DD/MM/YYYY'') compra_duracion'||unistr('\000a')||
'        ,compra.situacion'||unistr('\000a')||
'        ,(case '||unistr('\000a')||
'            when ((compra.fecha_vencimiento < sysdate) and (compra.situacion = ''VIG'' or compra.situacion = ''MAR'')) then ''<span style="color: red;"><strong>VENCIDO</strong></span>'''||unistr('\000a')||
'            when compra.situacion = ''VIG'' then ''<span style="color:green"><b>''||situacion_abr||''</b></span>'''||unistr('\000a')||
'            whe';

s:=s||'n compra.situacion = ''MAR'' then ''<span style="color:red"><b>''||situacion_abr||''</b></span>'''||unistr('\000a')||
'            when compra.situacion = ''BAJ'' then ''<span style="color:red"><b>''||situacion_abr||''</b></span>'''||unistr('\000a')||
'            else compra.situacion_abr'||unistr('\000a')||
'         end)situacion_abr'||unistr('\000a')||
'        ,compra.fecha_situacion'||unistr('\000a')||
'        ,compra.motivo_situacion'||unistr('\000a')||
'        ,compra.comprv_cuit'||unistr('\000a')||
'        ,compra.comprv_nombre'||unistr('\000a')||
'        ,comp';

s:=s||'ra.compcc_codigo'||unistr('\000a')||
'        ,compra.compcc_nombre'||unistr('\000a')||
'        ,compra.compct_codigo'||unistr('\000a')||
'        ,compra.compct_nombre  '||unistr('\000a')||
'        ,decode(comprv_pkg.compra_debe_sn(p_compra_id => compra.id),''SI'',''<span style="color:red"><b>DEBE</b></span>'',''<span style="color:green"><b>AL DIA</b></span>'') debe'||unistr('\000a')||
'from  com_proveedores_aut_v compra'||unistr('\000a')||
'where compra.comprv_id = :P251_ID'||unistr('\000a')||
'  and compra.situacion not in (''NUE'',''ANU'')'||unistr('\000a')||
'  and';

s:=s||' compra.compct_id = :P251_COMPCT_ID'||unistr('\000a')||
'  and compra.situacion = ''BAJ'''||unistr('\000a')||
'  and (NVL(:P251_FILTRO_ESTADO3,''VIG'') = ''HIS'' or :P251_FILTRO_ESTADO3 = ''VIGHIS'') ';

wwv_flow_api.create_report_region (
  p_id=> 51954210457021106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 251,
  p_name=> 'Autoridades',
  p_region_name=>'',
  p_template=> 142031563346227101+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 55,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> 'declare'||unistr('\000a')||
'  cursor cr_comprt is'||unistr('\000a')||
'    select comprt.CODIGO'||unistr('\000a')||
'    from   COM_PROVEEDORES_TIPOS comprt'||unistr('\000a')||
'    where  comprt.ID = :P251_COMPRT_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_comprt_codigo varchar2(30);  '||unistr('\000a')||
'begin'||unistr('\000a')||
'  open cr_comprt;'||unistr('\000a')||
'  fetch cr_comprt into v_comprt_codigo;'||unistr('\000a')||
'  close cr_comprt;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  return nvl(v_comprt_codigo, '''') = ''JUR'';'||unistr('\000a')||
'end;',
  p_display_condition_type=> 'FUNCTION_BODY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '10',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols=> '0',
  p_query_no_data_found=> '<span style="color:red;font-weight:bold">DEBE: Aun no se han registrado autoridades para este proveedor.</span>',
  p_query_num_rows_item=> 'P251_ROWS',
  p_query_num_rows_type=> 'ROW_RANGES_WITH_LINKS',
  p_query_row_count_max=> '99999',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_prn_format=> 'PDF',
  p_prn_output_show_link=> 'Y',
  p_prn_output_link_text=> 'Imprimir',
  p_prn_output_file_name=> 'ComPRV',
  p_prn_content_disposition=> 'ATTACHMENT',
  p_prn_document_header=> 'APEX',
  p_prn_units=> 'MILLIMETERS',
  p_prn_paper_size=> 'A4',
  p_prn_width_units=> 'PERCENTAGE',
  p_prn_width=> 210,
  p_prn_height=> 297,
  p_prn_orientation=> 'VERTICAL',
  p_prn_page_header=> '&P1_COMETQ_PRV.'||unistr('\000a')||
'Listado de &P1_COMETQ_PRV.'||unistr('\000a')||
''||unistr('\000a')||
'Filtros aplicados - Proveedor: &P250_SEARCH. CUIT: &P250_COMPRV_CUIT. Situación: &P250_COMPRE_ESTADO.'||unistr('\000a')||
''||unistr('\000a')||
'',
  p_prn_page_header_font_color=> '#000000',
  p_prn_page_header_font_family=> 'Helvetica',
  p_prn_page_header_font_weight=> 'normal',
  p_prn_page_header_font_size=> '11',
  p_prn_page_footer_font_color=> '#000000',
  p_prn_page_footer_font_family=> 'Helvetica',
  p_prn_page_footer_font_weight=> 'normal',
  p_prn_page_footer_font_size=> '12',
  p_prn_header_bg_color=> '#CCCCCC',
  p_prn_header_font_color=> '#000000',
  p_prn_header_font_family=> 'Helvetica',
  p_prn_header_font_weight=> 'normal',
  p_prn_header_font_size=> '9',
  p_prn_body_bg_color=> '#FFFFFF',
  p_prn_body_font_color=> '#000000',
  p_prn_body_font_family=> 'Helvetica',
  p_prn_body_font_weight=> 'normal',
  p_prn_body_font_size=> '8',
  p_prn_border_width=> .5,
  p_prn_page_header_alignment=> 'CENTER',
  p_prn_page_footer_alignment=> 'LEFT',
  p_sort_null=> 'F',
  p_query_asc_image=> 'arrow_down_gray_dark.gif',
  p_query_asc_image_attr=> 'width="13" height="12" alt=""',
  p_query_desc_image=> 'arrow_up_gray_dark.gif',
  p_query_desc_image_attr=> 'width="13" height="12" alt=""',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'-- Condicion Visibilidad'||unistr('\000a')||
':P251_COMPCT_ID is not null');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 51958332648021171 + wwv_flow_api.g_id_offset,
  p_region_id=> 51954210457021106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 3,
  p_column_heading=> '<br>',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ID.:1071:&SESSION.::&DEBUG.:1071:P1071_ID,P1071_APP_ANTERIOR,P1071_PAG_ANTERIOR:#ID#,&APP_ID.,&APP_PAGE_ID.',
  p_column_linktext=>'<img src="#IMAGE_PREFIX#e2.gif" alt="Detalle">',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 51954523911021162 + wwv_flow_api.g_id_offset,
  p_region_id=> 51954210457021106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'SEGORG_ID',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Segorg Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 51956131143021164 + wwv_flow_api.g_id_offset,
  p_region_id=> 51954210457021106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMTPR_TIPO',
  p_column_display_sequence=> 16,
  p_column_heading=> 'Comtpr Tipo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 51956216176021164 + wwv_flow_api.g_id_offset,
  p_region_id=> 51954210457021106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COMTPR_FECHA',
  p_column_display_sequence=> 18,
  p_column_heading=> 'Comtpr Fecha',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 51956301551021164 + wwv_flow_api.g_id_offset,
  p_region_id=> 51954210457021106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 19,
  p_column_heading=> 'Comprv Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 51956419691021164 + wwv_flow_api.g_id_offset,
  p_region_id=> 51954210457021106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'COMPCT_ID',
  p_column_display_sequence=> 21,
  p_column_heading=> 'Compct Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 51956504967021164 + wwv_flow_api.g_id_offset,
  p_region_id=> 51954210457021106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'COMPCC_ID',
  p_column_display_sequence=> 22,
  p_column_heading=> 'Compcc Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 51956624811021168 + wwv_flow_api.g_id_offset,
  p_region_id=> 51954210457021106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'COMPDO_ID',
  p_column_display_sequence=> 23,
  p_column_heading=> 'Compdo Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 51956709653021168 + wwv_flow_api.g_id_offset,
  p_region_id=> 51954210457021106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'COMTPR_ID',
  p_column_display_sequence=> 24,
  p_column_heading=> 'Comtpr Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 51956820062021168 + wwv_flow_api.g_id_offset,
  p_region_id=> 51954210457021106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'TIPO_DOCUMENTO',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Tipo Documento',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 51956926199021168 + wwv_flow_api.g_id_offset,
  p_region_id=> 51954210457021106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'NUMERO_DOCUMENTO',
  p_column_display_sequence=> 13,
  p_column_heading=> 'Numero Documento',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 51954407346021156 + wwv_flow_api.g_id_offset,
  p_region_id=> 51954210457021106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Documento',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '10',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 57874308318805881 + wwv_flow_api.g_id_offset,
  p_region_id=> 51954210457021106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRA_APELLIDO_NOMBRE',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Autoridad',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 57875711959834604 + wwv_flow_api.g_id_offset,
  p_region_id=> 51954210457021106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRA_DURACION',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Duración',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 51957301009021171 + wwv_flow_api.g_id_offset,
  p_region_id=> 51954210457021106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 15,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION',
  p_column_display_sequence=> 15,
  p_column_heading=> 'Situacion',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 51957409986021171 + wwv_flow_api.g_id_offset,
  p_region_id=> 51954210457021106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 16,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION_ABR',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Situación',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '10',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 51957527052021171 + wwv_flow_api.g_id_offset,
  p_region_id=> 51954210457021106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 17,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA_SITUACION',
  p_column_display_sequence=> 12,
  p_column_heading=> 'Fecha Situación',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '10',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 51957620743021171 + wwv_flow_api.g_id_offset,
  p_region_id=> 51954210457021106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 18,
  p_form_element_id=> null,
  p_column_alias=> 'MOTIVO_SITUACION',
  p_column_display_sequence=> 14,
  p_column_heading=> 'Motivo Situación',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '10',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 51957723545021171 + wwv_flow_api.g_id_offset,
  p_region_id=> 51954210457021106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 19,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_CUIT',
  p_column_display_sequence=> 7,
  p_column_heading=> 'CUIT',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '10',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 51957800133021171 + wwv_flow_api.g_id_offset,
  p_region_id=> 51954210457021106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 20,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_NOMBRE',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Proveedor',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '10',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 51957916715021171 + wwv_flow_api.g_id_offset,
  p_region_id=> 51954210457021106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 21,
  p_form_element_id=> null,
  p_column_alias=> 'COMPCC_CODIGO',
  p_column_display_sequence=> 17,
  p_column_heading=> 'Compcc Codigo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 51958015319021171 + wwv_flow_api.g_id_offset,
  p_region_id=> 51954210457021106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 22,
  p_form_element_id=> null,
  p_column_alias=> 'COMPCC_NOMBRE',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Cargo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '10',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 51958111094021171 + wwv_flow_api.g_id_offset,
  p_region_id=> 51954210457021106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 23,
  p_form_element_id=> null,
  p_column_alias=> 'COMPCT_CODIGO',
  p_column_display_sequence=> 20,
  p_column_heading=> 'Compct Codigo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'N',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 51958232360021171 + wwv_flow_api.g_id_offset,
  p_region_id=> 51954210457021106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 24,
  p_form_element_id=> null,
  p_column_alias=> 'COMPCT_NOMBRE',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Categoría',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '10',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 58619624869009331 + wwv_flow_api.g_id_offset,
  p_region_id=> 51954210457021106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 25,
  p_form_element_id=> null,
  p_column_alias=> 'DEBE',
  p_column_display_sequence=> 25,
  p_column_heading=> 'Documentación',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select compcc2.nombre||'' ''||decode(obligatorio_sn,''SI'',''<font color="red">(OBLIGATORIO)</font>'',''NO'',''(OPCIONAL)'') NOMBRE'||unistr('\000a')||
'      ,compcc2.obligatorio_sn'||unistr('\000a')||
'      ,compcc2.cantidad_min'||unistr('\000a')||
'      ,compcc2.cantidad_max'||unistr('\000a')||
'from (select compcc.ID compcc_id'||unistr('\000a')||
'    from   COM_PROVEEDORES_CAR compcc'||unistr('\000a')||
'    where  compcc.COMPCT_ID = :P251_COMPCT_ID'||unistr('\000a')||
'    minus'||unistr('\000a')||
'    select compcc_id'||unistr('\000a')||
'    from com_proveedores_aut_v compra'||unistr('\000a')||
'    WH';

s:=s||'ERE COMPRA.COMPRV_ID = :P251_ID'||unistr('\000a')||
'      AND COMPRA.ID in (SELECT  MAX(COMPRA1.ID)'||unistr('\000a')||
'                          FROM (COM_PROVEEDORES_AUT_V COMPRA1)'||unistr('\000a')||
'                         WHERE COMPRA1.SITUACION not in (''NUE'',''ANU'')'||unistr('\000a')||
'                           AND COMPRA1.COMPRV_ID = :P251_ID'||unistr('\000a')||
'                      GROUP BY COMPRA1.COMPCC_ID, COMPRA1.NUMERO_DOCUMENTO,COMPRA1.COMPRV_ID,COMPRA1.TIPO_DOCUMENTO)'||unistr('\000a')||
'     and c';

s:=s||'ompra.situacion in (''VIG'',''MAR'')'||unistr('\000a')||
'    aND COMPRA.COMPCT_ID = :P251_COMPCT_ID)compcc1'||unistr('\000a')||
'    ,com_proveedores_car compcc2'||unistr('\000a')||
'where compcc1.compcc_id = compcc2.id'||unistr('\000a')||
'';

wwv_flow_api.create_report_region (
  p_id=> 80232720501331971 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 251,
  p_name=> 'Autoridades no presentadas',
  p_region_name=>'',
  p_parent_plug_id=>51954210457021106 + wwv_flow_api.g_id_offset,
  p_template=> 142030053339227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 140,
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> 'P251_COMPCT_ID',
  p_display_condition_type=> 'ITEM_IS_NOT_NULL',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'no data found',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 80233517629364756 + wwv_flow_api.g_id_offset,
  p_region_id=> 80232720501331971 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'NOMBRE',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Cargo',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 80233631903364757 + wwv_flow_api.g_id_offset,
  p_region_id=> 80232720501331971 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'OBLIGATORIO_SN',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Obligatorio Sn',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 80234113888457631 + wwv_flow_api.g_id_offset,
  p_region_id=> 80232720501331971 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'CANTIDAD_MIN',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Cantidad Mínima',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 80234220750457631 + wwv_flow_api.g_id_offset,
  p_region_id=> 80232720501331971 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'CANTIDAD_MAX',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Cantidad Máxima',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select comprg.comrgp_nombre'||unistr('\000a')||
'      ,decode(comprg.situacion,''VIG'',''<font color="green"><b>ASOCIADO</b></font>'',''BAJ'',''<font color="red"><b>DE BAJA</b></font>'',''SUS'',''<font color="red"><b>SUSPENDIDO</b></font>'') asociado'||unistr('\000a')||
'      ,vigencia_fch'||unistr('\000a')||
'      ,validez_fch'||unistr('\000a')||
'      ,decode(comprg.situacion,''VIG'',''<a href="javascript:if(confirm(''''Desea Desasociarse del Registro de Proveedores: ''||comprg.comrgp_nombre';

s:=s||'||''?'''')) {$x(''''P251_COMPRG_ID'''').value = ''||to_char(comprg.id)||'';doSubmit(''''DESASOCIAR_REGISTRO'''');}">Desasociar</a>'')ACCION'||unistr('\000a')||
'      ,motivo_situacion'||unistr('\000a')||
'      ,decode(COMPRV_PKG.COMPRG_SUSPENDER_SN(p_comprg_id => comprg.id,p_comeco_id => :P251_COMECO_ID,p_segusu_tipo => :P1_SEGUSU_TIPO),''SI'',''<a href="#"  onclick="suspenderRegistro(''||comprg.comrgp_id||'',''''''||comprg.comrgp_nombre||'''''');return false;"';

s:=s||' alt="Suspender Proveedor en el Registro" title="Suspender Proveedor en el Registro" >Suspender</a>'',''NO'',decode (COMPRV_PKG.COMPRG_HABILITAR_SN(p_comprg_id => comprg.id,p_comeco_id => :P251_COMECO_ID,p_segusu_tipo => :P1_SEGUSU_TIPO),''SI'',''<a href="#"  onclick="habilitarRegistro(''||comprg.ID||'',''''''||comprg.comrgp_nombre||'''''');return false;" alt="Habilitar Proveedor en el Registro" title="Habilita';

s:=s||'r Proveedor en el Registro" >Habilitar</a>'')) suspender'||unistr('\000a')||
'      '||unistr('\000a')||
'      '||unistr('\000a')||
'from com_proveedores_rgp_v comprg'||unistr('\000a')||
'where comprg.comprv_id = :P251_ID'||unistr('\000a')||
'and ((comprg.validez_fch is null AND NVL(:P251_FILTRO_REGISTROS,''VIG'') = ''VIG'') '||unistr('\000a')||
'   or (comprg.validez_fch is not null AND :P251_FILTRO_REGISTROS = ''HIS'')'||unistr('\000a')||
'   or (:P251_FILTRO_REGISTROS = ''VIGHIS''))'||unistr('\000a')||
'union all'||unistr('\000a')||
'select comrgp.nombre     '||unistr('\000a')||
'      ,''<font color="red"><b';

s:=s||'>NO ASOCIADO</b></font>'' asociado'||unistr('\000a')||
'      ,null fecha_vigencia'||unistr('\000a')||
'      ,null fecha_validez'||unistr('\000a')||
'      ,''<a href="javascript:if(confirm(''''Desea Asociarse al Registro de Proveedores: ''||comrgp.nombre||''?'''')) {$x(''''P251_COMRGP_ID'''').value = ''||to_char(comrgp.ID)||'';doSubmit(''''ASOCIAR_REGISTRO'''');}">Asociar</a>''ACCION'||unistr('\000a')||
'      , null motivo_situacion'||unistr('\000a')||
'      , NULL suspender'||unistr('\000a')||
'from com_registros_prv comrgp'||unistr('\000a')||
'where comr';

s:=s||'gp.situacion = ''HAB'' '||unistr('\000a')||
'and   NVL(:P251_FILTRO_REGISTROS,''VIG'') = ''VIG'''||unistr('\000a')||
'and   comrgp.id not in (select comrgp_id'||unistr('\000a')||
'                        from com_proveedores_rgp'||unistr('\000a')||
'                        where comprv_id = :P251_ID'||unistr('\000a')||
'                          and  ( situacion =''VIG'' OR (situacion = ''SUS'' and validez_fch is null)))';

wwv_flow_api.create_report_region (
  p_id=> 75921302404539212 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 251,
  p_name=> 'Registros de Proveedores',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 35,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se ha encontrado ningún dato.',
  p_query_num_rows_type=> 'NEXT_PREVIOUS_LINKS',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 77063019367704582 + wwv_flow_api.g_id_offset,
  p_region_id=> 75921302404539212 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMRGP_NOMBRE',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Registros de Proveedores',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 77060129208532928 + wwv_flow_api.g_id_offset,
  p_region_id=> 75921302404539212 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'ASOCIADO',
  p_column_display_sequence=> 2,
  p_column_heading=> '<br>',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 77081308484363053 + wwv_flow_api.g_id_offset,
  p_region_id=> 75921302404539212 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'VIGENCIA_FCH',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Fecha Vigencia',
  p_use_as_row_header=> 'N',
  p_column_format=> 'DD/MM/YYYY',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 77081405283363093 + wwv_flow_api.g_id_offset,
  p_region_id=> 75921302404539212 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'VALIDEZ_FCH',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Fecha Validez',
  p_use_as_row_header=> 'N',
  p_column_format=> 'DD/MM/YYYY',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 77241701055097587 + wwv_flow_api.g_id_offset,
  p_region_id=> 75921302404539212 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'ACCION',
  p_column_display_sequence=> 5,
  p_column_heading=> '<br>',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'ITEM_IS_NULL',
  p_display_when_condition=> 'P251_COMECO_ID ',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 77307432259614576 + wwv_flow_api.g_id_offset,
  p_region_id=> 75921302404539212 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'MOTIVO_SITUACION',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Motivo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 77264128547753375 + wwv_flow_api.g_id_offset,
  p_region_id=> 75921302404539212 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'SUSPENDER',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Acción',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_report_column_required_role => 77399212177899875+ wwv_flow_api.g_id_offset,
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 8801028951495527 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 251,
  p_button_sequence=> 5,
  p_button_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
  p_button_name    => 'APLICAR_CAMBIOS',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Aplicar Cambios',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_condition=> 'P251_OPERACION',
  p_button_condition2=> 'EDITAR',
  p_button_condition_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_database_action=>'UPDATE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 16279708935374887 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 251,
  p_button_sequence=> 6,
  p_button_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCELAR',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancelar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_condition=> 'P251_OPERACION',
  p_button_condition2=> 'EDITAR',
  p_button_condition_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 12612813665772613 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 251,
  p_button_sequence=> 10,
  p_button_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
  p_button_name    => 'RETORNAR',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Retornar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:&P1_PAG_ANTERIOR.:&SESSION.::&DEBUG.:251::',
  p_button_condition=> ':P251_OPERACION <> ''EDITAR'' AND :P251_APP_ANTERIOR IS NULL',
  p_button_condition_type=> 'PLSQL_EXPRESSION',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 18029719405889726 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 251,
  p_button_sequence=> 65,
  p_button_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
  p_button_name    => 'Cerrar',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Retornar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&P251_APP_ANTERIOR.:&P251_PAG_ANTERIOR.:&SESSION.',
  p_button_condition=> 'P251_APP_ANTERIOR',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 6543311560762212 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 251,
  p_button_sequence=> 95,
  p_button_plug_id => 14725616277486725+wwv_flow_api.g_id_offset,
  p_button_name    => 'CONSULTAR_DPIP',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Consultas DPIP',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:264:&SESSION.::&DEBUG.:264:P264_ID:&P251_ID.',
  p_security_scheme => 6882017435260326+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 29261208453758392 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 251,
  p_button_sequence=> 105,
  p_button_plug_id => 29244311309040309+wwv_flow_api.g_id_offset,
  p_button_name    => 'ASOCIAR',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Asociar Clasificador',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 14680910581729962 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 251,
  p_button_sequence=> 75,
  p_button_plug_id => 14575727483442442+wwv_flow_api.g_id_offset,
  p_button_name    => 'NEXT',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Ver Historico',
  p_button_position=> 'REGION_TEMPLATE_NEXT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:699:&SESSION.::&DEBUG.:699:P699_ID:&P251_ID.',
  p_security_scheme => 45114126126847792+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 14811300070887175 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 251,
  p_button_sequence=> 85,
  p_button_plug_id => 14575727483442442+wwv_flow_api.g_id_offset,
  p_button_name    => 'NEXT2',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Nuevo Documento',
  p_button_position=> 'REGION_TEMPLATE_NEXT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:694:&SESSION.::&DEBUG.:694:P694_COMPRV_ID,P694_EDICION:&P251_ID.,NO',
  p_button_execute_validations=>'Y',
  p_security_scheme => 15665923826468673+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 13497205474165794 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 251,
  p_button_sequence=> 10,
  p_button_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
  p_button_name    => 'Habilitar',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Habilitar',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:259:&SESSION.::&DEBUG.:259:P259_COMPRV_CUIT:&P251_CUIT.',
  p_button_condition=> ':P251_COMPRE_ESTADO IN (''PEN'') AND :P251_OPERACION <> ''EDITAR''',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 7358810245958362+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 12613030493772613 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 251,
  p_button_sequence=> 20,
  p_button_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
  p_button_name    => 'Rehabilitar',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Rehabilitar',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:259:&SESSION.::&DEBUG.:259:P259_COMPRV_CUIT:&P251_CUIT.',
  p_button_condition=> ':P251_COMPRE_ESTADO IN (''BAJ'') AND :P251_OPERACION <> ''EDITAR''',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 7358810245958362+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 12613207590772613 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 251,
  p_button_sequence=> 30,
  p_button_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
  p_button_name    => 'DarBaja',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Dar Baja',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:255:&SESSION.::&DEBUG.:255:P255_COMPRV_CUIT:&P251_CUIT.',
  p_button_condition=> ':P251_COMPRE_ESTADO IN (''HAB'',''SUS'',''PEN'') AND :P251_OPERACION <> ''EDITAR''',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 7358704704956715+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 12613409760772613 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 251,
  p_button_sequence=> 40,
  p_button_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
  p_button_name    => 'Editar',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cambiar Datos',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_condition=> 'P251_OPERACION',
  p_button_condition2=> 'CONSULTA',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 9052826842230135+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 12612625416772601 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 251,
  p_button_sequence=> 55,
  p_button_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
  p_button_name    => 'Sancionar',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Suspender',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:252:&SESSION.::&DEBUG.:252:P252_COMPRV_CUIT:&P251_CUIT.',
  p_button_condition=> ':P251_OPERACION <> ''EDITAR'''||unistr('\000a')||
'AND :P251_COMPRE_ESTADO = ''HAB''',
  p_button_condition_type=> 'NEVER',
  p_security_scheme => 7358631584954996+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>8801305663495530 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:251:&SESSION.::&DEBUG.::P251_OPERACION,P251_ID:CONSULTA,&P251_ID.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>8801028951495527+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>12619310318772637 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:250:&SESSION.::&DEBUG.:251::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>12612625416772601+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 20,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>8799823017465372 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:251:&SESSION.::&DEBUG.::P251_OPERACION,P251_ID:EDITAR,&P251_ID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>12613409760772613+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 30,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 08-JUL-2009 10:36 by FVALLEJO');
 
wwv_flow_api.create_page_branch(
  p_id=>15839010606967299 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:265:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 40,
  p_branch_condition_type=> 'PLSQL_EXPRESSION',
  p_branch_condition=> ':P251_CALLE IS NOT NULL AND :P265_LOCATION IS NOT NULL',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 24-AGO-2009 15:33 by JPREDA');
 
wwv_flow_api.create_page_branch(
  p_id=>16283603179382774 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:251:&SESSION.::&DEBUG.::P251_OPERACION,P251_ID:CONSULTA,&P251_ID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>16279708935374887+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 60,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 08-JUL-2009 10:36 by FVALLEJO');
 
wwv_flow_api.create_page_branch(
  p_id=>29261621132776664 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:219:&SESSION.:219:&DEBUG.::P219_COMPRV_ID:&P251_ID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>29261208453758392+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 70,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>12619122594772632 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:251:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#',
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
  p_id=>12613610214772613 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_SEGORG_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
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
  p_id=>12614614759772618 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_CUIT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'CUIT :',
  p_source=>'CUIT',
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
  p_id=>12614807110772618 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Nombre / Razón Social :',
  p_source=>'NOMBRE',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
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
  p_id=>12615021671772619 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_DESCRIPCION_ACTIVIDAD',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Descripción de la Actividad :',
  p_source=>'DESCRIPCION_ACTIVIDAD',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
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
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
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
  p_id=>12615215047772619 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_EMAIL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Email :',
  p_source=>'EMAIL',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
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
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when=>'P251_OPERACION',
  p_read_only_when2=>'CONSULTA',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
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
  p_id=>12615431686772619 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_CONDICION_IB',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Condición frente al IVA :',
  p_source=>'CONDICION_IB',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'COMTPR CONDICION IB',
  p_lov=> 'select rv_meaning d, rv_low_value r'||unistr('\000a')||
'from   cg_ref_codes'||unistr('\000a')||
'where  rv_domain = ''COM_TRAMITES_PRV.CONDICION_IB'''||unistr('\000a')||
'order by 1',
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
  p_id=>12615613226772619 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_NUMERO_INSCRIPCION_IB',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 90,
  p_item_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Nº Inscripción IB : ',
  p_source=>'NUMERO_INSCRIPCION_IB',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
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
  p_id=>12615815647772619 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_FECHA_INSCRIPCION_IB',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 100,
  p_item_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha inicio Actividad : ',
  p_format_mask=>'DD/MM/YYYY',
  p_source=>'FECHA_INSCRIPCION_IB',
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
  p_id=>12616016122772619 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_NUMERO_CONVENIO_MULTILATE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 120,
  p_item_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Nº Convenio Multilateral :',
  p_source=>'NUMERO_CONVENIO_MULTILATERAL',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
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
  p_display_when=>'P251_NUMERO_CONVENIO_MULTILATE',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
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
  p_id=>12616401723772619 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_DATE_CREATED',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 180,
  p_item_plug_id => 12610125386772557+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Creado el :',
  p_source=>'DATE_CREATED',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
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
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>12616622962772619 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_CREATED_BY',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 190,
  p_item_plug_id => 12610125386772557+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Creado por :',
  p_source=>'CREATED_BY',
  p_source_type=> 'DB_COLUMN',
  p_source_post_computation => 'NVL(SEG_PKG.OBTN_SEGUSU_NOMBRE(:P251_CREATED_BY),:P251_CREATED_BY)',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
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
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>12616801527772619 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_DATE_MODIFIED',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 200,
  p_item_plug_id => 12610125386772557+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Actualizado el :',
  p_source=>'DATE_MODIFIED',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
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
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>12617011333772619 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_MODIFIED_BY',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 210,
  p_item_plug_id => 12610125386772557+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Actualizado por :',
  p_source=>'MODIFIED_BY',
  p_source_type=> 'DB_COLUMN',
  p_source_post_computation => 'NVL(SEG_PKG.OBTN_SEGUSU_NOMBRE(:P251_MODIFIED_BY),:P251_MODIFIED_BY)',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
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
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>12617217570772619 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Proveedor ID',
  p_source=>'ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 30,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
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
  p_id=>12617610229772619 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_OPERACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'CONSULTA',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Operacion',
  p_source=>'CONSULTA',
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
  p_id=>12617812922772621 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_OPERACIONES_HABILITADAS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 2,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Operaciones Habilitadas',
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
  p_id=>12815025651131771 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_FECHA_INICIO_FIRMA_DIG',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 280,
  p_item_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha de Inicio de Firma Digital:',
  p_format_mask=>'DD/MM/YYYY',
  p_source=>'FECHA_INICIO_FIRMA_DIGITAL',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DATE_PICKER',
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
  p_read_only_when=>'P251_OPERACION',
  p_read_only_when2=>'CONSULTA',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
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
  p_id=>12927922503475232 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_FILTRO_DOMICILIOS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 230,
  p_item_plug_id => 12828806369155322+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'ACT',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Filtrado por :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_RADIOGROUP',
  p_named_lov=> 'TIPO_FILTRADO',
  p_lov=> '.'||to_char(12894104103091463 + wwv_flow_api.g_id_offset)||'.',
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
  p_attribute_01 => '3',
  p_attribute_02 => 'REDIRECT_SET_VALUE',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>12944827173138924 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_FILTRO_RESPONSABLES',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 240,
  p_item_plug_id => 1334332750289275+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'ACT',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Filtrado por :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_RADIOGROUP',
  p_named_lov=> 'TIPO_FILTRADO',
  p_lov=> '.'||to_char(12894104103091463 + wwv_flow_api.g_id_offset)||'.',
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
  p_attribute_01 => '3',
  p_attribute_02 => 'REDIRECT_SET_VALUE',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>12945332152149860 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_FILTRO_RUBROS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 250,
  p_item_plug_id => 12608312213772551+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'ACT',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Filtrado por :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_RADIOGROUP',
  p_named_lov=> 'TIPO_FILTRADO',
  p_lov=> '.'||to_char(12894104103091463 + wwv_flow_api.g_id_offset)||'.',
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
  p_attribute_01 => '3',
  p_attribute_02 => 'REDIRECT_SET_VALUE',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>13071025037502391 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_FILTRO_ESTADO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 13064301694410488+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'VIG',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Filtrado por :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_RADIOGROUP',
  p_named_lov=> 'TIPO_FILTRADO_EST',
  p_lov=> '.'||to_char(13070007029497230 + wwv_flow_api.g_id_offset)||'.',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'RIGHT-TOP',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'N',
  p_security_scheme => 16291626728389510+ wwv_flow_api.g_id_offset,
  p_attribute_01 => '4',
  p_attribute_02 => 'REDIRECT_SET_VALUE',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>13074704923619626 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_COMPRE_ESTADO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 150,
  p_item_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Estado Actual:',
  p_source_type=> 'ITEM',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'COMPRE_ESTADO',
  p_lov=> 'select rv_abbreviation d, rv_low_value r'||unistr('\000a')||
'from   cg_ref_codes'||unistr('\000a')||
'where  rv_domain = ''COM_PROVEEDORES_EST.ESTADO'''||unistr('\000a')||
'order by 1',
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
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
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
wwv_flow_api.create_page_item(
  p_id=>13206624274840947 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_COMPRE_FECHA_VALIDEZ',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 160,
  p_item_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
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
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>':P251_ESTADO_ACTUAL IN (''SUS'')',
  p_display_when_type=>'PLSQL_EXPRESSION',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>13408801358299047 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_FILTRO_ESTADO2',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 13064301694410488+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'VAL',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Filtrado por :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_RADIOGROUP',
  p_named_lov=> 'TIPO_FILTRADO_EST_VAL',
  p_lov=> '.'||to_char(13409122829305226 + wwv_flow_api.g_id_offset)||'.',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'RIGHT-TOP',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'N',
  p_security_scheme => 16291626728389510+ wwv_flow_api.g_id_offset,
  p_attribute_01 => '4',
  p_attribute_02 => 'REDIRECT_SET_VALUE',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>15254809250917215 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_DOC_ID_ANULAR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 260,
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
  p_id=>16042507422767894 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_APP_ANTERIOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 3,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'App Anterior',
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
  p_id=>16042726123773372 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_PAG_ANTERIOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 4,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Pagina Anterior',
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
  p_id=>16971826168765048 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_COMPRT_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tipo Proveedor :',
  p_source=>'COMPRT_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select nombre d, id r'||unistr('\000a')||
'from com_proveedores_tipos_v'||unistr('\000a')||
'where id = :P251_COMPRT_ID',
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
  p_id=>29104210127512453 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_CBU',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 110,
  p_item_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'CBU :',
  p_source=>'CBU',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
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
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
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
  p_id=>29140503907874237 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_BANCO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 111,
  p_item_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>' ',
  p_pre_element_text=>'(',
  p_post_element_text=>')',
  p_source=>'COMCFG_PKG.OBTN_BANCO(:P251_CBU)',
  p_source_type=> 'FUNCTION',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
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
  p_id=>29245817616064418 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_FILTRO_CLASIFICADORES',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 290,
  p_item_plug_id => 29244311309040309+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'VIG',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Filtrado por:',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_RADIOGROUP',
  p_named_lov=> 'TIPO_FILTRADO_EST',
  p_lov=> '.'||to_char(13070007029497230 + wwv_flow_api.g_id_offset)||'.',
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
  p_attribute_01 => '3',
  p_attribute_02 => 'REDIRECT_SET_VALUE',
  p_attribute_04 => 'VERTICAL',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>32357607782577159 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_DOCUMENTACION_ALDIA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 300,
  p_item_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'begin  '||unistr('\000a')||
'  if (COMPRV_PKG.COMPRV_HABILITADO_COTIZAR_SN(p_comprv_id => :P251_ID'||unistr('\000a')||
'                                             ,p_comctt_id => null'||unistr('\000a')||
'                                             ,p_comrub_id => null)) = ''SI'' then'||unistr('\000a')||
'    return ''AL DIA'';'||unistr('\000a')||
'  else'||unistr('\000a')||
'    return ''DEBE'';'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;',
  p_item_default_type=> 'PLSQL_FUNCTION_BODY',
  p_prompt=>'Documentación:',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
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
  p_display_when=>'(COMPRV_PKG.COMPRV_HABILITADO_COTIZAR_SN(p_comprv_id => :P251_ID'||unistr('\000a')||
'                                        ,p_comctt_id => null'||unistr('\000a')||
'                                        ,p_comrub_id => null)) = ''SI''',
  p_display_when_type=>'PLSQL_EXPRESSION',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="color:green;font-weight:bold"',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
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
  p_id=>32359509217667615 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_DOCUMENTACION_DEBE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 310,
  p_item_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'begin  '||unistr('\000a')||
'  if (COMPRV_PKG.COMPRV_HABILITADO_COTIZAR_SN(p_comprv_id => :P251_ID'||unistr('\000a')||
'                                             ,p_comctt_id => null'||unistr('\000a')||
'                                             ,p_comrub_id => null)) = ''SI'' then'||unistr('\000a')||
'    return ''AL DIA'';'||unistr('\000a')||
'  else'||unistr('\000a')||
'    return ''DEBE'';'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;',
  p_item_default_type=> 'PLSQL_FUNCTION_BODY',
  p_prompt=>'Documentación:',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
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
  p_display_when=>'(COMPRV_PKG.COMPRV_HABILITADO_COTIZAR_SN(p_comprv_id => :P251_ID'||unistr('\000a')||
'                                             ,p_comctt_id => null'||unistr('\000a')||
'                                             ,p_comrub_id => null)) = ''NO''',
  p_display_when_type=>'SQL_EXPRESSION',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="color:red;font-weight:bold"    ',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
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
  p_id=>32378728859433378 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_COMOBD_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 320,
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
  p_id=>34713323161095289 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_MOTIVO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 270,
  p_item_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Motivo',
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
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
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
  p_id=>49844520709250815 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_COMPCT_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 290,
  p_item_plug_id => 12609930123772557+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Categoría:',
  p_source=>'COMPCT_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select nombre d, id r'||unistr('\000a')||
'from com_proveedores_cat_v'||unistr('\000a')||
'where id = :P251_COMPCT_ID;',
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
  p_display_when=>'declare'||unistr('\000a')||
'   cursor cr_comprt is'||unistr('\000a')||
'    select *'||unistr('\000a')||
'      from com_proveedores_tipos_v'||unistr('\000a')||
'     where id = :P251_COMPRT_ID;'||unistr('\000a')||
'   '||unistr('\000a')||
'v_comprt cr_comprt%rowtype;'||unistr('\000a')||
'begin'||unistr('\000a')||
'    '||unistr('\000a')||
'    open cr_comprt;'||unistr('\000a')||
'    fetch cr_comprt into v_comprt;'||unistr('\000a')||
'    close cr_comprt;'||unistr('\000a')||
''||unistr('\000a')||
'    if v_comprt.codigo = ''JUR'' then'||unistr('\000a')||
'		return true;'||unistr('\000a')||
'     else '||unistr('\000a')||
'      return false;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'end;',
  p_display_when_type=>'FUNCTION_BODY',
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'span style="font-weight:bold"',
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
  p_id=>58720614526594351 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_FILTRO_ESTADO3',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 330,
  p_item_plug_id => 51954210457021106+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'VIG',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Filtrado por :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_RADIOGROUP',
  p_named_lov=> 'TIPO_FILTRADO_EST',
  p_lov=> '.'||to_char(13070007029497230 + wwv_flow_api.g_id_offset)||'.',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'RIGHT-TOP',
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'N',
  p_attribute_01 => '4',
  p_attribute_02 => 'REDIRECT_SET_VALUE',
  p_attribute_04 => 'VERTICAL',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>75925302919747103 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_FILTRO_REGISTROS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 340,
  p_item_plug_id => 75921302404539212+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'VIG',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Filtro Registros',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_RADIOGROUP',
  p_named_lov=> 'TIPO_FILTRADO_EST',
  p_lov=> '.'||to_char(13070007029497230 + wwv_flow_api.g_id_offset)||'.',
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
  p_field_template=> 142039460324227115+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => '3',
  p_attribute_02 => 'REDIRECT_SET_VALUE',
  p_attribute_04 => 'VERTICAL',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>77204817942418387 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_COMRGP_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 350,
  p_item_plug_id => 75921302404539212+wwv_flow_api.g_id_offset,
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
  p_id=>77205006907469115 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_COMRGP_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 360,
  p_item_plug_id => 75921302404539212+wwv_flow_api.g_id_offset,
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
  p_id=>77308712332730185 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_COMPRG_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 370,
  p_item_plug_id => 75921302404539212+wwv_flow_api.g_id_offset,
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
  p_id=>77414604856748159 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 251,
  p_name=>'P251_COMECO_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 380,
  p_item_plug_id => 75921302404539212+wwv_flow_api.g_id_offset,
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

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 12618130358772622 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 251,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P251_SEGORG_ID not null',
  p_validation_sequence=> 20,
  p_validation => 'P251_SEGORG_ID',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Segorg Id debe tener algún valor.',
  p_associated_item=> 12613610214772613 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 34719726989247707 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 251,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P251_MOTIVO is not null',
  p_validation_sequence=> 30,
  p_validation => 'P251_MOTIVO',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#LABEL# debe tener algún valor.',
  p_always_execute=>'N',
  p_validation_condition=> 'BAJA',
  p_validation_condition_type=> 'REQUEST_EQUALS_CONDITION',
  p_associated_item=> 34713323161095289 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 13122402915334371 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 251,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Validar Tipo de Usuario',
  p_validation_sequence=> 40,
  p_validation => 'begin'||unistr('\000a')||
'  if (:P1_SEGUSU_TIPO <> ''PRV'') then'||unistr('\000a')||
'  	return ''Esta funcionalidad esta implementada solo para usuarios Registrados como Proveedores.'''||unistr('\000a')||
'  end if;'||unistr('\000a')||
'    return null;'||unistr('\000a')||
'end;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => '',
  p_always_execute=>'N',
  p_validation_condition=> 'FIRMA_DIGITAL',
  p_validation_condition_type=> 'REQUEST_EQUALS_CONDITION',
  p_only_for_changed_rows=> 'Y',
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 32388105167672321 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 251,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P251_COMOBD_ID',
  p_validation_sequence=> 50,
  p_validation => 'P251_COMOBD_ID',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Es nulo',
  p_always_execute=>'N',
  p_validation_condition=> 'COMOBD_BAJA',
  p_validation_condition_type=> 'REQUEST_EQUALS_CONDITION',
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 32378728859433378 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 77311226047830159 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 251,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P251_MOTIVO is not null',
  p_validation_sequence=> 60,
  p_validation => 'P251_MOTIVO',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Debe indicar un motivo.',
  p_always_execute=>'N',
  p_validation_condition=> 'SUS_COMRGP',
  p_validation_condition_type=> 'REQUEST_EQUALS_CONDITION',
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
p:=p||'IF :P251_OPERACIONES_HABILITADAS IS NULL THEN'||unistr('\000a')||
'   :P251_OPERACIONES_HABILITADAS := ''CONSULTA'';'||unistr('\000a')||
'END IF;'||unistr('\000a')||
'IF :P251_OPERACION IS NULL THEN'||unistr('\000a')||
'   :P251_OPERACION := ''CONSULTA'';'||unistr('\000a')||
'END IF;'||unistr('\000a')||
'IF :P251_FILTRO_DOMICILIOS IS NULL THEN'||unistr('\000a')||
'   :P251_FILTRO_DOMICILIOS := ''ACT'';'||unistr('\000a')||
'END IF;'||unistr('\000a')||
'IF :P251_FILTRO_RUBROS IS NULL THEN'||unistr('\000a')||
'   :P251_FILTRO_RUBROS := ''ACT'';'||unistr('\000a')||
'END IF;'||unistr('\000a')||
'IF :P251_FILTRO_ESTADO IS NULL THEN'||unistr('\000a')||
'   :P251_FILTRO_ESTADO := ';

p:=p||'''VIG'';'||unistr('\000a')||
'END IF;'||unistr('\000a')||
'IF :P251_FILTRO_ESTADO2 IS NULL THEN'||unistr('\000a')||
'   :P251_FILTRO_ESTADO2 := ''VAL'';'||unistr('\000a')||
'END IF;'||unistr('\000a')||
'IF :P251_FILTRO_RESPONSABLES IS NULL THEN'||unistr('\000a')||
'   :P251_FILTRO_RESPONSABLES := ''ACT'';'||unistr('\000a')||
'END IF;';

wwv_flow_api.create_page_process(
  p_id     => 12618800755772630 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 251,
  p_process_sequence=> 100,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AsignarOperacionDefault',
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
p:=p||'#OWNER#:COM_PROVEEDORES:P251_ID:ID';

wwv_flow_api.create_page_process(
  p_id     => 12618607895772627 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 251,
  p_process_sequence=> 200,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from COM_PROVEEDORES',
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
p:=p||'#OWNER#:COM_PROVEEDORES:P251_ID:ID|U';

wwv_flow_api.create_page_process(
  p_id     => 8802312422547522 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 251,
  p_process_sequence=> 100,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'DML_PROCESS_ROW',
  p_process_name=> 'Aplicar Cambios',
  p_process_sql_clob => p,
  p_process_error_message=> 'No se ha podido procesar la fila de la tabla COM_PROVEEDORES',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>8801028951495527 + wwv_flow_api.g_id_offset,
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
p:=p||'declare'||unistr('\000a')||
'   v_prev_estado varchar2(3);'||unistr('\000a')||
'begin'||unistr('\000a')||
'   --'||unistr('\000a')||
'   update COM_PROVEEDORES_DOC'||unistr('\000a')||
'   set SITUACION = ''BAJ'','||unistr('\000a')||
'       MOTIVO_SITUACION = :P251_MOTIVO'||unistr('\000a')||
'   where id = :P251_DOC_ID_ANULAR;'||unistr('\000a')||
'   --'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 15255310682945968 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 251,
  p_process_sequence=> 110,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'DarBajaDocumento',
  p_process_sql_clob => p,
  p_process_error_message=> 'El Documento no ha podido ser dado de baja.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'BAJA',
  p_process_when_type=>'REQUEST_EQUALS_CONDITION',
  p_process_success_message=> 'El Documento ha sido dado de baja con éxito.',
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
p:=p||'begin'||unistr('\000a')||
'  if :P1_SEGUSU_TIPO = ''PRV'' then'||unistr('\000a')||
'    OWA_UTIL.redirect_url(''f?p=&APP_ID.:685:&SESSION.::NO:685,686,687:P685_COMPRV_ID,P685_EDICION,P685_GENERAR_TRAMITE_SL:&P251_ID,NO,SI'');'||unistr('\000a')||
'  else'||unistr('\000a')||
'    OWA_UTIL.redirect_url(''f?p=&APP_ID.:251:&SESSION.::NO:::'');'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 13123617571371804 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 251,
  p_process_sequence=> 120,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Bifurcacion por Tipo Usuario',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=>'',
  p_process_when_type=>'NEVER',
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
p:=p||'begin'||unistr('\000a')||
'  update COM_OBJETOS_DOC comobd'||unistr('\000a')||
'  set    comobd.SITUACION = ''BAJ'''||unistr('\000a')||
'        ,comobd.FECHA_SITUACION = sysdate'||unistr('\000a')||
'        ,comobd.MOTIVO_SITUACION = :P251_MOTIVO'||unistr('\000a')||
'  where  comobd.ID = :P251_COMOBD_ID;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 32379122606466362 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 251,
  p_process_sequence=> 130,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'DarBajaDocumentoObjeto',
  p_process_sql_clob => p,
  p_process_error_message=> 'El Documento no ha podido ser dado de baja.',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=>'BAJA_COMOBD',
  p_process_when_type=>'REQUEST_EQUALS_CONDITION',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> 'El Documento ha sido dado de baja con éxito.',
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
'v_comprg com_proveedores_rgp%rowtype;'||unistr('\000a')||
'begin'||unistr('\000a')||
'    -- Asociar al proveedor al Registro elegido'||unistr('\000a')||
'	v_comprg.comprv_id    := :P251_ID;'||unistr('\000a')||
'    v_comprg.comrgp_id    := :P251_COMRGP_ID;'||unistr('\000a')||
'    v_comprg.vigencia_fch := sysdate;'||unistr('\000a')||
'    COMPRV_PKG.COMPRG_INS(p_comprg => v_comprg);'||unistr('\000a')||
'    -- Limpiar campo'||unistr('\000a')||
'    :P251_COMRGP_ID := null;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 77240903856070151 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 251,
  p_process_sequence=> 140,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Asociar Registro de Proveedores',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=>'ASOCIAR_REGISTRO',
  p_process_when_type=>'REQUEST_EQUALS_CONDITION',
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
p:=p||'begin'||unistr('\000a')||
'-- Dar de baja al proveedor en ese Registro '||unistr('\000a')||
'    update com_proveedores_rgp'||unistr('\000a')||
'    set validez_fch = sysdate'||unistr('\000a')||
'    where id = :P251_COMPRG_ID;'||unistr('\000a')||
'    -- Limpiar campo'||unistr('\000a')||
'    :P251_COMPRG_ID := null;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 77261025589445520 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 251,
  p_process_sequence=> 410,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Desasociar Registro de Proveedores',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=>'DESASOCIAR_REGISTRO',
  p_process_when_type=>'REQUEST_EQUALS_CONDITION',
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
p:=p||'begin'||unistr('\000a')||
'COMPRV_PKG.COMPRG_SUSPENDER (p_comprv_id => :P251_ID'||unistr('\000a')||
'							,p_comrgp_id => :P251_COMRGP_ID'||unistr('\000a')||
'                            ,p_motivo    => :P251_MOTIVO);'||unistr('\000a')||
'--'||unistr('\000a')||
':P251_COMRGP_ID := NULL;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 77303706980965090 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 251,
  p_process_sequence=> 420,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Suspender Proveedor en Registro',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=>'SUS_COMRGP',
  p_process_when_type=>'REQUEST_EQUALS_CONDITION',
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
p:=p||'begin'||unistr('\000a')||
'update com_proveedores_rgp'||unistr('\000a')||
'  set validez_fch = null'||unistr('\000a')||
'     ,motivo_situacion = :P251_MOTIVO'||unistr('\000a')||
'     ,situacion = ''VIG'''||unistr('\000a')||
' where id = :P251_COMPRG_ID;'||unistr('\000a')||
'--'||unistr('\000a')||
':P251_COMPRG_ID := NULL;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 77309120148744768 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 251,
  p_process_sequence=> 430,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Habilitar proveedor en Registro',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=>'HAB_COMRGP',
  p_process_when_type=>'REQUEST_EQUALS_CONDITION',
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
p:=p||'2643303687746645';

wwv_flow_api.create_page_process(
  p_id     => 2932709447383267 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 251,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'CargarDatosUsuario',
  p_process_sql_clob => 2643303687746645 + wwv_flow_api.g_id_offset,
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
p:=p||'2643130914745059';

wwv_flow_api.create_page_process(
  p_id     => 5724601957776889 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 251,
  p_process_sequence=> 20,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'CargarOrganizacionUsuario',
  p_process_sql_clob => 2643130914745059 + wwv_flow_api.g_id_offset,
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
p:=p||'2638809097738751';

wwv_flow_api.create_page_process(
  p_id     => 2932203083371998 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 251,
  p_process_sequence=> 30,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'InicializarAplicacion',
  p_process_sql_clob => 2638809097738751 + wwv_flow_api.g_id_offset,
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
p:=p||'2643509228748190';

wwv_flow_api.create_page_process(
  p_id     => 2932517974376340 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 251,
  p_process_sequence=> 40,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'CargarDatosAplicacion',
  p_process_sql_clob => 2643509228748190 + wwv_flow_api.g_id_offset,
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
p:=p||'1827920554893846';

wwv_flow_api.create_page_process(
  p_id     => 2932014726365870 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 251,
  p_process_sequence=> 50,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'InicializarTemaPorDefault',
  p_process_sql_clob => 1827920554893846 + wwv_flow_api.g_id_offset,
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
p:=p||'DECLARE'||unistr('\000a')||
'  cursor cr_etq (p_codigo IN VARCHAR2) IS'||unistr('\000a')||
'  SELECT VALOR'||unistr('\000a')||
'  FROM COM_ETIQUETAS_V'||unistr('\000a')||
'  WHERE CODIGO = p_codigo;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''PRV'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_PRV;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''RUB'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_RUB;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''CAT'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_CAT;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
' ';

p:=p||' OPEN cr_etq(p_codigo => ''CON'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_CON;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''PED'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_PED;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''PRO'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_PRO;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''TRP'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_TRP;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''ECC'');'||unistr('\000a')||
'  F';

p:=p||'ETCH cr_etq into :P1_COMETQ_ECC;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''COB'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_COB;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''CCL'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_CCL;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''COM'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_COM;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''OCM'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_OCM;'||unistr('\000a')||
'  C';

p:=p||'LOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''PRS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_PRS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  -- Singulares'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''PRVS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_PRVS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''RUBS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_RUBS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''CATS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_CATS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
' ';

p:=p||' --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''CONS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_CONS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''PEDS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_PEDS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''PROS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_PROS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''TRPS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_TRPS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo =';

p:=p||'> ''ECCS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_ECCS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''COBS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_COBS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''CCLS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_CCLS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''COMS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_COMS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''OCMS'');'||unistr('\000a')||
'  FETCH cr_etq in';

p:=p||'to :P1_COMETQ_OCMS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_etq(p_codigo => ''PRSS'');'||unistr('\000a')||
'  FETCH cr_etq into :P1_COMETQ_PRSS;'||unistr('\000a')||
'  CLOSE cr_etq;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  IF :P1_COMETQ_PRV IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_PRV :=''Proveedores'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_RUB IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_RUB :=''Rubros'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_CAT IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_CAT :=''Categorías Rubros'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_CON IS NULL ';

p:=p||'THEN'||unistr('\000a')||
'    :P1_COMETQ_CON :=''Entidades Contratantes'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_PED IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_PED :=''Pedidos de Compras'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_PRO IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_PRO :=''Productos'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_TRP IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_TRP :=''Tramites Proveedores'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_ECC IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_ECC :=''Categorías EC'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :';

p:=p||'P1_COMETQ_COB IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_COB :=''Objetos de Gastos'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_CCL IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_CCL :=''Clases Genéricas'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_COM IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_COM :=''Procesos de Compras'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_OCM IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_OCM :=''Ordenes de Compras'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_PRS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_PRS :=''Responsab';

p:=p||'les del Proveedor'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  -- Singulares'||unistr('\000a')||
'  IF :P1_COMETQ_PRVS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_PRVS :=''Proveedor'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_RUBS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_RUBS :=''Rubro'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_CATS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_CATS :=''Categoría Rubro'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_CONS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_CONS :=''Entidad Contratante'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_PEDS IS NU';

p:=p||'LL THEN'||unistr('\000a')||
'    :P1_COMETQ_PEDS :=''Pedido de Compra'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_PROS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_PROS :=''Producto'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_TRPS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_TRPS :=''Trámite Proveedor'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_ECCS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_ECCS :=''Categoría EC'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_COBS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_COBS :=''Objeto de Gasto'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1';

p:=p||'_COMETQ_CCLS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_CCLS :=''Clase Genérica'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_COMS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_COMS :=''Proceso de Compra'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_OCMS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_OCMS :=''Orden de Compra'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :P1_COMETQ_PRSS IS NULL THEN'||unistr('\000a')||
'    :P1_COMETQ_PRSS :=''Responsable del Proveedor'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 18069806685292882 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 251,
  p_process_sequence=> 100,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'SetearEtiquetasDefault',
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
p:=p||'DECLARE'||unistr('\000a')||
'  CURSOR cr_comprv IS'||unistr('\000a')||
'  SELECT COMPRE_ESTADO'||unistr('\000a')||
'        ,COMPRE_FECHA_VALIDEZ'||unistr('\000a')||
'  FROM COM_PROVEEDORES_V'||unistr('\000a')||
'  WHERE ID = :P251_ID;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  OPEN cr_comprv;'||unistr('\000a')||
'  FETCH cr_comprv INTO :P251_COMPRE_ESTADO, :P251_COMPRE_FECHA_VALIDEZ;'||unistr('\000a')||
'  CLOSE cr_comprv;'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 13496930492154163 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 251,
  p_process_sequence=> 110,
  p_process_point=> 'BEFORE_HEADER',
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
p:=p||'BEGIN'||unistr('\000a')||
'  SELECT SEGORG.ID SEGORG_ID'||unistr('\000a')||
'        ,SEGORG.CODIGO SEGORG_CODIGO'||unistr('\000a')||
'        ,SEGUSU.ID SEGUSU_ID'||unistr('\000a')||
'        ,:APP_ALIAS||'' - ''||SEGORG.CODIGO||'' - Conectado: ''||NVL(SEGPRS.NOMBRE,SUBSTR(SEGUSU.USUARIO,INSTR(SEGUSU.USUARIO,''.'',-1)+1))||'' (''||lower(SEGUSU.USUARIO)||'')'' USUARIO'||unistr('\000a')||
'  INTO  :P1_SEGORG_ID'||unistr('\000a')||
'      , :P1_SEGORG_CODIGO'||unistr('\000a')||
'      , :P1_SEGUSU_ID'||unistr('\000a')||
'      , :P1_USUARIO      '||unistr('\000a')||
'  FROM  SEG_USUARIOS SEGUSU';

p:=p||''||unistr('\000a')||
'      , SEG_ORGANIZACIONES SEGORG'||unistr('\000a')||
'      , SEG_PERSONAS SEGPRS'||unistr('\000a')||
'  WHERE SEGUSU.SEGORG_ID = SEGORG.ID'||unistr('\000a')||
'    AND SEGUSU.ID = SEGPRS.SEGUSU_ID(+)'||unistr('\000a')||
'   AND  SEGUSU.USUARIO = v(''APP_USER'');'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 18069629410290069 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 251,
  p_process_sequence=> 200,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Cargar datos Usuario',
  p_process_sql_clob => p,
  p_process_error_message=> 'Ud. no se encuentra autorizado para acceder a esta página.<br>'||unistr('\000a')||
'Para acceder debe ser un usuario registrado.<br>'||unistr('\000a')||
'Contactese con el Administrador del sistema para obtener su cuenta.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>':P1_SEGUSU_ID IS NULL',
  p_process_when_type=>'NEVER',
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
'  CURSOR cr_comecores IS'||unistr('\000a')||
'  SELECT COMCNR.COMECO_ID'||unistr('\000a')||
'        ,COMCNR.SEGORG_CODIGO||'' - ''||InitCap(COMCNR.COMECO_NOMBRE||'' - Conectado: ''||NVL(NVL(COMCNR.COMRES_NOMBRE,COMCNR.SEGPRS_NOMBRE),SUBSTR(COMCNR.SEGUSU_USUARIO,INSTR(COMCNR.SEGUSU_USUARIO,''.'',-1)+1)))'||unistr('\000a')||
'        ,COMCNR.COMECO_NOMBRE'||unistr('\000a')||
'  FROM  COM_CONTRATANTES_RES_V COMCNR'||unistr('\000a')||
'  WHERE COMCNR.SEGUSU_USUARIO = v(''APP_USER'')'||unistr('\000a')||
'    AND NVL(COMCNR.S';

p:=p||'ITUACION,''ACT'') = ''ACT'';'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
'  IF :P1_COMECO_ID IS NULL THEN'||unistr('\000a')||
'    OPEN cr_comecores;'||unistr('\000a')||
'    FETCH cr_comecores INTO :P1_COMECO_ID'||unistr('\000a')||
'                          , :P1_USUARIO      '||unistr('\000a')||
'                          , :P1_COMECO_NOMBRE;'||unistr('\000a')||
'    CLOSE cr_comecores;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'exception'||unistr('\000a')||
'  when others then'||unistr('\000a')||
'   null;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 18070014304295163 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 251,
  p_process_sequence=> 400,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ObtenerDatosConexion',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>':P1_COMRES_ID IS NULL',
  p_process_when_type=>'PLSQL_EXPRESSION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 251
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
