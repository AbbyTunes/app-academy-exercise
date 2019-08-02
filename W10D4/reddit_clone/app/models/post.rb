# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :string
#  content    :string
#  sub_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord

    belongs_to :sub
    has_one :user, through: :sub

    has_many :post_subs, dependent: :destroy, inverse_of: :post
    has_many :subs, through: :post_subs

    validates :title, :sub_id, presence: true
end






class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_url(@post)
    else
      render :new
    end
  end

  # ...

  private

  def post_params
    params.require(:post).permit(:text, tag_ids: [])
  end
end