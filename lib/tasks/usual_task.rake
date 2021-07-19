desc '投稿にコメントがついたことを知らせる'
task comment_mail: :environment do
  ContactMailer.comment_mail.deliver
end
