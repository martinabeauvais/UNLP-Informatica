{Realizar un programa que lea un número real e imprima su valor absoluto. El valor absoluto de un número X, se escribe |X| y se define como: 
    |X| = X, cuando X es mayor o igual a cero.
    |X| = -X, cuando X es menor a cero. }

program dos;
var 
    num: real;
begin
    writeln('Ingrese un número real');
    readln(num);
    if(num >= 0) then
        writeln('El valor absoluto es:', num)
    else
        writeln('El valor absoluto es:', num * -1);
end.