app = (require 'express')()

app.get '/health', (req, res) ->
  client = (require 'redis').createClient()
  client.on 'connect', ->
    client.info (err, replay) ->
      info = (require 'redis-info').parse replay
      if info.fields.role == 'master'
        res.status(200).send('master').end()
      else
        res.status(409).send('slave').end()
      client.quit()

server = app.listen 3000, ->
  console.log "listening on port #{server.address().port}"
