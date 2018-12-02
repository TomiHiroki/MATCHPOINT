class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :content, presence: true, length: { maximum: 255 }

  def searching(key_word)
    if key_word
      Post.where(['title OR content LIKE ?', "%#{key_word}%"])
    else
      Post.all
    end
  end

end
