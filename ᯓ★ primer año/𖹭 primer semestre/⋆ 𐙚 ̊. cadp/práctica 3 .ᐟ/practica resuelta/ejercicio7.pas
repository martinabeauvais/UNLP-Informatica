{Realizar un programa que lea información de centros de investigación de Universidades Nacionales. De cada centro se lee su nombre abreviado
(ej. LIDI, LIFIA, LINTI), la universidad a la que pertenece, la cantidad de investigadores y la cantidad de becarios que poseen. La información
se lee de forma consecutiva por universidad y la lectura finaliza al leer un centro con 0 investigadores, que no debe procesarse. Informar: 
    • Cantidad total de centros para cada universidad. 
    • Universidad con mayor cantidad de investigadores en sus centros.
    • Los dos centros con menor cantidad de becarios.}

program siete;
type
    str50 = string[50];
    centro = record
        nombre: str50;
        universidad: str50;
        investigadores: integer;
        becarios: integer;
    end;

procedure leer(var c: centro);
begin
    readln(c.investigadores);
    if(c.investigadores <> 0) then
        begin
            readln(c.nombre);
            readln(c.universidad);
            readln(c.becarios);
        end;
end;

procedure maxInv(c: centro; cantInv: integer; var max: integer; var maxUni: str50);
begin
    if(cantInv >= max) then
        begin
            maxUni:= c.universidad;
            max:= cant;
        end;
end;

procedure minimos(c: centro; cantBe: integer; var min1, min2: integer; var minNom1, minNom2: str50);
begin
    if(cantBe <= min1) then
        begin
            minNom2:= minNom1;
            minNom1:= c.nombre;
            min2:= min1;
            min1:= cantBe;
        end
    else 
        begin
            if(cantBe <= min2) then
                begin
                    minNom2:= c.nombre;
                    min2:= cantBe;
                end;
        end;
end;

procedure informar;
var
    c: centro;
    cantBe, cantInv, total, max, min1, min2: integer;
    maxUni, minNom1, minNom2, uniActual: str50;
begin
    max:=-1;
    min1:= 9999;
    min2:= 9999;
    leer(c);
    while(c.investigadores <> 0) do 
        begin
            cantBe:= 0;
            cantInv:= 0;
            total:= 0;
            uniActual:= c.universidad;
            while(c.investigadores <> 0) and (uniActual = c.universidad) do
                begin
                    total:= total + 1;
                    cantInv:= cantInv + c.investigadores;
                    cantBe:= cantBe + c.becarios;
                    leer(c);
                end;
            writeln(total);
            maxInv(c, cantInv, max, maxUni);
            minimos(c, cantBe, min1, min2, minNom1, minNom2);
        end;
    writeln(max, maxUni);
    writeln(min1, minNom1, min2, minNom2);
end;

begin
    informar();
end.