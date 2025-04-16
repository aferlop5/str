with Ada.Text_IO; use Ada.Text_IO;
with datos; use datos;
with Tareas; use Tareas;
with Datos_Protegidos; use Datos_Protegidos;

procedure Main is
   task Operador;

   task body Operador is
      Opcion : Character;
      Datos2 : Datos1; -- Instancia del objeto protegido
   begin
      loop
         Put_Line("");
         Put_Line("Menú Principal:");
         Put_Line("a. Iniciar Incrementador");
         Put_Line("b. Detener Incrementador");
         Put_Line("c. Finalizar Incrementador");
         Put_Line("d. Iniciar Decrementador");
         Put_Line("e. Detener Decrementador");
         Put_Line("f. Finalizar Decrementador");
         Put_Line("g. Salir");

         Put("Seleccione una opción: ");
         Get(Opcion);

         case Opcion is
            when 'a' =>
               if Datos2.Obtener_Status = Activo then
                  Put_Line("El Incrementador ya está activo.");
               else
                  Datos2.Cambiar_Estado_Terminado(False);
                  Put_Line("Incrementador iniciado.");
               end if;
            when 'b' =>
               if Datos2.Obtener_Status /= Activo then
                  Put_Line("El Incrementador ya está detenido.");
               else
                  Datos2.Cambiar_Estado_Terminado(True);
                  Put_Line("Incrementador detenido.");
               end if;
            when 'c' =>
               Datos2.Cambiar_Estado_Terminado(True);
               Put_Line("Incrementador finalizado.");
            when 'd' =>
               if Datos2.Obtener_Status = Activo then
                  Put_Line("El Decrementador ya está activo.");
               else
                  Datos2.Cambiar_Estado_Terminado(False);
                  Put_Line("Decrementador iniciado.");
               end if;
            when 'e' =>
               if Datos2.Obtener_Status /= Activo then
                  Put_Line("El Decrementador ya está detenido.");
               else
                  Datos2.Cambiar_Estado_Terminado(True);
                  Put_Line("Decrementador detenido.");
               end if;
            when 'f' =>
               Datos2.Cambiar_Estado_Terminado(True);
               Put_Line("Decrementador finalizado.");
            when 'g' => exit; -- Salir del programa
            when others => Put_Line("Opción no válida.");
         end case;
      end loop;
   end Operador;

begin
   Put_Line("Bienvenido a la Práctica 3");

   -- Arrancar la tarea Operador
   --Operador;
end Main;

