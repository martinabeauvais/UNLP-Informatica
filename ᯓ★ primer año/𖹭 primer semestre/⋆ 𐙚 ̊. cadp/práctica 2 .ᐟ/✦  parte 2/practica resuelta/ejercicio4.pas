{El siguiente programa intenta resolver un enunciado. Sin embargo, el código posee 5 errores. Indicar en qué línea se encuentra cada error
y en qué consiste el error.
    ENUNCIADO: Realice un programa que lea datos de 130 programadores Java de una empresa. De cada programador se lee el número de legajo y 
        el salario actual. El programa debe imprimir el total del dinero destinado por mes al pago de salarios, y el salario del empleado con 
        mayor legajo.}

program programadores;
procedure leerDatos(var legajo: integer; salario: real); {ERROR 1: Salario debe ser un parámetro por referencia}
begin 
    writeln('Ingrese el nro de legajo y el salario');
    readln(legajo);
    readln(salario);
end;

procedure actualizarMaximo(nuevoLegajo: integer; nuevoSalario: real; var maxLegajo: integer);
var
    maxSalario: real; {ERROR 2: Debe estar como parámetro por referencia}
begin
    if(nuevoLegajo > maxLegajo) then
        begin
            maxLegajo:=  nuevoLegajo;
            maxSalario:= nuevoSalario;
        end;
end;

var
    legajo, maxLegajo, i: integer;
    salario: maxSalario: real; {ERROR 3: 'maxSalario' no está inicializada}
begin
    sumaSalarios:= 0; {ERROR 4: No está declarada}
    for i:= 1 to 130 do begin
        leerDatos(salario, legajo); {ERROR 5: Parámetros invertidos}
        actualizarMaximo(legajo, salario, maxLegajo);
        sumaSalarios:= sumaSalarios + salario;
    end;
    writeln('En todo el mes se gastan ', sumaSalarios, ' pesos');
    writeln('El salario del empleado más nuevo es ', maxSalario);
end. 