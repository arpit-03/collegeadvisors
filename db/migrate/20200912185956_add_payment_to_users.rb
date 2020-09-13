class AddPaymentToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :txnid, :string
    add_column :users, :payment_response, :string
  end
end
