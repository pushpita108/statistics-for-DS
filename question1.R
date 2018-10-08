file<- "/Users/pushpitapanigrahi/Desktop/PushpitaFiles/Study/4.StatsForDS/Proj1/Selected/networkbnbTX.txt"
mydata <- read.csv( file, header = FALSE, sep = " ", dec = ".")
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
