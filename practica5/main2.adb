with Ada.Text_IO;         use Ada.Text_IO;
with GPIO_CORA;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Main is
   Prev_Button    : Integer := -1;
   Current_Button : Integer;
   LEDs_Value     : Integer;
begin
   GPIO_CORA.SetRGBOutput;
   GPIO_CORA.SetBuOnInput;

   loop
      Current_Button := GPIO_CORA.ReadBuOn;

      if Current_Button /= Prev_Button then
         Prev_Button := Current_Button;

         case Current_Button is
            when 0 =>
               LEDs_Value := 4 + (4 * 8);

            when 1 =>
               LEDs_Value := 2 + (2 * 8);

            when 2 =>
               LEDs_Value := 1 + (1 * 8);

            when 3 =>
               LEDs_Value := 7 + (7 * 8);

            when others =>
               LEDs_Value := 0;
         end case;

         GPIO_CORA.WriteRGB(LEDs_Value);
         Put_Line("Pulsador: " & Integer'Image(Current_Button) & 
                  " -> LEDs: " & Integer'Image(LEDs_Value));
      end if;

      delay 0.5;
   end loop;
end Main;