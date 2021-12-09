class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.references :user, null: false, foreign_key: true
      t.text :body

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
