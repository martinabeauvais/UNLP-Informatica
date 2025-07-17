{Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse. Por ejemplo: se lee la siguiente secuencia:
        33423
        840
        19003
        642
        -1
    En el ejemplo anterior, se leyó el legajo 33422, cuyo promedio fue 8.40, luego se leyó el legajo 19003, cuyo promedio fue 6.43, y finalmente el legajo -1 (para el cual no es necesario leer un promedio).
    Al finalizar la lectura, informar:
        a) La cantidad de alumnos leídos.
        b) La cantidad de alumnos cuyo promedio supera 6.5.
        c) El porcentaje de alumnos destacadaos (alumnos con promedio mayor a 8.5) cuyo legajo sea menor al valor 2500.}

program seis;
var
    legajo, cantAlu, cantProm, cantLegajo, cantDes: integer;
    promedio: real;
begin
    cantAlu:=0;
    cantProm:=0;
    cantDes:=0;
    writeln('Ingrese un legajo');
    readln(legajo);
    while(legajo <> -1) do 
        begin
            cantAlu:= cantAlu + 1;
            writeln('Ingrese el promedio del alumno');
            readln(promedio);
            if(promedio > 8.5) and (legajo < 2500) then
                cantDes:= cantDes + 1;
            if(promedio > 6.5) then
                cantProm:= cantProm + 1;
            writeln('Ingrese un nuevo legajo');
            readln(legajo);
        end;
    writeln('Alumnos leídos: ', cantAlu);
    writeln('Alumnos con promedio mayor a 6.5: ', cantProm);
    writeln('Alumnos destacados: ', cantDes*100/cantAlu);
end.