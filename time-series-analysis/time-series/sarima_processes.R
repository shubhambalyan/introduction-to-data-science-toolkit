# SARIMA processes

# SARIMA(0,0,1,0,0,1)-12

x = NULL
z = NULL
n = 10000

z = rnorm(n)
x[1:13] = 1

for(i in 14:n){
  x[i]<-z[i]+0.7*z[i-1]+0.6*z[i-12]+0.42*z[i-13]
}

par(mfrow = c(2,1))
plot.ts(x[12:120], main = 'The first 10 months of simulation SARIMA(0,0,1,0,0)_12') 

acf(x, main='SARIMA(0,0,1,0,0,1)_12 Simulation')
# Autocorrelation observed at lag 11 also along with lag 12 due to seasonality

# ----------------------- J&J Dataset ----------------------
library(astsa)

d = 1
DD = 1
per = 4

# SARIMA(p,1,q,P,1,Q)-4: different values for p,q,P,Q
for(p in 1:2){
  for(q in 1:2){
    for(i in 1:2){
      for(j in 1:2){
        if(p+d+q+i+DD+j<=10){
          model<-arima(x=log(jj), order = c((p-1),d,(q-1)), seasonal = list(order=c((i-1),DD,(j-1)), period=per))
          pval<-Box.test(model$residuals, lag=log(length(model$residuals)))
          sse<-sum(model$residuals^2)
          cat(p-1,d,q-1,i-1,DD,j-1,per, 'AIC=', model$aic, ' SSE=',sse,' p-VALUE=', pval$p.value,'\n')
        }
      }
    }
  }
}


library(astsa)

sarima(log(jj), 0,1,1,1,1,0,4)

# Forecast the next two years
plot(forecast(model))

# Print the forecast
forecast(model)

# ------------------ Milk Production Dataset -------------------

milk<-read.csv('C:/Users/Shubham Balyan/introduction-to-data-science-toolkit/time-series-analysis/time-series/monthly-milk-production-pounds-p.csv')
Milk<-milk$Milk
library(astsa)
sarima(Milk,0,1,0,0,1,1,12)

