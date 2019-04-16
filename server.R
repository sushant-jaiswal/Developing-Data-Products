
library(shiny)

computeBMI <- function(weight, height){ 
    round((weight/(height/100)^2), 1)
}

shinyServer(
    function(input, output) {
        bmiResult <- reactive({computeBMI(input$weight, input$height)})
        output$bmi <- renderText({bmiResult()})
        
        observe({
            bmi <- bmiResult()
            if(bmi>=30)
                output$category <- renderText('Obese')
            else if(bmi>=25)
                output$category <- renderText('Overweight')
            else if(bmi>=18.5)
                output$category <- renderText('Normal weight')
            else
                output$category <- renderText('Underweight')
        })
    }
)