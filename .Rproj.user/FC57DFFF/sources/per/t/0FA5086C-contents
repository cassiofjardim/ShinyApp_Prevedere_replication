
library(shiny)
library(tidyverse)
library(lubridate)
library(imola)
library(highcharter)
library(gt)



source(file = 'R/modules/module_1.R')

source('R/utils/web_scrapping_marquee.R')
source('R/utils/charts.R')

ui <- fluidPage(title = "Prevedere Replication",
               fill_page = TRUE,
                includeCSS(path = "www/css/style.css"),

        div(class = "marquee-container",
                 div(class = "marquee",
                     style = "display: flex; align-items: center;",
                     lista_marquee,lista_marquee)
                 ),

        div(id = "title",
                 h4(span("RecoveryWatch:",
                         style  = 'font-weight: 400; font-size: 1em;'),
                    span(" Predictive Indicators for Economic Recovery",
                         style  = 'font-weight: 100; font-size: .95em;')),
                 span(
                   "Company Logo",
                   class = 'company_logo',
                   style = 'color: whitesmoke;display: inline-block;display: block;font-size: 1.5em;
    position: absolute; top: 0; right: 0; top: 7%; padding-right: 2em;'
                 )),

        tela_1_UI("tela_1")


)

server <- function(input, output, session) {

  tela_1_Server('tela_1')

}

shinyApp(ui, server)


