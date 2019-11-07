# Vahidreza Jahanmard
# 
# Task 01
#
# Create a function that takes as input the path to a single .csv file in the specdata folder and creates
# a data table from its contents. The data types in the output table have to match the data
# (date is understood as a date).

# first version---------------------------------

# setwd("~/EXX9076/Task_01")
# getwd()
# 
# data_tab <- read.csv('specdata/001.csv')
# summary(data_tab)
# data_tab <- read.table('specdata/001.csv',header = T, sep = ',',colClasses = c('Date','numeric','numeric','factor'))
# plot(data_tab$Date,data_tab$sulfate)

# second version ----------------------------------

path_to <- "specdata/001.csv"

data_read_i <- function(path_to){
  data_tab <- read.table(file=path_to , header = T, sep = ',',colClasses = c('Date','numeric','numeric','factor'))
}

data_i <- data_read_i(path_to)

# Task02
# Write a for loop that loops through all the file paths in the specdata folder and uses the function
# written in previous point to read the data from the .csv files. Create a table with columns that show:
# a) ID nr b) the nr of rows in each of the read in tables c) The number of rows where atleast sulfate or
# nitrate data is not missing.

k <- 0

file_names <- list.files('specdata', full.names = T)
for (file_i in file_names) {
  data_i <- data_read_i(file_i)
  ID <- data_i$ID[1]
  No_data_rows <- nrow(data_i)
  No_rows_not_NA_sulf <- !is.na(data_i$sulfate)
  No_rows_not_NA_nitr <- !is.na(data_i$nitrate)
  No_rows_not_NA <- No_rows_not_NA_sulf | No_rows_not_NA_nitr
  
  data_not_NA <- data_i[No_data_rows,]
  No_rows_not_NA <- nrow(data_not_NA)
  
  out_tab_i <- data.frame(ID,No_data_rows,No_rows_not_NA)
  
  if(k == 0){
    out_tab <- out_tab_i
    k <- 1
  }else{
    out_tab <- rbind(out_tab,out_tab_i)
  }
}

