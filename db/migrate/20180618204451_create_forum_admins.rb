class CreateForumAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :forum_admins do |t|
      t.integer :user_id
      t.integer :forum_id

      t.timestamps
    end
  end
end
