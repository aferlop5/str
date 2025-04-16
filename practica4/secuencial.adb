--  Dependencias
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Sopa;
with Controlador;

--  Procedimiento principal
procedure Secuencial is

   Numero_Palabras : Sopa.NumeroPalabras;
   Palabra         : Sopa.LstPalabras;

   task type Worker is
   end Worker;

   task body Worker is
      Pal: Unbounded_String;
   begin
      loop
         begin
            Controlador.Sincroniza.Espera_Palabra(Pal);
            Sopa.Busca(Pal, Sopa.EscribeConMutex'Access);
            Controlador.Sincroniza.Fin_Busqueda;
         exception
            when Program_Error =>
               exit; -- Finalizar tarea
         end;
      end loop;
   end Worker;

   T1, T2, T3 : Worker;

begin
   loop
      Sopa.Pide_Datos(Numero_Palabras, Palabra);

      if Numero_Palabras = 0 then
         Controlador.Sincroniza.Terminar;
         exit;
      end if;

      for P in 1..Numero_Palabras loop
         Controlador.Sincroniza.Nueva_Palabra(Palabra(P));
      end loop;

      Controlador.Sincroniza.Espera_Fin_Busqueda;
   end loop;

end Secuencial;
