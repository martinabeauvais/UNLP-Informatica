{La empresa Amazon Web Services (AWS) dispone de la información de sus 500 clientes monotributistas más grandes del país. De cada cliente conoce la fecha de firma del contrato con AWS, la categoría del monotributo (entre la A y la F), el código de la ciudad donde se encuentran las oficinales (entre 1 y 2400) y el monto mensual acordado en el contrato. La información se ingresa ordenada por fecha de firma de contrato (los más antiguos primero, los más recientes últimos). 
    Realizar un programa que lea y almacene la información de los clientes en una estructura de tipo vector. Una vez almacenados los datos, procesar dicha estructura para obtener:
        a. Cantidad de contratos por cada mes y cada año, y año en que se firmó la mayor cantidad de contratos.
        b. Cantidad de clientes para cada categoría de monotributo.
        c. Código de las 10 ciudades con mayor cantidad de clientes.
        d. Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes.}

program cinco;
const
    dimF = 500;
    dimC = 2400;
    meses = 12;
type
    rangoCategoria = 'A'..'F';
    rangoClientes = 1..dimF;
    codCiudad = 1..dimC;
    rangoMeses = 1..meses;

    fecha = record
        mes: rangoMeses;
        anio: integer;
    end;

    cliente = record
        fechaC: fecha;
        categoria: rangoCategoria;
        codigo: codCiudad;
        monto: real;
    end;

    ciudad = record
        cod: rangoClientes;
        monotributistas: rangoClientes; 
    end;
    
    anual = record
        contrato: integer;
        cantidad: rangoClientes;
    end;

    vector = array[1..dimF] of cliente;
    vectorCliMes = array[rangoMeses] of rangoClientes;
    vectorCateClientes = array[rangoCategoria] of rangoClientes;
    vectorCantCliCiudad = array[codCiudad] of codCiudad;
    vectorCiudadMaxCli = array[1..10] of ciudad;

procedure leerFecha(var f: fecha);
begin
    readln(f.mes);
    readln(f.anio);
end;

procedure leerCliente(var c: cliente);
var
    f: fecha;9
begin
    leerFecha(f);
    readln(c.categoria);
    readln(c.codigo);
    readln(c.monto);
end;

procedure cargarClientes(var v: vector);
var
    i: integer;
begin
    for i:=1 to dimF do 
        leerCliente(v[i]);
end;

procedure inicializarCliMes(var v: vectorCliMes);
var
    i: integer;
begin
    for i:= 1 to dimF do
        v[i]:= 0;
end;

procedure inicializarCateClientes(var v: vectorCateClientes);
var
    i: rangoCategoria;
begin
    for i:='A' to 'F' do
        v[i]:= 0;
end;

procedure inicializarCantCliCiudad(var v: vectorCantCliCiudad);
var
    i: codCiudad;
begin
    for i:=1 to dimC do
        v[i]:= 0;
end;

{Inciso a}
procedure contrato(v: vector);
var
    anioActual: integer;
    cantClientes: vectorCliMes;
    maxContrato: anual;
    cantCliAnio: rangoClientes;
    continuar: boolean;
    pos: integer;
begin
    maxContrato.cantidad:= -1;
    pos:= 1;
    continuar:= false;
    while(continuar = false) do begin
        inicializarCliMes(cantClientes);
        cantCliAnio:= 0;
        anioActual:= v[pos].fechaC.anio;
        while(continuar = false) and (anioActual = v[pos].fechaC.anio) do begin
            cantClientes[v[pos].fechaC.mes]:= cantClientes[v[pos].fechaC.mes] + 1;
            cantCliAnio:= cantCliAnio + 1;
            pos:= pos + 1;
            if(pos > dimF) then continuar = true;
        end;

        if(cantCliAnio > maxContrato.cantidad) then begin
            maxContrato.cantidad:= cantCliAnio;
            maxContrato.contrato:= anioActual;
        end;
        writeln(anioActual);
        //informar
        writeln(anioActual, cantCliAnio);
    end;

    writeln(maxContrato.contrato, maxContrato.cantidad)
end;

{Inciso b}
procedure categoria(v: vector; var clicategoria: vectorCateClientes);
var
    i: rangoClientes;
begin
    inicializarCateClientes(clicategoria);
    for i:= 1 to dimF do
        clicategoria[v[i].categoria]:= clicategoria[v[i].categoria] + 1;
end;

{Inciso c}
procedure ciudades(v: vector; var maxCliCiudad: vectorCiudadMaxCli);
var
    i: rangoClientes;
    posCiudad: codCiudad;
    posMax, posCorrer: integer;
    posCiudadCondicion: boolean;
    cliCiudad: vectorCantCliCiudad;
begin
    inicializarCantCliCiudad(cliCiudad);
    for i:=1 to dimC do
        cliCiudad[v[i].codigo]:= cliCiudad[v[i].codigo] + 1;
    for posMax:=1 to 10 do
        maxCliCiudad[posMax].monotributistas:= -1;
    maxCliCiudad[1].cod:=0;

    for posCiudad:=1 to dimC do begin
        posMax:=1;
        posCiudadCondicion:= true;
        if(cliCiudad[posCiudad] <> 0) then begin
            while((posMax <= 10) and (posCiudadCondicion)) do begin
                if(cliCiudad[posCiudad] > maxCliCiudad[posMax].monotributistas) then begin
                    if(posMax < 10) then 
                        for posCorrer:= (10 - 1) downto posMax do 
                            maxCliCiudad[posCorrer + 1]:= maxCliCiudad[posCorrer];
                    maxCliCiudad[posMax].cod:= posCiudad;
                    maxCliCiudad[posMax].monotributistas:= cliCiudad[posCiudad];
                    posCiudadCondicion:= false;
                end
                else posMax:= posMax + 1;
            end;
        end;
    end;
end;

{Inciso d}
function montoMayor(v: vector): integer;
var
    cont, i: rangoClientes;
    monto, promedio: real;
begin
    cont:= 0;
    monto:= 0;
    for i:=1 to dimF do 
        monto:= monto + v[i].monto;
    promedio:= monto/dimC;
    for i:=1 to dimF do begin
        if(v[i].monto > promedio) then
            cont:= cont + 1;
    end;

    montoMayor:= cont;
end;

var 
    v: vector;
    maxCiuClie: vectorCiudadMaxCli;
    cliCate: vectorCateClientes;
begin
    cargarClientes(v);
    contrato(v);
    categoria(v, cliCate);
    ciudades(v, maxCiuClie);
    writeln(montoMayor(v));
end.