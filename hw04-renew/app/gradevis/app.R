#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(ggvis)
source('../../code/functions.R')
dat <- read.csv('../../data/cleandata/cleanscores.csv', header= TRUE)

# Variables for barchart
dat$Grade <- as.factor(dat$Grade)
dat$Grade <- factor(dat$Grade, levels = c('A+','A','A-','B+','B','B-','C+','C','C-','D','F'))
freq <- as.vector(table(dat$Grade))
prop <- as.vector(round(prop.table(freq),2))
grade <- data.frame(
  Grade = names(table(dat$Grade)),
  Freq = freq, 
  Prop = prop
)

# Variable names for histogram
assignment <- c('HW1','HW2','HW3','HW4','HW5','HW6','HW7','HW8','HW9','ATT','QZ1',
                'QZ2','QZ3','QZ4','EX1','EX2','Test1','Test2','Homework', 'Quiz', 
                'lab','Overall')

# Define UI for application that draws barchart, histogram and scatterplot 
ui <- fluidPage(
  
  # Application title
  titlePanel("Grade Visualizer"),
  
  # Sidebar 
  sidebarLayout(
    sidebarPanel(
      conditionalPanel(condition = "input.tabselected==1",
                       h3("Grades Distribution"),
                       tableOutput('table')),
      conditionalPanel(condition = "input.tabselected==2",
                       selectInput("var2", "X-axis variable", assignment, 
                                   selected = "HW1"),
                       sliderInput("width","Bin Width",
                                   min = 1, max = 10, value = 5)),
      conditionalPanel(condition = "input.tabselected==3",
                       selectInput("var3", "X-axis variable", assignment, 
                                   selected = "Test1"),
                       selectInput("var4", "Y-axis variable", assignment, 
                                   selected = "Overall"),
                       sliderInput("opacity","Opacity",min = 0, max = 1, value = 0.5),
                       radioButtons("radio", label = "Show line", choices = list("none","lm","loess"),selected = "none")
      )
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Barchart", value = 1, 
                           ggvisOutput("barchart")),
                  tabPanel("Histogram", value = 2, 
                           ggvisOutput("histogram"),
                           h5("Summary Statistics"),
                           verbatimTextOutput("stats")),
                  tabPanel("Scatterplot", value = 3,
                           ggvisOutput("scatterplot"),
                           h5("Correlation: "),
                           verbatimTextOutput("cor")),
                  id = "tabselected")
    )
  )
)

# Define server logic 
server <- function(input, output) {
  # Datatable (for 1st tab)
  output$table <- renderTable(grade)  
  
  # Barchart (for 1st tab)
  vis_barchart <- dat %>% ggvis(~Grade,fill := "skyblue") %>% add_axis("y", title = "frequency") 
  vis_barchart %>% bind_shiny("barchart")
  
  # Histogram (for 2nd tab)
  vis_histogram <- reactive({
    var2 <- prop("x", as.symbol(input$var2))
    dat %>% ggvis(x=var2, fill := "tomato") %>% layer_histograms(width=input$width)
  })
  vis_histogram %>% bind_shiny("histogram")
  
  # Summary (for 2nd tab) 
  output$stats <- renderPrint({
    print_stats(dat[,input$var2])
  })  
  
  # Correlation (for 3rd tab) 
  output$cor <- renderPrint({
    cor(x= dat[ ,input$var3], y=dat[ ,input$var4]) 
  })   
  
  # line (for 3nd tab)
  vis_scatterplot <- reactive({
    var3 <- prop("x", as.symbol(input$var3))
    var4 <- prop("y", as.symbol(input$var4))
    scat <- dat %>% ggvis(x=var3,y=var4,fill := "black") %>% layer_points(size :=50,fillOpacity:= input$opacity)
    switch(input$radio,
           'none' = scat,
           'lm' = scat %>% layer_model_predictions(model='lm', stroke := 'blue'),
           'loess' = scat %>% layer_model_predictions(model='loess', stroke := 'red'))
  })
  
  vis_scatterplot%>% bind_shiny("scatterplot")
  
}

# Run the application 
shinyApp(ui = ui, server = server)
