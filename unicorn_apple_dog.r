#1
library(shiny)  

#2
ui <- fluidPage(

  titlePanel("Leadership Development Program"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("category", "Choose Program Category:", 
                  list("Managerial" = 1, 
                       "Interpersonal" = 2, 
                       "Team Building" = 3)),
  
    mainPanel(
      h2("Selected Program Category"),
      
      textOutput("categoryText"), 
      
      h2("Program Objectives"),
      
      textOutput("objectives")
    )
  )
)

#3
server <- function(input, output){
  
  output$categoryText <- renderText({
    switch(input$category, 
           1 = "Managerial Development Program",
           2 = "Interpersonal Development Program",
           3 = "Team Building Development Program"
    )
  })
  
  output$objectives <- renderText({
    switch(input$category, 
           1 = "The objectives of the Managerial Development Program is to help 
              managers develop their skills in leadership, decision making, 
              communication and problem-solving.",
           
           2 = "The objectives of the Interpersonal Development Program are to 
              help individuals improve their communication, collaboration, 
              assertiveness and conflict management skills.",
           
           3 = "The objectives of the Team Building Development Program are to 
              improve organizational efficiency, support knowledge sharing, 
              enhance team dynamics, develop leadership skills and foster 
              collaboration."
    )
  })
  
} 

#4
shinyApp(ui, server)

#5
# Define List of Courses
courses <- c("Introduction to Leadership", 
             "Strategic Decision Making", 
             "Leading Difficult Conversations", 
             "Communication Skills", 
             "Organizational Culture & Values", 
             "Team Building & Coaching", 
             "Creating an Effective Work Environment", 
             "Conflict Resolution", 
             "Change Management")
 
#6
# Define Course Descriptions
descriptions <- c("This course will introduce basic leadership concepts 
                  and provide an overview of the leadership development 
                  program.",
                 
                 "This course will help participants become more effective 
                  decision makers by developing strategies to evaluate 
                  options, identify solutions and make decisions in an 
                  organizational context.",
                  
                 "This course will teach participants how to lead difficult 
                  conversations and increase their effectiveness in critical 
                  conversations.",
                 
                 "This course will help participants develop their 
                  communication skills and better understand the 
                  communication process.",
                 
                 "This course will help participants develop an 
                  understanding of their organization’s culture and the 
                  values that must be upheld in order to achieve success 
                  within the organization.",
                 
                 "This course will provide an introduction to the 
                  fundamentals of team building, as well as the coaching 
                  skills needed to be an effective leader.",
                 
                 "This course will provide an overview of the strategies 
                  and techniques to use when creating an effective work 
                  environment.",
                 
                 "This course will provide an introduction to the basics of 
                  conflict resolution and negotiation.",
                 
                 "This course will provide an introduction to the process 
                  of leading and managing change, as well as strategies for 
                  successfully implementing change.")
                 
#7
# Create Dataframe of Course Info
df <- data.frame(Course = courses, 
                 Description = descriptions)
                 
#8
# Output Course Information  
ui <- fluidPage(

  titlePanel("Leadership Development Program"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("category", "Choose Program Category:", 
                  list("Managerial" = 1, 
                       "Interpersonal" = 2, 
                       "Team Building" = 3)),
  
    mainPanel(
      h2("Selected Program Category"),
      
      textOutput("categoryText"), 
      
      h2("Program Objectives"),
      
      textOutput("objectives"),
      
      h2("Course List"), 
      
      tableOutput("courseTable")
    )
  )
)

#9
server <- function(input, output){
  
  output$categoryText <- renderText({
    switch(input$category, 
           1 = "Managerial Development Program",
           2 = "Interpersonal Development Program",
           3 = "Team Building Development Program"
    )
  })
  
  output$objectives <- renderText({
    switch(input$category, 
           1 = "The objectives of the Managerial Development Program is to help 
              managers develop their skills in leadership, decision making, 
              communication and problem-solving.",
           
           2 = "The objectives of the Interpersonal Development Program are to 
              help individuals improve their communication, collaboration, 
              assertiveness and conflict management skills.",
           
           3 = "The objectives of the Team Building Development Program are to 
              improve organizational efficiency, support knowledge sharing, 
              enhance team dynamics, develop leadership skills and foster 
              collaboration."
    )
  })
  
  # Create Reactive Filtering
  filteredData <- reactive({
    switch(input$category, 
           1 = df[courses == "Introduction to Leadership" | courses == "Strategic Decision Making" |
                   courses == "Leading Difficult Conversations" | courses == "Communication Skills" |
                   courses == "Organizational Culture & Values", ],
        
           2 = df[courses == "Team Building & Coaching" | courses == "Creating an Effective Work Environment" |
                   courses == "Conflict Resolution" | courses == "Change Management", ],
                   
           3 = df[courses == "Team Building & Coaching" | courses == "Creating an Effective Work Environment" |
                   courses == "Conflict Resolution" | courses == "Change Management", ]
    )
  })
  
  # Output Course Table     
  output$courseTable <- renderTable({
    filteredData()
  })
  
  
} 

#10
shinyApp(ui, server)