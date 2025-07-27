{El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As., con el objetivo de 
evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para año 2015 (1 docente cada 23.435 alumnos). Para ello,
se cuenta con información de: CUE (código único de establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, 
localidad. Se pide implementar un programa que procese la información y determine:
    • Cantidad de escuelas de La Plata con una relación de alumnos por docentes superior a la sugerida por UNESCO.
    • CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
El programa debe utilizar: 
    a. Un módulo para la lectura de la información de la escuela.
    b. Un módulo para determinar la relación entre docente-alumno (esa relación se obtiene del cociente entre la cantidad de alumnos y la 
cantidad de docentes).}

program tres;
type
    str50 = string[50];
    primaria = record
        cue: integer;
        nombre: str50;
        cantDoc: integer;
        cantAlu: integer;
        localidad: str50;
    end;

procedure leer(var p: primaria);
begin
    readln(p.cue);
    readln(p.nombre);
    readln(p.cantDoc);
    readln(p.cantAlu);
    readln(p.localidad);
end;

function relacionDA (cantAlu, cantDoc: integer): real;
begin
    relacionDA:= cantAlu/ cantDoc;
end;

procedure maximos(relaDA: real; cue: integer; nombre: str50; var max1, max2: real; var cueMax1, cueMax2: integer; var nomMax1, nomMax2: str50);
begin 
    if(relaDA >= max1) then
        begin
            max2:= max1;
            max1:= relaDA;
            cueMax2:= cueMax1;
            cueMax1:= cue;
            nomMax2:= nomMax1;
            nomMax1:= nombre;
        end
    else
    begin
        if(relaDA >= max2) then
            begin
                max2:= relaDA;
                cueMax2:= cue;
                nomMax2:= nombre;
            end;
    end;
end;

procedure relevamiento;
var
    p: primaria;
    cueMax1, cueMax2, escLP, i: integer;
    max1, max2, relaDA: real;
    nomMax1, nomMax2: str50;
begin
    max1:= -1;
    max2:= -2;
    escLP:= 0;
    for i:=1 to 2400 do
        begin
            leer(p);
            relaDA:= relacionDA(p.cantAlu, p.cantDoc);
            if(p.localidad = 'La Plata') and (relaDA > 23435) then
                escLP:= escLP + 1; 
            maximos(relaDA, cue, nombre, max1, max2, cueMax1, cueMax2, nomMax1, nomMax2);
        end;
    writeln(escLP);
    writeln(cueMax1, nomMax1, cueMax2, nomMax2);
end;

begin
    relevamiento();
end.