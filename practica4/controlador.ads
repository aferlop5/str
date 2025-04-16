--  Dependencias
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

--  Especificacion del paquete
package Controlador is

   ----------------
   -- Sincroniza --
   ----------------
   --  Especificacion del objeto protegido de sincronizacion de tareas

   protected Sincroniza is
      --  Interfaz de sincronizacion

      -- Añade una nueva palabra para buscar
      procedure Nueva_Palabra (Pal: in Unbounded_String);

      -- Espera hasta que haya una palabra disponible
      entry Espera_Palabra (Pal: out Unbounded_String);

      -- Marca que una tarea ha terminado la búsqueda
      procedure Fin_Busqueda;

      -- Espera hasta que todas las tareas hayan terminado
      entry Espera_Fin_Busqueda;

      -- Señala que el programa debe finalizar
      procedure Terminar;

   private
      --  Variables protegidas
      -- Estas se definen en el cuerpo del paquete (controlador.adb)

   end Sincroniza;

end Controlador;
