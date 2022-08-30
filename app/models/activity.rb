class Activity < ApplicationRecord
  belongs_to :activitable, polymorphic: true
  belongs_to :user
  paginates_per 10
  
  enum :action, [ :activitable_create, :activitable_update, :activitable_destroy ]

  def action_text
    if activitable_create?
      "created new"
    elsif activitable_update?
      "updated"
    else
      "delete"
    end
  end
    

  def self.activitable_types
    distinct.select(:activitable_type).map do |element|
      element.activitable_type
    end
  end
end
