class ApplicationMailer < ActionMailer::Base
  default from: "mail@urbansherpa.com"

  def sign_up_email(user)
    @user=user
    mail(to: @user.email, subject: 'DO NOT REPLY: Thank for creating an account')
  end

  def reciept_email(email,tour_order,amount) 
    @tour_orders=tour_order
    @amount= amount
    mail(to: email, subject: 'Thank You For Your Purchase!')
  end
end
