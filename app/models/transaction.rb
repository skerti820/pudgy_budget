class Transaction < ApplicationRecord
  # Direct associations

  belongs_to :vendor,
             :counter_cache => true

  belongs_to :category,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
