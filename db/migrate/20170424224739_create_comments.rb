class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :message
      t.string :rating
      t.integer :user_id
      t.integer :game_id
      t.timestamps
    end

    add_index :comments, %i[user_id game_id]
    add_index :comments, :game_id
  end
end
