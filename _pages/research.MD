---
layout: page
title:  "Research"
date:   2018-09-05 21:49:35 +0100
categories: Page
permalink: /research/
---
<p>
Many problems, and arguably some of the most interesting and least studied are inherently relational, that is observations are inextricably linked to other observations. I am currently working on a novel stochastic social network model, the so called latent order logistic model (LOLOG). We hope to understand the model's properties better, so that it may grow into a useful tool for applied researchers. I am particularly interested in explicit network generating processes, and models that allow for this in their formulation. I have worked on the following two projects in this area during my PhD:
</p>

### LOLOG model catalog for published ERGMs
<p>
Exponential Random Graph models (ERGM) are widely used in social network analysis when modelling data where relations between actors are important. ERGMs are interpreteted as a snapshot of a network in equilibrium. We explored the empirical utility of the LOLOG model. We considered data from articles published in the Social Networks journal in which ERGMs were fit, and compare the ERGM fit to a comparable LOLOG fit. We demonstrated that the LOLOG models are, in general, in qualitative agreement with the ERGM models, as well as being typically faster and easier to fit, without the tendency for degeneracy that plagues ERGMs.
</p>

### Bayesian LOLOG
<p>
To fit the LOLOG model using a Bayesian approach, we developed a method using a Riemannian Manifold Hamiltonian Markov Chain Monte Carlo method to sample from the posterior edge permutation distribution, leading to a full valid sample from the posterior parameter distribution. This allows for a fully Bayesian approach for LOLOG models. Compared the the competing ERGM models with Bayesian approaches, this method can handle complex models on moderately sized networks within a reasonable computational time frame.
</p>

### Other areas and future research
<p>
I am also interested in the applications of generative models for social networks, in particular their use in the age of very large web based data sets. By their nature generative models are tough to adapt to very large networks, though they give a much stronger insight to networks than simpler models. Key insights on network data surely is an area that can only grow in the future.
</p>

<p>
Spatial point process models, are in some way analogous to social network models; both seek to allow for the fact that the observations are not independent. Similar problems exist in both fields, namely the intractability of normalizing constants. I wish to explore this relationship, and investigate if methods in both fields may be complimentary.   
</p>
