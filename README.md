# Webscraping tools

### minimal formatting
For a simple example of webscraping, we can use it to pull the data from a Wikipedia page and visualize the top 10 most populated cities overlaid on countries shaded by population in ggplot. Code can be found in `GGmaps populations.R`.

Note that the xpath parameter of html_nodes() can be found by right-clicking on the element in question and selecting 'inspect':

<p align="center">
  <img width="300" src="https://github.com/jordanjasuta/Top10Cities/blob/master/imgs/inspect.jpg">
</p>

This will open the console on the right side of the webpage. In that console, identify the table or other element you want to extract from the webpage and right click on it, selecting 'copy > xpath':

<p align="center">
  <img width="400" src="https://github.com/jordanjasuta/Top10Cities/blob/master/imgs/copyxpath.jpg">
</p>


One the data is pulled, it can be fed into a ggplot with minimal adjustments to produce a map such as the one seen below.

![alt text](https://github.com/jordanjasuta/Top10Cities/blob/master/imgs/Citiesplot.png "Final plot")


Sources include: Wikipedia and [the Jakarta Post](http://www.thejakartapost.com/life/2017/11/03/here-are-10-of-the-most-populated-cities-in-the-world.html)


### heavy formatting
However, not all data is stored in lightly formatted tables. In light of the COVID-19 pandemic, many countries are publishing daily updates - really useful information! - but in cumbersome, heavily formatted websites. After a few different friends asked me for help with scraping these websites, I came up with a quick for loop to automate these datapulls. Bonus points if you can run it as a scheduled job that updates your df with a new line each day. Code can be found in `COVID_webscraping.R`.

<p align="center">
  <img width="80%" src="https://github.com/jordanjasuta/Top10Cities/blob/master/imgs/COVID_df.jpg">
</p>
