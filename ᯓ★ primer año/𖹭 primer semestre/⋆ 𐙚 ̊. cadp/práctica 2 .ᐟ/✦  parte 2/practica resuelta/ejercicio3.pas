{Encontrar los 6 errores que existen en el siguiente programa. Utilizar los comentarios entre llaves como guía, indicar en qué línea se 
encuentra cada error y en qué consiste.}

program ejercicio3;
    {suma los números entre a y b, y retorna el resultado en c}
procedure sumar(a, b, c: integer); {ERROR 1: C no está como parámetro por referencia}
var
    suma: integer; {ERROR 2: No declara la variable i}
begin   
    {ERROR 3: No inicializa c ni suma => c:= 0; suma:= 0}
    for i:=a to b do
        suma:= suma + i;
    c:= c + suma;
end;

var
    result: integer; {ERROR 4: No le asigna el tipo de dato a las variables a, b y c}
begin   
    result:= 0;
    readln(a);
    readln(b);
    sumar(a, b, 0) 
    writeln('La suma total es: ', result); {ERROR 5: Imprime siempre 0, ya que no se le asignó el valor de c en result}
    {averigua si el resultado final estuvo entre 10 y 30}
    ok:= (result >= 10) or (result <= 30); {ERROR 6: No se declara, ni se inicializa ok}
    if (not ok) then 
        writeln('La suma no quedó entre 10 y 30');
end.