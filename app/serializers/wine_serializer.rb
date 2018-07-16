class WineSerializer < ActiveModel::Serializer
  attributes :id, :name, :primary_category, :secondary_category, :origin, :sugar_content, :producer_name, :description, :serving_suggestions, :tasting_note, :image_thumb_url, :image_url

  has_many :winelists

end
