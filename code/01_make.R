library(diffloop)
library(dplyr)

# Import and collate... takes 2-3 minutes
loops <- loopsMake.mango("../data/mango_hichipper/K562/", mergegap = 0)
loops <- addchr(loops)
loops <- mangoCorrection(loops)

EP_loops <- keepEPloops(loops, loops@anchors, addchr(getHumanTSS()))
tdf <- summary(EP_loops)

write.table(tdf[,c(1,2,3,4,5,6,7,8,9,10,11,12,14),], file = "K562_HiCHIP_EP_loops.tsv", sep = "\t", quote = FALSE, row.names = FALSE, col.names = TRUE)
