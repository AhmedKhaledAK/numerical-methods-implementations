function retval = Bisection (funcStr)
  funcStr = strcat("@(x)",funcStr);
  fh = str2func(funcStr);
  y = fh(3);
  disp(y);
  retval = funcStr;
endfunction