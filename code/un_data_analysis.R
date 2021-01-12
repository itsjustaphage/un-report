gapminder_data <- read.csv("data/gapminder_data.csv")
library(tidyverse)

# How to clean up the data from yesterday

summarize(gapminder_data, averagelifeExp = mean(lifeExp))
# (the data you want to analyze, how you want to analyze it(what you want to analyze))

# %>% piping function, data set will go before the piping function; allows you to create chains of code; CTRL + SHFT + M; useful to avoid 'function inside
# of function 

gapminder_data %>% summarize(averagelifeExp = mean(lifeExp)) 


# Exercise: fine the mean population of gapminder dataset

summarize(gapminder_data, averagePopulation = mean(pop))

gapminder_data %>% summarize(averagePopulation = mean(pop))

#filter function - using this to narrow down data; we're looking for data within the '2007

gapminder_data %>% summarize(averagePopulation = mean(pop), recent_year = max(year))

gapminder_data %>% filter(year=2007)

#error message "This usually means that you've used `=` instead of `==`.Did you mean `year == 2007`?". Need to use double equal sign. 

gapminder_data %>% filter(year==2007)

# what is the mean life exp within this year? 

gapminder_data %>% filter(year==2007) %>% summarize(averageLifeExp = mean(lifeExp))

#we did this because earlier the life exp seemed low a 58 years old, so we narrowed it down to a later year to see if the life exp average increases. 

# Exercise: Find the average GDP per capita for the first year in the dataset

gapminder_data %>%  summarize(averageGDPpercapita = mean(gdpPercap), first_year = min(year)) #find the year
gapminder_data %>% filter(year==1952)
gapminder_data %>% 
  filter(year==1952) %>% 
  summarize(averageGDPpercapita = mean(gdpPercap), first_year = min(year))

# group_by function: 

gapminder_data %>% 
  group_by(year) %>% 
  summarize(averageLifeExp = mean(lifeExp)) #year and lifeExp not in quotes because they're column names

# Exercise: find mean lifeExp for each continent

gapminder_data %>% 
  group_by(continent) %>% 
  summarize(averageLifeExp = mean(lifeExp))

# mutate - add more column to your dataset

gapminder_data %>% 
  mutate(gdp = gdpPercap * pop)
# mutate(new column name = column 1 * column 2)

# Exercise: make new column in dataset using mutate() that is population in millions

gapminder_data %>% 
  mutate(popMil = pop / 1000000)

# select function: specify which column we want to keep

gapminder_data %>% 
  select(year, pop)

# drop the continent column

gapminder_data %>% 
  select(-continent)

# Exercise: creat a dataset with the country, continent, year and lifeExp columns

gapminder_data %>%
  select(country, continent, year, lifeExp)
gapminder_data %>% 
  select(-pop, -gdpPercap)

# To save: 

gapminder_data1 <- gapminder_data %>% select(-continent)

# Arrange(year) - arrange rows
# long vs wide
# pivot_longer and pivot_wider
gapminder_data %>%
  select(country, continent, year, lifeExp) %>% 
  pivot_wider(names_from = year, values_from = lifeExp)

# rename() - rename columns

# Exercise: Create a new dataset with only data from the Americas and 2007
# Drop the continent and year columns

gapminder_Americas_2007 <- gapminder_data %>% 
  filter(year==2007, continent == "Americas") %>% 
  select(-continent, -year)

gapminder_Americas_2007

gapminder_data <- read_csv("data/gapminder_data.csv") %>% 
  filter(year==2007, continent == "Americas") %>% 
  select(-continent, -year)

  