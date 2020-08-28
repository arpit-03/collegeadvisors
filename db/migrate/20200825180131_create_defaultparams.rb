class CreateDefaultparams < ActiveRecord::Migration[6.0]
  def change
    create_table :defaultparams do |t|
      t.string :typeplan
      t.integer :price
      t.integer :numsession
      t.string :line1
      t.string :line2
      t.string :line3
      t.string :line4

      t.timestamps
    end
  end
end
