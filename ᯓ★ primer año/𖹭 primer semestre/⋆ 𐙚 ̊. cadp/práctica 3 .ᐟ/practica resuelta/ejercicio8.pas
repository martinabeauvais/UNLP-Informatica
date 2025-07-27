{8. La Comisión Provincial por la Memoria desea analizar la información de los proyectos presentados en el programa Jóvenes y Memoria durante la convocatoria 2020.
Cada proyecto posee un código único, un título, el docente coordinador (DNI, nombre y apellido, email), la cantidad de alumnos que participan más de un proyecto, el
nombre de la escuela y la localidad a la que pertenecen. Cada escuela puede presentar más de un proyecto. La información se ingresa ordenada consecutivamente por localidad
y, para cada localidad, por escuela. Realizar un programa que lea la información de los proyectos hasta que se ingrese el proyecto con código -1 (que no debe procesarse),
e informe:
    • Cantidad total de escuelas que participan en la convocatoria 2018 y cantidad de escuelas por cada localidad.
    • Nombres de las dos escuelas con mayor cantidad de alumnos participantes.}

program ocho;
type
    str50 = string[50];
    
    docente = record
        dni: integer;
        nom_ape: str50;
        email: str50;
    end;
    
    proyecto = record
        cod: integer;
        titulo: str50;
        doc: docente;
        cant: integer;
        nomEsc: str50;
        localidad: str50;
    end;
    
procedure leerDocente(var d: docente);
begin
    readln(d.dni);
    readln(d.nom_ape);
    readln(d.email);
end;

procedure leerProyecto(var p: proyecto);
var
    d: docente;
begin
    readln(p.cod);
    if(p.cod <> -1) then
        begin
            readln(p.titulo);
            leerDocente(d);
            p.doc:= d;
            readln(p.cant);
            readln(p.nomEsc);
            readln(p.localidad);
        end;
end;

function cumple(num: integer): boolean;
var
    dig, impares, pares: integer;
begin
    impares:= 0;
    pares:= 0;
    while(num <> 0) do
        begin
            dig:= num mod 10;
            if((dig mod 2)= 0) then
                pares:= pares + 1
            else
                impares:= impares + 1;
            num:= num div 10;
        end;
    
    if(impares = pares) then
        cumple:= true;
end;

procedure maximos(cant: integer; escuela: str50; var max1, max2: integer; var nomMax1, nomMax2: str50);
begin
    if(cant > max1) then
        begin
            max2:= max1;
            nomMax2:= nomMax1;
            nomMax1:= escuela;
            max1:= cant;
        end
    else begin
        if(cant > max2) then
            begin
                nomMax2:= escuela;
                max2:= cant;
            end;
    end;
end;

procedure recorrer;
var
    p: proyecto;
    cant, max1, max2, cantTotal, cantEsLo: integer;
    nomMax1, nomMax2, escAct, locAct: str50;
begin
    max1:= -1;
    max2:= -1;
    leerProyecto(p);
    cantTotal:= 0;
    while(p.cod <> -1) do
        begin
            locAct:= p.localidad;
            cantEsLo:= 0;
            while(p.cod <> -1) and (locAct = p.localidad) do
                begin
                    cantEsLo:= cantEsLo + 1;
                    escAct:= p.nomEsc;
                    cant:= 0;
                    while(p.cod <> -1) and (locAct = p.localidad) and (escAct = p.nomEsc) do
                        begin
                            cant:= cant + p.cant;
                            if(p.localidad = 'Daireaux') then
                                begin 
                                    if(cumple(p.cod))then
                                        writeln('Título del proyecto: ', p.titulo);
                                end;
                            leerProyecto(p);
                            maximos(cant, escAct, max1, max2, nomMax1, nomMax2);
                        end;
                    cantTotal:= cantTotal + cantEsLo;
                    writeln('La cantidad total de escuelas en la localidad ', locAct, ' es de ', cantEsLo);
                end;
        end;
    writeln('La cantidad total de escuelas es de ', cantTotal);
    writeln('Las dos escuelas con mayor cantidad de alumnos son: ', nomMax1, ' y ', nomMax2);
end;

begin
    recorrer();
end.