file<- "B:/study/Fall 2018/Stats for DS/Project1/Datasets/Ethereum token graphs/networkbnbTX.txt"
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
sells <- mydata[1]


#graph2
buys <- mydata[2]
g_range <- range(0, mydata$V2)
plot(x=mydata$FROMNODE, y= mydata$TOKENAMOUNT, title(main="Number of tokens bought by addresses", sub="Buyers", ylab="Tokens"))
#par(tcl= -0.2)
#axis(1, at=100*g_range[1], labels=F, lwd=1, lwd.ticks=1)
#par(tcl= -0.5)
#axis(1, at=10000*g_range[1], labels=seq(0,g_range[1],100), lwd=0, lwd.ticks=2)

