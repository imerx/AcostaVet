class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :rfc
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
