class RemoveFollowerIdFromRelationships < ActiveRecord::Migration[5.2]
  def change
    remove_column :relationships, :follower_id, :integer
  end
end
