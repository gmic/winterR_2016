####################
# Subsetting Data in R - Lab
# 1/5/2016
####################


## In this lab you can use the interactive console to explore 
## 	  but please record your commands here.  
## Remember anything you type here can be "sent" to the console with 
##    Cmd-Enter (OS-X) or Cntr-Enter (Windows/Linux).

library(dplyr)
# 1. Check to see if you have the `mtcars` dataset 
#		(which is included in the `datasets` package)
head(mtcars)

# 2. What class is `mtcars`?
class(mtcars)

# 3. How many observations (rows) and variables (columns) are in the `mtcars` dataset?
dim(mtcars)
nrow(mtcars)
ncol(mtcars)
str(mtcars)

# 4. Select the subset of rows that get more than 20 miles
# 		 per gallon (mpg) of fuel efficiency - how many are there?
nrow(filter(mtcars, mpg > 20))
mtcars %>% filter(mpg > 20) %>% nrow
nrow(mtcars[ mtcars$mpg > 20, ])
sum(mtcars$mpg > 20)
length(which(mtcars$mpg > 20))

# 5. Select the subset of rows that get less than 16 miles
# 		per gallon (mpg) of fuel efficiency and have more than 
#		100 horsepower (hp) - how many are there?
mtcars %>% filter(mpg < 16 & hp > 100) %>% nrow


# 6. Create a subset of the data that only contains the columns:
#		wt, qsec, and hp for only the cars that have 8 cylinders 
#		and assign this object to `carsSub` - 
#		what are the dimensions of this dataset?
carsSub = mtcars %>% 
  filter(cyl == 8) %>% 
  select(wt, qsec, hp)
carsSub = mtcars[
    mtcars$cyl == 8, c("wt", "qsec", "hp")]

# 7. Convert the column names of `carsSub` to all upper case
cn = colnames(carsSub)
cn = toupper(cn)
colnames(carsSub) = cn
colnames(carsSub) = colnames(carsSub) %>% toupper

colnames(carsSub) = toupper(colnames(carsSub))

# 8. Re-order the rows of `carsSub` by weight in increasing order
arrange(carsSub, WT)
carsSub[ order(carsSub$WT),]
