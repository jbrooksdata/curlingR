load_games_data <- function(game_id) {
  mensUrl <- "https://github.com/jbrooksdata/curlingR-data/raw/main/mensGameData.rds"
  mensFile <- readRDS(url(mensUrl, "rb"))
  womensUrl <- "https://github.com/jbrooksdata/curlingR-data/raw/main/womensGameData.rds"
  womensFile <- readRDS(url(womensUrl, "rb"))
  file <- bind_rows(mensFile, womensFile)
  
  file$game_id <- coalesce(file$game_id,file$...2)
  file <- file[, -17] # removed coalesced column
  
  names(file)[names(file) == "...1"] <- "event_id"
  names(file)[names(file) == "...3"] <- "year"
  names(file)[names(file) == "...4"] <- "event_name"
  
  file <- file[file$game_id == game_id,]
  rownames(file) <- NULL
  return(file)
}