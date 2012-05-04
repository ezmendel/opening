exports.page = (req, res) ->
  pageName = (req?.params?.pageName) ? "front"

  #fs = require('fs')
  #fs.readFile "#{__dirname}/#{pageName}.hbs", ->
  res.render "pages/#{pageName}",
    title: "opening"



