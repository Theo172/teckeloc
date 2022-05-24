class RenameTeckelTypeToHair < ActiveRecord::Migration[6.1]
  def change
    rename_column :teckels, :type, :hair
  end
end
