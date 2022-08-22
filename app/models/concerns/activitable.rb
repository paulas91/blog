module Activitable
  extend ActiveSupport::Concern

  included do
    has_many :activities, as: :activitable

    after_create :add_create_activity
    after_update :add_update_activity
    after_destroy :add_destroy_activity

  end

  private

  def add_create_activity
    add_activity(Activity.actions[:activitable_create])
    # activities.create(user_id: user_id, action: Activity.actions[:activitable_create] )
  end
  
  def add_update_activity
    add_activity(Activity.actions[:activitable_update])
    # activities.create(user_id: user_id, action: Activity.actions[:activitable_update])
  end
  
  def add_destroy_activity
    add_activity(Activity.actions[:activitable_delete])
    # activities.create(user_id: user_id, action: Activity.actions[:activitable_delete])
  end
  
  def add_activity(action)
    activities.create(user_id: user_id, action: action)
  end
end