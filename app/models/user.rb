class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  # 自分がフォローされる側の関係性
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 自分がフォローする関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "follow_id", dependent: :destroy
  # 自分をフォローしている人一覧で返す
  has_many :followers, through: :reverse_of_relationships, source: :follow
  # 自分がフォローしている人一覧で返す
  has_many :followings, through: :relationships, source: :follower
end
