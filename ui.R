# ui.R

shinyUI(navbarPage("Navigation",tabPanel("Diamond Pricing",fluidPage(
        titlePanel("Determine a Diamond's Price"),
        
        sidebarLayout(
                sidebarPanel(
                        helpText("Input the characteristic of the diamond in question."),
                        
                        
                        sliderInput("carat", 
                                    label = h3("Size of Diamond in Carats:"),
                                    min = .1, max = 3,step=.05, value = 1),
                        br(),
                        selectInput("colour", 
                                    label = h3("Color of Diamond:"),
                                    choices = list("D - Colorless" = "D","E - Colorless" = "E","F - Colorless" = "F",
                                                "G - Near Colorless" = "G", "H - Near Colorless" = "H","I - Near Colorless" = "I"),
                                    selected = "F"),
                        br(),
                        radioButtons("clarity",label=h3("Clarity of Diamond:"),
                                     choices = list("IF - Internally Flawless" = "IF",
                                                    "VVS1 - Very Very Slighlty Included" = "VVS1",
                                                    "VVS2 - Very Very Slighlty Included" = "VVS2",
                                                    "VS1 - Very Slighlty Included" = "VS1",
                                                    "VS1 - Very Slighlty Included" = "VS2"),
                                     selected = "VVS2" ),
                        br(),
                        selectInput("cert", 
                                    label = h3("Certification Type:"),
                                    choices = c("GIA","HRD","IGI"),
                                    selected = "GIA")
                        
                ),
                
                #mainPanel(plotOutput("map"))
                mainPanel(
                        
                        h2("Results"),
                        br(),
                        h4("Your Diamond specifications"),
                        textOutput("carat_out"),
                        br(),
                        textOutput("colour_out"),
                        br(),
                        textOutput("clarity_out"),
                        br(),
                        textOutput("cert_out"),
                        br(),
                        h4(textOutput("prediction"))
                        )
        )
)),
tabPanel("Documentation",
h2("Getting Started with this App"),
br(),
p("This App is designed to allow a user to input characteristics of a diamond and 
  recieve a reasonable price estimate.  Simply input your parameters and a price will be displayed.  Someone who has gone through the process 
  of buying a diamond will be familiar with these characteristics but here is a 
  summary for those who are unfamiliar.  This information if provided with a diamond's 
  certification."),
br(),
h4("Carat"),
p("This is a measure of size of a diamond.  Naturally the larger the diamond 
  the more expensive.  The allowable range is .1 to 3.  Although larger diamond exists 
  they are rare in a retail setting."),
h4("Color"),
p("This is a measure of how colorless a diamond is with less color often being 
  more desireable.  The scale ranges from D (least amount of color) to I (most amount of color). 
  Again diamonds do exist outside of this range but won't be used in this app."),
h4("Clarity"),
p("This is a measure of how flawless a diamond is.  Ranging from IF to VS1"),
h4("Certification"),
p("Lastly certification type is which agency graded the diamond in question.  Each 
  agency has differing standard for the above measures and therefore which agency 
  determined the Carat, Color, and Clarity can impact price.")
)))
