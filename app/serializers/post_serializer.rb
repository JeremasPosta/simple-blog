class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :image, :category_id, :created_at
end
