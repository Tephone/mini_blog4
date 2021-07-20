class ContactMailer < ApplicationMailer
  def comment_mail(blog)
    @blog = blog
    mail to: ENV['DEFAULT_EMAIL'], subject: 'コメント通知メール'
  end

  def like_ranking_mail
    to = Date.yesterday.end_of_day
    top10_blog_ids = Like.where(created_at: ..to).group(:blog_id).order(count_all: :desc).count.take(10)
    @top10_blogs_about_like = Blog.find(top10_blog_ids.map { |blog_id, _| blog_id })
    mail to: ENV['DEFAULT_EMAIL'], subject: 'いいねランキンング通知メール'
  end
end
