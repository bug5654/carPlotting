##server.r
#interactiveGraph
#Author: Nathan Wendling
#Date: 20151226

library(ggplot2)
library(datasets)
data(mtcars)
c4 <- mtcars[mtcars$cyl==4,]
c6 <- mtcars[mtcars$cyl==6,]
c8 <- mtcars[mtcars$cyl==8,]
debugMode <- FALSE

shinyServer(
   
   function(input, output) {
      
      output$wt2mpg <- renderPlot({
      if(length(input$cyltoplot >0)) {
         currdat <- NA
         if("4" %in% input$cyltoplot) {
            currdat <- c4
         }
         if("6" %in% input$cyltoplot) {
            if(is.na(currdat)) {
               currdat <- c6
            } else {
               currdat <- rbind(currdat, c6)
            }
         }
         if("8" %in% input$cyltoplot) {
            if(is.na(currdat)) {
               currdat <- c8
            } else {
               currdat <- rbind(currdat, c8)
            }
         }
         if(input$color==FALSE) {
            plot <- qplot(wt, mpg, data=currdat)
         } else{
            plot <- qplot(wt, mpg, data=currdat, color=factor(cyl))
         }
         if(input$smooth==TRUE) {
            plot <- plot + geom_smooth()
         }
         plot <- plot +ggtitle("Weight of a car to MPG") +
            labs(x="Weight (in thousand pounds)", y="Miles Per Gallon")
         plot
      }
      })
      output$debug <- renderText({
         if(debugMode) {
            output <- input$cyltoplot
         }
         
      })
   }
   
)