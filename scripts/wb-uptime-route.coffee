# Description:
#   Hubot will respond to simple GET
#
# Commands:
#   None
#
# URLS:
#   GET /hubot/coldheart
#   GET /hubot/warmbodies
#   GET /hubot/wb
#
# Notes:
#   Have fun with it.
#
# Author:
#   ryoe

module.exports = (robot) ->
  robot.router.get '/hubot/coldheart', (req, res) ->
    res.end "warm bodies"

  robot.router.get '/hubot/coldhearts', (req, res) ->
    res.end "warm bodies"

  robot.router.get '/hubot/warmbodies', (req, res) ->
    res.end "cold hearts"

  robot.router.get '/hubot/wb', (req, res) ->
    res.end "cold hearts"
