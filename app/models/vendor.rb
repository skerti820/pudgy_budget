class Vendor < ApplicationRecord
  # Direct associations

  has_many   :transactions,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
