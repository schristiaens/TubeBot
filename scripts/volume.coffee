# Description:
#  Execute a shell command if you can't be bothered to learn coffee script.
#  This particular example just does a DNS lookup.
#
# Dependencies:
#  None
#
# Configuration
#  Change the script if you want to exeute a different command
#
# Commands:
#  hubot volume <0-10> - Set the volume between 0 and 10
#
# Author:
#  Sapan Ganguly
#

module.exports = (robot) ->
 robot.respond /volume (.*)$/i, (msg) ->
    val = msg.match[1]
    @exec = require('child_process').exec
    command = "osascript -e 'set Volume #{val}'"

    msg.send "Volume set to #{val}."

    @exec command, (error, stdout, stderr) ->
      msg.send error
      msg.send stdout
      msg.send stderr

