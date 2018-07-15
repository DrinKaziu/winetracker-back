class CreateWinelistWines < ActiveRecord::Migration[5.2]
  def change
    create_table :winelist_wines do |t|

      t.timestamps
    end
  end
end
