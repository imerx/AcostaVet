class CreateProveedors < ActiveRecord::Migration
  def change
    create_table :proveedors do |t|
      t.string :nombre
      t.string  :direccion
      t.string  :rfc
      t.timestamps
    end
  end
end
