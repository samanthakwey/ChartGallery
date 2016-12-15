# Chart Gallery
My Chart Collection (R)
* Source: rCharts, googleVis, Highcharter, etc.

[Highcharts Library](http://www.highcharts.com/) 

```r
library(rCharts)
library(RColorBrewer)
library(highcharter)
```
### Set up Chart functions using highcharter/rCharts/googleVis packages (Example)
```r

makeWaterfallHighcharter = function(data,customedColor ="Blues",titleText = "Variable Importance"){
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

```

### Dummy Dataset
```r
firstSix = round(runif(7,1,100),2)
data = data.frame(
  name = c('Base','TV','Radio','Search','Video','Digital','Audio'),
  y = firstSix/sum(firstSix)*100,
  stringsAsFactors = F)
data
```

### Plot the waterfall chart with highcharter
__Theme: Blues__
```r
makeWaterfallHighcharter(data,customedColor = "Blues",titleText = "Media Contribution")
```
![highchart](screenshot/waterfall_Blues.png)

__Theme: Reds__
```r
makeWaterfallHighcharter(data,customedColor = "Reds",titleText = "Media Contribution")
```
![highchart](screenshot/waterfall_Reds.png)

__Theme: Greens__
```r
makeWaterfallHighcharter(data,customedColor = "Greens",titleText = "Media Contribution")
```
![highchart](screenshot/waterfall_Greens.png)

### Plot the waterfall/Pie Combo chart with rCharts
__Theme: Blues__
```r
#dummy data
data = data.frame(
  name = c('Base','TV','Radio','Search','Video','Digital','Audio'),
  y = round(runif(7,1,100),2),
  stringsAsFactors = F)
makeAWaterfallPieChart(data = data,customedColor = "Blues",titleText = "Total Number of Quote", yTitle = "Quote",centerPlace = c(130, 65))
```
![highchart](screenshot/combo_Blues.png)

### Plot the Stacked Column chart with rCharts
```r
#dummy data
name = c("Television","Radio","Online Display","Paid Search","Hispanic Media","Direct Mail")
color = c("navy","red","green","purple","orange","grey")
mm = data.frame(c(92,2,11,7,3,20),c(78,14,17,9,7,11),stringsAsFactors = F)
makeStackedColumn(name,color,mm)
```
![highchart](screenshot/stackedColumn.png)


