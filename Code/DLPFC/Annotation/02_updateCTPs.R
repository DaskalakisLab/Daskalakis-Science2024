sc48 <- readRDS("~/daskalakislab/daskalakislab/aiatrou/Science/CellTypeProportion/DLPFC48_celltype_prp.RDS")
dlpfc231 <- readRDS("~/daskalakislab/daskalakislab/aiatrou/Science/CellTypeProportion/DLPFC231_celltype_prp.RDS")

sc48 <- as.data.frame(sc48)
dlpfc231 <- as.data.frame(dlpfc231)

sc48 <- as.data.frame(t(sc48))
head(sc48)
names(sc48) <- c("Astro","ex","inhib","Macro","Micro","Mural","Oligo","OPC","Tcell")
sc48$SampleID <- rownames(sc48)

Annotation_sc48 <- readRDS("~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_sc48.RDS")

Annotation_sc48 <- merge(Annotation_sc48, sc48, by="SampleID", all.x=T)
saveRDS(Annotation_sc48, "~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_sc48.RDS")

dlpfc231 <- as.data.frame(t(dlpfc231))
head(dlpfc231)
names(dlpfc231) <- c("Astro","ex","inhib","Macro","Micro","Mural","Oligo","OPC","Tcell")
dlpfc231$SampleID <- rownames(dlpfc231)

Annotation_231 <- readRDS("~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_231.RDS")

Annotation_231 <- merge(Annotation_231, dlpfc231, by="SampleID", all.x=T)
saveRDS(Annotation_231, "~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/DLPFC/Annotation/Annotation_231.RDS")





