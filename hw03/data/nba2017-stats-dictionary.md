
**data dictionary**

 
* What is the data about?
    + nba2017-stats
    + In this assignment, I am going to consider different ways to rank the NBA teams. From simple rankings based on a given observed variable, to rankings based on derived indices like e ciency (i.e. EFF), to rankings based on a composite index using Principal Component Analysis (PCA).

* How many rows?
    + 441
  
* How many columns?
    + 27
  
* What are the column labels?

    + player: first and last names of player
    + games_played: games played during regular season
    + minutes: minutes Played during regular season
    + field_goals_made: field Goals Made
    + field_goals_atts: field goals attempt 
    + field_goals_perc: field goals percentage 
    + points3_made: 3-Point Field Goal made
    + points3_atts: 3-Point Field Goal Attempts
    + points3_perc: 3-Point Field Goal percentage 
    + points2_made: 2-Point Field Goal made
    + points2_atts: 2-Point Field Goal Attempts
    + points2_perc: 2-Point Field Goal percentages
    + points1_made: 1-Point Field Goal made
    + points1_atts: 1-Point Field Goal Attempts
    + points1_perc: 1-Point Field Goal percentage
    + off_rebounds: Offensive Rebounds
    + def_rebounds: Defensive Rebounds 
    + assists: assists
    + steals: steals
    + blocks: blocks
    + turnovers: turnover
    + fouls: fouls
    + missed_fg: field_goals_atts - field_goals_made
    + missed_ft: points1_atts - points1_made
    + points: total points 
    + rebounds: off_rebounds + def_rebounds (total rebounds)
    + efficiency: the most popular performance measure is known as the “Efficiency” statistic
                  (points + rebounds + assists + steals + blocks- missed_fg - missed_ft - turnovers) / games_played

* [nba2017-stats](https://raw.githubusercontent.com/ucb-stat133/stat133-fall-2017/master/data/nba2017-stats.csv)
