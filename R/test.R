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
n <- structure(
  .Data = 1:10, 
  "dim" = c(2,5),
  "dimnames" = list(
    c("foo", "bar"), c("a", "b", "c", "d", "e")
    )
)
n
str(n)
class(n)
typeof(n)
# Two scalar arguments to specify rows and columns
o <- matrix(1:6, ncol = 3, nrow = 2)
# One vector argument to describe all dimensions
p <- array(1:12, c(2, 3, 2))
q = c(2,4,-1,2,0,1)  # note the order at which we entered the data
Q = matrix(q, nrow = 2)
dim(o)  # gets the dimensions of matrix o
o[2,1]  # subsets the item in row 2, column 1
o[2,]  # subsets all items in row 2
t(o)  # transposes matrix o
o %*% t(o) # multiplies matrix o by its transpose

df <- data.frame(
  id = 1:3, gender = c("m", "f", "m"), fbs = c(104, 98, 129)
)
str(df)
df
typeof(df)
class(df)
is.data.frame(df)
is.list(df)
source(config.R)
df <- read.csv(  # comma separated text
  file = paste0(  # the string concatenate function to make the address
    dir,  # the directory address of project files 
    "/data/df.csv"  # the relative address
    ), 
  fileEncoding = "UTF-8",
  header = TRUE  # column names
) 
df <- read.table(  # plain text document 
  file = paste0(dir, "/data/df.txt"), 
  fileEncoding = "UTF-8",
  header = TRUE  # column names
)
write.csv(  # comma separated text
  x = df,
  file = paste0(dir, "/output/df.csv"),
  fileEncoding = "UTF-8"
)
write.table(  # plain text document 
  x = df,
  file = paste0(dir, "/output/df.txt"),
  fileEncoding = "UTF-8",
  sep = "|",  # separator character
  col.names = TRUE  # column names
)
