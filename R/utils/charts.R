# Creating sample

date1 <- '01-01-2011'
date2 <- '01-01-2022'

dates <- seq(dmy(date1), dmy(date2), by = 'month')

df1 <- data.frame(month = dates, y = rnorm(n = length(dates), 10, sd = 20))
df2 <- data.frame(month = dates, y = rnorm(n = length(dates), 20, sd = 20))
df3 <- data.frame(month = dates, y = rnorm(n = length(dates), 10, sd = 20))
df4 <- data.frame(month = dates, y = rnorm(n = length(dates), 40, sd = 20))


table_df <- tibble(
  indicators = c('Consumer Sentiment','Economic Policy Uncertainty',
                 'OECD Business Confidence Indicator',
                 'Small Business Optimism Index'),

  Relationship = c('Procyclic','Countercyclic',
                   'Procyclic',
                   'Procyclic'),

  jan_20 = c('.','.','.','.'),

  jul_22 = c('.','.','.','.'),

  aug_22 = c('.','.','.','.'),

  sep_22 = c('.','.','.','.'),

  out_22 = c('.','.','.','.'))

chart <- function(data,color){

  highchart(type = 'chart') %>% hc_add_series(
    data = data,
    hcaes(x = month, y = y),
    color = color,

    size = .5,
    showInLegend = FALSE,
    type = 'line'
  ) %>%

    hc_xAxis( type  ='datetime') %>%

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
               text = "Data as of 10 - 2022")%>%
    hc_size(height = '150px')

}
