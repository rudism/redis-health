app = (require 'express')()

app.get '/health', (req, res) ->
  client = (require 'redis').createClient 6379, '192.168.42.101'
  client.on 'connect', ->
    client.info (err, replay) ->
      info = (require 'redis-info').parse replay
      if info.fields.role == 'master'
        res.status(200).end()
      else
        res.status(409).end()
      client.quit()

server = app.listen 3000, ->
  console.log "listening on port #{server.address().port}"
