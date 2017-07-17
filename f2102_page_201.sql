set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end;
/
 
 
--application/set_environment
prompt  APPLICATION 2102 - Compras - Portal Proveedores
--
-- Application Export:
--   Application:     2102
--   Name:            Compras - Portal Proveedores
--   Date and Time:   10:36 Jueves Noviembre 3, 2016
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
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,2102);
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
 
end;
/

PROMPT ...Remove page 201
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>201);
 
end;
/

 
--application/pages/page_00201
prompt  ...PAGE 201: Cotizaciones - Detalle
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 201
 ,p_user_interface_id => 71209302842675 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'ADMINISTRACION'
 ,p_name => 'Cotizaciones - Detalle'
 ,p_step_title => 'Cotizaciones - Detalle'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Cotizaciones - Detalle'
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
''||unistr('\000a')||
'<div id="AjaxLoading" style="display:none;">Se está consultando su situación Tributaria. Espere un momento por favor...<br />'||unistr('\000a')||
'   <img src="#IMAGE_PREFIX#processing3.gif" id="wait" />'||unistr('\000a')||
'</div> '
 ,p_autocomplete_on_off => 'ON'
 ,p_html_page_header => 
'<script language="JavaScript" type="text/javascript">'||unistr('\000a')||
'  htmldb_delete_message=''"ANULAR_CONFIRM_MSG"'';'||unistr('\000a')||
'  htmldb_cancel_message=''Se han cotizado Items con valor cero. Confirma que los proveerá en forma Gratuita ?'';'||unistr('\000a')||
'    '||unistr('\000a')||
'function html_Submit_Progress(pThis){   '||unistr('\000a')||
'  $x_Show(''AjaxLoading'');  '||unistr('\000a')||
'  $s("AjaxLoading",$x("AjaxLoading").innerHTML);'||unistr('\000a')||
'};'||unistr('\000a')||
'</script>'
 ,p_javascript_code => 
'function ModalForm(fila,id){'||unistr('\000a')||
'   '||unistr('\000a')||
'    $(''#P201_COMCZD_ID'').val(id).change();'||unistr('\000a')||
'    //$(''#P201_COMCZD_ID'').change();'||unistr('\000a')||
'    $(''#P201_ITEM_SELECCIONADO'').val(fila);'||unistr('\000a')||
'    '||unistr('\000a')||
'    $(''#ModalForm'').dialog({'||unistr('\000a')||
'         width:  550'||unistr('\000a')||
'        ,height: 350'||unistr('\000a')||
'        ,modal: true'||unistr('\000a')||
'        ,title: ''Asociar Objeto'''||unistr('\000a')||
'        ,buttons: {'||unistr('\000a')||
'        Aceptar: function() {'||unistr('\000a')||
'          $( this ).dialog( "close" );'||unistr('\000a')||
'        }'||unistr('\000a')||
'      }'||unistr('\000a')||
'      '||
'  ,close: function(){'||unistr('\000a')||
'            '||unistr('\000a')||
'            $(''#P201_COMCZD_ID'').val("");'||unistr('\000a')||
'            if( fila < 10 ){'||unistr('\000a')||
'                '||unistr('\000a')||
'                var fila1 ="#f03_000"+fila;'||unistr('\000a')||
'                '||unistr('\000a')||
'                $(fila1).val($(''#P201_MARCA'').val());'||unistr('\000a')||
'                //$(fila1).prop("readonly",true);'||unistr('\000a')||
'                '||unistr('\000a')||
'                '||unistr('\000a')||
'                var fila2 ="#f04_000"+fila;'||unistr('\000a')||
'                '||unistr('\000a')||
'                $'||
'(fila2).val($(''#P201_MODELO'').val());'||unistr('\000a')||
''||unistr('\000a')||
'                //$(fila1).prop("disabled",true);'||unistr('\000a')||
''||unistr('\000a')||
'                if (($(''#P201_MODELO'').val()!= "")||($(''#P201_MARCA'').val()!= "")){               	'||unistr('\000a')||
'                   $(fila1).prop("readonly",true);'||unistr('\000a')||
'                   $(fila2).prop("readonly",true)'||unistr('\000a')||
'                   $(fila1).focus();'||unistr('\000a')||
'                   $(fila2).focus();'||unistr('\000a')||
'               }'||unistr('\000a')||
''||unistr('\000a')||
'            }'||unistr('\000a')||
'   '||
'        else'||unistr('\000a')||
'           {'||unistr('\000a')||
'               var fila1 ="#f03_00"+fila;'||unistr('\000a')||
'               '||unistr('\000a')||
'               $(fila1).val($(''#P201_MARCA'').val());'||unistr('\000a')||
'               '||unistr('\000a')||
''||unistr('\000a')||
'               '||unistr('\000a')||
'               var fila2 ="#f04_00"+fila;'||unistr('\000a')||
'               '||unistr('\000a')||
'               $(fila2).val($(''#P201_MODELO'').val());'||unistr('\000a')||
'               '||unistr('\000a')||
'               if (($(''#P201_MODELO'').val()!= "")||($(''#P201_MARCA'').val()!= "")){               	'||unistr('\000a')||
'   '||
'                $(fila1).prop("readonly",true);'||unistr('\000a')||
'                   $(fila2).prop("readonly",true);'||unistr('\000a')||
'                   $(fila1).focus();'||unistr('\000a')||
'                   $(fila2).focus();'||unistr('\000a')||
'               }'||unistr('\000a')||
'           }'||unistr('\000a')||
'        }'||unistr('\000a')||
'    })'||unistr('\000a')||
'        '||unistr('\000a')||
'              '||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'function DarDeBaja(id){'||unistr('\000a')||
''||unistr('\000a')||
'    $(''#P201_COMCZO_ID'').val(id);'||unistr('\000a')||
'    $(''#P201_COMCZO_ID'').change();'||unistr('\000a')||
''||unistr('\000a')||
'}'
 ,p_javascript_code_onload => 
'if ($( "input[name=''btnAsociar'']" ).length > 0 && $("#P201_INSCRIPTO").val() == ''SI''){'||unistr('\000a')||
'  $( "input[name=''f03'']" ).each(function() {'||unistr('\000a')||
'    $( this ).prop("readonly",true);'||unistr('\000a')||
'  });'||unistr('\000a')||
'  $( "input[name=''f04'']" ).each(function() {'||unistr('\000a')||
'     $( this ).prop("readonly",true);'||unistr('\000a')||
'  });'||unistr('\000a')||
'}'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'IWEYLER'
 ,p_last_upd_yyyymmddhh24miss => '20160523133724'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'Indique <b>Precio Unitario, Marca y Modelo</b>.'||unistr('\000a')||
'El <b>Precio Unitario</b> debe incluir el IVA y permite hasta dos(2) dígitos decimales.<br>'||unistr('\000a')||
'Si presenta ofertas alternativas indique en el campo <b>Observaciones</b> de mas arriba la palabra <b>"Alternativa 1", 2, 3... etc</b>, según corresponda.<br>'||unistr('\000a')||
'<font color="red">Si existe más de una página de &P1_COMETQ_PRO. solicitados, oferte los que se muest';

s:=s||'ran en pantalla y <b>Confirme</b> <u>"antes"</u> de pasar al siguiente juego de datos</b></font>';

wwv_flow_api.create_page_plug (
  p_id=> 5099750789661696 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_plug_name=> 'IMPORTANTE',
  p_region_name=>'',
  p_region_attributes=> 'style="width:99%"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 2866830352748095+ wwv_flow_api.g_id_offset,
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
  p_plug_display_when_condition => 'COM_PKG.OBTN_COMCON_ESTADO(p_comcon_id => :P200_COMCON_ID'||unistr('\000a')||
'                          ,p_comprv_id => :P1_COMPRV_ID) = ''ABIERTO''',
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
  p_id=> 21280527680644271 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_plug_name=> 'Información de Auditoría',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 2862904472748093+ wwv_flow_api.g_id_offset,
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
  p_plug_display_condition_type => 'NEVER',
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
s:=s||'DECLARE'||unistr('\000a')||
'  CURSOR cr_comcon is'||unistr('\000a')||
'  SELECT COMCTT_NOMBRE'||unistr('\000a')||
'        ,COMCTT_ID'||unistr('\000a')||
'        ,CODIGO COMCON_CODIGO'||unistr('\000a')||
'        ,FECHA_INICIO_PROPUESTA FECHA_INICIO_PROPUESTA'||unistr('\000a')||
'        ,FECHA_FIN_PROPUESTA    FECHA_FIN_PROPUESTA'||unistr('\000a')||
'        ,FECHA_LIMITE_PREGUNTA  FECHA_LIMITE_PREGUNTA'||unistr('\000a')||
'        ,OBSERVACIONES  OBSERVACIONES'||unistr('\000a')||
'        ,COMCTT_PRECIO_TESTIGO_SN'||unistr('\000a')||
'        ,COMCTT_MENSAJE_PRV_SN'||unistr('\000a')||
'        ,COMCTT_MENSAJE_PRV'||unistr('\000a')||
'      ';

s:=s||'  ,COMCTT_TAMANIO_MAX_COMCZC        '||unistr('\000a')||
'  FROM COM_CONTRATACIONES_V'||unistr('\000a')||
'  WHERE ID = :P200_COMCON_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_comcon cr_comcon%ROWTYPE;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_comcon;'||unistr('\000a')||
'  FETCH cr_comcon INTO v_comcon;'||unistr('\000a')||
'  CLOSE cr_comcon;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  htp.print(''<table>'');'||unistr('\000a')||
'  htp.print(''<tr><td align="RIGHT">Proceso: </td>'||unistr('\000a')||
'                 <td><b><font color="red">''||v_comcon.COMCTT_NOMBRE||'' : ''||v_comcon.COMCON_CODIGO||''</b></td>';

s:=s||'</tr>'');'||unistr('\000a')||
'  htp.print(''<tr><td align="RIGHT">Inicio de Ofertas: </td>'||unistr('\000a')||
'    <td><b>''||v_comcon.FECHA_INICIO_PROPUESTA||''</b></td></tr>'');'||unistr('\000a')||
'  htp.print(''<tr><td align="RIGHT">Cierre de Ofertas: </td>'||unistr('\000a')||
'    <td><b>''||v_comcon.FECHA_FIN_PROPUESTA||''</b></td></tr>'');'||unistr('\000a')||
'  htp.print(''<tr><td align="RIGHT">Observaciones : </td>'||unistr('\000a')||
'    <td><b>''||v_comcon.OBSERVACIONES||''</b></td></tr>'');'||unistr('\000a')||
'  htp.print(''<tr><td align="';

s:=s||'RIGHT">Tamaño Max de Archivo Adjunto: </td><td><b>''||v_comcon.COMCTT_TAMANIO_MAX_COMCZC||'' Kb</b></td></tr>'');    '||unistr('\000a')||
'  :P201_PRECIO_TESTIGO_SN := v_comcon.COMCTT_PRECIO_TESTIGO_SN;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  if (v_comcon.COMCTT_PRECIO_TESTIGO_SN = ''SI'')'||unistr('\000a')||
'        and (v_comcon.COMCTT_MENSAJE_PRV_SN = ''SI'') then'||unistr('\000a')||
'      htp.print(''<tr><td align="RIGHT" align="TOP"><font color=RED>Recuerde :<br>  </font></td><td><font color=';

s:=s||'RED>''||v_comcon.COMCTT_MENSAJE_PRV||''.</font></td></tr>'');'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  htp.print(''</table>'');'||unistr('\000a')||
'  --'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_plug (
  p_id=> 21280731947644271 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_plug_name=> 'Datos de la Oferta',
  p_region_name=>'',
  p_region_attributes=> 'style="width:700px"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 2862618902748092+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
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
  p_id=> 21290836985649038 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_plug_name=> 'Ruta de Navegación',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 2861103529748090+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(51836110691216902 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 2875904658748101+ wwv_flow_api.g_id_offset,
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
s:=s||'select '||unistr('\000a')||
'  COMCZC.ID COMCZC_ID'||unistr('\000a')||
' ,COMCZC.COMCTZ_ID'||unistr('\000a')||
' ,COMCZC.COMDOC_ID'||unistr('\000a')||
' ,COMDOC.ID ID'||unistr('\000a')||
' ,COMDOC.COMDCT_ID'||unistr('\000a')||
' ,(case when INSTR(COMDOC.TIPO_ARCHIVO,''pdf'') > 0 then'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/download_pdf_32x24.gif">'''||unistr('\000a')||
'   when INSTR(COMDOC.TIPO_ARCHIVO,''excel'') > 0 then'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/download_csv_32x24.gif">'''||unistr('\000a')||
'   when INSTR(COMDOC.TIPO_ARCHIVO,''oct'') > 0 then'||unistr('\000a')||
'    ''<img src="#IMAGE_PRE';

s:=s||'FIX#ws/page_32x24.gif">'''||unistr('\000a')||
'   when INSTR(COMDOC.TIPO_ARCHIVO,''word'') > 0 then'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/download_rtf_32x24.gif">'''||unistr('\000a')||
'   when INSTR(COMDOC.TIPO_ARCHIVO,''plain'') > 0 then'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/page_32x24.gif">''    '||unistr('\000a')||
'   when INSTR(COMDOC.TIPO_ARCHIVO,''image'') > 0 then'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/chart_32x24.gif">''    '||unistr('\000a')||
'   else'||unistr('\000a')||
'    ''<img src="#IMAGE_PREFIX#ws/page_32x24.gi';

s:=s||'f">''    '||unistr('\000a')||
'   end) ICONO'||unistr('\000a')||
' ,(SELECT NOMBRE FROM COM_DOCUMENTOS_TIPOS WHERE ID = COMDOC.COMDCT_ID)TIPO'||unistr('\000a')||
' ,dbms_lob.getlength(COMDOC.DOCUMENTO) DOCUMENTO'||unistr('\000a')||
' ,COMDOC.NOMBRE_ARCHIVO'||unistr('\000a')||
' ,COMDOC.TIPO_ARCHIVO'||unistr('\000a')||
' ,COMCZC.FECHA'||unistr('\000a')||
'from COM_COTIZACIONES_DOC COMCZC,'||unistr('\000a')||
'     COM_DOCUMENTOS  COMDOC'||unistr('\000a')||
'where COMCZC.COMDOC_ID = COMDOC.ID'||unistr('\000a')||
'  and COMCZC.COMCTZ_ID = :P201_ID'||unistr('\000a')||
'order by COMCZC.fecha';

wwv_flow_api.create_report_region (
  p_id=> 21297743405764395 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_name=> 'Documentos de la Oferta',
  p_region_name=>'',
  p_template=> 2866205739748095+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 40,
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 2,
  p_display_point=> 'BODY_1',
  p_item_display_point=> 'BELOW',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'N',
  p_query_row_template=> 13,
  p_query_headings_type=> 'NO_HEADINGS',
  p_query_num_rows=> '99999',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se han adjuntado documentos a esta oferta.',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '99999',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
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
  p_id=> 21356430430624734 + wwv_flow_api.g_id_offset,
  p_region_id=> 21297743405764395 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COMCZC_ID',
  p_column_display_sequence=> 10,
  p_column_heading=> '',
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
  p_id=> 21356545715624734 + wwv_flow_api.g_id_offset,
  p_region_id=> 21297743405764395 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMCTZ_ID',
  p_column_display_sequence=> 11,
  p_column_heading=> '',
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
  p_id=> 21298250213764412 + wwv_flow_api.g_id_offset,
  p_region_id=> 21297743405764395 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMDOC_ID',
  p_column_display_sequence=> 4,
  p_column_heading=> '',
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
  p_id=> 21298349120764412 + wwv_flow_api.g_id_offset,
  p_region_id=> 21297743405764395 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 6,
  p_column_heading=> '',
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
  p_id=> 21298449515764412 + wwv_flow_api.g_id_offset,
  p_region_id=> 21297743405764395 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMDCT_ID',
  p_column_display_sequence=> 5,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'TEXT_FROM_LOV',
  p_named_lov=>21012137532280431 + wwv_flow_api.g_id_offset,
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'DOC_DOCUMENTOS',
  p_ref_column_name=> 'COMDCT_ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21298954022764413 + wwv_flow_api.g_id_offset,
  p_region_id=> 21297743405764395 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'ICONO',
  p_column_display_sequence=> 1,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
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
  p_id=> 21298146731764412 + wwv_flow_api.g_id_offset,
  p_region_id=> 21297743405764395 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'TIPO',
  p_column_display_sequence=> 7,
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21298627686764413 + wwv_flow_api.g_id_offset,
  p_region_id=> 21297743405764395 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'DOCUMENTO',
  p_column_display_sequence=> 9,
  p_column_heading=> '',
  p_column_format=> 'DOWNLOAD:COM_DOCUMENTOS:DOCUMENTO:ID::TIPO_ARCHIVO:NOMBRE_ARCHIVO:::attachment:Abrir Doc.',
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
  p_id=> 21297927178764407 + wwv_flow_api.g_id_offset,
  p_region_id=> 21297743405764395 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'NOMBRE_ARCHIVO',
  p_column_display_sequence=> 2,
  p_column_heading=> '',
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
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'DOC_DOCUMENTO',
  p_ref_column_name=> 'NOMBRE_ARCHIVO',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21298051884764412 + wwv_flow_api.g_id_offset,
  p_region_id=> 21297743405764395 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'TIPO_ARCHIVO',
  p_column_display_sequence=> 3,
  p_column_heading=> '',
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
  p_id=> 21298533299764412 + wwv_flow_api.g_id_offset,
  p_region_id=> 21297743405764395 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'FECHA',
  p_column_display_sequence=> 8,
  p_column_heading=> '',
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
s:=s||'select '||unistr('\000a')||
'"ID",'||unistr('\000a')||
'"ID" ID_DISPLAY,'||unistr('\000a')||
'"COMCTZ_ID",'||unistr('\000a')||
'"COMPED_ID",'||unistr('\000a')||
'"COMPET_ID",'||unistr('\000a')||
'"PRECIO_UNITARIO_FINAL",'||unistr('\000a')||
'"PRECIO_UNITARIO_FINAL"*"COMPET_CANTIDAD" PRECIO_FINAL_COTIZADO,'||unistr('\000a')||
'"MARCA",'||unistr('\000a')||
'"MODELO",'||unistr('\000a')||
'"OBSERVACION",'||unistr('\000a')||
'"EVALUACION",'||unistr('\000a')||
'"MOTIVO_EVALUACION",'||unistr('\000a')||
'"DATE_CREATED",'||unistr('\000a')||
'"CREATED_BY",'||unistr('\000a')||
'"DATE_MODIFIED",'||unistr('\000a')||
'"MODIFIED_BY",'||unistr('\000a')||
'"SEGORG_ID",'||unistr('\000a')||
'"COMCON_ID",'||unistr('\000a')||
'"COMPRV_ID",'||unistr('\000a')||
'"COMCTZ_CODIGO",'||unistr('\000a')||
'"COMCTZ_FECHA",'||unistr('\000a')||
'"COMCTZ_SITUACION",'||unistr('\000a')||
'"COMCTZ_SITUACION';

s:=s||'_DESC",'||unistr('\000a')||
'"COMPED_CODIGO",'||unistr('\000a')||
'"COMPED_FECHA_SOLICITUD",'||unistr('\000a')||
'"COMPED_COMECO_ID",'||unistr('\000a')||
'"COMPED_COMCOB_ID",'||unistr('\000a')||
'"COMPED_EJERCICIO",'||unistr('\000a')||
'"COMPED_CONTRATANTE",'||unistr('\000a')||
'"COMPED_SOLICITANTE",'||unistr('\000a')||
'"COMPED_DESCRIPCION",'||unistr('\000a')||
'"COMPED_CONTACTO",'||unistr('\000a')||
'"COMPED_COMDOM_ID",'||unistr('\000a')||
'"COMPED_TIPO_ENTREGA",'||unistr('\000a')||
'"COMPED_PLAZO_ENTREGA_CANTIDAD",'||unistr('\000a')||
'"COMPED_PLAZO_ENTREGA_UNIDAD",'||unistr('\000a')||
'"COMPED_FECHA_ENTREGA",'||unistr('\000a')||
'"COMPED_PERIODO_ENTREGA",'||unistr('\000a')||
'"COMPED_PRECIO",'||unistr('\000a')||
'"COMPED_PARTIDA_PRESUPUESTARIA';

s:=s||'",'||unistr('\000a')||
'"COMPED_EXPEDIENTE",'||unistr('\000a')||
'"COMPED_RESOLUCION",'||unistr('\000a')||
'"COMPED_OBSERVACIONES",'||unistr('\000a')||
'"COMPET_RENGLON",'||unistr('\000a')||
'"COMPET_COMCCL_ID",'||unistr('\000a')||
'"COMPET_COMCIT_ID",'||unistr('\000a')||
'"COMPET_CODIGO",'||unistr('\000a')||
'substr("COMPET_DESCRIPCION"||DECODE("COMPET_OBSERVACION", '''', '''', "COMPET_OBSERVACION"),1,2000) COMPET_DESCRIPCION,'||unistr('\000a')||
'"COMPET_CANTIDAD",'||unistr('\000a')||
'"COMPET_PRECIO_UNITARIO",'||unistr('\000a')||
'"COMPET_PRECIO_UNITARIO"*"COMPET_CANTIDAD" PRECIO_TOTAL_REFERENCIA,'||unistr('\000a')||
'"COMPET_OBSERVACION",'||unistr('\000a')||
'"COMP';

s:=s||'ET_SITUACION",'||unistr('\000a')||
'"COMPET_SITUACION_DESC",'||unistr('\000a')||
'   to_clob(''--- Detalle del Item ---'') || ''&#10;&#13;'' '||unistr('\000a')||
'   ||''Clase: '' ||(SELECT CODIGO||'' - ''||NOMBRE||''&#10;&#13;'''||unistr('\000a')||
'                  FROM COM_CATALOGO_CLASES '||unistr('\000a')||
'                  WHERE ID = "COMPET_COMCCL_ID")'||unistr('\000a')||
'  || ''Objeto: '' ||(SELECT CODIGO||'' - ''||NOMBRE||''&#10;&#13;'''||unistr('\000a')||
'                   FROM COM_CATALOGO_OBJETOS '||unistr('\000a')||
'                   WHERE ID = "COMPED_COMC';

s:=s||'OB_ID")'||unistr('\000a')||
'  || ''Descripción: '' || "COMPET_CODIGO"||'' - ''||"COMPET_DESCRIPCION" || ''&#10;&#13;'''||unistr('\000a')||
'  || ''Observación: '' || "COMPET_OBSERVACION" || ''&#10;&#13;'''||unistr('\000a')||
'  || ''--- Detalle del Pedido ---'' || ''&#10;&#13;'' '||unistr('\000a')||
'    || ''Solicitante: '' || "COMPED_CONTRATANTE" || ''&#10;&#13;'' '||unistr('\000a')||
'    || ''Lugar de entrega: '' || '||unistr('\000a')||
'          (SELECT DECODE(LOCALIDAD,'''','''',LOCALIDAD||'', '')'||unistr('\000a')||
'               || DECODE(DEPARTAMENTO,'''',';

s:=s||''''',DEPARTAMENTO||'', '')'||unistr('\000a')||
'               || PROVINCIA'||unistr('\000a')||
'           FROM COM_DOMICILIOS'||unistr('\000a')||
'           WHERE ID = "COMPED_COMDOM_ID") || ''&#10;&#13;''   '||unistr('\000a')||
'       || (SELECT DECODE(CALLE,'''','''',CALLE||'' '')'||unistr('\000a')||
'               || DECODE(NUMERO_CASA,'''','''',''Nro: ''||NUMERO_CASA||'' '')'||unistr('\000a')||
'               || DECODE(PISO,'''','''',''Piso: ''||PISO||'' '')'||unistr('\000a')||
'               || DECODE(DPTO,'''','''',''Dpto: ''||DPTO||'' '')'||unistr('\000a')||
'               || DECODE';

s:=s||'(OBSERVACION,'''','''',''(''||OBSERVACION||''). '')  '||unistr('\000a')||
'           FROM COM_DOMICILIOS'||unistr('\000a')||
'           WHERE ID = COMPED_COMDOM_ID) || ''&#10;&#13;'''||unistr('\000a')||
'    || ''Fecha Entrega: '' || "COMPED_FECHA_ENTREGA" || ''&#10;&#13;'''||unistr('\000a')||
'    || ''Contacto: '' || "COMPED_CONTACTO" || ''&#10;&#13;'' '||unistr('\000a')||
'    || ''Observaciones: '' || "COMPED_OBSERVACIONES" || ''&#10;&#13;'' HINT'||unistr('\000a')||
',''<input name="btnAsociar" type="button" id="''||ID||''" class="btnAsoci';

s:=s||'ar" onclick="ModalForm(#ROWNUM#,''||ID||'');void(0);" value="Asociar Objeto"> '' Asociar_Objeto'||unistr('\000a')||
'from "COM_COTIZACIONES_DETPRV_V"'||unistr('\000a')||
'where "COMCTZ_ID" = :P201_ID'||unistr('\000a')||
'  AND "COMPRV_ID" = :P1_COMPRV_ID'||unistr('\000a')||
'order by COMPET_RENGLON';

wwv_flow_api.create_report_region (
  p_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_name=> '&P1_COMETQ_PRO. solicitados (Edición)',
  p_region_name=>'',
  p_template=> 2862618902748092+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 50,
  p_region_attributes=>'style="width:99%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_2',
  p_item_display_point=> 'BELOW',
  p_source=> s,
  p_source_type=> 'UPDATABLE_SQL_QUERY',
  p_display_when_condition=> 'COM_PKG.OBTN_COMCON_ESTADO(p_comcon_id => :P200_COMCON_ID'||unistr('\000a')||
'                          ,p_comprv_id => :P1_COMPRV_ID) = ''ABIERTO''',
  p_display_condition_type=> 'PLSQL_EXPRESSION',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'N',
  p_rest_enabled=> 'N',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '9999',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se ha encontrado ningún dato.',
  p_query_num_rows_item=> 'P201_PAGINACION',
  p_query_num_rows_type=> 'ROW_RANGES_WITH_LINKS',
  p_query_row_count_max=> '9999',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_report_total_text_format=> 'Totales',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
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
  p_id=> 21458435791553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'HIDDEN',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source_type=> 'T',
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21458523729553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'ID_DISPLAY',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'ID_DISPLAY',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21458628576553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMCTZ_ID',
  p_column_display_sequence=> 14,
  p_column_heading=> 'Comctz Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMCTZ_ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21458745515553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_ID',
  p_column_display_sequence=> 15,
  p_column_heading=> 'Comped Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPED_ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21458845017553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_ID',
  p_column_display_sequence=> 16,
  p_column_heading=> 'Compet Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPET_ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21458946419553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'PRECIO_UNITARIO_FINAL',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Precio Unit.Cotizado',
  p_column_format=> '999999999999990D00',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'TEXT',
  p_lov_show_nulls=> 'NO',
  p_column_width=> '10',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'PRECIO_UNITARIO_FINAL',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21525026425712249 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'PRECIO_FINAL_COTIZADO',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Precio Tot.Cotizado',
  p_column_format=> 'FML999999999999990D00',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'Y',
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
  p_id=> 21459023475553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'MARCA',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Marca',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'TEXTAREA',
  p_lov_show_nulls=> 'NO',
  p_column_height=> '3',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'MARCA',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21459139590553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'MODELO',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Modelo',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'TEXTAREA',
  p_lov_show_nulls=> 'NO',
  p_column_height=> '5',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'MODELO',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21459253151553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'OBSERVACION',
  p_column_display_sequence=> 12,
  p_column_heading=> 'Observación',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'TEXT',
  p_lov_show_nulls=> 'NO',
  p_column_width=> '10',
  p_column_height=> '2',
  p_cattributes=> 'title="Este campo admite un máximo de 2000 caracteres. Si desea incorporar más detalles utilice la opción Adjuntar Documento a la oferta"',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'OBSERVACION',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21873530060047223 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'EVALUACION',
  p_column_display_sequence=> 53,
  p_column_heading=> 'Evaluacion',
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
  p_id=> 21873630677047226 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'MOTIVO_EVALUACION',
  p_column_display_sequence=> 54,
  p_column_heading=> 'Motivo Evaluacion',
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
  p_id=> 21459648298553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'DATE_CREATED',
  p_column_display_sequence=> 17,
  p_column_heading=> 'Date Created',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '7',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'DATE_CREATED',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21459745455553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
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
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'CREATED_BY',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21459849310553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 15,
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
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '7',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'DATE_MODIFIED',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21459925560553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 16,
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
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'MODIFIED_BY',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21460049071553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 17,
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
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'SEGORG_ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21460129644553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 18,
  p_form_element_id=> null,
  p_column_alias=> 'COMCON_ID',
  p_column_display_sequence=> 22,
  p_column_heading=> 'Comcon Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMCON_ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21460225685553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 19,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 23,
  p_column_heading=> 'Comprv Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPRV_ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21460350153553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 20,
  p_form_element_id=> null,
  p_column_alias=> 'COMCTZ_CODIGO',
  p_column_display_sequence=> 24,
  p_column_heading=> 'Comctz Codigo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMCTZ_CODIGO',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21460427176553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 21,
  p_form_element_id=> null,
  p_column_alias=> 'COMCTZ_FECHA',
  p_column_display_sequence=> 25,
  p_column_heading=> 'Comctz Fecha',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '7',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMCTZ_FECHA',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21460531298553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 22,
  p_form_element_id=> null,
  p_column_alias=> 'COMCTZ_SITUACION',
  p_column_display_sequence=> 26,
  p_column_heading=> 'Comctz Situacion',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '3',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMCTZ_SITUACION',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21460640741553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 23,
  p_form_element_id=> null,
  p_column_alias=> 'COMCTZ_SITUACION_DESC',
  p_column_display_sequence=> 27,
  p_column_heading=> 'Comctz Situacion Desc',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMCTZ_SITUACION_DESC',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21460726361553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 24,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_CODIGO',
  p_column_display_sequence=> 28,
  p_column_heading=> 'Comped Codigo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPED_CODIGO',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21460832052553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 25,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_FECHA_SOLICITUD',
  p_column_display_sequence=> 29,
  p_column_heading=> 'Comped Fecha Solicitud',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '7',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPED_FECHA_SOLICITUD',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21460941481553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 26,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_COMECO_ID',
  p_column_display_sequence=> 30,
  p_column_heading=> 'Comped Comeco Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPED_COMECO_ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21461025949553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 27,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_COMCOB_ID',
  p_column_display_sequence=> 31,
  p_column_heading=> 'Comped Comcob Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPED_COMCOB_ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21461144248553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 28,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_EJERCICIO',
  p_column_display_sequence=> 32,
  p_column_heading=> 'Comped Ejercicio',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPED_EJERCICIO',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21461225009553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 29,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_CONTRATANTE',
  p_column_display_sequence=> 33,
  p_column_heading=> 'Comped Contratante',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPED_CONTRATANTE',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21461351281553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 30,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_SOLICITANTE',
  p_column_display_sequence=> 34,
  p_column_heading=> 'Comped Solicitante',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPED_SOLICITANTE',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21461437841553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 31,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_DESCRIPCION',
  p_column_display_sequence=> 35,
  p_column_heading=> 'Comped Descripcion',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPED_DESCRIPCION',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21461545674553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 32,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_CONTACTO',
  p_column_display_sequence=> 36,
  p_column_heading=> 'Comped Contacto',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPED_CONTACTO',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21461628055553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 33,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_COMDOM_ID',
  p_column_display_sequence=> 37,
  p_column_heading=> 'Comped Comdom Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPED_COMDOM_ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21461744653553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 34,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_TIPO_ENTREGA',
  p_column_display_sequence=> 38,
  p_column_heading=> 'Comped Tipo Entrega',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '3',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPED_TIPO_ENTREGA',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21461852821553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 35,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_PLAZO_ENTREGA_CANTIDAD',
  p_column_display_sequence=> 39,
  p_column_heading=> 'Comped Plazo Entrega Cantidad',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPED_PLAZO_ENTREGA_CANTIDAD',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21461943350553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 36,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_PLAZO_ENTREGA_UNIDAD',
  p_column_display_sequence=> 40,
  p_column_heading=> 'Comped Plazo Entrega Unidad',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPED_PLAZO_ENTREGA_UNIDAD',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21462029336553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 37,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_FECHA_ENTREGA',
  p_column_display_sequence=> 41,
  p_column_heading=> 'Comped Fecha Entrega',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '7',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPED_FECHA_ENTREGA',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21462134851553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 38,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_PERIODO_ENTREGA',
  p_column_display_sequence=> 42,
  p_column_heading=> 'Comped Periodo Entrega',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPED_PERIODO_ENTREGA',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21462240316553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 39,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_PRECIO',
  p_column_display_sequence=> 43,
  p_column_heading=> 'Comped Precio',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPED_PRECIO',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21462351185553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 40,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_PARTIDA_PRESUPUESTARIA',
  p_column_display_sequence=> 44,
  p_column_heading=> 'Comped Partida Presupuestaria',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPED_PARTIDA_PRESUPUESTARIA',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21462453750553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 41,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_EXPEDIENTE',
  p_column_display_sequence=> 45,
  p_column_heading=> 'Comped Expediente',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPED_EXPEDIENTE',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21462541010553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 42,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_RESOLUCION',
  p_column_display_sequence=> 46,
  p_column_heading=> 'Comped Resolucion',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPED_RESOLUCION',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21462642898553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 43,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_OBSERVACIONES',
  p_column_display_sequence=> 47,
  p_column_heading=> 'Comped Observaciones',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPED_OBSERVACIONES',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21462723913553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 44,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_RENGLON',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Item',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPET_RENGLON',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21462837284553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 45,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_COMCCL_ID',
  p_column_display_sequence=> 48,
  p_column_heading=> 'Compet Comccl Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPET_COMCCL_ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21462948933553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 46,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_COMCIT_ID',
  p_column_display_sequence=> 50,
  p_column_heading=> 'Compet Comcit Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPET_COMCIT_ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21943629804607206 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 47,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_CODIGO',
  p_column_display_sequence=> 13,
  p_column_heading=> 'Compet Codigo',
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
  p_id=> 21463154838553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 48,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_DESCRIPCION',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Descripción',
  p_column_link=>'javascript:popupURL(''f?p=&APP_ID.:207:&SESSION.::&DEBUG.::P207_COMCZD_ID:#ID#'');',
  p_column_linktext=>'#COMPET_DESCRIPCION#',
  p_column_link_attr=>'title="#HINT#"',
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
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPET_DESCRIPCION',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21463244704553009 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 49,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_CANTIDAD',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Cnt.Solic.',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPET_CANTIDAD',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21463349239553010 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 50,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_PRECIO_UNITARIO',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Precio Testigo Unit.',
  p_column_format=> 'FML999999999999990D00',
  p_column_css_style=>'font-weight: bold',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_display_when_condition=> 'P201_PRECIO_TESTIGO_SN',
  p_display_when_condition2=> 'SI',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPET_PRECIO_UNITARIO',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21525151160712251 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 51,
  p_form_element_id=> null,
  p_column_alias=> 'PRECIO_TOTAL_REFERENCIA',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Precio Ref.Total',
  p_column_format=> 'FML999999999999990D00',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
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
  p_id=> 21463452991553010 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 52,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_OBSERVACION',
  p_column_display_sequence=> 49,
  p_column_heading=> 'Observacion',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPET_OBSERVACION',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21463548318553010 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 53,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_SITUACION',
  p_column_display_sequence=> 51,
  p_column_heading=> 'Compet Situacion',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '3',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPET_SITUACION',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21463643152553010 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 54,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_SITUACION_DESC',
  p_column_display_sequence=> 52,
  p_column_heading=> 'Compet Situacion Desc',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'SAAS',
  p_ref_table_name=> 'COM_COTIZACIONES_DET_V',
  p_ref_column_name=> 'COMPET_SITUACION_DESC',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 22048552090438034 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 55,
  p_form_element_id=> null,
  p_column_alias=> 'HINT',
  p_column_display_sequence=> 55,
  p_column_heading=> 'Hint',
  p_use_as_row_header=> 'N',
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
  p_id=> 38843111663352948 + wwv_flow_api.g_id_offset,
  p_region_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 56,
  p_form_element_id=> null,
  p_column_alias=> 'ASOCIAR_OBJETO',
  p_column_display_sequence=> 56,
  p_column_heading=> '<br>',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'EXISTS',
  p_display_when_condition=> 'select 1'||unistr('\000a')||
'from COM_PEDIDOS_V comped'||unistr('\000a')||
'    ,COM_CONTRATACIONES_DET_V comctt'||unistr('\000a')||
'    ,COM_CATALOGO_OBJETOS_V comcob'||unistr('\000a')||
'    ,COM_RUBCOB_V comrob'||unistr('\000a')||
'    ,COM_RUBROS_V comrub'||unistr('\000a')||
'where  COMPED.ID = COMCTT.COMPED_ID'||unistr('\000a')||
'and    comctt.COMCON_ID = :P200_COMCON_ID'||unistr('\000a')||
'and    comped.COMCOB_ID = comcob.ID'||unistr('\000a')||
'and    COMCOB.ID = COMROB.COMCOB_ID'||unistr('\000a')||
'and    COMROB.COMRUB_ID = comrub.ID'||unistr('\000a')||
'and    COMRUB.CONTIENE_OBJETOS_SN = ''SI'''||unistr('\000a')||
'and    SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => ''COMPRV_COMOBJ_VALIDAR_SN'',P_SEGORG_ID => :P1_SEGORG_ID) = ''SI'';'||unistr('\000a')||
'',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_inline_lov=> 'select comobj.CODIGO d,comobj.ID r'||unistr('\000a')||
'from COM_OBJETOS_V comobj'||unistr('\000a')||
'    ,COM_OBJETOS_EST_V comobe'||unistr('\000a')||
'where COMOBJ.COMOBE_ID = comobe.ID'||unistr('\000a')||
'and   comobj.COMPRV_ID = :P1_COMPRV_ID'||unistr('\000a')||
'and   comobe.ESTADO = ''HAB''',
  p_lov_show_nulls=> 'YES',
  p_lov_null_text=> '- SELECCIONAR OBJETO -',
  p_lov_null_value=> '-1',
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
s:=s||'select '||unistr('\000a')||
'"ID",'||unistr('\000a')||
'"ID" ID_DISPLAY,'||unistr('\000a')||
'"COMCTZ_ID",'||unistr('\000a')||
'"COMPED_ID",'||unistr('\000a')||
'"COMPET_ID",'||unistr('\000a')||
'"PRECIO_UNITARIO_FINAL",'||unistr('\000a')||
'"PRECIO_UNITARIO_FINAL"*"COMPET_CANTIDAD" PRECIO_FINAL_COTIZADO,'||unistr('\000a')||
'"MARCA",'||unistr('\000a')||
'"MODELO",'||unistr('\000a')||
'"OBSERVACION",'||unistr('\000a')||
'"EVALUACION",'||unistr('\000a')||
'"MOTIVO_EVALUACION",'||unistr('\000a')||
'"DATE_CREATED",'||unistr('\000a')||
'"CREATED_BY",'||unistr('\000a')||
'"DATE_MODIFIED",'||unistr('\000a')||
'"MODIFIED_BY",'||unistr('\000a')||
'"SEGORG_ID",'||unistr('\000a')||
'"COMCON_ID",'||unistr('\000a')||
'"COMPRV_ID",'||unistr('\000a')||
'"COMCTZ_CODIGO",'||unistr('\000a')||
'"COMCTZ_FECHA",'||unistr('\000a')||
'"COMCTZ_SITUACION",'||unistr('\000a')||
'"COMCTZ_SITUACION';

s:=s||'_DESC",'||unistr('\000a')||
'"COMPED_CODIGO",'||unistr('\000a')||
'"COMPED_FECHA_SOLICITUD",'||unistr('\000a')||
'"COMPED_COMECO_ID",'||unistr('\000a')||
'"COMPED_COMCOB_ID",'||unistr('\000a')||
'"COMPED_EJERCICIO",'||unistr('\000a')||
'"COMPED_CONTRATANTE",'||unistr('\000a')||
'"COMPED_SOLICITANTE",'||unistr('\000a')||
'"COMPED_DESCRIPCION",'||unistr('\000a')||
'"COMPED_CONTACTO",'||unistr('\000a')||
'"COMPED_COMDOM_ID",'||unistr('\000a')||
'"COMPED_TIPO_ENTREGA",'||unistr('\000a')||
'"COMPED_PLAZO_ENTREGA_CANTIDAD",'||unistr('\000a')||
'"COMPED_PLAZO_ENTREGA_UNIDAD",'||unistr('\000a')||
'"COMPED_FECHA_ENTREGA",'||unistr('\000a')||
'"COMPED_PERIODO_ENTREGA",'||unistr('\000a')||
'"COMPED_PRECIO",'||unistr('\000a')||
'"COMPED_PARTIDA_PRESUPUESTARIA';

s:=s||'",'||unistr('\000a')||
'"COMPED_EXPEDIENTE",'||unistr('\000a')||
'"COMPED_RESOLUCION",'||unistr('\000a')||
'"COMPED_OBSERVACIONES",'||unistr('\000a')||
'"COMPET_RENGLON",'||unistr('\000a')||
'"COMPET_COMCCL_ID",'||unistr('\000a')||
'"COMPET_COMCIT_ID",'||unistr('\000a')||
'"COMPET_CODIGO",'||unistr('\000a')||
'"COMPET_DESCRIPCION"||DECODE("COMPET_OBSERVACION", '''', '''', '||unistr('\000a')||
'                      '' OBS: ''||"COMPET_OBSERVACION") COMPET_DESCRIPCION,'||unistr('\000a')||
'"COMPET_CANTIDAD",'||unistr('\000a')||
'"COMPET_PRECIO_UNITARIO",'||unistr('\000a')||
'"COMPET_PRECIO_UNITARIO"*"COMPET_CANTIDAD" PRECIO_TOTAL_REFERENCIA,'||unistr('\000a')||
'"COMPET_O';

s:=s||'BSERVACION",'||unistr('\000a')||
'"COMPET_SITUACION",'||unistr('\000a')||
'"COMPET_SITUACION_DESC",'||unistr('\000a')||
'   to_clob(''--- Detalle del Item ---'') || ''&#10;&#13;'' '||unistr('\000a')||
'   ||''Clase: '' ||(SELECT CODIGO||'' - ''||NOMBRE||''&#10;&#13;'''||unistr('\000a')||
'                  FROM COM_CATALOGO_CLASES '||unistr('\000a')||
'                  WHERE ID = "COMPET_COMCCL_ID")'||unistr('\000a')||
'  || ''Objeto: '' ||(SELECT CODIGO||'' - ''||NOMBRE||''&#10;&#13;'''||unistr('\000a')||
'                   FROM COM_CATALOGO_OBJETOS '||unistr('\000a')||
'                   WHERE';

s:=s||' ID = "COMPED_COMCOB_ID")'||unistr('\000a')||
'  || ''Descripción: '' || "COMPET_CODIGO"||'' - ''||"COMPET_DESCRIPCION" || ''&#10;&#13;'''||unistr('\000a')||
'  || ''Observación: '' || "COMPET_OBSERVACION" || ''&#10;&#13;'''||unistr('\000a')||
'  || ''--- Detalle del Pedido ---'' || ''&#10;&#13;'' '||unistr('\000a')||
'    || ''Solicitante: '' || "COMPED_CONTRATANTE" || ''&#10;&#13;'' '||unistr('\000a')||
'    || ''Lugar de entrega: '' || '||unistr('\000a')||
'          (SELECT DECODE(LOCALIDAD,'''','''',LOCALIDAD||'', '')'||unistr('\000a')||
'               || DECOD';

s:=s||'E(DEPARTAMENTO,'''','''',DEPARTAMENTO||'', '')'||unistr('\000a')||
'               || PROVINCIA'||unistr('\000a')||
'           FROM COM_DOMICILIOS'||unistr('\000a')||
'           WHERE ID = "COMPED_COMDOM_ID") || ''&#10;&#13;''   '||unistr('\000a')||
'       || (SELECT DECODE(CALLE,'''','''',CALLE||'' '')'||unistr('\000a')||
'               || DECODE(NUMERO_CASA,'''','''',''Nro: ''||NUMERO_CASA||'' '')'||unistr('\000a')||
'               || DECODE(PISO,'''','''',''Piso: ''||PISO||'' '')'||unistr('\000a')||
'               || DECODE(DPTO,'''','''',''Dpto: ''||DPTO||'' '')'||unistr('\000a')||
'      ';

s:=s||'         || DECODE(OBSERVACION,'''','''',''(''||OBSERVACION||''). '')  '||unistr('\000a')||
'           FROM COM_DOMICILIOS'||unistr('\000a')||
'           WHERE ID = COMPED_COMDOM_ID) || ''&#10;&#13;'''||unistr('\000a')||
'    || ''Fecha Entrega: '' || "COMPED_FECHA_ENTREGA" || ''&#10;&#13;'''||unistr('\000a')||
'    || ''Contacto: '' || "COMPED_CONTACTO" || ''&#10;&#13;'' '||unistr('\000a')||
'    || ''Observaciones: '' || "COMPED_OBSERVACIONES" || ''&#10;&#13;'' HINT'||unistr('\000a')||
'from "COM_COTIZACIONES_DETPRV_V"'||unistr('\000a')||
'where "COMCTZ_ID" =';

s:=s||' :P201_ID'||unistr('\000a')||
'  AND "COMPRV_ID" = :P1_COMPRV_ID'||unistr('\000a')||
'order by COMPET_RENGLON';

wwv_flow_api.create_report_region (
  p_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_name=> '&P1_COMETQ_PRO. ofertados',
  p_region_name=>'',
  p_template=> 2862618902748092+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 40,
  p_region_attributes=>'style="width:99%"',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_2',
  p_item_display_point=> 'BELOW',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> 'COM_PKG.OBTN_COMCON_ESTADO(p_comcon_id => :P200_COMCON_ID'||unistr('\000a')||
'                          ,p_comprv_id => :P1_COMPRV_ID) <> ''ABIERTO''',
  p_display_condition_type=> 'PLSQL_EXPRESSION',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 13,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '9999',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se ha encontrado ningún dato',
  p_query_num_rows_item=> 'P201_PAGINACION',
  p_query_num_rows_type=> 'NEXT_PREVIOUS_LINKS',
  p_query_row_count_max=> '9999',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_report_total_text_format=> 'Totales',
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
  p_prn_page_header_alignment=> 'LEFT',
  p_prn_page_footer_alignment=> 'LEFT',
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
  p_id=> 21621724138363687 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
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
  p_id=> 21621850554363687 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'ID_DISPLAY',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Id Display',
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
  p_id=> 21621952166363687 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMCTZ_ID',
  p_column_display_sequence=> 13,
  p_column_heading=> 'Comctz Id',
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
  p_id=> 21622046946363687 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_ID',
  p_column_display_sequence=> 14,
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
  p_id=> 21622145417363687 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_ID',
  p_column_display_sequence=> 15,
  p_column_heading=> 'Compet Id',
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
  p_id=> 21622223634363687 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'PRECIO_UNITARIO_FINAL',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Precio Unit.Cotizado',
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
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '11',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21622354415363687 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'PRECIO_FINAL_COTIZADO',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Precio Tot.Cotizado',
  p_column_format=> 'FML999G999G999G999G990D00',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'Y',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '11',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21622454892363687 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'MARCA',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Marca',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '11',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21622526261363687 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'MODELO',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Modelo',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '11',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21622626765363687 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'OBSERVACION',
  p_column_display_sequence=> 12,
  p_column_heading=> 'Observación',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_cattributes=> 'title="Máximo 2000 catacteres. Para más detalles adjunte un Documento."',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '11',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21873854586049793 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'EVALUACION',
  p_column_display_sequence=> 50,
  p_column_heading=> 'Evaluacion',
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
  p_id=> 21873943597049793 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'MOTIVO_EVALUACION',
  p_column_display_sequence=> 51,
  p_column_heading=> 'Motivo Evaluacion',
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
  p_id=> 21623030281363687 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
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
  p_id=> 21623134477363687 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
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
  p_id=> 21623239434363687 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 15,
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
  p_id=> 21623344682363687 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 16,
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
  p_id=> 21623448501363687 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 17,
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
  p_id=> 21623534944363687 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 18,
  p_form_element_id=> null,
  p_column_alias=> 'COMCON_ID',
  p_column_display_sequence=> 21,
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
  p_id=> 21623640403363687 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 19,
  p_form_element_id=> null,
  p_column_alias=> 'COMPRV_ID',
  p_column_display_sequence=> 22,
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
  p_id=> 21623739184363687 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 20,
  p_form_element_id=> null,
  p_column_alias=> 'COMCTZ_CODIGO',
  p_column_display_sequence=> 23,
  p_column_heading=> 'Comctz Codigo',
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
  p_id=> 21623833519363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 21,
  p_form_element_id=> null,
  p_column_alias=> 'COMCTZ_FECHA',
  p_column_display_sequence=> 24,
  p_column_heading=> 'Comctz Fecha',
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
  p_id=> 21623948729363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 22,
  p_form_element_id=> null,
  p_column_alias=> 'COMCTZ_SITUACION',
  p_column_display_sequence=> 25,
  p_column_heading=> 'Comctz Situacion',
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
  p_id=> 21624042648363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 23,
  p_form_element_id=> null,
  p_column_alias=> 'COMCTZ_SITUACION_DESC',
  p_column_display_sequence=> 26,
  p_column_heading=> 'Comctz Situacion Desc',
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
  p_id=> 21624142419363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 24,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_CODIGO',
  p_column_display_sequence=> 27,
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
  p_id=> 21624230434363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 25,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_FECHA_SOLICITUD',
  p_column_display_sequence=> 28,
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
  p_id=> 21624333714363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 26,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_COMECO_ID',
  p_column_display_sequence=> 29,
  p_column_heading=> 'Comped Comeco Id',
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
  p_id=> 21624434775363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 27,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_COMCOB_ID',
  p_column_display_sequence=> 30,
  p_column_heading=> 'Comped Comcob Id',
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
  p_id=> 21624525111363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 28,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_EJERCICIO',
  p_column_display_sequence=> 31,
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
  p_id=> 21624635934363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 29,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_CONTRATANTE',
  p_column_display_sequence=> 32,
  p_column_heading=> 'Comped Contratante',
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
  p_id=> 21624733635363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 30,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_SOLICITANTE',
  p_column_display_sequence=> 33,
  p_column_heading=> 'Comped Solicitante',
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
  p_id=> 21624855163363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 31,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_DESCRIPCION',
  p_column_display_sequence=> 34,
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
  p_id=> 21624926109363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 32,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_CONTACTO',
  p_column_display_sequence=> 35,
  p_column_heading=> 'Comped Contacto',
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
  p_id=> 21625034361363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 33,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_COMDOM_ID',
  p_column_display_sequence=> 36,
  p_column_heading=> 'Comped Comdom Id',
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
  p_id=> 21625126930363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 34,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_TIPO_ENTREGA',
  p_column_display_sequence=> 37,
  p_column_heading=> 'Comped Tipo Entrega',
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
  p_id=> 21625255257363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 35,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_PLAZO_ENTREGA_CANTIDAD',
  p_column_display_sequence=> 38,
  p_column_heading=> 'Comped Plazo Entrega Cantidad',
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
  p_id=> 21625335955363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 36,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_PLAZO_ENTREGA_UNIDAD',
  p_column_display_sequence=> 39,
  p_column_heading=> 'Comped Plazo Entrega Unidad',
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
  p_id=> 21625446373363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 37,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_FECHA_ENTREGA',
  p_column_display_sequence=> 40,
  p_column_heading=> 'Comped Fecha Entrega',
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
  p_id=> 21625550590363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 38,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_PERIODO_ENTREGA',
  p_column_display_sequence=> 41,
  p_column_heading=> 'Comped Periodo Entrega',
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
  p_id=> 21625651435363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 39,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_PRECIO',
  p_column_display_sequence=> 42,
  p_column_heading=> 'Comped Precio',
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
  p_id=> 21625736154363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 40,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_PARTIDA_PRESUPUESTARIA',
  p_column_display_sequence=> 43,
  p_column_heading=> 'Comped Partida Presupuestaria',
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
  p_id=> 21625841746363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 41,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_EXPEDIENTE',
  p_column_display_sequence=> 44,
  p_column_heading=> 'Comped Expediente',
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
  p_id=> 21625936840363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 42,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_RESOLUCION',
  p_column_display_sequence=> 45,
  p_column_heading=> 'Comped Resolucion',
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
  p_id=> 21626031947363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 43,
  p_form_element_id=> null,
  p_column_alias=> 'COMPED_OBSERVACIONES',
  p_column_display_sequence=> 47,
  p_column_heading=> 'Comped Observaciones',
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
  p_id=> 21626133400363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 44,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_RENGLON',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Item',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
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
  p_id=> 21626242950363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 45,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_COMCCL_ID',
  p_column_display_sequence=> 46,
  p_column_heading=> 'Compet Comccl Id',
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
  p_id=> 21626329283363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 46,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_COMCIT_ID',
  p_column_display_sequence=> 48,
  p_column_heading=> 'Compet Comcit Id',
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
  p_id=> 21626452083363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 47,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_CODIGO',
  p_column_display_sequence=> 49,
  p_column_heading=> 'Código',
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
  p_id=> 21626542655363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 48,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_DESCRIPCION',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Descripción',
  p_column_link=>'javascript:popupURL(''f?p=&APP_ID.:207:&SESSION.::&DEBUG.::P207_COMCZD_ID:#ID#'');',
  p_column_linktext=>'#COMPET_DESCRIPCION#',
  p_column_link_attr=>'title="#HINT#"',
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
  p_print_col_width=> '11',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21626641659363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 49,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_CANTIDAD',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Cnt.Solicit.',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_print_col_width=> '11',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21626752478363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 50,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_PRECIO_UNITARIO',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Precio Testigo Unit.',
  p_column_format=> 'FML999G999G999G999G990D00',
  p_column_css_style=>'font-weight: bold',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_display_when_condition=> 'P201_PRECIO_TESTIGO_SN',
  p_display_when_condition2=> 'SI',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '11',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21626849588363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 51,
  p_form_element_id=> null,
  p_column_alias=> 'PRECIO_TOTAL_REFERENCIA',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Precio Ref.Total',
  p_column_format=> 'FML999G999G999G999G990D00',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
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
  p_print_col_width=> '11',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21626954941363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 52,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_OBSERVACION',
  p_column_display_sequence=> 53,
  p_column_heading=> 'Observación',
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
  p_id=> 21627054841363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 53,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_SITUACION',
  p_column_display_sequence=> 54,
  p_column_heading=> 'Compet Situacion',
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
  p_id=> 21627139439363688 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 54,
  p_form_element_id=> null,
  p_column_alias=> 'COMPET_SITUACION_DESC',
  p_column_display_sequence=> 55,
  p_column_heading=> 'Compet Situacion Desc',
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
  p_id=> 22038340148335307 + wwv_flow_api.g_id_offset,
  p_region_id=> 21621440367363684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 55,
  p_form_element_id=> null,
  p_column_alias=> 'HINT',
  p_column_display_sequence=> 52,
  p_column_heading=> 'Hint',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
'  if :P1_COMPRV_ESTADO in (''BAJ'',''SUS'') then'||unistr('\000a')||
'     htp.print(''<font color=RED><b>ADVERTENCIA:</b><br>Sr. Proveedor usted se encuentra <b>''||:P1_COMPRV_ESTADO_ABR||''</b> por "''||:P1_COMPRV_ESTADO_MOTIVO||''" no pudiendo operar en su registro, debe contactarse con el Registro de Proveedores del Estado para más información.<br>'');'||unistr('\000a')||
'     htp.print(:P1_COMPRV_ESTADO_ABR||'' desde ''||:P1_COMPRV_E';

s:=s||'STADO_FECHA_VIG); '||unistr('\000a')||
'     if :P1_COMPRV_ESTADO_MOTIVO = ''SUS'' then'||unistr('\000a')||
'        htp.print('' hasta ''||:P1_COMPRV_ESTADO_FECHA_VAL); '||unistr('\000a')||
'     end if;'||unistr('\000a')||
'  else   '||unistr('\000a')||
'    if :P200_ADEUDA_DOCUMENTACION_SN = ''SI'' then'||unistr('\000a')||
'      if :P200_ADVERTIR_COTIZAR_SN = ''SI'' and :P200_BLOQUEAR_COTIZAR_SN = ''NO'' then'||unistr('\000a')||
'       htp.print(''<font color=RED><b>ADVERTENCIA:</b><br>Tiene Documentación Vencida y/o No Presentada y es Necesaria p';

s:=s||'ara Cotizar. Recuerde que si no presenta esta documentación no podrá COTIZAR este tipo de llamados. Ingrese a su Registro e incorpórela en forma online presentando el original en Compras en caso de ser necesario.</font>'');'||unistr('\000a')||
'        elsif :P200_BLOQUEAR_COTIZAR_SN = ''SI'' then'||unistr('\000a')||
'         htp.print(''<font color=RED>ATENCION:<br>Tiene Documentación Vencida y/o No Presentada y es Necesaria para Cotizar. R';

s:=s||'ecuerde que si no presenta esta documentación no será invitado a futuros llamados de este tipo. Ingrese a su Registro e incoporela en forma online presentando el original en Compras en caso de ser necesario.</font>'');'||unistr('\000a')||
'       end if;  '||unistr('\000a')||
'       --'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    if :P1_ADEUDA_DPIP_SN = ''SI'' then'||unistr('\000a')||
'                 htp.print(''<br><font color=RED><br><b>Consulta en linea DPIP:</b> Ud registra deu';

s:=s||'da vencida en Dirección Provincial de Ingresos Públicos. Regularice esta situación para poder cotizar.</font><br><br>'');        '||unistr('\000a')||
'    end if;'||unistr('\000a')||
'     -- '||unistr('\000a')||
'    if COMPRV_PKG.COMPRV_RUBRO_SITUACION(p_comprv_id => :P1_COMPRV_ID'||unistr('\000a')||
'                                     ,p_comcon_id =>to_number(:P200_COMCON_ID)) = ''NO INSCRIPTO'' then'||unistr('\000a')||
'         htp.print(''<br><font color=RED><b>ATENCION:</b> Ud no se encuentra In';

s:=s||'scripto en la Especialidad o se ha DADO DE BAJA en la misma luego del inicio del llamado a cotizar. Regularice esta situación para poder cotizar.</font><br><br>'');   '||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    --'||unistr('\000a')||
'  end if;  '||unistr('\000a')||
''||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 32481910622386028 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_plug_name=> 'Avisos Importantes',
  p_region_name=>'',
  p_region_attributes=> 'style="width:700px"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 2863228104748093+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'FUNCTION_BODY',
  p_plug_display_when_condition => 'if :P1_COMPRV_ESTADO in (''BAJ'',''SUS'') '||unistr('\000a')||
'  or :P200_ADEUDA_DOCUMENTACION_SN = ''SI'''||unistr('\000a')||
'  or :P1_ADEUDA_DPIP_SN = ''SI'''||unistr('\000a')||
'  or COMPRV_PKG.COMPRV_RUBRO_SITUACION(p_comprv_id => :P1_COMPRV_ID'||unistr('\000a')||
'                                      ,p_comcon_id =>to_number(:P200_COMCON_ID)) = ''NO INSCRIPTO'' then'||unistr('\000a')||
'   return TRUE;'||unistr('\000a')||
'else'||unistr('\000a')||
'   return false;'||unistr('\000a')||
'end if;',
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
  p_id=> 39046119415593854 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_plug_name=> 'Asociar Objeto',
  p_region_name=>'ModalForm',
  p_region_attributes=> 'style="display:none; width: 550px;"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 2863823785748093+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 60,
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
s:=s||'select comczo.ID'||unistr('\000a')||
'      ,comczo.COMCZD_ID'||unistr('\000a')||
'      ,comczo.COMOBJ_ID'||unistr('\000a')||
'      ,comobj.DESCRIPCION'||unistr('\000a')||
'      ,comczo.OFERTA'||unistr('\000a')||
'      ,comczo.SITUACION'||unistr('\000a')||
'      ,gral_pkg.obtn_cfgabr(''COM_COTIZACIONES_DET_OBJ.OFERTA'',comczo.OFERTA) OFERTA_ABR'||unistr('\000a')||
'      ,comczo.OBSERVACION'||unistr('\000a')||
'      ,''<a href="#" onclick="DarDeBaja(''||comczo.ID||'')" name="Eliminar" id="''||comczo.ID||''" title="Eliminar" ><img src="#WORKSPACE_IMAGES#delete2.pn';

s:=s||'g"> </img></a>'' Elminar'||unistr('\000a')||
'from COM_COTIZACIONES_DET_OBJ comczo'||unistr('\000a')||
'     ,COM_OBJETOS comobj'||unistr('\000a')||
'where comobj.ID = comczo.COMOBJ_ID '||unistr('\000a')||
'and comczo.COMCZD_ID = :P201_COMCZD_ID'||unistr('\000a')||
'and comczo.SITUACION = ''VAL'''||unistr('\000a')||
'order by OFERTA';

wwv_flow_api.create_report_region (
  p_id=> 39242632590430578 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_name=> '&P201_COMOBJ_NOMBRE. Asociados',
  p_region_name=>'',
  p_parent_plug_id=>39046119415593854 + wwv_flow_api.g_id_offset,
  p_template=> 2865013037748095+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 70,
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
  p_ajax_items_to_submit=> 'P201_COMCZD_ID',
  p_query_row_template=> 2868300063748098+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No se han encontrado datos.',
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
  p_id=> 39242924927430635 + wwv_flow_api.g_id_offset,
  p_region_id=> 39242632590430578 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 1,
  p_column_heading=> '<br>',
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
  p_id=> 39243027853430639 + wwv_flow_api.g_id_offset,
  p_region_id=> 39242632590430578 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COMCZD_ID',
  p_column_display_sequence=> 2,
  p_column_heading=> 'COMCZD_ID',
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
  p_id=> 39243104432430639 + wwv_flow_api.g_id_offset,
  p_region_id=> 39242632590430578 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMOBJ_ID',
  p_column_display_sequence=> 3,
  p_column_heading=> 'COMOBJ_ID',
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
  p_id=> 39419118769432160 + wwv_flow_api.g_id_offset,
  p_region_id=> 39242632590430578 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'DESCRIPCION',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Descripción',
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
  p_id=> 39243221844430639 + wwv_flow_api.g_id_offset,
  p_region_id=> 39242632590430578 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'OFERTA',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Oferta',
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
  p_id=> 39243308662430639 + wwv_flow_api.g_id_offset,
  p_region_id=> 39242632590430578 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'SITUACION',
  p_column_display_sequence=> 7,
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
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 39457512458010848 + wwv_flow_api.g_id_offset,
  p_region_id=> 39242632590430578 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'OFERTA_ABR',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Oferta',
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
  p_id=> 39243406092430639 + wwv_flow_api.g_id_offset,
  p_region_id=> 39242632590430578 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'OBSERVACION',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Observación',
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
  p_id=> 39285617710716459 + wwv_flow_api.g_id_offset,
  p_region_id=> 39242632590430578 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'ELMINAR',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Quitar',
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
  p_id             => 21299148970764415 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 201,
  p_button_sequence=> 70,
  p_button_plug_id => 21297743405764395+wwv_flow_api.g_id_offset,
  p_button_name    => 'ADJUNTAR_DOCUMENTOS',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(2875100477748101+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Adjuntar Documento',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> 'f?p=&APP_ID.:202:&SESSION.::&DEBUG.:202:P202_COMCTZ_ID:&P201_ID.',
  p_button_condition=> 'if (COM_PKG.OBTN_COMCON_PERIODO_ACLARAC_SN(p_segorg_id => :P1_SEGORG_ID'||unistr('\000a')||
'                                      ,p_comcon_id => :P200_COMCON_ID) = ''SI'' )'||unistr('\000a')||
'and (:P1_COMPRV_ESTADO not in (''BAJ'',''SUS'') '||unistr('\000a')||
'  and :P200_ADEUDA_DOCUMENTACION_SN = ''NO'''||unistr('\000a')||
'  and :P1_ADEUDA_DPIP_SN = ''NO'')'||unistr('\000a')||
'  /*and COMPRV_PKG.COMPRV_RUBRO_SITUACION(p_comprv_id => :P1_COMPRV_ID'||unistr('\000a')||
'                                      ,p_comcon_id =>to_number(:P200_COMCON_ID)) <> ''NO INSCRIPTO'') se comenta según incidencia 31605*/'||unistr('\000a')||
' then'||unistr('\000a')||
'   return TRUE;'||unistr('\000a')||
'else'||unistr('\000a')||
'   return false;'||unistr('\000a')||
'end if;',
  p_button_condition_type=> 'FUNCTION_BODY',
  p_button_comment=>'COM_PKG.OBTN_COMCON_ESTADO(p_comcon_id => :P200_COMCON_ID'||unistr('\000a')||
'                          ,p_comprv_id => :P1_COMPRV_ID) = ''ABIERTO''',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 21281128261644274 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 201,
  p_button_sequence=> 10,
  p_button_plug_id => 21280731947644271+wwv_flow_api.g_id_offset,
  p_button_name    => 'CERRAR',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(2875100477748101+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Retornar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:201:P200_MUESTRO_MSJ_SN:NO',
  p_button_condition=> 'COM_PKG.OBTN_COMCON_ESTADO(p_comcon_id => :P200_COMCON_ID'||unistr('\000a')||
'                          ,p_comprv_id => :P1_COMPRV_ID) = ''ABIERTO''',
  p_button_condition_type=> 'PLSQL_EXPRESSION',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 5129647109788201 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 201,
  p_button_sequence=> 20,
  p_button_plug_id => 21280731947644271+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCELAR',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(2875100477748101+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Retornar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:200:&SESSION.::&DEBUG.::P200_MUESTRO_MSJ_SN:NO',
  p_button_condition=> 'COM_PKG.OBTN_COMCON_ESTADO(p_comcon_id => :P200_COMCON_ID'||unistr('\000a')||
'                          ,p_comprv_id => :P1_COMPRV_ID) <> ''ABIERTO''',
  p_button_condition_type=> 'PLSQL_EXPRESSION',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 35033406638732282 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 201,
  p_button_sequence=> 50,
  p_button_plug_id => 21280731947644271+wwv_flow_api.g_id_offset,
  p_button_name    => 'COPIAR',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(2875100477748101+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Copiar esta Cotización',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.confirm(''Se generará una COPIA de esta Cotización como alternativa. Despues podrá editar su contenido. ¿ Confirma esta operación ?'',''COPIAR''); ',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'COMPRV_PKG.COMCTZ_COPIAR_SN(:P201_ID) = ''SI'' AND :P201_SITUACION <> ''NUE''',
  p_button_condition_type=> 'PLSQL_EXPRESSION',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 5130337805813910 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 201,
  p_button_sequence=> 100,
  p_button_plug_id => 21458150917553006+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCELAR_2',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(2875100477748101+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Retornar',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 22429150636339399 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 201,
  p_button_sequence=> 80,
  p_button_plug_id => 21280731947644271+wwv_flow_api.g_id_offset,
  p_button_name    => 'Confirmar',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(2875100477748101+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Confirmar',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'DECLARE'||unistr('\000a')||
' V_RETORNO BOOLEAN := FALSE;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
' IF (:P201_ID IS NOT NULL) AND COM_PKG.OBTN_COMCON_ESTADO'||unistr('\000a')||
'                                 (p_comcon_id => :P200_COMCON_ID'||unistr('\000a')||
'                                 ,p_comprv_id => :P1_COMPRV_ID) = ''ABIERTO'' AND :P1_ADEUDA_DPIP_SN=''NO'' THEN'||unistr('\000a')||
'   V_RETORNO := TRUE;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  IF (:P200_PUEDE_COTIZAR_SN = ''NO'' AND  :P200_BLOQUEAR_COTIZAR_SN = ''SI'')  THEN '||unistr('\000a')||
'   V_RETORNO := FALSE;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
' END IF;'||unistr('\000a')||
' --'||unistr('\000a')||
' RETURN V_RETORNO;'||unistr('\000a')||
' --'||unistr('\000a')||
'END;',
  p_button_condition_type=> 'FUNCTION_BODY',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 5130652350818145 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 201,
  p_button_sequence=> 110,
  p_button_plug_id => 21458150917553006+wwv_flow_api.g_id_offset,
  p_button_name    => 'Confirmar_2',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(2875100477748101+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Confirmar',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'DECLARE'||unistr('\000a')||
' V_RETORNO BOOLEAN := FALSE;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
' IF (:P201_ID IS NOT NULL) AND COM_PKG.OBTN_COMCON_ESTADO'||unistr('\000a')||
'                                 (p_comcon_id => :P200_COMCON_ID'||unistr('\000a')||
'                                 ,p_comprv_id => :P1_COMPRV_ID) = ''ABIERTO'''||unistr('\000a')||
'                            AND :P1_ADEUDA_DPIP_SN = ''NO'' THEN'||unistr('\000a')||
'   V_RETORNO := TRUE;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  IF (:P200_PUEDE_COTIZAR_SN = ''NO'' AND  :P200_BLOQUEAR_COTIZAR_SN = ''SI'')  THEN '||unistr('\000a')||
'   V_RETORNO := FALSE;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
' END IF;'||unistr('\000a')||
' --'||unistr('\000a')||
' RETURN V_RETORNO;'||unistr('\000a')||
' --'||unistr('\000a')||
'END;',
  p_button_condition_type=> 'FUNCTION_BODY',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 21281949267644282 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 201,
  p_button_sequence=> 60,
  p_button_plug_id => 21280731947644271+wwv_flow_api.g_id_offset,
  p_button_name    => 'ANULAR',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(2875100477748101+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Anular',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:confirmDelete(htmldb_delete_message,''ANULAR'');',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'BEGIN'||unistr('\000a')||
' IF (:P201_ID IS NOT NULL) AND :P201_OPERACION = ''CONSULTA'' AND'||unistr('\000a')||
'    COM_PKG.OBTN_COMCON_ESTADO'||unistr('\000a')||
'         (p_comcon_id => :P200_COMCON_ID'||unistr('\000a')||
'         ,p_comprv_id => :P1_COMPRV_ID) = ''ABIERTO'' AND :P201_SITUACION <> ''NUE'' THEN '||unistr('\000a')||
'        RETURN TRUE;'||unistr('\000a')||
' ELSE'||unistr('\000a')||
'   RETURN FALSE;'||unistr('\000a')||
'END IF;'||unistr('\000a')||
'END;',
  p_button_condition_type=> 'FUNCTION_BODY',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 21281728458644282 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 201,
  p_button_sequence=> 50,
  p_button_plug_id => 21280731947644271+wwv_flow_api.g_id_offset,
  p_button_name    => 'EDITAR',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(2875100477748101+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Modificar',
  p_button_position=> 'REGION_TEMPLATE_EDIT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_condition_type=> 'NEVER',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>21730633383075854 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:202:&SESSION.::&DEBUG.::P202_COMCTZ_ID:&P201_ID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>21299148970764415+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 20,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 06-MAY-2009 12:31 by MALFO');
 
wwv_flow_api.create_page_branch(
  p_id=>5132647615024923 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:201:&SESSION.::&DEBUG.::P201_ID,P201_OPERACION:&P201_ID.,EDICION&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>22429150636339399+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 30,
  p_branch_condition_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_branch_condition=> 'P201_ERROR_VALIDACION',
  p_branch_condition_text=>'TRUE',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>22433246630499116 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:201:&SESSION.::&DEBUG.::P201_ID,P201_OPERACION:&P201_ID.,EDICION&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>5130652350818145+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 35,
  p_branch_condition_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_branch_condition=> 'P201_ERROR_VALIDACION',
  p_branch_condition_text=>'TRUE',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>21705624829155601 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:201:&SESSION.::&DEBUG.::P201_ID:&P201_ID.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>22429150636339399+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 50,
  p_branch_condition_type=> 'FUNCTION_BODY',
  p_branch_condition=> 'BEGIN'||unistr('\000a')||
'  IF :P201_SE_PUEDE_COTIZAR = ''SI'' AND :P201_ERROR_VALIDACION = ''FALSE'' THEN'||unistr('\000a')||
'   RETURN TRUE;'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'   RETURN FALSE;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END;',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 06-MAY-2009 09:57 by MALFO');
 
wwv_flow_api.create_page_branch(
  p_id=>5135226546122965 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:201:&SESSION.::&DEBUG.::P201_ID:&P201_ID.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>5130652350818145+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 55,
  p_branch_condition_type=> 'FUNCTION_BODY',
  p_branch_condition=> 'BEGIN'||unistr('\000a')||
'IF :P201_SE_PUEDE_COTIZAR = ''SI'' AND :P201_ERROR_VALIDACION = ''FALSE'' THEN'||unistr('\000a')||
'  RETURN TRUE;'||unistr('\000a')||
'ELSE'||unistr('\000a')||
'  RETURN FALSE;'||unistr('\000a')||
'END IF;'||unistr('\000a')||
'END;',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 06-MAY-2009 09:57 by MALFO');
 
wwv_flow_api.create_page_branch(
  p_id=>21764931378031015 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:203:&SESSION.::&DEBUG.:201::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>22429150636339399+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 60,
  p_branch_condition_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_branch_condition=> 'P201_SE_PUEDE_COTIZAR',
  p_branch_condition_text=>'NO',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>5144136252201468 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:203:&SESSION.::&DEBUG.:201::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>5130652350818145+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 65,
  p_branch_condition_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_branch_condition=> 'P201_SE_PUEDE_COTIZAR',
  p_branch_condition_text=>'NO',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>6874830513783887 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>21281949267644282+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 80,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 28-MAY-2009 14:06 by JPREDA');
 
wwv_flow_api.create_page_branch(
  p_id=>35035505474845106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:201:&SESSION.::&DEBUG.:201:P201_ID,P201_PAG_ANTERIOR,P201_APP_ANTERIOR:&P201_ID_NUE.,&P201_PAG_ANTERIOR.,&P201_APP_ANTERIOR.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>35033406638732282+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 140,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>21288031204644329 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:201:&SESSION.::&DEBUG.::P201_ID:&P201_ID.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 150,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>35035307846844087 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:201:&SESSION.::&DEBUG.::P201_ID,P201_PAG_ANTERIOR,P201_APP_ANTERIOR:&P201_ID_NUE.,&P201_PAG_ANTERIOR.,&P201_APP_ANTERIOR.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 160,
  p_branch_condition_type=> 'REQUEST_EQUALS_CONDITION',
  p_branch_condition=> 'COPIAR',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>5238939626739840 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_APP_ANTERIOR',
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
  p_field_template=> 2874826071748101+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>5239146206741726 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_PAG_ANTERIOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 4,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Pag Anterior',
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
  p_field_template=> 2874826071748101+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6811029062298000 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_RESPUESTA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 180,
  p_item_plug_id => 21280731947644271+wwv_flow_api.g_id_offset,
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
  p_id=>6812102080340951 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_ESTADO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 190,
  p_item_plug_id => 21280731947644271+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'PEN',
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
  p_id=>6815728359632557 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_COMWSL_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 200,
  p_item_plug_id => 21280731947644271+wwv_flow_api.g_id_offset,
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
  p_id=>6819521186970156 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_FECHA_DPIP',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 210,
  p_item_plug_id => 21280731947644271+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_format_mask=>'DD/MM/YYYY',
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
  p_id=>11407921852074926 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_COTIZO_EN_0',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 5,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Cotizó en cero',
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
  p_field_template=> 2874826071748101+wwv_flow_api.g_id_offset,
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
  p_id=>19529723379209715 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_PAGINACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 230,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '20',
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
  p_id=>20223404778028836 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_EXIGIR_FIRMADIGITAL_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 140,
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
  p_id=>21282141559644282 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 21280731947644271+wwv_flow_api.g_id_offset,
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
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 2874604681748101+wwv_flow_api.g_id_offset,
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
  p_id=>21282335246644288 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_SEGORG_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 21280731947644271+wwv_flow_api.g_id_offset,
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
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 2874604681748101+wwv_flow_api.g_id_offset,
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
h := null;
h:=h||'Indique el código del Tipo de Documento.';

wwv_flow_api.create_page_item(
  p_id=>21282539355644288 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 21280731947644271+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Código :',
  p_source=>'CODIGO',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 30,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_field_template=> 2874604681748101+wwv_flow_api.g_id_offset,
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
h:=h||'Indique el Nombre del Tipo de Documento.';

wwv_flow_api.create_page_item(
  p_id=>21283042057644299 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_FECHA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 21280731947644271+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Fecha Oferta : ',
  p_post_element_text=>'  (la fecha se actualiza al confirmarse la oferta)',
  p_source=>'FECHA',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
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
  p_read_only_when_type=>'ALWAYS',
  p_read_only_disp_attr=>'style="font-weight:bold;"',
  p_field_template=> 2874604681748101+wwv_flow_api.g_id_offset,
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
h:=h||'Debe seleccionar si el Tipo de Documento es Obligatorio o No.';

wwv_flow_api.create_page_item(
  p_id=>21283537099644299 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_SITUACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 21280731947644271+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'NUE',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Situación: ',
  p_source=>'SITUACION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 2,
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
  p_read_only_disp_attr=>'style="font-weight:bold;"',
  p_field_template=> 2874604681748101+wwv_flow_api.g_id_offset,
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
wwv_flow_api.create_page_item(
  p_id=>21284532287644299 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_DATE_CREATED',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 21280527680644271+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
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
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id=>21284754885644301 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_DATE_MODIFIED',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 100,
  p_item_plug_id => 21280527680644271+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
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
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id=>21284925914644302 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_MODIFIED_BY',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 110,
  p_item_plug_id => 21280527680644271+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Actualizado por :',
  p_source=>'MODIFIED_BY',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
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
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id=>21285133328644302 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_CREATED_BY',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 90,
  p_item_plug_id => 21280527680644271+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Creado por :',
  p_source=>'CREATED_BY',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
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
  p_field_template=> 2874727808748101+wwv_flow_api.g_id_offset,
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
  p_id=>21285341075644302 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_OPERACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Operacion',
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
  p_field_template=> 2874604681748101+wwv_flow_api.g_id_offset,
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
h := null;
h:=h||'Indique la Observación para la Cotización.';

wwv_flow_api.create_page_item(
  p_id=>21295826652750102 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_OBSERVACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 21280731947644271+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Observación: ',
  p_source=>'OBSERVACION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 80,
  p_cMaxlength=> 2000,
  p_cHeight=> 2,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when=>'1=1 or COM_PKG.OBTN_COMCON_ESTADO(p_comcon_id => :P200_COMCON_ID'||unistr('\000a')||
'                                 ,p_comprv_id => :P1_COMPRV_ID) <> ''ABIERTO''',
  p_read_only_when_type=>'PLSQL_EXPRESSION',
  p_read_only_disp_attr=>'style="font-weight:bold;"',
  p_field_template=> 2874604681748101+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '1=1 or COM_PKG.OBTN_COMCON_ESTADO(p_comcon_id => :P200_COMCON_ID'||unistr('\000a')||
'                                 ,p_comprv_id => :P1_COMPRV_ID) <> ''ABIERTO''');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>21485955224602376 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_PRECIO_TESTIGO_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 130,
  p_item_plug_id => 21280731947644271+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Precio Testigo Sn',
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
  p_field_template=> 2874826071748101+wwv_flow_api.g_id_offset,
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
  p_id=>21764550715932482 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_SE_PUEDE_COTIZAR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 2,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Se Puede Cotizar',
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
  p_field_template=> 2874826071748101+wwv_flow_api.g_id_offset,
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
  p_id=>22432852255481781 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_ERROR_VALIDACION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 120,
  p_item_plug_id => 21280731947644271+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'FALSE',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Error Validacion',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 2874604681748101+wwv_flow_api.g_id_offset,
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
  p_id=>30121628850828318 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_CONSULTO_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 240,
  p_item_plug_id => 21280731947644271+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'NO',
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
  p_id=>35035103989815421 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_ID_NUE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 250,
  p_item_plug_id => 21280731947644271+wwv_flow_api.g_id_offset,
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
  p_id=>38992728559178453 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_ITEM_SELECCIONADO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 270,
  p_item_plug_id => 21458150917553006+wwv_flow_api.g_id_offset,
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
  p_id=>39201504278553054 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_OBJETO_ASOCIADO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 300,
  p_item_plug_id => 39046119415593854+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Descripción :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
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
  p_read_only_when_type=>'ALWAYS',
  p_field_template=> 2874915932748101+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>39201619162581606 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_ASOCIAR_OBJETO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 295,
  p_item_plug_id => 39046119415593854+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Agregar',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'N',
  p_button_execute_validations=>'Y',
  p_button_action => 'DEFINED_BY_DA',
  p_button_is_hot=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>39210505379054003 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_COMOBJ_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 280,
  p_item_plug_id => 39046119415593854+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'&P201_COMOBJ_NOMBRE. :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_POPUP_LOV',
  p_lov=> 'select comobj.CODIGO||'' ''||comobj.NOMBRE d,comobj.ID r'||unistr('\000a')||
'from COM_PEDIDOS_V comped'||unistr('\000a')||
'    ,COM_CONTRATACIONES_DET_V comctt'||unistr('\000a')||
'    ,COM_CATALOGO_OBJETOS_V comcob'||unistr('\000a')||
'    ,COM_RUBCOB_V comrob'||unistr('\000a')||
'    ,COM_RUBROS_V comrub'||unistr('\000a')||
'    ,COM_OBJETOS_V comobj'||unistr('\000a')||
'where  COMPED.ID = COMCTT.COMPED_ID'||unistr('\000a')||
'and    comctt.COMCON_ID = :P200_COMCON_ID'||unistr('\000a')||
'and    comped.COMCOB_ID = comcob.ID'||unistr('\000a')||
'and    COMCOB.ID = COMROB.COMCOB_ID'||unistr('\000a')||
'and    COMROB.COMRUB_ID = comrub.ID'||unistr('\000a')||
'and    COMRUB.CONTIENE_OBJETOS_SN = ''SI'''||unistr('\000a')||
'and    comobj.COMRUB_ID = comrub.ID'||unistr('\000a')||
'and    comobj.COMPRV_ID = :P1_COMPRV_ID'||unistr('\000a')||
'and    comobj.COMOBE_ESTADO = ''HAB'''||unistr('\000a')||
'and    comobj.ID not in (select COMOBJ_ID'||unistr('\000a')||
'                        from COM_COTIZACIONES_DET_OBJ '||unistr('\000a')||
'                        where COMCZD_ID = :P201_COMCZD_ID'||unistr('\000a')||
'                        and SITUACION = ''VAL'')'||unistr('\000a')||
'and    SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => ''COMPRV_COMOBJ_VALIDAR_SN'',P_SEGORG_ID => :P1_SEGORG_ID) = ''SI''',
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
  p_field_template=> 2874915932748101+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NOT_ENTERABLE',
  p_attribute_02 => 'FIRST_ROWSET',
  p_show_quick_picks=>'N',
  p_item_comment => 'from COM_OBJETOS_V comobj'||unistr('\000a')||
'where comobj.COMPRV_ID = :P1_COMPRV_ID'||unistr('\000a')||
'and   comobj.COMOBE_ESTADO = ''HAB'''||unistr('\000a')||
'and   comobj.COMOBT_CODIGO = ''AUTOMOTOR'''||unistr('\000a')||
'and   comobj.ID not in (select COMOBJ_ID'||unistr('\000a')||
'                        from COM_COTIZACIONES_DET_OBJ '||unistr('\000a')||
'                        where COMCZD_ID = :P201_COMCZD_ID'||unistr('\000a')||
'                        and SITUACION = ''VAL'')');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>39248027564669431 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_COMCZD_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 310,
  p_item_plug_id => 39046119415593854+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
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
  p_id=>39276527736316775 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_COMCZO_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 320,
  p_item_plug_id => 39046119415593854+wwv_flow_api.g_id_offset,
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
  p_id=>39385105619982881 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_MARCA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 330,
  p_item_plug_id => 39046119415593854+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Marca',
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
  p_field_template=> 2874826071748101+wwv_flow_api.g_id_offset,
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
  p_id=>39385300443985248 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_MODELO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 340,
  p_item_plug_id => 39046119415593854+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Modelo',
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
  p_field_template=> 2874826071748101+wwv_flow_api.g_id_offset,
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
  p_id=>42972928006066732 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_COMRUB_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 350,
  p_item_plug_id => 39046119415593854+wwv_flow_api.g_id_offset,
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
  p_id=>42983121812525485 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_COMPRV_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 360,
  p_item_plug_id => 39046119415593854+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'&P1_COMPRV_ID.',
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
  p_id=>42983619428541781 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_INSCRIPTO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 370,
  p_item_plug_id => 39046119415593854+wwv_flow_api.g_id_offset,
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
  p_id=>42994718050970635 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_COMOBJ_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 380,
  p_item_plug_id => 39046119415593854+wwv_flow_api.g_id_offset,
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
 
wwv_flow_api.create_page_computation(
  p_id=> 42980930193293645 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_computation_sequence => 10,
  p_computation_item=> 'P201_COMRUB_ID',
  p_computation_point=> 'AFTER_HEADER',
  p_computation_type=> 'QUERY',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'select COMRCB.COMRUB_ID'||unistr('\000a')||
'from COM_PEDIDOS comped'||unistr('\000a')||
'    ,COM_CATALOGO_OBJETOS comcob'||unistr('\000a')||
'    ,COM_RUBCOB comrcb'||unistr('\000a')||
'    ,COM_COTIZACIONES_DETALLES comctd'||unistr('\000a')||
''||unistr('\000a')||
'where COMCTD.COMCTZ_ID = :P201_ID'||unistr('\000a')||
'  and COMCTD.COMPED_ID = COMPED.ID '||unistr('\000a')||
'  and COMPED.COMCOB_ID = COMCOB.ID'||unistr('\000a')||
'  and COMCOB.ID = COMRCB.COMCOB_ID'||unistr('\000a')||
'  and COMRCB.SITUACION = ''VIG''',
  p_compute_when => 'P201_ID',
  p_compute_when_type=>'ITEM_IS_NOT_NULL');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 42994911353988904 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_computation_sequence => 10,
  p_computation_item=> 'P201_COMOBJ_NOMBRE',
  p_computation_point=> 'AFTER_HEADER',
  p_computation_type=> 'QUERY',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'select distinct INITCAP(COMOBJ.COMOBT_NOMBRE)'||unistr('\000a')||
'from COM_OBJETOS_V comobj'||unistr('\000a')||
'where comobj.COMRUB_ID = :P201_COMRUB_ID'||unistr('\000a')||
'  and comobj.COMOBE_ESTADO = ''HAB''',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 34899823803935615 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 201,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'ValidarCantidadCotizaciones',
  p_validation_sequence=> 10,
  p_validation => 'declare'||unistr('\000a')||
'  v_comcon COM_CONTRATACIONES%rowtype;  '||unistr('\000a')||
'  v_count_ctz NUMBER;'||unistr('\000a')||
'  v_mensaje VARCHAR2(2000);'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  --Obtengo Contratacion'||unistr('\000a')||
'  COM_PKG.SET_COMCON(P_COMCON_ID => :P200_COMCON_ID);'||unistr('\000a')||
'  COM_PKG.GET_COMCON(P_COMCON => v_comcon);'||unistr('\000a')||
'  COM_PKG.INI_COMCON();'||unistr('\000a')||
'  --'||unistr('\000a')||
'  --Obtengo cantidad de cotizaciones'||unistr('\000a')||
'  v_count_ctz := COMPRV_PKG.OBTN_COMCTZ_PRE(P_COMPRV_ID => :P1_COMPRV_ID, P_COMCON_ID => :P200_COMCON_ID)+1;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  IF nvl(v_count_ctz,0) < nvl(v_comcon.LIMITE_MIN_COMCTZ, 0) THEN'||unistr('\000a')||
'    v_mensaje := ''La cantidad de Cotizaciones indicadas (''||v_count_ctz||'') es menor a la cantidad obligatoria que es  (''||v_comcon.LIMITE_MIN_COMCTZ||'').'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --  '||unistr('\000a')||
'  IF nvl(v_count_ctz,0) >= nvl(v_comcon.LIMITE_MAX_COMCTZ,0) THEN'||unistr('\000a')||
'    v_mensaje := ''La cantidad de Cotizaciones indicadas (''||v_count_ctz||'') es mayor a la cantidad obligatoria que es  (''||v_comcon.LIMITE_MAX_COMCTZ||'').'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  IF nvl(v_count_ctz,0) = nvl(v_comcon.LIMITE_MAX_COMCTZ,0) THEN'||unistr('\000a')||
'    v_mensaje := ''Se alcanzo la cantidad máxima de Cotizaciones permitidas que es  (''||v_comcon.LIMITE_MAX_COMCTZ||'').'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  RETURN v_mensaje;  '||unistr('\000a')||
'  --'||unistr('\000a')||
'end;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => '',
  p_always_execute=>'N',
  p_validation_condition=> 'Confirmar_2, Confirmar',
  p_validation_condition_type=> 'REQUEST_IN_CONDITION',
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 6885020103426171 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 201,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'ValidarCotizacion',
  p_validation_sequence=> 30,
  p_validation => 'begin'||unistr('\000a')||
'  if nvl(:ADEUDA_DPIP,''NO'') = ''SI'' then'||unistr('\000a')||
'    return ''No es posible Cotizar, presenta deuda en DPIP'';'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  return null;'||unistr('\000a')||
'end;',
  p_validation_type => 'FUNC_BODY_RETURNING_ERR_TEXT',
  p_error_message => '',
  p_always_execute=>'N',
  p_validation_condition=> '(:REQUEST = ''Confirmar'' or :REQUEST = ''Confirmar_2'') and :P200_CONTROLA_DPIP_SN = ''SI''',
  p_validation_condition_type=> 'PLSQL_EXPRESSION',
  p_only_for_changed_rows=> 'Y',
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 39367510655202793 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 201
 ,p_name => 'RefrescarRegiones'
 ,p_event_sequence => 5
 ,p_triggering_element_type => 'JQUERY_SELECTOR'
 ,p_triggering_element => 'input[name="btnAsociar"]'
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'click'
  );
wwv_flow_api.create_page_da_action (
  p_id => 39368013366204337 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 201
 ,p_event_id => 39367510655202793 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_REFRESH'
 ,p_affected_elements_type => 'REGION'
 ,p_affected_region_id => 39242632590430578 + wwv_flow_api.g_id_offset
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 39368207759206926 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 201
 ,p_event_id => 39367510655202793 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 30
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_SET_FOCUS'
 ,p_affected_elements_type => 'ITEM'
 ,p_affected_elements => 'P201_COMCZD_ID'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 39428507503561106 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 201
 ,p_event_id => 39367510655202793 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 40
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_SET_VALUE'
 ,p_affected_elements_type => 'ITEM'
 ,p_affected_elements => 'P201_OBJETO_ASOCIADO'
 ,p_attribute_01 => 'STATIC_ASSIGNMENT'
 ,p_attribute_09 => 'N'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 39608920218258279 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 201
 ,p_event_id => 39367510655202793 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 50
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_SET_VALUE'
 ,p_affected_elements_type => 'ITEM'
 ,p_affected_elements => 'P201_COMOBJ_ID'
 ,p_attribute_01 => 'STATIC_ASSIGNMENT'
 ,p_attribute_09 => 'N'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 11873214946978473 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 201
 ,p_name => 'ConsultarEstadoDPIP Barra de Progreso'
 ,p_event_sequence => 10
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'apexbeforepagesubmit'
  );
wwv_flow_api.create_page_da_action (
  p_id => 11873516504978540 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 201
 ,p_event_id => 11873214946978473 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => 'html_Submit_Progress(this);'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 11875713528141798 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 201
 ,p_event_id => 11873214946978473 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_EXECUTE_PLSQL_CODE'
 ,p_attribute_01 => 'declare'||unistr('\000a')||
'  cursor cr_dominio is'||unistr('\000a')||
'    select comwsv.url'||unistr('\000a')||
'    from   COM_WEBSERVICES comwsv'||unistr('\000a')||
'    where  comwsv.codigo = ''estadoDeudaByFec'';'||unistr('\000a')||
'  --  '||unistr('\000a')||
'  v_url varchar2(3000);'||unistr('\000a')||
'  v_proxy varchar2(100) := null;'||unistr('\000a')||
'  v_xml CLOB;'||unistr('\000a')||
'begin '||unistr('\000a')||
'  --'||unistr('\000a')||
'  if SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => ''COMPRV_SRVINT_DPIP_HABILITADO_SN'''||unistr('\000a')||
'                                                , P_SEGORG_ID => :P1_SEGORG_ID) = ''SI'' then'||unistr('\000a')||
'  --'||unistr('\000a')||
'  open cr_dominio;'||unistr('\000a')||
'  fetch cr_dominio into v_url;'||unistr('\000a')||
'  close cr_dominio;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_url := v_url||''?wsdl'';'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_xml := COMPRV_PKG.COMPRV_REGISTRAR_DPIP_VLD(v_url, v_proxy);'||unistr('\000a')||
'  --'||unistr('\000a')||
'  if instr(v_xml, ''ERROR'') > 0 then'||unistr('\000a')||
'    :P1_ADEUDA_DPIP_SN := ''NO'';'||unistr('\000a')||
'  elsif instr(v_xml, ''XML'') > 0 then'||unistr('\000a')||
'    :P1_ADEUDA_DPIP_SN := COMPRV_PKG.OBTN_COMPRV_ADEUDA_DPIP_SN(p_tipo_documento => ''CUIT'''||unistr('\000a')||
'                                                                 ,p_nro_documento  => :P1_COMPRV_CUIT'||unistr('\000a')||
'                                                                 ,p_fecha          => sysdate);'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  else'||unistr('\000a')||
'   :P1_ADEUDA_DPIP_SN := ''NO'';'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 11878115432186462 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 201
 ,p_event_id => 11873214946978473 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 30
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => '$(''#AjaxLoading'').hide();'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 30144024894249584 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 201
 ,p_event_id => 11873214946978473 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 40
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_EXECUTE_PLSQL_CODE'
 ,p_attribute_01 => 'begin'||unistr('\000a')||
' :P200_DPIP_CONTROLADO_SN := ''SI'';'||unistr('\000a')||
'end;'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'N'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 39386717477122542 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 201
 ,p_name => 'CargarMarca/Modelo'
 ,p_event_sequence => 11
 ,p_triggering_element_type => 'REGION'
 ,p_triggering_region_id => 39242632590430578 + wwv_flow_api.g_id_offset
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'apexafterrefresh'
  );
wwv_flow_api.create_page_da_action (
  p_id => 39387009078122548 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 201
 ,p_event_id => 39386717477122542 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_EXECUTE_PLSQL_CODE'
 ,p_attribute_01 => 'declare '||unistr('\000a')||
''||unistr('\000a')||
'cursor cr_objeto is'||unistr('\000a')||
'    select comobj.NOMBRE||'' ''||substr(comobj.DESCRIPCION,instr(comobj.DESCRIPCION,''<br>Año'')+4,(instr(comobj.DESCRIPCION,''<br>Equipamiento'')-instr(comobj.DESCRIPCION,''<br>Año'')-4))  DESCRIPCION '||unistr('\000a')||
'           ,comobj.CODIGO'||unistr('\000a')||
'           ,comobj.NOMBRE'||unistr('\000a')||
'    from COM_OBJETOS comobj'||unistr('\000a')||
'        ,COM_COTIZACIONES_DET_OBJ comczo'||unistr('\000a')||
'    where comobj.ID = comczo.COMOBJ_ID'||unistr('\000a')||
'    and   comczo.COMCZD_ID = :P201_COMCZD_ID'||unistr('\000a')||
'    and   comczo.SITUACION = ''VAL'''||unistr('\000a')||
'    order by comczo.OFERTA;'||unistr('\000a')||
'    '||unistr('\000a')||
'v_marca varchar2(300);'||unistr('\000a')||
'v_modelo varchar2(300);'||unistr('\000a')||
'v_descripcion varchar(4000);'||unistr('\000a')||
'v_dummy number;'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'begin'||unistr('\000a')||
'    v_dummy := 1;'||unistr('\000a')||
'    :P201_MODELO := '''';'||unistr('\000a')||
'    :P201_MARCA := '''';'||unistr('\000a')||
'    '||unistr('\000a')||
'            '||unistr('\000a')||
'    for v_objeto in cr_objeto loop'||unistr('\000a')||
'       '||unistr('\000a')||
'      v_marca := v_dummy||'') ''|| v_objeto.CODIGO;'||unistr('\000a')||
'      v_modelo :=  v_objeto.CODIGO;'||unistr('\000a')||
'      v_descripcion := v_dummy||'') ''|| REPLACE(v_objeto.DESCRIPCION,''<br>'', chr(10));'||unistr('\000a')||
'      --v_descripcion := v_descripcion || chr(10);--|| chr(10);'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'     :P201_MARCA := :P201_MARCA ||'' '' || v_marca ||chr(10) ;--||'', '';'||unistr('\000a')||
'     :P201_MODELO := :P201_MODELO ||v_descripcion||chr(10) ;--||'', '';'||unistr('\000a')||
'   --:P201_MODELO := :P201_MODELO ||v_modelo||'', '';'||unistr('\000a')||
'   	 '||unistr('\000a')||
'     v_dummy := v_dummy + 1;'||unistr('\000a')||
'        '||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'    '||unistr('\000a')||
'    --:P201_MARCA := substr(:P201_MARCA,0,(length(:P201_MARCA)-2));'||unistr('\000a')||
'    --:P201_MODELO := substr(:P201_MODELO,0,(length(:P201_MODELO)-2));'||unistr('\000a')||
'	--'||unistr('\000a')||
'    --Comentarios cambio por pedido de muestra en MARCA, MODELO de los objetos 2/07/2015, incidencia 0026731 '||unistr('\000a')||
''||unistr('\000a')||
'end;'||unistr('\000a')||
''
 ,p_attribute_02 => 'P201_COMOBJ_ID'
 ,p_attribute_03 => 'P201_MODELO,P201_MARCA'
 ,p_attribute_04 => 'N'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 ,p_da_action_comment => 'dentro del for '||unistr('\000a')||
''||unistr('\000a')||
'v_inicial := instr(v_objeto.descripcion,''Marca'')+length(''Marca'')+1;'||unistr('\000a')||
'      v_final := instr(v_objeto.descripcion,''<br>'',v_inicial);'||unistr('\000a')||
''||unistr('\000a')||
'      v_marca := substr(v_objeto.descripcion,v_inicial,(v_final - v_inicial));'||unistr('\000a')||
'    '||unistr('\000a')||
'      v_inicial := instr(v_objeto.descripcion,''Modelo'')+length(''Modelo'')+1;'||unistr('\000a')||
'      v_final := instr(v_objeto.descripcion,''<br>'',v_inicial);'||unistr('\000a')||
'    '||unistr('\000a')||
'      v_modelo := substr(v_objeto.descripcion,v_inicial,(v_final - v_inicial));'||unistr('\000a')||
'      '||unistr('\000a')||
'      :P201_MARCA := :P201_MARCA|| v_objeto.CODIGO||'' '' || v_marca||'', '';'||unistr('\000a')||
'      :P201_MODELO := :P201_MODELO ||v_modelo||'', '';'
 );
wwv_flow_api.create_page_da_action (
  p_id => 39414616139220789 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 201
 ,p_event_id => 39386717477122542 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_SHOW'
 ,p_affected_elements_type => 'REGION'
 ,p_affected_region_id => 39242632590430578 + wwv_flow_api.g_id_offset
 ,p_attribute_01 => 'N'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 39202506573644187 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 201
 ,p_name => 'Asociar Objetos'
 ,p_event_sequence => 20
 ,p_triggering_element_type => 'ITEM'
 ,p_triggering_element => 'P201_COMOBJ_ID'
 ,p_triggering_condition_type => 'NOT_NULL'
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'change'
  );
wwv_flow_api.create_page_da_action (
  p_id => 39206501621903795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 201
 ,p_event_id => 39202506573644187 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_EXECUTE_PLSQL_CODE'
 ,p_attribute_01 => 'declare '||unistr('\000a')||
''||unistr('\000a')||
'cursor cr_objeto is'||unistr('\000a')||
'    select comobj.DESCRIPCION '||unistr('\000a')||
'    from COM_OBJETOS comobj'||unistr('\000a')||
'        ,COM_OBJETOS_EST comobe'||unistr('\000a')||
'    where COMOBJ.COMOBE_ID = comobe.ID'||unistr('\000a')||
'    and   comobj.ID = :P201_COMOBJ_ID'||unistr('\000a')||
'    and   comobe.ESTADO = ''HAB'';'||unistr('\000a')||
'    '||unistr('\000a')||
'v_descripcion varchar2(3000);'||unistr('\000a')||
''||unistr('\000a')||
'begin'||unistr('\000a')||
''||unistr('\000a')||
'    open cr_objeto;'||unistr('\000a')||
'    fetch cr_objeto into v_descripcion;'||unistr('\000a')||
'    close cr_objeto;'||unistr('\000a')||
'    '||unistr('\000a')||
'    :P201_OBJETO_ASOCIADO := v_descripcion;'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'end;'
 ,p_attribute_02 => 'P201_COMOBJ_ID'
 ,p_attribute_03 => 'P201_OBJETO_ASOCIADO'
 ,p_attribute_04 => 'N'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 39274211050157387 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 201
 ,p_event_id => 39202506573644187 + wwv_flow_api.g_id_offset
 ,p_event_result => 'FALSE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_DISABLE'
 ,p_affected_elements_type => 'BUTTON'
 ,p_affected_button_id => 39201619162581606 + wwv_flow_api.g_id_offset
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 39274407168159129 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 201
 ,p_event_id => 39202506573644187 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_ENABLE'
 ,p_affected_elements_type => 'BUTTON'
 ,p_affected_button_id => 39201619162581606 + wwv_flow_api.g_id_offset
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 39247318073653426 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 201
 ,p_name => 'AsociacionObjetoCotizacion'
 ,p_event_sequence => 30
 ,p_triggering_element_type => 'BUTTON'
 ,p_triggering_button_id => 39201619162581606 + wwv_flow_api.g_id_offset
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'click'
  );
wwv_flow_api.create_page_da_action (
  p_id => 39247629065653434 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 201
 ,p_event_id => 39247318073653426 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_EXECUTE_PLSQL_CODE'
 ,p_attribute_01 => 'declare'||unistr('\000a')||
''||unistr('\000a')||
'v_comobj_id NUMBER;'||unistr('\000a')||
'v_comczd_id NUMBER;'||unistr('\000a')||
'v_retorno VARCHAR2(100);'||unistr('\000a')||
'v_oferta VARCHAR2(30);'||unistr('\000a')||
''||unistr('\000a')||
'begin'||unistr('\000a')||
''||unistr('\000a')||
'v_comobj_id := :P201_COMOBJ_ID;'||unistr('\000a')||
'v_comczd_id := :P201_COMCZD_ID;'||unistr('\000a')||
''||unistr('\000a')||
'select count(ID) into v_retorno'||unistr('\000a')||
'from COM_COTIZACIONES_DET_OBJ'||unistr('\000a')||
'where COMCZD_ID = v_comczd_id'||unistr('\000a')||
'and SITUACION = ''VAL'';'||unistr('\000a')||
''||unistr('\000a')||
'if v_retorno = 0 then'||unistr('\000a')||
''||unistr('\000a')||
'  v_oferta := ''0'';'||unistr('\000a')||
''||unistr('\000a')||
'else '||unistr('\000a')||
'  '||unistr('\000a')||
'  select count(ID) into v_retorno'||unistr('\000a')||
'  from COM_COTIZACIONES_DET_OBJ'||unistr('\000a')||
'  where COMCZD_ID = v_comczd_id'||unistr('\000a')||
'  and SITUACION = ''VAL'''||unistr('\000a')||
'  and OFERTA = ''0'';'||unistr('\000a')||
'  '||unistr('\000a')||
'  if v_retorno = 0 then'||unistr('\000a')||
'    v_oferta := ''0'';'||unistr('\000a')||
'  else'||unistr('\000a')||
'  '||unistr('\000a')||
'    v_oferta := ''1'';'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end if;'||unistr('\000a')||
''||unistr('\000a')||
'if v_comobj_id is not null and v_comczd_id is not null then'||unistr('\000a')||
''||unistr('\000a')||
'    insert into COM_COTIZACIONES_DET_OBJ ('||unistr('\000a')||
'       COMOBJ_ID'||unistr('\000a')||
'      ,COMCZD_ID'||unistr('\000a')||
'      ,OFERTA'||unistr('\000a')||
'    )'||unistr('\000a')||
'     values('||unistr('\000a')||
'       v_comobj_id'||unistr('\000a')||
'      ,v_comczd_id'||unistr('\000a')||
'      ,v_oferta'||unistr('\000a')||
'    );'||unistr('\000a')||
'      '||unistr('\000a')||
'end if;'||unistr('\000a')||
''||unistr('\000a')||
'end;'
 ,p_attribute_02 => 'P201_COMOBJ_ID,P201_COMCZD_ID'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 39273429597148750 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 201
 ,p_event_id => 39247318073653426 + wwv_flow_api.g_id_offset
 ,p_event_result => 'FALSE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_HIDE'
 ,p_affected_elements_type => 'BUTTON'
 ,p_affected_button_id => 39201619162581606 + wwv_flow_api.g_id_offset
 ,p_attribute_01 => 'N'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 39302616399327712 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 201
 ,p_event_id => 39247318073653426 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 15
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_SET_VALUE'
 ,p_affected_elements_type => 'ITEM'
 ,p_affected_elements => 'P201_COMOBJ_ID'
 ,p_attribute_01 => 'STATIC_ASSIGNMENT'
 ,p_attribute_09 => 'N'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 39464630019154664 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 201
 ,p_event_id => 39247318073653426 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 16
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_SET_VALUE'
 ,p_affected_elements_type => 'ITEM'
 ,p_affected_elements => 'P201_OBJETO_ASOCIADO'
 ,p_attribute_01 => 'STATIC_ASSIGNMENT'
 ,p_attribute_09 => 'N'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 39248819344703698 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 201
 ,p_event_id => 39247318073653426 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_REFRESH'
 ,p_affected_elements_type => 'REGION'
 ,p_affected_region_id => 39242632590430578 + wwv_flow_api.g_id_offset
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 39288606765052131 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 201
 ,p_name => 'SuspenderCotizacion'
 ,p_event_sequence => 40
 ,p_triggering_element_type => 'ITEM'
 ,p_triggering_element => 'P201_COMCZO_ID'
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'change'
  );
wwv_flow_api.create_page_da_action (
  p_id => 39290030087136145 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 201
 ,p_event_id => 39288606765052131 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_EXECUTE_PLSQL_CODE'
 ,p_attribute_01 => 'update COM_COTIZACIONES_DET_OBJ set SITUACION = ''SUS'' where ID = :P201_COMCZO_ID;'
 ,p_attribute_02 => 'P201_COMCZO_ID'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 39290603777148414 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 201
 ,p_event_id => 39288606765052131 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 30
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_REFRESH'
 ,p_affected_elements_type => 'REGION'
 ,p_affected_region_id => 39242632590430578 + wwv_flow_api.g_id_offset
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 39414004651211532 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 201
 ,p_name => 'OcultarObjetosAsociados'
 ,p_event_sequence => 50
 ,p_triggering_element_type => 'REGION'
 ,p_triggering_region_id => 39242632590430578 + wwv_flow_api.g_id_offset
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'apexbeforerefresh'
  );
wwv_flow_api.create_page_da_action (
  p_id => 39414311385212287 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 201
 ,p_event_id => 39414004651211532 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_HIDE'
 ,p_affected_elements_type => 'REGION'
 ,p_affected_region_id => 39242632590430578 + wwv_flow_api.g_id_offset
 ,p_attribute_01 => 'N'
 ,p_stop_execution_on_error => 'Y'
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
p:=p||'F|#OWNER#:COM_COTIZACIONES:P201_ID:ID';

wwv_flow_api.create_page_process(
  p_id     => 21287340858644320 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 201,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from COM_COTIZACIONES',
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
p:=p||'32502820141297084';

wwv_flow_api.create_page_process(
  p_id     => 32587032482289314 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 201,
  p_process_sequence=> 50,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'Cargar Variables Control Cotizar',
  p_process_sql_clob => 32502820141297084 + wwv_flow_api.g_id_offset,
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
p:=p||'declare '||unistr('\000a')||
'cursor cr_comprr is'||unistr('\000a')||
'  select comrub_id'||unistr('\000a')||
'  from COM_PROVEEDORES_RUB'||unistr('\000a')||
'  where comprv_id = :P1_COMPRV_ID'||unistr('\000a')||
'    and SITUACION = ''ACT'';'||unistr('\000a')||
''||unistr('\000a')||
'v_comrub_id cr_comprr%rowtype;'||unistr('\000a')||
''||unistr('\000a')||
'begin'||unistr('\000a')||
'  for c in cr_comprr loop'||unistr('\000a')||
'    if c.comrub_id = :P201_COMRUB_ID then'||unistr('\000a')||
'        :P201_INSCRIPTO := ''SI'';'||unistr('\000a')||
'        exit;'||unistr('\000a')||
'     end if;'||unistr('\000a')||
'     :P201_INSCRIPTO := ''NO'';'||unistr('\000a')||
'  end loop;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 42982717487466301 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 201,
  p_process_sequence=> 80,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'COMPRR insertar valor',
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
p:=p||'DECLARE'||unistr('\000a')||
'  v_comctd_cantidad NUMBER:=0;'||unistr('\000a')||
'  v_mensaje                    VARCHAR2(2000);'||unistr('\000a')||
'  v_mensaje_cotizacion_en_cero VARCHAR2(2000);'||unistr('\000a')||
'  v_permite_cotizar_cero_sn    VARCHAR2(2);'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  v_permite_cotizar_cero_sn := SEG_PKG.OBTN_SEGCFG_VALOR'||unistr('\000a')||
'                               (P_CODIGO => ''COMPRV_COMCZD_COTIZAR_CERO_SN'''||unistr('\000a')||
'                               ,P_SEGORG_ID => :P1_SEGORG_ID);'||unistr('\000a')||
'  :P201_SE_PUEDE_COTI';

p:=p||'ZAR := COM_PKG.OBTN_COMCON_COTIZAR(p_comcon_id => :P200_COMCON_ID);'||unistr('\000a')||
'  IF :P201_SE_PUEDE_COTIZAR <> ''SI'' THEN'||unistr('\000a')||
'    v_mensaje := v_mensaje||''<b>La presentación de cotizaciones en este proceso esta cerrada</b><br> - No se puede confirmar su cotización<br>'';'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'  -- Actualizar la Observacion'||unistr('\000a')||
'  UPDATE COM_COTIZACIONES'||unistr('\000a')||
'  SET observacion = :P201_OBSERVACION '||unistr('\000a')||
'  WHERE id = :P201_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  -- Recorrer l';

p:=p||'os detalles de la cotización a confirmar  '||unistr('\000a')||
'  FOR i in 1..apex_application.g_f01.count LOOP'||unistr('\000a')||
'    DECLARE'||unistr('\000a')||
'      v_comctd_correcto VARCHAR2(2) := ''SI'';'||unistr('\000a')||
'      v_comctd_precio_unitario_final NUMBER;'||unistr('\000a')||
'    BEGIN'||unistr('\000a')||
'    -- g_f02 (Precio Unitario Cotizado)'||unistr('\000a')||
'    -- g_f03 (Marca)'||unistr('\000a')||
'    -- g_f04 (Modelo)'||unistr('\000a')||
'    -- g_f05 (Observacion)'||unistr('\000a')||
'    -- Todos los campos en blanco (no se ha cotizado)'||unistr('\000a')||
'    IF replace(htmldb_application';

p:=p||'.g_f02(i),''%''||''null%'',NULL) IS NULL AND '||unistr('\000a')||
'       replace(htmldb_application.g_f03(i),''%''||''null%'',NULL) IS NULL AND'||unistr('\000a')||
'       replace(htmldb_application.g_f04(i),''%''||''null%'',NULL) IS NULL THEN'||unistr('\000a')||
'      -- Identificar que ha sucedido un error de validación en el item actual'||unistr('\000a')||
'      v_comctd_correcto := ''SI'';'||unistr('\000a')||
'    -- Todos los campos cargados (se ha cotizado algo)'||unistr('\000a')||
'    ELSIF replace(htmldb_application.g_f02(';

p:=p||'i),''%''||''null%'',NULL) IS NOT NULL AND '||unistr('\000a')||
'       replace(htmldb_application.g_f03(i),''%''||''null%'',NULL) IS NOT NULL AND'||unistr('\000a')||
'       replace(htmldb_application.g_f04(i),''%''||''null%'',NULL) IS NOT NULL THEN'||unistr('\000a')||
'       -- Verificar que el Precio Unitario Cotizado sea numerico de 2 decimales'||unistr('\000a')||
'       BEGIN'||unistr('\000a')||
'         v_comctd_precio_unitario_final := to_number(replace(replace(htmldb_application.g_f02(i),''%''||''null%'',N';

p:=p||'ULL),'','',''.''),''999999999999990.00'');'||unistr('\000a')||
'       EXCEPTION'||unistr('\000a')||
'         WHEN OTHERS THEN'||unistr('\000a')||
'           v_mensaje := v_mensaje || ''<b>Para poder cotizar el Item: ''|| i || ''</b><br>''; '||unistr('\000a')||
'           v_mensaje := v_mensaje||''- Precio Unitario Cotizado debe ser numérico con hasta 2 decimales<br>'';'||unistr('\000a')||
'           -- Identificar que ha sucedido un error de validación en el item actual'||unistr('\000a')||
'           v_comctd_correcto := ''NO'';';

p:=p||''||unistr('\000a')||
'       END;'||unistr('\000a')||
'       -- Si se puede Cotizar en Cero'||unistr('\000a')||
'       IF  v_permite_cotizar_cero_sn = ''NO'' AND v_comctd_precio_unitario_final = 0 THEN'||unistr('\000a')||
'           v_mensaje_cotizacion_en_cero :='||unistr('\000a')||
'            v_mensaje_cotizacion_en_cero || ''<b>La cotización del Item: ''|| i || '' con Precio Cero se concidera como una Donación</b><br>''; '||unistr('\000a')||
'       END IF;'||unistr('\000a')||
'       -- Si se ha pasado la validacion y todos los campos han';

p:=p||' sido cargados correctamente, contar la cantidad de detalles cotizados'||unistr('\000a')||
'       IF v_comctd_correcto = ''SI'' THEN'||unistr('\000a')||
'         v_comctd_cantidad := v_comctd_cantidad +1;'||unistr('\000a')||
'       END IF;'||unistr('\000a')||
'    -- Algunos de los campos cargados (cotizacion incorrecta)'||unistr('\000a')||
'    ELSE'||unistr('\000a')||
'      -- Cargar el mensaje de error correspondiente a cada caso'||unistr('\000a')||
'      v_mensaje       := v_mensaje || ''<b>Para poder cotizar el Item: ''|| i || ''</b><br';

p:=p||'>''; '||unistr('\000a')||
'      IF replace(htmldb_application.g_f02(i),''%''||''null%'',NULL) IS NULL THEN'||unistr('\000a')||
'        v_mensaje := v_mensaje||''- Debe especificar el Precio Unitario Cotizado<br>'';'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'      IF replace(htmldb_application.g_f03(i),''%''||''null%'',NULL) IS NULL THEN'||unistr('\000a')||
'        v_mensaje := v_mensaje||''- Debe especificar la Marca<br>'';'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'      IF replace(htmldb_application.g_f04(i),''%''||''null%'',NU';

p:=p||'LL) IS NULL THEN'||unistr('\000a')||
'        v_mensaje := v_mensaje||''- Debe especificar el Modelo<br>'';'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'      -- Identificar que ha sucedido un error de validación en el item actual'||unistr('\000a')||
'      v_comctd_correcto := ''NO'';'||unistr('\000a')||
'      --'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    -- Si el detalle es correcto (pasa todas las validaciones), actualizar el detalle de la cotización'||unistr('\000a')||
'    IF v_comctd_correcto = ''SI''THEN'||unistr('\000a')||
'      UPDATE COM_COTIZA';

p:=p||'CIONES_DETALLES'||unistr('\000a')||
'      SET precio_unitario_final = v_comctd_precio_unitario_final, '||unistr('\000a')||
'          marca                 = replace(htmldb_application.g_f03(i),''%''||''null%'',NULL),'||unistr('\000a')||
'          modelo                = replace(htmldb_application.g_f04(i),''%''||''null%'',null),'||unistr('\000a')||
'          observacion           = replace(htmldb_application.g_f05(i),''%''||''null%'',null)'||unistr('\000a')||
'      WHERE id = apex_application.g_f01(i);'||unistr('\000a')||
'    ';

p:=p||'END IF;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    END;'||unistr('\000a')||
'    --'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  -- Si no se ha cotizado correctamente ningún item, no se puede confirmar la cotización'||unistr('\000a')||
'  IF v_comctd_cantidad = 0 THEN'||unistr('\000a')||
'     IF :P201_SITUACION = ''NUE'' THEN'||unistr('\000a')||
'     v_mensaje := ''<b>No es posible Confirmar su cotización</b><br> - Debe cotizar correctamente al menos un ítem<br>Recuerde indicar Precio, Marca y Modelo<br>''||v_mensaje;'||unistr('\000a')||
'     ELSE'||unistr('\000a')||
'     v_mensaje ';

p:=p||':= ''<b>Esta cotización se encuentra en blanco</b><br> - Debe cotizar al menos un ítem para que sea tenida en cuenta<br> - Si no desea presentarla en blanco, utilice la opción "Anular"<br>''||v_mensaje;'||unistr('\000a')||
'     END IF;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  -- Desplegar el mensaje de Error si corresponde'||unistr('\000a')||
'  IF v_mensaje IS NOT NULL THEN'||unistr('\000a')||
'     IF v_comctd_cantidad = 0 AND :P201_SITUACION <> ''NUE'' THEN'||unistr('\000a')||
'       :P201_ER';

p:=p||'ROR_VALIDACION := ''FALSE'';'||unistr('\000a')||
'     ELSE'||unistr('\000a')||
'       :P201_ERROR_VALIDACION := ''TRUE'';'||unistr('\000a')||
'     END IF;'||unistr('\000a')||
'     apex_application.g_print_success_message := ''<p style="color:red">''|| v_mensaje ||''</p>'';'||unistr('\000a')||
'  -- Confirmar la cotizacion si no hay errores que reportar'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'     :P201_ERROR_VALIDACION := ''FALSE'';'||unistr('\000a')||
'     COM_PKG.COMCTZ_CONFIRMAR(p_comctz_id => :P201_ID);'||unistr('\000a')||
'     IF v_mensaje_cotizacion_en_cero IS NOT NULL TH';

p:=p||'EN '||unistr('\000a')||
'        v_mensaje_cotizacion_en_cero := ''Se han cotizado Items con valor cero. Confirma que los proveerá en forma Gratuita''; '||unistr('\000a')||
'     END IF; '||unistr('\000a')||
'     apex_application.g_print_success_message := ''Los datos de la Oferta han sido confirmados.<br><br>''||v_mensaje_cotizacion_en_cero;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 21751646241808235 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 201,
  p_process_sequence=> 40,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Confirmar Cotizacion',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>':REQUEST = ''Confirmar'' and :P1_ADEUDA_DPIP_SN = ''NO''',
  p_process_when_type=>'PLSQL_EXPRESSION',
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
'  v_comctd_cantidad NUMBER:=0;'||unistr('\000a')||
'  v_mensaje                    VARCHAR2(2000);'||unistr('\000a')||
'  v_mensaje_cotizacion_en_cero VARCHAR2(2000);'||unistr('\000a')||
'  v_permite_cotizar_cero_sn    VARCHAR2(2);'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  v_permite_cotizar_cero_sn := SEG_PKG.OBTN_SEGCFG_VALOR'||unistr('\000a')||
'                               (P_CODIGO => ''COMPRV_COMCZD_COTIZAR_CERO_SN'''||unistr('\000a')||
'                               ,P_SEGORG_ID => :P1_SEGORG_ID);'||unistr('\000a')||
'  :P201_SE_PUEDE_COTI';

p:=p||'ZAR := COM_PKG.OBTN_COMCON_COTIZAR(p_comcon_id => :P200_COMCON_ID);'||unistr('\000a')||
'  IF :P201_SE_PUEDE_COTIZAR <> ''SI'' THEN'||unistr('\000a')||
'    v_mensaje := v_mensaje||''<b>La presentación de cotizaciones en este proceso esta cerrada</b><br> - No se puede confirmar su cotización<br>'';'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'  -- Actualizar la Observacion'||unistr('\000a')||
'  UPDATE COM_COTIZACIONES'||unistr('\000a')||
'  SET observacion = :P201_OBSERVACION '||unistr('\000a')||
'  WHERE id = :P201_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  -- Recorrer l';

p:=p||'os detalles de la cotización a confirmar  '||unistr('\000a')||
'  FOR i in 1..apex_application.g_f01.count LOOP'||unistr('\000a')||
'    DECLARE'||unistr('\000a')||
'      v_comctd_correcto VARCHAR2(2) := ''SI'';'||unistr('\000a')||
'      v_comctd_precio_unitario_final NUMBER;'||unistr('\000a')||
'    BEGIN'||unistr('\000a')||
'    -- g_f02 (Precio Unitario Cotizado)'||unistr('\000a')||
'    -- g_f03 (Marca)'||unistr('\000a')||
'    -- g_f04 (Modelo)'||unistr('\000a')||
'    -- g_f05 (Observacion)'||unistr('\000a')||
'    -- Todos los campos en blanco (no se ha cotizado)'||unistr('\000a')||
'    IF replace(htmldb_application';

p:=p||'.g_f02(i),''%''||''null%'',NULL) IS NULL AND '||unistr('\000a')||
'       replace(htmldb_application.g_f03(i),''%''||''null%'',NULL) IS NULL AND'||unistr('\000a')||
'       replace(htmldb_application.g_f04(i),''%''||''null%'',NULL) IS NULL THEN'||unistr('\000a')||
'      -- Identificar que ha sucedido un error de validación en el item actual'||unistr('\000a')||
'      v_comctd_correcto := ''SI'';'||unistr('\000a')||
'    -- Todos los campos cargados (se ha cotizado algo)'||unistr('\000a')||
'    ELSIF replace(htmldb_application.g_f02(';

p:=p||'i),''%''||''null%'',NULL) IS NOT NULL AND '||unistr('\000a')||
'       replace(htmldb_application.g_f03(i),''%''||''null%'',NULL) IS NOT NULL AND'||unistr('\000a')||
'       replace(htmldb_application.g_f04(i),''%''||''null%'',NULL) IS NOT NULL THEN'||unistr('\000a')||
'       -- Verificar que el Precio Unitario Cotizado sea numerico de 2 decimales'||unistr('\000a')||
'       BEGIN'||unistr('\000a')||
'         v_comctd_precio_unitario_final := to_number(replace(replace(htmldb_application.g_f02(i),''%''||''null%'',N';

p:=p||'ULL),'','',''.''),''999999999999990.00'');'||unistr('\000a')||
'       EXCEPTION'||unistr('\000a')||
'         WHEN OTHERS THEN'||unistr('\000a')||
'           v_mensaje := v_mensaje || ''<b>Para poder cotizar el Item: ''|| i || ''</b><br>''; '||unistr('\000a')||
'           v_mensaje := v_mensaje||''- Precio Unitario Cotizado debe ser numérico con hasta 2 decimales<br>'';'||unistr('\000a')||
'           -- Identificar que ha sucedido un error de validación en el item actual'||unistr('\000a')||
'           v_comctd_correcto := ''NO'';';

p:=p||''||unistr('\000a')||
'       END;'||unistr('\000a')||
'       -- Si se puede Cotizar en Cero'||unistr('\000a')||
'       IF  v_permite_cotizar_cero_sn = ''NO'' AND v_comctd_precio_unitario_final = 0 THEN'||unistr('\000a')||
'           v_mensaje_cotizacion_en_cero :='||unistr('\000a')||
'            v_mensaje_cotizacion_en_cero || ''<b>La cotización del Item: ''|| i || '' con Precio Cero se concidera como una Donación</b><br>''; '||unistr('\000a')||
'       END IF;'||unistr('\000a')||
'       -- Si se ha pasado la validacion y todos los campos han';

p:=p||' sido cargados correctamente, contar la cantidad de detalles cotizados'||unistr('\000a')||
'       IF v_comctd_correcto = ''SI'' THEN'||unistr('\000a')||
'         v_comctd_cantidad := v_comctd_cantidad +1;'||unistr('\000a')||
'       END IF;'||unistr('\000a')||
'    -- Algunos de los campos cargados (cotizacion incorrecta)'||unistr('\000a')||
'    ELSE'||unistr('\000a')||
'      -- Cargar el mensaje de error correspondiente a cada caso'||unistr('\000a')||
'      v_mensaje       := v_mensaje || ''<b>Para poder cotizar el Item: ''|| i || ''</b><br';

p:=p||'>''; '||unistr('\000a')||
'      IF replace(htmldb_application.g_f02(i),''%''||''null%'',NULL) IS NULL THEN'||unistr('\000a')||
'        v_mensaje := v_mensaje||''- Debe especificar el Precio Unitario Cotizado<br>'';'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'      IF replace(htmldb_application.g_f03(i),''%''||''null%'',NULL) IS NULL THEN'||unistr('\000a')||
'        v_mensaje := v_mensaje||''- Debe especificar la Marca<br>'';'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'      IF replace(htmldb_application.g_f04(i),''%''||''null%'',NU';

p:=p||'LL) IS NULL THEN'||unistr('\000a')||
'        v_mensaje := v_mensaje||''- Debe especificar el Modelo<br>'';'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'      -- Identificar que ha sucedido un error de validación en el item actual'||unistr('\000a')||
'      v_comctd_correcto := ''NO'';'||unistr('\000a')||
'      --'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    -- Si el detalle es correcto (pasa todas las validaciones), actualizar el detalle de la cotización'||unistr('\000a')||
'    IF v_comctd_correcto = ''SI''THEN'||unistr('\000a')||
'      UPDATE COM_COTIZA';

p:=p||'CIONES_DETALLES'||unistr('\000a')||
'      SET precio_unitario_final = v_comctd_precio_unitario_final, '||unistr('\000a')||
'          marca                 = replace(htmldb_application.g_f03(i),''%''||''null%'',NULL),'||unistr('\000a')||
'          modelo                = replace(htmldb_application.g_f04(i),''%''||''null%'',null),'||unistr('\000a')||
'          observacion           = replace(htmldb_application.g_f05(i),''%''||''null%'',null)'||unistr('\000a')||
'      WHERE id = apex_application.g_f01(i);'||unistr('\000a')||
'    ';

p:=p||'END IF;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    END;'||unistr('\000a')||
'    --'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  -- Si no se ha cotizado correctamente ningún item, no se puede confirmar la cotización'||unistr('\000a')||
'  IF v_comctd_cantidad = 0 THEN'||unistr('\000a')||
'     IF :P201_SITUACION = ''NUE'' THEN'||unistr('\000a')||
'     v_mensaje := ''<b>No es posible Confirmar su cotización</b><br> - Debe cotizar correctamente al menos un ítem<br>Recuerde indicar Precio, Marca y Modelo<br>''||v_mensaje;'||unistr('\000a')||
'     ELSE'||unistr('\000a')||
'     v_mensaje ';

p:=p||':= ''<b>Esta cotización se encuentra en blanco</b><br> - Debe cotizar al menos un ítem para que sea tenida en cuenta<br> - Si no desea presentarla en blanco, utilice la opción "Anular"<br>''||v_mensaje;'||unistr('\000a')||
'     END IF;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  -- Desplegar el mensaje de Error si corresponde'||unistr('\000a')||
'  IF v_mensaje IS NOT NULL THEN'||unistr('\000a')||
'     IF v_comctd_cantidad = 0 AND :P201_SITUACION <> ''NUE'' THEN'||unistr('\000a')||
'       :P201_ER';

p:=p||'ROR_VALIDACION := ''FALSE'';'||unistr('\000a')||
'     ELSE'||unistr('\000a')||
'       :P201_ERROR_VALIDACION := ''TRUE'';'||unistr('\000a')||
'     END IF;'||unistr('\000a')||
'     apex_application.g_print_success_message := ''<p style="color:red">''|| v_mensaje ||''</p>'';'||unistr('\000a')||
'  -- Confirmar la cotizacion si no hay errores que reportar'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'     :P201_ERROR_VALIDACION := ''FALSE'';'||unistr('\000a')||
'     COM_PKG.COMCTZ_CONFIRMAR(p_comctz_id => :P201_ID);'||unistr('\000a')||
'     IF v_mensaje_cotizacion_en_cero IS NOT NULL TH';

p:=p||'EN '||unistr('\000a')||
'        v_mensaje_cotizacion_en_cero := v_mensaje_cotizacion_en_cero||''En su defecto Edite el Item e Ingrese valores mayores a Cero''; '||unistr('\000a')||
'     END IF; '||unistr('\000a')||
'     apex_application.g_print_success_message := ''Los datos de la Oferta han sido confirmados.<br><br>''||v_mensaje_cotizacion_en_cero;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 5346840581459256 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 201,
  p_process_sequence=> 50,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Confirmar Cotizacion 2',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>':REQUEST = ''Confirmar_2'' and :P1_ADEUDA_DPIP_SN = ''NO''',
  p_process_when_type=>'PLSQL_EXPRESSION',
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
p:=p||'COM_PKG.COMCTZ_ANULAR(p_comctz_id => :P201_ID);';

wwv_flow_api.create_page_process(
  p_id     => 6866835090690534 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 201,
  p_process_sequence=> 60,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Anular Cotización',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>21281949267644282 + wwv_flow_api.g_id_offset,
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
''||unistr('\000a')||
'v_comctz_id NUMBER;'||unistr('\000a')||
''||unistr('\000a')||
'begin'||unistr('\000a')||
''||unistr('\000a')||
' COMPRV_PKG.COMCTZ_COPIAR(p_comctz_id => :P201_ID'||unistr('\000a')||
'                         ,p_comctz_nue => v_comctz_id );'||unistr('\000a')||
' '||unistr('\000a')||
' :P201_ID_NUE := v_comctz_id;'||unistr('\000a')||
' '||unistr('\000a')||
' '||unistr('\000a')||
' '||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 35034709764808829 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 201,
  p_process_sequence=> 70,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Copiar Cotización',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=>'COPIAR',
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
p:=p||'DECLARE'||unistr('\000a')||
' CURSOR cr_comctz IS'||unistr('\000a')||
' SELECT COUNT(1)'||unistr('\000a')||
' FROM COM_COTIZACIONES '||unistr('\000a')||
' WHERE COMCON_ID = :P200_COMCON_ID'||unistr('\000a')||
'  AND SITUACION NOT IN (''NUE'',''ANU'')'||unistr('\000a')||
'  AND COMPRV_ID = :P1_COMPRV_ID;'||unistr('\000a')||
' v_cantidad NUMBER;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF :P201_ID IS NULL THEN'||unistr('\000a')||
'    COM_PKG.COMCTZ_CREAR(p_comcon_id => :P200_COMCON_ID'||unistr('\000a')||
'                       ,p_comprv_id => :P1_COMPRV_ID'||unistr('\000a')||
'                       ,p_comctz_id => :P201_ID);'||unistr('\000a')||
'    OPEN cr_c';

p:=p||'omctz;'||unistr('\000a')||
'    FETCH cr_comctz INTO v_cantidad;'||unistr('\000a')||
'    CLOSE cr_comctz;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    :P201_OBSERVACION := ''Oferta ''||to_char(NVL(v_cantidad,0)+1);'||unistr('\000a')||
'    :P201_OPERACION := ''EDICION'';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 21614940404966326 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 201,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Crear Cotizacion',
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
p:=p||'IF :P201_OPERACION IS NULL THEN'||unistr('\000a')||
'   :P201_OPERACION := ''CONSULTA'';'||unistr('\000a')||
'END IF;';

wwv_flow_api.create_page_process(
  p_id     => 21287140395644315 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 201,
  p_process_sequence=> 20,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AsignarOperacion',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P201_ID',
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
p:=p||':P200_APP_ANTERIOR := :P201_APP_ANTERIOR;'||unistr('\000a')||
':P200_PAG_ANTERIOR := :P201_PAG_ANTERIOR;';

wwv_flow_api.create_page_process(
  p_id     => 5358825175492641 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 201,
  p_process_sequence=> 30,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Asignar Página Anterior',
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
-- ...updatable report columns for page 201
--
 
begin
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11112714382368957 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 1,
  p_query_column_name=> 'ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11112825650368962 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 2,
  p_query_column_name=> 'ID_DISPLAY',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11112920784368962 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 3,
  p_query_column_name=> 'COMCTZ_ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11113018738368962 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 4,
  p_query_column_name=> 'COMPED_ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11113107976368962 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 5,
  p_query_column_name=> 'COMPET_ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11113224975368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 6,
  p_query_column_name=> 'PRECIO_UNITARIO_FINAL',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11113325223368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 7,
  p_query_column_name=> 'PRECIO_FINAL_COTIZADO',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11113414447368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 8,
  p_query_column_name=> 'MARCA',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11113510009368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 9,
  p_query_column_name=> 'MODELO',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11113600633368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 10,
  p_query_column_name=> 'OBSERVACION',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11113725032368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 11,
  p_query_column_name=> 'EVALUACION',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11113821005368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 12,
  p_query_column_name=> 'MOTIVO_EVALUACION',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11113924407368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 13,
  p_query_column_name=> 'DATE_CREATED',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11114031587368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 14,
  p_query_column_name=> 'CREATED_BY',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11114125474368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 15,
  p_query_column_name=> 'DATE_MODIFIED',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11114231842368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 16,
  p_query_column_name=> 'MODIFIED_BY',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11114309275368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 17,
  p_query_column_name=> 'SEGORG_ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11114401360368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 18,
  p_query_column_name=> 'COMCON_ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11114530471368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 19,
  p_query_column_name=> 'COMPRV_ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11114632426368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 20,
  p_query_column_name=> 'COMCTZ_CODIGO',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11114707848368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 21,
  p_query_column_name=> 'COMCTZ_FECHA',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11114828106368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 22,
  p_query_column_name=> 'COMCTZ_SITUACION',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11114915760368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 23,
  p_query_column_name=> 'COMCTZ_SITUACION_DESC',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11115013598368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 24,
  p_query_column_name=> 'COMPED_CODIGO',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11115105594368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 25,
  p_query_column_name=> 'COMPED_FECHA_SOLICITUD',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11115211808368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 26,
  p_query_column_name=> 'COMPED_COMECO_ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11115300431368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 27,
  p_query_column_name=> 'COMPED_COMCOB_ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11115421075368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 28,
  p_query_column_name=> 'COMPED_EJERCICIO',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11115532624368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 29,
  p_query_column_name=> 'COMPED_CONTRATANTE',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11115626085368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 30,
  p_query_column_name=> 'COMPED_SOLICITANTE',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11115723286368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 31,
  p_query_column_name=> 'COMPED_DESCRIPCION',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11115810709368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 32,
  p_query_column_name=> 'COMPED_CONTACTO',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11115931165368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 33,
  p_query_column_name=> 'COMPED_COMDOM_ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11116021670368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 34,
  p_query_column_name=> 'COMPED_TIPO_ENTREGA',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11116110726368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 35,
  p_query_column_name=> 'COMPED_PLAZO_ENTREGA_CANTIDAD',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11116216387368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 36,
  p_query_column_name=> 'COMPED_PLAZO_ENTREGA_UNIDAD',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11116307243368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 37,
  p_query_column_name=> 'COMPED_FECHA_ENTREGA',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11116412010368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 38,
  p_query_column_name=> 'COMPED_PERIODO_ENTREGA',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11116530746368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 39,
  p_query_column_name=> 'COMPED_PRECIO',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11116606957368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 40,
  p_query_column_name=> 'COMPED_PARTIDA_PRESUPUESTARIA',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11116719121368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 41,
  p_query_column_name=> 'COMPED_EXPEDIENTE',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11116827248368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 42,
  p_query_column_name=> 'COMPED_RESOLUCION',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11116902229368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 43,
  p_query_column_name=> 'COMPED_OBSERVACIONES',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11117004589368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 44,
  p_query_column_name=> 'COMPET_RENGLON',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11117130103368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 45,
  p_query_column_name=> 'COMPET_COMCCL_ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11117223972368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 46,
  p_query_column_name=> 'COMPET_COMCIT_ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11117309480368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 47,
  p_query_column_name=> 'COMPET_CODIGO',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11117404803368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 48,
  p_query_column_name=> 'COMPET_DESCRIPCION',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11117530215368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 49,
  p_query_column_name=> 'COMPET_CANTIDAD',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11117620067368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 50,
  p_query_column_name=> 'COMPET_PRECIO_UNITARIO',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11117729064368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 51,
  p_query_column_name=> 'PRECIO_TOTAL_REFERENCIA',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11117808436368964 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 52,
  p_query_column_name=> 'COMPET_OBSERVACION',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11117928406368965 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 53,
  p_query_column_name=> 'COMPET_SITUACION',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11118019440368965 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 54,
  p_query_column_name=> 'COMPET_SITUACION_DESC',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 11118122256368965 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 55,
  p_query_column_name=> 'HINT',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 38843027050352946 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 21458150917553006 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 56,
  p_query_column_name=> 'ASOCIAR_OBJETO',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
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
