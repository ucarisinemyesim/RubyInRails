# class ApplicationController < ActionController::Base
# end
class ApplicationController < ActionController::Base
    include Rails.application.routes.url_helpers
  end
  