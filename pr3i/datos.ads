
package datos is

      type Estado is (Activo, Parado, Terminado);
      vble_compartida : Integer := 0;
      Periodo1 : Integer := 70; -- Milisegundos
      Periodo2 : Integer := 100;
      Factor : Integer := 1;
      Status: Estado := Activo;
	 
	
end datos;
