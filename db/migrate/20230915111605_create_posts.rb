class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :author  # user_id
      t.string :img
      t.string :content
      t.integer :likes
      t.binary :comments, default: '[]', limit: 10.megabyte

      t.timestamps
    end
  end
end