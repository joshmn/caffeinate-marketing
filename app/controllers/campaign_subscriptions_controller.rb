class CampaignSubscriptionsController < DemoController
  before_action :authenticate_user!
  before_action :find_campaign!, only: [:create]
  before_action :find_campaign_subscription!, only: [:show, :destroy]

  def index
    set_page_title("My Subscriptions")
    @subscriptions = current_user.caffeinate_campaign_subscriptions.includes(:caffeinate_campaign)
  end

  def create
    if @campaign.subscribe(current_user)
      redirect_to campaign_subscriptions_path, notice: "Successfully subscribed to #{@campaign.name}"
    else
      redirect_to campaign_subscriptions_path, notice: "Unable to subscribe to #{@campaign.name}"
    end
  end

  def show
    set_page_title("Viewing #{@campaign_subscription.caffeinate_campaign.name} Subscription")
  end

  def destroy
    @campaign_subscription.unsubscribe!
    redirect_to campaign_subscriptions_path, notice: "Unsubscribed from #{@subscription.caffeinate_campaign.name}"
  end

  private

  def find_campaign!
    @campaign = Caffeinate::Campaign.find_by(slug: params[:campaign_slug])
    if @campaign.nil?
      return redirect_to campaigns_path, notice: "No campaign found."
    end
  end

  def find_campaign_subscription!
    @campaign_subscription = ::Caffeinate::CampaignSubscription.includes(:caffeinate_campaign).find_by(token: params[:token])
    if @campaign_subscription.nil?
      return redirect_to campaigns_path, notice: "No subscription found."
    end
  end
end
