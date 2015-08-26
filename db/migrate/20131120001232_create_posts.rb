class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :username
      t.string :servicio
      t.text :comentario
      t.string :honeyput

      t.timestamps
    end
  end
end
