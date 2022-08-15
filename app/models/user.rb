class User < ApplicationRecord
  has_many :articles
  has_many :comments
  has_many :activities
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  before_validation :create_password
  validates :first_name, :last_name, :birthday, :email, :phone, presence: true 
  scope :born_after, ->(year) { where("birthday >= '#{year}-01-01'") }
  scope :search, ->(query) { where("LOWER(first_name) LIKE LOWER(?)", sanitize_sql_like(query) + "%").or(
        where("LOWER(last_name) LIKE LOWER(?)", sanitize_sql_like(query) + "%")
      ) }
 
      def full_name
    "#{first_name} #{last_name}"
  end


  private

  def create_password
    if password.nil?
      self.password = SecureRandom.hex(10)
    end
  end

  # def self.search(query)
  #   where("LOWER(first_name) LIKE LOWER(?)", sanitize_sql_like(query) + "%").or(
  #     where("LOWER(last_name) LIKE LOWER(?)", sanitize_sql_like(query) + "%")
  #   )
  # end
end
