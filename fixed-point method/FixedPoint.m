function retval = FixedPoint(funcStr,x0, imax, es)
  
  # converting the input to a real function
  funcStr = strcat("@(x)",funcStr);
  gh = str2func(funcStr);
  # end of converting
  
  xr = x0;
  
  es = -1;
  
  for itr = 0:imax-1
    xrold = xr;
    xr = gh(xrold);
    itr+=1;
    if (xr != 0)
      ea = abs((xr-xrold)/xr)*100;
    endif
    
    if (ea != -1 && ea < es)
      break;
    endif
    
  endfor
  
  ea
  retval = xr;
  
endfunction
