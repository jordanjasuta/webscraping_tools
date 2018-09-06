#load packages
library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)
library(dplyr)

install.packages("rvest")
library(rvest)


#scrape table from wiki
url <- "https://en.wikipedia.org/wiki/List_of_countries_by_population_(United_Nations)"
pop_table <- url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/div/table[3]') %>%
  html_table()
pop_table <- pop_table[[1]]

names(pop_table) <- c("Rank", "region", "Continent", "Statarea", "Pop2016", "Pop2017", "Change")
pop_table$Pop2016 <- as.numeric(gsub(",", "", pop_table$Pop2016))
pop_table$Pop2017 <- as.numeric(gsub(",", "", pop_table$Pop2017))
pop_table$Rank <- as.numeric(pop_table$Rank)
head(pop_table)

#adjust names of places program won't recognize
pop_table[pop_table=="United States"]<- "USA"
pop_table[pop_table=="United Kingdom"]<- "UK"
pop_table[pop_table=="China[a]"]<- "China"
pop_table[pop_table=="France[b]"]<- "France"
pop_table[pop_table=="Tanzania[c]"]<- "Tanzania"
pop_table[pop_table=="Spain[d]"]<- "Spain"
pop_table[pop_table=="Ukraine[e]"]<- "Ukraine"
pop_table[pop_table=="Malaysia[f]"]<- "Malaysia"
pop_table[pop_table=="Australia[g]"]<- "Australia"
pop_table[pop_table=="Finland[k]"]<- "Finland"
pop_table[pop_table=="Norway[l]"]<- "Norway"



#join population data with stored map data
mapdata <- map_data("world")
mapdata <- left_join(mapdata, pop_table, by="region")
mapdata %>% filter(region != "Antarctica") -> mapdata




#create df of top most populated cities
city <- c("1. Tokyo", "2. Delhi", "3. Shanghai", "4. Mumbai", "5. Sao Paulo", "6. Beijing", "7. Mexico City", "8. Osaka", "9. Cairo", "10. New York City")
region <- c("Japan", "India", "China", "India", "Brazil", "China", "Mexico", "Japan", "Egypt", "USA")
long <- c(139.6917, 77.1025, 121.4737, 72.8777, -46.8754915, 116.1172628, -99.4238185, 135.4601303, 31.1884234, -74.2598766)
lat <- c(35.6895, 28.7041, 31.2304, 19.0760, -23.6821604, 39.9390731, 19.3911668, 34.6784656, 30.0596185, 40.6976701)
cities <- as.data.frame(list(city, region, long, lat))
names(cities) <- c("city", "region", "long", "lat")





#plot populations and cities with ggplot

#plot base
combomap <- ggplot() +
  labs(title = "Top 10 most populated cities", subtitle = "+ countries by population")
combomap <- combomap + 
  geom_polygon(data = mapdata, mapping=aes(x=long, y=lat, group=group, fill = Pop2017), color = "white") 
combomap <- combomap + theme_nothing() + 
  scale_fill_gradient(low = "khaki1", high = "orangered3", guide="colorbar", trans = "log10")

#add points
combomap <- combomap + geom_point(data=cities, aes(x=long, y=lat, color="red", size=0.5)) + 
  geom_text(data = cities, aes(x=long, y=lat, label = as.character(city)), hjust = 0, color = "black") 
print(combomap + labs(title = "Top 10 most populated cities", subtitle = "+ countries by population"))

