{Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee: marca, modelo y precio. La
lectura finaliza cuando se ingresa la marca "ZZZ" que no debe procesarse. La información se ingresa ordenada por marca. Se pide calcular e 
informar: 
    a. El precio promedio por marca. 
    b. Marca y modelo del auto más caro.}

program cinco;
const
    fin = 'ZZZ';
type
    str50 = string[50];
    auto = record
        marca: str50;
        modelo: str50;
        precio: real;
    end;

procedure leer(var a:auto);
begin
    readln(a.marca);
    if(a.marca <> fin) then
        begin  
            readln(a.modelo);
            readln(a.precio);
        end;
end;

function promedio(totalPrecio: real; totalAutos: integer): real;
begin  
    promedio:= totalPrecio/totalAutos;
end;

procedure maximo(a: auto; var maxMar, maxMod: str50; var max: real);
begin  
    if(a.precio >= max) then
        begin
            maxMar:= a.marca;
            maxMod:= a.modelo;
            max:= a.precio;
        end;
end;

procedure informar;
var
    a:auto;
    totalAutos: integer;
    totalPrecio, max: real;
    maxMod, maxMar, marcaActual: str50;
begin
    max:= -1;
    leer(a);
    while(a.marca <> fin) do
        begin
            totalAutos:= 0;
            totalPrecio:= 0;
            marcaActual:= a.marca;
            while(a.marca <> fin) and (a.marca = marcaActual) do 
                begin
                    totalAutos:= totalAutos + 1;
                    totalPrecio:= totalPrecio + a.precio;
                    maximo(a, maxMar, maxMod, max);
                    leer(a);
                end;
            writeln('El promedio es:', promedio(totalPrecio, totalAutos):0:2);
        end;
    writeln('El auto más caro es', maxMar, 'con el modelo', maxMod);
end;

begin
    informar();
end.