# Autoregressive processes simulation - AR(1)

set.seed(2020)
N = 1000
phi = 0.4
Z = rnorm(N,0,1)
X = NULL

X[1] = Z[1]

for(t in 2:N) {
  X[t] = Z[t] + phi*X[t-1]
}

X.ts = ts(X)

par(mfrow = c(2,1))

plot(X.ts, main = 'AR(1) Time Series on White Noise, phi = 0.4')

X.acf = acf(X.ts, main = 'AR(1) Time Series on White Noise, phi = 0.4')

# Autoregressive processes simulation - AR(2)

X.ts <- arima.sim(list(ar = c(.7,.2)), n=1000)

par(mfrow = c(2,1))

plot(X.ts, main = 'AR(2) Time Series on White Noise, phi1 = 0.7, phi2 = 0.2')

X.acf = acf(X.ts, main = 'AR(2) Time Series on White Noise, phi1 = 0.7, phi2 = 0.2')
