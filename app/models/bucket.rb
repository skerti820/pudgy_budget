class Bucket < ApplicationRecord
  # Direct associations

  has_many   :categories,
             :foreign_key => "transation_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
