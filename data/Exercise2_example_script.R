####Estimating forest carbon: a case study of oak woodlands at Sedgwick Ranch Reserve
#####Exercise 2
rm(list=ls())
#Load Packages
library(readxl)
library(tidyverse)
library(kableExtra)
library(ggplot2)
library(formattable)

#Read in plot xlsx data for each plot
p1<-read.csv("Plot1.csv", header=T)
head(p1)
p2<-read.csv("Plot2.csv", header=T)
head(p2)
p3<-read.csv("Plot3.csv", header=T)
head(p3)

#parameters for Jenkins:
b0_j<--0.7152
b1_j<-1.7029

#Calculate aboveground biomass per tree (log is ln in R)
p1$bm_jenkins<-exp(b0_j+b1_j*log(p1$dbh))

  #repeat for plot 2 and 3 and make a table of results

#paramters for KC:
b1_kc<-0.068
b2_kc<-2.569

#Calculate aboveground biomass per tree
p1$bm_kc<-b1_kc*(p1$dbh^b2_kc)

  #repeat for plot 2 and 3 and make table of results

#Make plots of the biomass dbh relationship for both the Jenkins and KC methods (can be done for each plot individually or all together):


#Biomass and carbon:
totalplotarea<-(50*25)*0.0001 #50 meter by 25 meter, converted to hectares
carboncontent<-.4585 #The carbon content of branch/stem material combined ranged from 45.06% to 46.70%, with a mean of 45.85% (SE 0.276%); mean can be used to convert biomass to carbon storage

#Calculate aboveground biomass per plot for Karlik_Chojnacky
p1_bm_kc<-sum(p1$bm_kc)

  #repeat for plot 2 and 3 and turn into a table of results; then calculate biomass per plot per square meter based on total size of the plot


#Convert estimate to tree carbon per hectare (hint: use 'carboncontent' variable to convert biomass estimates to carbon; then use 'totalplotarea' in hectares variable to convert to carbon per hectare)
  #make a table of the output
