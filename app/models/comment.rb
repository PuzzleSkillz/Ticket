class Comment < ApplicationRecord
	belongs_to :ticket

	validates :body, presence: true

end
