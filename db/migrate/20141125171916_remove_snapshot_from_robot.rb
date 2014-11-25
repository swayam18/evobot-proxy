class RemoveSnapshotFromRobot < ActiveRecord::Migration
  def change
    remove_attachment :robots, :snapshot
  end
end
