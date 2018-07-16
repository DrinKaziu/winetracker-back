class CreateWines < ActiveRecord::Migration[5.2]
  def change
    create_table :wines do |t|
      t.string :name
      t.string :primary_category
      t.string :secondary_category
      t.string :origin
      t.string :sugar_content
      t.string :producer_name
      t.text :description
      t.text :serving_suggestions
      t.text :tasting_note
      t.string :image_thumb_url
      t.string :image_url
      t.string :varietal
      t.string :style

      t.timestamps
    end
  end
end
