class CampaignsController < ApplicationController
  before_action :find_campaign!, only: [:show]

  def index
    @campaigns = ::Caffeinate::Campaign.all
  end

  def show
  end

  private

  def find_campaign!
    @campaign = ::Caffeinate::Campaign.find_by(slug: params[:slug])
    if @campaign.nil?
      return redirect_to campaigns_path, notice: "Unable to find campaign with slug #{params[:slug]}"
    end
  end
end
