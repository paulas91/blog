class Comment < ApplicationRecord
  include Activitable
  belongs_to :article
  belongs_to :user

  before_validation :created_commenter

  VALID_STATUSES = ['public', 'private', 'archived']
  validates :body, :commenter, :status, presence: true
  validates :status, inclusion: { in: VALID_STATUSES }

  
  def archived?
    status == 'archived'
  end
  
  def public?
    status == 'public'
  end

  private

  def created_commenter
    self.commenter = user.full_name
  end
end
