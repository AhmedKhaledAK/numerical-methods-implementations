function retval = FixedPoint(funcStr,x0, imax, es)
  
  # converting the input to a real function
  funcStr = strcat("@(x)",funcStr);
  gh = str2func(funcStr);
  # end of converting
  
  
endfunction
