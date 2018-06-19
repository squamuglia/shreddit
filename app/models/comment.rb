class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :post, reject_if: :content_blank

  private
  def content_blank(comment)
    comment[:content].empty?
  end
end
