function retval = FalsePos(funcStr, xl, xu, es, imax)
  # converting the input to a real function
  funcStr = strcat("@(x)",funcStr);
  fh = str2func(funcStr);
  # end of converting
  
  xr=0; # just initializing xr
  ea=-1; # just initializing ea
  
  fl = fh(xl);
  fu = fh(xu);
  iu=0;
  il=0;
  
  for itr = 0:imax=1
    xrold = xr;
    xr = xu - fu * (xl-xu)/(fl-fu);
    fr = fh(xr);
    itr+=1;
    if (xr != 0)
      if (itr != 1)
        ea = abs((xr - xrold) / xr) * 100
       endif
    endif
    test = fl * fr;
    if (test < 0)
      xu = xr;
      fu = fh(xu);
      iu = 0;
      il+=1;
      if (il >= 3)
        fl/=2;
      endif
    elseif (test > 0)
      xl=xr;
      fl = fh(xl);
      il=0;
      iu+=1;
      if (iu >= 3)
        fu/=2;
      endif
    else
      ea=0
    endif
    
    if (ea != -1 && ea < es)
      break;
    endif  
  endfor
  retval = xr;
endfunction
