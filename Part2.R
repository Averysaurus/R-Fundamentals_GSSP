# R-Fundamentals - Script 2 of 4

# Section 1: Load Data from Files

## Set Working Directory
## Click Session -> Set Working Directory -> Choose Directory 
## Select the R-Fundamentals folder you downloaded or cloned

## We can also do this with code:

## If the R-Fundamentals folder is on your Desktop
#setwd("~/Desktop/R-Fundamentals") # Mac
#setwd("C:/Users/YourUserName/Desktop/R-Fundamentals/") # PC

## We can read a dataset by passing in the file path as a character string
## This is the only required argument

## This work, why?!  
gap <- read.csv("gapminder-FiveYearData.csv")

## Try this instead! Notice the difference between these ttwo calls?
gap <- read.csv("data/gapminder-FiveYearData.csv")


## We need to go one level deeper into our file system (into the "data" folder)
## Therefore, we can simply add this to the file path, otherwise we could simply select the "data" folder when setting our working directory
gap <- read.csv("data/gapminder-FiveYearData.csv")
gap

## We can also add optional arguments
gap <- read.csv("data/gapminder-FiveYearData.csv", 
                # Place column names in header row outside of the data
                header = TRUE, 
                # Convert character string columns to factor type?
                stringsAsFactors = T,
                # Tell R to code anything defined here as NA
                # We have none of these so they will be ignored
                na.strings = c("", " ", "999", "?", "NONE", "none"))

## We can preview a dataset with the head() function
## The first six rows are displayed by default
head(gap)

## Or we can see its structure
str(gap)

## Or we can view the dataset in a separate tab as well
## Note the filter buttons in the header row
View(gap)

## Challenge: load the sleep_VIM.csv data, click in between the quotation marks and use TAB to locate the .csv file in your directory.  
sleep_VIM <- read.csv("")

## Wrap symbols in quotation marks to view their help pages
?"$" 

## Check out one column by typing the name of the data frame, the dollar sign, then the column name
sleep_VIM$Dream 

## You can also tab complete to see a list of columns. Helpful!
sleep_VIM$ # click just to the right of the $ and press the TAB key here to select a column


  
  ##### Subset a Data Frame in Two Dimensions #####
  
  ## There are many ways to efficiently subset rows and columns in R
  ## "Bracket notation" is the simplest
  ## Remember that we indexed a vector by typing a number in square brackets? We will do the same here, but will use a comma in the square brackets to designate rows from columns: 
  ## dataframe[rows, cols]
  
  ## Make a new dataframe called sleep_varnames, subsetting on two columns
  ## The space BEFORE the comma is left blank and tells R we want all the rows returned (because we didn't specify a row subset)
  ## Only the BodyWgt and BrainWgt columns are returned
sleep_varnames <- sleep_VIM[ , c("BodyWgt", "BrainWgt")]

## Check the structure and first few rows
str(sleep_varnames)
head(sleep_varnames)

## Select by column position
## We can also pass in integers to include particular columns
names(sleep_VIM)

## Suppose we just want the NonD (3rd), Sleep (5th), and Exp (9th) columns
sleep_posint <- sleep_VIM[ , c(3, 5, 9)] 
str(sleep_posint)
head(sleep_posint)

## We can also pass in negative integers to exclude specific columns
## Suppose we want to exclude BodyWgt and BrainWgt
names(sleep_VIM)
sleep_negint_VIM <- sleep_VIM[ , -c(1, 2)]
str(sleep_negint_VIM)
head(sleep_negint_VIM)


## Subset rows based on a logical condition in one column
## Then, select by column positions
sleep_logical <- sleep_VIM[sleep_VIM$Exp == 4 , 8:10 ] 
sleep_logical

## Remember logical symbols from earlier?
?"=="

## Subsetting based on multiple conditions
## What if we want to incorporate multiple conditions?
?"&"
?"|"

## & (and) means that all conditions must be TRUE
## Subset rows only where Exp is 1 AND Danger is 2
sleep_logical_and <- sleep_VIM[sleep_VIM$Exp == 1 & 
                                 sleep_VIM$Danger == 2, ]
sleep_logical_and

## | (or) means that just one of the conditions must be TRUE
## Subset rows only where Exp is 1 OR Danger is 2
## Do you think we will get more or less rows returned? Why or why not?
sleep_logical_or <- sleep_VIM[sleep_VIM$Exp == 1 | 
                                sleep_VIM$Danger == 2, ]
sleep_logical_or

dim(sleep_logical_and) # 5 rows x 10 columns
dim(sleep_logical_or) # 36 rows x 10 columns


##### Subset function #####

## We can also use the "subset" function to subset data based on logical conditions
?subset # subset will keep rows, select will keep columns!

# subset rows where "BrainWgt" is less than 60 and "Danger" equals 4 and "Exp" equals 3. 
# subset columns "BrainWgt", "Danger", "Exp".
subset_1 <- subset(x = sleep_VIM, 
                   subset = BrainWgt < 60 & 
                     Danger == 4 & 
                     Exp == 3,
                   select = c("BrainWgt", "Danger", "Exp"))
subset_1

# subset all rows where BrainWgt is less than 0.3 or Danger is equal to 5 along with the "BrainWgt", "Danger", and "Exp" columns:
subset_2 <- subset(sleep_VIM, 
                   subset = BrainWgt < 0.3 | Danger == 5, 
                   select = c(BrainWgt, Danger, Exp))
subset_2

##### Challenge 3
##### 1. Use the subset() function to create a subset of the heart dataset that returns only rows where chol is greater than 400 and all columns 

##### 2. Use the subset() function to create a subset of the heart dataset for sex equals 1 and chol is greater than 350 as well just the sex and chol columns.





