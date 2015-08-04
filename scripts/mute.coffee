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
#  mute - Mute the volume

# Author:
#  Steve Christiaens
#

module.exports = (robot) ->
 robot.hear /mute/i , (res) ->
    @exec = require('child_process').exec
    command = "osascript -e 'set Volume 0'"

    res.send "Audio muted."

    @exec command, (error, stdout, stderr) ->
      res.send error
      res.send stdout
      res.send stderr