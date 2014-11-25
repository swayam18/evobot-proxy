class ControllerError < ActiveRecord::Base
  belongs_to :robots
  default_scope order('created_at DESC')
  before_create :check_count

  def self.clear
    if Rails.env == 'production'
      ControllerError.delete_all
      return true
    end
    false
  end

  def check_count
    if ControllerError.count > 4000
      ControllerError.clear
    end
  end
end
