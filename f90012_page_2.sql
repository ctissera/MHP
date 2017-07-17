set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end;
/
 
 
--application/set_environment
prompt  APPLICATION 90012 - Servicio - Portal
--
-- Application Export:
--   Application:     90012
--   Name:            Servicio - Portal
--   Date and Time:   14:38 Viernes Noviembre 25, 2016
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
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,90012);
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
 
end;
/

PROMPT ...Remove page 2
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>2);
 
end;
/

 
--application/pages/page_00002
prompt  ...PAGE 2: Página Secundaria
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 2
 ,p_user_interface_id => 44529930783841211 + wwv_flow_api.g_id_offset
 ,p_name => 'Página Secundaria'
 ,p_step_title => '&P2_TITULO_PAGINA.'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Página Secundaria'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_html_page_header => 
'<style>'||unistr('\000a')||
'#dialog-region{display:none;}'||unistr('\000a')||
'</style>'
 ,p_javascript_code => 
'$(function() {'||unistr('\000a')||
' // a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!'||unistr('\000a')||
' $( "#dialog" ).dialog( "destroy" );'||unistr('\000a')||
' '||unistr('\000a')||
'});'||unistr('\000a')||
''||unistr('\000a')||
'function abrir_region (codigo){'||unistr('\000a')||
'    var get = new htmldb_Get(null,html_GetElement(''pFlowId'').value,''APPLICATION_PROCESS=ObtenerDatosPaginaRegion'',0);'||unistr('\000a')||
'    get.add(''G_CFGPOP_CODIGO'',codigo);'||unistr('\000a')||
'    gReturn = get.get();    '||unistr('\000a')||
'    get = null;'||unistr('\000a')||
'    gReturn ='||
' (!gReturn)?''null'':gReturn;      '||unistr('\000a')||
'    $(''#dialog-region'').empty();'||unistr('\000a')||
'    $(''#dialog-region'').append(gReturn);'||unistr('\000a')||
'    $( "#dialog-region" ).dialog({'||unistr('\000a')||
'      width: 800,'||unistr('\000a')||
'      height: 600,'||unistr('\000a')||
'      modal: true'||unistr('\000a')||
'    });'||unistr('\000a')||
'}'
 ,p_javascript_code_onload => 
'/*$(document).ready(function() {'||unistr('\000a')||
'$(''#s3slider'').s3Slider({'||unistr('\000a')||
'timeOut: 6000 // --> make it a multiple of 6000 and it will be smooth. only tested with 6000 & 12000'||unistr('\000a')||
'});'||unistr('\000a')||
'});'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'$(''#input-busqueda'').on(''keyup'', function(e) {'||unistr('\000a')||
'    if (e.keyCode === 13) {'||unistr('\000a')||
'        $(''#input-busqueda'').change();'||unistr('\000a')||
'        var res =$(''#input-busqueda'').val();'||unistr('\000a')||
'        if ( res != ""){'||unistr('\000a')||
'        	window.location.href = ''f?p=90012:3:&'||
'APP_SESSION.:::3:P3_BUSCAR:''+res;'||unistr('\000a')||
'            //apex.submit("BUSCAR");'||unistr('\000a')||
'        }'||unistr('\000a')||
'    }'||unistr('\000a')||
'});*/'
 ,p_inline_css => 
'.link-red{color:red;font-size:1.063em; font-weight:bold; }'||unistr('\000a')||
'.scl-icons li a {width: 16px;height: 16px;background: url("#WORKSPACE_IMAGES#social-icons.png") 0 0 no-repeat;outline: 0;-moz-outline: 0;display: block;overflow: hidden;text-indent: -4000px;}'||unistr('\000a')||
'.scl-icons li {float: left;margin: 0 0 0 6px;}'||unistr('\000a')||
'.scl-icons li.scl-facebook a {background-position: -164px 0;}'||unistr('\000a')||
'.scl-icons li.scl-facebook a:hover {back'||
'ground-position: -184px 0;}'||unistr('\000a')||
'.scl-icons li.scl-twitter a {background-position: -244px 0;}'||unistr('\000a')||
'.scl-icons li.scl-twitter a:hover {background-position: -264px 0;}'||unistr('\000a')||
'.scl-icons li.scl-youtube a {background-position: -124px 0;}'||unistr('\000a')||
'.scl-icons li.scl-youtube a:hover {background-position: -144px 0;}'||unistr('\000a')||
'.scl-icons li.scl-blogger a {background-position: -4px 0;}'||unistr('\000a')||
'.scl-icons li.scl-blogger a:hover {background-position: -'||
'24px 0;}'||unistr('\000a')||
'.slc {border:0px solid #F33; float:right; width:39%; height:15px; text-align:right; color:#777;}'||unistr('\000a')||
'.slc ul{ display:inline-block; height:12px;}'||unistr('\000a')||
'.slc ul li { list-style:none !important; }'||unistr('\000a')||
'.tit {font-size:16px; font-weight:bold; margin-top:0px; border:0px solid; float:left; width:60%;}'||unistr('\000a')||
'.nov {border-bottom: rgb(221, 221, 221) dotted 1px; padding: 10px 0px;}'||unistr('\000a')||
'.nov:last-child {border-bottom: none'||
';}'||unistr('\000a')||
'.tags {font-size: 10px;color: rgb(83, 83, 83);}'||unistr('\000a')||
''||unistr('\000a')||
'@media only screen '||unistr('\000a')||
'and (min-width : 0px)'||unistr('\000a')||
'and (max-width : 768px) {'||unistr('\000a')||
'/* Styles */'||unistr('\000a')||
' #slider_superior{display:none !important;}'||unistr('\000a')||
' #desktop{display:none !important;}'||unistr('\000a')||
'}'||unistr('\000a')||
'@media only screen '||unistr('\000a')||
'and (min-width : 769px) {'||unistr('\000a')||
'/* Styles */'||unistr('\000a')||
' #smartphone{display:none !important;}'||unistr('\000a')||
'}'||unistr('\000a')||
''
 ,p_step_template => 60024869689939025 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_page_comment => '$(function() {'||unistr('\000a')||
' // a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!'||unistr('\000a')||
' $( "#dialog" ).dialog( "destroy" );'||unistr('\000a')||
' '||unistr('\000a')||
'});'||unistr('\000a')||
''||unistr('\000a')||
'function abrir_region (codigo){'||unistr('\000a')||
'    var get = new htmldb_Get(null,html_GetElement(''pFlowId'').value,''APPLICATION_PROCESS=ObtenerDatosPaginaRegion'',0);'||unistr('\000a')||
'    get.add(''G_CFGPOP_CODIGO'',codigo);'||unistr('\000a')||
'    gReturn = get.get();    '||unistr('\000a')||
'    get = null;'||unistr('\000a')||
''||unistr('\000a')||
'    gReturn = (!gReturn)?''null'':gReturn;      '||unistr('\000a')||
'    $(''#dialog-region'').empty();'||unistr('\000a')||
'    $(''#dialog-region'').append(gReturn);'||unistr('\000a')||
'    $( "#dialog-region" ).dialog({'||unistr('\000a')||
'      width: 800,'||unistr('\000a')||
'      height: 600,'||unistr('\000a')||
'      modal: true'||unistr('\000a')||
'    });'||unistr('\000a')||
'}'
 ,p_last_updated_by => 'HSANCHEZ'
 ,p_last_upd_yyyymmddhh24miss => '20161124161218'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select 1 as id'||unistr('\000a')||
', ''f?p=&APP_ID.:1:&SESSION.:APPLICATION_PROCESS=fondo_slide:::G_DIAPOSITIVA_ID:''||to_char(CFGDIA_ID) as image'||unistr('\000a')||
', CFGDIA_TITULO text'||unistr('\000a')||
'from CFG_PORTAL_PAGDIA_V'||unistr('\000a')||
' where CFGPOP_ID =  :P2_CFGPOP_POR_ID'||unistr('\000a')||
'   and CFGDIA_SITUACION = ''APR'''||unistr('\000a')||
'   and SITUACION = ''PUB'''||unistr('\000a')||
'   and sysdate between nvl(PUBLICACION_DESDE,sysdate) and nvl (PUBLICACION_HASTA,sysdate)'||unistr('\000a')||
'order by ORDEN';

wwv_flow_api.create_page_plug (
  p_id=> 44533018928354990 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Slider Responsibe',
  p_region_name=>'slider_superior',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 60053457202939040+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_SLIDER_R',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'EXISTS',
  p_plug_display_when_condition => 'select 1 from CFG_PORTAL_PAGDIA_V'||unistr('\000a')||
' where CFGPOP_ID =  :P2_CFGPOP_POR_ID'||unistr('\000a')||
'   and CFGDIA_SITUACION = ''APR'''||unistr('\000a')||
'   and SITUACION = ''PUB'''||unistr('\000a')||
'   and sysdate between nvl(PUBLICACION_DESDE,sysdate) and nvl (PUBLICACION_HASTA,sysdate)'||unistr('\000a')||
'   and  :P2_ESTILO_CABECERA  = ''DIA''',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'fade',
  p_attribute_02 => '800',
  p_attribute_03 => '3000',
  p_attribute_04 => 'true',
  p_attribute_05 => 'false',
  p_attribute_06 => 'true',
  p_attribute_07 => 'FF0000',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'declare'||unistr('\000a')||
'  -- Para obtener los enlaces configurados para la página'||unistr('\000a')||
'  cursor cr_pagenl is'||unistr('\000a')||
'  select replace(replace(enlace,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')) enlace'||unistr('\000a')||
'       , atributos_enlace'||unistr('\000a')||
'       , consejo'||unistr('\000a')||
'       , replace(replace(etiqueta,''WKSP_IMG'',v(''WORKSPACE_IMAGES'')),''APP_IMG'',v(''APP_IMAGES'')) etiqueta'||unistr('\000a')||
'    from CFG_PORTAL_PAGENL_V'||unistr('\000a')||
'   where CFGPOP_ID =  :P2_CFGPOP_POR_ID'||unistr('\000a')||
'     and SI';

s:=s||'TUACION = ''PUB'''||unistr('\000a')||
'     and interface in (''TODAS'',''DESKTOP'')'||unistr('\000a')||
'   and sysdate between nvl(PUBLICACION_DESDE,sysdate) and nvl (PUBLICACION_HASTA,sysdate)'||unistr('\000a')||
'     and CFG_BI_PKG.CFGPPE_SEGUSU_AUTHO(p_cfgppe_id => id, p_segusu_id => :P2_SEGUSU_ID) = ''SI'''||unistr('\000a')||
'   order by ORDEN;'||unistr('\000a')||
'  -- Para obtener las configuración de noticias'||unistr('\000a')||
'  cursor cr_notcfg is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_configuraciones'||unistr('\000a')||
'  where segorg_id = :p1_segor';

s:=s||'g_id;'||unistr('\000a')||
'  -- Para obtener las novedades a publicar'||unistr('\000a')||
'  cursor cr_notnov is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_novedades'||unistr('\000a')||
'  where segorg_id = :p1_segorg_id'||unistr('\000a')||
'    and sysdate between publicado_desde and nvl(publicado_hasta,sysdate)'||unistr('\000a')||
'    and situacion = ''VAL'''||unistr('\000a')||
'  order by id desc;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_enlaces VARCHAR(4000);  '||unistr('\000a')||
'  v_notcfg not_configuraciones%rowtype;'||unistr('\000a')||
'  i number:=0;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Si se muestran los mensajes de Cuerpo'||unistr('\000a')||
' ';

s:=s||' if :P2_CFGPOP_COL1 = ''CUERPO'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    --htp.print(''<div class="tit">&P2_TITULO_PORTAL.</div><br><br>'');'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_2.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_3.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_4.'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si Se muestran los enlaces'||unistr('\000a')||
'  elsif :P2_CFGPOP_COL1 = ''ENLACES'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'  ';

s:=s||'  htp.print(''<div class="tit">Enlaces</div><br><br>'');'||unistr('\000a')||
'    -- Armar y Mostrar enlaces'||unistr('\000a')||
'    v_enlaces :=''<ul class="uVerticalSidebarList">'';        '||unistr('\000a')||
'    for v_pagenl in cr_pagenl loop'||unistr('\000a')||
'      v_enlaces := v_enlaces || ''<li><a href="''||v_pagenl.ENLACE||''" ''||v_pagenl.ATRIBUTOS_ENLACE||'' alt="''||v_pagenl.CONSEJO||''" title="''||v_pagenl.CONSEJO||''">''||v_pagenl.ETIQUETA||''</a></li>'';      '||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'  ';

s:=s||'  v_enlaces := v_enlaces || ''</ul>'';'||unistr('\000a')||
'    htp.print(v_enlaces); '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si se muestran las novedades de noticias'||unistr('\000a')||
'  elsif :P2_CFGPOP_COL1 = ''NOTICIAS'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div><div class="tit">Novedades Etiquetadas Recientemente</div>'');'||unistr('\000a')||
'    -- Obtener la configuración de noticias'||unistr('\000a')||
'    open cr_notcfg;'||unistr('\000a')||
'    fetch cr_notcfg into v_notcfg;'||unistr('\000a')||
'    close cr_notcfg;'||unistr('\000a')||
'    -- Si no esta configu';

s:=s||'rado, el servicio no esta habilitado'||unistr('\000a')||
'    if v_notcfg.ID is null then'||unistr('\000a')||
'      htp.print(''<br><br>El Servicio de Noticias y Novedades no se encuentra habilitado'');'||unistr('\000a')||
'    -- Si esta configurado el servicio de noticias'||unistr('\000a')||
'    else'||unistr('\000a')||
'      -- Si existen, Agregar enlaces a sitios Sociales'||unistr('\000a')||
'      if v_notcfg.blog_url is not null or'||unistr('\000a')||
'         v_notcfg.facebook_url is not null or'||unistr('\000a')||
'         v_notcfg.youtube_url is not ';

s:=s||'null or'||unistr('\000a')||
'         v_notcfg.twitter_url is not null then'||unistr('\000a')||
'        -- Título'||unistr('\000a')||
'        htp.print('' <div class="slc">Mantente conectado: <ul class="scl-icons">'');'||unistr('\000a')||
'        -- Enlace a blog'||unistr('\000a')||
'        if v_notcfg.blog_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-blogger"><a href="''||v_notcfg.blog_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Facebook'||unistr('\000a')||
'        if v_notcfg.';

s:=s||'facebook_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-facebook"><a href="''||v_notcfg.facebook_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Youtube'||unistr('\000a')||
'        if v_notcfg.youtube_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-youtube"><a href="''||v_notcfg.youtube_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Twitter'||unistr('\000a')||
'        i';

s:=s||'f v_notcfg.twitter_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-twitter"><a href="''||v_notcfg.twitter_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --'||unistr('\000a')||
'        htp.print(''</ul></div></div>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      --  '||unistr('\000a')||
'      htp.print(''<br><br>'');'||unistr('\000a')||
'      -- Novedades'||unistr('\000a')||
'      for v_notnov in cr_notnov loop'||unistr('\000a')||
'        i := i+1;'||unistr('\000a')||
'        -- Publicar novedad'||unistr('\000a')||
'        htp.print(''<div cl';

s:=s||'ass="nov">'');'||unistr('\000a')||
'        -- Enlace'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''<a href="''||v_notnov.url||''" target="_blank">'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Titulo'||unistr('\000a')||
'        htp.print(''<b>''||v_notnov.titulo||''</b>'');'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''</a>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Resumen'||unistr('\000a')||
'        if v_notnov.resumen is not null then'||unistr('\000a')||
'          htp.print(''<';

s:=s||'br>''||v_notnov.resumen);'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Fecha Publicación'||unistr('\000a')||
'        htp.print(''<div class="tags">Publicado ''||to_char(v_notnov.publicado_desde,''dd/mm/yyyy''));'||unistr('\000a')||
'        -- Tags'||unistr('\000a')||
'        if v_notnov.tag1 is not null then'||unistr('\000a')||
'          htp.print('' // Tags: '');'||unistr('\000a')||
'          if v_notcfg.tag_url is not null then '||unistr('\000a')||
'            htp.print(''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag1)||''" target=';

s:=s||'"_blank">''||lower(v_notnov.tag1)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag2)||''" target="_blank">''||lower(v_notnov.tag2)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag3)||''" target="_blank">''||lower(v_notnov.tag3)||''</a>'');'||unistr('\000a')||
'          else'||unistr('\000a')||
'            htp.print(lower(v_notnov.tag1)||'' - ''||lower(v_notnov.tag2)||'' - ''||lower(v_notnov.tag3));'||unistr('\000a')||
'     ';

s:=s||'     end if;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        -- Solo mostrar la cantidad maxima indicada el la configuración del servicio de noticias'||unistr('\000a')||
'        if i >= v_notcfg.NOTNOV_MAXCNT then'||unistr('\000a')||
'          exit;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --   '||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      -- Si no existen novedades para publicar'||unistr('\000a')||
'      if i = 0 then'||unistr('\000a')||
'        htp.print(''<br><br>No existen Noved';

s:=s||'ades Etiquetadas Recientemente ... <br><br>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 46711608609514225 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Columna Simple',
  p_region_name=>'desktop',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 60053457202939040+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => ':P2_CFGPOP_COL1 IS NOT NULL AND :P2_CFGPOP_COL2 IS NULL AND :P2_CFGPOP_COL3 IS NULL',
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
  p_id=> 46713631867625057 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Selector de Organización',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_07',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => 'USER_IS_PUBLIC_USER',
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
s:=s||'declare'||unistr('\000a')||
'  -- Para obtener los enlaces configurados para la página'||unistr('\000a')||
'  cursor cr_pagenl is'||unistr('\000a')||
'  select replace(replace(enlace,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')) enlace'||unistr('\000a')||
'       , atributos_enlace'||unistr('\000a')||
'       , consejo'||unistr('\000a')||
'       , replace(replace(etiqueta,''WKSP_IMG'',v(''WORKSPACE_IMAGES'')),''APP_IMG'',v(''APP_IMAGES'')) etiqueta'||unistr('\000a')||
'    from CFG_PORTAL_PAGENL_V'||unistr('\000a')||
'   where CFGPOP_ID =  :P2_CFGPOP_POR_ID'||unistr('\000a')||
'     and SI';

s:=s||'TUACION = ''PUB'''||unistr('\000a')||
'     and interface in (''TODAS'',''SMARTPHONE'')'||unistr('\000a')||
'   and sysdate between nvl(PUBLICACION_DESDE,sysdate) and nvl (PUBLICACION_HASTA,sysdate)'||unistr('\000a')||
'     and CFG_BI_PKG.CFGPPE_SEGUSU_AUTHO(p_cfgppe_id => id, p_segusu_id => :P2_SEGUSU_ID) = ''SI'''||unistr('\000a')||
'   order by ORDEN;'||unistr('\000a')||
'  -- Para obtener las configuración de noticias'||unistr('\000a')||
'  cursor cr_notcfg is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_configuraciones'||unistr('\000a')||
'  where segorg_id = :p1_se';

s:=s||'gorg_id;'||unistr('\000a')||
'  -- Para obtener las novedades a publicar'||unistr('\000a')||
'  cursor cr_notnov is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_novedades'||unistr('\000a')||
'  where segorg_id = :p1_segorg_id'||unistr('\000a')||
'    and sysdate between publicado_desde and nvl(publicado_hasta,sysdate)'||unistr('\000a')||
'    and situacion = ''VAL'''||unistr('\000a')||
'  order by id desc;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_enlaces VARCHAR(4000);  '||unistr('\000a')||
'  v_notcfg not_configuraciones%rowtype;'||unistr('\000a')||
'  i number:=0;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Si se muestran los mensajes de Cuerp';

s:=s||'o'||unistr('\000a')||
'  if :P2_CFGPOP_COL1 = ''CUERPO'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    --htp.print(''<div class="tit">&P2_TITULO_PORTAL.</div><br><br>'');'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_2.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_3.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_4.'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si Se muestran los enlaces'||unistr('\000a')||
'  elsif :P2_CFGPOP_COL1 = ''ENLACES'' then'||unistr('\000a')||
'    -- Titulo';

s:=s||''||unistr('\000a')||
'    htp.print(''<div class="tit">Enlaces</div><br><br>'');'||unistr('\000a')||
'    -- Armar y Mostrar enlaces'||unistr('\000a')||
'    v_enlaces :=''<ul class="uVerticalSidebarList">'';        '||unistr('\000a')||
'    for v_pagenl in cr_pagenl loop'||unistr('\000a')||
'      v_enlaces := v_enlaces || ''<li><a href="''||v_pagenl.ENLACE||''" ''||v_pagenl.ATRIBUTOS_ENLACE||'' alt="''||v_pagenl.CONSEJO||''" title="''||v_pagenl.CONSEJO||''">''||v_pagenl.ETIQUETA||''</a></li>'';      '||unistr('\000a')||
'    end loop;';

s:=s||''||unistr('\000a')||
'    v_enlaces := v_enlaces || ''</ul>'';'||unistr('\000a')||
'    htp.print(v_enlaces); '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si se muestran las novedades de noticias'||unistr('\000a')||
'  elsif :P2_CFGPOP_COL1 = ''NOTICIAS'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div><div class="tit">Novedades Etiquetadas Recientemente</div>'');'||unistr('\000a')||
'    -- Obtener la configuración de noticias'||unistr('\000a')||
'    open cr_notcfg;'||unistr('\000a')||
'    fetch cr_notcfg into v_notcfg;'||unistr('\000a')||
'    close cr_notcfg;'||unistr('\000a')||
'    -- Si no esta conf';

s:=s||'igurado, el servicio no esta habilitado'||unistr('\000a')||
'    if v_notcfg.ID is null then'||unistr('\000a')||
'      htp.print(''<br><br>El Servicio de Noticias y Novedades no se encuentra habilitado'');'||unistr('\000a')||
'    -- Si esta configurado el servicio de noticias'||unistr('\000a')||
'    else'||unistr('\000a')||
'      -- Si existen, Agregar enlaces a sitios Sociales'||unistr('\000a')||
'      if v_notcfg.blog_url is not null or'||unistr('\000a')||
'         v_notcfg.facebook_url is not null or'||unistr('\000a')||
'         v_notcfg.youtube_url is n';

s:=s||'ot null or'||unistr('\000a')||
'         v_notcfg.twitter_url is not null then'||unistr('\000a')||
'        -- Título'||unistr('\000a')||
'        htp.print('' <div class="slc">Mantente conectado: <ul class="scl-icons">'');'||unistr('\000a')||
'        -- Enlace a blog'||unistr('\000a')||
'        if v_notcfg.blog_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-blogger"><a href="''||v_notcfg.blog_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Facebook'||unistr('\000a')||
'        if v_notc';

s:=s||'fg.facebook_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-facebook"><a href="''||v_notcfg.facebook_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Youtube'||unistr('\000a')||
'        if v_notcfg.youtube_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-youtube"><a href="''||v_notcfg.youtube_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Twitter'||unistr('\000a')||
'      ';

s:=s||'  if v_notcfg.twitter_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-twitter"><a href="''||v_notcfg.twitter_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --'||unistr('\000a')||
'        htp.print(''</ul></div></div>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      --  '||unistr('\000a')||
'      htp.print(''<br><br>'');'||unistr('\000a')||
'      -- Novedades'||unistr('\000a')||
'      for v_notnov in cr_notnov loop'||unistr('\000a')||
'        i := i+1;'||unistr('\000a')||
'        -- Publicar novedad'||unistr('\000a')||
'        htp.print(''<div';

s:=s||' class="nov">'');'||unistr('\000a')||
'        -- Enlace'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''<a href="''||v_notnov.url||''" target="_blank">'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Titulo'||unistr('\000a')||
'        htp.print(''<b>''||v_notnov.titulo||''</b>'');'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''</a>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Resumen'||unistr('\000a')||
'        if v_notnov.resumen is not null then'||unistr('\000a')||
'          htp.print';

s:=s||'(''<br>''||v_notnov.resumen);'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Fecha Publicación'||unistr('\000a')||
'        htp.print(''<div class="tags">Publicado ''||to_char(v_notnov.publicado_desde,''dd/mm/yyyy''));'||unistr('\000a')||
'        -- Tags'||unistr('\000a')||
'        if v_notnov.tag1 is not null then'||unistr('\000a')||
'          htp.print('' // Tags: '');'||unistr('\000a')||
'          if v_notcfg.tag_url is not null then '||unistr('\000a')||
'            htp.print(''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag1)||''" targ';

s:=s||'et="_blank">''||lower(v_notnov.tag1)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag2)||''" target="_blank">''||lower(v_notnov.tag2)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag3)||''" target="_blank">''||lower(v_notnov.tag3)||''</a>'');'||unistr('\000a')||
'          else'||unistr('\000a')||
'            htp.print(lower(v_notnov.tag1)||'' - ''||lower(v_notnov.tag2)||'' - ''||lower(v_notnov.tag3));'||unistr('\000a')||
'  ';

s:=s||'        end if;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        -- Solo mostrar la cantidad maxima indicada el la configuración del servicio de noticias'||unistr('\000a')||
'        if i >= v_notcfg.NOTNOV_MAXCNT then'||unistr('\000a')||
'          exit;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --   '||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      -- Si no existen novedades para publicar'||unistr('\000a')||
'      if i = 0 then'||unistr('\000a')||
'        htp.print(''<br><br>No existen No';

s:=s||'vedades Etiquetadas Recientemente ... <br><br>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 46714532045662906 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Columna Simple Smartphone',
  p_region_name=>'smartphone',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 60053457202939040+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 11,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => ':P2_CFGPOP_COL1 IS NOT NULL AND :P2_CFGPOP_COL2 IS NULL AND :P2_CFGPOP_COL3 IS NULL',
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
s:=s||'declare'||unistr('\000a')||
'  -- Para obtener los enlaces configurados para la página'||unistr('\000a')||
'  cursor cr_pagenl is'||unistr('\000a')||
'  select replace(replace(enlace,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')) enlace'||unistr('\000a')||
'       , atributos_enlace'||unistr('\000a')||
'       , consejo'||unistr('\000a')||
'       , replace(replace(etiqueta,''WKSP_IMG'',v(''WORKSPACE_IMAGES'')),''APP_IMG'',v(''APP_IMAGES'')) etiqueta'||unistr('\000a')||
'    from CFG_PORTAL_PAGENL_V'||unistr('\000a')||
'   where CFGPOP_ID =  :P2_CFGPOP_POR_ID'||unistr('\000a')||
'     and SI';

s:=s||'TUACION = ''PUB'''||unistr('\000a')||
'     and interface in (''TODAS'',''DESKTOP'')'||unistr('\000a')||
'   and sysdate between nvl(PUBLICACION_DESDE,sysdate) and nvl (PUBLICACION_HASTA,sysdate)'||unistr('\000a')||
'     and CFG_BI_PKG.CFGPPE_SEGUSU_AUTHO(p_cfgppe_id => id, p_segusu_id => :P2_SEGUSU_ID) = ''SI'''||unistr('\000a')||
'   order by ORDEN;'||unistr('\000a')||
'  -- Para obtener las configuración de noticias'||unistr('\000a')||
'  cursor cr_notcfg is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_configuraciones'||unistr('\000a')||
'  where segorg_id = :p1_segor';

s:=s||'g_id;'||unistr('\000a')||
'  -- Para obtener las novedades a publicar'||unistr('\000a')||
'  cursor cr_notnov is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_novedades'||unistr('\000a')||
'  where segorg_id = :p1_segorg_id'||unistr('\000a')||
'    and sysdate between publicado_desde and nvl(publicado_hasta,sysdate)'||unistr('\000a')||
'    and situacion = ''VAL'''||unistr('\000a')||
'  order by id desc;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_enlaces VARCHAR(4000);  '||unistr('\000a')||
'  v_notcfg not_configuraciones%rowtype;'||unistr('\000a')||
'  i number:=0;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Si se muestran los mensajes de Cuerpo'||unistr('\000a')||
' ';

s:=s||' if :P2_CFGPOP_COL1 = ''CUERPO'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    --htp.print(''<div class="tit">&P2_TITULO_PORTAL.</div><br><br>'');'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_2.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_3.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_4.'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si Se muestran los enlaces'||unistr('\000a')||
'  elsif :P2_CFGPOP_COL1 = ''ENLACES'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'  ';

s:=s||'  htp.print(''<div class="tit">Enlaces</div><br><br>'');'||unistr('\000a')||
'    -- Armar y Mostrar enlaces'||unistr('\000a')||
'    v_enlaces :=''<ul class="uVerticalSidebarList">'';        '||unistr('\000a')||
'    for v_pagenl in cr_pagenl loop'||unistr('\000a')||
'      v_enlaces := v_enlaces || ''<li><a href="''||v_pagenl.ENLACE||''" ''||v_pagenl.ATRIBUTOS_ENLACE||'' alt="''||v_pagenl.CONSEJO||''" title="''||v_pagenl.CONSEJO||''">''||v_pagenl.ETIQUETA||''</a></li>'';      '||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'  ';

s:=s||'  v_enlaces := v_enlaces || ''</ul>'';'||unistr('\000a')||
'    htp.print(v_enlaces); '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si se muestran las novedades de noticias'||unistr('\000a')||
'  elsif :P2_CFGPOP_COL1 = ''NOTICIAS'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div><div class="tit">Novedades Etiquetadas Recientemente</div>'');'||unistr('\000a')||
'    -- Obtener la configuración de noticias'||unistr('\000a')||
'    open cr_notcfg;'||unistr('\000a')||
'    fetch cr_notcfg into v_notcfg;'||unistr('\000a')||
'    close cr_notcfg;'||unistr('\000a')||
'    -- Si no esta configu';

s:=s||'rado, el servicio no esta habilitado'||unistr('\000a')||
'    if v_notcfg.ID is null then'||unistr('\000a')||
'      htp.print(''<br><br>El Servicio de Noticias y Novedades no se encuentra habilitado'');'||unistr('\000a')||
'    -- Si esta configurado el servicio de noticias'||unistr('\000a')||
'    else'||unistr('\000a')||
'      -- Si existen, Agregar enlaces a sitios Sociales'||unistr('\000a')||
'      if v_notcfg.blog_url is not null or'||unistr('\000a')||
'         v_notcfg.facebook_url is not null or'||unistr('\000a')||
'         v_notcfg.youtube_url is not ';

s:=s||'null or'||unistr('\000a')||
'         v_notcfg.twitter_url is not null then'||unistr('\000a')||
'        -- Título'||unistr('\000a')||
'        htp.print('' <div class="slc">Mantente conectado: <ul class="scl-icons">'');'||unistr('\000a')||
'        -- Enlace a blog'||unistr('\000a')||
'        if v_notcfg.blog_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-blogger"><a href="''||v_notcfg.blog_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Facebook'||unistr('\000a')||
'        if v_notcfg.';

s:=s||'facebook_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-facebook"><a href="''||v_notcfg.facebook_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Youtube'||unistr('\000a')||
'        if v_notcfg.youtube_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-youtube"><a href="''||v_notcfg.youtube_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Twitter'||unistr('\000a')||
'        i';

s:=s||'f v_notcfg.twitter_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-twitter"><a href="''||v_notcfg.twitter_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --'||unistr('\000a')||
'        htp.print(''</ul></div></div>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      --  '||unistr('\000a')||
'      htp.print(''<br><br>'');'||unistr('\000a')||
'      -- Novedades'||unistr('\000a')||
'      for v_notnov in cr_notnov loop'||unistr('\000a')||
'        i := i+1;'||unistr('\000a')||
'        -- Publicar novedad'||unistr('\000a')||
'        htp.print(''<div cl';

s:=s||'ass="nov">'');'||unistr('\000a')||
'        -- Enlace'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''<a href="''||v_notnov.url||''" target="_blank">'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Titulo'||unistr('\000a')||
'        htp.print(''<b>''||v_notnov.titulo||''</b>'');'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''</a>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Resumen'||unistr('\000a')||
'        if v_notnov.resumen is not null then'||unistr('\000a')||
'          htp.print(''<';

s:=s||'br>''||v_notnov.resumen);'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Fecha Publicación'||unistr('\000a')||
'        htp.print(''<div class="tags">Publicado ''||to_char(v_notnov.publicado_desde,''dd/mm/yyyy''));'||unistr('\000a')||
'        -- Tags'||unistr('\000a')||
'        if v_notnov.tag1 is not null then'||unistr('\000a')||
'          htp.print('' // Tags: '');'||unistr('\000a')||
'          if v_notcfg.tag_url is not null then '||unistr('\000a')||
'            htp.print(''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag1)||''" target=';

s:=s||'"_blank">''||lower(v_notnov.tag1)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag2)||''" target="_blank">''||lower(v_notnov.tag2)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag3)||''" target="_blank">''||lower(v_notnov.tag3)||''</a>'');'||unistr('\000a')||
'          else'||unistr('\000a')||
'            htp.print(lower(v_notnov.tag1)||'' - ''||lower(v_notnov.tag2)||'' - ''||lower(v_notnov.tag3));'||unistr('\000a')||
'     ';

s:=s||'     end if;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        -- Solo mostrar la cantidad maxima indicada el la configuración del servicio de noticias'||unistr('\000a')||
'        if i >= v_notcfg.NOTNOV_MAXCNT then'||unistr('\000a')||
'          exit;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --   '||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      -- Si no existen novedades para publicar'||unistr('\000a')||
'      if i = 0 then'||unistr('\000a')||
'        htp.print(''<br><br>No existen Noved';

s:=s||'ades Etiquetadas Recientemente ... <br><br>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 46715119840678357 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Columna Doble (1)',
  p_region_name=>'desktop',
  p_region_css_classes=>'fondo-gris',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 60053457202939040+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => ':P2_CFGPOP_COL1 IS NOT NULL AND :P2_CFGPOP_COL2 IS NOT NULL AND :P2_CFGPOP_COL3 IS NULL',
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
s:=s||'declare'||unistr('\000a')||
'  -- Para obtener los enlaces configurados para la página'||unistr('\000a')||
'  cursor cr_pagenl is'||unistr('\000a')||
'  select replace(replace(enlace,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')) enlace'||unistr('\000a')||
'       , atributos_enlace'||unistr('\000a')||
'       , consejo'||unistr('\000a')||
'       , replace(replace(etiqueta,''WKSP_IMG'',v(''WORKSPACE_IMAGES'')),''APP_IMG'',v(''APP_IMAGES'')) etiqueta'||unistr('\000a')||
'    from CFG_PORTAL_PAGENL_V'||unistr('\000a')||
'   where CFGPOP_ID =  :P2_CFGPOP_POR_ID'||unistr('\000a')||
'     and SI';

s:=s||'TUACION = ''PUB'''||unistr('\000a')||
'     and interface in (''TODAS'',''SMARTPHONE'')'||unistr('\000a')||
'   and sysdate between nvl(PUBLICACION_DESDE,sysdate) and nvl (PUBLICACION_HASTA,sysdate)'||unistr('\000a')||
'     and CFG_BI_PKG.CFGPPE_SEGUSU_AUTHO(p_cfgppe_id => id, p_segusu_id => :P2_SEGUSU_ID) = ''SI'''||unistr('\000a')||
'   order by ORDEN;'||unistr('\000a')||
'  -- Para obtener las configuración de noticias'||unistr('\000a')||
'  cursor cr_notcfg is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_configuraciones'||unistr('\000a')||
'  where segorg_id = :p1_se';

s:=s||'gorg_id;'||unistr('\000a')||
'  -- Para obtener las novedades a publicar'||unistr('\000a')||
'  cursor cr_notnov is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_novedades'||unistr('\000a')||
'  where segorg_id = :p1_segorg_id'||unistr('\000a')||
'    and sysdate between publicado_desde and nvl(publicado_hasta,sysdate)'||unistr('\000a')||
'    and situacion = ''VAL'''||unistr('\000a')||
'  order by id desc;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_enlaces VARCHAR(4000);  '||unistr('\000a')||
'  v_notcfg not_configuraciones%rowtype;'||unistr('\000a')||
'  i number:=0;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Si se muestran los mensajes de Cuerp';

s:=s||'o'||unistr('\000a')||
'  if :P2_CFGPOP_COL1 = ''CUERPO'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    --htp.print(''<div class="tit">&P2_TITULO_PORTAL.</div><br><br>'');'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_2.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_3.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_4.'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si Se muestran los enlaces'||unistr('\000a')||
'  elsif :P2_CFGPOP_COL1 = ''ENLACES'' then'||unistr('\000a')||
'    -- Titulo';

s:=s||''||unistr('\000a')||
'    htp.print(''<div class="tit">Enlaces</div><br><br>'');'||unistr('\000a')||
'    -- Armar y Mostrar enlaces'||unistr('\000a')||
'    v_enlaces :=''<ul class="uVerticalSidebarList">'';        '||unistr('\000a')||
'    for v_pagenl in cr_pagenl loop'||unistr('\000a')||
'      v_enlaces := v_enlaces || ''<li><a href="''||v_pagenl.ENLACE||''" ''||v_pagenl.ATRIBUTOS_ENLACE||'' alt="''||v_pagenl.CONSEJO||''" title="''||v_pagenl.CONSEJO||''">''||v_pagenl.ETIQUETA||''</a></li>'';      '||unistr('\000a')||
'    end loop;';

s:=s||''||unistr('\000a')||
'    v_enlaces := v_enlaces || ''</ul>'';'||unistr('\000a')||
'    htp.print(v_enlaces); '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si se muestran las novedades de noticias'||unistr('\000a')||
'  elsif :P2_CFGPOP_COL1 = ''NOTICIAS'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div><div class="tit">Novedades Etiquetadas Recientemente</div>'');'||unistr('\000a')||
'    -- Obtener la configuración de noticias'||unistr('\000a')||
'    open cr_notcfg;'||unistr('\000a')||
'    fetch cr_notcfg into v_notcfg;'||unistr('\000a')||
'    close cr_notcfg;'||unistr('\000a')||
'    -- Si no esta conf';

s:=s||'igurado, el servicio no esta habilitado'||unistr('\000a')||
'    if v_notcfg.ID is null then'||unistr('\000a')||
'      htp.print(''<br><br>El Servicio de Noticias y Novedades no se encuentra habilitado'');'||unistr('\000a')||
'    -- Si esta configurado el servicio de noticias'||unistr('\000a')||
'    else'||unistr('\000a')||
'      -- Si existen, Agregar enlaces a sitios Sociales'||unistr('\000a')||
'      if v_notcfg.blog_url is not null or'||unistr('\000a')||
'         v_notcfg.facebook_url is not null or'||unistr('\000a')||
'         v_notcfg.youtube_url is n';

s:=s||'ot null or'||unistr('\000a')||
'         v_notcfg.twitter_url is not null then'||unistr('\000a')||
'        -- Título'||unistr('\000a')||
'        htp.print('' <div class="slc">Mantente conectado: <ul class="scl-icons">'');'||unistr('\000a')||
'        -- Enlace a blog'||unistr('\000a')||
'        if v_notcfg.blog_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-blogger"><a href="''||v_notcfg.blog_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Facebook'||unistr('\000a')||
'        if v_notc';

s:=s||'fg.facebook_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-facebook"><a href="''||v_notcfg.facebook_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Youtube'||unistr('\000a')||
'        if v_notcfg.youtube_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-youtube"><a href="''||v_notcfg.youtube_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Twitter'||unistr('\000a')||
'      ';

s:=s||'  if v_notcfg.twitter_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-twitter"><a href="''||v_notcfg.twitter_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --'||unistr('\000a')||
'        htp.print(''</ul></div></div>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      --  '||unistr('\000a')||
'      htp.print(''<br><br>'');'||unistr('\000a')||
'      -- Novedades'||unistr('\000a')||
'      for v_notnov in cr_notnov loop'||unistr('\000a')||
'        i := i+1;'||unistr('\000a')||
'        -- Publicar novedad'||unistr('\000a')||
'        htp.print(''<div';

s:=s||' class="nov">'');'||unistr('\000a')||
'        -- Enlace'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''<a href="''||v_notnov.url||''" target="_blank">'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Titulo'||unistr('\000a')||
'        htp.print(''<b>''||v_notnov.titulo||''</b>'');'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''</a>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Resumen'||unistr('\000a')||
'        if v_notnov.resumen is not null then'||unistr('\000a')||
'          htp.print';

s:=s||'(''<br>''||v_notnov.resumen);'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Fecha Publicación'||unistr('\000a')||
'        htp.print(''<div class="tags">Publicado ''||to_char(v_notnov.publicado_desde,''dd/mm/yyyy''));'||unistr('\000a')||
'        -- Tags'||unistr('\000a')||
'        if v_notnov.tag1 is not null then'||unistr('\000a')||
'          htp.print('' // Tags: '');'||unistr('\000a')||
'          if v_notcfg.tag_url is not null then '||unistr('\000a')||
'            htp.print(''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag1)||''" targ';

s:=s||'et="_blank">''||lower(v_notnov.tag1)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag2)||''" target="_blank">''||lower(v_notnov.tag2)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag3)||''" target="_blank">''||lower(v_notnov.tag3)||''</a>'');'||unistr('\000a')||
'          else'||unistr('\000a')||
'            htp.print(lower(v_notnov.tag1)||'' - ''||lower(v_notnov.tag2)||'' - ''||lower(v_notnov.tag3));'||unistr('\000a')||
'  ';

s:=s||'        end if;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        -- Solo mostrar la cantidad maxima indicada el la configuración del servicio de noticias'||unistr('\000a')||
'        if i >= v_notcfg.NOTNOV_MAXCNT then'||unistr('\000a')||
'          exit;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --   '||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      -- Si no existen novedades para publicar'||unistr('\000a')||
'      if i = 0 then'||unistr('\000a')||
'        htp.print(''<br><br>No existen No';

s:=s||'vedades Etiquetadas Recientemente ... <br><br>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 46715324689679756 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Columna Doble (1) Smartphone',
  p_region_name=>'smartphone',
  p_region_attributes=> 'style="background-color:#F0F0F0"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 60053457202939040+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 21,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => ':P2_CFGPOP_COL1 IS NOT NULL AND :P2_CFGPOP_COL2 IS NOT NULL AND :P2_CFGPOP_COL3 IS NULL',
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
s:=s||'declare'||unistr('\000a')||
'  -- Para obtener los enlaces configurados para la página'||unistr('\000a')||
'  cursor cr_pagenl is'||unistr('\000a')||
'  select replace(replace(enlace,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')) enlace'||unistr('\000a')||
'       , atributos_enlace'||unistr('\000a')||
'       , consejo'||unistr('\000a')||
'       , replace(replace(etiqueta,''WKSP_IMG'',v(''WORKSPACE_IMAGES'')),''APP_IMG'',v(''APP_IMAGES'')) etiqueta'||unistr('\000a')||
'    from CFG_PORTAL_PAGENL_V'||unistr('\000a')||
'   where CFGPOP_ID =  :P2_CFGPOP_POR_ID'||unistr('\000a')||
'     and SI';

s:=s||'TUACION = ''PUB'''||unistr('\000a')||
'     and interface in (''TODAS'',''DESKTOP'')'||unistr('\000a')||
'   and sysdate between nvl(PUBLICACION_DESDE,sysdate) and nvl (PUBLICACION_HASTA,sysdate)'||unistr('\000a')||
'     and CFG_BI_PKG.CFGPPE_SEGUSU_AUTHO(p_cfgppe_id => id, p_segusu_id => :P2_SEGUSU_ID) = ''SI'''||unistr('\000a')||
'   order by ORDEN;'||unistr('\000a')||
'  -- Para obtener las configuración de noticias'||unistr('\000a')||
'  cursor cr_notcfg is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_configuraciones'||unistr('\000a')||
'  where segorg_id = :p1_segor';

s:=s||'g_id;'||unistr('\000a')||
'  -- Para obtener las novedades a publicar'||unistr('\000a')||
'  cursor cr_notnov is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_novedades'||unistr('\000a')||
'  where segorg_id = :p1_segorg_id'||unistr('\000a')||
'    and sysdate between publicado_desde and nvl(publicado_hasta,sysdate)'||unistr('\000a')||
'    and situacion = ''VAL'''||unistr('\000a')||
'  order by id desc;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_enlaces VARCHAR(4000);  '||unistr('\000a')||
'  v_notcfg not_configuraciones%rowtype;'||unistr('\000a')||
'  i number:=0;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Si se muestran los mensajes de Cuerpo'||unistr('\000a')||
' ';

s:=s||' if :P2_CFGPOP_COL2 = ''CUERPO'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    --htp.print(''<div class="tit">&P2_TITULO_PORTAL.</div><br><br>'');'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_2.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_3.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_4.'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si Se muestran los enlaces'||unistr('\000a')||
'  elsif :P2_CFGPOP_COL2 = ''ENLACES'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'  ';

s:=s||'  htp.print(''<div class="tit">Enlaces</div><br><br>'');'||unistr('\000a')||
'    -- Armar y Mostrar enlaces'||unistr('\000a')||
'    v_enlaces :=''<ul class="uVerticalSidebarList">'';        '||unistr('\000a')||
'    for v_pagenl in cr_pagenl loop'||unistr('\000a')||
'      v_enlaces := v_enlaces || ''<li><a href="''||v_pagenl.ENLACE||''" ''||v_pagenl.ATRIBUTOS_ENLACE||'' alt="''||v_pagenl.CONSEJO||''" title="''||v_pagenl.CONSEJO||''">''||v_pagenl.ETIQUETA||''</a></li>'';      '||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'  ';

s:=s||'  v_enlaces := v_enlaces || ''</ul>'';'||unistr('\000a')||
'    htp.print(v_enlaces); '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si se muestran las novedades de noticias'||unistr('\000a')||
'  elsif :P2_CFGPOP_COL2 = ''NOTICIAS'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div><div class="tit">Novedades Etiquetadas Recientemente</div>'');'||unistr('\000a')||
'    -- Obtener la configuración de noticias'||unistr('\000a')||
'    open cr_notcfg;'||unistr('\000a')||
'    fetch cr_notcfg into v_notcfg;'||unistr('\000a')||
'    close cr_notcfg;'||unistr('\000a')||
'    -- Si no esta configu';

s:=s||'rado, el servicio no esta habilitado'||unistr('\000a')||
'    if v_notcfg.ID is null then'||unistr('\000a')||
'      htp.print(''<br><br>El Servicio de Noticias y Novedades no se encuentra habilitado'');'||unistr('\000a')||
'    -- Si esta configurado el servicio de noticias'||unistr('\000a')||
'    else'||unistr('\000a')||
'      -- Si existen, Agregar enlaces a sitios Sociales'||unistr('\000a')||
'      if v_notcfg.blog_url is not null or'||unistr('\000a')||
'         v_notcfg.facebook_url is not null or'||unistr('\000a')||
'         v_notcfg.youtube_url is not ';

s:=s||'null or'||unistr('\000a')||
'         v_notcfg.twitter_url is not null then'||unistr('\000a')||
'        -- Título'||unistr('\000a')||
'        htp.print('' <div class="slc">Mantente conectado: <ul class="scl-icons">'');'||unistr('\000a')||
'        -- Enlace a blog'||unistr('\000a')||
'        if v_notcfg.blog_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-blogger"><a href="''||v_notcfg.blog_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Facebook'||unistr('\000a')||
'        if v_notcfg.';

s:=s||'facebook_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-facebook"><a href="''||v_notcfg.facebook_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Youtube'||unistr('\000a')||
'        if v_notcfg.youtube_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-youtube"><a href="''||v_notcfg.youtube_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Twitter'||unistr('\000a')||
'        i';

s:=s||'f v_notcfg.twitter_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-twitter"><a href="''||v_notcfg.twitter_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --'||unistr('\000a')||
'        htp.print(''</ul></div></div>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      --  '||unistr('\000a')||
'      htp.print(''<br><br>'');'||unistr('\000a')||
'      -- Novedades'||unistr('\000a')||
'      for v_notnov in cr_notnov loop'||unistr('\000a')||
'        i := i+1;'||unistr('\000a')||
'        -- Publicar novedad'||unistr('\000a')||
'        htp.print(''<div cl';

s:=s||'ass="nov">'');'||unistr('\000a')||
'        -- Enlace'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''<a href="''||v_notnov.url||''" target="_blank">'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Titulo'||unistr('\000a')||
'        htp.print(''<b>''||v_notnov.titulo||''</b>'');'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''</a>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Resumen'||unistr('\000a')||
'        if v_notnov.resumen is not null then'||unistr('\000a')||
'          htp.print(''<';

s:=s||'br>''||v_notnov.resumen);'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Fecha Publicación'||unistr('\000a')||
'        htp.print(''<div class="tags">Publicado ''||to_char(v_notnov.publicado_desde,''dd/mm/yyyy''));'||unistr('\000a')||
'        -- Tags'||unistr('\000a')||
'        if v_notnov.tag1 is not null then'||unistr('\000a')||
'          htp.print('' // Tags: '');'||unistr('\000a')||
'          if v_notcfg.tag_url is not null then '||unistr('\000a')||
'            htp.print(''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag1)||''" target=';

s:=s||'"_blank">''||lower(v_notnov.tag1)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag2)||''" target="_blank">''||lower(v_notnov.tag2)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag3)||''" target="_blank">''||lower(v_notnov.tag3)||''</a>'');'||unistr('\000a')||
'          else'||unistr('\000a')||
'            htp.print(lower(v_notnov.tag1)||'' - ''||lower(v_notnov.tag2)||'' - ''||lower(v_notnov.tag3));'||unistr('\000a')||
'     ';

s:=s||'     end if;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        -- Solo mostrar la cantidad maxima indicada el la configuración del servicio de noticias'||unistr('\000a')||
'        if i >= v_notcfg.NOTNOV_MAXCNT then'||unistr('\000a')||
'          exit;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --   '||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      -- Si no existen novedades para publicar'||unistr('\000a')||
'      if i = 0 then'||unistr('\000a')||
'        htp.print(''<br><br>No existen Noved';

s:=s||'ades Etiquetadas Recientemente ... <br><br>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 46715529190681053 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Columna Doble (2)',
  p_region_name=>'desktop',
  p_region_css_classes=>'fondo-gris',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 60053457202939040+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 22,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => ':P2_CFGPOP_COL1 IS NOT NULL AND :P2_CFGPOP_COL2 IS NOT NULL AND :P2_CFGPOP_COL3 IS NULL',
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
s:=s||'declare'||unistr('\000a')||
'  -- Para obtener los enlaces configurados para la página'||unistr('\000a')||
'  cursor cr_pagenl is'||unistr('\000a')||
'  select replace(replace(enlace,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')) enlace'||unistr('\000a')||
'       , atributos_enlace'||unistr('\000a')||
'       , consejo'||unistr('\000a')||
'       , replace(replace(etiqueta,''WKSP_IMG'',v(''WORKSPACE_IMAGES'')),''APP_IMG'',v(''APP_IMAGES'')) etiqueta'||unistr('\000a')||
'    from CFG_PORTAL_PAGENL_V'||unistr('\000a')||
'   where CFGPOP_ID =  :P2_CFGPOP_POR_ID'||unistr('\000a')||
'     and SI';

s:=s||'TUACION = ''PUB'''||unistr('\000a')||
'     and interface in (''TODAS'',''SMARTPHONE'')'||unistr('\000a')||
'   and sysdate between nvl(PUBLICACION_DESDE,sysdate) and nvl (PUBLICACION_HASTA,sysdate)'||unistr('\000a')||
'     and CFG_BI_PKG.CFGPPE_SEGUSU_AUTHO(p_cfgppe_id => id, p_segusu_id => :P2_SEGUSU_ID) = ''SI'''||unistr('\000a')||
'   order by ORDEN;'||unistr('\000a')||
'  -- Para obtener las configuración de noticias'||unistr('\000a')||
'  cursor cr_notcfg is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_configuraciones'||unistr('\000a')||
'  where segorg_id = :p1_se';

s:=s||'gorg_id;'||unistr('\000a')||
'  -- Para obtener las novedades a publicar'||unistr('\000a')||
'  cursor cr_notnov is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_novedades'||unistr('\000a')||
'  where segorg_id = :p1_segorg_id'||unistr('\000a')||
'    and sysdate between publicado_desde and nvl(publicado_hasta,sysdate)'||unistr('\000a')||
'    and situacion = ''VAL'''||unistr('\000a')||
'  order by id desc;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_enlaces VARCHAR(4000);  '||unistr('\000a')||
'  v_notcfg not_configuraciones%rowtype;'||unistr('\000a')||
'  i number:=0;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Si se muestran los mensajes de Cuerp';

s:=s||'o'||unistr('\000a')||
'  if :P2_CFGPOP_COL2 = ''CUERPO'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    --htp.print(''<div class="tit">&P2_TITULO_PORTAL.</div><br><br>'');'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_2.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_3.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_4.'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si Se muestran los enlaces'||unistr('\000a')||
'  elsif :P2_CFGPOP_COL2 = ''ENLACES'' then'||unistr('\000a')||
'    -- Titulo';

s:=s||''||unistr('\000a')||
'    htp.print(''<div class="tit">Enlaces</div><br><br>'');'||unistr('\000a')||
'    -- Armar y Mostrar enlaces'||unistr('\000a')||
'    v_enlaces :=''<ul class="uVerticalSidebarList">'';        '||unistr('\000a')||
'    for v_pagenl in cr_pagenl loop'||unistr('\000a')||
'      v_enlaces := v_enlaces || ''<li><a href="''||v_pagenl.ENLACE||''" ''||v_pagenl.ATRIBUTOS_ENLACE||'' alt="''||v_pagenl.CONSEJO||''" title="''||v_pagenl.CONSEJO||''">''||v_pagenl.ETIQUETA||''</a></li>'';      '||unistr('\000a')||
'    end loop;';

s:=s||''||unistr('\000a')||
'    v_enlaces := v_enlaces || ''</ul>'';'||unistr('\000a')||
'    htp.print(v_enlaces); '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si se muestran las novedades de noticias'||unistr('\000a')||
'  elsif :P2_CFGPOP_COL2 = ''NOTICIAS'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div><div class="tit">Novedades Etiquetadas Recientemente</div>'');'||unistr('\000a')||
'    -- Obtener la configuración de noticias'||unistr('\000a')||
'    open cr_notcfg;'||unistr('\000a')||
'    fetch cr_notcfg into v_notcfg;'||unistr('\000a')||
'    close cr_notcfg;'||unistr('\000a')||
'    -- Si no esta conf';

s:=s||'igurado, el servicio no esta habilitado'||unistr('\000a')||
'    if v_notcfg.ID is null then'||unistr('\000a')||
'      htp.print(''<br><br>El Servicio de Noticias y Novedades no se encuentra habilitado'');'||unistr('\000a')||
'    -- Si esta configurado el servicio de noticias'||unistr('\000a')||
'    else'||unistr('\000a')||
'      -- Si existen, Agregar enlaces a sitios Sociales'||unistr('\000a')||
'      if v_notcfg.blog_url is not null or'||unistr('\000a')||
'         v_notcfg.facebook_url is not null or'||unistr('\000a')||
'         v_notcfg.youtube_url is n';

s:=s||'ot null or'||unistr('\000a')||
'         v_notcfg.twitter_url is not null then'||unistr('\000a')||
'        -- Título'||unistr('\000a')||
'        htp.print('' <div class="slc">Mantente conectado: <ul class="scl-icons">'');'||unistr('\000a')||
'        -- Enlace a blog'||unistr('\000a')||
'        if v_notcfg.blog_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-blogger"><a href="''||v_notcfg.blog_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Facebook'||unistr('\000a')||
'        if v_notc';

s:=s||'fg.facebook_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-facebook"><a href="''||v_notcfg.facebook_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Youtube'||unistr('\000a')||
'        if v_notcfg.youtube_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-youtube"><a href="''||v_notcfg.youtube_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Twitter'||unistr('\000a')||
'      ';

s:=s||'  if v_notcfg.twitter_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-twitter"><a href="''||v_notcfg.twitter_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --'||unistr('\000a')||
'        htp.print(''</ul></div></div>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      --  '||unistr('\000a')||
'      htp.print(''<br><br>'');'||unistr('\000a')||
'      -- Novedades'||unistr('\000a')||
'      for v_notnov in cr_notnov loop'||unistr('\000a')||
'        i := i+1;'||unistr('\000a')||
'        -- Publicar novedad'||unistr('\000a')||
'        htp.print(''<div';

s:=s||' class="nov">'');'||unistr('\000a')||
'        -- Enlace'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''<a href="''||v_notnov.url||''" target="_blank">'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Titulo'||unistr('\000a')||
'        htp.print(''<b>''||v_notnov.titulo||''</b>'');'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''</a>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Resumen'||unistr('\000a')||
'        if v_notnov.resumen is not null then'||unistr('\000a')||
'          htp.print';

s:=s||'(''<br>''||v_notnov.resumen);'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Fecha Publicación'||unistr('\000a')||
'        htp.print(''<div class="tags">Publicado ''||to_char(v_notnov.publicado_desde,''dd/mm/yyyy''));'||unistr('\000a')||
'        -- Tags'||unistr('\000a')||
'        if v_notnov.tag1 is not null then'||unistr('\000a')||
'          htp.print('' // Tags: '');'||unistr('\000a')||
'          if v_notcfg.tag_url is not null then '||unistr('\000a')||
'            htp.print(''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag1)||''" targ';

s:=s||'et="_blank">''||lower(v_notnov.tag1)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag2)||''" target="_blank">''||lower(v_notnov.tag2)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag3)||''" target="_blank">''||lower(v_notnov.tag3)||''</a>'');'||unistr('\000a')||
'          else'||unistr('\000a')||
'            htp.print(lower(v_notnov.tag1)||'' - ''||lower(v_notnov.tag2)||'' - ''||lower(v_notnov.tag3));'||unistr('\000a')||
'  ';

s:=s||'        end if;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        -- Solo mostrar la cantidad maxima indicada el la configuración del servicio de noticias'||unistr('\000a')||
'        if i >= v_notcfg.NOTNOV_MAXCNT then'||unistr('\000a')||
'          exit;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --   '||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      -- Si no existen novedades para publicar'||unistr('\000a')||
'      if i = 0 then'||unistr('\000a')||
'        htp.print(''<br><br>No existen No';

s:=s||'vedades Etiquetadas Recientemente ... <br><br>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 46715701617682487 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Columna Doble (2) Smartphone',
  p_region_name=>'smartphone',
  p_region_attributes=> 'style="background-color:#F0F0F0"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 60053457202939040+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 23,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => ':P2_CFGPOP_COL1 IS NOT NULL AND :P2_CFGPOP_COL2 IS NOT NULL AND :P2_CFGPOP_COL3 IS NULL',
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
s:=s||'declare'||unistr('\000a')||
'  -- Para obtener los enlaces configurados para la página'||unistr('\000a')||
'  cursor cr_pagenl is'||unistr('\000a')||
'  select replace(replace(enlace,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')) enlace'||unistr('\000a')||
'       , atributos_enlace'||unistr('\000a')||
'       , consejo'||unistr('\000a')||
'       , replace(replace(etiqueta,''WKSP_IMG'',v(''WORKSPACE_IMAGES'')),''APP_IMG'',v(''APP_IMAGES'')) etiqueta'||unistr('\000a')||
'    from CFG_PORTAL_PAGENL_V'||unistr('\000a')||
'   where CFGPOP_ID =  :P2_CFGPOP_POR_ID'||unistr('\000a')||
'     and SI';

s:=s||'TUACION = ''PUB'''||unistr('\000a')||
'     and interface in (''TODAS'',''DESKTOP'')'||unistr('\000a')||
'   and sysdate between nvl(PUBLICACION_DESDE,sysdate) and nvl (PUBLICACION_HASTA,sysdate)'||unistr('\000a')||
'     and CFG_BI_PKG.CFGPPE_SEGUSU_AUTHO(p_cfgppe_id => id, p_segusu_id => :P2_SEGUSU_ID) = ''SI'''||unistr('\000a')||
'   order by ORDEN;'||unistr('\000a')||
'  -- Para obtener las configuración de noticias'||unistr('\000a')||
'  cursor cr_notcfg is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_configuraciones'||unistr('\000a')||
'  where segorg_id = :p1_segor';

s:=s||'g_id;'||unistr('\000a')||
'  -- Para obtener las novedades a publicar'||unistr('\000a')||
'  cursor cr_notnov is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_novedades'||unistr('\000a')||
'  where segorg_id = :p1_segorg_id'||unistr('\000a')||
'    and sysdate between publicado_desde and nvl(publicado_hasta,sysdate)'||unistr('\000a')||
'    and situacion = ''VAL'''||unistr('\000a')||
'  order by id desc;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_enlaces VARCHAR(4000);  '||unistr('\000a')||
'  v_notcfg not_configuraciones%rowtype;'||unistr('\000a')||
'  i number:=0;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Si se muestran los mensajes de Cuerpo'||unistr('\000a')||
' ';

s:=s||' if :P2_CFGPOP_COL1 = ''CUERPO'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    --htp.print(''<div class="tit">&P2_TITULO_PORTAL.</div><br><br>'');'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_2.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_3.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_4.'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si Se muestran los enlaces'||unistr('\000a')||
'  elsif :P2_CFGPOP_COL1 = ''ENLACES'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'  ';

s:=s||'  htp.print(''<div class="tit">Enlaces</div><br><br>'');'||unistr('\000a')||
'    -- Armar y Mostrar enlaces'||unistr('\000a')||
'    v_enlaces :=''<ul class="uVerticalSidebarList">'';        '||unistr('\000a')||
'    for v_pagenl in cr_pagenl loop'||unistr('\000a')||
'      v_enlaces := v_enlaces || ''<li><a href="''||v_pagenl.ENLACE||''" ''||v_pagenl.ATRIBUTOS_ENLACE||'' alt="''||v_pagenl.CONSEJO||''" title="''||v_pagenl.CONSEJO||''">''||v_pagenl.ETIQUETA||''</a></li>'';      '||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'  ';

s:=s||'  v_enlaces := v_enlaces || ''</ul>'';'||unistr('\000a')||
'    htp.print(v_enlaces); '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si se muestran las novedades de noticias'||unistr('\000a')||
'  elsif :P2_CFGPOP_COL1 = ''NOTICIAS'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div><div class="tit">Novedades Etiquetadas Recientemente</div>'');'||unistr('\000a')||
'    -- Obtener la configuración de noticias'||unistr('\000a')||
'    open cr_notcfg;'||unistr('\000a')||
'    fetch cr_notcfg into v_notcfg;'||unistr('\000a')||
'    close cr_notcfg;'||unistr('\000a')||
'    -- Si no esta configu';

s:=s||'rado, el servicio no esta habilitado'||unistr('\000a')||
'    if v_notcfg.ID is null then'||unistr('\000a')||
'      htp.print(''<br><br>El Servicio de Noticias y Novedades no se encuentra habilitado'');'||unistr('\000a')||
'    -- Si esta configurado el servicio de noticias'||unistr('\000a')||
'    else'||unistr('\000a')||
'      -- Si existen, Agregar enlaces a sitios Sociales'||unistr('\000a')||
'      if v_notcfg.blog_url is not null or'||unistr('\000a')||
'         v_notcfg.facebook_url is not null or'||unistr('\000a')||
'         v_notcfg.youtube_url is not ';

s:=s||'null or'||unistr('\000a')||
'         v_notcfg.twitter_url is not null then'||unistr('\000a')||
'        -- Título'||unistr('\000a')||
'        htp.print('' <div class="slc">Mantente conectado: <ul class="scl-icons">'');'||unistr('\000a')||
'        -- Enlace a blog'||unistr('\000a')||
'        if v_notcfg.blog_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-blogger"><a href="''||v_notcfg.blog_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Facebook'||unistr('\000a')||
'        if v_notcfg.';

s:=s||'facebook_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-facebook"><a href="''||v_notcfg.facebook_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Youtube'||unistr('\000a')||
'        if v_notcfg.youtube_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-youtube"><a href="''||v_notcfg.youtube_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Twitter'||unistr('\000a')||
'        i';

s:=s||'f v_notcfg.twitter_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-twitter"><a href="''||v_notcfg.twitter_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --'||unistr('\000a')||
'        htp.print(''</ul></div></div>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      --  '||unistr('\000a')||
'      htp.print(''<br><br>'');'||unistr('\000a')||
'      -- Novedades'||unistr('\000a')||
'      for v_notnov in cr_notnov loop'||unistr('\000a')||
'        i := i+1;'||unistr('\000a')||
'        -- Publicar novedad'||unistr('\000a')||
'        htp.print(''<div cl';

s:=s||'ass="nov">'');'||unistr('\000a')||
'        -- Enlace'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''<a href="''||v_notnov.url||''" target="_blank">'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Titulo'||unistr('\000a')||
'        htp.print(''<b>''||v_notnov.titulo||''</b>'');'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''</a>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Resumen'||unistr('\000a')||
'        if v_notnov.resumen is not null then'||unistr('\000a')||
'          htp.print(''<';

s:=s||'br>''||v_notnov.resumen);'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Fecha Publicación'||unistr('\000a')||
'        htp.print(''<div class="tags">Publicado ''||to_char(v_notnov.publicado_desde,''dd/mm/yyyy''));'||unistr('\000a')||
'        -- Tags'||unistr('\000a')||
'        if v_notnov.tag1 is not null then'||unistr('\000a')||
'          htp.print('' // Tags: '');'||unistr('\000a')||
'          if v_notcfg.tag_url is not null then '||unistr('\000a')||
'            htp.print(''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag1)||''" target=';

s:=s||'"_blank">''||lower(v_notnov.tag1)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag2)||''" target="_blank">''||lower(v_notnov.tag2)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag3)||''" target="_blank">''||lower(v_notnov.tag3)||''</a>'');'||unistr('\000a')||
'          else'||unistr('\000a')||
'            htp.print(lower(v_notnov.tag1)||'' - ''||lower(v_notnov.tag2)||'' - ''||lower(v_notnov.tag3));'||unistr('\000a')||
'     ';

s:=s||'     end if;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        -- Solo mostrar la cantidad maxima indicada el la configuración del servicio de noticias'||unistr('\000a')||
'        if i >= v_notcfg.NOTNOV_MAXCNT then'||unistr('\000a')||
'          exit;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --   '||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      -- Si no existen novedades para publicar'||unistr('\000a')||
'      if i = 0 then'||unistr('\000a')||
'        htp.print(''<br><br>No existen Noved';

s:=s||'ades Etiquetadas Recientemente ... <br><br>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 46715909582684793 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Columna Triple (1)',
  p_region_name=>'desktop',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 60053457202939040+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_grid_column_span => 3,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => ':P2_CFGPOP_COL1 IS NOT NULL AND :P2_CFGPOP_COL2 IS NOT NULL AND :P2_CFGPOP_COL3 IS NOT NULL',
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
s:=s||'declare'||unistr('\000a')||
'  -- Para obtener los enlaces configurados para la página'||unistr('\000a')||
'  cursor cr_pagenl is'||unistr('\000a')||
'  select replace(replace(enlace,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')) enlace'||unistr('\000a')||
'       , atributos_enlace'||unistr('\000a')||
'       , consejo'||unistr('\000a')||
'       , replace(replace(etiqueta,''WKSP_IMG'',v(''WORKSPACE_IMAGES'')),''APP_IMG'',v(''APP_IMAGES'')) etiqueta'||unistr('\000a')||
'    from CFG_PORTAL_PAGENL_V'||unistr('\000a')||
'   where CFGPOP_ID =  :P2_CFGPOP_POR_ID'||unistr('\000a')||
'     and SI';

s:=s||'TUACION = ''PUB'''||unistr('\000a')||
'     and interface in (''TODAS'',''SMARTPHONE'')'||unistr('\000a')||
'   and sysdate between nvl(PUBLICACION_DESDE,sysdate) and nvl (PUBLICACION_HASTA,sysdate)'||unistr('\000a')||
'     and CFG_BI_PKG.CFGPPE_SEGUSU_AUTHO(p_cfgppe_id => id, p_segusu_id => :P2_SEGUSU_ID) = ''SI'''||unistr('\000a')||
'   order by ORDEN;'||unistr('\000a')||
'  -- Para obtener las configuración de noticias'||unistr('\000a')||
'  cursor cr_notcfg is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_configuraciones'||unistr('\000a')||
'  where segorg_id = :p1_se';

s:=s||'gorg_id;'||unistr('\000a')||
'  -- Para obtener las novedades a publicar'||unistr('\000a')||
'  cursor cr_notnov is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_novedades'||unistr('\000a')||
'  where segorg_id = :p1_segorg_id'||unistr('\000a')||
'    and sysdate between publicado_desde and nvl(publicado_hasta,sysdate)'||unistr('\000a')||
'    and situacion = ''VAL'''||unistr('\000a')||
'  order by id desc;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_enlaces VARCHAR(4000);  '||unistr('\000a')||
'  v_notcfg not_configuraciones%rowtype;'||unistr('\000a')||
'  i number:=0;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Si se muestran los mensajes de Cuerp';

s:=s||'o'||unistr('\000a')||
'  if :P2_CFGPOP_COL1 = ''CUERPO'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    --htp.print(''<div class="tit">&P2_TITULO_PORTAL.</div><br><br>'');'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_2.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_3.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_4.'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si Se muestran los enlaces'||unistr('\000a')||
'  elsif :P2_CFGPOP_COL1 = ''ENLACES'' then'||unistr('\000a')||
'    -- Titulo';

s:=s||''||unistr('\000a')||
'    htp.print(''<div class="tit">Enlaces</div><br><br>'');'||unistr('\000a')||
'    -- Armar y Mostrar enlaces'||unistr('\000a')||
'    v_enlaces :=''<ul class="uVerticalSidebarList">'';        '||unistr('\000a')||
'    for v_pagenl in cr_pagenl loop'||unistr('\000a')||
'      v_enlaces := v_enlaces || ''<li><a href="''||v_pagenl.ENLACE||''" ''||v_pagenl.ATRIBUTOS_ENLACE||'' alt="''||v_pagenl.CONSEJO||''" title="''||v_pagenl.CONSEJO||''">''||v_pagenl.ETIQUETA||''</a></li>'';      '||unistr('\000a')||
'    end loop;';

s:=s||''||unistr('\000a')||
'    v_enlaces := v_enlaces || ''</ul>'';'||unistr('\000a')||
'    htp.print(v_enlaces); '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si se muestran las novedades de noticias'||unistr('\000a')||
'  elsif :P2_CFGPOP_COL1 = ''NOTICIAS'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div><div class="tit">Novedades Etiquetadas Recientemente</div>'');'||unistr('\000a')||
'    -- Obtener la configuración de noticias'||unistr('\000a')||
'    open cr_notcfg;'||unistr('\000a')||
'    fetch cr_notcfg into v_notcfg;'||unistr('\000a')||
'    close cr_notcfg;'||unistr('\000a')||
'    -- Si no esta conf';

s:=s||'igurado, el servicio no esta habilitado'||unistr('\000a')||
'    if v_notcfg.ID is null then'||unistr('\000a')||
'      htp.print(''<br><br>El Servicio de Noticias y Novedades no se encuentra habilitado'');'||unistr('\000a')||
'    -- Si esta configurado el servicio de noticias'||unistr('\000a')||
'    else'||unistr('\000a')||
'      -- Si existen, Agregar enlaces a sitios Sociales'||unistr('\000a')||
'      if v_notcfg.blog_url is not null or'||unistr('\000a')||
'         v_notcfg.facebook_url is not null or'||unistr('\000a')||
'         v_notcfg.youtube_url is n';

s:=s||'ot null or'||unistr('\000a')||
'         v_notcfg.twitter_url is not null then'||unistr('\000a')||
'        -- Título'||unistr('\000a')||
'        htp.print('' <div class="slc">Mantente conectado: <ul class="scl-icons">'');'||unistr('\000a')||
'        -- Enlace a blog'||unistr('\000a')||
'        if v_notcfg.blog_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-blogger"><a href="''||v_notcfg.blog_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Facebook'||unistr('\000a')||
'        if v_notc';

s:=s||'fg.facebook_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-facebook"><a href="''||v_notcfg.facebook_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Youtube'||unistr('\000a')||
'        if v_notcfg.youtube_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-youtube"><a href="''||v_notcfg.youtube_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Twitter'||unistr('\000a')||
'      ';

s:=s||'  if v_notcfg.twitter_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-twitter"><a href="''||v_notcfg.twitter_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --'||unistr('\000a')||
'        htp.print(''</ul></div></div>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      --  '||unistr('\000a')||
'      htp.print(''<br><br>'');'||unistr('\000a')||
'      -- Novedades'||unistr('\000a')||
'      for v_notnov in cr_notnov loop'||unistr('\000a')||
'        i := i+1;'||unistr('\000a')||
'        -- Publicar novedad'||unistr('\000a')||
'        htp.print(''<div';

s:=s||' class="nov">'');'||unistr('\000a')||
'        -- Enlace'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''<a href="''||v_notnov.url||''" target="_blank">'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Titulo'||unistr('\000a')||
'        htp.print(''<b>''||v_notnov.titulo||''</b>'');'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''</a>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Resumen'||unistr('\000a')||
'        if v_notnov.resumen is not null then'||unistr('\000a')||
'          htp.print';

s:=s||'(''<br>''||v_notnov.resumen);'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Fecha Publicación'||unistr('\000a')||
'        htp.print(''<div class="tags">Publicado ''||to_char(v_notnov.publicado_desde,''dd/mm/yyyy''));'||unistr('\000a')||
'        -- Tags'||unistr('\000a')||
'        if v_notnov.tag1 is not null then'||unistr('\000a')||
'          htp.print('' // Tags: '');'||unistr('\000a')||
'          if v_notcfg.tag_url is not null then '||unistr('\000a')||
'            htp.print(''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag1)||''" targ';

s:=s||'et="_blank">''||lower(v_notnov.tag1)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag2)||''" target="_blank">''||lower(v_notnov.tag2)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag3)||''" target="_blank">''||lower(v_notnov.tag3)||''</a>'');'||unistr('\000a')||
'          else'||unistr('\000a')||
'            htp.print(lower(v_notnov.tag1)||'' - ''||lower(v_notnov.tag2)||'' - ''||lower(v_notnov.tag3));'||unistr('\000a')||
'  ';

s:=s||'        end if;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        -- Solo mostrar la cantidad maxima indicada el la configuración del servicio de noticias'||unistr('\000a')||
'        if i >= v_notcfg.NOTNOV_MAXCNT then'||unistr('\000a')||
'          exit;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --   '||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      -- Si no existen novedades para publicar'||unistr('\000a')||
'      if i = 0 then'||unistr('\000a')||
'        htp.print(''<br><br>No existen No';

s:=s||'vedades Etiquetadas Recientemente ... <br><br>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 46716113391685953 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Columna Triple (1) Smartphone',
  p_region_name=>'smartphone',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 60053457202939040+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 31,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_grid_column_span => 3,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => ':P2_CFGPOP_COL1 IS NOT NULL AND :P2_CFGPOP_COL2 IS NOT NULL AND :P2_CFGPOP_COL3 IS NOT NULL',
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
s:=s||'declare'||unistr('\000a')||
'  -- Para obtener los enlaces configurados para la página'||unistr('\000a')||
'  cursor cr_pagenl is'||unistr('\000a')||
'  select replace(replace(enlace,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')) enlace'||unistr('\000a')||
'       , atributos_enlace'||unistr('\000a')||
'       , consejo'||unistr('\000a')||
'       , replace(replace(etiqueta,''WKSP_IMG'',v(''WORKSPACE_IMAGES'')),''APP_IMG'',v(''APP_IMAGES'')) etiqueta'||unistr('\000a')||
'    from CFG_PORTAL_PAGENL_V'||unistr('\000a')||
'   where CFGPOP_ID =  :P2_CFGPOP_POR_ID'||unistr('\000a')||
'     and SI';

s:=s||'TUACION = ''PUB'''||unistr('\000a')||
'     and interface in (''TODAS'',''DESKTOP'')'||unistr('\000a')||
'   and sysdate between nvl(PUBLICACION_DESDE,sysdate) and nvl (PUBLICACION_HASTA,sysdate)'||unistr('\000a')||
'     and CFG_BI_PKG.CFGPPE_SEGUSU_AUTHO(p_cfgppe_id => id, p_segusu_id => :P2_SEGUSU_ID) = ''SI'''||unistr('\000a')||
'   order by ORDEN;'||unistr('\000a')||
'  -- Para obtener las configuración de noticias'||unistr('\000a')||
'  cursor cr_notcfg is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_configuraciones'||unistr('\000a')||
'  where segorg_id = :p1_segor';

s:=s||'g_id;'||unistr('\000a')||
'  -- Para obtener las novedades a publicar'||unistr('\000a')||
'  cursor cr_notnov is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_novedades'||unistr('\000a')||
'  where segorg_id = :p1_segorg_id'||unistr('\000a')||
'    and sysdate between publicado_desde and nvl(publicado_hasta,sysdate)'||unistr('\000a')||
'    and situacion = ''VAL'''||unistr('\000a')||
'  order by id desc;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_enlaces VARCHAR(4000);  '||unistr('\000a')||
'  v_notcfg not_configuraciones%rowtype;'||unistr('\000a')||
'  i number:=0;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Si se muestran los mensajes de Cuerpo'||unistr('\000a')||
' ';

s:=s||' if :P2_CFGPOP_COL2 = ''CUERPO'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div class="tit">&P2_TITULO_PORTAL.</div><br><br>'');'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_2.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_3.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_4.'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si Se muestran los enlaces'||unistr('\000a')||
'  elsif :P2_CFGPOP_COL2 = ''ENLACES'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    ';

s:=s||'--htp.print(''<div class="tit">Enlaces</div><br><br>'');'||unistr('\000a')||
'    -- Armar y Mostrar enlaces'||unistr('\000a')||
'    v_enlaces :=''<ul class="uVerticalSidebarList">'';        '||unistr('\000a')||
'    for v_pagenl in cr_pagenl loop'||unistr('\000a')||
'      v_enlaces := v_enlaces || ''<li><a href="''||v_pagenl.ENLACE||''" ''||v_pagenl.ATRIBUTOS_ENLACE||'' alt="''||v_pagenl.CONSEJO||''" title="''||v_pagenl.CONSEJO||''">''||v_pagenl.ETIQUETA||''</a></li>'';      '||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'  ';

s:=s||'  v_enlaces := v_enlaces || ''</ul>'';'||unistr('\000a')||
'    htp.print(v_enlaces); '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si se muestran las novedades de noticias'||unistr('\000a')||
'  elsif :P2_CFGPOP_COL2 = ''NOTICIAS'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div><div class="tit">Novedades Etiquetadas Recientemente</div>'');'||unistr('\000a')||
'    -- Obtener la configuración de noticias'||unistr('\000a')||
'    open cr_notcfg;'||unistr('\000a')||
'    fetch cr_notcfg into v_notcfg;'||unistr('\000a')||
'    close cr_notcfg;'||unistr('\000a')||
'    -- Si no esta configu';

s:=s||'rado, el servicio no esta habilitado'||unistr('\000a')||
'    if v_notcfg.ID is null then'||unistr('\000a')||
'      htp.print(''<br><br>El Servicio de Noticias y Novedades no se encuentra habilitado'');'||unistr('\000a')||
'    -- Si esta configurado el servicio de noticias'||unistr('\000a')||
'    else'||unistr('\000a')||
'      -- Si existen, Agregar enlaces a sitios Sociales'||unistr('\000a')||
'      if v_notcfg.blog_url is not null or'||unistr('\000a')||
'         v_notcfg.facebook_url is not null or'||unistr('\000a')||
'         v_notcfg.youtube_url is not ';

s:=s||'null or'||unistr('\000a')||
'         v_notcfg.twitter_url is not null then'||unistr('\000a')||
'        -- Título'||unistr('\000a')||
'        htp.print('' <div class="slc">Mantente conectado: <ul class="scl-icons">'');'||unistr('\000a')||
'        -- Enlace a blog'||unistr('\000a')||
'        if v_notcfg.blog_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-blogger"><a href="''||v_notcfg.blog_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Facebook'||unistr('\000a')||
'        if v_notcfg.';

s:=s||'facebook_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-facebook"><a href="''||v_notcfg.facebook_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Youtube'||unistr('\000a')||
'        if v_notcfg.youtube_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-youtube"><a href="''||v_notcfg.youtube_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Twitter'||unistr('\000a')||
'        i';

s:=s||'f v_notcfg.twitter_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-twitter"><a href="''||v_notcfg.twitter_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --'||unistr('\000a')||
'        htp.print(''</ul></div></div>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      --  '||unistr('\000a')||
'      htp.print(''<br><br>'');'||unistr('\000a')||
'      -- Novedades'||unistr('\000a')||
'      for v_notnov in cr_notnov loop'||unistr('\000a')||
'        i := i+1;'||unistr('\000a')||
'        -- Publicar novedad'||unistr('\000a')||
'        htp.print(''<div cl';

s:=s||'ass="nov">'');'||unistr('\000a')||
'        -- Enlace'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''<a href="''||v_notnov.url||''" target="_blank">'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Titulo'||unistr('\000a')||
'        htp.print(''<b>''||v_notnov.titulo||''</b>'');'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''</a>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Resumen'||unistr('\000a')||
'        if v_notnov.resumen is not null then'||unistr('\000a')||
'          htp.print(''<';

s:=s||'br>''||v_notnov.resumen);'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Fecha Publicación'||unistr('\000a')||
'        htp.print(''<div class="tags">Publicado ''||to_char(v_notnov.publicado_desde,''dd/mm/yyyy''));'||unistr('\000a')||
'        -- Tags'||unistr('\000a')||
'        if v_notnov.tag1 is not null then'||unistr('\000a')||
'          htp.print('' // Tags: '');'||unistr('\000a')||
'          if v_notcfg.tag_url is not null then '||unistr('\000a')||
'            htp.print(''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag1)||''" target=';

s:=s||'"_blank">''||lower(v_notnov.tag1)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag2)||''" target="_blank">''||lower(v_notnov.tag2)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag3)||''" target="_blank">''||lower(v_notnov.tag3)||''</a>'');'||unistr('\000a')||
'          else'||unistr('\000a')||
'            htp.print(lower(v_notnov.tag1)||'' - ''||lower(v_notnov.tag2)||'' - ''||lower(v_notnov.tag3));'||unistr('\000a')||
'     ';

s:=s||'     end if;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        -- Solo mostrar la cantidad maxima indicada el la configuración del servicio de noticias'||unistr('\000a')||
'        if i >= v_notcfg.NOTNOV_MAXCNT then'||unistr('\000a')||
'          exit;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --   '||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      -- Si no existen novedades para publicar'||unistr('\000a')||
'      if i = 0 then'||unistr('\000a')||
'        htp.print(''<br><br>No existen Noved';

s:=s||'ades Etiquetadas Recientemente ... <br><br>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 46716317201687014 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Columna Triple (2)',
  p_region_name=>'desktop',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 60053457202939040+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 32,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => ':P2_CFGPOP_COL1 IS NOT NULL AND :P2_CFGPOP_COL2 IS NOT NULL AND :P2_CFGPOP_COL3 IS NOT NULL',
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
s:=s||'declare'||unistr('\000a')||
'  -- Para obtener los enlaces configurados para la página'||unistr('\000a')||
'  cursor cr_pagenl is'||unistr('\000a')||
'  select replace(replace(enlace,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')) enlace'||unistr('\000a')||
'       , atributos_enlace'||unistr('\000a')||
'       , consejo'||unistr('\000a')||
'       , replace(replace(etiqueta,''WKSP_IMG'',v(''WORKSPACE_IMAGES'')),''APP_IMG'',v(''APP_IMAGES'')) etiqueta'||unistr('\000a')||
'    from CFG_PORTAL_PAGENL_V'||unistr('\000a')||
'   where CFGPOP_ID =  :P2_CFGPOP_POR_ID'||unistr('\000a')||
'     and SI';

s:=s||'TUACION = ''PUB'''||unistr('\000a')||
'     and interface in (''TODAS'',''SMARTPHONE'')'||unistr('\000a')||
'   and sysdate between nvl(PUBLICACION_DESDE,sysdate) and nvl (PUBLICACION_HASTA,sysdate)'||unistr('\000a')||
'     and CFG_BI_PKG.CFGPPE_SEGUSU_AUTHO(p_cfgppe_id => id, p_segusu_id => :P2_SEGUSU_ID) = ''SI'''||unistr('\000a')||
'   order by ORDEN;'||unistr('\000a')||
'  -- Para obtener las configuración de noticias'||unistr('\000a')||
'  cursor cr_notcfg is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_configuraciones'||unistr('\000a')||
'  where segorg_id = :p1_se';

s:=s||'gorg_id;'||unistr('\000a')||
'  -- Para obtener las novedades a publicar'||unistr('\000a')||
'  cursor cr_notnov is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_novedades'||unistr('\000a')||
'  where segorg_id = :p1_segorg_id'||unistr('\000a')||
'    and sysdate between publicado_desde and nvl(publicado_hasta,sysdate)'||unistr('\000a')||
'    and situacion = ''VAL'''||unistr('\000a')||
'  order by id desc;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_enlaces VARCHAR(4000);  '||unistr('\000a')||
'  v_notcfg not_configuraciones%rowtype;'||unistr('\000a')||
'  i number:=0;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Si se muestran los mensajes de Cuerp';

s:=s||'o'||unistr('\000a')||
'  if :P2_CFGPOP_COL2 = ''CUERPO'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    --htp.print(''<div class="tit">&P2_TITULO_PORTAL.</div><br><br>'');'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_2.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_3.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_4.'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si Se muestran los enlaces'||unistr('\000a')||
'  elsif :P2_CFGPOP_COL2 = ''ENLACES'' then'||unistr('\000a')||
'    -- Titulo';

s:=s||''||unistr('\000a')||
'    htp.print(''<div class="tit">Enlaces</div><br><br>'');'||unistr('\000a')||
'    -- Armar y Mostrar enlaces'||unistr('\000a')||
'    v_enlaces :=''<ul class="uVerticalSidebarList">'';        '||unistr('\000a')||
'    for v_pagenl in cr_pagenl loop'||unistr('\000a')||
'      v_enlaces := v_enlaces || ''<li><a href="''||v_pagenl.ENLACE||''" ''||v_pagenl.ATRIBUTOS_ENLACE||'' alt="''||v_pagenl.CONSEJO||''" title="''||v_pagenl.CONSEJO||''">''||v_pagenl.ETIQUETA||''</a></li>'';      '||unistr('\000a')||
'    end loop;';

s:=s||''||unistr('\000a')||
'    v_enlaces := v_enlaces || ''</ul>'';'||unistr('\000a')||
'    htp.print(v_enlaces); '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si se muestran las novedades de noticias'||unistr('\000a')||
'  elsif :P2_CFGPOP_COL2 = ''NOTICIAS'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div><div class="tit">Novedades Etiquetadas Recientemente</div>'');'||unistr('\000a')||
'    -- Obtener la configuración de noticias'||unistr('\000a')||
'    open cr_notcfg;'||unistr('\000a')||
'    fetch cr_notcfg into v_notcfg;'||unistr('\000a')||
'    close cr_notcfg;'||unistr('\000a')||
'    -- Si no esta conf';

s:=s||'igurado, el servicio no esta habilitado'||unistr('\000a')||
'    if v_notcfg.ID is null then'||unistr('\000a')||
'      htp.print(''<br><br>El Servicio de Noticias y Novedades no se encuentra habilitado'');'||unistr('\000a')||
'    -- Si esta configurado el servicio de noticias'||unistr('\000a')||
'    else'||unistr('\000a')||
'      -- Si existen, Agregar enlaces a sitios Sociales'||unistr('\000a')||
'      if v_notcfg.blog_url is not null or'||unistr('\000a')||
'         v_notcfg.facebook_url is not null or'||unistr('\000a')||
'         v_notcfg.youtube_url is n';

s:=s||'ot null or'||unistr('\000a')||
'         v_notcfg.twitter_url is not null then'||unistr('\000a')||
'        -- Título'||unistr('\000a')||
'        htp.print('' <div class="slc">Mantente conectado: <ul class="scl-icons">'');'||unistr('\000a')||
'        -- Enlace a blog'||unistr('\000a')||
'        if v_notcfg.blog_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-blogger"><a href="''||v_notcfg.blog_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Facebook'||unistr('\000a')||
'        if v_notc';

s:=s||'fg.facebook_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-facebook"><a href="''||v_notcfg.facebook_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Youtube'||unistr('\000a')||
'        if v_notcfg.youtube_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-youtube"><a href="''||v_notcfg.youtube_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Twitter'||unistr('\000a')||
'      ';

s:=s||'  if v_notcfg.twitter_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-twitter"><a href="''||v_notcfg.twitter_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --'||unistr('\000a')||
'        htp.print(''</ul></div></div>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      --  '||unistr('\000a')||
'      htp.print(''<br><br>'');'||unistr('\000a')||
'      -- Novedades'||unistr('\000a')||
'      for v_notnov in cr_notnov loop'||unistr('\000a')||
'        i := i+1;'||unistr('\000a')||
'        -- Publicar novedad'||unistr('\000a')||
'        htp.print(''<div';

s:=s||' class="nov">'');'||unistr('\000a')||
'        -- Enlace'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''<a href="''||v_notnov.url||''" target="_blank">'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Titulo'||unistr('\000a')||
'        htp.print(''<b>''||v_notnov.titulo||''</b>'');'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''</a>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Resumen'||unistr('\000a')||
'        if v_notnov.resumen is not null then'||unistr('\000a')||
'          htp.print';

s:=s||'(''<br>''||v_notnov.resumen);'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Fecha Publicación'||unistr('\000a')||
'        htp.print(''<div class="tags">Publicado ''||to_char(v_notnov.publicado_desde,''dd/mm/yyyy''));'||unistr('\000a')||
'        -- Tags'||unistr('\000a')||
'        if v_notnov.tag1 is not null then'||unistr('\000a')||
'          htp.print('' // Tags: '');'||unistr('\000a')||
'          if v_notcfg.tag_url is not null then '||unistr('\000a')||
'            htp.print(''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag1)||''" targ';

s:=s||'et="_blank">''||lower(v_notnov.tag1)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag2)||''" target="_blank">''||lower(v_notnov.tag2)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag3)||''" target="_blank">''||lower(v_notnov.tag3)||''</a>'');'||unistr('\000a')||
'          else'||unistr('\000a')||
'            htp.print(lower(v_notnov.tag1)||'' - ''||lower(v_notnov.tag2)||'' - ''||lower(v_notnov.tag3));'||unistr('\000a')||
'  ';

s:=s||'        end if;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        -- Solo mostrar la cantidad maxima indicada el la configuración del servicio de noticias'||unistr('\000a')||
'        if i >= v_notcfg.NOTNOV_MAXCNT then'||unistr('\000a')||
'          exit;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --   '||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      -- Si no existen novedades para publicar'||unistr('\000a')||
'      if i = 0 then'||unistr('\000a')||
'        htp.print(''<br><br>No existen No';

s:=s||'vedades Etiquetadas Recientemente ... <br><br>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 46716521356688179 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Columna Triple (2) Smartphone',
  p_region_name=>'smartphone',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 60053457202939040+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 33,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => ':P2_CFGPOP_COL1 IS NOT NULL AND :P2_CFGPOP_COL2 IS NOT NULL AND :P2_CFGPOP_COL3 IS NOT NULL',
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
s:=s||'declare'||unistr('\000a')||
'  -- Para obtener los enlaces configurados para la página'||unistr('\000a')||
'  cursor cr_pagenl is'||unistr('\000a')||
'  select replace(replace(enlace,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')) enlace'||unistr('\000a')||
'       , atributos_enlace'||unistr('\000a')||
'       , consejo'||unistr('\000a')||
'       , replace(replace(etiqueta,''WKSP_IMG'',v(''WORKSPACE_IMAGES'')),''APP_IMG'',v(''APP_IMAGES'')) etiqueta'||unistr('\000a')||
'    from CFG_PORTAL_PAGENL_V'||unistr('\000a')||
'   where CFGPOP_ID =  :P2_CFGPOP_POR_ID'||unistr('\000a')||
'     and SI';

s:=s||'TUACION = ''PUB'''||unistr('\000a')||
'     and interface in (''TODAS'',''DESKTOP'')'||unistr('\000a')||
'   and sysdate between nvl(PUBLICACION_DESDE,sysdate) and nvl (PUBLICACION_HASTA,sysdate)'||unistr('\000a')||
'     and CFG_BI_PKG.CFGPPE_SEGUSU_AUTHO(p_cfgppe_id => id, p_segusu_id => :P2_SEGUSU_ID) = ''SI'''||unistr('\000a')||
'   order by ORDEN;'||unistr('\000a')||
'  -- Para obtener las configuración de noticias'||unistr('\000a')||
'  cursor cr_notcfg is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_configuraciones'||unistr('\000a')||
'  where segorg_id = :p1_segor';

s:=s||'g_id;'||unistr('\000a')||
'  -- Para obtener las novedades a publicar'||unistr('\000a')||
'  cursor cr_notnov is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_novedades'||unistr('\000a')||
'  where segorg_id = :p1_segorg_id'||unistr('\000a')||
'    and sysdate between publicado_desde and nvl(publicado_hasta,sysdate)'||unistr('\000a')||
'    and situacion = ''VAL'''||unistr('\000a')||
'  order by id desc;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_enlaces VARCHAR(4000);  '||unistr('\000a')||
'  v_notcfg not_configuraciones%rowtype;'||unistr('\000a')||
'  i number:=0;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Si se muestran los mensajes de Cuerpo'||unistr('\000a')||
' ';

s:=s||' if :P2_CFGPOP_COL3 = ''CUERPO'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    --htp.print(''<div class="tit">&P2_TITULO_PORTAL.</div><br><br>'');'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_2.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_3.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_4.'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si Se muestran los enlaces'||unistr('\000a')||
'  elsif :P2_CFGPOP_COL3 = ''ENLACES'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'  ';

s:=s||'  htp.print(''<div class="tit">Enlaces</div><br><br>'');'||unistr('\000a')||
'    -- Armar y Mostrar enlaces'||unistr('\000a')||
'    v_enlaces :=''<ul class="uVerticalSidebarList">'';        '||unistr('\000a')||
'    for v_pagenl in cr_pagenl loop'||unistr('\000a')||
'      v_enlaces := v_enlaces || ''<li><a href="''||v_pagenl.ENLACE||''" ''||v_pagenl.ATRIBUTOS_ENLACE||'' alt="''||v_pagenl.CONSEJO||''" title="''||v_pagenl.CONSEJO||''">''||v_pagenl.ETIQUETA||''</a></li>'';      '||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'  ';

s:=s||'  v_enlaces := v_enlaces || ''</ul>'';'||unistr('\000a')||
'    htp.print(v_enlaces); '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si se muestran las novedades de noticias'||unistr('\000a')||
'  elsif :P2_CFGPOP_COL3 = ''NOTICIAS'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div><div class="tit">Novedades Etiquetadas Recientemente</div>'');'||unistr('\000a')||
'    -- Obtener la configuración de noticias'||unistr('\000a')||
'    open cr_notcfg;'||unistr('\000a')||
'    fetch cr_notcfg into v_notcfg;'||unistr('\000a')||
'    close cr_notcfg;'||unistr('\000a')||
'    -- Si no esta configu';

s:=s||'rado, el servicio no esta habilitado'||unistr('\000a')||
'    if v_notcfg.ID is null then'||unistr('\000a')||
'      htp.print(''<br><br>El Servicio de Noticias y Novedades no se encuentra habilitado'');'||unistr('\000a')||
'    -- Si esta configurado el servicio de noticias'||unistr('\000a')||
'    else'||unistr('\000a')||
'      -- Si existen, Agregar enlaces a sitios Sociales'||unistr('\000a')||
'      if v_notcfg.blog_url is not null or'||unistr('\000a')||
'         v_notcfg.facebook_url is not null or'||unistr('\000a')||
'         v_notcfg.youtube_url is not ';

s:=s||'null or'||unistr('\000a')||
'         v_notcfg.twitter_url is not null then'||unistr('\000a')||
'        -- Título'||unistr('\000a')||
'        htp.print('' <div class="slc">Mantente conectado: <ul class="scl-icons">'');'||unistr('\000a')||
'        -- Enlace a blog'||unistr('\000a')||
'        if v_notcfg.blog_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-blogger"><a href="''||v_notcfg.blog_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Facebook'||unistr('\000a')||
'        if v_notcfg.';

s:=s||'facebook_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-facebook"><a href="''||v_notcfg.facebook_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Youtube'||unistr('\000a')||
'        if v_notcfg.youtube_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-youtube"><a href="''||v_notcfg.youtube_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Twitter'||unistr('\000a')||
'        i';

s:=s||'f v_notcfg.twitter_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-twitter"><a href="''||v_notcfg.twitter_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --'||unistr('\000a')||
'        htp.print(''</ul></div></div>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      --  '||unistr('\000a')||
'      htp.print(''<br><br>'');'||unistr('\000a')||
'      -- Novedades'||unistr('\000a')||
'      for v_notnov in cr_notnov loop'||unistr('\000a')||
'        i := i+1;'||unistr('\000a')||
'        -- Publicar novedad'||unistr('\000a')||
'        htp.print(''<div cl';

s:=s||'ass="nov">'');'||unistr('\000a')||
'        -- Enlace'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''<a href="''||v_notnov.url||''" target="_blank">'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Titulo'||unistr('\000a')||
'        htp.print(''<b>''||v_notnov.titulo||''</b>'');'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''</a>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Resumen'||unistr('\000a')||
'        if v_notnov.resumen is not null then'||unistr('\000a')||
'          htp.print(''<';

s:=s||'br>''||v_notnov.resumen);'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Fecha Publicación'||unistr('\000a')||
'        htp.print(''<div class="tags">Publicado ''||to_char(v_notnov.publicado_desde,''dd/mm/yyyy''));'||unistr('\000a')||
'        -- Tags'||unistr('\000a')||
'        if v_notnov.tag1 is not null then'||unistr('\000a')||
'          htp.print('' // Tags: '');'||unistr('\000a')||
'          if v_notcfg.tag_url is not null then '||unistr('\000a')||
'            htp.print(''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag1)||''" target=';

s:=s||'"_blank">''||lower(v_notnov.tag1)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag2)||''" target="_blank">''||lower(v_notnov.tag2)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag3)||''" target="_blank">''||lower(v_notnov.tag3)||''</a>'');'||unistr('\000a')||
'          else'||unistr('\000a')||
'            htp.print(lower(v_notnov.tag1)||'' - ''||lower(v_notnov.tag2)||'' - ''||lower(v_notnov.tag3));'||unistr('\000a')||
'     ';

s:=s||'     end if;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        -- Solo mostrar la cantidad maxima indicada el la configuración del servicio de noticias'||unistr('\000a')||
'        if i >= v_notcfg.NOTNOV_MAXCNT then'||unistr('\000a')||
'          exit;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --   '||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      -- Si no existen novedades para publicar'||unistr('\000a')||
'      if i = 0 then'||unistr('\000a')||
'        htp.print(''<br><br>No existen Noved';

s:=s||'ades Etiquetadas Recientemente ... <br><br>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 46716724820689209 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Columna Triple (3)',
  p_region_name=>'desktop',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 60053457202939040+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 34,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_grid_column_span => 3,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => ':P2_CFGPOP_COL1 IS NOT NULL AND :P2_CFGPOP_COL2 IS NOT NULL AND :P2_CFGPOP_COL3 IS NOT NULL',
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
s:=s||'declare'||unistr('\000a')||
'  -- Para obtener los enlaces configurados para la página'||unistr('\000a')||
'  cursor cr_pagenl is'||unistr('\000a')||
'  select replace(replace(enlace,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')) enlace'||unistr('\000a')||
'       , atributos_enlace'||unistr('\000a')||
'       , consejo'||unistr('\000a')||
'       , replace(replace(etiqueta,''WKSP_IMG'',v(''WORKSPACE_IMAGES'')),''APP_IMG'',v(''APP_IMAGES'')) etiqueta'||unistr('\000a')||
'    from CFG_PORTAL_PAGENL_V'||unistr('\000a')||
'   where CFGPOP_ID =  :P2_CFGPOP_POR_ID'||unistr('\000a')||
'     and SI';

s:=s||'TUACION = ''PUB'''||unistr('\000a')||
'     and interface in (''TODAS'',''SMARTPHONE'')'||unistr('\000a')||
'   and sysdate between nvl(PUBLICACION_DESDE,sysdate) and nvl (PUBLICACION_HASTA,sysdate)'||unistr('\000a')||
'     and CFG_BI_PKG.CFGPPE_SEGUSU_AUTHO(p_cfgppe_id => id, p_segusu_id => :P2_SEGUSU_ID) = ''SI'''||unistr('\000a')||
'   order by ORDEN;'||unistr('\000a')||
'  -- Para obtener las configuración de noticias'||unistr('\000a')||
'  cursor cr_notcfg is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_configuraciones'||unistr('\000a')||
'  where segorg_id = :p1_se';

s:=s||'gorg_id;'||unistr('\000a')||
'  -- Para obtener las novedades a publicar'||unistr('\000a')||
'  cursor cr_notnov is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_novedades'||unistr('\000a')||
'  where segorg_id = :p1_segorg_id'||unistr('\000a')||
'    and sysdate between publicado_desde and nvl(publicado_hasta,sysdate)'||unistr('\000a')||
'    and situacion = ''VAL'''||unistr('\000a')||
'  order by id desc;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_enlaces VARCHAR(4000);  '||unistr('\000a')||
'  v_notcfg not_configuraciones%rowtype;'||unistr('\000a')||
'  i number:=0;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Si se muestran los mensajes de Cuerp';

s:=s||'o'||unistr('\000a')||
'  if :P2_CFGPOP_COL3 = ''CUERPO'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    --htp.print(''<div class="tit">&P2_TITULO_PORTAL.</div><br><br>'');'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_2.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_3.'');'||unistr('\000a')||
'    htp.print(''&P2_CUERPO_MENSAJE_4.'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si Se muestran los enlaces'||unistr('\000a')||
'  elsif :P2_CFGPOP_COL3 = ''ENLACES'' then'||unistr('\000a')||
'    -- Titulo';

s:=s||''||unistr('\000a')||
'    htp.print(''<div class="tit">Enlaces</div><br><br>'');'||unistr('\000a')||
'    -- Armar y Mostrar enlaces'||unistr('\000a')||
'    v_enlaces :=''<ul class="uVerticalSidebarList">'';        '||unistr('\000a')||
'    for v_pagenl in cr_pagenl loop'||unistr('\000a')||
'      v_enlaces := v_enlaces || ''<li><a href="''||v_pagenl.ENLACE||''" ''||v_pagenl.ATRIBUTOS_ENLACE||'' alt="''||v_pagenl.CONSEJO||''" title="''||v_pagenl.CONSEJO||''">''||v_pagenl.ETIQUETA||''</a></li>'';      '||unistr('\000a')||
'    end loop;';

s:=s||''||unistr('\000a')||
'    v_enlaces := v_enlaces || ''</ul>'';'||unistr('\000a')||
'    htp.print(v_enlaces); '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si se muestran las novedades de noticias'||unistr('\000a')||
'  elsif :P2_CFGPOP_COL3 = ''NOTICIAS'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div><div class="tit">Novedades Etiquetadas Recientemente</div>'');'||unistr('\000a')||
'    -- Obtener la configuración de noticias'||unistr('\000a')||
'    open cr_notcfg;'||unistr('\000a')||
'    fetch cr_notcfg into v_notcfg;'||unistr('\000a')||
'    close cr_notcfg;'||unistr('\000a')||
'    -- Si no esta conf';

s:=s||'igurado, el servicio no esta habilitado'||unistr('\000a')||
'    if v_notcfg.ID is null then'||unistr('\000a')||
'      htp.print(''<br><br>El Servicio de Noticias y Novedades no se encuentra habilitado'');'||unistr('\000a')||
'    -- Si esta configurado el servicio de noticias'||unistr('\000a')||
'    else'||unistr('\000a')||
'      -- Si existen, Agregar enlaces a sitios Sociales'||unistr('\000a')||
'      if v_notcfg.blog_url is not null or'||unistr('\000a')||
'         v_notcfg.facebook_url is not null or'||unistr('\000a')||
'         v_notcfg.youtube_url is n';

s:=s||'ot null or'||unistr('\000a')||
'         v_notcfg.twitter_url is not null then'||unistr('\000a')||
'        -- Título'||unistr('\000a')||
'        htp.print('' <div class="slc">Mantente conectado: <ul class="scl-icons">'');'||unistr('\000a')||
'        -- Enlace a blog'||unistr('\000a')||
'        if v_notcfg.blog_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-blogger"><a href="''||v_notcfg.blog_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Facebook'||unistr('\000a')||
'        if v_notc';

s:=s||'fg.facebook_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-facebook"><a href="''||v_notcfg.facebook_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Youtube'||unistr('\000a')||
'        if v_notcfg.youtube_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-youtube"><a href="''||v_notcfg.youtube_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Twitter'||unistr('\000a')||
'      ';

s:=s||'  if v_notcfg.twitter_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-twitter"><a href="''||v_notcfg.twitter_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --'||unistr('\000a')||
'        htp.print(''</ul></div></div>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      --  '||unistr('\000a')||
'      htp.print(''<br><br>'');'||unistr('\000a')||
'      -- Novedades'||unistr('\000a')||
'      for v_notnov in cr_notnov loop'||unistr('\000a')||
'        i := i+1;'||unistr('\000a')||
'        -- Publicar novedad'||unistr('\000a')||
'        htp.print(''<div';

s:=s||' class="nov">'');'||unistr('\000a')||
'        -- Enlace'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''<a href="''||v_notnov.url||''" target="_blank">'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Titulo'||unistr('\000a')||
'        htp.print(''<b>''||v_notnov.titulo||''</b>'');'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''</a>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Resumen'||unistr('\000a')||
'        if v_notnov.resumen is not null then'||unistr('\000a')||
'          htp.print';

s:=s||'(''<br>''||v_notnov.resumen);'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Fecha Publicación'||unistr('\000a')||
'        htp.print(''<div class="tags">Publicado ''||to_char(v_notnov.publicado_desde,''dd/mm/yyyy''));'||unistr('\000a')||
'        -- Tags'||unistr('\000a')||
'        if v_notnov.tag1 is not null then'||unistr('\000a')||
'          htp.print('' // Tags: '');'||unistr('\000a')||
'          if v_notcfg.tag_url is not null then '||unistr('\000a')||
'            htp.print(''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag1)||''" targ';

s:=s||'et="_blank">''||lower(v_notnov.tag1)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag2)||''" target="_blank">''||lower(v_notnov.tag2)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag3)||''" target="_blank">''||lower(v_notnov.tag3)||''</a>'');'||unistr('\000a')||
'          else'||unistr('\000a')||
'            htp.print(lower(v_notnov.tag1)||'' - ''||lower(v_notnov.tag2)||'' - ''||lower(v_notnov.tag3));'||unistr('\000a')||
'  ';

s:=s||'        end if;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        -- Solo mostrar la cantidad maxima indicada el la configuración del servicio de noticias'||unistr('\000a')||
'        if i >= v_notcfg.NOTNOV_MAXCNT then'||unistr('\000a')||
'          exit;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --   '||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      -- Si no existen novedades para publicar'||unistr('\000a')||
'      if i = 0 then'||unistr('\000a')||
'        htp.print(''<br><br>No existen No';

s:=s||'vedades Etiquetadas Recientemente ... <br><br>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 46716929668690609 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Columna Triple (3) Smartphone',
  p_region_name=>'smartphone',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 60053457202939040+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 35,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_grid_column_span => 3,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => ':P2_CFGPOP_COL1 IS NOT NULL AND :P2_CFGPOP_COL2 IS NOT NULL AND :P2_CFGPOP_COL3 IS NOT NULL',
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
s:=s||'begin'||unistr('\000a')||
'  htp.p(:P2_CABECERA_MENSAJE);'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 50278405386167337 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Cabecera Libre',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 60053457202939040+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 80,
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
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => ':P2_ESTILO_CABECERA  = ''LIB''',
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
  p_id=> 56317033718943884 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'TopBar',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 60053457202939040+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_04',
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
s:=s||'begin'||unistr('\000a')||
'  --Style solo para COMPRAS  '||unistr('\000a')||
'  if :P2_SEGORG_CODIGO = ''PCYCSL'' then'||unistr('\000a')||
'    htp.p(''<style>'||unistr('\000a')||
'.fondo-gris{background-color:#F0F0F0 !important;}'||unistr('\000a')||
'.menu-18px{font-size:18px !important;}'||unistr('\000a')||
'</style>'');'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  --'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 68713114021845937 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'CSS por Organizaciones',
  p_region_name=>'CSS-ID',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 60048771788939037+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 90,
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
s:=s||'<div style="float:left;">'||unistr('\000a')||
'<a  class="audio {skin:''mySkin'', autoPlay:true, inLine:true, showVolumeLevel:true, showRew:false, showTime:false, showControls:false, showVolumeLevel:false, width:175, addShadow:false}" href="&P1_AUDIO_ARCHIVO."></a></div>';

wwv_flow_api.create_page_plug (
  p_id=> 70318049975244639 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Reproductor de Audio',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 70,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_07',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_plug_display_when_condition => 'P2_AUDIO_SN',
  p_plug_display_when_cond2=>'SI',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_header=> '<script type="text/javascript" src="#IMAGE_PREFIX#themes/theme_multicolor/&P1_APP_THEME./js/jquery.jplayer.min.js"></script>'||unistr('\000a')||
'<script type="text/javascript" src="#IMAGE_PREFIX#themes/theme_multicolor/&P1_APP_THEME./js/jquery.mb.miniPlayer.js"></script>'||unistr('\000a')||
'<link rel="stylesheet" type="text/css" href="#IMAGE_PREFIX#themes/theme_multicolor/&P1_APP_THEME./css/miniplayer.css" title="style"  media="screen"/>'||unistr('\000a')||
''||unistr('\000a')||
'<script>'||unistr('\000a')||
'$(function(){'||unistr('\000a')||
'    if(isAndroidDefault){'||unistr('\000a')||
'        alert("Disculpa, su navegador no soporta el reproductor de audio. Puede utilizar el reproductor de audio HTML5 estándar en lugar")'||unistr('\000a')||
'    }'||unistr('\000a')||
'    '||unistr('\000a')||
'    $(".audio").mb_miniPlayer({'||unistr('\000a')||
'        width:240,'||unistr('\000a')||
'	inLine:false'||unistr('\000a')||
'    });'||unistr('\000a')||
'});'||unistr('\000a')||
'</script>',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>56319131088028273 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::P1_SEGORG_CODIGO:&P2_SEGORG_CODIGO.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_branch_condition_type=> 'PLSQL_EXPRESSION',
  p_branch_condition=> ':P1_SEGORG_CODIGO <> :P2_SEGORG_CODIGO',
  p_save_state_before_branch_yn=>'Y',
  p_branch_comment=> 'Created 06-DIC-2010 13:15 by JPREDA');
 
wwv_flow_api.create_page_branch(
  p_id=>52292232809299690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 20,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 06-ABR-2010 12:21 by ECONTRERAS');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>46712008152526357 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_CFGPOP_COL1',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 380,
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
  p_id=>46712203408528553 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_CFGPOP_COL2',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 390,
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
  p_id=>46712432510530242 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_CFGPOP_COL3',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 400,
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
  p_id=>50270126740109810 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_ESTILO_CABECERA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 410,
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
  p_id=>50278630329167342 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_CABECERA_MENSAJE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 530,
  p_item_plug_id => 50278405386167337+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Cabecera Mensaje',
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
  p_id=>52907451683704268 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_CFGPOP_POR_ID',
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
  p_id=>52907656878705745 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_TITULO_PORTAL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
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
  p_id=>52907929997707434 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_CUERPO_MENSAJE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
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
  p_id=>52909130390735920 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_CFGDIA_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
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
  p_id=>52921343044203275 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_CFGPOP_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
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
  p_id=>53811751278752734 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_CUERPO_REGION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
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
  p_id=>53812945353798392 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_TITULO_REGION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
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
  p_id=>56317543545956192 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_SEGORG_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 46713631867625057+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '&P1_SEGORG_CODIGO.',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select nombre d, codigo r'||unistr('\000a')||
'from seg_organizaciones'||unistr('\000a')||
'where codigo <> ''INTERNAL''',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_cattributes_element=>'align= "right" width="890px"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'G_SEGAMB_TIPO',
  p_display_when2=>'DESA',
  p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
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
  p_id=>59910756133368889 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_ENLACE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 90,
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
  p_id=>70318253307244643 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_AUDIO_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 330,
  p_item_plug_id => 70318049975244639+wwv_flow_api.g_id_offset,
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
  p_id=>70318432502244643 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_AUDIO_ARCHIVO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 340,
  p_item_plug_id => 70318049975244639+wwv_flow_api.g_id_offset,
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
  p_id=>72182106448711067 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_URL_GEONETWORK',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 540,
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
  p_id=>76116260918144518 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_CUERPO_MENSAJE_2',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 350,
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
  p_id=>76116758762145509 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_CUERPO_MENSAJE_3',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 360,
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
  p_id=>76116956821146417 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_CUERPO_MENSAJE_4',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 370,
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

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'declare'||unistr('\000a')||
'--'||unistr('\000a')||
'cursor cr_pass is'||unistr('\000a')||
'  select VALOR '||unistr('\000a')||
'  from SEG_CONFIGURACIONES'||unistr('\000a')||
'  where CODIGO = ''IDEGNT_PASSWORD_FIJA'';'||unistr('\000a')||
'--'||unistr('\000a')||
'cursor cr_url is'||unistr('\000a')||
'  select VALOR '||unistr('\000a')||
'  from SEG_CONFIGURACIONES'||unistr('\000a')||
'  where CODIGO = ''IDEGNT_URL'';'||unistr('\000a')||
'--  '||unistr('\000a')||
'--'||unistr('\000a')||
'cursor cr_pass_admin is'||unistr('\000a')||
'  select VALOR '||unistr('\000a')||
'  from SEG_CONFIGURACIONES'||unistr('\000a')||
'  where CODIGO = ''IDEGNT_PASSWORD'';'||unistr('\000a')||
'--'||unistr('\000a')||
'cursor cr_user_admin is'||unistr('\000a')||
'  select VALOR '||unistr('\000a')||
'  from SEG_CONFIGURACIONES'||unistr('\000a')||
'  where CODI';

p:=p||'GO = ''IDEGNT_USERNAME'';'||unistr('\000a')||
'--  '||unistr('\000a')||
'v_pass VARCHAR2(200);'||unistr('\000a')||
'v_username VARCHAR2(200);'||unistr('\000a')||
'v_url VARCHAR2(2000);'||unistr('\000a')||
'v_retorno NUMBER;'||unistr('\000a')||
'v_url_completa VARCHAR2(2000);'||unistr('\000a')||
'v_param     VARCHAR2(30000);'||unistr('\000a')||
'v_request   utl_http.req;'||unistr('\000a')||
'v_response  utl_http.resp; '||unistr('\000a')||
'v_mensaje VARCHAR2(400);'||unistr('\000a')||
'--v_retorno varchar2(90);'||unistr('\000a')||
'v_value VARCHAR2(1024);'||unistr('\000a')||
'--'||unistr('\000a')||
'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
'  '||unistr('\000a')||
'  v_username := convert(substr(:APP_USER,1,30),''UTF8'');'||unistr('\000a')||
'  --'||unistr('\000a')||
'  open cr_url;'||unistr('\000a')||
' ';

p:=p||' fetch cr_url into v_url;'||unistr('\000a')||
'  close cr_url;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  if v_username <> ''nobody'' then'||unistr('\000a')||
'  '||unistr('\000a')||
'    if v_username = ''IDESL.SRVMNA.DNI.ADMIN'' then'||unistr('\000a')||
'      --'||unistr('\000a')||
'      open cr_pass_admin;'||unistr('\000a')||
'      fetch cr_pass_admin into v_pass;'||unistr('\000a')||
'     close cr_pass_admin;'||unistr('\000a')||
'      --'||unistr('\000a')||
'      open cr_user_admin;'||unistr('\000a')||
'      fetch cr_user_admin into v_username;'||unistr('\000a')||
'      close cr_user_admin;'||unistr('\000a')||
'      --'||unistr('\000a')||
'      :P2_URL_GEONETWORK := v_url||''srv/spa/xml.user.';

p:=p||'login?username=''||v_username||''&password=''||v_pass;'||unistr('\000a')||
'      -- '||unistr('\000a')||
'    else '||unistr('\000a')||
'      --'||unistr('\000a')||
'      open cr_pass;'||unistr('\000a')||
'      fetch cr_pass into v_pass;'||unistr('\000a')||
'      close cr_pass;'||unistr('\000a')||
'      --'||unistr('\000a')||
'      :P2_URL_GEONETWORK := v_url||''srv/spa/xml.user.login?username=''||v_username||''&password=''||v_pass;'||unistr('\000a')||
'      --'||unistr('\000a')||
'      --IDEGNT_PKG.IDEGNT_PETICION_GEN(p_url => "srv/spa/xml.info?type=users",p_xml => "",p_retorno => v_retorno);'||unistr('\000a')||
'      -';

p:=p||'-'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  else '||unistr('\000a')||
'  --'||unistr('\000a')||
'    :P2_URL_GEONETWORK := v_url||''j_spring_security_logout'';'||unistr('\000a')||
'  --'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  '||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 72183027050738617 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 2,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'CargarDatosGeonetwork',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P2_CFGPOP_CODIGO',
  p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_process_when2=>'SECCAT',
  p_process_when_type2=>'',
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
'  cursor cr_cfgpop is'||unistr('\000a')||
'  select ESTILO_CABECERA'||unistr('\000a')||
'  ,CABECERA_MENSAJE'||unistr('\000a')||
'  ,ESTILO'||unistr('\000a')||
'  ,COL1'||unistr('\000a')||
'  ,COL2'||unistr('\000a')||
'  ,COL3'||unistr('\000a')||
'  ,CUERPO_MENSAJE'||unistr('\000a')||
'  ,CUERPO_MENSAJE_2'||unistr('\000a')||
'  ,CUERPO_MENSAJE_3'||unistr('\000a')||
'  ,CUERPO_MENSAJE_4'||unistr('\000a')||
'  ,AUDIO_SN'||unistr('\000a')||
'  ,AUDIO_ARCHIVO'||unistr('\000a')||
'  ,INTERVALO_SLIDE'||unistr('\000a')||
'  ,TWITTER_CODIGO'||unistr('\000a')||
'  ,DATE_CREATED'||unistr('\000a')||
'  ,CREATED_BY'||unistr('\000a')||
'  ,DATE_MODIFIED'||unistr('\000a')||
'  ,MODIFIED_BY'||unistr('\000a')||
'  ,SEGORG_ID'||unistr('\000a')||
'  ,CFGPOR_CODIGO'||unistr('\000a')||
'  ,CFGPOR_NOMBRE'||unistr('\000a')||
'  ,CFGPOR_DESCRIPCION'||unistr('\000a')||
'  ,CFGPOR_SITUAC';

p:=p||'ION'||unistr('\000a')||
'  ,ID'||unistr('\000a')||
'  ,CFGPOR_ID'||unistr('\000a')||
'  ,TIPO'||unistr('\000a')||
'  ,ORDEN'||unistr('\000a')||
'  ,CODIGO'||unistr('\000a')||
'  ,TITULO'||unistr('\000a')||
'  from CFG_PORTAL_PAG_V'||unistr('\000a')||
'  where segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'  and CFGPOR_SITUACION = ''ACT'''||unistr('\000a')||
'  order by ORDEN;  '||unistr('\000a')||
'  --'||unistr('\000a')||
'  cursor cr_cfgpop2 is'||unistr('\000a')||
'  select ESTILO_CABECERA'||unistr('\000a')||
'  ,CABECERA_MENSAJE'||unistr('\000a')||
'  ,ESTILO'||unistr('\000a')||
'  ,COL1'||unistr('\000a')||
'  ,COL2'||unistr('\000a')||
'  ,COL3'||unistr('\000a')||
'  ,CUERPO_MENSAJE'||unistr('\000a')||
'  ,CUERPO_MENSAJE_2'||unistr('\000a')||
'  ,CUERPO_MENSAJE_3'||unistr('\000a')||
'  ,CUERPO_MENSAJE_4'||unistr('\000a')||
'  ,AUDIO_SN'||unistr('\000a')||
'  ,AUDIO_ARCHIVO'||unistr('\000a')||
'  ,INTERVALO_SLID';

p:=p||'E'||unistr('\000a')||
'  ,TWITTER_CODIGO'||unistr('\000a')||
'  ,DATE_CREATED'||unistr('\000a')||
'  ,CREATED_BY'||unistr('\000a')||
'  ,DATE_MODIFIED'||unistr('\000a')||
'  ,MODIFIED_BY'||unistr('\000a')||
'  ,SEGORG_ID'||unistr('\000a')||
'  ,CFGPOR_CODIGO'||unistr('\000a')||
'  ,CFGPOR_NOMBRE'||unistr('\000a')||
'  ,CFGPOR_DESCRIPCION'||unistr('\000a')||
'  ,CFGPOR_SITUACION'||unistr('\000a')||
'  ,ID'||unistr('\000a')||
'  ,CFGPOR_ID'||unistr('\000a')||
'  ,TIPO'||unistr('\000a')||
'  ,ORDEN'||unistr('\000a')||
'  ,CODIGO'||unistr('\000a')||
'  ,TITULO'||unistr('\000a')||
'  from CFG_PORTAL_PAG_V'||unistr('\000a')||
'  where cfgpor_id = :P1_CFGPOP_POR_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_portal VARCHAR(4000);  '||unistr('\000a')||
'  v_opciones NUMBER;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin  '||unistr('\000a')||
' --'||unistr('\000a')||
' :P1_CFGPOP_POR_CODIGO := null;'||unistr('\000a')||
' :P1_TI';

p:=p||'TULO_PORTAL     := null;'||unistr('\000a')||
' :P1_ESTILO_CABECERA   := null;'||unistr('\000a')||
' :P1_CFGPOP_COL1       := null;'||unistr('\000a')||
' :P1_CFGPOP_COL2       := null;'||unistr('\000a')||
' :P1_CFGPOP_COL3       := null;'||unistr('\000a')||
' :P1_CUERPO_MENSAJE    := null;'||unistr('\000a')||
' :P1_CUERPO_MENSAJE_2    := null;'||unistr('\000a')||
' :P1_CUERPO_MENSAJE_3    := null;'||unistr('\000a')||
' :P1_CUERPO_MENSAJE_4    := null;'||unistr('\000a')||
' :P1_INTERVALO_SLIDE   := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC1_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC1_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_SE';

p:=p||'C2_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC2_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC3_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC3_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC4_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC4_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC5_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC5_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC6_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC6_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC7_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC7_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_';

p:=p||'SEC8_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC8_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC9_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC9_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC10_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC10_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_POR_ID      := null;'||unistr('\000a')||
' v_opciones := 1;'||unistr('\000a')||
' if :P1_SEGORG_ID IS NOT NULL THEN'||unistr('\000a')||
'   FOR v_cfgpop IN cr_cfgpop LOOP'||unistr('\000a')||
'  IF v_cfgpop.TIPO = ''POR'' THEN'||unistr('\000a')||
'    :P1_CFGPOP_POR_ID := v_cfgpop.ID;'||unistr('\000a')||
'    :P1_CFGPOP_POR_';

p:=p||'CODIGO := v_cfgpop.CODIGO;'||unistr('\000a')||
'    :P1_TITULO_PORTAL     := v_cfgpop.TITULO;'||unistr('\000a')||
'    :P1_ESTILO_CABECERA   := v_cfgpop.ESTILO_CABECERA;'||unistr('\000a')||
'    :P1_CABECERA_MENSAJE  := v_cfgpop.CABECERA_MENSAJE;'||unistr('\000a')||
'    :P1_CFGPOP_COL1       := v_cfgpop.COL1;'||unistr('\000a')||
'    :P1_CFGPOP_COL2       := v_cfgpop.COL2;'||unistr('\000a')||
'    :P1_CFGPOP_COL3       := v_cfgpop.COL3;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE    := v_cfgpop.CUERPO_MENSAJE;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE_2    :=';

p:=p||' v_cfgpop.CUERPO_MENSAJE_2;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE_3    := v_cfgpop.CUERPO_MENSAJE_3;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE_4    := v_cfgpop.CUERPO_MENSAJE_4;'||unistr('\000a')||
'    :P1_AUDIO_SN          := v_cfgpop.AUDIO_SN;'||unistr('\000a')||
'    :P1_AUDIO_ARCHIVO     := v_cfgpop.AUDIO_ARCHIVO;'||unistr('\000a')||
'    :P1_INTERVALO_SLIDE   := nvl(v_cfgpop.INTERVALO_SLIDE,15000);'||unistr('\000a')||
'  ELSIF v_cfgpop.TIPO IN (''PAG'',''ENL'') THEN'||unistr('\000a')||
'    CASE v_opciones '||unistr('\000a')||
'         when 1 then BEG';

p:=p||'IN :P1_CFGPOP_SEC1_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC1_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 2 then BEGIN :P1_CFGPOP_SEC2_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC2_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 3 then BEGIN :P1_CFGPOP_SEC3_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC3_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 4 then BEGIN :P1_CFGPOP_SEC4_CODIGO := v_cfgpop.CODIG';

p:=p||'O; :P1_CFGPOP_SEC4_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 5 then BEGIN :P1_CFGPOP_SEC5_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC5_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 6 then BEGIN :P1_CFGPOP_SEC6_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC6_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 7 then BEGIN :P1_CFGPOP_SEC7_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC7_TITULO := v_cfgpop.TITUL';

p:=p||'O;  END;'||unistr('\000a')||
'         when 8 then BEGIN :P1_CFGPOP_SEC8_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC8_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 9 then BEGIN :P1_CFGPOP_SEC9_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC9_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 10 then BEGIN :P1_CFGPOP_SEC10_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC10_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'    END CASE;'||unistr('\000a')||
'    v_opciones :=';

p:=p||' v_opciones + 1;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
' END LOOP; '||unistr('\000a')||
' ELSE'||unistr('\000a')||
'   FOR v_cfgpop IN cr_cfgpop2 LOOP'||unistr('\000a')||
'  IF v_cfgpop.TIPO = ''POR'' THEN'||unistr('\000a')||
'    :P1_CFGPOP_POR_ID := v_cfgpop.ID;'||unistr('\000a')||
'    :P1_CFGPOP_POR_CODIGO := v_cfgpop.CODIGO;'||unistr('\000a')||
'    :P1_TITULO_PORTAL     := v_cfgpop.TITULO;'||unistr('\000a')||
'    :P1_ESTILO_CABECERA   := v_cfgpop.ESTILO_CABECERA;'||unistr('\000a')||
'    :P1_CABECERA_MENSAJE  := v_cfgpop.CABECERA_MENSAJE;'||unistr('\000a')||
'    :P1_CFGPOP_COL1       := v_cfgpop.COL1;'||unistr('\000a')||
'   ';

p:=p||' :P1_CFGPOP_COL2       := v_cfgpop.COL2;'||unistr('\000a')||
'    :P1_CFGPOP_COL3       := v_cfgpop.COL3;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE    := v_cfgpop.CUERPO_MENSAJE;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE_2    := v_cfgpop.CUERPO_MENSAJE_2;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE_3    := v_cfgpop.CUERPO_MENSAJE_3;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE_4    := v_cfgpop.CUERPO_MENSAJE_4;'||unistr('\000a')||
'    :P1_AUDIO_SN          := v_cfgpop.AUDIO_SN;'||unistr('\000a')||
'    :P1_AUDIO_ARCHIVO     := v_cfgpop.A';

p:=p||'UDIO_ARCHIVO;'||unistr('\000a')||
'    :P1_INTERVALO_SLIDE   := nvl(v_cfgpop.INTERVALO_SLIDE,15000);'||unistr('\000a')||
'  ELSIF v_cfgpop.TIPO IN (''PAG'',''ENL'') THEN'||unistr('\000a')||
'    CASE v_opciones '||unistr('\000a')||
'         when 1 then BEGIN :P1_CFGPOP_SEC1_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC1_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 2 then BEGIN :P1_CFGPOP_SEC2_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC2_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 3 t';

p:=p||'hen BEGIN :P1_CFGPOP_SEC3_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC3_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 4 then BEGIN :P1_CFGPOP_SEC4_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC4_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 5 then BEGIN :P1_CFGPOP_SEC5_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC5_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 6 then BEGIN :P1_CFGPOP_SEC6_CODIGO := v_cfgpo';

p:=p||'p.CODIGO; :P1_CFGPOP_SEC6_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 7 then BEGIN :P1_CFGPOP_SEC7_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC7_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 8 then BEGIN :P1_CFGPOP_SEC8_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC8_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 9 then BEGIN :P1_CFGPOP_SEC9_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC9_TITULO := v_cfgpo';

p:=p||'p.TITULO;  END;'||unistr('\000a')||
'         when 10 then BEGIN :P1_CFGPOP_SEC10_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC10_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'    END CASE;'||unistr('\000a')||
'    v_opciones := v_opciones + 1;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
' END LOOP; '||unistr('\000a')||
''||unistr('\000a')||
' END IF;'||unistr('\000a')||
''||unistr('\000a')||
' --'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 50074347716368386 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 2,
  p_process_sequence=> 90,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Inicializar Portal',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P1_CFGPOP_POR_CODIGO',
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
p:=p||'declare'||unistr('\000a')||
'  cursor cr_cfgpop is'||unistr('\000a')||
'  select ID'||unistr('\000a')||
'       , TITULO'||unistr('\000a')||
'       , replace( replace(replace(replace(replace(CUERPO_MENSAJE,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')),''ORGCOD'',v(''P1_SEGORG_CODIGO'')),''ORGID'',v(''P1_SEGORG_ID'')),''ENTEND'',v(''P1_ENTEND_ID'')) CUERPO_MENSAJE'||unistr('\000a')||
'       , replace(replace(replace(replace(CUERPO_MENSAJE_2,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')),''ORGCOD'',v(''P1_SEGORG_COD';

p:=p||'IGO'')),''ORGID'',v(''P1_SEGORG_ID'')) CUERPO_MENSAJE_2'||unistr('\000a')||
'       , replace(replace(replace(replace(CUERPO_MENSAJE_3,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')),''ORGCOD'',v(''P1_SEGORG_CODIGO'')),''ORGID'',v(''P1_SEGORG_ID'')) CUERPO_MENSAJE_3'||unistr('\000a')||
'       , replace(replace(replace(replace(CUERPO_MENSAJE_4,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')),''ORGCOD'',v(''P1_SEGORG_CODIGO'')),''ORGID'',v(''P1_SEGORG_ID'')) CUERPO';

p:=p||'_MENSAJE_4'||unistr('\000a')||
'       , TIPO'||unistr('\000a')||
'       , AUDIO_SN'||unistr('\000a')||
'       , AUDIO_ARCHIVO'||unistr('\000a')||
'       , COL1'||unistr('\000a')||
'       , COL2'||unistr('\000a')||
'       , COL3'||unistr('\000a')||
'       , ESTILO_CABECERA'||unistr('\000a')||
'       , CABECERA_MENSAJE'||unistr('\000a')||
'  from CFG_PORTAL_PAG_V'||unistr('\000a')||
'  where segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'  and CFGPOR_SITUACION = ''ACT'''||unistr('\000a')||
'  and TIPO IN (''PAG'',''ENL'')'||unistr('\000a')||
'  and CODIGO = :P2_CFGPOP_CODIGO;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_portal VARCHAR(4000);  '||unistr('\000a')||
'  v_cfgpop_tipo   VARCHAR2(100);'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin  '||unistr('\000a')||
'  --'||unistr('\000a')||
'  :P2_';

p:=p||'ENLACE := NULL;'||unistr('\000a')||
'  -- '||unistr('\000a')||
'  for v_cfgpop in cr_cfgpop loop'||unistr('\000a')||
'    :P2_ESTILO_CABECERA   := v_cfgpop.ESTILO_CABECERA;'||unistr('\000a')||
'    :P2_CABECERA_MENSAJE  := v_cfgpop.CABECERA_MENSAJE;'||unistr('\000a')||
'    :P2_CFGPOP_COL1       := v_cfgpop.COL1;'||unistr('\000a')||
'    :P2_CFGPOP_COL2       := v_cfgpop.COL2;'||unistr('\000a')||
'    :P2_CFGPOP_COL3       := v_cfgpop.COL3;'||unistr('\000a')||
'    :P2_CFGPOP_POR_ID     := v_cfgpop.ID;'||unistr('\000a')||
'    :P2_TITULO_PORTAL     := v_cfgpop.TITULO;'||unistr('\000a')||
'    :P2_CUERPO';

p:=p||'_MENSAJE    := v_cfgpop.CUERPO_MENSAJE;'||unistr('\000a')||
'    :P2_CUERPO_MENSAJE_2  := v_cfgpop.CUERPO_MENSAJE_2;'||unistr('\000a')||
'    :P2_CUERPO_MENSAJE_3  := v_cfgpop.CUERPO_MENSAJE_3;'||unistr('\000a')||
'    :P2_CUERPO_MENSAJE_4  := v_cfgpop.CUERPO_MENSAJE_4;'||unistr('\000a')||
'    :P2_AUDIO_SN          := v_cfgpop.AUDIO_SN;'||unistr('\000a')||
'    :P2_AUDIO_ARCHIVO     := v_cfgpop.AUDIO_ARCHIVO;'||unistr('\000a')||
'    v_cfgpop_tipo         := v_cfgpop.TIPO; '||unistr('\000a')||
'  end loop;'||unistr('\000a')||
'  -- Redireccionar si el tipo de p';

p:=p||'ágina es enlace y el enlace se encuentra configurado'||unistr('\000a')||
'  if v_cfgpop_tipo = ''ENL'' then'||unistr('\000a')||
'    declare'||unistr('\000a')||
'      cursor cr_enl is'||unistr('\000a')||
'      select  replace(replace(replace(replace(enlace,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')),''ORGCOD'',v(''P1_SEGORG_CODIGO'')),''ORGID'',v(''P1_SEGORG_ID'')) enlace'||unistr('\000a')||
'      from CFG_PORTAL_PAGENL_V'||unistr('\000a')||
'      where CFGPOP_ID =  :P2_CFGPOP_ID'||unistr('\000a')||
'      and SITUACION = ''PUB'''||unistr('\000a')||
'      order by OR';

p:=p||'DEN;'||unistr('\000a')||
'      --'||unistr('\000a')||
'    begin  '||unistr('\000a')||
'     open cr_enl;'||unistr('\000a')||
'     fetch cr_enl into :P2_ENLACE; '||unistr('\000a')||
'     close cr_enl;'||unistr('\000a')||
'     if :P2_ENLACE is not null then'||unistr('\000a')||
'        OWA_UTIL.redirect_url(:P2_ENLACE);'||unistr('\000a')||
'     end if;'||unistr('\000a')||
'     --'||unistr('\000a')||
'    end;'||unistr('\000a')||
'   end if;'||unistr('\000a')||
'   --'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 52907032328651367 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 2,
  p_process_sequence=> 100,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Inicializar Pagina',
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
'  cursor cr_cfgpop is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from CFG_PORTAL_PAG_V'||unistr('\000a')||
'  where segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'  and CFGPOR_SITUACION = ''ACT'''||unistr('\000a')||
'  order by ORDEN;  '||unistr('\000a')||
'  --'||unistr('\000a')||
'  cursor cr_cfgpop2 is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from CFG_PORTAL_PAG_V'||unistr('\000a')||
'  where cfgpor_id = :P1_CFGPOP_POR_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_portal VARCHAR(4000);  '||unistr('\000a')||
'  v_opciones NUMBER;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin  '||unistr('\000a')||
' --'||unistr('\000a')||
' :P1_CFGPOP_POR_CODIGO := null;'||unistr('\000a')||
' :P1_TITULO_PORTAL     := null;'||unistr('\000a')||
' :P1_ESTILO_C';

p:=p||'ABECERA   := null;'||unistr('\000a')||
' :P1_CFGPOP_COL1       := null;'||unistr('\000a')||
' :P1_CFGPOP_COL2       := null;'||unistr('\000a')||
' :P1_CFGPOP_COL3       := null;'||unistr('\000a')||
' :P1_CUERPO_MENSAJE    := null;'||unistr('\000a')||
' :P1_CUERPO_MENSAJE_2    := null;'||unistr('\000a')||
' :P1_CUERPO_MENSAJE_3    := null;'||unistr('\000a')||
' :P1_CUERPO_MENSAJE_4    := null;'||unistr('\000a')||
' :P1_INTERVALO_SLIDE   := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC1_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC1_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC2_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC2_T';

p:=p||'ITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC3_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC3_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC4_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC4_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC5_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC5_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC6_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC6_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC7_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC7_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC8_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC8';

p:=p||'_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC9_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC9_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC10_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC10_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_POR_ID      := null;'||unistr('\000a')||
' v_opciones := 1;'||unistr('\000a')||
' if :P1_SEGORG_ID IS NOT NULL THEN'||unistr('\000a')||
'   FOR v_cfgpop IN cr_cfgpop LOOP'||unistr('\000a')||
'  IF v_cfgpop.TIPO = ''POR'' THEN'||unistr('\000a')||
'    :P1_CFGPOP_POR_ID := v_cfgpop.ID;'||unistr('\000a')||
'    :P1_CFGPOP_POR_CODIGO := v_cfgpop.CODIGO;'||unistr('\000a')||
'    :P1_TIT';

p:=p||'ULO_PORTAL     := v_cfgpop.TITULO;'||unistr('\000a')||
'    :P1_ESTILO_CABECERA   := v_cfgpop.ESTILO_CABECERA;'||unistr('\000a')||
'    :P1_CABECERA_MENSAJE  := v_cfgpop.CABECERA_MENSAJE;'||unistr('\000a')||
'    :P1_CFGPOP_COL1       := v_cfgpop.COL1;'||unistr('\000a')||
'    :P1_CFGPOP_COL2       := v_cfgpop.COL2;'||unistr('\000a')||
'    :P1_CFGPOP_COL3       := v_cfgpop.COL3;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE    := v_cfgpop.CUERPO_MENSAJE;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE_2    := v_cfgpop.CUERPO_MENSAJE_2;'||unistr('\000a')||
'    :P1_CU';

p:=p||'ERPO_MENSAJE_3    := v_cfgpop.CUERPO_MENSAJE_3;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE_4    := v_cfgpop.CUERPO_MENSAJE_4;'||unistr('\000a')||
'    :P1_AUDIO_SN          := v_cfgpop.AUDIO_SN;'||unistr('\000a')||
'    :P1_AUDIO_ARCHIVO     := v_cfgpop.AUDIO_ARCHIVO;'||unistr('\000a')||
'    :P1_INTERVALO_SLIDE   := nvl(v_cfgpop.INTERVALO_SLIDE,15000);'||unistr('\000a')||
'  ELSIF v_cfgpop.TIPO IN (''PAG'',''ENL'') THEN'||unistr('\000a')||
'    CASE v_opciones '||unistr('\000a')||
'         when 1 then BEGIN :P1_CFGPOP_SEC1_CODIGO := v_cfgpop.';

p:=p||'CODIGO; :P1_CFGPOP_SEC1_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 2 then BEGIN :P1_CFGPOP_SEC2_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC2_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 3 then BEGIN :P1_CFGPOP_SEC3_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC3_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 4 then BEGIN :P1_CFGPOP_SEC4_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC4_TITULO := v_cfgpop.';

p:=p||'TITULO;  END;'||unistr('\000a')||
'         when 5 then BEGIN :P1_CFGPOP_SEC5_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC5_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 6 then BEGIN :P1_CFGPOP_SEC6_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC6_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 7 then BEGIN :P1_CFGPOP_SEC7_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC7_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 8 then BEGIN :P';

p:=p||'1_CFGPOP_SEC8_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC8_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 9 then BEGIN :P1_CFGPOP_SEC9_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC9_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 10 then BEGIN :P1_CFGPOP_SEC10_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC10_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'    END CASE;'||unistr('\000a')||
'    v_opciones := v_opciones + 1;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
' END LOOP; ';

p:=p||''||unistr('\000a')||
' ELSE'||unistr('\000a')||
'   FOR v_cfgpop IN cr_cfgpop2 LOOP'||unistr('\000a')||
'  IF v_cfgpop.TIPO = ''POR'' THEN'||unistr('\000a')||
'    :P1_CFGPOP_POR_ID := v_cfgpop.ID;'||unistr('\000a')||
'    :P1_CFGPOP_POR_CODIGO := v_cfgpop.CODIGO;'||unistr('\000a')||
'    :P1_TITULO_PORTAL     := v_cfgpop.TITULO;'||unistr('\000a')||
'    :P1_ESTILO_CABECERA   := v_cfgpop.ESTILO_CABECERA;'||unistr('\000a')||
'    :P1_CABECERA_MENSAJE  := v_cfgpop.CABECERA_MENSAJE;'||unistr('\000a')||
'    :P1_CFGPOP_COL1       := v_cfgpop.COL1;'||unistr('\000a')||
'    :P1_CFGPOP_COL2       := v_cfgpop.COL';

p:=p||'2;'||unistr('\000a')||
'    :P1_CFGPOP_COL3       := v_cfgpop.COL3;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE    := v_cfgpop.CUERPO_MENSAJE;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE_2    := v_cfgpop.CUERPO_MENSAJE_2;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE_3    := v_cfgpop.CUERPO_MENSAJE_3;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE_4    := v_cfgpop.CUERPO_MENSAJE_4;'||unistr('\000a')||
'    :P1_AUDIO_SN          := v_cfgpop.AUDIO_SN;'||unistr('\000a')||
'    :P1_AUDIO_ARCHIVO     := v_cfgpop.AUDIO_ARCHIVO;'||unistr('\000a')||
'    :P1_INTERVALO_SLIDE ';

p:=p||'  := nvl(v_cfgpop.INTERVALO_SLIDE,15000);'||unistr('\000a')||
'  ELSIF v_cfgpop.TIPO IN (''PAG'',''ENL'') THEN'||unistr('\000a')||
'    CASE v_opciones '||unistr('\000a')||
'         when 1 then BEGIN :P1_CFGPOP_SEC1_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC1_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 2 then BEGIN :P1_CFGPOP_SEC2_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC2_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 3 then BEGIN :P1_CFGPOP_SEC3_CODIGO := v_';

p:=p||'cfgpop.CODIGO; :P1_CFGPOP_SEC3_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 4 then BEGIN :P1_CFGPOP_SEC4_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC4_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 5 then BEGIN :P1_CFGPOP_SEC5_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC5_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 6 then BEGIN :P1_CFGPOP_SEC6_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC6_TITULO := v_';

p:=p||'cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 7 then BEGIN :P1_CFGPOP_SEC7_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC7_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 8 then BEGIN :P1_CFGPOP_SEC8_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC8_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 9 then BEGIN :P1_CFGPOP_SEC9_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC9_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 10 then ';

p:=p||'BEGIN :P1_CFGPOP_SEC10_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC10_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'    END CASE;'||unistr('\000a')||
'    v_opciones := v_opciones + 1;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
' END LOOP; '||unistr('\000a')||
''||unistr('\000a')||
' END IF;'||unistr('\000a')||
''||unistr('\000a')||
' --'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 365278128918936550 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 2,
  p_process_sequence=> 110,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Inicializar Portal Backup',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
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
 
---------------------------------------
-- ...updatable report columns for page 2
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
