# Description:
#   Messing around with stuff
#
# Commands:
#   hubot open <query> - Opens a link in a fullscreen Chrome window
#   hubot cleanup - Closes the Chrome browser
module.exports = (robot) ->
  robot.respond /open (.*)/i, (msg) ->
    query = msg.match[1]

    {spawn} = require 'child_process'
    watch = spawn 'open', ['-a', 'Google Chrome', query]
    ls.stdout.on 'data', (data) -> console.log data.toString().trim()
    ls.stderr.on 'data', (data) -> console.log data.toString().trim()

    msg.send "Done!"

  robot.respond /cleanup/i, (msg) ->
    @exec = require('child_process').exec
    command = "pkill 'Google Chrome'"

    @exec command, (error, stdout, stderr) ->
      msg.send error
      msg.send stdout
      msg.send stderr
