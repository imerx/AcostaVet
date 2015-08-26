class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :nombre
      t.string :apellido
      t.string :direccion
      t.string :ciudad
      t.string :estado
      t.integer :codigo
      t.string :pais
      t.string :email
      t.string :telefono
      t.string :celular

      t.timestamps
    end
  end
end
