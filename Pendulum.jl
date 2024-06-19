using Plots
mutable struct Pendulum
    w; #speed
    l; #length
    o; #theta
    dt;
    t; #time
end

g = 9.8

function step!(p::Pendulum)
    pw = p.w
    p.w = p.w - (g/p.l)*p.o * p.dt
    p.o = p.o + pw*p.dt
    p.t = p.t + p.dt
end

pend = Pendulum(1.0,1,-.3, 0.04, 0.0)
plt = plot(1, xlim = (0,10), xlabel = "time in sec", ylim = (-1,1), ylabel = "theta in rad",title = "Simple Pendulum", marker = 2)

anim = @animate for i = 1:250
    step!(pend)
    push!(plt, pend.t, pend.o)
end

gif(anim, fps = 30)


