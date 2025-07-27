{Modifique el ejercicio anterior para que, luego de leer el numero X, se lean a lo sumo 10 numeros reales. La lectura debera finalizar al ingresar un valor que sea el doble de X, o al leer un decimo numero, en cuyo caso debera informarse: "No se ha ingresado el doble de X."}

program cinco;
var
    num, num2, doble: real;
    cant: integer;
begin
    cant:=0;
    writeln('Ingrese un numero');
    readln(num);
    doble:= num * 2;
    writeln('Ingrese otro numero');
    readln(num2);
    while(num2 <> doble) and (cant <= 10) do 
        begin
            cant:= cant + 1;
            writeln('Ingrese otro numero');
            readln(num2);
        end;
    if(cant > 10) and (num2 <> doble) then  
        writeln('No se ha ingresado el doble de X');
end.