# Description:
#   WarmBodies - how to make pourover coffee
#
# Dependencies:
#   None
#
# Commands:
#   hubot make coffee - instructions to make pourover coffee
#
# Author:
#   ryoe
greetings = [
  'Hope this helps:'
  'Is this what you\'re looking for?'
  'I suggest the following:'
  'After much consideration, I came up with this:'
  'I doubt you can do better than this:'
]

instructions = [
  '*1)* Heat Water'
  '*2)* Wet Filter ––> Pour out water'
  '*3)* Weigh Beans (16-20g)'
  '*4)* Put Beans in filter and reset scale (0g)'
  '*5)* Pour 40-60g (Wait 45sec-1min)'
  '*6)* Pour up to (step 3 grams) * 16'
  ''
  '16g beans = 256g total water'
]

images = [
  'https://cloud.githubusercontent.com/assets/7385717/12435411/08bf4db2-bed3-11e5-965a-76b6fd4fa838.jpg'
  'http://brewspace.com.au/magazine/wp-content/uploads/2012/10/the-oatmeal-coffee.jpg'
]

module.exports = (robot) ->
  robot.respond /(make coffee)+/i, (msg) ->
  	greeting = msg.random greetings
  	msg.send "#{greeting}\n\n" + instructions.join '\n'
