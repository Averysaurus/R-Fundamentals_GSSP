# R-Fundamentals - Script 3 of 4

### 1. Load the gapminder-FiveYearData.csv file and save it in a variable named gap

### 2. Load the sleep_VIM.csv file and save it in a variable named sv

### 3. Load the heart.csv file and save it in a variable named heart

### Data Summarization #####

## Computing basic summary statistics is a good first step after you familiarize yourself with data

## The summary function will return frequenies for factor variables and six number summaries for continuous variables
## Six number summary = minimum and maximum, 1st and 3rd quartile boundaries, and median and mean
summary(gap)

## We can also use this function on a single vector
## Note that newer versions of R will convert to character automatically, not factor so summary will produce different results
summary(gap$lifeExp)
summary(as.factor(as.character(gap$continent)))
summary(as.character(gap$continent)) # Strange output! 

## Contingency Tables
## We can also return return observation frequencies for the different continents
table(gap$continent) 
prop.table(table(gap$continent))

## Tabulate number of observations for continent by year
table(gap$continent, gap$year) 

## or 
table(gap$year, gap$continent) 

##### Visualization #####

## Here we will talk about three of the most common data visualizations
## 1. Histogram: visualize the distribution of one continuous (i.e. numeric or integer) variable
## 2. Boxplots: visualize the distribution of one continuous variable (but can be parsed by a factor)
## 3. Scatterplots: visualize the distribution of two continuous variables - one on the x-axis and one on the y-axis

## Histogram of gap life expectancy
hist(gap$lifeExp, # data to plot
     col = "gray90") # bar color

## Colors in R
colors() 

## Histogram with options
histogram <- hist(gap$lifeExp, 
                  col = "honeydew1",
                  # Add title
                  main = "Histogram of life expectancy", 
                  # Change x-axis label
                  xlab = "Life expectancy (years)",
                  # y-axis label
                  ylab = "Frequency",
                  # Change x-axis limits
                  xlim = c(20, 90),
                  # y-axis limits
                  ylim = c(0, 350), 
                  # Change tickmark value orientation
                  # Try values of 0, 1, 2, 3. What happens?
                  las = 1)

## Boxplots
## Think of the tilde as meaning "by"
## We can plot life expectancy BY continent
boxplot(gap$lifeExp ~ gap$continent)

## Boxplot with options
boxplot(gap$lifeExp ~ gap$continent,
        # Different colors for each of the five boxes
        col = c("pink2", "aquamarine", "goldenrod", "salmon", "gray80"),
        main = "Life expectancy boxplots", 
        xlab = "Continent", 
        ylab = "Life expectancy (years)", 
        ylim = c(20, 90),
        las = 1)

## Scatterplot with options
plot(x = gap$lifeExp, y = gap$gdpPercap,
     main = "Life expectancy versus gdpPercap", 
     xlab = "Life expectancy (years)", 
     ylab = "gdpPercap (USD)", 
     # Change point colors to correspond to continents
     col = as.factor(gap$continent),
     # Change point symbols to correspond to continents
     pch = as.integer(as.factor(as.character(gap$continent))),
     # Change point size
     cex = 1,
     las = 1)

# This is a lot of code! How do we know which color and shape corresponds to each continent? We do not even have a legend yet! :(
legend("topleft", 
       inset = 0, 
       title = "Continent", 
       cex = 1,
       c("Africa", 
         "Americas", 
         "Asia", 
         "Europe", 
         "Oceania"), 
       col = c(1,2,3,4,5), 
       pch = c(1,2,3,4,5),
       horiz = FALSE)

## Too much code! Enter the ggplot2 way :)

# Section 4: ggplot2

## Installing packages is a two step process:

## 1. First, physically download the files from the CRAN repository:
## NOTE: Technically, you only have to perform this step once, but it is a good to keep your R, RStudio, and packages updated
install.packages("ggplot2")

## 2. Second, link your current RStudio session with the downloaded files. You need to do this each time you open a new RStudio session
library(ggplot2)

## See if you were successful! If so, you should see the help files appear. Read the "Description" section and scroll down to the "Useful links".
?ggplot2

## You need three things to make a ggplot:
## 1. Data!
## 2. "aes()" (aesthetics): define the coordinate system, map colors and shapes to points
## 3. "geom_" (visual marks): specify how the data should be represented: points, bars, lines, etc.

## Also:
## 4. plus sign: You will be working in layers in ggplot2. Add a new layer by typing the plus sign + at the end of a line of code
## 5. "theme_": customize non-data related aspects of your plots

## View the help for the ggplot function call:
?ggplot
## NOTE: ggplot2 is the package, ggplot is the function! 

## Create the base layer - here we have the gray background and coordinate system (lifeExp on the x-axis)
## No need for $ with ggplot! 
ggplot(data = gap, aes(x = lifeExp))

## gg Histogram
## Add a layer by typing the plus sign at the end of the base layer, and add geom_histogram() to overlay the bars
ggplot(data = gap, aes(x = lifeExp)) + 
  geom_histogram()

## gg Histogram with options (and save as a variable)
gg_hist <- ggplot(data = gap, aes(x = lifeExp)) + 
  # Customize bar color and number
  geom_histogram(fill = "blue", color = "black", bins = 10) + 
  # Add title
  ggtitle("Life expectancy for the gap dataset") + 
  # Change x-axis label
  xlab("Life expectancy (years)") + 
  # y-axis label
  ylab("Frequency") + 
  # Change background theme
  theme_classic() 
gg_hist

## gg Boxplots
gg_box <- ggplot(data = gap, 
                 aes(x = continent, 
                     y = lifeExp, 
                     fill = continent)) + 
  geom_boxplot() + 
  ggtitle("Boxplots for lifeExp by continent") + 
  xlab("Continent") + 
  ylab("Life expectancy (years)") +
  theme_minimal() 
gg_box

## gg Boxplots - hide legend
## We can also hide the boxplot legend since it contains duplicative information:
## Since we "filled" the bars with the "fill" parameter in the aes function above, we can set that legend ("guide") to false to turn it off
gg_box <- gg_box + guides(fill = FALSE)
gg_box

## gg Scatterplot
gg_scatter <- ggplot(data = gap, aes(x = lifeExp, y = gdpPercap, 
                                     color = continent, 
                                     shape = continent)) + 
  # Change point size and transparency
  geom_point(size = 5, alpha = 0.25) + 
  theme_classic() +
  ggtitle("Scatterplot of life expectancy by gdpPercap") +
  xlab("Life expectancy (years)") + 
  ylab("gdpPercap (USD)") + 
  # Change legend position and customize it
  theme(legend.position = "top",
        plot.title = element_text(hjust = 0.5, size = 12),
        legend.title = element_text(size = 10),
        legend.text = element_text(size = 5),
        # Rotate x-axis text 45 degrees
        axis.text.x = element_text(angle = 45, hjust = 1)) # + 
# scale_y_log10()
gg_scatter



