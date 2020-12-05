class OnboardingDripper < ApplicationDripper
  self.campaign = :onboarding
  default mailer_class: "OnboardingMailer"

  drip :this_is_caffeinate, delay: 15.minutes
  drip :current_roadmap, delay: 2.days

  on_subscribe do |campaign_subscription|
    ahoy.track("$subscribe", { campaign_subscription_id: campaign_subscription.id })
  end

  before_process do |dripper|
    ahoy.track("$before_process", { dripper: dripper.name })
  end

  on_process do |dripper, mailings|
    ahoy.track("$on_process", { dripper: dripper.name, mailings: mailings.size })
  end

  after_process do |dripper|
    ahoy.track("$after_process", { dripper: dripper.name })
  end

  before_drip do |campaign_subscription, mailing, drip|
    ahoy.track("$before_drip", { campaign_subscription_id: campaign_subscription.id, mailing: mailing.id, drip: drip.action })
  end

  before_send do |campaign_subscription, mailing, message|
    ahoy.track("$before_send", { campaign_subscription_id: campaign_subscription.id, mailing: mailing.id, message_id: message.message_id })
  end

  after_send do |campaign_subscription, mailing, message|
    ahoy.track("$after_send", { campaign_subscription_id: campaign_subscription.id, mailing: mailing.id, message_id: message.message_id })
  end

  on_complete do |campaign_subscription|
    ahoy.track("$on_complete", { campaign_subscription_id: campaign_subscription.id, mailing: mailing.id, message_id: message.message_id })
  end

  on_unsubscribe do |campaign_subscription|
    ahoy.track("$on_unsubscribe", { campaign_subscription_id: campaign_subscription.id })
  end

  on_skip do |campaign_subscription|
    ahoy.track("$on_skip", { campaign_subscription_id: campaign_subscription.id })
  end
end
