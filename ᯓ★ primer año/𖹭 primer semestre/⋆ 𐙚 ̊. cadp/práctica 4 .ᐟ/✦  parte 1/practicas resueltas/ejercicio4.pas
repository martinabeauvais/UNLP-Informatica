{Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
    a. posición: dado un número X y el vector de números, retorna la posición del número X en dicho
vector, o el valor -1 en caso de no encontrarse. 
    b. intercambio: recibe dos valores X e Y (entre 1 y 100) y el vector de números, y retorna el mismo 
vector donde se intercambiaron los valores de las posiciones X e Y. 
    c. sumaVector: retorna la suma de todos los elementos del vector.
    d. promedio: devuelve el valor promedio de los elementos del vector.
    e. elementoMaximo: retorna la posición del mayor elemento del vector. 
    f. elementoMinimo: retonar la posición del menor elemento del vector.
}

program cuatro;
const 
    dimF = 100;
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

function posicion(v: vector; dimL, n: integer): integer; {Inciso a}
var
    i: integer;
begin
    i:= 1;
    while(i <= dimL) and (v[i] <> n) do
        i:= i + 1;
    if(v[i] = n) then
        posicion:= i
    else
        posicion:=-1;
end;

procedure intercambio(var v: vector; dimL, x, y: integer); {Inciso b}
var
    aux, i: integer;
begin
    aux:= v[x];
    v[x]:= v[y];
    v[y]:= aux;
    for i:=1 to dimL do
        writeln(v[i]);
end;

function sumaVector(v: vector; dimL: integer): integer; {Inciso c}
var
    i, suma: integer;
begin
    suma:=0;
    for i:=1 to dimL do
        suma:= suma + v[i];
    sumaVector:= suma;
end;

function promedio(v: vector; dimL: integer): real; {Inciso d}
begin
    promedio:= sumaVector(v, dimL)/dimF;
end;

procedure elementoMaximo(v: vector; dimL: integer; var posMax, max: integer); {Inciso e}
var
    i: integer;
begin
    max:=-1;
    for i:=1 to dimL do
        begin
            if(v[i] > max) then
                begin
                    posMax:= i;
                    max:= v[i];
                end;
        end;
    writeln('La posicion con el valor maximo:', posMax);
end;

procedure elementoMinimo(v: vector; dimL: integer; var posMin, min: integer); {Inciso f}
var
    i: integer;
begin
    min:=101;
    for i:=1 to dimL do
        begin
            if(v[i] < min) then
                begin
                    posMin:= i;
                    min:= v[i];
                end;
        end;
    writeln('La posicion con el valor minimo:', posMin);
end;

var
    v: vector;
    dimL, n, x, y, posMax, posMin, min, max: integer;
begin
    dimL:= 0;
    cargarVector(v, dimL); 
    writeln('Ingresar un valor:'); 
    readln(n);
    writeln(posicion(v, dimL, n)); {a}
    writeln('Ingrese un valor para x:');
    readln(x);
    writeln('Ingrese un valor para y:');
    readln(y);
    intercambio(v, dimL, x, y);
    writeln('Suma total:', sumaVector(v, dimL));
    writeln('Promedio:', promedio(v,dimL));
    elementoMaximo(v, dimL, posMax, max);
    elementoMinimo(v, dimL, posMin, min);
end.