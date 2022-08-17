class ActivityController < ApplicationController
  def index
    @datetime = params.dig(:filter, :created_at)
    @activities = if @datetime
      Activity.where("created_at >= '#{@datetime}'")
    else
      Activity.all
    end
  end
end