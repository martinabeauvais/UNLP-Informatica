{Realizar un programa que lea un código, el precio actual y el nuevo precio de los productos de un almacén. La lectura finaliza al ingresar el producto con el código 32767, el cual debe procesarse. Para cada producto leído, el programa deberá indicar si el nuevo precio del producto supera en un 10% al precio anterior. 
    Por ejemplo:
        - Si se ingresa el código 10382, con precio actual 40 y el nuevo precio 44, deberá imprimir: "El aumento de precio del producto 10382 no supera el 10%".
        - Si se ingresa el código 32767, con precio actual 30 y nuevo precio 33.01, deberá imprimir: "El aumento de precio del producto 32767 es superior al 10%."}

program siete;
var
    codigo: integer;
    precioA, precioN: real;
begin
    writeln('Ingrese el código del producto');
    readln(codigo);
    while(codigo <> 32767) do 
        begin   
            writeln('Ingrese el precio actual');
            readln(precioA);
            writeln('Ingrese el nuevo precio');
            readln(precioN);
            if(precioN > precioA * 0.1) then
                writeln('El aumento de precio del producto ', codigo, ' supera el 10%.')
            else 
                writeln('El aumento de precio del prodcuto ', codigo, ' no supera el 10%.');
            writeln('Ingrese un nuevo código de producto');
        end;
    if(codigo = 32767) then
        begin
            writeln('Ingrese el precio actual');
            readln(precioA);
            writeln('Ingrese el nuevo precio');
            readln(precioN);
            if(precioN > precioA * 0.1) then
                writeln('El aumento de precio del producto ', codigo, ' supera el 10%.')
            else
                writeln('El aumento de precio del prodcuto ', codigo, ' no supera el 10%.');
        end;
end.