class CreateExperienciaTrabajos < ActiveRecord::Migration
  def change
    create_table :experiencia_trabajos do |t|
      t.string :nombre
      t.text :descripcion
      t.date :date
      t.integer :doctor_id

      t.timestamps
    end
  end
end
