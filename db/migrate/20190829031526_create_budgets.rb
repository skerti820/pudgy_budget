class CreateBudgets < ActiveRecord::Migration[5.1]
  def change
    create_table :budgets do |t|
      t.string :description
      t.integer :category_id
      t.boolean :deleted
      t.date :month_date

      t.timestamps
    end
  end
end
