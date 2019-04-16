
library(shiny)
library(shinythemes)

shinyUI(
    fluidPage(
        theme = shinytheme("cerulean"),
        titlePanel("Body Mass Index (BMI) Calculator"),
        h5('This calculator provides BMI and Category based on Height and Weight.'),

        sidebarPanel(
            h4('Instrctions:'),
            h5('1. Use the slider to pvovide your Height and Weight.'),
            h5('2. Result in right panel shows the your BMI and Category you falls into.'),
            br(),
            sliderInput('weight', 'Weight in kg (Kilograms)',value = 75, min = 25, max = 500, step = 1),
            sliderInput('height', 'Height in cm (Centimeter)',value = 175, min = 50, max = 250, step = 1),
            br(),
            h5('BMI Categories:'),
            p('Underweight = <18.5'),
            p('Normal weight = 18.5-24.9'),    
            p('Overweight = 25-29.9'),
            p('Obese = >30')
        ),
    
        mainPanel(
            h3('BMI'),
            textOutput('bmi'),
            h3('Category'),
            textOutput('category')
        )
    )
)