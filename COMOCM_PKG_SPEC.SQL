CREATE OR REPLACE PACKAGE COMOCM_PKG IS

FUNCTION OBTN_COMOCM_FECHA_GENERACION
 (P_COMCON_ID IN NUMBER
 ,P_COMPRV_ID IN NUMBER
 )
 RETURN DATE;
/* Actualiza el monto para un detalle de entrega */
PROCEDURE COMCED_ACTUALIZAR_MONTO
 (P_COMOCM_ID IN NUMBER
 ,P_COMOCD_ID IN NUMBER
 ,P_COMCET_ID IN NUMBER
 ,P_CANTIDAD IN NUMBER
 ,P_MONTO_UNITARIO IN NUMBER
 ,P_TIPO_ENTREGA IN VARCHAR2
 ,P_OBSERVACION IN VARCHAR2
 );
/* Agregar el detalle del comprobante desde la Orden de compra */
PROCEDURE COMCED_AGREGAR
 (P_COMCET_ID IN NUMBER
 ,P_COMOCM_ID IN NUMBER
 );
PROCEDURE COMCED_AGREGAR_VLD
 (P_COMCET_ID IN NUMBER
 ,P_COMOCM_ID IN NUMBER
 );
/* Calcular cantidad pendiente de entrega para un item de orden de compra */
FUNCTION COMCED_CALCULAR_CANTIDAD
 (P_COMOCD_ID IN NUMBER
 ,P_COMCET_ID IN NUMBER
 ,P_ESTADO IN VARCHAR2 := 'ENT'
 )
 RETURN INTEGER;
/* Calcular el monto pendiente de entrega de un item de Orden de Compra */
FUNCTION COMCED_CALCULAR_MONTO
 (P_COMOCD_ID IN NUMBER
 )
 RETURN INTEGER;
/* Eliminar un item del detalle de la entrega */
PROCEDURE COMCED_ELIMINAR
 (P_COMCED_ID IN NUMBER
 );
/* Validar la eliminacion de un item de la entrega */
PROCEDURE COMCED_ELIMINAR_VLD
 (P_COMCED_ID IN NUMBER
 );
/* Monto Entregado para el Item de la Orden de Compra */
FUNCTION COMCED_ENTREGADOS_MNT
 (P_COMOCM_ID IN NUMBER
 ,P_COMOCD_ID IN NUMBER
 )
 RETURN NUMBER;
/* Cantidad Entregada para el Item de la Orden de Compra */
FUNCTION COMCED_ENTREGADOS_CNT
 (P_COMOCM_ID IN NUMBER
 ,P_COMOCD_ID IN NUMBER
 )
 RETURN NUMBER;
/* Recupera un registro desde la variable de paquete */
PROCEDURE COMCED_GET
 (P_COMCED OUT COM_COMPROBANTES_DET%ROWTYPE
 );
/* Limpia la variable del paquete */
PROCEDURE COMCED_INI;
/* Agregar un nuevo registro a COM_COMPROBANTES_DET */
PROCEDURE COMCED_INS
 (P_COMCED IN COM_COMPROBANTES_DET%ROWTYPE
 );
/* Monto Pendiente de entrega por item de una Orden */
FUNCTION COMCED_PENDIENTES_MNT
 (P_COMOCM_ID IN NUMBER
 ,P_COMOCD_ID IN NUMBER
 )
 RETURN NUMBER;
/* Cantidad de items pendiente de entrega */
FUNCTION COMCED_PENDIENTES_CNT
 (P_COMOCM_ID IN NUMBER
 ,P_COMOCD_ID IN NUMBER
 )
 RETURN NUMBER;
/* Precio Cotizado para el item de la orden de compra */
FUNCTION COMCED_PRECIO_COTIZADO
 (P_COMOCD_ID IN NUMBER
 )
 RETURN NUMBER;
/* Recupera un registro por su ID */
PROCEDURE COMCED_SET
 (P_ID IN NUMBER
 );
/* Recupera un registro desde la variable de paquete */
PROCEDURE COMCEE_GET
 (P_COMCEE OUT COM_COMPROBANTES_EST%ROWTYPE
 );
PROCEDURE COMCEE_INI;
/* Agregar un nuevo registro a COM_COMPROBANTES_EST */
PROCEDURE COMCEE_INS
 (P_COMCEE IN COM_COMPROBANTES_EST%ROWTYPE
 );
/* Recupera un registro por su ID */
PROCEDURE COMCEE_SET
 (P_ID IN NUMBER
 );
/* Anular Entrega de bienes y servicios */
PROCEDURE COMCET_ANULAR
 (P_COMOCM_ID IN NUMBER
 ,P_COMCET_ID IN NUMBER
 ,P_MOTIVO IN VARCHAR2
 );
/* Anular una entrega */
PROCEDURE COMCET_ANULAR_VLD
 (P_COMOCM_ID IN NUMBER
 ,P_COMCET_ID IN NUMBER
 );
/* Obtiene si una entrega se encuentra Para Autorizar */
FUNCTION COMCET_AUTORIZADA_SN
 (P_COMCET_ID IN NUMBER
 )
 RETURN VARCHAR2;
/* Calcula el monto restante de la orden de compra */
FUNCTION COMCET_CALCULAR_MONTO
 (P_COMOCM_ID IN NUMBER
 )
 RETURN NUMBER;
/* Crea una cabecera de comprobante de entrega */
PROCEDURE COMCET_CREAR
 (P_COMOCM_ID IN NUMBER
 ,P_TIPO_ENTREGA IN VARCHAR2
 ,P_FECHA_VENCIMIENTO IN DATE
 ,P_SEGUSU_TIPO IN VARCHAR2
 ,P_OBSERVACION IN VARCHAR2
 ,P_COMCET_ID OUT NUMBER
 );
PROCEDURE COMCET_CREAR_VLD
 (P_COMOCM_ID IN NUMBER
 ,P_TIPO_ENTREGA IN VARCHAR2
 ,P_SEGUSU_TIPO IN VARCHAR2
 );
/* Confirmar la Entrega de Bienes */
PROCEDURE COMCET_ENTREGAR
 (P_COMOCM_ID IN NUMBER
 ,P_COMCET_ID IN NUMBER
 ,P_MOTIVO IN VARCHAR2
 );
/* Validacion Entrega de Comprobante */
PROCEDURE COMCET_ENTREGAR_VLD
 (P_COMOCM_ID IN NUMBER
 ,P_COMCET_ID IN NUMBER
 );
/* Obtener el tipo de Entrega */
FUNCTION COMCET_OBTN_TIPO_ENTREGA
 (P_COMOCM_ID IN NUMBER
 ,P_COMCET_ID IN NUMBER
 )
 RETURN VARCHAR2;
/* Obtiene si una entrega se encuentra Pendiente de entrega */
FUNCTION COMCET_PENDIENTE_SN
 (P_COMCET_ID IN NUMBER
 )
 RETURN VARCHAR2;
/* Obtiene si una entrega está Vencida o no */
FUNCTION COMCET_VENCIDA_SN
 (P_COMCET_ID IN NUMBER
 )
 RETURN VARCHAR2;
/* Recupera un registro desde la variable de paquete */
PROCEDURE COMCET_GET
 (P_COMCET OUT COM_COMPROBANTES_ENT%ROWTYPE
 );
/* Limpia la variable de paquete */
PROCEDURE COMCET_INI;
/* Agregar un nuevo registro a COM_COMPROBANTES_ENT */
PROCEDURE COMCET_INS
 (P_COMCET IN COM_COMPROBANTES_ENT%ROWTYPE
 );
/* Recupera un registro por su ID */
PROCEDURE COMCET_SET
 (P_ID IN NUMBER
 );
/* Obtener el valor de la variable v_comclp. */
PROCEDURE COMCLP_GET
 (P_COMCLP OUT COM_CALIFICACIONES_PRO%ROWTYPE
 );
/* Inicializar la variable v_comclp. */
PROCEDURE COMCLP_INI;
/* Insertar registro en COM_CONTRATACIONES_PRO. */
PROCEDURE COMCLP_INS
 (P_COMCLP IN COM_CALIFICACIONES_PRO%ROWTYPE
 );
/* Setear la variable v_comclp. */
PROCEDURE COMCLP_SET
 (P_ID IN NUMBER
 );
/* Obtener el valor de la variable v_comcpd. */
PROCEDURE COMCPD_GET
 (P_COMCPD OUT COM_CALIFICACIONES_PRD%ROWTYPE
 );
/* Inicializar la variable v_comcpd. */
PROCEDURE COMCPD_INI;
/* Insertar registro en COM_CONTRATACIONES_PRD. */
PROCEDURE COMCPD_INS
 (P_COMCPD IN COM_CALIFICACIONES_PRD%ROWTYPE
 );
/* Setear la variable v_comcpd. */
PROCEDURE COMCPD_SET
 (P_ID IN NUMBER
 );
/* Obtener el valor de la variable v_comcpt. */
PROCEDURE COMCPT_GET
 (P_COMCPT OUT COM_CALIFICACIONES_PRT%ROWTYPE
 );
/* Inicializar la variable v_comcpt. */
PROCEDURE COMCPT_INI;
/* Insertar registro en COM_CONTRATACIONES_PRT. */
PROCEDURE COMCPT_INS
 (P_COMCPT IN COM_CALIFICACIONES_PRT%ROWTYPE
 );
/* Setear la variable v_comcpt. */
PROCEDURE COMCPT_SET
 (P_ID IN NUMBER
 );
/* Setear la variable v_comcpt según codigo. */
PROCEDURE COMCPT_SET_CODIGO
 (P_SEGORG_ID IN NUMBER
 ,P_CODIGO IN VARCHAR2
 );
/* Controlar si una Entidad Contratante tiene al menos una orden vencida */
FUNCTION COMOCM_COMECO_VENCIDA_SN
 (P_COMECO_ID IN NUMBER
 ,P_SEGORG_ID IN NUMBER
 )
 RETURN VARCHAR2;
/* Cantidad Cotizada para el Item de la Orden de Compra */
FUNCTION COMOCM_COTIZADO_CNT
 (P_COMOCM_ID IN NUMBER
 ,P_COMOCD_ID IN NUMBER
 )
 RETURN NUMBER;
/* Monto Cotizado para el Item de la Orden de Compra */
FUNCTION COMOCM_COTIZADO_MNT
 (P_COMOCM_ID IN NUMBER
 ,P_COMOCD_ID IN NUMBER
 )
 RETURN NUMBER;
/* Obtener si una orden posee entregas Para Autorizar. */
FUNCTION COMOCM_ENT_AUT_SN
 (P_COMOCM_ID IN NUMBER
 )
 RETURN VARCHAR2;
/* Obtiene si una orden posee entregas Pendientes de autorizar. */
FUNCTION COMOCM_ENT_PEN_SN
 (P_COMOCM_ID IN NUMBER
 )
 RETURN VARCHAR2;
/* Determina si una orden posee alguna entrega vencida. */
FUNCTION COMOCM_ENT_VENC_SN
 (P_COMOCM_ID IN NUMBER
 )
 RETURN VARCHAR2;
/* Indica si existen entregas parciales */
FUNCTION COMOCM_ENTREGAS_PENDIENTES_SN
 (P_COMOCM_ID IN NUMBER
 )
 RETURN VARCHAR2;
/* Indica si se ha completado el Total de las entregas */
FUNCTION COMOCM_ENTREGAS_TOTALES_SN
 (P_COMOCM_ID IN NUMBER
 )
 RETURN VARCHAR2;
PROCEDURE COMOCM_ESTADISTICAS_PRCC
 (P_DIAS IN NUMBER := 1
 );
PROCEDURE COMOCM_ESTADISTICAS_GNRR
 (P_COMOCM_ID IN NUMBER
 );
/* Actualizar fecha máxima de entrega a medida que se pactan entregas. */
PROCEDURE COMOCM_FECHA_ENTREGA
 (P_COMCET_ID IN NUMBER
 ,P_COMOCM_ID IN NUMBER
 );
/* Modificar la fecha de entrega estimada al anular una entrega. */
PROCEDURE COMOCM_FECHA_ENT_ANU
 (P_COMOCM_ID IN NUMBER
 ,P_COMCET_ID IN NUMBER
 );
/* Monto total de la Orden */
FUNCTION COMOCM_OBTN_MONTO
 (P_COMOCM_ID IN NUMBER
 )
 RETURN NUMBER;
/* Obtener el Id de la Calificación actual para una orden de compra */
FUNCTION COMOCM_OBTN_CLF
 (P_COMOCM_ID IN NUMBER
 )
 RETURN NUMBER;
/* Obtener el Estado de una Orden de Compra */
FUNCTION COMOCM_OBTN_ESTADO
 (P_COMOCM_ID IN NUMBER
 )
 RETURN VARCHAR2;
FUNCTION COMOCM_VENCIDA_SN
 (P_SEGORG_ID IN NUMBER
 ,P_COMOCM_ID IN NUMBER
 )
 RETURN VARCHAR2;
/* Determinar si el plazo para responder una réplica ha finalizado */
FUNCTION COMREP_PLAZO_FINALIZADO_SN
 (P_COMOCM_ID IN NUMBER
 )
 RETURN VARCHAR2;
/* Determinar el estado de las replicas para una orden de compra */
FUNCTION COMOCM_REPLICA_EST
 (P_COMOCM_ID IN NUMBER
 )
 RETURN VARCHAR2;
FUNCTION COMREP_REPLICA_HS
 (P_COMOCM_ID IN NUMBER
 ,P_ORIGEN IN VARCHAR2
 )
 RETURN VARCHAR2;
FUNCTION COMREP_REPLICAR_OPTIMIZADO_SN
 (P_COMREP_ID IN NUMBER
 ,P_ORIGEN IN VARCHAR2
 ,P_COMOCM_ID IN NUMBER
 ,P_SEGORG_ID IN NUMBER
 ,P_COMRED_ID IN NUMBER
 ,P_COMRED_DESTINO IN VARCHAR2
 ,P_COMREP_ESTADO IN VARCHAR2
 ,P_COMRED_ORIGEN IN VARCHAR2
 ,P_COMRED_FECHA IN DATE
 )
 RETURN VARCHAR2;
/* Obtener la máxima fecha de entrega registrada en la orden. */
FUNCTION OBTN_COMCET_FECH_MAX
 (P_COMOCM_ID IN NUMBER
 )
 RETURN DATE;
/* Estado de la replica sin formato */
FUNCTION OBTN_COMREP_ESTADO_S
 (P_COMOCM_ID IN NUMBER
 )
 RETURN VARCHAR2;
/* Formato html del estado de la replica */
FUNCTION OBTN_COMREP_ESTADO
 (P_COMOCM_ID IN NUMBER
 )
 RETURN VARCHAR2;
/* Obtener el valor de la variable v_comocp. */
PROCEDURE COMOCP_GET
 (P_COMOCP OUT COM_ORDENES_COMPRAS_PRO%ROWTYPE
 );
/* Inicializar la variable v_comocp. */
PROCEDURE COMOCP_INI;
/* Insertar registro en COM_ORDENES_COMPRAS_PRO. */
PROCEDURE COMOCP_INS
 (P_COMOCP IN COM_ORDENES_COMPRAS_PRO%ROWTYPE
 );
/* Setear la variable v_comocp. */
PROCEDURE COMOCP_SET
 (P_ID IN NUMBER
 );
END COMOCM_PKG;
/
SHOW ERROR
