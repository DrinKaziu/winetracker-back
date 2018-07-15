class Wine < ApplicationRecord

  has_many :winelist_wines
  has_many :winelists, through: :winelist_wines

end
