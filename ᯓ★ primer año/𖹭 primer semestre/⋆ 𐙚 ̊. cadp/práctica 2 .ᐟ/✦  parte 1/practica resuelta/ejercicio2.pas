{Dado el siguiente programa, indicar qué imprime:}

program alcance2;
var
    a, b: integer;
procedure uno;
begin
    b:= 3;
    writeln(b);
end;

begin
    a:= 1;
    b:= 2;
    uno;
    writeln(b, a);
end.

{Respuesta:
    - Imprime: 3 1 (del programa principal), y un 3 (del procedure); ya que pisa el valor de b, al llamar al procedure.}