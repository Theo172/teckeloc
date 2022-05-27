class AddCoordinatesToTeckel < ActiveRecord::Migration[6.1]
  def change
    add_column :teckels, :latitude, :float
    add_column :teckels, :longitude, :float
  end
end
