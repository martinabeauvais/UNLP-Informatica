{Realizar un programa que lea 2 números enteros desde teclado e informe en pantalla cuál de los dos números es el mayor. Si son iguales debe informar en pantalla lo siguiente: "Los números leídos son iguales."}

program uno;
var
    num1, num2: integer;
begin
    writeln('Ingrese un número entero');
    readln(num1);
    writeln('Ingrese otro número entero');
    readln(num2);
    if(num1 > num2) then
        writeln('El número más grande es:', num1)
    else begin
        if(num2 > num1) then
            writeln('El número más grande es:', num2)
        else
            if (num1 = num2) then
                writeln('Los números leídos son iguales.');
    end;
end.