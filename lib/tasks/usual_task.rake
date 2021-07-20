desc '毎朝7時に前日のいいねランキンングをscheduler(heroku)にて送信'
task like_ranking_mail: :environment do
  ContactMailer.like_ranking_mail.deliver
end
