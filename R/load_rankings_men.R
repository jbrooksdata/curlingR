load_rankings_men <- function (season) {
  if(missing(season)) {
    file <- read.csv(
      paste0("https://raw.githubusercontent.com/jbrooksdata/curlingR-data/main/mensRankings.csv"),
      header = TRUE)
    file <- file[, -1]
    return(file)
  } else {
    file <- read.csv(
      paste0("https://raw.githubusercontent.com/jbrooksdata/curlingR-data/main/mensRankings.csv"),
      header = TRUE)
    file <- file[file$Season == season,]
    file <- file[, -1]
    return(file)
  }}
  