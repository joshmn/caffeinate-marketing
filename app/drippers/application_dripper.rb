class ApplicationDripper < Caffeinate::Dripper::Base
  def self.ahoy
    @ahoy ||= ::Ahoy::Tracker.new(controller: nil)
  end
end
