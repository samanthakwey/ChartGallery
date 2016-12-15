# Author : Samantha Wey
# Objective : Get the combo chart that contains waterfall and pie chart
# Date : 2016-05-10

library(rCharts)
library(RColorBrewer)

# the fake dataset
makeAWaterfallPieChart = function(data,customedColor = "Blues",titleText = "Variable Importance", yTitle = "Quote",centerPlace = c(130, 65)){
  library(rCharts)
  
  #   data$color = ifelse(data$y>=0,colors[1],colors[2])
  data$color = colorRampPalette(brewer.pal(9,customedColor))(nrow(data)+1)[-1]
  data2 = data
  data2$y = data$y/sum(data$y)*100
  
  
  mylist = vector("list", nrow(data))
  mylist2 = vector("list", nrow(data2))
  for(i in 1:nrow(data)){
    mylist[[i]]$name = data[i,1]
    mylist[[i]]$y = data[i,2]
    mylist[[i]]$color = data[i,3]
    mylist2[[i]]$name = data2[i,1]
    mylist2[[i]]$y = data2[i,2]
    mylist2[[i]]$color = data2[i,3]
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
      text = yTitle
    )
    ,labels = list(
      formatter = "#!function () {
      return Math.round(Highcharts.numberFormat(this.value)) + 'MM';
      }!#"
    )
    
  )))
  
  h1$legend(
    enabled = FALSE
  )
  
  h1$tooltip(
    pointFormat = '<b>{point.y:,.2f}MM</b>'
  )
  
  h1$series(
    list(
      list(
        
        data = mylist,
        dataLabels = list(
          type = 'waterfall',
          enabled = TRUE,
          formatter = "#!function () {
          return Highcharts.numberFormat(this.y) + 'MM';
          }!#",
          style = list(
            color = '#FFFFFF',
            fontWeight = 'bold',
            textShadow = '0px 0px 3px black'
          )
        ),
        tooltip = list(
          pointFormat = '<b>{point.percentage:,.2f}%</b>'
          )
        
      ),
      list(
        type = 'pie',
        data = mylist2,
        center = centerPlace,
        #       size = 100,
        showInLegend = FALSE,
        dataLabels = list(
          enabled = TRUE,
          format = '<b>{point.name}</b>: {point.percentage:.1f} %'
        ),
        
        tooltip = list(
          pointFormat = '<b>{point.y:,.2f}%</b>'
        )
      )
      
    ))
  
  return(h1)
}

data = data.frame(
  name = c('Base','TV','Radio','Search','Video','Digital','Audio'),
  y = round(runif(7,1,100),2),
  stringsAsFactors = F)


h = makeAWaterfallPieChart(data = data,customedColor = "Blues",titleText = "Total Number of Quote", yTitle = "Quote",centerPlace = c(130, 65))
h
