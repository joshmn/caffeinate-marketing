class ApplicationController < ActionController::Base
  layout Proc.new { |controller| controller.devise_controller? ? "devise" : "base" }

  def set_page_title(val)
    @page_title = val
  end
end
