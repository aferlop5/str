--  Dependencias
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Sopa is

   -- PAQUETE CON RECURSOS PARA PRACTICAS DE CONCURRENCIA CON ADA
   -- Prácticas de la serie "Sopa de Letras".

   NumMaxPalabras : constant Natural:= 10;
   subtype RangoPalabras is Natural range 1..NumMaxPalabras;
   subtype NumeroPalabras is Natural range 0..NumMaxPalabras;
   type LstPalabras is array (RangoPalabras) of Unbounded_String;

   ----------------
   -- Pide_Datos --
   ----------------
   -- Saca un texto de requerimiento en la pantalla. Recibe un texto
   -- con palabras a ser buscadas en la Sopa, separadas por espacios.
   -- Retorna en NumPal el número de palabras y en Palabra la lista
   -- de palabras introducidas.
   procedure Pide_Datos (NumPal: out NumeroPalabras;Palabra: out LstPalabras);


   -------------
   -- Escribe --
   -------------
   -- Escribe el mensaje en una linea de la pantalla.
   procedure Escribe (Mensaje: Unbounded_String);

   -- Escribe el mensaje en una linea de la pantalla
   -- conservando la exclusión mutua.
   procedure EscribeConMutex (Mensaje: Unbounded_String);

   -----------
   -- Busca --
   -----------
   type ProcAccion is access procedure (Mensaje: Unbounded_String);

   -- Busca en la matriz s la palabra y ejecuta un procedimiento acción
   -- por cada  palabra localizada, pasandole en cada invocación un mensaje
   -- conteniendo: palabra encontrada, fila, columna y dirección.
   procedure Busca (Palabra: Unbounded_String; Accion: ProcAccion);

private

   type Sentido is (LR,RL,UD,DU,DR,DL,AR,AL);
   -- LR: De Izquierda a Derecha     RL:De Derecha a Izquierda
   -- UD: De Arriba a Abajo          DU:De Abajo a Arriba
   -- DR: Descendente Derecha        DL:Descendente Izquierda
   -- AR: Ascendente Derecha         AL:Ascendente Izquierda

   DimMatriz:constant integer := 30;
   subtype RangoMatriz is Integer range 1..DimMatriz;
   -- Tipos relacionados con la dimensiones de la matriz de letras.

   FicheroLetras: constant String:= "Letras";
   -- PathName del fichero que contiene la mariz de letras

end Sopa;
