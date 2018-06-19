class AddSlugToForum < ActiveRecord::Migration[5.2]
  def change
    add_column :forums, :slug, :string
  end
end
