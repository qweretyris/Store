class Product < ApplicationRecord
  has_one_attached :image
  
  belongs_to :category
  has_many :comments, dependent: :destroy

end
