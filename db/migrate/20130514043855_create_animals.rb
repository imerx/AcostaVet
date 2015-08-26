class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :nombre
      t.date :nacio_el
      t.integer :client_id
      t.string :sexo
      t.string :color
      t.string :raza
      t.text :comentario
      t.integer :category_id

      t.timestamps
    end
  end
end
