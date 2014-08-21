# Description:
#   Messing around with stuff
#
# Commands:
#   hubot open me <query> - Searches YouTube for the query and returns the video embed link.
module.exports = (robot) ->
  robot.respond /open (.*)/i, (msg) ->
    query = msg.match[1]

    {spawn} = require 'child_process'
    watch = spawn 'open', ['-a', 'Safari', query]
    ls.stdout.on 'data', (data) -> console.log data.toString().trim()
    ls.stderr.on 'data', (data) -> console.log data.toString().trim()

    msg.send "Done!"
    return
