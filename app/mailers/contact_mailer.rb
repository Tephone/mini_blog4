class ContactMailer < ApplicationMailer
  def comment_mail(blog)
    @blog = blog
    mail to: ENV['DEFAULT_EMAIL'], subject: 'コメント通知メール'
  end

  def likes_ranking_mail
    to = Date.yesterday.end_of_day # fromは省略できたので省略しました
    top10_blog_ids = Like.where(created_at: ..to).group(:blog_id).count.sort_by { |_, likes_count| likes_count }.reverse.take(10)
    @top10_blogs_about_likes = top10_blog_ids.map { |blog_id, _| Blog.find(blog_id) }
    mail to: ENV['DEFAULT_EMAIL'], subject: 'Dailyいいね取得ランキング'
  end
end
