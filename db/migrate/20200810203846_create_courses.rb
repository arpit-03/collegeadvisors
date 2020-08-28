class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.integer :table_id
      t.string :degree
      t.string :name
      t.string :facts

      t.timestamps
    end
  end
end
