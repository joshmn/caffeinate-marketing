class DripperWorker
  include Sidekiq::Worker
  def perform
    OnboardingDripper.perform!
    ColorsDripper.perform!
  end
end
