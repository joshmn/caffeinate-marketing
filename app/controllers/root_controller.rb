class RootController < ApplicationController
  def index
    set_page_title("Drip Campaign and Scheduled Email Sequences in Ruby on Rails")
    @now = Time.current
  end
end
