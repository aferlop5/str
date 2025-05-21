with Interfaces;

package GPIO_CORA is

   type Reg32 is new Interfaces.Unsigned_32;
   type GPIO_Type is record
      Data, Control : Reg32;
   end record;
   pragma Volatile (GPIO_Type);

   procedure SetRGBOutput;
   procedure SetButtonInput;
   procedure WriteRGB(Value : Reg32);
   function ReadButton return Integer;

end GPIO_CORA;