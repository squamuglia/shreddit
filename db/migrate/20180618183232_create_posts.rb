class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :forum_id
      t.integer :score
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
