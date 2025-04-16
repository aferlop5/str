with Ada.TEXT_IO ; use Ada.Text_IO;
package body Sopa is

   type Matriz is array (RangoMatriz,RangoMatriz) of character;
   S: Matriz;

   F: File_Type;

   -- Variable tipo Matriz en la que se carga la matriz de letras.

   -------------
   -- Escribe --
   -------------

   procedure Escribe(Mensaje:Unbounded_String) is
   begin
      put(To_String(Mensaje));
      New_Line;
   end Escribe;

   protected Pantalla is
      procedure EscribeSeguro (Mensaje: Unbounded_String);
   end Pantalla;

   protected body Pantalla is

      procedure EscribeSeguro(Mensaje: Unbounded_String) is
      begin
         Escribe(Mensaje);
      end EscribeSeguro;

   end Pantalla;

   ---------------------
   -- EscribeConMutex --
   ---------------------

   procedure EscribeConMutex(Mensaje: Unbounded_String) is
   begin
      Pantalla.EscribeSeguro(Mensaje);
   end EscribeConMutex;

   -----------
   -- Busca --
   -----------

   procedure Busca(Palabra: Unbounded_String; Accion: ProcAccion) is

      Conseguida: array (Sentido) of Boolean;

   begin

      for Fila in RangoMatriz loop
         for Columna in RangoMatriz loop
            for Sen in Sentido loop
               Conseguida(Sen):=True;
            end loop;
            for Letra in 1..Length(Palabra) loop
               begin
                  Conseguida(LR):=Conseguida(LR) and (s(Columna+letra-1,Fila)= Element(Palabra,Letra));
               exception when Constraint_Error => Conseguida(LR):=False;
               end;
               begin
                  Conseguida(RL):=Conseguida(RL) and (s(Columna-letra+1,Fila)= Element(Palabra,Letra));
               exception when Constraint_Error => Conseguida(RL):=False;
               end;
               begin
                  Conseguida(UD):=Conseguida(UD) and (s(Columna,Fila+letra-1)= Element(Palabra,Letra));
               exception when  Constraint_Error => Conseguida(UD):=False;
               end;
               begin
                  Conseguida(DU):=Conseguida(DU) and (s(Columna,Fila-letra+1)= Element(Palabra,Letra));
               exception when  Constraint_Error => Conseguida(DU):=False;
               end;
               begin
                  Conseguida(DR):=Conseguida(DR) and (s(Columna+letra-1,Fila+letra-1)= Element(Palabra,Letra));
               exception when  Constraint_Error => Conseguida(DR):=False;
               end;
               begin
                  Conseguida(DL):=Conseguida(DL) and (s(Columna-letra+1,Fila+letra-1)= Element(Palabra,Letra));
               exception when  Constraint_Error => Conseguida(DL):=False;
               end;
               begin
                  Conseguida(AR):=Conseguida(AR) and (s(Columna+letra-1,Fila-letra+1)= Element(Palabra,Letra));
               exception when  Constraint_Error => Conseguida(AR):=False;
               end;
               begin
                  Conseguida(AL):=Conseguida(AL) and (s(Columna-letra+1,Fila-letra+1)= Element(Palabra,Letra));
               exception when  Constraint_Error => Conseguida(AL):=False;
               end;
            end loop;

            for Sen in Sentido loop
               if Conseguida(Sen)
               then
                  Accion.all(Palabra&"  "& Integer'Image(Fila)&"  " & Integer'Image(Columna)&"  " &Sentido'Image(Sen));
               end if;
            end loop;
         end loop;
      end loop;
   end Busca;

   ----------------
   -- Pide_Datos --
   ----------------

   procedure Pide_Datos (NumPal: out NumeroPalabras; Palabra: out LstPalabras) is
      S : String(1..60);
      SU: Unbounded_String;
      NC: Natural;

      NumTrab: RangoPalabras;

   begin
      for T in RangoPalabras loop
         Palabra(T):=To_Unbounded_String("");
      end loop;

      NumTrab:=1;

      EscribeConMutex( To_Unbounded_String("Escribe una linea con los nombres a buscar separados por espacios: "));
      New_Line;
      Get_Line(S,NC);
      if NC> 0
      then
         SU:= TO_Unbounded_String(S);

         for l in 1..NC loop
            if Element(SU,1)=' '
            then
               NumTrab:=NumTrab+1;
            else
               Palabra(NumTrab):=Palabra(NumTrab) & Element(SU,1);
            end if;
            Delete(SU,1,1);
         end loop;

         NumPal:=NumTrab;
      else
         NumPal:=0;

      end if;
   end Pide_Datos;

begin
   Open(File=>F,Mode=>In_File,Name=>FicheroLetras);
   for Fila in RangoMatriz loop
      for Columna in RangoMatriz loop
         get(F,S(columna,fila));
      end loop;
   end loop;
   close(F);
exception
   when E: others =>
      Put_Line ("Error");
end Sopa;
