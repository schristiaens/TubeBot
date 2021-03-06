# Description:
#   Messing around with the YouTube API.
#
# Commands:
#   hubot youtube me <query> - Searches YouTube for the query and returns the video embed link.
module.exports = (robot) ->
  robot.respond /(youtube|yt|ty)( me)? (.*)/i, (msg) ->
    query = msg.match[3]
    robot.http("http://gdata.youtube.com/feeds/api/videos")
      .query({
        orderBy: "relevance"
        'max-results': 15
        alt: 'json'
        q: query
      })
      .get() (err, res, body) ->
        videos = JSON.parse(body)
        videos = videos.feed.entry

        unless videos?
          msg.send "No video results for \"#{query}\""
          return

        video  = msg.random videos

        {spawn} = require 'child_process'
        watch = spawn 'open', ['-a', 'Safari', query]
        ls.stdout.on 'data', (data) -> console.log data.toString().trim()
        ls.stderr.on 'data', (data) -> console.log data.toString().trim()

        video.link.forEach (link) ->
          if link.rel is "alternate" and link.type is "text/html"
            msg.send link.href
