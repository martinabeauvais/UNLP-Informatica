{Dado el siguiente programa, complete las líneas indicadas, considerando que:
    a. El módulo cargarVector debe leer números reales y almacenarlos en el vector que se pasa como parámetro. 
Al finaliar, debe retornar el vector y su dimensión lógica. La lectura finaliza cuando se ingresa el valor
0 (que no debe procesarse) o cuando el vector está completo.
    b. El módulo modificarVectorySumar debe devolver el vector con todos sus elementos incrementados con el valor
n y también debe devolver la suma de todos los elementos del vector.
}

program cinco;
const
    cantDatos = 3;
type
    vdatos = array[1..cantDatos] of real;

procedure cargarVector(var v:vdatos; var dimL: integer);
var
    i: integer;
    num: real;
begin
    for i:=1 to cantDatos do 
        begin
            readln(num);
            v[i]:= num;
            dimL:= dimL + 1;
        end;
end;

procedure modificarVectorySumar(var v:vdatos; dimL: integer; n: real; var suma: real);
var
    i: integer;
    copy: real;
begin
    for i:=1 to dimL do
        begin
            v[i]:= v[i] + n;
            suma:= suma + v[i];
        end;
end;

var
    datos: vdatos;
    i, dim: integer;
    suma, num: real;
begin
    dim:=0;
    suma:= 0;
    cargarVector(datos,dim);
    writeln('Ingrese un valor a sumar:');
    readln(num);
    modificarVectorySumar(datos, dim, num, suma);
    writeln('La suma de los valores es:0', suma:0:2);
    writeln('Se procesaron:', dim, 'números');
end.