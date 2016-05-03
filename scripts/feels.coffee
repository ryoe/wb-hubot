# Description:
#   U no haz time for emotion. Let moss take care of those feelz for u.
#
# Dependencies:
#   None
#
# Commands:
#   hubot make coffee - instructions to make pourover coffee
#
# Author:
#   chundabear

aliases =
  'awkward'    : 'awkward'
  'bored'      : 'bored'
  'carlton'    : 'carlton'
  'the carlton': 'carlton'
  'confused'   : 'confused'
  'drunk'      : 'drunk'
  'excited'    : 'excited'
  'frustrated' : 'frustrated'
  'hungry'     : 'hungry'
  'metal'      : 'metal'
  'mind-blown' : 'mind-blown'
  'mindblown'  : 'mind-blown'
  'mind blown' : 'mind-blown'
  'motivated'  : 'motivated'
  'motivate'   : 'motivated'
  'pain'       : 'pain'
  'anger'       : 'rage'
  'rage'       : 'rage'
  'tired'      : 'tired'
  'swole'      : 'swole'

greetings = [
  'This should take care of dem feelz:'
  'Hope this helps dem feelz:'
]

links =
  'awkward' : ['https://media.giphy.com/media/26tOXN8rltzRWOh8s/giphy.gif']
  'bored' : ['https://media.giphy.com/media/B7sfAn7n9xi7u/giphy.gif']
  'confused' : ['https://media.giphy.com/media/aV2H2syaMg3Kg/giphy.gif']
  'carlton' : [
    'https://49.media.tumblr.com/504cb94fe0f41e563f435ee2f833dcb5/tumblr_n47d7f7uFv1rt5pgzo1_400.gif'
  ]
  'drunk' : ['https://media.giphy.com/media/68nxOAo5DaBkk/giphy.gif']
  'excited' : [
    'https://media3.giphy.com/media/8NkrBNiXWYhKU/200.gif'
    'https://49.media.tumblr.com/504cb94fe0f41e563f435ee2f833dcb5/tumblr_n47d7f7uFv1rt5pgzo1_400.gif'
  ]
  'frustrated' : [
    'https://media.giphy.com/media/CXAPW8vCQzYkg/giphy.gif'
    'https://media.giphy.com/media/FmNXeuoadNTpe/giphy.gif'
  ]
  'hungry' : ['https://media.giphy.com/media/JOjGbeFoOPL2/giphy.gif']
  'metal'  : [
    'https://media.giphy.com/media/BTFP6q6c1Tnyg/giphy.gif'
    'http://i.imgur.com/dlPtY4w.gif'
    'https://media.giphy.com/media/xZ9YZ49ujYr7i/giphy.gif'
    'https://m.popkey.co/76d137/5MokO.gif'
  ]
  'mind-blown' : ['http://giphy.com/gifs/reactiongifs-jzQXsabuFUUX6']
  'motivated' : ['https://38.media.tumblr.com/5a9af57faaa90b2303410831d708cc33/tumblr_inline_o1868zzZSJ1r40148_500.gif']
  'pain' : ['https://media.giphy.com/media/PqdfIrXEza6fC/giphy.gif']
  'rage' : [
    'http://fuckyeahreactionface.tumblr.com/post/1597556191'
    'http://media2.giphy.com/media/topDtoinYcF1u/giphy.gif'
    'http://rack.0.mshcdn.com/media/ZgkyMDEzLzA2LzEyLzY2L0phY2tOaWNob2xzLjIxZTBhLmdpZgpwCXRodW1iCTEyMDB4OTYwMD4/a7087029/e2b/Jack-Nicholson.gif'
    'https://ak-hdl.buzzfed.com/static/enhanced/terminal05/2012/3/9/16/anigif_enhanced-buzz-24252-1331327230-31.gif'
    'http://gifsec.com/wp-content/uploads/GIF/2014/11/Raging-GIF.gif'
    'http://rack.0.mshcdn.com/media/ZgkyMDEzLzA2LzEyL2Y4L0xpenp5TWNHdWlyLmMzYThhLmdpZgpwCXRodW1iCTEyMDB4OTYwMD4/312b02fe/7d8/Lizzy-McGuire.gif'
    'http://rack.1.mshcdn.com/media/ZgkyMDEzLzA2LzEzL2E4L3NtYXNoZWRjb21wLjVkMzdhLmdpZgpwCXRodW1iCTEyMDB4OTYwMD4/46976450/cf5/smashed-computer.gif'
    'http://rack.3.mshcdn.com/media/ZgkyMDEzLzA2LzEyLzM4L0FubmVIYXRod2F5LjI2ZWVmLmdpZgpwCXRodW1iCTEyMDB4OTYwMD4/435e0b31/4f7/Anne-Hathway.gif'
    'https://files.slack.com/files-tmb/T0255GYQQ-F0LB8U5RA-7e798240e2/slack_for_ios_upload_360.gif'
  ]
  'swole' : ['https://pbs.twimg.com/profile_images/378800000834206128/2a70c54b820afc17f95f76398622a733.jpeg']
  'tired' : ['https://media1.giphy.com/media/bq6F8QYqBU7Yc/200.gif']


module.exports = (robot) ->
  robot.respond /(i )?(feels|feelz|feel)+/i, (msg) ->
    userName = msg.message.user.name
    userMentionName = msg.message.user.mention_name

    text = msg.message.text
    matches = text.match(/(i )?(feels|feelz|feel)+(\s)?(.*)?/i)
    match = matches[4]

    if not match?
      msg.reply ', I think you will find some helpful information here.'
      msg.send 'http://lmgtfy.com?q=how+to+computer'
      return

    key = aliases[match]
    if not key?
      keys = []
      keys.push alias for alias of aliases
      msg.send 'Sorry, I don\'t know about "' + match + '".'
      msg.send 'Here\'s everything I know about so far: ' + keys.join(', ')
      return

    list = msg.random links[key]
    greeting = msg.random greetings
    msg.send greeting +  '\n' + list
