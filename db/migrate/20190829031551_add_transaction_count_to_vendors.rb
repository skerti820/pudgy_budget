class AddTransactionCountToVendors < ActiveRecord::Migration[5.1]
  def change
    add_column :vendors, :transactions_count, :integer
  end
end
