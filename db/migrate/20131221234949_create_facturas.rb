class CreateFacturas < ActiveRecord::Migration
  def change
    create_table :facturas do |t|
      t.integer :user_id
      t.integer :animal_servicio_id
      t.integer :animal_vacuna_id
      t.integer :client_id
      t.integer :animal_id
      t.decimal :precio
      t.text :commentario
      t.decimal :total
      t.boolean :pagado
      t.decimal :iva

      t.timestamps
    end
  end
end
