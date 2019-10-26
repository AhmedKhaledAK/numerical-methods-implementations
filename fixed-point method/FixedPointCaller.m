str = input("Enter a function (g(x)) in x: ", 's');
x0 = input("Enter your initial guess: ");
imax = input("Enter maximum number of iterations: ");
es = input("Enter es: ");
ans = FixedPoint(str, x0, imax, es)