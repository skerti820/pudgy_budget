class AddCategoryCountToBuckets < ActiveRecord::Migration[5.1]
  def change
    add_column :buckets, :categories_count, :integer
  end
end
