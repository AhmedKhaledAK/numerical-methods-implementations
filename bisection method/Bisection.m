function retval = Bisection (funcStr, xl, xu, es, imax)
  # converting the input to a real function
  funcStr = strcat("@(x)",funcStr);
  fh = str2func(funcStr);
  # end of converting
  
  xr=0; # just initializing xr
  ea=-1; # just initializing ea
  
  for itr = 0:imax-1
    xrold = xr;
    xr = (xl+xu)/2;
    itr+=1;
    if (xr != 0)
      if (itr != 1)
        ea = abs((xr-xrold)/xr)*100
      endif
    endif
    test = fh(xr)*fh(xl);
    if (test < 0)
      xu = xr;
    elseif (test > 0)
      xl = xr;
    else 
      ea = 0
    endif
    
    if (ea != -1 && ea < es)
      break;
    endif
  endfor
  retval = xr;
endfunction