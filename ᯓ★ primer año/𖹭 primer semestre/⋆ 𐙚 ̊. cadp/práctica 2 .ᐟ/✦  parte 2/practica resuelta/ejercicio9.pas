{Realizar un programa modularizado que lea información de alumnos de una facultad. Para cada alumno se lee: número de inscripción, apellido
y nombre. La lectura finaliza cuando se ingresa el alumno con número de inscripción 1200, que debe procesarse. Se pide calcular e informar:
    • Apellido de los dos alumnos con número de inscripción más chico.
    • Nombre de los dos alumnos con número de inscripción más grande.
    • Porcentaje de alumnos con nro de inscripción par.}

program nueve;
procedure leerAlu(var numIns: integer; var nombre, apellido: string);
begin
    readln(numIns);
    readln(nombre);
    readln(apellido);
end;

procedure minimos(numIns: integer; apellido: string; var min1, min2: integer; var ap1, ap2: string);
begin
    if(numIns <= min1) then begin
        min2:= min1;
        ap2:= ap1;
        min1:= numIns;
        ap1:= apellido;
    end
    else begin
        if(numIns <= max2) then begin
            min2:= numIns;
            ap2:= apellido;
        end;
    end;
end; 

procedure maximos(numIns: integer; nombre: string; var max1, max2: integer; var nom1, nom2: string);
begin
    if(numIns >= max1) then begin
        max2:= max1;
        nom2:= nom1;
        max1:= numIns;
        nom1:= nombre;
    end
    else begin
        if(numIns >= max2) then begin
            max2:= numIns; 
            nom2:= nombre;
        end;
    end;
end; 

procedure nroPar(numIns: integer; var par: integer);
begin
    if((numIns mod 2)= 0 ) then
        par:= par + 1;
end;

procedure programa;
var
    par, nomIns, min1, min2, max1, max2, cant: integer;
    nombre, apellido, ap1, ap2, nom1, nom2: string;
begin
    min1, min2:= 9999;
    max1, max2:= -1;
    cant:= 0;
    par:= 0;
    repeat 
        cant:= cant + 1;
        leerAlu(numIns,  nombre, apellido);
        minimos(numIns, apellido, min1, min2, ap1, ap2);
        maximos(numIns, nombre, max1, max2, nom1, nom2);
        nroPar(numIns, par);
    until (numIns = 1200);
    writeln(ap1, ap2);
    writeln(nom1, nom2);
    writeln((par/cant) * 100);
end;

begin
    programa();
end.