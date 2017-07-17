create or replace PACKAGE COMCON_PKG IS


/* Tiempo disponible para cotizar en un proceso en dias */
FUNCTION COMCON_COMCTZ_TIEDIA_2
 (P_COMCON_ID IN NUMBER
 )
 RETURN NUMBER;
/* Estado de una contratación para un proveedor */
FUNCTION COMCON_COMPRV_ESTADO
 (P_COMCON_ID IN NUMBER
 ,P_COMPRV_ID IN NUMBER
 )
 RETURN VARCHAR2;
/* Cantidad de Ordenes para un Proveedor en un Proceso de compra */
FUNCTION COMCON_COMPRV_OCMCNT
 (P_COMCON_ID IN NUMBER
 ,P_COMPRV_ID IN NUMBER
 )
 RETURN NUMBER;
/* Tiempo disponible para cotizar en un proceso en dias */
FUNCTION COMCON_COMCTZ_TIEDIA
 (P_COMCON_ID IN NUMBER
 )
 RETURN NUMBER;
/* Estado para Cotizar un Proceso de Compras */
FUNCTION COMCON_COMCTZ_ESTADO
 (P_COMCON_ID IN NUMBER
 )
 RETURN VARCHAR2;
/* Obtener cantidad de cotizaciones validas de un proveedor en un proceso */
FUNCTION COMCON_COMPRV_CTZCNT
 (P_COMCON_ID IN NUMBER
 ,P_COMPRV_ID IN NUMBER
 )
 RETURN NUMBER;
FUNCTION COMCON_EMITIR_RES_SN
 (P_COMCON_ID IN NUMBER
 ,P_SEGORG_ID IN number
 )
 RETURN VARCHAR2;
/* Colocar la contratación en estado RESOLUCION EMITIDA. */
PROCEDURE COMCON_RES_EMITIDA
 (P_SEGORG_ID IN NUMBER
 ,P_COMCON_ID IN NUMBER
 );
/* Revertir estado RESOLUCION EMITIDA. */
PROCEDURE COMCON_RES_EMI_REVER
 (P_SEGORG_ID IN NUMBER
 ,P_COMCON_ID IN NUMBER
 ,P_MOTIVO IN VARCHAR2
 );
/* Transmitir el Documento de la Resolucion a Tramix */
PROCEDURE COMCON_RESOLUCION_TRANS
 (P_COMCON_ID IN NUMBER
 ,P_SEGORG_ID IN NUMBER
 ,P_INTENV_ID OUT NUMBER
 );
/* Lista de numeros de items adjudicados al proveedor */
FUNCTION COMCON_OBTN_ITEM_FRM1
 (P_COMCON_ID IN NUMBER
 ,P_COMPRV_ID IN NUMBER
 )
 RETURN VARCHAR2;
/* Procesar Tiempos de Contrataciones */
PROCEDURE COMCON_TIEMPOS_PRCC
 (P_DIAS IN NUMBER := 1
 );
/* Generar Tiempos Contratacion */
PROCEDURE COMCON_TIEMPOS_GNRR
 (P_COMCON_ID IN NUMBER
 ,P_FECHA IN DATE
 );
/* Obtener el valor de la variable v_comctd. */
PROCEDURE COMCTD_GET
 (P_COMCTD OUT COM_CONTRATACIONES_TIPDOT%ROWTYPE
 );
/* Inicializar la variable v_comctd. */
PROCEDURE COMCTD_INI;
/* Insertar registro en COM_CONTRATACIONES_TIPDOT. */
PROCEDURE COMCTD_INS
 (P_COMCTD IN COM_CONTRATACIONES_TIPDOT%ROWTYPE
 );
/* Setear la variable v_comctd. */
PROCEDURE COMCTD_SET
 (P_ID IN NUMBER
 );
FUNCTION OBTN_COMCON_RES_PDF
 (P_SEGORG_ID IN NUMBER
 ,P_COMCON_ID IN NUMBER
 )
 RETURN INTEGER;
END COMCON_PKG;
