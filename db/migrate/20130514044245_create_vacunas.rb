class CreateVacunas < ActiveRecord::Migration
  def change
    create_table :vacunas do |t|
      t.string :nombre
      t.text :descripcion
      t.decimal :precio
      t.string :clave
      t.string :periodo_vacunacion
      t.string :servicio_id
      t.string :category_id
      t.timestamps
    end
  end
end
