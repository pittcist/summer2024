# Day 2 Notes
# 2024-07-09

# Shift-command-C for mac
# Shift-Windows-C for Windows

# Set up work directory

setwd("/Users/kwang/GitHub/summer2024/r_repo")

# To execute a line, press command-enter（ctrl-enter in Windows)

# Read data from jinan_weather.csv

dt = read.csv(file = "jinan_weather.csv", header=TRUE)
max(dt$TMAX)

# Class Exercise
# Read data from family.csv
# Plot the relationship between age and income

family = read.csv(file = "family.csv", header = TRUE)
age = family$AGE
income = family$INCOME
plot(age, income)


# Output results to external files
# Sink
sink(file = "output.txt", append = TRUE)  # TRUE means adding to the end
v = c(1:100)
v
sink()

# Export to PDF or PNG
pdf("output.pdf")
plot(age, income)
dev.off()

png("output.png")
plot(age, income)
dev.off()

# R functions

myfun = function(x){
  y = 3*x**2 + 2*x + 5
  return(y)
}

myfun(5)

x = seq(-100, 100, 0.1)
y = myfun(x)
plot(x,y)

# The apply function in R (repetition function)
mat = matrix(1:30, nrow = 6, ncol = 5)
mat

# Calculate the means by row and by column
apply(X=mat, 1, mean)  # 1 applies to rows; 2 applies to columns
apply(X=mat, 2, mean)

apply(X=mat, 1, myfun)

# Matrix tips
m = matrix(0, nrow = 6, ncol = 6)
m

x = c(1, 3, 2, 1, 5, 2, 3) # row numbers
y = c(4, 2, 5, 3, 1, 3 ,2) # column numbers
v = c(34, 23, 31, 6, 45, 29, 43) # fill-in values

m[cbind(x,y)] = v
m

# Plotting
# sin(x)/x
x = seq(-2*pi, 2*pi, 0.001)
y = sin(x)/x
plot(x, y, col="green")

# Ellipse (oval)
png("oval.png")
a = 5
b = 10
t = seq(-3*pi, 3*pi, 0.001)
x = a * cos(t)
y = b * sin(t)

plot(x,y, col="blue")
dev.off()

# Heart for Love
png("output.png")
t = seq(-pi, pi, 0.001)
x = 16 * sin(t) ** 3
y = 13 * cos(t) - 5 * cos(2*t) - 2 * cos(3*t) - cos(4*t)
plot(x,y, col="red")
dev.off()

# Random Numbers
# uniform distribution

x1 = runif(n = 1000, min = 1, max = 100)
x1
hist(x1)

# normal distribution
x2 = rnorm(n = 1000, mean = 50, sd = 15)
x2
hist(x2)

# R sampling
x3 = sample(1:1000, 20, replace = TRUE)
x3 

# Simulate two dice drawing
dice1 = c(1:6)
dice2 = c(1:6)
s1 = sample(dice1, 1)
s2 = sample(dice2, 1)
s1
s2
s1+s2

dice_odd = function(n, d){
  dice1 = c(1:6)
  dice2 = c(1:6)
  r1 = c()
  r2 = c()
  for(i in 1:n){
    r1 = c(r1, sample(dice1, 1))
    r2 = c(r2, sample(dice2, 1))
  }
  r3 = r1 + r2
  return(sum(r3 > d) / n)
}

dice_odd(1000, 10)

# Estimate Pi

est_pi = function(n){
  x = runif(n, 0, 1)
  y = runif(n, 0, 1)
  d = sqrt(x**2 + y**2)
  p = sum(d<1) / n
  return(4*p)
}

est_pi(1e8)

# Class Exercise
# Estimate the odd between -1 sd and 1 sd in a normal distribution
# Generate a normal distributed data set with mean = 0 and sd = 10
# Count the total number of occurances between -10 and 10

est_norm = function(n){
  d = rnorm(n, mean = 0, sd = 10)
  s = sum(d >= -10 & d <= 10)
  return (s/n)
}

est_norm(100000)

# install.packages("moments")
library(moments)
dt = runif(1000, 1, 10)
dt
hist(dt)

dt = rnorm(1000, mean=50, sd=15)

weather = read.csv(file="jinan_weather.csv")
dt = weather$TAVG
skewness(dt)
kurtosis(dt)
hist(dt)

# Simulating the central limit theorm

# Population size
n = 10000

# Sample size
s = 30

# Sampling frequency
f = 5000

# Make a population
# population = runif(n, 1, 100)
population = rexp(n)

hist(population)
skewness(population)
kurtosis(population)

central = function(size, freq){
  means = c()
  for(i in 1:freq){
    samp = sample(population, size, replace = TRUE)
    m = mean(samp)
    means = c(means, m)
  }
  return(means)
}

sample_means = central(s, f)
hist(sample_means)
skewness(sample_means)
kurtosis(sample_means)

