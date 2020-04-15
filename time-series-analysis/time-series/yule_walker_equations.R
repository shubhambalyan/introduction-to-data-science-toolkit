# Yule Walker Equations

# Part 1 - Simulation of AR(2) process with mean zero

# xt=phi1*x(t-1)+phi2*x(t-2)+z_t where z_t~ N(0, sigma^2)
# phi1 = 1/3, phi2 = 1/2 and sigma = 4

set.seed(2020)

# Model parameters
sigma = 4
phi = NULL
phi[1:2] = c(1/3, 1/2)
n=10000

# Simulate AR process
ar.process = arima.sim(n, model = list(ar=c(1/3, 1/2)), sd = 4)
ar.process[1:5]

# 2nd and 3rd sample autocorrelation
r = NULL
r[1:2] = acf(ar.process, plot = F)$acf[2:3]
r

# Define a 2x2 matrix with entries 1
R = matrix(1,2,2)
R

# Edit R matrix
R[1,2] = r[1]
R[2,1] = r[2]
R

# Define b-column matrix
b = matrix(r, nrow = 2, ncol = 1)
b

# Solve the equations
phi.hat = solve(R,b)
phi.hat

# estimate the variance
c0 = acf(ar.process, type = 'covariance', plot = F)$acf[1]
var.hat = c0 * (1-sum(phi.hat*r))
var.hat

# Plot time series
par(mfrow = c(3,1))
plot(ar.process, main='Simulated AR(2)')
acf(ar.process, main='ACF')
pacf(ar.process, main='PACF')

#----------------- END ----------------

# Part 2 - Simulation of AR(3) process with mean zero
# x_t=phi1*x_(t-1)+phi2* x_(t-2)+\phi_3*x_(t-3)+z_t
# z_t~ N(0, sigma^2)

# Model Parameters
set.seed(2020)
sigma = 4
phi = NULL
phi[1:3] = c(1/3, 1/2, 7/100)
n = 100000

# Simulate AR(3) process
ar3.process = arima.sim(n, model = list(ar = c(1/3, 1/2, 7/100)), sd = 4)
r = NULL
r[1:3] = acf(ar3.process, plot = F)$acf[2:4]
r

R = matrix(1,3,3) 
R[1,2] = r[1] 
R[1,3] = r[2]
R[2,1] = r[1]
R[2,3] = r[1]
R[3,1] = r[2]
R[3,2] = r[1]
R

# b-column vector on the right
b = matrix(r, nrow = 3, ncol = 1)
b

# solve Rx=b and find phi's
phi.hat = solve(R,b)
phi.hat

# sigme estimation
c0 = acf(ar3.process, type = 'covariance', plot = F)$acf[1]
var.hat = c0*(1-sum(phi.hat*r))
var.hat

# Plots
par(mfrow = c(3,1))
plot(ar3.process, main = 'Simulated AR(3)')
acf(ar3.process, main = 'ACF')
pacf(ar3.process, main = 'PACF')
