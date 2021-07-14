class RemoveFollowIdFromRelationships < ActiveRecord::Migration[5.2]
  def change
    remove_column :relationships, :follow_id, :integer
  end
end
