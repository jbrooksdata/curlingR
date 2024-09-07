# curlingR: Accessible world curling data

`curlingR` seeks to preserve world curling data and maintain its usability for researchers and other enthusiasts in the sports data space. As media coverage of this sport can be limited in many locations, this package will make it much easier for coaches, players, and other enthusiasts to analyze matches and deepen their understanding of the sport.

`curlingR` utilizes API access to [DoubleTakeout](https://doubletakeout.com/), a world curling data website and blog, to archive men’s and women’s world rankings, game logs, shot logs, and other event info, primarily for events from 2018 through present day, with some game and shot log data dating back to 2001 for major events like the Olympics and World Championships.

## Installation

`sweepR` can be installed using:

```
devtools::install_github("jbrooksdata/sweepR")
```

## Use Examples

The example code and plot below show how the current top Canadian women’s team ratings have varied in the last two seasons, forecasting which captain may succeed the recently retired Jennifer Jones in representing Canada at the 2026 Olympics. The results show Rachel Homan's squad has been increasingly dominant in the last year of play.

```
library(curlingR)
library(tidyverse)
library(ggplot2)

# current Canadian top 5 women's team IDs
Top5 <- load_rankings_women() %>%
  filter(Country == 'Canada',
         # max date of 2024 season
         Date == '2024-05-20',
         # exclude Jennifer Jones
         id != 9785) %>%
  arrange(Rank) %>%
  head(5) %>%
  pull(id)

Top5History <- load_rankings_women() %>%
  filter(Season %in% c(2023,2024),
         id %in% Top5)

Top5History %>%
  ggplot(aes(x = as.Date(Date), y = Rating, group = LastName, color = LastName)) +
  geom_line(linewidth = 1) +
  ggtitle("Top 5 Canadian Team Rating Comparison, Last 2 Seasons") +
  scale_x_date(date_breaks = "3 months", date_labels = "%b %y") +
  labs(x = NULL , color = "Team") +
  theme_bw()
```
<div align="center">
  <img src="https://github.com/jbrooksdata/curlingR-data/blob/main/viz/Canada%20Top%205.png?raw=true" width="750"/>
</div>

## Other Notes

- Browse [the curlingR data repo](https://github.com/jbrooksdata/curlingR-data) for raw data.
