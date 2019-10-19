function retval = Bisection (funcStr, xl, xu, es, imax)
  # converting the input to a real function
  funcStr = strcat("@(x)",funcStr);
  fh = str2func(funcStr);
  
  
  
endfunction