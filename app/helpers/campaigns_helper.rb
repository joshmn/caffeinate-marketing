module CampaignsHelper
  def dripper_filename(campaign)
    "#{campaign.to_dripper.name.delete_suffix("Dripper").parameterize.underscore}_dripper.rb"
  end

  def dripper_source(campaign)
    File.read(Rails.root.join("app", "drippers", dripper_filename(campaign)))
  end
end
