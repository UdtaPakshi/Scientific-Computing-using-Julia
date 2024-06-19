using DifferentialEquations 
f(dx,x,p,t) = -k*x - c*dx + F

k = 10; # in N/m
c = 0.5;
F = 10;

x0 = 0;
dx0 = 0;
timespan = (0.0, 40.0);
problem = SecondOrderODEProblem(f, dx0, x0, timespan)
sol = DifferentialEquations.solve(problem)

using Plots
plot(sol, linewidth = 4, title = "spring mass damper system", xaxis = "time", yaxis = "displacement")


