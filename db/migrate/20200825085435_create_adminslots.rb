class CreateAdminslots < ActiveRecord::Migration[6.0]
  def change
    create_table :adminslots do |t|
      t.integer :admin_id , null: false
      t.datetime :slot , null: false
      t.boolean :booked
      t.integer :user_id

      t.timestamps
    end
  end
end
