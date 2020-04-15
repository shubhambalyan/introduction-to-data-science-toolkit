# Partial Auto Correlation Function - PACF

# Clear the workspace
rm( list=ls( all = TRUE ) )
par(mfrow=c(3,1))

# AR(2)
phi.1 = .6; phi.2 = .2; 
data.ts = arima.sim(n = 500, list(ar = c(phi.1, phi.2)))
plot(data.ts, main=
       paste("Autoregressive Process with phi1=",phi.1," phi2=",phi.2) )
acf(data.ts, main="Autocorrelation Function")

#PACF
acf(data.ts, type="partial", main="Partial Autocorrelation Function")

# AR(p) has a PACF that cuts off after p lags.

# Regression Example: bodyfat

install.packages("isdals")
library(isdals)
data("bodyfat")
attach(bodyfat)
pairs(cbind(Fat, Triceps, Thigh, Midarm))

cor(cbind(Fat, Triceps, Thigh, Midarm))

#            Fat   Triceps     Thigh    Midarm
#Fat     1.0000000 0.8432654 0.8780896 0.1424440
#Triceps 0.8432654 1.0000000 0.9238425 0.4577772
#Thigh   0.8780896 0.9238425 1.0000000 0.0846675
#Midarm  0.1424440 0.4577772 0.0846675 1.0000000

# Prediction 1 - Partial Out effect of Thigh on Fat and Triceps

Fat.hat = predict(lm(Fat~Thigh))
Triceps.hat = predict(lm(Triceps~Thigh))
cor((Fat-Fat.hat),(Triceps-Triceps.hat))

# Prediction 2 - partial out effect of thigh and midarm on fat and triceps

Fat.hat = predict(lm(Fat~Thigh+Midarm))
Triceps.hat = predict(lm(Triceps~Thigh+Midarm))
cor((Fat-Fat.hat),(Triceps-Triceps.hat))

