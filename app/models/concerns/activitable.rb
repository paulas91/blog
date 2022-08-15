module Activitable
  extend ActiveSupport::Concern

  included do
    has_many :activities, as: :activitable

    after_create :add_activity
  end

  private

  def add_activity
    activities.create(user_id: user_id)
  end
end