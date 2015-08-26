class CreateAnimalServicios < ActiveRecord::Migration
  def change
    create_table :animal_servicios do |t|
      t.integer :servicio_id
      t.integer :doctor_id
      t.integer :client_id
      t.integer :animal_id
      t.boolean :pago

      t.timestamps
    end
  end
end
