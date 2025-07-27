{Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello, cuenta con información 
sobre todos los viajes realizados durante el mes de marzo. De cada viaje se cuenta con la siguiente información: día del mes
(de 1 a 31), monto de dinero transportado y distancia recorrida por el camión (medida en kilómetros).
    a. Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza cuando se ingresa 
una distancia recorrida igual a 0 km, que no debe procesarse. //LISTO !!
    b. Realizar un módulo que reciba el vector generado en a) e informe:
        - El monto promedio transportado de los viajes realizados. //var cont //LISTO !!
        - La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero. //LISTO !!
        - La cantidad de viajes realizados cada día del mes. //vector contador // LISTO!!
    c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia recorrida sea igual a 100 km.//eliminar vector
    
    Nota: Para realizar el inciso b, el vector debe recorrerse una única vez.}
    
program tres; 
const
    dimF = 200;
type
    dias = 1..31;
    viaje = record 
        dia: dias;
        monto: real;
        km: real;
    end;

    vector = array[1..dimF] of viaje;
    vContador = array[dias] of integer;

procedure leerViaje(var v: viaje);
begin
    readln(v.km);
    if(v.km <> 0) then begin
        readln(v.dia);
        readln(v.monto);
    end;
end;

procedure iniciarlizar(var vc: vContador);
var
    i: dias;
begin
    for i:=1 to 31 do 
        vc[i]:= 0;
end;

procedure cargarVector(var v: vector; var dimL: integer);
var
    via: viaje;
begin
    leerViaje(via);
    while(dimL < dimF) and (via.km <> 0) do begin
        dimL:= dimL + 1;
        v[dimL]:= via;
        leerViaje(via);
    end;
end;

procedure minimo(dia: dias; monto: real; var diaMin: dias; var montoMin: real);
begin
    if(monto < montoMin) then begin
        montoMin:= monto;
        diaMin:= dia;
    end;
end;

procedure cantidadViaje(vc: vContador);
var
    i: dias;
begin
    for i:= 1 to 31 do 
        writeln('En el dia ', i, ' se hicieron ', vc[i], ' viajes.');
end;

procedure incisoB(v: vector; dimL: integer; var promedio: real; var vc: vContador);
var
    cantViajes, i: integer;
    diaMin: dias;
    montoMin, montoTotal: real;
begin
    montoMin:= 99999;
    montoTotal:= 0;
    promedio:= 0;
    cantViajes:= 0;
    for i:=1 to dimL do begin
        cantViajes:= cantViajes + 1;
        montoTotal:= montoTotal + v[i].monto;
        minimo(v[i].dia, v[i].monto, diaMin, montoMin);
        vc[v[i].dia]:= vc[v[i].dia] + 1;
    end;

    promedio:= montoTotal/cantViajes;
    writeln(diaMin, montoMin);
    cantidadViaje(vc);
end;

procedure eliminar(var v: vector; var dimL: integer);
var
    j, i: integer;
begin
    for i:= 1 to dimL do begin
        if(v[i].km = 100) then begin
            for j:= i to dimL - 1 do 
                v[j]:= v[j+ 1];
            dimL:= dimL - 1;
        end;
    end;
end;

var
    v: vector;
    vc: vContador;
    promedio: real;
    dimL: integer;
begin
    dimL:= 0;
    iniciarlizar(vc);
    cargarVector(v, dimL);
    incisoB(v, dimL, promedio, vc);
    eliminar(v, dimL);
end.