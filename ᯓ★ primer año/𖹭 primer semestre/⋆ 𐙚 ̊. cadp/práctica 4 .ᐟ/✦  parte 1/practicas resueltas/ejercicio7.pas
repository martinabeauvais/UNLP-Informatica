{Realizar un programa que lea números enteros desde teclado hasta que se ingrese un
valor -1 (que no debe procesarse) e informe:
    a. La cantidad de ocurrencias de cada dígito procesado.
    b. El dígito más leído.
    c. Los dígitos que no tuvieron ocurrencias.

    Por ejemplo: si la secuencia que se lee es: 63 | 34 | 99 | 94 | 96 | -1, el 
programa deberá informar:
        Número 3: 2 veces
        Número 4: 2 veces
        Número 6: 2 veces
        Número 9: 4 veces
    Los dígitos que no tuvieron ocurrencias son: 0, 1, 2, 5, 7, 8}

program siete;
const
    dimF = 9;
type 
    subRango = 0..9;
    vector = array[subRango] of integer;

procedure inicializar(var v:vector);
var
    i: subRango;
begin
    for i:=0 to dimF do
        v[i]:= 0;
end;

procedure descomponer(var v: vector; num: integer);
var
    dig: integer;
begin
    while(num <> 0) do
        begin
            dig:= num mod 10;
            v[dig]:= v[dig] + 1;
            num:= num div 10;
        end;
end;

procedure leerNum(var v: vector);
var
    num: integer;
begin
    writeln('Ingrese un número:');
    readln(num);
    while(num <> -1) do
        begin
            descomponer(v, num);
            writeln('Ingrese un número:');
            readln(num);
        end;
end;

procedure maxDig(v: vector; var max, pos: integer);
var
    i: integer;
begin
    max:= -1;
    pos:= -1;
    for i:=0 to dimF do
        begin
            if(v[i] > max) then
                begin
                    max:= v[i];
                    pos:= i;
                end;
        end;
    writeln('El dígito ', pos, ' fue el más leído: ', max);
end;

procedure ocurrencias(v: vector);
var
    i: subRango;
begin
    for i:=0 to 9 do
        begin
            if(v[i] > 0) then
                writeln('El dígito ', i, ' fue leído ', v[i], ' veces')
            else
                writeln('El dígito ', i, ' no fue leído');
        end;
end;
var
    v: vector;
    max, pos: integer;
begin
    inicializar(v);
    leerNum(v);
    maxDig(v, max, pos);
    ocurrencias(v);
end.