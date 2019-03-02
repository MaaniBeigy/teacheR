# Data Manipulation Notes
## useful functions
require('magrittr')
d %>% head(3)  # gives the first 3 lines
d %>% tail(3)  # gives the last 3 lines
d$x %>% unique  # gives the unique values of a variable
dim.data.frame(d)  # gives the dimension of a dataframe
## function ifelse for mapping
formatted_d <- raw_d

map_class <- function(x) {
ifelse(x == 2, "sth1",
ifelse(x == 4, "sth2",
NA))
}
mapped <- formatted_d$classif1 %>% map_class
mapped %>% table

### Manipulation with dplyr
require('dplyr')
d %>% tbl_df  # prints the first ten rows
## select(): Pick Selected Columns and Get Rid of the Rest
d %>% tbl_df %>% select(x) %>% head(3)  # Pick one column
d %>% tbl_df %>%
  select(x, xx, xz) %>% head(3)  # Pick several columns

d %>% tbl_df %>%
  select(x:xz) %>% head(3)  # Pick ranges of columns

d %>% tbl_df %>%
  select(starts_with("x")) %>% head(3)  # Pick when charachter "x" in begin

d %>% tbl_df %>%
  select(ends_with("x")) %>% head(3)  # Pick when charachter "x" in end

d %>% tbl_df %>%
  select(contains("x")) %>% head(3)  # Pick when contain "x"
d %>% tbl_df %>%
  select(matches(".t.")) %>% head(3)  # contains "t" except fot first or last
d %>% tbl_df %>%
  select(-starts_with("x")) %>% head(3)  # use "-" befor criteria excludes it

## mutate():Add Computed Values to Your Data Frame
d %>% tbl_df %>%
  mutate(sumx = xx + xz, productx = xx*xz) %>%
  select(x, sumx, productx)
## Transmute(): Add Computed Values and Get Rid of All Other Columns
d %>% tbl_df %>%
  transmutate(sumx = xx + xz, productx = xx*xz)
## arrange(): Reorder Your Data Frame by Sorting Columns
d %>% tbl_df %>%
  arrange(x)  # sort by variable x in increasing order
d %>% tbl_df %>%
  arrange(desc(x)) # sort by variable x in decreasing order
## filter(): Pick Selected Rows and Get Rid of the Rest
d %>% tbl_df %>%
  filter(x > 5 & xx == "hosp")
## group_by(): Split Your Data Into Subtables Based on Column Values
d %>%
  group_by(xx, as.factor(xz)) %>%  # split by variables xx and xz
  summarize(number.of.samples = n(),  # receiving results based on splitting
            mean.x = mean(x))

### Tidying Data with tidyr
require('tidyr')
## gather() gather variables into one variable.
d %>%
gather(key = attribute, value = measurement,
xx, xz) %>%
select(x, attribute, measurement) %>%
qplot(Attribute, Measurement,
      geom = "boxplot",
      facets = . ~ x, data = .)

## separate():  turns a single character column into multiple columns.
d2 <- d1 %>%
  separate(v1, c("sex", "age"), 1)  # separate after the first characte of v1
d2
## spread(): Spread a key-value pair across multiple columns.
d %>% spread(element, value)  # inverse gather(): spreads element and value

### Subsample Your Data Before You Analyze the Full Dataset
d %>% sample_n(size = 10000)

### Examine memory usage and memory changes using the pryr package
require(pryr)
mem_change(x <- rnorm(10000))  # see what the cost is of creating new vector

### Speeding up the analyzes
require(biglm)
slice_size <- 10
n <- nrow(cars)
slice <- cars %>% slice(1:slice_size)
model <- biglm(dist ~ speed, data = slice)
for (i in 1:(n/slice_size-1)) {
    slice <- cars %>% slice((i*slice_size+1):((i+1)*slice_size))
    model <- update(model, moredata = slice)
}
model
# Large data regression model: biglm(dist ~ speed, data = slice)
# Sample size = 50
### solving Too Large to Load problem
require(ff)
dff = read.csv.ffdf()  # best function for ff
require(ffbase)
model <- bigglm(y ~ x, data = dff)
summary(model)

### using  ff and plyr

require(ff)
require(RPostgreSQL)
require(RMySQL)
require(RSQLite)  # use it
devtools::install_github("edwindj/ffbase2")
iris_f <- tbl_ffdf(iris)  # Creatie tbl_ffdf create/use temporary ffdf df
species <-
   iris_f %>%
   group_by(Species) %>%
   summarize(petal_width = sum(Petal.Width))
library(ffbase2)
cars %>% tbl_ffdf(.,  # store a ffdf data.frame in "./db_ff"" directory
                  src="./db_ff", name="cars") %>%
                  print(., n=2)
src <- src_ffdf("./db_ff")  # retrieve tables of ffdf source, use src_ffdf
print(src)
src_tbls(src)  # what tables are available?
## retrieve table from src
cars <- tbl(src, from="cars") # or tbl_ffdf(src=src, name="cars")
print(cars, n=2)
## Use copy_to to add data to a src_ffdf
src <- src_ffdf("./db_ff")
copy_to(src, iris) # or equivalenty tbl_ffdf(iris, src)
