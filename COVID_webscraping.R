library(rvest)
library(dplyr) 


url <- "https://covid19.bz/"

# For a one-time datapull:

covid_table <-as.data.frame(matrix(0, ncol = 6, nrow = 1))

for (column in 1:5){
  table_val <- url %>% 
    read_html() %>%
    html_nodes(xpath=paste('//*[@id="content"]/div/div/div/section[7]/div/div/div[',column,']/div/div/div/div/div/div[1]/span[2]')) %>% 
    html_attr("data-to-value")
  covid_table[column] <-table_val
  
  var_name <- url %>% 
    read_html() %>%
    html_nodes(xpath=paste('//*[@id="content"]/div/div/div/section[7]/div/div/div[',column,']/div/div/div/div/div/div[2]')) %>% 
    html_text()
  names(covid_table)[column] <- var_name
}

names(covid_table)[6] <- 'Date Pulled'
covid_table[6] <-Sys.Date()

covid_table


# for following/repeated datapulls: 

vals <- c()

for (column in 1:5){
  table_val <- url %>% 
    read_html() %>%
    html_nodes(xpath=paste('//*[@id="content"]/div/div/div/section[7]/div/div/div[',column,']/div/div/div/div/div/div[1]/span[2]')) %>% 
    html_attr("data-to-value")
  vals <- append(vals, table_val)
}

date <- Sys.Date()
vals = append(vals, as.character(date))

covid_table <- rbind(covid_table, 'date' = vals)

covid_table
