class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password
      t.boolean :admin
      t.string :photo
      t.string :bio

      t.timestamps
    end
  end
end
