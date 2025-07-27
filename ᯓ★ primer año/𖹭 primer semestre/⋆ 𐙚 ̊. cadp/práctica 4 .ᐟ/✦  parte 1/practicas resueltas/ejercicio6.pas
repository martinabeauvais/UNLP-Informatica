{Dado que en la solución anterior se recorre dos veces el vector (una para calcular el elemento máximo y otra para el mínimo), 
implementar un único módulo que recorra una única vez el vector y devuelva ambas posiciones.}

program seis;
const
    dimF = 100;
type
    vector = array[1..dimF] of integer;
    
procedure cargarVector(var v: vector; var dimL: integer);
var
    num: integer;
begin
    readln(num);
    while(dimL < dimF) or (num <> 0) do
        begin
            dimL:= dimL + 1;
            v[dimL]:= num;
            readln(num);
        end;
end;

procedure recorrer(v: vector; dimL: integer; var min, max, minPos, maxPos: integer);
var
    i: integer;
begin
    for i:=1 to dimL do
        begin
            if(v[i] > max) then
                begin
                    maxPos:= i;
                    max:= v[i];
                end
            else begin
                if(v[i] < min) then
                    begin
                        minPos:= i;
                        min:= v[i];
                    end;
            end;
        end;
end;

procedure intercambio(var v: vector; min, max, posMin, posMax: integer);
var
    aux: integer;
begin
    aux:= v[posMin];
    v[posMin]:= v[posMax];
    v[posMax]:= aux;
    writeln('El elemento máximo ', max, ' que se encontraba en la posicion ', posMax, ' fue intercambiado con el elemento mínimo ', 
        min, ' que se encontraba en la posición ', posMin);
end;

var
    v: vector;
    dimL, min, max, posMin, posMax: integer;
begin
    dimL:=0;
    min:= 101;
    max:=-1;
    cargarVector(v, dimL);
    recorrer(v, dimL, min, max, posMin, posMax);
    intercambio(v, min, max, posMin, posMax);
end.