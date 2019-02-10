print("hello world")
help("boxplot")
?boxplot
example("boxplot")
weight <- 72
height <- 182
BMI <- (weight)/(height/100)^2
BMI
mean(x = 1:100, na.rm = TRUE)
BMI <- function(weight, height) {
    if (height > 2.5) {
        stop('height is not in meters')
    } else (weight)/(height)^2
}

a <- 8.4
b <- "foo"
str(a)
class(b)
typeof(a)

dbl_var <- c(1, 2.5, 4.5)
# With the L suffix, you get an integer rather than a double
int_var <- c(1L, 6L, 10L)
# Use TRUE and FALSE (or T and F) to create logical vectors
log_var <- c(TRUE, FALSE, T, F)
chr_var <- c("foo", "bar")

typeof(dbl_var)
is.numeric(dbl_var)
is.double(dbl_var)
typeof(int_var)
is.numeric(int_var)
is.integer(int_var)
typeof(log_var)
typeof(chr_var)
is.atomic(int_var)
class(dbl_var)
class(int_var)
class(log_var)
class(chr_var)
c <- c("a", 1)
str(c)
is.vector(c)
is.atomic(c)
is.character(c)
is.factor(c)

d <- list(
    1:10,
    "foo",
    c(TRUE, FALSE, TRUE, TRUE),
    c(7.2, 16.8)
    )
str(d)
e <- list(
    list(
        list(
            list(
                1:10
            )
        )
    )
)
e <- list(list(list(list(1:10))))
str(e)
f <- list(
    "foo", list(
        "bar", list(
            "spam", list(
                "eggs", 1:10
            )
        )
    )
)

str(f)
is.vector(f)
is.atomic(f)
is.recursive(f)
is.list(f)

g <- list(
    list(1, 2),
    c(3, 4)
)
h <- c(
    list(1, 2),
    c(3, 4)
)
str(g)
str(h)
typeof(g)
class(g)

ls()

i <- 1:10
attr(i, "description") <- "This is a vector"
i

i <- structure(
  1:10, 
  description = "This is a vector", 
  label = "id of people"
)
i
str(i)
typeof(i)
attr(i, "label") 
j <- c(a = 1, b = 2, c = 3)
j
x <- 1:10
k <- structure(
  1:4, 
  "names" = c("a", "b", "c", "d")
)
k
str(k)
l <- c(
  a = 1, b = 2, c = 3, d = 4
)
l
str(l)
typeof(l)
m <- factor(
  x = c(0, 1, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0),
  levels = c(0, 1),
  labels = c("male", "female")
)
str(m)
typeof(m)
class(m)
summary(m)
x <- factor(c("a", "b", "b", "a"))
str(x)
typeof(x)
class(x)
summary(x)
l <- structure(1:10, "dim" = c(2,5))



