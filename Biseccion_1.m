clear;
clc;
syms x
e_aprox=100;
xanterior=1;
xactual=1;

cont=0;

fx=input ('f(x)=');
x1=input('Limite inferior x1= ');
xu=input('Limite superior xu= ');
aproximado=input('Error maximo Ea= ');

fx1=subs(fx,x,x1);
fxu=subs(fx,x,xu);

if((x1>xu)>0)
    error('No se ingreso el intervalo correcatmente');
end

if((fx1*fxu)>0)
    error('No se cumple el teorema del valor intermedio');
end

%mientras que la tolerncia 1 sema mayor a la 2
while(e_aprox>aproximado)
    
    cont=cont+1;
    xr=(x1+xu)/2;
    fxr=subs(fx,x,xr);
    xanterior=xactual;
    xactual=xr;
   
    %en mi funcion fx reemplazas x con x1/xu 
    fx1=subs(fx,x,x1);
    fxu=subs(fx,x,xu);
    
    %casos
    if((fxr*fx1)<0)
        xu=xr;
    end
    
    if((fxr*fx1)>0)
        x1=xr;
    end
    
    if((fxr)*(fx1)==0)
        fprintf('\n La raiz es: %f',xr);
    end
   
    if(cont>1)
        e_aprox=((abs(xactual-xanterior))/xactual)*100;
    end
    fprintf('\n Iteracion %d, intervalo [%f][%f]',cont,x1,xu);
end
fprintf('\n Raiz de f(x)= %f\n',xr);
