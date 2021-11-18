class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :image
  has_one :category
  has_one :user
end
