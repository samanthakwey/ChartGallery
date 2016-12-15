# Author : Samantha K Wey
# Objective : Get the stacked column chart that contains optimal mix and current mix
# Date : 2016-05-10

library(rCharts)
library(RColorBrewer)

makeStackedColumn = function(name,color,mm){
  mylist = vector("list", length(name))
  for(i in 1:length(name)){
    mylist[[i]]$name = name[i]
    mylist[[i]]$data = as.numeric(mm[i,])
    mylist[[i]]$color = color[i]
  }
  h = Highcharts$new()
  h$chart(type= 'column')
  h$title(text = 'Media Mix Optimization Scenario')
  h$xAxis(categories = c('Current Media Investment, $MM', 'Optimized, $MM'))
  h$yAxis(
        min = 0,
        title = list(
          text = 'Total Investment (%)'
        ),
        stackLabels = list(
          enabled = TRUE,
          style = list(
            fontWeight = 'bold'
          )
        ),
        labels = list(
          formatter = "#!function () {
            return Math.round(Highcharts.numberFormat(this.value)) + '%';
            }!#"
        )
  
  )
  h$legend(
        borderColor = '#CCC',
        borderWidth = 1,
        shadow = FALSE
  )
  h$tooltip(
        pointFormat = '<span style="color:{series.color}">{series.name}</span>: <b>{point.y}</b> ({point.percentage:.0f}%)<br/>',
        shared = TRUE
  )
  h$plotOptions(
        column = list(
          stacking = 'percent',
          dataLabels = list(
            enabled = TRUE,
            color = "#!(Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'!#",
            style = list(
              textShadow = '0 0 3px black'
            ),
            formatter = "#!function () {
            return '$' + Math.round(Highcharts.numberFormat(this.y));
            }!#"
          )
        )
  )
  h$series(
    mylist
  )
  return(h)
}


#dummy data
name = c("Television","Radio","Online Display","Paid Search","Hispanic Media","Direct Mail")
color = c("navy","red","green","purple","orange","grey")
mm = data.frame(c(92,2,11,7,3,20),c(78,14,17,9,7,11),stringsAsFactors = F)

h = makeStackedColumn(name,color,mm)
h
