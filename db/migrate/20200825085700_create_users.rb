class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name , null: false
      t.string :email , null: false
      t.string :password , null: false
      t.string :number
      t.string :dob
      t.string :gender
      t.string :background
      t.string :interest
      t.string :fathername
      t.string :fathercontact
      t.string :mothername
      t.string :mothercontact
      t.boolean :subscription
      t.string :subtype
      t.integer :slotsleft
      t.timestamps
    end
  end
end
