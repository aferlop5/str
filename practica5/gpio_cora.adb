with Interfaces;

package body GPIO_CORA is

   type Reg32 is new Interfaces.Unsigned_32;
   type GPIO_Type is record
      Datos   : Reg32;
      Control : Reg32;
   end record;
   pragma Volatile (GPIO_Type);

   RGB : GPIO_Type;
   for RGB'Address use System'To_Address(16#4120_0000#);
   pragma Import (Volatile, RGB);

   BU : GPIO_Type;
   for BU'Address use System'To_Address(16#4120_0008#);
   pragma Import (Volatile, BU);

   procedure SetRGBOutput is
   begin
      RGB.Control := 0;
   end SetRGBOutput;

   procedure SetButtonInput is
   begin
      BU.Control := 3;
   end SetButtonInput;

   procedure WriteRGB(Value : Reg32) is
   begin
      RGB.Datos := Value;
   end WriteRGB;

   function ReadButton return Integer is
   begin
      return Integer(BU.Datos and 3);
   end ReadButton;

end GPIO_CORA;