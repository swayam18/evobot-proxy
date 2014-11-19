class AddStateToError < ActiveRecord::Migration
  def change
    add_column :errors, :state, :integer
  end
end
