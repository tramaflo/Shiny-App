install.packages("shiny")
install.packages("shinydashboard")


# Libraries ---------------------------------------------------------------

library(shiny)
library(shinydashboard)
library(readr)

# Loading data ------------------------------------------------------------

BlackwellDB <- read_csv("C:/Users/T450S/Desktop/Blackwell_Hist_Sample.csv")


library(shiny)

ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(
    menuItem(
      tabName = "first_menu", text = "1st option",
      sliderInput(inputId = "cool_sidebar", label = "Choose n° of breaks:",
                  min = 2, max = 10, value = 6)
    )
  ),
  dashboardBody(
    fluidRow(
      box(
        plotOutput(outputId = "Histogram_plot")
      )
    )
  ),
)

server <- function(input, output) {
  output$Histogram_plot <- renderPlot({
    hist(BlackwellDB$age, breaks = input$cool_sidebar)
  })
}

shinyApp(ui, server)

# User Interface ----------------------------------------------------------
