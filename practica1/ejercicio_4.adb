with Ada.Text_IO;
with Ada.Float_Text_IO; -- Necesario para leer y escribir floats. ademas de obtener notacion cientifica
with Complejos;

use Ada.Text_IO;
use Ada.Float_Text_IO;
use Complejos;

procedure Ejercicio_4 is
    A, B, Res: Complejo; -- A, B y Res son de tipo complejo. Complejo es un tipo definido en el paquete Complejos 
    R1, I1, R2, I2: Float; -- R1, I1, R2 e I2 son de tipo Float
    Op: Character; -- Op es de tipo Character que es + - * o /
begin
    Put_Line("Ingrese la parte real pulse enter e imaginaria del primer número complejo:");
    Get(R1); -- Lee un número en punto flotante de la entrada estándar y lo almacena en R1
    Get(I1);
    A := Construir(R1, I1); -- A es un número complejo construido con R1 y I1

    Put_Line("Ingrese la parte real pulse enter e imaginaria del segundo número complejo:");
    Get(R2);
    Get(I2);
    B := Construir(R2, I2); --  B es un número complejo construido con R2 y I2

    Put_Line("Seleccione operación (+, -, *, /):"); -- Pide al usuario que seleccione una operación
    Get(Op); -- Lee un caracter de la entrada estándar y lo almacena en Op

    case Op is -- Evalua Op y ejecuta el bloque correspondiente dependiendo de su valor
        when '+' => Res := A + B; -- Hace la suma y la almacena en Res
        when '-' => Res := A - B;
        when '*' => Res := A * B;
        when '/' => Res := A / B;
        when others => Put_Line("Operación no válida"); return;
    end case;

    Put_Line("Resultado: " & Float'Image(Parte_Real(Res)) & " + " & Float'Image(Parte_Imag(Res)) & "i"); -- Imprime el resultado
end Ejercicio_4;

