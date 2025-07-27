{El Grupo Intergubernamental de Expertos sobre el Cambio Climático de la ONU (IPCC) realiza todos los años mediciones de temperatura en 100 puntos diferentes del planeta y, para cada uno de estos lugares, obtiene un promedio anual. Este relevamientose viene realizando desde hace 50 años, y con todos los datos recolectados, el IPCC se encuentra en condiciones de realizar análisis estadísticos. Realizar un programa que lea y almacene los datos correspondientes a las mediciones de los últimos 50 años (la información se ingresa ordenada por año). Una vez finalizada la carga de la información, obtener:
    a. El año con mayor temperatura promedio a nivel mundial.
    b. El año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años.}

program trece;
const
    dimLugares = 100;
    dimYear = 50;
type
    vector = array[1..dimYear, 1..dimLugares] of real;
    vectorProm = array[1..dimYear] of real;

procedure cargarVector(var v:vector);
var
    i,j: integer;
begin
    for i:=1 to dimYear do begin
        for j:=1 to dimLugares do 
            read(v[i,j]);
    end;
end;

procedure calcularPromedio(v: vector; var prom: vectorProm);
var
    i, j: integer;
    suma: real;
begin
    for i:= 1 to dimYear do begin
        suma:= 0;
        for j:= 1 to dimLugares do
            suma:= suma + v[i,j];
        prom[i]:= suma/dimLugares;
    end;
end;

function mayorYear(v: vectorProm): integer;
var
    i, maxYear: integer;
    max: real;
begin
    max:= -9999;
    maxYear:= -1;
    for i:=1 to dimYear do 
    begin
        if (v[i] >= max) then 
        begin
            max:= v[i];
            maxYear:=i;
        end;
    end;
    mayorYear:= maxYear;
end;

function mayorTemp(v: vector): integer;
var
    i, j, maxYear: integer;
    max: real;
begin
    max:= -9999;
    maxYear:= -1;
    for i:= 1 to dimYear do begin
        for j:= 1 to dimLugares do begin
            if(v[i,j] >= max) then
            begin
                max:= v[i,j];
                maxYear:= i;
            end;
        end;
    end;
    mayorTemp:= maxYear;
end;

var
    v: vector;
    vProm: vectorProm;
    promYear, tempYear: integer;
begin
    cargarVector(v);
    calcularPromedio(v, vProm);
    promYear:= mayorYear(vProm);
    tempYear:= mayorTemp(v);
    writeln(promYear);
    writeln(tempYear);
end.