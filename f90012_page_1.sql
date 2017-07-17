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
--   Date and Time:   14:37 Viernes Noviembre 25, 2016
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

PROMPT ...Remove page 1
 
begin
 
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>1);
 
end;
/

 
--application/pages/page_00001
prompt  ...PAGE 1: Portada
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 1
 ,p_user_interface_id => 44529930783841211 + wwv_flow_api.g_id_offset
 ,p_name => 'Portada'
 ,p_alias => 'PORTADA'
 ,p_step_title => '&P1_TITULO_PORTAL.'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Inicio'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_html_page_header => 
'<style>'||unistr('\000a')||
'#dialog-modal{display:none;}'||unistr('\000a')||
'ol#controls{margin:0px!important;}'||unistr('\000a')||
'</style>'
 ,p_javascript_code => 
'  function NewsTicker(pNewsjQueryObject, pNewsList, pSeconds, pFadeSpeed) {'||unistr('\000a')||
'  var lNextNewsEntry = null;'||unistr('\000a')||
'  function showNews() {'||unistr('\000a')||
'    pNewsjQueryObject'||unistr('\000a')||
'      .fadeOut(pFadeSpeed)'||unistr('\000a')||
'      .queue(function(){'||unistr('\000a')||
'               apex.jQuery(this).html(pNewsList[lNextNewsEntry]);'||unistr('\000a')||
'               apex.jQuery(this).dequeue();'||unistr('\000a')||
'             })'||unistr('\000a')||
'      .fadeIn(pFadeSpeed);'||unistr('\000a')||
'    // queue in the next news entry. Start f'||
'rom the beginning if the end is reached'||unistr('\000a')||
'    lNextNewsEntry++;'||unistr('\000a')||
'    if (lNextNewsEntry == pNewsList.length) { lNextNewsEntry=0 };'||unistr('\000a')||
'    setTimeout(showNews, pSeconds*1500);'||unistr('\000a')||
'  };'||unistr('\000a')||
'  // Show the first entry immediately. If there are more entries start the rotator'||unistr('\000a')||
'  if (pNewsList.length > 0) {'||unistr('\000a')||
'    pNewsjQueryObject.html(pNewsList[0]);'||unistr('\000a')||
'    if (pNewsList.length > 1) {'||unistr('\000a')||
'      lNextNewsEntry = 1;'||unistr('\000a')||
'      setTime'||
'out(showNews, pSeconds*1500);'||unistr('\000a')||
'    }'||unistr('\000a')||
'  }'||unistr('\000a')||
'};'||unistr('\000a')||
''||unistr('\000a')||
'/* -------------------- Noticias Todas -------------------- */'||unistr('\000a')||
'$(function() { '||unistr('\000a')||
' $( "#dialog" ).dialog( "destroy" ); '||unistr('\000a')||
'});'||unistr('\000a')||
''||unistr('\000a')||
'function abrir_news (){'||unistr('\000a')||
' $( "#dialog-modal" ).dialog({'||unistr('\000a')||
'   width:800,'||unistr('\000a')||
'   height: 500,'||unistr('\000a')||
'   modal: true'||unistr('\000a')||
' });'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'/* -------------------- Noticias Slide -------------------- */'||unistr('\000a')||
'var alto_slide;'||unistr('\000a')||
'var pos_inicial;'||unistr('\000a')||
'var interval_id;'||unistr('\000a')||
'var reset_sl'||
'ide;'||unistr('\000a')||
'var up = 10; //Mueve tantos pixeles'||unistr('\000a')||
''||unistr('\000a')||
'$(document).ready(function() {'||unistr('\000a')||
'  //Inicializo variables del slide'||unistr('\000a')||
'  pos_inicial = $(''.noticias'').offset();'||unistr('\000a')||
'  alto_slide = ($(".noticias").height()+30); //Sumo 30 del margin'||unistr('\000a')||
'  reset_slide = alto_slide;'||unistr('\000a')||
''||unistr('\000a')||
'  //Play Slide'||unistr('\000a')||
'  interval_id = setInterval("play_slide()",1000);'||unistr('\000a')||
''||unistr('\000a')||
'  //Control MouseOver'||unistr('\000a')||
'  $(".noticias").hover(function() {'||unistr('\000a')||
'    $(this).css({color: "#47587a'||
'"});'||unistr('\000a')||
'    clearInterval(interval_id);'||unistr('\000a')||
'  }, function() {'||unistr('\000a')||
'    $(this).css({color: "#000"});'||unistr('\000a')||
'    interval_id = setInterval("play_slide()",1000);'||unistr('\000a')||
'  });'||unistr('\000a')||
'});'||unistr('\000a')||
''||unistr('\000a')||
'//Animacion del slide'||unistr('\000a')||
'function play_slide(){'||unistr('\000a')||
'  $(".noticias").animate({"top": "-="+ up +""}, ''slow'', ''linear'', function() {'||unistr('\000a')||
'    reset_slide = reset_slide - up;'||unistr('\000a')||
'    if (reset_slide <= 0){'||unistr('\000a')||
'      reset_slide = alto_slide;	  '||unistr('\000a')||
'      var pos_actual = $('''||
'.noticias'').offset();'||unistr('\000a')||
'      pos_actual.top = pos_inicial.top;'||unistr('\000a')||
'      $(''.noticias'').offset(pos_actual);	  '||unistr('\000a')||
'    }    								'||unistr('\000a')||
'  }); 	  '||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'/* -------------------- Input Busqueda -------------------- */'||unistr('\000a')||
''||unistr('\000a')||
'function eliminar_link(elem){'||unistr('\000a')||
'    '||unistr('\000a')||
'    $(''<span ><input id="input-busqueda" type="text" />  </span>'').insertBefore($(".navIcon"));'||unistr('\000a')||
''||unistr('\000a')||
'	$(elem).remove();'||unistr('\000a')||
''||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
''
 ,p_javascript_code_onload => 
'/*$(''#input-busqueda'').on(''keyup'', function(e) {'||unistr('\000a')||
'    if (e.keyCode === 13) {'||unistr('\000a')||
'        $(''#input-busqueda'').change();'||unistr('\000a')||
'        var res =$(''#input-busqueda'').val();'||unistr('\000a')||
'        if ( res != ""){'||unistr('\000a')||
'        	window.location.href = ''f?p=90012:3:&APP_SESSION.:::3:P3_BUSCAR:''+res;'||unistr('\000a')||
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
'.scl-icons li.scl-google-plus a {background-position: -44px 0; }'||unistr('\000a')||
'.scl-icons li.scl-google-plus a:hover {background-position: -64px 0; }'||unistr('\000a')||
'.slc {border:0px solid #F33; float:right; width:39%; height:15px; text-align:right; color:#777;}'||unistr('\000a')||
'.slc ul{ display:inline-block; height:12px;}'||unistr('\000a')||
'.slc ul li { list-style:none !important; }'||unistr('\000a')||
'.tit {font-size:16px; font-weight:bold; margin-top:0px; border:0px sol'||
'id; float:left; width:60%;}'||unistr('\000a')||
'.nov {border-bottom: rgb(221, 221, 221) dotted 1px; padding: 10px 0px;}'||unistr('\000a')||
'.nov:last-child {border-bottom: none;}'||unistr('\000a')||
'.tags {font-size: 10px;color: rgb(83, 83, 83);}'||unistr('\000a')||
'.nov img{ margin:3px 10px 3px 0px;}'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'@media screen and (min-width : 0px) and (max-width : 768px) {'||unistr('\000a')||
' #slider_superior{display:none !important;}'||unistr('\000a')||
' #desktop{display:none !important;}'||unistr('\000a')||
'}'||unistr('\000a')||
'@media screen and (min-width :'||
' 769px) {'||unistr('\000a')||
' #smartphone{display:none !important;}'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'.bg-gris{'||unistr('\000a')||
'background: #fff;'||unistr('\000a')||
'background: -moz-linear-gradient(top,rgba(255,255,255,1) 72%,rgba(234,234,234,1) 100%);'||unistr('\000a')||
'background: -webkit-gradient(linear,left top,left bottom,color-stop(72%,rgba(255,255,255,1)),color-stop(100%,rgba(234,234,234,1)));'||unistr('\000a')||
'background: -webkit-linear-gradient(top,rgba(255,255,255,1) 72%,rgba(234,234,234,1) 100%);'||unistr('\000a')||
'backgroun'||
'd: -o-linear-gradient(top,rgba(255,255,255,1) 72%,rgba(234,234,234,1) 100%);'||unistr('\000a')||
'background: -ms-linear-gradient(top,rgba(255,255,255,1) 72%,rgba(234,234,234,1) 100%);'||unistr('\000a')||
'background: linear-gradient(top,rgba(255,255,255,1) 72%,rgba(234,234,234,1) 100%);}'
 ,p_step_template => 60024869689939025 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_page_comment => '$(function(){'||unistr('\000a')||
'    if(isAndroidDefault){'||unistr('\000a')||
'        alert("Disculpa, su navegador no soporta el reproductor de audio. Puede utilizar el reproductor de audio HTML5 estándar en lugar")'||unistr('\000a')||
'    }'||unistr('\000a')||
'    '||unistr('\000a')||
'    $(".audio").mb_miniPlayer({'||unistr('\000a')||
'        width:240,'||unistr('\000a')||
'	inLine:false'||unistr('\000a')||
'    });'||unistr('\000a')||
'});'||unistr('\000a')||
''||unistr('\000a')||
'<script type="text/javascript" src="http://webness.com.ar/player/jquery.jplayer.min.js"></script>'||unistr('\000a')||
'<script type="text/javascript" src="http://webness.com.ar/player/jquery.mb.miniPlayer.js"></script>'||unistr('\000a')||
'<link rel="stylesheet" type="text/css" href="http://webness.com.ar/player/miniplayer.css" title="style"  media="screen"/>'
 ,p_last_updated_by => 'CTISSERA'
 ,p_last_upd_yyyymmddhh24miss => '20161125143646'
  );
null;
 
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
'  select replace(replace(replace(replace(enlace,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')),''SEGUSU.ID'',v(''P1_SEGUSU_ID'')),''ENTEND.ID'',v(''P1_ENTEND_ID''))  enlace '||unistr('\000a')||
'       , atributos_enlace'||unistr('\000a')||
'       , consejo'||unistr('\000a')||
'       , replace(replace(etiqueta,''WKSP_IMG'',v(''WORKSPACE_IMAGES'')),''APP_IMG'',v(''APP_IMAGES'')) etiqueta'||unistr('\000a')||
'';

s:=s||'    from CFG_PORTAL_PAGENL_V'||unistr('\000a')||
'   where CFGPOP_ID =  :P1_CFGPOP_POR_ID'||unistr('\000a')||
'     and SITUACION = ''PUB'''||unistr('\000a')||
'     and interface in (''TODAS'',''DESKTOP'')'||unistr('\000a')||
'   and sysdate between nvl(PUBLICACION_DESDE,sysdate) and nvl (PUBLICACION_HASTA,sysdate)'||unistr('\000a')||
'     and CFG_BI_PKG.CFGPPE_SEGUSU_AUTHO(p_cfgppe_id => id, p_segusu_id => :P1_SEGUSU_ID, P_ENTEND_CODIGO => :P1_ENTEND_CODIGO) = ''SI'''||unistr('\000a')||
'   order by ORDEN;'||unistr('\000a')||
'  -- Para obtener l';

s:=s||'as configuración de noticias'||unistr('\000a')||
'  cursor cr_notcfg is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_configuraciones'||unistr('\000a')||
'  where segorg_id = :P1_SEGORG_ID;'||unistr('\000a')||
'  -- Para obtener las novedades a publicar'||unistr('\000a')||
'  cursor cr_notnov is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_novedades'||unistr('\000a')||
'  where segorg_id = :p1_segorg_id'||unistr('\000a')||
'    and sysdate between publicado_desde and nvl(publicado_hasta,sysdate)'||unistr('\000a')||
'    and situacion = ''VAL'''||unistr('\000a')||
'  order by id desc;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_enlaces VARCHAR(4';

s:=s||'000);  '||unistr('\000a')||
'  v_notcfg not_configuraciones%rowtype;'||unistr('\000a')||
'  i number:=0;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Si se muestran los mensajes de Cuerpo'||unistr('\000a')||
'  if :P1_CFGPOP_COL1 = ''CUERPO'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div class="tit">&P1_TITULO_PORTAL.</div><br><br>'');'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_2.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_3.'');'||unistr('\000a')||
'    htp.print(''&P1_C';

s:=s||'UERPO_MENSAJE_4.'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si Se muestran los TWITTER'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL1 = ''TWITTER'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    --htp.print(''<div class="tit"><a class="link-tweets" href="https://twitter.com/idesanluis" title="Twitter">Twitter</a></div><br><br>'');'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P1_TWITTER_CODIGO.'');    '||unistr('\000a')||
'    -- '||unistr('\000a')||
'  -- Si Se muestran los enlaces'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL1 = ''ENLACES'' th';

s:=s||'en'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div class="tit">Enlaces</div><br><br>'');'||unistr('\000a')||
'    -- Armar y Mostrar enlaces'||unistr('\000a')||
'    v_enlaces :=''<ul class="uVerticalSidebarList">'';        '||unistr('\000a')||
'    for v_pagenl in cr_pagenl loop'||unistr('\000a')||
'      v_enlaces := v_enlaces || ''<li><a href="''||v_pagenl.ENLACE||''" ''||v_pagenl.ATRIBUTOS_ENLACE||'' alt="''||v_pagenl.CONSEJO||''" title="''||v_pagenl.CONSEJO||''">''||v_pagenl.ETIQUETA||''</a></li>'';    ';

s:=s||'  '||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'    v_enlaces := v_enlaces || ''</ul>'';'||unistr('\000a')||
'    htp.print(v_enlaces); '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si se muestran las novedades de noticias'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL1 = ''NOTICIAS'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div><div class="tit">Noticias y Novedades</div>'');'||unistr('\000a')||
'    -- Obtener la configuración de noticias'||unistr('\000a')||
'    open cr_notcfg;'||unistr('\000a')||
'    fetch cr_notcfg into v_notcfg;'||unistr('\000a')||
'    close cr_notcfg;'||unistr('\000a')||
'    -- Si no esta con';

s:=s||'figurado, el servicio no esta habilitado'||unistr('\000a')||
'    if v_notcfg.ID is null then'||unistr('\000a')||
'      htp.print(''<br><br>El Servicio de Noticias y Novedades no se encuentra habilitado'');'||unistr('\000a')||
'    -- Si esta configurado el servicio de noticias'||unistr('\000a')||
'    else'||unistr('\000a')||
'      -- Si existen, Agregar enlaces a sitios Sociales'||unistr('\000a')||
'      if v_notcfg.blog_url is not null or'||unistr('\000a')||
'         v_notcfg.facebook_url is not null or'||unistr('\000a')||
'         v_notcfg.youtube_url is ';

s:=s||'not null or'||unistr('\000a')||
'         v_notcfg.twitter_url is not null then'||unistr('\000a')||
'        -- Título'||unistr('\000a')||
'        htp.print('' <div class="slc">Mantente conectado: <ul class="scl-icons">'');'||unistr('\000a')||
'        -- Enlace a blog'||unistr('\000a')||
'        if v_notcfg.blog_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-blogger"><a href="''||v_notcfg.blog_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Facebook'||unistr('\000a')||
'        if v_not';

s:=s||'cfg.facebook_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-facebook"><a href="''||v_notcfg.facebook_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Youtube'||unistr('\000a')||
'        if v_notcfg.youtube_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-youtube"><a href="''||v_notcfg.youtube_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Twitter'||unistr('\000a')||
'     ';

s:=s||'   if v_notcfg.twitter_url is not null then'||unistr('\000a')||
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
'        htp.print(''<di';

s:=s||'v class="nov">'');'||unistr('\000a')||
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
'          htp.prin';

s:=s||'t(''<br>''||v_notnov.resumen);'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Fecha Publicación'||unistr('\000a')||
'        htp.print(''<div class="tags">Publicado ''||to_char(v_notnov.publicado_desde,''dd/mm/yyyy''));'||unistr('\000a')||
'        -- Tags'||unistr('\000a')||
'        if v_notnov.tag1 is not null then'||unistr('\000a')||
'          htp.print('' // Tags: '');'||unistr('\000a')||
'          if v_notcfg.tag_url is not null then '||unistr('\000a')||
'            htp.print(''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag1)||''" tar';

s:=s||'get="_blank">''||lower(v_notnov.tag1)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag2)||''" target="_blank">''||lower(v_notnov.tag2)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag3)||''" target="_blank">''||lower(v_notnov.tag3)||''</a>'');'||unistr('\000a')||
'          else'||unistr('\000a')||
'            htp.print(lower(v_notnov.tag1)||'' - ''||lower(v_notnov.tag2)||'' - ''||lower(v_notnov.tag3));'||unistr('\000a')||
' ';

s:=s||'         end if;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
''||unistr('\000a')||
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
'        htp.print(''<br><br>No existen ';

s:=s||'Noticias y Novedades publicadas ... <br><br>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 45822521757848896 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
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
  p_plug_display_when_condition => ':P1_CFGPOP_COL1 IS NOT NULL AND :P1_CFGPOP_COL2 IS NULL AND :P1_CFGPOP_COL3 IS NULL',
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
'  select replace(replace(replace(replace(enlace,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')),''SEGUSU.ID'',v(''P1_SEGUSU_ID'')),''ENTEND.ID'',v(''P1_ENTEND_ID''))  enlace '||unistr('\000a')||
'       , atributos_enlace'||unistr('\000a')||
'       , consejo'||unistr('\000a')||
'       , replace(replace(etiqueta,''WKSP_IMG'',v(''WORKSPACE_IMAGES'')),''APP_IMG'',v(''APP_IMAGES'')) etiqueta'||unistr('\000a')||
'';

s:=s||'    from CFG_PORTAL_PAGENL_V'||unistr('\000a')||
'   where CFGPOP_ID =  :P1_CFGPOP_POR_ID'||unistr('\000a')||
'     and SITUACION = ''PUB'''||unistr('\000a')||
'     and interface in (''TODAS'',''DESKTOP'')'||unistr('\000a')||
'   and sysdate between nvl(PUBLICACION_DESDE,sysdate) and nvl (PUBLICACION_HASTA,sysdate)'||unistr('\000a')||
'     and CFG_BI_PKG.CFGPPE_SEGUSU_AUTHO(p_cfgppe_id => id, p_segusu_id => :P1_SEGUSU_ID, P_ENTEND_CODIGO => :P1_ENTEND_CODIGO) = ''SI'''||unistr('\000a')||
'   order by ORDEN;'||unistr('\000a')||
'  -- Para obtener l';

s:=s||'as configuración de noticias'||unistr('\000a')||
'  cursor cr_notcfg is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_configuraciones'||unistr('\000a')||
'  where segorg_id = :P1_SEGORG_ID;'||unistr('\000a')||
'  -- Para obtener las novedades a publicar'||unistr('\000a')||
'  cursor cr_notnov is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_novedades'||unistr('\000a')||
'  where segorg_id = :p1_segorg_id'||unistr('\000a')||
'    and sysdate between publicado_desde and nvl(publicado_hasta,sysdate)'||unistr('\000a')||
'    and situacion = ''VAL'''||unistr('\000a')||
'  order by id desc;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_enlaces VARCHAR(3';

s:=s||'2000);  '||unistr('\000a')||
'  v_notcfg not_configuraciones%rowtype;'||unistr('\000a')||
'  i number:=0;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Si se muestran los mensajes de Cuerpo'||unistr('\000a')||
'  if :P1_CFGPOP_COL1 = ''CUERPO'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div class="tit">&P1_TITULO_PORTAL.</div><br><br>'');'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_2.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_3.'');'||unistr('\000a')||
'    htp.print(''&P1_';

s:=s||'CUERPO_MENSAJE_4.'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si Se muestran los TWITTER'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL1 = ''TWITTER'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P1_TWITTER_CODIGO.'');    '||unistr('\000a')||
'    --  '||unistr('\000a')||
'  -- Si Se muestran los enlaces'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL1 = ''ENLACES'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div class="tit">Enlaces</div><br><br>'');'||unistr('\000a')||
'    -- Armar y Mostrar enlaces'||unistr('\000a')||
'    v_enlaces :=''<ul class="uVert';

s:=s||'icalSidebarList">'';        '||unistr('\000a')||
'    for v_pagenl in cr_pagenl loop'||unistr('\000a')||
'      v_enlaces := v_enlaces || ''<li><a href="''||v_pagenl.ENLACE||''" ''||v_pagenl.ATRIBUTOS_ENLACE||'' alt="''||v_pagenl.CONSEJO||''" title="''||v_pagenl.CONSEJO||''">''||v_pagenl.ETIQUETA||''</a></li>'';      '||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'    v_enlaces := v_enlaces || ''</ul>'';'||unistr('\000a')||
'    htp.print(v_enlaces); '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si se muestran las novedades de noticias'||unistr('\000a')||
'  ';

s:=s||'elsif :P1_CFGPOP_COL1 = ''NOTICIAS'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div><div class="tit">Noticias y Novedades</div>'');'||unistr('\000a')||
'    -- Obtener la configuración de noticias'||unistr('\000a')||
'    open cr_notcfg;'||unistr('\000a')||
'    fetch cr_notcfg into v_notcfg;'||unistr('\000a')||
'    close cr_notcfg;'||unistr('\000a')||
'    -- Si no esta configurado, el servicio no esta habilitado'||unistr('\000a')||
'    if v_notcfg.ID is null then'||unistr('\000a')||
'      htp.print(''<br><br>El Servicio de Noticias y Novedades no s';

s:=s||'e encuentra habilitado'');'||unistr('\000a')||
'    -- Si esta configurado el servicio de noticias'||unistr('\000a')||
'    else'||unistr('\000a')||
'      -- Si existen, Agregar enlaces a sitios Sociales'||unistr('\000a')||
'      if v_notcfg.blog_url is not null or'||unistr('\000a')||
'         v_notcfg.facebook_url is not null or'||unistr('\000a')||
'         v_notcfg.youtube_url is not null or'||unistr('\000a')||
'         v_notcfg.twitter_url is not null then'||unistr('\000a')||
'        -- Título'||unistr('\000a')||
'        htp.print('' <div class="slc">Mantente conectado: <ul ';

s:=s||'class="scl-icons">'');'||unistr('\000a')||
'        -- Enlace a blog'||unistr('\000a')||
'        if v_notcfg.blog_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-blogger"><a href="''||v_notcfg.blog_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Facebook'||unistr('\000a')||
'        if v_notcfg.facebook_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-facebook"><a href="''||v_notcfg.facebook_url||''" target="_blank"></a>';

s:=s||'</li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Youtube'||unistr('\000a')||
'        if v_notcfg.youtube_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-youtube"><a href="''||v_notcfg.youtube_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Twitter'||unistr('\000a')||
'        if v_notcfg.twitter_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-twitter"><a href="''||v_notcfg.twitter_url||''" target="_bla';

s:=s||'nk"></a></li>'');'||unistr('\000a')||
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
'        htp.print(''<div class="nov">'');'||unistr('\000a')||
'        -- Enlace'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''<a href="''||v_notnov.url||''" target="_bl';

s:=s||'ank">'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Titulo'||unistr('\000a')||
'        htp.print(''<b>''||v_notnov.titulo||''</b>'');'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''</a>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Resumen'||unistr('\000a')||
'        if v_notnov.resumen is not null then'||unistr('\000a')||
'          htp.print(''<br>''||v_notnov.resumen);'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Fecha Publicación'||unistr('\000a')||
'        htp.print(''<div class="tags">Publicado ''||to_char(v_notn';

s:=s||'ov.publicado_desde,''dd/mm/yyyy''));'||unistr('\000a')||
'        -- Tags'||unistr('\000a')||
'        if v_notnov.tag1 is not null then'||unistr('\000a')||
'          htp.print('' // Tags: '');'||unistr('\000a')||
'          if v_notcfg.tag_url is not null then '||unistr('\000a')||
'            htp.print(''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag1)||''" target="_blank">''||lower(v_notnov.tag1)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag2)||''" target="_blank">''||lower';

s:=s||'(v_notnov.tag2)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag3)||''" target="_blank">''||lower(v_notnov.tag3)||''</a>'');'||unistr('\000a')||
'          else'||unistr('\000a')||
'            htp.print(lower(v_notnov.tag1)||'' - ''||lower(v_notnov.tag2)||'' - ''||lower(v_notnov.tag3));'||unistr('\000a')||
'          end if;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        -- Solo mostrar la cantidad maxima indi';

s:=s||'cada el la configuración del servicio de noticias'||unistr('\000a')||
'        if i >= v_notcfg.NOTNOV_MAXCNT then'||unistr('\000a')||
'          exit;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --   '||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      -- Si no existen novedades para publicar'||unistr('\000a')||
'      if i = 0 then'||unistr('\000a')||
'        htp.print(''<br><br>No existen Noticias y Novedades publicadas ... <br><br>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 45843024817445936 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Columna Triple (1)',
  p_region_name=>'desktop',
  p_region_css_classes=>'fondo-gris',
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
  p_plug_display_when_condition => ':P1_CFGPOP_COL1 IS NOT NULL AND :P1_CFGPOP_COL2 IS NOT NULL AND :P1_CFGPOP_COL3 IS NOT NULL',
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
'  select replace(replace(replace(replace(enlace,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')),''SEGUSU.ID'',v(''P1_SEGUSU_ID'')),''ENTEND.ID'',v(''P1_ENTEND_ID''))  enlace '||unistr('\000a')||
'       , atributos_enlace'||unistr('\000a')||
'       , consejo'||unistr('\000a')||
'       , replace(replace(etiqueta,''WKSP_IMG'',v(''WORKSPACE_IMAGES'')),''APP_IMG'',v(''APP_IMAGES'')) etiqueta'||unistr('\000a')||
'';

s:=s||'    from CFG_PORTAL_PAGENL_V'||unistr('\000a')||
'   where CFGPOP_ID =  :P1_CFGPOP_POR_ID'||unistr('\000a')||
'     and SITUACION = ''PUB'''||unistr('\000a')||
'     and interface in (''TODAS'',''DESKTOP'')'||unistr('\000a')||
'   and sysdate between nvl(PUBLICACION_DESDE,sysdate) and nvl (PUBLICACION_HASTA,sysdate)'||unistr('\000a')||
'     and CFG_BI_PKG.CFGPPE_SEGUSU_AUTHO(p_cfgppe_id => id, p_segusu_id => :P1_SEGUSU_ID) = ''SI'''||unistr('\000a')||
'   order by ORDEN;'||unistr('\000a')||
'  -- Para obtener las configuración de noticias'||unistr('\000a')||
'  cursor ';

s:=s||'cr_notcfg is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_configuraciones'||unistr('\000a')||
'  where segorg_id = :P1_SEGORG_ID;'||unistr('\000a')||
'  -- Para obtener las novedades a publicar'||unistr('\000a')||
'  cursor cr_notnov is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_novedades'||unistr('\000a')||
'  where segorg_id = :p1_segorg_id'||unistr('\000a')||
'    and sysdate between publicado_desde and nvl(publicado_hasta,sysdate)'||unistr('\000a')||
'    and situacion = ''VAL'''||unistr('\000a')||
'  order by id desc;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_enlaces VARCHAR(32000);  '||unistr('\000a')||
'  v_notcfg not_configuracione';

s:=s||'s%rowtype;'||unistr('\000a')||
'  i number:=0;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Si se muestran los mensajes de Cuerpo'||unistr('\000a')||
'  if :P1_CFGPOP_COL2 = ''CUERPO'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div class="tit">&P1_TITULO_PORTAL.</div><br><br>'');'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_2.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_3.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_4.'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si Se';

s:=s||' muestran los TWITTER'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL2 = ''TWITTER'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P1_TWITTER_CODIGO.'');    '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si Se muestran los enlaces'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL2 = ''ENLACES'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div class="tit">Enlaces</div><br><br>'');'||unistr('\000a')||
'    -- Armar y Mostrar enlaces'||unistr('\000a')||
'    v_enlaces :=''<ul class="uVerticalSidebarList">'';        '||unistr('\000a')||
'    for v_pa';

s:=s||'genl in cr_pagenl loop'||unistr('\000a')||
'      v_enlaces := v_enlaces || ''<li><a href="''||v_pagenl.ENLACE||''" ''||v_pagenl.ATRIBUTOS_ENLACE||'' alt="''||v_pagenl.CONSEJO||''" title="''||v_pagenl.CONSEJO||''">''||v_pagenl.ETIQUETA||''</a></li>'';      '||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'    v_enlaces := v_enlaces || ''</ul>'';'||unistr('\000a')||
'    htp.print(v_enlaces); '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si se muestran las novedades de noticias'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL2 = ''NOTICIAS'' then'||unistr('\000a')||
'';

s:=s||'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div><div class="tit">Noticias y Novedades</div>'');'||unistr('\000a')||
'    -- Obtener la configuración de noticias'||unistr('\000a')||
'    open cr_notcfg;'||unistr('\000a')||
'    fetch cr_notcfg into v_notcfg;'||unistr('\000a')||
'    close cr_notcfg;'||unistr('\000a')||
'    -- Si no esta configurado, el servicio no esta habilitado'||unistr('\000a')||
'    if v_notcfg.ID is null then'||unistr('\000a')||
'      htp.print(''<br><br>El Servicio de Noticias y Novedades no se encuentra habilitado'');'||unistr('\000a')||
'    -- Si esta';

s:=s||' configurado el servicio de noticias'||unistr('\000a')||
'    else'||unistr('\000a')||
'      -- Si existen, Agregar enlaces a sitios Sociales'||unistr('\000a')||
'      if v_notcfg.blog_url is not null or'||unistr('\000a')||
'         v_notcfg.facebook_url is not null or'||unistr('\000a')||
'         v_notcfg.youtube_url is not null or'||unistr('\000a')||
'         v_notcfg.twitter_url is not null then'||unistr('\000a')||
'        -- Título'||unistr('\000a')||
'        htp.print('' <div class="slc">Mantente conectado: <ul class="scl-icons">'');'||unistr('\000a')||
'        -- Enlace ';

s:=s||'a blog'||unistr('\000a')||
'        if v_notcfg.blog_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-blogger"><a href="''||v_notcfg.blog_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Facebook'||unistr('\000a')||
'        if v_notcfg.facebook_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-facebook"><a href="''||v_notcfg.facebook_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enla';

s:=s||'ce a Google +'||unistr('\000a')||
'        if v_notcfg.google_plus_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-google-plus"><a href="''||v_notcfg.google_plus_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Youtube'||unistr('\000a')||
'        if v_notcfg.youtube_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-youtube"><a href="''||v_notcfg.youtube_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        en';

s:=s||'d if;'||unistr('\000a')||
'        -- Enlace a Twitter'||unistr('\000a')||
'        if v_notcfg.twitter_url is not null then'||unistr('\000a')||
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
'        -- ';

s:=s||'Publicar novedad'||unistr('\000a')||
'        htp.print(''<div class="nov">'');'||unistr('\000a')||
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
'        if v_notnov.resu';

s:=s||'men is not null then'||unistr('\000a')||
'          htp.print(''<br>''||v_notnov.resumen);'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Fecha Publicación'||unistr('\000a')||
'        htp.print(''<div class="tags">Publicado ''||to_char(v_notnov.publicado_desde,''dd/mm/yyyy''));'||unistr('\000a')||
'        -- Tags'||unistr('\000a')||
'        if v_notnov.tag1 is not null then'||unistr('\000a')||
'          htp.print('' // Tags: '');'||unistr('\000a')||
'          if v_notcfg.tag_url is not null then '||unistr('\000a')||
'            htp.print(''<a href="''||v_notcfg.tag';

s:=s||'_url||''/''||lower(v_notnov.tag1)||''" target="_blank">''||lower(v_notnov.tag1)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag2)||''" target="_blank">''||lower(v_notnov.tag2)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag3)||''" target="_blank">''||lower(v_notnov.tag3)||''</a>'');'||unistr('\000a')||
'          else'||unistr('\000a')||
'            htp.print(lower(v_notnov.tag1)||'' - ''||lower(v_notnov';

s:=s||'.tag2)||'' - ''||lower(v_notnov.tag3));'||unistr('\000a')||
'          end if;'||unistr('\000a')||
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
'';

s:=s||'        htp.print(''<br><br>No existen Noticias o Novedades publicadas ... <br><br>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 45843222870454854 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Columna Triple (2)',
  p_region_name=>'desktop',
  p_region_css_classes=>'fondo-gris',
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
  p_plug_display_when_condition => ':P1_CFGPOP_COL1 IS NOT NULL AND :P1_CFGPOP_COL2 IS NOT NULL AND :P1_CFGPOP_COL3 IS NOT NULL',
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
'  select replace(replace(replace(replace(enlace,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')),''SEGUSU.ID'',v(''P1_SEGUSU_ID'')),''ENTEND.ID'',v(''P1_ENTEND_ID''))  enlace '||unistr('\000a')||
'       , atributos_enlace'||unistr('\000a')||
'       , consejo'||unistr('\000a')||
'       , replace(replace(etiqueta,''WKSP_IMG'',v(''WORKSPACE_IMAGES'')),''APP_IMG'',v(''APP_IMAGES'')) etiqueta'||unistr('\000a')||
'';

s:=s||'    from CFG_PORTAL_PAGENL_V'||unistr('\000a')||
'   where CFGPOP_ID =  :P1_CFGPOP_POR_ID'||unistr('\000a')||
'     and SITUACION = ''PUB'''||unistr('\000a')||
'     and interface in (''TODAS'',''DESKTOP'')'||unistr('\000a')||
'   and sysdate between nvl(PUBLICACION_DESDE,sysdate) and nvl (PUBLICACION_HASTA,sysdate)'||unistr('\000a')||
'     and CFG_BI_PKG.CFGPPE_SEGUSU_AUTHO(p_cfgppe_id => id, p_segusu_id => :P1_SEGUSU_ID) = ''SI'''||unistr('\000a')||
'   order by ORDEN;'||unistr('\000a')||
'  -- Para obtener las configuración de noticias'||unistr('\000a')||
'  cursor ';

s:=s||'cr_notcfg is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_configuraciones'||unistr('\000a')||
'  where segorg_id = :P1_SEGORG_ID;'||unistr('\000a')||
'  -- Para obtener las novedades a publicar'||unistr('\000a')||
'  cursor cr_notnov is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_novedades'||unistr('\000a')||
'  where segorg_id = :p1_segorg_id'||unistr('\000a')||
'    and sysdate between publicado_desde and nvl(publicado_hasta,sysdate)'||unistr('\000a')||
'    and situacion = ''VAL'''||unistr('\000a')||
'  order by id desc;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_enlaces varchar2(32000);  '||unistr('\000a')||
'  v_notcfg not_configuracion';

s:=s||'es%rowtype;'||unistr('\000a')||
'  i number:=0;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Si se muestran los mensajes de Cuerpo'||unistr('\000a')||
'  if :P1_CFGPOP_COL3 = ''CUERPO'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div class="tit">&P1_TITULO_PORTAL.</div><br><br>'');'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_2.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_3.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_4.'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si S';

s:=s||'e muestran los TWITTER'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL3 = ''TWITTER'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P1_TWITTER_CODIGO.'');    '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si Se muestran los TWITTER'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL1 = ''TWITTER'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P1_TWITTER_CODIGO.'');    '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si Se muestran los enlaces'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL3 = ''ENLACES'' then'||unistr('\000a')||
'    -- Titul';

s:=s||'o'||unistr('\000a')||
'    htp.print(''<div class="tit">Enlaces</div><br><br>'');'||unistr('\000a')||
'    -- Armar y Mostrar enlaces'||unistr('\000a')||
'    v_enlaces :=''<ul class="uVerticalSidebarList">'';        '||unistr('\000a')||
'    for v_pagenl in cr_pagenl loop'||unistr('\000a')||
'      v_enlaces := v_enlaces || ''<li><a href="''||v_pagenl.ENLACE||''" alt="''||v_pagenl.CONSEJO||''" title="''||v_pagenl.CONSEJO||''" ''||v_pagenl.ATRIBUTOS_ENLACE||''>''||v_pagenl.ETIQUETA||''</a></li>'';      '||unistr('\000a')||
'    end loop';

s:=s||';'||unistr('\000a')||
'    v_enlaces := v_enlaces || ''</ul>'';'||unistr('\000a')||
'    htp.print(v_enlaces); '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si se muestran las novedades de noticias'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL3 = ''NOTICIAS'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div><div class="tit">Noticias y Novedades</div>'');'||unistr('\000a')||
'    -- Obtener la configuración de noticias'||unistr('\000a')||
'    open cr_notcfg;'||unistr('\000a')||
'    fetch cr_notcfg into v_notcfg;'||unistr('\000a')||
'    close cr_notcfg;'||unistr('\000a')||
'    -- Si no esta configurado, el se';

s:=s||'rvicio no esta habilitado'||unistr('\000a')||
'    if v_notcfg.ID is null then'||unistr('\000a')||
'      htp.print(''<br><br>El Servicio de Noticias y Novedades no se encuentra habilitado'');'||unistr('\000a')||
'    -- Si esta configurado el servicio de noticias'||unistr('\000a')||
'    else'||unistr('\000a')||
'      -- Si existen, Agregar enlaces a sitios Sociales'||unistr('\000a')||
'      if v_notcfg.blog_url is not null or'||unistr('\000a')||
'         v_notcfg.facebook_url is not null or'||unistr('\000a')||
'         v_notcfg.youtube_url is not null or'||unistr('\000a')||
'   ';

s:=s||'      v_notcfg.twitter_url is not null then'||unistr('\000a')||
'        -- Título'||unistr('\000a')||
'        htp.print('' <div class="slc">Mantente conectado: <ul class="scl-icons">'');'||unistr('\000a')||
'        -- Enlace a blog'||unistr('\000a')||
'        if v_notcfg.blog_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-blogger"><a href="''||v_notcfg.blog_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Facebook'||unistr('\000a')||
'        if v_notcfg.facebook_ur';

s:=s||'l is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-facebook"><a href="''||v_notcfg.facebook_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Youtube'||unistr('\000a')||
'        if v_notcfg.youtube_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-youtube"><a href="''||v_notcfg.youtube_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Twitter'||unistr('\000a')||
'        if v_notcfg.';

s:=s||'twitter_url is not null then'||unistr('\000a')||
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
'        htp.print(''<div class="nov">''';

s:=s||');'||unistr('\000a')||
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
'          htp.print(''<br>''||v_not';

s:=s||'nov.resumen);'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Fecha Publicación'||unistr('\000a')||
'        htp.print(''<div class="tags">Publicado ''||to_char(v_notnov.publicado_desde,''dd/mm/yyyy''));'||unistr('\000a')||
'        -- Tags'||unistr('\000a')||
'        if v_notnov.tag1 is not null then'||unistr('\000a')||
'          htp.print('' // Tags: '');'||unistr('\000a')||
'          if v_notcfg.tag_url is not null then '||unistr('\000a')||
'            htp.print(''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag1)||''" target="_blank">''|';

s:=s||'|lower(v_notnov.tag1)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag2)||''" target="_blank">''||lower(v_notnov.tag2)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag3)||''" target="_blank">''||lower(v_notnov.tag3)||''</a>'');'||unistr('\000a')||
'          else'||unistr('\000a')||
'            htp.print(lower(v_notnov.tag1)||'' - ''||lower(v_notnov.tag2)||'' - ''||lower(v_notnov.tag3));'||unistr('\000a')||
'          end if';

s:=s||';'||unistr('\000a')||
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
'        htp.print(''<br><br>No existen NNoticias o Nove';

s:=s||'dades publicadas ... <br><br>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 45843400838457890 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Columna Triple (3)',
  p_region_name=>'desktop',
  p_region_css_classes=>'fondo-gris',
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
  p_plug_display_when_condition => ':P1_CFGPOP_COL1 IS NOT NULL AND :P1_CFGPOP_COL2 IS NOT NULL AND :P1_CFGPOP_COL3 IS NOT NULL',
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
'  select replace(replace(replace(replace(enlace,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')),''SEGUSU.ID'',v(''P1_SEGUSU_ID'')),''ENTEND.ID'',v(''P1_ENTEND_ID''))  enlace '||unistr('\000a')||
'       , atributos_enlace'||unistr('\000a')||
'       , consejo'||unistr('\000a')||
'       , replace(replace(etiqueta,''WKSP_IMG'',v(''WORKSPACE_IMAGES'')),''APP_IMG'',v(''APP_IMAGES'')) etiqueta'||unistr('\000a')||
'';

s:=s||'    from CFG_PORTAL_PAGENL_V'||unistr('\000a')||
'   where CFGPOP_ID =  :P1_CFGPOP_POR_ID'||unistr('\000a')||
'     and SITUACION = ''PUB'''||unistr('\000a')||
'     and interface in (''TODAS'',''SMARTPHONE'')'||unistr('\000a')||
'   and sysdate between nvl(PUBLICACION_DESDE,sysdate) and nvl (PUBLICACION_HASTA,sysdate)'||unistr('\000a')||
'     and CFG_BI_PKG.CFGPPE_SEGUSU_AUTHO(p_cfgppe_id => id, p_segusu_id => :P1_SEGUSU_ID) = ''SI'''||unistr('\000a')||
'   order by ORDEN;'||unistr('\000a')||
'  -- Para obtener las configuración de noticias'||unistr('\000a')||
'  curs';

s:=s||'or cr_notcfg is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_configuraciones'||unistr('\000a')||
'  where segorg_id = :P1_SEGORG_ID;'||unistr('\000a')||
'  -- Para obtener las novedades a publicar'||unistr('\000a')||
'  cursor cr_notnov is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_novedades'||unistr('\000a')||
'  where segorg_id = :p1_segorg_id'||unistr('\000a')||
'    and sysdate between publicado_desde and nvl(publicado_hasta,sysdate)'||unistr('\000a')||
'    and situacion = ''VAL'''||unistr('\000a')||
'  order by id desc;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_enlaces VARCHAR(32000);  '||unistr('\000a')||
'  v_notcfg not_configuraci';

s:=s||'ones%rowtype;'||unistr('\000a')||
'  i number:=0;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Si se muestran los mensajes de Cuerpo'||unistr('\000a')||
'  if :P1_CFGPOP_COL2 = ''CUERPO'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div class="tit">&P1_TITULO_PORTAL.</div><br><br>'');'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_2.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_3.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_4.'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si';

s:=s||' Se muestran los TWITTER'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL2 = ''TWITTER'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P1_TWITTER_CODIGO.'');    '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si Se muestran los enlaces'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL2 = ''ENLACES'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div class="tit">Enlaces</div><br><br>'');'||unistr('\000a')||
'    -- Armar y Mostrar enlaces'||unistr('\000a')||
'    v_enlaces :=''<ul class="uVerticalSidebarList">'';        '||unistr('\000a')||
'    for v';

s:=s||'_pagenl in cr_pagenl loop'||unistr('\000a')||
'      v_enlaces := v_enlaces || ''<li><a href="''||v_pagenl.ENLACE||''" ''||v_pagenl.ATRIBUTOS_ENLACE||'' alt="''||v_pagenl.CONSEJO||''" title="''||v_pagenl.CONSEJO||''">''||v_pagenl.ETIQUETA||''</a></li>'';      '||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'    v_enlaces := v_enlaces || ''</ul>'';'||unistr('\000a')||
'    htp.print(v_enlaces); '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si se muestran las novedades de noticias'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL2 = ''NOTICIAS'' th';

s:=s||'en'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div><div class="tit">Noticias y Novedades</div>'');'||unistr('\000a')||
'    -- Obtener la configuración de noticias'||unistr('\000a')||
'    open cr_notcfg;'||unistr('\000a')||
'    fetch cr_notcfg into v_notcfg;'||unistr('\000a')||
'    close cr_notcfg;'||unistr('\000a')||
'    -- Si no esta configurado, el servicio no esta habilitado'||unistr('\000a')||
'    if v_notcfg.ID is null then'||unistr('\000a')||
'      htp.print(''<br><br>El Servicio de Noticias y Novedades no se encuentra habilitado'');'||unistr('\000a')||
'    -- Si e';

s:=s||'sta configurado el servicio de noticias'||unistr('\000a')||
'    else'||unistr('\000a')||
'      -- Si existen, Agregar enlaces a sitios Sociales'||unistr('\000a')||
'      if v_notcfg.blog_url is not null or'||unistr('\000a')||
'         v_notcfg.facebook_url is not null or'||unistr('\000a')||
'         v_notcfg.youtube_url is not null or'||unistr('\000a')||
'         v_notcfg.twitter_url is not null then'||unistr('\000a')||
'        -- Título'||unistr('\000a')||
'        htp.print('' <div class="slc">Mantente conectado: <ul class="scl-icons">'');'||unistr('\000a')||
'        -- Enla';

s:=s||'ce a blog'||unistr('\000a')||
'        if v_notcfg.blog_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-blogger"><a href="''||v_notcfg.blog_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Facebook'||unistr('\000a')||
'        if v_notcfg.facebook_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-facebook"><a href="''||v_notcfg.facebook_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- E';

s:=s||'nlace a Youtube'||unistr('\000a')||
'        if v_notcfg.youtube_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-youtube"><a href="''||v_notcfg.youtube_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Twitter'||unistr('\000a')||
'        if v_notcfg.twitter_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-twitter"><a href="''||v_notcfg.twitter_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'    ';

s:=s||'    --'||unistr('\000a')||
'        htp.print(''</ul></div></div>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      --  '||unistr('\000a')||
'      htp.print(''<br><br>'');'||unistr('\000a')||
'      -- Novedades'||unistr('\000a')||
'      for v_notnov in cr_notnov loop'||unistr('\000a')||
'        i := i+1;'||unistr('\000a')||
'        -- Publicar novedad'||unistr('\000a')||
'        htp.print(''<div class="nov">'');'||unistr('\000a')||
'        -- Enlace'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''<a href="''||v_notnov.url||''" target="_blank">'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- T';

s:=s||'itulo'||unistr('\000a')||
'        htp.print(''<b>''||v_notnov.titulo||''</b>'');'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''</a>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Resumen'||unistr('\000a')||
'        if v_notnov.resumen is not null then'||unistr('\000a')||
'          htp.print(''<br>''||v_notnov.resumen);'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Fecha Publicación'||unistr('\000a')||
'        htp.print(''<div class="tags">Publicado ''||to_char(v_notnov.publicado_desde,''dd/mm/yyyy''));'||unistr('\000a')||
'  ';

s:=s||'      -- Tags'||unistr('\000a')||
'        if v_notnov.tag1 is not null then'||unistr('\000a')||
'          htp.print('' // Tags: '');'||unistr('\000a')||
'          if v_notcfg.tag_url is not null then '||unistr('\000a')||
'            htp.print(''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag1)||''" target="_blank">''||lower(v_notnov.tag1)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag2)||''" target="_blank">''||lower(v_notnov.tag2)||''</a>''||'' - ''||''<a h';

s:=s||'ref="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag3)||''" target="_blank">''||lower(v_notnov.tag3)||''</a>'');'||unistr('\000a')||
'          else'||unistr('\000a')||
'            htp.print(lower(v_notnov.tag1)||'' - ''||lower(v_notnov.tag2)||'' - ''||lower(v_notnov.tag3));'||unistr('\000a')||
'          end if;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        -- Solo mostrar la cantidad maxima indicada el la configuración del servicio';

s:=s||' de noticias'||unistr('\000a')||
'        if i >= v_notcfg.NOTNOV_MAXCNT then'||unistr('\000a')||
'          exit;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --   '||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      -- Si no existen novedades para publicar'||unistr('\000a')||
'      if i = 0 then'||unistr('\000a')||
'        htp.print(''<br><br>No existen Noticias o Novedades publicadas ... <br><br>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 45844516337481284 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Columna Triple (2) Smartphone',
  p_region_name=>'smartphone',
  p_region_css_classes=>'fondo-gris',
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
  p_plug_display_when_condition => ':P1_CFGPOP_COL1 IS NOT NULL AND :P1_CFGPOP_COL2 IS NOT NULL AND :P1_CFGPOP_COL3 IS NOT NULL',
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
'  select replace(replace(replace(replace(enlace,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')),''SEGUSU.ID'',v(''P1_SEGUSU_ID'')),''ENTEND.ID'',v(''P1_ENTEND_ID''))  enlace '||unistr('\000a')||
'       , atributos_enlace'||unistr('\000a')||
'       , consejo'||unistr('\000a')||
'       , replace(replace(etiqueta,''WKSP_IMG'',v(''WORKSPACE_IMAGES'')),''APP_IMG'',v(''APP_IMAGES'')) etiqueta'||unistr('\000a')||
'';

s:=s||'    from CFG_PORTAL_PAGENL_V'||unistr('\000a')||
'   where CFGPOP_ID =  :P1_CFGPOP_POR_ID'||unistr('\000a')||
'     and SITUACION = ''PUB'''||unistr('\000a')||
'     and interface in (''TODAS'',''SMARTPHONE'')'||unistr('\000a')||
'   and sysdate between nvl(PUBLICACION_DESDE,sysdate) and nvl (PUBLICACION_HASTA,sysdate)'||unistr('\000a')||
'     and CFG_BI_PKG.CFGPPE_SEGUSU_AUTHO(p_cfgppe_id => id, p_segusu_id => :P1_SEGUSU_ID) = ''SI'''||unistr('\000a')||
'   order by ORDEN;'||unistr('\000a')||
'  -- Para obtener las configuración de noticias'||unistr('\000a')||
'  curs';

s:=s||'or cr_notcfg is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_configuraciones'||unistr('\000a')||
'  where segorg_id = :P1_SEGORG_ID;'||unistr('\000a')||
'  -- Para obtener las novedades a publicar'||unistr('\000a')||
'  cursor cr_notnov is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_novedades'||unistr('\000a')||
'  where segorg_id = :p1_segorg_id'||unistr('\000a')||
'    and sysdate between publicado_desde and nvl(publicado_hasta,sysdate)'||unistr('\000a')||
'    and situacion = ''VAL'''||unistr('\000a')||
'  order by id desc;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_enlaces VARCHAR(32000);  '||unistr('\000a')||
'  v_notcfg not_configuraci';

s:=s||'ones%rowtype;'||unistr('\000a')||
'  i number:=0;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Si se muestran los mensajes de Cuerpo'||unistr('\000a')||
'  if :P1_CFGPOP_COL3 = ''CUERPO'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div class="tit">&P1_TITULO_PORTAL.</div><br><br>'');'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_2.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_3.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_4.'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si';

s:=s||' Se muestran los TWITTER'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL3 = ''TWITTER'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P1_TWITTER_CODIGO.'');    '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si Se muestran los enlaces'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL3 = ''ENLACES'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div class="tit">Enlaces</div><br><br>'');'||unistr('\000a')||
'    -- Armar y Mostrar enlaces'||unistr('\000a')||
'    v_enlaces :=''<ul class="uVerticalSidebarList">'';        '||unistr('\000a')||
'    for v';

s:=s||'_pagenl in cr_pagenl loop'||unistr('\000a')||
'      v_enlaces := v_enlaces || ''<li><a href="''||v_pagenl.ENLACE||''" ''||v_pagenl.ATRIBUTOS_ENLACE||'' alt="''||v_pagenl.CONSEJO||''" title="''||v_pagenl.CONSEJO||''">''||v_pagenl.ETIQUETA||''</a></li>'';      '||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'    v_enlaces := v_enlaces || ''</ul>'';'||unistr('\000a')||
'    htp.print(v_enlaces); '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si se muestran las novedades de noticias'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL3 = ''NOTICIAS'' th';

s:=s||'en'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div><div class="tit">Noticias y Novedades</div>'');'||unistr('\000a')||
'    -- Obtener la configuración de noticias'||unistr('\000a')||
'    open cr_notcfg;'||unistr('\000a')||
'    fetch cr_notcfg into v_notcfg;'||unistr('\000a')||
'    close cr_notcfg;'||unistr('\000a')||
'    -- Si no esta configurado, el servicio no esta habilitado'||unistr('\000a')||
'    if v_notcfg.ID is null then'||unistr('\000a')||
'      htp.print(''<br><br>El Servicio de Noticias y Novedades no se encuentra habilitado'');'||unistr('\000a')||
'    -- Si e';

s:=s||'sta configurado el servicio de noticias'||unistr('\000a')||
'    else'||unistr('\000a')||
'      -- Si existen, Agregar enlaces a sitios Sociales'||unistr('\000a')||
'      if v_notcfg.blog_url is not null or'||unistr('\000a')||
'         v_notcfg.facebook_url is not null or'||unistr('\000a')||
'         v_notcfg.youtube_url is not null or'||unistr('\000a')||
'         v_notcfg.twitter_url is not null then'||unistr('\000a')||
'        -- Título'||unistr('\000a')||
'        htp.print('' <div class="slc">Mantente conectado: <ul class="scl-icons">'');'||unistr('\000a')||
'        -- Enla';

s:=s||'ce a blog'||unistr('\000a')||
'        if v_notcfg.blog_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-blogger"><a href="''||v_notcfg.blog_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Facebook'||unistr('\000a')||
'        if v_notcfg.facebook_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-facebook"><a href="''||v_notcfg.facebook_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- E';

s:=s||'nlace a Youtube'||unistr('\000a')||
'        if v_notcfg.youtube_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-youtube"><a href="''||v_notcfg.youtube_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Twitter'||unistr('\000a')||
'        if v_notcfg.twitter_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-twitter"><a href="''||v_notcfg.twitter_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'    ';

s:=s||'    --'||unistr('\000a')||
'        htp.print(''</ul></div></div>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      --  '||unistr('\000a')||
'      htp.print(''<br><br>'');'||unistr('\000a')||
'      -- Novedades'||unistr('\000a')||
'      for v_notnov in cr_notnov loop'||unistr('\000a')||
'        i := i+1;'||unistr('\000a')||
'        -- Publicar novedad'||unistr('\000a')||
'        htp.print(''<div class="nov">'');'||unistr('\000a')||
'        -- Enlace'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''<a href="''||v_notnov.url||''" target="_blank">'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- T';

s:=s||'itulo'||unistr('\000a')||
'        htp.print(''<b>''||v_notnov.titulo||''</b>'');'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''</a>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Resumen'||unistr('\000a')||
'        if v_notnov.resumen is not null then'||unistr('\000a')||
'          htp.print(''<br>''||v_notnov.resumen);'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Fecha Publicación'||unistr('\000a')||
'        htp.print(''<div class="tags">Publicado ''||to_char(v_notnov.publicado_desde,''dd/mm/yyyy''));'||unistr('\000a')||
'  ';

s:=s||'      -- Tags'||unistr('\000a')||
'        if v_notnov.tag1 is not null then'||unistr('\000a')||
'          htp.print('' // Tags: '');'||unistr('\000a')||
'          if v_notcfg.tag_url is not null then '||unistr('\000a')||
'            htp.print(''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag1)||''" target="_blank">''||lower(v_notnov.tag1)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag2)||''" target="_blank">''||lower(v_notnov.tag2)||''</a>''||'' - ''||''<a h';

s:=s||'ref="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag3)||''" target="_blank">''||lower(v_notnov.tag3)||''</a>'');'||unistr('\000a')||
'          else'||unistr('\000a')||
'            htp.print(lower(v_notnov.tag1)||'' - ''||lower(v_notnov.tag2)||'' - ''||lower(v_notnov.tag3));'||unistr('\000a')||
'          end if;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        -- Solo mostrar la cantidad maxima indicada el la configuración del servicio';

s:=s||' de noticias'||unistr('\000a')||
'        if i >= v_notcfg.NOTNOV_MAXCNT then'||unistr('\000a')||
'          exit;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --   '||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      -- Si no existen novedades para publicar'||unistr('\000a')||
'      if i = 0 then'||unistr('\000a')||
'        htp.print(''<br><br>No existen Noticias o Novedades publicadas ... <br><br>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 45845118200491332 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Columna Triple (3) Smartphone',
  p_region_name=>'smartphone',
  p_region_css_classes=>'fondo-gris',
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
  p_plug_display_when_condition => ':P1_CFGPOP_COL1 IS NOT NULL AND :P1_CFGPOP_COL2 IS NOT NULL AND :P1_CFGPOP_COL3 IS NOT NULL',
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
'  select replace(replace(replace(replace(enlace,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')),''SEGUSU.ID'',v(''P1_SEGUSU_ID'')),''ENTEND.ID'',v(''P1_ENTEND_ID''))  enlace '||unistr('\000a')||
'       , atributos_enlace'||unistr('\000a')||
'       , consejo'||unistr('\000a')||
'       , replace(replace(etiqueta,''WKSP_IMG'',v(''WORKSPACE_IMAGES'')),''APP_IMG'',v(''APP_IMAGES'')) etiqueta'||unistr('\000a')||
'';

s:=s||'    from CFG_PORTAL_PAGENL_V'||unistr('\000a')||
'   where CFGPOP_ID =  :P1_CFGPOP_POR_ID'||unistr('\000a')||
'     and SITUACION = ''PUB'''||unistr('\000a')||
'     and interface in (''TODAS'',''SMARTPHONE'')'||unistr('\000a')||
'   and sysdate between nvl(PUBLICACION_DESDE,sysdate) and nvl (PUBLICACION_HASTA,sysdate)'||unistr('\000a')||
'     and CFG_BI_PKG.CFGPPE_SEGUSU_AUTHO(p_cfgppe_id => id, p_segusu_id => :P1_SEGUSU_ID) = ''SI'''||unistr('\000a')||
'   order by ORDEN;'||unistr('\000a')||
'  -- Para obtener las configuración de noticias'||unistr('\000a')||
'  curs';

s:=s||'or cr_notcfg is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_configuraciones'||unistr('\000a')||
'  where segorg_id = :P1_SEGORG_ID;'||unistr('\000a')||
'  -- Para obtener las novedades a publicar'||unistr('\000a')||
'  cursor cr_notnov is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_novedades'||unistr('\000a')||
'  where segorg_id = :p1_segorg_id'||unistr('\000a')||
'    and sysdate between publicado_desde and nvl(publicado_hasta,sysdate)'||unistr('\000a')||
'    and situacion = ''VAL'''||unistr('\000a')||
'  order by id desc;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_enlaces VARCHAR(32000);  '||unistr('\000a')||
'  v_notcfg not_configuraci';

s:=s||'ones%rowtype;'||unistr('\000a')||
'  i number:=0;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Si se muestran los mensajes de Cuerpo'||unistr('\000a')||
'  if :P1_CFGPOP_COL1 = ''CUERPO'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div class="tit">&P1_TITULO_PORTAL.</div><br><br>'');'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_2.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_3.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_4.'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si';

s:=s||' Se muestran los TWITTER'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL1 = ''TWITTER'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P1_TWITTER_CODIGO.'');    '||unistr('\000a')||
'    -- '||unistr('\000a')||
'  -- Si Se muestran los enlaces'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL1 = ''ENLACES'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div class="tit">Enlaces</div><br><br>'');'||unistr('\000a')||
'    -- Armar y Mostrar enlaces'||unistr('\000a')||
'    v_enlaces :=''<ul class="uVerticalSidebarList">'';        '||unistr('\000a')||
'    for ';

s:=s||'v_pagenl in cr_pagenl loop'||unistr('\000a')||
'      v_enlaces := v_enlaces || ''<li><a href="''||v_pagenl.ENLACE||''" ''||v_pagenl.ATRIBUTOS_ENLACE||'' alt="''||v_pagenl.CONSEJO||''" title="''||v_pagenl.CONSEJO||''">''||v_pagenl.ETIQUETA||''</a></li>'';      '||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'    v_enlaces := v_enlaces || ''</ul>'';'||unistr('\000a')||
'    htp.print(v_enlaces); '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si se muestran las novedades de noticias'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL1 = ''NOTICIAS'' t';

s:=s||'hen'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div><div class="tit">Noticias y Novedades</div>'');'||unistr('\000a')||
'    -- Obtener la configuración de noticias'||unistr('\000a')||
'    open cr_notcfg;'||unistr('\000a')||
'    fetch cr_notcfg into v_notcfg;'||unistr('\000a')||
'    close cr_notcfg;'||unistr('\000a')||
'    -- Si no esta configurado, el servicio no esta habilitado'||unistr('\000a')||
'    if v_notcfg.ID is null then'||unistr('\000a')||
'      htp.print(''<br><br>El Servicio de Noticias y Novedades no se encuentra habilitado'');'||unistr('\000a')||
'    -- Si ';

s:=s||'esta configurado el servicio de noticias'||unistr('\000a')||
'    else'||unistr('\000a')||
'      -- Si existen, Agregar enlaces a sitios Sociales'||unistr('\000a')||
'      if v_notcfg.blog_url is not null or'||unistr('\000a')||
'         v_notcfg.facebook_url is not null or'||unistr('\000a')||
'         v_notcfg.youtube_url is not null or'||unistr('\000a')||
'         v_notcfg.twitter_url is not null then'||unistr('\000a')||
'        -- Título'||unistr('\000a')||
'        htp.print('' <div class="slc">Mantente conectado: <ul class="scl-icons">'');'||unistr('\000a')||
'        -- Enl';

s:=s||'ace a blog'||unistr('\000a')||
'        if v_notcfg.blog_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-blogger"><a href="''||v_notcfg.blog_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Facebook'||unistr('\000a')||
'        if v_notcfg.facebook_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-facebook"><a href="''||v_notcfg.facebook_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- ';

s:=s||'Enlace a Youtube'||unistr('\000a')||
'        if v_notcfg.youtube_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-youtube"><a href="''||v_notcfg.youtube_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Twitter'||unistr('\000a')||
'        if v_notcfg.twitter_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-twitter"><a href="''||v_notcfg.twitter_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'   ';

s:=s||'     --'||unistr('\000a')||
'        htp.print(''</ul></div></div>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      --  '||unistr('\000a')||
'      htp.print(''<br><br>'');'||unistr('\000a')||
'      -- Novedades'||unistr('\000a')||
'      for v_notnov in cr_notnov loop'||unistr('\000a')||
'        i := i+1;'||unistr('\000a')||
'        -- Publicar novedad'||unistr('\000a')||
'        htp.print(''<div class="nov">'');'||unistr('\000a')||
'        -- Enlace'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''<a href="''||v_notnov.url||''" target="_blank">'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- ';

s:=s||'Titulo'||unistr('\000a')||
'        htp.print(''<b>''||v_notnov.titulo||''</b>'');'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''</a>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Resumen'||unistr('\000a')||
'        if v_notnov.resumen is not null then'||unistr('\000a')||
'          htp.print(''<br>''||v_notnov.resumen);'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Fecha Publicación'||unistr('\000a')||
'        htp.print(''<div class="tags">Publicado ''||to_char(v_notnov.publicado_desde,''dd/mm/yyyy''));'||unistr('\000a')||
' ';

s:=s||'       -- Tags'||unistr('\000a')||
'        if v_notnov.tag1 is not null then'||unistr('\000a')||
'          htp.print('' // Tags: '');'||unistr('\000a')||
'          if v_notcfg.tag_url is not null then '||unistr('\000a')||
'            htp.print(''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag1)||''" target="_blank">''||lower(v_notnov.tag1)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag2)||''" target="_blank">''||lower(v_notnov.tag2)||''</a>''||'' - ''||''<a ';

s:=s||'href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag3)||''" target="_blank">''||lower(v_notnov.tag3)||''</a>'');'||unistr('\000a')||
'          else'||unistr('\000a')||
'            htp.print(lower(v_notnov.tag1)||'' - ''||lower(v_notnov.tag2)||'' - ''||lower(v_notnov.tag3));'||unistr('\000a')||
'          end if;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        -- Solo mostrar la cantidad maxima indicada el la configuración del servici';

s:=s||'o de noticias'||unistr('\000a')||
'        if i >= v_notcfg.NOTNOV_MAXCNT then'||unistr('\000a')||
'          exit;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --   '||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      -- Si no existen novedades para publicar'||unistr('\000a')||
'      if i = 0 then'||unistr('\000a')||
'        htp.print(''<br><br>No existen Noticias y Novedades ... <br><br>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 45845625949503007 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Columna Triple (1) Smartphone',
  p_region_name=>'smartphone',
  p_region_css_classes=>'fondo-gris',
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
  p_plug_display_when_condition => ':P1_CFGPOP_COL1 IS NOT NULL AND :P1_CFGPOP_COL2 IS NOT NULL AND :P1_CFGPOP_COL3 IS NOT NULL',
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
'  select replace(replace(replace(replace(enlace,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')),''SEGUSU.ID'',v(''P1_SEGUSU_ID'')),''ENTEND.ID'',v(''P1_ENTEND_ID''))  enlace '||unistr('\000a')||
'       , atributos_enlace'||unistr('\000a')||
'       , consejo'||unistr('\000a')||
'       , replace(replace(etiqueta,''WKSP_IMG'',v(''WORKSPACE_IMAGES'')),''APP_IMG'',v(''APP_IMAGES'')) etiqueta'||unistr('\000a')||
'';

s:=s||'    from CFG_PORTAL_PAGENL_V'||unistr('\000a')||
'   where CFGPOP_ID =  :P1_CFGPOP_POR_ID'||unistr('\000a')||
'     and SITUACION = ''PUB'''||unistr('\000a')||
'     and interface in (''TODAS'',''SMARTPHONE'')'||unistr('\000a')||
'   and sysdate between nvl(PUBLICACION_DESDE,sysdate) and nvl (PUBLICACION_HASTA,sysdate)'||unistr('\000a')||
'     and CFG_BI_PKG.CFGPPE_SEGUSU_AUTHO(p_cfgppe_id => id, p_segusu_id => :P1_SEGUSU_ID) = ''SI'''||unistr('\000a')||
'   order by ORDEN;'||unistr('\000a')||
'  -- Para obtener las configuración de noticias'||unistr('\000a')||
'  curs';

s:=s||'or cr_notcfg is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_configuraciones'||unistr('\000a')||
'  where segorg_id = :P1_SEGORG_ID;'||unistr('\000a')||
'  -- Para obtener las novedades a publicar'||unistr('\000a')||
'  cursor cr_notnov is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_novedades'||unistr('\000a')||
'  where segorg_id = :p1_segorg_id'||unistr('\000a')||
'    and sysdate between publicado_desde and nvl(publicado_hasta,sysdate)'||unistr('\000a')||
'    and situacion = ''VAL'''||unistr('\000a')||
'  order by id desc;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_enlaces VARCHAR(32000);  '||unistr('\000a')||
'  v_notcfg not_configuraci';

s:=s||'ones%rowtype;'||unistr('\000a')||
'  i number:=0;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Si se muestran los mensajes de Cuerpo'||unistr('\000a')||
'  if :P1_CFGPOP_COL1 = ''CUERPO'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div class="tit">&P1_TITULO_PORTAL.</div><br><br>'');'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_2.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_3.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_4.'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si';

s:=s||' Se muestran los TWITTER'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL1 = ''TWITTER'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P1_TWITTER_CODIGO.'');    '||unistr('\000a')||
'    -- '||unistr('\000a')||
'  -- Si Se muestran los enlaces'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL1 = ''ENLACES'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div class="tit">Enlaces</div><br><br>'');'||unistr('\000a')||
'    -- Armar y Mostrar enlaces'||unistr('\000a')||
'    v_enlaces :=''<ul class="uVerticalSidebarList">'';        '||unistr('\000a')||
'    for ';

s:=s||'v_pagenl in cr_pagenl loop'||unistr('\000a')||
'      v_enlaces := v_enlaces || ''<li><a href="''||v_pagenl.ENLACE||''" ''||v_pagenl.ATRIBUTOS_ENLACE||'' alt="''||v_pagenl.CONSEJO||''" title="''||v_pagenl.CONSEJO||''">''||v_pagenl.ETIQUETA||''</a></li>'';      '||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'    v_enlaces := v_enlaces || ''</ul>'';'||unistr('\000a')||
'    htp.print(v_enlaces); '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si se muestran las novedades de noticias'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL1 = ''NOTICIAS'' t';

s:=s||'hen'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div><div class="tit">Noticias y Novedades</div>'');'||unistr('\000a')||
'    -- Obtener la configuración de noticias'||unistr('\000a')||
'    open cr_notcfg;'||unistr('\000a')||
'    fetch cr_notcfg into v_notcfg;'||unistr('\000a')||
'    close cr_notcfg;'||unistr('\000a')||
'    -- Si no esta configurado, el servicio no esta habilitado'||unistr('\000a')||
'    if v_notcfg.ID is null then'||unistr('\000a')||
'      htp.print(''<br><br>El Servicio de Noticias y Novedades no se encuentra habilitado'');'||unistr('\000a')||
'    -- Si ';

s:=s||'esta configurado el servicio de noticias'||unistr('\000a')||
'    else'||unistr('\000a')||
'      -- Si existen, Agregar enlaces a sitios Sociales'||unistr('\000a')||
'      if v_notcfg.blog_url is not null or'||unistr('\000a')||
'         v_notcfg.facebook_url is not null or'||unistr('\000a')||
'         v_notcfg.youtube_url is not null or'||unistr('\000a')||
'         v_notcfg.twitter_url is not null then'||unistr('\000a')||
'        -- Título'||unistr('\000a')||
'        htp.print('' <div class="slc">Mantente conectado: <ul class="scl-icons">'');'||unistr('\000a')||
'        -- Enl';

s:=s||'ace a blog'||unistr('\000a')||
'        if v_notcfg.blog_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-blogger"><a href="''||v_notcfg.blog_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Facebook'||unistr('\000a')||
'        if v_notcfg.facebook_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-facebook"><a href="''||v_notcfg.facebook_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- ';

s:=s||'Enlace a Youtube'||unistr('\000a')||
'        if v_notcfg.youtube_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-youtube"><a href="''||v_notcfg.youtube_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Twitter'||unistr('\000a')||
'        if v_notcfg.twitter_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-twitter"><a href="''||v_notcfg.twitter_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'   ';

s:=s||'     --'||unistr('\000a')||
'        htp.print(''</ul></div></div>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      --  '||unistr('\000a')||
'      htp.print(''<br><br>'');'||unistr('\000a')||
'      -- Novedades'||unistr('\000a')||
'      for v_notnov in cr_notnov loop'||unistr('\000a')||
'        i := i+1;'||unistr('\000a')||
'        -- Publicar novedad'||unistr('\000a')||
'        htp.print(''<div class="nov">'');'||unistr('\000a')||
'        -- Enlace'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''<a href="''||v_notnov.url||''" target="_blank">'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- ';

s:=s||'Titulo'||unistr('\000a')||
'        htp.print(''<b>''||v_notnov.titulo||''</b>'');'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''</a>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Resumen'||unistr('\000a')||
'        if v_notnov.resumen is not null then'||unistr('\000a')||
'          htp.print(''<br>''||v_notnov.resumen);'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Fecha Publicación'||unistr('\000a')||
'        htp.print(''<div class="tags">Publicado ''||to_char(v_notnov.publicado_desde,''dd/mm/yyyy''));'||unistr('\000a')||
' ';

s:=s||'       -- Tags'||unistr('\000a')||
'        if v_notnov.tag1 is not null then'||unistr('\000a')||
'          htp.print('' // Tags: '');'||unistr('\000a')||
'          if v_notcfg.tag_url is not null then '||unistr('\000a')||
'            htp.print(''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag1)||''" target="_blank">''||lower(v_notnov.tag1)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag2)||''" target="_blank">''||lower(v_notnov.tag2)||''</a>''||'' - ''||''<a ';

s:=s||'href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag3)||''" target="_blank">''||lower(v_notnov.tag3)||''</a>'');'||unistr('\000a')||
'          else'||unistr('\000a')||
'            htp.print(lower(v_notnov.tag1)||'' - ''||lower(v_notnov.tag2)||'' - ''||lower(v_notnov.tag3));'||unistr('\000a')||
'          end if;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
''||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        -- Solo mostrar la cantidad maxima indicada el la configuración del servic';

s:=s||'io de noticias'||unistr('\000a')||
'        if i >= v_notcfg.NOTNOV_MAXCNT then'||unistr('\000a')||
'          exit;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --   '||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      -- Si no existen novedades para publicar'||unistr('\000a')||
'      if i = 0 then'||unistr('\000a')||
'        htp.print(''<br><br>No existen Noticias y Novedades publicadas ... <br><br>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 45846824134521414 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Columna Doble (1) Smartphone',
  p_region_name=>'smartphone',
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
  p_plug_display_when_condition => ':P1_CFGPOP_COL1 IS NOT NULL AND :P1_CFGPOP_COL2 IS NOT NULL AND :P1_CFGPOP_COL3 IS NULL',
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
'  select replace(replace(replace(replace(enlace,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')),''SEGUSU.ID'',v(''P1_SEGUSU_ID'')),''ENTEND.ID'',v(''P1_ENTEND_ID''))  enlace '||unistr('\000a')||
'       , atributos_enlace'||unistr('\000a')||
'       , consejo'||unistr('\000a')||
'       , replace(replace(etiqueta,''WKSP_IMG'',v(''WORKSPACE_IMAGES'')),''APP_IMG'',v(''APP_IMAGES'')) etiqueta'||unistr('\000a')||
'';

s:=s||'    from CFG_PORTAL_PAGENL_V'||unistr('\000a')||
'   where CFGPOP_ID =  :P1_CFGPOP_POR_ID'||unistr('\000a')||
'     and SITUACION = ''PUB'''||unistr('\000a')||
'     and interface in (''TODAS'',''SMARTPHONE'')'||unistr('\000a')||
'   and sysdate between nvl(PUBLICACION_DESDE,sysdate) and nvl (PUBLICACION_HASTA,sysdate)'||unistr('\000a')||
'     and CFG_BI_PKG.CFGPPE_SEGUSU_AUTHO(p_cfgppe_id => id, p_segusu_id => :P1_SEGUSU_ID) = ''SI'''||unistr('\000a')||
'   order by ORDEN;'||unistr('\000a')||
'  -- Para obtener las configuración de noticias'||unistr('\000a')||
'  curs';

s:=s||'or cr_notcfg is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_configuraciones'||unistr('\000a')||
'  where segorg_id = :P1_SEGORG_ID;'||unistr('\000a')||
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
'  v_notcfg not_configuracio';

s:=s||'nes%rowtype;'||unistr('\000a')||
'  i number:=0;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Si se muestran los mensajes de Cuerpo'||unistr('\000a')||
'  if :P1_CFGPOP_COL1 = ''CUERPO'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div class="tit">&P1_TITULO_PORTAL.</div><br><br>'');'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_2.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_3.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_4.'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si ';

s:=s||'Se muestran los TWITTER'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL1 = ''TWITTER'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    --htp.print(''<div class="tit"><a class="link-tweets" href="https://twitter.com/idesanluis" title="Twitter">Tweets</a></div><br><br>'');'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P1_TWITTER_CODIGO.'');    '||unistr('\000a')||
'    -- '||unistr('\000a')||
'  -- Si Se muestran los enlaces'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL1 = ''ENLACES'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div';

s:=s||' class="tit">Enlaces</div><br><br>'');'||unistr('\000a')||
'    -- Armar y Mostrar enlaces'||unistr('\000a')||
'    v_enlaces :=''<ul class="uVerticalSidebarList">'';        '||unistr('\000a')||
'    for v_pagenl in cr_pagenl loop'||unistr('\000a')||
'      v_enlaces := v_enlaces || ''<li><a href="''||v_pagenl.ENLACE||''" ''||v_pagenl.ATRIBUTOS_ENLACE||'' alt="''||v_pagenl.CONSEJO||''" title="''||v_pagenl.CONSEJO||''">''||v_pagenl.ETIQUETA||''</a></li>'';      '||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'    v_enlaces := v_';

s:=s||'enlaces || ''</ul>'';'||unistr('\000a')||
'    htp.print(v_enlaces); '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si se muestran las novedades de noticias'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL1 = ''NOTICIAS'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div><div class="tit">Noticias y Novedades</div>'');'||unistr('\000a')||
'    -- Obtener la configuración de noticias'||unistr('\000a')||
'    open cr_notcfg;'||unistr('\000a')||
'    fetch cr_notcfg into v_notcfg;'||unistr('\000a')||
'    close cr_notcfg;'||unistr('\000a')||
'    -- Si no esta configurado, el servicio no esta habili';

s:=s||'tado'||unistr('\000a')||
'    if v_notcfg.ID is null then'||unistr('\000a')||
'      htp.print(''<br><br>El Servicio de Noticias y Novedades no se encuentra habilitado'');'||unistr('\000a')||
'    -- Si esta configurado el servicio de noticias'||unistr('\000a')||
'    else'||unistr('\000a')||
'      -- Si existen, Agregar enlaces a sitios Sociales'||unistr('\000a')||
'      if v_notcfg.blog_url is not null or'||unistr('\000a')||
'         v_notcfg.facebook_url is not null or'||unistr('\000a')||
'         v_notcfg.youtube_url is not null or'||unistr('\000a')||
'         v_notcfg.twitte';

s:=s||'r_url is not null then'||unistr('\000a')||
'        -- Título'||unistr('\000a')||
'        htp.print('' <div class="slc">Mantente conectado: <ul class="scl-icons">'');'||unistr('\000a')||
'        -- Enlace a blog'||unistr('\000a')||
'        if v_notcfg.blog_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-blogger"><a href="''||v_notcfg.blog_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Facebook'||unistr('\000a')||
'        if v_notcfg.facebook_url is not null then'||unistr('\000a')||
'  ';

s:=s||'        htp.print(''<li class="scl-facebook"><a href="''||v_notcfg.facebook_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Youtube'||unistr('\000a')||
'        if v_notcfg.youtube_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-youtube"><a href="''||v_notcfg.youtube_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Twitter'||unistr('\000a')||
'        if v_notcfg.twitter_url is not nu';

s:=s||'ll then'||unistr('\000a')||
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
'        htp.print(''<div class="nov">'');'||unistr('\000a')||
'        -- Enlace'||unistr('\000a')||
'';

s:=s||'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''<a href="''||v_notnov.url||''" target="_blank">'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Titulo'||unistr('\000a')||
'        htp.print(''<b>''||v_notnov.titulo||''</b>'');'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''</a>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Resumen'||unistr('\000a')||
'        if v_notnov.resumen is not null then'||unistr('\000a')||
'          htp.print(''<br>''||v_notnov.resumen);'||unistr('\000a')||
'       ';

s:=s||' end if;'||unistr('\000a')||
'        -- Fecha Publicación'||unistr('\000a')||
'        htp.print(''<div class="tags">Publicado ''||to_char(v_notnov.publicado_desde,''dd/mm/yyyy''));'||unistr('\000a')||
'        -- Tags'||unistr('\000a')||
'        if v_notnov.tag1 is not null then'||unistr('\000a')||
'          htp.print('' // Tags: '');'||unistr('\000a')||
'          if v_notcfg.tag_url is not null then '||unistr('\000a')||
'            htp.print(''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag1)||''" target="_blank">''||lower(v_notnov.tag1)';

s:=s||'||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag2)||''" target="_blank">''||lower(v_notnov.tag2)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag3)||''" target="_blank">''||lower(v_notnov.tag3)||''</a>'');'||unistr('\000a')||
'          else'||unistr('\000a')||
'            htp.print(lower(v_notnov.tag1)||'' - ''||lower(v_notnov.tag2)||'' - ''||lower(v_notnov.tag3));'||unistr('\000a')||
'          end if;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
''||unistr('\000a')||
'  ';

s:=s||'      htp.print(''</div>'');'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        -- Solo mostrar la cantidad maxima indicada el la configuración del servicio de noticias'||unistr('\000a')||
'        if i >= v_notcfg.NOTNOV_MAXCNT then'||unistr('\000a')||
'          exit;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --   '||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      -- Si no existen novedades para publicar'||unistr('\000a')||
'      if i = 0 then'||unistr('\000a')||
'        htp.print(''<br><br>No existen Noticias y Novedades publicadas ... ';

s:=s||'<br><br>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 45847113183527731 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
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
  p_plug_display_when_condition => ':P1_CFGPOP_COL1 IS NOT NULL AND :P1_CFGPOP_COL2 IS NULL AND :P1_CFGPOP_COL3 IS NULL',
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
'  htp.p(:P1_CABECERA_MENSAJE);'||unistr('\000a')||
'  --'||unistr('\000a')||
'  --Style solo para COMPRAS  '||unistr('\000a')||
'  if :P1_SEGORG_CODIGO = ''PCYCSL'' then'||unistr('\000a')||
'    htp.p(''<style>.fondo-gris{background-color:#F0F0F0;}</style>'');'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  --'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 50274915017990409 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Cabecera Libre',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 60053457202939040+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 25,
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
  p_plug_display_when_condition => ':P1_ESTILO_CABECERA  = ''LIB''',
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
'  select replace(replace(replace(replace(enlace,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')),''SEGUSU.ID'',v(''P1_SEGUSU_ID'')),''ENTEND.ID'',v(''P1_ENTEND_ID''))  enlace'||unistr('\000a')||
'       , atributos_enlace'||unistr('\000a')||
'       , consejo'||unistr('\000a')||
'       , replace(replace(etiqueta,''WKSP_IMG'',v(''WORKSPACE_IMAGES'')),''APP_IMG'',v(''APP_IMAGES'')) etiqueta'||unistr('\000a')||
' ';

s:=s||'   from CFG_PORTAL_PAGENL_V'||unistr('\000a')||
'   where CFGPOP_ID =  :P1_CFGPOP_POR_ID'||unistr('\000a')||
'     and SITUACION = ''PUB'''||unistr('\000a')||
'     and interface in (''TODAS'',''SMARTPHONE'')'||unistr('\000a')||
'   and sysdate between nvl(PUBLICACION_DESDE,sysdate) and nvl (PUBLICACION_HASTA,sysdate)'||unistr('\000a')||
'     and CFG_BI_PKG.CFGPPE_SEGUSU_AUTHO(p_cfgppe_id => id, p_segusu_id => :P1_SEGUSU_ID) = ''SI'''||unistr('\000a')||
'   order by ORDEN;'||unistr('\000a')||
'  -- Para obtener las configuración de noticias'||unistr('\000a')||
'  curso';

s:=s||'r cr_notcfg is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_configuraciones'||unistr('\000a')||
'  where segorg_id = :P1_SEGORG_ID;'||unistr('\000a')||
'  -- Para obtener las novedades a publicar'||unistr('\000a')||
'  cursor cr_notnov is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_novedades'||unistr('\000a')||
'  where segorg_id = :p1_segorg_id'||unistr('\000a')||
'    and sysdate between publicado_desde and nvl(publicado_hasta,sysdate)'||unistr('\000a')||
'    and situacion = ''VAL'''||unistr('\000a')||
'  order by id desc;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_enlaces VARCHAR(32000);  '||unistr('\000a')||
'  v_notcfg not_configuracio';

s:=s||'nes%rowtype;'||unistr('\000a')||
'  i number:=0;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Si se muestran los mensajes de Cuerpo'||unistr('\000a')||
'  if :P1_CFGPOP_COL2 = ''CUERPO'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div class="tit">&P1_TITULO_PORTAL.</div><br><br>'');'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_2.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_3.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_4.'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si ';

s:=s||'Se muestran los TWITTER'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL2 = ''TWITTER'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P1_TWITTER_CODIGO.'');    '||unistr('\000a')||
'    -- '||unistr('\000a')||
'  -- Si Se muestran los enlaces'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL2 = ''ENLACES'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div class="tit">Enlaces</div><br><br>'');'||unistr('\000a')||
'    -- Armar y Mostrar enlaces'||unistr('\000a')||
'    v_enlaces :=''<ul class="uVerticalSidebarList">'';        '||unistr('\000a')||
'    for v';

s:=s||'_pagenl in cr_pagenl loop'||unistr('\000a')||
'      v_enlaces := v_enlaces || ''<li><a href="''||v_pagenl.ENLACE||''" ''||v_pagenl.ATRIBUTOS_ENLACE||'' alt="''||v_pagenl.CONSEJO||''" title="''||v_pagenl.CONSEJO||''">''||v_pagenl.ETIQUETA||''</a></li>'';      '||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'    v_enlaces := v_enlaces || ''</ul>'';'||unistr('\000a')||
'    htp.print(v_enlaces); '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si se muestran las novedades de noticias'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL2 = ''NOTICIAS'' th';

s:=s||'en'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div><div class="tit">Noticias y Novedades</div>'');'||unistr('\000a')||
'    -- Obtener la configuración de noticias'||unistr('\000a')||
'    open cr_notcfg;'||unistr('\000a')||
'    fetch cr_notcfg into v_notcfg;'||unistr('\000a')||
'    close cr_notcfg;'||unistr('\000a')||
'    -- Si no esta configurado, el servicio no esta habilitado'||unistr('\000a')||
'    if v_notcfg.ID is null then'||unistr('\000a')||
'      htp.print(''<br><br>El Servicio de Noticias y Novedades no se encuentra habilitado'');'||unistr('\000a')||
'    -- Si e';

s:=s||'sta configurado el servicio de noticias'||unistr('\000a')||
'    else'||unistr('\000a')||
'      -- Si existen, Agregar enlaces a sitios Sociales'||unistr('\000a')||
'      if v_notcfg.blog_url is not null or'||unistr('\000a')||
'         v_notcfg.facebook_url is not null or'||unistr('\000a')||
'         v_notcfg.youtube_url is not null or'||unistr('\000a')||
'         v_notcfg.twitter_url is not null then'||unistr('\000a')||
'        -- Título'||unistr('\000a')||
'        htp.print('' <div class="slc">Mantente conectado: <ul class="scl-icons">'');'||unistr('\000a')||
'        -- Enla';

s:=s||'ce a blog'||unistr('\000a')||
'        if v_notcfg.blog_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-blogger"><a href="''||v_notcfg.blog_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Facebook'||unistr('\000a')||
'        if v_notcfg.facebook_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-facebook"><a href="''||v_notcfg.facebook_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- E';

s:=s||'nlace a Youtube'||unistr('\000a')||
'        if v_notcfg.youtube_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-youtube"><a href="''||v_notcfg.youtube_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Twitter'||unistr('\000a')||
'        if v_notcfg.twitter_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-twitter"><a href="''||v_notcfg.twitter_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'    ';

s:=s||'    --'||unistr('\000a')||
'        htp.print(''</ul></div></div>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      --  '||unistr('\000a')||
'      htp.print(''<br><br>'');'||unistr('\000a')||
'      -- Novedades'||unistr('\000a')||
'      for v_notnov in cr_notnov loop'||unistr('\000a')||
'        i := i+1;'||unistr('\000a')||
'        -- Publicar novedad'||unistr('\000a')||
'        htp.print(''<div class="nov">'');'||unistr('\000a')||
'        -- Enlace'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''<a href="''||v_notnov.url||''" target="_blank">'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- T';

s:=s||'itulo'||unistr('\000a')||
'        htp.print(''<b>''||v_notnov.titulo||''</b>'');'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''</a>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Resumen'||unistr('\000a')||
'        if v_notnov.resumen is not null then'||unistr('\000a')||
'          htp.print(''<br>''||v_notnov.resumen);'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Fecha Publicación'||unistr('\000a')||
'        htp.print(''<div class="tags">Publicado ''||to_char(v_notnov.publicado_desde,''dd/mm/yyyy''));'||unistr('\000a')||
'  ';

s:=s||'      -- Tags'||unistr('\000a')||
'        if v_notnov.tag1 is not null then'||unistr('\000a')||
'          htp.print('' // Tags: '');'||unistr('\000a')||
'          if v_notcfg.tag_url is not null then '||unistr('\000a')||
'            htp.print(''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag1)||''" target="_blank">''||lower(v_notnov.tag1)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag2)||''" target="_blank">''||lower(v_notnov.tag2)||''</a>''||'' - ''||''<a h';

s:=s||'ref="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag3)||''" target="_blank">''||lower(v_notnov.tag3)||''</a>'');'||unistr('\000a')||
'          else'||unistr('\000a')||
'            htp.print(lower(v_notnov.tag1)||'' - ''||lower(v_notnov.tag2)||'' - ''||lower(v_notnov.tag3));'||unistr('\000a')||
'          end if;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        -- Solo mostrar la cantidad maxima indicada el la configuración del servicio';

s:=s||' de noticias'||unistr('\000a')||
'        if i >= v_notcfg.NOTNOV_MAXCNT then'||unistr('\000a')||
'          exit;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --   '||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      -- Si no existen novedades para publicar'||unistr('\000a')||
'      if i = 0 then'||unistr('\000a')||
'        htp.print(''<br><br>No existen Noticias y Novedades publicadas ... <br><br>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 50698946707231175 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Columna Doble (2) Smartphone',
  p_region_name=>'smartphone',
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
  p_plug_display_when_condition => ':P1_CFGPOP_COL1 IS NOT NULL AND :P1_CFGPOP_COL2 IS NOT NULL AND :P1_CFGPOP_COL3 IS NULL',
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
'  select replace(replace(replace(replace(enlace,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')),''SEGUSU.ID'',v(''P1_SEGUSU_ID'')),''ENTEND.ID'',v(''P1_ENTEND_ID''))  enlace '||unistr('\000a')||
'       , atributos_enlace'||unistr('\000a')||
'       , consejo'||unistr('\000a')||
'       , replace(replace(etiqueta,''WKSP_IMG'',v(''WORKSPACE_IMAGES'')),''APP_IMG'',v(''APP_IMAGES'')) etiqueta'||unistr('\000a')||
'';

s:=s||'    from CFG_PORTAL_PAGENL_V'||unistr('\000a')||
'   where CFGPOP_ID =  :P1_CFGPOP_POR_ID'||unistr('\000a')||
'     and SITUACION = ''PUB'''||unistr('\000a')||
'     and interface in (''TODAS'',''DESKTOP'')'||unistr('\000a')||
'   and sysdate between nvl(PUBLICACION_DESDE,sysdate) and nvl (PUBLICACION_HASTA,sysdate)'||unistr('\000a')||
'     and CFG_BI_PKG.CFGPPE_SEGUSU_AUTHO(p_cfgppe_id => id, p_segusu_id => :P1_SEGUSU_ID) = ''SI'''||unistr('\000a')||
'   order by ORDEN;'||unistr('\000a')||
'  -- Para obtener las configuración de noticias'||unistr('\000a')||
'  cursor ';

s:=s||'cr_notcfg is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_configuraciones'||unistr('\000a')||
'  where segorg_id = :P1_SEGORG_ID;'||unistr('\000a')||
'  -- Para obtener las novedades a publicar'||unistr('\000a')||
'  cursor cr_notnov is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_novedades'||unistr('\000a')||
'  where segorg_id = :p1_segorg_id'||unistr('\000a')||
'    and sysdate between publicado_desde and nvl(publicado_hasta,sysdate)'||unistr('\000a')||
'    and situacion = ''VAL'''||unistr('\000a')||
'  order by id desc;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_enlaces VARCHAR(32000);  '||unistr('\000a')||
'  v_notcfg not_configuracione';

s:=s||'s%rowtype;'||unistr('\000a')||
'  i number:=0;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Si se muestran los mensajes de Cuerpo'||unistr('\000a')||
'  if :P1_CFGPOP_COL2 = ''CUERPO'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div class="tit">&P1_TITULO_PORTAL.</div><br><br>'');'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_2.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_3.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_4.'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si Se';

s:=s||' muestran los TWITTER'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL2 = ''TWITTER'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P1_TWITTER_CODIGO.'');    '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si Se muestran los enlaces'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL2 = ''ENLACES'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div class="tit">Enlaces</div><br><br>'');'||unistr('\000a')||
'    -- Armar y Mostrar enlaces'||unistr('\000a')||
'    v_enlaces :=''<ul class="uVerticalSidebarList">'';        '||unistr('\000a')||
'    for v_pa';

s:=s||'genl in cr_pagenl loop'||unistr('\000a')||
'      v_enlaces := v_enlaces || ''<li><a href="''||v_pagenl.ENLACE||''" ''||v_pagenl.ATRIBUTOS_ENLACE||'' alt="''||v_pagenl.CONSEJO||''" title="''||v_pagenl.CONSEJO||''">''||v_pagenl.ETIQUETA||''</a></li>'';      '||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'    v_enlaces := v_enlaces || ''</ul>'';'||unistr('\000a')||
'    htp.print(v_enlaces); '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si se muestran las novedades de noticias'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL2 = ''NOTICIAS'' then'||unistr('\000a')||
'';

s:=s||'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div><div class="tit">Noticias y Novedades</div>'');'||unistr('\000a')||
'    -- Obtener la configuración de noticias'||unistr('\000a')||
'    open cr_notcfg;'||unistr('\000a')||
'    fetch cr_notcfg into v_notcfg;'||unistr('\000a')||
'    close cr_notcfg;'||unistr('\000a')||
'    -- Si no esta configurado, el servicio no esta habilitado'||unistr('\000a')||
'    if v_notcfg.ID is null then'||unistr('\000a')||
'      htp.print(''<br><br>El Servicio de Noticias y Novedades no se encuentra habilitado'');'||unistr('\000a')||
'    -- Si esta';

s:=s||' configurado el servicio de noticias'||unistr('\000a')||
'    else'||unistr('\000a')||
'      -- Si existen, Agregar enlaces a sitios Sociales'||unistr('\000a')||
'      if v_notcfg.blog_url is not null or'||unistr('\000a')||
'         v_notcfg.facebook_url is not null or'||unistr('\000a')||
'         v_notcfg.youtube_url is not null or'||unistr('\000a')||
'         v_notcfg.twitter_url is not null then'||unistr('\000a')||
'        -- Título'||unistr('\000a')||
'        htp.print('' <div class="slc">Mantente conectado: <ul class="scl-icons">'');'||unistr('\000a')||
'        -- Enlace ';

s:=s||'a blog'||unistr('\000a')||
'        if v_notcfg.blog_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-blogger"><a href="''||v_notcfg.blog_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Facebook'||unistr('\000a')||
'        if v_notcfg.facebook_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-facebook"><a href="''||v_notcfg.facebook_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enla';

s:=s||'ce a Youtube'||unistr('\000a')||
'        if v_notcfg.youtube_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-youtube"><a href="''||v_notcfg.youtube_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Twitter'||unistr('\000a')||
'        if v_notcfg.twitter_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-twitter"><a href="''||v_notcfg.twitter_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'       ';

s:=s||' --'||unistr('\000a')||
'        htp.print(''</ul></div></div>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      --  '||unistr('\000a')||
'      htp.print(''<br><br>'');'||unistr('\000a')||
'      -- Novedades'||unistr('\000a')||
'      for v_notnov in cr_notnov loop'||unistr('\000a')||
'        i := i+1;'||unistr('\000a')||
'        -- Publicar novedad'||unistr('\000a')||
'        htp.print(''<div class="nov">'');'||unistr('\000a')||
'        -- Enlace'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''<a href="''||v_notnov.url||''" target="_blank">'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Titu';

s:=s||'lo'||unistr('\000a')||
'        htp.print(''<b>''||v_notnov.titulo||''</b>'');'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''</a>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Resumen'||unistr('\000a')||
'        if v_notnov.resumen is not null then'||unistr('\000a')||
'          htp.print(''<br>''||v_notnov.resumen);'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Fecha Publicación'||unistr('\000a')||
'        htp.print(''<div class="tags">Publicado ''||to_char(v_notnov.publicado_desde,''dd/mm/yyyy''));'||unistr('\000a')||
'     ';

s:=s||'   -- Tags'||unistr('\000a')||
'        if v_notnov.tag1 is not null then'||unistr('\000a')||
'          htp.print('' // Tags: '');'||unistr('\000a')||
'          if v_notcfg.tag_url is not null then '||unistr('\000a')||
'            htp.print(''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag1)||''" target="_blank">''||lower(v_notnov.tag1)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag2)||''" target="_blank">''||lower(v_notnov.tag2)||''</a>''||'' - ''||''<a href';

s:=s||'="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag3)||''" target="_blank">''||lower(v_notnov.tag3)||''</a>'');'||unistr('\000a')||
'          else'||unistr('\000a')||
'            htp.print(lower(v_notnov.tag1)||'' - ''||lower(v_notnov.tag2)||'' - ''||lower(v_notnov.tag3));'||unistr('\000a')||
'          end if;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        -- Solo mostrar la cantidad maxima indicada el la configuración del servicio de';

s:=s||' noticias'||unistr('\000a')||
'        if i >= v_notcfg.NOTNOV_MAXCNT then'||unistr('\000a')||
'          exit;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --   '||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      -- Si no existen novedades para publicar'||unistr('\000a')||
'      if i = 0 then'||unistr('\000a')||
'        htp.print(''<br><br>No existen Noticias y Novedades publicadas ... <br><br>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 52451142091196087 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Columna Doble (2)',
  p_region_name=>'desktop',
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
  p_plug_display_when_condition => ':P1_CFGPOP_COL1 IS NOT NULL AND :P1_CFGPOP_COL2 IS NOT NULL AND :P1_CFGPOP_COL3 IS NULL',
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
'  select replace(replace(replace(replace(enlace,''SESSION'',v(''SESSION'')),''APP_ID'',v(''APP_ID'')),''SEGUSU.ID'',v(''P1_SEGUSU_ID'')),''ENTEND.ID'',v(''P1_ENTEND_ID''))  enlace '||unistr('\000a')||
'       , atributos_enlace'||unistr('\000a')||
'       , consejo'||unistr('\000a')||
'       , replace(replace(etiqueta,''WKSP_IMG'',v(''WORKSPACE_IMAGES'')),''APP_IMG'',v(''APP_IMAGES'')) etiqueta'||unistr('\000a')||
'';

s:=s||'    from CFG_PORTAL_PAGENL_V'||unistr('\000a')||
'   where CFGPOP_ID =  :P1_CFGPOP_POR_ID'||unistr('\000a')||
'     and SITUACION = ''PUB'''||unistr('\000a')||
'     and interface in (''TODAS'',''DESKTOP'')'||unistr('\000a')||
'   and sysdate between nvl(PUBLICACION_DESDE,sysdate) and nvl (PUBLICACION_HASTA,sysdate)'||unistr('\000a')||
'     and CFG_BI_PKG.CFGPPE_SEGUSU_AUTHO(p_cfgppe_id => id, p_segusu_id => :P1_SEGUSU_ID) = ''SI'''||unistr('\000a')||
'   order by ORDEN;'||unistr('\000a')||
'  -- Para obtener las configuración de noticias'||unistr('\000a')||
'  cursor ';

s:=s||'cr_notcfg is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_configuraciones'||unistr('\000a')||
'  where segorg_id = :P1_SEGORG_ID;'||unistr('\000a')||
'  -- Para obtener las novedades a publicar'||unistr('\000a')||
'  cursor cr_notnov is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from not_novedades'||unistr('\000a')||
'  where segorg_id = :p1_segorg_id'||unistr('\000a')||
'    and sysdate between publicado_desde and nvl(publicado_hasta,sysdate)'||unistr('\000a')||
'    and situacion = ''VAL'''||unistr('\000a')||
'  order by id desc;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_enlaces VARCHAR(32000);  '||unistr('\000a')||
'  v_notcfg not_configuracione';

s:=s||'s%rowtype;'||unistr('\000a')||
'  i number:=0;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Si se muestran los mensajes de Cuerpo'||unistr('\000a')||
'  if :P1_CFGPOP_COL1 = ''CUERPO'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div class="tit">&P1_TITULO_PORTAL.</div><br><br>'');'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_2.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_3.'');'||unistr('\000a')||
'    htp.print(''&P1_CUERPO_MENSAJE_4.'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si Se';

s:=s||' muestran los TWITTER'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL1 = ''TWITTER'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    -- Mensajes de Cuerpo'||unistr('\000a')||
'    htp.print(''&P1_TWITTER_CODIGO.'');    '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si Se muestran los enlaces'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL1 = ''ENLACES'' then'||unistr('\000a')||
'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div class="tit">Enlaces</div><br><br>'');'||unistr('\000a')||
'    -- Armar y Mostrar enlaces'||unistr('\000a')||
'    v_enlaces :=''<ul class="uVerticalSidebarList">'';        '||unistr('\000a')||
'    for v_pa';

s:=s||'genl in cr_pagenl loop'||unistr('\000a')||
'      v_enlaces := v_enlaces || ''<li><a href="''||v_pagenl.ENLACE||''" ''||v_pagenl.ATRIBUTOS_ENLACE||'' alt="''||v_pagenl.CONSEJO||''" title="''||v_pagenl.CONSEJO||''">''||v_pagenl.ETIQUETA||''</a></li>'';      '||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'    v_enlaces := v_enlaces || ''</ul>'';'||unistr('\000a')||
'    htp.print(v_enlaces); '||unistr('\000a')||
'    --'||unistr('\000a')||
'  -- Si se muestran las novedades de noticias'||unistr('\000a')||
'  elsif :P1_CFGPOP_COL1 = ''NOTICIAS'' then'||unistr('\000a')||
'';

s:=s||'    -- Titulo'||unistr('\000a')||
'    htp.print(''<div><div class="tit">Noticias y Novedades</div>'');'||unistr('\000a')||
'    -- Obtener la configuración de noticias'||unistr('\000a')||
'    open cr_notcfg;'||unistr('\000a')||
'    fetch cr_notcfg into v_notcfg;'||unistr('\000a')||
'    close cr_notcfg;'||unistr('\000a')||
'    -- Si no esta configurado, el servicio no esta habilitado'||unistr('\000a')||
'    if v_notcfg.ID is null then'||unistr('\000a')||
'      htp.print(''<br><br>El Servicio de Noticias y Novedades no se encuentra habilitado'');'||unistr('\000a')||
'    -- Si esta';

s:=s||' configurado el servicio de noticias'||unistr('\000a')||
'    else'||unistr('\000a')||
'      -- Si existen, Agregar enlaces a sitios Sociales'||unistr('\000a')||
'      if v_notcfg.blog_url is not null or'||unistr('\000a')||
'         v_notcfg.facebook_url is not null or'||unistr('\000a')||
'         v_notcfg.youtube_url is not null or'||unistr('\000a')||
'         v_notcfg.twitter_url is not null then'||unistr('\000a')||
'        -- Título'||unistr('\000a')||
'        htp.print('' <div class="slc">Mantente conectado: <ul class="scl-icons">'');'||unistr('\000a')||
'        -- Enlace ';

s:=s||'a blog'||unistr('\000a')||
'        if v_notcfg.blog_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-blogger"><a href="''||v_notcfg.blog_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Facebook'||unistr('\000a')||
'        if v_notcfg.facebook_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-facebook"><a href="''||v_notcfg.facebook_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enla';

s:=s||'ce a Youtube'||unistr('\000a')||
'        if v_notcfg.youtube_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-youtube"><a href="''||v_notcfg.youtube_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Enlace a Twitter'||unistr('\000a')||
'        if v_notcfg.twitter_url is not null then'||unistr('\000a')||
'          htp.print(''<li class="scl-twitter"><a href="''||v_notcfg.twitter_url||''" target="_blank"></a></li>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'       ';

s:=s||' --'||unistr('\000a')||
'        htp.print(''</ul></div></div>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      --  '||unistr('\000a')||
'      htp.print(''<br><br>'');'||unistr('\000a')||
'      -- Novedades'||unistr('\000a')||
'      for v_notnov in cr_notnov loop'||unistr('\000a')||
'        i := i+1;'||unistr('\000a')||
'        -- Publicar novedad'||unistr('\000a')||
'        htp.print(''<div class="nov">'');'||unistr('\000a')||
'        -- Enlace'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''<a href="''||v_notnov.url||''" target="_blank">'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Titu';

s:=s||'lo'||unistr('\000a')||
'        htp.print(''<b>''||v_notnov.titulo||''</b>'');'||unistr('\000a')||
'        if v_notnov.url is not null then'||unistr('\000a')||
'          htp.print(''</a>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Resumen'||unistr('\000a')||
'        if v_notnov.resumen is not null then'||unistr('\000a')||
'          htp.print(''<br>''||v_notnov.resumen);'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Fecha Publicación'||unistr('\000a')||
'        htp.print(''<div class="tags">Publicado ''||to_char(v_notnov.publicado_desde,''dd/mm/yyyy''));'||unistr('\000a')||
'     ';

s:=s||'   -- Tags'||unistr('\000a')||
'        if v_notnov.tag1 is not null then'||unistr('\000a')||
'          htp.print('' // Tags: '');'||unistr('\000a')||
'          if v_notcfg.tag_url is not null then '||unistr('\000a')||
'            htp.print(''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag1)||''" target="_blank">''||lower(v_notnov.tag1)||''</a>''||'' - ''||''<a href="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag2)||''" target="_blank">''||lower(v_notnov.tag2)||''</a>''||'' - ''||''<a href';

s:=s||'="''||v_notcfg.tag_url||''/''||lower(v_notnov.tag3)||''" target="_blank">''||lower(v_notnov.tag3)||''</a>'');'||unistr('\000a')||
'          else'||unistr('\000a')||
'            htp.print(lower(v_notnov.tag1)||'' - ''||lower(v_notnov.tag2)||'' - ''||lower(v_notnov.tag3));'||unistr('\000a')||
'          end if;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
''||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        htp.print(''</div>'');'||unistr('\000a')||
'        -- Solo mostrar la cantidad maxima indicada el la configuración del servicio d';

s:=s||'e noticias'||unistr('\000a')||
'        if i >= v_notcfg.NOTNOV_MAXCNT then'||unistr('\000a')||
'          exit;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --   '||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      -- Si no existen novedades para publicar'||unistr('\000a')||
'      if i = 0 then'||unistr('\000a')||
'        htp.print(''<br><br>No existen Noticias y Novedades publicadas ... <br><br>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 52478645422537661 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Columna Doble (1)',
  p_region_name=>'desktop',
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
  p_plug_display_when_condition => ':P1_CFGPOP_COL1 IS NOT NULL AND :P1_CFGPOP_COL2 IS NOT NULL AND :P1_CFGPOP_COL3 IS NULL',
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
s:=s||'htp.print(:P1_NOTICIAS);';

wwv_flow_api.create_page_plug (
  p_id=> 54314732462664601 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Noticias',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 60053457202939040+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_2',
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
  p_plug_display_condition_type => 'EXISTS',
  p_plug_display_when_condition => '  SELECT 1'||unistr('\000a')||
'  FROM cfg_noticias cfgnot'||unistr('\000a')||
'  WHERE cfgnot.segorg_id = :p1_segorg_id'||unistr('\000a')||
'    and sysdate between nvl(cfgnot.fecha_desde,sysdate) and nvl(cfgnot.fecha_hasta,sysdate)'||unistr('\000a')||
'    and cfgnot.situacion = ''VIG'''||unistr('\000a')||
'    and (CFG_BI_PKG.CFGNOT_SEGPFL_AUTHO(:P1_SEGORG_ID,''CFGNOT_PUBNOT_GENERAL'',cfgnot.ID)= ''SI'' or'||unistr('\000a')||
'         CFG_BI_PKG.CFGNOT_SEGPFL_AUTHO(:P1_SEGORG_ID,''CFGNOT_PUBNOT_PORSRV'',cfgnot.ID)= ''SI''  or'||unistr('\000a')||
'       CFG_BI_PKG.CFGNOT_SEGUSU_AUTHO(:P1_SEGUSU_ID,ID) = ''SI'')',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_header=> '<div style="float:right;margin: 0px 4px 0 0;"><a onclick="abrir_news(); return false;" href="f?p=&APP_ID.:1:&SESSION.::::"><img border="0" title="Ver Todas las Noticias" alt="Ver Todas las Noticias" src="#IMAGE_PREFIX#menu/go-small.png"></a></div>',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '  SELECT 1'||unistr('\000a')||
'  FROM cfg_noticias cfgnot'||unistr('\000a')||
'  WHERE cfgnot.segorg_id = :p1_segorg_id'||unistr('\000a')||
'    and sysdate between nvl(cfgnot.fecha_desde,sysdate) and nvl(cfgnot.fecha_hasta,sysdate)'||unistr('\000a')||
'    and cfgnot.situacion = ''VIG'''||unistr('\000a')||
'    and (CFG_BI_PKG.CFGNOT_SEGPFL_AUTHO(:P1_SEGORG_ID,''CATNOT_PUBNOT_GENERAL'',cfgnot.ID)= ''SI'' or'||unistr('\000a')||
'         CFG_BI_PKG.CFGNOT_SEGPFL_AUTHO(:P1_SEGORG_ID,''CFGNOT_PUBNOT_PORSRV'',cfgnot.ID)= ''SI'')');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'htp.print(:P1_NOTICIAS_TODAS);';

wwv_flow_api.create_page_plug (
  p_id=> 54652443892639289 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Todas las Noticias',
  p_region_name=>'dialog-modal',
  p_region_attributes=> 'title="Todas las Noticias"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 60053457202939040+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_2',
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 56315054478798515 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Selector de Organización',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 60050577079939038+ wwv_flow_api.g_id_offset,
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
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'USER_IS_PUBLIC_USER',
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
s:=s||'select 1 as ID'||unistr('\000a')||
'    ,  DECODE( cfgdia_codigo'||unistr('\000a')||
'             , ''VIDEO'''||unistr('\000a')||
'             , cfgdia_cuerpo'||unistr('\000a')||
'             , ''f?p=&APP_ID.:1:&SESSION.:APPLICATION_PROCESS=fondo_slide:::G_DIAPOSITIVA_ID:''||to_char(CFGDIA_ID)) as image'||unistr('\000a')||
'     , CFGDIA_TITULO as text'||unistr('\000a')||
'     , CFGDIA_OBSERVACION as url'||unistr('\000a')||
'  from CFG_PORTAL_PAGDIA_V'||unistr('\000a')||
' where CFGPOP_ID =  :P1_CFGPOP_POR_ID'||unistr('\000a')||
'   and CFGDIA_SITUACION = ''APR'''||unistr('\000a')||
'   and SITUACION = ''P';

s:=s||'UB'''||unistr('\000a')||
'   and sysdate between nvl(PUBLICACION_DESDE,sysdate) and nvl (PUBLICACION_HASTA,sysdate)'||unistr('\000a')||
'order by ORDEN';

wwv_flow_api.create_page_plug (
  p_id=> 68552918912308220 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Slide',
  p_region_name=>'slider_superior',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 60053457202939040+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_SLIDE_RWD',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => 'EXISTS',
  p_plug_display_when_condition => 'select 1'||unistr('\000a')||
'from CFG_PORTAL_PAGDIA_V'||unistr('\000a')||
'where CFGPOP_ID =  :P1_CFGPOP_POR_ID'||unistr('\000a')||
'   and CFGDIA_SITUACION = ''APR'''||unistr('\000a')||
'   and SITUACION = ''PUB'''||unistr('\000a')||
'   and sysdate between nvl(PUBLICACION_DESDE,sysdate) and nvl (PUBLICACION_HASTA,sysdate)',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'fade',
  p_attribute_02 => '800',
  p_attribute_03 => '3000',
  p_attribute_04 => 'true',
  p_attribute_05 => 'false',
  p_attribute_06 => 'true',
  p_attribute_07 => '35284E',
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
'  if :P1_SEGORG_CODIGO = ''PCYCSL'' then'||unistr('\000a')||
'    htp.p(''<style>'||unistr('\000a')||
'.fondo-gris{background-color:#F0F0F0 !important;}'||unistr('\000a')||
'.menu-14px{font-size:14px !important;}'||unistr('\000a')||
'</style>'');'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  --'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 68711903707748314 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'CSS por Organizaciones',
  p_region_name=>'CSS-ID',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 60048771788939037+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
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
 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>52460925595910264 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:62:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 0,
  p_branch_condition_type=> 'REQUEST_EQUALS_CONDITION',
  p_branch_condition=> 'BUSCAR',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>130310505446197358 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 06-ABR-2010 12:21 by ECONTRERAS');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>45817731558793976 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CFGPOP_SEC6_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 300,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
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
  p_id=>45817925519796762 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CFGPOP_SEC7_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 310,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
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
  p_id=>45818123578797690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CFGPOP_SEC8_CODIGO',
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
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
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
  p_id=>45818320990798931 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CFGPOP_SEC9_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 330,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
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
  p_id=>45818518618799975 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CFGPOP_SEC10_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 340,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
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
  p_id=>45819301581807921 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CFGPOP_SEC6_TITULO',
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
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
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
  p_id=>45819531761809093 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CFGPOP_SEC7_TITULO',
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
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
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
  p_id=>45819729604810068 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CFGPOP_SEC8_TITULO',
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
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
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
  p_id=>45819927448811084 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CFGPOP_SEC9_TITULO',
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
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
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
  p_id=>45820125507811995 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CFGPOP_SEC10_TITULO',
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
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
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
  p_id=>45820810411818967 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CFGPOP_COL1',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 490,
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
  p_id=>45821007823820179 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CFGPOP_COL2',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 500,
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
  p_id=>45821205450821323 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CFGPOP_COL3',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 510,
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
  p_id=>50269105858073929 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_ESTILO_CABECERA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 520,
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
  p_id=>50277624390143815 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CABECERA_MENSAJE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 530,
  p_item_plug_id => 50274915017990409+wwv_flow_api.g_id_offset,
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
  p_id=>52295933059898340 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_APP_THEME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 150,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'App Theme',
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
  p_id=>52480230578561726 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CUERPO_MENSAJE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 162,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Mensaje Bienvenida',
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
  p_id=>52553827263463154 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_TWITTER_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 540,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Twitter',
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
  p_id=>52604253439356346 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_TITULO_PORTAL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 161,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Titulo Portal',
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
  p_id=>52717257929613379 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CFGPOP_POR_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 160,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Mensaje Bienvenida',
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
  p_id=>52913649558025371 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CFGPOP_POR_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 163,
  p_use_cache_before_default=> 'YES',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>52913833395025373 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CFGPOP_SEC1_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 200,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
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
  p_id=>52914045464025373 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CFGPOP_SEC2_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 205,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
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
  p_id=>52914236501025373 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CFGPOP_SEC3_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 200,
  p_use_cache_before_default=> 'YES',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>52914433782025373 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CFGPOP_SEC4_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 230,
  p_use_cache_before_default=> 'YES',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>52914654397025376 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CFGPOP_SEC5_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 240,
  p_use_cache_before_default=> 'YES',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>52919652694177612 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CFGPOP_SEC1_TITULO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 250,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
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
  p_id=>52919832624177612 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CFGPOP_SEC2_TITULO',
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
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
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
  p_id=>52920057794177612 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CFGPOP_SEC3_TITULO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 270,
  p_use_cache_before_default=> 'YES',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>52920244635177612 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CFGPOP_SEC4_TITULO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 280,
  p_use_cache_before_default=> 'YES',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>52920436416177612 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CFGPOP_SEC5_TITULO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 290,
  p_use_cache_before_default=> 'YES',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>54315038696666329 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_NOTICIAS',
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
  p_id=>54653142685676806 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_NOTICIAS_TODAS',
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
  p_id=>56122200236582361 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_ENTEND_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 155,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'EntEnd Nombre',
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
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>56145612577047681 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_ENTEND_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 154,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'EntEnd ID',
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
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>56216815132595987 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_ENTEND_ID_SEL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 156,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'EntEnd ID Sel',
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
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>59881748824788943 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGORG_COPYRIGHT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 420,
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
  p_id=>68649400819351351 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_ENTEND_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 550,
  p_item_plug_id => 68711903707748314+wwv_flow_api.g_id_offset,
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
  p_id=>70313051370138647 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_AUDIO_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 430,
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
  p_id=>70317744826232884 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_AUDIO_ARCHIVO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 440,
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
  p_id=>70804933380176239 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_INTERVALO_SLIDE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 450,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Intervalo Slide',
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
  p_id=>76114358127130634 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CUERPO_MENSAJE_2',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 460,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
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
  p_id=>76114656186131606 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CUERPO_MENSAJE_3',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 470,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
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
  p_id=>76114853598132725 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CUERPO_MENSAJE_4',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 480,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
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
  p_id=>381085518800828544 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_APP_ANTERIOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 120,
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
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>381085691572830135 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_APP_ANTERIOR_PAG',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 130,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'App Anterior Pag',
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
  p_id=>381085896074831371 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_PAG_ANTERIOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 140,
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
  p_id=>403140432740119414 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGAPL_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Segapl Id',
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
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>403140644168122644 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGAPL_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Segapl Codigo',
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
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>403140819711125061 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGAPL_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Segapl Nombre',
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
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>403152326832666466 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGUSU_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Segusu Id',
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
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>403153513073719308 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGUSU_DOCUMENTO_TIPO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Segusu Documento Tipo',
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
  p_id=>403153718961720928 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGUSU_DOCUMENTO_NUMERO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 90,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Segusu Documento Numero',
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
  p_id=>403153922424721978 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGUSU_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 100,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Segusu Nombre',
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
  p_id=>403154126233723059 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGUSU_EMAIL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 110,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Segusu Email',
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
  p_id=>425194823574877114 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGORG_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Segorg Id',
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
  p_id=>425195028422878597 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGORG_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Segorg Nombre',
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
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>425195234309880222 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGORG_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 56315054478798515+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select nombre d, codigo r'||unistr('\000a')||
'from seg_organizaciones'||unistr('\000a')||
'where codigo <> ''INTERNAL''',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cattributes_element=>'align= "right" width="890px"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
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

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||':P2_TITULO_PAGINA := null;'||unistr('\000a')||
'IF nvl(:P1_SEGORG_CODIGO,''XXX'') <> nvl(:P2_SEGORG_CODIGO,''XXX'') THEN'||unistr('\000a')||
'  :P2_SEGORG_CODIGO := :P1_SEGORG_CODIGO;'||unistr('\000a')||
'END IF;';

wwv_flow_api.create_page_process(
  p_id     => 53370455487649807 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 70,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'InicializarDatos',
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
' :P1_CABECERA_MENSAJE  := null;'||unistr('\000a')||
' :P1_CFGPOP_COL1       := null;'||unistr('\000a')||
' :P1_CFGPOP_COL2       := null;'||unistr('\000a')||
' :P1_CFGPOP_COL3       := null;'||unistr('\000a')||
' :P1_CUERPO_MENSAJE    := null;'||unistr('\000a')||
' :P1_CUERPO_MENSAJE_2    := null;'||unistr('\000a')||
' :P1_CUERPO_MENSAJE_3    := null;'||unistr('\000a')||
' :P1_CUERPO_MENSAJE_4    := null;'||unistr('\000a')||
' :P1_TWITTER_CODIGO    := null;'||unistr('\000a')||
' :P1_INTERVALO_SLIDE   := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC1_';

p:=p||'CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC1_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC2_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC2_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC3_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC3_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC4_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC4_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC5_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC5_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC6_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC6_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC';

p:=p||'7_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC7_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC8_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC8_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC9_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC9_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC10_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC10_TITULO := null;'||unistr('\000a')||
' :P1_CFGPOP_POR_ID      := null;'||unistr('\000a')||
' v_opciones := 1;'||unistr('\000a')||
' if :P1_SEGORG_ID IS NOT NULL THEN'||unistr('\000a')||
'   FOR v_cfgpop IN cr_cfgpop LOOP'||unistr('\000a')||
'  IF v_cfgpop.TIPO = ''POR';

p:=p||''' THEN'||unistr('\000a')||
'    :P1_CFGPOP_POR_ID := v_cfgpop.ID;'||unistr('\000a')||
'    :P1_CFGPOP_POR_CODIGO := v_cfgpop.CODIGO;'||unistr('\000a')||
'    :P1_TITULO_PORTAL     := v_cfgpop.TITULO;'||unistr('\000a')||
'    :P1_ESTILO_CABECERA   := v_cfgpop.ESTILO_CABECERA;'||unistr('\000a')||
'    :P1_CABECERA_MENSAJE  := v_cfgpop.CABECERA_MENSAJE;'||unistr('\000a')||
'    :P1_CFGPOP_COL1       := v_cfgpop.COL1;'||unistr('\000a')||
'    :P1_CFGPOP_COL2       := v_cfgpop.COL2;'||unistr('\000a')||
'    :P1_CFGPOP_COL3       := v_cfgpop.COL3;'||unistr('\000a')||
'    :P1_CUERPO_MENSA';

p:=p||'JE    := v_cfgpop.CUERPO_MENSAJE;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE_2    := v_cfgpop.CUERPO_MENSAJE_2;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE_3    := v_cfgpop.CUERPO_MENSAJE_3;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE_4    := v_cfgpop.CUERPO_MENSAJE_4;'||unistr('\000a')||
'    :P1_TWITTER_CODIGO    := v_cfgpop.TWITTER_CODIGO;'||unistr('\000a')||
'    :P1_AUDIO_SN          := v_cfgpop.AUDIO_SN;'||unistr('\000a')||
'    :P1_AUDIO_ARCHIVO     := v_cfgpop.AUDIO_ARCHIVO;'||unistr('\000a')||
'    :P1_INTERVALO_SLIDE   := nvl(v_cf';

p:=p||'gpop.INTERVALO_SLIDE,15000);'||unistr('\000a')||
'  ELSIF v_cfgpop.TIPO IN (''PAG'',''ENL'') THEN'||unistr('\000a')||
'    CASE v_opciones '||unistr('\000a')||
'         when 1 then BEGIN :P1_CFGPOP_SEC1_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC1_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 2 then BEGIN :P1_CFGPOP_SEC2_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC2_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 3 then BEGIN :P1_CFGPOP_SEC3_CODIGO := v_cfgpop.CODIGO';

p:=p||'; :P1_CFGPOP_SEC3_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 4 then BEGIN :P1_CFGPOP_SEC4_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC4_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 5 then BEGIN :P1_CFGPOP_SEC5_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC5_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 6 then BEGIN :P1_CFGPOP_SEC6_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC6_TITULO := v_cfgpop.TITULO';

p:=p||';  END;'||unistr('\000a')||
'         when 7 then BEGIN :P1_CFGPOP_SEC7_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC7_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 8 then BEGIN :P1_CFGPOP_SEC8_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC8_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 9 then BEGIN :P1_CFGPOP_SEC9_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC9_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 10 then BEGIN :P1_CFG';

p:=p||'POP_SEC10_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC10_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'    END CASE;'||unistr('\000a')||
'    v_opciones := v_opciones + 1;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
' END LOOP; '||unistr('\000a')||
' ELSE'||unistr('\000a')||
'   FOR v_cfgpop IN cr_cfgpop2 LOOP'||unistr('\000a')||
'  IF v_cfgpop.TIPO = ''POR'' THEN'||unistr('\000a')||
'    :P1_CFGPOP_POR_ID := v_cfgpop.ID;'||unistr('\000a')||
'    :P1_CFGPOP_POR_CODIGO := v_cfgpop.CODIGO;'||unistr('\000a')||
'    :P1_TITULO_PORTAL     := v_cfgpop.TITULO;'||unistr('\000a')||
'    :P1_ESTILO_CABECERA   := v_cfgpop.ES';

p:=p||'TILO_CABECERA;'||unistr('\000a')||
'    :P1_CABECERA_MENSAJE  := v_cfgpop.CABECERA_MENSAJE;'||unistr('\000a')||
'    :P1_CFGPOP_COL1       := v_cfgpop.COL1;'||unistr('\000a')||
'    :P1_CFGPOP_COL2       := v_cfgpop.COL2;'||unistr('\000a')||
'    :P1_CFGPOP_COL3       := v_cfgpop.COL3;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE    := v_cfgpop.CUERPO_MENSAJE;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE_2    := v_cfgpop.CUERPO_MENSAJE_2;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE_3    := v_cfgpop.CUERPO_MENSAJE_3;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE_4   ';

p:=p||' := v_cfgpop.CUERPO_MENSAJE_4;'||unistr('\000a')||
'    :P1_AUDIO_SN          := v_cfgpop.AUDIO_SN;'||unistr('\000a')||
'    :P1_AUDIO_ARCHIVO     := v_cfgpop.AUDIO_ARCHIVO;'||unistr('\000a')||
'    :P1_INTERVALO_SLIDE   := nvl(v_cfgpop.INTERVALO_SLIDE,15000);'||unistr('\000a')||
'  ELSIF v_cfgpop.TIPO IN (''PAG'',''ENL'') THEN'||unistr('\000a')||
'    CASE v_opciones '||unistr('\000a')||
'         when 1 then BEGIN :P1_CFGPOP_SEC1_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC1_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 2 th';

p:=p||'en BEGIN :P1_CFGPOP_SEC2_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC2_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 3 then BEGIN :P1_CFGPOP_SEC3_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC3_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 4 then BEGIN :P1_CFGPOP_SEC4_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC4_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 5 then BEGIN :P1_CFGPOP_SEC5_CODIGO := v_cfgpop';

p:=p||'.CODIGO; :P1_CFGPOP_SEC5_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 6 then BEGIN :P1_CFGPOP_SEC6_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC6_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 7 then BEGIN :P1_CFGPOP_SEC7_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC7_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 8 then BEGIN :P1_CFGPOP_SEC8_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC8_TITULO := v_cfgpop';

p:=p||'.TITULO;  END;'||unistr('\000a')||
'         when 9 then BEGIN :P1_CFGPOP_SEC9_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC9_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
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
  p_id     => 52479358713550937 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 80,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Inicializar Portal',
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
' :P1_CABECERA_MENSAJE  := null;'||unistr('\000a')||
' :P1_CFGPOP_COL1       := null;'||unistr('\000a')||
' :P1_CFGPOP_COL2       := null;'||unistr('\000a')||
' :P1_CFGPOP_COL3       := null;'||unistr('\000a')||
' :P1_CUERPO_MENSAJE    := null;'||unistr('\000a')||
' :P1_CUERPO_MENSAJE_2    := null;'||unistr('\000a')||
' :P1_CUERPO_MENSAJE_3    := null;'||unistr('\000a')||
' :P1_CUERPO_MENSAJE_4    := null;'||unistr('\000a')||
' :P1_TWITTER_CODIGO    := null;'||unistr('\000a')||
' :P1_INTERVALO_SLIDE   := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC1_CODIGO := null; '||unistr('\000a')||
' :P1_CFGPOP_SEC1_TITU';

p:=p||'LO := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC2_CODIGO := null; '||unistr('\000a')||
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
' :P1_CFGPOP_SEC7_TI';

p:=p||'TULO := null;'||unistr('\000a')||
' :P1_CFGPOP_SEC8_CODIGO := null; '||unistr('\000a')||
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
'    :P1_CFGPOP_POR_ID := v_cfgp';

p:=p||'op.ID;'||unistr('\000a')||
'    :P1_CFGPOP_POR_CODIGO := v_cfgpop.CODIGO;'||unistr('\000a')||
'    :P1_TITULO_PORTAL     := v_cfgpop.TITULO;'||unistr('\000a')||
'    :P1_ESTILO_CABECERA   := v_cfgpop.ESTILO_CABECERA;'||unistr('\000a')||
'    :P1_CABECERA_MENSAJE  := v_cfgpop.CABECERA_MENSAJE;'||unistr('\000a')||
'    :P1_CFGPOP_COL1       := v_cfgpop.COL1;'||unistr('\000a')||
'    :P1_CFGPOP_COL2       := v_cfgpop.COL2;'||unistr('\000a')||
'    :P1_CFGPOP_COL3       := v_cfgpop.COL3;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE    := v_cfgpop.CUERPO_MENSAJE;'||unistr('\000a')||
'    ';

p:=p||':P1_CUERPO_MENSAJE_2    := v_cfgpop.CUERPO_MENSAJE_2;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE_3    := v_cfgpop.CUERPO_MENSAJE_3;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE_4    := v_cfgpop.CUERPO_MENSAJE_4;'||unistr('\000a')||
'    :P1_TWITTER_CODIGO    := v_cfgpop.TWITTER_CODIGO;'||unistr('\000a')||
'    :P1_AUDIO_SN          := v_cfgpop.AUDIO_SN;'||unistr('\000a')||
'    :P1_AUDIO_ARCHIVO     := v_cfgpop.AUDIO_ARCHIVO;'||unistr('\000a')||
'    :P1_INTERVALO_SLIDE   := nvl(v_cfgpop.INTERVALO_SLIDE,15000);'||unistr('\000a')||
'  ELSIF v';

p:=p||'_cfgpop.TIPO IN (''PAG'',''ENL'') THEN'||unistr('\000a')||
'    CASE v_opciones '||unistr('\000a')||
'         when 1 then BEGIN :P1_CFGPOP_SEC1_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC1_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 2 then BEGIN :P1_CFGPOP_SEC2_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC2_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 3 then BEGIN :P1_CFGPOP_SEC3_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC3_TITULO := v_cfgpop.T';

p:=p||'ITULO;  END;'||unistr('\000a')||
'         when 4 then BEGIN :P1_CFGPOP_SEC4_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC4_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 5 then BEGIN :P1_CFGPOP_SEC5_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC5_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 6 then BEGIN :P1_CFGPOP_SEC6_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC6_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 7 then BEGIN :P1';

p:=p||'_CFGPOP_SEC7_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC7_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 8 then BEGIN :P1_CFGPOP_SEC8_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC8_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 9 then BEGIN :P1_CFGPOP_SEC9_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC9_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 10 then BEGIN :P1_CFGPOP_SEC10_CODIGO := v_cfgpop.CODIGO; :';

p:=p||'P1_CFGPOP_SEC10_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'    END CASE;'||unistr('\000a')||
'    v_opciones := v_opciones + 1;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
' END LOOP; '||unistr('\000a')||
' ELSE'||unistr('\000a')||
'   FOR v_cfgpop IN cr_cfgpop2 LOOP'||unistr('\000a')||
'  IF v_cfgpop.TIPO = ''POR'' THEN'||unistr('\000a')||
'    :P1_CFGPOP_POR_ID := v_cfgpop.ID;'||unistr('\000a')||
'    :P1_CFGPOP_POR_CODIGO := v_cfgpop.CODIGO;'||unistr('\000a')||
'    :P1_TITULO_PORTAL     := v_cfgpop.TITULO;'||unistr('\000a')||
'    :P1_ESTILO_CABECERA   := v_cfgpop.ESTILO_CABECERA;'||unistr('\000a')||
'    :P1_CABECERA_MENSAJ';

p:=p||'E  := v_cfgpop.CABECERA_MENSAJE;'||unistr('\000a')||
'    :P1_CFGPOP_COL1       := v_cfgpop.COL1;'||unistr('\000a')||
'    :P1_CFGPOP_COL2       := v_cfgpop.COL2;'||unistr('\000a')||
'    :P1_CFGPOP_COL3       := v_cfgpop.COL3;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE    := v_cfgpop.CUERPO_MENSAJE;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE_2    := v_cfgpop.CUERPO_MENSAJE_2;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE_3    := v_cfgpop.CUERPO_MENSAJE_3;'||unistr('\000a')||
'    :P1_CUERPO_MENSAJE_4    := v_cfgpop.CUERPO_MENSAJE_4;'||unistr('\000a')||
'    :P1';

p:=p||'_AUDIO_SN          := v_cfgpop.AUDIO_SN;'||unistr('\000a')||
'    :P1_AUDIO_ARCHIVO     := v_cfgpop.AUDIO_ARCHIVO;'||unistr('\000a')||
'    :P1_INTERVALO_SLIDE   := nvl(v_cfgpop.INTERVALO_SLIDE,15000);'||unistr('\000a')||
'  ELSIF v_cfgpop.TIPO IN (''PAG'',''ENL'') THEN'||unistr('\000a')||
'    CASE v_opciones '||unistr('\000a')||
'         when 1 then BEGIN :P1_CFGPOP_SEC1_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC1_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 2 then BEGIN :P1_CFGPOP_SEC2_CODIGO := v_c';

p:=p||'fgpop.CODIGO; :P1_CFGPOP_SEC2_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 3 then BEGIN :P1_CFGPOP_SEC3_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC3_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 4 then BEGIN :P1_CFGPOP_SEC4_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC4_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 5 then BEGIN :P1_CFGPOP_SEC5_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC5_TITULO := v_c';

p:=p||'fgpop.TITULO;  END;'||unistr('\000a')||
'         when 6 then BEGIN :P1_CFGPOP_SEC6_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC6_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 7 then BEGIN :P1_CFGPOP_SEC7_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC7_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 8 then BEGIN :P1_CFGPOP_SEC8_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC8_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
'         when 9 then BE';

p:=p||'GIN :P1_CFGPOP_SEC9_CODIGO := v_cfgpop.CODIGO; :P1_CFGPOP_SEC9_TITULO := v_cfgpop.TITULO;  END;'||unistr('\000a')||
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
  p_id     => 365278406202015196 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 110,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Inicializar Portal Backup',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'',
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
p:=p||'100908393579360053';

wwv_flow_api.create_page_process(
  p_id     => 54315444583668062 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 130,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'ObtenerNoticias',
  p_process_sql_clob => 100908393579360053 + wwv_flow_api.g_id_offset,
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
