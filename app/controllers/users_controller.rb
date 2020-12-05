class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @subscriptions = current_user.caffeinate_campaign_subscriptions.includes(:caffeinate_campaign)
  end

  def destroy
    current_user.destroy!
    redirect_to "/", notice: "Thanks for playing! Hope to see you soon!"
  end
end
