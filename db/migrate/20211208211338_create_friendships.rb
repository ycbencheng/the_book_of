class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships do |t|
      t.references :user, null: false, index: true, foreign_key: true
      t.integer :friend_id
      t.integer :status

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
