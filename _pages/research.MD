---
layout: page
title:  "Research"
date:   2018-09-05 21:49:35 +0100
categories: Page
permalink: /research/
---
<p>
Many problems, and arguably some of the most interesting and least studied are inherently relational, that is observations are inextricably linked to other observations. The majority of my work has been in developing methods for social network analysis, with a particularly interesting application to causal inference in a network setting.
</p>

<p>
I am also interested in spatial point process models, which are in some way analogous to social network models; both seek to allow for the fact that the observations are not independent. Similar problems exist in both fields, namely the intractability of normalizing constants. I wish to explore this relationship, and investigate if methods in both fields may be complimentary.   
</p>

### Papers Under Review

[**An Approach to Causal Inference over Stochastic Networks**](https://arxiv.org/abs/2106.14145)

**Abstract:**  Claiming causal inferences in network settings necessitates careful consideration
of the often complex dependency between outcomes for actors. Of particular importance are
treatment spillover or outcome interference effects. We consider causal inference when the
actors are connected via an underlying network structure. Our key contribution is a model for
causality when the underlying network is unobserved and the actor covariates evolve stochastically
over time. We develop a joint model for the relational and covariate generating process
that avoids restrictive separability assumptions and deterministic network assumptions that do
not hold in the majority of social network settings of interest. Our framework utilizes the highly
general class of Exponential-family Random Network models (ERNM) of which Markov Random
Fields (MRF) and Exponential-family Random Graph models (ERGM) are special cases.
We present potential outcome based inference within a Bayesian framework, and propose a
simple modification to the exchange algorithm to allow for sampling from ERNM posteriors.
We present results of a simulation study demonstrating the validity of the approach. Finally,
we demonstrate the value of the framework in a case-study of smoking over time in the context
of adolescent friendship networks.


**Comparing the Real-World Performance of Exponential-family
Random Graph Models and Latent Order Logistic
Models for Social Network Analysis**      

**Abstract:** : Exponential-family Random Graph models (ERGM) are widely used in social network
analysis when modelling data on the relations between actors. ERGMs are typically interpreted
as a snapshot of a network. The recently proposed Latent Order Logistic model (LOLOG)
directly allows for a latent network formation process. We assess the real-world performance of
these models when applied to typical networks modeled by researchers. Specifically, we model
data from the ensemble of articles in the journal Social Networks with published ERGM fits,
and compare the ERGM fit to a comparable LOLOG fit. We demonstrate that the LOLOG
models are, in general, in qualitative agreement with the ERGM models, and provide at least
as good a model fit. In addition they are typically faster and easier to fit to data, without the
tendency for degeneracy that plagues ERGMs. Our results support the general use of LOLOG
models in circumstances where ERGM are considered.  


### Working Papers

**Bayesian Inference for Latent Order Logistic Network Models**   

**Abstract:** : The Latent Order Logistic (LOLOG) model is a flexible model class for modelling
social network data. Likelihood based parameter estimation is challenging due to the complex
likelihood function. Bayesian methods have been shown to be useful for the related Exponential
Random Graph Model (ERGM). We develop a Bayesian approach for inference using the LOLOG
model. We give detailed example analysis on the well known Lazega's New England lawyers
network. We also demonstrate the method's feasibility for networks of 1000s of nodes using
the Add-Health survey data of adolescent health behaviours in schools.

