# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
    def sample_mail_preview
      UserMailer.welcome_email(User.limit(4))
    end
end
