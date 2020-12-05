class DripperWorker
  include Sidekiq::Worker

  def perform
    OnboardingDripper.perform!
  end
end
