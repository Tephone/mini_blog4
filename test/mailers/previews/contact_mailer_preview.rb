# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def comment_mailer
    ContactMailer.comment_mail
  end

  def like_ranking_mail
    ContactMailer.like_ranking_mail
  end
end
