{En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4. irregular), su masa (medida en kg) y la distancia en 
pársecs (pc) medida dede la Tierra. La Unión Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el Grupo Local. Realizar un 
programa que lea y almacene estos datos y, una vez finalizada la carga, informe: 
    a. La cantidad de galaxias de cada tipo. 
    b. La masa total acumulada de las 3 galaxias principales (la Via Láctea, Andrómeda y Triángulo) y el porcentaje que esto representa respecto a la masa de todas las 
galaxias. 
    c. La cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
    d. El nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.  PP WRITE}

program doce;
const
    dimF = 53;
type
    str50 = string[50];
    
    tipoG = 1..4;
    
    galaxia = record
        nombre: str50;
        tipo: tipoG;
        masa: real;
        pc: real;
    end;
    
    vector = array[1..dimF] of galaxia;
    vectorTipo = array[tipoG] of integer;

procedure leerGalaxia(var g: galaxia);
begin
    readln(g.nombre);
    readln(g.tipo);
    readln(g.masa);
    readln(g.pc);
end;

procedure inicializar(var v: vectorTipo);
var
    i: tipoG;
begin
    for i:=1 to 4 do
        v[i]:= 0;
end;

procedure cargarVector(var v: vector);
var
    i: integer;
    g: galaxia;
begin
    for i:=1 to dimF do
        begin
            leerGalaxia(g);
            v[i]:= g;
        end;
end;

procedure maximos(nom: str50; masa: real; var max1, max2: real; var nomMax1, nomMax2: str50); {Inciso d}
begin
    if(masa > max1)then
        begin
            max2:= max1;
            nomMax2:= nomMax1;
            max1:= masa;
            nomMax1:=nom;
        end
    else begin
        if(masa > max2) then
            begin
                max2:= masa;
                nomMax2:= nom;
            end;
    end;
end;

procedure minimos(nom: str50; masa: real; var min1, min2: real; var nomMin1, nomMin2: str50); {Inciso d}
begin
    if(masa < min1) then
        begin
            min2:= min1;
            nomMin2:= nomMin1;
            min1:= masa;
            nomMin1:= nom;
        end
    else begin
        if(masa < min2) then
            begin
                min2:= masa;
                nomMin2:= nom;
            end;
    end;
end;

procedure tipoGalaxia(v: vectorTipo; var tipoGa: tipoG);
begin
    v[tipoGa]:=v[tipoGa] + 1;
end;

function cumple(nom: str50): boolean;
begin
    cumple:= (nom = 'Via Láctea') or (nom = 'Andrómeda') or (nom = 'Triángulo');
end;

function cumpleDistancia(tipo: tipoG; distancia: real): boolean;
begin
    cumpleDistancia:= (tipo = 4) and (distancia <1000);
end;

procedure recorrer(v: vector; v2: vectorTipo);
var
    tipo: tipoG;
    max1, max2, min1, min2, porcentaje, masaTres, masaTotal, dist: real;
    i, cantIrregulares: integer;
    nomMin1, nomMin2, nomMax1, nomMax2, nombre: str50;
begin
    max1:= -1;
    max2:= -1;
    min1:= 99999;
    min2:= 99999;
    cantIrregulares:= 0;
    masaTres:= 0;
    masaTotal:= 0;
    cargarVector(v);
    inicializar(v2);
    for i:=1 to dimF do
        begin
            tipo:= v[i].tipo;
            nombre:= v[i].nombre; 
            dist:= v[i].pc;
            tipoGalaxia(v2, tipo);
            if(cumple(nombre)) then
                masaTres:= masaTres + v[i].masa;
            masaTotal:= masaTotal + v[i].masa;
            if(cumpleDistancia(tipo, dist)) then
                cantIrregulares:= cantIrregulares + 1;
            maximos(nombre, v[i].masa, max1, max2, nomMax1, nomMax2);
            minimos(nombre, v[i].masa, min1, min2, nomMin1, nomMin2);
        end;
    porcentaje:= (masaTres/masaTotal)*100;
    writeln('El tipo ', i, ' tiene un total de ', tipo); {Inciso a}
    writeln('Masa total de las 3 galaxias principales ', masaTres, ' y el porcentaje con respecto a la masa total es: ', porcentaje:0:2); {Inciso b}
    writeln('Cantidad de galaxias irregulares: ', cantIrregulares); {Inciso c}
    writeln('Maximo 1: ', nomMax1, ' . Maximo 2: ', nomMax2); {Inciso d}
    writeln('Minimo 1: ', nomMin1, ' . Minimo 2: ', nomMin2);
end;

var
    v: vector;
    v2: vectorTipo;
begin
    recorrer(v, v2);
end.