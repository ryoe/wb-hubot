# Description:
#   Because it takes too much time to do it manually
#
# Commands:
#   hubot ascii <text> - Converts text to ASCII art
#
# Author:
#   aliaporci


module.exports = (robot) ->
  robot.respond /ascii (.*)/i, (msg) ->
    text = msg.match[1]
    param = text: text
    robot.http("http://artii.herokuapp.com/make")
      .query(param)
      .get() (err, response, body) ->
        if err
          msg.send "Not, right now. Do it yourself."
        else
          msg.send "```\n#{body}\n```"
