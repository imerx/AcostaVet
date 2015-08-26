class CreateUbicacions < ActiveRecord::Migration
  def change
    create_table :ubicacions do |t|
      t.string :slot
      t.string :pasillo

      t.timestamps
    end
  end
end
