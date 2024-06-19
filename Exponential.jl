using DifferentialEquations
f(u,p,t) = 1.04*u;
u_init = 0.5;
timespan = (0.0, 2.0);
problem = ODEProblem(f, u_init, timespan);
solution = solve(problem)

using Plots
plot(solution, linewidth = 4, title = "Solution to the linear ODE", xaxis = "time", yaxis = "u")
