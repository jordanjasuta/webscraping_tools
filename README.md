# Webscraping tools

During the COVID-19 pandemic, emidemiologists are scrambling to compile information that will allow them to analyze trends from diverse local sources. In the Americas region, analysts at the Pan-American Health Organization (PAHO/WHO) must pull data daily from dozens of countries' national websites. Some countries publish downloadable compiled datasets; while others only publish data embedded in a website's html. 

<p align="center">
  <img height="300" src="https://github.com/jordanjasuta/Top10Cities/blob/master/imgs/Chile_table.jpg"> 
</p>

_Source: [Minsal Chile](https://www.minsal.cl/nuevo-coronavirus-2019-ncov/casos-confirmados-en-chile-covid-19/)_ 

Webscraping tools can save analysts precious time during a rapidly evolving epidemic - or frankly, in any other circumstances. This repo contains R code for scraping websites with minimal formatting (where the html <table> can be easily identified) and those with heavy formatting (where individual elements are bundled in layer after layer of formating containers).


### minimal formatting
For a simple example of webscraping, we can use it to pull the data from a Wikipedia page and visualize the top 10 most populated cities overlaid on countries shaded by population in ggplot. Code can be found in `GGmaps populations.R`.

Note that the xpath parameter of html_nodes() can be found by right-clicking on the element in question and selecting 'inspect':

<p align="center">
  <img width="300" src="https://github.com/jordanjasuta/Top10Cities/blob/master/imgs/inspect.jpg">
</p>

This will open the console on the right side or the bottom of the web browser (depending on your settings). In that console, identify the table or other element you want to extract from the webpage and right click on it, selecting 'copy > xpath':

<p align="center">
  <img width="400" src="https://github.com/jordanjasuta/Top10Cities/blob/master/imgs/copyxpath.jpg">
</p>


Once the data is pulled, it can be fed into a ggplot with minimal adjustments to produce a map such as the one seen below (not related to COVID-19, merely a contained example of the potential results of webscraping).

![alt text](https://github.com/jordanjasuta/Top10Cities/blob/master/imgs/Citiesplot.png "Final plot")


_Sources include: Wikipedia and [the Jakarta Post](http://www.thejakartapost.com/life/2017/11/03/here-are-10-of-the-most-populated-cities-in-the-world.html)_


### heavy formatting
However, not all data is stored in lightly formatted tables. Many countries are publishing daily updates - really useful information! - but in cumbersome, heavily formatted websites. 

<p align="center">
  <img width="80%" src="https://github.com/jordanjasuta/Top10Cities/blob/master/imgs/Belize_table.jpg">
</p>

_Source: [Government of Belize](https://covid19.bz/)_

To address this, I came up with a quick for loop to automate these datapulls, using Belize's website as an example. Each subsequent running updates the dataframe with a new line, automatically adding the date of the update. Bonus points if you can run it as a scheduled job. Code can be found in `COVID_webscraping.R`.

<p align="center">
  <img width="80%" src="https://github.com/jordanjasuta/Top10Cities/blob/master/imgs/COVID_df.jpg">
</p>

These data can be updated automatically, and easily merged with corresponding data from other countries into master datasets to produce [regional](https://www.paho.org/en/tag/covid-19-situation-reports) and [global](https://www.who.int/emergencies/diseases/novel-coronavirus-2019/situation-reports/) reports and [interactive maps](https://who.maps.arcgis.com/apps/webappviewer/index.html?id=2203b04c3a5f486685a15482a0d97a87&extent=-20656313.6818%2C-3596894.4332%2C1611932.8945%2C7390469.7606%2C102100&site=paho). 
