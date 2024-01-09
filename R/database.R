date1 <- '01-01-2011'
date2 <- '01-12-2011'

dates <- seq(dmy(date1), dmy(date2), by = 'month')

data <- gapminder::gapminder %>% filter(country == 'Brazil') %>%
  mutate(life = rnorm(12,mean = 55,sd = 5),
         months = month.abb)%>%
  mutate(Revenue = 135000/1000, Costs = 27000/1000,  Discounts = 16000/1000,
         Freight = 10000/1000,  Profit = 10000/1000,
         `Raclette Courdavault` = 17100,
         `Thuringer Rostbratwrst` = 7100,
         `Manjimmup Dried Apples` = 8100,
         `Cote de Blaye` = 7100,
         `Camembert Pierrot` = 21369) %>%
  mutate(dates = dates)

# data$months <- as.Date(paste("2021", 1:12, 1, sep = "-"))
departamentos <- c("Recursos Humanos", "Financeiro", "Marketing", "Vendas", "Desenvolvimento de Produtos",
                   "Atendimento ao Cliente", "Tecnologia da Informação", "Logística", "Qualidade", "Planejamento",
                   "Compras", "Administração", "Comunicação", "Pesquisa e Desenvolvimento", "Operações",
                   "Gestão de Projetos", "Relações Públicas", "Contabilidade", "Recrutamento e Seleção",
                   "Serviço ao Consumidor", "Engenharia", "Manutenção", "Assuntos Regulatórios", "Jurídico",
                   "Treinamento e Desenvolvimento", "Sustentabilidade", "Análise de Dados", "Inovação",
                   "Controladoria", "Produção")




date1 <- '01-01-2011'
date2 <- '01-12-2011'

dates <- seq(dmy(date1), dmy(date2), by = 'month')

df1 <- data.frame(month = dates, y = rnorm(n = length(dates), 10, sd = 10))
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
