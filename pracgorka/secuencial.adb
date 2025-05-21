with Ada.Text_IO;               use Ada.Text_IO;
with Ada.Strings.Unbounded;     use Ada.Strings.Unbounded;
with Sopa;
with Controlador;

procedure Secuencial is

   package US renames Ada.Strings.Unbounded;
   use Sopa;

   Sync : Controlador.Sincroniza;

   task type Worker is
   end Worker;

   task body Worker is
      Pal : US.Unbounded_String;
   begin
      loop
         Sync.Espera_Palabra(Pal);
         exit when US.Length(Pal) = 0; 
         Busca(Pal, EscribeConMutex'Access);
         Sync.Fin_Busqueda;
      end loop;
   end Worker;

   T1, T2, T3 : Worker;

   NumPal : NumeroPalabras;
   Lista : LstPalabras;

begin
   loop
      Pide_Datos(NumPal, Lista);
      if NumPal = 0 then
         Sync.Terminar;
         exit;
      end if;

      for I in 1 .. NumPal loop
         Sync.Nueva_Palabra(Lista(I));
      end loop;

      Sync.Espera_Fin_Busqueda;
   end loop;

end Secuencial;
