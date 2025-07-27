{   a. Dado un vector de enteros de a lo sumo 500 valores, realice un módulo 
que reciba dicho vector y un valor n y retorne si se encuentra n
en el vector o no.
    b. Modifique el módulo del inciso a. considerando ahora que el vector se
encuentra ordenado de manera ascendente.}

program uno;
const
    dimF = 5;
type
    vector = array[1..dimF] of integer;
    
procedure cargarVector(var v: vector; var dimL: integer);
var
    i, num: integer;
begin
    for i:=1 to dimF do
        begin
            dimL:= dimL + 1;
            writeln('Ingrese un número para el vector');
            readln(num);
            v[i]:= num;
        end;
end;

procedure cargarVectorOrdenado(var v: vector; var dimL: integer);
var
    i, num: integer;
begin
    for i:=1 to dimF do
        begin
            dimL:= dimL + 1; 
            writeln('Ingrese un número para el verctor de forma ordenada');
            readln(num);
            v[i]:= num;
        end;    
end;

function encontro(v: vector; dimL, num: integer): boolean;
var
    pos: integer;
begin
    pos:= 1;
    encontro:= false;
    while (pos < dimL) and (encontro = false) do 
        begin
            if(v[pos] = num) then
                encontro:= true
            else
                pos:= pos + 1;
        end;
end;

function encontroMejorado(v: vector; dimL, num: integer): boolean;
var
    pos: integer;
begin
    pos:= 1;
    encontro:= false;
    while (pos <= dimL) and (encontro = false) do 
        begin
            if(v[pos] = num) then
                encontro:= true
            else
                pos:= pos + 1;
        end;
end;


var
    dimL, num: integer;
    v: vector;
begin
    dimL:= 0;
    cargarVector(v, dimL);
    cargarVectorOrdenado(v, dimL)
    writeln('Inserte numero a encontrar');
    readln(num);
    writeln('El numero ', encontro(v, dimL, num));
    writeln('El numero ', encontroMejorado(v, dimL, num));
end.