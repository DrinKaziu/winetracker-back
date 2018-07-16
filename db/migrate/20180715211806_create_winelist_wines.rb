class CreateWinelistWines < ActiveRecord::Migration[5.2]
  def change
    create_table :winelist_wines do |t|
      t.integer :winelist_id
      t.integer :wine_id

      t.timestamps
    end
  end
end
