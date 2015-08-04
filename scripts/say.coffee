# Description:
#  Execute a shell command if you can't be bothered to learn coffee script.
#  This particular example just does a DNS lookup.
#
# Dependencies:
#  None
#
# Configuration
#  Change the script if you want to execute a different command
#
# Commands:
#  hubot say <something> - Say something out loud
#
# Author:
#  Sapan Ganguly
#

module.exports = (robot) ->
 robot.respond /say (.*)$/i, (msg) ->
    phrase = msg.match[1]    
    @exec = require('child_process').exec
    command = "say #{phrase}"

    @exec command, (error, stdout, stderr) ->
      msg.send error
      msg.send stdout
      msg.send stderr

