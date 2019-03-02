a <- c(4, 6, 2, 5)
b <- c(8, 1, 3, 7)
c <- c(6, 3, 1, 3)
d <- c(7, 5, 7, 5)
e <- c(9, 2, 6, 1)
f <- c(4, 6, 4, 5)

df1 <- data.frame(a, b, c, d, e, f)
df2 <- data.frame(a, b, e, f)
al <- data.frame(a, b, c, d, e, f)

corrmatrix <- cor(al)
head(round(corrmatrix,3))
counts <- c("Dog", "Cat", "Dog", "Dog", "Cat", "Mouse")

library(ggplot2)
ggplot(data = as.data.frame(counts), aes(x = counts)) + geom_bar()
q1 <- read.csv(  # comma separated text
  file = paste0(  # the string concatenate function to make the address
    dir,  # the directory address of project files 
    "/data/q1.csv"  # the relative address
  ), 
  fileEncoding = "UTF-8",
  header = TRUE  # column names
) 
View(q1)
cols = grepl("Camp", names(q1))
rows = rowSums(q1[, cols] == "A" | q1[, cols] == "B" | is.na(q1[, cols])) == sum(cols)
q1 <- q1[rows, ]
install.packages("stringr")
library(stringr)
?stringr


rollz<-function(x,y){
  avg=rollapply(x, y, mean)
  std=rollapply(x, y, sd)
  z=(x-avg)/std
  return(z)
}
rm(ls(envir=globalenv()))
q2 <- read.csv(  # comma separated text
  file = paste0(  # the string concatenate function to make the address
    dir,  # the directory address of project files 
    "/data/q2.csv"  # the relative address
  ), 
  fileEncoding = "UTF-8",
  header = TRUE  # column names
) 
except <- c("a", "b", "c", "d")
pattern = "df"
rm.except <- function(except, pattern) {
  except = except
  pattern = pattern
  formula = c(c(except), ls(pattern = pattern, envir = .GlobalEnv))
  rm(list = setdiff(ls(envir = .GlobalEnv), formula), envir = .GlobalEnv)
}

rm.except(except = c("a", "b", "c", "d"), pattern = "df")
df$sex
lm1 <- lm(tg ~ age + chol + sex, data = df)
lm1 <- lm(a ~  b + c + d)
coeftest(lm1, vcov = vcovHC(lm1, type = "HC1"))
ls(pattern = "df", envir = .GlobalEnv)
clean <- function(except, fun = rm, ...) {
  sapply(
    simplify = FALSE,  # sapply(simplify=T) better, elements named
    except,  # loop on vector of except object names
    function(except) {  # create a formula with outcome and grouping var.
      formula <- unlist(paste(except))
      fun(
        formula
      )
    }
  )
}
clean(except = c("a", "b", "c", "d"))


View(q2)
library(tidyr)
library(dplyr)
q2 %>% spread(s, v) %>% group_by(t) 
rm(list = ls())
rm.ls <- function(args = NULL) {
  exceptions = c("q1", "q2")
  ls.df <- data.frame(x = ls())
  ls.delete <- subset(ls.df, !(x %in% exceptions))
  ls.delete.list <- ls.delete$x
  rm(list = ls.delete$x)
} 


# rm.ls(exceptions = list("q1", "q2"))
if (length(setdiff(rm.except, (ls()))) > 0) {
  install.packages(setdiff(rm.except, (ls())))
} 
q3 <- read.csv(  # comma separated text
  file = paste0(  # the string concatenate function to make the address
    dir,  # the directory address of project files 
    "/data/q3.csv"  # the relative address
  ), 
  fileEncoding = "UTF-8",
  header = TRUE  # column names
) 
View(q3)
t.test(data = q3, age ~ sex)
df <- data.frame(
  sex = c("M", "F", "M", "F", "M", "F"),
  age = c(60, 26, 33, 27, 34, 81),
  chol = c(194, 126, 256, 183, 243, 97),
  tg = c(208, 82, 154, 84, 170, 54)
)
multiple.t.test <- function(df, )
results.list <- lapply(
  X = df[,c("age", "chol", "tg")], 
  FUN = function(x) t.test(
    x ~ df$sex, var.equal = TRUE, paired = FALSE
    )
  )
results.df <- data.frame(
  VARNAME = c("age", "chol", "tg"),
  F.mean = c(
    mean(df[df$sex == "F", ]$age, na.rm = TRUE),
    mean(df[df$sex == "F", ]$chol, na.rm = TRUE),
    mean(df[df$sex == "F", ]$tg, na.rm = TRUE)
  ),
  M.mean = c(
    mean(df[df$sex == "M", ]$age, na.rm = TRUE),
    mean(df[df$sex == "M", ]$chol, na.rm = TRUE),
    mean(df[df$sex == "M", ]$tg, na.rm = TRUE)
  ),
  t = c(results.list$age$statistic, results.list$chol$statistic, results.list$tg$statistic),
  df = c(results.list$age$parameter, results.list$chol$parameter, results.list$tg$parameter),
  p = c(results.list$age$p.value, results.list$chol$p.value, results.list$tg$p.value)
)

View(results.df)



multi.tests <- function(fun = t.test, df, vars, group.var, ...) {
  sapply(
    simplify = FALSE,  # sapply(simplify=T) better, elements named
    vars,  # loop on vector of outcome variable names
    function(var) {  # create a formula with outcome and grouping var.
           formula <- as.formula(paste(var, "~", group.var))
           fun(  # perform test with a given fun, default t.test
             data = df, formula, ...
             ) 
           }
  )
}
res.multi.t.tests <- multi.tests(
  fun = t.test,
  df = df,
  vars = c("age","chol","tg"),
  group.var = "sex",
  var.equal = TRUE
)
  

data.frame(
  test = sapply(res.multi.t.tests, getElement, name = "data.name"),
  F.mean = c(
    mean(df[df$sex == "F", ]$age, na.rm = TRUE),
    mean(df[df$sex == "F", ]$chol, na.rm = TRUE),
    mean(df[df$sex == "F", ]$tg, na.rm = TRUE)
  ),
  M.mean = c(
    mean(df[df$sex == "M", ]$age, na.rm = TRUE),
    mean(df[df$sex == "M", ]$chol, na.rm = TRUE),
    mean(df[df$sex == "M", ]$tg, na.rm = TRUE)
  ),
  t = sapply(res.multi.t.tests, getElement, name = "statistic"),
  df = sapply(res.multi.t.tests, getElement, name = "parameter"),
  p = sapply(res.multi.t.tests, getElement, name = "p.value")
)
