class Winelist < ApplicationRecord

  has_many :winelist_wines
  has_many :wines, through: :winelist_wines
  
end
