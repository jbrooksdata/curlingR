load_winprob_men <- function() {
    file <- read.csv(
      paste0("https://raw.githubusercontent.com/jbrooksdata/curlingR-data/main/mensWinProb.csv"),
      header = TRUE)
    file <- file[, -1]
    return(file)
  }