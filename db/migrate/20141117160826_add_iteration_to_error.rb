class AddIterationToError < ActiveRecord::Migration
  def change
    add_column :errors, :iteration, :integer
  end
end
