class AddAttachmentSnapshotToRobots < ActiveRecord::Migration
  def self.up
    change_table :robots do |t|
      t.attachment :snapshot
    end
  end

  def self.down
    remove_attachment :robots, :snapshot
  end
end
