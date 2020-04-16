# Webscraping tools

During the COVID-19 pandemic, emidemiologists are scrambling to compile information that will allow them to analyze trends from diverse local sources. In the Americas region, analysts at the Pan-American Health Organization (PAHO/WHO) must pull data daily from dozens of countries' national websites. Some countries publish downloadable compiled datasets; while others only publish data embedded in a website's html. 

<p align="center">
  <img height="300" src="https://github.com/jordanjasuta/Top10Cities/blob/master/imgs/Chile_table.jpg"> &nbsp; &nbsp; &nbsp;
  <img height="300" src="https://github.com/jordanjasuta/Top10Cities/blob/master/imgs/Brazil_table.jpg">
  <div 'Sources: '>
</p>

Webscraping tools can save analysts precious time during a rapidly evolving epidemic - or frankly, in any other circumstances. This repo contains R code for scraping websites with minimal formatting (where the html <table> can be easily identified) and those with heavy formatting (where individual elements are bundled in layer after layer of formating containers).


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
However, not all data is stored in lightly formatted tables. Many countries are publishing daily updates - really useful information! - but in cumbersome, heavily formatted websites. To address this, I came up with a quick for loop to automate these datapulls, using Belize's website as an example. Each subsequent running updates the dataframe with a new line, automatically adding the date of the update. Bonus points if you can run it as a scheduled job. Code can be found in `COVID_webscraping.R`.

<p align="center">
  <img width="80%" src="https://github.com/jordanjasuta/Top10Cities/blob/master/imgs/COVID_df.jpg">
</p>
