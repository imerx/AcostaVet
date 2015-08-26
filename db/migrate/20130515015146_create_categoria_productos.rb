class CreateCategoriaProductos < ActiveRecord::Migration
  def change
    create_table :categoria_productos do |t|
      t.string :nombre
      t.text :descripcion

      t.timestamps
    end
  end
end
