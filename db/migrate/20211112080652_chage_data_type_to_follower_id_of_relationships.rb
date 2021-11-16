class ChageDataTypeToFollowerIdOfRelationships < ActiveRecord::Migration[6.1]
  def self.up
    change_column :relationships, :follower_id, :'integer USING CAST(follower_id AS integer)'
  end

  def self.down
      change_column :relationships, :follower_id, :string
  end
end
