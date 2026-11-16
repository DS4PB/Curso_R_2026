cat("Hello word")

# hey there! 

seq(4,30,3)

clone <- c("GRA02", "URO01", "URO03", "GRA02", "GRA01", "URO01")
clone <- as.factor(clone )

# exercício

altura <- c(1.45, 1.73, 1.98, 2.10, 2.03, 1.65, 2.15, 1.63, 1.53, 1.98, 2.05, 1.52)
mean(altura)
var(altura)

nome <- c("Maria José", "Mariana", "Fernanda", "Jéssica", "Carolina", "Paulo", "Marcos", "João Paulo", "Geraldo", "Pedro")
peso <- c(72,57,49,62,57,90,53,76,63,92)
altura <- c(1.65,1.68,1.53,1.70,1.52,1.82,1.63,1.78,1.72,1.98)

aula <- data.frame("nome"=nome, "peso"= peso, "altura"= altura)

imc <- (peso/(altura^2))

aula ["imc"] <- imc

mean(imc)
var(imc)
sd(imc)

# resolver a eq 2x^2+8x + 6
a <- c(2)
b <- c(8)
c <- c(6)

delta <- (b^2) - (4*a*c)

xp <- (-b+(sqrt(delta)))/(2*a)
xn <- (-b-(sqrt(delta)))/(2*a)

attach(mtcars)
str(mtcars)
mean(mtcars$hp)
mtcars$hp <- as.factor (mtcars$hp)
mean(mtcars$hp)

set.seed(123456)

# exercício híbridos de milho da prática de terça

repeticao <- c(1,2,3,4,1,2,3,4,1,2,3,4)
tratamento <- c("L.A", "L.A", "L.A","L.A", "L.B", "L.B","L.B", "L.B", "L.ab", "l.ab", "L.ab","l.ab")
num_folhas <- c(5,4,5,"na",13, 9,10,11,6,9,9,9)
altura <- c(95, 55, 70, "na", 61, 77, 80, 97, 140, 155, 175, 170)
compr <- c(86,30,69, "na", 80,77,88,87,95,75,95,100)

dados <- data.frame ("rep" = repeticao, "trat"=tratamento, "folhas"=num_folhas, "compr"=compr, "altura"=altura)

altura_m <- dados$altura/100

altura_m <- c(0.95, 0.55, 0.70,"na", 0.61, 0.77, 0.80, 0.97, 1.40, 1.55, 1.75, 1.70)
 
dados <- cbind(dados, altura_m)

altura_m <-(dados[,5])/100


dados <- (dados$altura)/100

write.table(dados, file = "dados de milho.txt", sep=";", dec=".", row.names=FALSE)



str(dados)

if (2>3){
  print ("dois é maior que três")
} else {
  print ("dois é menor que três ")
}

if (dados[3,5]<1.5){
  print ("muito pequeno")
} else {
  print ("deve ser adequado")
}

if (dados[2,5]<1.5){
  print ("muito pequeno")
} else {
  print ("deve ser adequado")
}


maior_altura = max(dados[,5])

if(dados[1,5] == maior_altura){           # Testando com a primeira linha
  print("A planta 1 é a maior planta")
} else if (dados[2,5] == maior_altura) {  # Testando com a segunda linha
  print("A planta 2 é a maior planta")  
} else if (dados[3,5] == maior_altura) {  # Testando com a terceira linha
  print("A planta 3 é a maior planta")  
} else if (dados[4,5] == maior_altura) {  # Testando com a quarta linha
  print("A planta 4 é a maior planta")  
} else if (dados[5,5] == maior_altura) {  # Testando com a quinta linha
  print("A planta 5 é a maior planta")  
} else {                                  # Cansei
  mensagem = paste("Vou ter que escrever", nrow(dados), "linhas?")
  print(mensagem)  
}

for (i in 1:20){
  print (i)
}

for (bruna in 1:5){
  print (bruna)
}

test <- rep(2, times=15)
for (i in 1:10){
   test[i] <- test[i]*10
}
test


for(i in 1:nrow(dados)){ 
  if(dados[i,5] < 1.5){
    print("Híbrido pequeno demais")
  } else if (dados[i,5] > 1.5 && dados[i,5] < 2.0){
    print("Tamanho OK")
  } else {
    print("Cresceu demais")
  }
}

maior_altura = max(dados[,5])

# Usando laço de repetição
for(i in 1:nrow(dados)) {
  if (dados[i, 5] == maior_altura) {
    print(paste("A planta", i, "é a maior planta"))
  }
}

indice = which(dados[,5] == maior_altura)
print(paste("A planta", indice, "é a maior planta"))


ex_mat <- matrix(nrow=10, ncol=10)

# cada número dentro da matrix será o produto no índice da coluna pelo índice da linha
for(i in 1:dim(ex_mat)[1]) {
  for(j in 1:dim(ex_mat)[2]) {
    ex_mat[i,j] = i*j
  }
}

ex_mat


if(17933%%79 == 0){
  print ("É divisível")
} else {
  print ("Não divisível")
}



if(17933%%79 == 0){
  print ("É divisível")
} else if (17933%%79 == 0 && 17933%%1 == 0){
  print("Número primo")
} else {
  print ("Não é primo")
}

for (i in 150:200){
  if (i%%i == 0){
    print ("divide por ele")
  } else if (i%%i == 0 && i%%1 == 0){
    print ("É primo")
  } else {
    print ("Não é primo")
  }
}
numero = which(i == "É primo")
print(paste("os números", numero, "são primos"))


# dia 3 gráficos

dados <- read.csv(file = "dados.csv", stringsAsFactors = FALSE, na.strings="-")

hist(dados$AlturaPlantas)
hist(dados$AlturaEspiga, breaks = 15, col="firebrick")

?pch

estande <- dados$Estande
barplot(estande)
comb <- table(dados$Estande,dados$AlturaEspiga)
barplot(comb, col="tomate3")
colors()

boxplot(dados$Hibrido~dados$Tempo)


png(filename = "grafico_pontos.png", width = 1500, height = 1500, res= 300)
plot(x = dados$AlturaPlantas, y= dados$AlturaEspiga, 
     main = "Altura da prim. espiga  x Altura da planta", #Título principal 
     xlab = "Altura de plantas", #Eixo x
     ylab = "Alturada prim. espiga", #Eixo y
     cex=2,
     cex.axis=1.5)
dev.off()  

install.packages("desplot")

library(desplot)
row <- rep(rep(1:10, each=5),4)
col <- c(rep(1:5,10),rep(6:10,10), rep(11:15,10), rep(16:20,10))
dados.up <- cbind(col, row, dados)

desplot(Bloco ~ col+row, dados.up,
        text=Hibrido, cex=0.5, out1=Bloco,
        out2=Hibrido, out2.gpar=list(col = "gray50", lwd = 1, lty = 1))

dados_pim <- read.csv("pimenta_data.csv")
str(dados_pim)

dados_pim$gen <- as.factor(dados_pim$gen)
dados_pim$rep <- as.factor(dados_pim$rep)

tapply(dados_pim$alt, dados_pim$gen, summary)

cor(dados_pim$alt, dados_pim$prim_in)
cor(dados_pim$prod, dados_pim$alt)

plot(dados_pim$alt~dados_pim$prod, xlab= "produção", ylab= "altura da planta (cm)", main = "genótipos de pimenta jalapeño")
abline(lm(alt ~ prod, data = dados_pim), col="red")
mod1 <- aov(alt ~ gen, data = dados_pim)
summary(mod1)

modaov <- aov(alt ~ gen, data = dados_pim)
tukey.test <- TukeyHSD(x=modaov, 'gen', conf.level=0.95)
tukey.test
