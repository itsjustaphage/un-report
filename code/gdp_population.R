#load tidyverse packages
library(tidyverse)

#cheatsheets in Help

#First time loading in data will be different than the rest of the time

# read in data
gapminder_1997 <- read_csv("data/gapminder_1997.csv")

# the arrow above means that everything to the right of the arrow will be 
# stored into the file to the left; names always need to start with a letter, with no spaces

# don't assign the same name to objects

# learn more about a function

?read_csv

read_csv(file = "data/gapminder_1997.csv")

# make a plot
ggplot(data = gapminder_1997)
# output was an ugly grey square because we didn't tell ggplot how to plot or what to plot it with
# we need to tell ggplot what we want to draw and they're called 'aesthetics', and we can map our variables to certain aesthetics
# to add non-aesthetic layers, use 'geom', like plots
# different color palettes use this code: RColorBrewer::display.brewer.all()
ggplot(data = gapminder_1997) +
  aes(x = gdpPercap) +
  labs(x = "GDP Per Capita") +
  aes(y = lifeExp) +
  labs(y = "Life Expectancy") +
  labs(title = "Do people in wealthy countries live longer?") +
  geom_point() + 
  aes(color = continent) +
  scale_color_brewer(palette = "Set1") +
  aes(size = pop/1000000) +
  labs(size = "Population (in millions)") +
  aes(shape = continent)
  
ggplot(data = gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp, color = continent, size = pop/1000000 ) +
  labs(x = "GDP Per Capita", y = "Life Expectancy", 
       size = "Population (in millions)", title = "Do people in wealthy countries live longer?") +
  geom_point() + 
  scale_color_brewer(palette = "Set1")
  
# Read in the full dataset
gapminder_data <- read_csv("data/gapminder_data.csv")
# dimensions
dim(gapminder_data)

ggplot(data = gapminder_data) +
  aes(x = year, y = lifeExp, color = continent, group = country)+
  geom_line()

# plotting categorical variables
# using gapminder_1997 data with geom_boxplot () to make a boxplot where continent is the x axis, and life expectancy is the y-axis

ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp)+
  geom_boxplot()

ggplot(data = gapminder_1997, aes( x = continent, y = lifeExp, fill = continent)) +
  labs(x = 'Continent', y = 'Life Expectancy (years)', title = 'Life Expectancy by Continent (1997)') + 
  geom_boxplot()

# violin plots
ggplot(data = gapminder_1997, aes( x = continent, y = lifeExp)) +
  labs(x = 'Continent', y = 'Life Expectancy (years)', title = 'Life Expectancy by Continent (1997)') + 
  geom_jitter(aes(size=pop)) +
  geom_violin(alpha=0.5, aes(fill = continent))

#univariate plots

ggplot(gapminder_1997) +
  aes(x = lifeExp) +
  geom_histogram(bins = 20) + 
  theme_bw() + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))

#Exercise: figure out how to rotate x axis labels 90 degrees

# Saving plots

ggsave("figures/awesome_plot.jpg", width = 6, height = 4)

#saving the code for the violin plot to violin_plot

violin_plot <- ggplot(data = gapminder_1997, aes( x = continent, y = lifeExp)) +
  labs(x = 'Continent', y = 'Life Expectancy (years)', title = 'Life Expectancy by Continent (1997)') + 
  geom_jitter(aes(size=pop)) +
  geom_violin(alpha=0.5, aes(fill = continent))

violin_plot
violin_plot + theme_bw()

violin_plot <- violin_plot + theme_bw()
violin_plot

ggsave("figures/awesome_violin_plot.jpg", plot = violin_plot, width = 6, height = 4)

# Faceting plots - what if wanted to plot our original plot into separate plots? 

ggplot(gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp) +
  geom_point() + 
  facet_wrap(vars(continent))

#Practice saving a plot as "my_awesome_plot.jpg"

ggplot(gapminder_1997) +
  aes(x = lifeExp) +
  geom_histogram(bins = 20) + 
  theme_bw() + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))

ggsave("figures/my_awesome_plot.jpg", width = 6, height = 4)
