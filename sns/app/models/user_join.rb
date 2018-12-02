class UserJoin < ApplicationRecord
  belongs_to :user
  belongs_to :join, class_name: 'Post'
end
