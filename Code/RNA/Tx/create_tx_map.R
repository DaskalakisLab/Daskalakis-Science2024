load("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/rse_tx.y123_n688.Rdata")

map <- as.data.frame(rowRanges(rse_tx))
map$tx <- rownames(map)
map <- map[,c("tx","gene_name")]
map[is.na(map$gene_name), "gene_name"] <- map[is.na(map$gene_name), "tx"]
names(map) <- c("tx", "symbol")

saveRDS(map, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/tx_map.RDS")

