install.packages("devtools")
library(devtools)
devtools::install_github("mrjoh3/pier")
library(pier)

data <- data.frame(label = c('Environment','Education','Business','Community'),
                   value = c(104,119,638,1250),
                   color = RColorBrewer::brewer.pal(4, 'Spectral'))
piped.pie <- data %>%
  pier() %>%
  pie.header('My New Header')

advanced.pie <- data %>%
  pier() %>%
  pie.size(inner=70, outer=100) %>%
  pie.header(text='Segments', font='Impact', location='pie-center') %>%
  pie.subtitle(text='by Type') %>%
  pie.footer(text='Economic Segments using fake data.',
             location = 'bottom-left') %>%
  pie.labels(mainLabel = list(fontSize = 14),percentage = list(fontSize = 15,color = "#000000")) %>%
  pie.tooltips()

advanced.pie
