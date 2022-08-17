module ActivityConcern
  extend ActiveSupport::Concern

  private

  def create_activitable(activitable)
    activitable.activities.create(user_id: current_devise_user.id)
 
  end
end