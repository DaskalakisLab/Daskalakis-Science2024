dirs <- list.dirs("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Subanalyses/DLPFC", recursive = T)
dirs <- dirs[endsWith(dirs, "PTSD") | endsWith(dirs, "MDD")]

dirs <- gsub("DLPFC/", "DLPFCCorrectedNames/", dirs)
for (d in dirs){
  if (!dir.exists(d)){
    dir.create(d, recursive = T)
  }
}
