dirs <- list.dirs("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/DLPFC", recursive = T)
dirs <- dirs[endsWith(dirs, "MDD") | endsWith(dirs, "PTSD") | endsWith(dirs, "PTSD_MDD") | endsWith(dirs, "PTSD_vs_MDD")]

dirs <- gsub("DLPFC/", "DLPFCCorrectedNames/", dirs)
for (d in dirs){
  if (!dir.exists(d)){
    dir.create(d, recursive = T)
  }
}
