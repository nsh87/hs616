## Lecture 1a

Answer Questions 1 and 2 using this scenario:

The following R code generates the image below.
```R
N <- 100000
x <- runif(N, min=-1.0, max=1.0)
y <- runif(N, min=-1.0, max=1.0)
plot(x, y, pch=16, col=ifelse(x^2 + y^2 < 1, "red", "blue"))
```
![Generated Plot](https://raw.githubusercontent.com/rmhorton/statprog/master/\
week_01_teach_yourself_R/01b_literate_programming-figure/more_darts.png)

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

A random sampling distribution...  
1. allows you to infer the statistical significance of an observed outcome by
   comparing the observation with numerous random outcomes.    
2. gives you a random selection of an input vector using a normal 
   distribution.  
3. is made using the `runif()` function in R.  
4. is a deceptive statistical model that often incorrectly rejects the null
   hypothesis.  

## Lecture 2b

"Setting the seed", e.g. `set.seed(42)`, ...  
1. ensures that the outcome of random number generators is repeated upon
   re-execution of your code.  
2. ensures that the outcome of random number generators is *not* repeated upon
   re-execution of your code.  
3. ensures that someone else who runs your code does not get the same random
   numbers you do.  
4. has nothing to do with random number generation.  

