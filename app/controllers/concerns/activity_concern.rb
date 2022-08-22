module ActivityConcern
  extend ActiveSupport::Concern

  private

  def create_activitable(activitable, action = Activity.actions[:activitable_create])
    activitable.activities.create(user_id: current_devise_user.id, action: action)
 
  end
end