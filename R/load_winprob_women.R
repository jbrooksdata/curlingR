load_winprob_women <- function() {
    file <- read.csv(
      paste0("https://raw.githubusercontent.com/jbrooksdata/curlingR-data/main/womensWinProb.csv"),
      header = TRUE)
    file <- file[, -1]
    return(file)
  }
  