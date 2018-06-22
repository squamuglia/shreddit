class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes
  validates :content, presence: true
  validates :content, length: {maximum: 500}


  def delete_associated_likes
    self.likes.destroy_all
  end
end
