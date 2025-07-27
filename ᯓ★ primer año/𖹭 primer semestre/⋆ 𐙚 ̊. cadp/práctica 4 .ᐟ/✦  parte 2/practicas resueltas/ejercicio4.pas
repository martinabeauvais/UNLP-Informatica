{Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de alumno, apellido y nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada por nro de alumno de manera ascendete. Se pide:
    a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El alumno seguro existe.
    b. Un módulo que reciba un alumno y lo inserte en el vector.
    c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.
    d. Un módulo que reciba un nro de alumno y elimine dicho alumno.
    e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
    
Nota: Realizar un programa principal que invoque los módulos desarrollados en los incisos previos con datos leídos de teclado.}

program cuatro; 
const
    dimF = 1000;
type 
    cad50 = string[50];
    alumno = record
        nro: integer;
        nom_y_ape: cad50;
        cant: integer;
    end;

    vector = array[1..dimF] of alumno;

procedure leerAlu( var a: alumno);
begin
    readln(a.nro);
    if(a.nro <> -1) then begin
        readln(a.nom_y_ape);
        readln(a. cant);
    end;
end;

procedure cargarVector(var v: vector; var dimL: integer);
var
    a: alumno;
begin
    leerAlu(a);
    while(dimL < dimF) and (a.nro <> -1) do begin
        dimL:= dimL + 1;
        v[dimL]:= a;
        leerAlu(a);
    end;
end;

{Inciso a}
function retornar(nro, dimL: integer; v: vector): integer;
var
    pos: integer;
begin
    pos:= 1;
    while(dimL < dimF) and (v[pos].nro < nro) do 
        pos:= pos + 1;
    if(v[pos].nro = nro) then 
        retornar:= pos; 
end;

{Inciso b}
procedure insertarAlu(var v: vector; var dimL: integer; a: alumno; pos: integer);
var
    i: integer;
begin
    if(dimL < dimF) and (pos <= dimL) then begin
        for i:= dimL downto pos do 
            v[i+1]:= v[i];
        v[pos]:= a;
        dimL:= dimL + 1;
    end;
end;

{Inciso c}
procedure eliminarAlu(var v:vector; var dimL: integer; pos: integer);
var
    i: integer;
begin
    if ((pos>= 1) and (pos <= diml) )then 
    begin
        for i:= pos to (dimL - 1) do 
            v[i]:= v[i+1];
        dimL:= dimL - 1;
    end;
end;

{Inciso d}
procedure eliminarNroAlu(var v: vector; var dimL: integer; nro: integer);
var
    pos: integer;
begin
    pos:= retornar(nro, dimL, v);
    if(pos <= dimL) then 
        eliminarAlu(v, dimL, pos);
end;

{Inciso e}
procedure eliminar0Asistencias(var v: vector; var dimL: integer);
var
    i: integer;
begin
    for i:= 1 to dimL do begin 
        if(v[i].cant = 0) then
            eliminarAlu(v, dimL, i);
    end;
end;

procedure recorrer(v: vector; dimL: integer);
var
    nro, pos: integer;
    a: alumno;
begin
    cargarVector(v, dimL);
    read(nro);
    retornar(nro, dimL, v);
    leerAlu(a);
    read(pos);
    insertarAlu(v, dimL, a, pos);
    read(pos);
    eliminarAlu(v, dimL, pos);
    read(nro);
    eliminarNroAlu(v, dimL, nro);
    eliminar0Asistencias(v, dimL);
end;

var
    v: vector;
    dimL: integer;
begin
    dimL:=0;
    recorrer(v, dimL);
end.