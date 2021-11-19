class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :title, presence: true,  length: { minimum: 1, maximum: 255 }
  validates :content, presence: true,  length: { minimum: 1 }
  validates :image, presence: true,  length: { minimum: 5 },
            format: { with: /http(s?):\/\/.*\.(jpeg|jpg|gif|png)/i }
  validates :user_id, presence: true,  length: { minimum: 1 }
end
