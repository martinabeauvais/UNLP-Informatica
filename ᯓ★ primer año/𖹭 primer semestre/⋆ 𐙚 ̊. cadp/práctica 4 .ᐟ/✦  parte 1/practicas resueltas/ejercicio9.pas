{Modificar la solución del punto anterior considerando que el programa lea y almacene la información de a lo sumo 400 alumnos. la
lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse)}

program nueve;
const
    dimF = 400;
type
    str50 = string[50];
    alumno = record
        nro: str50;
        dni: integer;
        apellido: str50;
        nombre: str50;
        anoNac: integer;
    end;
    
    vector = array[1..dimF] of alumno;
    
procedure leerAlumno(var a: alumno);
begin
    readln(a.dni);
    if(a.dni <> -1) then
        begin
            readln(a.nro);
            readln(a.apellido);
            readln(a.nombre);
            readln(a.anoNac);
        end;
end;

procedure cargarVector(var v: vector; var dimL: integer);
var
    a: alumno;
begin
    leerAlumno(a);
    while(dimL < dimF) and (a.dni <> -1) do
        begin
            dimL:= dimL + 1;
            v[dimL]:= a;
            leerAlumno(a);
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

procedure informar(v: vector; dimL: integer);
var
    i, cant, edad, max1, max2: integer;
    ape1, ape2, nom1, nom2: str50;
    porcentaje: real;
begin
    dimL:= 0;
    max1:= -1;
    max2:= -2;
    cant:= 0;
    cargarVector(v, dimL);
    for i:=1 to dimL do
        begin
            if(descomponer(v[i].dni)) then
                cant:= cant + 1;
            edad:= 2020 - v[i].anoNac;
            maximos(v[i].apellido, v[i].nombre, edad, max1, max2, ape1, ape2, nom1, nom2);
        end;
    porcentaje:= (cant/dimL)*100;
    writeln('El porcentaje de alumnos con DNI compuesto sólo por dígitos pares es: ', porcentaje:0:2);
    writeln('El apellido y nombre de los dos alumnos de mayor edad son: ', ape1, nom1, ' y ', ape2, nom2);
end;

var
    v: vector;
    dimL: integer;
begin
    informar(v, dimL);
end.