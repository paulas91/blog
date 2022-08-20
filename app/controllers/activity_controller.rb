class ActivityController < ApplicationController
  def index
    @activity_type = params.dig(:filter, :activitable_type)
    @activities = if @activity_type.present?
      Activity.where("activitable_type = '#{@activity_type}'")
    else
      Activity.all
    end
  end
end