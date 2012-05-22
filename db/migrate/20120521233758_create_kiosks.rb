class CreateKiosks < ActiveRecord::Migration
  def change
    create_table :kiosks do |t|
      t.string :nombre
      t.string :precio
      t.string :image

      t.timestamps
    end
  end
end
