class CreateColleges < ActiveRecord::Migration[6.0]
  def change
    create_table :colleges do |t|
      t.string :name
      t.string :location
      t.string :facts
      t.string :facts_table
      t.string :facility

      t.timestamps
    end
  end
end
