#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output) {
      
      values <- reactiveValues()
      observe({
            input$ack_c
            values$calburnt <- isolate({
                  
                  if ( identical(input$gender, c("male"))) 
                  {input$weight * 15} else {input$weight * 14}  
            })
            
            values$calgoal <- isolate ({
                  
                  if (values$calburnt > 1700) { values$calburnt - 500  }
                  
                  else { "Your cal goal is dropping below 1200 which is unhealthy!"}
            })
            
            })
      
      
      
      output$calburned <- renderText({values$calburnt})
      
      output$calgoal <- renderText({values$calgoal})
   
  
  
})
