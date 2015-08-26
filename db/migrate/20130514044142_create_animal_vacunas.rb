class CreateAnimalVacunas < ActiveRecord::Migration
  def change
    create_table :animal_vacunas do |t|
      t.integer :doctor_id
      t.integer :category_id
      t.integer :vacuna_id
      t.integer :animal_id
      t.integer :servicio_id
      t.date :cita

      t.timestamps
    end
  end
end
