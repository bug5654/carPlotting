##ui.r
#interactiveGraph
#Author: Nathan Wendling
#Date: 20151226

shinyUI(pageWithSidebar(
   headerPanel("Car Plotting"),
   
   sidebarPanel(
      p("Plotting factors related to MPG on a car."),
      p("Also, no plot will be produced without selecting SOME cylinder amounts to plot."),
      p("Select your options to plot by the checkboxes below."),
      checkboxGroupInput("cyltoplot", "Cylinders to plot",
                         c("4 Cylinder" = "4",
                           "6 Cylinder" = "6",
                           "8 Cylinder" = "8"
                           )
      ),

      checkboxInput("smooth", "Plot Running Average Lines", value=FALSE),
      p("Note: the dark areas around the lines estimate uncertainty based on the data available"),
      checkboxInput("color", "Color by Cylinder", value=FALSE),
      p("Note: the cylinder factor will only be seperated for averaging when colors are enabled.")
      
   ),
   
   mainPanel(
      plotOutput("wt2mpg"),
      textOutput("debug")
   )
))
