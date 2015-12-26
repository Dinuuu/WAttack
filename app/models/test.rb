class Test < ActiveRecord::Base
  belongs_to :project
  validates :project_id, :name, :concurrent_users, :duration, :path, presence: true
  validates :path, uniqueness: { scope: :project_id }

  def initialize(attributes = {})
  	attributes[:headers] ||= {}
  	attributes[:body] ||= {}
  	attributes[:params] ||= {}
  	super(attributes)
  end
end
