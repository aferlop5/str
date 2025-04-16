with Ada.Text_IO; use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
with Datos_Protegidos; use Datos_Protegidos;

package body Tareas is

   Datos_Instance : Datos1; -- Instancia del objeto protegido

   task body Incrementador is
      Contador  : Integer;
      Periodo: Time_Span;
      Siguiente: Time;
   begin
      Put_Line("Incrementador en ejecución");
      Siguiente := Clock;
      for i in 1..100 loop
         Contador := Datos_Instance.Obtener_Vble_Compartida;
         Contador := Contador + Datos_Instance.Obtener_Factor;
         Datos_Instance.Incrementar;
         Periodo := Milliseconds(Datos_Instance.Obtener_Periodo1);
         Siguiente := Siguiente + Periodo;
         delay until Siguiente;
      end loop;
      Put_Line("Incrementador finalizado");
      Datos_Instance.Cambiar_Estado_Terminado(True);
   end Incrementador;

   task body Decrementador is
      Contador  : Integer;
      Periodo: Time_Span;
      Siguiente: Time;
   begin
      Put_Line("Decrementador en ejecución");
      Siguiente := Clock;
      for i in 1..100 loop
         Contador := Datos_Instance.Obtener_Vble_Compartida;
         Contador := Contador - Datos_Instance.Obtener_Factor;
         Datos_Instance.Decrementar;
         Periodo := Milliseconds(Datos_Instance.Obtener_Periodo2);
         Siguiente := Siguiente + Periodo;
         delay until Siguiente;
      end loop;
      Put_Line("Decrementador finalizado");
      Datos_Instance.Cambiar_Estado_Terminado(True);
   end Decrementador;

   task body Visualizador is
      Periodo_Monitor : Integer := 100;
      Siguiente: Time;

   begin
      Put_Line("Visualizador en ejecución");
      Siguiente := Clock;
      loop
         if Incrementador'Terminated and Decrementador'Terminated then
            exit;
         end if;
         Put_Line("Variable Compartida: " & Integer'Image(Datos_Instance.Obtener_Vble_Compartida));
         Put_Line("Factor: " & Integer'Image(Datos_Instance.Obtener_Factor));
         Put_Line("Periodo 1: " & Integer'Image(Datos_Instance.Obtener_Periodo1));
         Put_Line("Periodo 2: " & Integer'Image(Datos_Instance.Obtener_Periodo2));

         Siguiente := Siguiente + Milliseconds(Periodo_Monitor);
         delay until Siguiente;
      end loop;
   end Visualizador;

end Tareas;
