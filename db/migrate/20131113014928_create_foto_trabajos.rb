class CreateFotoTrabajos < ActiveRecord::Migration
  def change
    create_table :foto_trabajos do |t|
      t.string :titulo
      t.string :foto

      t.timestamps
    end
  end
end
