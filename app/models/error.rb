class Error < ActiveRecord::Base
  belongs_to :robots
  default_scope order('created_at DESC')
  before_create :check_count

  def self.clear
    if Rails.env == 'production'
      Error.delete_all
      true
    end
    false
  end

  def check_count
    if Error.count > 4000
      Error.clear
    end
  end
end
