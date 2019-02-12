##### Here, I write some useful codes for more effective programming in R
### Defining Functions Using "." and %>%
require('magrittr')
## x %>% f is equivalent for f(x)
# we want to write f(x) = sin(cos(x))
f <- . %>% cos %>% sin
# Instead of the function written below

f <- function(x) {
      y <- cos(x)
      z <- sin(y)
      z
}

# a function that would sample n random rows of a data frame d
d <- data.frame(x = rnorm(100), y = rnorm(100))  # example dataframe

subsample_rows <- function(d, n) {
rows <- sample(nrow(d), n)
d[rows,]
}

# write as below
d %>% subsample_rows(n = 3)

## The magical “.” argument
d %>% lm(y ~ x, data = .)
rnorm(4) %>% data.frame(x = ., is_negative = . < 0)
rnorm(4) %>% data.frame(x = ., y = abs(.))
rnorm(4) %>% data.frame(x = sin(.), y = cos(.))

### lambda expressions >>> anonymous functions
x <- rnorm(20)  # defining x variable for example
y <- x + rnorm(20)  # defining y variable for example
  #now the anonymous function:
data.frame(x, y) %>% {
  plot(y ~ x, data = .)
  abline(lm(y ~ x, data = .))
}

### Operator %$% instead of %>%
d <- data.frame(x = rnorm(10), y = 4 + rnorm(10))  # example dataframe
d %>% {data.frame(mean_x = mean(.$x), mean_y = mean(.$y))}  # ordinary coding
d %$% data.frame(mean_x = mean(x), mean_y = mean(y))  # shorter code

### Tee Operations with The Tee Operator
# The tee operator works exactly like %>%, but it returns the left-hand side
# value rather than the potential result of the right-hand side operations.
# In other words, functions like plot() typically don't return anything.
# T hat means that, after calling plot(), for example, your pipeline would end
# However, in the following example, the tee operator %T>% allows you to
# continue your pipeline even after you have used plot()
set.seed(123)
rnorm(200) %>%
matrix(ncol = 2) %T>%
plot %>%
colSums
