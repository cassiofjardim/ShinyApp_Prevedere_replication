
#Mudando

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

# source(file = 'database.R')

function_hc <- function(hc){
  hc %>%

    hc_xAxis( type  ='datetime', categories = data$dates) %>%

    hc_yAxis(
      title = list(text = paste0("")),

      style = list(
        fontSize = "16px",
        color =  "lightgray",
        fontWeight = "100",
        fontFamily = "Roboto Condensed"
      ),

      plotLines = list(
        list(
          value = ymd(20220101) %>% datetime_to_timestamp(),
          color = "lightgray",
          dashStyle = "longdashdot",

          label = list(
            text = "Forecasting",
            align = "right",
            verticalAlign = "middle",
            rotation = 0,
            x = 180,
            y = 50,
            style = list(color = "lightgray", fontWeight = "bold")
          )
        )
      ),
      gridLineWidth = 0.5,
      gridLineColor = 'lightgray',
      gridLineDashStyle = "longdash"
    ) %>%

    hc_plotOptions(series = list(
      lineWidth = 1.25,
      marker = list(enabled = FALSE),
      borderRadius = 1,

      dataLabels =
        list(enabled = FALSE)
    ))  %>%
    hc_credits(enabled = TRUE,
               text = "Data as of 10 - 2022")
}

### Modulo

ui <- gridPage(
  tags$style(
    '
    @import url("https://fonts.googleapis.com/css2?family=Exo+2:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");

    @import url("https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");

    *{
      font-family: "Exo 2", sans-serif;
    }

/************************************************/
/**************MARQUEE AREA and HEADER AREA******/
/************************************************/
.marquee-container{
    display: flex;
    align-items: center;
    justify-content: end;
    background: #0f1923;
    overflow: hidden;
    padding: 0.5em 2em;
    width: 100vw;



}

.marquee-container .marquee {
    display: flex;
    align-items: center;
    font-size: .75em;

    font-family: sans-serif;
    padding: 0.25em 0;
    color: #fff;

    white-space: nowrap;
    animation: marquee 41.5s infinite linear;
    font-weight: 500;
    margin: 0px;

}
/* notice the infinite */
.marquee-container .marquee:after{

}


@keyframes marquee{
    0% {
        transform: translateX(0)
    }
    100% {
        transform: translateX(40%)
    }
}
/****************************HEADER AREA*******************************/

'
  ),
  title = "Web Traffic Dashboard",
  breakpoint_system = breakpoint_system,
  style = 'padding:1em;background: #e7e7e9;',
  # fill_page = FALSE,
  # auto_fill = FALSE,

  rows = list(
    default = "auto auto auto auto auto auto ",
    md = "auto auto auto auto auto auto auto ",
    xs = "auto auto auto auto auto auto auto "
  ),
  columns = list(
    default = "1fr 1fr",
    md = "1fr 1fr",

    xs = "100px 200px 1fr 1fr 1fr"
  ),
  areas = list(
    default = c(
      "marquee marquee",
      "header header",
      "sub_title sub_title",
      "area-1 area-2",
      "area-3 area-4",
      "table table"),
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
    default = "",
    md = "10px"
  ),

  div(
    class = "marquee",
    style = "

    display: flex;
    justify-content: space-between;

    height: fit-content;",
    div(class = "marquee-container",
        div(class = "marquee",
            style = "display: flex; align-items: center;",
            lista_marquee,lista_marquee)
    )),


  div(
    class = "header",
    style = "background: #23292C; color: whitesmoke;
    padding: 1em;
    display: flex;
    justify-content: space-between;

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

    height: fit-content;",
    div(
      h5('Business & Consumer Sentiment: Measures of sentiment among consumers and business')
    ),
    dateRangeInput(
      'dateRange',
      label = '',
      start = data$dates[1] ,
      end = data$dates[12]
    )),

  div(
    class = "area-1",
    style = "background: whitesmoke;
    padding: 1em; display: flex;justify-content: space-between;

    height: fit-content;",
    div(
      class = 'charts',
      style  =' width: 100%;',
      h5('Consumer Sentiment', style = ''),
      p("4-6 month lead-time", style = ''),
      highchartOutput(outputId = 'chart_top_left', height = 200),
      p(class = 'source',"Source: Consumer Sentiment Data", style = 'margin: 0px;'))),

  div(
    class = "area-2",
    style = "background: whitesmoke;
    padding: 1em; display: flex;justify-content: space-between;

    height: fit-content;",
    div(
      class = 'charts',
      style  =' width: 100%;',
      h5('Economic Policy Uncertainty Index'),
      p("6-9 month lead-time"),
      highchartOutput(outputId = 'chart_top_right', height = 200),
      p(class = 'source',"Source: Consumer Sentiment Data", style = 'margin: 0px;')
    )),

  div(
    class = "area-3",
    style = "background: whitesmoke;
    padding: 1em; display: flex;justify-content: space-between;

    height: fit-content;",
    div(
      class = 'charts',
      style  =' width: 100%;',
      style = 'height: fit-content;',
      h5('OECD Business Confidence Indicator'),
      p("4-6 month lead-time"),
      highchartOutput(outputId = 'chart_bottom_left', height = 200),
      p(class = 'source',"Source: Consumer Sentiment Data", style = 'margin: 0px;')
    )),

  div(
    class = "area-4",
    style = "background: whitesmoke;
    padding: 1em; display: flex;justify-content: space-between;

    height: fit-content;",
    div(
      class = 'charts',
      style  =' width: 100%;',
      h5('Small Business Optimism Index'),
      p("3-5 month lead-time"),
      highchartOutput(outputId = 'chart_bottom_right', height = 200),
      p(class = 'source',"Source: Consumer Sentiment Data", style = 'margin: 0px;')
    )),

  div(
    class = "table",
    style = "background: whitesmoke;
    padding: 1em; display: flex;justify-content: space-between;
    ",
    div(
      h5('Monthly Trends'),
      p("showing results for Aug 2018 compared to Jul 2018"),
      reactable::reactableOutput(outputId = 'table')
    )),


  hr(class = 'hr_chart', style = 'height: 2px'),

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
        gt::gt_output('summary_table')),
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    div(class = 'icons_up_down',

    ))
)

server <- function(input, output, session) {

  output$chart_top_left <- renderHighchart({
    data %>% filter(dates >= input$dateRange[1] &
                      dates <= input$dateRange[2]) %>%
      hchart("line",
             options = list(highchart.json = TRUE),
             name = 'Example',
             color = 'green',
             hcaes(x = year, y = round(life / 2, 0))) %>%

      function_hc()
  })
  output$chart_top_right <- renderHighchart({
    data  %>% filter(dates >= input$dateRange[1] &
                               dates <= input$dateRange[2]) %>%
      hchart("line",
             name = 'Example',
             color = 'red',
             hcaes(x = year, y = round(life / 2, 0))) %>%
      function_hc()
  })
  output$chart_bottom_left <- renderHighchart({
    data %>% filter(dates >= input$dateRange[1] &
                      dates <= input$dateRange[2]) %>%
      hchart("line",
             name = 'Example',
             color = 'blue',
             hcaes(x = year, y = round(life / 2, 0))) %>%
      function_hc()
  })
  output$chart_bottom_right <- renderHighchart({
    data %>% filter(dates >= input$dateRange[1] &
                      dates <= input$dateRange[2]) %>%
      hchart("line",
             name = 'Example',
             color = 'black',
             hcaes(x = year, y = round(life / 2, 0))) %>%
      function_hc()
  })

  output$summary_table <- render_gt({
    gt(table_df) %>%
      cols_label(indicators = "Indicators",
                 Relationship = "Relationship",
                 jan_20 = "Jan/20",
                 jul_22 = "Jul/22",
                 aug_22 = "Aug/22",
                 sep_22	 = "Sep/22",
                 out_22	 = "Out/22"

      )%>%
      tab_style(
        locations = cells_column_labels(columns = everything()),
        style     = list(
          #Give a thick border below
          cell_borders(sides = "bottom", weight = px(3)),
          cell_fill(color = 'lightgray'),
          #Make text bold
          cell_text(weight = "700",size = '12px')
        )
      ) %>%
      tab_style(
        locations = cells_body(),
        style     = list(
          #Give a thick border below

          cell_fill(color = 'whitesmoke'),
          #Make text bold
          cell_text(weight = "700",size = '12px')
        )
      ) %>%

      data_color(columns = c(indicators),
                 colors = 'lightgray') %>%
      tab_options(
        #Remove border between column headers and title
        column_labels.border.top.width = px(3),
        column_labels.border.top.color = "transparent",
        #Remove border around table
        table.border.top.color = "transparent",
        table.border.bottom.color = "transparent",
        #Reduce the height of rows
        data_row.padding = px(3),
        #Adjust font sizes and alignment
        source_notes.font.size = 12,
        heading.align = "left",table.width = 850

      ) %>% tab_options(data_row.padding = px(1)) %>%



      text_transform(
        locations = cells_body(columns = jan_20:last_col()),
        fn = function(x) {
          local_image(
            filename = c('www/img/down.png','www/img/up.png'),
            height = 10
          )
        }
      )

  })



}

options(shiny.autoreload = TRUE)

shinyApp(ui = ui, server = server,
         options = list(launch.browser = TRUE))





