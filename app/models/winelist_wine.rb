class WinelistWine < ApplicationRecord

  belongs_to :wine
  belongs_to :winelist

end
