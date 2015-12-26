class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :base_url
  has_one :user
end
