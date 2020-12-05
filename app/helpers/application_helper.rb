module ApplicationHelper
  def subscription_status(subscription)
    return "ended at #{subscription.ended_at}" if subscription.ended?
    return "unsubscribed at #{subscription.unsubscribed_at}" if subscription.unsubscribed?

    "started at #{subscription.created_at}"
  end

  def mailing_status(mailing)
    return "Unsubscribed" if mailing.caffeinate_campaign_subscription.unsubscribed?

    return "was skipped at #{mailing.skipped_at}" if mailing.skipped?
    return "was sent at #{mailing.sent_at}" if mailing.sent?

    "scheduled to be sent after #{mailing.send_at}" if mailing.unsent?
  end
end
