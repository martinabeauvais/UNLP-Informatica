{Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo sumo 300 empleados). La carga
finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se completa el vector. Una vez finalizada la carga de datos se 
pide:
    a. Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un módulo que reciba como 
parámetro un valor real X, el vector de valores reales y su dimensión lógica y retorne el mismo vector en el cual cada elemento fue
multiplicado por el valor X.
    b. Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa. }
            
            
program diez;
const
    dimF = 300;
type
    vector = array[1..300] of real;

procedure cargarVector(var v: vector; var dimL: integer);
var
    salario: real;
begin
    readln(salario);
    while(dimL < dimF) or (salario <> 0) do
        begin
            dimL:= dimL + 1;
            v[dimL]:= salario;
            readln(salario);
        end;
end;

procedure incrementar( x: real; var v: vector; dimL: integer);
var
    i: integer;
begin
    for i:=1 to dimL do
        v[i]:= v[i] * (v[i] * x);
end;

procedure imprimirSueldos(v: vector; dimL: integer);
var
    i: integer;
    total, promedio: real;
begin
    total:= 0;
    for i:=1 to dimL do
        total:= total + v[i];
    promedio:= total/dimL;
    writeln('El sueldo promedio es de: ', promedio);
end;

var
    v: vector;
    dimL: integer;
    x: real;
begin
    dimL:=0;
    x:= 1.15;
    cargarVector(v, dimL);
    incrementar(x, v, dimL);
    imprimirSueldos(v, dimL);
end.