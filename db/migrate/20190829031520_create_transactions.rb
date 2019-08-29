class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :description
      t.integer :vendor_id
      t.integer :category_id
      t.boolean :deleted
      t.integer :user_id
      t.date :purchase_date
      t.float :amount

      t.timestamps
    end
  end
end
