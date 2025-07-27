{Realice un programa que resuelva los siguientes incisos:
    a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza cuando se lee el nombre 'ZZZ', que no debe procesarse.
    b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
    c. Lea un nombre y lo inserte en la posición 4 del vector.
    d. Lea un nombre y lo agregue al vector.
Nota: Realizar todas las validaciones necesarias.}

program dos;
const
    dimF = 500;
type
    cad25 = string[25];
    vector = array[1..dimF] of cad25;
    
{Inciso a}
procedure cargarVector(var v: vector; var dimL: integer);
var
    nom: cad25;
begin
    readln(nom);
    while(dimL <= dimF) and (nom <> 'ZZZ') do begin
        dimL:= dimL + 1;
        v[dimL]:= nom;
        readln(nom);
    end;
end;

{Inciso b}
procedure eliminar(nom: cad25; var v: vector; var dimL: integer);
var 
    i, pos: integer;
begin
    pos:= 1;
    while(pos <= dimL) and (v[pos] <> nom) do
        pos:= pos + 1;
    if(v[pos] = nom) then begin
        for i:= pos to (dimL - 1) do
            v[i]:= v[i + 1];
        dimL:= dimL - 1;
    end;
end;

{Inciso c}
procedure insertar(nom: cad25; var v: vector; var dimL: integer);
var
    pos, i: integer;
begin
    pos:= 4;
    while(pos <= dimL) and ((dimL + 1) <= dimF) do begin
        for i:= pos downto dimL do 
            v[i + 1]:= v[i];
        v[pos]:= nom;
        dimL:= dimL + 1;
    end;
end;

{Inciso d}
procedure agregar(nom: cad25; var v: vector; var dimL: integer);
begin
    if((dimL + 1) <= dimF) then
        v[dimL + 1]:= nom;
    dimL:= dimL + 1;
end;

var 
    v: vector;
    nom: cad25;
    dimL: integer;
begin
    dimL:= 0;
    cargarVector(v, dimL);
    readln(nom);
    eliminar(nom, v, dimL);
    readln(nom);
    insertar(nom, v, dimL);
    readln(nom);
    agregar(nom, v, dimL);
end.