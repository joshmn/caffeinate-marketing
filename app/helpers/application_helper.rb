module ApplicationHelper

  def render_flash
    return if @_flash_rendered

    @_flash_rendered = true
    render 'layouts/flash'
  end

  def title(title, link = nil)
    content_tag(:div, class: "border-bottom border-gray-200 px-4 px-md-5 py-4 d-flex align-items-center justify-content-between") do
      concat(content_tag(:h5, class: "mb-0") do
        title
      end)
      if link
        concat(content_tag(:span, class: "mb-0") do
          link
        end)
      end
    end
  end

  def body_class
    @body_class
  end

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

  def parent_layout(layout)
    @view_flow.set(:layout, output_buffer)
    output = render(template: "layouts/#{layout}")
    self.output_buffer = ActionView::OutputBuffer.new(output)
  end
end
