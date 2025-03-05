with pila_generica;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Main is
   Orden: Integer;
   Elem: Float;

   procedure Imprimir_Entero(I: Integer) is
   begin
      Put_Line(Integer'Image(I));
   end Imprimir_Entero;

   procedure Imprimir_Float(F: Float) is
   begin
      Put_Line(Float'Image(F));
   end Imprimir_Float;

   package Pila_Enteros is new Pila_Generica(Capacidad => 10, Tipo_Item => Integer, Imprimir => Imprimir_Entero);
   package Pila_Floats is new Pila_Generica(Capacidad => 10, Tipo_Item => Float, Imprimir => Imprimir_Float);

   Mi_Pila1: Pila_Floats.Tipo_Pila;
   Mi_Pila2: Pila_Enteros.Tipo_Pila;

begin
   Put_Line("Programa de PRUEBA DE Pilas");
   Pila_Floats.Vaciar(Mi_Pila1);
   Pila_Enteros.Vaciar(Mi_Pila2);

   Bucle1:
   loop
      Put_Line("1. Añadir a la pila");
      Put_Line("2. Sacar de la pila");
      Put_Line("3. Listar la pila");
      Put_Line("4. Inicializar la pila");
      Put_Line("0. Acabar");
      Get(Orden);
      begin
         case Orden is
            when 1 =>
               Put("Introduce un valor float: ");
               Ada.Float_Text_IO.Get(Elem);
               begin
                  Pila_Floats.Push(Mi_Pila1, Elem);
               exception
                  when Pila_Floats.Pila_Llena => Put_Line("Error: Pila llena");
               end;

            when 2 =>
               begin
                  Pila_Floats.Pop(Mi_Pila1, Elem);
                  Put("Valor sacado de la pila de floats: ");
                  Put(Elem); -- Cambiar Put_Float a Put
                  New_Line;
                  Pila_Enteros.Push(Mi_Pila2, Integer(Elem));
                  Put_Line("y se ha introducido en la pila de enteros");
               exception
                  when Pila_Floats.Pila_Vacia => Put_Line("Error: Pila vacía");
                  when Pila_Enteros.Pila_Llena => Put_Line("Error: Pila de enteros llena");
               end;

            when 3 =>
               Put_Line("Pila de Floats:");
               Pila_Floats.Listar(Mi_Pila1);
               Put_Line("Pila de Enteros:");
               Pila_Enteros.Listar(Mi_Pila2);

            when 4 =>
               Pila_Floats.Vaciar(Mi_Pila1);
               Pila_Enteros.Vaciar(Mi_Pila2);
               Put_Line("Pilas reiniciadas");

            when 0 =>
               exit Bucle1;

            when others =>
               Put_Line("Opción no válida");
         end case;
      exception
         when others => Put_Line("Error desconocido");
      end;
      New_Line;
   end loop Bucle1;

end Main;
