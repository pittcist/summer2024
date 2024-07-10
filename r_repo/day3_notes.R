# Day 3 Notes
# 2024-07-10

# Assignment from yesterday

# Task 2 Matrix

# Solution 1 - using loops
i = 10
mat = matrix(0, nrow = i,ncol = i)
for (n in c(1:i)){
  for (m in c(1:i)){
    d = n**2 + m**2
    mat[n,m] = d
  }
}
mat

# Solution 2 - without loops
i = 10
x = rep(1:i, i)
x
y = rep(1:i, rep(i,i))
y
v = x**2 + y**2
v
mat = matrix(0, nrow = i, ncol = i)
mat[cbind(x,y)] = v
mat

# Task - stock price simluation
days = 300
t = c(1:days)
change = rnorm(days, mean=0.999, sd=0.02)
prices = rep(0, days)

prices[1] = 10
for(i in 2:days){
  prices[i] = prices[i-1] * change[i]
}
prices
plot(t, prices, type="l")  # l means lines

# R statistics

# t-test
mtcars
m4 = mtcars[mtcars$cyl == 4, 1]
m4

m6 = mtcars[mtcars$cyl == 6, 1]
m6

mean(m4)
mean(m6)
t.test(m4,m6)
# if p < 0.05, there is a significant difference between 4 and 6 cyl cars in terms of MPG

# t-test with categorical variables
library(MASS)
sleep
t.test(extra ~ group, sleep)

# p = 0.07939 (> 0.05), there's no significant difference between Group 1 and Group 2 in terms of sleep hours

g1 = sleep[sleep$group == 1, 1]
g2 = sleep[sleep$group == 2, 1]
mean(g1)
mean(g2)
sd(g1)
sd(g2)
t.test(g1, g2)

# ANOVA
mtcars
fit = aov(data = mtcars, mpg ~ cyl)
fit
summary(fit)

# Regression

setwd("/Users/kwang/GitHub/summer2024/r_repo")

# Supermodel - salary
# supermodel.csv saved under the datasets directory

# For macOS
supermodel = read.csv(file = "../datasets/Supermodel.csv")  # For Windows, replace / with \\
supermodel

model = lm(data = supermodel, salary ~ age + years + beauty)
model
summary(model)

# tidyverse and dplyr

# dplyr is a package for data manipulation and exploration

install.packages("tidyverse")

# Packages included in tidyverse:
#   
# Core tidyverse
# dplyr - data manipulation
# ggplot2 - data visualization
# tidyr - data clean up
# readr - data import (from csv, tab, excel, etc.)
# purrr - functional programming
# tibble - data frame (tables)
# stringr - string operations
# forcats - factors 

library(tidyverse)
library(dplyr)

dt = read.csv("../datasets/incomebystates.csv")
dt

view(dt)
head(dt)
tail(dt)
colnames(dt)

# Slice
dt[3:6,3:5]
slice(dt, 14:18)
slice_head(dt, n=10)
slice_tail(dt, n=5)
slice_sample(dt, n=6)

# The pipe operation in tidyverse - %>%
dt %>% slice(14:18) %>% slice(2:4) %>% select(Y2003)
dt %>% slice(33) %>% select(Y2006, Y2007, Y2008)

dt$Index
dt %>% distinct(Index)

cols = c("Y2002", "Y2004", "Y2008")
dt %>% select(cols)
dt %>% select(all_of(cols))

dt %>% select(starts_with("Y"))
dt %>% select(starts_with("Y200"))

# Sort

dt %>% select("State") %>% arrange(desc(State))

# Filter
dt %>% filter(Index == "A")
dt %>% filter(Index %in% c("A", "C", "F"))
dt %>% filter(Index %in% c("A", "C", "F") & Y2002 < 1500000)

dt %>% filter(grepl("Ar", State))

# Group by
dt %>% group_by(Index) %>% summarise(count=n())
dt %>% group_by(Index) %>% summarise(mean(Y2002))

# JiebaR chinese language segmentation

install.packages("jiebaR")
library(jiebaR)

reviews = read.csv("../datasets/reviews.csv")
seg = worker(user="user", stop_word="../datasets/stopwords.txt")
Output_words = segment(reviews$绩效评语, seg)
Output_words
Output_words_df = enframe(Output_words)
Output_words_df = as.data.frame(Output_words)
Output_words_df

# Get the frequency of each unique word

word_freq = Output_words_df %>%
  group_by(value) %>%
  summarize(freq = n(), pos = unique(name)) %>%
  arrange(desc(freq))

result = word_freq[1:1000, c("value", "pos", "freq")]
result

