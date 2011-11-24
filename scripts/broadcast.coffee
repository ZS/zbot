# broadcast a message to every room the bot is in
#
# allhands [msg]

module.exports = (robot) ->
  robot.respond /(?:(allhands|broadcast)) (.+)/i, (msg) ->
    for roomId in process.env.HUBOT_CAMPFIRE_ROOMS.split(",")
      do (roomId) ->
        msg.message.user.room = roomId
        msg.send msg.match[2]