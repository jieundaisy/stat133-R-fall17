# Data Preparation (homework 3) 

 ## title: nba2017-teams ranking 
 ## description: the required variables to be used in the ranking analysis.
 ## input: nba2017 team data
 ## output: consider different ways to rank the NBA teams


# download csv file into your working directory
csv <- "https://raw.githubusercontent.com/ucb-stat133/stat133-fall-2017/master/data/nba2017-roster.csv"
download.file(url = csv, destfile = '../data/nba2017-roster-dictionary.csv')

csv <- "https://raw.githubusercontent.com/ucb-stat133/stat133-fall-2017/master/data/nba2017-stats.csv"
download.file(url = csv, destfile = '../data/nba2017-stat-dictionary.csv')


# Importing 2 data tables

library(readr)    # importing data
library(dplyr)    # data wrangling
library(ggplot2)

rosterdat <- read_csv("../data/nba2017-roster-dictionary.csv", col_types = list(
  player = col_character(),
  team = col_character(),
  position = col_character(),
  height = col_integer(),
  weight = col_integer(),
  age = col_integer(),
  experience = col_integer(),
  salary = col_double()
))

statdat <- read_csv("../data/nba2017-stat-dictionary.csv", col_types = list(
 player = col_character(),
 field_goals_perc = col_double(),
 points3_perc = col_double(),
 points2_perc = col_double(),
 points1_perc = col_double()
))

# Adding new variables

statdat <- mutate(statdat,
                  missed_fg = field_goals_atts - field_goals_made,
                  missed_ft = points1_atts - points1_made, 
                  points = points3_made*3 + points2_made*2 + points1_made*1,
                  rebounds = off_rebounds + def_rebounds,
                  efficiency = (points + rebounds + assists + steals + blocks - missed_fg - missed_ft - turnovers)/(games_played)
                  )

sink(file = '../output/efficiency-summary.txt')
summary(statdat$efficiency)
sink()

# Merging tables

mergedat <- merge(rosterdat,statdat)

# Creating nba 2017-teams.csv

teams <- arrange(
    summarise(
    group_by(mergedat,team),
    experience = round (sum(experience), digits =2), # make sure digits 2 
    salary= round (sum(salary/1000000), digits = 2),
    points3 = sum(points3_made),
    points2 = sum(points2_made),
    free_throws = sum(points1_made),
    points = sum(points),
    off_rebounds = sum(off_rebounds),
    def_rebounds = sum(def_rebounds),
    assists = sum(assists),
    steals = sum(steals),
    blocks = sum(blocks),
    turnovers = sum(turnovers),
    fouls = sum(fouls),
    efficiency = sum(efficiency)
  )
)

sink(file = '../output/teams-summary.txt')
summary(teams)
sink()

write.csv(teams,"../data/nba2017-teams.csv",row.names = FALSE)

# Some graphics 

pdf("../images/teams_star_plot.pdf")
stars(teams[ ,-1], labels = teams$team)
dev.off()


gg_exp_sal <- teams %>% ggplot() + geom_point(aes(x = experience, y = salary))  + geom_label(aes(x = experience, y = salary,label=team))
ggsave("../images/experience_salary.pdf",plot=gg_exp_sal,units="in",width=7, height = 5)
