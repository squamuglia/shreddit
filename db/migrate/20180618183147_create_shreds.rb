class CreateShreds < ActiveRecord::Migration[5.2]
  def change
    create_table :shreds do |t|
      t.integer :user_id
      t.integer :subshreddit_id

      t.timestamps
    end
  end
end
