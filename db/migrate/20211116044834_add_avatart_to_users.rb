class AddAvatartToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :avatar, :json
  end
end
