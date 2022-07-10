class Article < ApplicationRecord
  has_many :comments

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  VALID_STATUSES = ['public', 'private', 'archived']  

  validates :status, inclusion: { in: VALID_STATUSES }
  scope :status_archived, -> { where(status: 'archived') }
  scope :status_public, -> { where(status: 'public') }
  scope :status_private, -> { where(status: 'private')}
   
  def archived?
    status == 'archived'
  end

  def public?
    status == 'public'
  end


end
