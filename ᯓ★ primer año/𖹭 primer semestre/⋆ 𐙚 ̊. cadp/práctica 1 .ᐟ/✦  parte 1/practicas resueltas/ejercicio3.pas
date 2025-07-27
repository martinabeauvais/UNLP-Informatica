{Realizar un programa que lea 3 números enteros y los imprima en orden descendente. Por ejemplo: si se ingresan los valores 4, -10 y 12, deberá imprimir: "12  4  -10"}

program tres;
var
    num1, num2, num3, max1, max2, max3: integer;
begin
    max1:= -9999;
    max2:= -9999;
    max3:= -9999;
    writeln('Ingrese un número');
    readln(num1);
    writeln('Ingrese otro número');
    readln(num2);
    writeln('Ingrese otro número');
    readln(num3);
    if(num1 > num2) and (num1 > num3) then
        begin
            max1:= num1;
            max2:= num2;
            max3:= num3;
            if(num3 > num2) then
                begin
                    max2:= num3;
                    max3:= num2;
                end;
        end
    else begin
        if(num2 > num1) and (num2 > num3) then
            begin
                max1:= num2;
                max2:= num1;
                max3:= num3;
                if(num3 > num1) then
                    begin
                        max2:= num3;
                        max3:= num1;
                    end;
            end
        else begin
            if(num3 > num1) and (num3 > num2) then
                begin
                    max1:= num3;
                    max2:= num1;
                    max3:= num2;
                    if(num2 > num1) then
                        begin
                            max2:= num2;
                            max3:= num1;
                        end;
                end;
        end;
    end;
    writeln(max1, max2, max3);
end.