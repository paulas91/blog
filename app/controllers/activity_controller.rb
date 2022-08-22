class ActivityController < ApplicationController
  
  def index
    @activity_type = params.dig(:filter, :activitable_type)
    @activities = current_devise_user.activities.order(id: :desc)
    if @activity_type.present?
      @activities = @activities.where("activitable_type = '#{@activity_type}'")
    end

    # @activities = if @activity_type.present?
    #   current_devise_user.activities.where("activitable_type = '#{@activity_type}'")
    # else
    #   current_devise_user.activities
    # @activities = @activities.order(id: :desc)
    # end
  end
end