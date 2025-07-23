{Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
    a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5.}

program uno;
var
    num, total, i: integer;
    mayores: integer; //inciso a
    for i:= 1 to 10 do
        begin
            writeln('Ingrese un número');
            readln(num);
            total:= total + num;
            if(num > 5) then
                mayores:= mayores + 1;
        end;
    writeln('Total: ', total);
    writeln('Mayores a 5: ', mayores);
end.