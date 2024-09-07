load_events_men <- function() {
    file <- read.csv(
      paste0("https://raw.githubusercontent.com/jbrooksdata/curlingR-data/main/mensEvents.csv"),
      header = TRUE)
    file <- file[, -1]
    return(file)
  }
  