class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :name
      t.decimal :x
      t.decimal :y

      t.timestamps
    end
  end
end
