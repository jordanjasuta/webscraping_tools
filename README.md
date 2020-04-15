# Webscraping tools

### minimal formatting
For a simple example of webscraping, we can use it to pull the data from a Wikipedia page and visualize the top 10 most populated cities overlaid on countries shaded by population in ggplot.

![alt text](https://github.com/jordanjasuta/Top10Cities/blob/master/Citiesplot.png "Final plot")

Sources include: Wikipedia and [the Jakarta Post](http://www.thejakartapost.com/life/2017/11/03/here-are-10-of-the-most-populated-cities-in-the-world.html)


### heavy formatting
However, not all data is stored in lightly formatted tables. In light of the COVID-19 pandemic, many countries are publishing daily updates - really useful information! - but in cumbersome, heavily formatted websites. After a few different friends asked me for help with scraping these websites, I came up with a quick for loop to automate these datapulls. Bonus points if you can run it as a scheduled job that updates your df with a new line each day. 





