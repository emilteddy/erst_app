##### USER INTERFACE #####
library(shiny)

# Side bar 
pageWithSidebar(
  
  # Page header
  headerPanel("Forudsigelse af segment"),
  
  # Input values
  sidebarPanel(
    
    # Header of side bar
    tags$label(h3("Indsæt værdier")),
    
    # Input
    selectInput(inputId = "q24",
                label = "Hvor stor er den oplevede sandsynlighed for at blive udsat for en sikkerhedshændelse?",
                choices = c("Ved ikke" = "-1",
                            "0 - ingen sandsynlighed" = "0",
                            "1" = "1",
                            "2" = "2",
                            "3" = "3",
                            "4" = "4",
                            "5" = "5",
                            "6" = "6",
                            "7" = "7",
                            "8" = "8",
                            "9" = "9",
                            "10 - meget stor sandsynlighed" = "10")),
    selectInput(inputId = "q4_9",
                label = "Leverer virksomheden digitale produkter og/eller tjenester?",
                choices = c("Nej" = "2",
                            "Ja" = "1")),
    selectInput(inputId = "q4_8",
                label = "Leverer virksomheden til kritiske sektorer?",
                choices = c("Nej" = "2",
                            "Ja" = "1")),
    selectInput(inputId = "q17_1_resp",
                label = "Arbejder virksomhedens ledelse for at skabe opmærksomhed om it-sikkerhed blandt medarbejdere?",
                choices = c("Ikke relevant" = "-1",
                            "Helt enig" = "1",
                            "Enig" = "2",
                            "Hverken enig eller uenig" = "3",
                            "Uenig" = "4",
                            "Helt uenig" = "5")),
    selectInput(inputId = "q14_03",
                label = "Krypterer virksomheden data, filer eller e-mails?",
                choices = c("Nej" = "1",
                            "Ja" = "2")),
    selectInput(inputId = "q14_04",
                label = "Laver virksomheden back-up af data?",
                choices = c("Nej" = "1",
                            "Ja" = "2")),
    selectInput(inputId = "q14_09",
                label = "Har virksomheden implementeret firewall og antivirusbeskyttelse?",
                choices = c("Nej" = "1",
                            "Ja" = "2")),
    
    # Submit buttom
    actionButton(inputId = "submitbutton", 
                 label = "Beregn", 
                 class = "btn btn-primary")
    
  ),
  
  # Main panel
  mainPanel(
    tags$label(h3("Status på segment")),
    verbatimTextOutput("contents"),
    tableOutput("tabledata")
    
  )
)