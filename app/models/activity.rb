class Activity < ApplicationRecord
  belongs_to :activitable, polymorphic: true
  belongs_to :user
end
