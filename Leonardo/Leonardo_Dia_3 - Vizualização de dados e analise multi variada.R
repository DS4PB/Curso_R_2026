#Curso basico de R - Gvenck
#29-05-2026
#Dr. Leonardo da Costa

#Contatos:
#email: leo.olaveirasc@outlook.com
#linkedin: /in/leonardo-oliveirasc/

#Packages
library(agricolae)
library(dplyr)
library(terra)
library(geodata)
library(car)
library(pls)
library(ggplot2)

# ----- Modulo 3 - Análise multivariada e Vizualização de dados  -----

#Data - Eucaliptus clones productivity
#Bio variables (WorldClim bioclimatic variables)

#Bio_1  - Annual mean temperature
#Bio_2  - Mean diurnal range (day-night temperature variation)
#Bio_3  - Isothermality
#Bio_4  - Temperature seasonality
#Bio_5  - Maximum temperature of warmest month
#Bio_6  - Minimum temperature of coldest month
#Bio_7  - Annual temperature range (Bio5 - Bio6)
#Bio_8  - Mean temperature of wettest quarter
#Bio_9  - Mean temperature of driest quarter
#Bio_10 - Mean temperature of warmest quarter
#Bio_11 - Mean temperature of coldest quarter
#Bio_12 - Annual precipitation
#Bio_13 - Precipitation of wettest month
#Bio_14 - Precipitation of driest month
#Bio_15 - Precipitation seasonality
#Bio_16 - Precipitation of wettest quarter
#Bio_17 - Precipitation of driest quarter
#Bio_18 - Precipitation of warmest quarter
#Bio_19 - Precipitation of coldest quarter

#Additional environmental variables

#bdod30.60cm_mean - Soil bulk density
#cec30.60cm_mean  - Cation exchange capacity
#clay30.60cm_mean - Clay content
#sand30.60cm_mean - Sand content
#elev              - Elevation

#mai - Mean Annual Increment

#Data - Eucalyptus clones productivity


clone<-read.csv()

# ----- Basic exploratory analysis -----
str(clone)

#Number of obs by clone
tapply(clone$reg,clone$gen,length)

#Mean MAI by clone


#Picking one clone
clone.sel<-clone[,]
str(clone.sel)

#Check for NA
sum.na<-function(x) sum(is.na(x))

#apply() -> for data frames


#Excluding NA | na.exclude()
clone.sel<-
apply(clone.sel,2,sum.na)

#Ploting data

#Brazil's map
br<-gadm(country = 'BRA',path = tempdir())
plot(br)

#Points
points<-vect(clone.sel,geom=c('lon','lat'))
plot(points,add=T)

#Preparing data [!]Important Package
clone.sel<- clone.sel %>%
  dplyr::select(mai,bdod30.60cm_mean:elev)


#Correlations (pairwise)
cors<-
cors

heatmap(cors)

#Predictors vs Response
cors[,] #character indexation

#Scatter plot


#Exploring mai values | boxplot()

# ----- Linear regression -----

#> Adjusting model (Naive) | lm()
lm.clone<-
anova(lm.clone)

#Summary
summary(lm.clone)

#Observe that:
#1) Many variables are not significant
#2) Environmental variables are highly correlated
#3) The model may present multicollinearity - One coefficient could not be estimated
#4) Using all predictors is usually not the best strategy

#Bio7 = Bio5 - Bio6 -> Redundant
cor(clone.sel$bio_7,
    clone.sel$bio_5 - clone.sel$bio_6)

#> Scaling predictors

#Environmental variables have different scales
#Examples:
#Temperature
#Precipitation
#Elevation

#Scaling centers variables around mean 0 and variance 1
clone.scale <- clone.sel
clone.scale[,-1] <- scale(clone.scale[,-1])
clone.scale

#New model
lm.scale <- lm(mai ~., data = clone.scale)
summary(lm.scale)

#> Measuring colinearity
#Correlation heatmap already suggested strong collinearity

#Variance inflation factor (VIF) | vif()


#High VIF values indicate redundant predictors
#Usually:
#VIF > 5  -> moderate collinearity
#VIF > 10 -> severe collinearity

#>How to deal with collinearity?
#Naive models with all variables can overfit

#1) Stepwise selection | step()
lm.step <- 

summary(lm.step) 
vif(lm.step) #VIF

#2) Most correlated variables | sort()
lm.cor <- lm(mai ~ , data = clone.scale)
summary(lm.cor)
vif(lm.cor)

#3) Principal component Analysis for regression

env <- clone.scale[,-1]

#PCA | prcomp()
pca <-
summary(pca)

#Scores
head(pca$x)

#Biplot
biplot(pca)

#PCA regression
pcs <- as.data.frame(pca$x)

#Combining with response
pcs$mai <- clone.scale$mai

lm.pca <- lm(mai ~ ,data = pcs)
summary(lm.pca)
vif(lm.pca)


#Vantagens: Solucao unica, coeficientes confiaveis
#Desvantagens: Nao interpretabilidade

# ---- Clustering ----

#Preparing data
nlocs<-nrow(clone.scale)

set.seed(123)
sel.indx<-sample(nlocs,size = 10)
sel.envs<-clone.scale[sel.indx,]

#Filter
env.data <- sel.envs[,-1]

# -- Hierarchical clustering --

dist.env <- dist(env.data)

dist.env

#Agglomerative clustering
hc <- hclust(dist.env)

#Dendrogram
plot(hc,
     main = "Hierarchical Clustering",
     xlab = "Environments",
     sub = "")

#Cutting dendrogram

#Creating 3 groups
groups.h <- cutree(hc,k = 3)
groups.h

# -- Kmeans --

#K-means requires defining number of clusters
kmeans.env <- kmeans(
  env.data,
  centers = 3,
  nstart = 300
)

#Membership
groups.kmeans<-kmeans.env$cluster

#Centers
kmeans.env$centers

#Vizualizing
plot(
  env.data[,1],
  env.data[,2],
  col = kmeans.env$cluster,
  pch = 19,
  xlab = names(env.data)[1],
  ylab = names(env.data)[2],
  main = "K-means clustering"
)


#Comparing clusters
data.frame(Kmeans= groups.kmeans,Hierarchical = groups.h)

#Extra:
# -- Principal component Analysis for clustering --

#read markers maize_markers_selected.csv (Filter details above) 
maize.mkrs<-read.csv()

#Checking the dimensions | dim()


#PCA |prcomp
pca.mkrs<-

#Checking the variance
summary(pca.mkrs)

#PCs:
pcs<-pca.mkrs$x

#Preparing data:
df.pca<-data.frame(pcs)
df.pca$GEN<-rownames(df.pca)

#Plot | ggplot()



# ----- Data Vizualization ----

#Free time!
#What plots you want to test?







#Details:
# Markers data cleaning
library(snpReady)

#read markers
maize.mkrs<-read.csv('Dia 3/maize_markers.csv',sep=';')

#Checking the dimensions | dim()

#Cleaning markers data
popgen.mkrs<-popgen(maize.mkrs)
mrks.stats<-popgen.mkrs$whole$Markers

#Filter for MAF > 0.05
mrks.stats.filter<-mrks.stats[mrks.stats$MAF>0.05,]
sel.mrks<-rownames(mrks.stats.filter)

#Filtering markers
sel.mkrs<-maize.mkrs[,sel.mrks]

dim(maize.mkrs) #Before
dim(sel.mkrs) #After filter

#saving
write.table(sel.mkrs,'Dia 3/maize_markers_selected.csv',sep=';')
