{Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día del mes, los montos de las ventas realizadas. La lectura de los montos para cada día finaliza cuando se lee el monto 0. Se asume un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto total acumulado en ventas de todo el mes.
    a. Modifique el ejercicio anterior para que además informe el día en el que se realizó la mayor cantidad de ventas.}

program ocho;
var
    monto, total: real;
    ventas, i, dia, ventasM: integer; {ventasM pertenece al inciso A}
begin
    dia:= -1;
    total:= 0;
    ventasM:= -9999 {Inciso a}
    for i:= 1 to 31 do 
        begin
            ventas:= 0;
            writeln('Ingrese el monto de la venta');
            readln(monto);
            while(monto <> 0) do 
                begin
                    ventas:= ventas + 1;
                    total:= total + monto;
                    writeln('Ingrese otro monto');
                    readln(monto);
                end;
            if(ventas >= ventasM) then 
                begin
                    ventasM:= ventas;
                    dia:= i; {Inciso a}
                end;
            writeln('En el día ', i, ' se hicieron un total de ', ventas, ' ventas.');
        end;
    writeln('Monto total del mes: ', total);
    writeln('Dia con mayores ventas: ', dia);  {Inciso a}