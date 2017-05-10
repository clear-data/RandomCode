## CoinToss_DiceRoll_Simulations.R

## Coin Tossing Simulation

index <-1

while(index <= 10) {
    seed <-index
    results <- sample(c(-1,1), 1000, replace = TRUE)
    plot(cumsum(results), type = 'l')
    index <- index +1
}

## Dice Rolling

two.dice <- function(){
    dice <- sample(1:6, size = 2, replace = TRUE)
    return(sum(dice))
}

replicate(n = 20, expr = two.dice())
hist(replicate(n = 20, expr = two.dice()), breaks=c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12))
hist(replicate(n = 20000, expr = two.dice()), breaks=c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12))

## More parameterized dice rolling - dice.sum takes the number of dice as an argument
dice.sum <- function(n.dice){
    dice <- sample(1:6, size = n.dice, replace = TRUE)
    return(sum(dice))
}

replicate(50, dice.sum(2))
hist(replicate(50, dice.sum(2)), breaks=c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12))
hist(replicate(50000, dice.sum(2)), breaks=c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12))

sims <- replicate(50, dice.sum(2))
table(sims)
table(sims)/length(sims)
plot(table(sims), xlab = 'Sum', ylab = 'Frequency', main = '100 Rolls of 2 Fair Dice')
plot(table(sims)/length(sims), xlab = 'Sum', ylab = 'Relative Frequency', main = '100 Rolls of 2 Fair Dice')
