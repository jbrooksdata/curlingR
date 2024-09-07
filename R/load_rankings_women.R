load_rankings_women <- function (season) {
  if(missing(season)) {
    file <- read.csv(
      paste0("https://raw.githubusercontent.com/jbrooksdata/curlingR-data/main/womensRankings.csv"),
      header = TRUE)
    file <- file[, -1]
    return(file)
  } else {
    file <- read.csv(
      paste0("https://raw.githubusercontent.com/jbrooksdata/curlingR-data/main/womensRankings.csv"),
      header = TRUE)
    file <- file[file$Season == season,]
    file <- file[, -1]
    return(file)
  }}
  