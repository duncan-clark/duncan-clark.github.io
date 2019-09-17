---
layout: page
title: "TTT Data Analyis"
author: "Duncan Clark"
date: "March 17, 2019"
---
<br>

TLDR : Find some TTT analysis [here](https://duncan-clark.github.io./files/TTT_report_0005_DavisTTT_2018_2.html) and [here](https://duncan-clark.github.io./files/TTT_report_0009_NationalsTTT_2018.html).

I have been collecting and analysing team time trial (TTT) data from the UCLA cycling team. The aim is twofold. Firstly given a single TTT can we assess performance of the team and suggest improvements. Secondly given many TTTs can we make suggest the best way to ride a TTT, for a given composition of riders. Example reports for two TTTs can be found [here](https://duncan-clark.github.io./files/TTT_report_0005_DavisTTT_2018_2.html) and [here](https://duncan-clark.github.io./files/TTT_report_0009_NationalsTTT_2018.html).

The key problem in is the identification of the rider at the front at any given time. This is actually an interesting unsupervised learning problem, since we have no data on who the true front rider is. The problem is that typically GPS is not accurate enough on bike computers to detect which rider is at the front of a pace line. This means that I had to use the other data from the riders to find the front rider. If you've ridden a TT you might think that this would be easy - just pick the rider that is working hardest! However all the data we have for this power and heart rate are super noisey, which makes it quite challenging.

I developed an algorithm to identify the front rider, currently it uses a tuned k means clustering on the smoothed power outputs for each rider. This is then constrained by allowing changes in the front rider only when the front rider slows relative to the group i.e. pulls of the front, this helps reduce the noise, though clearly this is not perfect. The number of groups, the power smoothing, and the speed differential required are all parameters that are currently selected by hand.

Once we have the rider on the front the primary quantity of interest is the power to drag ratio, since air resistance is the primary resistive force in most TTTs. As a proxy for drag I am using the regression formula developed [here](https://www.ncbi.nlm.nih.gov/pubmed/15831060). Considering this relative to the FTPs of the riders present gives an idea of how well the group has used its resources to go fast.

Further individual analysis is possible, with the usual TSS and IF metrics available, in addition to power while on the front for each rider. This gives us an idea of how hard each rider contributed, and how hard they contributed whilst on the front. 

There is much to be done with this! Essentially it is an optimization problem, using the resources of the team to acheive the highest power to drag ratio on the front. However quantifying the riders resources is quite tricky, since what really matters is not something simple like FTP, more something much more complex like how many 30 seconds efforts above threshold whilst recovering for 2 minutes below threshold can you do.


