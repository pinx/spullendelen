class MemberMailer < ActionMailer::Base
  default from: "admin@spullendelen.nl"

  # call with MemberMailer.welcome_email(@user).deliver
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welkom bij spullendelen.nl')
  end

  def email_name
    mail :subject => "Mandrill rides the Rails!",
         :to      => "recipient@example.com"
    end

end
