class AddTransactionCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :transactions_count, :integer
  end
end
