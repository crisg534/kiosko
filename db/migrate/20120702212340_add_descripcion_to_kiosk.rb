class AddDescripcionToKiosk < ActiveRecord::Migration
  def change
    add_column :kiosks, :descripcion, :string
  end
end
