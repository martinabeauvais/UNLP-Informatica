{Realizar un programa que lea 10 números e informe cuál fue el mayor número leído. Por ejemplo: si se lee la secuencia: "3  5  6  2  3  10  98  8  -12  9", deberá informar: "El mayor número leído fue el 98."
    a. Modifique el programa anterior para que, además de informar el mayor número leído, se informe el número de orden, dentro de la secuencia, en el que fue leído. Por ejemplo: si se lee la secuencia: "3  5  6  2  3  10  98  8  -12  9", deberá informar: "El mayor número leído fue el 98, en la posición 7.}

program dos;
var
    num, mayor, i: integer;
    posicion: integer; //inciso a
begin
    posicion:= 0;
    mayor:= 0;
    for i:= 1 to 10 do
        begin
            writeln('Ingresar un número');
            readln(num);
            if(num > mayor) then 
                begin
                    mayor:= num;
                    posicion:= i;
                end;
        end;
    writeln('El mayor número leído fue el ', mayor);
    writeln('El mayor número leído fue el ', mayor, ' , en la posición ', posicion);
end.