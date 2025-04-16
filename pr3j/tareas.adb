with Ada.Text_IO; use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
with datos; use datos;

package body Tareas is

   -- Instancia del tipo protegido Datos1
   Datos_Globales : Datos1;

   task body Incrementador is
      Contador  : Integer;
      Periodo   : Time_Span;
      Siguiente : Time;
   begin
      Put_Line("Incrementador arrancado");
      Siguiente := Clock;
      for i in 1..100 loop
         Contador := Datos_Globales.Obtener_Vble_Compartida;
         Contador := Contador + Datos_Globales.Obtener_Factor;
         Datos_Globales.Incrementar;
         Periodo := Milliseconds(Datos_Globales.Obtener_Periodo1);
         Siguiente := Siguiente + Periodo;
         delay until Siguiente;
      end loop;
      Put_Line("Incrementador finalizado");
   end Incrementador;

   task body Decrementador is
      Contador  : Integer;
      Periodo   : Time_Span;
      Siguiente : Time;
   begin
      Put_Line("Decrementador arrancado");
      Siguiente := Clock;
      for i in 1..100 loop
         Contador := Datos_Globales.Obtener_Vble_Compartida;
         delay 0.01;
         Contador := Contador - Datos_Globales.Obtener_Factor;
         Datos_Globales.Decrementar;
         Periodo := Milliseconds(Datos_Globales.Obtener_Periodo2);
         Siguiente := Siguiente + Periodo;
         delay until Siguiente;
      end loop;
      Put_Line("Decrementador finalizado");
   end Decrementador;

   task body Visualizador is
      Periodo_Monitor : Integer := 100;
      Siguiente       : Time;
   begin
      Put_Line("Visualizador arrancado");
      Siguiente := Clock;
      Inicio: loop
         if Incrementador'Terminated and Decrementador'Terminated then
            exit;
         end if;
         Put_Line("V= " & Integer'Image(Datos_Globales.Obtener_Vble_Compartida));
         Put_Line("factor= " & Integer'Image(Datos_Globales.Obtener_Factor));
         Put_Line("p1= " & Integer'Image(Datos_Globales.Obtener_Periodo1));
         Put_Line("p2= " & Integer'Image(Datos_Globales.Obtener_Periodo2));

         Siguiente := Siguiente + Milliseconds(Periodo_Monitor);
         delay until Siguiente;
      end loop Inicio;
   end Visualizador;

end Tareas;
