module CampaignsHelper
  def dripper_filename(campaign)
    "#{campaign.name.parameterize.underscore.delete_prefix("caffeinate_")}_dripper.rb"
  end

  def dripper_source(campaign)
    File.read(Rails.root.join("app", "drippers", dripper_filename(campaign)))
  end
end
