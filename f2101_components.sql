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
--   Date and Time:   15:21 Martes Marzo 21, 2017
--   Exported By:     CTISSERA
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     LIST: Menu Tramites Detalle Proveedor
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
 
 
prompt Component Export: LIST 15863723734380646
 
prompt  ...lists
--
 
begin
 
wwv_flow_api.create_list (
  p_id=> 15863723734380646 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Menu Tramites Detalle Proveedor',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 15863928121380663 + wwv_flow_api.g_id_offset,
  p_list_id=> 15863723734380646 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Cambiar Datos Generales',
  p_list_item_link_target=> 'f?p=&APP_ID.:214:&SESSION.::&DEBUG.:214,215,216:P214_COMPRV_ID:&P251_ID.:',
  p_list_item_icon=> 'menu/pt_breadcrumb_20.png',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 17655815020228060+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 15864219229380669 + wwv_flow_api.g_id_offset,
  p_list_id=> 15863723734380646 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>20,
  p_list_item_link_text=> 'Cambiar Nombre/Raz.Soc.',
  p_list_item_link_target=> 'f?p=&APP_ID.:220:&SESSION.::&DEBUG.:RP,220,221,216:P220_COMPRV_ID:&P251_ID.:',
  p_list_item_icon=> 'menu/pt_breadcrumb_20.png',
  p_list_item_disp_cond_type=> 'NEVER',
  p_list_item_disp_condition=> '',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 17655927487231604+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 366196322677000604 + wwv_flow_api.g_id_offset,
  p_list_id=> 15863723734380646 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>25,
  p_list_item_link_text=> 'Cambiar Nombre/Raz.Soc.',
  p_list_item_link_target=> 'f?p=&APP_ID.:3000:&SESSION.::&DEBUG.:RP,3000,3002,3004:P3000_COMPRV_ID:&P251_ID.:',
  p_list_item_icon=> 'menu/pt_breadcrumb_20.png',
  p_list_item_disp_cond_type=> 'FUNCTION_BODY',
  p_list_item_disp_condition=> 'declare'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_comprt is'||unistr('\000a')||
'   select *'||unistr('\000a')||
'   from com_proveedores_tipos_v'||unistr('\000a')||
'   where id = :P251_COMPRT_ID;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_segpfl is'||unistr('\000a')||
'   select *'||unistr('\000a')||
'   from seg_perfiles'||unistr('\000a')||
'   where codigo in (''AREA_CONTROL_GASTO_INFORMATICA'',''AREA_CONTROL_DOCUMENTACION_PE'',''AREA_JEFATURA'',''AREA_PROVEEDORES_OBRA_PUBLICA'',''AREA_PROVEEDORES_ESTADO'');'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_segusu is'||unistr('\000a')||
'   select *'||unistr('\000a')||
'   from seg_usuarios'||unistr('\000a')||
'   where usuario = v(''APP_USER'');'||unistr('\000a')||
'   --'||unistr('\000a')||
'   cursor cr_segpus (p_segusu_id number, p_segpfl_id number) is'||unistr('\000a')||
'   select *'||unistr('\000a')||
'   from seg_perfiles_usuarios'||unistr('\000a')||
'   where segusu_id = p_segusu_id'||unistr('\000a')||
'   and segpfl_id = p_segpfl_id;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   v_segusu  seg_usuarios%rowtype;'||unistr('\000a')||
'   v_perfil  boolean := false;'||unistr('\000a')||
'   --'||unistr('\000a')||
'begin'||unistr('\000a')||
''||unistr('\000a')||
'   open cr_segusu;'||unistr('\000a')||
'   fetch cr_segusu into v_segusu;'||unistr('\000a')||
'   close cr_segusu;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   for v_segpfl in cr_segpfl loop'||unistr('\000a')||
'      --'||unistr('\000a')||
'      for v_segpus in cr_segpus(v_segusu.id, v_segpfl.id) loop'||unistr('\000a')||
'         v_perfil := true;'||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      --'||unistr('\000a')||
'   end loop;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   for v_comprt in cr_comprt loop'||unistr('\000a')||
'      --'||unistr('\000a')||
'      if v_comprt.codigo = ''FIS'' and v_perfil = false then'||unistr('\000a')||
'         return false;'||unistr('\000a')||
'      else'||unistr('\000a')||
'         return true;'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      --'||unistr('\000a')||
'   end loop;'||unistr('\000a')||
'   --'||unistr('\000a')||
'   return true;'||unistr('\000a')||
''||unistr('\000a')||
'end;'||unistr('\000a')||
'',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 17655927487231604+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 15865112830415374 + wwv_flow_api.g_id_offset,
  p_list_id=> 15863723734380646 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>30,
  p_list_item_link_text=> 'Cambiar Dom. Legal',
  p_list_item_link_target=> 'f?p=&APP_ID.:229:&SESSION.::&DEBUG.:RP,229,230,216:P229_COMPRV_ID:&P251_ID.:',
  p_list_item_icon=> 'menu/pt_breadcrumb_20.png',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 17659604761234576+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 15865300494421218 + wwv_flow_api.g_id_offset,
  p_list_id=> 15863723734380646 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>40,
  p_list_item_link_text=> 'Cambiar Dom. Comercial',
  p_list_item_link_target=> 'f?p=&APP_ID.:227:&SESSION.::&DEBUG.:RP,227,228,216:P227_COMPRV_ID:&P251_ID.:',
  p_list_item_icon=> 'menu/pt_breadcrumb_20.png',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 17659717228238162+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 15865516424425869 + wwv_flow_api.g_id_offset,
  p_list_id=> 15863723734380646 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>50,
  p_list_item_link_text=> 'Gestionar &P1_COMETQ_RUB.',
  p_list_item_link_target=> 'f?p=&APP_ID.:217:&SESSION.::&DEBUG.:RP,217,218,216:P217_COMPRV_ID:&P251_ID.:',
  p_list_item_icon=> 'menu/pt_breadcrumb_20.png',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 17661730734241988+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 15865724735428185 + wwv_flow_api.g_id_offset,
  p_list_id=> 15863723734380646 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>60,
  p_list_item_link_text=> 'Alta/Baja &P1_COMETQ_PRS.',
  p_list_item_link_target=> 'f?p=&APP_ID.:231:&SESSION.::&DEBUG.:231:P231_COMPRV_ID:&P251_ID.:',
  p_list_item_icon=> 'menu/pt_breadcrumb_20.png',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 17653600905205069+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 15866131661430210 + wwv_flow_api.g_id_offset,
  p_list_id=> 15863723734380646 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>70,
  p_list_item_link_text=> 'Cambiar Datos &P1_COMETQ_PRS.',
  p_list_item_link_target=> 'f?p=&APP_ID.:224:&SESSION.::&DEBUG.:RP,224,225,216:P224_COMPRV_ID,P224_OPERACION:&P251_ID.,ACDR:',
  p_list_item_icon=> 'menu/pt_breadcrumb_20.png',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 17655704977225137+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 15866404780431907 + wwv_flow_api.g_id_offset,
  p_list_id=> 15863723734380646 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>80,
  p_list_item_link_text=> 'Cambiar e-mail &P1_COMETQ_PRS.',
  p_list_item_link_target=> 'f?p=&APP_ID.:224:&SESSION.::&DEBUG.:RP,224,225,216:P224_COMPRV_ID,P224_OPERACION:&P251_ID.,ACER:',
  p_list_item_icon=> 'menu/pt_breadcrumb_20.png',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 17655619391219818+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 18628407360766287 + wwv_flow_api.g_id_offset,
  p_list_id=> 15863723734380646 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>90,
  p_list_item_link_text=> 'Solic. Baja &P1_COMETQ_PRVS.',
  p_list_item_link_target=> 'f?p=&APP_ID.:222:&SESSION.::&DEBUG.:RP,222,223,216:P222_COMPRV_ID:&P251_ID.:',
  p_list_item_icon=> 'menu/pt_breadcrumb_20.png',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 17663710087245510+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 29353430980280500 + wwv_flow_api.g_id_offset,
  p_list_id=> 15863723734380646 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>100,
  p_list_item_link_text=> 'CBU',
  p_list_item_link_target=> 'f?p=&APP_ID.:248:&SESSION.::&DEBUG.:RP,248,249,233:P248_COMPRV_ID:&P251_ID.:',
  p_list_item_icon=> 'menu/pt_breadcrumb_20.png',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 17663710087245510+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 31506230711460918 + wwv_flow_api.g_id_offset,
  p_list_id=> 15863723734380646 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>110,
  p_list_item_link_text=> 'Presentar Documentación',
  p_list_item_link_target=> 'f?p=&APP_ID.:694:&SESSION.::&DEBUG.:694:P694_COMPRV_ID,P694_EDICION,P694_GENERAR_TRAMITE_SN,G_APP_ANTERIOR_PAG,G_APP_ANTERIOR:&P251_ID.,NO,SI,&APP_PAGE_ID.,&APP_ID.:',
  p_list_item_icon=> 'menu/pt_breadcrumb_20.png',
  p_list_item_disp_cond_type=> 'FUNCTION_BODY',
  p_list_item_disp_condition=> 'begin'||unistr('\000a')||
'  if (nvl(SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => ''COMPRV_COMPDT_FIRMA_DIGITAL_SN'''||unistr('\000a')||
'                         ,P_SEGORG_ID => :P251_SEGORG_ID), ''NO'') = ''NO'' or (:P251_FECHA_INICIO_FIRMA_DIG is null)) or (:P1_SEGUSU_TIPO <> ''PRV'') then'||unistr('\000a')||
'    return true;'||unistr('\000a')||
'  else'||unistr('\000a')||
'    return false;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 16136818968273777+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 7900930381014460 + wwv_flow_api.g_id_offset,
  p_list_id=> 15863723734380646 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>120,
  p_list_item_link_text=> 'Presentar Documentación Firma Digital',
  p_list_item_link_target=> 'f?p=&APP_ID.:685:&SESSION.::&DEBUG.:685,686,687:P685_COMPRV_ID,P685_EDICION,P685_GENERAR_TRAMITE_SN:&P251_ID.,NO,SI:',
  p_list_item_icon=> 'menu/pt_breadcrumb_20.png',
  p_list_item_disp_cond_type=> 'FUNCTION_BODY',
  p_list_item_disp_condition=> 'begin'||unistr('\000a')||
'  --'||unistr('\000a')||
'  if nvl(SEG_PKG.OBTN_SEGCFG_VALOR(P_CODIGO => ''COMPRV_COMPDT_FIRMA_DIGITAL_SN'''||unistr('\000a')||
'                         ,P_SEGORG_ID => :P251_SEGORG_ID), ''NO'') = ''SI'' and (:P251_FECHA_INICIO_FIRMA_DIG is not null) and (:P1_SEGUSU_TIPO = ''PRV'') then'||unistr('\000a')||
'    return true;'||unistr('\000a')||
'  else'||unistr('\000a')||
'    return false;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 16136818968273777+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 31864501043181732 + wwv_flow_api.g_id_offset,
  p_list_id=> 15863723734380646 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>130,
  p_list_item_link_text=> 'Inscripción de Objetos de &P1_COMETQ_RUB.',
  p_list_item_link_target=> 'f?p=&APP_ID.:930:&SESSION.::&DEBUG.:RP,930,931,932,933:P930_COMPRV_ID:&P251_ID.:',
  p_list_item_icon=> 'menu/pt_breadcrumb_20.png',
  p_list_item_disp_cond_type=> 'EXISTS',
  p_list_item_disp_condition=> 'SELECT comrub.ID'||unistr('\000a')||
'FROM  COM_RUBROS comrub'||unistr('\000a')||
'    , COM_RUBROS_OBJ comruo'||unistr('\000a')||
'    , COM_PROVEEDORES_RUB comprr'||unistr('\000a')||
'WHERE comruo.COMRUB_ID = comrub.ID'||unistr('\000a')||
'AND comprr.COMRUB_ID = comrub.ID'||unistr('\000a')||
'AND COMPRR.COMPRV_ID = :P251_ID'||unistr('\000a')||
'AND comrub.SITUACION = ''VIG'''||unistr('\000a')||
'AND comprr.SITUACION = ''ACT'';',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 32355302792351493+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 33028824477121906 + wwv_flow_api.g_id_offset,
  p_list_id=> 15863723734380646 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>140,
  p_list_item_link_text=> 'Baja de Objetos de  &P1_COMETQ_RUB.',
  p_list_item_link_target=> 'f?p=&APP_ID.:940:&SESSION.::&DEBUG.:RP,940,941,942,943:P940_COMPRV_ID:&P251_ID.:',
  p_list_item_icon=> 'menu/pt_breadcrumb_20.png',
  p_list_item_disp_cond_type=> 'EXISTS',
  p_list_item_disp_condition=> 'SELECT comrub.ID'||unistr('\000a')||
'FROM  COM_RUBROS comrub'||unistr('\000a')||
'    , COM_RUBROS_OBJ comruo'||unistr('\000a')||
'    , COM_PROVEEDORES_RUB comprr'||unistr('\000a')||
'WHERE comruo.COMRUB_ID = comrub.ID'||unistr('\000a')||
'AND comprr.COMRUB_ID = comrub.ID'||unistr('\000a')||
'AND COMPRR.COMPRV_ID = :P251_ID'||unistr('\000a')||
'AND comrub.SITUACION = ''VIG'''||unistr('\000a')||
'--AND comruo.SITUACION = ''VIG'''||unistr('\000a')||
'AND comprr.SITUACION = ''ACT'';',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 32355302792351493+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 33725807707321660 + wwv_flow_api.g_id_offset,
  p_list_id=> 15863723734380646 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>150,
  p_list_item_link_text=> 'Presentacion Documentos Internos',
  p_list_item_link_target=> 'f?p=&APP_ID.:945:&SESSION.::&DEBUG.:RP,945,946,947:P945_COMPRV_ID:&P251_ID.:',
  p_list_item_icon=> 'menu/pt_breadcrumb_20.png',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 33725416549317493+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 48072527998711279 + wwv_flow_api.g_id_offset,
  p_list_id=> 15863723734380646 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>160,
  p_list_item_link_text=> 'Inscripción de Categorías y Autoridades',
  p_list_item_link_target=> 'f?p=&APP_ID.:936:&SESSION.::&DEBUG.:RP,936,937,938,939:P936_COMPRV_ID:&P251_ID.:',
  p_list_item_icon=> 'menu/pt_breadcrumb_20.png',
  p_list_item_disp_cond_type=> 'FUNCTION_BODY',
  p_list_item_disp_condition=> 'declare'||unistr('\000a')||
'   cursor cr_comprt is'||unistr('\000a')||
'    select *'||unistr('\000a')||
'      from com_proveedores_tipos_v'||unistr('\000a')||
'     where id = :P251_COMPRT_ID;'||unistr('\000a')||
''||unistr('\000a')||
'   cursor cr_segcfg is'||unistr('\000a')||
'    select valor'||unistr('\000a')||
'    from seg_configuraciones'||unistr('\000a')||
'    where codigo = ''COMADM_COMPRV_COMPRA_HABILITADO_SN'';'||unistr('\000a')||
'   '||unistr('\000a')||
'v_comprt cr_comprt%rowtype;'||unistr('\000a')||
'v_segcfg cr_segcfg%rowtype;'||unistr('\000a')||
'begin'||unistr('\000a')||
'    '||unistr('\000a')||
'    open cr_comprt;'||unistr('\000a')||
'    fetch cr_comprt into v_comprt;'||unistr('\000a')||
'    close cr_comprt;'||unistr('\000a')||
''||unistr('\000a')||
'    open cr_segcfg ;'||unistr('\000a')||
'    fetch cr_segcfg into v_segcfg;'||unistr('\000a')||
'    close cr_segcfg;'||unistr('\000a')||
''||unistr('\000a')||
'    if v_comprt.codigo = ''JUR'' and v_comprt.solicitar_autoridades_sn = ''SI'' and  :P251_COMPCT_ID is null and v_segcfg.valor = ''SI'' then'||unistr('\000a')||
'    	return true;'||unistr('\000a')||
'    else '||unistr('\000a')||
'    	return false;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'end;',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 49794209308630254 + wwv_flow_api.g_id_offset,
  p_list_id=> 15863723734380646 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>170,
  p_list_item_link_text=> 'Actualizacion de Categorías y Autoridades',
  p_list_item_link_target=> 'f?p=&APP_ID.:957:&SESSION.::&DEBUG.:RP,957:P957_COMPRV_ID:&P251_ID.:',
  p_list_item_icon=> 'menu/pt_breadcrumb_20.png',
  p_list_item_disp_cond_type=> 'FUNCTION_BODY',
  p_list_item_disp_condition=> 'declare'||unistr('\000a')||
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
'    if v_comprt.codigo = ''JUR'' and v_comprt.solicitar_autoridades_sn = ''SI'' and :P251_COMPCT_ID is not null then'||unistr('\000a')||
'    	return true;'||unistr('\000a')||
'    else '||unistr('\000a')||
'    	return false;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'end;',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 50494226902724732+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 50192401010980295 + wwv_flow_api.g_id_offset,
  p_list_id=> 15863723734380646 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>180,
  p_list_item_link_text=> 'Baja de Categorías',
  p_list_item_link_target=> 'f?p=&APP_ID.:922:&SESSION.::&DEBUG.:RP,922:P922_COMPRV_ID,P922_COMPCT_ID:&P251_ID.,&P251_COMPCT_ID.:',
  p_list_item_icon=> 'menu/pt_breadcrumb_20.png',
  p_list_item_disp_cond_type=> 'FUNCTION_BODY',
  p_list_item_disp_condition=> 'declare'||unistr('\000a')||
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
'    if v_comprt.codigo = ''JUR'' and v_comprt.solicitar_autoridades_sn = ''SI'' and :P251_COMPCT_ID is not null then'||unistr('\000a')||
'    	return true;'||unistr('\000a')||
'    else '||unistr('\000a')||
'    	return false;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'end;',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 50494226902724732+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 75939926694995254 + wwv_flow_api.g_id_offset,
  p_list_id=> 15863723734380646 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>190,
  p_list_item_link_text=> 'Actualización de Registros',
  p_list_item_link_target=> 'f?p=&APP_ID.:1092:&SESSION.::&DEBUG.:RP,1092:P1092_COMPRV_ID:&P251_ID.:',
  p_list_item_icon=> 'menu/pt_breadcrumb_20.png',
  p_list_item_disp_cond_type=> 'NEVER',
  p_list_item_disp_condition=> '',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
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
