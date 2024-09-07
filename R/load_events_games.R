load_events_games <- function(event_id) {
    file <- bind_rows(read.csv(
      paste0("https://raw.githubusercontent.com/jbrooksdata/curlingR-data/main/mensEventsGames.csv"),
      header = TRUE), read.csv(
        paste0("https://raw.githubusercontent.com/jbrooksdata/curlingR-data/main/womensEventsGames.csv"),
        header = TRUE)) 
    file <- file[, -1]
    file <- file[file$event_id == event_id,]
    rownames(file) <- NULL
    return(file)
}