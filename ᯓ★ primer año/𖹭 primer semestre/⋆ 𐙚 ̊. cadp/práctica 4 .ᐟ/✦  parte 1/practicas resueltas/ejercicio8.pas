{Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de Informática de la UNLP en el año 2020. De
cada alumno se lee: nro de inscripción, DNI, apellido, nombre y año de nacimiento. Una vez leída y almacenada toda la información, calcular e
informar: 
    a. El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
    b. Apellido y nombre de los dos alumnos de mayor edad.}

program ocho;
const
    dimF = 400;
type
    str50 = string[50];
    alumno = record
        nro: integer;
        dni: integer;
        apellido: str50;
        nombre: str50;
        anoNac: integer;
    end;

    vector = array[1..dimF] of alumno;

procedure leerAlumno(var a: alumno);
begin
    readln(a.nro);
    readln(a.dni);
    readln(a.apellido);
    readln(a.nombre);
    readln(a.anoNac);
end;

procedure cargarVector(var v: vector);
var 
    a: alumno;
    i: integer;
begin
    for i:=1 to dimF do
        begin
            leerAlumno(a);
            v[i]:= a;
        end;
end;

function descomponer(num: integer): boolean;
var
    dig: integer;
    ok: boolean;
begin
    ok:= true;
    while(num <> 0) and (ok) do
        begin
            dig:= num mod 10;
            if((dig mod 2) = 0) then 
                num:= num div 10
            else
                ok:= false;
        end;
    descomponer:= ok;
end;
procedure maximos(ape, nom: str50; edad: integer; var max1, max2: integer; var ape1, ape2, nom1, nom2: str50);
begin
    if(edad > max1) then
        begin
            ape2:= ape1;
            nom2:= nom1;
            max2:= max1;
            ape1:= ape;
            nom1:= nom;
            max1:= edad;
        end
    else
        begin
            if(edad > max2) then
                begin
                    ape2:= ape;
                    nom2:= nom;
                    max2:= edad;
                end;
        end;
end;

procedure informar(v: vector);
var
    edad, max1, max2, i, cant: integer;
    ape1, ape2, nom1, nom2: str50;
    porcentaje: real;
begin
    max1:= -1;
    max2:= -1;
    cant:= 0;
    cargarVector(v);
    for i:=1 to dimF do
        begin
            if(descomponer(v[i].dni)) then
                cant:= cant + 1;
            edad:= 2020 - v[i].anoNac;
            maximos(v[i].apellido, v[i].nombre, edad, max1, max2, ape1, ape2, nom1, nom2);
        end;
    porcentaje:= (cant/dimF)*100;
    writeln('El porcentaje de alumnos con DNI compuesto solo por dígitos pares es de: ', porcentaje:0:2);
    writeln('El apellido y nombre de los dos alumnos con mayor edad son: ', ape1, nom1, ' y ', ape2, nom2);
end;

var
    v: vector;
begin
    informar(v);
end.