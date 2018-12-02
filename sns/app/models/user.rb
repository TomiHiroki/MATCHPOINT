class User < ApplicationRecord
  before_save do
    self.email.downcase!
  end

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: { case_sensitive: false }
  has_secure_password

  mount_uploader :img, ImageUploader

  has_many :posts, :dependent => :destroy

   has_many :user_follows, :dependent => :destroy
    has_many :follows, through: :user_follows, source: :follow
    has_many :user_followeds ,class_name: 'UserFollow', foreign_key: 'follow_id'
    has_many :followeds, through: :user_followeds, source: :user

   has_many :user_favorites, :dependent => :destroy
    has_many :favorites, through: :user_favorites, source: :favorite
    has_many :user_favoriteds ,class_name: 'UserFavorite', foreign_key: 'favorite_id'
    has_many :favoriteds, through: :user_favoriteds, source: :user

  has_many :user_joins, :dependent => :destroy
  has_many :joins, through: :user_joins, source: :join
  has_many :user_joineds, class_name: 'UserJoin', foreign_key: 'join_id'
  has_many :joineds, through: :user_joineds, source: :user


  def follow(user)
      unless self == user || self.follows.exists?(user)
        self.follows << user
      end
    end

    def unfollow(user)
      if self.follows.exists?(user)
        self.follows.destroy(user)
      end
    end

 def favorite(post)
     unless self == post.user || self.favorites.exists?(post)
       self.favorites << post
     end
   end

   def unfavorite(post)
     if self.favorites.exists?(post)
       self.favorites.destroy(post)
     end
   end

  def join(post)
    unless self == post.user || self.joins.exists?(post)
      self.joins << post
    end
  end

  def unjoin(post)
    if self.joins.exists?(post)
      self.joins.destroy(post)
    end
  end


end

