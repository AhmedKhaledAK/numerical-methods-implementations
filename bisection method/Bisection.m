function retval = Bisection (funcStr)
  # converting the input to a real function
  funcStr = strcat("@(x)",funcStr);
  fh = str2func(funcStr);
  
  
  
endfunction