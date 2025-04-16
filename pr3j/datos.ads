
package datos is

      type Estado is (Activo, Parado, Terminado);

      protected type Datos1 is
         entry Incrementar;
         entry Decrementar;
         function Obtener_Vble_Compartida return Integer;
         function Obtener_Factor return Integer;
         function Obtener_Periodo1 return Integer;
         function Obtener_Periodo2 return Integer;
         function Obtener_Status return Estado;
         procedure Set_Terminado(Estado : Boolean);

      private 
         vble_compartida : Integer := 0;
         periodo1 : Integer := 70; 
         periodo2 : Integer := 100;
         factor : Integer := 1;
         status : Estado := Activo; 
         Puede_Incrementar : Boolean := True;  
         Puede_Decrementar : Boolean := True; 
      end Datos1;
end datos;
