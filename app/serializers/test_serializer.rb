class TestSerializer < ActiveModel::Serializer
  attributes :id, :name, :concurrent_users, :duration, :path, :headers, :params, :body
  has_one :project
end
