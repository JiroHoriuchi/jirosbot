cheerio = require 'cheerio'

module.exports = (robot) ->
    robot.hear /php man (.+)$/, (msg) ->
        baseUrl = "http://php.net/conferences/index.php#id2016-11-11-1"
        baseUrl += msg.match[1]
        robot.http(baseUrl).get() (err, res, body) ->
            if res.headers.location?
                # àÍívÇ∑ÇÈåãâ Ç™Ç†Ç¡ÇΩ
                msg.send res.headers.location
                robot.http(res.headers.location).get() (err, res, body) ->
                    $ = cheerio.load body
                    msg.send $('div.book').text()
            else
                msg.send "ÇÃÇ¡Ç∆ÅôÇ”ÇüÇ§ÇÒÇ«ÅI"
