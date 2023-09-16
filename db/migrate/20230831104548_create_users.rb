class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :avatar
      t.string :email, unique: true
      t.string :name
      t.string :username, unique: true
      t.string :password
      t.binary :bookmarks, default: '[]', limit: 10.megabyte
      t.binary :likes, default: '[]', limit: 10.megabyte
      t.integer :follower
      t.integer :following

      t.timestamps
    end
  end
end