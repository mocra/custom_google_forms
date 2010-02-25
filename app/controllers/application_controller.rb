# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :check_uri

  helper :all # include all helpers, all the time
  # protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password


  def check_uri
    if Rails.env.production?
      redirect_to request.protocol + EXPECTED_DOMAIN + request.request_uri if !/^forms.mocra.com/.match(request.host)
    end
  end
end
