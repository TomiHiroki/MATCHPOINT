class Comment < ApplicationRecord
  belongs_to :post

  validates :content, presence: true, length: { maximum: 255 }

end


