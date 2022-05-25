class CreateTeckels < ActiveRecord::Migration[6.1]
  def change
    create_table :teckels do |t|
      t.string :name
      t.string :species
      t.string :type
      t.string :color
      t.integer :age
      t.string :sex
      t.string :address
      t.text :description
      t.text :anecdote
      t.text :special_features
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
