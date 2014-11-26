class AddIndexToErrors < ActiveRecord::Migration
  def change
    add_index :controller_errors, :created_at
  end
end
