with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Controlador is

   subtype Indice is Integer range 1 .. 100;
   type Cola_Tipo is array (Indice) of Unbounded_String;

   protected type Sincroniza is
      procedure Nueva_Palabra (Pal : in Unbounded_String);
      entry Espera_Palabra (Pal : out Unbounded_String);
      procedure Fin_Busqueda;
      entry Espera_Fin_Busqueda;
      procedure Terminar;
   private
      Cola_Palabras : Cola_Tipo;
      Inicio, Fin : Indice := 1;
      Palabras_Pendientes : Natural := 0;
      Tareas_Activas : Natural := 0;
      Finalizar : Boolean := False;
   end Sincroniza;

end Controlador;