dirs <- list.dirs("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/LimmaResults/SexSpecific/DLPFC", recursive = T)
dirs <- dirs[endsWith(dirs, "Female") | endsWith(dirs, "Male")]

dirs <- gsub("DLPFC/", "DLPFCCorrectedNames/", dirs)
for (d in dirs){
  if (!dir.exists(d)){
    dir.create(d, recursive = T)
  }
}
