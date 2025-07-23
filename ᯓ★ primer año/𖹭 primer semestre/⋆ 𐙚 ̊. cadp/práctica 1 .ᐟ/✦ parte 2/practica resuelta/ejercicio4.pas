{Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son los dos números minimos leídos. 
    a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer el número 0, el cual debe procesarse.
    b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer el número 0, el cual no debe procesarse.}

program cuatro;
var 
    num, min1, min2, i: integer;
begin
    min1:= 9999;
    min2:= 9999;
    for i:= 1 to 1000 do
        begin
            writeln('Ingrese un número');
            readln(num);
            if(num < min1) then 
                begin
                    min2:= min1;
                    min1:= num;
                end
            else 
                begin
                    if(num < min2) then
                        min2:= num;
                end;
        end;
    writeln(min1, min2);
end.

{Inciso a}
program cuatroA;
var 
    num, min1, min2: integer;
begin
    min1:= 9999;
    min2:= 9999;
    repeat
        writeln('Ingrese un número');
        readln(num);
        if(num < min1) then
            begin
                min2:= min1;
                min1:= num;
            end
        else
            begin
                if(num < min2) then 
                    min2:= num;
            end;
    until (num = 0);
    writeln(min1, min2);
end.


{Inciso b}
program cuatroB;
var
    num, min1, min2: integer;
begin
    min1:= 9999;
    min2:= 9999;
    writeln('Ingrese un número');
    readln(num);
    while(num <> 0) do 
        begin
            if(num < min1) then
                begin
                    min2:= min1;
                    min1:= num;
                end
            else
                begin 
                    if(num < min2) then
                        min2:= num;
                end;
        end;
    writeln(min1, min2);
end.