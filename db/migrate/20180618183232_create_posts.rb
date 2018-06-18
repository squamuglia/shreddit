class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :owner_id
      t.integer :score
      t.string :title
      t.string :content
      t.string :tony

      t.timestamps
    end
  end
end
