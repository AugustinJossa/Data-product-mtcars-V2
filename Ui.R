shinyUI(navbarPage("Mtcars analysis",
        
        tabPanel("Readme",
                
                 titlePanel("Readme"),
                 
                 fluidRow(
                         
                                includeMarkdown("Test-input.Rmd")
                         
                 )
                 
                                ),
        
        tabPanel("Exploratory Analysis",
                 headerPanel('Exploratory analysis'),
                 sidebarPanel(
                         selectInput('xcol', 'X Variable', names(mtcars)),
                         selectInput('ycol', 'Y Variable', names(mtcars), 
                                     selected=names(mtcars)[[2]]),
                         radioButtons("plot", "Plot", c("point", "boxplot"))
                         
                 ),
                 mainPanel(
                         plotOutput('plot1')
                 )
                  
                   ),
        
        tabPanel("Summary",
        headerPanel('Summary'),
        verbatimTextOutput("summary")
                   ),
        
        tabPanel("Data Table",
                 headerPanel('Data Table'),
                 DT::dataTableOutput("table")
                 )
        
        
        
                   
                                                      
                                         
))
