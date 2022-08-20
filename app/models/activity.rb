class Activity < ApplicationRecord
  belongs_to :activitable, polymorphic: true
  belongs_to :user

  def self.activitable_types
    distinct.select(:activitable_type).map do |element|
      element.activitable_type
    end
  end
end
