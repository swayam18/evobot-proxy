class RenameErrorsToControllerErrors < ActiveRecord::Migration
  def change
    rename_table :errors, :controller_errors
  end
end
