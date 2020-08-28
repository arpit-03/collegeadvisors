class AddVerified2ToUsers < ActiveRecord::Migration[6.0]
  def change
  	 add_column :users, :verification_token, :string
  end
end
