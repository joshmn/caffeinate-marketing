class RootController < ApplicationController
  def index
    @now = Time.current
  end
end
