# AR processes - Examples

# Recruitment Data
library(astsa)
plot(rec, main = 'Recruitment Time Series', col = 'blue', lwd = 3)

# Subtract mean to get a time series with mean zero
ar.process = rec - mean(rec)
par(mfrow = c(2, 1))
acf(ar.process, main = 'Recruitment', col = 'red', lwd = 3)
pacf(ar.process, main = 'Recruitment', col = 'green', lwd = 3)

# Setting the order of process
p = 2

# Autocorreleation function
r = NULL
r[1:p] = acf(ar.process, plot = F)$acf[2:(p+1)]
cat('r=',r,'\n')

# Matrix R
R = matrix(1,p,p) # matrix of dimension 2 by 2, with entries all 1's.

# Define non-diagonal entires of R
for(i in 1:p){
  for(j in 1:p){
    if(i!=j)
      R[i,j] = r[abs(i-j)]
  }
}
R

# B-column vector on the right
b = NULL
b = matrix(r,p,1)
b

# Solve(R,b) solves Rx=b, and gives x=R^(-1)b vector
phi.hat = NULL
phi.hat = solve(R,b)[,1]
phi.hat

# Variance estimation using Yule-Walker Estimator
c0 = acf(ar.process, type = 'covariance', plot = F)$acf[1]
c0

var.hat = c0*(1-sum(phi.hat*r))
var.hat

# Constant term in the model
phi0.hat = mean(rec)*(1-sum(phi.hat))
phi0.hat

# Displaying the coefficients
cat("Constant:", phi0.hat," Coefficients:", phi.hat, " and Variance:", var.hat, '\n')
#Constant: 7.033036  Coefficients: 1.331587 -0.4445447  and Variance: 94.17131

#------------------- END -------------------
  
# Johnson & Johnson Data - AR(4)

plot(JohnsonJohnson, main = 'Earnings per share', col = 'blue', lwd = 3)

# log-return of JohnsonJohnson
jj.log.return = diff(log(JohnsonJohnson))
jj.log.return.mean.zero = jj.log.return - mean(jj.log.return)

# Plots for log-return
par(mfrow = c(3,1))
plot(jj.log.return.mean.zero, main = 'Log-return Plot')
acf(jj.log.return.mean.zero, main = 'ACF')
pacf(jj.log.return.mean.zero, main = 'PACF')

# From PACF, we decide to go for AR(4)
p = 4

# Autocorrelation function
r = NULL
r[1:p] =  acf(jj.log.return.mean.zero, plot = F)$acf[2:(p+1)]
r

# matrix R
R = matrix(1, p, p) 

# Define non-diagonal entires of R
for(i in 1:p){
  for(j in 1:p){
    if(i!=j)
      R[i,j]=r[abs(i-j)]
  }
}
R

# B-column vector
b = matrix(r, p, 1)
b

phi.hat = solve(R, b)[,1]
phi.hat

# Variance estimation
c0 = acf(jj.log.return.mean.zero, type = 'covariance', plot = F)$acf[1]
c0
var.hat = c0*(1-sum(phi.hat*r))
var.hat

# Constant term in the model
phi0.hat = mean(jj.log.return)*(1-sum(phi.hat))
phi0.hat

cat("Constant:", phi0.hat," Coefficients:", phi.hat, " and Variance:", var.hat, '\n')
