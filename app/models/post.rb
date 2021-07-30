class Post < ApplicationRecord
  attachment :image
  belongs_to :genre
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :introduction, length: { maximum: 300 }
  validates :image_or_introduction, presence: true

  def self.search_for(content)
    # Post.where("introduction LIKE ?", "%" + content + "%").or(Post.where(genre_id: content))
    Post.where(introduction: content).or(Post.where(genre_id: content))
  end

  def image_or_introduction
    image.presence || introduction.presence
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
