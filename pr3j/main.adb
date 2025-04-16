with Ada.Text_IO; use Ada.Text_IO;
with datos; use datos;
with tareas; use tareas;

procedure Main is
   task operador;
   task body operador is
      Opcion : Character;
      Datos2 : Datos1; 

   begin
      loop
         Put_Line("Practica 3");
         Put_Line("Menú:");
         Put_Line("1. Arrancar Incrementador");
         Put_Line("2. Parar Incrementador");
         Put_Line("3. Terminar Incrementador");
         Put_Line("4. Arrancar Decrementador");
         Put_Line("5. Parar Decrementador");
         Put_Line("6. Terminar Decrementador");
         Put_Line("7. Salir");

         Put("Seleccione una opción: ");
         Get(Opcion);

         case Opcion is
            when '1' =>
               if Datos2.Obtener_Status = Activo then
                  Put_Line("El Incrementador ya está en ejecución.");
               else
                  Datos2.Set_Terminado(False); -- Reinicia el estado a Activo
                  Put_Line("Incrementador arrancado.");
               end if;
            when '2' =>
               if Datos2.Obtener_Status /= Activo then
                  Put_Line("El Incrementador ya está parado.");
               else
                  Datos2.Set_Terminado(True); -- Pausa el incrementador
                  Put_Line("Incrementador parado.");
               end if;
            when '3' =>
               Datos2.Set_Terminado(True); -- Termina el incrementador
               Put_Line("Incrementador terminado.");
            when '4' =>
               if Datos2.Obtener_Status = Activo then
                  Put_Line("El Decrementador ya está en ejecución.");
               else
                  Datos2.Set_Terminado(False); -- Reinicia el estado a Activo
                  Put_Line("Decrementador arrancado.");
               end if;
            when '5' =>
               if Datos2.Obtener_Status /= Activo then
                  Put_Line("El Decrementador ya está parado.");
               else
                  Datos2.Set_Terminado(True); -- Pausa el decrementador
                  Put_Line("Decrementador parado.");
               end if;
            when '6' =>
               Datos2.Set_Terminado(True); -- Termina el decrementador
               Put_Line("Decrementador terminado.");
            when '7' =>
               exit;  -- Salir del bucle y terminar la tarea
            when others =>
               Put_Line("Opción no válida, intente de nuevo.");
         end case;
      end loop;
   end operador;

begin
   null; -- Bloque ejecutable principal
end Main;