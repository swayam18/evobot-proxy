class CreateCameras < ActiveRecord::Migration
  def change
    create_table :cameras do |t|
      t.attachment :snapshot
    end
  end
end
