# curlingR: Accessible world curling data

`curlingR` seeks to preserve world curling data and maintain its usability for researchers and other enthusiasts in the sports data space. As media coverage of this sport can be limited in many locations, this package will make it much easier for coaches, players, and other enthusiasts to analyze matches and deepen their understanding of the sport.

`curlingR` utilizes API access to [DoubleTakeout](https://doubletakeout.com/), a world curling data website and blog, to archive men’s and women’s world rankings, game logs, shot logs, and other event info, primarily for events from 2018 through present day, with some game and shot log data dating back to 2001 for major events like the Olympics and World Championships.

## Installation

`sweepR` can be installed using:

```
devtools::install_github("jbrooksdata/sweepR")
```

## Use Examples

### Canada's succession plan

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

### Sweden's continued dominance

Examining how the 2022 Olympic gold medalists, Sweden’s men’s team, fared in the most recent edition of the World Championships, we can call `load_events_stats()` to return overall player stats for each event. Looking into a player shot quality over expectation calculation for the event would reveal that all four primary Swedish players had elite performances, with three finishing the tournament in the top 10.

```
library(curlingR)
library(tidyverse)
library(gt)

data <- load_events_stats(251)

top10 <- data %>%
  filter(n > 100) %>%
  mutate(avgOverExp = round(avg_pts - exp_pts,2)) %>%
  arrange(-avgOverExp) %>%
  head(10) %>%
  select(athlete, team, throws = n, avgOverExp)

top10 %>%
  gt()%>%
  data_color(
    columns = c(avgOverExp),
    colors = scales::col_numeric(
      palette = c("#E54343","#F5F5F5","#4395E5"),
      domain = c(0,0.4))) %>%
  cols_align(
    align = "center",
    columns = c(athlete:avgOverExp)
  )%>%
  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_body(
      columns = vars(athlete, team),
      rows = team == 'SWE (Edin)'
    )
  ) %>%
  tab_header(
    title = md("**Average Throw Score Over Expectation**"),
    subtitle = ("Top 10 Players at the 2024 World Championships"))
```
<div align="center">
  <img src="https://github.com/jbrooksdata/curlingR-data/blob/main/viz/Sweden%20at%20the%20Mens%20WC.png?raw=true" width="500"/>
</div>

### A strong opener

`load_events_games()` shows that Niklas Edin’s Swedish squad won the World Championships gold medal game 6-5 over Canada, which may not be a surprising result when looking through the list to see that they opened their tournament play with an 8-1 victory over the Netherlands. Using shot-level data with `load_game_data()` can help determine if a team was simply outclassed or if there was a major momentum shift in a particular game. Looking at Sweden’s 8-1 victory, it would appear to be the former.

```
library(curlingR)
library(tidyverse)
library(ggplot2)

data <- load_games_data(7352)

runningPoints <- data %>%
  filter(!is.na(points)) %>%
  group_by(team) %>%
  arrange(team) %>%
  mutate(attempt_number = row_number()) %>% 
  mutate(running_total = cumsum(points))

runningPoints %>%
  ggplot(aes(x = attempt_number, y = running_total, group = team, color = team)) +
  geom_line(linewidth = 1) +
  ggtitle("Running Throw Quality Score in Sweden's 8-1 Victory") +
  labs(x = "Throw Number",y = "Running Quality Score", color = "Team") +
  theme_bw()
```
<div align="center">
  <img src="https://github.com/jbrooksdata/curlingR-data/blob/main/viz/Swedens%20Dominant%20Opener.png?raw=true" width="850"/>
</div>

## Other Notes

- Browse [the curlingR data repo](https://github.com/jbrooksdata/curlingR-data) for raw data.
