class CreateConsults < ActiveRecord::Migration
  def change
    create_table :consults do |t|
      t.integer :vacuna_id
      t.integer :servicio_id
      t.integer :doctor_id
      t.integer :receta_id
      t.integer :animal_id

      t.timestamps
    end
  end
end
