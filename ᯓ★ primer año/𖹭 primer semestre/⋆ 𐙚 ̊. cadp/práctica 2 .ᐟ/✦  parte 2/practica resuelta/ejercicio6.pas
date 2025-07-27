{Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada producto debe leer el precio, código y 
tipo (pantalón, remera, camisa, medias, campera, etc). Informar: 
    • Código de los productos más baratos.
    • Código del producto de tipo "pantalón" más caro.
    • Precio promedio.}

program seis;
procedure leerDatos(var precio: real; var codigo: integer; var tipo: string);
begin
    readln(precio);
    readln(codigo);
    readln(tipo);
end;

procedure minimos(precio: real; codigo: integer; var cod1, cod2: integer; var min1, min2: real);
begin
    if(precio <= min1) then begin
        min2:= min1;
        cod2:= cod1;
        min1:= precio;
        cod1:= codigo;
    end
    else begin
        if(precio <= min2) then begin
            min2:= precio;
            cod2:= codigo;
        end;
    end;
end;

procedure maximo(precio: real; codigo: integer; var codMax: integer; var max: real);
begin
    if(precio >= max) then begin
        max:= precio;
        codMax:= codigo;
    end;
end;

procedure leerProductos;
var 
    i, codigo, codMax, cod1, cod2: integer;
    max, min2, min1, precio, total: real;
    tipo: string;
begin
    cod1:=0; cod2:=0;
    max:=-1;
    min1, min2:= -99999;
    codMax:= 0;
    total:= 0;
    for i:=1 to 100 do begin
        leerDatos(precio, codigo, tipo);
        minimos(precio, codigo, cod1, cod2, min1, min2);
        if(tipo = 'pantalon') then
            maximo(precio, codigo, codMax, max);
        total:= total + precio;
    end;
    writeln(cod1, cod2);
    writeln(codMax);
    writeln(total/100);
end;

begin
    leerProductos();
end.