create or replace PACKAGE COMPED_PKG IS


/* Validar Nro Expdte Web Service Tramix - Solicitud de Gasto */
FUNCTION COMPED_VLDR_EXPDTE_TRAMIX
 (P_SEGORG_ID IN NUMBER
 ,P_TIPO_EXPDTE IN VARCHAR2
 ,P_NRO_EXPDTE IN VARCHAR2
 ,P_EJERCICIO_EXPDTE IN NUMBER
 ,P_COMECO_ID IN NUMBER
 )
 RETURN VARCHAR2;
FUNCTION COMPED_AUTORIZAR_SN
 (P_COMPED_ID IN NUMBER
 ,P_FECHA IN DATE
 )
 RETURN VARCHAR2;
/* Obtener las partidas correspondientes al pedido */
FUNCTION COMPED_OBTN_PARTIDAS
 (P_COMPED_ID IN NUMBER
 )
 RETURN VARCHAR2;
FUNCTION COMPED_RECHAZAR_SN
 (P_COMPED_ID IN NUMBER
 )
 RETURN VARCHAR2;
PROCEDURE COMPED_RECHAZAR
 (P_COMPED_ID IN NUMBER
 ,P_MOTIVO IN VARCHAR2
 );
PROCEDURE COMPED_RECHAZAR_VLD
 (P_COMPED_ID IN NUMBER
 ,P_MOTIVO IN VARCHAR2
 );
END COMPED_PKG;
