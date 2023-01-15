class Product < ApplicationRecord
  has_one_attached :image

  paginates_per 4
  
  belongs_to :category
  has_many :cart, dependent: :destroy
  has_many :comments, dependent: :destroy

  scope :min_price, -> (min) {where("price > ? ", min)}
  scope :max_price, -> (max) {where("price < ? ", max)}
  scope :searching, -> (search) {where("name LIKE ?", "%#{search}%")}

end
