module CampaignsHelper
  def dripper_filename(campaign)
    "#{campaign.name.parameterize.underscore.delete_prefix("caffeinate_")}_dripper.rb"
  end

  def dripper_source(campaign)
    if Rails.root.to_s.include?("app") # we're on heroku
      File.read(Rails.root.join("drippers", dripper_filename(campaign)))
    else
      File.read(Rails.root.join("drippers", dripper_filename(campaign)))
    end
  end
end
