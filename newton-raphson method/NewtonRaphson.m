%str = input("Enter a function in x: ", 's');
%func = strcat("@(x)", str);
%x0 = input("Enter your initial guess X0: ");
%sf = input ("Enter number of significant figures: ");


function y = evaluate(func, x)
  fh = str2func(func);
  y = fh(x);
 
endfunction

function diff_result = evaluateDerivative(func, xi)
  pkg load symbolic  
  %create a symbol x
  syms x;

  %convert string function into function handle
  fh = str2func(func);
  
  %convert function handle into regular function
  fx = fh(x);
  
  %differentiate function 
  fdiff = diff(fx);
  
  %evaluate f'(x)
  diff_result = double(subs(fdiff, x, xi));
  
  endfunction

function xnew = evaluateNewtonRaphson(func, xi)
  
  fdiff_result = evaluateDerivative(func, xi);
  if(fdiff_result == 0)
    disp("DIVIDING BY ZERO");
  end
  
  fx_result = evaluate(func, xi);
  
  xnew = xi - fx_result/fdiff_result;
  
endfunction



function root = newtonraphson(func, xold, sf)
  es = 0.5*(10^(2-sf))
  i = 1;
  func

  while(1)
    i
    xold
    xnew = evaluateNewtonRaphson(func, xold)
    
    ea = abs((xnew-xold)/xnew * 100)
    if(ea <= es)
      break;
    end  
    
    xold = xnew;
    i++;
  
  end

endfunction

newtonraphson(func,x0,sf)
