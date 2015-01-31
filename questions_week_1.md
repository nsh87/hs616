Answer Questions 1 and 2 using the following scenario:

The following R code generates the image below.
```R
N <- 100000
x <- runif(N, min=-1.0, max=1.0)
y <- runif(N, min=-1.0, max=1.0)
plot(x, y, pch=16, col=ifelse(x^2 + y^2 < 1, "red", "blue"))
```
![Generated Plot](https://raw.githubusercontent.com/rmhorton/statprog/master/week_01_teach_yourself_R/01b_literate_programming-figure/more_darts.png)

Question 1:  
How would you swap the colors in the plot?

1. `plot(x, y, pch=16, col=ifelse(x^2 + y^2 > 1, "red", "blue"))`
2. `plot(x, y, pch=16, col=ifelse(x^2 + y^2 > 1, "blue", "red"))`
3. `plot(x, y, pch=16, col=ifelse(x^2 - x^2 < 1, "red", "blue"))`
4. `plot(x, y, pch=16, col=ifelse(x^2 + y^2 < 1, "blue", "red"))`

Question 2:  
In order to plot just the the 3rd quadrant of original image, what modification would you make to the original code?

1. `x <- runif(N, min=0, max=1.0)`  
   `y <- runif(N, min=-1.0, max=0)` 
2. `x <- runif(N, min=-1.0, max=0)`  
   `y <- runif(N, min=-1.0, max=0)`
3. `x <- runif(N, min=0, max=1.0)`  
   `y <- runif(N, min=0, max=1.0)`  
4. `x <- runif(N, min=-0.5, max=0)`  
   `y <- runif(N, min=-0.5, max=0)`