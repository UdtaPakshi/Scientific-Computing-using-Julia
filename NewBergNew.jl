using DifferentialEquations

# Constants
p1 = 0.0337
p2 = 0.0209
p3 = 0.00000751
n = 0.214
T = 160    # seconds
Gb = 0.811    # basal level of glucose
M = 0.012
G_mean = 0.81 # mean value of G(t)
X_mean = 0.0054 # mean value of X(t)
p = [p1, p2, p3, n, T, Gb, M, G_mean, X_mean]

# Bergman model equations
function Bergman!(du, u, p, t)
    du[1] = -1 * (p[1] + p[9]) * u[1] + (-1) * p[8] * u[3] + p[8] * p[9] + p[1] * p[6]
    du[3] = -1 * p[2] * u[3] + p[3] * u[2]
    du[2] = -1 * p[4] * u[2]
end

# Initial conditions
u0 = [140, 0.05, 0.000005]

# Timespan
tspan = (0.0, 160.0)


problem = ODEProblem(Bergman!, u0, tspan, p)

# Solve the problem
solution = solve(problem)


using Plots
plot(solution, xlabel="Time (t)", ylabel="Concentration", label=["Glucose (G(t))" "Insulin (I(t))" "Dynamic Insulin Response (X(t))"], lw=2)
