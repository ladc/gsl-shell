use'randist'
local t = {}

local x=0.1
local sigma=1
local mu=1
local nu=9
local a=3
local nu1=2
local nu2=4
local b=2
local zeta=1
local p=0.4
local n=8

t.gaussian_pdf = function(test) test{gaussian_pdf(x, sigma)} end
t.gaussian_P = function(test) test{gaussian_P(x, sigma)} end
t.gaussian_Q = function(test) test{gaussian_Q(x, sigma)} end
t.gaussian_Pinv = function(test) test{gaussian_Pinv(x, sigma)} end
t.gaussian_Qinv = function(test) test{gaussian_Qinv(x, sigma)} end
t.exponential_pdf = function(test) test{exponential_pdf(x, mu)} end
t.exponential_P = function(test) test{exponential_P(x, mu)} end
t.exponential_Q = function(test) test{exponential_Q(x, mu)} end
t.exponential_Pinv = function(test) test{exponential_Pinv(x, mu)} end
t.exponential_Qinv = function(test) test{exponential_Qinv(x, mu)} end
t.chisq_pdf = function(test) test{chisq_pdf(x, nu)} end
t.chisq_P = function(test) test{chisq_P(x, nu)} end
t.chisq_Q = function(test) test{chisq_Q(x, nu)} end
t.chisq_Pinv = function(test) test{chisq_Pinv(x, nu)} end
t.chisq_Qinv = function(test) test{chisq_Qinv(x, nu)} end
t.laplace_pdf = function(test) test{laplace_pdf(x, a)} end
t.laplace_P = function(test) test{laplace_P(x, a)} end
t.laplace_Q = function(test) test{laplace_Q(x, a)} end
t.laplace_Pinv = function(test) test{laplace_Pinv(x, a)} end
t.laplace_Qinv = function(test) test{laplace_Qinv(x, a)} end
t.tdist_pdf = function(test) test{tdist_pdf(x, nu)} end
t.tdist_P = function(test) test{tdist_P(x, nu)} end
t.tdist_Q = function(test) test{tdist_Q(x, nu)} end
t.tdist_Pinv = function(test) test{tdist_Pinv(x, nu)} end
t.tdist_Qinv = function(test) test{tdist_Qinv(x, nu)} end
t.cauchy_pdf = function(test) test{cauchy_pdf(x, a)} end
t.cauchy_P = function(test) test{cauchy_P(x, a)} end
t.cauchy_Q = function(test) test{cauchy_Q(x, a)} end
t.cauchy_Pinv = function(test) test{cauchy_Pinv(x, a)} end
t.cauchy_Qinv = function(test) test{cauchy_Qinv(x, a)} end
t.rayleigh_pdf = function(test) test{rayleigh_pdf(x, sigma)} end
t.rayleigh_P = function(test) test{rayleigh_P(x, sigma)} end
t.rayleigh_Q = function(test) test{rayleigh_Q(x, sigma)} end
t.rayleigh_Pinv = function(test) test{rayleigh_Pinv(x, sigma)} end
t.rayleigh_Qinv = function(test) test{rayleigh_Qinv(x, sigma)} end
t.fdist_pdf = function(test) test{fdist_pdf(x, nu1, nu2)} end
t.fdist_P = function(test) test{fdist_P(x, nu1, nu2)} end
t.fdist_Q = function(test) test{fdist_Q(x, nu1, nu2)} end
t.fdist_Pinv = function(test) test{fdist_Pinv(x, nu1, nu2)} end
t.fdist_Qinv = function(test) test{fdist_Qinv(x, nu1, nu2)} end
t.gamma_pdf = function(test) test{gamma_pdf(x, a, b)} end
t.gamma_P = function(test) test{gamma_P(x, a, b)} end
t.gamma_Q = function(test) test{gamma_Q(x, a, b)} end
t.gamma_Pinv = function(test) test{gamma_Pinv(x, a, b)} end
t.gamma_Qinv = function(test) test{gamma_Qinv(x, a, b)} end
t.beta_pdf = function(test) test{beta_pdf(x, a, b)} end
t.beta_P = function(test) test{beta_P(x, a, b)} end
t.beta_Q = function(test) test{beta_Q(x, a, b)} end
t.beta_Pinv = function(test) test{beta_Pinv(x, a, b)} end
t.beta_Qinv = function(test) test{beta_Qinv(x, a, b)} end
t.gaussian_tail_pdf = function(test) test{gaussian_tail_pdf(5, a, sigma)} end
t.exppow_pdf = function(test) test{exppow_pdf(x, a, b)} end
t.exppow_P = function(test) test{exppow_P(x, a, b)} end
t.exppow_Q = function(test) test{exppow_Q(x, a, b)} end
t.lognormal_pdf = function(test) test{lognormal_pdf(x, zeta, sigma)} end
t.lognormal_P = function(test) test{lognormal_P(x, zeta, sigma)} end
t.lognormal_Q = function(test) test{lognormal_Q(x, zeta, sigma)} end
t.lognormal_Pinv = function(test) test{lognormal_Pinv(x, zeta, sigma)} end
t.lognormal_Qinv = function(test) test{lognormal_Qinv(x, zeta, sigma)} end
t.binomial_pdf = function(test) test{binomial_pdf(x, p, n)} end
t.binomial_P = function(test) test{binomial_P(x, p, n)} end
t.binomial_Q = function(test) test{binomial_Q(x, p, n)} end
t.poisson_pdf = function(test) test{poisson_pdf(x, mu)} end
t.poisson_P = function(test) test{poisson_P(x, mu)} end
t.poisson_Q = function(test) test{poisson_Q(x, mu)} end
return t
