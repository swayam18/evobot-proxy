class Camera < ActiveRecord::Base
  has_attached_file :snapshot 

  validates_attachment_content_type :snapshot, :content_type => /\Aimage/
  validates_attachment_file_name :snapshot, :matches => [/png\Z/, /jpe?g\Z/]
end

