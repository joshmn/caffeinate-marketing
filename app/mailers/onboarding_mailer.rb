class OnboardingMailer < CaffeinateMailer
  layout 'caffeinate_mailer'
  default reply_to: "Josh Brody <caffeinate@josh.mn>"
  def this_is_caffeinate(mailing)
    @mailing = mailing
    @user = @mailing.caffeinate_campaign_subscription.subscriber
    mail(to: @user.email, subject: "This is Caffeinate.")
  end

  def current_roadmap(mailing)
    @mailing = mailing
    @user = @mailing.caffeinate_campaign_subscription.subscriber
    mail(to: @user.email, subject: "Caffeinate: Coming soon to a codebase near you.")
  end
end
