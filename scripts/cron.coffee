cronJob = require('cron').CronJob
module.exports = (robot) ->
  new cronJob '0 0 10 * * 1-5', () =>
    robot.send room: "#general", "��ف["
  , null, true, "Asia/Tokyo"
