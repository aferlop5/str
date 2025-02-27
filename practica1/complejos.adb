-- implementamos el paquete Complejos
package body Complejos is
    function "+"(X, Y: in Complejo) return Complejo is
    begin
        return (X.Rl + Y.Rl, X.Im + Y.Im);
    end "+";

    function "-"(X, Y: in Complejo) return Complejo is
    begin
        return (X.Rl - Y.Rl, X.Im - Y.Im);
    end "-";

    function "*"(X, Y: in Complejo) return Complejo is
    begin
        return ((X.Rl * Y.Rl - X.Im * Y.Im), (X.Rl * Y.Im + X.Im * Y.Rl));
    end "*";

    function "/"(X, Y: in Complejo) return Complejo is
        Denom: Float := Y.Rl**2 + Y.Im**2;
    begin
        return ((X.Rl * Y.Rl + X.Im * Y.Im) / Denom, (X.Im * Y.Rl - X.Rl * Y.Im) / Denom);
    end "/";

    function Construir(R, I: in Float) return Complejo is -- constructor de complejo
    begin
        return (R, I);
    end Construir;

    function Parte_Real(X: in Complejo) return Float is -- getter de la parte real
    begin
        return X.Rl;
    end Parte_Real;

    function Parte_Imag(X: in Complejo) return Float is -- getter de la parte imaginaria
    begin
        return X.Im;
    end Parte_Imag;
end Complejos;
