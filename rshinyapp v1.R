library(shiny)
library(shinydashboard)
library(readxl)
library(plotly)
library(tidyverse)
library(here)
library(DT)

Behavior_duration <- read_xlsx(
  path = here(
    "Behavior duration.xlsx"
  )
)
Behavior_frequency <- read_xlsx(
  path = here(
    "Behavior frequency.xlsx"
  )
)
Cattle_ID <- read_xlsx(
  path = here(
    "Cattle_ID.xlsx"
  )
)
CBC <- read_xlsx(
  path = here(
    "CBC.xlsx"
  )
)
Cortisol <- read_xlsx(
  path = here(
    "Cortisol.xlsx"
  )
)
GrowSafe <- read_xlsx(
  path = here(
    "GrowSafe.xlsx"
  )
)
Haptoglobin <- read_xlsx(
  path = here(
    "Haptoglobin.xlsx"
  )
)
Head_gate_area_branding <- read_xlsx(
  path = here(
    "Head gate area branding.xlsx"
  )
)
Head_gate_area <- read_xlsx(
  path = here(
    "Head gate area.xlsx"
  )
)
Head_gate_movement <- read_xlsx(
  path = here(
    "Head gate movement.xlsx"
  )
)
Head_gate_peak_branding <- read_xlsx(
  path = here(
    "Head gate peak branding.xlsx"
  )
)
Head_gate_peak <- read_xlsx(
  path = here(
    "Head gate peak.xlsx"
  )
)
Hobo <- read_xlsx(
  path = here(
    "Hobo.xlsx"
  )
)
Infrared <- read_xlsx(
  path = here(
    "Infrared.xlsx"
  )
)
Serum_amyloid_A <- read_xlsx(
  path = here(
    "Serum amyloid A.xlsx"
  )
)
Stride_Length <- read_xlsx(
  path = here(
    "Stride Length.xlsx"
  )
)
Substance_P <- read_xlsx(
  path = here(
    "Substance P.xlsx"
  )
)
Temperature <- read_xlsx(
  path = here(
    "Temperature.xlsx"
  )
)
VAS <- read_xlsx(
  path = here(
    "VAS.xlsx"
  )
)

ui <- dashboardPage(
  title = "Animal Welfare Database",
  skin = "green",
  dashboardHeader(
    title = "Animal Welfare Database",
    titleWidth = 260
  ),
  dashboardSidebar(
    width = 260,
    sidebarMenu(
      menuItem(
        "View Data",
        tabName = "data",
        icon = icon(
          "dashboard"
        )
      ),
      menuSubItem(
        "Behavior Duration",
        tabName = "bd"
      ),
      menuSubItem(
        "Behavior Frequency",
        tabName = "bf"
      ),
      menuSubItem(
        "Cattle ID",
        tabName = "ci"
      ),
      menuSubItem(
        "CBC",
        tabName = "cbc"
      ),
      menuSubItem(
        "Cortisol",
        tabName = "cort"
      ),
      menuSubItem(
        "GrowSafe",
        tabName = "gs"
      ),
      menuSubItem(
        "Haptoglobin",
        tabName = "hap"
      ),
      menuSubItem(
        "Head Gate Area Branding",
        tabName = "hgab"
      ),
      menuSubItem(
        "Head Gate Area",
        tabName = "hga"),
      menuSubItem(
        "Head Gate Movement",
        tabName = "hgm"
      ),
      menuSubItem(
        "Head Gate Peak Branding",
        tabName = "hgpb"
      ),
      menuSubItem(
        "Head Gate Peak",
        tabName = "hgp"
      ),
      menuSubItem(
        "Hobo", 
        tabName = "hobo"
      ),
      menuSubItem(
        "Infrared",
        tabName = "inf"
      ),
      menuSubItem(
        "Serum Amyloid A",
        tabName = "saa"
      ),
      menuSubItem(
        "Stride Length",
        tabName = "sl"
      ),
      menuSubItem(
        "Substance P",
        tabName = "subp"
      ),
      menuSubItem(
        "Temperature", 
        tabName = "temp"
      ),
      menuSubItem(
        "VAS",
        tabName = "vas"),
      menuItem(
        "Upload",
        tabName = "up",
        icon = icon(
          "arrow-up"
        )
      ),
      menuItem(
        "About",
        tabName = "about", 
        icon = icon(
          "info"
        )
      )
    )
  ),
  dashboardBody(
    tags$head( tags$script(type="text/javascript",'$(document).ready(function(){
                             $(".main-sidebar").css("height","100%");
                             $(".main-sidebar .sidebar").css({"position":"relative","max-height": "100%","overflow": "auto"})
                             })')),
    tabItems(
      tabItem("data",
              fluidRow(
                h1("View Data")
              ),
              fluidRow(
                box(collapsible = TRUE,collapsed = TRUE,title = "Columns",
                    conditionalPanel(
                      'input.dataset === "Behaviour Duration"',
                      checkboxGroupInput(
                        inputId = "show_vars_bd",
                        label = "Select columns to show",
                        choices = names(Behavior_duration),
                        selected = names(Behavior_duration)
                      )
                    ),
                    conditionalPanel(
                      'input.dataset === "Behaviour Frequency"',
                      checkboxGroupInput(
                        inputId = "show_vars_bf",
                        label = "Select columns to show",
                        choices = names(Behavior_frequency),
                        selected = names(Behavior_frequency)
                      )
                    ),
                    conditionalPanel(
                      'input.dataset === "Cattle ID"',
                      checkboxGroupInput(
                        inputId = "show_vars_ci",
                        label = "Select columns to show",
                        choices = names(Cattle_ID),
                        selected = names(Cattle_ID)
                      )
                    ),
                    conditionalPanel(
                      'input.dataset === "CBC"',
                      checkboxGroupInput(
                        inputId = "show_vars_cbc",
                        label = "Select columns to show",
                        choices = names(CBC),
                        selected = names(CBC)
                      )
                    ),
                    conditionalPanel(
                      'input.dataset === "Cortisol"',
                      checkboxGroupInput(
                        inputId = "show_vars_cor",
                        label = "Select columns to show",
                        choices = names(Cortisol),
                        selected = names(Cortisol)
                      )
                    ),
                    conditionalPanel(
                      'input.dataset === "GrowSafe"',
                      checkboxGroupInput(
                        inputId = "show_vars_gs",
                        label = "Select columns to show",
                        choices = names(GrowSafe),
                        selected = names(GrowSafe)
                      )
                    ),
                    conditionalPanel(
                      'input.dataset === "Haptoglobin"',
                      checkboxGroupInput(
                        inputId = "show_vars_hap",
                        label = "Select columns to show",
                        choices = names(Haptoglobin),
                        selected = names(Haptoglobin)
                      )
                    ),
                    conditionalPanel(
                      'input.dataset === "Head Gate Area Branding"',
                      checkboxGroupInput(
                        inputId = "show_vars_hgab",
                        label = "Select columns to show",
                        choices = names(Head_gate_area_branding),
                        selected = names(Head_gate_area_branding)
                      )
                    ),
                    conditionalPanel(
                      'input.dataset === "Head Gate Area"',
                      checkboxGroupInput(
                        inputId = "show_vars_hga",
                        label = "Select columns to show",
                        choices = names(Head_gate_area),
                        selected = names(Head_gate_area)
                      )
                    ),
                    conditionalPanel(
                      'input.dataset === "Head Gate Movement"',
                      checkboxGroupInput(
                        inputId = "show_vars_hgm",
                        label = "Select columns to show",
                        choices = names(Head_gate_movement),
                        selected = names(Head_gate_movement)
                      )
                    ),
                    conditionalPanel(
                      'input.dataset === "Head Gate Peak Branding"',
                      checkboxGroupInput(
                        inputId = "show_vars_hgpb",
                        label = "Select columns to show",
                        choices = names(Head_gate_peak_branding),
                        selected = names(Head_gate_peak_branding)
                      )
                    ),
                    conditionalPanel(
                      'input.dataset === "Head Gate Peak"',
                      checkboxGroupInput(
                        inputId = "show_vars_hgp",
                        label = "Select columns to show",
                        choices = names(Head_gate_peak),
                        selected = names(Head_gate_peak)
                      )
                    ),
                    conditionalPanel(
                      'input.dataset === "Hobo"',
                      checkboxGroupInput(
                        inputId = "show_vars_hob",
                        label = "Select columns to show",
                        choices = names(Hobo),
                        selected = names(Hobo)
                      )
                    ),
                    conditionalPanel(
                      'input.dataset === "Infrared"',
                      checkboxGroupInput(
                        inputId = "show_vars_inf",
                        label = "Select columns to show",
                        choices = names(Infrared),
                        selected = names(Infrared)
                      )
                    ),
                    conditionalPanel(
                      'input.dataset === "Serum Amyloid A"',
                      checkboxGroupInput(
                        inputId = "show_vars_saa",
                        label = "Select columns to show",
                        choices = names(Serum_amyloid_A),
                        selected = names(Serum_amyloid_A)
                      )
                    ),
                    conditionalPanel(
                      'input.dataset === "Stride Length"',
                      checkboxGroupInput(
                        inputId = "show_vars_sl",
                        label = "Select columns to show",
                        choices = names(Stride_Length),
                        selected = names(Stride_Length)
                      )
                    ),
                    conditionalPanel(
                      'input.dataset === "Substance P"',
                      checkboxGroupInput(
                        inputId = "show_vars_subp",
                        label = "Select columns to show",
                        choices = names(Substance_P),
                        selected = names(Substance_P)
                      )
                    ),
                    conditionalPanel(
                      'input.dataset === "Temperature"',
                      checkboxGroupInput(
                        inputId = "show_vars_temp",
                        label = "Select columns to show",
                        choices = names(Temperature),
                        selected = names(Temperature)
                      )
                    ),
                    conditionalPanel(
                      'input.dataset === "VAS"',
                      checkboxGroupInput(
                        inputId = "show_vars_vas",
                        label = "Select columns to show",
                        choices = names(VAS),
                        selected = names(VAS)
                      )
                    ),
                    width = 12,
                    style = 'overflow-x: scroll'
                ),
                
                box(
                  width = 12,
                  style = 'overflow-x: scroll',
                  tabsetPanel(
                    id = 'dataset',
                    tabPanel("Behaviour Duration",
                             DT::dataTableOutput("table_bd")),
                    tabPanel("Behaviour Frequency",
                             DT::dataTableOutput("table_bf")),
                    tabPanel("Cattle ID",
                             DT::dataTableOutput("table_ci")),
                    tabPanel("CBC",
                             DT::dataTableOutput("table_cbc")),
                    tabPanel("Cortisol",
                             DT::dataTableOutput("table_cort")),
                    tabPanel("GrowSafe",
                             DT::dataTableOutput("table_gs")),
                    tabPanel("Haptoglobin",
                             DT::dataTableOutput("table_hap")),
                    tabPanel("Head Gate Area Branding",
                             DT::dataTableOutput("table_hgab")),
                    tabPanel("Head Gate Area",
                             DT::dataTableOutput("table_hga")),
                    tabPanel("Head Gate Movement",
                             DT::dataTableOutput("table_hgm")),
                    tabPanel("Head Gate Peak Branding",
                             DT::dataTableOutput("table_hgpb")),
                    tabPanel("Head Gate Peak",
                             DT::dataTableOutput("table_hgp")),
                    tabPanel("Hobo",
                             DT::dataTableOutput("table_ho")),
                    tabPanel("Infrared",
                             DT::dataTableOutput("table_if")),
                    tabPanel("Serum Amyloid A",
                             DT::dataTableOutput("table_saa")),
                    tabPanel("Stride Length",
                             DT::dataTableOutput("table_sl")),
                    tabPanel("Substance P",
                             DT::dataTableOutput("table_subp")),
                    tabPanel("Temperature",
                             DT::dataTableOutput("table_temp")),
                    tabPanel("VAS",
                             DT::dataTableOutput("table_vas"))
                  )
                )),
              fluidRow(
                h3("Download Raw Dataset"),
                box(selectInput("down_dataset",
                                "Choose a dataset:",
                                choices = c(
                                  "Behavior Duration",
                                  "Behavior Frequency",
                                  "Cattle ID",
                                  "CBC",
                                  "Cortisol",
                                  "GrowSafe",
                                  "Haptoglobin",
                                  "Head Gate Area Branding",
                                  "Head Gate Area",
                                  "Head Gate Movement",
                                  "Head Gate Peak Branding",
                                  "Head Gate Peak",
                                  "Hobo",
                                  "Infrared",
                                  "Serum Amyloid A",
                                  "Stride Length",
                                  "Substance P",
                                  "Temperature",
                                  "VAS"
                                )
                ),
                downloadButton(
                  "downloadData",
                  "Download"
                )
                )
              )
      ),
      tabItem("bd",
              fluidRow(box(title = "Behavior Duration",
                           shiny::dataTableOutput("bd"),
                           width = 12,
                           status = "danger",
                           style='overflow-x: scroll')
              ),
              fluidRow(box(title = "Plot",
                           width = 12,
                           selectInput("choice1",
                                       "Choose",
                                       choices = names(Behavior_duration),
                                       selected = NULL),
                           plotlyOutput("graph1")
              )
              )
      ),
      tabItem("bf",
              fluidRow(box(title = "Behavior Frequency", 
                           shiny::dataTableOutput("bf"), 
                           width = 12, 
                           status = "danger", 
                           style='overflow-x: scroll')
              ),
              fluidRow(box(title = "Plot",
                           width = 12,
                           selectInput("choice2",
                                       "Choose",
                                       choices = names(Behavior_frequency),
                                       selected = NULL),
                           plotlyOutput("graph2")
              )
              )
      ),
      tabItem("ci",
              fluidRow(box(title = "Cattle ID",
                           shiny::dataTableOutput("ci"),
                           width = 12, 
                           status = "danger", 
                           style='overflow-x: scroll')
              ),
              fluidRow(box(title = "Plot",
                           width = 12,
                           plotlyOutput("graph3")
              )
              )
      ),
      tabItem("cbc",
              fluidRow(box(title = "CBC", 
                           shiny::dataTableOutput("cbc"), 
                           width = 12, 
                           status = "danger", 
                           style='overflow-x: scroll')
              ),
              fluidRow(box(title = "Plot",
                           width = 12,
                           selectInput("choice4", 
                                       "Choose", 
                                       choices = names(CBC),
                                       selected = NULL),
                           plotlyOutput("graph4")
              )
              )
      ),
      tabItem("cort",
              fluidRow(box(title = "Cortisol", 
                           shiny::dataTableOutput("cort"),
                           width = 12,
                           status = "danger",
                           style='overflow-x: scroll')
              ),
              fluidRow(box(title = "Plot",
                           width = 12,
                           selectInput("choice5",
                                       "Choose",
                                       choices = names(Cortisol),
                                       selected = NULL),
                           plotlyOutput("graph5")
              )
              )
      ),
      tabItem("gs",
              fluidRow(box(title = "GrowSafe", 
                           shiny::dataTableOutput("gs"),
                           width = 12, 
                           status = "danger", 
                           style='overflow-x: scroll')
              ),
              fluidRow(box(title = "Plot",
                           width = 12,
                           selectInput("choice6", 
                                       "Choose", 
                                       choices = names(GrowSafe), 
                                       selected = NULL),
                           plotlyOutput("graph6")
              )
              )
      ),
      tabItem("hap",
              fluidRow(box(title = "Haptoglobin", 
                           shiny::dataTableOutput("hap"), 
                           width = 12, 
                           status = "danger", 
                           style='overflow-x: scroll')
              ),
              fluidRow(box(title = "Plot",
                           width = 12,
                           selectInput("choice7", 
                                       "Choose", 
                                       choices = names(Haptoglobin), 
                                       selected = NULL),
                           plotlyOutput("graph7")
              )
              )
      ),
      tabItem("hgab",
              fluidRow(box(title = "Head Gate Area Branding",
                           shiny::dataTableOutput("hgab"),
                           width = 12,
                           status = "danger",
                           style='overflow-x: scroll')
              ),
              fluidRow(box(title = "Plot",
                           width = 12,
                           selectInput("choice8",
                                       "Choose",
                                       choices = names(Head_gate_area_branding), 
                                       selected = NULL),
                           plotlyOutput("graph8")
              )
              )
      ),
      tabItem("hga",
              fluidRow(box(title = "Head Gate Area", 
                           shiny::dataTableOutput("hga"), 
                           width = 12, status = "danger", 
                           style='overflow-x: scroll')
              ),
              fluidRow(box(title = "Plot",
                           width = 12,
                           selectInput("choice9", 
                                       "Choose", 
                                       choices = names(Head_gate_area),
                                       selected = NULL),
                           plotlyOutput("graph9")
              )
              )
      ),
      tabItem("hgm",
              fluidRow(box(title = "Head Gate Movement",
                           shiny::dataTableOutput("hgm"),
                           width = 12,
                           status = "danger",
                           style='overflow-x: scroll')
              ),
              fluidRow(box(title = "Plot",
                           width = 12,
                           selectInput("choice10",
                                       "Choose",
                                       choices = names(Head_gate_movement),
                                       selected = NULL),
                           plotlyOutput("graph10")
              )
              )
      ),
      tabItem("hgpb",
              fluidRow(box(title = "Head Gate Peak Branding", 
                           shiny::dataTableOutput("hgpb"),
                           width = 12, 
                           status = "danger", 
                           style='overflow-x: scroll')
              ),
              fluidRow(box(title = "Plot",
                           width = 12,
                           selectInput("choice11", 
                                       "Choose", 
                                       choices = names(Head_gate_peak_branding), 
                                       selected = NULL),
                           plotlyOutput("graph11")
              )
              )
      ),
      tabItem("hgp",
              fluidRow(box(title = "Head Gate Peak",
                           shiny::dataTableOutput("hgp"),
                           width = 12,
                           status = "danger",
                           style='overflow-x: scroll')
              ),
              fluidRow(box(title = "Plot",
                           width = 12,
                           selectInput("choice12",
                                       "Choose", 
                                       choices = names(Head_gate_peak),
                                       selected = NULL),
                           plotlyOutput("graph12")
              )
              )
      ),
      tabItem("hobo",
              fluidRow(box(title = "Hobo",
                           shiny::dataTableOutput("hobo"), 
                           width = 12, 
                           status = "danger",
                           style='overflow-x: scroll')
              ),
              fluidRow(box(title = "Plot",
                           width = 12,
                           selectInput("choice13", 
                                       "Choose",
                                       choices = names(Hobo),
                                       selected = NULL),
                           plotlyOutput("graph13")
              )
              )
      ),
      tabItem("inf",
              fluidRow(box(title = "Infrared",
                           shiny::dataTableOutput("inf"), 
                           width = 12, 
                           status = "danger",
                           style='overflow-x: scroll')
              ),
              fluidRow(box(title = "Plot",
                           width = 12,
                           selectInput("choice14",
                                       "Choose", 
                                       choices = names(Infrared), 
                                       selected = NULL),
                           plotlyOutput("graph14")
              )
              )
      ),
      tabItem("saa",
              fluidRow(box(title = "Serum Amyloid A", 
                           shiny::dataTableOutput("saa"), 
                           width = 12, 
                           status = "danger",
                           style='overflow-x: scroll')
              ),
              fluidRow(box(title = "Plot",
                           width = 12,
                           selectInput("choice15", 
                                       "Choose",
                                       choices = names(Serum_amyloid_A),
                                       selected = NULL),
                           plotlyOutput("graph15")
              )
              )
      ),
      tabItem("sl",
              fluidRow(box(title = "Stride Length", 
                           shiny::dataTableOutput("sl"),
                           width = 12, 
                           status = "danger", 
                           style='overflow-x: scroll')
              ),
              fluidRow(box(title = "Plot",
                           width = 12,
                           selectInput("choice16", 
                                       "Choose", 
                                       choices = names(Stride_Length), 
                                       selected = NULL),
                           plotlyOutput("graph16")
              )
              )
      ),
      tabItem("subp",
              fluidRow(box(title = "Substance P",
                           shiny::dataTableOutput("subp"), 
                           width = 12, 
                           status = "danger", 
                           style='overflow-x: scroll')
              ),
              fluidRow(box(title = "Plot",
                           width = 12,
                           selectInput("choice17", 
                                       "Choose",
                                       choices = names(Substance_P), 
                                       selected = NULL),
                           plotlyOutput("graph17")
              )
              )
      ),
      tabItem("temp",
              fluidRow(box(title = "Temperature",
                           shiny::dataTableOutput("temp"),
                           width = 12, 
                           status = "danger",
                           style='overflow-x: scroll')
              ),
              fluidRow(box(title = "Plot",
                           width = 12,
                           selectInput("choice18",
                                       "Choose", 
                                       choices = names(Temperature),
                                       selected = NULL),
                           plotlyOutput("graph18")
              )
              )
      ),
      tabItem("vas",
              fluidRow(
                box(title = "VAS",
                    shiny::dataTableOutput("vas"),
                    width = 12,
                    status = "danger",
                    style='overflow-x: scroll')),
              fluidRow(
                box(title = "Plot",
                    width = 12,
                    selectInput("choice19",
                                "Choose",
                                choices = names(VAS),
                                selected = NULL),
                    plotlyOutput("graph19")
                    )
                )
              ),
      tabItem("up",
              h1("Upload"),
              fluidRow(
                box(
                  fileInput("file1", "Choose CSV File",
                            multiple = FALSE,
                            accept = c("text/csv",
                                       "text/comma-separated-values,text/plain",
                                       ".csv")),
                  checkboxInput("header", "Header", TRUE),
                  radioButtons("sep", "Separator",
                               choices = c(Comma = ",",
                                           Semicolon = ";",
                                           Tab = "\t"),
                               selected = ","),
                  radioButtons("quote", "Quote",
                               choices = c(None = "",
                                           "Double Quote" = '"',
                                           "Single Quote" = "'"),
                               selected = '"'),
                  radioButtons("disp", "Display",
                               choices = c(Head = "head",
                                           All = "all"),
                               selected = "head"))
                # File upload option
                # Button for submit
              ),
              fluidRow(
                box(
                  tableOutput("contents"),
                  width = 12
                )
              )
              ),
      tabItem("about",
              h1("About"),
              fluidRow(
                box(
                  p("The Animal Welfare Database is an R shiny app to make data more accessible for researchers to access and visualize."),
                  hr(),
                  p("Team Members:"),
                  p("Shefali Vishwakarma, Molecular Biology & Biochemistry, Simon Fraser University"),
                  p("Rodrigo Ortega Polo, Biology Study Leader - Bioinformatics"),
                  p("Xiaohui Yang, Data Analyst"),
                  width = 12),
                img(src='my_image.png', align = "right")
                ),
              h1("Contact Us"),
              fluidRow(box(
                p("Email:https://github.com/shefcode/Animal-Welfare-Database")
              )),
              h1("Report bugs"),
              textInput("text1", label = "Name"),
              textInput("text2", label = "Email"),
              textInput("text3", label = "Subject"),
              textInput("text4", label = "Description")
              
      )
    )
  )
)

server <- function(input, output) {
  output$bd <- shiny::renderDataTable(Behavior_duration,
                                      options = list(pageLength = 20)
  )
  output$bf <- shiny::renderDataTable(Behavior_frequency, 
                                      options = list(pageLength = 20)
  )
  output$ci <- shiny::renderDataTable(Cattle_ID,
                                      options = list(pageLength = 20)
  )
  output$cbc <- shiny::renderDataTable(CBC,
                                       options = list(pageLength = 20)
  )
  output$cort <- shiny::renderDataTable(Cortisol,
                                        options = list(pageLength = 20)
  )
  output$gs <- shiny::renderDataTable(GrowSafe,
                                      options = list(pageLength = 20)
  )
  output$hap <- shiny::renderDataTable(Haptoglobin,
                                       options = list(pageLength = 20)
  )
  output$hgab <- shiny::renderDataTable(Head_gate_area_branding, 
                                        options = list(pageLength = 20)
  )
  output$hga <- shiny::renderDataTable(Head_gate_area,
                                       options = list(pageLength = 20)
  )
  output$hgm <- shiny::renderDataTable(Head_gate_movement,
                                       options = list(pageLength = 20)
  )
  output$hgpb <- shiny::renderDataTable(Head_gate_peak_branding, 
                                        options = list(pageLength = 20)
  )
  output$hgp <- shiny::renderDataTable(Head_gate_peak, 
                                       options = list(pageLength = 20)
  )
  output$hobo <- shiny::renderDataTable(Hobo, 
                                        options = list(pageLength = 20)
  )
  output$inf <- shiny::renderDataTable(Infrared, 
                                       options = list(pageLength = 20)
  )
  output$saa <- shiny::renderDataTable(Serum_amyloid_A, 
                                       options = list(pageLength = 20)
  )
  output$sl <- shiny::renderDataTable(Stride_Length, 
                                      options = list(pageLength = 20)
  )
  output$subp <- shiny::renderDataTable(Substance_P, 
                                        options = list(pageLength = 20)
  )
  output$temp <- shiny::renderDataTable(Temperature, 
                                        options = list(pageLength = 20)
  )
  output$vas <- shiny::renderDataTable(VAS, 
                                       options = list(pageLength = 20)
  )
  
  output$table_bd <- DT::renderDataTable(
    DT::datatable(Behavior_duration[, input$show_vars_bd, drop = FALSE]),
    options = list(pageLength = 10)
  )
  
  output$table_bf <- DT::renderDataTable(
    DT::datatable(Behavior_frequency[, input$show_vars_bf, drop = FALSE]),
    options = list(pageLength = 10)
  )
  
  output$table_ci <- DT::renderDataTable(
    DT::datatable(Cattle_ID[, input$show_vars_ci, drop = FALSE]),
    options = list(pageLength = 10)
  )
  
  output$table_cbc <- DT::renderDataTable(
    DT::datatable(CBC[, input$show_vars_cbc, drop = FALSE]),
    options = list(pageLength = 10)
  )
  
  output$table_cort <- DT::renderDataTable(
    DT::datatable(Cortisol[, input$show_vars_cor, drop = FALSE]),
    options = list(pageLength = 10)
  )
  
  output$table_gs <- DT::renderDataTable(
    DT::datatable(GrowSafe[, input$show_vars_gs, drop = FALSE]),
    options = list(pageLength = 10)
  )
  
  output$table_hap <- DT::renderDataTable(
    DT::datatable(Haptoglobin[, input$show_vars_hap, drop = FALSE]),
    options = list(pageLength = 10)
  )
  
  output$table_hgab <- DT::renderDataTable(
    DT::datatable(Head_gate_area_branding[, input$show_vars_hgab, drop = FALSE]),
    options = list(pageLength = 10)
  )
  
  output$table_hga <- DT::renderDataTable(
    DT::datatable(Head_gate_area[, input$show_vars_hga, drop = FALSE]),
    options = list(pageLength = 10)
  )
  
  output$table_hgm <- DT::renderDataTable(
    DT::datatable(Head_gate_movement[, input$show_vars_hgm, drop = FALSE]),
    options = list(pageLength = 10)
  )
  
  output$table_hgpb <- DT::renderDataTable(
    DT::datatable(Head_gate_peak_branding[, input$show_vars_hgpb, drop = FALSE]),
    options = list(pageLength = 10)
  )
  
  output$table_hgp <- DT::renderDataTable(
    DT::datatable(Head_gate_peak[, input$show_vars_hgp, drop = FALSE]),
    options = list(pageLength = 10)
  )
  
  output$table_ho <- DT::renderDataTable(
    DT::datatable(Hobo[, input$show_vars_hob, drop = FALSE]),
    options = list(pageLength = 10)
  )
  
  output$table_if <- DT::renderDataTable(
    DT::datatable(Infrared[, input$show_vars_inf, drop = FALSE]),
    options = list(pageLength = 10)
  )
  
  output$table_saa <- DT::renderDataTable(
    DT::datatable(Serum_amyloid_A[, input$show_vars_saa, drop = FALSE]),
    options = list(pageLength = 10)
  )
  
  output$table_sl <- DT::renderDataTable(
    DT::datatable(Stride_Length[, input$show_vars_sl, drop = FALSE]),
    options = list(pageLength = 10)
  )
  
  output$table_subp <- DT::renderDataTable(
    DT::datatable(Substance_P[, input$show_vars_subp, drop = FALSE]),
    options = list(pageLength = 10)
  )
  
  output$table_temp <- DT::renderDataTable(
    DT::datatable(Temperature[, input$show_vars_temp, drop = FALSE]),
    options = list(pageLength = 10)
  )
  
  output$table_vas <- DT::renderDataTable(
    DT::datatable(VAS[, input$show_vars_vas, drop = FALSE]),
    options = list(pageLength = 10)
  )
  
  
  datasetInput <- reactive({
    switch(input$down_dataset,
           "Behavior Duration" = Behavior_duration,
           "Behavior Frequency" = Behavior_frequency,
           "Cattle ID" = Cattle_ID,
           "CBC" = CBC,
           "Cortisol" = Cortisol, 
           "GrowSafe" = GrowSafe, 
           "Haptoglobin" = Haptoglobin,
           "Head Gate Area Branding" = Head_gate_area_branding, 
           "Head Gate Area" = Head_gate_area, 
           "Head Gate Movement" = Head_gate_movement, 
           "Head Gate Peak Branding" = Head_gate_peak_branding, 
           "Head Gate Peak" = Head_gate_peak, 
           "Hobo" = Hobo, 
           "Infrared" = Infrared, 
           "Serum Amyloid A" = Serum_amyloid_A, 
           "Stride Length" = Stride_Length, 
           "Substance P" = Substance_P, 
           "Temperature" = Temperature, 
           "VAS" = VAS)
  })
  
  output$downloadData <- downloadHandler(
    filename = function() {
      paste(input$down_dataset,
            ".csv",
            sep = "")
    },
    content = function(file) {
      write.csv(datasetInput(), file, row.names = FALSE)
    }
  )
  
  output$graph1 <- renderPlotly({
    plot_ly(Behavior_duration,
            x = ~Behavior_duration$Cattle_ID,
            y = ~get(input$choice1),
            type = 'scatter',
            mode = 'markers') %>% 
      layout(xaxis = list(title = "Cattle ID"),
             yaxis = list(title = input$choice1))
  })
  output$graph2 <- renderPlotly({
    plot_ly(Behavior_frequency, 
            x = ~Behavior_frequency$Cattle_ID, 
            y = ~get(input$choice2),
            type = 'scatter', 
            mode = 'markers') %>% 
      layout(xaxis = list(title = "Cattle ID"),
             yaxis = list(title = input$choice2)
      )
  })
  output$graph3 <- renderPlotly({
    plot_ly(Cattle_ID,
            x = Cattle_ID,
            y = Cattle_ID$Group) %>% 
      layout(xaxis = list(title = "Cattle ID"),
             yaxis = list(title = "Group")
      )
  })
  output$graph4 <- renderPlotly({
    plot_ly(CBC, x = ~CBC$Cattle_ID,
            y = ~get(input$choice4),
            type = 'scatter', 
            mode = 'markers'
    ) %>% 
      layout(xaxis = list(title = "Cattle ID"),
             yaxis = list(title = input$choice4))
  })
  output$graph5 <- renderPlotly({
    plot_ly(Cortisol,
            x = ~Cortisol$Cattle_ID,
            y = ~get(input$choice5),
            type = 'scatter', 
            mode = 'markers') %>% 
      layout(xaxis = list(title = "Cattle ID"),
             yaxis = list(title = input$choice5))
  })
  output$graph6 <- renderPlotly({
    plot_ly(GrowSafe, x = ~GrowSafe$Cattle_ID,
            y = ~get(input$choice6),
            type = 'scatter',
            mode = 'markers'
    ) %>% 
      layout(xaxis = list(title = "Cattle ID"),
             yaxis = list(title = input$choice6))
  })
  output$graph7 <- renderPlotly({
    plot_ly(Haptoglobin, 
            x = ~Haptoglobin$Cattle_ID, 
            y = ~get(input$choice7),
            type = 'bar') %>% 
      layout(xaxis = list(title = "Cattle ID"),
             yaxis = list(title = input$choice7))
  })
  output$graph8 <- renderPlotly({
    plot_ly(Head_gate_area_branding,
            x = ~Head_gate_area_branding$Cattle_ID,
            y = ~get(input$choice8),
            type = 'scatter',
            mode = 'markers') %>% 
      layout(xaxis = list(title = "Cattle ID"),
             yaxis = list(title = input$choice8))
  })
  output$graph9 <- renderPlotly({
    plot_ly(Head_gate_area,
            x = ~Head_gate_area$Cattle_ID,
            y = ~get(input$choice9),
            type = 'scatter',
            mode = 'markers') %>% 
      layout(xaxis = list(title = "Cattle ID"),
             yaxis = list(title = input$choice9))
  })
  output$graph10 <- renderPlotly({
    plot_ly(Head_gate_movement, 
            x = ~Head_gate_movement$Cattle_ID,
            y = ~get(input$choice10), 
            type = 'scatter', 
            mode = 'markers') %>% 
      layout(xaxis = list(title = "Cattle ID"),
             yaxis = list(title = input$choice10))
  })
  output$graph11 <- renderPlotly({
    plot_ly(Head_gate_peak_branding,
            x = ~Head_gate_peak_branding$Cattle_ID, 
            y = ~get(input$choice11), 
            type = 'scatter', 
            mode = 'markers'
    ) %>% 
      layout(xaxis = list(title = "Cattle ID"),
             yaxis = list(title = input$choice11))
  })
  output$graph12 <- renderPlotly({
    plot_ly(Head_gate_peak, 
            x = ~Head_gate_peak$Cattle_ID, 
            y = ~get(input$choice12), 
            type = 'scatter', 
            mode = 'markers') %>% 
      layout(xaxis = list(title = "Cattle ID"),
             yaxis = list(title = input$choice12))
  })
  output$graph13 <- renderPlotly({
    plot_ly(Hobo, 
            x = ~Hobo$Cattle_ID, 
            y = ~get(input$choice13), 
            type = 'scatter', 
            mode = 'markers') %>% 
      layout(xaxis = list(title = "Cattle ID"),
             yaxis = list(title = input$choice13))
  })
  output$graph14 <- renderPlotly({
    plot_ly(Infrared, 
            x = ~Infrared$Cattle_ID, 
            y = ~get(input$choice14), 
            type = 'scatter', 
            mode = 'markers'
    ) %>% 
      layout(xaxis = list(title = "Cattle ID"),
             yaxis = list(title = input$choice14))
  })
  output$graph15 <- renderPlotly({
    plot_ly(Serum_amyloid_A, 
            x = ~Serum_amyloid_A$Cattle_ID,
            y = ~get(input$choice15),
            type = 'scatter',
            mode = 'markers'
    ) %>% 
      layout(xaxis = list(title = "Cattle ID"),
             yaxis = list(title = input$choice15))
  })
  output$graph16 <- renderPlotly({
    plot_ly(Stride_Length, 
            x = ~Stride_Length$Cattle_ID,
            y = ~get(input$choice16), 
            type = 'scatter', 
            mode = 'markers') %>% 
      layout(xaxis = list(title = "Cattle ID"),
             yaxis = list(title = input$choice16))
  })
  output$graph17 <- renderPlotly({
    plot_ly(Substance_P, 
            x = ~Substance_P$Cattle_ID, 
            y = ~get(input$choice17), 
            type = 'scatter',
            mode = 'markers') %>% 
      layout(xaxis = list(title = "Cattle ID"),
             yaxis = list(title = input$choice17))
  })
  output$graph18 <- renderPlotly({
    plot_ly(Temperature,
            x = ~Temperature$Cattle_ID, 
            y = ~get(input$choice18), 
            type = 'scatter',
            mode = 'markers'
    ) %>% 
      layout(xaxis = list(title = "Cattle ID"),
             yaxis = list(title = input$choice18))
  })
  output$graph19 <- renderPlotly({
    plot_ly(VAS,
            x = ~VAS$Cattle_ID,
            y = ~get(input$choice19),
            type = 'scatter', 
            mode = 'markers'
    ) %>% 
      layout(xaxis = list(title = "Cattle ID"),
             yaxis = list(title = input$choice19))
  })
  
  output$contents <- renderTable({
    req(input$file1)
    tryCatch(
      {
        df <- read.csv(input$file1$datapath,
                       header = input$header,
                       sep = input$sep,
                       quote = input$quote
        )
      },
      error = function(e) {
        # return a safeError if a parsing error occurs
        stop(safeError(e))
      }
    )
    if(input$disp == "head") {
      return(head(df))
    }
    else {
      return(df)
    }
    
  })
  
}
shinyApp(ui, server)