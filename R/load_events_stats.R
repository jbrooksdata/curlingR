load_events_stats <- function(event_id) {
  library(dplyr)
    file <- bind_rows(read.csv(
      paste0("https://raw.githubusercontent.com/jbrooksdata/curlingR-data/main/mensEventsStats.csv"),
      header = TRUE), read.csv(
        paste0("https://raw.githubusercontent.com/jbrooksdata/curlingR-data/main/womensEventsStats.csv"),
        header = TRUE))
    file <- file[, -1]
    file <- file[file$event_id == event_id,]
    rownames(file) <- NULL
    return(file)
}
