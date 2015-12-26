class Result < ActiveRecord::Base
  belongs_to :test
  validates :test_id, :path, presence: true

  scope :for_test, -> (test) { where(test:test) }

  def initialize(attributes = {})
  	attributes[:body] = {}
   	attributes[:params] = {}
   	attributes[:headers] = {}
   	super(attributes)
   end 
end
