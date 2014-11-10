class AddRobotIdToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :robot_id, :integer
    remove_column :positions, :name
  end
end
