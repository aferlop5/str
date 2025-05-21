with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
package body Controlador is

   protected body Sincroniza is

      procedure Nueva_Palabra (Pal : in Unbounded_String) is
      begin
         Cola_Palabras(Fin) := Pal;
         if Fin = Cola_Palabras'Last then
            Fin := Cola_Palabras'First;
         else
            Fin := Fin + 1;
         end if;
         Palabras_Pendientes := Palabras_Pendientes + 1;
      end Nueva_Palabra;

      entry Espera_Palabra (Pal : out Unbounded_String) when Palabras_Pendientes > 0 or Finalizar is
      begin
         if Finalizar then
            Pal := Null_Unbounded_String;
         else
            Pal := Cola_Palabras(Inicio);
            if Inicio = Cola_Palabras'Last then
               Inicio := Cola_Palabras'First;
            else
               Inicio := Inicio + 1;
            end if;
            Palabras_Pendientes := Palabras_Pendientes - 1;
            Tareas_Activas := Tareas_Activas + 1;
         end if;
      end Espera_Palabra;

      procedure Fin_Busqueda is
      begin
         Tareas_Activas := Tareas_Activas - 1;
      end Fin_Busqueda;

      entry Espera_Fin_Busqueda when Tareas_Activas = 0 and Palabras_Pendientes = 0 is
      begin
         null;
      end Espera_Fin_Busqueda;

      procedure Terminar is
      begin
         Finalizar := True;
      end Terminar;

   end Sincroniza;

end Controlador;