set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end;
/
 
 
--application/set_environment
prompt  APPLICATION 2806 - Compras - Portal para Entidades Contratantes
--
-- Application Export:
--   Application:     2806
--   Name:            Compras - Portal para Entidades Contratantes
--   Date and Time:   13:28 Viernes Diciembre 2, 2016
--   Exported By:     CTISSERA
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         4.2.4.00.08
--   Instance ID:     61807403983761
--
-- Import:
--   Using Application Builder
--   or
--   Using SQL*Plus as the Oracle user APEX_040200 or as the owner (parsing schema) of the application
 
-- Application Statistics:
--   Pages:                      9
--     Items:                   48
--     Validations:             14
--     Processes:               23
--     Regions:                 39
--     Buttons:                  4
--   Shared Components:
--     Logic:
--       Items:                  4
--       Processes:             14
--     Navigation:
--       Lists:                  6
--       Breadcrumbs:            1
--         Entries:              4
--       NavBar Entries:         4
--     Security:
--       Authentication:         6
--       Authorization:          4
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                17
--         Region:              20
--         Label:                7
--         List:                15
--         Popup LOV:            1
--         Calendar:             1
--         Breadcrumb:           1
--         Button:               6
--         Report:              11
--       LOVs:                   1
--       Shortcuts:              1
--       Plug-ins:               2
--     Globalization:
--     Reports:
 
 
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
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,2806);
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
 
end;
/

--application/delete_application
 
begin
 
   -- Remove Application
wwv_flow_api.remove_flow(nvl(wwv_flow_application_install.get_application_id,2806));
 
end;
/

 
begin
 
wwv_flow_audit.remove_audit_trail(nvl(wwv_flow_application_install.get_application_id,2806));
null;
 
end;
/

prompt  ...ui types
--
 
begin
 
null;
 
end;
/

--application/create_application
 
begin
 
wwv_flow_api.create_flow(
  p_id    => nvl(wwv_flow_application_install.get_application_id,2806),
  p_display_id=> nvl(wwv_flow_application_install.get_application_id,2806),
  p_owner => nvl(wwv_flow_application_install.get_schema,'SIS_OWNER'),
  p_name  => nvl(wwv_flow_application_install.get_application_name,'Compras - Portal para Entidades Contratantes'),
  p_alias => nvl(wwv_flow_application_install.get_application_alias,'ECOCOM_POR'),
  p_application_group=>1662703474330575,
  p_application_group_name=>'Compras',
  p_application_group_comment=>'',
  p_page_view_logging => 'YES',
  p_page_protection_enabled_y_n=> 'Y',
  p_checksum_salt_last_reset => '20161202132845',
  p_max_session_length_sec=> 43200,
  p_compatibility_mode=> '4.2',
  p_html_escaping_mode=> 'E',
  p_flow_language=> 'es-ar',
  p_flow_language_derived_from=> '0',
  p_allow_feedback_yn=> 'N',
  p_date_format=> 'DD/MM/YYYY HH24:MI:SS',
  p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,''),
  p_publish_yn=> 'N',
  p_documentation_banner=> '',
  p_authentication=> 'PLUGIN',
  p_authentication_id=> 62527623376800809 + wwv_flow_api.g_id_offset,
  p_logout_url=> 'wwv_flow_custom_auth_std.logout?p_this_flow=&APP_ID.&p_next_flow_page_sess=&APP_ID.:101',
  p_application_tab_set=> 1,
  p_logo_image => '#WORKSPACE_IMAGES#Logo_&P1_SEGORG_CODIGO..png',
  p_public_url_prefix => '',
  p_public_user=> 'APEX_PUBLIC_USER',
  p_dbauth_url_prefix => '',
  p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,''),
  p_cust_authentication_process=> '',
  p_cust_authentication_page=> '',
  p_flow_version=> 'Versión 4.2',
  p_flow_status=> 'AVAILABLE_W_EDIT_LINK',
  p_flow_unavailable_text=> 'Esta aplicación no está disponible en este momento.',
  p_build_status=> 'RUN_AND_BUILD',
  p_exact_substitutions_only=> 'Y',
  p_browser_cache=>'Y',
  p_browser_frame=>'A',
  p_deep_linking=>'Y',
  p_vpd=> '',
  p_vpd_teardown_code=> '',
  p_authorize_public_pages_yn=>'Y',
  p_csv_encoding=> 'Y',
  p_auto_time_zone=> 'N',
  p_include_legacy_javascript=> 'Y',
  p_default_error_display_loc=> 'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_substitution_string_01 => 'MSJ_COPYRIGHT',
  p_substitution_value_01  => '&P1_SEGORG_COPYRIGHT.',
  p_last_updated_by => 'CTISSERA',
  p_last_upd_yyyymmddhh24miss=> '20161202132845',
  p_ui_type_name => null,
  p_required_roles=> wwv_flow_utilities.string_to_table2(''));
 
 
end;
/

----------------
--package app map
--
prompt  ...user interfaces
--
 
begin
 
--application/user interface/desktop
wwv_flow_api.create_user_interface (
  p_id => 170453256197545135 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_ui_type_name => 'DESKTOP'
 ,p_display_name => 'Desktop'
 ,p_display_seq => 10
 ,p_use_auto_detect => true
 ,p_is_default => true
 ,p_theme_id => 105
 ,p_home_url => 'f?p=&APP_ID.:1:&SESSION.'
 ,p_login_url => 'f?p=&APP_ID.:101:&SESSION.'
 ,p_global_page_id => 0
  );
null;
 
end;
/

prompt  ...plug-in settings
--
 
begin
 
--application/plug-in setting/authentication_type_native_apex_accounts
wwv_flow_api.create_plugin_setting (
  p_id => 66985319142383782 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHENTICATION TYPE'
 ,p_plugin => 'NATIVE_APEX_ACCOUNTS'
  );
--application/plug-in setting/authentication_type_native_custom
wwv_flow_api.create_plugin_setting (
  p_id => 66985420087383790 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHENTICATION TYPE'
 ,p_plugin => 'NATIVE_CUSTOM'
  );
--application/plug-in setting/authentication_type_native_dad
wwv_flow_api.create_plugin_setting (
  p_id => 66985527317383790 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHENTICATION TYPE'
 ,p_plugin => 'NATIVE_DAD'
  );
--application/plug-in setting/authentication_type_native_db_accounts
wwv_flow_api.create_plugin_setting (
  p_id => 66985630058383792 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHENTICATION TYPE'
 ,p_plugin => 'NATIVE_DB_ACCOUNTS'
  );
--application/plug-in setting/authentication_type_native_http_header_variable
wwv_flow_api.create_plugin_setting (
  p_id => 66985718183383792 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHENTICATION TYPE'
 ,p_plugin => 'NATIVE_HTTP_HEADER_VARIABLE'
  );
--application/plug-in setting/authentication_type_native_ias_sso
wwv_flow_api.create_plugin_setting (
  p_id => 66985825462383792 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHENTICATION TYPE'
 ,p_plugin => 'NATIVE_IAS_SSO'
  );
--application/plug-in setting/authentication_type_native_ldap
wwv_flow_api.create_plugin_setting (
  p_id => 66985913169383792 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHENTICATION TYPE'
 ,p_plugin => 'NATIVE_LDAP'
  );
--application/plug-in setting/authentication_type_native_open_door
wwv_flow_api.create_plugin_setting (
  p_id => 66986023820383792 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHENTICATION TYPE'
 ,p_plugin => 'NATIVE_OPEN_DOOR'
  );
--application/plug-in setting/authorization_type_native_exists
wwv_flow_api.create_plugin_setting (
  p_id => 66986123579383792 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_plugin => 'NATIVE_EXISTS'
  );
--application/plug-in setting/authorization_type_native_function_body
wwv_flow_api.create_plugin_setting (
  p_id => 66986209660383792 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_plugin => 'NATIVE_FUNCTION_BODY'
  );
--application/plug-in setting/authorization_type_native_item_equals_value
wwv_flow_api.create_plugin_setting (
  p_id => 66986307738383792 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_plugin => 'NATIVE_ITEM_EQUALS_VALUE'
  );
--application/plug-in setting/authorization_type_native_item_is_not_null
wwv_flow_api.create_plugin_setting (
  p_id => 66986432178383792 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_plugin => 'NATIVE_ITEM_IS_NOT_NULL'
  );
--application/plug-in setting/authorization_type_native_item_is_null
wwv_flow_api.create_plugin_setting (
  p_id => 66986520276383792 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_plugin => 'NATIVE_ITEM_IS_NULL'
  );
--application/plug-in setting/authorization_type_native_item_not_equals_value
wwv_flow_api.create_plugin_setting (
  p_id => 66986609071383792 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_plugin => 'NATIVE_ITEM_NOT_EQUALS_VALUE'
  );
--application/plug-in setting/authorization_type_native_not_exists
wwv_flow_api.create_plugin_setting (
  p_id => 66986716767383792 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_plugin => 'NATIVE_NOT_EXISTS'
  );
--application/plug-in setting/authorization_type_native_pref_equals_value
wwv_flow_api.create_plugin_setting (
  p_id => 66986805866383792 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_plugin => 'NATIVE_PREF_EQUALS_VALUE'
  );
--application/plug-in setting/authorization_type_native_pref_not_equals_value
wwv_flow_api.create_plugin_setting (
  p_id => 66986917395383792 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_plugin => 'NATIVE_PREF_NOT_EQUALS_VALUE'
  );
--application/plug-in setting/dynamic_action_native_add_class
wwv_flow_api.create_plugin_setting (
  p_id => 66987031142383792 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_ADD_CLASS'
  );
--application/plug-in setting/dynamic_action_native_alert
wwv_flow_api.create_plugin_setting (
  p_id => 66987106995383793 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_ALERT'
  );
--application/plug-in setting/dynamic_action_native_cancel_event
wwv_flow_api.create_plugin_setting (
  p_id => 66987221343383793 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_CANCEL_EVENT'
  );
--application/plug-in setting/dynamic_action_native_clear
wwv_flow_api.create_plugin_setting (
  p_id => 66987324361383793 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_CLEAR'
  );
--application/plug-in setting/dynamic_action_native_confirm
wwv_flow_api.create_plugin_setting (
  p_id => 66987419799383793 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_CONFIRM'
  );
--application/plug-in setting/dynamic_action_native_disable
wwv_flow_api.create_plugin_setting (
  p_id => 66987500593383795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_DISABLE'
  );
--application/plug-in setting/dynamic_action_native_enable
wwv_flow_api.create_plugin_setting (
  p_id => 66987611885383795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_ENABLE'
  );
--application/plug-in setting/dynamic_action_native_execute_plsql_code
wwv_flow_api.create_plugin_setting (
  p_id => 66987729901383795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_EXECUTE_PLSQL_CODE'
  );
--application/plug-in setting/dynamic_action_native_hide
wwv_flow_api.create_plugin_setting (
  p_id => 66987806276383795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_HIDE'
  );
--application/plug-in setting/dynamic_action_native_javascript_code
wwv_flow_api.create_plugin_setting (
  p_id => 66987901967383795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_JAVASCRIPT_CODE'
  );
--application/plug-in setting/dynamic_action_native_refresh
wwv_flow_api.create_plugin_setting (
  p_id => 66988019429383795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_REFRESH'
  );
--application/plug-in setting/dynamic_action_native_remove_class
wwv_flow_api.create_plugin_setting (
  p_id => 66988123869383795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_REMOVE_CLASS'
  );
--application/plug-in setting/dynamic_action_native_set_css
wwv_flow_api.create_plugin_setting (
  p_id => 66988206049383795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_SET_CSS'
  );
--application/plug-in setting/dynamic_action_native_set_focus
wwv_flow_api.create_plugin_setting (
  p_id => 66988301697383795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_SET_FOCUS'
  );
--application/plug-in setting/dynamic_action_native_set_value
wwv_flow_api.create_plugin_setting (
  p_id => 66988411805383795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_SET_VALUE'
  );
--application/plug-in setting/dynamic_action_native_show
wwv_flow_api.create_plugin_setting (
  p_id => 66988519897383795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_SHOW'
  );
--application/plug-in setting/dynamic_action_native_submit_page
wwv_flow_api.create_plugin_setting (
  p_id => 66988625417383795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_SUBMIT_PAGE'
  );
--application/plug-in setting/item_type_native_auto_complete
wwv_flow_api.create_plugin_setting (
  p_id => 66988723792383795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_AUTO_COMPLETE'
  );
--application/plug-in setting/item_type_native_checkbox
wwv_flow_api.create_plugin_setting (
  p_id => 66988830268383795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_CHECKBOX'
  );
--application/plug-in setting/item_type_native_color_picker
wwv_flow_api.create_plugin_setting (
  p_id => 66988920509383795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_COLOR_PICKER'
  );
--application/plug-in setting/item_type_native_date_picker
wwv_flow_api.create_plugin_setting (
  p_id => 66989000546383795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_DATE_PICKER'
  );
--application/plug-in setting/item_type_native_date_picker_classic
wwv_flow_api.create_plugin_setting (
  p_id => 66989102267383795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_DATE_PICKER_CLASSIC'
  );
--application/plug-in setting/item_type_native_date_picker_html5
wwv_flow_api.create_plugin_setting (
  p_id => 66989206852383795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_DATE_PICKER_HTML5'
  );
--application/plug-in setting/item_type_native_display_image
wwv_flow_api.create_plugin_setting (
  p_id => 66989313791383795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_DISPLAY_IMAGE'
  );
--application/plug-in setting/item_type_native_display_only
wwv_flow_api.create_plugin_setting (
  p_id => 66989432526383795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_DISPLAY_ONLY'
  );
--application/plug-in setting/item_type_native_file
wwv_flow_api.create_plugin_setting (
  p_id => 66989510286383795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_FILE'
  );
--application/plug-in setting/item_type_native_hidden
wwv_flow_api.create_plugin_setting (
  p_id => 66989616480383795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_HIDDEN'
  );
--application/plug-in setting/item_type_native_list_manager
wwv_flow_api.create_plugin_setting (
  p_id => 66989708777383795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_LIST_MANAGER'
  );
--application/plug-in setting/item_type_native_number_field
wwv_flow_api.create_plugin_setting (
  p_id => 66989820372383795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_NUMBER_FIELD'
  );
--application/plug-in setting/item_type_native_password
wwv_flow_api.create_plugin_setting (
  p_id => 66989905281383795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_PASSWORD'
  );
--application/plug-in setting/item_type_native_popup_lov
wwv_flow_api.create_plugin_setting (
  p_id => 66990008432383795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_POPUP_LOV'
  );
--application/plug-in setting/item_type_native_radiogroup
wwv_flow_api.create_plugin_setting (
  p_id => 66990102039383795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_RADIOGROUP'
  );
--application/plug-in setting/item_type_native_rich_text_editor
wwv_flow_api.create_plugin_setting (
  p_id => 66990205773383796 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_RICH_TEXT_EDITOR'
  );
--application/plug-in setting/item_type_native_select_list
wwv_flow_api.create_plugin_setting (
  p_id => 66990306515383796 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_SELECT_LIST'
  );
--application/plug-in setting/item_type_native_shuttle
wwv_flow_api.create_plugin_setting (
  p_id => 66990411475383796 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_SHUTTLE'
  );
--application/plug-in setting/item_type_native_slider
wwv_flow_api.create_plugin_setting (
  p_id => 66990513715383796 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_SLIDER'
  );
--application/plug-in setting/item_type_native_stop_and_start_html_table
wwv_flow_api.create_plugin_setting (
  p_id => 66990603859383796 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_STOP_AND_START_HTML_TABLE'
  );
--application/plug-in setting/item_type_native_textarea
wwv_flow_api.create_plugin_setting (
  p_id => 66990732327383796 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_TEXTAREA'
  );
--application/plug-in setting/item_type_native_text_field
wwv_flow_api.create_plugin_setting (
  p_id => 66990821108383796 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_TEXT_FIELD'
  );
--application/plug-in setting/item_type_native_text_with_calculator
wwv_flow_api.create_plugin_setting (
  p_id => 66990919920383796 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_TEXT_WITH_CALCULATOR'
  );
--application/plug-in setting/process_type_native_load_uploaded_data
wwv_flow_api.create_plugin_setting (
  p_id => 66991125406383798 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_plugin => 'NATIVE_LOAD_UPLOADED_DATA'
  );
--application/plug-in setting/process_type_native_parse_uploaded_data
wwv_flow_api.create_plugin_setting (
  p_id => 66991206167383798 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_plugin => 'NATIVE_PARSE_UPLOADED_DATA'
  );
--application/plug-in setting/process_type_native_prepare_uploaded_data
wwv_flow_api.create_plugin_setting (
  p_id => 66991318085383798 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_plugin => 'NATIVE_PREPARE_UPLOADED_DATA'
  );
--application/plug-in setting/process_type_native_send_email
wwv_flow_api.create_plugin_setting (
  p_id => 66991413729383798 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_plugin => 'NATIVE_SEND_EMAIL'
  );
--application/plug-in setting/region_type_native_data_upload_column_mapping
wwv_flow_api.create_plugin_setting (
  p_id => 66991510838383798 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_plugin => 'NATIVE_DATA_UPLOAD_COLUMN_MAPPING'
  );
--application/plug-in setting/region_type_native_jqm_list_view
wwv_flow_api.create_plugin_setting (
  p_id => 66991629670383798 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_plugin => 'NATIVE_JQM_LIST_VIEW'
  );
--application/plug-in setting/item_type_native_yes_no
wwv_flow_api.create_plugin_setting (
  p_id => 170385032706702538 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_YES_NO'
 ,p_attribute_01 => 'Y'
 ,p_attribute_03 => 'N'
  );
null;
 
end;
/

prompt  ...authorization schemes
--
 
begin
 
--application/shared_components/security/authorization/com_gesprv_trmges
wwv_flow_api.create_security_scheme (
  p_id => 76028231631522937 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'COM_GESPRV_TRMGES'
 ,p_scheme_type => 'NATIVE_FUNCTION_BODY'
 ,p_attribute_01 => 'return SEG_PKG.AUTO_USUROL(v(''APP_USER''), ''ADMCOM_PRVTRM_GES'');'
 ,p_error_message => 'No se encuentra autorizado para acceder a esta opción'
 ,p_caching => 'BY_USER_BY_PAGE_VIEW'
  );
--application/shared_components/security/authorization/com_gesprv_regges
wwv_flow_api.create_security_scheme (
  p_id => 76028401642552000 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'COM_GESPRV_REGGES'
 ,p_scheme_type => 'NATIVE_FUNCTION_BODY'
 ,p_attribute_01 => 'RETURN SEG_PKG.AUTO_USUROL(v(''APP_USER''),''ADMCOM_PRVREG_GES'');'
 ,p_error_message => 'No se encuentra autorizado para acceder a esta opción.'
 ,p_caching => 'BY_USER_BY_PAGE_VIEW'
  );
--application/shared_components/security/authorization/cat_gespar_con
wwv_flow_api.create_security_scheme (
  p_id => 209487964918106433 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'CAT_GESPAR_CON'
 ,p_scheme_type => 'NATIVE_FUNCTION_BODY'
 ,p_attribute_01 => 'RETURN SEG_PKG.AUTO_USUROL(v(''APP_USER''),''CAT_GESPAR_CON'')'
 ,p_error_message => 'No se encuentra autorizado para acceder a esta opción.'
 ,p_caching => 'BY_USER_BY_PAGE_VIEW'
  );
--application/shared_components/security/authorization/pry_gespla
wwv_flow_api.create_security_scheme (
  p_id => 209773169179901325 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'PRY_GESPLA'
 ,p_scheme_type => 'NATIVE_FUNCTION_BODY'
 ,p_attribute_01 => 'RETURN SEG_PKG.AUTO_USUROL(v(''APP_USER''),''PRY_GESPLA'');'
 ,p_error_message => 'No se encuentra autorizado para acceder a esta opción.'
 ,p_caching => 'BY_USER_BY_PAGE_VIEW'
  );
 
end;
/

--application/shared_components/navigation/navigation_bar
prompt  ...navigation bar entries
--
 
begin
 
wwv_flow_api.create_icon_bar_item(
  p_id => 170430945592275953 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_icon_sequence=> 5,
  p_icon_image => '',
  p_icon_subtext=> '<span id="alert" class="msjico msjico-sin" ><i class="fa fa-bell"></i><span class="msjnro"></span></span>',
  p_icon_target=> 'f?p=SRVMSJ:600:&SESSION.::::G_APP_ANTERIOR,G_APP_ANTERIOR_PAG:&APP_ID.,&APP_PAGE_ID.',
  p_icon_image_alt=> '',
  p_icon_height=> null,
  p_icon_width=> null,
  p_icon_height2=> null,
  p_icon_width2=> null,
  p_nav_entry_is_feedback_yn => 'N',
  p_icon_bar_disp_cond=> '',
  p_icon_bar_disp_cond_type=> 'NEVER',
  p_begins_on_new_line=> 'NO',
  p_cell_colspan      => 1,
  p_onclick=> '',
  p_icon_bar_comment=> '');
 
wwv_flow_api.create_icon_bar_item(
  p_id => 519747624827040446 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_icon_sequence=> 10,
  p_icon_image => '',
  p_icon_subtext=> '( <u style="font-size:11px;">Desconectar</u> )',
  p_icon_target=> '&LOGOUT_URL.',
  p_icon_image_alt=> 'Desconectar',
  p_icon_height=> 32,
  p_icon_width=> 32,
  p_icon_height2=> 24,
  p_icon_width2=> 24,
  p_nav_entry_is_feedback_yn => 'N',
  p_icon_bar_disp_cond=> '',
  p_icon_bar_disp_cond_type=> 'NEVER',
  p_begins_on_new_line=> 'NO',
  p_cell_colspan      => 1,
  p_onclick=> '',
  p_icon_bar_comment=> '');
 
wwv_flow_api.create_icon_bar_item(
  p_id => 341100316539902163 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_icon_sequence=> 20,
  p_icon_image => '',
  p_icon_subtext=> 'Cambiar Contraseña',
  p_icon_target=> 'f?p=&APP_ID.:103:&SESSION.::&DEBUG.:103:::',
  p_icon_image_alt=> 'Cambiar Contraseña',
  p_icon_height=> null,
  p_icon_width=> null,
  p_icon_height2=> null,
  p_icon_width2=> null,
  p_nav_entry_is_feedback_yn => 'N',
  p_icon_bar_disp_cond=> '',
  p_icon_bar_disp_cond_type=> 'NEVER',
  p_begins_on_new_line=> 'NO',
  p_cell_colspan      => 1,
  p_onclick=> '',
  p_icon_bar_comment=> '');
 
wwv_flow_api.create_icon_bar_item(
  p_id => 519761943274897268 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_icon_sequence=> 30,
  p_icon_image => '',
  p_icon_subtext=> 'Términos de Uso',
  p_icon_target=> 'javascript:popupURL(''f?p=&APP_ID.:102:&SESSION.'');',
  p_icon_image_alt=> 'Términos de Uso',
  p_icon_height=> null,
  p_icon_width=> null,
  p_icon_height2=> null,
  p_icon_width2=> null,
  p_nav_entry_is_feedback_yn => 'N',
  p_icon_bar_disp_cond=> '101,102',
  p_icon_bar_disp_cond_type=> 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_begins_on_new_line=> 'NO',
  p_cell_colspan      => 1,
  p_onclick=> '',
  p_icon_bar_comment=> '');
 
 
end;
/

prompt  ...application processes
--
--application/shared_components/logic/application_processes/cargardatosusuario
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'declare'||unistr('\000a')||
'  v_segusu seg_usuarios%rowtype;'||unistr('\000a')||
'  v_segprs seg_personas%rowtype;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  SEG_PKG.SET_SEGUSU_USUARIO(p_usuario => v(''APP_USER''));'||unistr('\000a')||
'  SEG_PKG.GET_SEGUSU(p_segusu => v_segusu);'||unistr('\000a')||
'  SEG_PKG.INI_SEGUSU;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  SEG_PKG.SET_SEGPRS_SEGUSU_ID(p_segusu_id => v_segusu.ID);'||unistr('\000a')||
'  SEG_PKG.GET_SEGPRS(p_segprs => v_segprs);'||unistr('\000a')||
'  SEG_PKG.INI_SEGPRS;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  :P1_SEGUSU_ID := v_segusu.ID;'||unistr('\000a')||
'  --   '||unistr('\000a')||
'  :P1_SEGUSU_DOCUMEN';

p:=p||'TO_TIPO   := v_segprs.TIPO_DOCUMENTO;'||unistr('\000a')||
'  :P1_SEGUSU_DOCUMENTO_NUMERO := v_segprs.NUMERO_DOCUMENTO;'||unistr('\000a')||
'  :P1_SEGUSU_NOMBRE := InitCap(ltrim(rtrim(v_segprs.NOMBRE)));'||unistr('\000a')||
'  :P1_SEGUSU_EMAIL  := v_segprs.EMAIL;'||unistr('\000a')||
'  --'||unistr('\000a')||
'end;';

wwv_flow_api.create_flow_process(
  p_id => 497718033926597828 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 10,
  p_process_point => 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'CargarDatosUsuario',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '101',
  p_process_when_type=> 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/cargarorganizacionusuario
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'declare'||unistr('\000a')||
'  v_segorg seg_organizaciones%rowtype;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  SEG_PKG.SET_SEGORG(p_id => SEG_PKG.OBTN_ORGUSU(v(''APP_USER'')));'||unistr('\000a')||
'  SEG_PKG.GET_SEGORG(p_segorg => v_segorg);'||unistr('\000a')||
'  SEG_PKG.INI_SEGORG;'||unistr('\000a')||
'  :P1_SEGORG_ID     := v_segorg.ID;'||unistr('\000a')||
'  :P1_SEGORG_CODIGO := v_segorg.CODIGO;'||unistr('\000a')||
'  :P1_SEGORG_NOMBRE := v_segorg.NOMBRE;'||unistr('\000a')||
'  :P1_SEGORG_COPYRIGHT:=v_segorg.COPYRIGHT_TEXTO;'||unistr('\000a')||
'end;';

wwv_flow_api.create_flow_process(
  p_id => 497715126551463222 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 20,
  p_process_point => 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'CargarOrganizacionUsuario',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '101',
  p_process_when_type=> 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/inicializaraplicación
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||':P1_SEGAPL_CODIGO := v(''APP_ALIAS'');';

wwv_flow_api.create_flow_process(
  p_id => 341093022183686168 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 40,
  p_process_point => 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'InicializarAplicación',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/cargardatosaplicación
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'declare'||unistr('\000a')||
'  v_segapl seg_aplicaciones%rowtype;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  if :P1_SEGAPL_CODIGO is null then'||unistr('\000a')||
'    raise_application_error(-20000,''Debe indicar el Código de la Aplicación'');'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  SEG_PKG.SET_SEGAPL_CODIGO(p_codigo => :P1_SEGAPL_CODIGO);'||unistr('\000a')||
'  SEG_PKG.GET_SEGAPL(p_segapl => v_segapl);'||unistr('\000a')||
'  SEG_PKG.INI_SEGAPL;'||unistr('\000a')||
'  if v_segapl.ID is null then'||unistr('\000a')||
'    raise_application_error(-20000,''El Código :''||:P1_SEGAPL_CODIGO|';

p:=p||'|'' de la Aplicación indicada es incorrecto.'');'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  :P1_SEGAPL_ID     := v_segapl.ID;'||unistr('\000a')||
'  :P1_SEGAPL_NOMBRE := v_segapl.NOMBRE;'||unistr('\000a')||
'end;';

wwv_flow_api.create_flow_process(
  p_id => 497706720394016673 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 50,
  p_process_point => 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'CargarDatosAplicación',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/cambiarentidadcontratante
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'declare'||unistr('\000a')||
'  --'||unistr('\000a')||
'  cursor cr_comeco is'||unistr('\000a')||
'  select CODIGO'||unistr('\000a')||
'    from COM_CONTRATANTES'||unistr('\000a')||
'   where ID = :P110_COMECO_ID_SEL;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_segusu seg_usuarios%rowtype;'||unistr('\000a')||
'  v_segprs seg_personas%rowtype;'||unistr('\000a')||
'  v_comeco_codigo varchar2(250);'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
' if :P110_SEGUSU_ID_SEL is not null then  '||unistr('\000a')||
'  SEG_PKG.SET_SEGPRS_SEGUSU_ID(p_segusu_id => :P110_SEGUSU_ID_SEL);'||unistr('\000a')||
'  SEG_PKG.GET_SEGPRS(p_segprs => v_segprs);'||unistr('\000a')||
'  SEG_PKG.INI_SEGP';

p:=p||'RS;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  :P1_SEGUSU_ID := :P110_SEGUSU_ID_SEL;'||unistr('\000a')||
'  :P1_COMECO_ID := :P110_COMECO_ID_SEL; '||unistr('\000a')||
'  --'||unistr('\000a')||
'  open cr_comeco;'||unistr('\000a')||
'  fetch cr_comeco into v_comeco_codigo;'||unistr('\000a')||
'  close cr_comeco;   '||unistr('\000a')||
'  --'||unistr('\000a')||
'  :P1_SEGUSU_DOCUMENTO_TIPO   := v_segprs.TIPO_DOCUMENTO;'||unistr('\000a')||
'  :P1_SEGUSU_DOCUMENTO_NUMERO := v_segprs.NUMERO_DOCUMENTO;'||unistr('\000a')||
'  :P1_SEGUSU_NOMBRE := InitCap(ltrim(rtrim(v_segprs.NOMBRE)));'||unistr('\000a')||
'  :P1_SEGUSU_EMAIL  := v_segprs.EMAIL;'||unistr('\000a')||
'';

p:=p||'  --'||unistr('\000a')||
'  :P101_USERNAME := :P101_SEGORG_CODIGO||''.''||:P101_SEGUSU_TIPO||''.''||v_comeco_codigo||''.''||:P1_SEGUSU_DOCUMENTO_TIPO||''.''||:P1_SEGUSU_DOCUMENTO_NUMERO;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  --Cambio usuario en APEX'||unistr('\000a')||
'  wwv_flow.g_user := :P101_USERNAME;'||unistr('\000a')||
'  --'||unistr('\000a')||
' end if;'||unistr('\000a')||
' --'||unistr('\000a')||
'end;';

wwv_flow_api.create_flow_process(
  p_id => 63304007524640245 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'CambiarEntidadContratante',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/obtenernoticiasslide
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'declare'||unistr('\000a')||
'  v_script varchar2(30000);'||unistr('\000a')||
'  v_noticias varchar2(10000);'||unistr('\000a')||
'  cursor cr_datos is'||unistr('\000a')||
'  select noticia, nvl(date_modified,date_created) fecha, nvl(modified_by_nombre,created_by_nombre) usuario'||unistr('\000a')||
'  from cfg_noticias_v'||unistr('\000a')||
'  where situacion = ''VIG'';'||unistr('\000a')||
'begin'||unistr('\000a')||
' v_script :=''<div class="slide"><div class="contenedor"><ul class="noticias">'';'||unistr('\000a')||
'for v_datos in cr_datos loop'||unistr('\000a')||
'  v_noticias := ''<li>''||v_datos.noticia||''';

p:=p||'<span> - ''||to_char(v_datos.fecha,''Day dd Month yyyy hh24:mi'')||''</span></li>'';'||unistr('\000a')||
'  v_script := v_script || v_noticias;'||unistr('\000a')||
'end loop;'||unistr('\000a')||
'v_script := v_script || ''</ul></div></div>'';'||unistr('\000a')||
'  :P1_NOTICIAS_SLIDE := v_script;'||unistr('\000a')||
'end;';

wwv_flow_api.create_flow_process(
  p_id => 170405960972919328 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ObtenerNoticiasSlide',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/msjenv_verificar
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'declare'||unistr('\000a')||
'  cursor cr_msjenv is'||unistr('\000a')||
'  select count(ID) MSJ_SIN_LEER'||unistr('\000a')||
'    from msj_envios_vu'||unistr('\000a')||
'   where FECHA_APERTURA is null;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_dummy NUMBER;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
'  OPEN cr_msjenv;'||unistr('\000a')||
'  FETCH cr_msjenv INTO v_dummy;'||unistr('\000a')||
'  CLOSE cr_msjenv;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  htp.prn(v_dummy);'||unistr('\000a')||
'  --'||unistr('\000a')||
'end;'||unistr('\000a')||
'';

wwv_flow_api.create_flow_process(
  p_id => 170406543503927386 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'msjenv_verificar',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/obtenernoticias
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'declare'||unistr('\000a')||
'  v_script varchar2(30000);'||unistr('\000a')||
'  v_script_1 varchar2(30000);'||unistr('\000a')||
'  v_noticias varchar2(10000);'||unistr('\000a')||
'  v_noticias_todas varchar2(10000);'||unistr('\000a')||
'  cursor cr_datos is'||unistr('\000a')||
'  select replace(replace(replace(replace(noticia,''WORKSPACE_IMAGES'',''#WORKSPACE_IMAGES#''),''"'',''\u0022''),''SESSION'',v(''SESSION'')),chr(10),''<br>'') noticia'||unistr('\000a')||
'        ,replace(replace(replace(replace(noticia,''WORKSPACE_IMAGES'',''#WORKSPACE_IMAGES#''),''\u00';

p:=p||'22'',''"''),''SESSION'',v(''SESSION'')),chr(10),''<br>'') noticia_todas'||unistr('\000a')||
'       , nvl(date_modified,date_created) fecha'||unistr('\000a')||
'       , nvl(modified_by,created_by) usuario'||unistr('\000a')||
'  from cfg_noticias_v'||unistr('\000a')||
'  where sysdate between nvl(fecha_desde,sysdate) and nvl(fecha_hasta,sysdate)'||unistr('\000a')||
'  and situacion = ''VIG'''||unistr('\000a')||
'  and (CFG_BI_PKG.CFGNOT_SEGPFL_AUTHO(:P1_SEGORG_ID,''CATNOT_PUBNOT_GENERAL'',ID) = ''SI'' or'||unistr('\000a')||
'       CFG_BI_PKG.CFGNOT_SEGPFL';

p:=p||'_AUTHO(:P1_SEGORG_ID,''CFGNOT_PUBNOT_PORECO'',ID) = ''SI'' or'||unistr('\000a')||
'       CFG_BI_PKG.CFGNOT_SEGUSU_AUTHO(:P1_SEGUSU_ID,ID) = ''SI'');'||unistr('\000a')||
'begin'||unistr('\000a')||
' v_script :=''<div style="float:left"><span id="newsticker"></span><script type="text/javascript">(function(){var lNewsList = ['';'||unistr('\000a')||
'for v_datos in cr_datos loop'||unistr('\000a')||
'  v_noticias := ''"''||v_datos.noticia||''<span style=\u0022color:#808080;\u0022> -  Publicado el: ''||to_char(v_dato';

p:=p||'s.fecha,''Day dd Month yyyy hh24:mi'')||''</span>",'';'||unistr('\000a')||
'  v_script:=v_script||v_noticias;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_noticias_todas := ''<p style="border-bottom:1px dotted; padding-bottom:10px;">''||v_datos.noticia_todas||''<span style="color:#808080;"> -  Publicado el: ''||to_char(v_datos.fecha,''Day dd Month yyyy hh24:mi'')||''</span></p>'';'||unistr('\000a')||
'  v_script_1:=v_script_1||v_noticias_todas;'||unistr('\000a')||
'end loop;'||unistr('\000a')||
' v_script:=substr(v_script,1,le';

p:=p||'ngth(v_script)-1);'||unistr('\000a')||
' v_script:=v_script||''];NewsTicker(apex.jQuery("#newsticker"), lNewsList, 6, "slow");})();</script></div>'';'||unistr('\000a')||
' :P1_NOTICIAS := v_script;'||unistr('\000a')||
' --'||unistr('\000a')||
' v_script_1:=substr(v_script_1,1,length(v_script_1)-1);'||unistr('\000a')||
' v_script_1:=v_script_1; '||unistr('\000a')||
' :P1_NOTICIAS_TODAS := v_script_1;'||unistr('\000a')||
'  '||unistr('\000a')||
'end;';

wwv_flow_api.create_flow_process(
  p_id => 209457879565875335 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ObtenerNoticias',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/globalnotification
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'declare'||unistr('\000a')||
'  v_segcfg_valor seg_configuraciones.VALOR%type;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  v_segcfg_valor := SEG_PKG.OBTN_SEGCFG_VALOR(p_segorg_id => :P1_SEGORG_ID, p_codigo =>''GLOBAL_NOTIFICATION'');'||unistr('\000a')||
'  if v_segcfg_valor is not null and'||unistr('\000a')||
'     upper(v_segcfg_valor) <> ''NULL'' then'||unistr('\000a')||
'apex_application.g_global_notification:= ''<section class="uRegion uNoHeading clearfix"><div class="uRegionContent clearfix">''||v_segcfg_valor||''</di';

p:=p||'v></section>'';'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_flow_process(
  p_id => 209458156494878145 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'GlobalNotification',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/inicializarambiente
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'declare'||unistr('\000a')||
'  --'||unistr('\000a')||
'  cursor cr_segamb is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from seg_ambientes;'||unistr('\000a')||
'  v_segamb seg_ambientes%rowtype;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  cursor cr_segorg (p_segorg_id in number) is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from seg_organizaciones'||unistr('\000a')||
'  where id = p_segorg_id;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  cursor cr_segorg2 (p_segorg_codigo in varchar2) is'||unistr('\000a')||
'  select *'||unistr('\000a')||
'  from seg_organizaciones'||unistr('\000a')||
'  where codigo = p_segorg_codigo;'||unistr('\000a')||
''||unistr('\000a')||
'  v_segorg seg_organizaciones%rowtype;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
'  op';

p:=p||'en cr_segamb;'||unistr('\000a')||
'  fetch cr_segamb into v_segamb;'||unistr('\000a')||
'  close cr_segamb;'||unistr('\000a')||
'  -- Setear el tipo de ambiente'||unistr('\000a')||
'  :G_SEGAMB_TIPO := v_segamb.TIPO;'||unistr('\000a')||
'  -- Si el codigo no fue enviado, setearlo'||unistr('\000a')||
'  -- De la Cookie de la última conexión'||unistr('\000a')||
'  if :p101_segorg_codigo is null and :p1_segorg_id is null then'||unistr('\000a')||
'    declare'||unistr('\000a')||
'      c owa_cookie.cookie;'||unistr('\000a')||
'    begin'||unistr('\000a')||
'      c := owa_cookie.get(''LOGIN_SEGORG_COOKIE'');'||unistr('\000a')||
'      :P101_SEGORG_CO';

p:=p||'DIGO := upper(c.vals(1));'||unistr('\000a')||
'      :P1_SEGORG_CODIGO := upper(c.vals(1));'||unistr('\000a')||
'      if :P1_SEGORG_CODIGO is not null then'||unistr('\000a')||
'        open cr_segorg2(p_segorg_codigo => :P1_SEGORG_CODIGO);'||unistr('\000a')||
'        fetch cr_segorg2 into v_segorg;'||unistr('\000a')||
'        close cr_segorg2;'||unistr('\000a')||
'       :P1_SEGORG_ID := v_segorg.ID;'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    exception'||unistr('\000a')||
'       when others then'||unistr('\000a')||
'          null;'||unistr('\000a')||
'    end;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
''||unistr('\000a')||
'  if :p101_segorg_codigo is nul';

p:=p||'l and :p1_segorg_id is null then'||unistr('\000a')||
'    --'||unistr('\000a')||
'    if v_segamb.segorg_id_default is NOT null then'||unistr('\000a')||
'      open cr_segorg(p_segorg_id => v_segamb.segorg_id_default);'||unistr('\000a')||
'      fetch cr_segorg into v_segorg;'||unistr('\000a')||
'      close cr_segorg;'||unistr('\000a')||
'    end if;  '||unistr('\000a')||
'    :P101_SEGORG_CODIGO := v_segorg.CODIGO;'||unistr('\000a')||
'    :P1_SEGORG_CODIGO := v_segorg.CODIGO;'||unistr('\000a')||
'    :P1_SEGORG_ID      := v_segorg.ID;'||unistr('\000a')||
'  elsif :p101_segorg_codigo is not null and :';

p:=p||'p1_segorg_id is null then'||unistr('\000a')||
'    open cr_segorg2(p_segorg_codigo => :p101_segorg_codigo);'||unistr('\000a')||
'    fetch cr_segorg2 into v_segorg;'||unistr('\000a')||
'    close cr_segorg2;'||unistr('\000a')||
'    :P101_SEGORG_CODIGO := v_segorg.CODIGO;'||unistr('\000a')||
'    :P1_SEGORG_CODIGO := v_segorg.CODIGO;'||unistr('\000a')||
'    :P1_SEGORG_ID      := v_segorg.ID;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  :G_APP_ANTERIOR:=''SRVMNU'';'||unistr('\000a')||
'end;';

wwv_flow_api.create_flow_process(
  p_id => 341092727939678388 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'InicializarAmbiente',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/cargaraplicaciónanterior
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'IF :G_APP_ANTERIOR IS NULL THEN'||unistr('\000a')||
'  :G_APP_ANTERIOR := &APP_ID.;'||unistr('\000a')||
'END IF;';

wwv_flow_api.create_flow_process(
  p_id => 475651220521720431 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'CargarAplicaciónAnterior',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/anclarpágina
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||':P1_PAG_ANTERIOR := &APP_PAGE_ID.;';

wwv_flow_api.create_flow_process(
  p_id => 475651399181723708 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AnclarPágina',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/cargardatosorganización
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'declare'||unistr('\000a')||
'  v_segorg seg_organizaciones%rowtype;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  if :P1_SEGORG_CODIGO is null then'||unistr('\000a')||
'    raise_application_error(-20000,''Debe indicar el Código de la Organización'');'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  SEG_PKG.SET_SEGORG_CODIGO(p_codigo => :P1_SEGORG_CODIGO);'||unistr('\000a')||
'  SEG_PKG.GET_SEGORG(p_segorg => v_segorg);'||unistr('\000a')||
'  SEG_PKG.INI_SEGORG;'||unistr('\000a')||
'  if v_segorg.ID is null then'||unistr('\000a')||
'    raise_application_error(-20000,''El Código :''||:P1_SEGORG_COD';

p:=p||'IGO||'' de la Organización indicada es incorrecta'');'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  :P1_SEGORG_ID     := v_segorg.ID;'||unistr('\000a')||
'  :P1_SEGORG_NOMBRE := v_segorg.NOMBRE;'||unistr('\000a')||
'  :P1_SEGORG_COPYRIGHT := v_segorg.COPYRIGHT_TEXTO;'||unistr('\000a')||
'end;';

wwv_flow_api.create_flow_process(
  p_id => 519760722571796692 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'CargarDatosOrganización',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/inicializartemapordefault
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'declare'||unistr('\000a')||
'  v_segcfg seg_configuraciones%rowtype;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
'  SEG_PKG.SET_SEGCFG_CODIGO(p_segorg_id => :P1_SEGORG_ID'||unistr('\000a')||
'                          , p_codigo    => ''APP_THEME'');'||unistr('\000a')||
'  SEG_PKG.GET_SEGCFG(p_segcfg => v_segcfg);'||unistr('\000a')||
'  SEG_PKG.INI_SEGCFG;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  IF v_segcfg.ID is not null then'||unistr('\000a')||
'     :P101_APP_THEME :=v_segcfg.VALOR;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  IF :P101_APP_THEME IS NULL THEN'||unistr('\000a')||
'     :P101_APP_THEME := ''blue'';'||unistr('\000a')||
'  ';

p:=p||'END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  :P1_APP_THEME := :P101_APP_THEME;'||unistr('\000a')||
'  --'||unistr('\000a')||
'end;';

wwv_flow_api.create_flow_process(
  p_id => 200053147563183103 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 60,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'InicializarTemaPorDefault',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

prompt  ...application items
--
--application/shared_components/logic/application_items/alert_execute_sn
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 124752710268991999 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'ALERT_EXECUTE_SN'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/fsp_after_login_url
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 519755937370043962 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'FSP_AFTER_LOGIN_URL'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
  );
 
end;
/

--application/shared_components/logic/application_items/g_app_anterior
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 170405348907909685 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'G_APP_ANTERIOR'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/g_segamb_tipo
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 223153572233023126 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'G_SEGAMB_TIPO'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

prompt  ...application level computations
--
 
begin
 
null;
 
end;
/

prompt  ...Application Tabs
--
 
begin
 
null;
 
end;
/

prompt  ...Application Parent Tabs
--
 
begin
 
null;
 
end;
/

prompt  ...Shared Lists of values
--
--application/shared_components/user_interface/lov/segusu_tipo_documento
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 497701527347895687 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'SEGUSU_TIPO_DOCUMENTO',
  p_lov_query=> 'select rv_abbreviation d, rv_low_value r'||unistr('\000a')||
'from   cg_ref_codes'||unistr('\000a')||
'where  rv_domain = ''SEG_PERSONAS.TIPO_DOCUMENTO'''||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

prompt  ...Application Trees
--
--application/pages/page_groups
prompt  ...page groups
--
 
begin
 
null;
 
end;
/

--application/comments
prompt  ...comments: requires application express 2.2 or higher
--
 
--application/pages/page_00000
prompt  ...PAGE 0: 0
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 0
 ,p_user_interface_id => 170453256197545135 + wwv_flow_api.g_id_offset
 ,p_name => '0'
 ,p_step_title => '0'
 ,p_step_sub_title => '0'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_last_updated_by => 'ECONTRERAS'
 ,p_last_upd_yyyymmddhh24miss => '20160113123652'
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
  p_id=> 123918232639829126 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'JS Modal Region',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 123916917257794360+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'AFTER_HEADER',
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
s:=s||'sys.htp.p(''<div class="navActions clearfix">'');'||unistr('\000a')||
'sys.htp.p(''<ul>'');'||unistr('\000a')||
'--  begin nav links'||unistr('\000a')||
'-- '||unistr('\000a')||
'-- admin'||unistr('\000a')||
'--'||unistr('\000a')||
'if SEG_PKG.AUTO_USUROL(v(''APP_USER''),''ADM'') and nvl(v(''APP_PAGE_ID''),''1'') <> ''900'' then'||unistr('\000a')||
'sys.htp.p(''<li><a href="''||apex_util.prepare_url(''f?p=''||:app_id||'':ADM:''||:app_session)||''"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="'''||unistr('\000a')||
'           ||''" class="navIcon settings"> <span>''||apex_lang.message(''A';

s:=s||'dministración'')||''</span></a></li>'');'||unistr('\000a')||
'end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'-- mobile'||unistr('\000a')||
'--'||unistr('\000a')||
'/*'||unistr('\000a')||
'sys.htp.p(''<li><a href="''||apex_util.prepare_url(''f?p=''||:app_id||'':mobile:''||:app_session)||''"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="'''||unistr('\000a')||
'          ||''" class="navIcon mobile"><span>''||apex_lang.message(''MOBILE'')||''</span></a></li>'');'||unistr('\000a')||
'*/'||unistr('\000a')||
'-- '||unistr('\000a')||
'-- help'||unistr('\000a')||
'--'||unistr('\000a')||
'/*'||unistr('\000a')||
'sys.htp.p(''<li><a href="''||apex_util.prepare_url(''f?p=''||:app_id||'':help:''||';

s:=s||':app_session)||''"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="'''||unistr('\000a')||
'          ||''" class="navIcon help"><span>''||apex_lang.message(''HELP'')||''</span></a></li>'');'||unistr('\000a')||
'*/'||unistr('\000a')||
'-- end nav links'||unistr('\000a')||
''||unistr('\000a')||
'sys.htp.p(''</ul>'');'||unistr('\000a')||
'sys.htp.p(''</div>'');';

wwv_flow_api.create_page_plug (
  p_id=> 170425256460097274 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'nav',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_08',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_plug_display_when_condition => '101,102,103,104',
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
'  --'||unistr('\000a')||
'  cursor cr_login is'||unistr('\000a')||
'  select 1'||unistr('\000a')||
'    from CFG_PORTALES_V'||unistr('\000a')||
'   where segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'     and SITUACION = ''ACT'''||unistr('\000a')||
'     and LOGIN_SN = ''SI'';'||unistr('\000a')||
'  --'||unistr('\000a')||
'  cursor cr_alertas is'||unistr('\000a')||
'    select 1'||unistr('\000a')||
'      from cfg_alertas_tipos cfgalt'||unistr('\000a')||
'     where segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'       and sysdate between nvl(fecha_desde, sysdate) and nvl(fecha_hasta, sysdate)'||unistr('\000a')||
'       and situacion = ''VIG'' '||unistr('\000a')||
'       and CFG_B';

s:=s||'I_PKG.CFGALT_SEGUSU_AUTH(:P1_SEGUSU_ID, cfgalt.ID) = ''SI'';'||unistr('\000a')||
'  --'||unistr('\000a')||
'   v_login NUMBER;'||unistr('\000a')||
'   v_alerta NUMBER;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  htp.print(''<ul class="toolbar">'');'||unistr('\000a')||
''||unistr('\000a')||
'    --BUSCADOR'||unistr('\000a')||
'    --htp.print(''<li id="toolbar_search" class="toolbar-ico"><a id="busqueda_novedad" href="f?p=90002:110:&APP_SESSION.:::110:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,G_SEGORG_ID,G_SEGORG_CODIGO,P110_BSQTIP:&APP_ID.,&APP_PAGE_ID.,&P1_SEGORG';

s:=s||'_ID.,&P1_SEGORG_CODIGO.,N" title="Buscar Novedades"><i class="fa fa-search"></i></a></li>'');'||unistr('\000a')||
''||unistr('\000a')||
'    --ALERTAS'||unistr('\000a')||
'    open cr_alertas;'||unistr('\000a')||
'    fetch cr_alertas into v_alerta;'||unistr('\000a')||
'    close cr_alertas;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    if nvl(v_alerta,0) > 0 then '||unistr('\000a')||
'      htp.print(''<li id="toolbar_notify" class="toolbar-ico" style="display:none;"><a href="javascript:openAlert();" title="Notificaciones"><i class="fa fa-bullhorn blink"><';

s:=s||'/i></a></li>'');'||unistr('\000a')||
'    end if;'||unistr('\000a')||
''||unistr('\000a')||
'    --MENSAJES'||unistr('\000a')||
'    if upper(:P1_SEGUSU_NOMBRE) <> ''INVITADO'' then'||unistr('\000a')||
'      htp.print(''<li id="toolbar_message" class="toolbar-ico"><a href="f?p=SRVMSJ:600:&APP_SESSION.:::600:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG:&APP_ID.,&APP_PAGE_ID." title="Bandeja de Mensajes"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-bell fa-stack-1x fa-inverse"';

s:=s||'></i></span><span class="msjnro"></span></a></li>'');'||unistr('\000a')||
'    end if;'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'        --ORGANISMO'||unistr('\000a')||
'    declare'||unistr('\000a')||
'      --Obtener Organismos del Usuario'||unistr('\000a')||
'      cursor cr_comeco is'||unistr('\000a')||
'      select comcnr.comeco_id ID'||unistr('\000a')||
'           , comcnr.comeco_nombre NOMBRE'||unistr('\000a')||
'           --, comcnr.comeco_codigo ||'' - ''||comcnr.comeco_nombre NOMBRE'||unistr('\000a')||
'           , comcnr.segusu_id SEGUSU_ID'||unistr('\000a')||
'        from COM_CONTRATANTES_RES_V comcnr'||unistr('\000a')||
'      ';

s:=s||'     , COM_CONTRATANTES_EST comece'||unistr('\000a')||
'       where comcnr.SITUACION = ''ACT'''||unistr('\000a')||
'         and comcnr.COMECO_ID = comece.COMECO_ID'||unistr('\000a')||
'         and comece.ID = COM_PKG.OBTN_COMECE_ID(comcnr.COMECO_ID)'||unistr('\000a')||
'         and comece.ESTADO = ''HAB'''||unistr('\000a')||
'         and comcnr.segusu_id in (select segusu.ID'||unistr('\000a')||
'                                    from SEG_USUARIOS_V segusu'||unistr('\000a')||
'                                   where segusu.USUARIO LIKE :P';

s:=s||'1_SEGORG_CODIGO||''.''||substr(v(''APP_ALIAS''),1,6)||''.%'''||unistr('\000a')||
'                                     and segusu.USUARIO LIKE ''%.''||:P1_SEGUSU_DOCUMENTO_TIPO||''.''||:P1_SEGUSU_DOCUMENTO_NUMERO'||unistr('\000a')||
'                                     and segusu.SITUACION = ''ACT'');'||unistr('\000a')||
'      --'||unistr('\000a')||
'      cursor cr_comeco_c is'||unistr('\000a')||
'      select count(comcnr.comeco_id)           '||unistr('\000a')||
'        from COM_CONTRATANTES_RES_V comcnr'||unistr('\000a')||
'           , COM_CONTR';

s:=s||'ATANTES_EST comece           '||unistr('\000a')||
'       where comcnr.SITUACION = ''ACT'''||unistr('\000a')||
'         and comcnr.COMECO_ID = comece.COMECO_ID'||unistr('\000a')||
'         and comece.ID = COM_PKG.OBTN_COMECE_ID(comcnr.COMECO_ID)'||unistr('\000a')||
'         and comece.ESTADO = ''HAB'''||unistr('\000a')||
'         and comcnr.segusu_id in (select segusu.ID'||unistr('\000a')||
'                                    from SEG_USUARIOS_V segusu'||unistr('\000a')||
'                                   where segusu.USUARIO LIKE :P1_SEG';

s:=s||'ORG_CODIGO||''.''||substr(v(''APP_ALIAS''),1,6)||''.%'''||unistr('\000a')||
'                                     and segusu.USUARIO LIKE ''%.''||:P1_SEGUSU_DOCUMENTO_TIPO||''.''||:P1_SEGUSU_DOCUMENTO_NUMERO                                  '||unistr('\000a')||
'                                     and segusu.SITUACION = ''ACT'');'||unistr('\000a')||
'      --'||unistr('\000a')||
'      v_comeco_c number;'||unistr('\000a')||
'      v_comeco_i number := 1;'||unistr('\000a')||
'      v_comeco_html varchar2(4000);'||unistr('\000a')||
'      v_comeco_submen';

s:=s||'u varchar2(4000);'||unistr('\000a')||
'      v_class_click varchar2(100) := null;'||unistr('\000a')||
'      v_chevron_click varchar2(100) := null;'||unistr('\000a')||
'      --'||unistr('\000a')||
'    begin '||unistr('\000a')||
'      --'||unistr('\000a')||
'      open cr_comeco_c;'||unistr('\000a')||
'      fetch cr_comeco_c into v_comeco_c;'||unistr('\000a')||
'      close cr_comeco_c;'||unistr('\000a')||
'      --'||unistr('\000a')||
'      if v_comeco_c > 0 then'||unistr('\000a')||
'        --'||unistr('\000a')||
'        for v_comeco in cr_comeco loop'||unistr('\000a')||
'          --Para la primer opcion'||unistr('\000a')||
'          if :P110_COMECO_ID_SEL is null then '||unistr('\000a')||
'      ';

s:=s||'      --Si es NULO '||unistr('\000a')||
'            if v_comeco_i = 1 then             '||unistr('\000a')||
'              --Si tiene mas de un Organismo agrego selector'||unistr('\000a')||
'              if v_comeco_c > 1 then  '||unistr('\000a')||
'                v_class_click := ''entend_select'';         '||unistr('\000a')||
'                v_chevron_click := v_comeco_html || ''<a href="#" class="entend_select"><i class="fa fa-chevron-down"></i></a>'';'||unistr('\000a')||
'              end if;'||unistr('\000a')||
'              --'||unistr('\000a')||
'      ';

s:=s||'        v_comeco_html := ''<li id="toolbar_org" class="toolbar-ico"><i class="fa fa-building-o"></i><a href="#" class="''||v_class_click||''">''||lower(v_comeco.NOMBRE)||''</a> ''||v_chevron_click;'||unistr('\000a')||
'              --'||unistr('\000a')||
'              --v_comeco_html := v_comeco_html  || ''</li>'';'||unistr('\000a')||
'              v_comeco_i := v_comeco_i +1;'||unistr('\000a')||
'              --ASIGNO ORGANISMO ACTUAL'||unistr('\000a')||
'              :P1_COMECO_ID := v_comeco.ID;'||unistr('\000a')||
'    ';

s:=s||'          :P1_COMECO_NOMBRE := v_comeco.NOMBRE;'||unistr('\000a')||
'              --'||unistr('\000a')||
'            else'||unistr('\000a')||
'              --Demas Organismos'||unistr('\000a')||
'              v_comeco_submenu := v_comeco_submenu||''<li><a href="f?p=&APP_ID.:110:&SESSION.::::P110_COMECO_ID_SEL,P110_SEGUSU_ID_SEL:''|| v_comeco.ID ||'',''|| v_comeco.SEGUSU_ID ||''" title="Usar Portal como: ''||lower(v_comeco.NOMBRE)||''"><i class="fa fa-building-o"></i>''||lower(v_comec';

s:=s||'o.NOMBRE)||''</a></li>'';'||unistr('\000a')||
'              --          '||unistr('\000a')||
'            end if;  '||unistr('\000a')||
'          else'||unistr('\000a')||
'            --SI NO ES NULO'||unistr('\000a')||
'            if :P110_COMECO_ID_SEL = v_comeco.ID then'||unistr('\000a')||
'              --'||unistr('\000a')||
'              v_comeco_html := ''<li id="toolbar_org" class="toolbar-ico"><i class="fa fa-building-o"></i><a href="#" class="entend_select">''||lower(v_comeco.NOMBRE)||''</a> '';'||unistr('\000a')||
'              --'||unistr('\000a')||
'              if v_co';

s:=s||'meco_c > 1 then            '||unistr('\000a')||
'                v_comeco_html := v_comeco_html || ''<a href="#" class="entend_select"><i class="fa fa-chevron-down"></i></a>'';'||unistr('\000a')||
'              end if;'||unistr('\000a')||
'              --Si tiene mas de un Organismo agrego selector'||unistr('\000a')||
'              --ASIGNO ORGANISMO ACTUAL'||unistr('\000a')||
'              :P1_COMECO_ID := v_comeco.ID;'||unistr('\000a')||
'              :P1_COMECO_NOMBRE := v_comeco.NOMBRE;'||unistr('\000a')||
'              --'||unistr('\000a')||
'          ';

s:=s||'  else'||unistr('\000a')||
'              --Demas Organismos'||unistr('\000a')||
'              v_comeco_submenu := v_comeco_submenu||''<li><a href="f?p=&APP_ID.:110:&SESSION.::::P110_COMECO_ID_SEL,P110_SEGUSU_ID_SEL:''|| v_comeco.ID ||'',''|| v_comeco.SEGUSU_ID ||''" title="Usar Portal como: ''||lower(v_comeco.NOMBRE)||''"><i class="fa fa-building-o"></i>''||lower(v_comeco.NOMBRE)||''</a></li>'';'||unistr('\000a')||
'              --          '||unistr('\000a')||
'            end if;'||unistr('\000a')||
'    ';

s:=s||'        --'||unistr('\000a')||
'          end if; '||unistr('\000a')||
'          --'||unistr('\000a')||
'        end loop;'||unistr('\000a')||
'        --'||unistr('\000a')||
'        htp.print(v_comeco_html||''<ul class="entend_submenu"><li class="encabezado">Usar Portal como:</li>''||v_comeco_submenu||''</ul></li>'');'||unistr('\000a')||
'        --'||unistr('\000a')||
'      end if;  '||unistr('\000a')||
'      --'||unistr('\000a')||
'     exception'||unistr('\000a')||
'      when others then '||unistr('\000a')||
'        null;  '||unistr('\000a')||
'    end;'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'    --USUARIO'||unistr('\000a')||
'    if upper(:P1_SEGUSU_NOMBRE) <> ''INVITADO'' then'||unistr('\000a')||
'      htp.print(''<';

s:=s||'li id="toolbar_user" class="toolbar-ico"><i class="fa fa-user"></i>''||lower(:P1_SEGUSU_NOMBRE)||''</li>'');'||unistr('\000a')||
'    end if;'||unistr('\000a')||
''||unistr('\000a')||
'    --CAMBIAR CONTRASEÑA '||unistr('\000a')||
'    htp.print(''<li id="toolbar_passw" class="toolbar-ico"><a id="Cambiar Contraseña" href="f?p=&APP_ID.:103:&APP_SESSION.::NO:103::" title="Cambiar Contraseña">Cambiar Contraseña</a></li>'');'||unistr('\000a')||
''||unistr('\000a')||
'    --DESCONECTAR'||unistr('\000a')||
'    if upper(:P1_SEGUSU_NOMBRE) <> ''INVITADO''';

s:=s||' then'||unistr('\000a')||
'      htp.print(''<li id="toolbar_sign_out" class="toolbar-ico"><a href="&LOGOUT_URL." title="Desconectar"><i class="fa fa-sign-out"></i>Desconectar</a></li>'');'||unistr('\000a')||
'    end if;'||unistr('\000a')||
''||unistr('\000a')||
'    --CONECTAR    '||unistr('\000a')||
'     open cr_login;'||unistr('\000a')||
'    fetch cr_login into v_login;'||unistr('\000a')||
'    close cr_login;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    if upper(:P1_SEGUSU_NOMBRE) = ''INVITADO'' AND v_login is not null  then'||unistr('\000a')||
'      htp.print(''<li id="toolbar_sign_in" class';

s:=s||'="toolbar-ico"><a href="f?p=&APP_ID.:101:&APP_SESSION.:::101:P101_SEGORG_CODIGO:&P1_SEGORG_CODIGO." title="Conectar"><i class="fa fa-sign-in"></i>Conectar</a></li>'');'||unistr('\000a')||
'    end if;'||unistr('\000a')||
''||unistr('\000a')||
'  htp.print(''</ul>'');'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 170426839107139638 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Custom Navigation Bar',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186454190715809938+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_05',
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
  p_plug_display_condition_type => 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_plug_display_when_condition => '101,102,103,104',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_footer=> '<script type="text/javascript">'||unistr('\000a')||
'$(function() {'||unistr('\000a')||
'  msj_verificar()'||unistr('\000a')||
'  setInterval("msj_verificar()",5000);  '||unistr('\000a')||
'});'||unistr('\000a')||
'function msj_verificar(){'||unistr('\000a')||
'  var get = new htmldb_Get(null,$x(''pFlowId'').value,''APPLICATION_PROCESS=msjenv_verificar'',0);  '||unistr('\000a')||
'  gReturn = get.get();  '||unistr('\000a')||
'  get = null;  '||unistr('\000a')||
'  '||unistr('\000a')||
'  var msj_cantidad = gReturn;'||unistr('\000a')||
'  if ( msj_cantidad != '''' ){  '||unistr('\000a')||
'    if ( msj_cantidad > 0 ){  '||unistr('\000a')||
'      $(''#toolbar_message'').removeClass(''msjico-sin'');'||unistr('\000a')||
'      $(''#toolbar_message'').addClass(''msjico-con'');'||unistr('\000a')||
'      $(''.msjnro'').empty();'||unistr('\000a')||
'      $(''.msjnro'').append( msj_cantidad ); '||unistr('\000a')||
'      if ( msj_cantidad == 1 ){  '||unistr('\000a')||
'      	$(''#toolbar_message'').attr(''alt'',msj_cantidad+'' Mensaje sin leer'' );'||unistr('\000a')||
'      	$(''#toolbar_message'').attr(''title'',msj_cantidad+'' Mensaje sin leer'' );'||unistr('\000a')||
'      }else{'||unistr('\000a')||
'      	$(''#toolbar_message'').attr(''alt'',msj_cantidad+'' Mensajes sin leer'' );'||unistr('\000a')||
'      	$(''#toolbar_message'').attr(''title'',msj_cantidad+'' Mensajes sin leer'' );'||unistr('\000a')||
'      }'||unistr('\000a')||
'    }else{'||unistr('\000a')||
'      $(''#toolbar_message'').removeClass(''msjico-con'');'||unistr('\000a')||
'      $(''#toolbar_message'').addClass(''msjico-sin''); '||unistr('\000a')||
'      $(''.msjnro'').empty();'||unistr('\000a')||
'      $(''#toolbar_message'').attr(''alt'',''Sin mensajes'' );'||unistr('\000a')||
'      $(''#toolbar_message'').attr(''title'',''Sin mensajes'' );    '||unistr('\000a')||
'    }'||unistr('\000a')||
'  }else{'||unistr('\000a')||
'    $(''.msjnro'').empty();'||unistr('\000a')||
'    $(''.msjnro'').append(''Error!'');'||unistr('\000a')||
'  }'||unistr('\000a')||
'}'||unistr('\000a')||
'$(".entend_select").on( "click", function(e) {'||unistr('\000a')||
'  $(".entend_submenu").slideToggle( "slow" );'||unistr('\000a')||
'});'||unistr('\000a')||
'</script>'||unistr('\000a')||
'',
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
  p_id=> 209476959056072614 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Menu Principal',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_06',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 209477181605072614 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 170571831375723366+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => 'v(''APP_PAGE_ID'') not in (''101'',''254'')',
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
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 0
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00001
prompt  ...PAGE 1: Inicio
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 1
 ,p_user_interface_id => 170453256197545135 + wwv_flow_api.g_id_offset
 ,p_name => 'Inicio'
 ,p_alias => 'HOME'
 ,p_step_title => 'Inicio'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Inicio'
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
'</style>'||unistr('\000a')||
'<style>'||unistr('\000a')||
'#Cambiar_Ejercicio{display:none;}'||unistr('\000a')||
'</style>    '
 ,p_javascript_code => 
'function NewsTicker(pNewsjQueryObject, pNewsList, pSeconds, pFadeSpeed) {'||unistr('\000a')||
'  var lNextNewsEntry = null;'||unistr('\000a')||
'  function showNews() {'||unistr('\000a')||
'    pNewsjQueryObject'||unistr('\000a')||
'      .fadeOut(pFadeSpeed)'||unistr('\000a')||
'      .queue(function(){'||unistr('\000a')||
'               apex.jQuery(this).html(pNewsList[lNextNewsEntry]);'||unistr('\000a')||
'               apex.jQuery(this).dequeue();'||unistr('\000a')||
'             })'||unistr('\000a')||
'      .fadeIn(pFadeSpeed);'||unistr('\000a')||
'    // queue in the next news entry. Start fro'||
'm the beginning if the end is reached'||unistr('\000a')||
'    lNextNewsEntry++;'||unistr('\000a')||
'    if (lNextNewsEntry == pNewsList.length) { lNextNewsEntry=0 };'||unistr('\000a')||
'    setTimeout(showNews, pSeconds*1500);'||unistr('\000a')||
'  };'||unistr('\000a')||
'  // Show the first entry immediately. If there are more entries start the rotator'||unistr('\000a')||
'  if (pNewsList.length > 0) {'||unistr('\000a')||
'    pNewsjQueryObject.html(pNewsList[0]);'||unistr('\000a')||
'    if (pNewsList.length > 1) {'||unistr('\000a')||
'      lNextNewsEntry = 1;'||unistr('\000a')||
'      setTimeou'||
't(showNews, pSeconds*1500);'||unistr('\000a')||
'    }'||unistr('\000a')||
'  }'||unistr('\000a')||
'};'||unistr('\000a')||
''||unistr('\000a')||
'/* -------------------- Noticias Todas -------------------- */'||unistr('\000a')||
'$(function() { '||unistr('\000a')||
' $( "#dialog-modal" ).dialog( "destroy" ); '||unistr('\000a')||
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
'/* -------------------- Video Introducción ------------------*/'||unistr('\000a')||
''||unistr('\000a')||
'function abrir_video (){'||unistr('\000a')||
' $( "#dialog-video" ).html($("#P'||
'1_VIDEO_IFRAME").val());'||unistr('\000a')||
' $( "#dialog-video" ).dialog({'||unistr('\000a')||
'   width: 700,'||unistr('\000a')||
'   height: 500,'||unistr('\000a')||
'   modal: true,'||unistr('\000a')||
'   close: function() {'||unistr('\000a')||
'     $( "#dialog-video" ).empty();'||unistr('\000a')||
'   }'||unistr('\000a')||
' });'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'/* -------------------- Cambiar Ejercicio ------------------*/'||unistr('\000a')||
''||unistr('\000a')||
'function cambiar_ejercicio (){'||unistr('\000a')||
' $( "#Cambiar_Ejercicio" ).dialog({'||unistr('\000a')||
'   width: 500,'||unistr('\000a')||
'   height: 200,'||unistr('\000a')||
'   modal: true,'||unistr('\000a')||
'   close: function() {'||unistr('\000a')||
'     $( "#Cambiar_Ejercic'||
'io" ).empty();'||unistr('\000a')||
'   }'||unistr('\000a')||
' });'||unistr('\000a')||
'}'||unistr('\000a')||
''
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'CTISSERA'
 ,p_last_upd_yyyymmddhh24miss => '20161101162148'
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
  p_id=> 70428902330578286 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Acerca de',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186459500426809941+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 140,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 70428320769564636 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 186466576796809945+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_header=> '<b>Pantalla principal del Portal de Entidades Contratantes</b>.<br> Desde aquí se podrá gestionar toda la información de la Entidad Contratante. <br>Para más detalle acceda al video Tutorial<br><br>',
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
  p_id=> 71299303036404006 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Panel de Control del Ejercicio : &P1_COMPED_EJERCICIO.',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186459500426809941+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 40,
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
s:=s||'SELECT ''Pedidos Rechazados para Revisar '' label, COUNT (comped_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:220:&SESSION.::NO:RIR,220:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P220_COMECO_ID,P220_COMPED_EJERCICIO,P220_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,&P1_COMPED_EJERCICIO.,RCH'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comped.ID comped_id'||unistr('\000a')||
'    ';

s:=s||'      FROM com_pedidos comped'||unistr('\000a')||
'--              ,com_pedidos_est compee'||unistr('\000a')||
'         WHERE comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'--           AND comped.compee_id = compee.ID'||unistr('\000a')||
'           AND comped.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'--           AND compee.estado = ''RCH'''||unistr('\000a')||
'           AND comped.compee_estado = ''RCH'''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
'        SELECT comped.ID comped_';

s:=s||'id'||unistr('\000a')||
'          FROM com_pedidos comped'||unistr('\000a')||
'--             , com_pedidos_est compee'||unistr('\000a')||
'         WHERE comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'--           AND comped.compee_id = compee.ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'--           AND compee.estado = ''RCH'''||unistr('\000a')||
'           AND comped.compee_estado = ''RCH'''||unistr('\000a')||
'           AND comped.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'                             ';

s:=s||'         FROM com_contratantes_vinc vin'||unistr('\000a')||
'                                     WHERE vin.comeco_id_padre = :P1_COMECO_ID))';

wwv_flow_api.create_page_plug (
  p_id=> 71298312255397270 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Pedidos Rechazados para Revisar',
  p_region_name=>'',
  p_parent_plug_id=>71299303036404006 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 52,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_grid_column_span => 3,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_COM.ORACLE.APEX.BIG_VALUE_LIST',
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
  p_attribute_01=> 'LABEL',
  p_attribute_02 => 'VALUE',
  p_attribute_03 => 'PCT',
  p_attribute_04 => '&URL.',
  p_attribute_05 => '1',
  p_attribute_06 => 'B',
  p_plug_comment=> 'SELECT ''Pedidos Rechazados para Revisar '' label, COUNT (comped_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:220:&SESSION.::NO:RIR,220:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P220_COMECO_ID,P220_COMPED_EJERCICIO,P220_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,&P1_COMPED_EJERCICIO.,RCH'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comped.ID comped_id'||unistr('\000a')||
'          FROM com_pedidos comped,'||unistr('\000a')||
'               com_pedidos_est compee'||unistr('\000a')||
'         WHERE comped.compee_id = compee.ID'||unistr('\000a')||
'           AND comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comped.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND compee.estado = ''RCH'''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
'        SELECT comped.ID comped_id'||unistr('\000a')||
'          FROM com_pedidos comped,'||unistr('\000a')||
'               com_pedidos_est compee'||unistr('\000a')||
'         WHERE comped.compee_id = compee.ID'||unistr('\000a')||
'           AND comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND compee.estado = ''RCH'''||unistr('\000a')||
'           AND comped.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'                                      FROM com_contratantes_vinc vin'||unistr('\000a')||
'                                     WHERE vin.comeco_id_padre = :P1_COMECO_ID))');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT ''Proceso para Informar '' label, COUNT (comcon_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:220:&SESSION.::NO:RIR,220:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P220_COMECO_ID,P220_COMPED_EJERCICIO,P220_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,&P1_COMPED_EJERCICIO.,PPI'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comcon.ID comcon_id'||unistr('\000a')||
'          FROM';

s:=s||' com_pedidos comped'||unistr('\000a')||
'              ,com_contrataciones comcon'||unistr('\000a')||
'              ,com_contrataciones_detalles comcot'||unistr('\000a')||
'--              ,com_contrataciones_est comcoe       '||unistr('\000a')||
'         WHERE comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comped.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND comped.id = comcot.comped_id'||unistr('\000a')||
'           AND comcot.comcon_id = comcon';

s:=s||'.id'||unistr('\000a')||
'--           AND comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'--           AND comcoe.estado = ''ENV'''||unistr('\000a')||
'           AND comcon.comcoe_estado = ''ENV'''||unistr('\000a')||
''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
''||unistr('\000a')||
'        SELECT comcon.ID comcon_id'||unistr('\000a')||
'          FROM com_pedidos comped'||unistr('\000a')||
'              ,com_contrataciones comcon'||unistr('\000a')||
'              ,com_contrataciones_detalles comcot'||unistr('\000a')||
'--              ,com_contrataciones_est comcoe       '||unistr('\000a')||
'         WHERE comped.segorg_id =';

s:=s||' :P1_SEGORG_ID'||unistr('\000a')||
'           AND comped.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND comped.id = comcot.comped_id'||unistr('\000a')||
'           AND comcot.comcon_id = comcon.id'||unistr('\000a')||
'--           AND comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'--           AND comcoe.estado = ''ENV'''||unistr('\000a')||
'           AND comcon.comcoe_estado = ''ENV'''||unistr('\000a')||
'           AND comped.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'   ';

s:=s||'                                   FROM com_contratantes_vinc vin'||unistr('\000a')||
'                                     WHERE vin.comeco_id_padre = :P1_COMECO_ID))';

wwv_flow_api.create_page_plug (
  p_id=> 71300003991423193 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Proceso para Informar ',
  p_region_name=>'',
  p_parent_plug_id=>71299303036404006 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 53,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_grid_column_span => 3,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_COM.ORACLE.APEX.BIG_VALUE_LIST',
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
  p_attribute_01=> 'LABEL',
  p_attribute_02 => 'VALUE',
  p_attribute_03 => 'PCT',
  p_attribute_04 => '&URL.',
  p_attribute_05 => '1',
  p_attribute_06 => 'B',
  p_plug_comment=> 'SELECT ''Proceso para Informar '' label, COUNT (comcon_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:220:&SESSION.::NO:RIR,220:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P220_COMECO_ID,P220_COMPED_EJERCICIO,P220_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,&P1_COMPED_EJERCICIO.,PPI'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comcon.ID comcon_id'||unistr('\000a')||
'          FROM com_pedidos comped'||unistr('\000a')||
'              ,com_contrataciones comcon'||unistr('\000a')||
'              ,com_contrataciones_detalles comcot'||unistr('\000a')||
'              ,com_contrataciones_est comcoe       '||unistr('\000a')||
'         WHERE comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comped.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND comped.id = comcot.comped_id'||unistr('\000a')||
'           AND comcot.comcon_id = comcon.id'||unistr('\000a')||
'           AND comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'           AND comcoe.estado = ''ENV'''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
'        SELECT comcon.ID comcon_id'||unistr('\000a')||
'          FROM com_pedidos comped'||unistr('\000a')||
'              ,com_contrataciones comcon'||unistr('\000a')||
'              ,com_contrataciones_detalles comcot'||unistr('\000a')||
'              ,com_contrataciones_est comcoe       '||unistr('\000a')||
'         WHERE comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comped.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND comped.id = comcot.comped_id'||unistr('\000a')||
'           AND comcot.comcon_id = comcon.id'||unistr('\000a')||
'           AND comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'           AND comcoe.estado = ''ENV'''||unistr('\000a')||
'           AND comped.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'                                      FROM com_contratantes_vinc vin'||unistr('\000a')||
'                                     WHERE vin.comeco_id_padre = :P1_COMECO_ID))');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT ''Procesos Acordados '' label, COUNT (comcon_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:220:&SESSION.::NO:RIR,220:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P220_COMECO_ID,P220_COMPED_EJERCICIO,P220_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,&P1_COMPED_EJERCICIO.,PAC'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comcon.ID comcon_id'||unistr('\000a')||
'          FROM co';

s:=s||'m_pedidos comped'||unistr('\000a')||
'              ,com_contrataciones comcon'||unistr('\000a')||
'              ,com_contrataciones_detalles comcot'||unistr('\000a')||
'--              ,com_contrataciones_est comcoe       '||unistr('\000a')||
'         WHERE comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comped.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND comped.id = comcot.comped_id'||unistr('\000a')||
'           AND comcot.comcon_id = comcon.id';

s:=s||''||unistr('\000a')||
'--           AND comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'--           AND comcoe.estado = ''ACR'''||unistr('\000a')||
'           AND comcon.comcoe_estado = ''ACR'''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
'        SELECT comcon.ID comcon_id'||unistr('\000a')||
'          FROM com_pedidos comped'||unistr('\000a')||
'              ,com_contrataciones comcon'||unistr('\000a')||
'              ,com_contrataciones_detalles comcot'||unistr('\000a')||
'--              ,com_contrataciones_est comcoe       '||unistr('\000a')||
'         WHERE comped.segorg_id = :P1_';

s:=s||'SEGORG_ID'||unistr('\000a')||
'           AND comped.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND comped.id = comcot.comped_id'||unistr('\000a')||
'           AND comcot.comcon_id = comcon.id'||unistr('\000a')||
'--           AND comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'--           AND comcoe.estado = ''ACR'''||unistr('\000a')||
'           AND comcon.comcoe_estado = ''ACR'''||unistr('\000a')||
'           AND comped.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'        ';

s:=s||'                              FROM com_contratantes_vinc vin'||unistr('\000a')||
'                                     WHERE vin.comeco_id_padre = :P1_COMECO_ID))';

wwv_flow_api.create_page_plug (
  p_id=> 71301207388594553 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Procesos Acordados ',
  p_region_name=>'',
  p_parent_plug_id=>71299303036404006 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 54,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_grid_column_span => 3,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_COM.ORACLE.APEX.BIG_VALUE_LIST',
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
  p_attribute_01=> 'LABEL',
  p_attribute_02 => 'VALUE',
  p_attribute_03 => 'PCT',
  p_attribute_04 => '&URL.',
  p_attribute_05 => '1',
  p_attribute_06 => 'B',
  p_plug_comment=> 'SELECT ''Procesos Acordados '' label, COUNT (comcon_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:220:&SESSION.::NO:RIR,220:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P220_COMECO_ID,P220_COMPED_EJERCICIO,P220_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,&P1_COMPED_EJERCICIO.,PAC'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comcon.ID comcon_id'||unistr('\000a')||
'          FROM com_pedidos comped'||unistr('\000a')||
'              ,com_contrataciones comcon'||unistr('\000a')||
'              ,com_contrataciones_detalles comcot'||unistr('\000a')||
'              ,com_contrataciones_est comcoe       '||unistr('\000a')||
'         WHERE comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comped.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND comped.id = comcot.comped_id'||unistr('\000a')||
'           AND comcot.comcon_id = comcon.id'||unistr('\000a')||
'           AND comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'           AND comcoe.estado = ''ACR'''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
'        SELECT comcon.ID comcon_id'||unistr('\000a')||
'          FROM com_pedidos comped'||unistr('\000a')||
'              ,com_contrataciones comcon'||unistr('\000a')||
'              ,com_contrataciones_detalles comcot'||unistr('\000a')||
'              ,com_contrataciones_est comcoe       '||unistr('\000a')||
'         WHERE comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comped.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND comped.id = comcot.comped_id'||unistr('\000a')||
'           AND comcot.comcon_id = comcon.id'||unistr('\000a')||
'           AND comcon.comcoe_id = comcoe.id'||unistr('\000a')||
'           AND comcoe.estado = ''ACR'''||unistr('\000a')||
'           AND comped.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'                                      FROM com_contratantes_vinc vin'||unistr('\000a')||
'                                     WHERE vin.comeco_id_padre = :P1_COMECO_ID))');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT ''Ordenes con Entregas Pendientes '' label, COUNT (comocm_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:420:&SESSION.::NO:RIR,420:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P420_COMECO_ID,P420_COMPED_EJERCICIO,P420_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,&P1_COMPED_EJERCICIO.,OPE'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comocm.ID comocm_id'||unistr('\000a')||
'    ';

s:=s||'      FROM com_ordenes_compras comocm'||unistr('\000a')||
'--             , com_ordenes_compras_est comoce'||unistr('\000a')||
'             , com_pedidos comped'||unistr('\000a')||
'         WHERE comocm.comped_id = comped.id'||unistr('\000a')||
'--           AND comocm.comoce_id = comoce.ID'||unistr('\000a')||
'--           AND comoce.estado = ''APR'''||unistr('\000a')||
'           AND comocm.comoce_estado = ''APR'''||unistr('\000a')||
'           AND comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comocm.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           ';

s:=s||'AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND comocm_pkg.comocm_ent_pen_sn (p_comocm_id => comocm.ID) = ''SI'''||unistr('\000a')||
''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
''||unistr('\000a')||
'        SELECT comocm.ID comocm_id'||unistr('\000a')||
'          FROM com_ordenes_compras comocm'||unistr('\000a')||
'--             , com_ordenes_compras_est comoce'||unistr('\000a')||
'             , com_pedidos comped'||unistr('\000a')||
'         WHERE comocm.comped_id = comped.id'||unistr('\000a')||
'--           AND comocm.comoce_id = comoce.ID'||unistr('\000a')||
'--       ';

s:=s||'    AND comoce.estado = ''APR'''||unistr('\000a')||
'           AND comocm.comoce_estado = ''APR'''||unistr('\000a')||
'           AND comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND comocm.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'                                      FROM com_contratantes_vinc vin'||unistr('\000a')||
'                                     WHERE vin.comeco_id_padre = :P1_COMECO_ID)'||unistr('\000a')||
'           A';

s:=s||'ND comocm_pkg.comocm_ent_pen_sn (p_comocm_id => comocm.ID) = ''SI'')'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 71301603017602761 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Ordenes con Entregas Pendientes',
  p_region_name=>'',
  p_parent_plug_id=>71299303036404006 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 55,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_grid_column_span => 3,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_COM.ORACLE.APEX.BIG_VALUE_LIST',
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
  p_attribute_01=> 'LABEL',
  p_attribute_02 => 'VALUE',
  p_attribute_03 => 'PCT',
  p_attribute_04 => '&URL.',
  p_attribute_05 => '1',
  p_attribute_06 => 'B',
  p_plug_comment=> 'SELECT ''Ordenes con Entregas Pendientes '' label, COUNT (comocm_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:420:&SESSION.::NO:RIR,420:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P420_COMECO_ID,P420_COMPED_EJERCICIO,P420_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,&P1_COMPED_EJERCICIO.,OPE'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comocm.ID comocm_id'||unistr('\000a')||
'          FROM com_ordenes_compras comocm'||unistr('\000a')||
'             , com_ordenes_compras_est comoce'||unistr('\000a')||
'             , com_pedidos comped'||unistr('\000a')||
'         WHERE comocm.comoce_id = comoce.ID'||unistr('\000a')||
'           AND comocm.comped_id = comped.id'||unistr('\000a')||
'           AND comoce.estado = ''APR'''||unistr('\000a')||
'           AND comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comocm.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND comocm_pkg.comocm_ent_pen_sn (p_comocm_id => comocm.ID) = ''SI'''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
'        SELECT comocm.ID comocm_id'||unistr('\000a')||
'          FROM com_ordenes_compras comocm'||unistr('\000a')||
'             , com_ordenes_compras_est comoce'||unistr('\000a')||
'             , com_pedidos comped'||unistr('\000a')||
'         WHERE comocm.comoce_id = comoce.ID'||unistr('\000a')||
'           AND comocm.comped_id = comped.id'||unistr('\000a')||
'           AND comoce.estado = ''APR'''||unistr('\000a')||
'           AND comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND comocm.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'                                      FROM com_contratantes_vinc vin'||unistr('\000a')||
'                                     WHERE vin.comeco_id_padre = :P1_COMECO_ID)'||unistr('\000a')||
'           AND comocm_pkg.comocm_ent_pen_sn (p_comocm_id => comocm.ID) = ''SI'')'||unistr('\000a')||
'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT ''Calificación para Revisar '' label, COUNT (comocm_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:420:&SESSION.::NO:RIR,420:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P420_COMECO_ID,P420_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,CPR'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comocm.ID comocm_id'||unistr('\000a')||
'          FROM com_ordenes_compras comocm,'||unistr('\000a')||
'--         ';

s:=s||'      com_ordenes_compras_est comoce,'||unistr('\000a')||
'               com_calificaciones comclf,'||unistr('\000a')||
'               com_replicas comrep'||unistr('\000a')||
'         WHERE comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'--           AND comocm.comoce_id = comoce.ID'||unistr('\000a')||
'           AND comocm.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comclf.comocm_id = comocm.ID'||unistr('\000a')||
'           AND comclf.ID = comocm_pkg.comocm_obtn_clf (p_comocm_id=> comocm.ID)'||unistr('\000a')||
'           AND comr';

s:=s||'ep.comclf_id = comclf.ID'||unistr('\000a')||
'           AND comrep.comocm_id = comocm.ID'||unistr('\000a')||
'           AND comrep.estado IN (''PRE'', ''REP'')'||unistr('\000a')||
'           AND comocm.comoce_estado IN (''CON'', ''NOC'')'||unistr('\000a')||
'           AND comocm.comoce_fecha > (SYSDATE - 365)'||unistr('\000a')||
'           AND comocm_pkg.comocm_replica_est (comocm.ID) = ''PARA REVISAR POR EL PROVEEDOR'''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
'        SELECT comocm.ID comocm_id'||unistr('\000a')||
'          FROM com_ordenes_compra';

s:=s||'s comocm'||unistr('\000a')||
'--             , com_ordenes_compras_est comoce'||unistr('\000a')||
'             , com_calificaciones comclf'||unistr('\000a')||
'             , com_replicas comrep'||unistr('\000a')||
'         WHERE comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comocm.comoce_estado = ''APR'''||unistr('\000a')||
'--           AND comocm.comoce_id = comoce.ID'||unistr('\000a')||
'           AND comocm.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'                                      FROM com_contratantes_vinc vi';

s:=s||'n'||unistr('\000a')||
'                                     WHERE vin.comeco_id_padre = :P1_COMECO_ID)'||unistr('\000a')||
'           AND comclf.comocm_id = comocm.ID'||unistr('\000a')||
'           AND comclf.ID = comocm_pkg.comocm_obtn_clf (p_comocm_id => comocm.ID)'||unistr('\000a')||
'           AND comrep.comclf_id = comclf.ID'||unistr('\000a')||
'           AND comrep.comocm_id = comocm.ID'||unistr('\000a')||
'           AND comrep.estado IN (''PRE'', ''REP'')'||unistr('\000a')||
'           AND comocm.comoce_estado IN (''CON'', ''NOC'')'||unistr('\000a')||
'    ';

s:=s||'       AND comocm.comoce_fecha > (SYSDATE - 365)'||unistr('\000a')||
'           AND comocm_pkg.comocm_replica_est (comocm.ID) = ''PARA REVISAR POR EL PROVEEDOR'')';

wwv_flow_api.create_page_plug (
  p_id=> 71301922326627251 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Calificación para Revisar ',
  p_region_name=>'',
  p_parent_plug_id=>71299303036404006 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 56,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_grid_column_span => 3,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_COM.ORACLE.APEX.BIG_VALUE_LIST',
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
  p_attribute_01=> 'LABEL',
  p_attribute_02 => 'VALUE',
  p_attribute_03 => 'PCT',
  p_attribute_04 => '&URL.',
  p_attribute_05 => '1',
  p_attribute_06 => 'B',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT ''Ordenes con Entregas Vencidas '' label, COUNT (comocm_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:420:&SESSION.::NO:RIR,420:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P420_COMECO_ID,P420_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,OEV'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comocm.ID comocm_id'||unistr('\000a')||
'          FROM com_ordenes_compras comocm'||unistr('\000a')||
'--      ';

s:=s||'       , com_ordenes_compras_est comoce'||unistr('\000a')||
'         WHERE comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'--           AND comocm.comoce_id = comoce.ID'||unistr('\000a')||
'--           AND comoce.estado = ''APR'''||unistr('\000a')||
'           AND comocm.comoce_estado = ''APR'''||unistr('\000a')||
'           AND comocm.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comocm_pkg.comocm_ent_venc_sn (p_comocm_id => comocm.ID) = ''SI'''||unistr('\000a')||
''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
''||unistr('\000a')||
'        SELECT comocm.ID comocm_id'||unistr('\000a')||
' ';

s:=s||'         FROM com_ordenes_compras comocm'||unistr('\000a')||
'--             , com_ordenes_compras_est comoce'||unistr('\000a')||
'         WHERE comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'--           AND comoce.estado = ''APR'''||unistr('\000a')||
'--           AND comocm.comoce_id = comoce.ID'||unistr('\000a')||
'           AND comocm.comoce_estado = ''APR'''||unistr('\000a')||
'           AND comocm.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'                                      FROM com_contratantes_vinc vin'||unistr('\000a')||
'   ';

s:=s||'                                  WHERE vin.comeco_id_padre = :P1_COMECO_ID)'||unistr('\000a')||
'           AND comocm_pkg.comocm_ent_venc_sn (p_comocm_id => comocm.ID) = ''SI'')'||unistr('\000a')||
''||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 71302206527632145 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Ordenes con Entregas Vencidas',
  p_region_name=>'',
  p_parent_plug_id=>71299303036404006 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 57,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_grid_column_span => 3,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_COM.ORACLE.APEX.BIG_VALUE_LIST',
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
  p_attribute_01=> 'LABEL',
  p_attribute_02 => 'VALUE',
  p_attribute_03 => 'PCT',
  p_attribute_04 => '&URL.',
  p_attribute_05 => '1',
  p_attribute_06 => 'B',
  p_plug_comment=> 'SELECT ''Ordenes con Entregas Vencidas '' label, COUNT (comocm_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:420:&SESSION.::NO:RIR,420:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P420_COMECO_ID,P420_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,OEV'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comocm.ID comocm_id'||unistr('\000a')||
'          FROM com_ordenes_compras comocm, com_ordenes_compras_est comoce'||unistr('\000a')||
'         WHERE comocm.comoce_id = comoce.ID'||unistr('\000a')||
'           AND comoce.estado = ''APR'''||unistr('\000a')||
'           AND comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comocm.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comocm_pkg.comocm_ent_venc_sn (p_comocm_id => comocm.ID) = ''SI'''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
'        SELECT comocm.ID comocm_id'||unistr('\000a')||
'          FROM com_ordenes_compras comocm, com_ordenes_compras_est comoce'||unistr('\000a')||
'         WHERE comocm.comoce_id = comoce.ID'||unistr('\000a')||
'           AND comoce.estado = ''APR'''||unistr('\000a')||
'           AND comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comocm.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'                                      FROM com_contratantes_vinc vin'||unistr('\000a')||
'                                     WHERE vin.comeco_id_padre = :P1_COMECO_ID)'||unistr('\000a')||
'           AND comocm_pkg.comocm_ent_venc_sn (p_comocm_id => comocm.ID) = ''SI'')'||unistr('\000a')||
'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT ''Ordenes con Entregas para Autorizar '' label, COUNT (comocm_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:420:&SESSION.::NO:RIR,420:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P420_COMECO_ID,P420_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,OER'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comocm.ID comocm_id'||unistr('\000a')||
'          FROM com_ordenes_compras comocm'||unistr('\000a')||
'--';

s:=s||'             , com_ordenes_compras_est comoce'||unistr('\000a')||
'         WHERE comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comocm.comoce_estado = ''APR'''||unistr('\000a')||
'--           AND comoce.estado = ''APR'''||unistr('\000a')||
'--           AND comocm.comoce_id = comoce.ID'||unistr('\000a')||
'           AND comocm.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comocm_pkg.comocm_ent_aut_sn (p_comocm_id => comocm.ID) = ''SI'''||unistr('\000a')||
''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
''||unistr('\000a')||
'        SELECT comocm.ID comocm';

s:=s||'_id'||unistr('\000a')||
'          FROM com_ordenes_compras comocm'||unistr('\000a')||
'--             , com_ordenes_compras_est comoce'||unistr('\000a')||
'         WHERE comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'--           AND comoce.estado = ''APR'''||unistr('\000a')||
'           AND comocm.comoce_estado = ''APR'''||unistr('\000a')||
'--           AND comocm.comoce_id = comoce.ID'||unistr('\000a')||
'           AND comocm.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'                                      FROM com_contratantes_vinc vi';

s:=s||'n'||unistr('\000a')||
'                                     WHERE vin.comeco_id_padre = :P1_COMECO_ID)'||unistr('\000a')||
'           AND comocm_pkg.comocm_ent_aut_sn (p_comocm_id => comocm.ID) = ''SI'')'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 71302522457636759 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Ordenes con Entregas para Autorizar',
  p_region_name=>'',
  p_parent_plug_id=>71299303036404006 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 58,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_grid_column_span => 3,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_COM.ORACLE.APEX.BIG_VALUE_LIST',
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
  p_attribute_01=> 'LABEL',
  p_attribute_02 => 'VALUE',
  p_attribute_03 => 'PCT',
  p_attribute_04 => '&URL.',
  p_attribute_05 => '1',
  p_attribute_06 => 'B',
  p_plug_comment=> 'SELECT ''Ordenes con Entregas para Autorizar '' label, COUNT (comocm_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:420:&SESSION.::NO:RIR,420:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P420_COMECO_ID,P420_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,OER'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comocm.ID comocm_id'||unistr('\000a')||
'          FROM com_ordenes_compras comocm'||unistr('\000a')||
'             , com_ordenes_compras_est comoce'||unistr('\000a')||
'         WHERE comocm.comoce_id = comoce.ID'||unistr('\000a')||
'           AND comoce.estado = ''APR'''||unistr('\000a')||
'           AND comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comocm.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comocm_pkg.comocm_ent_aut_sn (p_comocm_id => comocm.ID) = ''SI'''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
'        SELECT comocm.ID comocm_id'||unistr('\000a')||
'          FROM com_ordenes_compras comocm'||unistr('\000a')||
'             , com_ordenes_compras_est comoce'||unistr('\000a')||
'         WHERE comocm.comoce_id = comoce.ID'||unistr('\000a')||
'           AND comoce.estado = ''APR'''||unistr('\000a')||
'           AND comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comocm.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'                                      FROM com_contratantes_vinc vin'||unistr('\000a')||
'                                     WHERE vin.comeco_id_padre = :P1_COMECO_ID)'||unistr('\000a')||
'           AND comocm_pkg.comocm_ent_aut_sn (p_comocm_id => comocm.ID) = ''SI'')'||unistr('\000a')||
'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT ''Ordenes Vencidas a Calificar '' label, COUNT (comocm_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:420:&SESSION.::NO:RIR,420:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P420_COMECO_ID,P420_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,OVC'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comocm.ID comocm_id'||unistr('\000a')||
'          FROM com_ordenes_compras comocm'||unistr('\000a')||
'--       ';

s:=s||'      , com_ordenes_compras_est comoce'||unistr('\000a')||
'         WHERE comocm.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'--           AND comocm.comoce_id = comoce.ID'||unistr('\000a')||
'           AND comocm.comoce_estado = ''APR'''||unistr('\000a')||
'           AND comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comocm_pkg.comocm_vencida_sn (p_segorg_id      => :P1_SEGORG_ID,'||unistr('\000a')||
'                                             p_comocm_id      => comocm.ID'||unistr('\000a')||
'                    ';

s:=s||'                        ) = ''SI'')';

wwv_flow_api.create_page_plug (
  p_id=> 71302821895646068 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Ordenes Vencidas a Calificar',
  p_region_name=>'',
  p_parent_plug_id=>71299303036404006 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 59,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_grid_column_span => 3,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_COM.ORACLE.APEX.BIG_VALUE_LIST',
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
  p_attribute_01=> 'LABEL',
  p_attribute_02 => 'VALUE',
  p_attribute_03 => 'PCT',
  p_attribute_04 => '&URL.',
  p_attribute_05 => '1',
  p_attribute_06 => 'B',
  p_plug_comment=> 'SELECT ''Ordenes Vencidas a Calificar '' label, COUNT (comocm_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:420:&SESSION.::NO:RIR,420:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P420_COMECO_ID,P420_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,OVC'''||unistr('\000a')||
'                                                                          url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comocm.ID comocm_id'||unistr('\000a')||
'          FROM com_ordenes_compras comocm'||unistr('\000a')||
'             , com_ordenes_compras_est comoce'||unistr('\000a')||
'         WHERE comocm.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comocm.comoce_id = comoce.ID'||unistr('\000a')||
'           AND comoce.estado = ''APR'''||unistr('\000a')||
'           AND comocm.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comocm_pkg.comocm_vencida_sn (p_segorg_id      => :P1_SEGORG_ID,'||unistr('\000a')||
'                                             p_comocm_id      => comocm.ID'||unistr('\000a')||
'                                            ) = ''SI'')');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT ''Trámites Proveedores para Atender '' label, COUNT (comtpr_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMPRV:210:&SESSION.::NO:RIR,210:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P210_COMECO_ID,P210_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,&P1_COMECO_ID.,TPE'' url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (select comtpr.id comtpr_id'||unistr('\000a')||
'from com_tramites_prv comtpr'||unistr('\000a')||
'   , com_tramites_prv_rgp comtpg'||unistr('\000a')||
'where comtpg.comtpr_id = comtpr.id'||unistr('\000a')||
'and com';

s:=s||'tpg.comrgp_id = (select max(comrgp_id)'||unistr('\000a')||
'    from com_contratantes_rgp'||unistr('\000a')||
'    where comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'      and validez_fch is null) '||unistr('\000a')||
'and comtpr.situacion <> ''NUE'''||unistr('\000a')||
'and comtpr.comprv_id is null'||unistr('\000a')||
'and comtpr.situacion in (''PEN'',''REC'',''CUR'')'||unistr('\000a')||
'union all'||unistr('\000a')||
'select comtpr.id comtpr_id'||unistr('\000a')||
'from com_tramites_prv comtpr'||unistr('\000a')||
'   , com_proveedores_rgp comprg '||unistr('\000a')||
'where comprg.comprv_id = comtpr.comprv_id'||unistr('\000a')||
'and comprg.comrgp_i';

s:=s||'d = (select max(comrgp_id)'||unistr('\000a')||
'    from com_contratantes_rgp'||unistr('\000a')||
'    where comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'      and validez_fch is null) '||unistr('\000a')||
'and comprg.validez_fch is null'||unistr('\000a')||
'and comprg.situacion <> ''BAJ'''||unistr('\000a')||
'and comtpr.situacion <> ''NUE'''||unistr('\000a')||
'and comtpr.comprv_id is not null'||unistr('\000a')||
'and comtpr.situacion in (''PEN'',''REC'',''CUR'')) comtpr';

wwv_flow_api.create_page_plug (
  p_id=> 77087923035453985 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Trámites para Atender',
  p_region_name=>'',
  p_parent_plug_id=>71299303036404006 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 41,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_COM.ORACLE.APEX.BIG_VALUE_LIST',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_required_role => 76028231631522937+ wwv_flow_api.g_id_offset,
  p_plug_display_condition_type => 'EXISTS',
  p_plug_display_when_condition => 'select 1'||unistr('\000a')||
'from   COM_CONTRATANTES comeco'||unistr('\000a')||
'where  comeco.ID = :P1_COMECO_ID'||unistr('\000a')||
'and    comeco.REGISTROPRV_SN = ''SI''',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'LABEL',
  p_attribute_02 => 'VALUE',
  p_attribute_03 => 'PCT',
  p_attribute_04 => '&URL.',
  p_attribute_05 => '1',
  p_attribute_06 => 'B',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT ''Proveedores Habilitados en el Registro '' label, COUNT (comprv_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMPRV:200:&SESSION.::NO:RIR,200:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P200_COMECO_ID,P200_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,&P1_COMECO_ID.,PAC'' url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (select comprv.id comprv_id'||unistr('\000a')||
'        from com_proveedores comprv'||unistr('\000a')||
'           , com_proveedores_est compre'||unistr('\000a')||
'           , com_regist';

s:=s||'ros_prv comrgp'||unistr('\000a')||
'           , com_proveedores_rgp comprg'||unistr('\000a')||
'where comprv.id = compre.comprv_id'||unistr('\000a')||
'  and compre.id = com_pkg.obtn_compre_id (comprv.id)'||unistr('\000a')||
'  and comprg.comprv_id = comprv.id'||unistr('\000a')||
'  and comprg.comrgp_id = comrgp.id'||unistr('\000a')||
'  and comprg.validez_fch is null'||unistr('\000a')||
'  and comrgp.id = (select max(comrgp_id)'||unistr('\000a')||
'    from com_contratantes_rgp'||unistr('\000a')||
'    where comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'      and validez_fch is null)'||unistr('\000a')||
'  and (compre.es';

s:=s||'tado not in (''BAJ'',''SUS'') and comprg.situacion = ''VIG'')'||unistr('\000a')||
' ) comprv';

wwv_flow_api.create_page_plug (
  p_id=> 77105107657714540 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Proveedores Activos',
  p_region_name=>'',
  p_parent_plug_id=>71299303036404006 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 42,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_COM.ORACLE.APEX.BIG_VALUE_LIST',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_required_role => 76028401642552000+ wwv_flow_api.g_id_offset,
  p_plug_display_condition_type => 'EXISTS',
  p_plug_display_when_condition => 'select 1'||unistr('\000a')||
'from   COM_CONTRATANTES comeco'||unistr('\000a')||
'where  comeco.ID = :P1_COMECO_ID'||unistr('\000a')||
'and    comeco.REGISTROPRV_SN = ''SI''',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'LABEL',
  p_attribute_02 => 'VALUE',
  p_attribute_03 => 'PCT',
  p_attribute_04 => '&URL.',
  p_attribute_05 => '1',
  p_attribute_06 => 'B',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT ''Proveedores Suspendidos en el Registro '' label, COUNT (comprv_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMPRV:200:&SESSION.::NO:RIR,200:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P200_COMECO_ID,P200_FILTRO_PREDEFINIDO_SEL:&APP_ID.,&APP_PAGE_ID.,&P1_COMECO_ID.,PSU'' url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (select comprv.id comprv_id'||unistr('\000a')||
'        from com_proveedores comprv'||unistr('\000a')||
'           , com_proveedores_est compre'||unistr('\000a')||
'           , com_regist';

s:=s||'ros_prv comrgp'||unistr('\000a')||
'           , com_proveedores_rgp comprg'||unistr('\000a')||
'where comprv.id = compre.comprv_id'||unistr('\000a')||
'  and compre.id = com_pkg.obtn_compre_id (comprv.id)'||unistr('\000a')||
'  and comprg.comprv_id = comprv.id'||unistr('\000a')||
'  and comprg.comrgp_id = comrgp.id'||unistr('\000a')||
'  and comprg.validez_fch is null'||unistr('\000a')||
'  and comrgp.id = (select max(comrgp_id)'||unistr('\000a')||
'    from com_contratantes_rgp'||unistr('\000a')||
'    where comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'      and validez_fch is null)'||unistr('\000a')||
'  and (compre.es';

s:=s||'tado = ''SUS'' or comprg.situacion = ''SUS'')'||unistr('\000a')||
' ) comprv';

wwv_flow_api.create_page_plug (
  p_id=> 77109713638772982 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Proveedores Suspendidos',
  p_region_name=>'',
  p_parent_plug_id=>71299303036404006 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 43,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_COM.ORACLE.APEX.BIG_VALUE_LIST',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_required_role => 76028401642552000+ wwv_flow_api.g_id_offset,
  p_plug_display_condition_type => 'EXISTS',
  p_plug_display_when_condition => 'select 1'||unistr('\000a')||
'from   COM_CONTRATANTES comeco'||unistr('\000a')||
'where  comeco.ID = :P1_COMECO_ID'||unistr('\000a')||
'and    comeco.REGISTROPRV_SN = ''SI''',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'LABEL',
  p_attribute_02 => 'VALUE',
  p_attribute_03 => 'PCT',
  p_attribute_04 => '&URL.',
  p_attribute_05 => '1',
  p_attribute_06 => 'B',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT ''Pedidos Pendientes de Autorización '' label, COUNT (comped_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:220:&SESSION.::NO:RIR,220:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P220_COMECO_ID,P220_COMPED_EJERCICIO,P220_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,&P1_COMPED_EJERCICIO.,PAU'' url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comped.ID comped_id'||unistr('\000a')||
'          FROM com_pedidos comped'||unistr('\000a')||
'--             , com_pedidos_est compee'||unistr('\000a')||
' ';

s:=s||'        WHERE comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'--           AND comped.compee_id = compee.ID'||unistr('\000a')||
'           AND comped.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'--           AND compee.estado = ''PAU'''||unistr('\000a')||
'           AND comped.compee_estado = ''PAU'''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
'        SELECT comped.ID comped_id'||unistr('\000a')||
'          FROM com_pedidos comped'||unistr('\000a')||
'--             , com_pedidos_est c';

s:=s||'ompee'||unistr('\000a')||
'         WHERE comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'--           AND comped.compee_id = compee.ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'--           AND compee.estado = ''PAU'''||unistr('\000a')||
'           AND comped.compee_estado = ''PAU'''||unistr('\000a')||
'           AND comped.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'                                      FROM com_contratantes_vinc vin'||unistr('\000a')||
'                               ';

s:=s||'      WHERE vin.comeco_id_padre =  :P1_COMECO_ID'||unistr('\000a')||
'         ))';

wwv_flow_api.create_page_plug (
  p_id=> 170443848259653166 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Pedidos Pendientes de Autorización',
  p_region_name=>'',
  p_parent_plug_id=>71299303036404006 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 51,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_grid_column_span => 3,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_COM.ORACLE.APEX.BIG_VALUE_LIST',
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
  p_attribute_01=> 'LABEL',
  p_attribute_02 => 'VALUE',
  p_attribute_03 => 'PCT',
  p_attribute_04 => '&URL.',
  p_attribute_05 => '1',
  p_attribute_06 => 'B',
  p_plug_comment=> 'SELECT ''Pedidos Pendientes de Autorización '' label, COUNT (comped_id) VALUE,'||unistr('\000a')||
'       ''f?p=COMCON:220:&SESSION.::NO:RIR,220:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P220_COMECO_ID,P220_COMPED_EJERCICIO,P220_FILTRO_PREDEFINIDO_SEL:2806,1,&P1_COMECO_ID.,&P1_COMPED_EJERCICIO.,PAU'' url,'||unistr('\000a')||
'       100 pct'||unistr('\000a')||
'  FROM (SELECT comped.ID comped_id'||unistr('\000a')||
'          FROM com_pedidos comped,'||unistr('\000a')||
'               com_pedidos_est compee'||unistr('\000a')||
'         WHERE comped.compee_id = compee.ID'||unistr('\000a')||
'           AND comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comped.comeco_id = :P1_COMECO_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND compee.estado = ''PAU'''||unistr('\000a')||
'        UNION ALL'||unistr('\000a')||
'        SELECT comped.ID comped_id'||unistr('\000a')||
'          FROM com_pedidos comped,'||unistr('\000a')||
'               com_pedidos_est compee'||unistr('\000a')||
'         WHERE comped.compee_id = compee.ID'||unistr('\000a')||
'           AND comped.segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'           AND comped.ejercicio = :P1_COMPED_EJERCICIO'||unistr('\000a')||
'           AND compee.estado = ''PAU'''||unistr('\000a')||
'           AND comped.comeco_id IN (SELECT vin.comeco_id_hijo'||unistr('\000a')||
'                                      FROM com_contratantes_vinc vin'||unistr('\000a')||
'                                     WHERE vin.comeco_id_padre = :P1_COMECO_ID))');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'htp.print(''Los valores obtenidos por los indicadores son SOLO del Ejercicio seleecionado.'');';

wwv_flow_api.create_page_plug (
  p_id=> 72216009611200142 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Cambiar Ejercicio',
  p_region_name=>'Cambiar_Ejercicio',
  p_region_attributes=> 'title="Cambiar Ejercicio de los Indicadores"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186458876129809941+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 160,
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
  p_id=> 118767524678855106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Entidad Contratante',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186458876129809941+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
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
s:=s||'declare'||unistr('\000a')||
' cursor cr_cfgalt is'||unistr('\000a')||
' select QUERY'||unistr('\000a')||
'   from cfg_alertas_tipos cfgalt'||unistr('\000a')||
'  where segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
'    and sysdate between nvl(fecha_desde, sysdate) and nvl(fecha_hasta, sysdate)'||unistr('\000a')||
'    and situacion = ''VIG'' '||unistr('\000a')||
'    and CFG_BI_PKG.CFGALT_SEGUSU_AUTH(:P1_SEGUSU_ID, cfgalt.ID) = ''SI'';'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_return clob;'||unistr('\000a')||
'  v_dummy NUMBER := 1; '||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  for v_cfgalt in cr_cfgalt loop'||unistr('\000a')||
'    --'||unistr('\000a')||
'    if v_dummy';

s:=s||' = 1 then'||unistr('\000a')||
'      v_return := v_cfgalt.QUERY;'||unistr('\000a')||
'      v_dummy := 0;'||unistr('\000a')||
'    else '||unistr('\000a')||
'      v_return := v_return ||'' union all ''|| v_cfgalt.QUERY;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    --'||unistr('\000a')||
'  end loop;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  RETURN v_return;'||unistr('\000a')||
'  --'||unistr('\000a')||
'end;'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 124746523625941655 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Alertas',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186454190715809938+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 130,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_ALERT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'EXISTS',
  p_plug_display_when_condition => 'Select 1'||unistr('\000a')||
'from cfg_alertas_tipos cfgalt'||unistr('\000a')||
'where segorg_id = :P1_SEGORG_ID'||unistr('\000a')||
' and sysdate between nvl(fecha_desde, sysdate) and nvl(fecha_hasta, sysdate)'||unistr('\000a')||
'    and situacion = ''VIG'' '||unistr('\000a')||
'    and CFG_BI_PKG.CFGALT_SEGUSU_AUTH(:P1_SEGUSU_ID, cfgalt.ID) = ''SI'';',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'P1_HABILITADO_SN',
  p_attribute_02 => 'ALERT_EXECUTE_SN',
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
  p_id=> 170433750254322638 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Menú Entidades Contratantes',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 170432336402318578 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 186465093776809944+ wwv_flow_api.g_id_offset,
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
s:=s||'htp.print('''');';

wwv_flow_api.create_page_plug (
  p_id=> 171381040818210286 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Video Introducción',
  p_region_name=>'dialog-video',
  p_region_attributes=> 'title="Video Introducción"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186458876129809941+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 120,
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
s:=s||'htp.print(:P1_NOTICIAS);';

wwv_flow_api.create_page_plug (
  p_id=> 209458474502883294 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Noticias',
  p_region_name=>'',
  p_region_attributes=> 'style="min-height:40px;"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186458876129809941+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
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
  p_plug_header=> '<div style="float:right;margin: 0px 4px 0 0;"><a onclick="abrir_news(); return false;" href="f?p=&APP_ID.:1:&SESSION.::::"><img border="0" title="Ver Todas las Noticias" alt="Ver Todas las Noticias" src="#IMAGE_PREFIX#menu/go-small.png"></a></div>',
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
s:=s||'htp.print(:P1_NOTICIAS_TODAS);';

wwv_flow_api.create_page_plug (
  p_id=> 210248580446035514 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Todas las Noticias',
  p_region_name=>'dialog-modal',
  p_region_attributes=> 'title="Todas las Noticias"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186458876129809941+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 110,
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
s:=s||'22148815502294520';

wwv_flow_api.create_page_plug (
  p_id=> 475655303046828944 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Accesos',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186459500426809941+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 150,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 475655006032820311 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 186467491855809945+ wwv_flow_api.g_id_offset,
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
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 72215823332194645 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1,
  p_button_sequence=> 10,
  p_button_plug_id => 71299303036404006+wwv_flow_api.g_id_offset,
  p_button_name    => 'CAMBIAR_EJERCICIO',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => '#IMAGE_PREFIX#asfdcldr.gif',
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Cambiar Ejercicio',
  p_button_position=> 'RIGHT_OF_TITLE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:cambiar_ejercicio();',
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
  p_id=>63273912824240329 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_COMECO_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 250,
  p_item_plug_id => 118767524678855106+wwv_flow_api.g_id_offset,
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
  p_id=>72182431452714731 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_COMPED_EJERCICIO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 260,
  p_item_plug_id => 72216009611200142+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Ejercicio activo : ',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select EJERCICIO d, EJERCICIO r'||unistr('\000a')||
'from   COM_EJERCICIOS_V'||unistr('\000a')||
'order by 1 DESC',
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
  p_field_template=> 186468899752809946+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'REDIRECT_SET_VALUE',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>124747222370955974 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_HABILITADO_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 240,
  p_item_plug_id => 124746523625941655+wwv_flow_api.g_id_offset,
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
  p_id=>171402232636639906 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_VIDEO_IFRAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 230,
  p_item_plug_id => 475655303046828944+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '<iframe width="670" height="430" src="//www.youtube.com/embed/YArO_LqW2Sk" frameborder="0" allowfullscreen id="clearmySound"></iframe>',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'<iframe width="670" height="430" src="//www.youtube.com/embed/YArO_LqW2Sk" frameborder="0" allowfullscreen id="clearmySound"></iframe>',
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
  p_id=>201030359077071917 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_COMECO_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 210,
  p_item_plug_id => 118767524678855106+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Entidad Contratante:',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select NOMBRE d'||unistr('\000a')||
'     --NOMBRE||'' - CODIGO: ''||to_char(CODIGO) d'||unistr('\000a')||
'     , ID r'||unistr('\000a')||
'  from COM_CONTRATANTES'||unistr('\000a')||
' where SEGORG_ID = :P1_SEGORG_ID'||unistr('\000a')||
'   and ID = :P1_COMECO_ID',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> null,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_field_template=> 186468899752809946+wwv_flow_api.g_id_offset,
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
  p_id=>203934576998750313 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_NOTICIAS_TODAS',
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
  p_cSize=> null,
  p_cMaxlength=> 4000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
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
  p_id=>209458985237886395 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_NOTICIAS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 190,
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
  p_begin_on_new_field=> 'NO',
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
  p_id=>209459159742888481 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGORG_COPYRIGHT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 170,
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
  p_begin_on_new_field=> 'NO',
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
  p_id=>386976556468391566 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_APP_THEME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 160,
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
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>475650322468711553 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_APP_ANTERIOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 130,
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
  p_id=>475650495240713144 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_APP_ANTERIOR_PAG',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 140,
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
  p_id=>475650699742714380 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_PAG_ANTERIOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 150,
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
  p_id=>497705236408002423 + wwv_flow_api.g_id_offset,
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
  p_id=>497705447836005653 + wwv_flow_api.g_id_offset,
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
  p_id=>497705623379008070 + wwv_flow_api.g_id_offset,
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
  p_id=>497717130500549475 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGUSU_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 475655303046828944+wwv_flow_api.g_id_offset,
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
  p_id=>497718316741602317 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGUSU_DOCUMENTO_TIPO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 90,
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
  p_id=>497718522629603937 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGUSU_DOCUMENTO_NUMERO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 100,
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
  p_id=>497718726092604987 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGUSU_NOMBRE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 110,
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
  p_id=>497718929901606068 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGUSU_EMAIL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 120,
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
  p_id=>519759627242760123 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGORG_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 475655303046828944+wwv_flow_api.g_id_offset,
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
  p_id=>519759832090761606 + wwv_flow_api.g_id_offset,
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
  p_id=>519760037977763231 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEGORG_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Segorg Codigo',
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

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'341092727939678388';

wwv_flow_api.create_page_process(
  p_id     => 200061045326296058 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'InicializarOrganizaciónPorDefault',
  p_process_sql_clob => 341092727939678388 + wwv_flow_api.g_id_offset,
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
p:=p||'200053147563183103';

wwv_flow_api.create_page_process(
  p_id     => 200061253291298300 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 20,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'InicializarTemaPorDefault',
  p_process_sql_clob => 200053147563183103 + wwv_flow_api.g_id_offset,
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
p:=p||'519760722571796692';

wwv_flow_api.create_page_process(
  p_id     => 200061462295300935 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 30,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'CargarDatosOrganizacion',
  p_process_sql_clob => 519760722571796692 + wwv_flow_api.g_id_offset,
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
p:=p||'IF :P1_APP_ANTERIOR is null then'||unistr('\000a')||
'  :P1_APP_ANTERIOR := v(''APP_ID'');'||unistr('\000a')||
'END IF;';

wwv_flow_api.create_page_process(
  p_id     => 200359061915342706 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 40,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AsignarAplicacionAnterior',
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
'  cursor cr_comcnr is'||unistr('\000a')||
'  select comeco_id'||unistr('\000a')||
'  from COM_CONTRATANTES_RES'||unistr('\000a')||
'  where segusu_id = :P1_SEGUSU_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_dummy number; '||unistr('\000a')||
'  --   '||unistr('\000a')||
'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
'  open cr_comcnr;'||unistr('\000a')||
'  fetch cr_comcnr into :P1_COMECO_ID;'||unistr('\000a')||
'  close cr_comcnr;'||unistr('\000a')||
'  --'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 201030963017082460 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 50,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ObtenerIdEntidadContratante',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P1_COMECO_ID',
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
p:=p||'63304007524640245';

wwv_flow_api.create_page_process(
  p_id     => 77453519559689976 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 100,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'Cambiar Entidad Contratante',
  p_process_sql_clob => 63304007524640245 + wwv_flow_api.g_id_offset,
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
p:=p||'209457879565875335';

wwv_flow_api.create_page_process(
  p_id     => 209470259930002088 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 110,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'ObtenerNoticias',
  p_process_sql_clob => 209457879565875335 + wwv_flow_api.g_id_offset,
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
p:=p||':P1_HABILITADO_SN := ''SI'';';

wwv_flow_api.create_page_process(
  p_id     => 124747320077959580 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 120,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AsignarHabilitadoSNAlerta',
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
p:=p||'declare '||unistr('\000a')||
'  cursor cr_comejr is'||unistr('\000a')||
'   select MIN(EJERCICIO)  EJERCICIO'||unistr('\000a')||
'     from   COM_EJERCICIOS_V'||unistr('\000a')||
'    where  SITUACION = ''ABI'';'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_comejr cr_comejr%rowtype;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'   open cr_comejr;'||unistr('\000a')||
'   fetch cr_comejr into v_comejr;'||unistr('\000a')||
'   close cr_comejr;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   :P1_COMPED_EJERCICIO := nvl(v_comejr.EJERCICIO,2015); '||unistr('\000a')||
'   --'||unistr('\000a')||
'  '||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 72203003172933390 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 999,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Obtener Datos Generales',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P1_COMPED_EJERCICIO',
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

 
--application/pages/page_00020
prompt  ...PAGE 20: Servicios
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 20
 ,p_user_interface_id => 170453256197545135 + wwv_flow_api.g_id_offset
 ,p_name => 'Servicios'
 ,p_alias => 'SRV'
 ,p_step_title => 'Servicios'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Servicios'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_html_page_header => 
'<style>'||unistr('\000a')||
'#dialog-modal{display:none;}'||unistr('\000a')||
'</style>'
 ,p_javascript_code => 
'function NewsTicker(pNewsjQueryObject, pNewsList, pSeconds, pFadeSpeed) {'||unistr('\000a')||
'  var lNextNewsEntry = null;'||unistr('\000a')||
'  function showNews() {'||unistr('\000a')||
'    pNewsjQueryObject'||unistr('\000a')||
'      .fadeOut(pFadeSpeed)'||unistr('\000a')||
'      .queue(function(){'||unistr('\000a')||
'               apex.jQuery(this).html(pNewsList[lNextNewsEntry]);'||unistr('\000a')||
'               apex.jQuery(this).dequeue();'||unistr('\000a')||
'             })'||unistr('\000a')||
'      .fadeIn(pFadeSpeed);'||unistr('\000a')||
'    // queue in the next news entry. Start fro'||
'm the beginning if the end is reached'||unistr('\000a')||
'    lNextNewsEntry++;'||unistr('\000a')||
'    if (lNextNewsEntry == pNewsList.length) { lNextNewsEntry=0 };'||unistr('\000a')||
'    setTimeout(showNews, pSeconds*1500);'||unistr('\000a')||
'  };'||unistr('\000a')||
'  // Show the first entry immediately. If there are more entries start the rotator'||unistr('\000a')||
'  if (pNewsList.length > 0) {'||unistr('\000a')||
'    pNewsjQueryObject.html(pNewsList[0]);'||unistr('\000a')||
'    if (pNewsList.length > 1) {'||unistr('\000a')||
'      lNextNewsEntry = 1;'||unistr('\000a')||
'      setTimeou'||
't(showNews, pSeconds*1500);'||unistr('\000a')||
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
''
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No hay ayuda disponible para esta página.'
 ,p_last_updated_by => 'JPREDA'
 ,p_last_upd_yyyymmddhh24miss => '20140911105503'
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
  p_id=> 209482256973106406 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 20,
  p_plug_name=> 'Atributos de Página',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186459200300809941+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_03',
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
s:=s||'Los Servicios le permitrán el acceso a información privilegiada y la posibilidad de realizar operaciones en forma directa.<br><br> Podrá, entre otras cosas, consultar la biblioteca de documentos, la guía de trámites y realizar el seguimiento de sus solicitudes a traves de su Bandeja de Trámites.<br><br>';

wwv_flow_api.create_page_plug (
  p_id=> 209482682618106408 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 20,
  p_plug_name=> 'Acerca de',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186459200300809941+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_03',
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
s:=s||'htp.print(:P1_NOTICIAS);';

wwv_flow_api.create_page_plug (
  p_id=> 209483058827106408 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 20,
  p_plug_name=> 'Noticias',
  p_region_name=>'',
  p_region_attributes=> 'style="min-height:40px;"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186458876129809941+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 60,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => false,
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
  p_plug_header=> '<div style="float:right;margin: 0px 4px 0 0;"><a onclick="abrir_news(); return false;" href="f?p=&APP_ID.:1:&SESSION.::::"><img border="0" title="Ver Todas las Noticias" alt="Ver Todas las Noticias" src="#IMAGE_PREFIX#menu/go-small.png"></a></div>',
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
  p_id=> 209483264928106408 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 20,
  p_plug_name=> 'Menu Servicios',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186457877751809940+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 209485766191106430 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 186465093776809944+ wwv_flow_api.g_id_offset,
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
  p_id=> 209483456378106408 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 20,
  p_plug_name=> 'Ruta de Navegación',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186455092510809939+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(519748728168040462 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 186470588338809947+ wwv_flow_api.g_id_offset,
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
s:=s||'htp.print(:P1_NOTICIAS_TODAS);';

wwv_flow_api.create_page_plug (
  p_id=> 210251460200143210 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 20,
  p_plug_name=> 'Todas las Noticias',
  p_region_name=>'dialog-modal',
  p_region_attributes=> 'title="Todas las Noticias"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186458876129809941+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 70,
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
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>209482480527106406 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 20,
  p_name=>'P20_ACTIVAR_NOTICIAS_SN',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 190,
  p_item_plug_id => 209482256973106406+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'SI',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Activar Noticias',
  p_source=>'SI',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_RADIOGROUP',
  p_lov=> 'STATIC2:SI;SI,NO;NO',
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
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 186468689908809946+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => '2',
  p_attribute_02 => 'REDIRECT_SET_VALUE',
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
p:=p||'475651220521720431';

wwv_flow_api.create_page_process(
  p_id     => 200055469343236747 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 20,
  p_process_sequence=> 50,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'CargarAplicaciónAnterior',
  p_process_sql_clob => 475651220521720431 + wwv_flow_api.g_id_offset,
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
p:=p||'475651399181723708';

wwv_flow_api.create_page_process(
  p_id     => 200055742462238460 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 20,
  p_process_sequence=> 60,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'AnclarPágina',
  p_process_sql_clob => 475651399181723708 + wwv_flow_api.g_id_offset,
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
p:=p||'209457879565875335';

wwv_flow_api.create_page_process(
  p_id     => 200055950427240720 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 20,
  p_process_sequence=> 110,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'ObtenerNoticias',
  p_process_sql_clob => 209457879565875335 + wwv_flow_api.g_id_offset,
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
-- ...updatable report columns for page 20
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00101
prompt  ...PAGE 101: Utilidad de Conexión
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 101
 ,p_user_interface_id => 170453256197545135 + wwv_flow_api.g_id_offset
 ,p_name => 'Utilidad de Conexión'
 ,p_alias => 'LOGIN'
 ,p_step_title => 'Utilidad de Conexión'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Utilidad de Conexión'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_javascript_code => 
'$(document).ready(function() {  '||unistr('\000a')||
'  moveTo(0,0);'||unistr('\000a')||
'  window.resizeTo(screen.width, screen.height); '||unistr('\000a')||
'});'
 ,p_step_template => 186410375223809912 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'JPREDA'
 ,p_last_upd_yyyymmddhh24miss => '20151015165816'
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
  p_id=> 223148361133021143 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 101,
  p_plug_name=> 'Conectar a &P1_SEGAPL_NOMBRE.',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186459500426809941+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
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
 
begin
 
null;
 
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
  p_id=>62527127055783948 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 223148361133021143+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Codigo',
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
  p_id=>223148554661021144 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_APP_THEME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 223148361133021143+wwv_flow_api.g_id_offset,
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
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
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
  p_id=>223148761434021144 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_SEGORG_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 223148361133021143+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'&nbsp;',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select NOMBRE display_value, CODIGO return_value '||unistr('\000a')||
'from SEG_ORGANIZACIONES'||unistr('\000a')||
'where codigo <> ''INTERNAL'' and situacion = ''HAB'''||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 10,
  p_cMaxlength=> 10,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when=>'G_SEGAMB_TIPO',
  p_read_only_when2=>'DESA',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2',
  p_field_template=> 186468776143809946+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
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
  p_id=>223148954489021146 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_USERNAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 223148361133021143+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Username',
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
  p_id=>223149158512021146 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_DOCUMENTO_TIPO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 223148361133021143+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'DNI',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tipo Documento Operador :',
  p_source=>'DNI',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'SEGUSU_TIPO_DOCUMENTO',
  p_lov=> 'select rv_abbreviation d, rv_low_value r'||unistr('\000a')||
'from   cg_ref_codes'||unistr('\000a')||
'where  rv_domain = ''SEG_PERSONAS.TIPO_DOCUMENTO'''||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 186468776143809946+wwv_flow_api.g_id_offset,
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
  p_id=>223149371229021146 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_DOCUMENTO_NUMERO',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 223148361133021143+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'N° Documento Operador :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 28,
  p_cMaxlength=> 100,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 2,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 186468776143809946+wwv_flow_api.g_id_offset,
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
  p_id=>223149559791021146 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_PASSWORD',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 223148361133021143+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Contraseña :',
  p_post_element_text=>'<div style="margin-top:10px; text-align:right"><a href="f?p=&APP_ID.:105:&SESSION.:::105:P105_SEGORG_CODIGO:&P101_SEGORG_CODIGO." style="text-decoration: underline">¿Ha olvidado su contraseña?</a></div>',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_PASSWORD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 28,
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
  p_field_template=> 186468776143809946+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>223149765711021146 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_LOGIN',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 45,
  p_item_plug_id => 223148361133021143+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_item_default=> 'LOGIN',
  p_prompt=>'Conectar',
  p_source=>'LOGIN',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(186469992544809947 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_button_execute_validations=>'Y',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>223149970730021146 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_SEGUSU_TIPO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 223148361133021143+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tipo Usuario :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_field_template=> 186468776143809946+wwv_flow_api.g_id_offset,
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
 
wwv_flow_api.create_page_validation(
  p_id => 223150265999021146 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P101_DOCUMENTO_TIPO not null or zero',
  p_validation_sequence=> 10,
  p_validation => 'P101_DOCUMENTO_TIPO',
  p_validation_type => 'ITEM_NOT_NULL_OR_ZERO',
  p_error_message => 'Seleccione un valor.',
  p_always_execute=>'N',
  p_validation_condition_type=> 'NEVER',
  p_when_button_pressed=> 223149765711021146 + wwv_flow_api.g_id_offset,
  p_associated_item=> 223149158512021146 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 223150484578021149 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P101_DOCUMENTO_NUMERO not null',
  p_validation_sequence=> 20,
  p_validation => 'P101_DOCUMENTO_NUMERO',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Ingrese un valor.',
  p_always_execute=>'N',
  p_validation_condition_type=> 'NEVER',
  p_when_button_pressed=> 223149765711021146 + wwv_flow_api.g_id_offset,
  p_associated_item=> 223149371229021146 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 223150665477021149 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P101_PASSWORD not null',
  p_validation_sequence=> 30,
  p_validation => 'P101_PASSWORD',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Ingrese un valor.',
  p_always_execute=>'N',
  p_validation_condition_type=> 'NEVER',
  p_when_button_pressed=> 223149765711021146 + wwv_flow_api.g_id_offset,
  p_associated_item=> 223149559791021146 + wwv_flow_api.g_id_offset,
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
p:=p||'IF :P101_SEGORG_CODIGO IS NOT NULL THEN'||unistr('\000a')||
'  :P1_SEGORG_CODIGO := :P101_SEGORG_CODIGO;'||unistr('\000a')||
'  DECLARE '||unistr('\000a')||
'    cursor cr_segorg is'||unistr('\000a')||
'    SELECT ID'||unistr('\000a')||
'    FROM SEG_ORGANIZACIONES'||unistr('\000a')||
'    WHERE CODIGO = :P1_SEGORG_CODIGO;'||unistr('\000a')||
'    --'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    OPEN cr_segorg;'||unistr('\000a')||
'    FETCH cr_segorg into :P1_SEGORG_ID;'||unistr('\000a')||
'    CLOSE cr_segorg;'||unistr('\000a')||
'    --'||unistr('\000a')||
'  END;'||unistr('\000a')||
'END IF;'||unistr('\000a')||
'IF :P101_SEGUSU_TIPO IS NULL THEN'||unistr('\000a')||
'  :P101_SEGUSU_TIPO:=''ECOCOM'';'||unistr('\000a')||
'END IF;';

wwv_flow_api.create_page_process(
  p_id     => 223150975825021149 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AsignarOrganizacion',
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
'  cursor cr_comeco is'||unistr('\000a')||
'  select comeco.codigo'||unistr('\000a')||
'    from COM_CONTRATANTES_RES comcnr'||unistr('\000a')||
'        ,COM_CONTRATANTES comeco'||unistr('\000a')||
'   where comcnr.SITUACION = ''ACT'''||unistr('\000a')||
'     and comcnr.COMECO_ID = comeco.ID'||unistr('\000a')||
'     and comcnr.segusu_id in (select segusu.ID'||unistr('\000a')||
'                              from   SEG_USUARIOS segusu'||unistr('\000a')||
'                              where  segusu.USUARIO LIKE :P1_SEGORG_CODIGO||''.''||:P101_SEGUSU_TIPO||''';

p:=p||'.%.''||:P101_DOCUMENTO_TIPO||''.''||:P101_DOCUMENTO_NUMERO'||unistr('\000a')||
'                                and segusu.SITUACION = ''ACT'');'||unistr('\000a')||
' --'||unistr('\000a')||
' begin'||unistr('\000a')||
'   --'||unistr('\000a')||
'   :P1_COMECO_ID := NULL;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   open cr_comeco;'||unistr('\000a')||
'   fetch cr_comeco into :P101_CODIGO;'||unistr('\000a')||
'   close cr_comeco;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   :P101_USERNAME:= :P101_SEGORG_CODIGO||''.''||:P101_SEGUSU_TIPO||''.''||:P101_CODIGO||''.''||:P101_DOCUMENTO_TIPO||''.''||:P101_DOCUMENTO_NUMERO;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 223151953569021152 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ConformarUsername',
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
p:=p||'begin'||unistr('\000a')||
'owa_util.mime_header(''text/html'', FALSE);'||unistr('\000a')||
'owa_cookie.send('||unistr('\000a')||
'    name=>''LOGIN_COMECO_SEGORG_COOKIE'','||unistr('\000a')||
'    value=>lower(:P101_SEGORG_CODIGO));'||unistr('\000a')||
'owa_cookie.send('||unistr('\000a')||
'    name=>''LOGIN_COMECO_SEGUSU_TIPO_COOKIE'','||unistr('\000a')||
'    value=>lower(:P101_SEGUSU_TIPO));'||unistr('\000a')||
'owa_cookie.send('||unistr('\000a')||
'    name=>''LOGIN_COMECO_CODIGO_COOKIE'','||unistr('\000a')||
'    value=>lower(:P101_CUIT));'||unistr('\000a')||
'owa_cookie.send('||unistr('\000a')||
'    name=>''LOGIN_COMECO_DOCUMENTO_TIPO_COOKIE'','||unistr('\000a')||
'  ';

p:=p||'  value=>lower(:P101_DOCUMENTO_TIPO));'||unistr('\000a')||
'owa_cookie.send('||unistr('\000a')||
'    name=>''LOGIN_COMECO_DOCUMENTO_NUMERO_COOKIE'','||unistr('\000a')||
'    value=>lower(:P101_DOCUMENTO_NUMERO));'||unistr('\000a')||
'exception when others then null;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 223150772080021149 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'CrearCookieUsuario',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>223149765711021146 + wwv_flow_api.g_id_offset,
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
p:=p||'wwv_flow_custom_auth_std.login('||unistr('\000a')||
'    P_UNAME       => :P101_USERNAME,'||unistr('\000a')||
'    P_PASSWORD    => :P101_PASSWORD,'||unistr('\000a')||
'    P_SESSION_ID  => v(''APP_SESSION''),'||unistr('\000a')||
'    P_FLOW_PAGE   => :APP_ID||'':1'''||unistr('\000a')||
'    );';

wwv_flow_api.create_page_process(
  p_id     => 223152163592021152 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 40,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Login',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>':P101_SEGORG_CODIGO IS NOT NULL AND'||unistr('\000a')||
':P101_DOCUMENTO_TIPO IS NOT NULL AND'||unistr('\000a')||
':P101_DOCUMENTO_NUMERO IS NOT NULL AND'||unistr('\000a')||
':P101_PASSWORD IS NOT NULL AND'||unistr('\000a')||
':P101_SEGUSU_TIPO IS NOT NULL',
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
p:=p||'declare'||unistr('\000a')||
'    v varchar2(255) := null;'||unistr('\000a')||
'    c owa_cookie.cookie;'||unistr('\000a')||
'    d owa_cookie.cookie;'||unistr('\000a')||
'    e owa_cookie.cookie;'||unistr('\000a')||
'    f owa_cookie.cookie;'||unistr('\000a')||
'    g owa_cookie.cookie;'||unistr('\000a')||
'begin'||unistr('\000a')||
'   IF :P101_SEGORG_CODIGO IS NULL THEN'||unistr('\000a')||
'     c := owa_cookie.get(''LOGIN_COMECO_SEGORG_COOKIE'');'||unistr('\000a')||
'     :P101_SEGORG_CODIGO := upper(c.vals(1));'||unistr('\000a')||
'   END IF;'||unistr('\000a')||
'   IF :P101_SEGUSU_TIPO IS NULL THEN'||unistr('\000a')||
'     d := owa_cookie.get(''LOGIN_COMECO_SEGU';

p:=p||'SU_TIPO_COOKIE'');'||unistr('\000a')||
'     :P101_SEGUSU_TIPO := upper(d.vals(1));'||unistr('\000a')||
'   END IF; '||unistr('\000a')||
'   IF :P101_CUIT IS NULL THEN'||unistr('\000a')||
'     e := owa_cookie.get(''LOGIN_COMECO_CODIGO_COOKIE'');'||unistr('\000a')||
'     :P101_CODIGO := upper(e.vals(1));'||unistr('\000a')||
'   END IF; '||unistr('\000a')||
'   IF :P101_DOCUMENTO_NUMERO IS NULL THEN'||unistr('\000a')||
'     f := owa_cookie.get(''LOGIN_COMECO_DOCUMENTO_NUMERO_COOKIE'');'||unistr('\000a')||
'     :P101_DOCUMENTO_NUMERO := upper(f.vals(1));'||unistr('\000a')||
'   END IF; '||unistr('\000a')||
'   g:= owa_cookie.ge';

p:=p||'t(''LOGIN_COMECO_DOCUMENTO_TIPO_COOKIE'');'||unistr('\000a')||
'   if g.vals(1) is not null then'||unistr('\000a')||
'     :P101_DOCUMENTO_TIPO := upper(g.vals(1));'||unistr('\000a')||
'   END IF; '||unistr('\000a')||
'   IF :P101_SEGORG_CODIGO IS NOT NULL THEN'||unistr('\000a')||
'    :P1_SEGORG_CODIGO := :P101_SEGORG_CODIGO;'||unistr('\000a')||
'    SELECT ID'||unistr('\000a')||
'    INTO :P1_SEGORG_ID'||unistr('\000a')||
'    FROM SEG_ORGANIZACIONES'||unistr('\000a')||
'    WHERE CODIGO = :P1_SEGORG_CODIGO;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'exception '||unistr('\000a')||
'  when others then '||unistr('\000a')||
'    null;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 223151378466021151 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'ObtenerDatosConexionCookie',
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
p:=p||'341092727939678388';

wwv_flow_api.create_page_process(
  p_id     => 200052558336138908 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 20,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'InicializarAmbiente',
  p_process_sql_clob => 341092727939678388 + wwv_flow_api.g_id_offset,
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
p:=p||'200053147563183103';

wwv_flow_api.create_page_process(
  p_id     => 200053253104184728 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 30,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'InicializarTemaPorDefault',
  p_process_sql_clob => 200053147563183103 + wwv_flow_api.g_id_offset,
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
p:=p||'519760722571796692';

wwv_flow_api.create_page_process(
  p_id     => 200053461069187005 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 40,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'ON_DEMAND',
  p_process_name=> 'CargarDatosOrganizacion',
  p_process_sql_clob => 519760722571796692 + wwv_flow_api.g_id_offset,
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
-- ...updatable report columns for page 101
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00102
prompt  ...PAGE 102: Utilidad de Términos de Uso
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 102
 ,p_user_interface_id => 170453256197545135 + wwv_flow_api.g_id_offset
 ,p_name => 'Utilidad de Términos de Uso'
 ,p_alias => 'TUS'
 ,p_step_title => 'Utilidad de Términos de Uso'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_step_template => 186439175682809931 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'JPREDA'
 ,p_last_upd_yyyymmddhh24miss => '20101014135023'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<b>Términos y Condiciones</b><br><br>'||unistr('\000a')||
'El acceso y/o uso de este sitio (el "Portal") requiere que todos los visitantes al mismo se adhieran a los Términos y Condiciones, aceptándolos, desde ese momento, plenamente y sin reserva alguna, así como en su caso, las Condiciones Particulares que en el futuro puedan complementarlas, sustituirlas o modificarlas en algún sentido en relación con los servicios';

s:=s||' y contenidos del Portal. Por el solo hecho de ingresar y hacer uso de este Portal, usted (el "Usuario") se adhiere en forma inmediata a todos y cada uno de los siguientes Términos y Condiciones. En consecuencia, el Usuario deberá leer detenidamente los Términos y Condiciones así como las Condiciones Particulares, que pudieran dictarse, antes de acceder y/o utilizar cualquier servicio del Portal b';

s:=s||'ajo su entera responsabilidad.'||unistr('\000a')||
'<br><br>'||unistr('\000a')||
'<b>Modificación unilateral del Portal</b><br>'||unistr('\000a')||
'La &P1_SEGORG_NOMBRE. (el "Administrador") se reserva el derecho de, en cualquier momento y sin necesidad de previo aviso, modificar o eliminar el contenido, estructura, diseño, servicios y condiciones de acceso y/o uso de este Portal.<br>'||unistr('\000a')||
'<br>'||unistr('\000a')||
'<b>Legislación</b><br>'||unistr('\000a')||
'El ingreso y utilización de este Portal se enc';

s:=s||'uentra sujeto a las disposiciones aplicables de la legislación Argentina.<br>'||unistr('\000a')||
'En ese sentido, sólo los documentos que aparecen en el Boletín Oficial de la  Provincia de San Luis, son tenidos por auténticos y obligatorios por el efecto de dicha publicación, por comunicados y suficientemente circulados dentro de todo el territorio nacional.<br>'||unistr('\000a')||
'<br>'||unistr('\000a')||
'<b>Uso del Portal. Exclusión de Garantías</b><br>'||unistr('\000a')||
'';

s:=s||'El Usuario se compromete a utilizar el Portal y sus servicios y contenidos sin contravenir la legislación aplicable, la buena fe y el orden público. En consecuencia, queda prohibido todo uso con fines ilícitos o que perjudiquen o impidan, puedan dañar y/o sobrecargar, de cualquier forma, la utilización y normal funcionamiento del Portal o directa o indirectamente atenten contra el mismo o contra c';

s:=s||'ualquier derecho de un tercero.<br>'||unistr('\000a')||
'Atento que alguna de la información proporcionada en el Portal es provista para el Usuario "en la forma que se encuentra" por parte de terceros ajenos al Administrador, no se garantiza la exactitud o conveniencia para fines especiales, no haciéndose responsable por la veracidad, precisión o exactitud de toda aquella información suministrada al Portal por cualqui';

s:=s||'er tercero que no sea el Administrador. En virtud de lo expuesto, el Administrador no asume responsabilidad alguna por cualquier perjuicio, costo, daño o pérdida de ninguna naturaleza originado como consecuencia de la falta de utilidad, adecuación y/o validez del contenido del Portal para satisfacer necesidades, actividades y/o resultados concretos y/o expectativas de los Usuarios. Recomendamos al';

s:=s||' Usuario verificar con adecuado asesoramiento profesional la exactitud de cualquier información suministrada en el presente Portal.<br>'||unistr('\000a')||
'<br>'||unistr('\000a')||
'<b>Responsabilidades</b><br>'||unistr('\000a')||
'El Administrador no asume ningún tipo de responsabilidad que se derive de cualquier daño y/o perjuicio de cualquier naturaleza que se pudieran originar al Usuario como consecuencia o de cualquier forma relacionado con:<br>'||unistr('\000a')||
'El acce';

s:=s||'so o utilización de este Portal, incluyendo la responsabilidad relacionada con daños ocasionados por virus, programas maliciosos o lesivos en los contenidos y/o cualquier otro agente que pueda llegar a infectar o afectar de cualquier modo el/los sistema de computación utilizado por el Usuario.<br>'||unistr('\000a')||
'El incumplimiento por parte de terceros de sus obligaciones o compromisos en relación con los servici';

s:=s||'os prestados a los usuarios a través del Portal.<br>'||unistr('\000a')||
'La falta de licitud, calidad, veracidad, utilidad y disponibilidad de los servicios prestados por terceros y puestos a disposición de los usuarios del Portal.<br>'||unistr('\000a')||
'La falta de disponibilidad, continuidad, acceso, mantenimiento y efectivo funcionamiento del Portal y/o de sus servicios y/o actualización, exactitud, exhaustividad, pertinencia, actua';

s:=s||'lidad y fiabilidad de sus contenidos, cualquiera sea la causa, y las dificultades o problemas técnicos o de otra naturaleza en los que tengan su origen dichos hechos.<br>'||unistr('\000a')||
'La recepción, obtención, almacenamiento, difusión y/o transmisión, por parte de los Usuarios, de los contenidos del Portal.<br>'||unistr('\000a')||
'El Portal incluye dentro de sus contenidos enlaces con sitios pertenecientes y/o gestionados por terc';

s:=s||'eros con el objeto de facilitar el acceso a información disponible a través de Internet. El Administrador no asume ninguna responsabilidad derivada de la existencia de enlaces entre los contenidos de este sitio y contenidos situados fuera del mismo o de cualquier otra mención de contenidos externos a este sitio.<br>'||unistr('\000a')||
'Tales enlaces o menciones tienen una finalidad exclusivamente informativa y, en ni';

s:=s||'ngún caso, implican el apoyo, aprobación, comercialización o relación alguna entre el Administrador y las personas o entidades autoras y/o gestoras de tales contenidos o titulares de los sitios donde se encuentren. En este sentido el Usuario se obliga a poner la máxima diligencia y prudencia en el caso de acceder o usar contenidos o servicios de los sitios a los que acceda en virtud de los mencion';

s:=s||'ados enlaces.<br>'||unistr('\000a')||
'La enumeración anterior tiene mero carácter enunciativo y, en ningún caso, exclusivo ni excluyente en ninguno de sus puntos. En todos los supuestos, el Administrador excluye cualquier responsabilidad por los daños y perjuicios de cualquier naturaleza derivados directa o indirectamente de los mismos y de cualquier otro caso no especificado de análogas características.<br>'||unistr('\000a')||
'<br>'||unistr('\000a')||
'<b>';

s:=s||'Hipervínculos</b><br>'||unistr('\000a')||
'Condiciones a ser cumplimentadas por los usuarios que quieren establecer un hipervínculo entre su página web y el Portal.<br>'||unistr('\000a')||
'No se podrán reproducir las páginas del Portal mediante el hipervínculo que, únicamente, permitirá el acceso a las páginas web del Portal.<br>'||unistr('\000a')||
'Los hipervínculo sólo podrán establecerse con la home-page del Portal, y no con páginas distintas a las prime';

s:=s||'ras páginas de los mismos, salvo previa y expresa autorización.<br>'||unistr('\000a')||
'En ningún caso se podrá dar a entender que este Portal autoriza el hipervínculo o que ha supervisado o asumido de cualquier forma los servicios o contenidos ofrecidos por la página web desde la que se produce el hipervínculo.<br>'||unistr('\000a')||
'Sé prohíbe explícitamente la creación de cualquier tipo de browser o border environment sobre las pági';

s:=s||'nas del Portal.<br>'||unistr('\000a')||
'No se podrán incluir contenidos contrarios a los derechos de terceros, ni contrarios al orden público ni a la moral y buenas costumbres, ni contenidos o informaciones ilícitas, en la página web desde la que se establece el hipervínculo.<br>'||unistr('\000a')||
'La existencia de un hipervínculo entre una página web y el Portal no implica la existencia de relaciones entre el Administrador y el propie';

s:=s||'tario de esa página ni la aceptación y aprobación de sus servicios y contenidos.<br>'||unistr('\000a')||
'El Administrador se reserva el derecho de inhabilitar hipervínculos o estructuras no autorizados.<br>'||unistr('\000a')||
'<br>'||unistr('\000a')||
'<b>GENERAL</b><br>'||unistr('\000a')||
'Los presentes Términos y Condiciones constituyen el entero acuerdo entre las partes y derogan cualquier acuerdo anterior entre las partes en esta materia. La declaración de que alguna de la';

s:=s||'s disposiciones de estos Términos y Condiciones fuesen inválidas o no ejecutable, no tendrá efecto alguno respecto de las demás provisiones de estos Términos y Condiciones, las cuales permanecerán con total efecto y vigencia.<br>'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 519762335533961307 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 102,
  p_plug_name=> 'Términos de Uso',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
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
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 102
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00103
prompt  ...PAGE 103: Cambiar Contraseña
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 103
 ,p_user_interface_id => 170453256197545135 + wwv_flow_api.g_id_offset
 ,p_name => 'Cambiar Contraseña'
 ,p_step_title => 'Cambiar Contraseña'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_last_updated_by => 'JPREDA'
 ,p_last_upd_yyyymmddhh24miss => '20150129153700'
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
  p_id=> 209497378320310222 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 103,
  p_plug_name=> 'Ruta de Navegación',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186455092510809939+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(519748728168040462 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 186470588338809947+ wwv_flow_api.g_id_offset,
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
  p_id=> 341095930026754741 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 103,
  p_plug_name=> 'Cambiar Contraseña',
  p_region_name=>'',
  p_region_attributes=> 'style="max-width:550px;"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186459500426809941+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
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
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 341100630868915766 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 103,
  p_button_sequence=> 10,
  p_button_plug_id => 341095930026754741+wwv_flow_api.g_id_offset,
  p_button_name    => 'P103_CANCELAR',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(186469992544809947+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancelar',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:history.back()',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 341101098924925472 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 103,
  p_button_sequence=> 20,
  p_button_plug_id => 341095930026754741+wwv_flow_api.g_id_offset,
  p_button_name    => 'P103_CONFIRMAR',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(186469992544809947+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Confirmar',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>341102409013956839 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 103,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:104:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>341101098924925472+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 15-DIC-2009 09:49 by JPREDA');
 
wwv_flow_api.create_page_branch(
  p_id=>341097826731789952 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 103,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&FLOW_ID.:103:&SESSION.',
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
  p_id=>341097108256776810 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 103,
  p_name=>'P103_CONTRASENIA_NUEVA1',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 341095930026754741+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Nueva Contraseña :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_PASSWORD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 186469087353809946+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>341097427649782371 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 103,
  p_name=>'P103_CONTRASENIA_NUEVA2',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 341095930026754741+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Reingrese :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_PASSWORD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 186469087353809946+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 341098620423808739 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 103,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P103_CONTRASENIA_NUEVA1 not null',
  p_validation_sequence=> 10,
  p_validation => 'P103_CONTRASENIA_NUEVA1',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Se debe especificar un valor.',
  p_when_button_pressed=> 341101098924925472 + wwv_flow_api.g_id_offset,
  p_associated_item=> 341097108256776810 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 341098830466811635 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 103,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P103_CONTRASENIA_NUEVA2 not null',
  p_validation_sequence=> 20,
  p_validation => 'P103_CONTRASENIA_NUEVA2',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Se debe especificar un valor.',
  p_when_button_pressed=> 341101098924925472 + wwv_flow_api.g_id_offset,
  p_associated_item=> 341097427649782371 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 341099004755823144 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 103,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P103_CONTRASENIA_NUEVA1 tamaño minimo',
  p_validation_sequence=> 30,
  p_validation => 'length(:P103_CONTRASENIA_NUEVA1) >= 6',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'La contraseña debe tener al menos 6 caracteres.',
  p_validation_condition=> 'P103_CONTRASENIA_NUEVA1',
  p_validation_condition_type=> 'ITEM_IS_NOT_NULL',
  p_when_button_pressed=> 341101098924925472 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 341099219431836833 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 103,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P103_CONTRASENIA_NUEVA1 = P103_CONTRASENIA_NUEVA2',
  p_validation_sequence=> 40,
  p_validation => ':P103_CONTRASENIA_NUEVA1 = :P103_CONTRASENIA_NUEVA2',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'Las contraseñas ingresadas no coinciden',
  p_validation_condition=> ':P103_CONTRASENIA_NUEVA1 IS NOT NULL AND'||unistr('\000a')||
':P103_CONTRASENIA_NUEVA2 IS NOT NULL',
  p_validation_condition_type=> 'PLSQL_EXPRESSION',
  p_when_button_pressed=> 341101098924925472 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 341099813937863591 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 103,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P103_CONTRASENIA_NUEVA1 solo numeros y letras',
  p_validation_sequence=> 50,
  p_validation => 'P103_CONTRASENIA_NUEVA1',
  p_validation2 => 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyz1234567890',
  p_validation_type => 'ITEM_IN_VALIDATION_CONTAINS_ONLY_CHAR_IN_STRING2',
  p_error_message => 'Solo ser permiten números y letras en la contraseña.',
  p_validation_condition=> 'P103_CONTRASENIA_NUEVA1',
  p_validation_condition_type=> 'ITEM_IS_NOT_NULL',
  p_when_button_pressed=> 341101098924925472 + wwv_flow_api.g_id_offset,
  p_associated_item=> 341097108256776810 + wwv_flow_api.g_id_offset,
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
p:=p||'begin'||unistr('\000a')||
'  SEG_PKG.SEGUSU_CONTRASENIA(p_segusu_usuario => v(''APP_USER'')'||unistr('\000a')||
'                           , p_segusu_contrasenia_nueva => :P103_CONTRASENIA_NUEVA1);'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 341102122388951193 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 103,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'CambiarContraseña',
  p_process_sql_clob => p,
  p_process_error_message=> 'La Contraseña no ha podido ser cambiada. Revise el mensaje de error asociado.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>341101098924925472 + wwv_flow_api.g_id_offset,
  p_process_success_message=> 'La Contraseña ha sido cambiada exitosamente.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 103
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00104
prompt  ...PAGE 104: Cambiar Contraseña - Confirmar
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 104
 ,p_user_interface_id => 170453256197545135 + wwv_flow_api.g_id_offset
 ,p_name => 'Cambiar Contraseña - Confirmar'
 ,p_step_title => 'Cambiar Contraseña - Confirmar'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_page_is_public_y_n => 'N'
 ,p_cache_page_yn => 'N'
 ,p_last_updated_by => 'JPREDA'
 ,p_last_upd_yyyymmddhh24miss => '20140911150950'
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
  p_id=> 341103207592003746 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 104,
  p_plug_name=> 'Contraseña Actualizada',
  p_region_name=>'',
  p_region_attributes=> 'style="max-width:400px;"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186459200300809941+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
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
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_header=> '<br>'||unistr('\000a')||
'<center>'||unistr('\000a')||
'La contraseña ha sido cambiada exitosamente<br>'||unistr('\000a')||
'Haga clic en el botón <b>"Aceptar"</b> y reconectese a la aplicación con su nueva contraseña</center><br>',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 341104601882039935 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 104,
  p_button_sequence=> 10,
  p_button_plug_id => 341103207592003746+wwv_flow_api.g_id_offset,
  p_button_name    => 'P104_ACEPTAR',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(186469992544809947+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Aceptar',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>341103919214021347 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 104,
  p_branch_name=> '',
  p_branch_action=> '&LOGOUT_URL.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 99,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 104
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00105
prompt  ...PAGE 105: Recuperar Contraseña Proveedor
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 105
 ,p_user_interface_id => 170453256197545135 + wwv_flow_api.g_id_offset
 ,p_name => 'Recuperar Contraseña Proveedor'
 ,p_step_title => 'Recuperar Contraseña Proveedor'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_step_template => 186410375223809912 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'MAMIEVA'
 ,p_last_upd_yyyymmddhh24miss => '20150520090737'
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
  p_id=> 123919219142900907 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 105,
  p_plug_name=> 'Ha olvidado su contraseña',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 186459200300809941+ wwv_flow_api.g_id_offset,
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
  p_plug_header=> 'Escriba los datos del usuario que utiliza para iniciar sesión en su cuenta.<br>'||unistr('\000a')||
'El Tipo y Número de Documento identifican al usuario de su cuenta; adicionalmente le solicitamos la dirección de correo electrónico con la cual se encuentra registrada.<br><br>'||unistr('\000a')||
'El Sistema le enviará una nueva contraseña a la dirección de correo electrónico asociada con su cuenta.<br><br>',
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
  p_id=>124742829573846291 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 105,
  p_branch_name=> 'Ir a Página',
  p_branch_action=> 'f?p=&APP_ID.:101:&SESSION.::&DEBUG.:105::&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>123921921837996310+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>62568231949781340 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 105,
  p_name=>'P105_COMTCO_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 90,
  p_item_plug_id => 123919219142900907+wwv_flow_api.g_id_offset,
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
  p_id=>123919821164914854 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 105,
  p_name=>'P105_DOCUMENTO_TIPO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 123919219142900907+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tipo Documento Responsable',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select rv_abbreviation d, rv_low_value r'||unistr('\000a')||
'from   cg_ref_codes'||unistr('\000a')||
'where  rv_domain = ''SEG_PERSONAS.TIPO_DOCUMENTO'''||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'- SELECCIONE UN TIPO DE DOCUMENTO -',
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
  p_field_template=> 186468990361809946+wwv_flow_api.g_id_offset,
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
  p_id=>123920519845945855 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 105,
  p_name=>'P105_NUM_DOCUMENTO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 123919219142900907+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'N° Documento Responsable',
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
  p_field_template=> 186468990361809946+wwv_flow_api.g_id_offset,
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
  p_id=>123921113363964065 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 105,
  p_name=>'P105_EMAIL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 123919219142900907+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Email Responsable',
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
  p_field_template=> 186468990361809946+wwv_flow_api.g_id_offset,
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
  p_id=>123921921837996310 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 105,
  p_name=>'P105_CONFIRMAR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 123919219142900907+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Enviar',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(186469992544809947 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 2,
  p_rowspan=> null,
  p_grid_column=> 1,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'N',
  p_button_execute_validations=>'Y',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>124160436027338141 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 105,
  p_name=>'P105_COMECO_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 123919219142900907+wwv_flow_api.g_id_offset,
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
  p_id=>124160633224339393 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 105,
  p_name=>'P105_COMRES_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 123919219142900907+wwv_flow_api.g_id_offset,
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
  p_id=>124160925016358371 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 105,
  p_name=>'P105_MSJMTP_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 123919219142900907+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'COMADM_ECOTRM_RSTCLV_RES',
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
  p_id=>124741912142808824 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 105,
  p_name=>'P105_CANCELAR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 123919219142900907+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Cancelar',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(186469992544809947 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 2,
  p_rowspan=> null,
  p_grid_column=> 3,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'N',
  p_button_action => 'REDIRECT_PAGE',
  p_button_redirect_url => 'f?p=&APP_ID.:101:&SESSION.::&DEBUG.:::',
  p_button_is_hot=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>124754516209110826 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 105,
  p_name=>'P105_SEGORG_CODIGO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_item_plug_id => 123919219142900907+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'&nbsp;',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select NOMBRE display_value, CODIGO return_value '||unistr('\000a')||
'from SEG_ORGANIZACIONES'||unistr('\000a')||
'where codigo <> ''INTERNAL'''||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 10,
  p_cMaxlength=> 10,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when=>'G_SEGAMB_TIPO',
  p_read_only_when2=>'DESA',
  p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2',
  p_field_template=> 186468776143809946+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'SUBMIT',
  p_attribute_03 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 123932719051128605 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 105,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P105_DOCUMENTO_TIPO not null',
  p_validation_sequence=> 20,
  p_validation => 'P105_DOCUMENTO_TIPO',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#LABEL# debe tener un valor.',
  p_always_execute=>'N',
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 123919821164914854 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 123932914953130515 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 105,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P105_NUM_DOCUMENTO not null',
  p_validation_sequence=> 30,
  p_validation => 'P105_NUM_DOCUMENTO',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#LABEL# debe tener un valor.',
  p_always_execute=>'N',
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 123920519845945855 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 123933210855132387 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 105,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P105_EMAIL not null',
  p_validation_sequence=> 40,
  p_validation => 'P105_EMAIL',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#LABEL# debe tener un valor.',
  p_always_execute=>'N',
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 123921113363964065 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 123965412298803049 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 105,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P105_DOCUMENTO_TIPO exists',
  p_validation_sequence=> 55,
  p_validation => 'select 1'||unistr('\000a')||
'from COM_RESPONSABLES comres'||unistr('\000a')||
'where comres.NUMERO_DOCUMENTO = :P105_NUM_DOCUMENTO'||unistr('\000a')||
'  and comres.TIPO_DOCUMENTO = :P105_DOCUMENTO_TIPO;',
  p_validation_type => 'EXISTS',
  p_error_message => 'El Documento no corresponde a un Responsable',
  p_always_execute=>'N',
  p_validation_condition=> ':P105_NUM_DOCUMENTO is not null and :P105_DOCUMENTO_TIPO is not null',
  p_validation_condition_type=> 'PLSQL_EXPRESSION',
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 123919821164914854 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 123953530102852762 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 105,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P105_NUM_DOCUMENTO exist',
  p_validation_sequence=> 60,
  p_validation => 'select 1'||unistr('\000a')||
'from COM_RESPONSABLES comres'||unistr('\000a')||
'where comres.TIPO_DOCUMENTO = :P105_DOCUMENTO_TIPO;'||unistr('\000a')||
'  and comres.NUMERO_DOCUMENTO = :P105_NUM_DOCUMENTO;',
  p_validation_type => 'EXISTS',
  p_error_message => 'El Documento no corresponde a un Responsable',
  p_always_execute=>'N',
  p_validation_condition=> ':P105_DOCUMENTO_TIPO is not null and :P105_CUIT_PROVEEDOR is not null and :P105_NUM_DOCUMENTO is not null',
  p_validation_condition_type=> 'PLSQL_EXPRESSION',
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 123920519845945855 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 123964934296792937 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 105,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P105_EMAIL exist',
  p_validation_sequence=> 70,
  p_validation => 'select 1'||unistr('\000a')||
'from COM_RESPONSABLES comres'||unistr('\000a')||
'where comres.NUMERO_DOCUMENTO = :P105_NUM_DOCUMENTO'||unistr('\000a')||
'  and comres.TIPO_DOCUMENTO = :P105_DOCUMENTO_TIPO'||unistr('\000a')||
'  and comres.EMAIL = :P105_EMAIL;',
  p_validation_type => 'EXISTS',
  p_error_message => 'El Email ingresado no corresponde al Responsable.',
  p_always_execute=>'N',
  p_validation_condition=> 'P105_EMAIL',
  p_validation_condition_type=> 'ITEM_IS_NOT_NULL',
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 123921113363964065 + wwv_flow_api.g_id_offset,
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
p:=p||'DECLARE'||unistr('\000a')||
'--'||unistr('\000a')||
'CURSOR cr_comcnr is'||unistr('\000a')||
'    SELECT comres.*'||unistr('\000a')||
'          ,comcnr.SEGUSU_ID'||unistr('\000a')||
'          ,comcnr.COMECO_ID'||unistr('\000a')||
'    FROM COM_CONTRATANTES_RES comcnr'||unistr('\000a')||
'        ,COM_RESPONSABLES comres'||unistr('\000a')||
'    WHERE comcnr.COMRES_ID = comres.ID'||unistr('\000a')||
'      AND comres.TIPO_DOCUMENTO = :P105_DOCUMENTO_TIPO'||unistr('\000a')||
'      AND comres.NUMERO_DOCUMENTO = :P105_NUM_DOCUMENTO'||unistr('\000a')||
'      AND comres.EMAIL = :P105_EMAIL;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    v_contrasenia VARCHAR2(4';

p:=p||'00);'||unistr('\000a')||
'    --'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'--'||unistr('\000a')||
'  FOR v_comcnr IN cr_comcnr LOOP'||unistr('\000a')||
'    --'||unistr('\000a')||
'    v_contrasenia := COM_PKG.OBTN_CONTRASENIA(p_nombre => trim(v_comcnr.NOMBRE),'||unistr('\000a')||
'                                              p_numero_documento =>  v_comcnr.NUMERO_DOCUMENTO);'||unistr('\000a')||
'    --'||unistr('\000a')||
'    UPDATE SEG_USUARIOS'||unistr('\000a')||
'      SET CONTRASENIA = v_contrasenia'||unistr('\000a')||
'        , CONTRASENIA_FCH = sysdate'||unistr('\000a')||
'    WHERE ID = v_comcnr.SEGUSU_ID;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    :P105_COMR';

p:=p||'ES_ID := v_comcnr.ID;'||unistr('\000a')||
'    :P105_COMECO_ID := v_comcnr.COMECO_ID;'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  END;';

wwv_flow_api.create_page_process(
  p_id     => 124126507197035884 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 105,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Restablecer Contraseña',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>123921921837996310 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> 'Se Restableció Su Contraseña Correctamente, Verifique su Correo Electronico',
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
'  --Cursor de Contratantes - Responsables'||unistr('\000a')||
'  CURSOR cr_comcnr IS '||unistr('\000a')||
'  SELECT comcnr.ID ID, '||unistr('\000a')||
'       comcnr.comres_id comres_id,'||unistr('\000a')||
'       comres.tipo_documento comres_tipo_documento,'||unistr('\000a')||
'       comres.numero_documento comres_numero_documento,'||unistr('\000a')||
'       comres.nombre comres_nombre,'||unistr('\000a')||
'       comres.email comres_email,'||unistr('\000a')||
'       comres.observacion comres_observacion,'||unistr('\000a')||
'       comcnr.comeco_id comeco_id,'||unistr('\000a')||
'       co';

p:=p||'mcnr.fecha_vigencia fecha_vigencia,'||unistr('\000a')||
'       comcnr.fecha_validez fecha_validez,'||unistr('\000a')||
'       comcnr.situacion situacion,'||unistr('\000a')||
'       comcnr.date_created date_created,'||unistr('\000a')||
'       comcnr.created_by created_by,'||unistr('\000a')||
'       comeco.codigo comeco_codigo, '||unistr('\000a')||
'       comeco.nombre comeco_nombre,'||unistr('\000a')||
'       comeco.email comeco_email,'||unistr('\000a')||
'       (COM_PKG.OBTN_CONTRASENIA'||unistr('\000a')||
'                        (p_nombre           => comres.nombre'||unistr('\000a')||
'       ';

p:=p||'                 ,p_numero_documento => comres.numero_documento)) CONTRASENIA_ACTUAL '||unistr('\000a')||
'  FROM com_contratantes_res comcnr,'||unistr('\000a')||
'     com_responsables comres,'||unistr('\000a')||
'     com_contratantes comeco'||unistr('\000a')||
'  WHERE comcnr.comres_id = comres.ID'||unistr('\000a')||
'    AND comcnr.comeco_id = comeco.ID'||unistr('\000a')||
'    AND COMCNR.COMECO_ID = :P105_COMECO_ID'||unistr('\000a')||
'    AND COMRES.ID = :P105_COMRES_ID;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  -- Cursor Tipo de Email'||unistr('\000a')||
'  CURSOR cr_msjmtp IS'||unistr('\000a')||
'  SELECT    ';

p:=p||'msjmtp.ID ID, msjmtp.segorg_id segorg_id,'||unistr('\000a')||
'          msjmtp.codigo codigo,'||unistr('\000a')||
'          msjmtp.clase clase,'||unistr('\000a')||
'          (SELECT cfg.rv_abbreviation'||unistr('\000a')||
'             FROM cg_ref_codes cfg'||unistr('\000a')||
'            WHERE cfg.rv_domain = ''MSJ_MENSAJES_TIPOS.CLASE'''||unistr('\000a')||
'              AND cfg.rv_low_value = msjmtp.clase) clase_desc,'||unistr('\000a')||
'          msjmtp.asunto asunto,'||unistr('\000a')||
'          msjmtp.msjcem_origen_id msjcem_origen_id,'||unistr('\000a')||
'          msjmt';

p:=p||'p.msjpem_cuerpo_id msjpem_cuerpo_id,'||unistr('\000a')||
'          msjmtp.responder_sn responder_sn,'||unistr('\000a')||
'          msjmtp.adjuntos_sn adjuntos_sn,'||unistr('\000a')||
'          msjmtp.reenviar_sn reenviar_sn,'||unistr('\000a')||
'          msjmtp.contacto_sn contacto_sn,'||unistr('\000a')||
'          msjmtp.vencimiento_sn vencimiento_sn,'||unistr('\000a')||
'          msjmtp.date_created date_created, '||unistr('\000a')||
'          msjmtp.created_by created_by,'||unistr('\000a')||
'          msjmtp.date_modified date_modified, '||unistr('\000a')||
'          msj';

p:=p||'mtp.modified_by modified_by,'||unistr('\000a')||
'          msjcem.nombre msjcem_nombre, '||unistr('\000a')||
'          msjcem.email msjcem_email,'||unistr('\000a')||
'          msjcem.smtp msjcem_smtp, '||unistr('\000a')||
'          msjcem.puerto msjcem_puerto,'||unistr('\000a')||
'          msjcem.usuario msjcem_usuario,'||unistr('\000a')||
'          msjcem.contrasenia msjcem_contrasenia, '||unistr('\000a')||
'          msjpem.nombre msjpem_nombre,'||unistr('\000a')||
'          msjpem.cuerpo msjpem_cuerpo,'||unistr('\000a')||
'          msjcem.envios_por_dia msjcem_envios_por_';

p:=p||'dia,'||unistr('\000a')||
'          msjcem.envios_por_hora msjcem_envios_por_hora'||unistr('\000a')||
'     FROM msj_mensajes_tipos msjmtp,'||unistr('\000a')||
'          msj_cuentas_email msjcem,'||unistr('\000a')||
'          msj_plantillas_email msjpem'||unistr('\000a')||
'    WHERE msjmtp.msjcem_origen_id = msjcem.ID(+)'||unistr('\000a')||
'      AND msjmtp.msjpem_cuerpo_id = msjpem.ID(+)'||unistr('\000a')||
'      AND msjmtp.CODIGO = :P105_MSJMTP_CODIGO;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_msjmtp cr_msjmtp%ROWTYPE;'||unistr('\000a')||
'  v_msjmsj_codigo NUMBER := null;'||unistr('\000a')||
'  v_body VARCH';

p:=p||'AR2(4000) := null;'||unistr('\000a')||
'  v_MSJMSJ_ID     NUMBER := null;'||unistr('\000a')||
'  -- '||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  --  '||unistr('\000a')||
'  OPEN  cr_msjmtp;'||unistr('\000a')||
'  FETCH cr_msjmtp INTO v_msjmtp;'||unistr('\000a')||
'  CLOSE cr_msjmtp;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  -- Generamos un Nuevo Codigo de Proceso de Generacion de Email'||unistr('\000a')||
'  SELECT MSJMSJ_CODIGO.NEXTVAL INTO v_msjmsj_codigo FROM DUAL;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  FOR v_comcnr IN cr_comcnr LOOP'||unistr('\000a')||
'    v_body :=null;'||unistr('\000a')||
'    v_body :='''||unistr('\000a')||
'    <table width="100%" align="center">'||unistr('\000a')||
'      <tr>'||unistr('\000a')||
' ';

p:=p||'       <td align="right">'||unistr('\000a')||
'          <span style="font-size:20px;font-weight:bold;">'||unistr('\000a')||
'           Solicitud de Restablecer Contrase&#241;a    '||unistr('\000a')||
'         </span>'||unistr('\000a')||
'        </td>'||unistr('\000a')||
'      </tr>    '||unistr('\000a')||
'        <tr>'||unistr('\000a')||
'       <td align="left">'||unistr('\000a')||
'        <br/><br/><br/>'||unistr('\000a')||
'        NOTIFICAMOS por la presente que la Solicitud de Restablecer Contrase&#241;a de <b>''||v_comcnr.COMRES_NOMBRE||''</b> con <b>''||v_comcnr.COMRES_TI';

p:=p||'PO_DOCUMENTO||''</b>: <b>''||v_comcnr.COMRES_NUMERO_DOCUMENTO||''</b> como Responsable del &P1_COMETQ_CONS. <b>''||v_comcnr.COMECO_NOMBRE||''</b> con codigo: <b>''||v_comcnr.COMECO_CODIGO||''</b> ha sido realizada con exito.'||unistr('\000a')||
'        <br/><br/>'||unistr('\000a')||
'        A continuaci&oacute;n le informamos los datos para realizar la conexi&oacute;n al Sistema:'||unistr('\000a')||
'        <br/>'||unistr('\000a')||
'        <br>C&oacute;digo Unidad Ejecutora: <b>''||';

p:=p||'v_comcnr.COMECO_CODIGO||''</b>'||unistr('\000a')||
'        <br>Tipo Documento: <b>''||v_comcnr.COMRES_TIPO_DOCUMENTO||''</b>'||unistr('\000a')||
'        <br>N&uacute;mero documento : <b>''||v_comcnr.COMRES_NUMERO_DOCUMENTO||''</b>'||unistr('\000a')||
'        <br>Contrase&#241;a inicial: <b>''||v_comcnr.CONTRASENIA_ACTUAL||''</b><br><br>'||unistr('\000a')||
'        <br/><br>'||unistr('\000a')||
'        Para ingresar al sistema puede hacerlo haciendo clic'||unistr('\000a')||
'        <a href="http://www.sistemacompras.sanlui';

p:=p||'s.gov.ar/pls/apex_prod/f?p=ECOCOM:101:2603907454600612::::P101_SEGORG_CODIGO:PCYCSL">"AQU&Iacute;"</a> e ingresando la informaci&oacute;n de conexi&oacute;n suministrada.<br>'||unistr('\000a')||
'        Recuerde cambiar su contrase&#241;a inicial al ingresar al sistema.'||unistr('\000a')||
'        <br/>'||unistr('\000a')||
'        <br/>'||unistr('\000a')||
'       </td>'||unistr('\000a')||
'     </tr>'||unistr('\000a')||
'    </table>'';'||unistr('\000a')||
'    --'||unistr('\000a')||
'    IF v_comcnr.COMRES_EMAIL IS NOT NULL THEN'||unistr('\000a')||
'      -- Llamar al Proceso de';

p:=p||' Crear el Email      '||unistr('\000a')||
'      MSJ_PKG.MSJ_CREAR(P_MSJMTP_ID  => v_msjmtp.ID           '||unistr('\000a')||
'                       ,P_ORIGEN       => v_msjmtp.MSJCEM_EMAIL '||unistr('\000a')||
'                       ,P_DESTINO      => v_comcnr.COMRES_EMAIL       '||unistr('\000a')||
'                       ,P_DATOS_CUERPO => v_body             '||unistr('\000a')||
'                       ,P_MOTIVO       => ''Codigo Generado :''||v_msjmsj_codigo'||unistr('\000a')||
'                       ,P_MSJMSJ_ID   ';

p:=p||' => v_MSJMSJ_ID  -- Salida '||unistr('\000a')||
'                      );'||unistr('\000a')||
'      --                      '||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  IF V_MSJMSJ_ID is not null then'||unistr('\000a')||
'  --'||unistr('\000a')||
'    MSJ_PKG.MSJ_ENVIAR(P_MSJMSJ_ID    => v_msjmsj_ID,'||unistr('\000a')||
'                       P_FECHA        => SYSDATE,'||unistr('\000a')||
'                       P_MOTIVO       => ''Envíado'');'||unistr('\000a')||
'  --'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 124162206954399046 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 105,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Enviar E-mail Notificacion ',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>123921921837996310 + wwv_flow_api.g_id_offset,
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
-- ...updatable report columns for page 105
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00110
prompt  ...PAGE 110: CambiarEntidadContratante
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 110
 ,p_user_interface_id => 170453256197545135 + wwv_flow_api.g_id_offset
 ,p_name => 'CambiarEntidadContratante'
 ,p_step_title => 'CambiarEntidadContratante'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_page_is_public_y_n => 'N'
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'JPREDA'
 ,p_last_upd_yyyymmddhh24miss => '20160421161157'
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
  p_id=> 63285319058901868 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 110,
  p_plug_name=> 'Breadcrumb',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 186455092510809939+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(519748728168040462 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 186470588338809947+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
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
  p_id=>63292319412212528 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 110,
  p_branch_name=> 'Con Proceso Two',
  p_branch_action=> 'declare'||unistr('\000a')||
'  --'||unistr('\000a')||
'  cursor cr_segusu is'||unistr('\000a')||
'  select segprs.TIPO_DOCUMENTO'||unistr('\000a')||
'       , segprs.NUMERO_DOCUMENTO       '||unistr('\000a')||
'    from seg_usuarios segusu'||unistr('\000a')||
'       , seg_personas segprs       '||unistr('\000a')||
'   where segprs.SEGUSU_ID = segusu.ID'||unistr('\000a')||
'     and segusu.ID = :P110_SEGUSU_ID_SEL;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  cursor cr_comeco is'||unistr('\000a')||
'  select CODIGO'||unistr('\000a')||
'    from com_contratantes'||unistr('\000a')||
'  where ID = :P110_COMECO_ID_SEL;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_documento_tipo VARCHAR2(10);'||unistr('\000a')||
'  v_documento_numero VARCHAR2(100);'||unistr('\000a')||
'  v_username VARCHAR2(100); '||unistr('\000a')||
'  v_comeco_codigo VARCHAR2(100); '||unistr('\000a')||
'  v_autenticado boolean; '||unistr('\000a')||
'  v_url  VARCHAR2(100);'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin'||unistr('\000a')||
'  if :P110_COMECO_ID_SEL is not null and :P110_SEGUSU_ID_SEL is not null then'||unistr('\000a')||
'    --'||unistr('\000a')||
'    open cr_segusu;'||unistr('\000a')||
'    fetch cr_segusu into  v_documento_tipo, v_documento_numero;'||unistr('\000a')||
'    close cr_segusu;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    open cr_comeco;'||unistr('\000a')||
'    fetch cr_comeco into  v_comeco_codigo;'||unistr('\000a')||
'    close cr_comeco;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    --Armamos el Usuario para el Organismo seleccionado'||unistr('\000a')||
'    v_username := :P110_SEGORG_CODIGO||''.''||:P110_SEGUSU_TIPO||''.''||v_comeco_codigo||''.''||v_documento_tipo||''.''||v_documento_numero;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    --Login Automatico para el Organismo seleccionado'||unistr('\000a')||
'    v_autenticado := COM_PKG.VLDR_SEGUSU_ECO(v_username);'||unistr('\000a')||
'    --'||unistr('\000a')||
'    if v_autenticado then      '||unistr('\000a')||
'      return ''f?p=&APP_ID.:1:&SESSION.::NO:::'';'||unistr('\000a')||
'    else'||unistr('\000a')||
'      return ''f?p=&APP_ID.:101::NO:::'';'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    --'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;',
  p_branch_point=> 'BEFORE_HEADER',
  p_branch_type=> 'BRANCH_TO_FUNCTION_RETURNING_URL',
  p_branch_sequence=> 40,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>63286232359932943 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 110,
  p_name=>'P110_COMECO_ID_SEL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 63285319058901868+wwv_flow_api.g_id_offset,
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
  p_id=>63286527183935376 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 110,
  p_name=>'P110_SEGUSU_ID_SEL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 63285319058901868+wwv_flow_api.g_id_offset,
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
  p_id=>63290229431086332 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 110,
  p_name=>'P110_AUTH',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 63285319058901868+wwv_flow_api.g_id_offset,
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

 
begin
 
---------------------------------------
-- ...updatable report columns for page 110
--
 
begin
 
null;
end;
null;
 
end;
/

prompt  ...lists
--
--application/shared_components/navigation/lists/menú_videos_tutoriales
 
begin
 
wwv_flow_api.create_list (
  p_id=> 70428320769564636 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Menú Videos Tutoriales',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 70428530214564645 + wwv_flow_api.g_id_offset,
  p_list_id=> 70428320769564636 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Video introducción',
  p_list_item_link_target=> 'javascript:abrir_video();',
  p_list_item_icon=> '#WORKSPACE_IMAGES#play_video.png',
  p_list_item_disp_cond_type=> 'CURRENT_PAGE_EQUALS_CONDITION',
  p_list_item_disp_condition=> '1',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
null;
 
end;
/

--application/shared_components/navigation/lists/menu_gestion_de_proveedores
 
begin
 
wwv_flow_api.create_list (
  p_id=> 75681710698682173 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Menu Gestion de Proveedores',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 75681922971682179 + wwv_flow_api.g_id_offset,
  p_list_id=> 75681710698682173 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Trámites de<br>Proveedores',
  p_list_item_link_target=> 'f?p=ADMCOM:200:&SESSION.:::200:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P200_COMECO_ID:&APP_ID.,&APP_PAGE_ID.,&P1_COMECO_ID.',
  p_list_item_icon=> '#WORKSPACE_IMAGES#PCYCSL_Proveedores_Tramites.png',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 76028231631522937+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 75682231417682181 + wwv_flow_api.g_id_offset,
  p_list_id=> 75681710698682173 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>20,
  p_list_item_link_text=> 'Proveedores<br>Registrados',
  p_list_item_link_target=> 'f?p=ADMCOM:250:&SESSION.:::250:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P250_COMECO_ID:&APP_ID.,&APP_PAGE_ID.,&P1_COMECO_ID.    ',
  p_list_item_icon=> '#WORKSPACE_IMAGES#PCYCSL_Proveedores_Registrados.png',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 76028401642552000+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
null;
 
end;
/

--application/shared_components/navigation/lists/menu_principal
 
begin
 
wwv_flow_api.create_list (
  p_id=> 170432336402318578 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Menu Principal',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 122480505900694535 + wwv_flow_api.g_id_offset,
  p_list_id=> 170432336402318578 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Crear Solicitud<br>de Gasto',
  p_list_item_link_target=> 'f?P=ADMCOM:PEDCRE:&APP_SESSION.::NO:310,311,312,314,315,316:P310_COMECO_ID,P310_APP_ANTERIOR,P310_PAG_ANTERIOR:&P1_COMECO_ID.,&APP_ID.,&APP_PAGE_ID.',
  p_list_item_icon=> '#WORKSPACE_IMAGES#PCYCSL_Procesos_Pedidos.png',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 77513300056266668 + wwv_flow_api.g_id_offset,
  p_list_id=> 170432336402318578 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>15,
  p_list_item_link_text=> 'Crear Proceso<br>de Compra',
  p_list_item_link_target=> 'f?P=ADMCOM:800:&APP_SESSION.::NO:800,801,802,803,805:P800_COMECO_ID,P800_APP_ANTERIOR,P800_PAG_ANTERIOR:&P1_COMECO_ID.,&APP_ID.,&APP_PAGE_ID.',
  p_list_item_icon=> '#WORKSPACE_IMAGES#PCYCSL_Procesos_Pedidos.png',
  p_list_item_disp_cond_type=> 'EXISTS',
  p_list_item_disp_condition=> 'select 1'||unistr('\000a')||
'from   COM_CONTRATANTES comeco'||unistr('\000a')||
'where  comeco.ID = :P1_COMECO_ID'||unistr('\000a')||
'and    comeco.PROCESO_DESCENTRALIZADO_SN= ''SI''',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 170432536980318582 + wwv_flow_api.g_id_offset,
  p_list_id=> 170432336402318578 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>20,
  p_list_item_link_text=> 'Pedidos de<br>Compras<br>',
  p_list_item_link_target=> 'f?p=COMCON:220:&SESSION.::NO:RIR,220:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P220_COMECO_ID:&APP_ID.,&APP_PAGE_ID.,&P1_COMECO_ID.',
  p_list_item_icon=> '#WORKSPACE_IMAGES#PCYCSL_Procesos_Procesos.png',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 170432850757318583 + wwv_flow_api.g_id_offset,
  p_list_id=> 170432336402318578 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>30,
  p_list_item_link_text=> 'Ordenes de<br>Compra<br>',
  p_list_item_link_target=> 'f?p=COMCON:420:&SESSION.::NO:RIR,420:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P420_COMECO_ID,P420_COMOCM_ESTADO:&APP_ID.,&APP_PAGE_ID.,&P1_COMECO_ID.,APROBADA',
  p_list_item_icon=> '#WORKSPACE_IMAGES#PCYCSL_Procesos_Ordenes.png',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 77480104406422609 + wwv_flow_api.g_id_offset,
  p_list_id=> 170432336402318578 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>35,
  p_list_item_link_text=> 'Detalle de Ordenes<br>de Compras<br>',
  p_list_item_link_target=> 'f?p=COMCON:430:&SESSION.::NO:RIR,430:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P430_COMECO_ID:&APP_ID.,&APP_PAGE_ID.,&P1_COMECO_ID.',
  p_list_item_icon=> '#WORKSPACE_IMAGES#PCYCSL_Procesos_Ordenes.png',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 76068704376817531 + wwv_flow_api.g_id_offset,
  p_list_id=> 170432336402318578 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>40,
  p_list_item_link_text=> 'Trámites de<br>Proveedores',
  p_list_item_link_target=> 'f?p=COMPRV:210:&SESSION.::NO:RIR,210:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P210_COMECO_ID:&APP_ID.,&APP_PAGE_ID.,&P1_COMECO_ID.',
  p_list_item_icon=> '#WORKSPACE_IMAGES#PCYCSL_Proveedores_Tramites.png',
  p_list_item_disp_cond_type=> 'EXISTS',
  p_list_item_disp_condition=> 'select 1'||unistr('\000a')||
'from   COM_CONTRATANTES comeco'||unistr('\000a')||
'where  comeco.ID = :P1_COMECO_ID'||unistr('\000a')||
'and    comeco.REGISTROPRV_SN = ''SI''',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 76028231631522937+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 76068926577822379 + wwv_flow_api.g_id_offset,
  p_list_id=> 170432336402318578 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>50,
  p_list_item_link_text=> 'Registro <br>de Proveedores',
  p_list_item_link_target=> 'f?p=COMPRV:200:&SESSION.::NO:RIR,200:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P200_COMECO_ID:&APP_ID.,&APP_PAGE_ID.,&P1_COMECO_ID.',
  p_list_item_icon=> '#WORKSPACE_IMAGES#PCYCSL_Proveedores_Registrados.png',
  p_list_item_disp_cond_type=> 'EXISTS',
  p_list_item_disp_condition=> 'select 1'||unistr('\000a')||
'from   COM_CONTRATANTES comeco'||unistr('\000a')||
'where  comeco.ID = :P1_COMECO_ID'||unistr('\000a')||
'and    comeco.REGISTROPRV_SN = ''SI''',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 76028401642552000+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 170433458040318586 + wwv_flow_api.g_id_offset,
  p_list_id=> 170432336402318578 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>100,
  p_list_item_link_text=> 'Tu Calendario<br><br>',
  p_list_item_link_target=> 'f?p=COMCON:620:&SESSION.::NO:RP,620:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG,P620_COMECO_ID,P620_COMECO_SELECCIONAR_SN:&APP_ID.,&APP_PAGE_ID.,&P1_COMECO_ID.,NO',
  p_list_item_icon=> '#WORKSPACE_IMAGES#GESPRY_Actividades.png',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
null;
 
end;
/

--application/shared_components/navigation/lists/menu_tab
 
begin
 
wwv_flow_api.create_list (
  p_id=> 209477181605072614 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Menu Tab',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 209477483088072614 + wwv_flow_api.g_id_offset,
  p_list_id=> 209477181605072614 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Inicio',
  p_list_item_link_target=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '1',
  p_list_item_owner=> '');
 
null;
 
end;
/

--application/shared_components/navigation/lists/menu_servicios
 
begin
 
wwv_flow_api.create_list (
  p_id=> 209485766191106430 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Menu Servicios',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 209486377224106430 + wwv_flow_api.g_id_offset,
  p_list_id=> 209485766191106430 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Guía de Trámites',
  p_list_item_link_target=> 'f?p=SRVTRM:422:&SESSION.::NO:RP,422:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG:&APP_ID.,&APP_PAGE_ID.'||unistr('\000a')||
'',
  p_list_item_icon=> '#WORKSPACE_IMAGES#ADMCAT_Servicios_Guia.png',
  p_list_item_disp_cond_type=> 'NEVER',
  p_list_item_disp_condition=> '',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 223046683933721094 + wwv_flow_api.g_id_offset,
  p_list_id=> 209485766191106430 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>30,
  p_list_item_link_text=> 'Biblioteca Digital',
  p_list_item_link_target=> 'f?p=SRVBIB:520:&SESSION.::NO:RP,520:G_APP_ANTERIOR,G_APP_ANTERIOR_PAG:&APP_ID.,&APP_PAGE_ID.'||unistr('\000a')||
'',
  p_list_item_icon=> '#WORKSPACE_IMAGES#ADMCAT_Servicios_Biblioteca.png',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
null;
 
end;
/

--application/shared_components/navigation/lists/menu_accesos_directos
 
begin
 
wwv_flow_api.create_list (
  p_id=> 475655006032820311 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Menu Accesos Directos',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 228027388179921461 + wwv_flow_api.g_id_offset,
  p_list_id=> 475655006032820311 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>30,
  p_list_item_link_text=> 'Bienes y Servicios',
  p_list_item_link_target=> 'f?p=SRVPOR:2:&APP_SESSION.::NO:RP:P2_CFGPOP_CODIGO:NOMENCLADOR',
  p_list_item_icon=> 'menu/pt_region_20.png',
  p_list_item_icon_attributes=> 'title="#LIST_LABEL#"',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_text_02=> 'target="_blank"',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 63174123967978629 + wwv_flow_api.g_id_offset,
  p_list_id=> 475655006032820311 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>40,
  p_list_item_link_text=> 'Reclamos y consultas',
  p_list_item_link_target=> 'javascript:ModalRegion(''f?p=COMTRMPUB:200:&SESSION.::NO:200,201,100:G_TRMTIP_CODIGO,P1_SEGORG_CODIGO,G_SEGUSU_ID,P200_COMECO_ID:COM_SRVPOR_RQC,&P1_SEGORG_CODIGO.,&P1_SEGUSU_ID.,&P1_COMECO_ID.'',900,700);',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 70871629249062136 + wwv_flow_api.g_id_offset,
  p_list_id=> 475655006032820311 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>50,
  p_list_item_link_text=> 'Biblioteca Digital',
  p_list_item_link_target=> 'javascript:ModalRegion(''f?p=SRVPUB:110:0:::110:G_SEGORG_CODIGO,P110_BSQTIP,P110_STYLE:PCYCSL,D,I'',1100,690)',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 70887827738594629 + wwv_flow_api.g_id_offset,
  p_list_id=> 475655006032820311 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>60,
  p_list_item_link_text=> 'Bandeja de Reclamos',
  p_list_item_link_target=> 'f?p=COMTRM:300:&SESSION.::NO:300:P1_SEGORG_CODIGO,P300_COMPRV_ID,G_APP_ANTERIOR,G_APP_ANTERIOR_PAG:&P1_SEGORG_CODIGO.,&P1_COMPRV_ID.,&APP_ID.,&APP_PAGE_ID.',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 73709111795684993 + wwv_flow_api.g_id_offset,
  p_list_id=> 475655006032820311 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>70,
  p_list_item_link_text=> 'Consulta Proveedores',
  p_list_item_link_target=> 'f?P=ADMCOM:250:&SESSION.::NO:250:P250_APP_ANTERIOR,P250_PAG_ANTERIOR:&APP_ID.,&APP_PAGE_ID.',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 73709629140828889+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
null;
 
end;
/

--application/shared_components/navigation/breadcrumbs
prompt  ...breadcrumbs
--
 
begin
 
wwv_flow_api.create_menu (
  p_id=> 519748728168040462 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Ruta de navegación ');
 
wwv_flow_api.create_menu_option (
  p_id=>63285508750901889 + wwv_flow_api.g_id_offset,
  p_menu_id=>519748728168040462 + wwv_flow_api.g_id_offset,
  p_parent_id=>null,
  p_option_sequence=>10,
  p_short_name=>'Cambiar Entidad Contratante',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:110:&SESSION.',
  p_page_id=>110,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>209483869496106417 + wwv_flow_api.g_id_offset,
  p_menu_id=>519748728168040462 + wwv_flow_api.g_id_offset,
  p_parent_id=>519749227805040474 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Servicios',
  p_long_name=>'',
  p_link=>'f?p=&FLOW_ID.:20:&SESSION.',
  p_page_id=>20,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>341095704691749454 + wwv_flow_api.g_id_offset,
  p_menu_id=>519748728168040462 + wwv_flow_api.g_id_offset,
  p_parent_id=>519749227805040474 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Cambiar Contraseña',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:103:&SESSION.::&DEBUG.:::',
  p_page_id=>103,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>519749227805040474 + wwv_flow_api.g_id_offset,
  p_menu_id=>519748728168040462 + wwv_flow_api.g_id_offset,
  p_parent_id=>0,
  p_option_sequence=>10,
  p_short_name=>'Inicio',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::',
  p_page_id=>1,
  p_also_current_for_pages=> '');
 
null;
 
end;
/

prompt  ...page templates for application: 2806
--
--application/shared_components/user_interface/templates/page/login
prompt  ......Page template 186410375223809912
 
begin
 
wwv_flow_api.create_template (
  p_id => 186410375223809912 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 105
 ,p_name => 'Login'
 ,p_is_popup => false
 ,p_javascript_file_urls => '#IMAGE_PREFIX#libraries/modernizr/2.5.3/modernizr.min.js'||unistr('\000a')||
'[if lt IE 9]#IMAGE_PREFIX#libraries/respond-js/1.1.0/respond.min.js'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25/js/4_2#MIN#.js?v=#APEX_VERSION#'
 ,p_css_file_urls => '#IMAGE_PREFIX#themes/theme_25_mc/&P1_APP_THEME./css/4_2.css?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25_mc/&P1_APP_THEME./css/responsive_grid.css?v=#APEX_VERSION#'
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD# id="uLogin">'||unistr('\000a')||
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'  #FORM_OPEN#'
 ,p_box => 
'<div id="uOneCol">'||unistr('\000a')||
'  <div class="apex_grid_container">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      <div id="uLoginContainer">'||unistr('\000a')||
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'      #BOX_BODY#'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="apex.jQuery(''#uSuccessMessage'').remove();" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #SUCCESS_MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_notification_message => '<section class="uSingleAlertMessage red" id="uNotificationMessage">'||unistr('\000a')||
'	<p>#MESSAGE#</p>'||unistr('\000a')||
'	<a href="javascript:void(0)" class="closeMessage" onclick="apex.jQuery(''#uNotificationMessage'').remove();"></a>'||unistr('\000a')||
'</section>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0"'
 ,p_theme_class_id => 6
 ,p_grid_type => 'FIXED'
 ,p_grid_max_columns => 12
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_grid_template => '#ROWS#'
 ,p_grid_row_template => '<div class="apex_row">'||unistr('\000a')||
'#COLUMNS#'||unistr('\000a')||
'</div>'
 ,p_grid_column_template => '<div class="apex_cols apex_span_#COLUMN_SPAN_NUMBER# #FIRST_LAST_COLUMN_ATTRIBUTES#">'||unistr('\000a')||
'#CONTENT#'||unistr('\000a')||
'</div>'
 ,p_grid_first_column_attributes => 'alpha'
 ,p_grid_last_column_attributes => 'omega'
 ,p_grid_javascript_debug_code => 'apex.jQuery(document)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-on", showGrid)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-off", hideGrid);'
 ,p_has_edit_links => true
 ,p_reference_id => 48138844089054412
 ,p_translate_this_template => 'N'
 ,p_template_comment => '18'
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176268363647923035 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186410375223809912 + wwv_flow_api.g_id_offset
 ,p_name => 'Content Body'
 ,p_placeholder => 'BOX_BODY'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 4
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/no_tabs_left_sidebar
prompt  ......Page template 186410982779809914
 
begin
 
wwv_flow_api.create_template (
  p_id => 186410982779809914 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 105
 ,p_name => 'No Tabs - Left Sidebar'
 ,p_is_popup => false
 ,p_javascript_file_urls => '#IMAGE_PREFIX#libraries/modernizr/2.5.3/modernizr.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'[if lt IE 9]#IMAGE_PREFIX#libraries/respond-js/1.1.0/respond.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25/js/4_2#MIN#.js?v=#APEX_VERSION#'
 ,p_css_file_urls => '#IMAGE_PREFIX#themes/theme_25/css/4_2.css?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25/css/responsive_grid.css?v=#APEX_VERSION#'
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
'<header id="uHeader">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      #REGION_POSITION_07#'||unistr('\000a')||
'      <div class="logoBar">'||unistr('\000a')||
'        <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>'||unistr('\000a')||
'        <div class="userBlock">'||unistr('\000a')||
'          <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'          <span>&APP_USER.</span>'||unistr('\000a')||
'          #NAVIGATION_BAR#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</header>'
 ,p_box => 
'<div id="uBodyContainer">'||unistr('\000a')||
'#REGION_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div id="uTwoColumns" class="sideLeftCol">'||unistr('\000a')||
'  <div class="apex_grid_container">'||unistr('\000a')||
'    <div class="apex_cols apex_span_2" id="uLeftCol">'||unistr('\000a')||
'      <aside>'||unistr('\000a')||
'        #REGION_POSITION_02#'||unistr('\000a')||
'      </aside>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'    <div class="apex_cols apex_span_10" id="uMidCol">'||unistr('\000a')||
'    #BOX_BODY#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'<'||
'/div>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      <div class="uFooterContent">'||unistr('\000a')||
'        <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'        #REGION_POSITION_05#'||unistr('\000a')||
'        #SCREEN_READER_TOGGLE#'||unistr('\000a')||
'        <span class="uFooterVersion">'||unistr('\000a')||
'          #APP_VERSION#'||unistr('\000a')||
'        </span>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'      <div class="uFooterBG">'||unistr('\000a')||
'        <div class="uLeft"></d'||
'iv>'||unistr('\000a')||
'        <div class="uRight"></div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="apex.jQuery(''#uSuccessMessage'').remove();" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #SUCCESS_MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_notification_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="apex.jQuery(''#uNotificationMessage'').remove();" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_region_table_cattributes => 'summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 17
 ,p_grid_type => 'FIXED'
 ,p_grid_max_columns => 12
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_grid_template => '#ROWS#'
 ,p_grid_row_template => '<div class="apex_row">'||unistr('\000a')||
'#COLUMNS#'||unistr('\000a')||
'</div>'
 ,p_grid_column_template => '<div class="apex_cols apex_span_#COLUMN_SPAN_NUMBER# #FIRST_LAST_COLUMN_ATTRIBUTES#">'||unistr('\000a')||
'#CONTENT#'||unistr('\000a')||
'</div>'
 ,p_grid_first_column_attributes => 'alpha'
 ,p_grid_last_column_attributes => 'omega'
 ,p_grid_javascript_debug_code => 'apex.jQuery(document)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-on", showGrid)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-off", hideGrid);'
 ,p_has_edit_links => true
 ,p_reference_id => 3662002440049181
 ,p_translate_this_template => 'N'
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176269432051923038 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186410982779809914 + wwv_flow_api.g_id_offset
 ,p_name => 'Main Content'
 ,p_placeholder => 'BOX_BODY'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 10
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176269841752923038 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186410982779809914 + wwv_flow_api.g_id_offset
 ,p_name => 'Breadcrumb'
 ,p_placeholder => 'REGION_POSITION_01'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176270232607923038 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186410982779809914 + wwv_flow_api.g_id_offset
 ,p_name => 'Left Column'
 ,p_placeholder => 'REGION_POSITION_02'
 ,p_has_grid_support => false
 ,p_max_fixed_grid_columns => 2
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176270659536923038 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186410982779809914 + wwv_flow_api.g_id_offset
 ,p_name => 'Footer'
 ,p_placeholder => 'REGION_POSITION_05'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 12
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176271063380923038 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186410982779809914 + wwv_flow_api.g_id_offset
 ,p_name => 'Header'
 ,p_placeholder => 'REGION_POSITION_07'
 ,p_has_grid_support => false
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/no_tabs_left_and_right_sidebar
prompt  ......Page template 186413277944809916
 
begin
 
wwv_flow_api.create_template (
  p_id => 186413277944809916 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 105
 ,p_name => 'No Tabs - Left and Right Sidebar'
 ,p_is_popup => false
 ,p_javascript_file_urls => '#IMAGE_PREFIX#libraries/modernizr/2.5.3/modernizr.min.js'||unistr('\000a')||
'[if lt IE 9]#IMAGE_PREFIX#libraries/respond-js/1.1.0/respond.min.js'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25/js/4_2#MIN#.js?v=#APEX_VERSION#'
 ,p_css_file_urls => '#IMAGE_PREFIX#themes/theme_25/css/4_2.css?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25/css/responsive_grid.css?v=#APEX_VERSION#'
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
'<header id="uHeader">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      #REGION_POSITION_07#'||unistr('\000a')||
'      <div class="logoBar">'||unistr('\000a')||
'        <h1><a href="#HOME_LINK#" id="uLogo">#LOGO#</a></h1>'||unistr('\000a')||
'        <div class="userBlock">'||unistr('\000a')||
'          <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'          <span>&P1_SEGUSU_NOMBRE.</span>'||unistr('\000a')||
'          #NAVIGATION_BAR#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</header>'
 ,p_box => 
'<div id="uBodyContainer">'||unistr('\000a')||
'#REGION_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div id="uThreeColumns">'||unistr('\000a')||
'  <div class="apex_grid_container">'||unistr('\000a')||
'    <div class="apex_cols apex_span_2" id="uLeftCol">'||unistr('\000a')||
'      <aside>'||unistr('\000a')||
'        #REGION_POSITION_02#'||unistr('\000a')||
'      </aside>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'    <div class="apex_cols apex_span_8" id="uMidCol">'||unistr('\000a')||
'    #BOX_BODY#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'    <div class="apex_cols ape'||
'x_span_2" id="uRightCol">'||unistr('\000a')||
'      <aside>'||unistr('\000a')||
'        #REGION_POSITION_03#'||unistr('\000a')||
'      </aside>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      <div class="uFooterContent">'||unistr('\000a')||
'        #REGION_POSITION_05#'||unistr('\000a')||
'        <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'        #SCREEN_READER_TOGGLE#'||unistr('\000a')||
'        <span class="uFooterVersion">'||unistr('\000a')||
'          #APP_VERSION#'||unistr('\000a')||
'        </span>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBA'||
'R#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion successMessage clearfix" id="uSuccessMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uSuccessMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#SUCCESS_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #SUCCESS_MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_notification_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion errorMessage clearfix" id="uNotificationMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uNotificationMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#ERROR_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_region_table_cattributes => 'summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_03'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 17
 ,p_grid_type => 'FIXED'
 ,p_grid_max_columns => 12
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_grid_template => '#ROWS#'
 ,p_grid_row_template => '<div class="apex_row">'||unistr('\000a')||
'#COLUMNS#'||unistr('\000a')||
'</div>'
 ,p_grid_column_template => '<div class="apex_cols apex_span_#COLUMN_SPAN_NUMBER# #FIRST_LAST_COLUMN_ATTRIBUTES#">'||unistr('\000a')||
'#CONTENT#'||unistr('\000a')||
'</div>'
 ,p_grid_first_column_attributes => 'alpha'
 ,p_grid_last_column_attributes => 'omega'
 ,p_grid_javascript_debug_code => 'apex.jQuery(document)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-on", showGrid)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-off", hideGrid);'
 ,p_has_edit_links => true
 ,p_reference_id => 3664320474049183
 ,p_translate_this_template => 'N'
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176272237014923039 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186413277944809916 + wwv_flow_api.g_id_offset
 ,p_name => 'Content Body'
 ,p_placeholder => 'BOX_BODY'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 8
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176272643249923044 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186413277944809916 + wwv_flow_api.g_id_offset
 ,p_name => 'Breadcrumb'
 ,p_placeholder => 'REGION_POSITION_01'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176273047158923044 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186413277944809916 + wwv_flow_api.g_id_offset
 ,p_name => 'Left Column'
 ,p_placeholder => 'REGION_POSITION_02'
 ,p_has_grid_support => false
 ,p_max_fixed_grid_columns => 2
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176273443213923044 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186413277944809916 + wwv_flow_api.g_id_offset
 ,p_name => 'Footer'
 ,p_placeholder => 'REGION_POSITION_05'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 12
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176273838288923045 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186413277944809916 + wwv_flow_api.g_id_offset
 ,p_name => 'Header'
 ,p_placeholder => 'REGION_POSITION_07'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176274234588923045 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186413277944809916 + wwv_flow_api.g_id_offset
 ,p_name => 'Right Column'
 ,p_placeholder => 'REGION_POSITOIN_03'
 ,p_has_grid_support => false
 ,p_max_fixed_grid_columns => 2
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/no_tabs_no_sidebar
prompt  ......Page template 186415994449809918
 
begin
 
wwv_flow_api.create_template (
  p_id => 186415994449809918 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 105
 ,p_name => 'No Tabs - No Sidebar'
 ,p_is_popup => false
 ,p_javascript_file_urls => '#IMAGE_PREFIX#libraries/modernizr/2.5.3/modernizr.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'[if lt IE 9]#IMAGE_PREFIX#libraries/respond-js/1.1.0/respond.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25/js/4_2#MIN#.js?v=#APEX_VERSION#'
 ,p_css_file_urls => '#IMAGE_PREFIX#themes/theme_25/css/4_2.css?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25/css/responsive_grid.css?v=#APEX_VERSION#'
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
'<header id="uHeader">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      #REGION_POSITION_07#'||unistr('\000a')||
'      <div class="logoBar">'||unistr('\000a')||
'        <h1><a href="#HOME_LINK#" id="uLogo">#LOGO#</a></h1>'||unistr('\000a')||
'        <div class="userBlock">'||unistr('\000a')||
'          <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'          <span>&P1_SEGUSU_NOMBRE.</span>'||unistr('\000a')||
'          #NAVIGATION_BAR#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</header>'
 ,p_box => 
'<div id="uBodyContainer">'||unistr('\000a')||
'#REGION_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div id="uOneCol">'||unistr('\000a')||
'  <div class="apex_grid_container">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      #BOX_BODY#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      <div class="uFooterContent">'||unistr('\000a')||
'        #REGION_POSITION_05#'||unistr('\000a')||
'        <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'        #SCREEN_READER_TOGGLE#'||unistr('\000a')||
'        <span class="uFooterVersion">'||unistr('\000a')||
'          #APP_VERSION# &P1_SEGORG_NOMBRE.'||unistr('\000a')||
'        </span>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'#FORM_CLOSE'||
'#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion successMessage clearfix" id="uSuccessMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uSuccessMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#SUCCESS_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #SUCCESS_MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_notification_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion errorMessage clearfix" id="uNotificationMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uNotificationMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#ERROR_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 3
 ,p_error_page_template => '<div class="apex_cols apex_span_12">'||unistr('\000a')||
'  <section class="uRegion uNoHeading uErrorRegion">'||unistr('\000a')||
'    <div class="uRegionContent">'||unistr('\000a')||
'      <p class="errorIcon"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" class="iconLarge error"/></p>'||unistr('\000a')||
'      <p><strong>#MESSAGE#</strong></p>'||unistr('\000a')||
'      <p>#ADDITIONAL_INFO#</p>'||unistr('\000a')||
'      <div class="uErrorTechInfo">#TECHNICAL_INFO#</div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'    <div class="uRegionHeading">'||unistr('\000a')||
'      <span class="uButtonContainer">'||unistr('\000a')||
'        <button onclick="#BACK_LINK#" class="uButtonLarge uHotButton" type="button"><span>#OK#</span></button>'||unistr('\000a')||
'      </span>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </section>'||unistr('\000a')||
'</div>'
 ,p_grid_type => 'FIXED'
 ,p_grid_max_columns => 12
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_grid_template => '#ROWS#'
 ,p_grid_row_template => '<div class="apex_row">'||unistr('\000a')||
'#COLUMNS#'||unistr('\000a')||
'</div>'
 ,p_grid_column_template => '<div class="apex_cols apex_span_#COLUMN_SPAN_NUMBER# #FIRST_LAST_COLUMN_ATTRIBUTES#">'||unistr('\000a')||
'#CONTENT#'||unistr('\000a')||
'</div>'
 ,p_grid_first_column_attributes => 'alpha'
 ,p_grid_last_column_attributes => 'omega'
 ,p_grid_javascript_debug_code => 'apex.jQuery(document)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-on", showGrid)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-off", hideGrid);'
 ,p_has_edit_links => true
 ,p_reference_id => 3667012749049185
 ,p_translate_this_template => 'N'
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176275235370923046 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186415994449809918 + wwv_flow_api.g_id_offset
 ,p_name => 'Content Body'
 ,p_placeholder => 'BOX_BODY'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 12
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176275633494923046 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186415994449809918 + wwv_flow_api.g_id_offset
 ,p_name => 'Breadcrumb'
 ,p_placeholder => 'REGION_POSITION_01'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176276043911923047 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186415994449809918 + wwv_flow_api.g_id_offset
 ,p_name => 'Footer'
 ,p_placeholder => 'REGION_POSITION_05'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176276462910923047 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186415994449809918 + wwv_flow_api.g_id_offset
 ,p_name => 'Header'
 ,p_placeholder => 'REGION_POSITION_07'
 ,p_has_grid_support => false
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/no_tabs_right_sidebar
prompt  ......Page template 186417873517809919
 
begin
 
wwv_flow_api.create_template (
  p_id => 186417873517809919 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 105
 ,p_name => 'No Tabs - Right Sidebar'
 ,p_is_popup => false
 ,p_javascript_file_urls => '#IMAGE_PREFIX#libraries/modernizr/2.5.3/modernizr.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'[if lt IE 9]#IMAGE_PREFIX#libraries/respond-js/1.1.0/respond.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25/js/4_2#MIN#.js?v=#APEX_VERSION#'
 ,p_css_file_urls => '#IMAGE_PREFIX#themes/theme_25/css/4_2.css?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25/css/responsive_grid.css?v=#APEX_VERSION#'
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
'<header id="uHeader">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      #REGION_POSITION_07#'||unistr('\000a')||
'      <div class="logoBar">'||unistr('\000a')||
'        <h1><a href="#HOME_LINK#" id="uLogo">#LOGO#</a></h1>'||unistr('\000a')||
'        <div class="userBlock">'||unistr('\000a')||
'          <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'          <span>&APP_USER.</span>'||unistr('\000a')||
'          #NAVIGATION_BAR#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</header>'
 ,p_box => 
'<div id="uBodyContainer">'||unistr('\000a')||
'#REGION_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div id="uTwoColumns" class="sideRightCol">'||unistr('\000a')||
'  <div class="apex_grid_container">'||unistr('\000a')||
'    <div class="apex_cols apex_span_10" id="uMidCol">'||unistr('\000a')||
'    #BOX_BODY#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'    <div class="apex_cols apex_span_2" id="uRightCol">'||unistr('\000a')||
'      <aside>'||unistr('\000a')||
'        #REGION_POSITION_03#'||unistr('\000a')||
'      </aside>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||
''||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      <div class="uFooterContent">'||unistr('\000a')||
'        #REGION_POSITION_05#'||unistr('\000a')||
'        <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'        #SCREEN_READER_TOGGLE#'||unistr('\000a')||
'        <span class="uFooterVersion">'||unistr('\000a')||
'          #APP_VERSION#'||unistr('\000a')||
'        </span>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBA'||
'R#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion successMessage clearfix" id="uSuccessMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uSuccessMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#SUCCESS_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #SUCCESS_MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_notification_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion errorMessage clearfix" id="uNotificationMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uNotificationMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#ERROR_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_03'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 3
 ,p_grid_type => 'FIXED'
 ,p_grid_max_columns => 12
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_grid_template => '#ROWS#'
 ,p_grid_row_template => '<div class="apex_row">'||unistr('\000a')||
'#COLUMNS#'||unistr('\000a')||
'</div>'
 ,p_grid_column_template => '<div class="apex_cols apex_span_#COLUMN_SPAN_NUMBER# #FIRST_LAST_COLUMN_ATTRIBUTES#">'||unistr('\000a')||
'#CONTENT#'||unistr('\000a')||
'</div>'
 ,p_grid_first_column_attributes => 'alpha'
 ,p_grid_last_column_attributes => 'omega'
 ,p_grid_javascript_debug_code => 'apex.jQuery(document)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-on", showGrid)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-off", hideGrid);'
 ,p_has_edit_links => true
 ,p_reference_id => 3668901572049187
 ,p_translate_this_template => 'N'
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176277556896923048 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186417873517809919 + wwv_flow_api.g_id_offset
 ,p_name => 'Main Content'
 ,p_placeholder => 'BOX_BODY'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 10
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176277949662923048 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186417873517809919 + wwv_flow_api.g_id_offset
 ,p_name => 'Breadcrumb'
 ,p_placeholder => 'REGION_POSITION_01'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176278361743923048 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186417873517809919 + wwv_flow_api.g_id_offset
 ,p_name => 'Right Column'
 ,p_placeholder => 'REGION_POSITION_03'
 ,p_has_grid_support => false
 ,p_max_fixed_grid_columns => 2
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176278762513923048 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186417873517809919 + wwv_flow_api.g_id_offset
 ,p_name => 'Footer'
 ,p_placeholder => 'REGION_POSITION_05'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 12
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176279132257923048 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186417873517809919 + wwv_flow_api.g_id_offset
 ,p_name => 'Header'
 ,p_placeholder => 'REGION_POSITION_07'
 ,p_has_grid_support => false
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs_content_frame
prompt  ......Page template 186420187812809922
 
begin
 
wwv_flow_api.create_template (
  p_id => 186420187812809922 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 105
 ,p_name => 'One Level Tabs - Content Frame'
 ,p_is_popup => false
 ,p_javascript_file_urls => '#IMAGE_PREFIX#libraries/modernizr/2.5.3/modernizr.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'[if lt IE 9]#IMAGE_PREFIX#libraries/respond-js/1.1.0/respond.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25/js/4_2#MIN#.js?v=#APEX_VERSION#'
 ,p_javascript_code_onload => 
'initContentFrameTabs();'
 ,p_css_file_urls => '#IMAGE_PREFIX#themes/theme_25/css/4_2.css?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25/css/responsive_grid.css?v=#APEX_VERSION#'
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
'<header id="uHeader">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      #REGION_POSITION_07#'||unistr('\000a')||
'      <div class="logoBar">'||unistr('\000a')||
'        <h1><a href="#HOME_LINK#" id="uLogo">#LOGO#</a></h1>'||unistr('\000a')||
'        <div class="userBlock">'||unistr('\000a')||
'          <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'          <span>&APP_USER.</span>'||unistr('\000a')||
'          #NAVIGATION_BAR#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <nav>'||unistr('\000a')||
'    <div class="apex_grid_container clearfix">'||unistr('\000a')||
'      <div class="apex_cols apex_span_12">'||unistr('\000a')||
'        <ul class="uMainNav">'||unistr('\000a')||
'          #TAB_CELLS#'||unistr('\000a')||
'          #REGION_POSITION_06#'||unistr('\000a')||
'        </ul>'||unistr('\000a')||
'        #REGION_POSITION_08#'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </nav>'||unistr('\000a')||
'</header>'
 ,p_box => 
'<div id="uBodyContainer">'||unistr('\000a')||
'#REGION_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div id="uOneCol">'||unistr('\000a')||
'<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uRegion uRegionNoPadding clearfix uRegionFrame">'||unistr('\000a')||
'      <div class="uRegionHeading">'||unistr('\000a')||
'        <h1>#TITLE#</h1>'||unistr('\000a')||
'        <span class="uButtonContainer">'||unistr('\000a')||
'        #REGION_POSITION_02#'||unistr('\000a')||
'  '||
'      </span>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'      <div class="uFrameContent">'||unistr('\000a')||
'        <div class="uFrameMain">'||unistr('\000a')||
'            #BOX_BODY#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'        <div class="uFrameSide">'||unistr('\000a')||
'          <div class="apex_cols apex_span_2 alpha omega">'||unistr('\000a')||
'            #REGION_POSITION_03#'||unistr('\000a')||
'          </div>'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      <div class="uFooterContent">'||unistr('\000a')||
'        #REGION_POSITION_05#'||unistr('\000a')||
'        <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'        #SCREEN_READER_TOGGLE#'||unistr('\000a')||
'        <span class="uFooterVersion">'||unistr('\000a')||
'          #APP_VERSION#'||unistr('\000a')||
'        </span>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBA'||
'R#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion successMessage clearfix" id="uSuccessMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uSuccessMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#SUCCESS_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #SUCCESS_MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_current_tab => '<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_non_current_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_notification_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion errorMessage clearfix" id="uNotificationMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uNotificationMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#ERROR_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>'
 ,p_sidebar_def_reg_pos => 'BODY_3'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 10
 ,p_grid_type => 'FIXED'
 ,p_grid_max_columns => 12
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_grid_template => '#ROWS#'
 ,p_grid_row_template => '<div class="apex_row">'||unistr('\000a')||
'#COLUMNS#'||unistr('\000a')||
'</div>'
 ,p_grid_column_template => '<div class="apex_cols apex_span_#COLUMN_SPAN_NUMBER# #FIRST_LAST_COLUMN_ATTRIBUTES#">'||unistr('\000a')||
'#CONTENT#'||unistr('\000a')||
'</div>'
 ,p_grid_first_column_attributes => 'alpha'
 ,p_grid_last_column_attributes => 'omega'
 ,p_grid_javascript_debug_code => 'apex.jQuery(document)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-on", showGrid)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-off", hideGrid);'
 ,p_has_edit_links => true
 ,p_reference_id => 3671219134049188
 ,p_translate_this_template => 'N'
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176280555271923055 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186420187812809922 + wwv_flow_api.g_id_offset
 ,p_name => 'Content Body'
 ,p_placeholder => 'BOX_BODY'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 10
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176280932702923055 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186420187812809922 + wwv_flow_api.g_id_offset
 ,p_name => 'Breadcrumb'
 ,p_placeholder => 'REGION_POSITION_01'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176281364014923056 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186420187812809922 + wwv_flow_api.g_id_offset
 ,p_name => 'Content Frame Buttons'
 ,p_placeholder => 'REGION_POSITION_02'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176281760661923056 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186420187812809922 + wwv_flow_api.g_id_offset
 ,p_name => 'Side Column'
 ,p_placeholder => 'REGION_POSITION_03'
 ,p_has_grid_support => false
 ,p_max_fixed_grid_columns => 2
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176282147367923057 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186420187812809922 + wwv_flow_api.g_id_offset
 ,p_name => 'Footer'
 ,p_placeholder => 'REGION_POSITION_05'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 12
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176282553547923057 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186420187812809922 + wwv_flow_api.g_id_offset
 ,p_name => 'Page Level Tabs'
 ,p_placeholder => 'REGION_POSITION_06'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176282954200923058 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186420187812809922 + wwv_flow_api.g_id_offset
 ,p_name => 'Header'
 ,p_placeholder => 'REGION_POSITION_07'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176283341168923058 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186420187812809922 + wwv_flow_api.g_id_offset
 ,p_name => 'Icon Nav Bar'
 ,p_placeholder => 'REGION_POSITION_08'
 ,p_has_grid_support => false
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs_left_sidebar
prompt  ......Page template 186423676879809923
 
begin
 
wwv_flow_api.create_template (
  p_id => 186423676879809923 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 105
 ,p_name => 'One Level Tabs - Left Sidebar'
 ,p_is_popup => false
 ,p_javascript_file_urls => '#IMAGE_PREFIX#libraries/modernizr/2.5.3/modernizr.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'[if lt IE 9]#IMAGE_PREFIX#libraries/respond-js/1.1.0/respond.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25/js/4_2#MIN#.js?v=#APEX_VERSION#'
 ,p_css_file_urls => '#IMAGE_PREFIX#themes/theme_25_mc/&P1_APP_THEME./css/4_2.css?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25_mc/&P1_APP_THEME./css/responsive_grid.css?v=#APEX_VERSION#'
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
'<header id="uHeader">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      #REGION_POSITION_07#'||unistr('\000a')||
'      <div class="logoBar">'||unistr('\000a')||
'        <h1><a href="#HOME_LINK#" id="uLogo">#LOGO#</a></h1>'||unistr('\000a')||
'        <div class="userBlock">'||unistr('\000a')||
'          <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'          <span>&P1_SEGUSU_NOMBRE.</span>'||unistr('\000a')||
'          #NAVIGATION_BAR#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <nav>'||unistr('\000a')||
'    <div class="apex_grid_container clearfix">'||unistr('\000a')||
'      <div class="apex_cols apex_span_12">'||unistr('\000a')||
'        <ul class="uMainNav">'||unistr('\000a')||
'          #TAB_CELLS#'||unistr('\000a')||
'          #REGION_POSITION_06#'||unistr('\000a')||
'        </ul>'||unistr('\000a')||
'        #REGION_POSITION_08#'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </nav>'||unistr('\000a')||
'</header>'
 ,p_box => 
'<div id="uBodyContainer">'||unistr('\000a')||
'#REGION_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div id="uTwoColumns" class="sideLeftCol">'||unistr('\000a')||
'  <div class="apex_grid_container">'||unistr('\000a')||
'    <div class="apex_cols apex_span_2" id="uLeftCol">'||unistr('\000a')||
'      <aside>'||unistr('\000a')||
'        #REGION_POSITION_02#'||unistr('\000a')||
'      </aside>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'    <div class="apex_cols apex_span_10" id="uMidCol">'||unistr('\000a')||
'    #BOX_BODY#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'<'||
'/div>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      <div class="uFooterContent">'||unistr('\000a')||
'        #REGION_POSITION_05#'||unistr('\000a')||
'        <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'        #SCREEN_READER_TOGGLE#'||unistr('\000a')||
'        <span class="uFooterVersion">'||unistr('\000a')||
'          #APP_VERSION# &P1_SEGORG_NOMBRE.'||unistr('\000a')||
'        </span>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'#FORM_CLOSE'||
'#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion successMessage clearfix" id="uSuccessMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uSuccessMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#SUCCESS_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #SUCCESS_MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_current_tab => '<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_non_current_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_notification_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion errorMessage clearfix" id="uNotificationMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uNotificationMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#ERROR_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 16
 ,p_grid_type => 'FIXED'
 ,p_grid_max_columns => 12
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_grid_template => '#ROWS#'
 ,p_grid_row_template => '<div class="apex_row">'||unistr('\000a')||
'#COLUMNS#'||unistr('\000a')||
'</div>'
 ,p_grid_column_template => '<div class="apex_cols apex_span_#COLUMN_SPAN_NUMBER# #FIRST_LAST_COLUMN_ATTRIBUTES#">'||unistr('\000a')||
'#CONTENT#'||unistr('\000a')||
'</div>'
 ,p_grid_first_column_attributes => 'alpha'
 ,p_grid_last_column_attributes => 'omega'
 ,p_grid_javascript_debug_code => 'apex.jQuery(document)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-on", showGrid)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-off", hideGrid);'
 ,p_has_edit_links => true
 ,p_reference_id => 3674727367049189
 ,p_translate_this_template => 'N'
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176284657008923059 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186423676879809923 + wwv_flow_api.g_id_offset
 ,p_name => 'Content Body'
 ,p_placeholder => 'BOX_BODY'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 10
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176285053633923059 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186423676879809923 + wwv_flow_api.g_id_offset
 ,p_name => 'Breadcrumb'
 ,p_placeholder => 'REGION_POSITION_01'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176285444687923059 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186423676879809923 + wwv_flow_api.g_id_offset
 ,p_name => 'Left Column'
 ,p_placeholder => 'REGION_POSITION_02'
 ,p_has_grid_support => false
 ,p_max_fixed_grid_columns => 2
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176285848929923060 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186423676879809923 + wwv_flow_api.g_id_offset
 ,p_name => 'Footer'
 ,p_placeholder => 'REGION_POSITION_05'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 12
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176286263334923060 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186423676879809923 + wwv_flow_api.g_id_offset
 ,p_name => 'Page Level Tabs'
 ,p_placeholder => 'REGION_POSITION_06'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176286649538923060 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186423676879809923 + wwv_flow_api.g_id_offset
 ,p_name => 'Header'
 ,p_placeholder => 'REGION_POSITION_07'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176287049879923060 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186423676879809923 + wwv_flow_api.g_id_offset
 ,p_name => 'Icon Nav Bar'
 ,p_placeholder => 'REGION_POSITION_08'
 ,p_has_grid_support => false
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs_left_and_right_sidebar
prompt  ......Page template 186426774450809925
 
begin
 
wwv_flow_api.create_template (
  p_id => 186426774450809925 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 105
 ,p_name => 'One Level Tabs - Left and Right Sidebar'
 ,p_is_popup => false
 ,p_javascript_file_urls => '#IMAGE_PREFIX#libraries/modernizr/2.5.3/modernizr.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'[if lt IE 9]#IMAGE_PREFIX#libraries/respond-js/1.1.0/respond.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25/js/4_2#MIN#.js?v=#APEX_VERSION#'
 ,p_css_file_urls => '#IMAGE_PREFIX#themes/theme_25_mc/&P1_APP_THEME./css/4_2.css?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25_mc/&P1_APP_THEME./css/responsive_grid.css?v=#APEX_VERSION#'
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
'<header id="uHeader">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      #REGION_POSITION_07#'||unistr('\000a')||
'      <div class="logoBar">'||unistr('\000a')||
'        <h1><a href="#HOME_LINK#" id="uLogo">#LOGO#</a></h1>'||unistr('\000a')||
'        <div class="userBlock">'||unistr('\000a')||
'          <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'          <span>&P1_SEGUSU_NOMBRE.</span>'||unistr('\000a')||
'          #NAVIGATION_BAR#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <nav>'||unistr('\000a')||
'    <div class="apex_grid_container clearfix">'||unistr('\000a')||
'      <div class="apex_cols apex_span_12">'||unistr('\000a')||
'        <ul class="uMainNav">'||unistr('\000a')||
'          #TAB_CELLS#'||unistr('\000a')||
'          #REGION_POSITION_06#'||unistr('\000a')||
'        </ul>'||unistr('\000a')||
'        #REGION_POSITION_08#'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </nav>'||unistr('\000a')||
'</header>'
 ,p_box => 
'<div id="uBodyContainer">'||unistr('\000a')||
'#REGION_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div id="uThreeColumns">'||unistr('\000a')||
'  <div class="apex_grid_container">'||unistr('\000a')||
'    <div class="apex_cols apex_span_2" id="uLeftCol">'||unistr('\000a')||
'      <aside>'||unistr('\000a')||
'        #REGION_POSITION_02#'||unistr('\000a')||
'      </aside>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'    <div class="apex_cols apex_span_8" id="uMidCol">'||unistr('\000a')||
'    #BOX_BODY#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'    <div class="apex_cols ape'||
'x_span_2" id="uRightCol">'||unistr('\000a')||
'      <aside>'||unistr('\000a')||
'        #REGION_POSITION_03#'||unistr('\000a')||
'      </aside>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      <div class="uFooterContent">'||unistr('\000a')||
'        #REGION_POSITION_05#'||unistr('\000a')||
'        <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'        #SCREEN_READER_TOGGLE#'||unistr('\000a')||
'        <span class="uFooterVersion">'||unistr('\000a')||
'          #APP_VERSION# &P1_SEGORG_NOMBRE.'||unistr('\000a')||
'        </span>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'#FORM_CLOSE'||
'#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion successMessage clearfix" id="uSuccessMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uSuccessMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#SUCCESS_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #SUCCESS_MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_current_tab => '<li><a class="active" href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_non_current_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_notification_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion errorMessage clearfix" id="uNotificationMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uNotificationMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#ERROR_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_03'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 16
 ,p_grid_type => 'FIXED'
 ,p_grid_max_columns => 12
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_grid_template => '#ROWS#'
 ,p_grid_row_template => '<div class="apex_row">'||unistr('\000a')||
'#COLUMNS#'||unistr('\000a')||
'</div>'
 ,p_grid_column_template => '<div class="apex_cols apex_span_#COLUMN_SPAN_NUMBER# #FIRST_LAST_COLUMN_ATTRIBUTES#">'||unistr('\000a')||
'#CONTENT#'||unistr('\000a')||
'</div>'
 ,p_grid_first_column_attributes => 'alpha'
 ,p_grid_last_column_attributes => 'omega'
 ,p_grid_javascript_debug_code => 'apex.jQuery(document)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-on", showGrid)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-off", hideGrid);'
 ,p_has_edit_links => true
 ,p_reference_id => 3677804820049193
 ,p_translate_this_template => 'N'
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176288451832923061 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186426774450809925 + wwv_flow_api.g_id_offset
 ,p_name => 'Content Body'
 ,p_placeholder => 'BOX_BODY'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 8
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176288852933923061 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186426774450809925 + wwv_flow_api.g_id_offset
 ,p_name => 'Left Column'
 ,p_placeholder => 'REGION_POSITION_02'
 ,p_has_grid_support => false
 ,p_max_fixed_grid_columns => 2
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176289240228923062 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186426774450809925 + wwv_flow_api.g_id_offset
 ,p_name => 'Breadcrumb'
 ,p_placeholder => 'REGION_POSITON_01'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176289662180923062 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186426774450809925 + wwv_flow_api.g_id_offset
 ,p_name => 'Right Column'
 ,p_placeholder => 'REGION_POSITON_03'
 ,p_has_grid_support => false
 ,p_max_fixed_grid_columns => 2
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176290041923923062 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186426774450809925 + wwv_flow_api.g_id_offset
 ,p_name => 'Footer'
 ,p_placeholder => 'REGION_POSITON_05'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 12
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176290464225923062 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186426774450809925 + wwv_flow_api.g_id_offset
 ,p_name => 'Page Level Tabs'
 ,p_placeholder => 'REGION_POSITON_06'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176290861413923062 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186426774450809925 + wwv_flow_api.g_id_offset
 ,p_name => 'Header'
 ,p_placeholder => 'REGION_POSITON_07'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176291231853923063 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186426774450809925 + wwv_flow_api.g_id_offset
 ,p_name => 'Icon Nav Bar'
 ,p_placeholder => 'REGION_POSITON_08'
 ,p_has_grid_support => false
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs_no_sidebar
prompt  ......Page template 186430288616809926
 
begin
 
wwv_flow_api.create_template (
  p_id => 186430288616809926 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 105
 ,p_name => 'One Level Tabs - No Sidebar'
 ,p_is_popup => false
 ,p_javascript_file_urls => '#IMAGE_PREFIX#libraries/modernizr/2.5.3/modernizr.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'[if lt IE 9]#IMAGE_PREFIX#libraries/respond-js/1.1.0/respond.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25_mc/&P1_APP_THEME./js/4_2#MIN#.js?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#fn_reloj.js'
 ,p_javascript_code_onload => 
'Reloj(); FechaActual();'
 ,p_css_file_urls => '#IMAGE_PREFIX#themes/theme_25_mc/&P1_APP_THEME./css/4_2.css?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25_mc/&P1_APP_THEME./css/responsive_grid.css?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25_mc/&P1_APP_THEME./css/font-awesome.css'
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <script src="#IMAGE_PREFIX#relojserver.php"></script>'||unistr('\000a')||
'  <style>#outdated-browser{background-color:#f1c40f; height:50px; padding-top:10px; color:#000; font-size:16px; text-align:center;font-weight:bold;}</style>'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
''||unistr('\000a')||
'<!--[if lte IE 8]><div id="outdated-browser">Está utilizando un explorador web anticuado. No podemos asegurar que la aplicacion funcione correctamente.<br>Utilice alguno de estos navegadores actualizados <a href="https://www.google.com/chrome/" target="_blank">Chrome</a> | <a href="https://www.mozilla.org/es-AR/firefox/new/" target="_blank">Firefox</a> | <a href="http://windows.microsoft.com/es-ar/internet-explorer/download-ie" target="_blank">Internet Explorer</a></div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
'<header id="uHeader">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      #REGION_POSITION_07#'||unistr('\000a')||
'      <div class="logoBar">'||unistr('\000a')||
'        <h1><a href="#HOME_LINK#" id="uLogo">#LOGO#</a></h1>'||unistr('\000a')||
'         #REGION_POSITION_05#'||unistr('\000a')||
'         <div class="reloj"><span id="Fecha_Reloj"></span> - Vista: <span id="Fecha_Actual"></span></div>'||unistr('\000a')||
'        <!--<div class="userBlock">'||unistr('\000a')||
'          <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'          <span>&P1_SEGUSU_NOMBRE.</span>'||unistr('\000a')||
''||unistr('\000a')||
'        </div>-->'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <nav>'||unistr('\000a')||
'    <div class="apex_grid_container clearfix">'||unistr('\000a')||
'      <div class="apex_cols apex_span_12">'||unistr('\000a')||
'        <ul class="uMainNav">'||unistr('\000a')||
'          #TAB_CELLS#'||unistr('\000a')||
'          #REGION_POSITION_06#'||unistr('\000a')||
'        </ul>'||unistr('\000a')||
'        #REGION_POSITION_08#'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </nav>'||unistr('\000a')||
'</header>'
 ,p_box => 
'<div id="uBodyContainer">'||unistr('\000a')||
'#REGION_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div id="uOneCol">'||unistr('\000a')||
'  <div class="apex_grid_container">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      #BOX_BODY#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      <div class="uFooterContent">'||unistr('\000a')||
'        #NAVIGATION_BAR#'||unistr('\000a')||
'        <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'        <span class="uFooterVersion" style="float:right;">'||unistr('\000a')||
'          &P1_SEGAPL_NOMBRE. #APP_VERSION# - &MSJ_COPYRIGHT.'||unistr('\000a')||
'        </span>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'#FORM_C'||
'LOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion successMessage clearfix" id="uSuccessMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uSuccessMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#SUCCESS_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #SUCCESS_MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_current_tab => '<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_non_current_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_notification_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion errorMessage clearfix" id="uNotificationMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uNotificationMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#ERROR_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_region_table_cattributes => 'class="regionColumns"'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 1
 ,p_grid_type => 'FIXED'
 ,p_grid_max_columns => 12
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_grid_template => '#ROWS#'
 ,p_grid_row_template => '<div class="apex_row">'||unistr('\000a')||
'#COLUMNS#'||unistr('\000a')||
'</div>'
 ,p_grid_column_template => '<div class="apex_cols apex_span_#COLUMN_SPAN_NUMBER# #FIRST_LAST_COLUMN_ATTRIBUTES#">'||unistr('\000a')||
'#CONTENT#'||unistr('\000a')||
'</div>'
 ,p_grid_first_column_attributes => 'alpha'
 ,p_grid_last_column_attributes => 'omega'
 ,p_grid_javascript_debug_code => 'apex.jQuery(document)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-on", showGrid)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-off", hideGrid);'
 ,p_has_edit_links => true
 ,p_reference_id => 48158723423054433
 ,p_translate_this_template => 'N'
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 78331018761023518 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186430288616809926 + wwv_flow_api.g_id_offset
 ,p_name => 'Content Body'
 ,p_placeholder => 'BOX_BODY'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 12
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 78331411451023518 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186430288616809926 + wwv_flow_api.g_id_offset
 ,p_name => 'Breadcrumb'
 ,p_placeholder => 'REGION_POSITION_01'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 78331805124023518 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186430288616809926 + wwv_flow_api.g_id_offset
 ,p_name => 'Footer'
 ,p_placeholder => 'REGION_POSITION_05'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 12
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 78332206996023518 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186430288616809926 + wwv_flow_api.g_id_offset
 ,p_name => 'Page Level Tabs'
 ,p_placeholder => 'REGION_POSITION_06'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 78332616803023518 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186430288616809926 + wwv_flow_api.g_id_offset
 ,p_name => 'Header'
 ,p_placeholder => 'REGION_POSITION_07'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 78333028095023518 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186430288616809926 + wwv_flow_api.g_id_offset
 ,p_name => 'Icon Nav Bar'
 ,p_placeholder => 'REGION_POSITION_08'
 ,p_has_grid_support => false
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs_right_sidebar
prompt  ......Page template 186432974821809927
 
begin
 
wwv_flow_api.create_template (
  p_id => 186432974821809927 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 105
 ,p_name => 'One Level Tabs - Right Sidebar'
 ,p_is_popup => false
 ,p_javascript_file_urls => '#IMAGE_PREFIX#libraries/modernizr/2.5.3/modernizr.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'[if lt IE 9]#IMAGE_PREFIX#libraries/respond-js/1.1.0/respond.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25_mc/&P1_APP_THEME./js/4_2#MIN#.js?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#fn_reloj.js'
 ,p_javascript_code_onload => 
'Reloj(); FechaActual();'
 ,p_css_file_urls => '#IMAGE_PREFIX#themes/theme_25_mc/&P1_APP_THEME./css/4_2.css?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25_mc/&P1_APP_THEME./css/responsive_grid.css?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25_mc/&P1_APP_THEME./css/font-awesome.css'||unistr('\000a')||
''
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <script language="JavaScript" src="#IMAGE_PREFIX#relojserver.php"></script>'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
'<header id="uHeader">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      #REGION_POSITION_07#'||unistr('\000a')||
'      <div class="logoBar">'||unistr('\000a')||
'        <h1><a href="#HOME_LINK#" id="uLogo">#LOGO#</a></h1>'||unistr('\000a')||
'        #REGION_POSITION_05#'||unistr('\000a')||
'        <div class="reloj"><span id="Fecha_Reloj"></span> - Vista: <span id="Fecha_Actual"></span></div>'||unistr('\000a')||
'        <div class="userBlock">          '||unistr('\000a')||
'          <!--<img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'          <span>&P1_SEGUSU_NOMBRE.</span>-->          '||unistr('\000a')||
'          '||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <nav>'||unistr('\000a')||
'    <div class="apex_grid_container clearfix">'||unistr('\000a')||
'      <div class="apex_cols apex_span_12">'||unistr('\000a')||
'        <ul class="uMainNav">'||unistr('\000a')||
'          #TAB_CELLS#'||unistr('\000a')||
'          #REGION_POSITION_06#'||unistr('\000a')||
'        </ul>'||unistr('\000a')||
'        #REGION_POSITION_08#'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </nav>'||unistr('\000a')||
'</header>'
 ,p_box => 
'<div id="uBodyContainer">'||unistr('\000a')||
'#REGION_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#'||unistr('\000a')||
'<div id="uTwoColumns" class="sideRightCol">'||unistr('\000a')||
'  <div class="apex_grid_container">'||unistr('\000a')||
'    <div class="apex_cols apex_span_10" id="uMidCol">'||unistr('\000a')||
'    #GLOBAL_NOTIFICATION#'||unistr('\000a')||
'    #BOX_BODY#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'    <div class="apex_cols apex_span_2" id="uRightCol">'||unistr('\000a')||
'      <aside>'||unistr('\000a')||
'        #REGION_POSITION_03#'||unistr('\000a')||
'      </aside>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  <'||
'/div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      <div class="uFooterContent">'||unistr('\000a')||
'        <span style="float:left;">#NAVIGATION_BAR#</span>'||unistr('\000a')||
'        <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'        <span class="uFooterVersion" style="float:right;">'||unistr('\000a')||
'          &P1_SEGAPL_NOMBRE. #APP_VERSION# - &MSJ_COPYRIGHT.'||unistr('\000a')||
'        </span>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    '||
'</div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion successMessage clearfix" id="uSuccessMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uSuccessMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#SUCCESS_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #SUCCESS_MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_current_tab => '<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_non_current_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_notification_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion errorMessage clearfix" id="uNotificationMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uNotificationMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#ERROR_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_03'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 16
 ,p_grid_type => 'FIXED'
 ,p_grid_max_columns => 12
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_grid_template => '#ROWS#'
 ,p_grid_row_template => '<div class="apex_row">'||unistr('\000a')||
'#COLUMNS#'||unistr('\000a')||
'</div>'
 ,p_grid_column_template => '<div class="apex_cols apex_span_#COLUMN_SPAN_NUMBER# #FIRST_LAST_COLUMN_ATTRIBUTES#">'||unistr('\000a')||
'#CONTENT#'||unistr('\000a')||
'</div>'
 ,p_grid_first_column_attributes => 'alpha'
 ,p_grid_last_column_attributes => 'omega'
 ,p_grid_javascript_debug_code => '// show / hide grid'||unistr('\000a')||
'function showGrid() {'||unistr('\000a')||
'  apex.jQuery(''.apex_grid_container'').addClass(''showGrid'');'||unistr('\000a')||
'};'||unistr('\000a')||
'function hideGrid() {'||unistr('\000a')||
'  apex.jQuery(''.apex_grid_container'').removeClass(''showGrid'');'||unistr('\000a')||
'};'||unistr('\000a')||
'apex.jQuery(document)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-on", showGrid)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-off", hideGrid);'
 ,p_has_edit_links => false
 ,p_reference_id => 48161440694054435
 ,p_translate_this_template => 'N'
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 62776602828663943 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186432974821809927 + wwv_flow_api.g_id_offset
 ,p_name => 'Content Body'
 ,p_placeholder => 'BOX_BODY'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 10
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 62777026741663943 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186432974821809927 + wwv_flow_api.g_id_offset
 ,p_name => 'Breadcrumb'
 ,p_placeholder => 'REGION_POSITION_01'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 62777424868663945 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186432974821809927 + wwv_flow_api.g_id_offset
 ,p_name => 'Right Column'
 ,p_placeholder => 'REGION_POSITION_03'
 ,p_has_grid_support => false
 ,p_max_fixed_grid_columns => 2
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 62777809553663945 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186432974821809927 + wwv_flow_api.g_id_offset
 ,p_name => 'Footer'
 ,p_placeholder => 'REGION_POSITION_05'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 12
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 62778219161663945 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186432974821809927 + wwv_flow_api.g_id_offset
 ,p_name => 'Page Level Tabs'
 ,p_placeholder => 'REGION_POSITION_06'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 62778609095663945 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186432974821809927 + wwv_flow_api.g_id_offset
 ,p_name => 'Header'
 ,p_placeholder => 'REGION_POSITION_07'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 62779010661663945 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186432974821809927 + wwv_flow_api.g_id_offset
 ,p_name => 'Icon Nav Bar'
 ,p_placeholder => 'REGION_POSITION_08'
 ,p_has_grid_support => false
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs_wizard_page
prompt  ......Page template 186436101171809929
 
begin
 
wwv_flow_api.create_template (
  p_id => 186436101171809929 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 105
 ,p_name => 'One Level Tabs - Wizard Page'
 ,p_is_popup => false
 ,p_javascript_file_urls => '#IMAGE_PREFIX#libraries/modernizr/2.5.3/modernizr.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'[if lt IE 9]#IMAGE_PREFIX#libraries/respond-js/1.1.0/respond.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25/js/4_2#MIN#.js?v=#APEX_VERSION#'
 ,p_javascript_code_onload => 
'loadWizardTrain();'
 ,p_css_file_urls => '#IMAGE_PREFIX#themes/theme_25/css/4_2.css?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25/css/responsive_grid.css?v=#APEX_VERSION#'
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
'<header id="uHeader">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      #REGION_POSITION_07#'||unistr('\000a')||
'      <div class="logoBar">'||unistr('\000a')||
'        <h1><a href="#HOME_LINK#" id="uLogo">#LOGO#</a></h1>'||unistr('\000a')||
'        <div class="userBlock">'||unistr('\000a')||
'          <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'          <span>&P1_SEGUSU_NOMBRE.</span>'||unistr('\000a')||
'          #NAVIGATION_BAR#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <nav>'||unistr('\000a')||
'    <div class="apex_grid_container clearfix">'||unistr('\000a')||
'      <div class="apex_cols apex_span_12">'||unistr('\000a')||
'        <ul class="uMainNav">'||unistr('\000a')||
'          #TAB_CELLS#'||unistr('\000a')||
'          #REGION_POSITION_06#'||unistr('\000a')||
'        </ul>'||unistr('\000a')||
'        #REGION_POSITION_08#'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </nav>'||unistr('\000a')||
'</header>'
 ,p_box => 
'<div id="uBodyContainer">'||unistr('\000a')||
'#REGION_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div id="uOneCol">'||unistr('\000a')||
'<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <div class="cWizard">'||unistr('\000a')||
'      <div class="cWizardHeader">'||unistr('\000a')||
'        #REGION_POSITION_02#'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'      <div class="cWizardContentContainer">'||unistr('\000a')||
'        <div class="cWizardContent">'||unistr('\000a')||
'            #BOX_'||
'BODY#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      <div class="uFooterContent">'||unistr('\000a')||
'        <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'        #REGION_POSITION_05#'||unistr('\000a')||
'        #SCREEN_READER_TOGGLE#'||unistr('\000a')||
'        <span class="uFooterVersion">'||unistr('\000a')||
'          #APP_VERSION# &P1_SEGORG_NOMBRE.'||unistr('\000a')||
'        </span>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'#FORM_CLOSE'||
'#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion successMessage clearfix" id="uSuccessMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uSuccessMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#SUCCESS_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #SUCCESS_MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_current_tab => '<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_non_current_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_notification_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion errorMessage clearfix" id="uNotificationMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uNotificationMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#ERROR_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 8
 ,p_grid_type => 'FIXED'
 ,p_grid_max_columns => 12
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_grid_template => '#ROWS#'
 ,p_grid_row_template => '<div class="apex_row">'||unistr('\000a')||
'#COLUMNS#'||unistr('\000a')||
'</div>'
 ,p_grid_column_template => '<div class="apex_cols apex_span_#COLUMN_SPAN_NUMBER# #FIRST_LAST_COLUMN_ATTRIBUTES#">'||unistr('\000a')||
'#CONTENT#'||unistr('\000a')||
'</div>'
 ,p_grid_first_column_attributes => 'alpha'
 ,p_grid_last_column_attributes => 'omega'
 ,p_grid_javascript_debug_code => 'apex.jQuery(document)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-on", showGrid)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-off", hideGrid);'
 ,p_has_edit_links => true
 ,p_reference_id => 3687124467049199
 ,p_translate_this_template => 'N'
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176299458636923068 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186436101171809929 + wwv_flow_api.g_id_offset
 ,p_name => 'Wizard Content Body'
 ,p_placeholder => 'BOX_BODY'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 11
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176299861659923068 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186436101171809929 + wwv_flow_api.g_id_offset
 ,p_name => 'Breadcrumb'
 ,p_placeholder => 'REGION_POSITION_01'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176300234252923068 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186436101171809929 + wwv_flow_api.g_id_offset
 ,p_name => 'Wizard Header'
 ,p_placeholder => 'REGION_POSITION_02'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176300654384923069 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186436101171809929 + wwv_flow_api.g_id_offset
 ,p_name => 'Footer'
 ,p_placeholder => 'REGION_POSITION_05'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 12
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176301054139923069 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186436101171809929 + wwv_flow_api.g_id_offset
 ,p_name => 'Page Level Tabs'
 ,p_placeholder => 'REGION_POSITION_06'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176301444561923069 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186436101171809929 + wwv_flow_api.g_id_offset
 ,p_name => 'Header'
 ,p_placeholder => 'REGION_POSITION_07'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176301851283923069 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186436101171809929 + wwv_flow_api.g_id_offset
 ,p_name => 'Icon Nav Bar'
 ,p_placeholder => 'REGION_POSITION_08'
 ,p_has_grid_support => false
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/popup
prompt  ......Page template 186439175682809931
 
begin
 
wwv_flow_api.create_template (
  p_id => 186439175682809931 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 105
 ,p_name => 'Popup'
 ,p_is_popup => false
 ,p_javascript_file_urls => '#IMAGE_PREFIX#libraries/modernizr/2.5.3/modernizr.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'[if lt IE 9]#IMAGE_PREFIX#libraries/respond-js/1.1.0/respond.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25/js/4_2#MIN#.js?v=#APEX_VERSION#'
 ,p_css_file_urls => '#IMAGE_PREFIX#themes/theme_25_mc/&P1_APP_THEME./css/4_2.css?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25_mc/&P1_APP_THEME./css/responsive_grid.css?v=#APEX_VERSION#'
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD# id="uPopup">'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'
 ,p_box => 
'<div id="uBodyContainer">'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div id="uOneCol">'||unistr('\000a')||
'  <div class="apex_grid_container">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      #BOX_BODY#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion successMessage clearfix" id="uSuccessMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uSuccessMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#SUCCESS_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #SUCCESS_MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_notification_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion errorMessage clearfix" id="uNotificationMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uNotificationMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#ERROR_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_theme_class_id => 4
 ,p_grid_type => 'FIXED'
 ,p_grid_max_columns => 12
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_grid_template => '#ROWS#'
 ,p_grid_row_template => '<div class="apex_row">'||unistr('\000a')||
'#COLUMNS#'||unistr('\000a')||
'</div>'
 ,p_grid_column_template => '<div class="apex_cols apex_span_#COLUMN_SPAN_NUMBER# #FIRST_LAST_COLUMN_ATTRIBUTES#">'||unistr('\000a')||
'#CONTENT#'||unistr('\000a')||
'</div>'
 ,p_grid_first_column_attributes => 'alpha'
 ,p_grid_last_column_attributes => 'omega'
 ,p_grid_javascript_debug_code => 'apex.jQuery(document)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-on", showGrid)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-off", hideGrid);'
 ,p_has_edit_links => true
 ,p_reference_id => 3690232619049201
 ,p_translate_this_template => 'N'
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176302541858923070 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186439175682809931 + wwv_flow_api.g_id_offset
 ,p_name => 'Content Body'
 ,p_placeholder => 'BOX_BODY'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 12
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/printer_friendly
prompt  ......Page template 186439887895809932
 
begin
 
wwv_flow_api.create_template (
  p_id => 186439887895809932 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 105
 ,p_name => 'Printer Friendly'
 ,p_is_popup => false
 ,p_javascript_file_urls => '#IMAGE_PREFIX#libraries/modernizr/2.5.3/modernizr.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'[if lt IE 9]#IMAGE_PREFIX#libraries/respond-js/1.1.0/respond.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25/js/4_2#MIN#.js?v=#APEX_VERSION#'
 ,p_css_file_urls => '#IMAGE_PREFIX#themes/theme_25/css/4_2.css?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25/css/responsive_grid.css?v=#APEX_VERSION#'
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD# class="printerFriendly">'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
'<header id="uHeader">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      #REGION_POSITION_07#'||unistr('\000a')||
'      <div class="logoBar">'||unistr('\000a')||
'        <h1><a href="#HOME_LINK#" id="uLogo">#LOGO#</a></h1>'||unistr('\000a')||
'        <div class="userBlock">'||unistr('\000a')||
'          <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'          <span>&APP_USER.</span>'||unistr('\000a')||
'          #NAVIGATION_BAR#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</header>'
 ,p_box => 
'<div id="uBodyContainer">'||unistr('\000a')||
'#REGION_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div id="uOneCol">'||unistr('\000a')||
'  <div class="apex_grid_container">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      #BOX_BODY#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      <div class="uFooterContent">'||unistr('\000a')||
'        #REGION_POSITION_05#'||unistr('\000a')||
'        <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'        #SCREEN_READER_TOGGLE#'||unistr('\000a')||
'        <span class="uFooterVersion">'||unistr('\000a')||
'          #APP_VERSION#'||unistr('\000a')||
'        </span>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBA'||
'R#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion successMessage clearfix" id="uSuccessMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uSuccessMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#SUCCESS_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #SUCCESS_MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_notification_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion errorMessage clearfix" id="uNotificationMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uNotificationMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#ERROR_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 5
 ,p_error_page_template => '<div class="apex_cols apex_span_12">'||unistr('\000a')||
'  <section class="uRegion uNoHeading uErrorRegion">'||unistr('\000a')||
'    <div class="uRegionContent">'||unistr('\000a')||
'      <p class="errorIcon"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" class="iconLarge error"/></p>'||unistr('\000a')||
'      <p><strong>#MESSAGE#</strong></p>'||unistr('\000a')||
'      <p>#ADDITIONAL_INFO#</p>'||unistr('\000a')||
'      <div class="uErrorTechInfo">#TECHNICAL_INFO#</div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'    <div class="uRegionHeading">'||unistr('\000a')||
'      <span class="uButtonContainer">'||unistr('\000a')||
'        <button onclick="#BACK_LINK#" class="uButtonLarge uHotButton" type="button"><span>#OK#</span></button>'||unistr('\000a')||
'      </span>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </section>'||unistr('\000a')||
'</div>'
 ,p_grid_type => 'FIXED'
 ,p_grid_max_columns => 12
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_grid_template => '#ROWS#'
 ,p_grid_row_template => '<div class="apex_row">'||unistr('\000a')||
'#COLUMNS#'||unistr('\000a')||
'</div>'
 ,p_grid_column_template => '<div class="apex_cols apex_span_#COLUMN_SPAN_NUMBER# #FIRST_LAST_COLUMN_ATTRIBUTES#">'||unistr('\000a')||
'#CONTENT#'||unistr('\000a')||
'</div>'
 ,p_grid_first_column_attributes => 'alpha'
 ,p_grid_last_column_attributes => 'omega'
 ,p_grid_javascript_debug_code => 'apex.jQuery(document)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-on", showGrid)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-off", hideGrid);'
 ,p_has_edit_links => true
 ,p_reference_id => 3690910171049202
 ,p_translate_this_template => 'N'
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176303532727923071 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186439887895809932 + wwv_flow_api.g_id_offset
 ,p_name => 'Content Body'
 ,p_placeholder => 'BOX_BODY'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 12
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176303963600923071 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186439887895809932 + wwv_flow_api.g_id_offset
 ,p_name => 'Breadcrumb'
 ,p_placeholder => 'REGION_POSITION_01'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176304335785923071 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186439887895809932 + wwv_flow_api.g_id_offset
 ,p_name => 'Footer'
 ,p_placeholder => 'REGION_POSITION_05'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176304739856923071 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186439887895809932 + wwv_flow_api.g_id_offset
 ,p_name => 'Header'
 ,p_placeholder => 'REGION_POSITION_07'
 ,p_has_grid_support => false
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/two_level_tabs_left_sidebar
prompt  ......Page template 186441789568809933
 
begin
 
wwv_flow_api.create_template (
  p_id => 186441789568809933 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 105
 ,p_name => 'Two Level Tabs - Left Sidebar'
 ,p_is_popup => false
 ,p_javascript_file_urls => '#IMAGE_PREFIX#libraries/modernizr/2.5.3/modernizr.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'[if lt IE 9]#IMAGE_PREFIX#libraries/respond-js/1.1.0/respond.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25/js/4_2#MIN#.js?v=#APEX_VERSION#'
 ,p_css_file_urls => '#IMAGE_PREFIX#themes/theme_25/css/4_2.css?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25/css/responsive_grid.css?v=#APEX_VERSION#'
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
'<div class="uParentTabs">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      <ul>'||unistr('\000a')||
'        #PARENT_TAB_CELLS#'||unistr('\000a')||
'      </ul>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>  '||unistr('\000a')||
'</div>'||unistr('\000a')||
'<header id="uHeader">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      #REGION_POSITION_07#'||unistr('\000a')||
'      <div class="logoBar">'||unistr('\000a')||
'        <h1><a href="#HOME_LINK#" id="uLogo">#LOGO#</a></h1>'||unistr('\000a')||
'        <div class="userBlock">'||unistr('\000a')||
'          <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'          <span>&APP_USER.</span>'||unistr('\000a')||
'          #NAVIGATION_BAR#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <nav>'||unistr('\000a')||
'    <div class="apex_grid_container clearfix">'||unistr('\000a')||
'      <div class="apex_cols apex_span_12">'||unistr('\000a')||
'        <ul class="uMainNav">'||unistr('\000a')||
'          #TAB_CELLS#'||unistr('\000a')||
'          #REGION_POSITION_06#'||unistr('\000a')||
'        </ul>'||unistr('\000a')||
'        #REGION_POSITION_08#'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </nav>'||unistr('\000a')||
'</header>'
 ,p_box => 
'<div id="uBodyContainer">'||unistr('\000a')||
'#REGION_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div id="uTwoColumns" class="sideLeftCol">'||unistr('\000a')||
'  <div class="apex_grid_container">'||unistr('\000a')||
'    <div class="apex_cols apex_span_2" id="uLeftCol">'||unistr('\000a')||
'      <aside>'||unistr('\000a')||
'        #REGION_POSITION_02#'||unistr('\000a')||
'      </aside>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'    <div class="apex_cols apex_span_10" id="uMidCol">'||unistr('\000a')||
'    #BOX_BODY#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'<'||
'/div>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      <div class="uFooterContent">'||unistr('\000a')||
'        #REGION_POSITION_05#'||unistr('\000a')||
'        <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'        #SCREEN_READER_TOGGLE#'||unistr('\000a')||
'        <span class="uFooterVersion">'||unistr('\000a')||
'          #APP_VERSION#'||unistr('\000a')||
'        </span>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBA'||
'R#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion successMessage clearfix" id="uSuccessMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uSuccessMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#SUCCESS_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #SUCCESS_MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_current_tab => '<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_non_current_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_top_current_tab => '<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_top_non_curr_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_notification_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion errorMessage clearfix" id="uNotificationMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uNotificationMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#ERROR_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 18
 ,p_grid_type => 'FIXED'
 ,p_grid_max_columns => 12
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_grid_template => '#ROWS#'
 ,p_grid_row_template => '<div class="apex_row">'||unistr('\000a')||
'#COLUMNS#'||unistr('\000a')||
'</div>'
 ,p_grid_column_template => '<div class="apex_cols apex_span_#COLUMN_SPAN_NUMBER# #FIRST_LAST_COLUMN_ATTRIBUTES#">'||unistr('\000a')||
'#CONTENT#'||unistr('\000a')||
'</div>'
 ,p_grid_first_column_attributes => 'alpha'
 ,p_grid_last_column_attributes => 'omega'
 ,p_grid_javascript_debug_code => 'apex.jQuery(document)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-on", showGrid)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-off", hideGrid);'
 ,p_has_edit_links => true
 ,p_reference_id => 3692826689049202
 ,p_translate_this_template => 'N'
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176306045346923077 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186441789568809933 + wwv_flow_api.g_id_offset
 ,p_name => 'Content Body'
 ,p_placeholder => 'BOX_BODY'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 10
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176306444877923077 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186441789568809933 + wwv_flow_api.g_id_offset
 ,p_name => 'Breadcrumb'
 ,p_placeholder => 'REGION_POSITION_01'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176306841502923078 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186441789568809933 + wwv_flow_api.g_id_offset
 ,p_name => 'Left Column'
 ,p_placeholder => 'REGION_POSITION_02'
 ,p_has_grid_support => false
 ,p_max_fixed_grid_columns => 2
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176307232160923078 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186441789568809933 + wwv_flow_api.g_id_offset
 ,p_name => 'Footer'
 ,p_placeholder => 'REGION_POSITION_05'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 12
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176307655644923078 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186441789568809933 + wwv_flow_api.g_id_offset
 ,p_name => 'Page Level Tabs'
 ,p_placeholder => 'REGION_POSITION_06'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176308042060923078 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186441789568809933 + wwv_flow_api.g_id_offset
 ,p_name => 'Header'
 ,p_placeholder => 'REGION_POSITION_07'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176308448386923078 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186441789568809933 + wwv_flow_api.g_id_offset
 ,p_name => 'Icon Nav Bar'
 ,p_placeholder => 'REGION_POSITION_08'
 ,p_has_grid_support => false
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/two_level_tabs_left_and_right_sidebar
prompt  ......Page template 186444884204809934
 
begin
 
wwv_flow_api.create_template (
  p_id => 186444884204809934 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 105
 ,p_name => 'Two Level Tabs - Left and Right Sidebar'
 ,p_is_popup => false
 ,p_javascript_file_urls => '#IMAGE_PREFIX#libraries/modernizr/2.5.3/modernizr.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'[if lt IE 9]#IMAGE_PREFIX#libraries/respond-js/1.1.0/respond.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25/js/4_2#MIN#.js?v=#APEX_VERSION#'
 ,p_css_file_urls => '#IMAGE_PREFIX#themes/theme_25/css/4_2.css?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25/css/responsive_grid.css?v=#APEX_VERSION#'
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
'<div class="uParentTabs">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      <ul>'||unistr('\000a')||
'        #PARENT_TAB_CELLS#'||unistr('\000a')||
'      </ul>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>  '||unistr('\000a')||
'</div>'||unistr('\000a')||
'<header id="uHeader">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      #REGION_POSITION_07#'||unistr('\000a')||
'      <div class="logoBar">'||unistr('\000a')||
'        <h1><a href="#HOME_LINK#" id="uLogo">#LOGO#</a></h1>'||unistr('\000a')||
'        <div class="userBlock">'||unistr('\000a')||
'          <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'          <span>&APP_USER.</span>'||unistr('\000a')||
'          #NAVIGATION_BAR#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <nav>'||unistr('\000a')||
'    <div class="apex_grid_container clearfix">'||unistr('\000a')||
'      <div class="apex_cols apex_span_12">'||unistr('\000a')||
'        <ul class="uMainNav">'||unistr('\000a')||
'          #TAB_CELLS#'||unistr('\000a')||
'          #REGION_POSITION_06#'||unistr('\000a')||
'        </ul>'||unistr('\000a')||
'        #REGION_POSITION_08#'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </nav>'||unistr('\000a')||
'</header>'
 ,p_box => 
'<div id="uBodyContainer">'||unistr('\000a')||
'#REGION_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div id="uThreeColumns">'||unistr('\000a')||
'  <div class="apex_grid_container">'||unistr('\000a')||
'    <div class="apex_cols apex_span_2" id="uLeftCol">'||unistr('\000a')||
'      <aside>'||unistr('\000a')||
'        #REGION_POSITION_02#'||unistr('\000a')||
'      </aside>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'    <div class="apex_cols apex_span_8" id="uMidCol">'||unistr('\000a')||
'    #BOX_BODY#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'    <div class="apex_cols ape'||
'x_span_2" id="uRightCol">'||unistr('\000a')||
'      <aside>'||unistr('\000a')||
'        #REGION_POSITION_03#'||unistr('\000a')||
'      </aside>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      <div class="uFooterContent">'||unistr('\000a')||
'        #REGION_POSITION_05#'||unistr('\000a')||
'        <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'        #SCREEN_READER_TOGGLE#'||unistr('\000a')||
'        <span class="uFooterVersion">'||unistr('\000a')||
'          #APP_VERSION#'||unistr('\000a')||
'        </span>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBA'||
'R#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion successMessage clearfix" id="uSuccessMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uSuccessMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#SUCCESS_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #SUCCESS_MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_current_tab => '<li><a class="active" href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_non_current_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_top_current_tab => '<li><a class="active" href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_top_non_curr_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_notification_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion errorMessage clearfix" id="uNotificationMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uNotificationMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#ERROR_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_03'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 18
 ,p_grid_type => 'FIXED'
 ,p_grid_max_columns => 12
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_grid_template => '#ROWS#'
 ,p_grid_row_template => '<div class="apex_row">'||unistr('\000a')||
'#COLUMNS#'||unistr('\000a')||
'</div>'
 ,p_grid_column_template => '<div class="apex_cols apex_span_#COLUMN_SPAN_NUMBER# #FIRST_LAST_COLUMN_ATTRIBUTES#">'||unistr('\000a')||
'#CONTENT#'||unistr('\000a')||
'</div>'
 ,p_grid_first_column_attributes => 'alpha'
 ,p_grid_last_column_attributes => 'omega'
 ,p_grid_javascript_debug_code => 'apex.jQuery(document)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-on", showGrid)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-off", hideGrid);'
 ,p_has_edit_links => true
 ,p_reference_id => 3695924527049204
 ,p_translate_this_template => 'N'
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176309835261923079 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186444884204809934 + wwv_flow_api.g_id_offset
 ,p_name => 'Content Body'
 ,p_placeholder => 'BOX_BODY'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 8
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176310245371923079 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186444884204809934 + wwv_flow_api.g_id_offset
 ,p_name => 'Left Column'
 ,p_placeholder => 'REGION_POSITION_02'
 ,p_has_grid_support => false
 ,p_max_fixed_grid_columns => 2
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176310656800923080 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186444884204809934 + wwv_flow_api.g_id_offset
 ,p_name => 'Breadcrumb'
 ,p_placeholder => 'REGION_POSITON_01'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176311059494923080 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186444884204809934 + wwv_flow_api.g_id_offset
 ,p_name => 'Right Column'
 ,p_placeholder => 'REGION_POSITON_03'
 ,p_has_grid_support => false
 ,p_max_fixed_grid_columns => 2
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176311449826923080 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186444884204809934 + wwv_flow_api.g_id_offset
 ,p_name => 'Footer'
 ,p_placeholder => 'REGION_POSITON_05'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 12
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176311833876923080 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186444884204809934 + wwv_flow_api.g_id_offset
 ,p_name => 'Page Level Tabs'
 ,p_placeholder => 'REGION_POSITON_06'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176312250736923081 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186444884204809934 + wwv_flow_api.g_id_offset
 ,p_name => 'Header'
 ,p_placeholder => 'REGION_POSITON_07'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176312663272923081 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186444884204809934 + wwv_flow_api.g_id_offset
 ,p_name => 'Icon Nav Bar'
 ,p_placeholder => 'REGION_POSITON_08'
 ,p_has_grid_support => false
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/two_level_tabs_no_sidebar
prompt  ......Page template 186448393999809936
 
begin
 
wwv_flow_api.create_template (
  p_id => 186448393999809936 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 105
 ,p_name => 'Two Level Tabs - No Sidebar'
 ,p_is_popup => false
 ,p_javascript_file_urls => '#IMAGE_PREFIX#libraries/modernizr/2.5.3/modernizr.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'[if lt IE 9]#IMAGE_PREFIX#libraries/respond-js/1.1.0/respond.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25/js/4_2#MIN#.js?v=#APEX_VERSION#'
 ,p_css_file_urls => '#IMAGE_PREFIX#themes/theme_25/css/4_2.css?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25/css/responsive_grid.css?v=#APEX_VERSION#'
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
'<div class="uParentTabs">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      <ul>'||unistr('\000a')||
'        #PARENT_TAB_CELLS#'||unistr('\000a')||
'      </ul>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>  '||unistr('\000a')||
'</div>'||unistr('\000a')||
'<header id="uHeader">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      #REGION_POSITION_07#'||unistr('\000a')||
'      <div class="logoBar">'||unistr('\000a')||
'        <h1><a href="#HOME_LINK#" id="uLogo">#LOGO#</a></h1>'||unistr('\000a')||
'        <div class="userBlock">'||unistr('\000a')||
'          <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'          <span>&APP_USER.</span>'||unistr('\000a')||
'          #NAVIGATION_BAR#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <nav>'||unistr('\000a')||
'    <div class="apex_grid_container clearfix">'||unistr('\000a')||
'      <div class="apex_cols apex_span_12">'||unistr('\000a')||
'        <ul class="uMainNav">'||unistr('\000a')||
'          #TAB_CELLS#'||unistr('\000a')||
'          #REGION_POSITION_06#'||unistr('\000a')||
'        </ul>'||unistr('\000a')||
'        #REGION_POSITION_08#'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </nav>'||unistr('\000a')||
'</header>'
 ,p_box => 
'<div id="uBodyContainer">'||unistr('\000a')||
'#REGION_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div id="uOneCol">'||unistr('\000a')||
'  <div class="apex_grid_container">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      #BOX_BODY#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      <div class="uFooterContent">'||unistr('\000a')||
'        #REGION_POSITION_05#'||unistr('\000a')||
'        <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'        #SCREEN_READER_TOGGLE#'||unistr('\000a')||
'        <span class="uFooterVersion">'||unistr('\000a')||
'          #APP_VERSION#'||unistr('\000a')||
'        </span>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBA'||
'R#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion successMessage clearfix" id="uSuccessMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uSuccessMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#SUCCESS_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #SUCCESS_MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_current_tab => '<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_non_current_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_top_current_tab => '<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_top_non_curr_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_notification_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion errorMessage clearfix" id="uNotificationMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uNotificationMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#ERROR_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 2
 ,p_grid_type => 'FIXED'
 ,p_grid_max_columns => 12
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_grid_template => '#ROWS#'
 ,p_grid_row_template => '<div class="apex_row">'||unistr('\000a')||
'#COLUMNS#'||unistr('\000a')||
'</div>'
 ,p_grid_column_template => '<div class="apex_cols apex_span_#COLUMN_SPAN_NUMBER# #FIRST_LAST_COLUMN_ATTRIBUTES#">'||unistr('\000a')||
'#CONTENT#'||unistr('\000a')||
'</div>'
 ,p_grid_first_column_attributes => 'alpha'
 ,p_grid_last_column_attributes => 'omega'
 ,p_grid_javascript_debug_code => 'apex.jQuery(document)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-on", showGrid)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-off", hideGrid);'
 ,p_has_edit_links => true
 ,p_reference_id => 3699429881049205
 ,p_translate_this_template => 'N'
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176313854845923082 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186448393999809936 + wwv_flow_api.g_id_offset
 ,p_name => 'Content Body'
 ,p_placeholder => 'BOX_BODY'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 12
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176314244435923082 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186448393999809936 + wwv_flow_api.g_id_offset
 ,p_name => 'Breadcrumb'
 ,p_placeholder => 'REGION_POSITION_01'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176314660270923082 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186448393999809936 + wwv_flow_api.g_id_offset
 ,p_name => 'Footer'
 ,p_placeholder => 'REGION_POSITION_05'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 12
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176315059775923082 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186448393999809936 + wwv_flow_api.g_id_offset
 ,p_name => 'Page Level Tabs'
 ,p_placeholder => 'REGION_POSITION_06'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176315464460923083 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186448393999809936 + wwv_flow_api.g_id_offset
 ,p_name => 'Header'
 ,p_placeholder => 'REGION_POSITION_07'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176315851194923083 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186448393999809936 + wwv_flow_api.g_id_offset
 ,p_name => 'Icon Nav Bar'
 ,p_placeholder => 'REGION_POSITION_08'
 ,p_has_grid_support => false
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/two_level_tabs_right_sidebar
prompt  ......Page template 186451078047809937
 
begin
 
wwv_flow_api.create_template (
  p_id => 186451078047809937 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 105
 ,p_name => 'Two Level Tabs - Right Sidebar'
 ,p_is_popup => false
 ,p_javascript_file_urls => '#IMAGE_PREFIX#libraries/modernizr/2.5.3/modernizr.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'[if lt IE 9]#IMAGE_PREFIX#libraries/respond-js/1.1.0/respond.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25/js/4_2#MIN#.js?v=#APEX_VERSION#'
 ,p_css_file_urls => '#IMAGE_PREFIX#themes/theme_25/css/4_2.css?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25/css/responsive_grid.css?v=#APEX_VERSION#'
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
'<div class="uParentTabs">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      <ul>'||unistr('\000a')||
'        #PARENT_TAB_CELLS#'||unistr('\000a')||
'      </ul>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>  '||unistr('\000a')||
'</div>'||unistr('\000a')||
'<header id="uHeader">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      #REGION_POSITION_07#'||unistr('\000a')||
'      <div class="logoBar">'||unistr('\000a')||
'        <h1><a href="#HOME_LINK#" id="uLogo">#LOGO#</a></h1>'||unistr('\000a')||
'        <div class="userBlock">'||unistr('\000a')||
'          <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'          <span>&APP_USER.</span>'||unistr('\000a')||
'          #NAVIGATION_BAR#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <nav>'||unistr('\000a')||
'    <div class="apex_grid_container clearfix">'||unistr('\000a')||
'      <div class="apex_cols apex_span_12">'||unistr('\000a')||
'        <ul class="uMainNav">'||unistr('\000a')||
'          #TAB_CELLS#'||unistr('\000a')||
'          #REGION_POSITION_06#'||unistr('\000a')||
'        </ul>'||unistr('\000a')||
'        #REGION_POSITION_08#'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </nav>'||unistr('\000a')||
'</header>'
 ,p_box => 
'<div id="uBodyContainer">'||unistr('\000a')||
'#REGION_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div id="uTwoColumns" class="sideRightCol">'||unistr('\000a')||
'  <div class="apex_grid_container">'||unistr('\000a')||
'    <div class="apex_cols apex_span_10" id="uMidCol">'||unistr('\000a')||
'    #BOX_BODY#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'    <div class="apex_cols apex_span_2" id="uRightCol">'||unistr('\000a')||
'      <aside>'||unistr('\000a')||
'        #REGION_POSITION_03#'||unistr('\000a')||
'      </aside>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||
''||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="apex_grid_container clearfix">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      <div class="uFooterContent">'||unistr('\000a')||
'        #REGION_POSITION_05#'||unistr('\000a')||
'        <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'        #SCREEN_READER_TOGGLE#'||unistr('\000a')||
'        <span class="uFooterVersion">'||unistr('\000a')||
'          #APP_VERSION#'||unistr('\000a')||
'        </span>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBA'||
'R#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion successMessage clearfix" id="uSuccessMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uSuccessMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#SUCCESS_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #SUCCESS_MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_current_tab => '<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_non_current_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_top_current_tab => '<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_top_non_curr_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_notification_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion errorMessage clearfix" id="uNotificationMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uNotificationMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#ERROR_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_03'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 2
 ,p_grid_type => 'FIXED'
 ,p_grid_max_columns => 12
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_grid_template => '#ROWS#'
 ,p_grid_row_template => '<div class="apex_row">'||unistr('\000a')||
'#COLUMNS#'||unistr('\000a')||
'</div>'
 ,p_grid_column_template => '<div class="apex_cols apex_span_#COLUMN_SPAN_NUMBER# #FIRST_LAST_COLUMN_ATTRIBUTES#">'||unistr('\000a')||
'#CONTENT#'||unistr('\000a')||
'</div>'
 ,p_grid_first_column_attributes => 'alpha'
 ,p_grid_last_column_attributes => 'omega'
 ,p_grid_javascript_debug_code => 'apex.jQuery(document)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-on", showGrid)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-off", hideGrid);'
 ,p_has_edit_links => true
 ,p_reference_id => 3702121226049206
 ,p_translate_this_template => 'N'
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176317155673923084 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186451078047809937 + wwv_flow_api.g_id_offset
 ,p_name => 'Content Body'
 ,p_placeholder => 'BOX_BODY'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 10
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176317540978923084 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186451078047809937 + wwv_flow_api.g_id_offset
 ,p_name => 'Breadcrumb'
 ,p_placeholder => 'REGION_POSITION_01'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176317944774923084 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186451078047809937 + wwv_flow_api.g_id_offset
 ,p_name => 'Right Column'
 ,p_placeholder => 'REGION_POSITION_03'
 ,p_has_grid_support => false
 ,p_max_fixed_grid_columns => 2
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176318363894923084 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186451078047809937 + wwv_flow_api.g_id_offset
 ,p_name => 'Footer'
 ,p_placeholder => 'REGION_POSITION_05'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 12
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176318741880923084 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186451078047809937 + wwv_flow_api.g_id_offset
 ,p_name => 'Page Level Tabs'
 ,p_placeholder => 'REGION_POSITION_06'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176319142220923084 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186451078047809937 + wwv_flow_api.g_id_offset
 ,p_name => 'Header'
 ,p_placeholder => 'REGION_POSITION_07'
 ,p_has_grid_support => false
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 176319555836923085 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 186451078047809937 + wwv_flow_api.g_id_offset
 ,p_name => 'Icon Nav Bar'
 ,p_placeholder => 'REGION_POSITION_08'
 ,p_has_grid_support => false
  );
null;
 
end;
/

prompt  ...button templates
--
--application/shared_components/user_interface/templates/button/button
prompt  ......Button Template 186469378941809946
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 186469378941809946 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Button'
 ,p_template => 
'<button class="uButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#" type="button"><span>#LABEL#</span></button> '
 ,p_hot_template => 
'<button class="uButton uHotButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#" type="button"><span>#LABEL#</span></button> '
 ,p_reference_id => 48197752244054476
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 1
 ,p_theme_id => 105
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/button_icon
prompt  ......Button Template 186469574444809947
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 186469574444809947 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Button - Icon'
 ,p_template => 
'<button class="uButton iconButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#" type="button"><span><i class="iL"></i>#LABEL#<i class="iR"></i></span></button> '
 ,p_hot_template => 
'<button class="uButton uHotButton iconButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#" type="button"><span><i class="iL"></i>#LABEL#<i class="iR"></i></span></button> '
 ,p_reference_id => 3720525285049240
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 6
 ,p_theme_id => 105
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/button_icon_only
prompt  ......Button Template 186469792378809947
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 186469792378809947 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Button - Icon Only'
 ,p_template => 
'<button class="uButton iconOnly iconButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#" type="button" title="#LABEL#"><span><i></i></span></button> '
 ,p_hot_template => 
'<button class="uButton uHotButton iconOnly iconButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#" type="button" title="#LABEL#"><span><i></i></span></button> '
 ,p_reference_id => 3720701521049240
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 7
 ,p_theme_id => 105
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/large_button
prompt  ......Button Template 186469992544809947
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 186469992544809947 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Large Button'
 ,p_template => 
'<button class="uButtonLarge #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#" type="button"><span>#LABEL#</span></button> '
 ,p_hot_template => 
'<button class="uButtonLarge uHotButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#" type="button"><span>#LABEL#</span></button> '
 ,p_reference_id => 48198325970054477
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 5
 ,p_template_comment => 'Standard Button'
 ,p_theme_id => 105
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/large_button_icon
prompt  ......Button Template 186470185259809947
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 186470185259809947 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Large Button - Icon'
 ,p_template => 
'<button class="uButtonLarge iconButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#" type="button"><span><i class="iL"></i>#LABEL#<i class="iR"></i></span></button> '
 ,p_hot_template => 
'<button class="uButtonLarge uHotButton iconButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#" type="button"><span><i class="iL"></i>#LABEL#<i class="iR"></i></span></button> '
 ,p_reference_id => 3721111454049240
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 5
 ,p_theme_id => 105
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/large_button_icon_only
prompt  ......Button Template 186470396506809947
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 186470396506809947 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Large Button - Icon Only'
 ,p_template => 
'<button class="uButtonLarge iconButton iconOnly #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#" type="button" title="#LABEL#"><span><i></i></span></button> '
 ,p_hot_template => 
'<button class="uButtonLarge uHotButton iconButton iconOnly #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#" type="button" title="#LABEL#"><span><i></i></span></button> '
 ,p_reference_id => 3721312091049240
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 8
 ,p_theme_id => 105
  );
null;
 
end;
/

---------------------------------------
prompt  ...region templates
--
--application/shared_components/user_interface/templates/region/js_modal_portal
prompt  ......region template 123916917257794360
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 123916917257794360 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="ModalRegion"> </div>'||unistr('\000a')||
'<script>    '||unistr('\000a')||
'    function autoResize(id){'||unistr('\000a')||
'       var newheight;'||unistr('\000a')||
'       var newwidth;'||unistr('\000a')||
'    '||unistr('\000a')||
'       if(document.getElementById){'||unistr('\000a')||
'           newheight=document.getElementById(id).contentWindow.document .body.scrollHeight + 20;'||unistr('\000a')||
'           newwidth=document.getElementById(id).contentWindow.document .body.scrollWidth;'||unistr('\000a')||
'       }'||unistr('\000a')||
'    '||unistr('\000a')||
'       document.getElementById(id).height= '||
'(newheight) + "px";'||unistr('\000a')||
'       document.getElementById(id).width= (newwidth) + "px";'||unistr('\000a')||
'	}'||unistr('\000a')||
'    '||unistr('\000a')||
'    //'||unistr('\000a')||
'    function ModalRegion(src,ancho,alto){'||unistr('\000a')||
'        '||unistr('\000a')||
'    	var html=''<iframe onload="autoResize(this.id);" id="modalIframe" scrolling="no" style="min-height: 400px ;overflow: hidden; width:100%; float:left;" src="''+src+''">'';'||unistr('\000a')||
'        //'||unistr('\000a')||
'        $("#ModalRegion").html(html);'||unistr('\000a')||
'     	$(''#ModalRegion'').dialog({'||unistr('\000a')||
''||
'        						 width:  ancho'||unistr('\000a')||
'        						,height: alto'||unistr('\000a')||
'        						,modal: true   '||unistr('\000a')||
'            					,show: {'||unistr('\000a')||
'                                  effect: "drop",'||unistr('\000a')||
'                                  duration: 500'||unistr('\000a')||
'                                }'||unistr('\000a')||
'            					,hide: {'||unistr('\000a')||
'                                  effect: "drop",'||unistr('\000a')||
'                                  duration: 500'||unistr('\000a')||
'                               '||
'   }'||unistr('\000a')||
'     							});'||unistr('\000a')||
'	}'||unistr('\000a')||
''||unistr('\000a')||
'/*$(window).resize(function(){'||unistr('\000a')||
'    $("iframe").contents().find("a").on("click",function(){alert("545sa");});'||unistr('\000a')||
'    console.log($("iframe").contents().find("document"))});*/'||unistr('\000a')||
''||unistr('\000a')||
'//$("iframe").contents().find("table").resize(function(){alert("cambie");});'||unistr('\000a')||
''||unistr('\000a')||
'</script>'
 ,p_page_plug_template_name => 'JS Modal Portal'
 ,p_theme_id => 105
 ,p_theme_class_id => 22
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/js_alerta_mensajes
prompt  ......region template 170426353695120214
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 170426353695120214 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<script type="text/javascript">'||unistr('\000a')||
'$(function() {'||unistr('\000a')||
'  msj_verificar()'||unistr('\000a')||
'  setInterval("msj_verificar()",5000);  '||unistr('\000a')||
'});'||unistr('\000a')||
'function msj_verificar(){'||unistr('\000a')||
'  var get = new htmldb_Get(null,$x(''pFlowId'').value,''APPLICATION_PROCESS=msjenv_verificar'',0);  '||unistr('\000a')||
'  gReturn = get.get();  '||unistr('\000a')||
'  get = null;  '||unistr('\000a')||
'  '||unistr('\000a')||
'  var msj_cantidad = gReturn;'||unistr('\000a')||
'  if ( msj_cantidad != '''' ){  '||unistr('\000a')||
'    if ( msj_cantidad > 0 ){  '||unistr('\000a')||
'      $(''#alert'').removeClass('''||
'msjico-sin'');'||unistr('\000a')||
'      $(''#alert'').addClass(''msjico-con'');'||unistr('\000a')||
'      $(''.msjnro'').empty();'||unistr('\000a')||
'      $(''.msjnro'').append( msj_cantidad ); '||unistr('\000a')||
'      if ( msj_cantidad = 1 ){  '||unistr('\000a')||
'      	$(''#alert'').attr(''alt'',msj_cantidad+'' Mensaje sin leer'' );'||unistr('\000a')||
'      	$(''#alert'').attr(''title'',msj_cantidad+'' Mensaje sin leer'' );'||unistr('\000a')||
'      }else{'||unistr('\000a')||
'      	$(''#alert'').attr(''alt'',msj_cantidad+'' Mensajes sin leer'' );'||unistr('\000a')||
'      	$(''#alert'').attr('''||
'title'',msj_cantidad+'' Mensajes sin leer'' );'||unistr('\000a')||
'      }'||unistr('\000a')||
'    }else{'||unistr('\000a')||
'      $(''#alert'').removeClass(''msjico-con'');'||unistr('\000a')||
'      $(''#alert'').addClass(''msjico-sin''); '||unistr('\000a')||
'      $(''.msjnro'').empty();'||unistr('\000a')||
'      $(''#alert'').attr(''alt'',''Sin mensajes'' );'||unistr('\000a')||
'      $(''#alert'').attr(''title'',''Sin mensajes'' );    '||unistr('\000a')||
'    }'||unistr('\000a')||
'  }else{'||unistr('\000a')||
'    $(''.msjnro'').empty();'||unistr('\000a')||
'    $(''.msjnro'').append(''Error!'');'||unistr('\000a')||
'  }'||unistr('\000a')||
'}'||unistr('\000a')||
'</script>'||unistr('\000a')||
'<style type="text/css">'||unistr('\000a')||
'.msji'||
'co{border:0px solid; padding:0px !important; margin:0px !important;}'||unistr('\000a')||
'.msjico i{  border:0px solid; float:left; }'||unistr('\000a')||
'.msjico .msjnro{margin-left:5px;border:0px solid; float:right;}'||unistr('\000a')||
'.msjico-sin i{margin:2px 0px 0px 8px; font-size:1.250em; color:#F0F0F0; }'||unistr('\000a')||
'.msjico-con i{margin:3px 0px 0px 8px; font-size:1.375em; color:#c0392b; text-shadow: #222 0.1em 0.1em 0.1em;}'||unistr('\000a')||
'</style>'
 ,p_page_plug_template_name => 'JS Alerta Mensajes'
 ,p_theme_id => 105
 ,p_theme_class_id => 22
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 47519723179119856
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/accessible_region_with_heading
prompt  ......region template 186454190715809938
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 186454190715809938 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#">'||unistr('\000a')||
'  <h1 class="visuallyhidden">#TITLE#</h1>'||unistr('\000a')||
'  #BODY#'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Accessible Region with Heading'
 ,p_theme_id => 105
 ,p_theme_class_id => 21
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 3705217260049208
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/alert_region
prompt  ......region template 186454481269809939
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 186454481269809939 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion uWhiteRegion uAlertRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Alert Region'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 105
 ,p_theme_class_id => 10
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 3705523208049215
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Used for alerts and confirmations.  Please use a region image for the success/warning icon'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/borderless_region
prompt  ......region template 186454792494809939
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 186454792494809939 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion uBorderlessRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Borderless Region'
 ,p_theme_id => 105
 ,p_theme_class_id => 7
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 3705816188049216
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Use this region template when you want to contain content without a border.'||unistr('\000a')||
''||unistr('\000a')||
'TITLE=YES'||unistr('\000a')||
'BUTTONS=YES'||unistr('\000a')||
'100% WIDTH=NO'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/breadcrumb_region
prompt  ......region template 186455092510809939
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 186455092510809939 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="uBreadcrumbsContainer #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">'||unistr('\000a')||
'<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <div class="uBreadcrumbs">'||unistr('\000a')||
'      #BODY#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Breadcrumb Region'
 ,p_theme_id => 105
 ,p_theme_class_id => 6
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 3706108247049216
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Use this region template to contain breadcrumb menus.  Breadcrumb menus are implemented using breadcrumbs.  Breadcrumb menus are designed to displayed in #REGION_POSITION_01#'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'<div id="uBreadcrumbsContainer #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">'||unistr('\000a')||
'<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <div id="uBreadcrumbs">'||unistr('\000a')||
'      #BODY#'||unistr('\000a')||
'      <div class="uBreadcrumbsBG">'||unistr('\000a')||
'        <div class="uLeft"></div>'||unistr('\000a')||
'        <div class="uRight"></div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div>'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/button_region_with_title
prompt  ......region template 186455399603809939
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 186455399603809939 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uButtonRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uButtonRegionContentContainer">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Button Region with Title'
 ,p_theme_id => 105
 ,p_theme_class_id => 4
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 3706414162049216
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/button_region_without_title
prompt  ......region template 186455694406809939
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 186455694406809939 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uButtonRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uButtonRegionContentContainer">'||unistr('\000a')||
'    <div class="uButtonRegionContent">#BODY#</div>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Button Region without Title'
 ,p_theme_id => 105
 ,p_theme_class_id => 17
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 3706728091049216
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/content_frame_body_container
prompt  ......region template 186455996006809939
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 186455996006809939 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'#SUB_REGION_HEADERS#'||unistr('\000a')||
'#BODY#'||unistr('\000a')||
'<div class="uFrameContainer" class="#REGION_CSS_CLASSES# #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">'||unistr('\000a')||
'#SUB_REGIONS#'||unistr('\000a')||
'</div>'
 ,p_sub_plug_header_template => '<div class="uFrameRegionSelector clearfix">'||unistr('\000a')||
'  <ul>'||unistr('\000a')||
'    <li><a href="javascript:void(0);" class="showAllLink active"><span>Show All</span></a></li>'||unistr('\000a')||
'    #ENTRIES#'||unistr('\000a')||
'  </ul>'||unistr('\000a')||
'</div>'
 ,p_sub_plug_header_entry_templ => '<li><a href="javascript:void(0);" id="sub_#SUB_REGION_ID#"><span>#SUB_REGION_TITLE#</span></a></li>'
 ,p_page_plug_template_name => 'Content Frame Body Container'
 ,p_theme_id => 105
 ,p_theme_class_id => 7
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 3707022567049221
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/div_region_with_id
prompt  ......region template 186456295511809940
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 186456295511809940 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#"> '||unistr('\000a')||
'#BODY#'||unistr('\000a')||
'#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'DIV Region with ID'
 ,p_theme_id => 105
 ,p_theme_class_id => 22
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 3707315922049221
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/form_region
prompt  ......region template 186456583664809940
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 186456583664809940 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Form Region'
 ,p_plug_table_bgcolor => '#f7f7e7'
 ,p_theme_id => 105
 ,p_theme_class_id => 8
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 3707615723049221
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
wwv_flow_api.create_plug_tmpl_display_point (
  p_id => 176321756404923089 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plug_template_id => 186456583664809940 + wwv_flow_api.g_id_offset
 ,p_name => 'Region Body'
 ,p_placeholder => 'BODY'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => -1
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/hide_and_show_region_expanded
prompt  ......region template 186457289117809940
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 186457289117809940 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion uHideShowRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>'||unistr('\000a')||
'      <a href="javascript:void(0)" class="uRegionControl"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="Hide/Show"/></a>'||unistr('\000a')||
'      #TITLE#'||unistr('\000a')||
'    </h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE'||
'2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Hide and Show Region (Expanded)'
 ,p_theme_id => 105
 ,p_theme_class_id => 1
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 3708315374049221
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/hide_and_show_region_hidden
prompt  ......region template 186457592528809940
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 186457592528809940 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion uHideShowRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>'||unistr('\000a')||
'      <a href="javascript:void(0)" class="uRegionControl uRegionCollapsed"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="Hide/Show"/></a>'||unistr('\000a')||
'      #TITLE#'||unistr('\000a')||
'    </h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANG'||
'E##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix" style="display: none;">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Hide and Show Region (Hidden)'
 ,p_theme_id => 105
 ,p_theme_class_id => 1
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 3708623996049221
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/interactive_report_region
prompt  ......region template 186457877751809940
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 186457877751809940 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uIRRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#">'||unistr('\000a')||
'  <h1 class="visuallyhidden">#TITLE#</h1>'||unistr('\000a')||
'  #BODY#'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Interactive Report Region'
 ,p_theme_id => 105
 ,p_theme_class_id => 21
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 3708914935049222
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/modal_region
prompt  ......region template 186458174104809940
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 186458174104809940 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="apex_grid_container modal_grid">'||unistr('\000a')||
'  <div class="apex_cols apex_span_8 modal_col">'||unistr('\000a')||
'    <section class="uRegion uWhiteRegion uModalRegion uAlertRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'      <div class="uRegionHeading">'||unistr('\000a')||
'        <h1>#TITLE#</h1>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        #BODY#'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'        <span class'||
'="uButtonContainer">'||unistr('\000a')||
'          #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'        </span>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Modal Region'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 105
 ,p_theme_class_id => 9
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 3709226577049222
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
wwv_flow_api.create_plug_tmpl_display_point (
  p_id => 176323058175923090 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plug_template_id => 186458174104809940 + wwv_flow_api.g_id_offset
 ,p_name => 'Region Body'
 ,p_placeholder => 'BODY'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 6
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/region_without_buttons_and_titles
prompt  ......region template 186458876129809941
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 186458876129809941 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion uNoHeading #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Region without Buttons and Titles'
 ,p_theme_id => 105
 ,p_theme_class_id => 19
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 3709912385049222
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/sidebar_region
prompt  ......region template 186459200300809941
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 186459200300809941 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Sidebar Region'
 ,p_plug_table_bgcolor => '#f7f7e7'
 ,p_theme_id => 105
 ,p_theme_class_id => 2
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 3710205805049222
 ,p_translate_this_template => 'N'
 ,p_template_comment => '<table border="0" cellpadding="0" cellspacing="0">'||unistr('\000a')||
'        <tr>'||unistr('\000a')||
'          <td rowspan="2" valign="top" width="4" bgcolor="#FF0000"><img src="#IMAGE_PREFIX#tl_img.gif" border="0" width="4" height="18" alt="" /></td>'||unistr('\000a')||
'          <td bgcolor="#000000" height="1"><img src="#IMAGE_PREFIX#stretch.gif" width="142" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'          <td rowspan="2" valign="top" width="4" bgcolor="#FF0000"><img src="#IMAGE_PREFIX#tr_img.gif" border="0" width="4" height="18" alt="" /></td>'||unistr('\000a')||
'        </tr>'||unistr('\000a')||
'        <tr>'||unistr('\000a')||
'          <td bgcolor="#FF0000" height="16">'||unistr('\000a')||
'            <table border="0" cellpadding="0" cellspacing="0" width="100%">'||unistr('\000a')||
'              <tr>'||unistr('\000a')||
'                <td align=middle valign="top">'||unistr('\000a')||
'                  <div align="center">'||unistr('\000a')||
'                     <font color="#ffffff" face="Arial, Helvetica, sans-serif" size="1">'||unistr('\000a')||
'                      <b>#TITLE# </b></font></div>'||unistr('\000a')||
'                </td>'||unistr('\000a')||
'              </tr>'||unistr('\000a')||
'            </table>'||unistr('\000a')||
'          </td>'||unistr('\000a')||
'        </tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<table border="0" cellpadding="0" cellspacing="0">'||unistr('\000a')||
'   <tr>'||unistr('\000a')||
'   <td bgcolor="#000000" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'   <td valign="top" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="146" height="1" border="0" alt="" /><br />'||unistr('\000a')||
'            <table border="0" cellpadding="1" cellspacing="0" width="146" summary="">'||unistr('\000a')||
'              <tr>'||unistr('\000a')||
'                <td colspan="2">'||unistr('\000a')||
'                  <table border="0" cellpadding="2" cellspacing="0" width="124" summary="">'||unistr('\000a')||
'                    <tr>'||unistr('\000a')||
'                      <td>&nbsp;</td>'||unistr('\000a')||
'                      <td valign="top" width="106">'||unistr('\000a')||
'                        <P><FONT face="arial, helvetica" size="1">'||unistr('\000a')||
'                            #BODY#'||unistr('\000a')||
'                           </font>'||unistr('\000a')||
'                        </P>'||unistr('\000a')||
'                      </td>'||unistr('\000a')||
'                    </tr>'||unistr('\000a')||
'                  </table>'||unistr('\000a')||
'            </table>'||unistr('\000a')||
'          </td>'||unistr('\000a')||
'          <td bgcolor="#000000" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'          <td bgcolor="#9a9c9a" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'          <td bgcolor="#b3b4b3" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'        </tr>'||unistr('\000a')||
'      </table>'||unistr('\000a')||
'      <table border="0" cellpadding="0" cellspacing="0">'||unistr('\000a')||
'        <tr>'||unistr('\000a')||
'          <td rowspan="4" valign="top" width="4"><img src="#IMAGE_PREFIX#bl_img.gif" border="0" width="4" height="6" alt="" /></td>'||unistr('\000a')||
'          <td bgcolor="#ffffff" height="2"><img src="#IMAGE_PREFIX#stretch.gif" width="142" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'          <td rowspan="4" valign="top" width="4"><img src="#IMAGE_PREFIX#br_img.gif" border="0" width="4" height="6" alt="" /></td>'||unistr('\000a')||
'        </tr>'||unistr('\000a')||
'        <tr>'||unistr('\000a')||
'          <td bgcolor="#000000" width="1"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'        </tr>'||unistr('\000a')||
'        <tr>'||unistr('\000a')||
'          <td bgcolor="#9a9c9a" width="1"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'        </tr>'||unistr('\000a')||
'        <tr>'||unistr('\000a')||
'          <td bgcolor="#b3b4b3" width="1" height="2"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'        </tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
''
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/standard_region
prompt  ......region template 186459500426809941
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 186459500426809941 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Standard Region'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 105
 ,p_theme_class_id => 9
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 3710527760049223
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
wwv_flow_api.create_plug_tmpl_display_point (
  p_id => 176324252024923091 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plug_template_id => 186459500426809941 + wwv_flow_api.g_id_offset
 ,p_name => 'Region Body'
 ,p_placeholder => 'BODY'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => -1
  );
wwv_flow_api.create_plug_tmpl_display_point (
  p_id => 176324636521923091 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plug_template_id => 186459500426809941 + wwv_flow_api.g_id_offset
 ,p_name => 'Sub Regions'
 ,p_placeholder => 'SUB_REGIONS'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => -1
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/standard_region_no_padding
prompt  ......region template 186460591720809942
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 186460591720809942 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion uRegionNoPadding #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Standard Region - No Padding'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 105
 ,p_theme_class_id => 13
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 3711625915049224
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/wizard_buttons
prompt  ......region template 186460905009809942
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 186460905009809942 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="cWizardButtons cWizardButtonsLeft">'||unistr('\000a')||
'#PREVIOUS##CLOSE#'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<div class="cWizardButtons cWizardButtonsRight">'||unistr('\000a')||
'#NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Wizard Buttons'
 ,p_theme_id => 105
 ,p_theme_class_id => 28
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 3711927856049225
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

prompt  ...List Templates
--
--application/shared_components/user_interface/templates/list/tabbed_navigation_list_menu
prompt  ......list template 170571831375723366
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="active"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>170571831375723366 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Tabbed Navigation List Menu',
  p_theme_id  => 105,
  p_theme_class_id => 7,
  p_list_template_before_rows=>'<div class="uHorizontalTabsMenu">'||unistr('\000a')||
'<ul>'||unistr('\000a')||
'<style>'||unistr('\000a')||
'.uHorizontalTabsMenu .active{background-color:#FFFFFF;}'||unistr('\000a')||
'</style>',
  p_list_template_after_rows=>'</ul>'||unistr('\000a')||
'</div>',
  p_reference_id=>45854519183105184,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/button_list
prompt  ......list template 186464501538809944
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<button onclick="javascript:location.href=''#LINK#''" class="uButton uHotButton #A01#" type="button"><span>#TEXT#</span></a> ';

t2:=t2||'<button onclick="javascript:location.href=''#LINK#''" class="uButton #A01#" type="button"><span>#TEXT#</span></a> ';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>186464501538809944 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Button List',
  p_theme_id  => 105,
  p_theme_class_id => 6,
  p_list_template_before_rows=>'<div class="uButtonList">',
  p_list_template_after_rows=>'</div>',
  p_reference_id=>3715528467049233,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/featured_list_with_subtext
prompt  ......list template 186464777047809944
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li>'||unistr('\000a')||
'  <a href="#LINK#">'||unistr('\000a')||
'    <h3>#TEXT#</h3>'||unistr('\000a')||
'    <p>#A01#</p>'||unistr('\000a')||
'  </a>'||unistr('\000a')||
'</li>';

t2:=t2||'<li>'||unistr('\000a')||
'  <a href="#LINK#">'||unistr('\000a')||
'    <h3>#TEXT#</h3>'||unistr('\000a')||
'    <p>#A01#</p>'||unistr('\000a')||
'  </a>'||unistr('\000a')||
'</li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>186464777047809944 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Featured List with Subtext',
  p_theme_id  => 105,
  p_theme_class_id => 1,
  p_list_template_before_rows=>'<ul class="featuredLinksList">',
  p_list_template_after_rows=>'</ul>',
  p_reference_id=>3715827658049237,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/horizontal_images_with_label_list
prompt  ......list template 186465093776809944
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'    <li class="active">'||unistr('\000a')||
'      <a href="#LINK#">'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" />'||unistr('\000a')||
'        <span>#TEXT#</span>'||unistr('\000a')||
'        <p>#A01#</p>'||unistr('\000a')||
'      </a>'||unistr('\000a')||
'    </li>';

t2:=t2||'    <li>'||unistr('\000a')||
'      <a href="#LINK#">'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" />'||unistr('\000a')||
'        <span>#TEXT#</span>'||unistr('\000a')||
'        <p>#A01#</p>'||unistr('\000a')||
'      </a>'||unistr('\000a')||
'    </li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>186465093776809944 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Images with Label List',
  p_theme_id  => 105,
  p_theme_class_id => 4,
  p_list_template_before_rows=>'<div class="uImagesList uHorizontalImagesList clearfix">'||unistr('\000a')||
'  <ul>'||unistr('\000a')||
''||unistr('\000a')||
'',
  p_list_template_after_rows=>'  </ul>'||unistr('\000a')||
'</div>',
  p_reference_id=>3716003723049237,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/horizontal_links_list
prompt  ......list template 186465386633809944
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="active"><a href="#LINK#">#TEXT#</a></li> ';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li> ';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>186465386633809944 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Links List',
  p_theme_id  => 105,
  p_theme_class_id => 3,
  p_list_template_before_rows=>'<ul class="uHorizontalLinksList">',
  p_list_template_after_rows=>'</ul>',
  p_reference_id=>3716317726049238,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/horizontal_wizard_progress_list
prompt  ......list template 186465691626809945
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'    <li class="#LIST_STATUS#">'||unistr('\000a')||
'      <span>#TEXT#</span>'||unistr('\000a')||
'    </li>';

t2:=t2||'    <li class="#LIST_STATUS#">'||unistr('\000a')||
'      <span>#TEXT#</span>'||unistr('\000a')||
'    </li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>186465691626809945 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Wizard Progress List',
  p_theme_id  => 105,
  p_theme_class_id => 17,
  p_list_template_before_rows=>'<div class="uHorizontalProgressList hidden-phone">'||unistr('\000a')||
'  <ul>',
  p_list_template_after_rows=>'  </ul>'||unistr('\000a')||
'</div>',
  p_reference_id=>3716622544049238,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/page_level_tabs_list
prompt  ......list template 186465973595809945
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a href="#LINK#" class="active">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>186465973595809945 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Page Level Tabs List',
  p_theme_id  => 105,
  p_theme_class_id => 7,
  p_list_template_before_rows=>' ',
  p_list_template_after_rows=>' ',
  p_reference_id=>3716928610049238,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/tabbed_navigation_list
prompt  ......list template 186466299877809945
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="active"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>186466299877809945 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Tabbed Navigation List',
  p_theme_id  => 105,
  p_theme_class_id => 7,
  p_list_template_before_rows=>'<div class="uHorizontalTabs">'||unistr('\000a')||
'<ul>',
  p_list_template_after_rows=>'</ul>'||unistr('\000a')||
'</div>',
  p_reference_id=>3717219285049238,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_images_list
prompt  ......list template 186466576796809945
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'    <li class="active">'||unistr('\000a')||
'      <a href="#LINK#">'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" />'||unistr('\000a')||
'        <span>#TEXT#</span>'||unistr('\000a')||
'      </a>'||unistr('\000a')||
'    </li>';

t2:=t2||'    <li>'||unistr('\000a')||
'      <a href="#LINK#">'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" />'||unistr('\000a')||
'        <span>#TEXT#</span>'||unistr('\000a')||
'      </a>'||unistr('\000a')||
'    </li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>186466576796809945 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Images List',
  p_theme_id  => 105,
  p_theme_class_id => 5,
  p_list_template_before_rows=>'<div class="uImagesList uVerticalImagesList clearfix">'||unistr('\000a')||
'  <ul>',
  p_list_template_after_rows=>'  </ul>'||unistr('\000a')||
'</div>',
  p_reference_id=>3717507403049238,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_list_with_subtext_and_icon
prompt  ......list template 186466904186809945
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'  <li>'||unistr('\000a')||
'    <a href="#LINK#">'||unistr('\000a')||
'      <img src="#IMAGE_PREFIX#f_spacer.gif" class="#A02#" alt="#LIST_LABEL#"/>'||unistr('\000a')||
'      <h3>#TEXT#</h3>'||unistr('\000a')||
'      <h4>#A01#</h4>'||unistr('\000a')||
'    </a>'||unistr('\000a')||
'  </li>';

t2:=t2||'  <li>'||unistr('\000a')||
'    <a href="#LINK#">'||unistr('\000a')||
'      <img src="#IMAGE_PREFIX#f_spacer.gif" class="#A02#" alt="#LIST_LABEL#"/>'||unistr('\000a')||
'      <h3>#TEXT#</h3>'||unistr('\000a')||
'      <h4>#A01#</h4>'||unistr('\000a')||
'    </a>'||unistr('\000a')||
'  </li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>186466904186809945 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical List with Subtext and Icon',
  p_theme_id  => 105,
  p_theme_class_id => 1,
  p_list_template_before_rows=>'<ul class="largeLinkList">',
  p_list_template_after_rows=>'</ul>',
  p_reference_id=>3717811630049238,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_ordered_list
prompt  ......list template 186467181658809945
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="active"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>186467181658809945 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Ordered List',
  p_theme_id  => 105,
  p_theme_class_id => 2,
  p_list_template_before_rows=>'<ol class="uNumberedList">',
  p_list_template_after_rows=>'</ol>',
  p_reference_id=>3718111726049238,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_sidebar_list
prompt  ......list template 186467491855809945
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="active"><a href="#LINK#" #A02#>#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#" #A02#>#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>186467491855809945 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Sidebar List',
  p_theme_id  => 105,
  p_theme_class_id => 19,
  p_list_template_before_rows=>'<ul class="uVerticalSidebarList">',
  p_list_template_after_rows=>'</ul>',
  p_reference_id=>3718405384049238,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_unordered_list_with_bullets
prompt  ......list template 186467779637809945
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="active"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>186467779637809945 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered List with Bullets',
  p_theme_id  => 105,
  p_theme_class_id => 1,
  p_list_template_before_rows=>'<ul class="uVerticalList">',
  p_list_template_after_rows=>'</ul>',
  p_reference_id=>3718718805049238,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_unordered_list_without_bullets
prompt  ......list template 186468104790809945
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="active"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>186468104790809945 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered List without Bullets',
  p_theme_id  => 105,
  p_theme_class_id => 18,
  p_list_template_before_rows=>'<ul class="uVerticalList noBullets">',
  p_list_template_after_rows=>'</ul>',
  p_reference_id=>3719005190049239,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/wizard_progress_list_vertical
prompt  ......list template 186468387784809946
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="#LIST_STATUS#"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /><span>#TEXT#</span></li>';

t2:=t2||'<li class="#LIST_STATUS#"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /><span>#TEXT#</span></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>186468387784809946 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Wizard Progress List - Vertical',
  p_theme_id  => 105,
  p_theme_class_id => 17,
  p_list_template_before_rows=>'<div class="uVerticalProgressList" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#><ul>',
  p_list_template_after_rows=>'</ul></div>',
  p_reference_id=>3719315736049239,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ...report templates
--
--application/shared_components/user_interface/templates/report/borderless_report
prompt  ......report template 186461193075809942
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 186461193075809942 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Borderless Report',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table class="uReportContainer uBorderlessReportContainer" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" summary="">'||unistr('\000a')||
'<tbody class="uReportPagination">'||unistr('\000a')||
'#TOP_PAGINATION#'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tbody class="uReportBody">'||unistr('\000a')||
'<tr><td>'||unistr('\000a')||
'<table summary="#REGION_TITLE#" class="uReport uReportBorderless">',
  p_row_template_after_rows =>'</tbody>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tbody class="uReportPagination">'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<div class="uReportDownloadLinks">#EXTERNAL_LINK##CSV_LINK#</div>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_before_column_heading=>'<thead>',
  p_column_heading_template=>'<th #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>',
  p_after_column_heading=>'</thead>'||unistr('\000a')||
'<tbody>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>',
  p_previous_page_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT_SET# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>',
  p_previous_set_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_mouse_over=>'#F0F0F0',
  p_row_style_checked=>'#E8E8E8',
  p_theme_id  => 105,
  p_theme_class_id => 1,
  p_reference_id=> 3712224400049225,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 186461193075809942 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/comment_bubbles
prompt  ......report template 186461476953809942
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<li class="#1#">'||unistr('\000a')||
'<div>'||unistr('\000a')||
'	<em>#2#</em>'||unistr('\000a')||
'	#3##4##5##6##7#'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<span>'||unistr('\000a')||
'	#8# (#9#) #10#'||unistr('\000a')||
'</span>'||unistr('\000a')||
'</li>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 186461476953809942 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Comment Bubbles',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<ul class="commentBubbles">',
  p_row_template_after_rows =>'</ul>'||unistr('\000a')||
'<table class="uPaginationTable">'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</table>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'NAMED_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT#</a>',
  p_previous_page_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT_SET#</a>',
  p_previous_set_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 105,
  p_theme_class_id => 1,
  p_reference_id=> 3712523493049225,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/fixed_headers
prompt  ......report template 186461791997809942
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td #ALIGNMENT# headers="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 186461791997809942 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Fixed Headers',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table class="uReportContainer" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" summary="">'||unistr('\000a')||
'<tbody class="uReportPagination">'||unistr('\000a')||
'#TOP_PAGINATION#'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tbody class="uReportBody">'||unistr('\000a')||
'<tr><td>'||unistr('\000a')||
'<div class="uFixedHeadersContainer">'||unistr('\000a')||
'<table summary="#REGION_TITLE#" class="uReport uReportFixedHeaders">',
  p_row_template_after_rows =>'</tbody>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tbody class="uReportPagination">'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<div class="uReportDownloadLinks">#EXTERNAL_LINK##CSV_LINK#</div>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_before_column_heading=>'<thead>'||unistr('\000a')||
'',
  p_column_heading_template=>'<th #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>',
  p_after_column_heading=>'</thead>'||unistr('\000a')||
'<tbody>'||unistr('\000a')||
'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>',
  p_previous_page_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT_SET# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>',
  p_previous_set_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_mouse_over=>'#F0F0F0',
  p_row_style_checked=>'#E8E8E8',
  p_theme_id  => 105,
  p_theme_class_id => 7,
  p_reference_id=> 3712807143049225,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 186461791997809942 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr>',
  p_row_template_after_last =>'</tr>'||unistr('\000a')||
'');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/horizontal_border
prompt  ......report template 186462091118809943
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 186462091118809943 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Horizontal Border',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table class="uReportContainer" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" summary="">'||unistr('\000a')||
'<tbody class="uReportPagination">'||unistr('\000a')||
'#TOP_PAGINATION#'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tbody class="uReportBody">'||unistr('\000a')||
'<tr><td>'||unistr('\000a')||
'<table summary="#REGION_TITLE#" class="uReport uReportHorizontal">',
  p_row_template_after_rows =>'</tbody>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tbody class="uReportPagination">'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<div class="uReportDownloadLinks">#EXTERNAL_LINK##CSV_LINK#</div>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_before_column_heading=>'<thead>',
  p_column_heading_template=>'<th #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>',
  p_after_column_heading=>'</thead>'||unistr('\000a')||
'<tbody>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>',
  p_previous_page_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT_SET# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>',
  p_previous_set_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_mouse_over=>'#F0F0F0',
  p_row_style_checked=>'#E8E8E8',
  p_theme_id  => 105,
  p_theme_class_id => 2,
  p_reference_id=> 3713132677049232,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 186462091118809943 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/one_column_unordered_list
prompt  ......report template 186462389957809943
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<li>#COLUMN_VALUE#</li>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 186462389957809943 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'One Column Unordered List',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table class="uReportList" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" summary="">'||unistr('\000a')||
'<tbody class="uReportPagination">'||unistr('\000a')||
'#TOP_PAGINATION#'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tbody class="uReportBody">'||unistr('\000a')||
'<tr><td>'||unistr('\000a')||
'<ul class="uReportList">',
  p_row_template_after_rows =>'</ul>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tbody class="uReportPagination">'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<div class="uReportDownloadLinks">#EXTERNAL_LINK##CSV_LINK#</div>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'NOT_CONDITIONAL',
  p_row_template_display_cond2=>'NOT_CONDITIONAL',
  p_row_template_display_cond3=>'NOT_CONDITIONAL',
  p_row_template_display_cond4=>'NOT_CONDITIONAL',
  p_next_page_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT#</a>',
  p_previous_page_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT_SET#</a>',
  p_previous_set_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 105,
  p_theme_class_id => 3,
  p_reference_id=> 3713416520049232,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 186462389957809943 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'OMIT',
  p_row_template_after_last =>'OMIT');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/search_results_report_select_link_text_link_target_detail1_detail2_last_modified
prompt  ......report template 186462680102809943
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<li>'||unistr('\000a')||
'<span class="title"><a href="#2#">#1#</a></span>'||unistr('\000a')||
'<span class="description"><span class="last_modified">#5#</span>#3#</span>'||unistr('\000a')||
'<span class="type">#4#</span>'||unistr('\000a')||
'</li>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 186462680102809943 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Search Results Report (SELECT link_text, link_target, detail1, detail2, last_modified)',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<ul class="sSearchResultsReport">',
  p_row_template_after_rows =>'</ul>'||unistr('\000a')||
'<table class="uPaginationTable">'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</table>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'NAMED_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT#</a>',
  p_previous_page_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT_SET#</a>',
  p_previous_set_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 105,
  p_theme_class_id => 1,
  p_reference_id=> 3713700376049232,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard
prompt  ......report template 186462995108809943
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 186462995108809943 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table class="uReportContainer" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" summary="">'||unistr('\000a')||
'<tbody class="uReportPagination">'||unistr('\000a')||
'#TOP_PAGINATION#'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tbody class="uReportBody">'||unistr('\000a')||
'<tr><td>'||unistr('\000a')||
'<table summary="#REGION_TITLE#" class="uReport uReportStandard">',
  p_row_template_after_rows =>'</tbody>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tbody class="uReportPagination">'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<div class="uReportDownloadLinks">#EXTERNAL_LINK##CSV_LINK#</div>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_before_column_heading=>'<thead>',
  p_column_heading_template=>'<th #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>',
  p_after_column_heading=>'</thead>'||unistr('\000a')||
'<tbody>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>',
  p_previous_page_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT_SET# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>',
  p_previous_set_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_mouse_over=>'#F0F0F0',
  p_row_style_checked=>'#E8E8E8',
  p_theme_id  => 105,
  p_theme_class_id => 4,
  p_reference_id=> 3714002720049232,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 186462995108809943 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard_alternative
prompt  ......report template 186463295967809943
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>';

c2 := null;
c3:=c3||'<td #ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="uOddRow">#COLUMN_VALUE#</td>';

c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 186463295967809943 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard - Alternative',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table class="uReportContainer" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" summary="">'||unistr('\000a')||
'<tbody class="uReportPagination">'||unistr('\000a')||
'#TOP_PAGINATION#'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tbody class="uReportBody">'||unistr('\000a')||
'<tr><td>'||unistr('\000a')||
'<table summary="#REGION_TITLE#" class="uReport uReportAlternative">',
  p_row_template_after_rows =>'</tbody>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tbody class="uReportPagination">'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<div class="uReportDownloadLinks">#EXTERNAL_LINK##CSV_LINK#</div>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_before_column_heading=>'<thead>',
  p_column_heading_template=>'<th #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>',
  p_after_column_heading=>'</thead>'||unistr('\000a')||
'<tbody>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'ODD_ROW_NUMBERS',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>',
  p_previous_page_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT_SET# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>',
  p_previous_set_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 105,
  p_theme_class_id => 5,
  p_reference_id=> 3714317920049232,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 186463295967809943 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr>',
  p_row_template_after_last =>'</tr>'||unistr('\000a')||
'');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/two_column_portlet
prompt  ......report template 186463596173809943
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<li>'||unistr('\000a')||
'  <span class="uValueHeading">'||unistr('\000a')||
'    #1#'||unistr('\000a')||
'  </span>'||unistr('\000a')||
'  <span class="uValue">'||unistr('\000a')||
'    #2#'||unistr('\000a')||
'  </span>'||unistr('\000a')||
'</li>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 186463596173809943 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Two Column Portlet',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<ul class="uValuePairs" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">',
  p_row_template_after_rows =>'</ul>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'NAMED_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_theme_id  => 105,
  p_theme_class_id => 7,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/value_attribute_pairs
prompt  ......report template 186463904512809943
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<li>'||unistr('\000a')||
'  <span class="uValueHeading">'||unistr('\000a')||
'    #COLUMN_HEADER#'||unistr('\000a')||
'  </span>'||unistr('\000a')||
'  <span class="uValue">'||unistr('\000a')||
'    #COLUMN_VALUE#'||unistr('\000a')||
'  </span>'||unistr('\000a')||
'</li>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 186463904512809943 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Value Attribute Pairs',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<ul class="uValuePairs" #REPORT_ATTRIBUTES#>',
  p_row_template_after_rows =>'</ul>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_theme_id  => 105,
  p_theme_class_id => 6,
  p_reference_id=> 3714922960049233,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/value_attribute_pairs_left_aligned
prompt  ......report template 186464202707809943
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<li>'||unistr('\000a')||
'  <label>'||unistr('\000a')||
'    #COLUMN_HEADER#'||unistr('\000a')||
'  </label>'||unistr('\000a')||
'  <span>'||unistr('\000a')||
'    #COLUMN_VALUE#'||unistr('\000a')||
'  </span>'||unistr('\000a')||
'</li>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 186464202707809943 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Value Attribute Pairs - Left Aligned',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<ul class="vapList tableBased" #REPORT_ATTRIBUTES# id="report_#REPORT_STATIC_ID#">',
  p_row_template_after_rows =>'</ul>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_theme_id  => 105,
  p_theme_class_id => 6,
  p_reference_id=> 3715228309049233,
  p_translate_this_template => 'N',
  p_row_template_comment=> 'shrahman 03/12/2012 Making table based ');
end;
null;
 
end;
/

prompt  ...label templates
--
--application/shared_components/user_interface/templates/label/hidden_label_read_by_screen_readers
prompt  ......label template 186468689908809946
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 186468689908809946 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Hidden Label (Read by Screen Readers)',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" class="visuallyhidden">',
  p_template_body2=>'</label>',
  p_before_item=>'<div id="#CURRENT_ITEM_CONTAINER_ID#">',
  p_after_item=>'</div>',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'<span class="uLabelError">#ERROR_MESSAGE#</span>',
  p_theme_id  => 105,
  p_theme_class_id => 13,
  p_reference_id=> 3719604431049239,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional_horizontal_left_aligned
prompt  ......label template 186468776143809946
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 186468776143809946 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional (Horizontal - Left Aligned)',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" class="uOptional">',
  p_template_body2=>'</label>'||unistr('\000a')||
'<div class="fieldControls">',
  p_before_item=>'<div class="fieldContainer horizontal" id="#CURRENT_ITEM_CONTAINER_ID#">',
  p_after_item=>'<button class="uButton iconButton iconOnly altButton help itemHelpButton" onclick="uShowItemHelp(''#CURRENT_ITEM_NAME#'');return false;" id="hb_#CURRENT_ITEM_NAME#" type="button" title="#CURRENT_ITEM_HELP_LABEL#"><span><i></i></span></button>'||unistr('\000a')||
'<span class="uItemHelp" data-item-id="#CURRENT_ITEM_NAME#">#CURRENT_ITEM_HELP_TEXT#</span>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div>',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'<span class="uLabelError">#ERROR_MESSAGE#</span>',
  p_theme_id  => 105,
  p_theme_class_id => 3,
  p_reference_id=> 3719729427049239,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional_horizontal_right_aligned
prompt  ......label template 186468899752809946
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 186468899752809946 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional (Horizontal - Right Aligned)',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" class="uOptional">',
  p_template_body2=>'</label>'||unistr('\000a')||
'<div class="fieldControls">',
  p_before_item=>'<div class="fieldContainer horizontal rightlabels" id="#CURRENT_ITEM_CONTAINER_ID#">',
  p_after_item=>'<button class="uButton iconButton iconOnly altButton help itemHelpButton" onclick="uShowItemHelp(''#CURRENT_ITEM_NAME#'');return false;" id="hb_#CURRENT_ITEM_NAME#" type="button"  title="#CURRENT_ITEM_HELP_LABEL#"><span><i></i></span></button>'||unistr('\000a')||
'<span class="uItemHelp" data-item-id="#CURRENT_ITEM_NAME#">#CURRENT_ITEM_HELP_TEXT#</span>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div>',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'<span class="uLabelError">#ERROR_MESSAGE#</span>',
  p_theme_id  => 105,
  p_theme_class_id => 3,
  p_reference_id=> 3719800925049239,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional_label_above
prompt  ......label template 186468990361809946
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 186468990361809946 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional (Label Above)',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" class="uOptional">',
  p_template_body2=>'</label>'||unistr('\000a')||
'<button class="uButton iconButton iconOnly altButton help itemHelpButton" onclick="uShowItemHelp(''#CURRENT_ITEM_NAME#'');return false;" id="hb_#CURRENT_ITEM_NAME#" type="button" title="#CURRENT_ITEM_HELP_LABEL#"><span><i></i></span></button>'||unistr('\000a')||
'<span class="uItemHelp" data-item-id="#CURRENT_ITEM_NAME#">#CURRENT_ITEM_HELP_TEXT#</span>'||unistr('\000a')||
'<div class="fieldControls">',
  p_before_item=>'<div class="fieldContainer vertical" id="#CURRENT_ITEM_CONTAINER_ID#">',
  p_after_item=>'</div>'||unistr('\000a')||
'</div>',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'<span class="uLabelError">#ERROR_MESSAGE#</span>',
  p_theme_id  => 105,
  p_theme_class_id => 3,
  p_reference_id=> 3719916759049239,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/required_horizontal_left_aligned
prompt  ......label template 186469087353809946
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 186469087353809946 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required (Horizontal - Left Aligned)',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" class="uRequired"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" class="uAsterisk" />',
  p_template_body2=>'<span class="visuallyhidden">(#VALUE_REQUIRED#)</span></label>'||unistr('\000a')||
'<div class="fieldControls">',
  p_before_item=>'<div class="fieldContainer horizontal" id="#CURRENT_ITEM_CONTAINER_ID#">',
  p_after_item=>'<button class="uButton iconButton iconOnly altButton help itemHelpButton" onclick="uShowItemHelp(''#CURRENT_ITEM_NAME#'');return false;" id="hb_#CURRENT_ITEM_NAME#" type="button" title="#CURRENT_ITEM_HELP_LABEL#"><span><i></i></span></button>'||unistr('\000a')||
'<span class="uItemHelp" data-item-id="#CURRENT_ITEM_NAME#">#CURRENT_ITEM_HELP_TEXT#</span>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div>',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'<span class="uLabelError">#ERROR_MESSAGE#</span>',
  p_theme_id  => 105,
  p_theme_class_id => 4,
  p_reference_id=> 3720013209049239,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/required_horizontal_right_aligned
prompt  ......label template 186469174827809946
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 186469174827809946 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required (Horizontal - Right Aligned)',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" class="uRequired"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" class="uAsterisk" />',
  p_template_body2=>' <span class="visuallyhidden">(#VALUE_REQUIRED#)</span></label>'||unistr('\000a')||
'<div class="fieldControls">',
  p_before_item=>'<div class="fieldContainer horizontal rightlabels" id="#CURRENT_ITEM_CONTAINER_ID#">',
  p_after_item=>'<button class="uButton iconButton iconOnly altButton help itemHelpButton" onclick="uShowItemHelp(''#CURRENT_ITEM_NAME#'');return false;" id="hb_#CURRENT_ITEM_NAME#" type="button" title="#CURRENT_ITEM_HELP_LABEL#"><span><i></i></span></button>'||unistr('\000a')||
'<span class="uItemHelp" data-item-id="#CURRENT_ITEM_NAME#">#CURRENT_ITEM_HELP_TEXT#</span>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div>',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'<span class="uLabelError">#ERROR_MESSAGE#</span>',
  p_theme_id  => 105,
  p_theme_class_id => 4,
  p_reference_id=> 3720132197049239,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/required_label_above
prompt  ......label template 186469287734809946
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 186469287734809946 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required (Label Above)',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" class="uRequired"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" class="uAsterisk" />',
  p_template_body2=>'<span class="visuallyhidden">(#VALUE_REQUIRED#)</span></label>'||unistr('\000a')||
'<button class="uButton iconButton iconOnly altButton help itemHelpButton" onclick="uShowItemHelp(''#CURRENT_ITEM_NAME#'');return false;" id="hb_#CURRENT_ITEM_NAME#" type="button" title="#CURRENT_ITEM_HELP_LABEL#"><span><i></i></span></button>'||unistr('\000a')||
'<span class="uItemHelp" data-item-id="#CURRENT_ITEM_NAME#">#CURRENT_ITEM_HELP_TEXT#</span>'||unistr('\000a')||
'<div class="fieldControls">',
  p_before_item=>'<div class="fieldContainer vertical" id="#CURRENT_ITEM_CONTAINER_ID#">',
  p_after_item=>'</div>'||unistr('\000a')||
'</div>',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'<span class="uLabelError">#ERROR_MESSAGE#</span>',
  p_theme_id  => 105,
  p_theme_class_id => 4,
  p_reference_id=> 3720204604049239,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ...breadcrumb templates
--
--application/shared_components/user_interface/templates/breadcrumb/breadcrumb_menu
prompt  ......template 186470588338809947
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 186470588338809947 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Breadcrumb Menu',
  p_before_first=>'<ul>'||unistr('\000a')||
'<li class="uStartCap"><span></span></li>',
  p_current_page_option=>'<li class="active"><span>#NAME#</span></li> ',
  p_non_current_page_option=>'<li><a href="#LINK#">#NAME#</a></li> ',
  p_menu_link_attributes=>'',
  p_between_levels=>'<li class="uSeparator"><span></span></li>',
  p_after_last=>'<li class="uEndCap"><span></span></li>'||unistr('\000a')||
'</ul>',
  p_max_levels=>12,
  p_start_with_node=>'PARENT_TO_LEAF',
  p_theme_id  => 105,
  p_theme_class_id => 1,
  p_reference_id            => 3721503279049240,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/popuplov
prompt  ...popup list of values templates
--
prompt  ......template 186470785733809948
 
begin
 
begin
wwv_flow_api.create_popup_lov_template (
  p_id=> 186470785733809948 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_popup_icon=>'#IMAGE_PREFIX#f_spacer.gif',
  p_popup_icon_attr=>'alt="#LIST_OF_VALUES#" title="#LIST_OF_VALUES#" class="uPopupLOVIcon"',
  p_popup_icon2=>'',
  p_popup_icon_attr2=>'',
  p_page_name=>'winlov',
  p_page_title=>'Cuadro de Busqueda',
  p_page_html_head=>'<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />'||unistr('\000a')||
'<link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_25/css/4_2.css" type="text/css" media="all"/>'||unistr('\000a')||
'#THEME_CSS#',
  p_page_body_attr=>'class="uPopUpLOV"',
  p_before_field_text=>'<div class="uActionBar">',
  p_page_heading_text=>'',
  p_page_footer_text =>'',
  p_filter_width     =>'20',
  p_filter_max_width =>'100',
  p_filter_text_attr =>'class="searchField"',
  p_find_button_text =>'Buscar',
  p_find_button_image=>'',
  p_find_button_attr =>'class="lovButton hotButton"',
  p_close_button_text=>'Cerrar',
  p_close_button_image=>'',
  p_close_button_attr=>'class="lovButton"',
  p_next_button_text =>'Siguiente >',
  p_next_button_image=>'',
  p_next_button_attr =>'class="lovButton"',
  p_prev_button_text =>'< Anterior',
  p_prev_button_image=>'',
  p_prev_button_attr =>'class="lovButton"',
  p_after_field_text=>'</div>',
  p_scrollbars=>'1',
  p_resizable=>'1',
  p_width =>'400',
  p_height=>'450',
  p_result_row_x_of_y=>'<div class="lovPagination">Fila(s) #FIRST_ROW# - #LAST_ROW#</div>',
  p_result_rows_per_pg=>500,
  p_before_result_set=>'<div class="lovLinks">',
  p_theme_id  => 105,
  p_theme_class_id => 1,
  p_reference_id       => 3721713226049241,
  p_translate_this_template => 'N',
  p_after_result_set   =>'</div>');
end;
null;
 
end;
/

prompt  ...calendar templates
--
--application/shared_components/user_interface/templates/calendar/calendar
prompt  ......template 186470703928809947
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 186470703928809947 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar',
  p_translate_this_template=> 'N',
  p_day_of_week_format=> '<th id="#DY#" scope="col" class="uCalDayCol">#IDAY#</th>',
  p_month_title_format=> '<div class="uCal">'||unistr('\000a')||
'<h1 class="uMonth">#IMONTH# <span>#YYYY#</span></h1>',
  p_month_open_format=> '<table class="uCal" cellpadding="0" cellspacing="0" border="0" summary="#IMONTH# #YYYY#">',
  p_month_close_format=> '</table>'||unistr('\000a')||
'<div class="uCalFooter"></div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'',
  p_day_title_format=> '<span class="uDayTitle">#DD#</span>',
  p_day_open_format=> '<td class="uDay" headers="#DY#">#TITLE_FORMAT#<div class="uDayData">#DATA#</div>',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td class="uDay today" headers="#DY#">#TITLE_FORMAT#<div class="uDayData">#DATA#</div>',
  p_weekend_title_format=> '<span class="uDayTitle weekendday">#DD#</span>',
  p_weekend_open_format => '<td class="uDay" headers="#DY#">#TITLE_FORMAT#<div class="uDayData">#DATA#</div>',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<span class="uDayTitle">#DD#</span>',
  p_nonday_open_format => '<td class="uDay nonday" headers="#DY#">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '<div class="uCal uCalWeekly">'||unistr('\000a')||
'<h1 class="uMonth">#WTITLE#</h1>',
  p_weekly_day_of_week_format => '<th scope="col" class="aCalDayCol" id="#DY#">'||unistr('\000a')||
'  <span class="visible-desktop">#DD# #IDAY#</span>'||unistr('\000a')||
'  <span class="hidden-desktop">#DD# <em>#IDY#</em></span>'||unistr('\000a')||
'</th>',
  p_weekly_month_open_format => '<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="uCal">',
  p_weekly_month_close_format => '</table>'||unistr('\000a')||
'<div class="uCalFooter"></div>'||unistr('\000a')||
'</div>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="uDay" headers="#DY#"><div class="uDayData">',
  p_weekly_day_close_format => '</div></td>',
  p_weekly_today_open_format => '<td class="uDay today" headers="#DY#"><div class="uDayData">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td class="uDay weekend" headers="#DY#"><div class="uDayData">',
  p_weekly_weekend_close_format => '</div></td>',
  p_weekly_time_open_format => '<th scope="row" class="uCalHour">',
  p_weekly_time_close_format => '</th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr>',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th scope="col" id="#DY#" class="aCalDayCol">#IDAY#</th>',
  p_daily_month_title_format => '<div class="uCal uCalWeekly uCalDaily">'||unistr('\000a')||
'<h1 class="uMonth">#IMONTH# #DD#, #YYYY#</h1>',
  p_daily_month_open_format => '<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL#" class="uCal">',
  p_daily_month_close_format => '</table>'||unistr('\000a')||
'<div class="uCalFooter"></div>'||unistr('\000a')||
'</div>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td class="uDay" headers="#DY#"><div class="uDayData">',
  p_daily_day_close_format => '</div></td>',
  p_daily_today_open_format => '<td class="uDay today" headers="#DY#"><div class="uDayData">',
  p_daily_time_open_format => '<th scope="row" class="uCalHour" id="#TIME#">',
  p_daily_time_close_format => '</th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr>',
  p_daily_hour_close_format => '</tr>',
  p_cust_month_title_format => '',
  p_cust_day_of_week_format => '',
  p_cust_month_open_format => '',
  p_cust_month_close_format => '',
  p_cust_week_title_format => '',
  p_cust_week_open_format => '',
  p_cust_week_close_format => '',
  p_cust_day_title_format => '',
  p_cust_day_open_format => '',
  p_cust_day_close_format => '',
  p_cust_today_open_format => '',
  p_cust_daily_title_format => '',
  p_cust_daily_open_format => '',
  p_cust_daily_close_format => '',
  p_cust_nonday_title_format => '',
  p_cust_nonday_open_format => '',
  p_cust_nonday_close_format => '',
  p_cust_weekend_title_format => '',
  p_cust_weekend_open_format => '',
  p_cust_weekend_close_format => '',
  p_cust_hour_open_format => '',
  p_cust_hour_close_format => '',
  p_cust_time_title_format => '',
  p_cust_time_open_format => '',
  p_cust_time_close_format => '',
  p_cust_wk_month_title_format => '',
  p_cust_wk_day_of_week_format => '',
  p_cust_wk_month_open_format => '',
  p_cust_wk_month_close_format => '',
  p_cust_wk_week_title_format => '',
  p_cust_wk_week_open_format => '',
  p_cust_wk_week_close_format => '',
  p_cust_wk_day_title_format => '',
  p_cust_wk_day_open_format => '',
  p_cust_wk_day_close_format => '',
  p_cust_wk_today_open_format => '',
  p_cust_wk_weekend_title_format => '',
  p_cust_wk_weekend_open_format => '',
  p_cust_wk_weekend_close_format => '',
  p_cust_month_day_height_pix => '',
  p_cust_month_day_height_per => '',
  p_cust_week_day_width_pix => '',
  p_cust_week_day_width_per => '',
  p_agenda_format => '<ul class="listCalendar">'||unistr('\000a')||
'  <li class="monthHeader">'||unistr('\000a')||
'    <h1>#IMONTH# #YYYY#</h1>'||unistr('\000a')||
'  </li>'||unistr('\000a')||
'  #DAYS#'||unistr('\000a')||
'  <li class="listEndCap"></li>'||unistr('\000a')||
'</ul>',
  p_agenda_past_day_format => '  <li class="dayHeader past">'||unistr('\000a')||
'    <h2>#IDAY# <span>#IMONTH# #DD#</span></h2>'||unistr('\000a')||
'  </li>',
  p_agenda_today_day_format => '  <li class="dayHeader today">'||unistr('\000a')||
'    <h2>#IDAY# <span>#IMONTH# #DD#</span></h2>'||unistr('\000a')||
'  </li>',
  p_agenda_future_day_format => '  <li class="dayHeader future">'||unistr('\000a')||
'    <h2>#IDAY# <span>#IMONTH# #DD#</span></h2>'||unistr('\000a')||
'  </li>',
  p_agenda_past_entry_format => '  <li class="dayData past">#DATA#</li>',
  p_agenda_today_entry_format => '  <li class="dayData today">#DATA#</li>',
  p_agenda_future_entry_format => '  <li class="dayData future">#DATA#</li>',
  p_month_data_format => '#DAYS#',
  p_month_data_entry_format => '#DATA#',
  p_theme_id  => 105,
  p_theme_class_id => 1,
  p_reference_id=> 3721618195049240);
end;
null;
 
end;
/

prompt  ...application themes
--
--application/shared_components/user_interface/themes/multicolor_responsive
prompt  ......theme 186470997091809949
begin
wwv_flow_api.create_theme (
  p_id =>186470997091809949 + wwv_flow_api.g_id_offset,
  p_flow_id =>wwv_flow.g_flow_id,
  p_theme_id  => 105,
  p_theme_name=>'Multicolor Responsive',
  p_ui_type_name=>'DESKTOP',
  p_is_locked=>false,
  p_default_page_template=>186432974821809927 + wwv_flow_api.g_id_offset,
  p_error_template=>186415994449809918 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=>186439887895809932 + wwv_flow_api.g_id_offset,
  p_breadcrumb_display_point=>'REGION_POSITION_01',
  p_sidebar_display_point=>'REGION_POSITION_02',
  p_login_template=>186410375223809912 + wwv_flow_api.g_id_offset,
  p_default_button_template=>186469992544809947 + wwv_flow_api.g_id_offset,
  p_default_region_template=>186459500426809941 + wwv_flow_api.g_id_offset,
  p_default_chart_template =>186459500426809941 + wwv_flow_api.g_id_offset,
  p_default_form_template  =>186456583664809940 + wwv_flow_api.g_id_offset,
  p_default_reportr_template   =>186459500426809941 + wwv_flow_api.g_id_offset,
  p_default_tabform_template=>186459500426809941 + wwv_flow_api.g_id_offset,
  p_default_wizard_template=>186456583664809940 + wwv_flow_api.g_id_offset,
  p_default_menur_template=>186455092510809939 + wwv_flow_api.g_id_offset,
  p_default_listr_template=>186459500426809941 + wwv_flow_api.g_id_offset,
  p_default_irr_template=>186457877751809940 + wwv_flow_api.g_id_offset,
  p_default_report_template   =>186462995108809943 + wwv_flow_api.g_id_offset,
  p_default_label_template=>186468899752809946 + wwv_flow_api.g_id_offset,
  p_default_menu_template=>186470588338809947 + wwv_flow_api.g_id_offset,
  p_default_calendar_template=>186470703928809947 + wwv_flow_api.g_id_offset,
  p_default_list_template=>186467779637809945 + wwv_flow_api.g_id_offset,
  p_default_option_label=>186468899752809946 + wwv_flow_api.g_id_offset,
  p_default_header_template=>null + wwv_flow_api.g_id_offset,
  p_default_footer_template=>null + wwv_flow_api.g_id_offset,
  p_default_page_transition=>'NONE',
  p_default_popup_transition=>'NONE',
  p_default_required_label=>186469174827809946 + wwv_flow_api.g_id_offset);
end;
/
 
prompt  ...theme styles
--
 
begin
 
null;
 
end;
/

prompt  ...theme display points
--
 
begin
 
null;
 
end;
/

prompt  ...build options
--
 
begin
 
null;
 
end;
/

--application/shared_components/globalization/language
prompt  ...Language Maps for Application 2806
--
 
begin
 
null;
 
end;
/

--application/shared_components/globalization/messages
prompt  ...text messages
--
--application/shared_components/globalization/dyntranslations
prompt  ...dynamic translations
--
prompt  ...Shortcuts
--
--application/shared_components/user_interface/shortcuts/delete_confirm_msg
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'¿Desea realizar esta acción de supresión?';

wwv_flow_api.create_shortcut (
 p_id=> 386529849111482960 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'DELETE_CONFIRM_MSG',
 p_shortcut_type=> 'TEXT_ESCAPE_JS',
 p_shortcut=> c1);
end;
null;
 
end;
/

prompt  ...web services (9iR2 or better)
--
prompt  ...shared queries
--
prompt  ...report layouts
--
prompt  ...authentication schemes
--
--application/shared_components/security/authentication/authenticationservice_comeco
prompt  ......authentication 62527623376800809
 
begin
 
wwv_flow_api.create_authentication (
  p_id => 62527623376800809 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'AuthenticationService COMECO'
 ,p_scheme_type => 'NATIVE_CUSTOM'
 ,p_attribute_03 => 'COM_PKG.AUTH_SEGUSU_ECO'
 ,p_attribute_05 => 'N'
 ,p_invalid_session_type => 'URL'
 ,p_invalid_session_url => 'f?p=&APP_ID.:101:&SESSION.'
 ,p_logout_url => 'f?p=&APP_ID.:101'
 ,p_cookie_name => 'AUTHSRV'
 ,p_use_secure_cookie_yn => 'N'
  );
null;
 
end;
/

--application/shared_components/security/authentication/authenticationservice
prompt  ......authentication 497710135967295600
 
begin
 
wwv_flow_api.create_authentication (
  p_id => 497710135967295600 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'AuthenticationService'
 ,p_scheme_type => 'NATIVE_CUSTOM'
 ,p_attribute_03 => 'SEG_PKG.AUTH_SEGUSU'
 ,p_attribute_05 => 'N'
 ,p_attribute_15 => '327325398100593140'
 ,p_invalid_session_type => 'URL'
 ,p_invalid_session_url => 'f?p=&APP_ID.:101:&SESSION.'
 ,p_logout_url => 'f?p=&APP_ID.:101'
 ,p_cookie_name => 'AUTHSRV'
 ,p_use_secure_cookie_yn => 'N'
  );
null;
 
end;
/

--application/shared_components/security/authentication/application_express
prompt  ......authentication 519747329430040443
 
begin
 
wwv_flow_api.create_authentication (
  p_id => 519747329430040443 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'Application Express'
 ,p_scheme_type => 'NATIVE_APEX_ACCOUNTS'
 ,p_attribute_15 => '349362591563337983'
 ,p_invalid_session_type => 'URL'
 ,p_invalid_session_url => 'f?p=&APP_ID.:101:&SESSION.'
 ,p_logout_url => 'f?p=&APP_ID.:1'
 ,p_use_secure_cookie_yn => 'N'
 ,p_comments => 'Utilice las credenciales de la cuenta interna Application Express y la página de conexión en esta aplicación.'
  );
null;
 
end;
/

--application/shared_components/security/authentication/database
prompt  ......authentication 519747446293040446
 
begin
 
wwv_flow_api.create_authentication (
  p_id => 519747446293040446 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'DATABASE'
 ,p_scheme_type => 'NATIVE_DAD'
 ,p_attribute_15 => '349362708426337986'
 ,p_invalid_session_type => 'LOGIN'
 ,p_use_secure_cookie_yn => 'N'
 ,p_comments => 'Usar autenticación de base de datos (el usuario se identifica mediante el DAD).'
  );
null;
 
end;
/

--application/shared_components/security/authentication/database_account
prompt  ......authentication 519747552279040446
 
begin
 
wwv_flow_api.create_authentication (
  p_id => 519747552279040446 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'DATABASE ACCOUNT'
 ,p_scheme_type => 'NATIVE_DB_ACCOUNTS'
 ,p_attribute_15 => '349362814412337986'
 ,p_invalid_session_type => 'URL'
 ,p_invalid_session_url => 'f?p=&APP_ID.:101:&SESSION.'
 ,p_logout_url => 'f?p=&APP_ID.:1'
 ,p_use_secure_cookie_yn => 'N'
 ,p_comments => 'Utilice las credenciales de la cuenta de base de datos.'
  );
null;
 
end;
/

--application/shared_components/security/authentication/público
prompt  ......authentication 519759240570726176
 
begin
 
wwv_flow_api.create_authentication (
  p_id => 519759240570726176 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'Público'
 ,p_scheme_type => 'NATIVE_DAD'
 ,p_attribute_15 => '349374502704023716'
 ,p_invalid_session_type => 'LOGIN'
 ,p_use_secure_cookie_yn => 'N'
 ,p_comments => 'Basado en el esquema de autenticación de la galería:Sin Autenticación (utilizando DAD)'
  );
null;
 
end;
/

prompt  ...ui types
--
 
begin
 
null;
 
end;
/

prompt  ...plugins
--
--application/shared_components/plugins/region_type/alert
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 324189272475216528 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_name => 'ALERT'
 ,p_display_name => 'Alert'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_plsql_code => 
'function alert ('||unistr('\000a')||
'  p_region in apex_plugin.t_region,'||unistr('\000a')||
'  p_plugin in apex_plugin.t_plugin,'||unistr('\000a')||
'  p_is_printer_friendly in boolean'||unistr('\000a')||
')'||unistr('\000a')||
'return apex_plugin.t_region_render_result is'||unistr('\000a')||
'  /*declaracion de variables*/'||unistr('\000a')||
'  v_datafound boolean := false;'||unistr('\000a')||
'  v_nodatamsg varchar2(50) := ''No se ejecuto la alerta.'';'||unistr('\000a')||
''||unistr('\000a')||
'  v_sql         varchar2(32767);'||unistr('\000a')||
'  v_sql_handler apex_plugin_util.t_sql_handler;'||unistr('\000a')||
'  v_dtlist      wwv_flow_g'||
'lobal.vc_arr2;'||unistr('\000a')||
'  v_sql_values  apex_plugin_util.t_column_value_list;'||unistr('\000a')||
''||unistr('\000a')||
'  v_id         varchar2(50);'||unistr('\000a')||
'  v_msj        varchar2(500);'||unistr('\000a')||
'  v_btn     varchar2(500);'||unistr('\000a')||
'  v_url        varchar2(500);  '||unistr('\000a')||
'  '||unistr('\000a')||
'  a_habilitado_sn   apex_application_page_regions.attribute_01%type := p_region.attribute_01;'||unistr('\000a')||
'  a_ejecutado_sn    apex_application_page_regions.attribute_02%type := p_region.attribute_02;'||unistr('\000a')||
'  --a_pause       ape'||
'x_application_page_regions.attribute_03%type := p_region.attribute_03;'||unistr('\000a')||
'  --a_controls    apex_application_page_regions.attribute_04%type := p_region.attribute_04;'||unistr('\000a')||
'  --a_captions    apex_application_page_regions.attribute_05%type := p_region.attribute_05;'||unistr('\000a')||
'  --a_pager       apex_application_page_regions.attribute_06%type := p_region.attribute_06; '||unistr('\000a')||
'  --a_colorPager  apex_application_page_regions.attr'||
'ibute_07%type := p_region.attribute_07;'||unistr('\000a')||
'  --'||unistr('\000a')||
'begin '||unistr('\000a')||
'  --'||unistr('\000a')||
'  --Incluir slippry.js'||unistr('\000a')||
'  apex_javascript.add_library ('||unistr('\000a')||
'    p_name      => ''alert'','||unistr('\000a')||
'    p_directory => p_plugin.file_prefix,'||unistr('\000a')||
'    p_version   => null '||unistr('\000a')||
'  );'||unistr('\000a')||
'  --'||unistr('\000a')||
'  --Incluir slippry.css'||unistr('\000a')||
'  apex_css.add_file ('||unistr('\000a')||
'    p_name => ''alert'','||unistr('\000a')||
'    p_directory => p_plugin.file_prefix,'||unistr('\000a')||
'    p_version   => null'||unistr('\000a')||
'  );'||unistr('\000a')||
'  --'||unistr('\000a')||
'  --'||unistr('\000a')||
'  --Recupero los valores de la QUER'||
'Y'||unistr('\000a')||
'  v_dtlist(1) := apex_plugin_util.c_data_type_number;'||unistr('\000a')||
'  v_dtlist(2) := apex_plugin_util.c_data_type_varchar2;'||unistr('\000a')||
'  v_dtlist(3) := apex_plugin_util.c_data_type_varchar2;'||unistr('\000a')||
'  v_dtlist(4) := apex_plugin_util.c_data_type_varchar2;'||unistr('\000a')||
'  --  '||unistr('\000a')||
'  v_sql := p_region.source;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  --Execute Inmediate'||unistr('\000a')||
'  v_sql := apex_plugin_util.get_plsql_function_result ('||unistr('\000a')||
'    p_plsql_function => v_sql '||unistr('\000a')||
'  );  '||unistr('\000a')||
'  --'||unistr('\000a')||
'  --'||unistr('\000a')||
'  v_sql_ha'||
'ndler := apex_plugin_util.get_sql_handler('||unistr('\000a')||
'    p_sql_statement => v_sql,'||unistr('\000a')||
'    p_min_columns   => 2,'||unistr('\000a')||
'    p_max_columns   => 4,'||unistr('\000a')||
'    p_data_type_list => v_dtlist,'||unistr('\000a')||
'    p_component_name => null'||unistr('\000a')||
'  );'||unistr('\000a')||
'  --'||unistr('\000a')||
'  --CONTROLES DE QUERY'||unistr('\000a')||
'  if wwv_flow.g_debug then '||unistr('\000a')||
'    wwv_flow.debug(''get_sql_handler called for query: ''||v_sql);'||unistr('\000a')||
'  end if;'||unistr('\000a')||
''||unistr('\000a')||
'  apex_plugin_util.prepare_query('||unistr('\000a')||
'    p_sql_handler   => v_sql_handler'||unistr('\000a')||
'  );'||
''||unistr('\000a')||
''||unistr('\000a')||
'  if wwv_flow.g_debug then '||unistr('\000a')||
'    wwv_flow.debug(''prepare_query called.'');'||unistr('\000a')||
'  end if;'||unistr('\000a')||
' '||unistr('\000a')||
'  v_sql_values := apex_plugin_util.get_data('||unistr('\000a')||
'    p_sql_handler   => v_sql_handler'||unistr('\000a')||
'  );'||unistr('\000a')||
''||unistr('\000a')||
'  if wwv_flow.g_debug then '||unistr('\000a')||
'    wwv_flow.debug(''get_data called.'');'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  '||unistr('\000a')||
'  apex_plugin_util.free_sql_handler('||unistr('\000a')||
'    p_sql_handler   => v_sql_handler'||unistr('\000a')||
'  );'||unistr('\000a')||
''||unistr('\000a')||
'  if wwv_flow.g_debug then '||unistr('\000a')||
'    wwv_flow.debug(''free_handler cal'||
'led.'');'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  '||unistr('\000a')||
'  /* NoDataFound Check */'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    v_datafound := true;'||unistr('\000a')||
'    if wwv_flow.g_debug then '||unistr('\000a')||
'      wwv_flow.debug(v_sql_values(1).count || '' row(s) returned.'');'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  exception'||unistr('\000a')||
'    when NO_DATA_FOUND then '||unistr('\000a')||
'     v_datafound := false;'||unistr('\000a')||
'     if wwv_flow.g_debug then '||unistr('\000a')||
'       wwv_flow.debug(''no rows returned.'');'||unistr('\000a')||
'     end if;'||unistr('\000a')||
'  end;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  if v_datafound then'||unistr('\000a')||
'    --if a_habilitad'||
'o_sn = ''SI'' then'||unistr('\000a')||
'      --Comienza ALERT'||unistr('\000a')||
'      sys.htp.p(''<div class="overlay"></div>  <div class="wrap-alert">  <div class="wrap-content">  <div class="wrap-ico"><i class="fa fa-bell"></i></div>  <div class="wrap-list"><ul>'');'||unistr('\000a')||
'      --'||unistr('\000a')||
'      --LOOP '||unistr('\000a')||
'      for i in 1..v_sql_values(1).count loop'||unistr('\000a')||
'        --'||unistr('\000a')||
'        v_id    := to_char(v_sql_values(1)(i));'||unistr('\000a')||
'        v_msj   := v_sql_values(2)(i);'||unistr('\000a')||
'       '||
' v_btn  := v_sql_values(3)(i);'||unistr('\000a')||
'        v_url  := v_sql_values(4)(i);'||unistr('\000a')||
'        --'||unistr('\000a')||
'        if nvl(v_url,''#'') <> ''#'' then'||unistr('\000a')||
'          v_btn := ''<a class="btn-pri" href="''||v_url||''">''||nvl(v_btn,''Ir'')||''</a>'';'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --'||unistr('\000a')||
'        --Listado de Alert'||unistr('\000a')||
'        sys.htp.p(''<li id="alert_''||v_id||''"><p>''||v_msj||''</p>''||v_btn||''</li>'');'||unistr('\000a')||
'        --'||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      --  '||unistr('\000a')||
'      --Cierro Alert'||unistr('\000a')||
''||
'      sys.htp.p(''</ul></div>  </div> <div class="footer"><button class="btn-cerrar">Cerrar</button></div> </div>'');'||unistr('\000a')||
'      --'||unistr('\000a')||
'      if APEX_UTIL.GET_SESSION_STATE(a_ejecutado_sn) is null then'||unistr('\000a')||
'        APEX_UTIL.SET_SESSION_STATE(a_ejecutado_sn,0);'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      --'||unistr('\000a')||
'      sys.htp.p('''||unistr('\000a')||
'        <script>'||unistr('\000a')||
''||unistr('\000a')||
'          '||unistr('\000a')||
'          /*CON COOKIE*/'||unistr('\000a')||
'          var allcookies = document.cookie;'||unistr('\000a')||
'          cooki'||
'earray  = allcookies.split(";");'||unistr('\000a')||
'   '||unistr('\000a')||
'          var execute = 0;'||unistr('\000a')||
'          for(var i=0; i<cookiearray.length; i++){'||unistr('\000a')||
'            name = cookiearray[i].split("=")[0];'||unistr('\000a')||
'            value = cookiearray[i].split("=")[1];'||unistr('\000a')||
'            if (name.trim() == "alertexecute"){'||unistr('\000a')||
'               execute = value;'||unistr('\000a')||
'            }            '||unistr('\000a')||
'          }'||unistr('\000a')||
'          /*END CON COOKIE*/'||unistr('\000a')||
'        </script>'');'||unistr('\000a')||
'      --LLamada jQ'||
'uery del Alert si no fue ejecutado'||unistr('\000a')||
'      --Con COOKIE'||unistr('\000a')||
'        --apex_javascript.add_onload_code (p_code => ''if ($("#''||a_habilitado_sn||''").val() == "SI") {     if (execute == 0) {   $(".overlay").fadeIn();  $(".wrap-alert").fadeIn();  document.cookie = "alertexecute=1";   }   }'');'||unistr('\000a')||
'      --  '||unistr('\000a')||
'      --Con SESSION'||unistr('\000a')||
'      if v_id is not null then'||unistr('\000a')||
'        --'||unistr('\000a')||
'        apex_javascript.add_onload_code (p_c'||
'ode => ''$("#toolbar_notify").fadeIn();'');'||unistr('\000a')||
'        --'||unistr('\000a')||
'        if APEX_UTIL.GET_SESSION_STATE(a_ejecutado_sn) = 0 then'||unistr('\000a')||
'          apex_javascript.add_onload_code (p_code => ''if ($("#''||a_habilitado_sn||''").val() == "SI") {  $(".overlay").fadeIn();  $(".wrap-alert").fadeIn(); } '');        '||unistr('\000a')||
'          APEX_UTIL.SET_SESSION_STATE(a_ejecutado_sn,1);'||unistr('\000a')||
'        end if;      '||unistr('\000a')||
'        --      '||unistr('\000a')||
'      end if;    '||
''||unistr('\000a')||
'      --'||unistr('\000a')||
'      '||unistr('\000a')||
'      --'||unistr('\000a')||
'    --end if;    '||unistr('\000a')||
'    --'||unistr('\000a')||
'    --'||unistr('\000a')||
'  else'||unistr('\000a')||
'      sys.htp.p(v_nodatamsg);'||unistr('\000a')||
'      if wwv_flow.g_debug then '||unistr('\000a')||
'        wwv_flow.debug(''no data found message rendered.'');'||unistr('\000a')||
'      end if;  '||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  return null;'||unistr('\000a')||
'exception '||unistr('\000a')||
'  when others then '||unistr('\000a')||
'    begin'||unistr('\000a')||
'      apex_plugin_util.free_sql_handler('||unistr('\000a')||
'        p_sql_handler   => v_sql_handler'||unistr('\000a')||
'      ); '||unistr('\000a')||
'    exception when others then null;'||unistr('\000a')||
'   '||
' end;'||unistr('\000a')||
'    sys.htp.p(''An exception occurred - turn on debug mode to see more information.<br/> ''||v_sql);'||unistr('\000a')||
'    if wwv_flow.g_debug then '||unistr('\000a')||
'      sys.htp.p(''<pre>''||dbms_utility.format_error_stack||''</pre>'');'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    wwv_flow.debug(sqlerrm);'||unistr('\000a')||
'    wwv_flow.debug(dbms_utility.format_error_stack);        '||unistr('\000a')||
'  return null;'||unistr('\000a')||
'end alert;'
 ,p_render_function => 'alert'
 ,p_standard_attributes => 'SOURCE_SQL:SOURCE_REQUIRED'
 ,p_sql_min_column_count => 2
 ,p_sql_max_column_count => 4
 ,p_sql_examples => 'select 1 as id '||unistr('\000a')||
'     , ''mensaje'' as msj'||unistr('\000a')||
'     , ''texto del link'' as btn'||unistr('\000a')||
'     , ''url'' url'||unistr('\000a')||
'from my_alert_table'
 ,p_substitute_attributes => true
 ,p_reference_id => 199445859154296766
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<p>'||unistr('\000a')||
'	Plugin Alert.</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'	by emmanuel contreras.</p>'||unistr('\000a')||
''
 ,p_version_identifier => '1.0'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 124744124348921109 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 324189272475216528 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Habilitado S/N'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => false
 ,p_is_translatable => false
 ,p_help_text => 'Introduzca el nombre del elemento que verificara si la alerta esta habilitada o no.<br>'||unistr('\000a')||
'Recuerde que los valores validos son <strong>SI</strong> O <strong>NO</strong>'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 124744514609921109 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 324189272475216528 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Ejecutado S/N'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 30
 ,p_is_translatable => false
 ,p_help_text => 'Introduzca el nombre del ítem de aplicación donde se alojara si la alerta fue ejecutada o no.<br>'||unistr('\000a')||
'Recuerde que la asignación de valores la realizar el plugins.'
  );
null;
 
end;
/

 
begin
 
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2E6F7665726C61797B0D0A2020646973706C61793A6E6F6E653B0D0A20206261636B67726F756E643A7267626128302C302C302C302E32293B0D0A202077696474683A313030253B0D0A20206865696768743A313030253B0D0A2020706F736974696F6E';
wwv_flow_api.g_varchar2_table(2) := '3A66697865643B0D0A2020746F703A3070783B0D0A20206C6566743A3070783B0D0A20207A2D696E6465783A3939393B0D0A7D0D0A2E777261702D616C6572747B0D0A2020646973706C61793A206E6F6E653B0D0A202077696474683A36343070783B20';
wwv_flow_api.g_varchar2_table(3) := '200D0A20206865696768743A33363070783B200D0A20206261636B67726F756E643A72676261283235362C3235362C3235362C302E39293B0D0A2020706F736974696F6E3A66697865643B0D0A20207A2D696E6465783A393939393939393939393B0D0A';
wwv_flow_api.g_varchar2_table(4) := '2020746F703A3530253B0D0A20206D617267696E2D746F703A2D31333070783B0D0A20206C6566743A3530253B0D0A20206D617267696E2D6C6566743A2D33323070783B0D0A2020636F6C6F723A233333333B0D0A20202D7765626B69742D626F726465';
wwv_flow_api.g_varchar2_table(5) := '722D7261646975733A203370783B0D0A20202D6D6F7A2D626F726465722D7261646975733A203370783B0D0A2020626F726465722D7261646975733A203370783B0D0A7D0D0A2E777261702D636F6E74656E747B0D0A20202020626F726465722D626F74';
wwv_flow_api.g_varchar2_table(6) := '746F6D3A31707820736F6C696420233737373B0D0A2020202070616464696E672D626F74746F6D3A323070783B0D0A202020206D617267696E3A323070783B0D0A202020206865696768743A3730253B0D0A20202020636C6561723A626F74683B0D0A7D';
wwv_flow_api.g_varchar2_table(7) := '0D0A2E666F6F7465727B0D0A20202020626F726465723A30707820736F6C696420233333333B0D0A202020206D617267696E3A323070783B202020200D0A20202020636C6561723A626F74683B202020200D0A20202020746578742D616C69676E3A7269';
wwv_flow_api.g_varchar2_table(8) := '6768743B0D0A7D0D0A0D0A2E777261702D69636F7B0D0A20202020626F726465723A30707820736F6C696420236666663B0D0A2020202077696474683A31303070783B0D0A20202020666C6F61743A6C6566743B0D0A20202020746578742D616C69676E';
wwv_flow_api.g_varchar2_table(9) := '3A63656E7465723B0D0A20202020666F6E742D73697A653A3130656D3B0D0A20202020636F6C6F723A234630463046303B202020200D0A7D0D0A2E777261702D69636F20697B0D0A2020202077696474683A31323070783B0D0A20202020686569676874';
wwv_flow_api.g_varchar2_table(10) := '3A31323070783B0D0A20202020626F726465723A30707820736F6C69643B0D0A20202020706F736974696F6E3A6162736F6C7574653B0D0A20202020746F703A3530253B0D0A202020206D617267696E2D746F703A2D363070783B0D0A202020206C6566';
wwv_flow_api.g_varchar2_table(11) := '743A3530253B0D0A202020206D617267696E2D6C6566743A2D363070783B0D0A7D0D0A2E777261702D6C6973747B0D0A20202020626F726465723A30707820736F6C696420236666663B0D0A2020202077696474683A313030253B0D0A20202020666C6F';
wwv_flow_api.g_varchar2_table(12) := '61743A6C6566743B0D0A20202020666F6E742D73697A653A312E323530656D3B0D0A202020207A2D696E6465783A393B0D0A20202020706F736974696F6E3A72656C61746976653B0D0A7D0D0A2E777261702D6C69737420756C7B0D0A20202020776964';
wwv_flow_api.g_varchar2_table(13) := '74683A313030253B0D0A202020206D617267696E3A3070783B0D0A2020202070616464696E673A3070783B0D0A202020206C6973742D7374796C653A6E6F6E653B0D0A7D0D0A2E777261702D6C69737420756C206C697B0D0A2020202077696474683A31';
wwv_flow_api.g_varchar2_table(14) := '3030253B0D0A202020206D617267696E2D746F703A3070783B0D0A202020206D617267696E2D6C6566743A2D3770783B0D0A2020202070616464696E673A31357078203770782031357078203770783B0D0A20202020626F726465722D626F74746F6D3A';
wwv_flow_api.g_varchar2_table(15) := '31707820736F6C696420234444443B202020200D0A7D0D0A2E777261702D6C69737420756C206C693A686F7665727B0D0A20206261636B67726F756E642D636F6C6F723A236630663066303B20200D0A2020637572736F723A706F696E7465723B0D0A7D';
wwv_flow_api.g_varchar2_table(16) := '0D0A2E777261702D6C69737420756C206C6920707B0D0A202077696474683A3830253B0D0A2020626F726465723A30707820736F6C69643B0D0A2020646973706C61793A696E6C696E652D626C6F636B3B0D0A7D0D0A2E777261702D6C69737420617B0D';
wwv_flow_api.g_varchar2_table(17) := '0A202020206261636B67726F756E643A7267626128372C2035332C2038372C20302E39293B0D0A20202020626F726465723A31707820736F6C696420233037333535373B0D0A202020206D617267696E2D6C6566743A313570783B0D0A20202020706164';
wwv_flow_api.g_varchar2_table(18) := '64696E673A33707820313570783B0D0A20202020766572746963616C2D616C69676E3A746F703B0D0A20202020636F6C6F723A234630463046303B202020200D0A20202020637572736F723A706F696E7465723B0D0A20202020646973706C61793A2069';
wwv_flow_api.g_varchar2_table(19) := '6E6C696E652D626C6F636B3B0D0A20202020746578742D6465636F726174696F6E3A206E6F6E653B0D0A202020202D7765626B69742D626F726465722D7261646975733A203370783B0D0A202020202D6D6F7A2D626F726465722D7261646975733A2033';
wwv_flow_api.g_varchar2_table(20) := '70783B0D0A20202020626F726465722D7261646975733A203370783B0D0A7D0D0A2E777261702D6C69737420613A686F7665727B0D0A20202020636F6C6F723A236563663066313B0D0A202020206261636B67726F756E643A7267626128372C2035332C';
wwv_flow_api.g_varchar2_table(21) := '2038372C20302E38293B0D0A202020202D7765626B69742D7472616E736974696F6E3A206261636B67726F756E642D636F6C6F7220326D73206C696E6561723B0D0A202020202D6D6F7A2D7472616E736974696F6E3A206261636B67726F756E642D636F';
wwv_flow_api.g_varchar2_table(22) := '6C6F72203330306D73206C696E6561723B0D0A202020202D6F2D7472616E736974696F6E3A206261636B67726F756E642D636F6C6F72203330306D73206C696E6561723B0D0A202020202D6D732D7472616E736974696F6E3A206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(23) := '2D636F6C6F72203330306D73206C696E6561723B0D0A202020207472616E736974696F6E3A206261636B67726F756E642D636F6C6F72203330306D73206C696E6561723B0D0A202020207472616E736974696F6E3A20636F6C6F72203230306D73206C69';
wwv_flow_api.g_varchar2_table(24) := '6E6561723B0D0A7D0D0A0D0A2E666F6F74657220627574746F6E7B0D0A202020206261636B67726F756E643A233030616563353B0D0A20202020626F726465723A30707820736F6C696420233030616563353B0D0A2020202070616464696E673A337078';
wwv_flow_api.g_varchar2_table(25) := '20313570783B0D0A20202020636F6C6F723A234630463046303B0D0A20202020637572736F723A706F696E7465723B0D0A2020202020202D7765626B69742D626F726465722D7261646975733A203370783B0D0A20202D6D6F7A2D626F726465722D7261';
wwv_flow_api.g_varchar2_table(26) := '646975733A203370783B0D0A2020626F726465722D7261646975733A203370783B0D0A7D0D0A2E666F6F74657220627574746F6E3A686F7665727B202020200D0A202020206261636B67726F756E643A233539396562343B0D0A202020202D7765626B69';
wwv_flow_api.g_varchar2_table(27) := '742D7472616E736974696F6E3A206261636B67726F756E642D636F6C6F7220326D73206C696E6561723B0D0A202020202D6D6F7A2D7472616E736974696F6E3A206261636B67726F756E642D636F6C6F72203330306D73206C696E6561723B0D0A202020';
wwv_flow_api.g_varchar2_table(28) := '202D6F2D7472616E736974696F6E3A206261636B67726F756E642D636F6C6F72203330306D73206C696E6561723B0D0A202020202D6D732D7472616E736974696F6E3A206261636B67726F756E642D636F6C6F72203330306D73206C696E6561723B0D0A';
wwv_flow_api.g_varchar2_table(29) := '202020207472616E736974696F6E3A206261636B67726F756E642D636F6C6F72203330306D73206C696E6561723B0D0A202020207472616E736974696F6E3A20636F6C6F72203230306D73206C696E6561723B0D0A7D0D0A0D0A0D0A2E626C696E6B207B';
wwv_flow_api.g_varchar2_table(30) := '0D0A202020202D7765626B69742D616E696D6174696F6E2D6E616D653A20626C696E6B65723B0D0A202020202D7765626B69742D616E696D6174696F6E2D6475726174696F6E3A2032733B0D0A202020202D7765626B69742D616E696D6174696F6E2D74';
wwv_flow_api.g_varchar2_table(31) := '696D696E672D66756E6374696F6E3A206C696E6561723B0D0A202020202D7765626B69742D616E696D6174696F6E2D697465726174696F6E2D636F756E743A20333B0D0A202020200D0A202020202D6D6F7A2D616E696D6174696F6E2D6E616D653A2062';
wwv_flow_api.g_varchar2_table(32) := '6C696E6B65723B0D0A202020202D6D6F7A2D616E696D6174696F6E2D6475726174696F6E3A2032733B0D0A202020202D6D6F7A2D616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A206C696E6561723B0D0A202020202D6D6F7A2D616E69';
wwv_flow_api.g_varchar2_table(33) := '6D6174696F6E2D697465726174696F6E2D636F756E743A20333B0D0A202020200D0A20202020616E696D6174696F6E2D6E616D653A20626C696E6B65723B0D0A20202020616E696D6174696F6E2D6475726174696F6E3A2032733B0D0A20202020616E69';
wwv_flow_api.g_varchar2_table(34) := '6D6174696F6E2D74696D696E672D66756E6374696F6E3A206C696E6561723B0D0A20202020616E696D6174696F6E2D697465726174696F6E2D636F756E743A20333B0D0A7D0D0A0D0A402D6D6F7A2D6B65796672616D657320626C696E6B6572207B2020';
wwv_flow_api.g_varchar2_table(35) := '0D0A202020203025207B206F7061636974793A20312E303B207D0D0A20202020353025207B206F7061636974793A20302E303B207D0D0A2020202031303025207B206F7061636974793A20312E303B207D0D0A7D0D0A0D0A402D7765626B69742D6B6579';
wwv_flow_api.g_varchar2_table(36) := '6672616D657320626C696E6B6572207B20200D0A202020203025207B206F7061636974793A20312E303B207D0D0A20202020353025207B206F7061636974793A20302E303B207D0D0A2020202031303025207B206F7061636974793A20312E303B207D0D';
wwv_flow_api.g_varchar2_table(37) := '0A7D0D0A0D0A406B65796672616D657320626C696E6B6572207B20200D0A202020203025207B206F7061636974793A20312E303B207D0D0A20202020353025207B206F7061636974793A20302E303B207D0D0A2020202031303025207B206F7061636974';
wwv_flow_api.g_varchar2_table(38) := '793A20312E303B207D0D0A7D';
null;
 
end;
/

 
begin
 
wwv_flow_api.create_plugin_file (
  p_id => 124745107834921110 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 324189272475216528 + wwv_flow_api.g_id_offset
 ,p_file_name => 'alert.css'
 ,p_mime_type => 'text/css'
 ,p_file_content => wwv_flow_api.g_varchar2_table
  );
null;
 
end;
/

 
begin
 
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '66756E6374696F6E206F70656E416C65727428297B0D0A092428222E6F7665726C617922292E66616465496E28293B0D0A092428222E777261702D616C65727422292E66616465496E28293B0D0A7D0D0A0D0A2428646F63756D656E74292E6F6E282263';
wwv_flow_api.g_varchar2_table(2) := '6C69636B222C20222E6F7665726C6179222C202866756E6374696F6E286529207B202020200D0A092428222E6F7665726C617922292E666164654F757428293B0D0A092428222E777261702D616C65727422292E666164654F757428293B0D0A7D29293B';
wwv_flow_api.g_varchar2_table(3) := '0D0A0D0A2428646F63756D656E74292E6F6E2822636C69636B222C20222E62746E2D636572726172222C202866756E6374696F6E286529207B202020200D0A092428222E6F7665726C617922292E666164654F757428293B0D0A092428222E777261702D';
wwv_flow_api.g_varchar2_table(4) := '616C65727422292E666164654F757428293B0D0A0972657475726E2066616C73653B0D0A7D29293B';
null;
 
end;
/

 
begin
 
wwv_flow_api.create_plugin_file (
  p_id => 124745531700921110 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 324189272475216528 + wwv_flow_api.g_id_offset
 ,p_file_name => 'alert.js'
 ,p_mime_type => 'application/javascript'
 ,p_file_content => wwv_flow_api.g_varchar2_table
  );
null;
 
end;
/

--application/shared_components/plugins/region_type/com_oracle_apex_big_value_list
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 810415938330741367 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_name => 'COM.ORACLE.APEX.BIG_VALUE_LIST'
 ,p_display_name => 'Big Value List'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_plsql_code => 
'function render ('||unistr('\000a')||
'    p_region              in apex_plugin.t_region,'||unistr('\000a')||
'    p_plugin              in apex_plugin.t_plugin,'||unistr('\000a')||
'    p_is_printer_friendly in boolean )'||unistr('\000a')||
'    return apex_plugin.t_region_render_result'||unistr('\000a')||
'is'||unistr('\000a')||
'    -- It''s better to have named variables instead of using the generic ones,'||unistr('\000a')||
'    -- makes the code more readable. We are using the same defaults for the'||unistr('\000a')||
'    -- required attributes as in the p'||
'lug-in attribute configuration, because'||unistr('\000a')||
'    -- they can still be null. Keep them in sync!'||unistr('\000a')||
'    c_label_column      constant varchar2(255) := p_region.attribute_01;'||unistr('\000a')||
'    c_value_column      constant varchar2(255) := p_region.attribute_02;'||unistr('\000a')||
'    c_percent_column    constant varchar2(255) := p_region.attribute_03;'||unistr('\000a')||
'    c_link_target       constant varchar2(255) := p_region.attribute_04;'||unistr('\000a')||
'    c_number_of_co'||
'lumns constant number        := to_number(p_region.attribute_05);'||unistr('\000a')||
'    c_chart_size        constant varchar2(1)   := p_region.attribute_06;'||unistr('\000a')||
''||unistr('\000a')||
'    l_label_column_no   pls_integer;'||unistr('\000a')||
'    l_value_column_no   pls_integer;'||unistr('\000a')||
'    l_percent_column_no pls_integer;'||unistr('\000a')||
'    l_column_value_list apex_plugin_util.t_column_value_list2;'||unistr('\000a')||
'    '||unistr('\000a')||
'    l_label             varchar2(4000);'||unistr('\000a')||
'    l_value             varchar2(4000);'||unistr('\000a')||
' '||
'   l_percent           number;'||unistr('\000a')||
'    l_url               varchar2(4000);'||unistr('\000a')||
'    l_class             varchar2(255);'||unistr('\000a')||
'begin'||unistr('\000a')||
'    -- Read the data based on the region source query'||unistr('\000a')||
'    l_column_value_list := apex_plugin_util.get_data2 ('||unistr('\000a')||
'                               p_sql_statement  => p_region.source,'||unistr('\000a')||
'                               p_min_columns    => 2,'||unistr('\000a')||
'                               p_max_columns    => n'||
'ull,'||unistr('\000a')||
'                               p_component_name => p_region.name );'||unistr('\000a')||
''||unistr('\000a')||
'    -- Get the actual column# for faster access and also verify that the data type'||unistr('\000a')||
'    -- of the column matches with what we are looking for'||unistr('\000a')||
'    l_label_column_no   := apex_plugin_util.get_column_no ('||unistr('\000a')||
'                               p_attribute_label   => ''Label Column'','||unistr('\000a')||
'                               p_column_alias      => c'||
'_label_column,'||unistr('\000a')||
'                               p_column_value_list => l_column_value_list,'||unistr('\000a')||
'                               p_is_required       => true,'||unistr('\000a')||
'                               p_data_type         => apex_plugin_util.c_data_type_varchar2 );'||unistr('\000a')||
'                                      '||unistr('\000a')||
'    l_value_column_no   := apex_plugin_util.get_column_no ('||unistr('\000a')||
'                               p_attribute_label   => ''V'||
'alue Column'','||unistr('\000a')||
'                               p_column_alias      => c_value_column,'||unistr('\000a')||
'                               p_column_value_list => l_column_value_list,'||unistr('\000a')||
'                               p_is_required       => true,'||unistr('\000a')||
'                               p_data_type         => apex_plugin_util.c_data_type_varchar2 );'||unistr('\000a')||
'                                      '||unistr('\000a')||
'    l_percent_column_no := apex_plugin_util.get'||
'_column_no ('||unistr('\000a')||
'                             p_attribute_label   => ''Percent Column'','||unistr('\000a')||
'                             p_column_alias      => c_percent_column,'||unistr('\000a')||
'                             p_column_value_list => l_column_value_list,'||unistr('\000a')||
'                             p_is_required       => false,'||unistr('\000a')||
'                             p_data_type         => apex_plugin_util.c_data_type_number );'||unistr('\000a')||
''||unistr('\000a')||
'    -- CSS for Big Valu'||
'e List'||unistr('\000a')||
'    apex_css.add_file ('||unistr('\000a')||
'        p_name      => ''com_oracle_apex_big_value_list'','||unistr('\000a')||
'        p_directory => p_plugin.file_prefix );'||unistr('\000a')||
''||unistr('\000a')||
'    -- Start the list'||unistr('\000a')||
'    sys.htp.p('||unistr('\000a')||
'        ''<ul class="aChartList'' ||'||unistr('\000a')||
'        case when c_chart_size = ''S'' then '' smallChart'' end ||'||unistr('\000a')||
'        ''">'');'||unistr('\000a')||
''||unistr('\000a')||
'    -- It''s time to emit the selected rows'||unistr('\000a')||
'    for l_row_num in 1 .. l_column_value_list(1).value_list.count loop'||
''||unistr('\000a')||
'        begin'||unistr('\000a')||
'            -- Set the column values of our current row so that apex_plugin_util.replace_substitutions'||unistr('\000a')||
'            -- can do substitutions for columns contained in the region source query.'||unistr('\000a')||
'            apex_plugin_util.set_component_values ('||unistr('\000a')||
'                p_column_value_list => l_column_value_list,'||unistr('\000a')||
'                p_row_num           => l_row_num );'||unistr('\000a')||
''||unistr('\000a')||
'            -- get the label'||unistr('\000a')||
'  '||
'          l_label := apex_plugin_util.escape ('||unistr('\000a')||
'                           apex_plugin_util.get_value_as_varchar2 ('||unistr('\000a')||
'                               p_data_type => l_column_value_list(l_label_column_no).data_type,'||unistr('\000a')||
'                               p_value     => l_column_value_list(l_label_column_no).value_list(l_row_num) ),'||unistr('\000a')||
'                           p_region.escape_output );'||unistr('\000a')||
''||unistr('\000a')||
'            -- get the va'||
'lue'||unistr('\000a')||
'            l_value := apex_plugin_util.escape ('||unistr('\000a')||
'                           apex_plugin_util.get_value_as_varchar2 ('||unistr('\000a')||
'                               p_data_type => l_column_value_list(l_value_column_no).data_type,'||unistr('\000a')||
'                               p_value     => l_column_value_list(l_value_column_no).value_list(l_row_num) ),'||unistr('\000a')||
'                           p_region.escape_output );'||unistr('\000a')||
''||unistr('\000a')||
'            -- get '||
'percent'||unistr('\000a')||
'            if l_percent_column_no is not null then'||unistr('\000a')||
'                l_percent := l_column_value_list(l_percent_column_no).value_list(l_row_num).number_value;'||unistr('\000a')||
'            end if;'||unistr('\000a')||
''||unistr('\000a')||
'            -- get the link target if it does exist'||unistr('\000a')||
'            if c_link_target is not null then'||unistr('\000a')||
'                l_url := wwv_flow_utilities.prepare_url ('||unistr('\000a')||
'                             apex_plugin_util.replace_sub'||
'stitutions ('||unistr('\000a')||
'                                 p_value  => c_link_target,'||unistr('\000a')||
'                                 p_escape => false ));'||unistr('\000a')||
'            end if;'||unistr('\000a')||
''||unistr('\000a')||
'            -- Calculate the class names based on different settings'||unistr('\000a')||
'            if l_percent is null then'||unistr('\000a')||
'                l_class := ''aNumber'';'||unistr('\000a')||
'            else'||unistr('\000a')||
'                l_class := ''aBarChart'';'||unistr('\000a')||
'            end if;'||unistr('\000a')||
'            '||unistr('\000a')||
'            if c'||
'_number_of_columns > 1 then'||unistr('\000a')||
'                l_class := l_class || '' aGrid col_'' || c_number_of_columns;'||unistr('\000a')||
'            end if;'||unistr('\000a')||
'            '||unistr('\000a')||
'            if   c_number_of_columns = 1'||unistr('\000a')||
'              or mod(l_row_num, c_number_of_columns) = 1'||unistr('\000a')||
'            then'||unistr('\000a')||
'                l_class := l_class || '' col_start'';'||unistr('\000a')||
'            end if;'||unistr('\000a')||
''||unistr('\000a')||
'            -- Time to emit the row data in a list entry tag'||unistr('\000a')||
'            sy'||
's.htp.p(''<li class="'' || l_class || ''">'');'||unistr('\000a')||
'            '||unistr('\000a')||
'            if l_url is not null then'||unistr('\000a')||
'                sys.htp.p(''<a href="'' || apex_escape.html_attribute(l_url) || ''">'');'||unistr('\000a')||
'            end if;'||unistr('\000a')||
'            '||unistr('\000a')||
'            sys.htp.p(''<span class="uValue">'');'||unistr('\000a')||
'            if l_percent is null then'||unistr('\000a')||
'                sys.htp.p(l_value);'||unistr('\000a')||
'            else'||unistr('\000a')||
'                sys.htp.p(''<span class="uBarConta'||
'iner"><span class="uBarLabel">'' || l_value || ''</span><span class="uBarWidth" style="width: '' || trunc(l_percent) || ''%;"></span></span>'');'||unistr('\000a')||
'            end if;'||unistr('\000a')||
'            sys.htp.p(''</span>'');'||unistr('\000a')||
'                        '||unistr('\000a')||
'            sys.htp.p(''<span class="uLabel">'' || l_label || ''</span>'');'||unistr('\000a')||
''||unistr('\000a')||
'            sys.htp.p('||unistr('\000a')||
'                case when l_url is not null then ''</a>'' end ||'||unistr('\000a')||
'                ''</li>'||
''' );'||unistr('\000a')||
''||unistr('\000a')||
'            apex_plugin_util.clear_component_values;'||unistr('\000a')||
'        exception when others then'||unistr('\000a')||
'            apex_plugin_util.clear_component_values;'||unistr('\000a')||
'            raise;'||unistr('\000a')||
'        end;'||unistr('\000a')||
'    end loop;'||unistr('\000a')||
''||unistr('\000a')||
'    sys.htp.p(''</ul>'');'||unistr('\000a')||
''||unistr('\000a')||
'    return null;'||unistr('\000a')||
''||unistr('\000a')||
'end render;'||unistr('\000a')||
''
 ,p_render_function => 'render'
 ,p_standard_attributes => 'SOURCE_SQL:SOURCE_REQUIRED:ESCAPE_OUTPUT'
 ,p_sql_min_column_count => 2
 ,p_sql_examples => '<pre>'||unistr('\000a')||
'select ''Open''               as label,'||unistr('\000a')||
'       to_char(320,''9G990'') as value,'||unistr('\000a')||
'       13                   as percent'||unistr('\000a')||
'  from dual'||unistr('\000a')||
' union all'||unistr('\000a')||
'select ''Closed''             as label,'||unistr('\000a')||
'       to_char(87,''9G990'')  as value,'||unistr('\000a')||
'       70                   as percent'||unistr('\000a')||
'  from dual'||unistr('\000a')||
'</pre>'
 ,p_substitute_attributes => false
 ,p_reference_id => 1841129043527665703
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '1.0'
 ,p_about_url => 'http://apex.oracle.com/plugins'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 939109129434220252 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 810415938330741367 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Label Column'
 ,p_attribute_type => 'REGION SOURCE COLUMN'
 ,p_is_required => true
 ,p_column_data_types => 'VARCHAR2'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 939109519162220252 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 810415938330741367 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Value Column'
 ,p_attribute_type => 'REGION SOURCE COLUMN'
 ,p_is_required => true
 ,p_column_data_types => 'VARCHAR2'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 939109938498220253 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 810415938330741367 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Percent Column'
 ,p_attribute_type => 'REGION SOURCE COLUMN'
 ,p_is_required => false
 ,p_column_data_types => 'NUMBER'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 939110307879220254 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 810415938330741367 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Link Target'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 93
 ,p_max_length => 255
 ,p_is_translatable => false
 ,p_help_text => '<p>'||unistr('\000a')||
'Specifies the URL to a target page that is used if a user clicks on an entry.'||unistr('\000a')||
'</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'To reference column values of your SQL statement use substitution syntax.'||unistr('\000a')||
'</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'Example 1: URL to navigate to page 10 and set P10_EMPNO to the EMPNO value of the clicked entry.'||unistr('\000a')||
'<pre>'||unistr('\000a')||
'f?p=&amp;APP_ID.:10:&amp;APP_SESSION.::&amp;DEBUG.:RP,10:P10_EMPNO:&amp;EMPNO.'||unistr('\000a')||
'</pre>'||unistr('\000a')||
'</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'Example 2: Display the EMPNO value of the clicked entry in a JavaScript alert'||unistr('\000a')||
'<pre>'||unistr('\000a')||
'javascript:alert(''current empno: &amp;EMPNO.'');'||unistr('\000a')||
'</pre>'||unistr('\000a')||
'</p>'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 939110720575220254 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 810415938330741367 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 5
 ,p_display_sequence => 50
 ,p_prompt => 'Number of Columns'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => '1'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 939111126006220254 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 939110720575220254 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => '1'
 ,p_return_value => '1'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 939111638641220254 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 939110720575220254 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => '2'
 ,p_return_value => '2'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 939112116192220255 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 939110720575220254 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => '3'
 ,p_return_value => '3'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 939112631137220255 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 939110720575220254 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 40
 ,p_display_value => '4'
 ,p_return_value => '4'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 939113139033220255 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 810415938330741367 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => 'Chart Size'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'B'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 939113526365220255 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 939113139033220255 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Big'
 ,p_return_value => 'B'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 939114011515220256 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 939113139033220255 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Small'
 ,p_return_value => 'S'
  );
null;
 
end;
/

 
begin
 
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A0A202A204269672056616C7565204C69737420506C75672D696E2076312E30202D20687474703A2F2F617065782E6F7261636C652E636F6D2F706C7567696E730A202A0A202A204475616C206C6963656E73656420756E64657220746865204D4954';
wwv_flow_api.g_varchar2_table(2) := '20616E642047504C206C6963656E7365733A0A202A202020687474703A2F2F7777772E6F70656E736F757263652E6F72672F6C6963656E7365732F6D69742D6C6963656E73652E7068700A202A202020687474703A2F2F7777772E676E752E6F72672F6C';
wwv_flow_api.g_varchar2_table(3) := '6963656E7365732F67706C2E68746D6C0A202A2F0A0A202F2A20436C656172206143686172744C697374202A2F0A756C2E6143686172744C697374207B0A20206C6973742D7374796C653A206E6F6E65206F757473696465206E6F6E653B0A20206D6172';
wwv_flow_api.g_varchar2_table(4) := '67696E3A20302021696D706F7274616E743B0A202070616464696E673A20303B0A7D0A756C2E6143686172744C6973743A6265666F72652C200A756C2E6143686172744C6973743A6166746572207B0A2020636F6E74656E743A202220223B0A20206469';
wwv_flow_api.g_varchar2_table(5) := '73706C61793A20626C6F636B3B0A20206865696768743A20303B0A20206F766572666C6F773A2068696464656E3B0A7D0A756C2E6143686172744C6973743A6166746572207B0A2020636C6561723A20626F74683B0A7D0A0A2F2A20536D616C6C204368';
wwv_flow_api.g_varchar2_table(6) := '617274202A2F0A756C2E6143686172744C6973742E736D616C6C4368617274207B0A2020626F726465722D626F74746F6D3A2031707820736F6C696420234430443044303B0A7D0A756C2E6143686172744C6973742E736D616C6C4368617274206C692E';
wwv_flow_api.g_varchar2_table(7) := '614E756D626572202E7556616C7565207B0A2020666F6E742D73697A653A20313470783B0A20206C696E652D6865696768743A20323470783B0A7D0A756C2E6143686172744C6973742E736D616C6C4368617274206C692E614261724368617274202E75';
wwv_flow_api.g_varchar2_table(8) := '426172436F6E7461696E6572207B0A20206865696768743A20333270783B0A7D0A756C2E6143686172744C6973742E736D616C6C4368617274206C692E614261724368617274202E75426172436F6E7461696E6572202E754261725769647468207B0A20';
wwv_flow_api.g_varchar2_table(9) := '206865696768743A20333270783B0A7D0A756C2E6143686172744C6973742E736D616C6C4368617274206C692E614261724368617274202E75426172436F6E7461696E6572202E754261724C6162656C207B0A2020666F6E742D73697A653A2031347078';
wwv_flow_api.g_varchar2_table(10) := '3B0A20206C696E652D6865696768743A20333270783B0A7D0A2F2A756C2E6143686172744C6973742E736D616C6C4368617274206C692E614261724368617274202E75426172436F6E7461696E6572207B0A202070616464696E673A2038707820303B0A';
wwv_flow_api.g_varchar2_table(11) := '7D2A2F0A756C2E6143686172744C6973742E736D616C6C4368617274206C692E614261724368617274202E75426172436F6E7461696E6572202E754261725769647468207B0A2020666F6E742D73697A653A20313270783B0A2020666F6E742D77656967';
wwv_flow_api.g_varchar2_table(12) := '68743A20626F6C643B0A7D0A756C2E6143686172744C6973742E736D616C6C4368617274206C692E614261724368617274202E754C6162656C207B0A2020666F6E742D73697A653A20313470783B0A2020666F6E742D7765696768743A20626F6C643B0A';
wwv_flow_api.g_varchar2_table(13) := '202070616464696E673A2038707820303B0A7D0A0A2F2A204368617274205374796C6573202A2F0A756C2E6143686172744C697374206C69207B0A2020646973706C61793A20626C6F636B3B0A20206D617267696E3A20313670783B0A7D0A756C2E6143';
wwv_flow_api.g_varchar2_table(14) := '686172744C697374206C69202E7556616C7565207B0A20206261636B67726F756E642D636F6C6F723A20234536454546413B0A20206261636B67726F756E642D696D6167653A206C696E6561722D6772616469656E7428234630463446412C2023453645';
wwv_flow_api.g_varchar2_table(15) := '454641293B0A2020626F726465722D626F74746F6D3A2031707820736F6C696420234230424443433B0A2020626F726465722D7261646975733A2032707820327078203020303B0A2020636F6C6F723A20233430343034303B0A2020646973706C61793A';
wwv_flow_api.g_varchar2_table(16) := '20626C6F636B3B0A202070616464696E673A203136707820303B0A2020706F736974696F6E3A2072656C61746976653B0A2020746578742D616C69676E3A2063656E7465723B0A2020746578742D736861646F773A203020302031307078207267626128';
wwv_flow_api.g_varchar2_table(17) := '3235352C203235352C203235352C20302E3935293B0A7D0A756C2E6143686172744C697374206C69202E7556616C75653A61667465722C200A756C2E6143686172744C697374206C69202E7556616C75653A6265666F7265207B0A2020626F726465723A';
wwv_flow_api.g_varchar2_table(18) := '206D656469756D20736F6C6964207472616E73706172656E743B0A2020636F6E74656E743A202220223B0A20206865696768743A20303B0A2020706F696E7465722D6576656E74733A206E6F6E653B0A2020706F736974696F6E3A206162736F6C757465';
wwv_flow_api.g_varchar2_table(19) := '3B0A2020746F703A20313030253B0A202077696474683A20303B0A7D0A756C2E6143686172744C697374206C69202E7556616C75653A6166746572207B0A2020626F726465722D746F702D636F6C6F723A20234536454546413B0A2020626F726465722D';
wwv_flow_api.g_varchar2_table(20) := '77696474683A203870783B0A20206C6566743A203530253B0A20206D617267696E2D6C6566743A202D3870783B0A7D0A756C2E6143686172744C697374206C69202E7556616C75653A6265666F7265207B0A2020626F726465722D746F702D636F6C6F72';
wwv_flow_api.g_varchar2_table(21) := '3A20234230424443433B0A2020626F726465722D77696474683A203970783B0A20206C6566743A203530253B0A20206D617267696E2D6C6566743A202D3970783B0A7D0A756C2E6143686172744C697374206C692061207B0A20202D6D6F7A2D626F7264';
wwv_flow_api.g_varchar2_table(22) := '65722D626F74746F6D2D636F6C6F72733A206E6F6E653B0A20202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B0A20202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B0A20202D6D6F7A2D626F';
wwv_flow_api.g_varchar2_table(23) := '726465722D746F702D636F6C6F72733A206E6F6E653B0A20206261636B67726F756E642D636F6C6F723A20234630463446413B0A2020626F726465722D636F6C6F723A2023423042444343202342304244434320233838393641393B0A2020626F726465';
wwv_flow_api.g_varchar2_table(24) := '722D696D6167653A206E6F6E653B0A2020626F726465722D7261646975733A203370782033707820337078203370783B0A2020626F726465722D7374796C653A20736F6C69643B0A2020626F726465722D77696474683A203170783B0A2020646973706C';
wwv_flow_api.g_varchar2_table(25) := '61793A20626C6F636B3B0A202070616464696E673A20303B0A2020746578742D6465636F726174696F6E3A206E6F6E653B0A20207472616E736974696F6E3A20626F782D736861646F7720302E317320656173652030733B0A7D0A756C2E614368617274';
wwv_flow_api.g_varchar2_table(26) := '4C697374206C6920613A686F766572207B0A2020626F782D736861646F773A20302030203570782032707820726762612835362C203132372C203231342C20302E32293B0A7D0A756C2E6143686172744C697374206C6920613A686F766572207370616E';
wwv_flow_api.g_varchar2_table(27) := '207B0A2020636F6C6F723A20233335363641363B0A7D0A756C2E6143686172744C697374206C69202E754C6162656C207B0A2020626F726465722D746F703A2031707820736F6C69642072676261283235352C203235352C203235352C20302E3635293B';
wwv_flow_api.g_varchar2_table(28) := '0A2020636F6C6F723A20233430343034303B0A2020646973706C61793A20626C6F636B3B0A2020666F6E742D73697A653A20313470783B0A2020666F6E742D7765696768743A20626F6C643B0A20206C696E652D6865696768743A20323070783B0A2020';
wwv_flow_api.g_varchar2_table(29) := '70616464696E673A2038707820303B0A2020746578742D616C69676E3A2063656E7465723B0A7D0A756C2E6143686172744C697374206C692E614E756D626572202E7556616C7565207B0A2020666F6E742D73697A653A20333270783B0A20206C696E65';
wwv_flow_api.g_varchar2_table(30) := '2D6865696768743A20333270783B0A7D0A756C2E6143686172744C697374206C692E614261724368617274202E7556616C7565207B0A202070616464696E673A203870783B0A7D0A756C2E6143686172744C697374206C692E614261724368617274202E';
wwv_flow_api.g_varchar2_table(31) := '75426172436F6E7461696E6572207B0A20206261636B67726F756E642D636F6C6F723A20234646464646463B0A2020626F726465722D7261646975733A203370782033707820337078203370783B0A2020626F782D736861646F773A2030203020302031';
wwv_flow_api.g_varchar2_table(32) := '7078207267626128302C20302C20302C20302E32352920696E7365742C20302031707820317078207267626128302C20302C20302C20302E31352920696E7365743B0A2020646973706C61793A20626C6F636B3B0A20206865696768743A20343870783B';
wwv_flow_api.g_varchar2_table(33) := '0A20206D617267696E3A2030203870783B0A2020706F736974696F6E3A2072656C61746976653B0A7D0A756C2E6143686172744C697374206C692E614261724368617274202E754261724C6162656C207B0A2020636F6C6F723A20233430343034303B0A';
wwv_flow_api.g_varchar2_table(34) := '2020646973706C61793A20626C6F636B3B0A2020666F6E742D73697A653A20323470783B0A2020666F6E742D7374796C653A206E6F726D616C3B0A2020666F6E742D7765696768743A206E6F726D616C3B0A20206C696E652D6865696768743A20343870';
wwv_flow_api.g_varchar2_table(35) := '783B0A2020706F736974696F6E3A206162736F6C7574653B0A2020746578742D616C69676E3A2063656E7465723B0A2020746578742D736861646F773A2030203020313070782072676261283235352C203235352C203235352C20302E3935293B0A2020';
wwv_flow_api.g_varchar2_table(36) := '77696474683A20313030253B0A7D0A756C2E6143686172744C697374206C692E614261724368617274202E754261725769647468207B0A20206261636B67726F756E642D636F6C6F723A20233943424446313B0A20206261636B67726F756E642D696D61';
wwv_flow_api.g_varchar2_table(37) := '67653A206C696E6561722D6772616469656E7428234331443846372C2023394342444631293B0A2020626F726465722D7261646975733A203370782033707820337078203370783B0A2020626F782D736861646F773A2030203020302031707820233838';
wwv_flow_api.g_varchar2_table(38) := '3936413920696E7365742C20302032707820302072676261283235352C203235352C203235352C20302E36352920696E7365743B0A2020646973706C61793A20626C6F636B3B0A20206865696768743A20343870783B0A7D0A0A0A0A2F2A204772696420';
wwv_flow_api.g_varchar2_table(39) := '2A2F0A2E6143686172744C697374206C692E6147726964207B0A2020666C6F61743A206C6566743B0A2020636C6561723A206E6F6E653B0A20206D617267696E3A20303B0A7D0A2E61477269642E636F6C5F31207B0A202077696474683A20313030253B';
wwv_flow_api.g_varchar2_table(40) := '0A7D0A2E61477269642E636F6C5F32207B0A202077696474683A203530253B0A7D0A2E61477269642E636F6C5F33207B0A202077696474683A2033332E3333253B0A7D0A2E61477269642E636F6C5F325F33207B0A202077696474683A2036362E363625';
wwv_flow_api.g_varchar2_table(41) := '3B0A7D0A2E61477269642E636F6C5F34207B0A202077696474683A203235253B0A7D0A2F2A20536D616C6C65722077696474687320666F72204945202A2F0A2E696537207B0A20202E61477269642E636F6C5F31207B0A2020202077696474683A203939';
wwv_flow_api.g_varchar2_table(42) := '2E35253B0A20207D0A20202E61477269642E636F6C5F32207B0A2020202077696474683A2034392E35253B0A20207D0A20202E61477269642E636F6C5F33207B0A2020202077696474683A2033322E3733253B0A20207D0A20202E61477269642E636F6C';
wwv_flow_api.g_varchar2_table(43) := '5F325F33207B0A2020202077696474683A2036352E3636253B0A20207D0A20202E61477269642E636F6C5F34207B0A2020202077696474683A2032342E35253B0A20207D0A7D0A2E61477269642E636F6C5F7374617274207B0A2020636C6561723A2062';
wwv_flow_api.g_varchar2_table(44) := '6F74683B0A7D0A0A2E61477269642E636F6C5F66756C6C207B0A202077696474683A20313030253B0A7D0A';
null;
 
end;
/

 
begin
 
wwv_flow_api.create_plugin_file (
  p_id => 939114934069220268 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 810415938330741367 + wwv_flow_api.g_id_offset
 ,p_file_name => 'com_oracle_apex_big_value_list.css'
 ,p_mime_type => 'text/css'
 ,p_file_content => wwv_flow_api.g_varchar2_table
  );
null;
 
end;
/

prompt  ...data loading
--
--application/deployment/definition
prompt  ...application deployment
--
 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
begin
s := null;
wwv_flow_api.create_install (
  p_id => 77195826649146470 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_include_in_export_yn => 'Y',
  p_deinstall_script_clob => s,
  p_deinstall_message=> '');
end;
 
 
end;
/

--application/deployment/install
prompt  ...application install scripts
--
--application/deployment/checks
prompt  ...application deployment checks
--
 
begin
 
null;
 
end;
/

--application/deployment/buildoptions
prompt  ...application deployment build options
--
 
begin
 
null;
 
end;
/

prompt  ...post import process
 
begin
 
wwv_flow_api.post_import_process(p_flow_id => wwv_flow.g_flow_id);
null;
 
end;
/

--application/end_environment
commit;
commit;
begin
execute immediate 'begin sys.dbms_session.set_nls( param => ''NLS_NUMERIC_CHARACTERS'', value => '''''''' || replace(wwv_flow_api.g_nls_numeric_chars,'''''''','''''''''''') || ''''''''); end;';
end;
/
set verify on
set feedback on
set define on
prompt  ...done
