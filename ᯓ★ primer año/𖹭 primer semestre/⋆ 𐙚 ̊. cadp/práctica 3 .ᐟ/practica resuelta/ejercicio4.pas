{Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300
clientes con planes de consumo ilimitados (clientes que pagan por lo que consumen).
Para cada cliente se conoce su código de cliente y cantidad de líneas a su nombre.
De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos y la 
cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos
de los clientes de la compañía e informe el monto total a facturar para cada uno. Para ello, 
se requiere:
    a. Realizar un módulo que lea la información de una línea de teléfono.
    b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas
    sus líneas (utilizando el módulo desarrollado en el inciso a) y retorne la cantidad total de minutos
    y la cantidad todal de MB a facturar del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido 
cuesta $1,35.}

program cuatro;
type
    cliente = record
        cod: integer;
        cantL: integer;
    end;
    linea = record
        numero: integer;
        minutos: integer;
        mb: integer;
    end;
    
function facturaTotal(minutos, mb: real): real;
begin
    facturaTotal:= (minutos * 3.40) + (mb * 1.35);
end;

procedure leerLinea (var l: linea);
begin
    writeln('Ingrese el numero de la linea:');
    readln(l.numero);
    writeln('Ingrese los minutos consumidos:');
    readln(l.minutos);
    writeln('Ingrese los MB consumidos:');
    readln(l.mb);
end;

procedure leerCliente(var c: cliente; var totalMin, totalMB: real);
var
    l: linea;
    i: integer;
    cantMin, cantMB: real;
begin
    totalMin:= 0;
    totalMB:= 0;
    cantMin:= 0;
    cantMB:= 0;
    writeln('Escriba el código del cliente:');
    readln(c.cod);
    writeln('Escriba la cantidad de lineas del cliente:', c.cod);
    read(c.cantL);
    for i:=1 to c.cantL do
        begin
            leerLinea(l);
            cantMin:= cantMin + l.minutos;
            cantMB:= cantMB + l.mb;
        end;
    totalMin:= cantMin;
    totalMB:= cantMB;
end;

procedure informar;
var
    i: integer;
    c: cliente;
    totalMin, totalMB: real;
begin
    for i:=1 to 2 do
        begin
            leerCliente(c, totalMin, totalMB);
            writeln('El cliente:', c.cod, 'Con un total de:', totalMin:0:2, 'minutos, y con un total de:', totalMB:0:2, 'de MB. Su total a pagar es:', facturaTotal(totalMin, totalMB):0:2);
        end;
end;

begin
    informar();
end.