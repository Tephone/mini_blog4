desc '投稿にコメントがついたことを知らせる'
task comment_mail: :environment do
  ContactMailer.comment_mail.deliver
end

desc '前日のいいねランキングを通知'
task like_ranking_mail: :environment do
  ContactMailer.like_ranking_mail.deliver
end
