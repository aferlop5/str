-- pila_generica.adb

with Ada.Text_IO; use Ada.Text_IO;

package body pila_generica is

   procedure Push(Pila: in out Tipo_Pila; Elem: Tipo_Item) is
   begin
      if Esta_Llena(Pila) then
         raise Pila_Llena;
      else
         Pila.Cima := Pila.Cima + 1;
         Pila.Valores(Pila.Cima) := Elem;
         Pila.contador := Pila.contador + 1;
      end if;
   end Push;

   procedure Pop(Pila: in out Tipo_Pila; Elem: out Tipo_Item) is
   begin
      if Esta_Vacia(Pila) then
         raise Pila_Vacia;
      else
         Elem := Pila.Valores(Pila.Cima);
         Pila.Cima := Pila.Cima - 1;
         Pila.contador := Pila.contador - 1;
      end if;
   end Pop;

   function Esta_Vacia(Pila: Tipo_Pila) return Boolean is
   begin
      return Pila.Cima = 0;
   end Esta_Vacia;

   function Esta_Llena(Pila: Tipo_Pila) return Boolean is
   begin
      return Pila.Cima = Capacidad;
   end Esta_Llena;

   procedure Vaciar(Pila: in out Tipo_Pila) is
   begin
      Pila.Cima := 0;
      Pila.contador := 0;
   end Vaciar;

   function Cima(Pila: Tipo_Pila) return Tipo_Item is
   begin
      if Esta_Vacia(Pila) then
         raise Pila_Vacia;
      else
         return Pila.Valores(Pila.Cima);
      end if;
   end Cima;

   procedure Listar(Pila: in Tipo_Pila) is
   begin
      if Esta_Vacia(Pila) then
         Put_Line("La pila está vacía");
      else
         for I in reverse 1..Pila.Cima loop
            Imprimir(Pila.Valores(I));
         end loop;
      end if;
   end Listar;

end pila_generica;
