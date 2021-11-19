class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :image, :user_id, :category_id
end
