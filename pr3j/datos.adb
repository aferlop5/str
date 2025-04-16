with Ada.Text_IO; use Ada.Text_IO;

package body datos is

   protected body Datos1 is  -- Cambiado de "Datos" a "Datos1"
   
      entry Incrementar when Puede_Incrementar is
      begin
         if Puede_Incrementar then
            vble_compartida := vble_compartida + factor;
         end if;
      end Incrementar;

      entry Decrementar when Puede_Decrementar is
      begin
         if Puede_Decrementar then
            vble_compartida := vble_compartida - factor;
         end if;
      end Decrementar;

      function Obtener_Vble_Compartida return Integer is
      begin
         return vble_compartida;
      end Obtener_Vble_Compartida;

      function Obtener_Factor return Integer is
      begin
         return factor;
      end Obtener_Factor;

      function Obtener_Periodo1 return Integer is
      begin
         return periodo1;
      end Obtener_Periodo1;

      function Obtener_Periodo2 return Integer is
      begin
         return periodo2;
      end Obtener_Periodo2;

      function Obtener_Status return Estado is
      begin
         return status;
      end Obtener_Status;

      procedure Set_Terminado(Estado : Boolean) is
      begin
         status := Terminado;
      end Set_Terminado;

   end Datos1;  -- Cambiado de "Datos" a "Datos1"

end datos;