{El repositorio de código fuente más grande en la actualidad, Github, desea estimar el monto invertido en los proyectos que aloja. Para ello, dispone de una tabla con información de los desarrolladores que participan en un proyecto de software, junto al valor promedio que se paga por hora de trabajo:

CÓDIGO        ROL DEL DESARROLLADOR                 VALOR/HORA (USD)
    1           Analista Funcional                      35,20
    2           Programador                             27,45
    3           Administrador de bases de datos         31,03
    4           Arquitecto de software                  44,28
    5           Administrador de redes y seguridad      39,87
Nota: los valores/hora se incluyen a modo de ejemplo

Realizar un programa que procese la información de los desarrolladores que participaron en los 1000 proyectos de software más activos durante el año 2017. De cada participante se conoce su país de residencia, código de proyecto (1 a 1000), el nombre del proyecto en el que participó, el rol que cumplió en dicho proyecto (1 a 5) y la cantidad de horas trabajadas. La lectura finaliza al ingresar el código de proyecto -1, que no debe procesarse. Al finalizar la lectura, el programa debe informar: 
    a. El monto total invertido en desarrolladores con residencia en Argentina.
    b. La cantidad total de horas trabajadas por Administradores de bases de datos.
    c. El código del proyecto con menor monto invertido.
    d. La cantidad de Arquitectos de software de cada proyecto.}

program catorce;
const
    dimProyectos = 1000;
    dimRol = 5;
type
    str30 = string[30];
    rangoProyecto = 1..dimProyectos;
    rangoRol = 1..dimRol;

    desarrollador = record
        pais: str30;
        cod: rangoProyecto;
        nom:  str30;
        rol: rangoRol;
        horas:integer;
    end;

    vRol = array[rangoRol] of real;
    vMontos = array[rangoProyecto] of real;
    vArqui = array[rangoProyecto] of integer;

procedure cargarValor(var v: vRol);
begin
    v[1]:= 35.20;
    v[2]:= 27.45;
    v[3]:= 31.03;
    v[4]:= 44.28;
    v[5]:= 39.87;
end;

procedure leerParti(var d: desarrollador);
begin
    readln(d.cod);
    if(d.cod <> -1) then begin
        readln(d.pais);
        readln(d.nom);
        readln(d.rol);
        readln(d.horas);
    end;
end;

procedure inicializar (var vm: vMontos; var va: vArqui);
var
    i: rangoProyecto;
begin
    for i:= 1 to dimProyectos do 
    begin
        vm[i]:= 0;
        va[i]:= 0;
    end;
end;    

procedure minimo(montoD: real; var max: real);
begin
    max:= -1;
    if(montoD > max) then
        max:= montoD;
end;

procedure arquitectos(v: vArqui);
var
    i: rangoProyecto;
begin
    for i:= 1 to dimProyectos do
        writeln('La cantidad de Arquitectos de software en el proyecto con código', i, ' es: ', v[i]);
end;

procedure recorrer;
var
    vMonto: vMontos;
    vArquitectos: vArqui;
    vRoles: vRol;
    d: desarrollador;
    montoD, montoArg: real;
    cantHoras, dimL: integer;
begin
    dimL:= 0;
    montoArg:= 0;
    cantHoras:= 0;
    cargarValor(vRoles);
    inicializar(vMonto, vArquitectos);
    leerParti(d);
    while(d.cod <> -1) do begin
        montoD:= d.horas + vRoles[d.rol];
        if(d.pais = 'Argentina') then
            montoArg:= montoArg + montoD;
        if (d.rol = 3) then
            cantHoras:= cantHoras * d.horas
        else
            if(d.rol = 4) then
                vArquitectos[d.cod]:= vArquitectos[d.cod] + 1;
        vMonto[d.cod]:= vMonto[d.cod] + montoD;
        dimL:= dimL + 1; 
        leerParti(d);
    end;
    writeln(montoArg);
    writeln(cantHoras);
    arquitectos(vArquitectos);
end;

begin
    recorrer();
end.