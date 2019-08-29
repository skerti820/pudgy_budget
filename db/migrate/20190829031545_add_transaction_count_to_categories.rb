class AddTransactionCountToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :transactions_count, :integer
  end
end
