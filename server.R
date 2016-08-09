library(datasets)
shinyServer(function(input, output, session) {
 
  output$plot2 <- renderPlot({
    plot(head(cars, input$n), main="Foo")
  }, bg = "#F5F5F5")
  
  # Return the requested dataset
  datasetInput <- reactive({
    switch(input$dataset,
           "rock" = rock,
           "pressure" = pressure,
           "cars" = cars)
  })
  
  
  # Generate a summary of the dataset
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  
  
   output$view <- renderTable({
    t(as.matrix(head(datasetInput(), n = input$obs)))
  })
  
 # Generate the combo
   
   v<- reactiveValues(data=NULL)
   
   observeEvent(input$runif, {
     dataset <- datasetInput()
     dataset2<- dataset + rnorm(nrow(dataset))
      v$data <- dataset2
     
      
   })
   
   observeEvent(input$rnorm, {
     dataset <- datasetInput()
     dataset2<- dataset + runif(nrow(dataset))
     v$data <- dataset2
     
   })  
   
   
   observeEvent(input$plot, {
     dataset <- datasetInput()
     dataset2<- dataset# + runif(nrow(dataset))
     v$data <- dataset2
     
   })  
   
   observeEvent(input$reset, {
     v$data <- NULL
   })  
   
   
   output$plotA <- renderPlot({
     if (is.null(v$data)) return()
     plot(v$data, main= " (Random) Plot of data")
   })
   
  
  
  
})