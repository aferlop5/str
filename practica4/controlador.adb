--  Dependencias

--  Cuerpo del paquete
package body Controlador is

   -- Lista para almacenar palabras
   NumMaxPalabras : constant Natural := 100; -- Tamaño máximo de la lista
   type Lista_Palabras is array (1..NumMaxPalabras) of Unbounded_String;
   Lista : Lista_Palabras;
   Inicio, Fin : Natural := 0;

   Contador_Tareas_Activas : Natural := 0;
   Busquedas_Pendientes : Natural := 0;
   Finalizado : Boolean := False;

   ----------------
   -- Sincroniza --
   ----------------
   protected body Sincroniza is

      -- Añade una nueva palabra a la lista
      procedure Nueva_Palabra (Pal: in Unbounded_String) is
      begin
         if Fin < NumMaxPalabras then
            Fin := Fin + 1;
            Lista(Fin) := Pal;
            Busquedas_Pendientes := Busquedas_Pendientes + 1;
         else
            raise Program_Error; -- Lista llena
         end if;
      end Nueva_Palabra;

      -- Espera hasta que haya una palabra disponible
      entry Espera_Palabra (Pal: out Unbounded_String) when Inicio < Fin or Finalizado is
      begin
         if Finalizado and Inicio = Fin then
            raise Program_Error; -- Señal para finalizar las tareas
         end if;
         Inicio := Inicio + 1;
         Pal := Lista(Inicio);
         Contador_Tareas_Activas := Contador_Tareas_Activas + 1;
      end Espera_Palabra;

      -- Marca que una tarea ha terminado la búsqueda
      procedure Fin_Busqueda is
      begin
         Contador_Tareas_Activas := Contador_Tareas_Activas - 1;
         Busquedas_Pendientes := Busquedas_Pendientes - 1;
      end Fin_Busqueda;

      -- Espera hasta que todas las tareas hayan terminado
      entry Espera_Fin_Busqueda when Contador_Tareas_Activas = 0 and Busquedas_Pendientes = 0 is
      begin
         null;
      end Espera_Fin_Busqueda;

      -- Señala que el programa debe finalizar
      procedure Terminar is
      begin
         Finalizado := True;
      end Terminar;

   end Sincroniza;

end Controlador;
