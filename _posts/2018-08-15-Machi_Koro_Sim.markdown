---
layout: post
title:  "Machi-Koro Sim"
date:   2018-08-15 21:49:35 +0100
categories: Post
---
<br>
Machi Koro is a card and dice based game, where each player is a mayor of a growing Japanese town. The mayor must purchase buildings - the cards, in order to accumulated enough money to build all their landmarks and win the game by doing this first. Since each card has a fixed effect determined by the dice roll, this seemed to me to be a perfect example of a game that it should be easy to test out some fun strategies on. 

Another nice feature of the game is that the cards are quite different but overall very balanced, that is a random buying strategy performs quite well and games are always close. This is great for the game since it means anyone can play and win in a single game.

I also though that it should be possible to calculate the mean and variance of each possible combination of cards, and thus produce a program that advises the player on cards that lie on the efficient frontier in a portfolio theory sense.

I have built an R program that simulates the Machi Koro game, and also allows for arbitrarily complex strategies, that depend on every variable in the game, i.e. the current game setup and also the strategies of the opposing players.

I have not yet performed extensive testing, but hope to and hope to build this into a fun little applet with shiny at some point.

I also made some functions to apply the mean-variance idea, but run time is currently an issue in R since the sample space is quite large, I may if I have time in the future re write in c++ to enable more complex strategies.


