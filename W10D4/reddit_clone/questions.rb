
# 1. duplicated foreign_key?
# 2. in Sub model, we had 2 has_many :posts (direct & through assoc. which one)

class Sub < ApplicationRecord
  belongs_to :user
  # has_many :posts # old method: direct association, should we remove it
  has_many :post_subs, dependent: :destroy, inverse_of: :post
  has_many :posts, through: :post_subs  #thru assoc
