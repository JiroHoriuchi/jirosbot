cheerio = require 'cheerio'


module.exports = (robot) ->
    robot.hear /php man (.+)$/, (msg) ->
        msg.send "�̂��Ɓ��ӂ�����ǁI"
        baseUrl = "http://php.net/conferences/index.php#id2016-11-11-1"
        baseUrl += msg.match[1]
        robot.http(baseUrl).get() (err, res, body) ->
            if res.headers.location?
                # ��v���錋�ʂ�������
                msg.send res.headers.location
                robot.http(res.headers.location).get() (err, res, body) ->
                    $ = cheerio.load body
                    msg.send $('div.book').text()
            else
                msg.send "�̂��Ɓ��ӂ�����ǁI"

module.exports = (robot) ->
  robot.respond /HELLO$/i, (msg) ->
    msg.send "hello"

