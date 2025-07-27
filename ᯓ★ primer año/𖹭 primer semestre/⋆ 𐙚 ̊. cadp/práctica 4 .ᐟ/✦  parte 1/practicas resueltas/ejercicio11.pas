{El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para ello, para cada una
de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente información: título de la foto, el autor de la foto, 
cantidad de Me gusta, cantidad de clics y cantidad de comentarios de usuarios. Realizar un program que lea y almacene esta información.
Una vez finalizada la lectura, el programa debe procesar los datos e informar: 
    a. Título de la foto más vista (la que posee mayor cantidad de clics).
    b. Cantidad de total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo "Art Vandelay".
    c. Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.}

program once;
const 
    dimF = 200;
type
    str50 = string[50];
    
    foto = record
        titulo: str50;
        autor: str50;
        cantMG: integer;
        cantClick: integer;
        cantComentarios: integer;
    end;
    
    vector = array[1..dimF] of foto;
    
procedure leerFoto(var f: foto);
begin
    readln(f.titulo);
    readln(f.autor);
    readln(f.cantMG);
    readln(f.cantClick);
    readln(f.cantComentarios);
end;

procedure cargarVector(var v: vector);
var
    i: integer;
    f: foto;
begin
    for i:=1 to dimF do
        begin
            leerFoto(f);
            v[i]:= f;
        end;
end;

procedure fotoMV(cantClicks: integer; tituloActual: str50; var titMax: str50; var masVista: integer);
begin
    if(cantClicks > masVista)then
        begin
            cantClicks:= masVista;
            titMax:= tituloActual;
        end;
end;

procedure informar(v: vector);
var
    total, masVista, i: integer;
    autorFoto, titMax: str50;
begin
    total:= 0;
    masVista:= -1;
    cargarVector(v);
    for i:=1 to dimF do
        begin
            fotoMV(v[i].cantClick, v[i].titulo, titMax, masVista);
            if(v[i].autor = 'Art Vandelay') then
                total:= total + v[i].cantMG;
            writeln('La cantidad de comentarios en esta foto es de: ', v[i].cantComentarios);
        end;
end;

var
    v: vector;
begin
    informar(v);
end.