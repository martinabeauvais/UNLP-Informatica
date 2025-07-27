{El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año 2019. Para ello, cuenta 
con información de las fechas de todos los casamientos realizados durante ese año.
    a. Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento. 
    b. Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido en el inciso a.
    c. Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura finaliza al ingresar el año 2020, que
no debe procesarse, e informe la cantidad de casamientos realizados durante los meses de verano (enero, febrero y marzo) y la cantidad de 
casamientos realizados en los primeros 10 días de cada mes. Nota: utilizar el módilo realizado en b) para la lectura de fecha.}

program dos;
const
    diaC = 1..31;
    mesC = 1..12;
type 
    fecha = record
        dia: diaC;
        mes: mesC;
        anno: integer;
    end;
    
procedure leer (var f: fecha);
begin
    read(f.anno);
    if(f.anno <> 2020) then
        begin
            readln(f.dia);
            readln(f.mes);
        end;
end;

procedure casamientos;
var
    f: fecha;
    cantVerano, cant10: integer;
begin   
    cantVerano:= 0;
    cant10:= 0;
    leer(f);
    while(f.anno <> 2020) do
        begin
            if(f.mes = 1) or (f.mes = 2) or (f.mes = 3) then
                cantVerano:= cantVerano + 1;
            if(f.dia <= 10) then
                cant10:= cant10 + 1;
            leer(f);
        end;
    writeln(cantVerano);
    writeln(cant10);
end;

begin
    casamientos();
end.