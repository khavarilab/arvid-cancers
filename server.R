# Contains server logic 

serv <- function(input, output) {
  
  output$studydata <- renderDataTable({
    data = df_studydata
    if (input$hitcancer != 'All') {
      data = data[data$`Hit Cancer Assoc Cell Type` %in% input$hitcancer, ]
    }
    if (input$hittissue!= 'All') {
      data = data[data$`Hit Any Cell Type` %in% input$hittissue, ]
    }
    if (input$assoccancer != 'All') {
      data = data[data$`Associated Cancer` %in% input$assoccancer, ]
    }
    datatable(data, options = list(scrollX = TRUE))
  })
  
  output$studymeta <- renderTable({
    df_studymeta
  }, striped = T)
  
  output$columnmeta <- renderTable({
    df_columnmeta
  }, striped = T)
}

