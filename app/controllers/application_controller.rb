class ApplicationController < ActionController::Base
  before_action :authenticate_devise_user!
  http_basic_authenticate_with name: "paulina", password: "oliwka"
end
