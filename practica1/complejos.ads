-- Definición del paquete Complejos. El nombre del paquete es comlejos no numeros_complejos ya que si no no compilaría
package Complejos is 
    type Complejo is private;
    I: constant Complejo;

    function "+"(X, Y: in Complejo) return Complejo;
    function "-"(X, Y: in Complejo) return Complejo;
    function "*"(X, Y: in Complejo) return Complejo;
    function "/"(X, Y: in Complejo) return Complejo;
    function Construir(R, I: in Float) return Complejo;
    function Parte_Real(X: in Complejo) return Float;
    function Parte_Imag(X: in Complejo) return Float;

private
    type Complejo is record
        Rl, Im: Float;
    end record;
    I: constant Complejo := (0.0, 1.0);
end Complejos;