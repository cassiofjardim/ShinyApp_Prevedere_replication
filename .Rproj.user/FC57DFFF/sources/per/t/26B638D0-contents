
first_var <- c("","13.8%","-18%","5.8","23.6%","-2.38%","9.1%","2.1%","18.3%","0.6%","16.1%","-10%","11.7%")
second_var <- c("","13.8%","-18%","5.8","23.6%","-2.38%","9.1%","2.1%","18.3%","0.6%","16.1%","-10%","11.7%")

all_vars <- c(first_var,second_var)

stock_market <- c("New York Stock Exchange","Nasdaq","Shanghai Stock Exchange",
                  "Euronext","Shenzhen Stock Exchange","Japan Exchange Group",
                  "Hong Kong Stock Exchange","Bombay Stock Exchange","National Stock Exchange",
                  "London Stock Exchange","Saudi Stock Exchange (Tadawul)","Toronto Stock Exchange",
                  "SIX Swiss Exchange","Deutsche Börse AG","Korea Exchange",
                  "B3 Brasil Bolsa Balcão",
                  "New York Stock Exchange","Nasdaq","Shanghai Stock Exchange",
                  "Euronext","Shenzhen Stock Exchange","Japan Exchange Group",
                  "Hong Kong Stock Exchange","Bombay Stock Exchange","National Stock Exchange",
                  "London Stock Exchange")


marquee_df <- tibble(names = stock_market, values = all_vars)%>% mutate(names = stock_market)
marquee_df <- marquee_df
# marque_p <- marque_p %>% str_to_upper()

white <- "white"

marquee_df <- marquee_df %>%
                mutate(cor_var = case_when(values < 0 ~ "#fe3c30", values >= 0 ~ "#30c759"))

lista_marquee <- list()

for (i in 1:nrow(marquee_df)) {

  lista_marquee[[i]]  <- p(str_to_upper(paste0(marquee_df$names[i])),
                           style = "color: white; font-size: 1.1em;",
                           span(str_to_upper(paste0(marquee_df$values[i])),
                             style = glue::glue("color: {marquee_df$cor_var[i]};
                                                font-size: 1.25em;font-weight: 900;
                                                margin: 0 1em !important;")))

}

