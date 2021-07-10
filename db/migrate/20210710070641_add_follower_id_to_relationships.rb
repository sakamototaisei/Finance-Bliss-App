class AddFollowerIdToRelationships < ActiveRecord::Migration[5.2]
  def change
    add_column :relationships, :follower_id, :integer
  end
end
