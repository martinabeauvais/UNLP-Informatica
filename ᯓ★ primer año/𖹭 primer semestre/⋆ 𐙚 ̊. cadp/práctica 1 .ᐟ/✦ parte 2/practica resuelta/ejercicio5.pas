{Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se ingrese el número 100, el cual debe procesarse. Informar en pantalla:
    a. El número máximo leído.
    b. El número minimo leído.
    c. La suma total de los números leídos.}

program cinco;
var
    num, max, min, total: integer;
begin
    total:= 0;
    min:= 9999;
    max:= -9999;
    repeat
        writeln('Ingrese un número');
        readln(num);
        total:= total + num;
        if(num < min) then
            min:= num
        else begin
            if(num > max) then
                max:= num;
        end;
    until (num = 100);
    writeln(max);
    writeln(min);
    writeln(total);
end.