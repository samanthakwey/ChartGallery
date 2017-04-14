
highchart() %>% 
  hc_chart(
    type = 'waterfall',
    zoomType= 'xy'
  ) %>%
  hc_title(
    text = 'Waterfall: Unaided Consideration'
  ) %>%
  hc_subtitle(
    text = '2015 vs. 2016 due to...'
  ) %>%
  hc_xAxis(
    type = 'category'
  ) %>%
  hc_yAxis(
    title = list(
      text = 'Percentage'
    )
  ) %>%
  hc_legend(
    enabled = F
  ) %>%
  hc_tooltip(
    pointFormat = '<b>{point.y:,.2f}</b>%'
  ) %>%
  hc_add_series(
    data = list(
      list(
        name = '2015',
        y = 0.21190*100,
        color = 'slategrey'
      ),
      list(
        name = 'Base',
        y = 0.0064*100,
        color = 'lightgrey'
      ),
      list(
        name = 'Brand TV',
        y = 0.00178*100,
        color = 'red'
      ),
      list(
        name = 'Brand Radio',
        y = -0.00568*100,
        color = 'orange'
      ),
      list(
        name = 'Brand Digital',
        y = -0.00007*100,
        color = 'yellow'
      ),
      list(
        name = 'Branded Performance Digital',
        y = -0.00077*100,
        color = 'green'
      ),
      list(
        name = 'Unbranded Performance Digital',
        y = -0.00610*100,
        color = 'lightblue'
      ),
      list(
        name = 'Coporate Direct Mail',
        y = -0.00705*100,
        color = 'blue'
      ),
      list(
        name = 'AMP Digital',
        y = -0.00077*100,
        color = 'purple'
      ),
      list(
        name = '2016',
        isSum = T,
        color = 'slategrey'
      )
    ),
    dataLabels = list(
      enabled = T,
      style = list(
        fontWeight = 'bold'
      )
    ),
    pointPadding = 0
  )
  