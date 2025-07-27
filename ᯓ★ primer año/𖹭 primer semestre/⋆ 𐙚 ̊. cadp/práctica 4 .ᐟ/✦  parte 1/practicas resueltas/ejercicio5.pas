{Utilizando los módulos implementados en el ejercicio 4, realizar un programa que lea números enteros desde teclado (a lo sumo
100) y los almacene en un vector. La carga finaliza al leer el número 0. Al finalizar la carga, se debe intercambiar la posición 
del mayor elemento por la del menor elemento, e informe la operación realizada de la siguiente manera: "El elemento máximo... que 
se encontraba en la posición... fue intercambiado con el elemento mínimo... que se encontraba en la posición..."}

program cinco;
const
    dimF = 100;
type
    vector = array[1..dimF] of integer;
    
procedure cargarVector(var v: vector; var dimL: integer);
var
    num: integer;
begin
    readln(num);
    while (dimL < dimF) or (num <> 0) do
        begin
            dimL:= dimL + 1;
            v[dimL]:= num;
            readln(num);
        end;
end;

procedure elementoMaximo(v: vector; dimL: integer; var posMax, max: integer);
var
    i: integer;    
begin
    max:= -1;
    for i:=1 to dimL do
        begin
            if(v[i] > max) then
                begin
                    posMax:= i;
                    max:= v[i];
                end;
        end;
end;

procedure elementoMinimo(v: vector; dimL: integer; var posMin, min: integer);
var
    i: integer;
begin
    min:= 101;
    for i:=1 to dimL do
        begin
            if(v[i] < min) then
                begin
                    posMin:= i;
                    min:= v[i];
                end;
        end;
end;

procedure intercambio(var v:vector; posMin, posMax, min, max: integer);
var
    aux: integer;
begin
    aux:= v[posMax];
    v[posMax]:= v[posMin];
    v[posMin]:= aux;
    
    writeln('El elemento máximo ', max, ' que se encontraba en la posicion ', posMax, ' fue intercambiado con el elemento mínimo ', 
        min, ' que se encontraba en la posición ', posMin);
end;

procedure imprimirVector(v: vector; dimL: integer);
var
    i: integer;
begin
    for i:=1 to dimL do
        writeln(v[i]);
end;

var
    v: vector;
    dimL, posMin, posMax, min, max: integer;
begin
    dimL:= 0;
    cargarVector(v, dimL);
    elementoMaximo(v, dimL, posMax, max);
    elementoMinimo(v, dimL, posMin, min);
    intercambio(v, posMin, posMax, min, max);
    imprimirVector(v, dimL);
end.