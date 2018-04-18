install.packages('mnormt')
library(mnormt)

Sigma <- matrix(rbind(
		c(1, -2, -1),
		c(-2, 36, -8),
		c(-1, -8, 9)),
	nrow=3)

data <- rmt(n = 10000, mean = c(45, 35, 40), S=Sigma, df=5, sqrt=NULL)

mask <- (rowSums(data > 20 & data < 50) == 3)
out <- data.frame(data)[mask,]

write.table(out, file = "data_final.txt", sep = " ", row.names = FALSE, col.names = FALSE)

