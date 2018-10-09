library(plyr)

file<-'/Users/pushpitapanigrahi/Desktop/PushpitaFiles/Study/4.StatsForDS/Proj1/Selected/networkbnbTX.txt'
#file<- "D:/UTD/Academics/Fourth Sem/Stats for Data Science - Cuneyt/Project1/Token Graphs/networkbnbTX.txt"
col_names <- c("FROMNODE","TONODE","TIME","TOKENAMOUNT")
mydata <- read.csv( file, header = FALSE, sep = " ", dec = ".", col.names = col_names)
amounts <- mydata[4]

totalSupply <- 192443301
subUnits <- 18
totalAmount <- totalSupply * (10 ^ subUnits)

print(totalAmount)
print(nrow(amounts))

count <- 0
for( a in 1:nrow(amounts)){
  if( a > totalAmount){
    print(a)
  }
  else{
    count <- count + 1
  }
}
print(count)


#graph1
countFromDf <- count(mydata, "FROMNODE")
#sort(countDf$freq, decreasing = TRUE)
#sum(countDf$freq)
plot(x=countFromDf$FROMNODE, y= countFromDf$freq, main="Number of tokens sold by addresses", sub="Sellers",xlab="FROM NODE", ylab="TOKEN AMOUNT")

#graph2
countToDf <- count(mydata, "TONODE")
plot(x=countToDf$TONODE, y= countToDf$freq, main="Number of tokens bought by addresses", sub="Buyers",xlab="TO NODE", ylab="TOKEN AMOUNT")
# 
# g_range <- range(0, mydata$FROMNODE)
# print(g_range)
# par(tcl= -0.2)
# axis(1, at=100*g_range[1], labels=F, lwd=1, lwd.ticks=1)
# par(tcl= -0.5)
# axis(1, at=10000*g_range[1], labels=seq(0,g_range[1],100), lwd=0, lwd.ticks=2)

