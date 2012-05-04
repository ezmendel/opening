express = require("express")
routes = require("./routes")

# create the express server
app = module.exports = express.createServer()

# configure the express app
app.configure ->
  app.set "views", __dirname + "/views"
  app.set "view engine", "hbs"
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser()
  app.use express.session(secret: "your secret here")
  app.use app.router
  app.use express.static(__dirname + "/public")

# environments
app.configure "development", ->
  app.use express.errorHandler(
    dumpExceptions: true
    showStack: true
  )

app.configure "production", ->
  app.use express.errorHandler()

console.log routes

app.get "/", routes.page
app.get "/:pageName", routes.page

app.listen process.env.PORT ? 3000
console.log "Express server listening on port %d in %s mode", app.address().port, app.settings.env





