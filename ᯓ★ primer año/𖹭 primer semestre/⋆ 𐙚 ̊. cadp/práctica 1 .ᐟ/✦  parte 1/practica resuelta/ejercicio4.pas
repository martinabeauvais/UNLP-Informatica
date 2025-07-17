{Realizar un programa que lea un número real X. Luego, deberá leer numeros reales hasta que se ingrese uno cuyo valor sea exactamente el doble de X (el primer numero leido).}

program cuatro;
var
    num, num2, doble: real;
begin
    writeln('Ingrese un numero real');
    readln(num);
    doble:= num * 2;
    writeln('Ingrese un nuevo numero');
    readln(num2);
    while(num2 <> doble) do
        begin
            writeln('Ingrese un nuevo numero');
            readln(num2);
        end;
end.