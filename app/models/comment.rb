class Comment < ApplicationRecord
  belongs_to :article

  VALID_STATUSES = ['public', 'private', 'archived']
  validates :body, :commenter, :status, presence: true
  validates :status, inclusion: { in: VALID_STATUSES }

  def archived?
    status == 'archived'
  end

  def public?
    status == 'public'
  end
end
