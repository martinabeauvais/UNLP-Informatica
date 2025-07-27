{Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los autos se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera participaron 100 autos. Informar en pantalla: 
    a. Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
    b. Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.}

program siete;
var
    nombre, nomP1, nomP2, nomP100, nomP99: string;
    tiempo, min1, min2, max1, max2: real;
    i: integer;
begin
    min1:= 9999;
    min2:= 9999;
    max1:= -1;
    max2:= -1;
    for i:=1 to 100 do 
        begin
            writeln('Ingrese el nombre del piloto');
            readln(nombre);
            writeln('Ingrese el tiempo del piloto');
            readln(tiempo);
            if(tiempo < min1) then
                begin
                    min2:= min1;
                    min1:= tiempo;
                    nomP2:= nomP1;
                    nomP1:= nombre;
                end
            else
            begin
                if(tiempo < min2) then
                    begin
                        nomP2:= nombre;
                        min2:= tiempo;
                    end;
            end;
            if(tiempo > max1) then
                begin
                    max2:= max1;
                    max1:= tiempo;
                    nomP100:= nomP99;
                    nomP99:= nombre;
                end
            else else
            begin
                if(tiempo > max2) then
                    begin
                        max2:= tiempo;
                        nomP100:= nombre;
                    end;
            end;
        end;
    writeln('Los nombres de los pilotos que finalizaron en los primeros dos puestos son: ', nomP1, ' y ', nomP2);
    writeln('Los nombres de los pilotos que finalizaron en los últimos dos puestos son: ', nomP99, ' y ', nomP100);
end.