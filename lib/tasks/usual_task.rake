desc 'コメントが投稿されたらメールを送る'
task :likes_ranking_mail => :environment do
  ContactMailer.likes_ranking_mail.deliver
end
