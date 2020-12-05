class UnsubscribeMailer < ApplicationMailer
  def thanks(email)
    mail(to: email, subject: "You've been unsubscribed from the Caffienate onboarding campaign") do |f|
      f.text { render plain: "Hi there, just confirming you've been unsubscribed. Thanks for giving it a try!\n\rjoshmn"}
    end
  end
end
