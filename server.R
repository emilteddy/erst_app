##### SERVER #####
library(data.table)
library(tree)

# Set time zone
Sys.setenv(TZ="CET")

# Load model
model <- readRDS(file = "dtree.rds")

# Server
shinyServer(
  function(input, output, session) {
    
    # Input data
    datasetInput <- reactive({
      
      # Dataframe
      df <- data.frame(
        Name = c("q4_9",
                 "q24",
                 "q4_8",
                 "q17_1_resp",
                 "q14_04",
                 "q14_03",
                 "q14_09"),
        Value = as.character(c(input$q4_9,
                               input$q24,
                               input$q4_8,
                               input$q17_1_resp,
                               input$q14_04,
                               input$q14_03,
                               input$q14_09)),
        stringsAsFactors = FALSE)
      
      # Response variable
      segment <- 0
      
      # Combine with dataframe
      df <- rbind(df, segment)
      
      # Transpose
      Input <- transpose(df)
      
      # Write tabel
      write.table(x = Input,
                  file = "input.csv",
                  sep = ",",
                  quote = FALSE,
                  row.names = FALSE,
                  col.names = FALSE)
      
      # Read back in
      test <- read.csv(file = paste("input", ".csv", sep = ""),
                       header = TRUE)
      
      # Make prediction
      Output <- data.frame(Segment = predict(model, test, type = "class"))
      
      # Print prediction
      print(Output)
      
    })
    
    # Status text box
    output$contents <- renderPrint({
      if (input$submitbutton > 0) {
        isolate(paste("Beregning fuldført ", "(", Sys.time(), ")", sep = ""))
      } else {
        return("Serveren er klar.")
      }
      
    })
    
    # Prediction results table
    output$tabledata <- renderTable({
      if (input$submitbutton > 0) {
        isolate(datasetInput())
      }
      
    })
  }
)