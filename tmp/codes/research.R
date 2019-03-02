source("config.R")
source(paste0(code_dir,"\\bootstrap.R"))
source("constants.R")
set.s
avab1 <- read.csv(paste0(data_dir,"\\dataqvd\\beheshtiuni_96adm.csv"), 
                  sep = "|", encoding = "UTF-8", header = TRUE)
filenames <- list.files(pattern = "*qvd", full.names = TRUE, 
                        path = paste0(data_dir,"\\dataqvd\\"))
merged_file <- do.call(rbind, lapply(filenames, function(i) {read.table(i, 
                       sep = "|", encoding = "UTF-8", header = TRUE)})) %>% 
                        tbl_ffdf(.,
                        #  store a ffdf data.frame in "./db_ff"" directory
                        src="./db_ff", name="merged_file1", force = TRUE) %>% 
                        print(., n=2)
class(merged_file1)
basename(filename(merged_file1$ADT_AdmissionDateMonth))
mean(merged_file1$ADT_AdmissionDateMonth)
require(ffbase)
model <- bigglm(Bill_TotalCharge ~ ADT_LOS, data = merged_file1)
summary(model)

dim.data.frame(merged_file)
src <- src_ffdf("./db_ff")  # retrieve tables of ffdf source, use src_ffdf
print(src)
src_tbls(src)  # what tables are available?
## retrieve table from src
merged_file1 <- tbl(src, from="merged_file1")  # or tbl_ffdf(src=src, 
# name="cars")
print(merged_file1, n=2)
class(avab1$month)
level_key <- list(فروردين = 1, 
                         ارديبهشت = 2, 
                         خرداد = 3, 
                         تير = 4, 
                         مرداد = 5, 
                         شهريور = 6, 
                         مهر = 7, 
                         آبان = 8, 
                         آذر = 9, 
                         دي = 10, 
                         بهمن = 11, 
                         اسفند = 12)
avab1$month2 <- recode(avab1$month, !!!level_key)
summary(avab1$month)
summary(avab1$month2)
## Use copy_to to add data to a src_ffdf
# src <- src_ffdf("./db_ff")
# copy_to(src, iris) # or equivalenty tbl_ffdf(iris, src)
