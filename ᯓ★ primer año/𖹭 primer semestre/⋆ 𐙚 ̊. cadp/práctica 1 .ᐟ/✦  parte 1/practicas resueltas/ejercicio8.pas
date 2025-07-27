{Realizar un programa que lea tres caracteres, e informe si los tres eran letras vocales o si al menos uno de ellos no lo era. Por ejemplo: 
    - Si se leen los caracteres "a e o", deberá informar: "Los tres son vocales".
    - Si se leen los caracteres "z a g", deberá informar: "Al menos un caracter no era vocal".}

program ocho;
var
    letra: char;
    contador, vocal: integer;
begin
    contador:= 0;
    vocal:= 0;
    writeln('Ingrese una letra');
    readln(letra);
    contador:= contador + 1;
    if(letra = 'a') or (letra = 'e') or (letra = 'i') or (letra = 'o') or (letra = 'u') then
        vocal:= vocal + 1;
    while(contador <= 3) do 
        begin
            contador:= contador + 1;
            writeln('Ingrese una letra');
            readln(letra);
            if(letra = 'a') or (letra = 'e') or (letra = 'i') or (letra = 'o') or (letra = 'u') then
                vocal:= vocal + 1;
        end;
    if(vocal = 3) then
        writeln('Las tres son vocales')
    else
        writeln('Al menos un caracter no era vocal');
end.