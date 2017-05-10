## Dose Curve Simulator

set.seed(124)

# 4P Parameters

log10Conc <- seq(-9.5, -5, 0.5)
log10ConcBase <- seq(-9.5, -5, 0.5)
log10ConcInsoluble <- c(-9.5, -9, -8.5, -8, -7.5, -7, -7, -7, -7, -7)

log10IP <- -7.5 # 30 nM
log10IP_High <- -6 # 1 uM
log10IP_Low <- -8.5 # 3 nM
log10ToxIP <- -4.5  # 30 uM

Minimum <- 0
MinimumHigh <- 20
Maximum <- 100
MaximumLow <-70

slope <- 1.0
slopeHigh <- 2
slopeLow <- 0.5

# 4P Equation
# obs <- Minimum+(Maximum-Minimum)/(1+10^((log10IP-log10Conc)^slope))

# noiseMask <- rnorm(10, 0, 0)


# Base Case

obs <- Minimum+(Maximum-Minimum)/(1+10^((log10IP-log10Conc)^slope))
# obs <- obsEffect + noiseMask

plot(log10ConcBase, obs, xlab = "Concentration (logM)", ylab="Effect (%)",
     main="Dose Curve, Base Case, IP = -7.5 (30nM)", col.main="steelblue",
     xlim=c(-9.5, -5), ylim=c(0, 100), pch=21, col="black", bg="grey")


# Insoluble Compound

log10Conc <- log10ConcInsoluble

obs2 <- Minimum+(Maximum-Minimum)/(1+10^((log10IP-log10Conc)^slope))
# obs2 <- obsEffect2 + noiseMask

plot(log10ConcBase, obs2, xlab = "Concentration (logM)", ylab="Effect (%)",
     main="IP = -7.5 (30nM), Max conc. = 100 nM", col.main="steelblue",
     xlim=c(-9.5, -5), ylim=c(0, 100), pch=21, col="black", bg="grey")

# Toxic Compound Obscures Signal (EC50 or IC50)
# Use log10ToxIP
log10Conc <- log10ConcBase
Tox <- Minimum+(Maximum-Minimum)/(1+10^((log10ToxIP-log10Conc)^slope))
obs <- Minimum+(Maximum-Minimum)/(1+10^((log10IP-log10Conc)^slope))
obs3 <- (100-Tox)/100 * obs

obs3[obs3 > 100] <- 100

plot(log10ConcBase, obs3, xlab = "Concentration (logM)", ylab="Effect (%)",
     main="Toxic Effect, ToxIP = -4.5 (30uM), IP = -7.5 (30nM)", col.main="steelblue",
     xlim=c(-9.5, -5), ylim=c(0, 100), pch=21, col="black", bg="grey")

# Use log10ToxIP -1
log10Conc <- log10ConcBase
Tox <- Minimum+(Maximum-Minimum)/(1+10^(((log10ToxIP-1)-log10Conc)^slope))
obs <- Minimum+(Maximum-Minimum)/(1+10^((log10IP-log10Conc)^slope))
obs3 <- (100-Tox)/100 * obs

obs3[obs3 > 100] <- 100

plot(log10ConcBase, obs3, xlab = "Concentration (logM)", ylab="Effect (%)",
     main="Toxic Effect, ToxIP = -5.5 (3uM), IP = -7.5 (30nM)", col.main="steelblue",
     xlim=c(-9.5, -5), ylim=c(0, 100), pch=21, col="black", bg="grey")

# Use log10ToxIP+1
log10Conc <- log10ConcBase
Tox <- Minimum+(Maximum-Minimum)/(1+10^(((log10ToxIP+1)-log10Conc)^slope))
obs <- Minimum+(Maximum-Minimum)/(1+10^((log10IP-log10Conc)^slope))
obs3 <- (100-Tox)/100 * obs

obs3[obs3 > 100] <- 100

plot(log10ConcBase, obs3, xlab = "Concentration (logM)", ylab="Effect (%)",
     main="Toxic Effect, ToxIP = -3.5 (300uM), IP = -7.5 (30nM)", col.main="steelblue",
     xlim=c(-9.5, -5), ylim=c(0, 100), pch=21, col="black", bg="grey")



# Fraction of molecules/cells can't be effected

Maximum <- MaximumLow
obs4 <- Minimum+(Maximum-Minimum)/(1+10^((log10IP-log10Conc)^slope))

plot(log10ConcBase, obs4, xlab = "Concentration (logM)", ylab="Effect (%)",
     main="Dose curve with true low max @ 70%, IP = -7.5 (30nM)", col.main="steelblue",
     xlim=c(-9.5, -5), ylim=c(0, 100), pch=21, col="black", bg="grey")

# Large max
Maximum <- 150
obs4 <- Minimum+(Maximum-Minimum)/(1+10^((log10IP-log10Conc)^slope))

plot(log10ConcBase, obs4, xlab = "Concentration (logM)", ylab="Effect (%)",
     main="Dose curve with max @ 150%, IP = -7.5 (30nM)", col.main="steelblue",
     xlim=c(-9.5, -5), ylim=c(0, 100), pch=21, col="black", bg="grey")

# High IP
Maximum <- 100
obs4 <- Minimum+(Maximum-Minimum)/(1+10^(((log10IP+2)-log10Conc)^slope))

plot(log10ConcBase, obs4, xlab = "Concentration (logM)", ylab="Effect (%)",
     main="Dose curve high IP = -5.5 (3 uM)", col.main="steelblue",
     xlim=c(-9.5, -5), ylim=c(0, 100), pch=21, col="black", bg="grey")

