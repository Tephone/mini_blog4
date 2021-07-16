# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def comment_mail
    ContactMailer.comment_mail
  end

  def likes_ranking_mail
    ContactMailer.likes_ranking_mail
  end
end
