class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :author  # user_id
      t.integer :post_id
      t.string :content
      t.integer :likes

      t.timestamps
    end
  end
end
