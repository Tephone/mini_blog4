class ContactMailer < ApplicationMailer
  def comment_mail(blog)
    @blog = blog
    mail to: ENV['DEFAULT_EMAIL'], subject: 'コメント通知'
  end

  def like_ranking_mail
    to = Date.yesterday.end_of_day # fromは省略できたので省略しました
    top10_blog_ids = Like.group(:blog_id).order(count_all: :desc).count.take(10)
    @top10_blogs_about_likes = Blog.find(top10_blog_ids.map { |blog_id, _| blog_id })
    mail to: ENV['DEFAULT_EMAIL'], subject: 'Dailyいいね取得ランキング'
  end
end
