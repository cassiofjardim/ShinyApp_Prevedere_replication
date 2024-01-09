date1 <- '01-01-2011'
date2 <- '01-12-2011'

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
