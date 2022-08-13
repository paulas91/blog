class User < ApplicationRecord
  has_many :articles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :birthday, :email, :phone, presence: true 
  scope :born_after, ->(year) { where("birthday >= '#{year}-01-01'") }
  scope :search, ->(query) { where("LOWER(first_name) LIKE LOWER(?)", sanitize_sql_like(query) + "%").or(
        where("LOWER(last_name) LIKE LOWER(?)", sanitize_sql_like(query) + "%")
      ) }
  def full_name
    "#{first_name} #{last_name}"
  end

  # def self.search(query)
  #   where("LOWER(first_name) LIKE LOWER(?)", sanitize_sql_like(query) + "%").or(
  #     where("LOWER(last_name) LIKE LOWER(?)", sanitize_sql_like(query) + "%")
  #   )
  # end
end
