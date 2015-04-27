class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :cell_phone
      t.string :landline
      t.integer :route_id
      t.integer :visit_sequence
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :zip
      t.integer :qty
      t.integer :group_id
      t.integer :route_id
      t.datetime :last_invoice_sent
      t.datetime :renewal_due_date
      t.text :notes

      t.timestamps null: false
    end
  end
end
