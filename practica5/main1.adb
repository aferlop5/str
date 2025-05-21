with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with GPIO_CORA;

procedure Main is
   LED_Value       : Integer := 0;
   Prev_ButtonVal  : Integer := -1;
begin
   GPIO_CORA.SetRGBOutput;
   GPIO_CORA.SetBuOnInput;

   loop
      GPIO_CORA.WriteRGB(LED_Value);
      Put_Line("Valor escrito en LEDs RGB: " & Integer'Image(LED_Value));

      declare
         Current_Button : Integer := GPIO_CORA.ReadBuOn;
      begin
         if Current_Button /= Prev_ButtonVal then
            Put_Line("Valor de pulsadores cambiado: " & Integer'Image(Current_Button));
            Prev_ButtonVal := Current_Button;
         end if;
      end;

      delay 1.0;
      LED_Value := (LED_Value + 1) mod 64;
   end loop;
end Main;