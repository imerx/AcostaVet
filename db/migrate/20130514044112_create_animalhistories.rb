class CreateAnimalhistories < ActiveRecord::Migration
  def change
    create_table :animalhistories do |t|
      t.text :historia
      t.string :peso
      t.string :temperatura
      t.string :observaciones
      t.integer :animal_id

      t.timestamps
    end
  end
end
