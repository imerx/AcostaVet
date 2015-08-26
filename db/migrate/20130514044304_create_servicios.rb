class CreateServicios < ActiveRecord::Migration
  def change
    create_table :servicios do |t|
      t.string :nombre
      t.text :descripcion
      t.string :clave
      t.decimal :precio
      t.integer :servicio_id
      t.integer :animal_id
      t.integer :doctor_id

      t.timestamps
    end
  end
end
