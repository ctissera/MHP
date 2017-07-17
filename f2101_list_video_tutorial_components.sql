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
--   Date and Time:   15:57 Lunes Diciembre 19, 2016
--   Exported By:     CTISSERA
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     LIST: Tutorial - Documentación Adeudada
--     LIST: Tutorial - Ordenes de Provisión
--     LIST: Tutorial - Procesos de Compras Proveedores
--     LIST: Tutorial - Menu Principal
--   Manifest End
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

-- C O M P O N E N T    E X P O R T
-- Requires Application Express 2.2 or greater
begin
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
 
 
prompt Component Export: LIST 365846001631115657
 
prompt  ...lists
--
 
begin
 
wwv_flow_api.create_list (
  p_id=> 365846001631115657 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Tutorial - Documentación Adeudada',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 365846201693115670 + wwv_flow_api.g_id_offset,
  p_list_id=> 365846001631115657 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Instructivo Documentación Adeudada',
  p_list_item_link_target=> 'javascript:abrir_video(''QJbrfOV3FEI'', ''Instructivo'');',
  p_list_item_icon=> '#WORKSPACE_IMAGES#play_video.png',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
null;
 
end;
/

 
prompt Component Export: LIST 365839602567983567
 
prompt  ...lists
--
 
begin
 
wwv_flow_api.create_list (
  p_id=> 365839602567983567 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Tutorial - Ordenes de Provisión',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 365839807901983600 + wwv_flow_api.g_id_offset,
  p_list_id=> 365839602567983567 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Instructivo Ordenes de Provisión',
  p_list_item_link_target=> 'javascript:abrir_video(''Vz9TATqtsMM'', ''Instructivo'');',
  p_list_item_icon=> '#WORKSPACE_IMAGES#play_video.png',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 365843831181043193 + wwv_flow_api.g_id_offset,
  p_list_id=> 365839602567983567 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>20,
  p_list_item_link_text=> 'Instructivo Entregas de Bienes y Servicios',
  p_list_item_link_target=> 'javascript:abrir_video(''hPOG2ybWjiU'', ''Instructivo Entregas'');',
  p_list_item_icon=> '#WORKSPACE_IMAGES#play_video.png',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
null;
 
end;
/

 
prompt Component Export: LIST 365789621625014981
 
prompt  ...lists
--
 
begin
 
wwv_flow_api.create_list (
  p_id=> 365789621625014981 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Tutorial - Procesos de Compras Proveedores',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 365789827677015003 + wwv_flow_api.g_id_offset,
  p_list_id=> 365789621625014981 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Instructivo Procesos de Compras',
  p_list_item_link_target=> 'javascript:abrir_video(''iMm2HOeXcK8'', ''Procesos de Compras Proveedores'');',
  p_list_item_icon=> '#WORKSPACE_IMAGES#play_video.png',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
null;
 
end;
/

 
prompt Component Export: LIST 365757814624407695
 
prompt  ...lists
--
 
begin
 
wwv_flow_api.create_list (
  p_id=> 365757814624407695 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Tutorial - Menu Principal',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 365758020911407718 + wwv_flow_api.g_id_offset,
  p_list_id=> 365757814624407695 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Vídeo Introducción',
  p_list_item_link_target=> 'javascript:abrir_video(''p44uLxCIOhM'', ''Vídeo Introducción'');',
  p_list_item_icon=> '#WORKSPACE_IMAGES#play_video.png',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
null;
 
end;
/

--commit;
begin
execute immediate 'begin sys.dbms_session.set_nls( param => ''NLS_NUMERIC_CHARACTERS'', value => '''''''' || replace(wwv_flow_api.g_nls_numeric_chars,'''''''','''''''''''') || ''''''''); end;';
end;
/
set verify on
set feedback on
set define on
prompt  ...done
COMMIT;
