cronJob = require('cron').CronJob
module.exports = (robot) ->
  new cronJob '0 0 10 * * 1-5', () =>
    robot.send room: "#general", "‚â‚Ù["
  , null, true, "Asia/Tokyo"
