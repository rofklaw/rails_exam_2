class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :name
      t.integer :cost
      t.references :user, index: true, foreign_key: true
      t.boolean :sold, :default => false

      t.timestamps null: false
    end
  end
end
