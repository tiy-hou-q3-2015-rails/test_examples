class CreateCalculations < ActiveRecord::Migration
  def change
    create_table :calculations do |t|
      t.integer :people
      t.integer :pizzas, default: 0

      t.timestamps null: false
    end
  end
end
