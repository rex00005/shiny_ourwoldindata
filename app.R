library(shiny)
library(DT)
library(tidyverse)
library(plotly)
library(here)
library(glue)
library(shinyWidgets)

# once you've prepared the data uncomment this line
tidy_fuels <- read_csv(here("data", "cooking.csv"))
# you might want to use highlight_key here

ui <- fluidPage(
  title = "Indoor Air Pollution",
  tabsetPanel(
    tabPanel("chart",
             icon = icon("line-chart"),
             fluidRow(
               column(
                 2,
                 switchInput("linear_scale",
                               "Linearize x-axis",
                               value = FALSE
                 )
               ),
               column(
                 6,
                 offset = 1,
                 # also possible to use plotly here
                 pickerInput("countries", "Select Countries",
                                choices = unique(tidy_fuels$country),
                                multiple = TRUE,
                             options = list(
                               `actions-box` = TRUE,
                               size = 10,
                               `selected-text-format` = "count > 3"
                             )
                 )
               ),
               column(
                 2,
                 offset = 1,
                 checkboxInput("small_countries",
                               "Hide countries < 1 million",
                               value = FALSE
                 )
               )
             ), chooseSliderSkin("Modern"),
             plotlyOutput("chart", width = "100%"),
             sliderInput("year",
                         "Year",
                         min = 2000,
                         max = 2016,
                         value = 2016,
                         sep = "",
                         width = "100%",
                         animate =
                           animationOptions(interval = 600, loop = F)

             )
    ),
    tabPanel("table", dataTableOutput("table"),
             icon = icon("table")),
    tabPanel("about", icon = icon("question"),
             fluidRow(column(6, offset = 3,
                             h3("About the APP"),
                             p("This APP is created by Xiaoyu Tian (28540964), Master of Business Analytics, Monash, for the ETC5523 Assignment 2."),
                             p("The data is related to indoor air pollution, and it is sourced from Our World in Data."),
                             p("The data considers the importance of the access to clean fuels for cooking in reducing the burden of health and mortality impacts of indoor air pollution. The source chart and data can be obtained below."),
                             tags$br(),
                             uiOutput("link"),
                             img(src = "https://www.principalsbrand.co.nz/wp-content/uploads/2018/02/Monash-Case_Study-4-1920x1005.jpg", height = 400, auto_width = T))))
  )
)

server <- function(input, output, session) {
  # Define reactive expressions here for filtering data




  data <- reactive({

    tidy_fuels$tooltip <-
      glue::glue_data(tidy_fuels,
                      "Country: {country}",
                      "\nPopulation: {scales::label_number_auto()(gdp_per_capita)}",
                      "\nProportion: {scales::percent(cooking, scale = 1, accuracy = 1)}",
                      "\nGDP per capita: {scales::dollar(gdp_per_capita)}")

    if(input$small_countries == TRUE){
      tidy_fuels %>%
        filter(year == input$year) %>%
        filter(total_population >= 1000000) %>%
        highlight_key(~country)}

    else{tidy_fuels %>%
        filter(year == input$year) %>%
        highlight_key(~country)}


  })

  xax <- reactive({
    if(input$linear_scale == FALSE){
      tickvals = list(1000, 2000, 5000, 10000, 20000, 50000, 100000)
      }
    else{tickvals = list(20000,40000, 60000, 80000, 100000)
         }
  })

  xax1 <- reactive({
    if(input$linear_scale == FALSE){

      ticktext = list("$1,000", "$2,000", "$5,000", "$10,000", "$20,000", "$50,000", "$100,000")}
    else{
    ticktext = list("$20,000", "$40,000", "$60,000", "$80,000", "$100,000")}
  })


  # Define outputs here
  output$chart <- renderPlotly({
    plot <- data()  %>%
      plot_ly(type="scatter",
              mode = "markers",
              x = ~gdp_per_capita,
              y = ~cooking,
              color = ~continent,
              colors = "Accent",
              size = ~total_population,
              text = ~tooltip,
              hoverinfo = 'text',
              marker = list(sizemode = "area")) %>%
      layout(xaxis= list(title = "GDP per capita (int. -$)",
                         fixedrange = T,
                         autotick = F,
                         tickmode = "array",
                         tickvals = xax(),
                         ticktext = xax1()),
             yaxis = list(title = "Access to clean fuels and technologies for cooking",
                          ticksuffix = "%",
                          fixedrange = T))

    if(input$linear_scale == FALSE){

      plot <- plot %>%
        layout(plot,
               xaxis= list(type = "log",
                           autotick = F,
                           tickmode = "array",
                           tickvals = xax(),
                           ticktext = xax1(),
                           title = "GDP per capita (int. -$)"),
               yaxis = list(title = "Access to clean fuels and technologies for cooking",
                            ticksuffix = "%"))}

    plot %>%
      config(displaylogo = FALSE,
             modeBarButtonsToRemove = c("zoomIn2d", "zoomOut2d", "zoom2d", "pan2d"))%>%
      highlight(on = "plotly_hover",
                off = "plotly_doubleclick",
                persistent = F,
                defaultValues = input$countries)


  })


  output$table <- renderDataTable({
    tidy_fuels_dt <- tidy_fuels %>%
    mutate(total_population = scales::number_format(big.mark = ",",
                                                    accuracy = 1)(total_population)) %>%
    mutate(gdp_per_capita = scales::dollar(gdp_per_capita)) %>%
    mutate(cooking = scales::label_percent(scale = 1,
                                           accuracy = 0.01)(cooking)) %>%
    arrange(desc(year)) %>%
    select(!c(code,continent))%>%
      filter(country %in% input$countries)


  datatable(tidy_fuels_dt,
            filter = 'top',
            options = list(pageLength = 20,
                           autoWidth = TRUE,
                           columnDefs = list(list(className = 'dt-center',
                                                  targets = 0:5))),
            colnames = c("Country",
                         "Year",
                         "Access to clean fuels and technologies for cooking (% of population)",
                         "GDP per capita (int.-$)",
                         "Population"))

  })

  url <- a("Source Data and Chart", href = "https://ourworldindata.org/grapher/access-to-clean-fuels-for-cooking-vs-gdp-per-capita")
  output$link <- renderUI({
    tagList("Click here to get: ", url)
  })

}

runApp(shinyApp(ui, server))

