class StaticSitesController < ApplicationController
  skip_before_action :authenticate_user!
  def about_me
  end
end