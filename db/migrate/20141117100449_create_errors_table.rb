class CreateErrorsTable < ActiveRecord::Migration
  def change
    create_table :errors do |t|
      t.decimal :o_error
      t.decimal :p_error
      t.integer :robot_id
      t.timestamps
    end
  end
end
