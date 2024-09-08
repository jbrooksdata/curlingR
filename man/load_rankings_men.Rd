\name{load_rankings_men}
\alias{load_rankings_men}
\title{Load Men's Rankings}
\usage{
load_rankings_men()
}
\description{
Returns table of men's team rankings including win-loss records overall and against ranked opponents, team rating, and change in rating and rank since last update. "Rating" metric is based on a weighted Bradley-Terry model, per DoubleTakeout. Ranking data is typically updated by the source a few times per month. Optional: enter a season year to filter data.

}
\examples{
load_rankings_men(2023)
load_rankings_men(2022:2024)
load_rankings_men()
}
