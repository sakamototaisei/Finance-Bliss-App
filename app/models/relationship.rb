class Relationship < ApplicationRecord
  # フォローするユーザー
  belongs_to :follow, class_name: "User"
  # フォローされるユーザー
  belongs_to :follower, class_name: "User"
  
  
end
