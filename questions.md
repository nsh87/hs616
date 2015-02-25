## Lecture 1a

Answer Questions 1 and 2 using this scenario:

The following R code generates the image below.
```R
N <- 100000
x <- runif(N, min=-1.0, max=1.0)
y <- runif(N, min=-1.0, max=1.0)
plot(x, y, pch=16, col=ifelse(x^2 + y^2 < 1, "red", "blue"))
```
![Generated Plot](https://raw.githubusercontent.com/rmhorton/statprog/master/week_01_teach_yourself_R/01b_literate_programming-figure/more_darts.png)

How would you swap the colors in the plot?

1. `plot(x, y, pch=16, col=ifelse(x^2 + y^2 < 1, "blue", "red"))`
2. `plot(x, y, pch=16, col=ifelse(x^2 + y^2 > 1, "red", "blue"))`
3. `plot(y, x, pch=16, col=ifelse(x^2 + y^2 > 1, "red", "blue"))`
4. `plot(x, y, pch=16, col=ifelse(x^2 - x^2 < 1, "red", "blue"))`

In order to plot just the the 3rd quadrant of original image, what modification
would you make to the original code?

1. `x <- runif(N, min=-0.5, max=0)`  
   `y <- runif(N, min=-0.5, max=0)`
2. `x <- runif(N, min=0, max=1.0)`  
   `y <- runif(N, min=-1.0, max=0)` 
3. `x <- runif(N, min=-1.0, max=0)`  
   `y <- runif(N, min=-1.0, max=0)`
4. `x <- runif(N, min=0, max=1.0)`  
   `y <- runif(N, min=0, max=1.0)`  

## Lecture 2a

In the context of statistical analysis, a random sampling distribution...  
1. allows you to infer the statistical significance of an observed outcome by
   comparing the observation with numerous random outcomes.    
2. gives you a random selection of an input vector using a normal 
   distribution.  
3. is made using the `runif()` function in R.  
4. is a deceptive statistical model that often incorrectly rejects the null
   hypothesis.  

## Lecture 2b

"Setting the seed", e.g. `set.seed(42)`, in R...  
1. ensures that the outcome of random number generators is repeated upon
   re-execution of your code.  
2. ensures that the outcome of random number generators is *not* repeated upon
   re-execution of your code.  
3. ensures that someone else who runs your code does not get the same random
   numbers you do.  
4. has nothing to do with random number generation.  

## Lecture 3a

There is more than one way to "multiply" vectors. In R, `A * B` will multiply
the matrices *A* and *B* using pairwise operation. What operator would you use
to get the dot product of *A* and *B*?  
1. `A %*% B`   
2. `A & B`   
3. `A %>% B`   
4. `A ** B`   

## Lecture 3b

The matrix resulting from the command `matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9),
ncol=3)` would look like which of the following?  
1.  
&nbsp;&nbsp; `1  4  7`  
&nbsp;&nbsp; `2  5  8`  
&nbsp;&nbsp; `3  6  9`  
2.  
&nbsp;&nbsp; `1  2  3`  
&nbsp;&nbsp; `4  5  6`  
&nbsp;&nbsp; `7  8  9`  
3.  
&nbsp;&nbsp; `9  8  7`  
&nbsp;&nbsp; `6  5  4`  
&nbsp;&nbsp; `3  2  1`  
4.  
&nbsp;&nbsp; `9  6  3`  
&nbsp;&nbsp; `8  5  2`  
&nbsp;&nbsp; `7  4  1`  

## Lecture 4a

To plot variables *x* and *y* along the x-axis and y-axis, respectively, one
could use `plot(x, y)`. What is an alternative command that generates the same
plot.  
1. `plot(y ~ x)`  
2. `plot(x ~ y)`  
3. `plot(x > y)`  
4. `plot(y % x)`  

## Lecture 4b

What is typically the fastest way to analyze and manipulate data using R?  
1. With vectorized functions  
2. Using iteration  
3. With loops  
4. With recursion  
