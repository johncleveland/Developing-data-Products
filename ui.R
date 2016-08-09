library(markdown)

shinyUI(  fluidPage( # style="padding-top: 80px;",
  titlePanel("Stochastic Exploratory Data Analysis with Movable Control Panel"),  
 
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Choose a dataset:", 
                  choices = c("rock", "pressure", "cars")),
      
      numericInput("obs", "Number of observations to view:", 10),br(),
      img(src = "bigorb.png", height = 72, width = 72),"shiny is a product of ", 
      span("RStudio", style = "color:blue")
    ),
    
    mainPanel( h2("Data Frame View of Data"), tableOutput("view"), hr(), plotOutput("plotA"), plotOutput("plot"),
  
  
  
  absolutePanel( span("RStudio Stochastic Graph Movable Control Panel ", style = "color:blue") ,
                    bottom = 20, right = 20, width = 400,
                    draggable = TRUE,
                    
                    wellPanel( h4("Plots"),
                      
                      HTML(markdownToHTML(fragment.only=TRUE,text=c(
                        "
Please click Plot. Repeated clicking of runif or rnorm adds noise (stochasticity) :"
                      ))), actionButton("plot", "Plot"),
                      actionButton("runif", "Uniform"),
                      actionButton("rnorm", "Normal"), 
                      actionButton("reset", "Clear"),
                      
                      h4("Summary"),
                                 verbatimTextOutput("summary")
                      ),
                    
                    style = "opacity: 0.92"
                    
                      )
                  
                    
             )
  
  ))
         
        )