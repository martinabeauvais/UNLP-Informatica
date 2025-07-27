{   a. Realizar un módulo que reciba como parámetro un número entero y retorne la cantidad de dígitos que posee y la suma de los mismos.
    b. Utilizando el módulo anterior, realizar un programa que lea una secuencia de números e imprima la cantidad total de dígitos leídos. La
lectura finaliza al leer un número cuyo dígitos suman exactamente 10, el cual debe procesarse}

program siete; 
procedure digitos(num: integer; var cantDig, suma: integer);
var 
    dig: integer;
begin
    while(num <> 0 ) do begin
        cantDig:= cantDig + 1;
        dig:= num mod 10;
        suma:= suma + dig;
        num:= num div 10;
    end;
end;

var 
    num, suma, cantDig, total: integer;
begin  
    total:= 0;
    repeat
        cantDig:= 0;
        suma:= 0;
        readln(num);
        digitos(num, cantDig, suma);
        total:= total + cantDig;
    until (suma = 10);
    writeln(total);
end.