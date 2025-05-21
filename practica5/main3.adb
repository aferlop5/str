with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with GPIO_CORA;

procedure Main is
   Color        : Integer := 0;
   CurrentLEDs : Integer := 0;
   Boton       : Integer;
   NewValue    : Integer;
begin
   GPIO_CORA.SetRGBOutput;
   GPIO_CORA.SetBuOnInput;
   Put_Line("Iniciando aplicación. Pulse ambos pulsadores para terminar.");
   loop
      declare
         NewColor : Integer := Color mod 8;
      begin
         Boton := GPIO_CORA.ReadBuOn;
         if Boton = 3 then
            delay 0.05; 
            if GPIO_CORA.ReadBuOn = 3 then
               Put_Line("Se presionaron ambos pulsadores. Terminando la aplicación.");
               exit;
            end if;
         elsif Boton = 1 then
            NewValue := (CurrentLEDs and 16#38#) or NewColor;
         elsif Boton = 2 then
            NewValue := (CurrentLEDs and 16#07#) or (NewColor * 8);
         else
            NewValue := NewColor or (NewColor * 8);
         end if;
         GPIO_CORA.WriteRGB(NewValue);
         CurrentLEDs := NewValue;
         Put_Line("Color aplicado: " & Integer'Image(NewColor) &
                  " | Estado RGB: " & Integer'Image(CurrentLEDs) &
                  " | Pulsadores: " & Integer'Image(Boton));
         Color := Color + 1;
      end;
      delay 1.0;
   end loop;
end Main;