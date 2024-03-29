load("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/rse_jx.y123_n688.Rdata")

map <- as.data.frame(rowRanges(rse_jx))
map$jx <- rownames(map)
map <- map[,c("jx","Symbol")]

saveRDS(map, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/jx_map.RDS")

map <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/jx_map.RDS")
map[is.na(map$Symbol), "Symbol"] <- map[is.na(map$Symbol), "jx"]
names(map) <- c("jx", "symbol")
saveRDS(map, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/jx_map.RDS")
