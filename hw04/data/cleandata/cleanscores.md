
**Data Dictionary**
===================

-   What is the data about?
    -   cleanscores.csv contains rawscores.csv(the raw scores for a fictitious Stat 133 class) and adds 7 columns
-   How many rows?
    -   334
-   How many columns?
    -   23
-   What are the column labels?
    -   HW1 : homework1 score each 100 pts
    -   HW2 : homework2 score each 100 pts
    -   HW3 : homework3 score each 100 pts
    -   HW4 : homework4 score each 100 pts
    -   HW5 : homework5 score each 100 pts
    -   HW6 : homework6 score each 100 pts
    -   HW7 : homework7 score each 100 pts
    -   HW8 : homework8 score each 100 pts
    -   HW9 : homework9 score each 100 pts
    -   ATT : the number of lab attendance (0 to 12)
    -   QZ1 : rescale quiz1 score each 100 pts
    -   QZ2 : rescale quiz2 score each 100 pts
    -   QZ3 : rescale quiz3 score each 100 pts
    -   QZ4 : rescale quiz4 score each 100 pts
    -   EX1 : exam1 score 90 pts
    -   EX2 : exam2 score 90 pts
    -   Test1 : rescaling EX1
    -   Test2 : rescaling EX2
    -   Homework : total homework score obtained by dropping the lowest HW, and then averaging the remaining scores
    -   Quiz : total quiz score obtained by dropping the lowest quiz, and then averaging the remaining scores
    -   Lab : rescale ATT
    -   Overall : calculated using the following grading structure
        -   10% Lab score
        -   30% Homework score (drop lowest HW) – 15% Quiz score (drop lowest quiz)
        -   20% Test 1 score
        -   25% Test 2 score
    -   Grade : letter grade based on Overall
