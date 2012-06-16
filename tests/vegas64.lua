local tt={}
function tt.monte_vegas()
  local monte_vegas = num.monte_vegas
  local n=9
  local lo,hi = 0,2
  local exact = n*(n+1)/2 * (hi*hi*hi - lo*lo*lo)/3 * (hi-lo)^(n-1)
  local a,b={},{}
  for i=1,n do
     a[i],b[i]=lo,hi
  end
  local calls = 1e4*n
  local r = rng.new('taus2')
  r:set(30776)
  local function f(x)
    return 1*x[1]*x[1]+2*x[2]*x[2]+3*x[3]*x[3]+4*x[4]*x[4]+5*x[5]*x[5]+6*x[6]*x[6]+7*x[7]*x[7]+8*x[8]*x[8]+9*x[9]*x[9]
  end

  local result,sigma,runs,cont = monte_vegas(f,a,b,calls,r)
  return {
    result=result,
    sigma=sigma,
    runs=runs},
    -- expected (obtained using the C version of vegas)
    {result =  3.07205308433293212e+04,
    sigma  =  6.63672726816676839e+00,
    runs=1
    }
end
return tt
