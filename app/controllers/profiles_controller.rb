class ProfilesController < DemoController
  before_action :authenticate_user!
  def show
    set_page_title("My Profile")
    @subscriptions = current_user.caffeinate_campaign_subscriptions.includes(:caffeinate_campaign)
  end

  def destroy
    current_user.destroy!
    redirect_to new_session_path, notice: "Thanks for playing! Hope to see you soon!"
  end
end
