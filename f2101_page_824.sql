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
--   Date and Time:   17:10 Jueves Noviembre 10, 2016
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

PROMPT ...Remove page 824
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>824);
 
end;
/

 
--application/pages/page_00824
prompt  ...PAGE 824: Invitaciones cursadas - Detalle
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 824
 ,p_user_interface_id => 70527406842675 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'ADMINISTRACION'
 ,p_name => 'Invitaciones cursadas - Detalle'
 ,p_step_title => 'Invitaciones cursadas - Detalle'
 ,p_allow_duplicate_submissions => 'N'
 ,p_on_dup_submission_goto_url => 'f?p=&APP_ID.:2:&SESSION.:::::'
 ,p_step_sub_title => 'Invitaciones cursadas - Detalle'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 15952704619548666 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'CTISSERA'
 ,p_last_upd_yyyymmddhh24miss => '20161110170932'
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
' --'||unistr('\000a')||
' CURSOR cr_comcot IS'||unistr('\000a')||
' SELECT *     '||unistr('\000a')||
'   FROM COM_CONTRATACIONES_DET_V'||unistr('\000a')||
'  WHERE COMCON_ID = :P824_COMCON_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_comcot cr_comcot%rowtype;'||unistr('\000a')||
'  v_comcon COM_CONTRATACIONES%rowtype;'||unistr('\000a')||
'  --'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
' OPEN cr_comcot;'||unistr('\000a')||
' FETCH cr_comcot INTO v_comcot;'||unistr('\000a')||
' CLOSE cr_comcot;'||unistr('\000a')||
' --'||unistr('\000a')||
'-- COM_PKG.SET_COMCON(p_comcon_id => :P824_COMCON_ID);'||unistr('\000a')||
'-- COM_PKG.GET_COMCON(p_comcon => v_comcon);'||unistr('\000a')||
'-- COM_PKG.INI_COMCON;'||unistr('\000a')||
' --';

s:=s||''||unistr('\000a')||
' htp.print(''<table width="%100">'');'||unistr('\000a')||
' htp.print(''<tr><td> Número &P1_COMETQ_COMS. : <b>''||v_comcot.COMCON_CODIGO||''/''||v_comcot.COMPED_EJERCICIO||''</b></tr>'');'||unistr('\000a')||
' htp.print(''<tr><td>Tipo de &P1_COMETQ_COMS. : <b>''||v_comcot.COMCTT_NOMBRE||'' </b></td></tr>'');'||unistr('\000a')||
' htp.print(''<tr><td>Método de Adjudicación : <b>''||gral_pkg.obtn_cfgdes (''COM_CONTRATACIONES.METODO_ADJUDICACION'', v_comcot.COMCON_METODO_ADJUD';

s:=s||'ICACION)||'' </b></td></tr>'');'||unistr('\000a')||
' htp.print(''<tr><td>Estado &P1_COMETQ_COMS. : <b>''||v_comcot.COMCOE_ESTADO_DESC||''</b></td></tr>'');'||unistr('\000a')||
' htp.print(''<tr><td>&P1_COMETQ_PEDS. Expediente : <b>''||v_comcot.COMPED_EXPEDIENTE||''</b></td></tr>'');'||unistr('\000a')||
' if :P811_PRECIO_TESTIGO_SN = ''SI'' then'||unistr('\000a')||
'   htp.print(''<tr><td> Recuerde : <font color="red"><b>&P811_MENSAJE_PRECIO_TESTIGO.</b></font><br></td></tr>'');'||unistr('\000a')||
' end if;'||unistr('\000a')||
' if (';

s:=s||'v_comcot.comcon_prioridad = 0) then'||unistr('\000a')||
'   htp.print(''<tr><td>Prioridad: <span style="color:red"><b>''||GRAL_PKG.OBTN_CFGABR(''COM_CONTRATACIONES.PRIORIDAD'',v_comcot.comcon_prioridad)||''</b></span></td></tr>'');'||unistr('\000a')||
' else'||unistr('\000a')||
'   htp.print(''<tr><td>Prioridad: <b>''||GRAL_PKG.OBTN_CFGABR(''COM_CONTRATACIONES.PRIORIDAD'',v_comcot.comcon_prioridad)||''</b></td></tr>'');'||unistr('\000a')||
' end if;'||unistr('\000a')||
' htp.print(''</table>'');'||unistr('\000a')||
' :P824_COMCON_METO';

s:=s||'DO_ADJ := v_comcot.COMCON_METODO_ADJUDICACION;'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_plug (
  p_id=> 47316722865263447 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 824,
  p_plug_name=> 'Datos de la Evaluación',
  p_region_name=>'',
  p_region_attributes=> 'style="width:60%"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 90,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
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
s:=s||'select COMCOI.COMCON_ID'||unistr('\000a')||
'      ,COMCOI.COMPRV_ID'||unistr('\000a')||
'      ,COMPRV.CUIT   CUIT'||unistr('\000a')||
'      ,COMPRV.NOMBRE PROVEEDOR'||unistr('\000a')||
'      ,COMPRV.EMAIL  EMAIL'||unistr('\000a')||
'      ,decode(COMPRV_PKG.COMPRV_HABILITADO_COTIZAR_SN(p_comprv_id => COMCOI.COMPRV_ID'||unistr('\000a')||
'                                                     ,p_comrub_id => to_number(:P824_COMRUB_ID)                                                '||unistr('\000a')||
'                                      ';

s:=s||'               ,p_comctt_id => to_number(:P824_COMCTT_ID)),''SI'', ''<font color=green><b>AL DIA</b></font>'',''<a href="javascript:popUp2(''''f?p=&APP_ID.:636:&SESSION.::&DEBUG.:636:P636_COMPRV_ID,P636_COMRUB_ID,P636_COMCTT_ID:''||COMCOI.COMPRV_ID||'',&P824_COMRUB_ID.,&P824_COMCTT_ID.'''',800,610)"><font color=red><b>DEBE</b></font></a>'') HABILITADO_COTIZAR'||unistr('\000a')||
'      ,''<a href="javascript:popUp2(''''f?p=&APP_ID.:';

s:=s||'635:&SESSION.::&DEBUG.:635:P635_COMPRV_ID,P635_COMRUB_ID:''||COMCOI.COMPRV_ID||'',&P824_COMRUB_ID.'''',670,610)">'''||unistr('\000a')||
'       ||replace((COM_PKG.OBTN_REPUTACION_URL(P_COMRUB_ID=> :P824_COMRUB_ID'||unistr('\000a')||
'                  ,P_COMPRV_ID=> COMCOI.COMPRV_ID'||unistr('\000a')||
'                  ,P_FECHA_VIGENCIA => SYSDATE'||unistr('\000a')||
'                 ,P_COLOR_FONDO => ''G'')'||unistr('\000a')||
'                 ),''WORKSPACE_IMAGES.'',''#WORKSPACE_IMAGES#'')||''</a>'' REPUTAC';

s:=s||'ION'||unistr('\000a')||
'      ,replace((COM_PKG.OBTN_CATEG_DOM_URL(P_COMPRV_ID => COMCOI.COMPRV_ID'||unistr('\000a')||
'                                  ,P_COMPED_ID => :P824_COMPED_ID'||unistr('\000a')||
'                                  ,P_COLOR_FONDO => ''G'''||unistr('\000a')||
'        )),''WORKSPACE_IMAGES.'',''#WORKSPACE_IMAGES#'') CATEGORIZACION'||unistr('\000a')||
',case (COMPRV_PKG.COMPRV_RUBRO_SITUACION(p_comprv_id => COMCOI.COMPRV_ID'||unistr('\000a')||
'                                  ,p_comcon_id =>to_number';

s:=s||'(:P824_COMCON_ID))) '||unistr('\000a')||
'  when ''INVITADO'' then'||unistr('\000a')||
'       ''<font color="green"><b>INVITADO</b></font>''  '||unistr('\000a')||
' when ''INSCRIPTO'' then'||unistr('\000a')||
'       ''<font color="green"><b>INSCRIPTO</b></font>'' '||unistr('\000a')||
' when ''NO INSCRIPTO'' then'||unistr('\000a')||
'       ''<font color="red"><b>NO INSCRIPTO</b></font>'''||unistr('\000a')||
' else                                              '||unistr('\000a')||
'   ''''                                '||unistr('\000a')||
' end  INSCRIPTO_RUBRO_ABR'||unistr('\000a')||
'from com_contrataciones_inv c';

s:=s||'omcoi,'||unistr('\000a')||
'     com_proveedores        comprv'||unistr('\000a')||
'where comcoi.comprv_id = comprv.ID'||unistr('\000a')||
'  and comprv.segorg_id = seg_pkg.obtn_orgusu (NVL (v (''APP_USER''), USER))'||unistr('\000a')||
'  and comcoi.comcon_id = :P824_COMCON_ID'||unistr('\000a')||
'  and comcoi.SITUACION = ''ACT'''||unistr('\000a')||
'order by comprv.NOMBRE;';

wwv_flow_api.create_report_region (
  p_id=> 47327626200372740 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 824,
  p_name=> 'Invitaciones cursadas - ',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 160,
  p_region_attributes=>'style="width:95%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_condition_type=> 'NEVER',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '99999',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se ha encontrado ningún dato',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '99999',
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
  p_id=> 47329530027372748 + wwv_flow_api.g_id_offset,
  p_region_id=> 47327626200372740 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMCON_ID',
  p_column_display_sequence=> 1,
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
  p_id=> 47329601918372751 + wwv_flow_api.g_id_offset,
  p_region_id=> 47327626200372740 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 2,
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
  p_id=> 47333409720389664 + wwv_flow_api.g_id_offset,
  p_region_id=> 47327626200372740 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'CUIT',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Cuit',
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
  p_id=> 47333504145389664 + wwv_flow_api.g_id_offset,
  p_region_id=> 47327626200372740 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'PROVEEDOR',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Proveedor',
  p_use_as_row_header=> 'N',
  p_column_link=>'javascript:popupURL(''f?p=&APP_ID.:842:&SESSION.::&DEBUG.:842:P842_COMPRV_ID:#COMPRV_ID#'');',
  p_column_linktext=>'#PROVEEDOR#',
  p_column_link_attr=>'title="Ver Detalle del Proveedor"',
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
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 47333614972389664 + wwv_flow_api.g_id_offset,
  p_region_id=> 47327626200372740 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'EMAIL',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Email',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
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
  p_id=> 47333730901389665 + wwv_flow_api.g_id_offset,
  p_region_id=> 47327626200372740 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'HABILITADO_COTIZAR',
  p_column_display_sequence=> 8,
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 47333801215389665 + wwv_flow_api.g_id_offset,
  p_region_id=> 47327626200372740 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'REPUTACION',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Reputación',
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 47333918767389665 + wwv_flow_api.g_id_offset,
  p_region_id=> 47327626200372740 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'CATEGORIZACION',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Ubicación',
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 47334017936389665 + wwv_flow_api.g_id_offset,
  p_region_id=> 47327626200372740 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'INSCRIPTO_RUBRO_ABR',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Rubro',
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
  p_id=> 47504925435458095 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 824,
  p_plug_name=> 'Breadcrumb',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 142026170261227095+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(23718112710751696 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 142040566869227118+ wwv_flow_api.g_id_offset,
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
s:=s||'select COMCOI.COMCON_ID'||unistr('\000a')||
'      ,COMCOI.COMPRV_ID'||unistr('\000a')||
'      ,comcoi.COMPRV_CUIT   CUIT'||unistr('\000a')||
'      ,comcoi.COMPRV_NOMBRE PROVEEDOR'||unistr('\000a')||
'      ,comcoi.COMPRV_EMAIL  EMAIL'||unistr('\000a')||
''||unistr('\000a')||
'      ,decode(COMPRV_PKG.COMPRV_HABILITADO_COTIZAR_SN_2(p_comprv_id => COMCOI.COMPRV_ID'||unistr('\000a')||
'                                                       ,p_comprt_id => COMCOI.COMPRV_COMPRT_ID'||unistr('\000a')||
'                                                       ,p_comru';

s:=s||'b_id => to_number(:P824_COMRUB_ID)                                                '||unistr('\000a')||
'                                                       ,p_comctt_id => to_number(comcoi.COMCON_COMCTT_ID)'||unistr('\000a')||
'                                                       ,p_comcon_id => comcoi.comcon_id'||unistr('\000a')||
'                                                       ,p_compct_id => comcoi.COMPRV_COMPCT_ID ),''SI'', ''<font color=green><';

s:=s||'b>AL DIA</b></font>'',''<a href="javascript:popUp2(''''f?p=&APP_ID.:636:&SESSION.::&DEBUG.:636:P636_COMPRV_ID,P636_COMRUB_ID,P636_COMCTT_ID:''||COMCOI.COMPRV_ID||'',&P824_COMRUB_ID.,&P824_COMCTT_ID.'''',800,610)"><font color=red><b>DEBE</b></font></a>'') HABILITADO_COTIZAR'||unistr('\000a')||
''||unistr('\000a')||
'      ,''<a href="javascript:popUp2(''''f?p=&APP_ID.:635:&SESSION.::&DEBUG.:635:P635_COMPRV_ID,P635_COMRUB_ID:''||COMCOI.COMPRV_ID||'',&P82';

s:=s||'4_COMRUB_ID.'''',670,610)">'''||unistr('\000a')||
'       ||replace((COM_PKG.OBTN_REPUTACION_URL(P_COMRUB_ID      => :P824_COMRUB_ID'||unistr('\000a')||
'                                             ,P_COMPRV_ID      => COMCOI.COMPRV_ID'||unistr('\000a')||
'                                             ,P_FECHA_VIGENCIA => SYSDATE'||unistr('\000a')||
'                                             ,P_COLOR_FONDO    => ''G'')'||unistr('\000a')||
'                 ),''WORKSPACE_IMAGES.'',''#WORKSPACE_IMAGES#'')||''';

s:=s||'</a>'' REPUTACION'||unistr('\000a')||
''||unistr('\000a')||
'      ,replace((COM_PKG.OBTN_CATEG_DOM_URL(P_COMPRV_ID   => COMCOI.COMPRV_ID'||unistr('\000a')||
'                                          ,P_COMPED_ID   => comcot.comped_id --:P824_COMPED_ID'||unistr('\000a')||
'                                          ,P_COLOR_FONDO => ''G'''||unistr('\000a')||
'        )),''WORKSPACE_IMAGES.'',''#WORKSPACE_IMAGES#'') CATEGORIZACION'||unistr('\000a')||
''||unistr('\000a')||
',case (COMPRV_PKG.COMPRV_RUBRO_SITUACION(p_comprv_id => COMCOI.COMPRV_ID'||unistr('\000a')||
'    ';

s:=s||'                                    ,p_comcon_id => to_number(comcoi.COMCON_ID))) '||unistr('\000a')||
'  when ''INVITADO'' then'||unistr('\000a')||
'       ''<font color="green"><b>INVITADO</b></font>''  '||unistr('\000a')||
' when ''INSCRIPTO'' then'||unistr('\000a')||
'       ''<font color="green"><b>INSCRIPTO</b></font>'' '||unistr('\000a')||
' when ''NO INSCRIPTO'' then'||unistr('\000a')||
'       ''<font color="red"><b>NO INSCRIPTO</b></font>'''||unistr('\000a')||
' else                                              '||unistr('\000a')||
'   ''''                          ';

s:=s||'      '||unistr('\000a')||
' end  INSCRIPTO_RUBRO_ABR'||unistr('\000a')||
''||unistr('\000a')||
'from com_contrataciones_inv_v comcoi'||unistr('\000a')||
'   , com_contrataciones_det_v comcot'||unistr('\000a')||
'where comcot.comcon_id = comcoi.comcon_id'||unistr('\000a')||
'  and comcoi.SITUACION = ''ACT'''||unistr('\000a')||
'--  and comcoi.comprv_segorg_id = seg_pkg.obtn_orgusu (NVL (v (''APP_USER''), USER))'||unistr('\000a')||
'  and comcoi.comcon_id = :P824_COMCON_ID'||unistr('\000a')||
'order by comcoi.comprv_NOMBRE;';

wwv_flow_api.create_report_region (
  p_id=> 364994323508532421 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 824,
  p_name=> 'Invitaciones cursadas',
  p_region_name=>'',
  p_template=> 142027656270227099+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 170,
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
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '99999',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se ha encontrado ningún dato',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '99999',
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
  p_id=> 364994501752532476 + wwv_flow_api.g_id_offset,
  p_region_id=> 364994323508532421 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMCON_ID',
  p_column_display_sequence=> 1,
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
  p_id=> 364994620669532484 + wwv_flow_api.g_id_offset,
  p_region_id=> 364994323508532421 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 2,
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
  p_id=> 364994702704532484 + wwv_flow_api.g_id_offset,
  p_region_id=> 364994323508532421 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'CUIT',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Cuit',
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
  p_id=> 364994820639532484 + wwv_flow_api.g_id_offset,
  p_region_id=> 364994323508532421 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'PROVEEDOR',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Proveedor',
  p_use_as_row_header=> 'N',
  p_column_link=>'javascript:popupURL(''f?p=&APP_ID.:842:&SESSION.::&DEBUG.:842:P842_COMPRV_ID:#COMPRV_ID#'');',
  p_column_linktext=>'#PROVEEDOR#',
  p_column_link_attr=>'title="Ver Detalle del Proveedor"',
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 364994921213532484 + wwv_flow_api.g_id_offset,
  p_region_id=> 364994323508532421 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'EMAIL',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Email',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
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
  p_id=> 365060316720197590 + wwv_flow_api.g_id_offset,
  p_region_id=> 364994323508532421 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'HABILITADO_COTIZAR',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Documento',
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365010311001951521 + wwv_flow_api.g_id_offset,
  p_region_id=> 364994323508532421 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'REPUTACION',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Reputación',
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365002518458796162 + wwv_flow_api.g_id_offset,
  p_region_id=> 364994323508532421 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'CATEGORIZACION',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Ubicación',
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 365006308931846071 + wwv_flow_api.g_id_offset,
  p_region_id=> 364994323508532421 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'INSCRIPTO_RUBRO_ABR',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Rubro',
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
  p_column_comment=>'');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 47508909075571153 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 824,
  p_button_sequence=> 30,
  p_button_plug_id => 364994323508532421+wwv_flow_api.g_id_offset,
  p_button_name    => 'GESTIONAR_INVITACIONES',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Gestionar Invitaciones',
  p_button_position=> 'REGION_TEMPLATE_CHANGE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> ':P824_COMCON_ESTADO IN (''ACT'')',
  p_button_condition_type=> 'PLSQL_EXPRESSION',
  p_security_scheme => 29203617276666602+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 47316923404263453 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 824,
  p_button_sequence=> 20,
  p_button_plug_id => 47316722865263447+wwv_flow_api.g_id_offset,
  p_button_name    => 'Cancelar',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(142039853364227115+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cerrar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:window.close();',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>47508221551551636 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 824,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:825:&SESSION.::&DEBUG.::P825_COMCON_ID,P825_APP_ANTERIOR,P825_APP_ANTERIOR_PAG:&P824_COMCON_ID.,&APP_ID.,&APP_PAGE_ID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 510,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>47317130458263475 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 824,
  p_name=>'P824_COMCTT_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 47316722865263447+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'COMCON_ID : ',
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
  p_id=>47317330060263500 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 824,
  p_name=>'P824_COMPED_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 47316722865263447+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'COMCTZ_ID : ',
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
  p_id=>47325118999263531 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 824,
  p_name=>'P824_COMRUB_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 11363501650753082+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comprv Id',
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
  p_id=>47327425476367193 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 824,
  p_name=>'P824_COMCON_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 47316722865263447+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comcon Id',
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
  p_id=>47403719498153261 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 824,
  p_name=>'P824_COMCON_METODO_ADJ',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 47316722865263447+wwv_flow_api.g_id_offset,
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
  p_id=>47513512635964526 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 824,
  p_name=>'P824_COMCON_ESTADO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
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
 
---------------------------------------
-- ...updatable report columns for page 824
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
