class Post < ApplicationRecord
  belongs_to :forum
  belongs_to :user
  has_many :comments

  validates :title, presence: true
  validates :content, presence: true

  def delete_associated_comments
    #first delete associated likes with current comment
    self.comments.each do |comment|
      comment.delete_associated_likes
    end

    #now destroy all comments
    self.comments.destroy_all
  end

  def creator
    self.user
  end
end
