library(ggplot2)

shinyServer(function(input, output, session) {
        
        #preprocess the data 
        mtcars$am <- as.factor(mtcars$am)
        levels(mtcars$am) <-c("AT", "MT")
        mtcars$cyl<- as.factor(mtcars$cyl)
        mtcars$am<- as.factor(mtcars$am)
        mtcars$vs<- as.factor(mtcars$vs)
        mtcars$gear<- as.factor(mtcars$gear) 
        mtcars$carb<- as.factor(mtcars$carb)
        
        # Combine the selected variables into a new data frame
        selectedData <- reactive({
                mtcars[, c(input$xcol, input$ycol)]
        })
        
        output$plot1 <- renderPlot({
                if(input$plot == "point"){
                ggplot(selectedData(), aes_string(x=input$xcol, y=input$ycol)) + geom_point()
                }
                else if (input$plot =="boxplot"){
                ggplot(selectedData(), aes_string(x=input$xcol, y=input$ycol)) + geom_boxplot()
                }
                
        })
        
        output$summary <- renderPrint({
                summary(mtcars)
        })
        
        output$table <- DT::renderDataTable({
                DT::datatable(mtcars)
        })
})