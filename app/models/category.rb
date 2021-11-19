class Category < ApplicationRecord
  has_many :posts

  validates :name, presence: true,  length: { minimum: 1, maximum: 255 }
end
