class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :nombre
      t.text :descripcion

      t.timestamps
    end
  end
end
