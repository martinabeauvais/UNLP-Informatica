{Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la información de los productos que 
mantiene actualmente en stock. Para ello, se conoce la siguiente información de los microprocesadores: marca (Intel, AMB, NVidia, etc), 
línea (Xeon, Core i7, Opteron, Atom, Centrino, etc.), cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida 
de Ghz) y tamaño en nanómetros (nm) de los transistores (14, 22, 32, 45, etc.). La información de los microprocesadores se lee de forma
consecutiva por marca de procesador y la lectura finaliza al ingresar un proccesador con 0 cores (que no debe procesarse). Se pide implementar
un programa que lea información de los microprocesadores de la empresa importadora e informe:
    • Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
    • Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
    • Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de al menos 2 Ghz.}


program seis; 
type
    str50 = string[50];
    microprocesador = record;
        marca: str50;
        linea: str50;
        cant: integer;
        velocidad: real;
        nm: integer;
    end;

procedure leer(var m: microprocesador);
begin
    readln(m.cant);
    if(m.cant <> 0) then
        begin  
            readln(m.marca);
            readln(m.linea);
            readln(m.velocidad);
            readln(m.nm);
        end;
end;

procedure maximos (m: microprocesador; var max1, max2: integer; var mar1, mar2: str50);
begin   
    if(m.cant >= max1) then
        begin
            max2:= max1;
            mar2:= mar1;
            max1:= m.cant;
            mar1:= m.marca;
        end;
    else
    begin
        if(m.cant >= max2) then
            begin
                max2:= m.cant;
                mar2:= m.marca;
            end;
    end;
end;

procedure informar;
var
    m:microprocesador;
    mar1, mar2, marcaActual: str50;
    max1, max2, cant, cant2: integer;
begin
    cant:= 0;
    cant2:= 0;
    max1:= -1;
    max2:= -1; 
    leer(m);
    while(m.cant <> 0) do
        begin
            marcaActual:= m.marca;
            while(m.cant <> 0) and (marcaActual = m.marca) do
                begin
                    if(m.cant > 2) and (m.nm >= 22) then
                        writeln('Marca: ', m.marca, '. Linea: ', m.linea);
                    if(m.nm = 14) then
                        cant:= cant + 1;
                    if(m.cant > 1) and (m.marca = 'Intel') or (m.marca = 'AMD') and (m.velocidad >= 2) then
                        cant2:= cant2 + 1;
                    leer(m);
                end;
            maximos(m, max1, max2, mar1, mar2, cant);
        end;
    writeln(mar1, mar2);
    writeln(cant2);
end;

begin
    informar();
end.