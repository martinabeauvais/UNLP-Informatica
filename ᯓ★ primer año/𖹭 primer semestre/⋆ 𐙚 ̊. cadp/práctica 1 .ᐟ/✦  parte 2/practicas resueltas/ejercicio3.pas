{Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera Analista en TIC. De cada alumno le lee nombre y nota obtenida en el módulo EPA (la nota es un número entre 1 y 10). La lectura finaliza cuando se lee el nombre "Zidane Zinedine", que debe procesarse. Al finalizar la lectura informar: 
    a. La cantidad de alumnos aprobados (nota 8 o mayor).
    b. La cantidad de alumnos que obtuvieron un 7 como nota.}

program tres; 
var
    nombre: string;
    nota, aprobados, sieteN: integer;
begin
    aprobados:= 0;
    sieteN:= 0;
    repeat
        writeln('Ingrese el nombre del alumno');
        readln(nombre);
        writeln('Ingrese la nota del alumno');
        readln(nota);
        if(nota >= 8) then
            aprobados:= aprobados + 1
        else
        begin
            if(nota = 7) then
                sieteN:= sieteN + 1;
        end;
    until (nombre = "Zidane Zinedine");
    writeln('Alumnos aprobados: ', aprobados);
    writeln('Alumnos con siete: ', sieteN);
end.