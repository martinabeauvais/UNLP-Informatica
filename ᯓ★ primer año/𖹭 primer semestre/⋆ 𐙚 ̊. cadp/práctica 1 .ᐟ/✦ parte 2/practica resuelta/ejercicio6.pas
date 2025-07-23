{Realizar un programa que lea información de 200 productos de un supermercado. De cada producto se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
    a. Los códigos de los dos productos más baratos.
    b. La cantidad de productos de más de 16 pesos con código par.}
    
program seis;
var
    codigo, cod1, cod2, i, cant: integer;
    precio, min1, min2,: real;
begin
    min1:= 9999;
    min2:= 9999;
    cod1:= 0;
    cod2:= 0;
    cant:=0;
    for i:= 1 to 200 do 
        begin
            writeln('Ingrese el código del producto');
            readln(codigo);
            writeln('Ingrese el precio del producto');
            readln(precio);
            if(precio < min1) then
                begin
                    min2:= min1;
                    cod2:= cod1;
                    min1:= precio;
                    cod1:= codigo;
                end
            else 
                begin
                    if(precio < min2) then 
                        begin
                            min2:= precio;
                            cod2:= codigo;
                        end;
                end;
                if((codigo MOD 2) = 0) then
                    cant:= cant + 1;
        end;
    writeln(cod1, cod2);
    writeln(cant);
end.