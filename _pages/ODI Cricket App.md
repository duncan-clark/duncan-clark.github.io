---
layout: post
title: "ODI Cricket Prediction Shiny App"
author: "Duncan Clark"
date: "September 1, 2018"
---
<br>

I made an app that predicts outcomes of ODI cricket matches - find it [here](https://duncan-clark.shinyapps.io/app_1/). Have a play around and let me know what you think, it certainly doesn't predict unusual scorelines particularly well, and surely could be improved! 

Somewhat following on from my previous play with visualising the cricket data, I was interested in applying some of the machine learning tools learnt in my first year classes at UCLA to see how I could do in building a predictive model for the ODI cricket results.

I excluded a little more data this time, since ODI cricket has evolved a lot in recent years, in order to help prediction of current games I only considered matches that occurred in 2010 or after.

I split the data into training and testing data and tried a large array of model I used various terms, including interaction terms for each model to determine the best performing model in terms of prediction error. A non exhuastive list is a follow:
\begin{itemize}
\item
\item
\item
\item

\end{itemize}

The best model in the end was ridge regularized logistic regression, on a subset of the available terms. Notably more flexible kernel regularized least squares did not improve, suggesting that the issues was not a mis-specified model, but inherently noisy data, this seems anecdotally reasonable.
