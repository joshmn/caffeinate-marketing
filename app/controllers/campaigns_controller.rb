class CampaignsController < DemoController
  before_action :find_campaign!, only: [:show]

  def index
    set_page_title("System Campaigns")
    @campaigns = ::Caffeinate::Campaign.all
  end

  def show
    set_page_title("Viewing #{@campaign.name}")
  end

  private

  def find_campaign!
    @campaign = ::Caffeinate::Campaign.find_by(slug: params[:slug])
    if @campaign.nil?
      return redirect_to campaigns_path, notice: "Unable to find campaign with slug #{params[:slug]}"
    end
  end
end
