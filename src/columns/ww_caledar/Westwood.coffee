class Columns.GitHub extends Columns.FeedColumn
  name: "WWHS"
  width: 1
  thumb: "img/column-westwood.png"
  link: "http://westwood.roundrockisd.org"

  element: "westwood-item"
  dataPath: "items"
  dialog: "westwood-dialog"

  refresh: (columnElement, holderElement) ->
    if typeof @config.period is "undefined" then @config.period = 1

    switch @config.period
      when 0 then period = "month"
      when 1 then period = "week"
      when 2 then period = "day"

    date = new moment
    date.subtract(1, period)
    @url = "https://api.github.com/search/repositories?q=created:>="+date.format("YYYY-MM-DD")+"&sort=stars&order=desc"
    super columnElement, holderElement

tabbie.register "Westwood"
