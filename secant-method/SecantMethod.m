str = input("Enter a function in x: ", 's');
func = strcat("@(x)", str);
x1 = input("Enter your 1st initial guess Xi: ");
x0 = input("Enter your 2nd initial guess Xi-1: ");
sf = input ("Enter number of significant figures: ");


function y = evaluate(func, x)
  fh = str2func(func);
  y = fh(x);
 
endfunction

function root = secant(func, x1, x0, sf)
  es = 0.5*(10^(2-sf));
  i = 1;
  
  xf = x1;
  xs = x0;
  
  ea=-1;
  xnew=-1111;
  
  while(1)
    xfo=xf;
    xso=xs;
    xnew = xfo-((evaluate(func,xfo)*(xso-xfo))/(evaluate(func,xso)-evaluate(func,xfo)));
    i+=1;
    if(xnew != 0)
      ea = abs((xnew-xfo)/xnew)*100
    endif
    if (ea < es)
      break;
    endif
    
    xnew
    xfo
    xso
    
    xf=xnew;
    xs=xfo;
  
  end

  root = xnew;
  
endfunction

secant(func, x1,x0,sf)