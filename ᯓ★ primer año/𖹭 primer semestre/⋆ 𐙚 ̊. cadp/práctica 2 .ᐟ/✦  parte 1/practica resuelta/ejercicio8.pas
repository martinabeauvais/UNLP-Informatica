{Dado el siguiente programa:}

program anidamientos;
procedure leer;
var
    letra: char;
    function analizarLetra: boolean;
    begin
        if(letra >= 'a') and (letra <= 'z') then
            analizarLetra:= true
        else 
            if(letra >= 'A') and (letra <= 'Z') then
                analizarLetra:= false;
    end;
begin   
    writeln('Ingrese una letra');
    readln(letra);
    if(analizarLetra) then 
        writeln('Se trata de una minúscula')
    else 
        writeln('Se trata de una mayúscula');
end;

var
    ok: boolean;
begin
    leer;
    ok:= analizarLetra;
    if ok then 
        writeln('Gracias, vuelva prontosss');
end.

{a. La función analizarLetra fue declarada como un submódulo dentro del procedimiento leer, pero esto puede traer problemas en el código del programa principal.
    I. ¿Qué clase de problemas encuentra? No puede incluirse una función dentro de un procedimiento.
    II. ¿Cómo se puede resolver el problema para que el programa compile y funciones correctamente? Se tendría que realizar primero la función, y luego llamarla dentro del procedure.

b. La función analizarLetra parece incompleta, ya que no cubre algunos valores posibles de la variable letra.
    I. ¿De queé valores se trata? Se trata de los demás carácteres, que no conforman las letras.
    II. ¿Qué sucede en nuestro programa si se ingresa uno de estos valores? El programa dejará de ejecutarse.
    III. ¿Cómo se puede resolver este programa? Se resolvería agregando una comparativa a aquellas que no son letras.} 

