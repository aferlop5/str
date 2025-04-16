with Ada.Text_IO; use Ada.Text_IO;

package body Datos_Protegidos is

    protected body Datos1 is
        entry Incrementar when Puede_Incrementar is
        begin
            if Puede_Incrementar then
                vble_compartida := vble_compartida + factor;
            end if;
        end Incrementar;

        entry Decrementar when Puede_Decrementar is
        begin
            if Puede_Decrementar then
                vble_compartida := vble_compartida - factor;
            end if;
        end Decrementar;

        function Obtener_Vble_Compartida return Integer is
        begin
            return vble_compartida;
        end Obtener_Vble_Compartida;

        function Obtener_Factor return Integer is
        begin
            return factor;
        end Obtener_Factor;

        function Obtener_Periodo1 return Integer is
        begin
            return periodo1;
        end Obtener_Periodo1;

        function Obtener_Periodo2 return Integer is
        begin
            return periodo2;
        end Obtener_Periodo2;

        function Obtener_Status return Estado is
        begin
            return status;
        end Obtener_Status;

        procedure Cambiar_Estado_Terminado(Estado : Boolean) is
        begin
            if Estado then
                status := Terminado;
            else
                status := Activo;
            end if;
        end Cambiar_Estado_Terminado;

    end Datos1;

end Datos_Protegidos;



