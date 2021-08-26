# R-Fundamentals - Script 1 of 4

##### Navigating RStudio #####

## By default, this script will open in the upper left pane of RStudio. Open a new script by clicking File --> New File --> R Script

## 1. Script (upper left): this is your input and is easily savable
## 2. Console (lower left): output appears here and functions as a nice scratch space
## 3. Global Environment (upper right): saved variables will appear here
## 4. Misc (lower right): navigate your file system, plots, install packages, view help

## RStudio also has a lot of helpful customizations to improve your experience:

## Click Tools --> Global Options --> Appearance to change your color and font settings
## Click Tools --> Global Options --> Code and check the box that says "Soft-wrap R source files" to wrap the text in your script to the width of the script pane
## Click Tools --> Global Options --> Code --> Display and check the boxes that say "Highlight selected line" and "Highlight R function calls"

# Section 2: Variable Assignment

## Try assigning the value "5" to the variable 'number' and then run 'number'
## To run a line of code, place your cursor on a line of runnable code and click the "Run" button or click Ctrl + Enter (PC) or command + Enter (Mac)
number <- 5
number

# Use a hashtag to comment your code (write notes to your future self and your collaborators) to help keep your script organized. 

# Press Ctrl + l on both Mac and PC to clear your console. This does not erase any data, it simply moves the greater than symbol (>) up to the top to improve readability. 

# Section 3: Functions and Arguments

## Functions perform actions on things and usually are followed by trailing round parentheses
## Arguments are the 'things' - values, expressions, text, entire datasets, etc.

## You can use the "TAB" key to autocomplete a variable
## Place your cursor after the 'b' in 'numb' below and press TAB
## This works for variables and functions alike
numb

mea

## Variables will be overwritten if you redefine them
## What happens to "UC Berkeley" when you run this code?
welcome <- "UC Berkeley" 
welcome

welcome <- "Social Science Building"
welcome

## Try saving new values as new variables
welcome2 <- "UC Davis"
welcome2

# The class() function tells the data class/type of the variable and requires one argument
class(welcome2)
ls()

## Removing Variables. rm() will remove a variable
rm(welcome)
ls()
welcome # Error

## Remove All Variables with rm(list = ls())
## Or, click the broom icon at top of 'Environment' pane
rm(list = ls()) 
ls()

##### Challenge 1 - variable assignment
##### Define three variables and then write a mathematical expression using only those variables

##### Data Classes and Coercion #####

## There are five main classes of data we will work with in this workshop:
## 1. numeric: decimals (the default for ALL numbers in R)
## 2. integer: whole numbers (positive and negative, including zero)
## 3. character: text strings (always wrapped in quotations)
## 4. logical: TRUE or FALSE (1 or 0)
## 5. factor: nominal or ordinal categorical type

## 1. Numeric: assign 5 to 'number' and check its class. 
number <- 5
number
class(number)

## 2. Integer: coerce 'number' to integer type with the as.integer() function
number_int <- as.integer(number)
number_int
class(number_int)

## 3. Character: Define welcome <- "Welcome to the D-Lab" and check its class
welcome <- "Welcome to the D-Lab"
class(welcome)
ls()

## Single and double quotes work similarly
contraction <- 'I am hungry.'
contraction

contraction <- "I am hungry."
contraction

## You can nest single quotes inside of double quotes
contraction <- "I'm hungry"
contraction

## Or, you can use all single quotes along with escape characters
contraction <- 'I\'m hungry'
contraction

## However, you cannot nest single quotes inside of single quotes

## 4. Logical: Logical data will check to see if a condition is TRUE (1) or FALSE (0).
class(TRUE)
class(FALSE)

## Since TRUE and FALSE are stored as 1 and 0, they take on mathematical properties:
TRUE + 2
FALSE - 4

## Boolean data types evaluate whether a statement is TRUE. Check the following:
FALSE < TRUE # less than
TRUE >= TRUE # greater than or equal to
FALSE == FALSE # equivalent to (equal to)
FALSE == FALSE
"Mac" == "mac" # R is case sensitive
FALSE != FALSE # not equivalent to (not equal to)
"PC" != "Windows"

## Boolean 'and' (all conditions must be satisfied)
TRUE & TRUE 
TRUE & FALSE

## Boolean "or" (just one condition must be satisfied)
TRUE | TRUE 
TRUE | FALSE


##### Data Structures #####

## There are five main functions you can use to form more complex data structures:
## 1. paste: combine elements into character strings
## 2. c: ordered groupings of the SAME type of data (called "vectors")
## 3. data frame: and ordered group of equal-length vectors; also like a list
## 4. list: store heterogeneous data
## 5. matrix: like a vector, but can be ordered into rows and columns

## 1. Sentence formation
## Form sentences with paste: 
pangram <- paste("The", 
                 "quick", 
                 "brown", 
                 "fox", 
                 "jumps", 
                 "over", 
                 "the", 
                 "lazy", 
                 paste0("dog", "."))
pangram

## The result will always be a string
example <- paste("the", 4, TRUE)
example

# Type a question mark before a function name to view the help pages. Read the "Description" section for a definition. The "Usage" section shows what arguments can be passed into the function and the "Arguments" section provides definitions of the individual parameters/arguments. Also see the "Details", "References", and "Examples" sections for more information!

## Split a character string with the strsplit:
## Split on the space " " but other separators are allowed such as commas, periods, lines, etc.
words <- strsplit(pangram, split = " ")
words 
class(words)

## Subset string by position with substr:
sub_text <- substr(pangram, start = 4, stop = 11)
sub_text

## gsub string substitution. This is an example of a regular expression:
pangram
cow_sentence <- gsub("fox", "cow", pangram)
cow_sentence

## 2. Vector - We can we can concatenate continuous data (i.e., numeric or integer) with c:
## A vector is an ordered group of the same type of data
## NA is how R stores missing data
num_vec <- c(2, 5, 8, NA, NA)
num_vec

## It does not matter what type the data is contained within the vector, 
## as long as it is all the same:
numeric_vector <- c(234, 31343, 78, 0.23, 0.0000002)
numeric_vector
class(numeric_vector)
length(numeric_vector) # There are five elements in this vector

## Turn off scientific notation
options(scipen = 999)
numeric_vector

## Index a vector
## To index a vector means to extract an element based on its position
## For example, if we want to return just the third thing from "numeric_vector", we would use square brackets and type:
numeric_vector[3]
class(numeric_vector[3])

## We can also add items to a vector using another c:
numeric_vector2 <- c(numeric_vector, c(0.1, 0.2, 0.3))
numeric_vector2

## Generate a sequence of numbers
?seq
sequence <- seq(from = 0, to = 8, by = 1)
sequence

decimals <- seq(from = 0, to = 2, by = 0.25)
decimals

## Extract just the 4th element:
decimals[4]

## When by = 1 we can also use the colon operator: 
0:8

sequence_object <- c(28:36)
sequence_object 

0:length(sequence_object)

## Pseudo random seed
## Set the pseudo random seed to ensure that when you use probabilstic functions that they can be replicated. For example, if you sample a dataset, you will always get the same sample.
?set.seed

## Sample numbers from the uniform distribution
?runif

## Sample numbers from the normal distribution
?rnorm

## Sample numbers, logical values, character strings, etc
?sample

## Pseudo-Random Sampling
set.seed(1)

## 10 random samples from the uniform distribution between the numbers one hundred and one million
uniform <- runif(n = 10, min = 100, max = 1000000) 
uniform
class(uniform)

# 10 random samples from the standard normal distribution with a mean of 0 and standard deviation of 1
normal <- rnorm(n = 10, mean = 0, sd = 1) 
normal
class(normal)

# 10 random samples from a character vector
character <- sample(c("Canada", "USA", "Mexico"), 10, replace = TRUE) 
character
class(character)


##### Data frame #####
## A data frame is an ordered group of equal-length vectors
## Think of a data frame as a spread sheet you would open in MS Excel!
## Since they are vectors, each column can only contain the same data type, but columns of different types can be lined up next to each other!
## Rows can contain heterogeneous data
## Data frames inherit some qualities from lists (see below)

## Here is a summary of the five vectors we created above: 
set.seed(1)
(uniform <- runif(n = 10, min = 100, max = 1000000))
(normal <- rnorm(n = 10, mean = 0, sd = 1))
(character <- sample(c("Canada", "USA", "Mexico"), 10, replace = TRUE))

## We can create the data frame with data.frame
## The equal-length vectors are the arguments
## the "stringsAsFactors = FALSE" argument means that R will keep character columns as character type and will NOT automatically convert them to factor/categorical type:
gdp <- data.frame(character, uniform, normal, 
                  stringsAsFactors = FALSE)
gdp

## Check the compact structure of the gdp data frame
str(gdp)

## View the dimensions (nrow x ncol) of the data frame:
dim(gdp) 

## View column names:
colnames(gdp)

## View row names (we did not change these and they default to character type)
rownames(gdp)
class(rownames(gdp))

## Rename columns
## You can rename columns by assigning a vector of equal length to the colnames function on the left side of the equation
colnames(gdp) <- c("Country", "GDP", "Growth Rate")
gdp

## Change column order (this is a preview of Part 2 subsetting operations)
gdp <- gdp[,c("Growth Rate", "Country", "GDP")]
gdp

## Sort the data frame by country and then by year
gdp_sorted <- gdp[order(gdp$Country, gdp$GDP),]
gdp_sorted

## Extract a single column with $
gdp$GDP

## Create new columns also with $
gdp$calculation <- gdp$GDP * gdp$`Growth Rate`
gdp

##### Exporting and Practice #####
 
## The working directory
## By default, your actions in RStudio are linked to a physical location on your computer called the "working directory"
## View this location with getwd:
getwd()

##### Challenge - export to .csv
##### 1. Use ?write.csv to try and figure out how to export this data frame as a .csv file
##### 2. Use getwd() to see where it saved! Were you successful?
