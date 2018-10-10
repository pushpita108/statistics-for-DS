#install.packages("pylr")
#install.packages("ggplot2")
library(plyr)
library(ggplot2) 

#file<-'/Users/pushpitapanigrahi/Desktop/PushpitaFiles/Study/4.StatsForDS/Proj1/Selected/networkbnbTX.txt'
file<- "D:/UTD/Academics/Fourth Sem/Stats for Data Science - Cuneyt/Project1/Token Graphs/networkbnbTX.txt"

col_names <- c("FROMNODE","TONODE","TIME","TOKENAMOUNT")
mydata <- read.csv( file, header = FALSE, sep = " ", dec = ".", col.names = col_names)
amounts <- mydata[4]

totalSupply <- 192443301
subUnits <- 18
totalAmount <- totalSupply * (10 ^ subUnits)

#print meta data 
message('Maximum allowed amount : ', totalAmount)
count <- 0
outliers <- 0
for( a in 1:nrow(amounts)){
  if( a > totalAmount){
    outliers <- outliers + 1
  }
  else{
    count <- count + 1
  }
}
message('Number of outliers : ',outliers)
message('Number of valid amounts : ',count)


#graph1
countFromDf <- count(mydata, FROMNODE)
#plot(x=countFromDf$FROMNODE, y= countFromDf$freq, main="Number of tokens sold by addresses", sub="Sellers",xlab="FROM NODE", ylab="Transactiont Count")
#ggplot(countFromDf, aes(n,FROMNODE))+geom_point()
#ggplot(countFromDf, aes(FROMNODE,freq))+geom_boxplot()
countFromFf <- count(countFromDf, n)
ggplot(countFromFf, aes(x= n))+geom_density() +xlab("Frequency") +ylab("Number of Seller (Density)")
# gg <- countFromDf %>%
#   dplyr::select(FROMNODE,n) %>%
#   group_by(n) %>%
#   summarise(NumNodes = sum(FROMNODE))
# 
# gg

#graph2
countToDf <- count(mydata, TONODE)
countToFf <- count(countToDf, n)
ggplot(countToDf, aes(x= n))+geom_density() +xlab("Frequency") +ylab("Number of Buyers (Density)")

#plot(x=countToDf$TONODE, y= countToDf$freq, main="Number of tokens bought by addresses", sub="Buyers",xlab="TO NODE", ylab="Transactiont Count")
# 
# g_range <- range(0, mydata$FROMNODE)
# print(g_range)
# par(tcl= -0.2)
# axis(1, at=100*g_range[1], labels=F, lwd=1, lwd.ticks=1)
# par(tcl= -0.5)
# axis(1, at=10000*g_range[1], labels=seq(0,g_range[1],100), lwd=0, lwd.ticks=2)

