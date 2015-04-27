class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users  do |t|
      t.timestamps null: false
      t.string :email, null: false
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false
      t.boolean :can_view_routes

      #incorporate columns from member class.
      t.string :first_name
      t.string :last_name
      t.string :cell_phone
      t.string :landline
      t.string :email
      t.boolean :is_active
      t.string :vehicle
      t.integer :group_id
      t.integer :route_id

      t.timestamps null: false
    end

    add_index :users, :email
    add_index :users, :remember_token
  end
end
