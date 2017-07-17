CREATE OR REPLACE PACKAGE BODY COMCAT_PKG IS

V_COMCCT COM_COMPDT_COMCTT%ROWTYPE;
V_COMZON COM_ZONAS%ROWTYPE;
V_COMZTL COM_ZONAS_TRRLOC%ROWTYPE;
V_COMCAM COM_CAMPANIAS%ROWTYPE;
V_COMCAE COM_CAMPANIAS_EST%ROWTYPE;
V_COMCAI COM_CAMPANIAS_ITEMS%ROWTYPE;
V_COMCAP COM_CAMPANIAS_PRECIOS%ROWTYPE;
V_COMENT COM_ENTIDADES%ROWTYPE;
V_COMENZ COM_ENTIDADES_ZONAS%ROWTYPE;
V_COMPAU COM_PEDIDOS_AUT%ROWTYPE;


PROCEDURE COMCAI_CREAR
 (P_COMCAM_ID IN NUMBER
 ,P_COMENT_ID IN NUMBER
 ,P_COMCIT_ID IN NUMBER
 ,P_LOCALIDAD IN VARCHAR2
 ,P_PRECIO IN NUMBER
 ,P_FECHA IN DATE
 ,P_OBSERVACION IN VARCHAR2
 ,P_COMZON_ID IN VARCHAR2
 ,P_COMCAI_ID OUT NUMBER
 )
 IS
cursor cr_comcit (p_comcit_id NUMBER) is     
  select TRIM(TO_CHAR(comcob.codigo, '000')||'.'||TO_CHAR(comccl.codigo, '00000')|| '.'||TO_CHAR (comcit.codigo, '0000')) CODIGO_COMPLETO
    from com_catalogo_clases comccl,
          com_catalogo_items comcit,
          com_catalogo_objetos comcob,
          com_catalogo_precios comctp
   where comcit.comcob_id = comcob.ID
     and comcit.comccl_id = comccl.ID
     and comcit.ID = comctp.comcit_id(+)
     and comctp.ID(+) = com_pkg.obtn_comctp_id (comcit.ID) 
     and comcit.ID = p_comcit_id;
  --
  v_comcai_crear COM_CAMPANIAS_ITEMS%rowtype;       
  v_comcam  com_campanias%rowtype; 
  v_coment  com_entidades%rowtype;  
  v_comcit_codigo VARCHAR2(100);
  --
BEGIN    
  --    
  COMCAI_CREAR_VLD(P_COMCAM_ID => P_COMCAM_ID
                  ,P_COMENT_ID => P_COMENT_ID
                  ,P_COMCIT_ID => P_COMCIT_ID
                  ,P_LOCALIDAD => P_LOCALIDAD
                  ,P_PRECIO    => P_PRECIO
                  ,P_FECHA     => P_FECHA
                  ,P_OBSERVACION => P_OBSERVACION
                  ,P_COMZON_ID => P_COMZON_ID  
                  );                      
  -- Registrar
  select COMCAI_ID.NEXTVAL
  into   v_comcai_crear.ID
  from   dual;
  --
  --Campaña  
  COMCAM_SET(p_id   => p_comcam_id);
  COMCAM_GET(p_comcam => v_comcam);
  COMCAM_INI;  
  --Entidad
  COMENT_SET(p_id   => p_coment_id);
  COMENT_GET(p_coment => v_coment);
  COMENT_INI; 
  --Items
  OPEN cr_comcit(P_COMCIT_ID);
  FETCH cr_comcit INTO v_comcit_codigo;
  CLOSE cr_comcit;  
  --     
  v_comcai_crear.CODIGO    := TRIM(REPLACE(v_comcam.CODIGO||'-'||
                                           v_coment.CODIGO||'-'||
                                           v_comcit_codigo,'.','-'
                                           ));
  v_comcai_crear.COMCAM_ID := P_COMCAM_ID;
  v_comcai_crear.COMENT_ID := P_COMENT_ID;
  v_comcai_crear.COMCIT_ID := P_COMCIT_ID;
  v_comcai_crear.LOCALIDAD := P_LOCALIDAD;
  v_comcai_crear.PRECIO    := NVL(P_PRECIO,0);
  v_comcai_crear.FECHA     := P_FECHA;
  v_comcai_crear.OBSERVACION := P_OBSERVACION;
  v_comcai_crear.COMZON_ID := P_COMZON_ID; 
  --
  COMCAI_INS(p_comcai => v_comcai_crear);
  --
  p_comcai_id := v_comcai_crear.ID;
  --
END;
PROCEDURE COMCAI_CREAR_VLD
 (P_COMCAM_ID IN NUMBER
 ,P_COMENT_ID IN NUMBER
 ,P_COMCIT_ID IN NUMBER
 ,P_LOCALIDAD IN VARCHAR2
 ,P_PRECIO IN NUMBER
 ,P_FECHA IN DATE
 ,P_OBSERVACION IN VARCHAR2
 ,P_COMZON_ID IN VARCHAR2
 )
 IS
v_comcam  com_campanias%rowtype; 
v_coment  com_entidades%rowtype; 
V_comcit  com_catalogo_items%rowtype; 
--
begin
  -- Verificar los parametros obligatorios
  if p_comcam_id is null then
    raise_application_error(-20000,'La Campaña no ha sido indicada y es un dato obligatorio',true);
  elsif p_coment_id is null then
    raise_application_error(-20000,'La Entidad no ha sido indicada y es un dato obligatorio',true);	
  elsif p_comcit_id is null then
    raise_application_error(-20000,'El Item no ha sido indicado y es un dato obligatorio',true);
 elsif p_localidad is null then
    raise_application_error(-20000,'La Localidad no ha sido indicada y es un dato obligatorio',true); 
  end if;
  --    
  -- Verificar Campaña
  COMCAM_SET(p_id   => p_comcam_id);
  COMCAM_GET(p_comcam => v_comcam);
  COMCAM_INI;  
  if v_comcam.ID is null then  
   raise_application_error(-20000,'La Campaña indicada es incorrecta',true);
  end if;
  --
  -- Verificar Entidad 
  COMENT_SET(p_id   => p_coment_id);
  COMENT_GET(p_coment => v_coment);
  COMENT_INI;  
  if v_coment.ID is null then  
   raise_application_error(-20000,'La Entidad indicada es incorrecta',true);
  end if;
  -- 
  -- Verificar Item 
  COM_PKG.SET_COMCIT(p_comcit_id   => p_comcit_id);
  COM_PKG.GET_COMCIT(p_comcit => v_comcit);
  COM_PKG.INI_COMCIT;  
  if v_comcit.ID is null then  
   raise_application_error(-20000,'El Item indicado es incorrecto',true);
  end if;
  --
end;
PROCEDURE COMCAI_IMPORTAR
 (P_ID IN COM_DOCUMENTOS.ID%TYPE
 ,P_SEPARADOR IN VARCHAR2 := ';'
 ,P_MENSAJE OUT VARCHAR2
 )
 IS
--
  CURSOR cr_comdoc IS
  SELECT DOCUMENTO
  FROM COM_DOCUMENTOS COMDOC
  WHERE COMDOC.ID = P_ID;
  --
  v_comdoc_documento    BLOB;
  v_clob                CLOB;
  v_longitudTotal       NUMBER;
  v_posicion            NUMBER         := 1;
  v_linea_str           VARCHAR2(32767):= '';
  v_nrolinea            NUMBER := 0;
  v_leeHasta            NUMBER         := 4000;        
  v_fin_de_linea        VARCHAR2(10)   := chr(10); -- Enter
  v_valor               VARCHAR2(4000); 
  --
  v_codigo              VARCHAR(200);
  v_localidad           VARCHAR(200);
  v_precio              VARCHAR(200);
  v_fecha               DATE;
  v_observacion         VARCHAR(4000);    
  v_mensaje             VARCHAR2(4000);   
  --
BEGIN
  -- Cargo el Archivo en el BLOB      
  OPEN cr_comdoc;
  FETCH cr_comdoc INTO v_comdoc_documento;
  CLOSE cr_comdoc;    
  --
  IF v_comdoc_documento IS NOT NULL THEN
    -- Convierto el BLOB a CLOB
    v_clob := COM_PKG.GET_BLOB_TO_CLOB(v_comdoc_documento);
    --
    -- Defino la longitud total del archivo CLOB
    v_longitudTotal := dbms_lob.getlength(v_clob);
    --    
    
    --Recorro el archivo linea a linea
    WHILE (v_posicion <= v_longitudTotal) LOOP
      --Obtengo linea
      v_linea_str := dbms_lob.substr(v_CLOB
                                     ,INSTR(dbms_lob.substr(v_CLOB,v_leeHasta,v_posicion),v_fin_de_linea)-2
                                     ,v_posicion);
      --                                  
      v_posicion := v_posicion + length(v_Linea_str)+2;
      -- Si es la cabecera
      IF v_nrolinea <> 0 THEN
        -- Campo CODIGO
        v_codigo := REPLACE(COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                                  ,p_columna   => 4
                                                  ,p_separador => p_separador),'"','');
        --                                             
        -- Campo LOCALIDAD
        v_localidad := REPLACE(COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                                  ,p_columna   => 2
                                                  ,p_separador => p_separador),'"','');
       
        -- Campo PRECIO
        --
        v_precio := TO_NUMBER(REPLACE(COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                                  ,p_columna   => 8
                                                  ,p_separador => p_separador),'"',''),'999999999999.99');
                                      
    
        -- Campo FECHA
        v_fecha := TO_DATE(REPLACE(COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                                 ,p_columna   => 9
                                                 ,p_separador => p_separador),'"',''),'DD-MM-YYYY');
     
        -- Campo OBSERVACION
        v_observacion := REPLACE(COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                                       ,p_columna   => 10
                                                       ,p_separador => p_separador),'"','');
      
        --ACTUALIZO COM_CAMPANIAS_ITEMS
        UPDATE COM_CAMPANIAS_ITEMS
           SET PRECIO      = v_precio
             , FECHA       = v_fecha
             , OBSERVACION = v_observacion
         WHERE CODIGO = v_codigo
           AND LOCALIDAD = v_localidad;
         -- 
      END IF;      
      --    
      v_nrolinea := v_nrolinea + 1; 
      --
    END LOOP;
    -- 
  END IF;
  --  
 END;
PROCEDURE COMCAI_IMPORTAR_VLD
 (P_ID IN COM_DOCUMENTOS.ID%TYPE
 ,P_SEPARADOR IN VARCHAR2 := ';'
 ,P_MENSAJE OUT VARCHAR2
 ,P_VALIDO OUT VARCHAR2
 )
 IS
CURSOR cr_comdoc IS
  SELECT *
  FROM COM_DOCUMENTOS COMDOC
  WHERE COMDOC.ID = P_ID;
  --
  CURSOR cr_comcoi(P_CODIGO VARCHAR) IS
  SELECT ID, COMCAM_ID
  FROM COM_CAMPANIAS_ITEMS
  WHERE CODIGO = P_CODIGO;
  --
  v_longitudTotal       NUMBER;
  v_leeHasta            NUMBER         := 4000;
  v_linea_str           VARCHAR2(32767):= '';
  v_nrolinea            NUMBER := 0;
  v_posicion            NUMBER         := 1;
  v_encontro_fin        BOOLEAN;
  -- Seteo propio para la planilla dada   
  v_fin_de_linea        VARCHAR2(10)   := chr(10); -- Enter
  v_valor               VARCHAR2(2000);
  v_valor_posicion_ini  NUMBER;
  v_valor_posicion_fin  NUMBER;
  --
  v_mensaje             VARCHAR2(4000);
  v_comdoc              COM_DOCUMENTOS%ROWTYPE;
  v_clob                CLOB;
  v_precio              VARCHAR(200);   
  v_fecha               DATE;
  v_comcoi_id           NUMBER;    
  v_comcam_id           NUMBER;
  v_comcam             COM_CAMPANIAS%ROWTYPE;
  --
BEGIN                           
   v_mensaje := NULL;
   -- Cargo el Archivo en el BLOB
   v_comdoc := NULL;
   OPEN cr_comdoc;
   FETCH cr_comdoc INTO v_comdoc;
   CLOSE cr_comdoc;
   -- Convierto el BLOB a CLOB
   v_clob := COM_PKG.GET_BLOB_TO_CLOB(v_comdoc.DOCUMENTO);
   -- Defino la longitud total del archivo CLOB
   v_longitudTotal := dbms_lob.getlength(v_clob);
   -- Cargo la primer linea del Archivo LOB 
   v_Linea_str := REPLACE(dbms_lob.substr(v_CLOB
                                 ,INSTR(dbms_lob.substr(v_CLOB,v_leeHasta,v_posicion),v_fin_de_linea)-2
                                 ,v_posicion),'"','');
   -- validar que esten presente los siguientes campos
   -- CAMPAÑA
   v_valor := COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                    ,p_columna   => 0
                                    ,p_separador => p_separador);
   IF v_valor IS NULL OR UPPER(v_valor) <> 'CAMPAÑA' THEN
     v_mensaje := v_mensaje || 'Falta el campo CAMPAÑA. Se encontró: "'||v_valor||'"<br>';
   END IF;
   --
   -- ZONA
   v_valor := COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                    ,p_columna   => 1
                                    ,p_separador => p_separador);
   IF v_valor IS NULL OR UPPER(v_valor) <> 'ZONA' THEN
     v_mensaje := v_mensaje || 'Falta el campo ZONA. Se encontró: "'||v_valor||'"<br>';
   END IF;
   --   
   -- LOCALIDAD
   v_valor := COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                    ,p_columna   => 2
                                    ,p_separador => p_separador);
   IF v_valor IS NULL OR UPPER(v_valor) <> 'LOCALIDAD' THEN
     v_mensaje := v_mensaje || 'Falta el campo LOCALIDAD. Se encontró: "'||v_valor||'"<br>';
   END IF;
   --    
   -- ENTIDAD
   v_valor := COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                    ,p_columna   => 3
                                    ,p_separador => p_separador);
   IF v_valor IS NULL OR UPPER(v_valor) <> 'ENTIDAD' THEN
     v_mensaje := v_mensaje || 'Falta el campo ENTIDAD. Se encontró: "'||v_valor||'"<br>';
   END IF;
   --    
   -- CODIGO
   v_valor := COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                    ,p_columna   => 4
                                    ,p_separador => p_separador);
   IF v_valor IS NULL OR UPPER(v_valor) <> 'CODIGO' THEN
     v_mensaje := v_mensaje || 'Falta el campo CODIGO. Se encontró: "'||v_valor||'"<br>';
   END IF;
   -- 
   -- OBJETO DE GASTO
   v_valor := COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                    ,p_columna   => 5
                                    ,p_separador => p_separador);
   IF v_valor IS NULL OR UPPER(v_valor) <> 'OBJETO DE GASTO' THEN
     v_mensaje := v_mensaje || 'Falta el campo OBJETO DE GASTO. Se encontró: "'||v_valor||'"<br>';
   END IF;
   --       
   -- CLASE
   v_valor := COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                    ,p_columna   => 6
                                    ,p_separador => p_separador);
   IF v_valor IS NULL OR UPPER(v_valor) <> 'CLASE' THEN
     v_mensaje := v_mensaje || 'Falta el campo CLASE. Se encontró: "'||v_valor||'"<br>';
   END IF;
   --  
   -- ITEM
   v_valor := COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                    ,p_columna   => 7
                                    ,p_separador => p_separador);
   IF v_valor IS NULL OR UPPER(v_valor) <> 'ITEM' THEN
     v_mensaje := v_mensaje || 'Falta el campo ITEM. Se encontró: "'||v_valor||'"<br>';
   END IF;
   --     
   -- PRECIO
   v_valor := COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                    ,p_columna   => 8
                                    ,p_separador => p_separador);
   IF v_valor IS NULL OR UPPER(v_valor) <> 'PRECIO' THEN
     v_mensaje := v_mensaje || 'Falta el campo PRECIO. Se encontró: "'||v_valor||'"<br>';
   END IF;
   --     
   -- FECHA
   v_valor := COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                    ,p_columna   => 9
                                    ,p_separador => p_separador);
   IF v_valor IS NULL OR UPPER(v_valor) <> 'FECHA' THEN
     v_mensaje := v_mensaje || 'Falta el campo FECHA. Se encontró: "'||v_valor||'"<br>';
   END IF;
   --     
   -- OBSERVACION
   v_valor := COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                    ,p_columna   => 10
                                    ,p_separador => p_separador);
   IF v_valor IS NULL OR UPPER(v_valor) <> 'OBSERVACION' THEN
     v_mensaje := v_mensaje || 'Falta el campo OBSERVACION. Se encontró: "'||v_valor||'"<br>';
   END IF;   
   --
   --Valido linea a linea
   WHILE (v_posicion <= v_longitudTotal) LOOP      
    --Obtengo linea
    v_linea_str := dbms_lob.substr(v_CLOB
                                   ,INSTR(dbms_lob.substr(v_CLOB,v_leeHasta,v_posicion),v_fin_de_linea)-2
                                  ,v_posicion);
    --                                  
    v_posicion := v_posicion + length(v_Linea_str)+2;
    --
    IF v_nrolinea <> 0 THEN
     
     --CODIGO
     v_valor := REPLACE(COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                              ,p_columna   => 4
                                              ,p_separador => p_separador),'"','');
     --
     OPEN cr_comcoi(v_valor);
     FETCH cr_comcoi INTO v_comcoi_id, v_comcam_id;
     CLOSE cr_comcoi;
     --                                             
     IF v_valor IS NOT NULL THEN
       --
       IF v_comcoi_id IS NULL THEN
         v_mensaje := v_mensaje||'Error en fila Nº '||v_nrolinea||': El valor del campo CODIGO <b>'||v_valor||'</b> es inexistente. Debera exportar una nueva planilla e importarla.<br>';           
       END IF;
       --  
     ELSE   
       v_mensaje := v_mensaje||'Error en fila Nº '||v_nrolinea||': El valor del campo CODIGO no ha sido indicado y es un dato obligatorio.<br>';        
     END IF;
     --FIN CODIGO
     
     --LOCALIDAD    
     v_valor := REPLACE(COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                              ,p_columna   => 2
                                              ,p_separador => p_separador),'"','');
     --
     IF v_valor IS NULL THEN
       v_mensaje := v_mensaje||'Error en fila Nº '||v_nrolinea||': El valor del campo LOCALIDAD no ha sido indicado y es un dato obligatorio.<br>';         
     END IF;                                                   
     --FIN LOCALIDAD
     
     --PRECIO
     v_valor := REPLACE(COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                              ,p_columna   => 8
                                              ,p_separador => p_separador),'"','');
                                  
     IF v_valor IS NOT NULL THEN                           
       -- sacar el simbolo $ si asi fue cargado              
       v_precio := LTRIM(RTRIM((REPLACE(v_valor,'$',''))));
       -- Verificar si el separador decimal es la coma con 1 o 2 decimales
       IF (INSTR(v_precio, ',', length(v_precio)-2) > 0) THEN
         -- saco los separadores de miles punto
         v_precio := REPLACE(v_precio,'.','');
         -- reemplazo la coma por el punto 
         v_precio := REPLACE(v_precio,',','.');  
       ELSE
         -- Verificar si el separador decimal es el punto con 1 o 2 decimales
         IF (INSTR(v_precio, '.', length(v_precio)-2) > 0) THEN
         -- saco los separadores de miles coma
           v_precio := REPLACE(v_precio,',','');
         ELSE  
           -- No se encontro separador decimal
           -- Verificar si hay separador de miles coma
           IF (INSTR(v_precio, ',', length(v_precio)-3) = length(v_precio)-3) THEN
             -- si no hay un punto
             IF (INSTR(v_precio, '.') = 0) THEN
               -- saco los separadores de miles coma
               v_precio := REPLACE(v_precio,',','');
             ELSE
               v_mensaje := v_mensaje||'Error en fila Nº:'||v_nrolinea||': El valor del campo PRECIO: '||v_valor||' no es válido.<br>';    
             END IF;
           ELSE
             -- Verificar si hay separador de miles punto
             IF (INSTR(v_precio, '.', length(v_precio)-3) = length(v_precio)-3) THEN
               -- si no hay una coma
               IF (INSTR(v_precio, ',') = 0) THEN
                 -- saco los separadores de miles PUNTO
                 v_precio := REPLACE(v_precio,'.','');
               ELSE
                 v_mensaje := v_mensaje ||'Error en fila Nº '||v_nrolinea||': El valor del campo PRECIO: '||v_valor||' no es válido.<br>';    
               END IF;
             ELSE  
               -- si estoy en este punto no deberia haber ni puntos, ni comas.
               IF ((INSTR(v_precio, '.') > 0) OR (INSTR(v_precio, ',') > 0)) THEN                    
                 v_mensaje := v_mensaje ||'Error en fila Nº '||v_nrolinea||': El valor del campo PRECIO: '||v_valor||' no es válido.<br>';    
               END IF;
               --
             END IF;
             --
           END IF;
           --  
         END IF;
         --  
       END IF;
       --
       BEGIN
         v_precio := TO_NUMBER(v_precio,'999999999999.99');
       EXCEPTION
         WHEN OTHERS THEN  
           v_mensaje := v_mensaje ||'Error en fila Nº '||v_nrolinea||': El valor del campo PRECIO: '||v_valor||' no es numerico.<br>';
       END;       
       --
     ELSE        
       v_mensaje := v_mensaje ||'Error en fila Nº '||v_nrolinea||': El valor del campo PRECIO no ha sido indicado y es un dato obligatorio.<br>';  
     END IF; 
     --FIN PRECIO
     
     --FECHA
     v_valor := REPLACE(COM_PKG.OBTN_VALOR_COL(p_linea     => v_linea_str
                                              ,p_columna   => 9
                                              ,p_separador => p_separador),'"','');
     --
     IF v_valor IS NOT NULL THEN        
       BEGIN 
         BEGIN
           --ASIGNO FECHA teniendo en cuenta el formato DD/MM/YYYY
           v_fecha := TO_DATE(v_valor,'DD/MM/YYYY');            
         EXCEPTION
           WHEN OTHERS THEN  
             --ASIGNO FECHA si dicho formato no fue reconocido pruebo el formato DD-MM-YYYY
             v_fecha := TO_DATE(v_valor,'DD-MM-YYYY');              
         END;
       EXCEPTION
         WHEN OTHERS THEN            
           v_mensaje := v_mensaje ||'Error en fila Nº '||v_nrolinea||': El valor del campo FECHA: '||v_valor||' no tiene el formato válido DD/MM/YYYY.<br>';
       END;  
       --Validar FECHA menor a HOY - FECHA INICIO CAMPAÑA menor a FECHA
       COMCAM_SET(p_id   => v_comcam_id);
       COMCAM_GET(p_comcam => v_comcam);
       COMCAM_INI; 
       IF TO_CHAR(v_fecha,'DD/MM/YYYY') > TO_CHAR(SYSDATE,'DD/MM/YYYY') THEN
         v_mensaje := v_mensaje ||'Error en fila Nº '||v_nrolinea||': El valor del campo FECHA ('||TO_CHAR(v_fecha,'DD/MM/YYYY')||') es mayor a la fecha de hoy ('||TO_CHAR(SYSDATE,'DD/MM/YYYY')||').<br>';     
       END IF;        
       --IF TO_CHAR(v_comcam.FECHA_INICIO_CAMPANIA,'DD/MM/YYYY') >  TO_CHAR(v_fecha,'DD/MM/YYYY') THEN 
       IF v_comcam.FECHA_INICIO_CAMPANIA > v_fecha THEN
        IF v_comcam.FECHA_INICIO_CAMPANIA <> v_fecha THEN
         v_mensaje := v_mensaje ||'Error en fila Nº '||v_nrolinea||': El valor del campo FECHA ('||TO_CHAR(v_fecha,'DD/MM/YYYY')||') es menor a la fecha de inicio de campaña ('||TO_CHAR(v_comcam.FECHA_INICIO_CAMPANIA,'DD/MM/YYYY')||').<br>';     
        END IF;
       END IF;
       --
     ELSE  
       v_mensaje := v_mensaje ||'Error en fila Nº '||v_nrolinea||': El valor del campo FECHA no ha sido indicado y es un dato obligatorio.<br>';  
     END IF;
     --FIN FECHA
     
    END IF;
    v_nrolinea := v_nrolinea + 1;
   END LOOP;
   --
   --
   IF v_mensaje IS NULL THEN
     p_valido  := 'SI';
   ELSE
     p_valido := 'NO';
     p_mensaje := 'El archivo no es válido.<br>'|| v_mensaje;
   END IF;
   --
   --
 EXCEPTION
   WHEN OTHERS THEN
    p_mensaje := 'El Archivo no pudo ser validado.<br>'||v_mensaje||sqlerrm;
    p_valido := 'NO';
 END;
PROCEDURE COMCAI_MODIFICAR
 (P_COMCAI_ID IN NUMBER
 ,P_COMENT_ID IN NUMBER
 ,P_LOCALIDAD IN VARCHAR2
 ,P_OBSERVACION IN VARCHAR2
 ,P_COMZON_ID IN VARCHAR2
 )
 IS
BEGIN
 COMCAI_MODIFICAR_VLD(P_COMCAI_ID => P_COMCAI_ID                     
                     ,P_COMENT_ID => P_COMENT_ID                     
                     ,P_LOCALIDAD => P_LOCALIDAD
                     ,P_OBSERVACION => P_OBSERVACION
                     ,P_COMZON_ID => P_COMZON_ID  
                     );
 --
 UPDATE COM_CAMPANIAS_ITEMS
    SET COMENT_ID   = P_COMENT_ID
      , LOCALIDAD   = P_LOCALIDAD
      , OBSERVACION = P_OBSERVACION
      , COMZON_ID      = P_COMZON_ID
  WHERE ID = P_COMCAI_ID;
 --                  
END;
PROCEDURE COMCAI_MODIFICAR_VLD
 (P_COMCAI_ID IN NUMBER
 ,P_COMENT_ID IN NUMBER
 ,P_LOCALIDAD IN VARCHAR2
 ,P_OBSERVACION IN VARCHAR2
 ,P_COMZON_ID IN VARCHAR2
 )
 IS
v_coment  com_entidades%rowtype; 
v_comcai  com_campanias_items%rowtype; 
--
begin
  -- Verificar los parametros obligatorios
  if p_comcai_id is null then
    raise_application_error(-20000,'El Item de la Campaña no ha sido indicado y es un dato obligatorio',true);
  elsif p_coment_id is null then
    raise_application_error(-20000,'La Entidad no ha sido indicada y es un dato obligatorio',true);	
  end if;
  --  
  -- Verificar CampañaItems
  COMCAI_SET(p_id   => p_comcai_id);
  COMCAI_GET(p_comcai => v_comcai);
  COMCAI_INI;  
  if v_comcai.ID is null then  
   raise_application_error(-20000,'El Item de la Campaña indicadO es incorrecta',true);
  end if;
  --
  -- Verificar Entidad 
  COMENT_SET(p_id   => p_coment_id);
  COMENT_GET(p_coment => v_coment);
  COMENT_INI;  
  if v_coment.ID is null then  
   raise_application_error(-20000,'La Entidad indicada es incorrecta',true);
  end if;
  --
  /*Vericar cambios
  if nvl(v_comcai.COMENT_ID,0) = nvl(P_COMENT_ID,0) and
     nvl(v_comcai.LOCALIDAD,'#') = nvl(P_LOCALIDAD,'#') and     
     nvl(v_comcai.OBSERVACION,'#') = nvl(p_observacion,'#') and
     nvl(v_comcai.COMZON_ID,0) = nvl(P_COMZON_ID,0) then
    raise_application_error(-20000,'No hay cambios a aplicar',true);  
  end if; 
  */
end;
PROCEDURE COMCAM_ANALIZAR
 (P_COMCAM_ID IN NUMBER
 ,P_FECHA IN DATE := SYSDATE
 ,P_MOTIVO IN VARCHAR2 := 'NULL'
 )
 IS
-- Items a Analizar
 cursor cr_comcit (p_comcob_id number )is
  select ID
    from COM_CATALOGO_ITEMS
   where COMCOB_ID = p_comcob_id
     and CONTROL_PRECIOS_SN = 'SI'
     and SITUACION = 'VIG';
  --      
 cursor cr_comzon is
  select ID
    from COM_ZONAS
   where SITUACION = 'VIG';
  --      
v_comcam COM_CAMPANIAS%rowtype;
v_comcap COM_CAMPANIAS_PRECIOS%rowtype;  
v_comcae_crear COM_CAMPANIAS_EST%rowtype;
v_sumatoria NUMBER := 0;
v_precios_obtenidos   number := 0;
begin                                    
  -- Validar poner en Analisis
  COMCAM_ANALIZAR_VLD(P_COMCAM_ID => P_COMCAM_ID
                     ,P_FECHA     => P_FECHA
                     ,P_MOTIVO    => P_MOTIVO);
  --    
  -- Obtener datos de Campaña
  COMCAM_SET(p_id => p_comcam_id);
  COMCAM_GET(p_comcam => v_comcam);
  COMCAM_INI;
  --           
  -- Insetar los Items a Analizar
  for v_comcit in cr_comcit(p_comcob_id => v_comcam.COMCOB_ID ) loop
   --  
    -- Inserto para Precio Global 
    v_comcap.COMCAM_ID   := p_comcam_id;
    v_comcap.COMCIT_ID   := v_comcit.ID;
    v_comcap.COMZON_ID   := null;
    v_comcap.OBSERVACION := null; 
    v_comcap.SITUACION   := 'VAL';
    v_comcap.FECHA_SITUACION  := SYSDATE;
    v_comcap.MOTIVO_SITUACION := '';
     
    -- Precio Promedio Relevado    
    v_comcap.PRECIO_RELEVADO := COMCAP_PRE_AVG_COMCAI(
                                         P_COMCAM_ID => p_comcam_id
		                               , P_COMCIT_ID => v_comcit.ID
		                               , P_COMZON_ID => null);   
    -- Precio Vigente Global
    v_comcap.PRECIO_VIGENTE_GLOBAL := COMCIT_OBTN_PRECIO_TESTIGO(
                                         P_COMCIT_ID => v_comcit.ID
                                        ,P_COMZON_ID => null); 
    -- Precio Vigente de la Zona
    v_comcap.PRECIO_VIGENTE_ZONA := null;

    -- Precio Ultimo Adjudicado
    v_comcap.PRECIO_ULTIMO_ADJUDICADO := COMCAP_PRE_ULT_ADJ(
                                         P_COMCIT_ID => v_comcit.ID); 
    -- Precio Promedio Ultimos Adjudicados
    v_comcap.PRECIO_PROMEDIO_ADJUDICADO := COMCAP_PRE_AVG_ADJ(
                                         P_COMCIT_ID => v_comcit.ID); 
    -- Precio Sugerido   
      v_sumatoria := 0;
      v_precios_obtenidos := 0;    
      -- Obtengo precio promedio colectado
      if nvl(v_comcap.PRECIO_RELEVADO,0) <> 0 then
        v_sumatoria := v_sumatoria + v_comcap.PRECIO_RELEVADO;
        v_precios_obtenidos := v_precios_obtenidos + 1;
      end if; 
      --  
      -- Obtengo precio testigo global
      if nvl(v_comcap.PRECIO_VIGENTE_GLOBAL,0) <> 0 then
        v_sumatoria := v_sumatoria + v_comcap.PRECIO_VIGENTE_GLOBAL;
        v_precios_obtenidos := v_precios_obtenidos + 1;
      end if; 
      --  
      -- Obtengo precio testigo por zona
      if nvl(v_comcap.PRECIO_VIGENTE_ZONA,0) <> 0 then
        v_sumatoria := v_sumatoria + v_comcap.PRECIO_VIGENTE_ZONA;
        v_precios_obtenidos := v_precios_obtenidos + 1;
      end if; 
      --  
      -- Obtengo precio ultimo adjudicado
      if nvl(v_comcap.PRECIO_ULTIMO_ADJUDICADO,0) <> 0 then
        v_sumatoria := v_sumatoria + v_comcap.PRECIO_ULTIMO_ADJUDICADO;
        v_precios_obtenidos := v_precios_obtenidos + 1;
      end if; 
      --  
      -- Obtengo precio promedio ultimos adjudicados
      if nvl(v_comcap.PRECIO_PROMEDIO_ADJUDICADO,0) <> 0 then
        v_sumatoria := v_sumatoria + v_comcap.PRECIO_PROMEDIO_ADJUDICADO;
        v_precios_obtenidos := v_precios_obtenidos + 1; 
      end if; 
      -- 
      --
      if v_precios_obtenidos <> 0 then
         v_sumatoria := v_sumatoria/v_precios_obtenidos;
      end if;
      --   
      v_comcap.PRECIO_SUGERIDO := v_sumatoria; 
      --  
    COMCAP_INS(p_comcap => v_comcap);
    --
    for v_comzon in cr_comzon loop
      -- Inserto para Precio Global 
      v_comcap.COMCAM_ID   := p_comcam_id;
      v_comcap.COMCIT_ID   := v_comcit.ID;
      v_comcap.COMZON_ID   := v_comzon.ID;
      v_comcap.OBSERVACION := null;   
      v_comcap.SITUACION   := 'VAL';
      v_comcap.FECHA_SITUACION  := SYSDATE;
      v_comcap.MOTIVO_SITUACION := '';
      -- Precio Promedio Relevado
      v_comcap.PRECIO_RELEVADO := COMCAP_PRE_AVG_COMCAI(
                                         P_COMCAM_ID => p_comcam_id
 		                               , P_COMCIT_ID => v_comcit.ID
		                               , P_COMZON_ID => v_comzon.ID); 
      -- Precio Vigente Global
      v_comcap.PRECIO_VIGENTE_GLOBAL := COMCIT_OBTN_PRECIO_TESTIGO(
                                         P_COMCIT_ID => v_comcit.ID
                                        ,P_COMZON_ID => null); 
      -- Precio Vigente de la Zona
      v_comcap.PRECIO_VIGENTE_ZONA := COMCIT_OBTN_PRECIO_TESTIGO(
                                         P_COMCIT_ID => v_comcit.ID
                                        ,P_COMZON_ID => v_comzon.ID); 
      -- Precio Ultimo Adjudicado
      v_comcap.PRECIO_ULTIMO_ADJUDICADO := COMCAP_PRE_ULT_ADJ(
                                         P_COMCIT_ID => v_comcit.ID); 
      -- Precio Promedio Ultimos Adjudicados
      v_comcap.PRECIO_PROMEDIO_ADJUDICADO := COMCAP_PRE_AVG_ADJ(
                                         P_COMCIT_ID => v_comcit.ID); 

      -- Precio Sugerido
      v_sumatoria := 0;
      v_precios_obtenidos := 0;

      -- Obtengo precio promedio colectado
      if nvl(v_comcap.PRECIO_RELEVADO,0) <> 0 then
        v_sumatoria := v_sumatoria + v_comcap.PRECIO_RELEVADO;
        v_precios_obtenidos := v_precios_obtenidos + 1;
      end if; 
      --  
      -- Obtengo precio testigo global
      if nvl(v_comcap.PRECIO_VIGENTE_GLOBAL,0) <> 0 then
        v_sumatoria := v_sumatoria + v_comcap.PRECIO_VIGENTE_GLOBAL;
        v_precios_obtenidos := v_precios_obtenidos + 1;
      end if; 
      --  
      -- Obtengo precio testigo por zona
      if nvl(v_comcap.PRECIO_VIGENTE_ZONA,0) <> 0 then
        v_sumatoria := v_sumatoria + v_comcap.PRECIO_VIGENTE_ZONA;
        v_precios_obtenidos := v_precios_obtenidos + 1;
      end if; 
      --  
      -- Obtengo precio ultimo adjudicado
      if nvl(v_comcap.PRECIO_ULTIMO_ADJUDICADO,0) <> 0 then
        v_sumatoria := v_sumatoria + v_comcap.PRECIO_ULTIMO_ADJUDICADO;
        v_precios_obtenidos := v_precios_obtenidos + 1;
      end if; 
      --  
      -- Obtengo precio promedio ultimos adjudicados
      if nvl(v_comcap.PRECIO_PROMEDIO_ADJUDICADO,0) <> 0 then
        v_sumatoria := v_sumatoria + v_comcap.PRECIO_PROMEDIO_ADJUDICADO;
        v_precios_obtenidos := v_precios_obtenidos + 1; 
      end if; 
      -- 
      --
      if v_precios_obtenidos <> 0 then
         v_sumatoria := v_sumatoria/v_precios_obtenidos;
      end if;
      --   
      v_comcap.PRECIO_SUGERIDO := v_sumatoria; 
      --      
      COMCAP_INS(p_comcap => v_comcap);
      --
    end loop;    
   --
  end loop;
  --
  -- Inserto Estado
  select COMCAE_ID.NEXTVAL
  into   v_comcae_crear.ID
  from   dual;
  --
  v_comcae_crear.COMCAM_ID := p_comcam_id;
  v_comcae_crear.FECHA     := p_fecha;
  v_comcae_crear.ESTADO    := 'ANA';
  v_comcae_crear.MOTIVO    := p_motivo;
  --
  COMCAE_INS(p_comcae => v_comcae_crear);                     
  --                   
end;
FUNCTION COMCAM_ANALIZAR_SN
 (P_COMCAM_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
begin
  COMCAM_ANALIZAR_VLD(p_comcam_id => p_comcam_id);
  return 'SI';
exception
  when others then
    return 'NO';
end;
PROCEDURE COMCAM_ANALIZAR_VLD
 (P_COMCAM_ID IN NUMBER
 ,P_FECHA IN DATE := SYSDATE
 ,P_MOTIVO IN VARCHAR2 := 'NULL'
 )
 IS
v_comcam COM_CAMPANIAS%rowtype;
v_comcae COM_CAMPANIAS_EST%rowtype;
begin
  -- Verificar los parametros obligatorios
  if p_comcam_id is null then
    raise_application_error(-20000,'La Campaña no ha sido indicada y es un dato obligatorio',true);
  end if;

  -- Verificar los valores de los parametros
  COMCAM_SET(p_id => p_comcam_id);
  COMCAM_GET(p_comcam => v_comcam);
  COMCAM_INI;
  --    
  COMCAE_SET(p_id => v_comcam.COMCAE_ID);
  COMCAE_GET(p_comcae => v_comcae);
  COMCAE_INI;
  --
  if v_comcam.ID is null then
    raise_application_error(-20000,'La Campaña indicada es incorrecta',true);   
  end if;
  -- Verificar la consistencia de los datos
  if v_comcae.ESTADO = 'ANA' then    
    raise_application_error(-20000,'La Campaña indicada ya se encuentra ANALIZADA',true);   
  end if;  
  --   
  if v_comcae.ESTADO <> 'INI' then
    raise_application_error(-20000,'La Campaña indicada no puede ser ANALIZADA, por no encontrarse INICIADA',true);   
  end if;
end;
PROCEDURE COMCAM_ANULAR
 (P_COMCAM_ID IN NUMBER
 ,P_FECHA IN DATE := SYSDATE
 ,P_MOTIVO IN VARCHAR2 := 'NULL'
 )
 IS
v_comcae_crear COM_CAMPANIAS_EST%rowtype;
begin
  -- Validar Estado
  COMCAM_ANULAR_VLD(P_COMCAM_ID => P_COMCAM_ID
                    ,P_FECHA     => P_FECHA
                    ,P_MOTIVO    => P_MOTIVO);
  --
  -- Inserto Estado
  select COMCAE_ID.NEXTVAL
  into   v_comcae_crear.ID
  from   dual;
  --
  v_comcae_crear.COMCAM_ID := p_comcam_id;
  v_comcae_crear.FECHA     := p_fecha;
  v_comcae_crear.ESTADO    := 'ANU';
  v_comcae_crear.MOTIVO    := p_motivo;
  --
  COMCAE_INS(p_comcae => v_comcae_crear);                     
  --                   
end;
FUNCTION COMCAM_ANULAR_SN
 (P_COMCAM_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
begin
  COMCAM_ANULAR_VLD(p_comcam_id => p_comcam_id);
  return 'SI';
exception
  when others then
    return 'NO';
end;
PROCEDURE COMCAM_ANULAR_VLD
 (P_COMCAM_ID IN NUMBER
 ,P_FECHA IN DATE := SYSDATE
 ,P_MOTIVO IN VARCHAR2 := 'NULL'
 )
 IS
v_comcam COM_CAMPANIAS%rowtype;
v_comcae COM_CAMPANIAS_EST%rowtype;
begin
  -- Verificar los parametros obligatorios
  if p_comcam_id is null then
    raise_application_error(-20000,'La Campaña no ha sido indicada y es un dato obligatorio',true);
  end if;

  -- Verificar los valores de los parametros
  COMCAM_SET(p_id => p_comcam_id);
  COMCAM_GET(p_comcam => v_comcam);
  COMCAM_INI;
  --    
  COMCAE_SET(p_id => v_comcam.COMCAE_ID);
  COMCAE_GET(p_comcae => v_comcae);
  COMCAE_INI;
  --
  if v_comcam.ID is null then
    raise_application_error(-20000,'La Campaña indicada es incorrecta',true);   
  end if;
  -- Verificar la consistencia de los datos
  if v_comcae.ESTADO = 'ANU' then    
    raise_application_error(-20000,'La Campaña indicada ya se encuentra ANULADA',true);   
  end if;  
  -- 
  if v_comcae.ESTADO NOT IN ('NUE','PEN','INI','ANA') then
    raise_application_error(-20000,'La Campaña indicada no puede ser ANULADA, por no encontrarse NUEVA, PENDIENTE, INICIADA o ANALIZADA',true);   
  end if;  
end;
PROCEDURE COMCAM_CANCELAR_ANALIZAR
 (P_COMCAM_ID IN NUMBER
 ,P_FECHA IN DATE := SYSDATE
 ,P_MOTIVO IN VARCHAR2 := 'NULL'
 )
 IS
v_comcam COM_CAMPANIAS%rowtype;
v_comcae_crear COM_CAMPANIAS_EST%rowtype;
begin                                    
  -- Validar poner en Analisis
  COMCAM_CANCELAR_ANALIZAR_VLD(P_COMCAM_ID => P_COMCAM_ID
                              ,P_FECHA     => P_FECHA
                              ,P_MOTIVO    => P_MOTIVO);
  --    
  -- Obtener datos de Campaña
  COMCAM_SET(p_id => p_comcam_id);
  COMCAM_GET(p_comcam => v_comcam);
  COMCAM_INI;
  --           
  -- Anulo el analisis anterior si existiera
  UPDATE COM_CAMPANIAS_PRECIOS
     SET SITUACION = 'ANU'
        ,FECHA_SITUACION = SYSDATE
        ,MOTIVO_SITUACION = 'Se Canceló el Analisis de la Campaña'
   WHERE COMCAM_ID = p_comcam_id
     AND SITUACION = 'VAL';
  --         
  -- Inserto Estado
  select COMCAE_ID.NEXTVAL
  into   v_comcae_crear.ID
  from   dual;
  --
  v_comcae_crear.COMCAM_ID := p_comcam_id;
  v_comcae_crear.FECHA     := p_fecha;
  v_comcae_crear.ESTADO    := 'INI';
  v_comcae_crear.MOTIVO    := p_motivo;
  --
  COMCAE_INS(p_comcae => v_comcae_crear);                     
  --                   
end;
FUNCTION COMCAM_CANCELAR_ANALIZAR_SN
 (P_COMCAM_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
begin
  COMCAM_CANCELAR_ANALIZAR_VLD(p_comcam_id => p_comcam_id);
  return 'SI';
exception
  when others then
    return 'NO';
end;
PROCEDURE COMCAM_CANCELAR_ANALIZAR_VLD
 (P_COMCAM_ID IN NUMBER
 ,P_FECHA IN DATE := SYSDATE
 ,P_MOTIVO IN VARCHAR2 := 'NULL'
 )
 IS
v_comcam COM_CAMPANIAS%rowtype;
v_comcae COM_CAMPANIAS_EST%rowtype;
begin
  -- Verificar los parametros obligatorios
  if p_comcam_id is null then
    raise_application_error(-20000,'La Campaña no ha sido indicada y es un dato obligatorio',true);
  end if;

  -- Verificar los valores de los parametros
  COMCAM_SET(p_id => p_comcam_id);
  COMCAM_GET(p_comcam => v_comcam);
  COMCAM_INI;
  --    
  COMCAE_SET(p_id => v_comcam.COMCAE_ID);
  COMCAE_GET(p_comcae => v_comcae);
  COMCAE_INI;
  --
  if v_comcam.ID is null then
    raise_application_error(-20000,'La Campaña indicada es incorrecta',true);   
  end if;
  -- Verificar la consistencia de los datos
  if v_comcae.ESTADO = 'INI' then    
    raise_application_error(-20000,'La Campaña indicada ya se encuentra INICIADA',true);   
  end if;  
  --   
  if v_comcae.ESTADO <> 'ANA' then
    raise_application_error(-20000,'La Campaña analizada no puede ser re Iniciada, por no encontrarse INICIADA',true);   
  end if;
end;
PROCEDURE COMCAM_CREAR
 (P_SEGORG_ID IN NUMBER
 ,P_CODIGO IN VARCHAR2
 ,P_NOMBRE IN VARCHAR2
 ,P_DESCRIPCION IN VARCHAR2
 ,P_COMCOB_ID IN NUMBER
 ,P_COMCAE_ID IN NUMBER
 ,P_FECHA_INICIO_CAMPANIA IN DATE
 ,P_FECHA_FIN_COLECTAR IN DATE
 ,P_FECHA_FIN_ANALISIS IN DATE
 ,P_FECHA_FIN_CAMPANIA IN DATE
 ,P_COMCAM_ID OUT NUMBER
 )
 IS
v_comcam_crear COM_CAMPANIAS%rowtype;
v_comcae_crear COM_CAMPANIAS_EST%rowtype;
begin

  -- Validar la la Creación
  COMCAM_CREAR_VLD( p_segorg_id            => p_segorg_id
                 , p_codigo                => p_codigo
                 , p_nombre                => p_nombre
                 , p_descripcion           => p_descripcion
                 , p_comcob_id             => p_comcob_id
                 , p_comcae_id             => p_comcae_id
				 , p_fecha_inicio_campania => p_fecha_inicio_campania
				 , p_fecha_fin_colectar    => p_fecha_fin_colectar
				 , p_fecha_fin_analisis    => p_fecha_fin_analisis
				 , p_fecha_fin_campania    => p_fecha_fin_campania);
  
 
   -- Registrar
  select COMCAM_ID.NEXTVAL
  into   v_comcam_crear.ID
  from   dual;
  --  
  -- Registrar
  --  
  v_comcam_crear.SEGORG_ID             := p_segorg_id;
  v_comcam_crear.CODIGO                := p_codigo;
  v_comcam_crear.NOMBRE                := p_nombre;
  v_comcam_crear.DESCRIPCION           := p_descripcion;
  v_comcam_crear.COMCOB_ID             := p_comcob_id;
  v_comcam_crear.COMCAE_ID             := NULL;
  v_comcam_crear.FECHA_INICIO_CAMPANIA := p_fecha_inicio_campania;
  v_comcam_crear.FECHA_FIN_COLECTAR    := p_fecha_fin_colectar;
  v_comcam_crear.FECHA_FIN_ANALISIS    := p_fecha_fin_analisis;
  v_comcam_crear.FECHA_FIN_CAMPANIA    := p_fecha_fin_campania;
  --
  COMCAM_INS(p_comcam => v_comcam_crear);
  --                                                  
  -- Registrar Estado de Campaña
  select COMCAE_ID.NEXTVAL
  into   v_comcae_crear.ID
  from   dual;
  --  
  v_comcae_crear.COMCAM_ID             := v_comcam_crear.ID;
  v_comcae_crear.ESTADO                := 'PEN';
  v_comcae_crear.FECHA                 := SYSDATE;
  v_comcae_crear.MOTIVO                := ' ';

  --
  COMCAE_INS(p_comcae => v_comcae_crear);
  --                                                  
  -- Cargar la variable de retorno con el Id creado.
  p_comcam_id := v_comcam_crear.ID;  
  --
  
end;
PROCEDURE COMCAM_CREAR_VLD
 (P_SEGORG_ID IN NUMBER
 ,P_NOMBRE IN VARCHAR2
 ,P_CODIGO IN VARCHAR2
 ,P_DESCRIPCION IN VARCHAR2
 ,P_COMCOB_ID IN NUMBER
 ,P_COMCAE_ID IN NUMBER
 ,P_FECHA_INICIO_CAMPANIA IN DATE
 ,P_FECHA_FIN_COLECTAR IN DATE
 ,P_FECHA_FIN_ANALISIS IN DATE
 ,P_FECHA_FIN_CAMPANIA IN DATE
 )
 IS
v_comcam  com_campanias%rowtype;
begin
  -- Verificar los parametros obligatorios

 if p_codigo is null then
    raise_application_error(-20000,'El Código no ha sido indicado y es un dato obligatorio',true);
  elsif p_segorg_ID is null then
    raise_application_error(-20000,'La Organización no ha sido indicada y es un dato obligatorio',true);	
  elsif p_comcob_id is null then
    raise_application_error(-20000,'El Objeto de Gasto de la Campaña no ha sido indicado y es un dato obligatorio',true);
  elsif p_fecha_inicio_campania is null then
    raise_application_error(-20000,'La Fecha de Inicio de la Campaña no ha sido indicada y es un dato obligatorio',true);
  elsif p_fecha_fin_colectar is null then
    raise_application_error(-20000,'La Fecha de Finalización de Recolección de datos de la Campaña no ha sido indicada y es un dato obligatorio',true);
  elsif p_fecha_fin_analisis is null then
    raise_application_error(-20000,'La Fecha de Finalización de Análisis de datos de la Campaña no ha sido indicada y es un dato obligatorio',true);	
  elsif p_fecha_fin_campania is null then
    raise_application_error(-20000,'La Fecha de Finalización de la Campaña no ha sido indicada y es un dato obligatorio',true);	
  end if;
  --                                 
  
  -- Verificar no duplicidad de datos
  COMCAM_SET_CODIGO(p_segorg_id   => p_segorg_id
                  , p_codigo      => p_codigo);
  COMCAM_GET(p_comcam => v_comcam);

  if v_comcam.ID is not null then
  COMCAM_INI;
   raise_application_error(-20000,'La Campaña con el Código indicado ya se encuentra registrada',true);
  end if;
  --
              
  -- Controlar Fecha de Inicio de Campaña
  if p_fecha_inicio_campania > p_fecha_fin_colectar then
    raise_application_error(-20000,'La Fecha de Inicio de la Campaña debe ser menor o igual a la Fecha de Finalización de Recolección de datos.',true);
  elsif p_fecha_inicio_campania > p_fecha_fin_analisis then
    raise_application_error(-20000,'La Fecha de Inicio de la Campaña debe ser menor o igual a la Fecha de Finalización de Análisis de datos.',true);  
  elsif p_fecha_inicio_campania > p_fecha_fin_campania then
    raise_application_error(-20000,'La Fecha de Inicio de la Campaña debe ser menor o igual a la Fecha de Finalización de Campaña.',true);
  end if;
  
  -- Controlar Fecha de Fin de Finalización de Recolección de datos
  if p_fecha_fin_colectar > p_fecha_fin_analisis then
    raise_application_error(-20000,'La Fecha de Finalización de Recolección de datos de la Campaña debe ser menor o igual a la Fecha de Finalización de Análisis de datos.',true);
  elsif p_fecha_fin_colectar > p_fecha_fin_Campania then
    raise_application_error(-20000,'La Fecha de Finalización de Recolección de datos de la Campaña debe ser menor o igual a la Fecha de Finalización de Campaña.',true);
  end if;
  
  -- Controlar Fecha de Finalización de Análisis de datos 
  if p_fecha_fin_analisis > p_fecha_fin_Campania then 
    raise_application_error(-20000,'La Fecha de Finalización de Análisis de datos de la Campaña debe ser menor o igual a la Fecha de Finalización de Campaña.',true);	
  end if;            
              
  --Verificar que el objeto contega item
  --            
              

end;
PROCEDURE COMCAM_FINALIZAR
 (P_COMCAM_ID IN NUMBER
 ,P_FECHA IN DATE := SYSDATE
 ,P_MOTIVO IN VARCHAR2 := 'NULL'
 )
 IS
v_comcae_crear COM_CAMPANIAS_EST%rowtype;
begin
  -- Validar Estado
  COMCAM_FINALIZAR_VLD(P_COMCAM_ID => P_COMCAM_ID
                    ,P_FECHA     => P_FECHA
                    ,P_MOTIVO    => P_MOTIVO);
  --  
  COMCAP_CONFIRMAR(P_COMCAM_ID => P_COMCAM_ID
                  ,P_FECHA     => P_FECHA
                  ,P_MOTIVO    => P_MOTIVO);
  -- Inserto Estado
  select COMCAE_ID.NEXTVAL
  into   v_comcae_crear.ID
  from   dual;
  --
  v_comcae_crear.COMCAM_ID := p_comcam_id;
  v_comcae_crear.FECHA     := p_fecha;
  v_comcae_crear.ESTADO    := 'FIN';
  v_comcae_crear.MOTIVO    := p_motivo;
  --
  COMCAE_INS(p_comcae => v_comcae_crear);                     
  --                   
end;
FUNCTION COMCAM_FINALIZAR_SN
 (P_COMCAM_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
begin
  COMCAM_FINALIZAR_VLD(p_comcam_id => p_comcam_id);
  return 'SI';
exception
  when others then
    return 'NO';
end;
PROCEDURE COMCAM_FINALIZAR_VLD
 (P_COMCAM_ID IN NUMBER
 ,P_FECHA IN DATE := SYSDATE
 ,P_MOTIVO IN VARCHAR2 := 'NULL'
 )
 IS
v_comcam COM_CAMPANIAS%rowtype;
v_comcae COM_CAMPANIAS_EST%rowtype;
begin
  -- Verificar los parametros obligatorios
  if p_comcam_id is null then
    raise_application_error(-20000,'La Campaña no ha sido indicada y es un dato obligatorio',true);
  end if;

  -- Verificar los valores de los parametros
  COMCAM_SET(p_id => p_comcam_id);
  COMCAM_GET(p_comcam => v_comcam);
  COMCAM_INI;
  --    
  COMCAE_SET(p_id => v_comcam.COMCAE_ID);
  COMCAE_GET(p_comcae => v_comcae);
  COMCAE_INI;
  --
  if v_comcam.ID is null then
    raise_application_error(-20000,'La Campaña indicada es incorrecta',true);   
  end if;
  -- Verificar la consistencia de los datos
  if v_comcae.ESTADO = 'FIN' then    
    raise_application_error(-20000,'La Campaña indicada ya se encuentra FINALIZADA',true);   
  end if;  
  --       
  if v_comcae.ESTADO <> 'ANA' then
    raise_application_error(-20000,'La Campaña indicada no puede ser FINALIZADA, por no encontrarse ANALIZADA',true);   
  end if;
end;
PROCEDURE COMCAM_INICIAR
 (P_COMCAM_ID IN NUMBER
 ,P_FECHA IN DATE := SYSDATE
 ,P_MOTIVO IN VARCHAR2 := 'NULL'
 )
 IS
v_comcae_crear COM_CAMPANIAS_EST%rowtype;
begin
  -- Validar Estado
  COMCAM_INICIAR_VLD(P_COMCAM_ID => P_COMCAM_ID
                    ,P_FECHA     => P_FECHA
                    ,P_MOTIVO    => P_MOTIVO);
  --
  -- Inserto Estado
  select COMCAE_ID.NEXTVAL
  into   v_comcae_crear.ID
  from   dual;
  --
  v_comcae_crear.COMCAM_ID := p_comcam_id;
  v_comcae_crear.FECHA     := p_fecha;
  v_comcae_crear.ESTADO    := 'INI';
  v_comcae_crear.MOTIVO    := p_motivo;
  --
  COMCAE_INS(p_comcae => v_comcae_crear);                     
  --                   
end;
FUNCTION COMCAM_INICIAR_SN
 (P_COMCAM_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
begin
  COMCAM_INICIAR_VLD(p_comcam_id => p_comcam_id);
  return 'SI';
exception
  when others then
    return 'NO';
end;
PROCEDURE COMCAM_INICIAR_VLD
 (P_COMCAM_ID IN NUMBER
 ,P_FECHA IN DATE := SYSDATE
 ,P_MOTIVO IN VARCHAR2 := 'NULL'
 )
 IS
v_comcam COM_CAMPANIAS%rowtype;
v_comcae COM_CAMPANIAS_EST%rowtype;
begin
  -- Verificar los parametros obligatorios
  if p_comcam_id is null then
    raise_application_error(-20000,'La Campaña no ha sido indicada y es un dato obligatorio',true);
  end if;

  -- Verificar los valores de los parametros
  COMCAM_SET(p_id => p_comcam_id);
  COMCAM_GET(p_comcam => v_comcam);
  COMCAM_INI;
  --    
  COMCAE_SET(p_id => v_comcam.COMCAE_ID);
  COMCAE_GET(p_comcae => v_comcae);
  COMCAE_INI;
  --
  if v_comcam.ID is null then
    raise_application_error(-20000,'La Campaña indicada es incorrecta',true);   
  end if;
  -- Verificar la consistencia de los datos
  if v_comcae.ESTADO = 'INI' then    
    raise_application_error(-20000,'La Campaña indicada ya se encuentra INICIADA',true);   
  end if;  
  -- 
  if v_comcae.ESTADO <> 'PEN' then
    raise_application_error(-20000,'La Campaña indicada no puede ser INICIADA, por no encontrarse PENDIENTE',true);   
  end if;
end;
PROCEDURE COMCAP_CONFIRMAR
 (P_COMCAM_ID IN NUMBER
 ,P_FECHA IN DATE
 ,P_MOTIVO IN VARCHAR2 := 'NULL'
 )
 IS
CURSOR CR_COMCAP IS
  SELECT COMCIT_ID
       , PRECIO_SUGERIDO
       , COMZON_ID
    FROM COM_CAMPANIAS_PRECIOS
   WHERE COMCAM_ID = P_COMCAM_ID
     AND SITUACION = 'VAL';
  -- 
  v_comctp_crear COM_CATALOGO_PRECIOS%rowtype;
  --
BEGIN
  --
  FOR v_comcap IN cr_comcap LOOP  
    --
    select COMCTP_ID.NEXTVAL
    into   v_comctp_crear.ID
    from   dual; 
    --  
    v_comctp_crear.COMCIT_ID      := v_comcap.COMCIT_ID;
    v_comctp_crear.PRECIO         := v_comcap.PRECIO_SUGERIDO; 
    v_comctp_crear.FECHA_VIGENCIA := p_fecha;
    v_comctp_crear.FECHA_VALIDEZ  := NULL;
    v_comctp_crear.FECHA          := SYSDATE;
    v_comctp_crear.OBSERVACION    := NULL;
    v_comctp_crear.SITUACION      := 'VAL';
    v_comctp_crear.MOTIVO         := p_motivo;
    v_comctp_crear.COMZON_ID      := v_comcap.COMZON_ID;
    --
    COM_PKG.INS_COMCTP(P_COMCTP =>v_comctp_crear);
    --
  END LOOP;
  --
END;
PROCEDURE COMCAP_CONFIRMAR_VLD
 (P_COMCAM_ID IN NUMBER
 )
 IS
CURSOR CR_COMCAP IS
  SELECT COUNT(ID)
    FROM COM_CAMPANIAS_PRECIOS
   WHERE COMCAM_ID = P_COMCAM_ID
     AND SITUACION = 'VAL';
  --
  v_comcam  com_campanias%rowtype;
  v_dummy NUMBER;
BEGIN
  -- Verificar los parametros obligatorios
 if p_comcam_id is null then
    raise_application_error(-20000,'La Campaña no ha sido indicada y es un dato obligatorio',true);  
  end if;
  --  
  -- Verificar no duplicidad de datos
  COMCAM_SET(p_id   => p_comcam_id);                
  COMCAM_GET(p_comcam => v_comcam); 
  COMCAM_INI;
  --  
  if v_comcam.ID is null then  
    raise_application_error(-20000,'La Campaña indicada es incorrecta.',true);
  end if;
  --
  COMCAE_SET(p_id => v_comcam.COMCAE_ID);
  COMCAE_GET(p_comcae => v_comcae);
  COMCAE_INI;
  -- Verificar que este en ANALISIS
  if v_comcae.ESTADO <> 'ANA' then    
    raise_application_error(-20000,'La Campaña indicada no se encuentra en ANALISIS por lo tanto no puede ser confirmada.',true);   
  end if;  
  --
  --Verificar si existen items para actualizar su precio
  OPEN cr_comcap;  
  FETCH cr_comcap INTO v_dummy;
  CLOSE cr_comcap;            
  --
  IF v_dummy = 0 THEN
    raise_application_error(-20000,'La Campaña indicada no contiene ITEMS para su actualizacion de precio.',true);   
  END IF;
  --
END;
/* Obtener Precio Promedio Colectado para un Item */
FUNCTION COMCAP_PRE_AVG_COMCAI
 (P_COMCAM_ID IN NUMBER
 ,P_COMCIT_ID IN NUMBER
 ,P_COMZON_ID IN NUMBER := NULL
 ,P_FECHA IN DATE := sysdate
 )
 RETURN NUMBER
 IS
-- Obtengo Promedio Precio adjudicado por Zona
  CURSOR cr_comcai_zona IS
  SELECT AVG(PRECIO) PRECIO_AVG
    FROM COM_CAMPANIAS_ITEMS
   WHERE COMCAM_ID = p_comcam_id   
     AND COMCIT_ID = p_comcit_id
     AND COMZON_ID = p_comzon_id
     AND FECHA <= p_fecha;
  --                                       
  -- Obtengo Promedio Ppecio adjudicado Global
  CURSOR cr_comcai_global IS
  SELECT AVG(PRECIO) PRECIO_AVG
    FROM COM_CAMPANIAS_ITEMS
   WHERE COMCAM_ID = p_comcam_id   
     AND COMCIT_ID = p_comcit_id
     AND COMZON_ID is null;
  -- 
  v_retorno NUMBER := null;
  -- Obtiene el Precio trayendo 
  -- el promedio de los precios colectados e importados
begin
  -- Obtengo precio promedio colectado
  if p_comzon_id is null then
      OPEN cr_comcai_global;
      FETCH cr_comcai_global INTO v_retorno;
      CLOSE cr_comcai_global;   
      --
  else
      OPEN cr_comcai_zona;
      FETCH cr_comcai_zona INTO v_retorno;
      CLOSE cr_comcai_zona;   
  --
  end if;    
    
  RETURN v_retorno;
  --
EXCEPTION
  WHEN OTHERS THEN
    RETURN NULL;
END;
/* Obtener Precio Sugerido para un Item */
FUNCTION COMCAP_PRE_AVG_ADJ
 (P_COMCIT_ID IN NUMBER
 ,P_FECHA IN DATE := sysdate
 )
 RETURN NUMBER
 IS
-- Obtengo Promedio Ppecio adjudicado
  CURSOR cr_comczd (p_comcit_id number, p_dias_atras number) IS
  SELECT AVG(comczd.precio_unitario_final) comczd_precio_unitario
     FROM com_ordenes_compras_det comocd,
          com_ordenes_compras comocm,
          com_pedidos_detalles compet,
          com_cotizaciones_detalles comczd
    WHERE comocd.compet_id = compet.ID
      AND comocd.comczd_id = comczd.ID
      AND comocd.comocm_id = comocm.ID
      AND compet.comcit_id = p_comcit_id
      AND comocm.id IN ( SELECT comocm.id
                         FROM com_ordenes_compras_det comocd,
                              com_ordenes_compras comocm,
                              com_ordenes_compras_est comoce, 
                              com_pedidos_detalles compet,
                              com_cotizaciones_detalles comczd
                        WHERE comocd.compet_id = compet.ID
                          AND comocd.comczd_id = comczd.ID
                          AND comocd.comocm_id = comocm.ID
                          AND comocm.comoce_id = comoce.ID
                          AND comoce.estado IN ('APR','NOC','CON') 
                          AND comoce.fecha <= p_fecha
                          AND comoce.fecha > p_fecha-p_dias_atras
                          AND compet.comcit_id = p_comcit_id)
    ;
  --                                        
  v_retorno NUMBER := null;
  v_dias_atras NUMBER := null;
  -- Obtiene el Precio trayendo 
  -- el promedio del precio adjudicado en los ultimos n dias (segun configuracion)
begin
  -- Obtengo Cantidad Días Atras para buscar datos
  v_dias_atras := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo    => 'COMADM_COMCAP_DIAS_ATRAS'
                                           ,p_segorg_id => SEG_PKG.OBTN_ORGUSU(nvl(v('APP_USER'),user)));     
  -- Obtengo Ultimo precio adjudicado
  OPEN cr_comczd(p_comcit_id => p_comcit_id
                ,p_dias_atras => v_dias_atras);
  FETCH cr_comczd INTO v_retorno;
  CLOSE cr_comczd;   
  --
  RETURN v_retorno;
  --
EXCEPTION
  WHEN OTHERS THEN
    RETURN NULL;
END;
/* Obtener Precio Maximo para un Item */
FUNCTION COMCAP_PRE_MAX_ADJ
 (P_COMCIT_ID IN NUMBER
 ,P_FECHA IN DATE := sysdate
 )
 RETURN NUMBER
 IS
-- Obtengo Promedio Ppecio adjudicado
  CURSOR cr_comczd (p_comcit_id number, p_dias_atras number) IS
  SELECT MAX(comczd.precio_unitario_final) comczd_precio_unitario
     FROM com_ordenes_compras_det comocd,
          com_ordenes_compras comocm,
          com_pedidos_detalles compet,
          com_cotizaciones_detalles comczd
    WHERE comocd.compet_id = compet.ID
      AND comocd.comczd_id = comczd.ID
      AND comocd.comocm_id = comocm.ID
      AND compet.comcit_id = p_comcit_id
      AND comocm.id IN ( SELECT comocm.id
                         FROM com_ordenes_compras_det comocd,
                              com_ordenes_compras comocm,
                              com_ordenes_compras_est comoce, 
                              com_pedidos_detalles compet,
                              com_cotizaciones_detalles comczd
                        WHERE comocd.compet_id = compet.ID
                          AND comocd.comczd_id = comczd.ID
                          AND comocd.comocm_id = comocm.ID
                          AND comocm.comoce_id = comoce.ID
                          AND comoce.estado IN ('APR','NOC','CON') 
                          AND comoce.fecha <= p_fecha
                          AND comoce.fecha > p_fecha-p_dias_atras
                          AND compet.comcit_id = p_comcit_id)
    ;
  --                                        
  v_retorno NUMBER := null;
  v_dias_atras NUMBER := null;
  -- Obtiene el Precio trayendo 
  -- el promedio del precio adjudicado en los ultimos n dias (segun configuracion)
begin
  -- Obtengo Cantidad Días Atras para buscar datos
  v_dias_atras := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo    => 'COMADM_COMCAP_MAX_DIAS_ATRAS'
                                           ,p_segorg_id => SEG_PKG.OBTN_ORGUSU(nvl(v('APP_USER'),user)));     
  -- Obtengo Ultimo precio adjudicado
  OPEN cr_comczd(p_comcit_id => p_comcit_id
                ,p_dias_atras => v_dias_atras);
  FETCH cr_comczd INTO v_retorno;
  CLOSE cr_comczd;   
  --
  RETURN v_retorno;
  --
EXCEPTION
  WHEN OTHERS THEN
    RETURN NULL;
END;
/* Obtener Precio Promedio Sugerido para un Item */
FUNCTION COMCAP_PRE_SUGERIDO
 (P_COMCAM_ID IN NUMBER
 ,P_COMCIT_ID IN NUMBER
 ,P_COMZON_ID IN NUMBER := NULL
 ,P_FECHA IN DATE := sysdate
 )
 RETURN NUMBER
 IS
v_retorno   NUMBER := null;  
  v_sumatoria NUMBER := 0;
  v_precios_obtenidos   number := 0;
  v_precio_avg_relevado number := null;
  v_precio_vig_global   number := null;
  v_precio_vig_zona     number := null;
  v_precio_ult_adj      number := null;
  v_precio_avg_adj      number := null;
  
  -- Obtiene el Precio Sugerido trayendo 
  -- el promedio de todos los precios configurados
begin
  -- Obtengo precio promedio colectado
  v_precio_avg_relevado := COMCAP_PRE_AVG_COMCAI(P_COMCAM_ID => p_comcam_id
                                               , P_COMCIT_ID => p_comcit_id
                                               , P_COMZON_ID => p_comzon_id); 
  
  if v_precio_avg_relevado is not null then
    v_sumatoria := v_sumatoria + v_precio_avg_relevado;
    v_precios_obtenidos := v_precios_obtenidos + 1;
  end if; 
  --  
  -- Obtengo precio testigo global
  v_precio_vig_global := COMCIT_OBTN_PRECIO_TESTIGO(P_COMCIT_ID => p_comcit_id); 

  if v_precio_vig_global is not null then
    v_sumatoria := v_sumatoria + v_precio_vig_global;
    v_precios_obtenidos := v_precios_obtenidos + 1;
  end if; 
  --  
  -- Obtengo precio testigo por zona
  v_precio_vig_zona := COMCIT_OBTN_PRECIO_TESTIGO(P_COMCIT_ID => p_comcit_id
                                                , P_COMZON_ID => p_comzon_id); 

  if v_precio_vig_zona is not null then
    v_sumatoria := v_sumatoria + v_precio_vig_zona;
    v_precios_obtenidos := v_precios_obtenidos + 1;
  end if; 
  --  
  -- Obtengo precio ultimo adjudicado
  v_precio_ult_adj := COMCAP_PRE_ULT_ADJ(P_COMCIT_ID => p_comcit_id); 

  if v_precio_ult_adj is not null then
    v_sumatoria := v_sumatoria + v_precio_ult_adj;
    v_precios_obtenidos := v_precios_obtenidos + 1;
  end if; 
  --  
  -- Obtengo precio promedio ultimos adjudicados
  v_precio_avg_adj := COMCAP_PRE_AVG_ADJ(P_COMCIT_ID => p_comcit_id); 

  if v_precio_avg_adj is not null then
    v_sumatoria := v_sumatoria + v_precio_avg_adj;
    v_precios_obtenidos := v_precios_obtenidos + 1; 
  end if; 
  -- 
  --
  if v_sumatoria <> 0 then
     v_retorno := v_sumatoria/v_precios_obtenidos;
  end if;
  --   
  RETURN v_retorno;
  --
EXCEPTION
  WHEN OTHERS THEN
    RETURN NULL;
END;
/* Obtener Precio Sugerido para un Item */
FUNCTION COMCAP_PRE_ULT_ADJ
 (P_COMCIT_ID IN NUMBER
 ,P_FECHA IN DATE := sysdate
 )
 RETURN NUMBER
 IS
-- Obtengo Ultimo precio adjudicado
  CURSOR cr_comczd (p_comcit_id number, p_dias_atras number) IS
  SELECT comczd.precio_unitario_final comczd_precio_unitario
     FROM com_ordenes_compras_det   comocd,
          com_ordenes_compras       comocm,
          com_pedidos_detalles      compet,
          com_cotizaciones_detalles comczd
    WHERE comocd.compet_id = compet.ID
      AND comocd.comczd_id = comczd.ID
      AND comocd.comocm_id = comocm.ID
      AND compet.comcit_id = p_comcit_id
      AND comocm.id = ( SELECT MAX(comocm.id)
                         FROM com_ordenes_compras_det   comocd
                             ,com_ordenes_compras       comocm
                           --,com_ordenes_compras_est   comoce
                             ,com_pedidos_detalles      compet
                             ,com_cotizaciones_detalles comczd
                        WHERE comocd.compet_id = compet.ID
                          AND comocd.comczd_id = comczd.ID
                          AND comocd.comocm_id = comocm.ID
                        --AND comocm.comoce_id = comoce.ID
                          AND comocm.comoce_estado IN ('APR','NOC','CON') 
                          AND comocm.comoce_fecha <= p_fecha
                          AND compet.comcit_id = p_comcit_id
                        --AND comoce.fecha > p_fecha - p_dias_atras
                          AND comocm.comoce_fecha > p_fecha - (select SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo    => 'COMADM_COMCAP_DIAS_ATRAS'
                                                                                        ,p_segorg_id => SEG_PKG.OBTN_ORGUSU(nvl(v('APP_USER'),user)))
                                                        from dual)
                      );
  --                                        
  v_retorno NUMBER := null;
  v_dias_atras NUMBER := null;
  -- Obtiene el Precio Sugerido trayendo 
  -- el último precio adjudicado en los ultimos n dias ( segun configuracion )
begin                                                        
  -- Obtengo Cantidad Días Atras para buscar datos
  --v_dias_atras := SEG_PKG.OBTN_SEGCFG_VALOR(p_codigo    => 'COMADM_COMCAP_DIAS_ATRAS'
  --                                         ,p_segorg_id => SEG_PKG.OBTN_ORGUSU(nvl(v('APP_USER'),user)));     
  -- Obtengo Ultimo precio adjudicado
  OPEN cr_comczd(p_comcit_id => p_comcit_id
                ,p_dias_atras => v_dias_atras);
  FETCH cr_comczd INTO v_retorno;
  CLOSE cr_comczd;   
  --
  RETURN v_retorno;
  --
EXCEPTION
  WHEN OTHERS THEN
    RETURN NULL;
END;
PROCEDURE COMCCC_INCLUIR
 (P_COMPAU_PROC IN NUMBER
 ,P_COMCOB_ID IN NUMBER
 )
 IS
--Obtengo COMCOB
cursor cr_comcob is
select comcob.ID
  from COM_CATALOGO_OBJETOS comcob
 where comcob.ID not in (select COMCOB_ID 
                           from COM_COMPAU_COB 
                           where COMPAU_PROC = P_COMPAU_PROC);  
--
--Obtengo existencia COM_COMPAU_COB
cursor cr_comccc(p_comcob_id NUMBER) is
select ID
  from COM_COMPAU_COB
 where COMCOB_ID = p_comcob_id
   and COMPAU_PROC = P_COMPAU_PROC;
--
v_comccc_crear COM_COMPAU_COB%rowtype;  
v_comccc_id NUMBER;
--
begin                           
  --Si es 0 inserto TODAS sino inserto la indicada
  if nvl(P_COMCOB_ID, 0) = 0 then
    for v_comcob in cr_comcob loop  
      --Verificar existencia
      OPEN cr_comccc (v_comcob.ID);
      FETCH cr_comccc INTO v_comccc_id;
      CLOSE cr_comccc;
      --
      if v_comccc_id is null then
        --Validar
        COMCCC_INCLUIR_VLD( P_COMPAU_PROC => P_COMPAU_PROC
                          , P_COMCOB_ID => v_comcob.ID); 
        --  
        --Asignar                           
        v_comccc_crear.COMPAU_PROC := P_COMPAU_PROC;
        v_comccc_crear.COMCOB_ID := v_comcob.ID;
        --      
        --Insertar
        COMCCC_INS(p_comccc => v_comccc_crear);             
        --        
      end if;
      --
    end loop;
  else    
    --Validar
    COMCCC_INCLUIR_VLD( P_COMPAU_PROC => P_COMPAU_PROC
                      , P_COMCOB_ID => P_COMCOB_ID); 
    --  
    --Asignar                           
    v_comccc_crear.COMPAU_PROC := P_COMPAU_PROC;
    v_comccc_crear.COMCOB_ID := P_COMCOB_ID;
    --      
    --Insertar
    COMCCC_INS(p_comccc => v_comccc_crear);             
        --        
  end if;      
  --
end;
PROCEDURE COMCCC_INCLUIR_VLD
 (P_COMPAU_PROC IN NUMBER
 ,P_COMCOB_ID IN NUMBER
 )
 IS
--Obtengo COMCOB
cursor cr_comcob is
select comcob.ID
  from com_catalogo_objetos comcob
 where ID = P_COMCOB_ID;
--   
--Obtengo existencia COM_COMPAU_COB
cursor cr_comccc is
select ID
  from COM_COMPAU_COB
 where COMCOB_ID = P_COMCOB_ID
   and COMPAU_PROC = P_COMPAU_PROC; 
--
v_comcob_id NUMBER; 
v_comccc_id NUMBER;
--
begin
  --Verificar los Parametros Obligatorios
  if P_COMPAU_PROC is null then
    raise_application_error(-20000,'El Identificador de Proceso no ha sido indicado y es un valor obligatorio',true);
  elsif P_COMCOB_ID is null then
    raise_application_error(-20000,'El Objeto de Gasto no ha sido indicado y es un valor obligatorio',true);
  end if;    
  --
  --Verificar los Parametros
  OPEN cr_comcob;
  FETCH cr_comcob INTO v_comcob_id;
  CLOSE cr_comcob;
  --
  if v_comcob_id is null then
    raise_application_error(-20000,'El Objeto de Gasto indicado es incorrecto',true);
  end if;
  --
  --Verificar existencia
  OPEN cr_comccc;
  FETCH cr_comccc INTO v_comccc_id;
  CLOSE cr_comccc;
  --
  if v_comccc_id is not null then
    raise_application_error(-20000,'El Objeto de Gasto indicado ya ha sido incluido.',true);
  end if;
  --
end;
PROCEDURE COMCCE_INCLUIR
 (P_COMPAU_PROC IN NUMBER
 ,P_COMECO_ID IN NUMBER
 )
 IS
--Obtengo COMECO
cursor cr_comeco is
select comeco.ID
  from com_contratantes comeco
     , com_contratantes_est comece
     , com_contratantes_cat comecc
 where comece.ID = com_pkg.obtn_comece_id (comeco.ID)
   and comeco.COMECC_ID = comecc.ID
   and comece.ESTADO = 'HAB'
   and comeco.ID not in (select COMECO_ID 
                           from COM_COMPAU_ECO 
                           where COMPAU_PROC = P_COMPAU_PROC);  
--
--Obtengo existencia COM_COMPAU_ECO
cursor cr_comcce(p_comeco_id NUMBER) is
select ID
  from COM_COMPAU_ECO
 where COMECO_ID = p_comeco_id
   and COMPAU_PROC = P_COMPAU_PROC;
--
v_comcce_crear COM_COMPAU_ECO%rowtype;  
v_comcce_id NUMBER;
--
begin                           
  --Si es 0 inserto TODAS sino inserto la indicada
  if nvl(P_COMECO_ID, 0) = 0 then
    for v_comeco in cr_comeco loop  
      --Verificar existencia
      OPEN cr_comcce (v_comeco.ID);
      FETCH cr_comcce INTO v_comcce_id;
      CLOSE cr_comcce;
      --
      if v_comcce_id is null then
        --Validar
        COMCCE_INCLUIR_VLD( P_COMPAU_PROC => P_COMPAU_PROC
                          , P_COMECO_ID => v_comeco.ID); 
        --  
        --Asignar                           
        v_comcce_crear.COMPAU_PROC := P_COMPAU_PROC;
        v_comcce_crear.COMECO_ID := v_comeco.ID;
        --      
        --Insertar
        COMCCE_INS(p_comcce => v_comcce_crear);             
        --        
      end if;
      --
    end loop;
  else    
    --Validar
    COMCCE_INCLUIR_VLD( P_COMPAU_PROC => P_COMPAU_PROC
                      , P_COMECO_ID => P_COMECO_ID); 
    --          
    --Asignar                           
    v_comcce_crear.COMPAU_PROC := P_COMPAU_PROC;
    v_comcce_crear.COMECO_ID := P_COMECO_ID;
    --
    --Insertar
    COMCCE_INS(p_comcce => v_comcce_crear);             
    --        
  end if;      
  --
end;
PROCEDURE COMCCE_INCLUIR_VLD
 (P_COMPAU_PROC IN NUMBER
 ,P_COMECO_ID IN NUMBER
 )
 IS
--Obtengo COMECO
cursor cr_comeco is
select comeco.ID
  from com_contratantes comeco
 where ID = P_COMECO_ID;
--   
--Obtengo existencia COM_COMPAU_ECO
cursor cr_comcce is
select ID
  from COM_COMPAU_ECO
 where COMECO_ID = P_COMECO_ID
   and COMPAU_PROC = P_COMPAU_PROC; 
--
v_comeco_id NUMBER; 
v_comcce_id NUMBER;
--
begin
  --Verificar los Parametros Obligatorios
  if P_COMPAU_PROC is null then
    raise_application_error(-20000,'El Identificador de Proceso no ha sido indicado y es un valor obligatorio',true);
  elsif P_COMECO_ID is null then
    raise_application_error(-20000,'La Unidad Ejecutora no ha sido indicada y es un valor obligatorio',true);
  end if;    
  --
  --Verificar los Parametros
  OPEN cr_comeco;
  FETCH cr_comeco INTO v_comeco_id;
  CLOSE cr_comeco;
  --
  if v_comeco_id is null then
    raise_application_error(-20000,'La Unidad Ejecutora indicada es incorrecta',true);
  end if;
  --
  --Verificar existencia
  OPEN cr_comcce;
  FETCH cr_comcce INTO v_comcce_id;
  CLOSE cr_comcce;
  --
  if v_comcce_id is not null then
    raise_application_error(-20000,'La Unidad Ejecutora indicada ya ha sido incluida.',true);
  end if;
  --
end;
/* Obtener Precio para un Item */
FUNCTION COMCIT_OBTN_PRECIO
 (P_COMCIT_ID IN NUMBER
 ,P_FECHA IN DATE := sysdate
 ,P_COMZON_ID IN NUMBER := null
 )
 RETURN NUMBER
 IS
v_retorno NUMBER := null;      
  -- obtiene el precio Testigo x Zona si lo hay definido,
  -- sino el Precio Testigo Global, o el Precio Sugerido 
  -- si no encuentra los anteriores
begin
  -- Obtengo el Precio Testigo   
  v_retorno := COMCIT_OBTN_PRECIO_TESTIGO(p_comcit_id => p_comcit_id
                                         ,p_fecha     => p_fecha
                                         ,p_comzon_id => p_comzon_id);
  --
  if v_retorno is null then
    -- Obtengo Ultimo precio adjudicado
     v_retorno := COMCIT_OBTN_PRECIO_SUGERIDO(p_comcit_id => p_comcit_id
                                             ,p_fecha => p_fecha);
    --
  end if;     
  --
  RETURN v_retorno;
  --
EXCEPTION
  WHEN OTHERS THEN
    RETURN NULL;
END;
/* Obtener Precio Sugerido para un Item */
FUNCTION COMCIT_OBTN_PRECIO_SUGERIDO
 (P_COMCIT_ID IN NUMBER
 ,P_FECHA IN DATE := sysdate
 )
 RETURN NUMBER
 IS
-- Obtengo Ultimo precio adjudicado
  CURSOR cr_comczd (p_comcit_id number) IS
  SELECT comczd.precio_unitario_final comczd_precio_unitario
     FROM com_ordenes_compras_det comocd,
          com_ordenes_compras comocm,
          com_pedidos_detalles compet,
          com_cotizaciones_detalles comczd
    WHERE comocd.compet_id = compet.ID
      AND comocd.comczd_id = comczd.ID
      AND comocd.comocm_id = comocm.ID
      AND compet.comcit_id = p_comcit_id
      AND comocm.id = ( SELECT MAX(comocm.id)
                         FROM com_ordenes_compras_det comocd,
                              com_ordenes_compras comocm,
                            --com_ordenes_compras_est comoce, 
                              com_pedidos_detalles compet_s,
                              com_cotizaciones_detalles comczd
                        WHERE comocd.compet_id = compet_s.ID
                          AND comocd.comczd_id = comczd.ID
                          AND comocd.comocm_id = comocm.ID
                        --AND comocm.comoce_id = comoce.ID
                        --AND comoce.estado IN ('APR','NOC','CON') 
                        --AND comoce.fecha <= p_fecha
                        --AND comoce.fecha > p_fecha-180
                          AND comocm.comoce_estado IN ('APR','NOC','CON') 
                          AND comocm.comoce_fecha <= p_fecha
                          AND comocm.comoce_fecha > p_fecha-180
                          AND compet_s.comcit_id = compet.comcit_id  --p_comcit_id
                          ) ;
  --                                        
  v_retorno NUMBER := null;
  -- Obtiene el Precio Sugerido trayendo 
  -- el último precio adjudicado en los ultimos 180 dias
begin
  -- Obtengo Ultimo precio adjudicado
  OPEN cr_comczd(p_comcit_id => p_comcit_id);
  FETCH cr_comczd INTO v_retorno;
  CLOSE cr_comczd;   
  --
  RETURN v_retorno;
  --
EXCEPTION
  WHEN OTHERS THEN
    RETURN NULL;
END;
/* Obtener Precio Testigo para un Item por Zona */
FUNCTION COMCIT_OBTN_PRECIO_TESTIGO
 (P_COMCIT_ID IN NUMBER
 ,P_FECHA IN DATE := sysdate
 ,P_COMZON_ID IN NUMBER := null
 )
 RETURN NUMBER
 IS
-- Obtiene el Precio Testigo por Zona y si no hay, el Global.

  -- Obtengo Precio testigo
  CURSOR cr_comctp (p_comcit_id number) IS
  SELECT *
  FROM COM_CATALOGO_PRECIOS COMCTP
  WHERE COMCTP.ID = COMCTP_OBTN_ID(p_comcit_id => p_comcit_id
                                  ,p_fecha     => p_fecha
                                  ,p_comzon_id => p_comzon_id
                                  );
  --
  v_comctp cr_comctp%rowtype;
  v_retorno NUMBER := null;
begin     
  -- Obtengo el Precio Testigo
  OPEN cr_comctp(p_comcit_id => p_comcit_id);
  FETCH cr_comctp INTO v_comctp;
  CLOSE cr_comctp;
  --
  if v_comctp.ID is not null then
    -- Asigno Precio Testigo
    v_retorno := v_comctp.PRECIO;
    --
  end if;     
  --
  RETURN v_retorno;
  --
EXCEPTION
  WHEN OTHERS THEN
    RETURN NULL;
END;
PROCEDURE COMCOB_HABILITAR
 (P_ID IN NUMBER
 )
 IS
cursor cr_comccl is
    select *
    from COM_CATALOGO_CLASES
    where COMCOB_ID = p_id
    and   SITUACION = 'SUS' for update;
begin
  --
  COMCOB_HABILITAR_VLD(p_id => p_id);
  --
  for v_comccl in cr_comccl loop
    update COM_CATALOGO_CLASES
    set SITUACION = 'HAB'
    where COMCOB_ID = p_id;
  end loop;
end;
FUNCTION COMCOB_HABILITAR_SN
 (P_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
begin
  COMCOB_HABILITAR_VLD(p_id => p_id);
  return 'SI';
exception
  when others then
    return 'NO';
end;
PROCEDURE COMCOB_HABILITAR_VLD
 (P_ID IN NUMBER
 )
 IS
cursor cr_rubcob is
    select count(COMRUB_ID)
    from COM_RUBCOB
    where COMCOB_ID = p_id
    and SITUACION = 'VIG';
  v_dummy NUMBER;
begin
  -- Verificar los datos obligatorios 
  if p_id is null then
    raise_application_error(-20000, 'La Clase de Catalogo no ha sido indicada y es un dato obligatorio', true);
  end if;
  --
  open cr_rubcob;
  fetch cr_rubcob into v_dummy;
  close cr_rubcob;
  --
  if v_dummy < 1 then
    raise_application_error(-20000, 'No se puede habilitar. Debe existir al menos un rubro asociado', true);
  end if; 
end;
PROCEDURE COMCOB_SUSPENDER
 (P_ID IN NUMBER
 )
 IS
cursor cr_comccl is
    select *
    from COM_CATALOGO_CLASES
    where COMCOB_ID = p_id
    and   SITUACION = 'HAB' for update;
begin
  --
  COMCOB_SUSPENDER_VLD(p_id => p_id);
  --
  for v_comccl in cr_comccl loop
    update COM_CATALOGO_CLASES
    set SITUACION = 'SUS'
    where COMCOB_ID = p_id;
  end loop;
end;
FUNCTION COMCOB_SUSPENDER_SN
 (P_ID IN VARCHAR2
 )
 RETURN VARCHAR2
 IS
begin
  COMCOB_SUSPENDER_VLD(p_id => p_id);
  return 'SI';
exception
  when others then
    return 'NO';
end;
PROCEDURE COMCOB_SUSPENDER_VLD
 (P_ID IN NUMBER
 )
 IS
cursor cr_rubcob is
    select count(COMRUB_ID)
    from COM_RUBCOB
    where COMCOB_ID = p_id
    and   SITUACION = 'VIG';
  v_dummy NUMBER;
begin
  -- Verificar los datos obligatorios 
  if p_id is null then
    raise_application_error(-20000, 'La Clase de Catalogo no ha sido indicada y es un dato obligatorio', true);
  end if;
  --
  open cr_rubcob;
  fetch cr_rubcob into v_dummy;
  close cr_rubcob;
  --
  if v_dummy > 0 then
    raise_application_error(-20000, 'No se puede suspender. Existe al menos un rubro asociado', true);
  end if;
end;
/* Obtener el Id del Precio Actual para un Item por Zona */
FUNCTION COMCTP_OBTN_ID
 (P_COMCIT_ID IN NUMBER
 ,P_FECHA IN DATE := sysdate
 ,P_COMZON_ID IN NUMBER := null
 )
 RETURN NUMBER
 IS
--
  CURSOR cr_comctp IS
  SELECT ID
  FROM (SELECT COMCTP.ID ID
        FROM COM_CATALOGO_PRECIOS COMCTP
            ,COM_CATALOGO_ITEMS COMCIT
        WHERE COMCTP.COMCIT_ID = COMCIT.ID
          AND COMCIT.CONTROL_PRECIOS_SN = 'SI'
          AND COMCTP.COMCIT_ID = p_comcit_id
          AND nvl(COMCTP.COMZON_ID,0) = nvl(p_comzon_id,0)
          AND COMCTP.SITUACION = 'VAL' 
          AND COMCTP.FECHA_VIGENCIA <= p_fecha
          AND (COMCTP.FECHA_VALIDEZ IS NULL OR COMCTP.FECHA_VALIDEZ >= p_fecha)
        ORDER BY COMCTP.FECHA_VIGENCIA DESC, COMCTP.FECHA_VALIDEZ ASC 
       )
  WHERE ROWNUM=1;     
    
  --
  v_retorno NUMBER;
  --
BEGIN
  --
  OPEN cr_comctp;
  FETCH cr_comctp INTO v_retorno;
  CLOSE cr_comctp;
  --
  RETURN v_retorno;
  --
EXCEPTION
  WHEN OTHERS THEN
    RETURN NULL;
END;
FUNCTION COMDOM_OBTN_ZONA_ID
 (P_PAIS IN VARCHAR2
 ,P_PROV IN VARCHAR2
 ,P_DPTO IN VARCHAR2
 ,P_LOCA IN VARCHAR2
 )
 RETURN NUMBER
 IS
-- Obtengo 
  CURSOR cr_comzon(p_pais varchar2
  ,p_prov varchar2
  ,p_dpto varchar2
  ,p_loca varchar2)  IS 
  
  
  select *
  from com_zonas COMZON
  where COMZON.id =(					
  SELECT COMZTL.comzon_id
  FROM COM_ZONAS_TRRLOC COMZTL
  WHERE COMZTL.COMTRR_ID = comcat_pkg.comdom_obtn_trr_id ( p_pais => p_pais
													      ,p_prov => p_prov
														  ,p_dpto => p_dpto
														  ,p_loca => p_loca));

  
  v_comzon cr_comzon%rowtype;
  v_retorno NUMBER := null;
BEGIN
  -- Obtengo la Zona
  OPEN cr_comzon( p_pais => p_pais
				 ,p_prov => p_prov
				 ,p_dpto => p_dpto
				 ,p_loca => p_loca);
  FETCH cr_comzon INTO v_comzon;
  CLOSE cr_comzon;
  --
  if v_comzon.ID is not null then
    -- Asigno Nombre de la Zona
    v_retorno := v_comzon.ID;
    --
  end if;     
      --
  RETURN v_retorno;
  --                      

EXCEPTION
  WHEN OTHERS THEN
    RETURN NULL;
END;
FUNCTION COMDOM_OBTN_TRR_ID
 (P_PAIS IN VARCHAR2
 ,P_PROV IN VARCHAR2
 ,P_DPTO IN VARCHAR2
 ,P_LOCA IN VARCHAR2
 )
 RETURN INTEGER
 IS
-- Obtengo 
 CURSOR cr_comtrr (p_pais varchar2
                  ,p_prov varchar2
                  ,p_dpto varchar2
                  ,p_loca varchar2)IS
 select id 
 FROM com_territorios trr6
 where trr6.tipo = 'LOCA'
 and trr6.nombre= P_LOCA
 and trr6.comtrr_id_padre in (SELECT id 
                                  FROM com_territorios trr5
                                 where trr5.tipo = 'DPTO'
								   and trr5.nombre= P_DPTO
                                   and trr5.comtrr_id_padre = (SELECT id
                                                                 FROM com_territorios trr3
                                                                where trr3.tipo = 'PROV'
                                                                  and trr3.nombre = P_PROV
                                                                  and trr3.comtrr_id_padre = (SELECT id
                                                                                                FROM com_territorios trr1
                                                                                               where trr1.tipo = 'PAIS'
                                                                                                 and trr1.nombre = P_PAIS)));
  --
  v_comtrr cr_comtrr%rowtype;
  v_retorno NUMBER := null;
BEGIN
  
  -- Obtengo el Id del Territorio
  OPEN cr_comtrr(p_pais => upper(p_pais)
                ,p_prov => upper(p_prov)
                ,p_dpto => upper(p_dpto)
                ,p_loca => upper(p_loca));
  FETCH cr_comtrr INTO v_comtrr;
  CLOSE cr_comtrr;
  --
  if v_comtrr.ID is not null then
    -- Asigno Id del Teritorio
    v_retorno := v_comtrr.ID ;
    --
  end if;     
      --
  RETURN v_retorno;
  --
EXCEPTION
  WHEN OTHERS THEN
    RETURN NULL;
END;

----;
PROCEDURE COMENT_CREAR
 (P_SEGORG_ID IN NUMBER
 ,P_CODIGO IN VARCHAR2
 ,P_NOMBRE IN VARCHAR2
 ,P_DESCRIPCION IN VARCHAR2
 ,P_SITUACION IN VARCHAR2
 ,P_FECHA_SITUACION IN DATE
 ,P_MOTIVO_SITUACION IN VARCHAR2
 ,P_COMENT_ID OUT NUMBER
 )
 IS
--
v_coment_crear COM_ENTIDADES%rowtype;
begin
  -- 
  select COMENT_ID.NEXTVAL
  into   v_coment_crear.ID
  from   dual;
  --  
  
  -- Registrar
  --  
  v_coment_crear.SEGORG_ID             := p_segorg_id;
  v_coment_crear.CODIGO                := p_codigo;
  v_coment_crear.NOMBRE                := p_nombre;
  v_coment_crear.DESCRIPCION           := p_descripcion;
  v_coment_crear.SITUACION             := p_situacion;
  v_coment_crear.FECHA_SITUACION       := p_fecha_situacion;
  v_coment_crear.MOTIVO_SITUACION      := p_motivo_situacion;

  --
  COMENT_INS(p_coment => v_coment_crear);
             
  -- Cargar la variable de retorno con el Id creado.
  p_coment_id := v_coment_crear.ID;  
  --
  
end;
PROCEDURE COMPAU_CREAR
 (P_COMPAU_PROC IN NUMBER
 ,P_DIA_DESDE IN NUMBER
 ,P_DIA_HASTA IN NUMBER
 )
 IS
--Obtengo COMECO_ID
  cursor cr_comcce is
  select COMECO_ID       
    from COM_COMPAU_ECO
   where COMPAU_PROC = P_COMPAU_PROC;
  --
  --Obtengo COMCOB_ID
  cursor cr_comccc is
  select COMCOB_ID     
    from COM_COMPAU_COB
   where COMPAU_PROC = P_COMPAU_PROC;
  --  
  v_compau_crear COM_PEDIDOS_AUT%rowtype;
  --
begin
  --Recorrer Cursores
  for v_comcce in cr_comcce loop
    --
    for v_comccc in cr_comccc loop    
       --Validar
       COMPAU_CREAR_VLD(P_COMPAU_PROC => P_COMPAU_PROC
                       ,P_COMECO_ID   => v_comcce.COMECO_ID
                       ,P_COMCOB_ID   => v_comccc.COMCOB_ID
                       ,P_DIA_DESDE   => P_DIA_DESDE
                       ,P_DIA_HASTA   => P_DIA_HASTA);
       -- 
       -- Asignar          
       select COMENT_ID.NEXTVAL
       into   v_compau_crear.ID
       from   dual;
       --
       v_compau_crear.COMECO_ID := v_comcce.COMECO_ID;
       v_compau_crear.COMCOB_ID := v_comccc.COMCOB_ID;
       v_compau_crear.DIA_DESDE := P_DIA_DESDE;
       v_compau_crear.DIA_HASTA := P_DIA_HASTA;
       v_compau_crear.SITUACION := 'VIG';
       v_compau_crear.FECHA_SITUACION  := SYSDATE;
       v_compau_crear.MOTIVO_SITUACION := NULL;
       --
       --Insertar                                      
       COMPAU_INS(p_compau => v_compau_crear);
       --             
    end loop;   
    --
  end loop;
  --
end;
PROCEDURE COMPAU_CREAR_VLD
 (P_COMPAU_PROC IN NUMBER
 ,P_COMECO_ID IN NUMBER
 ,P_COMCOB_ID IN NUMBER
 ,P_DIA_DESDE IN NUMBER
 ,P_DIA_HASTA IN NUMBER
 )
 IS
--Obtengo COMCOB
cursor cr_comcob is
select comcob.ID
  from com_catalogo_objetos comcob
 where ID = P_COMCOB_ID;
-- 
--Obtengo COMECO
cursor cr_comeco is
select comeco.ID
  from com_contratantes comeco
 where ID = P_COMECO_ID;
--   

v_comcob_id NUMBER; 
v_comeco_id NUMBER; 
--
begin
  --Verificar los Parametros Obligatorios
  if P_COMPAU_PROC is null then
    raise_application_error(-20000,'El Identificador de Proceso no ha sido indicado y es un valor obligatorio',true);
  elsif P_COMECO_ID is null then
    raise_application_error(-20000,'La Unidad Ejecutora no ha sido indicada y es un valor obligatorio',true);
  elsif P_COMCOB_ID is null then
    raise_application_error(-20000,'El Objeto de Gasto no ha sido indicado y es un valor obligatorio',true);
  elsif P_DIA_DESDE is null then
    raise_application_error(-20000,'El Dia Desde no ha sido indicado y es un valor obligatorio',true);
  elsif P_DIA_HASTA is null then
    raise_application_error(-20000,'El Dia Hasta no ha sido indicado y es un valor obligatorio',true);
  end if;    
  --
  --Verificar los Parametros
  OPEN cr_comeco;
  FETCH cr_comeco INTO v_comeco_id;
  CLOSE cr_comeco;
  --
  if v_comeco_id is null then
    raise_application_error(-20000,'La Unidad Ejecutora indicada es incorrecta',true);
  end if;
  --
  --   
  OPEN cr_comcob;
  FETCH cr_comcob INTO v_comcob_id;
  CLOSE cr_comcob;
  --
  if v_comcob_id is null then
    raise_application_error(-20000,'El Objeto de Gasto indicado es incorrecto',true);
  end if;
  -- 
end;
PROCEDURE COMPAU_HABILITAR
 (P_COMPAU_ID IN NUMBER
 ,P_FECHA IN DATE := 'SYSDATE'
 ,P_MOTIVO IN VARCHAR2 := 'NULL'
 )
 IS
begin
----Validar la operación
COMPAU_HABILITAR_VLD(p_compau_id => p_compau_id
                    ,p_fecha     => p_fecha
                    ,p_motivo    => p_motivo);
 
----Realizar la Operación
update COM_PEDIDOS_AUT
set SITUACION = 'VIG' 
   ,FECHA_SITUACION  = p_fecha
   ,MOTIVO_SITUACION = p_motivo
where ID = p_compau_id;
end;
FUNCTION COMPAU_HABILITAR_SN
 (P_COMPAU_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
begin
  COMPAU_HABILITAR_VLD(p_compau_id => p_compau_id);
  return 'SI';
exception
  when others then
    return 'NO';
end;
PROCEDURE COMPAU_HABILITAR_VLD
 (P_COMPAU_ID IN NUMBER
 ,P_FECHA IN DATE := 'SYSDATE'
 ,P_MOTIVO IN VARCHAR2 := 'NULL'
 )
 IS
v_compau COM_PEDIDOS_AUT%ROWTYPE;
begin

----Verificar los Parametros Obligatorios
if P_COMPAU_ID is null then
raise_application_error(-20000,'El Pedido de Autorización no ha sido indicado y es un valor obligatorio',true);
end if;
---Verificar los Parametros
 COMPAU_SET(P_ID =>P_COMPAU_ID);
 COMPAU_GET(P_COMPAU =>v_compau);
 COMPAU_INI;
 
 if v_compau.ID is null then
 raise_application_error(-20000,'El Pedido de Autorización no es correcto',true);
 end if;
 
 ----Verificar la consistencia de los Datos    
if v_compau.SITUACION not in ('SUS') then
raise_application_error(-20000,'No esta permitido que la situación sea vigente',true); 
end if;
 
end;
PROCEDURE COMPAU_SUSPENDER
 (P_COMPAU_ID IN NUMBER
 ,P_FECHA IN DATE := 'SYSDATE'
 ,P_MOTIVO IN VARCHAR2 := 'NULL'
 )
 IS
begin
----Validar la operación
COMPAU_SUSPENDER_VLD(p_compau_id =>p_compau_id
                    ,p_fecha     =>p_fecha
                    ,p_motivo    => p_motivo);

----Realizar la Operación
update COM_PEDIDOS_AUT
set SITUACION = 'SUS' 
   ,FECHA_SITUACION  = p_fecha
   ,MOTIVO_SITUACION = p_motivo
where ID = p_compau_id;
end;
FUNCTION COMPAU_SUSPENDER_SN
 (P_COMPAU_ID IN NUMBER
 )
 RETURN VARCHAR2
 IS
begin
  COMPAU_SUSPENDER_VLD(p_compau_id => p_compau_id);
  return 'SI';
exception
  when others then
    return 'NO';
end;
PROCEDURE COMPAU_SUSPENDER_VLD
 (P_COMPAU_ID IN NUMBER
 ,P_FECHA IN DATE := 'SYSDATE'
 ,P_MOTIVO IN VARCHAR2 := 'NULL'
 )
 IS
v_compau COM_PEDIDOS_AUT%ROWTYPE;
begin

----Verificar los Parametros Obligatorios
if P_COMPAU_ID is null then
raise_application_error(-20000,'El Pedido de Autorización no ha sido indicado y es un valor obligatorio',true);
end if;
---Verificar los Parametros
 COMPAU_SET(P_ID =>P_COMPAU_ID);
 COMPAU_GET(P_COMPAU =>v_compau);
 COMPAU_INI;
 
 if v_compau.ID is null then
 raise_application_error(-20000,'El Pedido de Autorización no es correcto',true);
 end if;
 
 ----Verificar la consistencia de los Datos    
if v_compau.SITUACION not in ('VIG') then
raise_application_error(-20000,'No esta permitido que la situación sea suspendido',true); 
end if;
 
end;
PROCEDURE COMRUB_HABILITAR
 (P_ID IN NUMBER
 )
 IS

PROCEDURE COMRUB_HABILITAR_VLD
 (P_ID IN NUMBER
 );
PROCEDURE COMRUB_SUSPENDER
 (P_ID IN NUMBER
 );
PROCEDURE COMRUB_SUSPENDER_VLD
 (P_ID IN NUMBER
 );


PROCEDURE COMRUB_HABILITAR_VLD
 (P_ID IN NUMBER
 )
 IS
cursor cr_rubcob is
    select count(COMCOB_ID)
    from COM_RUBCOB
    where COMRUB_ID = p_id;
  v_dummy NUMBER;
  v_comrub COM_RUBROS%rowtype;
begin
  -- Verificar los parametros obligatorios.
  if p_id is null then
    raise_application_error(-20000, 'El rubro no ha sido indicado y es un dato obligatorio', true);
  end if;
  --
  -- Obtener la situacion del rubro
  COMPRV_PKG.COMRUB_SET(p_id => p_id);
  COMPRV_PKG.COMRUB_GET(p_comrub => v_comrub);
  COMPRV_PKG.COMRUB_INI;
  -- Verificar la consistencia de los datos
  if v_comrub.SITUACION = 'VIG' then
    raise_application_error(-20000, 'La situacion actual del rubro ya se encuentra en VIGENTE', true);
  end if;
  
  -- Verificar si existe al menos un Catalogo de Objeto asociado 
  open cr_rubcob;
  fetch cr_rubcob into v_dummy;
  close cr_rubcob;
  -- Si no existe al menos un Catalogo asociado no se puede habilitar el rubro
  if v_dummy < 1 then
    raise_application_error(-20000, 'No es posible habilitar. No existe al menos un Objeto del Catalogos de gastos asociado', true);
  end if;
end;
PROCEDURE COMRUB_SUSPENDER
 (P_ID IN NUMBER
 )
 IS
begin
  -- Validar la operación
  COMRUB_SUSPENDER_VLD(P_ID => P_ID);
  
  -- Realizar la operación
  update COM_RUBROS
  set SITUACION = 'SUS'
--   ,FECHA_SITUACION = SYSDATE
  where ID = P_ID;
end;
PROCEDURE COMRUB_SUSPENDER_VLD
 (P_ID IN NUMBER
 )
 IS
-- Obtener Vinculos
  cursor cr_rubcob is
    select comrcb.COMCOB_ID
    from   COM_RUBCOB comrcb
    where  COMRUB_ID = p_id
    and    SITUACION <> 'BAJ';
  -- 
  cursor cr_comcob (p_comcob_id NUMBER) is
   select ID
        ,(SELECT COUNT(1)
            FROM COM_CATALOGO_CLASES COMCCL
           WHERE COMCCL.COMCOB_ID = COMCOB.ID
             AND COMCCL.SITUACION = 'HAB'  ) CANTIDAD_CLASES_HAB 
    from COM_CATALOGO_OBJETOS COMCOB
   where COMCOB.ID = p_comcob_id;
  --            
  v_rubcob cr_rubcob%rowtype;
  v_comrub COM_RUBROS%rowtype;
begin
  -- Verificar los parametros obligatorios.  
  if p_id is null then
    raise_application_error(-20000, 'El rubro no ha sido indicado y es un dato obligatorio', true);
  end if;
  -- 
  -- Obtener la situacion del rubro
  COMPRV_PKG.COMRUB_SET(p_id => p_id);
  COMPRV_PKG.COMRUB_GET(p_comrub => v_comrub);
  COMPRV_PKG.COMRUB_INI;
  -- Verificar la consistencia de los datos   
  if v_comrub.SITUACION = 'SUS' then
    raise_application_error(-20000, 'La situacion actual del rubro ya se encuentra en SUSPENDIDO', true);
  end if;  
  -- Verificar si existe al menos un Catalogo de Objeto asociado
  open cr_rubcob;
  fetch cr_rubcob into v_rubcob;
  close cr_rubcob;
  --   
  if v_rubcob.COMCOB_ID is not null then  
    for v_comcob in cr_comcob(p_comcob_id => v_rubcob.COMCOB_ID) loop
     if v_comcob.CANTIDAD_CLASES_HAB <> 0 then 
       raise_application_error(-20000, 'No es posible suspender. Existe al menos un Objeto del Catalogo de Gastos asociado', true);
     end if;
    end loop; 
  end if;  
end;
begin
  -- Validar la operación
  COMRUB_HABILITAR_VLD(P_ID => P_ID);
  
  -- Realizar la operación
  update COM_RUBROS
  set SITUACION = 'VIG'
--   ,FECHA_SITUACION = SYSDATE
  where ID = P_ID;   
end;
PROCEDURE COMRUB_HABILITAR_VLD
 (P_ID IN NUMBER
 )
 IS
cursor cr_rubcob is
    select count(COMCOB_ID)
    from COM_RUBCOB
    where COMRUB_ID = p_id;
  v_dummy NUMBER;
  v_comrub COM_RUBROS%rowtype;
begin
  -- Verificar los parametros obligatorios.
  if p_id is null then
    raise_application_error(-20000, 'El rubro no ha sido indicado y es un dato obligatorio', true);
  end if;
  --
  -- Obtener la situacion del rubro
  COMPRV_PKG.COMRUB_SET(p_id => p_id);
  COMPRV_PKG.COMRUB_GET(p_comrub => v_comrub);
  COMPRV_PKG.COMRUB_INI;
  -- Verificar la consistencia de los datos
  if v_comrub.SITUACION = 'VIG' then
    raise_application_error(-20000, 'La situacion actual del rubro ya se encuentra en VIGENTE', true);
  end if;
  
  -- Verificar si existe al menos un Catalogo de Objeto asociado 
  open cr_rubcob;
  fetch cr_rubcob into v_dummy;
  close cr_rubcob;
  -- Si no existe al menos un Catalogo asociado no se puede habilitar el rubro
  if v_dummy < 1 then
    raise_application_error(-20000, 'No es posible habilitar. No existe al menos un Objeto del Catalogos de gastos asociado', true);
  end if;
end;
PROCEDURE COMRUB_SUSPENDER
 (P_ID IN NUMBER
 )
 IS
begin
  -- Validar la operación
  COMRUB_SUSPENDER_VLD(P_ID => P_ID);
  
  -- Realizar la operación
  update COM_RUBROS
  set SITUACION = 'SUS'
--   ,FECHA_SITUACION = SYSDATE
  where ID = P_ID;
end;
PROCEDURE COMRUB_SUSPENDER_VLD
 (P_ID IN NUMBER
 )
 IS
-- Obtener Vinculos
  cursor cr_rubcob is
    select comrcb.COMCOB_ID
    from   COM_RUBCOB comrcb
    where  COMRUB_ID = p_id
    and    SITUACION <> 'BAJ';
  -- 
  cursor cr_comcob (p_comcob_id NUMBER) is
   select ID
        ,(SELECT COUNT(1)
            FROM COM_CATALOGO_CLASES COMCCL
           WHERE COMCCL.COMCOB_ID = COMCOB.ID
             AND COMCCL.SITUACION = 'HAB'  ) CANTIDAD_CLASES_HAB 
    from COM_CATALOGO_OBJETOS COMCOB
   where COMCOB.ID = p_comcob_id;
  --            
  v_rubcob cr_rubcob%rowtype;
  v_comrub COM_RUBROS%rowtype;
begin
  -- Verificar los parametros obligatorios.  
  if p_id is null then
    raise_application_error(-20000, 'El rubro no ha sido indicado y es un dato obligatorio', true);
  end if;
  -- 
  -- Obtener la situacion del rubro
  COMPRV_PKG.COMRUB_SET(p_id => p_id);
  COMPRV_PKG.COMRUB_GET(p_comrub => v_comrub);
  COMPRV_PKG.COMRUB_INI;
  -- Verificar la consistencia de los datos   
  if v_comrub.SITUACION = 'SUS' then
    raise_application_error(-20000, 'La situacion actual del rubro ya se encuentra en SUSPENDIDO', true);
  end if;  
  -- Verificar si existe al menos un Catalogo de Objeto asociado
  open cr_rubcob;
  fetch cr_rubcob into v_rubcob;
  close cr_rubcob;
  --   
  if v_rubcob.COMCOB_ID is not null then  
    for v_comcob in cr_comcob(p_comcob_id => v_rubcob.COMCOB_ID) loop
     if v_comcob.CANTIDAD_CLASES_HAB <> 0 then 
       raise_application_error(-20000, 'No es posible suspender. Existe al menos un Objeto del Catalogo de Gastos asociado', true);
     end if;
    end loop; 
  end if;  
end;
PROCEDURE COMZON_CREAR
 (P_SEGORG_ID IN NUMBER
 ,P_CODIGO IN VARCHAR2
 ,P_NOMBRE IN VARCHAR2
 ,P_DESCRIPCION IN VARCHAR2
 ,P_ID OUT NUMBER
 )
 IS
v_comzon_crear com_zonas%rowtype;
begin
  -- Validar operacion
  COMZON_CREAR_VLD( p_segorg_id   => p_segorg_id
                   ,p_codigo      => p_codigo
                   ,p_nombre      => p_nombre
                   ,p_descripcion => p_descripcion);
  -- Realizar la operación
  -- Insertar el registro de estado
  -- Armar la variable         COMPDE
  select COMZON_ID.NEXTVAL
  into   v_comzon_crear.ID
  from   dual;
  --  
  v_comzon_crear.SEGORG_ID   := p_segorg_id;
  v_comzon_crear.CODIGO      := p_codigo;
  v_comzon_crear.NOMBRE      := p_nombre;
  v_comzon_crear.DESCRIPCION := p_descripcion;
  v_comzon_crear.SITUACION   := 'VIG';
  v_comzon_crear.FECHA_SITUACION := SYSDATE;
  v_comzon_crear.MOTIVO_SITUACION := NULL;
  --
  COMZON_INS(p_comzon => v_comzon_crear);
  -- Cargar la variable de retorno con el Id creado.
  p_id := v_comzon_crear.ID;  
  --
end;
PROCEDURE COMZON_CREAR_VLD
 (P_SEGORG_ID IN NUMBER
 ,P_CODIGO IN VARCHAR2
 ,P_NOMBRE IN VARCHAR2
 ,P_DESCRIPCION IN VARCHAR2
 )
 IS
v_comzon  com_zonas%rowtype;
begin
    NULL;
  -- Verificar los parametros obligatorios
  if p_codigo is null then
    raise_application_error(-20000,'El Código no ha sido indicado y es un dato obligatorio',true);
  elsif p_nombre is null then
    raise_application_error(-20000,'El Nombre no ha sido indicado y es un dato obligatorio',true);
  end if;
  --
  -- Verificar no duplicidad de datos
  COMZON_SET_CODIGO(p_segorg_id   => p_segorg_id
                  , p_codigo      => p_codigo);  
  COMZON_GET(p_comzon => v_comzon);  
                
  if v_comzon.ID is not null then
  COMZON_INI;
   raise_application_error(-20000,'La Zona con el Código indicado ya se encuentra registrada',true);
  end if;
  --
 COMZON_SET_NOMBRE(p_segorg_id    => p_segorg_id
                  ,p_nombre       => p_nombre);
 COMZON_GET(p_comzon => v_comzon);   
              
 if v_comzon.ID is not null then
  COMZON_INI;
    raise_application_error(-20000,'La Zona con el Nombre indicado ya se encuentra registrada',true);
  end if;
             
  --         
             
             
  -- Verificar los valores de los parametros
  COMZON_SET_CODIGO(p_segorg_id => p_segorg_id
                   ,p_codigo    => p_codigo);
  COMZON_GET(p_comzon => v_comzon);
  COMZON_INI;
  --
  if v_comzon.ID is not null then
   raise_application_error(-20000,'La Zona indicada es incorrecta',true);
  end if;
  --
end;
PROCEDURE COMZON_MODIFICAR
 (P_COMZON_ID IN NUMBER
 ,P_SEGORG_ID IN VARCHAR2
 ,P_NOMBRE IN VARCHAR2
 ,P_CODIGO IN VARCHAR2
 ,P_DESCRIPCION IN VARCHAR2
 )
 IS
begin
  
---- Validar operacion
 COMZON_MODIFICAR_VLD( P_COMZON_ID  => P_COMZON_ID,
                       P_CODIGO  => P_CODIGO,
                       P_NOMBRE  => P_NOMBRE,
                       P_SEGORG_ID  => P_SEGORG_ID,
                       P_DESCRIPCION  => P_DESCRIPCION);
                     
----Actualizar 
update COM_ZONAS
set CODIGO =P_CODIGO,  
    NOMBRE =P_NOMBRE,
    DESCRIPCION =P_DESCRIPCION 
where ID=P_COMZON_ID;
 
 
end;
PROCEDURE COMZON_MODIFICAR_VLD
 (P_COMZON_ID IN NUMBER
 ,P_SEGORG_ID IN VARCHAR2
 ,P_CODIGO IN VARCHAR2
 ,P_NOMBRE IN VARCHAR2
 ,P_DESCRIPCION IN VARCHAR2
 )
 IS
v_comzon COM_ZONAS%ROWTYPE;
begin

----Verificar Datos Obligatorios
if P_COMZON_ID is null then
raise_application_error(-20000,'La Zona no ha sido indicada y es un Dato obligatorio',true); 
elsif P_CODIGO is null then
raise_application_error(-20000,'El Codigo no ha sido indicado y es un Dato obligatorio',true); 
elsif P_NOMBRE is null then
raise_application_error(-20000,'El Nombre no ha sido indicado y es un Dato obligatorio',true); 
end if;
-- Verificar no duplicidad de datos
  COMZON_SET_CODIGO(p_segorg_id   => p_segorg_id
                  , p_codigo      => p_codigo);  
  COMZON_GET(p_comzon => v_comzon);  
                
  if v_comzon.ID is not null then
  COMZON_INI;
   raise_application_error(-20000,'La Zona con el Código indicado ya se encuentra registrada',true);
  end if;
  --
 COMZON_SET_NOMBRE(p_segorg_id    => p_segorg_id
                  ,p_nombre       => p_nombre);
 COMZON_GET(p_comzon => v_comzon);   
              
 if v_comzon.ID is not null then
  COMZON_INI;
    raise_application_error(-20000,'La Zona con el Nombre indicado ya se encuentra registrada',true);
  end if;
             
             
----Validar la Duplicidad de Datos
COMZON_SET(P_ID  =>P_COMZON_ID);
COMZON_GET(P_COMZON =>v_comzon);
COMZON_INI;

if v_comzon.ID is null then
raise_application_error(-20000,'La Zona es incorrecta',true); 
end if;
if NVL(v_comzon.CODIGO,-1)=NVL(P_CODIGO,-1)and
   NVL(v_comzon.NOMBRE,'#')=NVL(P_NOMBRE,'#')and
   NVL(v_comzon.DESCRIPCION,'#')=NVL(P_DESCRIPCION,'#') then
raise_application_error(-20000,'No se realizaron cambios',true); 
end if;

end;
/* Obtener el Id de una Zona pasando un Domicilio */
FUNCTION COMZON_OBTN_ID
 (P_COMDOM_ID IN NUMBER := null
 )
 RETURN NUMBER
 IS
-- Obtener el detalle del Domicilio dado
CURSOR cr_comdom IS
 SELECT * 
 FROM COM_DOMICILIOS
 WHERE ID = p_comdom_id;
 --
-- Obtener la identificacion de la Zona de la Localidad 
CURSOR cr_comztl(p_pais varchar2
                ,p_prov varchar2
                ,p_dpto varchar2
                ,p_loca varchar2)  IS 
  SELECT *
  from COM_ZONAS_TRRLOC
  where COMTRR_ID = COMCAT_PKG.comdom_obtn_trr_id ( p_pais => p_pais
							   			           ,p_prov => p_prov
												   ,p_dpto => p_dpto
												   ,p_loca => p_loca);

  --
  v_comztl cr_comztl%rowtype;
  v_comdom com_domicilios%rowtype;
  v_retorno NUMBER := null;
  --
BEGIN
  --
  OPEN cr_comdom;
  FETCH cr_comdom INTO v_comdom;
  CLOSE cr_comdom;
  --     
  if v_comdom.ID is not null then
   -- Obtener la Zona
   OPEN cr_comztl( p_pais => v_comdom.PAIS
  				  ,p_prov => v_comdom.PROVINCIA
 				  ,p_dpto => v_comdom.DEPARTAMENTO
 				  ,p_loca => v_comdom.LOCALIDAD);
   FETCH cr_comztl INTO v_comztl;
   CLOSE cr_comztl;
   --
   if v_comztl.id is not null then
      v_retorno := v_comztl.COMZON_ID;
   end if;
   --    
  end if;
  --
  RETURN v_retorno;
  --
EXCEPTION
  WHEN OTHERS THEN
    RETURN NULL;
END;
PROCEDURE COMZON_SUSPENDER
 (P_ID IN NUMBER
 )
 IS
begin
----Validar la operación
COMZON_SUSPENDER_VLD(P_ID =>P_ID);

----Realixzar la Operación
update COM_ZONAS
set SITUACION = 'SUS' 
   ,FECHA_SITUACION = SYSDATE
where ID = P_ID;
end;
PROCEDURE COMZON_SUSPENDER_VLD
 (P_ID IN NUMBER
 )
 IS
v_comzon COM_ZONAS%ROWTYPE;
begin

----Verificar los Parametros Obligatorios
if P_ID is null then
raise_application_error(-20000,'La Zona no ha sido indicada y es un valor obligatorio',true);
end if;
---Verificar los Parametros
 COMZON_SET(P_ID =>P_ID);
 COMZON_GET(P_COMZON =>v_comzon);
 COMZON_INI;
 
 if v_comzon.ID is null then
 raise_application_error(-20000,'La Zona no es correcta',true);
 end if;
 
 ----Verificar la consistencia de los Datos 
    
---if v_comzon.SITUACION = 'SUS' then
--raise_application_error(-20000,'La Categoria no es correcta',true);
--end if;
---if v_comzon.SITUACION not in ('VIG') then
 --raise_application_error(-20000,'No esta permitido que la situación sea vigente',true); 
--end if;
 
end;
PROCEDURE COMZON_VIGENTE
 (P_ID IN NUMBER
 )
 IS
begin
----Validar la operación
COMZON_VIGENTE_VLD(P_ID =>P_ID);

----Realixzar la Operación
update COM_ZONAS
set SITUACION = 'VIG'
   ,FECHA_SITUACION = SYSDATE
where ID = P_ID;
end;
PROCEDURE COMZON_VIGENTE_VLD
 (P_ID IN NUMBER
 )
 IS
v_comzon COM_ZONAS%ROWTYPE;
begin

----Verificar los Parametros Obligatorios
if P_ID is null then
raise_application_error(-20000,'La Zona no ha sido indicada y es un valor obligatorio',true);
end if;
---Verificar los Parametros
 COMZON_SET(P_ID =>P_ID);
 COMZON_GET(P_COMZON =>v_comzon);
 COMZON_INI;
 
 if v_comzon.ID is null then
 raise_application_error(-20000,'La Zona no es correcta',true);
 end if;
 
 ----Verificar la consistencia de los Datos 
    
---if v_comzon.SITUACION = 'VIG' then
--raise_application_error(-20000,'La Si no es correcta',true);
--end if;
---if v_comzon.SITUACION not in ('SUS') then
--raise_application_error(-20000,'No esta permitido que la situación sea vigente',true); 
---end if;
 
end;
/* Obtener el valor de la variable v_comcae. */
PROCEDURE COMCAE_GET
 (P_COMCAE OUT COM_CAMPANIAS_EST%ROWTYPE
 )
 IS
begin
   p_comcae:=v_comcae;
end;
/* Inicializar la variable v_comcae. */
PROCEDURE COMCAE_INI
 IS
begin
  v_comcae:=null;
end;
/* Insertar registro en  COM_CAMPANIAS_EST. */
PROCEDURE COMCAE_INS
 (P_COMCAE IN COM_CAMPANIAS_EST%ROWTYPE
 )
 IS
begin
   insert into COM_CAMPANIAS_EST
   (ID
   ,COMCAM_ID
   ,ESTADO
   ,FECHA
   ,MOTIVO
   ,DATE_CREATED
   ,CREATED_BY
   ,DATE_MODIFIED
   ,MODIFIED_BY
   )
   values
   (p_comcae.ID
   ,p_comcae.COMCAM_ID
   ,p_comcae.ESTADO
   ,p_comcae.FECHA
   ,p_comcae.MOTIVO
   ,p_comcae.DATE_CREATED
   ,p_comcae.CREATED_BY
   ,p_comcae.DATE_MODIFIED
   ,p_comcae.MODIFIED_BY
   );
end;
/* Seteo de la variable v_comcae. */
PROCEDURE COMCAE_SET
 (P_ID IN NUMBER
 )
 IS
cursor cr_comcae is
 select *
   from COM_CAMPANIAS_EST comcae
  where comcae.ID = p_id;
begin
 -- Inicializar la variable
 COMCAE_INI;
 -- Cargar la variable con los datos de la consulta
 open cr_comcae;
 fetch cr_comcae into v_comcae;
 close cr_comcae;
 --
end;
/* Obtener el valor de la variable v_comcai. */
PROCEDURE COMCAI_GET
 (P_COMCAI OUT COM_CAMPANIAS_ITEMS%ROWTYPE
 )
 IS
begin
   p_comcai:=v_comcai;
end;
/* Inicializar la variable v_comcai. */
PROCEDURE COMCAI_INI
 IS
begin
  v_comcai:=null;
end;
/* Insertar registro en  COM_CAMPANIAS_ITEMS. */
PROCEDURE COMCAI_INS
 (P_COMCAI IN COM_CAMPANIAS_ITEMS%ROWTYPE
 )
 IS
begin
   insert into COM_CAMPANIAS_ITEMS
   (ID   
   ,CODIGO
   ,COMCAM_ID
   ,COMENT_ID
   ,COMCIT_ID
   ,LOCALIDAD
   ,PRECIO
   ,FECHA
   ,OBSERVACION
   ,COMZON_ID
   ,DATE_CREATED
   ,CREATED_BY
   ,DATE_MODIFIED
   ,MODIFIED_BY
   )
   values
   (p_comcai.ID
   ,p_comcai.CODIGO
   ,p_comcai.COMCAM_ID
   ,p_comcai.COMENT_ID
   ,p_comcai.COMCIT_ID
   ,p_comcai.LOCALIDAD
   ,p_comcai.PRECIO
   ,p_comcai.FECHA
   ,p_comcai.OBSERVACION
   ,p_comcai.COMZON_ID
   ,p_comcai.DATE_CREATED
   ,p_comcai.CREATED_BY
   ,p_comcai.DATE_MODIFIED
   ,p_comcai.MODIFIED_BY
   );
end;
/* Seteo de la variable v_comcai. */
PROCEDURE COMCAI_SET
 (P_ID IN number
 )
 IS
cursor cr_comcai is
 select *
   from COM_CAMPANIAS_ITEMS comcai
  where comcai.ID = p_id;
begin
 -- Inicializar la variable
 COMCAI_INI;
 -- Cargar la variable con los datos de la consulta
 open cr_comcai;
 fetch cr_comcai into v_comcai;
 close cr_comcai;
 --
end;
/* Obtener el valor de la variable v_comcam. */
PROCEDURE COMCAM_GET
 (P_COMCAM OUT COM_CAMPANIAS%ROWTYPE
 )
 IS
begin
   p_comcam:=v_comcam;
end;
/* Inicializar la variable v_comcam. */
PROCEDURE COMCAM_INI
 IS
begin
  v_comcam:=null;
end;
/* Insertar registro en  COM_CAMPANIAS. */
PROCEDURE COMCAM_INS
 (P_COMCAM IN COM_CAMPANIAS%ROWTYPE
 )
 IS
begin
   insert into COM_CAMPANIAS
   (ID
   ,SEGORG_ID
   ,CODIGO
   ,NOMBRE
   ,DESCRIPCION
   ,COMCOB_ID
   ,COMCAE_ID
   ,FECHA_INICIO_CAMPANIA
   ,FECHA_FIN_COLECTAR
   ,FECHA_FIN_ANALISIS
   ,FECHA_FIN_CAMPANIA
   ,DATE_CREATED
   ,CREATED_BY
   ,DATE_MODIFIED
   ,MODIFIED_BY
   )
   values
   (p_comcam.ID
   ,p_comcam.SEGORG_ID
   ,p_comcam.CODIGO
   ,p_comcam.NOMBRE
   ,p_comcam.DESCRIPCION
   ,p_comcam.COMCOB_ID
   ,p_comcam.COMCAE_ID
   ,p_comcam.FECHA_INICIO_CAMPANIA
   ,p_comcam.FECHA_FIN_COLECTAR
   ,p_comcam.FECHA_FIN_ANALISIS
   ,p_comcam.FECHA_FIN_CAMPANIA
   ,p_comcam.DATE_CREATED
   ,p_comcam.CREATED_BY
   ,p_comcam.DATE_MODIFIED
   ,p_comcam.MODIFIED_BY
   );
end;
/* Seteo de la variable v_comcam. */
PROCEDURE COMCAM_SET
 (P_ID IN NUMBER
 )
 IS
cursor cr_comcam is
 select *
   from COM_CAMPANIAS comcam
  where comcam.ID = p_id;
begin
 -- Inicializar la variable
 COMCAM_INI;
 -- Cargar la variable con los datos de la consulta
 open cr_comcam;
 fetch cr_comcam into v_comcam;
 close cr_comcam;
 --
end;
/* Seteo de la variable v_comcam según código. */
PROCEDURE COMCAM_SET_CODIGO
 (P_SEGORG_ID IN NUMBER
 ,P_CODIGO IN VARCHAR2
 )
 IS
cursor cr_comcam is
 select *
   from COM_CAMPANIAS comcam
  where comcam.SEGORG_ID = p_segorg_id
    and comcam.CODIGO    = p_codigo ;
begin
 -- Inicializar la variable
 COMCAM_INI;
 -- Cargar la variable con los datos de la consulta
 open cr_comcam;
 fetch cr_comcam into v_comcam;
 close cr_comcam;
 --
end;
/* Obtener el valor de la variable v_comcap. */
PROCEDURE COMCAP_GET
 (P_COMCAP OUT COM_CAMPANIAS_PRECIOS%ROWTYPE
 )
 IS
begin
   p_comcap:=v_comcap;
end;
/* Inicializar la variable v_comcap. */
PROCEDURE COMCAP_INI
 IS
begin
  v_comcap:=null;
end;
/* Insertar registro en  COM_CAMPANIAS_PRECIOS. */
PROCEDURE COMCAP_INS
 (P_COMCAP IN COM_CAMPANIAS_PRECIOS%ROWTYPE
 )
 IS
begin
   insert into COM_CAMPANIAS_PRECIOS
   (ID
   ,COMCAM_ID
   ,COMCIT_ID
   ,COMZON_ID
   ,PRECIO_RELEVADO
   ,PRECIO_VIGENTE_ZONA
   ,PRECIO_VIGENTE_GLOBAL
   ,PRECIO_ULTIMO_ADJUDICADO
   ,PRECIO_PROMEDIO_ADJUDICADO
   ,PRECIO_SUGERIDO
   ,OBSERVACION   
   ,SITUACION
   ,FECHA_SITUACION
   ,MOTIVO_SITUACION
   ,DATE_CREATED
   ,CREATED_BY
   ,DATE_MODIFIED
   ,MODIFIED_BY
   )
   values
   (p_comcap.ID
   ,p_comcap.COMCAM_ID
   ,p_comcap.COMCIT_ID
   ,p_comcap.COMZON_ID
   ,p_comcap.PRECIO_RELEVADO
   ,p_comcap.PRECIO_VIGENTE_ZONA
   ,p_comcap.PRECIO_VIGENTE_GLOBAL
   ,p_comcap.PRECIO_ULTIMO_ADJUDICADO
   ,p_comcap.PRECIO_PROMEDIO_ADJUDICADO
   ,p_comcap.PRECIO_SUGERIDO
   ,p_comcap.OBSERVACION
   ,p_comcap.SITUACION
   ,p_comcap.FECHA_SITUACION
   ,p_comcap.MOTIVO_SITUACION
   ,p_comcap.DATE_CREATED
   ,p_comcap.CREATED_BY
   ,p_comcap.DATE_MODIFIED
   ,p_comcap.MODIFIED_BY
   );
end;
PROCEDURE COMCCT_GET
 (P_COMCCT OUT COM_COMPDT_COMCTT%ROWTYPE
 )
 IS
begin
  p_comcct := v_comcct;
end;
PROCEDURE COMCCC_INS
 (P_COMCCC IN COM_COMPAU_COB%ROWTYPE
 )
 IS
begin
  insert into COM_COMPAU_COB
   (ID
   ,COMPAU_PROC
   ,COMCOB_ID
   ,DATE_CREATED
   ,CREATED_BY
   ,DATE_MODIFIED
   ,MODIFIED_BY
   )
  values
   (p_comccc.ID
   ,p_comccc.COMPAU_PROC
   ,p_comccc.COMCOB_ID
   ,p_comccc.DATE_CREATED
   ,p_comccc.CREATED_BY
   ,p_comccc.DATE_MODIFIED
   ,p_comccc.MODIFIED_BY
   );
end;
PROCEDURE COMCCE_INS
 (P_COMCCE IN COM_COMPAU_ECO%ROWTYPE
 )
 IS
begin
  insert into COM_COMPAU_ECO
   (ID
   ,COMPAU_PROC
   ,COMECO_ID
   ,DATE_CREATED
   ,CREATED_BY
   ,DATE_MODIFIED
   ,MODIFIED_BY
   )
  values
   (p_comcce.ID
   ,p_comcce.COMPAU_PROC
   ,p_comcce.COMECO_ID
   ,p_comcce.DATE_CREATED
   ,p_comcce.CREATED_BY
   ,p_comcce.DATE_MODIFIED
   ,p_comcce.MODIFIED_BY
   );
end;
PROCEDURE COMCCT_INI
 IS
begin
  v_comcct := null;
end;
PROCEDURE COMCCT_INS
 (P_COMCCT IN COM_COMPDT_COMCTT%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_COMPDT_COMCTT
  ( ID
   ,COMPDT_ID 
   ,COMCTT_ID   
   ,NECESARIO_COTIZAR_SN
   ,DATE_CREATED
   ,CREATED_BY
   ,DATE_MODIFIED
   ,MODIFIED_BY)
  values 
  ( p_comcct.ID
   ,p_comcct.COMPDT_ID 
   ,p_comcct.COMCTT_ID 
   ,p_comcct.NECESARIO_COTIZAR_SN
   ,p_comcct.DATE_CREATED
   ,p_comcct.CREATED_BY 
   ,p_comcct.DATE_MODIFIED
   ,p_comcct.MODIFIED_BY);
  --
END;
PROCEDURE COMCCT_SET
 (P_ID IN NUMBER
 )
 IS
CURSOR cr_dat IS
  SELECT *
  FROM COM_COMPDT_COMCTT
  WHERE ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  COMCCT_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_dat;
  FETCH cr_dat INTO v_comcct;
  CLOSE cr_dat;
  --
END;
/* Seteo de la variable v_comcap. */
PROCEDURE COMCAP_SET
 (P_ID IN NUMBER
 )
 IS
cursor cr_comcap is
 select *
   from COM_CAMPANIAS_PRECIOS comcap
  where comcap.ID = p_id;
begin
 -- Inicializar la variable
 COMCAP_INI;
 -- Cargar la variable con los datos de la consulta
 open cr_comcap;
 fetch cr_comcap into v_comcap;
 close cr_comcap;
 --
end;
/* Obtener el valor de la variable v_coment. */
PROCEDURE COMENT_GET
 (P_COMENT IN OUT NOCOPY COM_ENTIDADES%ROWTYPE
 )
 IS
begin
   p_coment:=v_coment;
end;
/* Inicializar la variable v_coment. */
PROCEDURE COMENT_INI
 IS
BEGIN
  NULL;
END COMENT_INI;
/* Insertar registro en  COM_ENTIDADES. */
PROCEDURE COMENT_INS
 (P_COMENT IN COM_ENTIDADES%ROWTYPE
 )
 IS
begin
   insert into COM_ENTIDADES
    (ID
    ,SEGORG_ID
    ,CODIGO
    ,NOMBRE
    ,DESCRIPCION
    ,SITUACION
    ,FECHA_SITUACION
    ,MOTIVO_SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY
    )
    values
    (p_coment.ID
    ,p_coment.SEGORG_ID
    ,p_coment.CODIGO
    ,p_coment.NOMBRE
    ,p_coment.DESCRIPCION
    ,p_coment.SITUACION
    ,p_coment.FECHA_SITUACION
    ,p_coment.MOTIVO_SITUACION
    ,p_coment.DATE_CREATED
    ,p_coment.CREATED_BY
    ,p_coment.DATE_MODIFIED
    ,p_coment.MODIFIED_BY
    );
end;
/* Seteo de la variable v_coment. */
PROCEDURE COMENT_SET
 (P_ID IN NUMBER
 )
 IS
cursor cr_coment is
 select *
   from COM_ENTIDADES coment
  where coment.ID = p_id;
begin
 -- Inicializar la variable
 COMENT_INI;
 -- Cargar la variable con los datos de la consulta
 open cr_coment;
 fetch cr_coment into v_coment;
 close cr_coment;
 --
end;
/* Seteo de la variable v_coment según Código. */
PROCEDURE COMENT_SET_CODIGO
 (P_SEGORG_ID IN NUMBER
 ,P_CODIGO IN VARCHAR2
 )
 IS
cursor cr_coment is
 select *
   from COM_ENTIDADES coment
  where coment.SEGORG_ID = p_segorg_id
    and coment.CODIGO = p_codigo ;
begin
 -- Inicializar la variable
 COMENT_INI;
 -- Cargar la variable con los datos de la consulta
 open cr_coment;
 fetch cr_coment into v_coment;
 close cr_coment;
 --
end;
/* Obtener el valor de la variable v_comenz. */
PROCEDURE COMENZ_GET
 (P_COMENZ OUT COM_ENTIDADES_ZONAS%ROWTYPE
 )
 IS
begin
   p_comenz:=v_comenz;
end;
/* Inicializar la variable v_comenz. */
PROCEDURE COMENZ_INI
 IS
begin
  v_comenz:=null;
end;
/* Insertar registro en  COM_ENTIDADES_ZONAS. */
PROCEDURE COMENZ_INS
 (P_COMENZ IN COM_ENTIDADES_ZONAS%ROWTYPE
 )
 IS
begin
   insert into COM_ENTIDADES_ZONAS
    (ID
    ,COMENT_ID
	,COMZON_ID
    ,SITUACION
    ,FECHA_SITUACION
    ,MOTIVO_SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY
    )
    values
    (p_comenz.ID
    ,p_comenz.COMENT_ID
	,p_comenz.COMZON_ID
    ,p_comenz.SITUACION
    ,p_comenz.FECHA_SITUACION
    ,p_comenz.MOTIVO_SITUACION
    ,p_comenz.DATE_CREATED
    ,p_comenz.CREATED_BY
    ,p_comenz.DATE_MODIFIED
    ,p_comenz.MODIFIED_BY
    );
end;
/* Seteo de la variable v_comenz. */
PROCEDURE COMENZ_SET
 (P_ID IN NUMBER
 )
 IS
cursor cr_comenz is
 select *
   from COM_ENTIDADES_ZONAS comenz
  where comenz.ID = p_id;
begin
 -- Inicializar la variable
 COMENZ_INI;
 -- Cargar la variable con los datos de la consulta
 open cr_comenz;
 fetch cr_comenz into v_comenz;
 close cr_comenz;
 --
end;
/* Seteo de la variable v_coment según Zona. */
PROCEDURE COMENZ_SET_ZONA
 (P_COMENT_ID IN NUMBER
 ,P_COMZON_ID IN NUMBER
 )
 IS
cursor cr_comenz is
 select *
   from COM_ENTIDADES_ZONAS comenz
  where comenz.COMENT_ID = p_coment_id
    and comenz.COMZON_ID = p_comzon_id ;
begin
 -- Inicializar la variable
 COMENZ_INI;
 -- Cargar la variable con los datos de la consulta
 open cr_comenz;
 fetch cr_comenz into v_comenz;
 close cr_comenz;
 --
end;
PROCEDURE COMPAU_GET
 (P_COMPAU OUT COM_PEDIDOS_AUT%ROWTYPE
 )
 IS
begin
  p_compau := v_compau;
end;
PROCEDURE COMPAU_INI
 IS
begin
  v_compau := null;
end;
PROCEDURE COMPAU_INS
 (P_COMPAU IN COM_PEDIDOS_AUT%ROWTYPE
 )
 IS
begin
  insert into COM_PEDIDOS_AUT
  (ID
  ,COMECO_ID
  ,COMCOB_ID
  ,DIA_DESDE
  ,DIA_HASTA
  ,SITUACION
  ,FECHA_SITUACION
  ,MOTIVO_SITUACION
  ,DATE_CREATED
  ,CREATED_BY
  ,DATE_MODIFIED
  ,MODIFIED_BY
  )
  values
  (p_compau.ID
  ,p_compau.COMECO_ID
  ,p_compau.COMCOB_ID
  ,p_compau.DIA_DESDE
  ,p_compau.DIA_HASTA
  ,p_compau.SITUACION
  ,p_compau.FECHA_SITUACION
  ,p_compau.MOTIVO_SITUACION
  ,p_compau.DATE_CREATED
  ,p_compau.CREATED_BY
  ,p_compau.DATE_MODIFIED
  ,p_compau.MODIFIED_BY
  );
end;
PROCEDURE COMPAU_SET
 (P_ID IN NUMBER
 )
 IS
cursor cr_compau is
    select *
    from COM_PEDIDOS_AUT
    where ID = p_id;
begin           
  -- Inicializa la variable
  COMPAU_INI;
   -- Cargar la variable con los datos de la consulta
  open cr_compau;
  fetch cr_compau into v_compau;
  close cr_compau;
end;
PROCEDURE COMZON_GET
 (P_COMZON OUT COM_ZONAS%ROWTYPE
 )
 IS
begin
    p_comzon:=v_comzon;
end;
PROCEDURE COMZON_INI
 IS
begin
    v_comzon:=null;
end;
PROCEDURE COMZON_INS
 (P_COMZON IN COM_ZONAS%ROWTYPE
 )
 IS
begin
    insert into COM_ZONAS
    (ID
    ,SEGORG_ID
    ,CODIGO
    ,NOMBRE
    ,DESCRIPCION
    ,SITUACION
    ,FECHA_SITUACION
    ,MOTIVO_SITUACION
    ,DATE_CREATED
    ,CREATED_BY
    ,DATE_MODIFIED
    ,MODIFIED_BY
    )
    values
    (p_comzon.ID
    ,p_comzon.SEGORG_ID
    ,p_comzon.CODIGO
    ,p_comzon.NOMBRE
    ,p_comzon.DESCRIPCION
    ,p_comzon.SITUACION
    ,p_comzon.FECHA_SITUACION
    ,p_comzon.MOTIVO_SITUACION
    ,p_comzon.DATE_CREATED
    ,p_comzon.CREATED_BY
    ,p_comzon.DATE_MODIFIED
    ,p_comzon.MODIFIED_BY
    );
END;
PROCEDURE COMZON_SET
 (P_ID IN NUMBER
 )
 IS
CURSOR cr_dat IS
  SELECT *
  FROM COM_ZONAS
  WHERE ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  COMZON_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_dat;
  FETCH cr_dat INTO v_comzon;
  CLOSE cr_dat;
  --
END;
PROCEDURE COMZON_SET_CODIGO
 (P_SEGORG_ID IN NUMBER
 ,P_CODIGO IN VARCHAR2
 )
 IS
CURSOR cr_comzon IS
  SELECT *
  FROM COM_ZONAS COMZON
  WHERE COMZON.SEGORG_ID = p_segorg_id
    AND COMZON.CODIGO    = p_codigo;
  --
BEGIN
  -- Inicializar la variable
  COMZON_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comzon;
  FETCH cr_comzon INTO v_comzon;
  CLOSE cr_comzon;
  --
END;
PROCEDURE COMZON_SET_NOMBRE
 (P_SEGORG_ID IN NUMBER
 ,P_NOMBRE IN VARCHAR2
 )
 IS
CURSOR cr_comzon IS
  SELECT *
  FROM COM_ZONAS COMZON
  WHERE COMZON.SEGORG_ID = p_segorg_id
    AND COMZON.NOMBRE    = p_nombre;
  --
BEGIN
  -- Inicializar la variable
  COMZON_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN cr_comzon;
  FETCH cr_comzon INTO v_comzon;
  CLOSE cr_comzon;
  --
END;
/* Obtener el valor de la variable v_comztl. */
PROCEDURE COMZTL_GET
 (P_COMZTL OUT COM_ZONAS_TRRLOC%ROWTYPE
 )
 IS
begin
  p_comztl := v_comztl;
end;
/* Inicializar la variable v_comztl. */
PROCEDURE COMZTL_INI
 IS
begin
  v_comztl:= null;
end;
/* Insertar registro en  COM_ZONAS_TRRLOC. */
PROCEDURE COMZTL_INS
 (P_COMZTL IN COM_ZONAS_TRRLOC%ROWTYPE
 )
 IS
BEGIN
  --
  INSERT INTO COM_ZONAS_TRRLOC
  ( ID
   ,COMZON_ID
   ,COMTRR_ID
   ,OBSERVACION
   ,DATE_CREATED
   ,CREATED_BY
   ,DATE_MODIFIED
   ,MODIFIED_BY
   )
   values (p_comztl.ID
   ,p_comztl.COMZON_ID
   ,p_comztl.COMTRR_ID
   ,p_comztl.OBSERVACION
   ,p_comztl.DATE_CREATED
   ,p_comztl.CREATED_BY
   ,p_comztl.DATE_MODIFIED
   ,p_comztl.MODIFIED_BY   
   );
  --
END;
/* Seteo de la variable v_comztl. */
PROCEDURE COMZTL_SET
 (P_ID IN NUMBER
 )
 IS
--
  CURSOR cr_comztl is
  SELECT *
  FROM COM_ZONAS_TRRLOC
  WHERE ID = p_id;
  --
BEGIN
  -- Inicializar la variable
  COMZTL_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN  cr_comztl;
  FETCH cr_comztl INTO v_comztl;
  CLOSE cr_comztl;
  --
END;
/* Seteo de la variable v_comztl segun Localidad. */
PROCEDURE COMZTL_SET_LOCALIDAD
 (P_COMZON_ID IN NUMBER
 ,P_COMTRR_ID IN NUMBER
 )
 IS
--
  CURSOR cr_comztl is
  SELECT *
  FROM COM_ZONAS_TRRLOC
  WHERE COMZON_ID = p_comzon_id
    AND COMTRR_ID = p_comtrr_id;
  --
BEGIN
  -- Inicializar la variable
  COMZTL_INI;
  -- Cargar la variable con los datos de la consulta
  OPEN  cr_comztl;
  FETCH cr_comztl INTO v_comztl;
  CLOSE cr_comztl;
  --
END;

END COMCAT_PKG;
/
SHOW ERROR

