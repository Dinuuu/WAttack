class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tests
  validates :user_id, :name, :base_url, presence: true

  scope :for_user, -> (user) { where(user: user) }
end
