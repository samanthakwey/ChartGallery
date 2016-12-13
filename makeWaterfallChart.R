library(rCharts)
library(RColorBrewer)
library(highcharter)


makeAWaterfallChart = function(data,customedColor = "Blues",titleText = "Variable Importance"){

  data$color = colorRampPalette(brewer.pal(9,customedColor))(nrow(data)+1)[-1]
  
  mylist = vector("list", nrow(data))
  for(i in 1:nrow(data)){
    mylist[[i]]$name = data[i,1]
    mylist[[i]]$y = data[i,2]
    mylist[[i]]$color = data[i,3]
  }
  
  h1 = Highcharts$new()
  h1$chart(
  type =  'waterfall'
  )
  
  h1$title(
  text = titleText
  )
  
  h1$xAxis(
  type = 'category'
  )
  
  h1$yAxis(list(list(
  title = list(
  text = 'Percentage'
  )
  ,max = 100
  ,labels = list(
  formatter = "#!function () {
    return Highcharts.numberFormat(this.value) + '%';
  }!#"
  )
  
  )))
  
  h1$legend(
  enabled = FALSE
  )
  
  h1$tooltip(
  pointFormat = '<b>{point.y:,.2f}%</b>'
  )
  
  h1$series(
    list(
      list(
        data = mylist,
        dataLabels = list(
          enabled = TRUE,
          formatter = "#!function () {
                          return Highcharts.numberFormat(this.y) + '%';
                      }!#",
          style = list(
          color = '#FFFFFF',
          fontWeight = 'bold',
          textShadow = '0px 0px 3px black'
          )
        )
      )
    )
  )
  
  return(h1)
}

makeWaterfallHighcharter = function(data,customedColor = "Blues",titleText = "Variable Importance"){
  
  data$color = rev(colorRampPalette(brewer.pal(9,customedColor))(nrow(data)+2)[-c(1,2)])
  
  data = data %>% list.parse3()
  
  h1 = highchart() %>%
    hc_chart(type =  'waterfall') %>%
    hc_title(text = titleText ) %>%
    hc_xAxis(type = 'category') %>%
    hc_yAxis(
      title = list(
        text = 'Percentage'
      )
      ,max = 100
      ,labels = list(format = "{value:,.2f}%", useHTML = TRUE)
      
    ) %>%
    hc_legend(
      enabled = FALSE
    ) %>%
    hc_tooltip(
      pointFormat = '<b>{point.y:,.2f}%</b>'
    ) %>%
    hc_add_serie(
      
      data = data,
      dataLabels = list(
        enabled = TRUE,
        format = "{point.y:,.2f}%",
        style = list(
          color = '#FFFFFF',
          fontWeight = 'bold',
          textShadow = '0px 0px 3px black'
        )
      )
    )
  
  return(h1)
  
}


firstSix = round(runif(7,1,100),2)
data = data.frame(
  name = c('Base','TV','Radio','Search','Video','Digital','Audio'),
  y = firstSix/sum(firstSix)*100,
  stringsAsFactors = F)

#rCharts - Highchart
makeAWaterfallChart(data = data,customedColor = "Reds",titleText = "Model Attribution")

#highcharter - Highchart
makeWaterfallHighcharter(data,customedColor = "Blues",titleText = "Media Comtribution")
makeWaterfallHighcharter(data,customedColor = "Reds",titleText = "Media Comtribution")
makeWaterfallHighcharter(data,customedColor = "Greens",titleText = "Media Comtribution")

