# == Schema Information
#
# Table name: subs
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :string
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ApplicationRecord
  belongs_to :user
  # has_many :posts # old method: direct association, should we remove it
  has_many :post_subs, dependent: :destroy, inverse_of: :post
  has_many :posts, through: :post_subs  #thru assoc

  validates :user_id, presence: true

end
