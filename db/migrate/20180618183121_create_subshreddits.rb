class CreateSubshreddits < ActiveRecord::Migration[5.2]
  def change
    create_table :subshreddits do |t|
      t.string :name

      t.timestamps
    end
  end
end
