class Category < ApplicationRecord
  # Direct associations

  belongs_to :bucket,
             :foreign_key => "transation_id",
             :counter_cache => true

  # Indirect associations

  # Validations

end
