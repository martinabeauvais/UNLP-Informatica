{Realizar un programa modularizaado que lea secuencia de números enteros. La lectura finaliza cuando llega el número 123456, el cual no debe
procesarse. Informar en pantalla para cada número la suma de sus dígitos pares y la cantidad de dígitos impares que posee.}

program ocho;
procedure leerNum(var num: integer);
begin
    readln(num);
end;

procedure parOImpar(num: integer; var suma, cant: integer);
var
    dig: integer;
begin   
    while(num <> 0 ) do begin
        dig:= num mod 10;
        if((dig mod 2) = 0) then
            suma:= suma + dig
        else
            cant:= cant + 1;
        num:= num div 10;
    end;
end;

procedure evaluar;
var
    suma, cant, num: integer;
begin
    leerNum(num);
    while(num <> 123456) do begin
        cant:= 0;
        suma:= 0; 
        parOImpar(num, suma, cant);
        writeln(suma);
        writeln(cant);
        leerNum(num);
    end;
end;

begin
    evaluar();
end.