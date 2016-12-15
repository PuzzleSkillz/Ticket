class Ticket < ApplicationRecord

  validates :title, :content, presence: true
  
  belongs_to :user
  has_many :comments

  has_attached_file :file
  validates_attachment_content_type :file, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
end
