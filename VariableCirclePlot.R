seed <- 124
dfx = data.frame(ev1=1:10, ev2=sample(10:99, 10), ev3=10:1)
with(dfx, symbols(x=ev1, y=ev2, circles=ev3, inches=1/3, ann=T, bg="steelblue2",
                  fg=NULL, xlab="ev1 value", ylab="ev2 value", main="Circle Plot"))