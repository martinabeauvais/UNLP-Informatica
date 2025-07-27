{Dado el siguiente programa:
    a. ¿Qué valores toma la variable numeros al finalizar el primer bloque for?
    b. Al terminar el programa, ¿con qué valores finaliza la variable números?
    c. Si se desea cambiar la línea 11 por la sentencia:
            for i:= 1 to 9 do
        ¿Cómo debe modificarse el código para que la variable números contenga los mismos valores que en 1.b?
    d. Qué valores están contenidos en la variable numeros si las líneas 11 y 12 se reemplazan por:
            for i:=1 to 9 do
                numeros[i+1]:= numeros[i];}

program sumador;
type
    vnums = array[1..10] of integer;
var
    numeros: vnums;
    i: integer;
begin
    for i:=1 to 10 do {Inciso a: Los valores que quedan son 1|2|3|4|5|6|7|8|9|10}
        begin
            numeros[i]:=i;
            writeln(numeros[i]);
        end;    
    
    for i:=2 to 10 do {Inciso b: Finaliza con 1|3|6|10|15|21|28|36|45|55}
        begin
            numeros[i]:= numeros[i] + numeros[i -1];
            writeln(numeros[i]);
        end;

    {Inciso c:}
    
    for i:=1 to 9 do
        begin
            numeros[i+1]:= numeros[i] + numeros[i+1];
            writeln(numeros[i+1]);
        end;
        
    {Inciso d: Los valores contenidos serán 1|1|1|1|1|1|1|1|1|1}
        for i:=1 to 9 do
            numeros[i+1]:= numeros[i];
end.