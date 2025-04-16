package Datos_Protegidos is

    -- Enumeración para representar el estado del sistema
    type Estado is (Activo, Parado, Terminado);

    -- Tipo protegido que encapsula las operaciones y datos compartidos
    protected type Datos1 is
        entry Incrementar;
        entry Decrementar;
        function Obtener_Vble_Compartida return Integer;
        function Obtener_Factor return Integer;
        function Obtener_Periodo1 return Integer;
        function Obtener_Periodo2 return Integer;
        function Obtener_Status return Estado;
        procedure Cambiar_Estado_Terminado(Estado : Boolean);
    private
        vble_compartida : Integer := 0;
        periodo1 : Integer := 70;
        periodo2 : Integer := 100;
        factor : Integer := 1;
        status : Estado := Activo; -- Estado inicial
        Puede_Incrementar : Boolean := True;  -- Control para incrementar
        Puede_Decrementar : Boolean := True;  -- Control para decrementar
    end Datos1;

end Datos_Protegidos;
