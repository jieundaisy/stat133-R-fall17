
Stat 133, Fall 2017
===================

homework 4: Grades Visualizer
-----------------------------

Repository for HW assignments of Stat 133 (Fall 2017)

-   Student name: Jieun Hwang
-   Github username: jieundaisy
-   Lab section: 104
-   GSI: Xiaoqi Zhang
-   Brief description : In this assignment I’ll be working on a data set containing raw scores of fictitious students in a hypothetical Stat 133 course. Overall, this HW will give me the opportunity to work on a relatively small data computing and visualization project. By small we don’t mean simple; there’s actually a fair amount of complexity that I will have to deal with. From the user point of view, the main deliverable will be a shiny app to visualize

                      1) the overall grade distribution
                      2) the distribution and summary statistics of various scores
                      3) the relationships between pairs of scores

-   Data resources: [rawscores](https://raw.githubusercontent.com/ucb-stat133/stat133-fall-2017/master/data/rawscores.csv)

library(shiny)

* Run an app from a subdirectory in the repo

 runGitHub("stat133-hws-fall17", "jieundaisy", subdir = "hw04/app")