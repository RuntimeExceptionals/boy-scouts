class CreateRoutesUsers < ActiveRecord::Migration
  def change
    create_table :routes_users do |t|
      t.integer :route_id
      t.integer :user_id
    end
  end
end
