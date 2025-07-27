{Realizar un programa que lea un caracter, que puede ser "+" (suma) o "-" (resta); si se ingresa otro caracter, debe informar un error y finalizar. Una vez leído el caracter de suma o resta, deberá leerse una secuencia de numeros enteros que finaliza con 0. El programa deberá aplicar la operación leída con la secuencia de números, e imprimir el resultado final.
    Por ejemplo:
        - Si se lee el caracter "-" y la secuencia 4  3  5  -6  0, deberá imprimir: "2  (4 - 3 - 5 - (-6)).
        - Si se lee el caracter "+" y la secuencia -10  5  6 -1  0, deberá imprimir: "0 (-10 + 5 + 6 + (-1)).}

program nueve;
var
    operacion: char;
    num, resultado: integer;
begin
    resultado:= 0;
    writeln('Ingrese la operación a utilizar (+) o (-)');
    readln(operacion);
    if(operacion = '+') or (operacion = '-') then 
        begin   
            if(operacion = '+') then  
                begin
                    writeln('Ingrese un número');
                    readln(num);
                    while(num <> 0) do 
                        begin
                            resultado:= resultado + num;
                            writeln('Ingrese un nuevo número');
                            readln(num);
                        end;
                end
            else begin
                writeln('Ingrese un número');
                readln(num);
                while(num <> 0) do
                    begin
                        resultado:= resultado - num;
                        writeln('Ingrese un nuevo número');
                        readln(num);
                    end;
            end;
        writeln('El resultado total es: ', resultado);
    end
    else
        writeln('El caracter ingresado no es válido');
end.