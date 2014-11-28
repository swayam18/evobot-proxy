class Camera < ActiveRecord::Base
  has_attached_file :snapshot, :storage => :s3, :bucket  => ENV['MY_BUCKET_NAME']

  validates_attachment_content_type :snapshot, :content_type => /\Aimage/
  validates_attachment_file_name :snapshot, :matches => [/png\Z/, /jpe?g\Z/]
end

