---
layout: page
title: "UCLA Cycling Strava Club Network Analysis"
author: "Duncan Clark"
date: "September 2019"
output: html_document
---



## Introduction

My research is in stochastic social network models, I thought I would try out some exploratory analysis on some everyday social network data in an app that I use everyday - Strava. I looked at the different clubs that people on strava affiliate with and see if I could come up with a helpful analysis of the networks. As a test case I used the UCLA cycling team network.

Briefly as per standard network analysis I treat a network as a set of nodes some of which are connected. In this case the nodes are the Strava athletes in a club, with node i being connected to node j if node i follows node j. The network is thus directed. The nodeset is treated as fixed for a given network, with the edges between the nodes being random, i.e. whether or not they are present is treated probablistically. 

The first challenge was to gather the data, which I managed to do with the help of the excellent [Rvest](http://rvest.tidyverse.org/) package to scrape club data, and the [rStrava](https://github.com/fawda123/rStrava) package to scrape individual athelete data where available.

Once the data was scraped I could carry out the usual network exploratory analysis to see what I was dealing with and hopefully point towards interesting features of the network. This also helps inform me of possible modelling strategies to understand the network more deeply.

## Exploratory Analysis

First things first I plotted the network, which can be helpful in smallish networks. The UCLA cycling team strava network had 183 nodes i.e. connected with 1754 edges. We call the degree of a node the number of ties it had - either in or out.

<img src="/figure/./_pages/UCLA_net_strava/unnamed-chunk-1-1.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" width="100%" style="display: block; margin: auto;" />

Graphically, we can see that there is a dense body of highly connected nodes with some sparsely connected outlying nodes. It is not obvious if the degree of a node is related to the average monthly distance from the plot, though we could certainly test for this. Their seem to be two particularly interesting nodes, in the degree plot there is one very central highly connect node. It turns out that this node follows many people but is not followed by very many people in the group, this might be someone who at some point of other just followed everyone on the UCLA cycling team without knowing anyone - this does happen! There is also an outlier in terms of monthly distance, looking up their name this turns out to be our friendly pro cyclist and UCLA alumni [Sam Boardman]([https://www.strava.com/athletes/6174220]), no real surprise that he's putting the miles in.

So to understand the social processes at work in the formation of the network I next considered the degree distribution of the network. T
<img src="/figure/./_pages/UCLA_net_strava/unnamed-chunk-2-1.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" width="100%" style="display: block; margin: auto;" />

This is what one might conside typical for a social network, with most nodes of low degree, tapering off but leaving a few very high degree nodes. These nodes are popoular in the sense that they follow or are followed often. One might imagine these people are ride organisers or people who run the club in some capacity, or just people that are really friendly! The histogram might suggest a power law type degree distribution.

The next distribution of interest is the edgewise shared partners (ESP) distribution. A node i has and edgewise shared partner with another node j if both i and j are connectected to another node k. Essentially the number of edgewise shared partners a node has is the number of triangles the node is involved in, though with directed networks there is a larger variety of possible triangle types.

<img src="/figure/./_pages/UCLA_net_strava/unnamed-chunk-3-1.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" width="100%" style="display: block; margin: auto;" />
 
Typically in social networks we see a large dropping of in the ESP distribution similiar to the degree distribution, with most nodes only having few ESPs. However for this network, thre is a large portion of nodes tha have up to around 25 ESPs, and having more than that is unusual. A large portion of nodes do seem to be highly inter connected, which I suggest represents the active core of the team, with the low ESP nodes being people wanting to affiliate with the team but don't ride or participate with the team too often.

Next we can look at some more specialized metrics for network analysis. Degree is a meaure of centrality, intuitively centrality is the concept of being important or central to the network. We look at two other concepts that quantify centrality, closeness and betweeness. Closeness measures a nodes centrality based on its ability to reach other nodes, betweeness measures a nodes centrality based on some notion of how many paths pass through that node. One can also consider recursive centrality measures, where a node is considered to be highly central if it is connected to other highly central nodes.

Closeness is defined as 
\begin{align*}
C_{C}(n_i) = \sum_{j=1}^{g} \frac{1}{d(n_i,n_j)}
\end{align*}
where g is the total number of nodes, d is some distance measure. So nodes with high closeness have on average short distances to other nodes. Such a node may be able to disemminate information quickly in a network, but could also have limited direct influence.

The betweeness of a node is defined as 
\begin{align*}
C_{B}(n_i)= \sum_{j<k} \frac{g_{jk}(n_{i})}{g_{jk}}
\end{align*}
Where $g_{jk}$ is the number of geodesics between nodes j and k, and $g_{jk}(n_i)$ is the number of geodesics between nodes j and k containing node i. Nodes with high betweeness act as gatekeeper nodes, perhaps keeping two factions of the network apart, though may not be able to influence many people in each directly.

Nodes with high recursive centrality are connected to many other highly central nodes. Using some algebra it turns out that this is related to the eigenvectors of the adjacency matrix. Nodes with high entries in the eigen vector associated with the largest eigen value are highly central. 

We can similary to before plot histograms of the distribution of nodal centralities in the network.

<img src="/figure/./_pages/UCLA_net_strava/unnamed-chunk-4-1.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" width="100%" style="display: block; margin: auto;" />

The highly skewed betweeness histogram may suggest the presence of a number of broker nodes, through which people know each other. THe closeness histogram looks roughly symmetric, which suggests against the presence of some highly central nodes that many are close to. The skewness and heavy right tail of the eigen value centrality distribution may suggest that there is a group of nodes that are highly central and connected, possibly the broker nodes.

In addition to nodewise measures of centrality we can also consider network level measures for each of the above centrality measures. We list these as a percentage of the maximum possible value for network centrality for that particular measure. The network centrality is defined as 
\begin{align*}
C_{network} = \frac{\sum_{j=1}^{g}\left( C_{max} - C_i \right)}{\text{max}\left( \sum_{j=1}^{g}\left( C_{max} - C_i \right) \right)}
\end{align*}

We can see that all the network centralisation measures suggest that overall this is not a particularly centralised network.

<table class="table" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:right;"> eigenvalue </th>
   <th style="text-align:right;"> closeness </th>
   <th style="text-align:right;"> betweenness </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 0.166 </td>
   <td style="text-align:right;"> 0.209 </td>
   <td style="text-align:right;"> 0.1317 </td>
  </tr>
</tbody>
</table>


# Further Work

The above really just looks at summarising the models. The real meat of my academic work is modelling them, i.e. coming up with a model that could generate similar networks. This is the next step in the analysis, which I hopefully will get round to soon! I would also like to scrape some more networks and compare their properties to see if some strava networks are structurally different to others.
