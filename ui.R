#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
  
  titlePanel("The Cal Defecit Diet planner"),
  
  sidebarLayout(
    sidebarPanel(
          
          p("You consume calories when you eat and your body burns a certain amount of calories everyday. When you eat fewer 
          calories than you burn you create a calorie defecit and your body breaks down fat to cover it leading to weight 
          loss!"),
          
          tags$hr(),
                
          h4("Calculate how many cals your body burns everyday"), 
          
          numericInput("weight", label="What is your weight (in lbs)?", value=170, min =  18, max = 60),
          
          radioButtons("gender", "What is your gender?",
                       c("Male" = "male",
                         "Female" = "female")),
          
          
          
          br(),
          actionButton("ack_c", label="Calculate my cal burn")
    ),
    
    mainPanel(
          
          tabsetPanel(
                tabPanel("App",
                      
                      h4("Your body's daily cal burn:"),
          verbatimTextOutput("calburned"),
          br(),
          p("Every week if you eat 3500 cals less than the amount you burn then you will reduce your weight by 1lb that week!"),
          br(),
          h4("Daily cal goal to loose 1lb in 1 week"),
          verbatimTextOutput("calgoal")),
          
          tabPanel("Documentation",
                   
                   h2("About the app"),
                   
                   p("This app calculates how many calories your body burns at rest. While there are many formulas for calculating this amount
                     this app uses a simple formula which is based on your weight (in pounds)."),
                   p("This app also tells you many calories you should consume to create a weekly defecit of 3500 calories which would lead to losing 1 pound of weight."),
                   
                   h2("The formula"),
                   p("For men: Weight (lbs) multiplied by 15."),
                   p("For women: Weight (lbs) multiplied by 14.")
                
                
          )
          
          )
    )
  )
))
