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
df <- read.csv(  # comma separated text
  file = "/home/maanib/Documents/rprojects/teacheR/data/df.csv",
  fileEncoding = "UTF-8",
  header = TRUE  # column names
) 
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
p <- c(1, 2, NA, 25, 16)
mean(p, na.rm = TRUE)
df
df[2, 4]  # subsets the element in row 2 column 4
df[ , 3]  # subsets the elements in column 3 
df$id  # subsets all elements of id field
df[ which(df$gender == "m"), ]  # subsets male gender 
subset(  # subsets the element in row 2 column 4
  df, 
  row.names(df) == 2, 
  select = 4
) 
subset(df, select = 3) # subsets the elements in column 3 
subset(df,  select = "id")  # subsets all elements of id field
subset(df, gender == "m")  # subsets male gender 

is.integer(6L)
df$diabetes <- 0
for (i in 1:length(df$id)) {
  if (df$fbs[i] < 100) {
    df$diabetes[i] <- "Normal"
  } else if (df$fbs[i] >= 100 & df$fbs[i] < 125) {
    df$diabetes[i] <- "Prediabetes"
  } else {
    df$diabetes[i] <- "Diabetes"
  }
}
df
i <- 1
while (i < 6) {
  print(i)
  i = i + 1
}
for (val in x) {
  if (val == 3) {
    next
  }
  print(val)
}
x <- 1:5
for (val in x) {
  if (val == 3) {
    break
  }
  print(val)
}

x <- 1
repeat {
  print(x)
  x = x + 1
  if (x == 6) {
    break
  }
}
cent.to.inch <- function(x) {
  inch <- x * 0.393701
  return(inch)
} 
cent.to.inch(20)
summary(iris)  # summary of all variables
summary(cars$speed)  # summary of one variable
cor(trees$Girth, trees$Volume)
cor(trees$Girth, trees$Volume, method = "spearman")
r <- cor.test(trees$Girth, trees$Volume)
pvalue(
  r$p.value, 
  accuracy = 0.0001, 
  decimal.mark = ".", 
  add_p = TRUE
)
# First make a vector of Z-scores
z_scores <- seq(-3, 3, by = 0.1)
# Remember for dnorm the default value for mean is 0 and for sd is 1.
dvalues <- dnorm(z_scores)
plot(  # Plot where y = values and x = index of the value in the vector
  dvalues,
  xaxt = "n",  # Don't label the x-axis
  type = "l",  # Make it a line plot
  main = "pdf of the Standard Normal", 
  xlab = "Z-score"
) 
# These commands label the x-axis
axis(1, at = which(dvalues == dnorm(0)), labels = c(0))
axis(1, at = which(dvalues == dnorm(1)), labels = c(-1, 1))
axis(1, at = which(dvalues == dnorm(2)), labels = c(-2, 2))

pvalues <- pnorm(z_scores)
plot(
  pvalues,
  xaxt = "n",
  type = "l",
  main = "cdf of the Standard Normal",
  xlab = "Quantiles",
  ylab = "Probability Density"
) 

# These commands label the x-axis
axis(1, at = which(pvalues == pnorm(-2)), labels = round(pnorm(-2), 2))
axis(1, at = which(pvalues == pnorm(-1)), labels = round(pnorm(-1), 2))
axis(1, at = which(pvalues == pnorm(0)), labels = c(.5))
axis(1, at = which(pvalues == pnorm(1)), labels = round(pnorm(1), 2))
axis(1, at = which(pvalues == pnorm(2)), labels = round(pnorm(2), 2))
n10 <- rnorm(10, mean = 70, sd = 5)
n100 <- rnorm(100, mean = 70, sd = 5)
n10000 <-  rnorm(10000, mean = 70, sd = 5)
par(mfrow = c(1, 3))
hist(n10, breaks = 5)
hist(n100, breaks = 20)
hist(n10000, breaks = 100)
shapiro.test(iris$Sepal.Width)
hist(iris$Sepal.Width, freq = FALSE)
curve(
  dnorm(x, mean(iris$Sepal.Width), sd(iris$Sepal.Width)),
  add = TRUE
)

str(infert)
help(infert)
infert.labels <- list("0" = "Control", "1" = "Case")
infert$status <- dplyr::recode(infert$case, !!!infert.labels)
infertility.table <- table(
  infert$status, (infert$induced + infert$spontaneous)
)

chisq.test(infertility.table)
fit <- glm(
  case ~ induced + spontaneous,
  family = binomial(link = logit),  # logistic regression
  data = infert
)
summary(fit)

fit$rsquare <- 1 - (fit$deviance/fit$null.deviance)
table.coefficients <- summary(fit)$coefficients
install.packages("questionr")
require("questionr")
odds.ratio(fit)
iris2 <- iris[iris$Species %in% c(
  "versicolor", "virginica"
), ]
iris2 <- subset(
  iris, Species == "versicolor" | Species == "virginica"
)
t.test(Sepal.Width ~ Species, data = iris2)
levels(PlantGrowth$group)
boxplot(weight ~ group, data = PlantGrowth)
anova(aov(weight ~ group, data = PlantGrowth))
TukeyHSD(aov(weight ~ group, data = PlantGrowth))


