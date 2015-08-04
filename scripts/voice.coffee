# Description:
#  Based on shell-command.coffee.  Useful notes - say [[inpt PHON]] hAAIH, [[inpt TEXT]] how are you?
#
# Dependencies:
#  None
#
# Configuration
#  Change the script if you want to exeute a different command
#
# Commands:
#  hubot voice <phrase> - Say something in a random voice 
#
# Author:
#  Steve Christiaens
#

voice = ["Agnes","Albert","Alex","Allison","Ava","Bad","Bahh","Bells","Boing","Bruce","Bubbles","Cellos","Daniel","Deranged","Fiona","Fred","Good","Junior","Karen","Kate","Kathy","Lee","Moira","Oliver","Pipe","Princess","Ralph","Samantha","Serena","Susan","Tarik","Tessa","Tom","Trinoids","Veena","Vicki","Victoria","Whisper"]

module.exports = (robot) ->
 robot.respond /voice (.*)$/i, (msg) ->
    phrase = msg.match[1] 
    tmp = String(new Date().getTime()).slice(-2)
    num = tmp % 39
    voicenum = voice[num]   
    @exec = require('child_process').exec
    command = "say -v #{voicenum} #{phrase}"

    @exec command, (error, stdout, stderr) ->
      msg.send error
      msg.send stdout
      msg.send stderr

