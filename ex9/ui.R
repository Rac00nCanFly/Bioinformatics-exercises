library(shiny)

ui <- fluidPage(
  titlePanel("Gene Expression Viewer"),
  sidebarLayout(
    sidebarPanel(
      selectInput("gene", "Select Gene ID:", choices = NULL)
    ),
    mainPanel(
      plotOutput("tpmPlot")
    )
  )
)
