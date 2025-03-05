generic
   Capacidad: Positive;
   type Tipo_Item is private;
   with procedure Imprimir(I1: tipo_Item);

package pila_generica is
   type Tipo_Pila is private;
   procedure Push(Pila: in out Tipo_Pila; Elem: Tipo_Item);
   procedure Pop(Pila: in out Tipo_Pila;Elem: out Tipo_Item);
   function Esta_Vacia(Pila : Tipo_Pila) return Boolean;
   function Esta_Llena(Pila : Tipo_Pila) return Boolean;
   procedure Vaciar(Pila: in out Tipo_Pila);
   function Cima(Pila: Tipo_Pila ) return Tipo_Item;
   procedure Listar(pila : in Tipo_Pila);
  
   Pila_Llena,Pila_Vacia: exception;
private -- Pila_Generica
   subtype Tipo_Indice_Pila is Integer range 0..Capacidad;
   type Tipo_Valores_Pila is array(Tipo_Indice_Pila) of Tipo_Item;
   type Tipo_Pila is record
      Cima:    Tipo_Indice_Pila := 0;
      Valores: Tipo_Valores_Pila;
      contador: integer:=0;
   end record;
end pila_generica;