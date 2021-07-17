class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  # 自分がフォローされる側の関係性
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 自分がフォローする関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 自分をフォローしている人一覧で返す
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # 自分がフォローしている人一覧で返す
  has_many :followings, through: :relationships, source: :followed
  validates :name, presence: true
  validates :name, length: { maximum: 30 }
  validates :introduction, length: { maximum: 160 }


  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  # 引数にわたしたユーザーをフォローしているか判定
  def following?(user)
    followings.include?(user)
  end
end
