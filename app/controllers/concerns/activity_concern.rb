module ActivityConcern
  extend ActiveSupport::Concern

  included do
    after_action :create_activity, only: [:create, :update, :delete]
  end
  
  private

  def create_activity
   activitable =  self.instance_variable_get("@#{controller_name.singularize}")
   action = if action_name == "create"
    :activitable_create
   elsif action_name == "update"
    :activitable_update
   else
    :activitable_destroy
   end
   activitable.activities.create(user_id: current_devise_user.id, action: Activity.actions[action])

  end
end