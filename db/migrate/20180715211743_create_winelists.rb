class CreateWinelists < ActiveRecord::Migration[5.2]
  def change
    create_table :winelists do |t|
      t.string :name
      t.text :description
      
      t.timestamps
    end
  end
end
