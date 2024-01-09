library(shiny)
library(imola)

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

  title = "Web Traffic Dashboard",
  breakpoint_system = breakpoint_system,
  style = 'padding:1em;background: #e7e7e9;',
  # fill_page = FALSE,
  # auto_fill = FALSE,

  rows = list(
    default = ".25fr .5fr 1fr 1fr 1fr ",
    md = ".25fr 1fr 1fr 1fr 1fr",

    xs = "50px 200px 1fr 1fr 1fr"
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
      " sub_dates sub_dates",
      " area-1 area-2",
      " area-3 area-4",
      " table table"),
    md = c(
      "marquee",
      " header ",
      " sub_dates ",
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
    style = "background: whitesmoke;
    display: flex;justify-content: space-between;
    border:1px solid lightgray",
    div(
      h5('Marquee'),
    )),
  div(
    class = "header",
    style = "background: whitesmoke;
    padding: 1em; display: flex;justify-content: space-between;
    border:1px solid lightgray",
    div(
      h5('RecoveryWatch: Predictive Indicators for Economic Recovery')
    )),
  div(
    class = "sub_dates",
    style = "background: whitesmoke;
    padding: 1em; display: flex;justify-content: space-between;
    border:1px solid lightgray",
    div(
      h5('Business & Consumer Sentiment: Measures of sentiment among consumers and business'),
    )),

  div(
    class = "area-1",
    style = "background: whitesmoke;
    padding: 1em; display: flex;justify-content: space-between;
    border:1px solid lightgray",
    div(
      h5('Consumer Sentiment'),
      p("showing results for Aug 2018 compared to Jul 2018")

    )),

  div(
    class = "area-2",
    style = "background: whitesmoke;
    padding: 1em; display: flex;justify-content: space-between;
    border:1px solid lightgray",
    div(
      h5('Economic Policy Uncertainty Index'),
      p("showing results for Aug 2018 compared to Jul 2018")
    )),

  div(
    class = "area-3",
    style = "background: whitesmoke;
    padding: 1em; display: flex;justify-content: space-between;
    border:1px solid lightgray",
    div(
      h5('OECD Business Confidence Indicator'),
      p("showing results for Aug 2018 compared to Jul 2018")
    )),

  div(
    class = "area-4",
    style = "background: whitesmoke;
    padding: 1em; display: flex;justify-content: space-between;
    border:1px solid lightgray",
    div(
      h5('Small Business Optimism Index'),
      p("showing results for Aug 2018 compared to Jul 2018")
    )),

  div(
    class = "table",
    style = "background: whitesmoke;
    padding: 1em; display: flex;justify-content: space-between;
    border:1px solid lightgray",
    div(
      h5('Monthly Trends'),
      p("showing results for Aug 2018 compared to Jul 2018")
    ))








)

server <- function(input, output, session) {}

shinyApp(ui = ui, server = server)
