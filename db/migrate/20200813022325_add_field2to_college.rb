class AddField2toCollege < ActiveRecord::Migration[6.0]
  def change
  	add_column :colleges,:animation,:boolean
  	add_column :colleges,:humanities ,:boolean
  	add_column :colleges,:law , :boolean
  	add_column :colleges,:mascom , :boolean
  	add_column :colleges,:medical , :boolean
  	add_column :colleges,:science , :boolean
  	add_column :colleges,:hospitality , :boolean
  	add_column :colleges,:architecture , :boolean
  	add_column :colleges,:arts , :boolean
  	add_column :colleges,:commerce , :boolean
  	add_column :colleges,:engineering , :boolean
  	add_column :colleges,:design , :boolean
 
  end
end
