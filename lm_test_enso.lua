local sin, cos, exp = math.sin, math.cos, math.exp
local pi = math.pi

local enso_N = 168
local enso_P = 9

local enso_x0 = gsl.vector { 10.0, 3.0, 0.5, 44.0, -1.5, 0.5, 26.0, 0.1, 1.5 }

local enso_x = gsl.vector {
  1.0510749193E+01, 
  3.0762128085E+00,
  5.3280138227E-01,
  4.4311088700E+01,
 -1.6231428586E+00,
  5.2554493756E-01,
  2.6887614440E+01,
  2.1232288488E-01,
  1.4966870418E+00 }

local enso_sumsq = 7.8853978668E+02

local enso_sigma = gsl.vector {
 1.7488832467E-01,
 2.4310052139E-01,
 2.4354686618E-01,
 9.4408025976E-01,
 2.8078369611E-01,
 4.8073701119E-01,
 4.1612939130E-01,
 5.1460022911E-01,
 2.5434468893E-01 }

local enso_F = gsl.vector {
    12.90000, 
    11.30000, 
    10.60000, 
    11.20000, 
    10.90000, 
    7.500000, 
    7.700000, 
    11.70000, 
    12.90000, 
    14.30000, 
    10.90000, 
    13.70000, 
    17.10000, 
    14.00000, 
    15.30000, 
    8.500000, 
    5.700000, 
    5.500000, 
    7.600000, 
    8.600000, 
    7.300000, 
    7.600000, 
    12.70000, 
    11.00000, 
    12.70000, 
    12.90000, 
    13.00000, 
    10.90000, 
   10.400000, 
   10.200000, 
    8.000000, 
    10.90000, 
    13.60000, 
   10.500000, 
    9.200000, 
    12.40000, 
    12.70000, 
    13.30000, 
   10.100000, 
    7.800000, 
    4.800000, 
    3.000000, 
    2.500000, 
    6.300000, 
    9.700000, 
    11.60000, 
    8.600000, 
    12.40000, 
   10.500000, 
    13.30000, 
   10.400000, 
    8.100000, 
    3.700000, 
    10.70000, 
    5.100000, 
   10.400000, 
    10.90000, 
    11.70000, 
    11.40000, 
    13.70000, 
    14.10000, 
    14.00000, 
    12.50000, 
    6.300000, 
    9.600000, 
    11.70000, 
    5.000000, 
    10.80000, 
    12.70000, 
    10.80000, 
    11.80000, 
    12.60000, 
    15.70000, 
    12.60000, 
    14.80000, 
    7.800000, 
    7.100000, 
    11.20000, 
    8.100000, 
    6.400000, 
    5.200000, 
    12.00000, 
   10.200000, 
    12.70000, 
   10.200000, 
    14.70000, 
    12.20000, 
    7.100000, 
    5.700000, 
    6.700000, 
    3.900000, 
    8.500000, 
    8.300000, 
    10.80000, 
    16.70000, 
    12.60000, 
    12.50000, 
    12.50000, 
    9.800000, 
    7.200000, 
    4.100000, 
    10.60000, 
   10.100000, 
   10.100000, 
    11.90000, 
    13.60000, 
    16.30000, 
    17.60000, 
    15.50000, 
    16.00000, 
    15.20000, 
    11.20000, 
    14.30000, 
    14.50000, 
    8.500000, 
    12.00000, 
    12.70000, 
    11.30000, 
    14.50000, 
    15.10000, 
   10.400000, 
    11.50000, 
    13.40000, 
    7.500000, 
   0.6000000, 
   0.3000000, 
    5.500000, 
    5.000000, 
    4.600000, 
    8.200000, 
    9.900000, 
    9.200000, 
    12.50000, 
    10.90000, 
    9.900000, 
    8.900000, 
    7.600000, 
    9.500000, 
    8.400000, 
    10.70000, 
    13.60000, 
    13.70000, 
    13.70000, 
    16.50000, 
    16.80000, 
    17.10000, 
    15.40000, 
    9.500000, 
    6.100000, 
   10.100000, 
    9.300000, 
    5.300000, 
    11.20000, 
    16.60000, 
    15.60000, 
    12.00000, 
    11.50000, 
    8.600000, 
    13.80000, 
    8.700000, 
    8.600000, 
    8.600000, 
    8.700000, 
    12.80000, 
    13.20000, 
    14.00000, 
    13.40000, 
    14.80000 }

local function enso_fdf (x, f, J)
   local b0 = x[1]
   local b1 = x[2]
   local b2 = x[3]
   local b3 = x[4]
   local b4 = x[5]
   local b5 = x[6]
   local b6 = x[7]
   local b7 = x[8]
   local b8 = x[9]

   if f then
      for i = 1, enso_N do
	 local t = i
	 local y = b0

	 y = y + b1 * cos(2*pi*t/12)
	 y = y + b2 * sin(2*pi*t/12)
	 y = y + b4 * cos(2*pi*t/b3)
	 y = y + b5 * sin(2*pi*t/b3)
	 y = y + b7 * cos(2*pi*t/b6)
	 y = y + b8 * sin(2*pi*t/b6)

	 f[i] = enso_F[i] - y
      end
   end

   if J then
      for i = 1, enso_N do
	 local t = i
	 J:set(i, 1, -1)
	 J:set(i, 2, -cos(2*pi*t/12))
	 J:set(i, 3, -sin(2*pi*t/12))
	 J:set(i, 4, -b4*(2*pi*t/(b3*b3))*sin(2*pi*t/b3) +
			                b5*(2*pi*t/(b3*b3))*cos(2*pi*t/b3))
	 J:set(i, 5, -cos(2*pi*t/b3))
	 J:set(i, 6, -sin(2*pi*t/b3))
	 J:set(i, 7, -b7 * (2*pi*t/(b6*b6)) * sin(2*pi*t/b6) +
		                        b8 * (2*pi*t/(b6*b6)) * cos(2*pi*t/b6))
	 J:set(i, 8, -cos(2*pi*t/b6))
	 J:set(i, 9, -sin(2*pi*t/b6))
      end
   end
end

local function enso_model_f(x, t)
   local y = x[1]
   y = y + x[2] * cos(2*pi*t/12)
   y = y + x[3] * sin(2*pi*t/12)
   y = y + x[5] * cos(2*pi*t/x[4])
   y = y + x[6] * sin(2*pi*t/x[4])
   y = y + x[8] * cos(2*pi*t/x[7])
   y = y + x[9] * sin(2*pi*t/x[7])
   return y
end

local s = gsl.nlinfit {n= enso_N, p= enso_P}

s:set(enso_fdf, enso_x0)

print(gsl.tr(s.x))

for i=1, 80 do
   s:iterate()
   print('ITER=', i, ': ', gsl.tr(s.x), s.chisq)
   if s:test(0, 1e-7) then print('solution found'); break end
end

p = graph.plot()
pts = graph.ipath(gsl.sequence(function(i) return i, enso_F[i] end, enso_N))
fitln = graph.fxline(function(t) return enso_model_f(s.x, t) end, 0, 168, 512)
p:addline(pts, 'blue', {{'marker', size=4}})
p:addline(fitln)
p.title = 'ENSO non-linear fit NIST test'
p:show()
