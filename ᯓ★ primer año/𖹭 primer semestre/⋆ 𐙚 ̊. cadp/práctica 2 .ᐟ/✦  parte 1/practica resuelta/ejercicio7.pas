{Dado el siguiente programa:
    a. La función calcularPromedio calcula y retorna el promedio entre las variables globales suma y cant, pero parece incompleta, ¿qué debería agregarse para que funcione correctamente? 
    b. En el programa principal, la función calcularPromedio es invocada dos veces, pero esto podría mejorarse, ¿cómo debería modificarse el programa principal para invocar a dicha función una única vez?
    c. Si se leen por teclado los valores 48 (variable suma) y 6 (variable cant), ¿qué resultado imprime el programa? Considere las tres posibilidades:
        I. El programa principal. 
            RESPUESTA: 8
        II. El programa luego de realizar la modificación del inciso a.
            RESPUESTA: 800
        III. El programa luego de realizar las modificaciones de los incisos a y b.
            RESPUESTA: 0}

program alcanceYFunciones;
var
    suma, cant: integer;
    prom: real; //Inciso b
function calcularPromedio: real;
var 
    prom: real;
begin
    prom:= 0; //Inciso a
    if(cant = 0) then prom:= -1
    else 
        prom:= suma * 100/cant; //Inciso a (*100)
    calcularPromedio:= prom;
end;

begin
    writeln('Ingrese un número');
    readln(suma);
    writeln('Ingrese un número');
    readln(cant);
    prom:= calcularPromedio; //Inciso a
    if(calcularPromedio <> -1) then // se reemplaza 'calcularPromedio' con prom
        begin
            cant:= 0;
            writeln('El promedio es ', calcularPromedio); //se reemplaza 'calcularPromedio' con prom
        end
    else
        writeln('Dividir por cero no parece ser buena idea');
end.