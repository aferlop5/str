with Ada.Text_IO; use Ada.Text_IO;

procedure Mayormenor (numero : Integer) is
begin
   if numero > 0 then
      Put_Line("El número es positivo");
   elsif numero < 0 then
      Put_Line("El número es negativo");
   else
      Put_Line("El número es cero");
   end if;
end Mayormenor;

procedure Practicando is
   Num : Integer := 0;
   decimales : float := 0.0;
   caracter : character := 'A';
   cadena : string := "Hola Mundo";
begin
   Mayormenor(Num);
end Practicando; 