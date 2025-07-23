{a. Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo. Al finalizar la lectura, el módulo debe imprimir en pantalla cuál fue el número par más alto.
b. Implemente un programa que invoque al módulo a.}

program seis;
function maxPar: integer;
var 
    num: integer;
begin
    maxPar:= -1;
    writeln('Ingrese un número');
    readln(num);
    if((num mod 2) = 0) then
        begin
            if(num >= maxPar) then maxPar:= num;
        end;
    writeln('Ingrese un número');
    readln(num);
    while(num > 0) do 
        begin
            if((num mod 2) = 0) then
                begin
                    if(num >= maxPar) then maxPar:= num;
                end;
            writeln('Ingrese un número');
            readln(num);
        end;
end;

var
    max: integer;
begin
    max:= maxPar;
    writeln(max);
end.