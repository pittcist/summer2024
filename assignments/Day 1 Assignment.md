### Day 1 Assignment

Create a new R notebook or script file in R-Studio named **StudentID_name_day1.rmd** or **StudentID_name_day1.r** 

Insert the following comments to the top of the file. Replace the blocked contents with your personal information.

```R
# Assignment 1
# <Today’s date>
# <Your name>
# <Your student ID>
```

### **Task 1** Observation

Work the following exercises and **observe** the output of the commands. What is the output of the following commands? Try to predict the solutions before you type in the commands. 

##### Define

```R
x = c(5,2,1,4)
xx = c(1,10,15,18)
y = rep(1,5)

z = c(TRUE,FALSE,TRUE,TRUE)
w = c("Marie","Betty","Peter") 
```

##### **Execute** the following commands and **observe** the output.

```R
sum(x) 
range(x)

length(y)
sum(y)

c(x,y,13)
xx - x
c(x,12) * y

1:6 + 1
1:9 + 1:2

x <= 2
x <= 2 & z 

substring(w,2,4) 
paste(substring(w,1,2),substring(w,5,5),sep="..")

cbind(x,xx)
cbind(2,6:1, rep(c(3,1,4),2), seq(1.1,1.6,by=0.1))
```

##### Let

```
a = c(1, 2, 4, 5, 6)
b = c(3, 2, 4, 1, 9)
```

##### Answer the following questions:

 What is the value of: `cbind(a, b)`?

 What is the value of: `rbind(a, b`)?

### **TASK 2 Problem Solving**

Create the following sequences using R commands.

1. (20, 19, …, 2, 1)

2. (1, 2, 3, …,19, 20, 19, 18, …, 2, 1) 

3. Create a vector of the values of $cos \theta$ at $\theta$ = 3, 3.1, 3.2, … ,6

4. Create the following vectors in R:

$$
\sum_{i=1}^{100}{\left(i^3+4i^2\right)}
$$

$$
\sum_{i=1}^{25}{\left(\frac{2^i}{i} + \frac{3^i}{i^2}\right)}
$$

5. Create a vector of integers from 1 to 1000. Remove all numbers divisible by 5. Then remove all numbers divisible by 7.

6. Generate the following matrix.

```r
[,1] [,2] [,3] [,4]

[1,] 1 101 201 301

[2,] 2 102 202 302

[3,] 3 103 203 303

[4,] 4 104 204 304

[5,] 5 105 205 305
```

7. Generate the following matrix.

```
[,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]

[1, ] 5 0 0 0 0 0 0 0 0 0

[2, ] 0 5 0 0 0 0 0 0 0 0

[3, ] 0 0 5 0 0 0 0 0 0 0

[4, ] 0 0 0 5 0 0 0 0 0 0

[5, ] 0 0 0 0 5 0 0 0 0 0

[6, ] 0 0 0 0 0 5 0 0 0 0

[7, ] 0 0 0 0 0 0 5 0 0 0

[8, ] 0 0 0 0 0 0 0 5 0 0

[9, ] 0 0 0 0 0 0 0 0 5 0

[10,] 0 0 0 0 0 0 0 0 0 5
```

8. Plot the following curve. You can assign any values to ***⍺*** and ***β***. Let ***θ*** vary from **-*π*** to ***π***. 

$$
x = (\alpha + \beta\theta)cos \theta 
$$

$$
y = (\alpha + \beta\theta)sin \theta
$$

Upload your R notebook or script file to Canvas by the beginning of tomorrow’s class.