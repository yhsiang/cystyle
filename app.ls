require! <[ path express ]>
port = 3000
app = express!
app.use express.static path.resolve './public'
app.listen port, -> console.log "Server Listen on #{port}"