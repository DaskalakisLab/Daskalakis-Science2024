ga12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GlobalAncestry/Y1Y2/GlobalAncestryY1Y2.RDS")
ga3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GlobalAncestry/Y3/GlobalAncestryY3.RDS")

ga4 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GlobalAncestry/Y1Y2Y3Y4/GlobalAncestryY1Y2Y3Y4.RDS")

y12brs <- ga12$BrNum
y3brs <- ga3$BrNum

y123 <- union(y12brs, y3brs)
ga4 <- ga4[!(ga4$BrNum %in% y123),]

ga1234 <- rbind(ga12,ga3,ga4)

ga1234 <- ga1234[,c("BrNum","bestpop","europe","oceania","africa","americas","cs_asia","e_asia")]
write.csv(ga1234, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/GlobalAncestry/Y1Y2Y3Y4/AncestryEstimations304.csv",row.names = F,quote = F)
