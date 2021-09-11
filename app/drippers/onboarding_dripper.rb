class OnboardingDripper < ApplicationDripper
  self.campaign = :onboarding
  default mailer_class: "OnboardingMailer"

  drip :this_is_caffeinate, delay: 15.minutes
  drip :current_roadmap, delay: 2.days

  on_subscribe do |campaign_subscription|
    ahoy.track("$subscribe", { campaign_subscription_id: campaign_subscription.id })
  end

  before_perform do |dripper|
    ahoy.track("before_perform", { dripper: dripper.class.name })
  end

  on_perform do |dripper, mailings|
    ahoy.track("$on_perform", { dripper: dripper.class.name, mailings: mailings.size })
  end

  after_perform do |dripper|
    ahoy.track("$after_perform", { dripper: dripper.class.name })
  end

  before_send do |mailing, mail|
    ahoy.track("$before_send", { mailing_id: mailing.id, message_id: mail.message_id })
  end

  after_send do |mailing, mail|
    ahoy.track("$after_send", { mailing_id: mailing.id, message_id: mail.message_id })
  end

  on_complete do |campaign_subscription|
    ahoy.track("$on_complete", { campaign_subscription_id: campaign_subscription.id })
  end

  on_unsubscribe do |campaign_subscription|
    UnsubscribeMailer.thanks(campaign_subscription.subscriber.email).deliver
    ahoy.track("$on_unsubscribe", { campaign_subscription_id: campaign_subscription.id })
  end

  on_skip do |campaign_subscription|
    ahoy.track("$on_skip", { campaign_subscription_id: campaign_subscription.id })
  end
end
