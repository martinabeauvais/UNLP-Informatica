{   a. Realizar un módulo que calcule el rendimiento económico de una plantación de soja. El módulo debe recibir la cantidad de hectáreas (ha)
sembrados, el tipo de zona de siembre (1: zona muy fértil, 2: zona estándar, 3: zona arida) y el precio en U$S de la tonelada de soja; y
devolver el rendimiento económico esperada de dicha plantación. Para calcular el rendimiento económico debe considerar el siguiente rendimiento
por tipo de zona: 

                Tipo de zona x Rendimiento por ha:
                    1: 6 toneladas por ha
                    2: 2,6 toneladas por ha
                    3: 1,4 toneladas por ha
    
    b. ARBA desea procesar información obtenido de imágenes satelitales de campos sembrados con soja en la provincia de Bs. As. De cada campo se
lee: localidad, cantidad de hectáreas sembradas y el tipo de zona (1, 2 ó 3). La lectura finaliza al leer un campo de 900 ha en la localidad 
'Saladillo', que debe procesarse. El precio de soja es de U$S 320 por tn. Informar: 
        • La cantidad de campos de la localidad 'Tres de Febrero' con remiento estimado superio a U$S 10.000
        • La localidad del campo con mayor rendimiento econ~mico esperado.
        • La localidad del campo con menor rendimiento económico esperado.
        • El rendimiento económico esperado.}

program doce; 
type
    zona = 1..3;
    function rendimientoEco(tipo: zona; cant, : integer; precio: real): real;
    begin
        if(tipo = 1) then
            rendimientoEco:= 6 * cant * precio
        else begin
            if(tipo = 2) then
                rendimientoEco:= 2,6 * cant * precio
            else 
                rendimientoEco:= 1,4 * cant * precio;
        end;
    end;
end;

procedure leerCampo(var localidad: string; var cant: integer; var tipo: zona);
begin
    readln(localidad);
    readln(cant);
    readln(precio);
end;

procedure maximo(localidad: string; rendimiento: real; var max: real; var locMax: string);
begin
    if(rendimiento >= max) then begin
        max:= rendimiento;
        locMax:= localidad;
    end;
end;

procedure minimo(localidad: string; rendimiento: real; var min: real; var locMin: string);
begin
    if(rendimiento <= min) then begin
        min:= rendimiento;
        locMin:= localidad;
    end;
end;

procedure camposSembrados;
var
    tipo: zona;
    localidad, locMin, locMax: strin;
    min, max, rendimiento, total, cant: real;
    cantTotal, cantFebrero: integer;
begin
    cantTotal, cantFebrero:= 0;
    min:= 9999;
    max:= -1;
    total:= 0;
    repeat
        leerCampo(localidad, cant, tipo);
        cantTotal:= cantTotal + 1;
        rendimiento:= rendimientoEco(tipo, cant, precio);
        total:= total + rendimiento;
        if( localidad = 'Tres de Febrero') and (rendimiento > 10000) then
            cantFebrero:= cantFebrero + 1;
        maximo(localidad, rendimiento, max, locMax);
        minimo(localidad, rendimiento, min, locMin);
    until (cant = 900) and (localidad = 'Saladillo');
    writeln(cantFebrero);
    writeln(max, locMax);
    writeln(min, locMin);
    writeln(total/ cantTotal);
end;

begin
    camposSembrados();
end.