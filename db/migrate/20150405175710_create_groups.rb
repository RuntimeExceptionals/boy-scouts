class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :parent_id
      t.boolean :admin, null: false, default: false
      t.timestamps null: false
    end
  end
end
