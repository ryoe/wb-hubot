// Description:
//   Show current npm status and issues
//
// Dependencies:
//   None
//
// Configuration:
//   None
//
// Commands:
//   hubot npm status - Returns the current npm status for app operations and tools
//
// Author:
//   @ryanlabouve, port of heroku status from juno


var status, statusIssue, statusIssues;
module.exports = function(robot) {
  robot.respond(/npm status$/i, function(msg) {
    return status(msg);
  });
};

status = function(msg) {
  return msg.http("http://status.npmjs.org/index.json").get()(function(err, res, body) {
    var json;
    try {
      json = JSON.parse(body);
      return msg.send(("Are we still using javascript...?\nTheir website says:  " + json['status']['description'] + "\n"));// + ("Development: " + json['status']['Development'] + "\n"));
    } catch (error) {
      return msg.send("Uh oh, I had trouble figuring out what the npm is up to. Javascripts, amirite?");
    }
  });
};
