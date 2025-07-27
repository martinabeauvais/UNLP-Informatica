{Se dispone de un vector con números enteros, de dimensión física dimF y dimensiónlógica dimL.
    a. Realizar un módulo que imprima el vector desde la primera posición hasta la última.
    b. Realizar un módulo que imprima el vector desde la última hasta la primera.
    c. Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y 
desde la mitad más uno hacia la última posición.
    d. Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la posición X 
hasta la Y. Asuma que tanto X como Y son menores o iguales a la dimensiónlógica. Y considere que, dependiendo de los
valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.
    e. Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c.
}

program tres;
const
    dimF = 10;
type
    vector = array[1..dimF] of integer;
    
procedure cargarVector(var v: vector; var dimL: integer);
var
    i, num: integer;
begin
    for i:=1 to dimF do
        begin
            readln(num);
            v[i]:= num;
            dimL:= dimL + 1;
        end;
end;

procedure imprimirD(v: vector; dimL: integer);
var
    i: integer;
begin
    for i:=1 to dimL do
        writeln(v[i]);
end;

procedure imprimirA(v: vector; dimL: integer);
var
    i: integer;
begin
    for i:=dimL downto 1 do 
        writeln(v[i]);
end;

procedure leerMedio(v: vector; dimL: integer);
var
    mitad, i: integer;
begin
    mitad:= dimL DIV 2;
    for i:=mitad downto 1 do 
        writeln(v[i]);
    for i:=mitad+1 to dimL do
        writeln(v[i]);
end;

procedure vectorXY(v: vector; dimL, x, y: integer); 
var
    i: integer;
begin
    if(x > y) then
        begin
            for i:=x downto y do {x es más grande que y; va en descendente}
                writeln(v[i]);
        end
    else
        begin
            for i:=x to y do {x más chico que y; va en ascendente}
                writeln(v[i]);
        end;
end;

var
    v: vector;
    dimL, x, y: integer;
begin
    dimL:=0;
    cargarVector(v, dimL);
    writeln('dimL:', dimL);
    imprimirD(v, dimL);
    imprimirA(v, dimL);
    writeln('Ingrese el valor de x:');
    readln(x);
    writeln('Ingrese el valor de y:');
    readln(y);
    vectorXY(v, dimL, x, y);
end.