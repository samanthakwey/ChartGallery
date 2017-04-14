
getPredictedvsActual = function(titleText,Actual,Predicted){
  h = Highcharts$new()
  h$title(
        text = titleText,
        x = -20
  )
  h$xAxis(
        categories =c(1:10)
  )
  h$yAxis(
        title = list(
          text = 'Percentage'
        ),
        plotLines = list(list(
          value = 0,
          width = 1,
          color = '#808080'
        )),
        labels = list(
          formatter = "#!function () {
              return Math.round(Highcharts.numberFormat(this.value)) + '%';
              }!#"
        )
  )
  h$tooltip(
    pointFormat = '<span style="color:{series.color}">{series.name}</span>: <b>{point.y:.2f}%</b><br/>',
    shared = FALSE
  )
  h$legend(
        layout = 'vertical',
        align = 'right',
        verticalAlign = 'middle',
        borderWidth = 0
  )
  h$series(list(
    list(
        name = 'Actual',
        data = Actual*100
    ), list(
        name = 'Predicted',
        data = Predicted*100
    )))
  return(h)
}

p1 = getPredictedvsActual(titleText = "Epsilon: Actual vs Predicted" ,Actual = Epsilon$Actual,Predicted = Epsilon$Predicted)
p1


p2 = getPredictedvsActual(titleText = "Infobase: Actual vs Predicted" ,Actual = Infobase$Actual,Predicted = Infobase$Predicted)
p2
