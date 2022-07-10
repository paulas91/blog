class User < ApplicationRecord
  validates :first_name, :last_name, :birthday, :email, :phone, presence: true 
end
