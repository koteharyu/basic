class ChangeDataTypeFollowedIdOfRelationships < ActiveRecord::Migration[6.1]
  def self.up
    change_column :relationships, :followed_id, :'integer USING CAST(followed_id AS integer)'
  end

  def self.down
      change_column :relationships, :followed_id, :string
  end
end
