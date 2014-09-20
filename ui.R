
# Define UI for application that draws a plot
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Jakub Winter aka Rawrqs example"),
  
  # Sidebar with a slider inputs
  sidebarLayout(
    sidebarPanel(

      sliderInput("alpha", "alpha hyper", min =0.1, max=10, value = 1, step = 0.1),
      sliderInput("beta", "beta hyper", min =0.1, max=10, value = 1, step = 0.1)
      
    ),
    # Show a plot of the generated distributions
    mainPanel(
      plotOutput("bayesPlot"),
      h4("Short documentation:"),
      p("The application presents the behaviour of apposteriori beta distribution which is conjugate to the binomal likelihood which represents data.
"),
      p("There are two sliders to operate:"),
      p("* apha slider"),
      p("* beta slider"),
      p("which are responsible for the parametres of the prior disttribution which is beta distribution")
    )
  )
))
