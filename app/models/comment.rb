class Comment < ApplicationRecord

	paginates_per 3

	belongs_to :user
	belongs_to :product

end
