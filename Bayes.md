---
title       : Some bayesan fun with beta dist
subtitle    : Coursera project
author      : Jakub Winter aka Rawrqs
job         :
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      #
widgets     : [mathjax]     # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## The app 



The application may be found at...
The application presents the behaviour of apposteriori beta distribution which is conjugate to the binomal likelihood which represents data.

There are two sliders to operate:
* apha slider
* beta slider

which are responsible for the parametres of the prior disttribution which is beta distribution

--- .class #id

## The data

The assumption is that the data is of binomal distribution.
I have hardcoded 10 observations of students at my university. They were asked a question if they were a smoker. 7 out of 10 anwered that they were smoking.
The code below presents the data and calculated likelihood:


```r
  p <- seq(from=0.005, to=0.995, by=0.005)
  T <- 10
  y <-c(0,1,0,1,1,1,0,1,1,1)
  likelihood <- sapply(p, function(p) { prod(p^y * (1-p)^(1-y)) } )
  print(y)
```

```
##  [1] 0 1 0 1 1 1 0 1 1 1
```

--- .class #id

## About calculations and output



The bayes theorem is that
$$P(\theta|\textbf{D}) = P(\theta ) \frac{P(\textbf{D} |\theta)}{P(\textbf{D})} ~~~~~|| I,$$

Assuming that the beta distribution is the prior with parameters *alpha* and *beta* and the likelihood binomal we get an aposteriori deistribution with parameters:
*alpha aposteriri* = alpha + sum(y) and *beta aposteriori* = N - sum(y), where N is the number of observations, and y is the observed data.

The output of this application is a plot with both priori and aposteriori distributions (colored as blue and red) as well as the likelihood which was drew from the data (colored as black).

The plot has been creaded using reactive expression in shiny (function: rederPlot), which allowed to make it more interactive and to change the prior distribution on the fly.

--- .class #id


## Sources

The sources for my application are as follows:

1. Shiny tutorial, where i have learned some basics and dowloaded one of thie rlayouts
2. My notes from Bayesan course from university
3. Example on how to calculate this in R from dlinzer's github

Thank you for your attention

--- .class #id
