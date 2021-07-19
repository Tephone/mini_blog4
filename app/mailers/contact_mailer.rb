class ContactMailer < ApplicationMailer
  def comment_mail(blog)
    @blog = blog
    mail to: ENV['DEFAULT_EMAIL'], subject: 'コメント通知'
  end

  def like_ranking_mail
    mail to: ENV['DEFAULT_EMAIL'], subject: 'いいねランキング通知'
  end
end
