# server.R

library(Ecdat)
library(caret)
modelFit <- train(price ~ .,data=Diamond,method="glm")


shinyServer(
        function(input, output) {
                
                output$carat_out <- renderText({
                        paste("Carat: ", input$carat)
                })
                output$colour_out <- renderText({
                        paste("Colour: ", input$colour)
                })
                output$clarity_out <- renderText({
                        paste("Clarity: ", input$clarity)
                })
                output$cert_out <- renderText({
                        paste("Certification: ", input$cert)
                })
                output$prediction <- renderText({
                        new_ob <- data.frame(as.numeric(input$carat),
                                               as.factor(input$colour),
                                               as.factor(input$clarity),
                                               as.factor(input$cert))
                        #paste(new_ob)
                        names(new_ob) <- c('carat','colour','clarity','certification')
                        #names(new_ob) <- c('carat')
                        paste("Price Estimate: ", sprintf("$ %.2f",predict(modelFit,newdata=new_ob)))
                })
        }
)