class CreateCities < ActiveRecord::Migration[8.0]
  def change
    create_table :cities do |t|
      t.references :state
      t.string :name, null: false
      t.integer :population, null: false, default: 0

      t.timestamps
    end
  end
end
