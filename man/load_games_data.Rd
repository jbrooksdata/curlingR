\name{load_games_data}
\alias{load_games_data}
\title{Load Game Data}
\usage{
load_games_data()
}
\description{
Enter a game_id to return table containing shot-by-shot data for the selected game. Shots are classified by player, team, end, and end shot number while containing metrics like shot quality score and expected quality score. Find game_id values using load_events_games().

}
\examples{
load_games_data(203)
}
