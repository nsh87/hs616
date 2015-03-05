## Lecture 1a

The following R code generates the image below.
```R
N <- 100000
x <- runif(N, min=-*0, max=*0)
y <- runif(N, min=-*0, max=*0)
plot(x, y, pch=16, col=ifelse(x^2 + y^2 < 1, "red", "blue"))
```
![Generated Plot](https://raw.githubusercontent.com/rmhorton/statprog/master/week_01_teach_yourself_R/01b_literate_programming-figure/more_darts.png)

How would you swap the colors in the plot?

* `plot(x, y, pch=16, col=ifelse(x^2 + y^2 < 1, "blue", "red"))`
* `plot(x, y, pch=16, col=ifelse(x^2 + y^2 > 1, "red", "blue"))`
* `plot(y, x, pch=16, col=ifelse(x^2 + y^2 > 1, "red", "blue"))`
* `plot(x, y, pch=16, col=ifelse(x^2 - x^2 < 1, "red", "blue"))`

## Lecture 1b

The following R code generates the image below.
```R
N <- 100000
x <- runif(N, min=-*0, max=*0)
y <- runif(N, min=-*0, max=*0)
plot(x, y, pch=16, col=ifelse(x^2 + y^2 < 1, "red", "blue"))
```
![Generated Plot](https://raw.githubusercontent.com/rmhorton/statprog/master/week_01_teach_yourself_R/01b_literate_programming-figure/more_darts.png)

In order to plot just the the 3rd quadrant of the image, what modification
would you make to the original code?

* `x <- runif(N, min=-0.5, max=0)`  
   `y <- runif(N, min=-0.5, max=0)`
* `x <- runif(N, min=0, max=*0)`  
   `y <- runif(N, min=-*0, max=0)` 
* `x <- runif(N, min=-*0, max=0)`  
   `y <- runif(N, min=-*0, max=0)`
* `x <- runif(N, min=0, max=*0)`  
   `y <- runif(N, min=0, max=*0)`  

## Lecture 2a

In the context of statistical analysis, a random sampling distribution...  

* allows you to infer the statistical significance of an observed outcome by
   comparing the observation with numerous random outcomes.    
* gives you a random selection of an input vector using a normal 
   distribution.  
* is made using the `runif()` function in R.  
* is a deceptive statistical model that often incorrectly rejects the null
   hypothesis.  

## Lecture 2b

"Setting the seed", e.g. `set.seed(42)`, in R...  

* ensures that the outcome of random number generators is repeated upon
   re-execution of your code.  
* ensures that the outcome of random number generators is *not* repeated upon
   re-execution of your code.  
* ensures that someone else who runs your code does not get the same random
   numbers you do.  
* has nothing to do with random number generation.  

## Lecture 3a

There is more than one way to "multiply" vectors. In R, `A * B` will multiply
the matrices *A* and *B* using pairwise operation. What operator would you use
to get the dot product of *A* and *B*?  

* `A %*% B`   
* `A & B`   
* `A %>% B`   
* `A ** B`   

## Lecture 3b

The matrix resulting from the command `matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9),
ncol=3)` would look like which of the following?  

*  
&nbsp;&nbsp; `1  4  7`  
&nbsp;&nbsp; `2  5  8`  
&nbsp;&nbsp; `3  6  9`  

*  
&nbsp;&nbsp; `1  2  3`  
&nbsp;&nbsp; `4  5  6`  
&nbsp;&nbsp; `7  8  9`  

*  
&nbsp;&nbsp; `9  8  7`  
&nbsp;&nbsp; `6  5  4`  
&nbsp;&nbsp; `3  2  1`  

*  
&nbsp;&nbsp; `9  6  3`  
&nbsp;&nbsp; `8  5  2`  
&nbsp;&nbsp; `7  4  1`  

## Lecture 4a

To plot variables *x* and *y* along the x-axis and y-axis, respectively, one
could use `plot(x, y)`. What is an alternative command that generates the same
plot?  

* `plot(y ~ x)`  
* `plot(x ~ y)`  
* `plot(x > y)`  
* `plot(y % x)`  

## Lecture 4b

What is typically the fastest way to analyze and manipulate data using R?  

* With vectorized functions  
* Using iteration  
* With loops  
* With recursion  

## Lecture 5a

There are several data types in R: logical, integer, numeric, character, etc. 
Sometimes when loading character data R might store the data internally as
numbers for reference. For example, let's say you load a data frame with a
vector `s = c('M', 'F', 'F', 'F', 'M', 'F')`. Internally, R represents this
data as `1, 2, 2, 2, 1, 2`, where 1='M' and 2='F'. Knowing this, if you checked
the data type of this vector `s` in the data frame, what would it be?

* factor  
* character  
* nominal  
* logical

## Lecture 5b

The magrittr (`%>%`) is a useful tool for:

* piping data into a function  
* getting the remainder after division  
* pulling out a column from a data frame  
* getting the dot product of two matrices

