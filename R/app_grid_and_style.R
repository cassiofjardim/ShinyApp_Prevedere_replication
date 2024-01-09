library(shiny)
library(imola)
library(highcharter)
library(tidyverse)
library(gt)
library(lubridate)
#https://public.tableau.com/app/profile/pradeepkumar.g/viz/WebTrafficDashboardRedesign/Cockpit
divStyle <- function(color, border) {
  paste0(
    "background: ", color, "; ",
    "border: 10px solid ", border, ";"
  )
}


breakpoint_system <- getBreakpointSystem()

breakpoint_system <- addBreakpoint(
  breakpoint_system,
  breakpoint("md", max = 1180)
)


divStyle <- function(color, border) {
  paste0(
    "background: ", color, "; ",
    "border: 10px solid ", border, ";"
  )
}



ui <- gridPage(
  tags$style(
    '
    @import url("https://fonts.googleapis.com/css2?family=Exo+2:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");

    @import url("https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");

    *{
      font-family: "Exo 2", sans-serif;
    }




    '
  ),
  title = "Web Traffic Dashboard",
  breakpoint_system = breakpoint_system,
  style = 'padding:1em;background: #e7e7e9;',
  # fill_page = FALSE,
  # auto_fill = FALSE,

  rows = list(
    default = "auto auto auto auto auto auto auto ",
    md = "auto auto auto auto auto auto auto ",
    xs = "auto auto auto auto auto auto auto "
  ),
  # columns = list(
  #   default = "1fr 2fr 3fr 3fr ",
  #   md = "100px 200px 3fr 3fr 3fr",
  #
  #   xs = "100px 200px 1fr 1fr 1fr"
  # ),
  areas = list(
    default = c(
      "marquee marquee",
      " header header",
      " sub_title sub_title",
      " area-1 area-2",
      " area-3 area-4",
      " table table"),
    md = c(
      "marquee",
      " header ",
      " sub_title ",
      " area-1",
      " area-2",
      " area-3",
      "area-4",
      "table")
  ),
  gap = list(
    default = "5px",
    md = "10px"
  ),

  div(
    class = "marquee",
    style = "
    padding: 1em;
    display: flex;
    justify-content: space-between;
    border:1px solid lightgray;
    height: fit-content;",
    div(
      h5('Marquee'),
    )),


  div(
    class = "header",
    style = "background: #23292C; color: whitesmoke;
    padding: 1em;
    display: flex;
    justify-content: space-between;
    border:1px solid lightgray;
    height: fit-content;
    ",
    div(
      h5('RecoveryWatch: Predictive Indicators for Economic Recovery')
    ),
    tags$img(src = 'img/logo.png',class = 'company_logo', width = '114px', height = '24px')),


  div(
    class = "sub_title",
    style = "background: #236192;color: whitesmoke;
    padding: 1em; display: flex;justify-content: space-between;
    border:1px solid lightgray;
    height: fit-content;",
    div(
      h5('Business & Consumer Sentiment: Measures of sentiment among consumers and business')
    ),
    dateRangeInput(
      'dateRange',
      label = '',
      start = "2011-01-01" ,
      end = "2011-12-01"
    )),

  div(
    class = "area-1",
    style = "background: whitesmoke;
    padding: 1em; display: flex;justify-content: space-between;
    border:1px solid lightgray;
    height: fit-content;",
    div(
      h5('Consumer Sentiment'),
      p("4-6 month lead-time"),
      highchartOutput(outputId = 'chart_top_left'))),

  div(
    class = "area-2",
    style = "background: whitesmoke;
    padding: 1em; display: flex;justify-content: space-between;
    border:1px solid lightgray;
    height: fit-content;",
    div(
      h5('Economic Policy Uncertainty Index'),
      p("6-9 month lead-time"),
      highchartOutput(outputId = 'chart_top_right')
    )),

  div(
    class = "area-3",
    style = "background: whitesmoke;
    padding: 1em; display: flex;justify-content: space-between;
    border:1px solid lightgray;
    height: fit-content;",
    div(
      style = 'height: fit-content;',
      h5('OECD Business Confidence Indicator'),
      p("4-6 month lead-time"),
      highchartOutput(outputId = 'chart_bottom_left')
    )),

  div(
    class = "area-4",
    style = "background: whitesmoke;
    padding: 1em; display: flex;justify-content: space-between;
    border:1px solid lightgray;
    height: fit-content;",
    div(
      h5('Small Business Optimism Index'),
      p("3-5 month lead-time"),
      highchartOutput(outputId = 'chart_bottom_right')
    )),


  hr(class = 'hr_chart'),

  div(
    class = 'table',
    style = 'background: whitesmoke; display: flex; justify-content: space-between;',
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    div(
      class = 'left_comment',

      tags$ul(
        class = 'list',
        h4("MONTHLY TRENDS"),
        tags$li(
          class = 'list_1',
          p(
            "How have these indicators changed up or down in the past 5 months.",
            style = "color: gray; font-size: .85em;"
          )
        ),
        tags$li(class = 'list_2'),
        tags$li(class = 'list_3')
      )
    ),
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        div(class = 'gt_table',
            style = 'border:5px solid',
            gt::gt_output('summary_table')),
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    div(class = 'icons_up_down',
        div(class = 'gt_table',
            tags$ul(class = 'up_down',
                    style = 'list-style: none; display: flex; flex-direction: column;gap: 2em;',
                    tags$li(tags$img(src = 'img/up.png',width = '24px', height = '24px',
                                     'Upward Pressure on economy')),
                    tags$li(tags$img(src = 'img/down.png',width = '24px', height = '24px',
                                     'Downward Pressure on economy')),
            )
        )
    ))
)

server <- function(input, output, session) {



}

shinyApp(ui = ui, server = server)
