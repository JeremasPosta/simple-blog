class PostDetailSerializer < ActiveModel::Serializer
  attributes :id, :category_id, :user_id, :title, :image, :content 
end
