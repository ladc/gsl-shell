
-- Benchmark of ODE integration functions.
-- The benchmark integrates the Van der Pol differential equation
-- using over a long time interval

local format = string.format

function f_vanderpol_gen(mu)
   return function(t, y, f) 
	     f[0] =  y[1]
	     f[1] = -y[0] + mu * y[1]  * (1-y[0]^2)
	  end
end

local results = {}

local f = f_vanderpol_gen(10.0)
local s = num.odevec {N = 2, eps_abs = 1e-6, method = 'rkf45'}
local y0 = matrix.vec {1, 0}
local t0, t1, h0 = 0, 20000, 0.01
local evol = s.evolve
for k=1, 10 do
   s:init(t0, h0, f, y0.data)
   while s.t < t1 do
      evol(s, f, t1)
   end
   results[#results+1] = format('%g %g %g', s.t, s.y[0], s.y[1])
end

for i, line in ipairs(results) do
   print(i, line)
end
