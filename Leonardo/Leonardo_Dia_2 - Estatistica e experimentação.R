#Curso basico de R - Gvenck
#28-05-2026
#Dr. Leonardo da Costa

#Contatos:
#email: leo.olaveirasc@outlook.com
#linkedin: /in/leonardo-oliveirasc/

#Packages
library(agricolae)
library(dplyr)
library(fBasics)
library(car)
library(FielDHub)
source('./Funcoes_auxiliares.R')

# ----- Modulo 2 - Estatistica e Experimentacao-----

iris<-read.csv('') # Use ../ to return one directory

#>Estatisticas descritivas

#Mean | mean()

#Median | median()

#Variance | var()

#Coeficient of variation
cv<-function(x) sd(x)*100/mean(x)

#Means by group | tapply function (value, group, function)


#Structure | str()

#Converting the classes | transform()

#Plot | plot()

#Using fBasics | basicStats()



# ----- DIC -----

#Importing data

#CC (Spcsv) = Sweetpotato chlorotic dwarf
#FF (Spfmv) = Feathery mottle, 
#FC (Spfmv y Spcsv) = Viral complex
#OO (witness) healthy plants. 

sweet<-read.csv("")

#Data Structure
str(sweet)

#Means
tapply(sweet$yield,sweet$virus,mean)

#Checking for missing data
missing<-function(x) sum(is.na(x))

#Use apply to count missing data


#Or use is.na()


#Model (aov\lm) - 1º MODEL!

#Building the model:
aov.sweet<- aov()

#ANOVA | anova()


#>Assumptions:

#Normality of residuals
res<-aov.sweet$residuals
shapiro.test(res)

#Homogeneity of variances
bartlett.test(yield ~ virus, data = sweet)

#Independence of errors
durbinWatsonTest(aov.sweet)

#If assumptions are met:
#Tukey test
tukey<-LSD.test(aov.sweet,trt = 'virus')
bar.group(tukey$groups,ylim=c(0,45))

#Intepretation
#Sob o nivel de significancia de 5% do teste F de Snedecor, (rejeita ou não rejeita??) H0. 
#Logo, (há ou não diferenças?) entre os virus avaliados na produtividade. 


# ----- DBC -----

#Importing data
milho<-read.csv('')

#Data Structure
str(milho)

#transform
milho<-transform(milho, )

#Understanding block structure
interaction.plot(
  milho$Bloco,
  milho$Trat,
  milho$Prod
)

plot(milho)

#Checking for missing data
is.na(milho$Prod)

#DBC Model

#Building:
aov.milho<-aov(Prod  ~  ,data = milho)

#ANOVA
anova(aov.milho)

#>Assumptions:

#Residuals normality
res<-aov.milho$residuals
shapiro.test(res)

#Homogeneity of variances
bartlett.test(Prod  ~ Trat,data = milho)
plot(aov.milho)
hartley_test(response = milho$Prod,group = milho$Trat)

#Independence of errors
durbinWatsonTest(aov.milho)

#If assumptions are met:
#Tukey test
tukey<-LSD.test(aov.milho,trt = 'Trat')
bar.group(tukey$groups,ylim=c(0,20))

#[!]Extra) SkottKnott
library(ScottKnott)
scottknott<-SK(aov.milho,'Trat')
plot(scottknott)

#[!]Extra) Experimental quality

#H² = varG/varF

#1st way
QMG<-anova(aov.milho)[2,3]
QME<-anova(aov.milho)[3,3]

h2<-(QMG-QME)/(QMG)

#2nd Way
varG<-(QMG-QME)/4
varF<-QMG/4

varG/varF
varG/(varG+QME/4)

#CVe
#sqrt(QME)*100/mean(Y)


# ----- Experimental design randomization -----

trt<-paste0("Hybrid_",1:20)

# Completely randomized
dic <- design.crd(
  trt =  ,  #Treatments
  r = ,    #Replicates                    
  seed = 123,                   
)

dic$book

# Complete blocks
dbc <- design.rcbd(
  trt =  ,  #Treatments
  r =  ,    #Replicates                    
  seed = 123,         
)

dbc$book
dbc$parameters
dbc$sketch

# Fieldbook
fieldbook <- zigzag(dbc)
print(matrix(fieldbook[,1],byrow=TRUE,ncol=8))

#>FielDHub
run_app()

#EXTRA:
# ----- Multi Environment -----
library(metan)

#Metan dataset
data_ge2

#Structure
str(data_ge2)

#Building the model:
aov.ge<-aov(KW  ~ ,data = data_ge2)

#ANOVA
anova(aov.ge)

#>Assumptions:

#Residuals normality
res<-aov.ge$residuals
shapiro.test(res)

#Homogeneity of variances
bartlett.test(KW  ~ GEN,data = data_ge2)
plot(aov.ge)
hartley_test(response = data_ge2$KW,group = data_ge2$GEN)

#Independence of errors
durbinWatsonTest(aov.ge)

#If we can trust
#Tukey test
tukey<-LSD.test(aov.ge,trt = 'GEN')
bar.group(tukey$groups,ylim=c(0,250))

#But which genotypes perform best in each environment?
library(emmeans)

#BLUEs
ge<-emmeans::emmeans(aov.ge,specs = c('GEN','ENV'))

#Best Hybrid by environment
as.data.frame(ge)%>%
  group_by(ENV) %>% 
  slice_max(emmean) #Don't worry about the sintaxe!

#G x E Interaction
interaction.plot(
  x.factor = data_ge2$ENV,
  trace.factor = data_ge2$GEN,
  response = data_ge2$KW,
  col = rainbow(length(unique(data_ge2$GEN))),
  lwd = 2
)

