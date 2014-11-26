class ControllerError < ActiveRecord::Base
  belongs_to :robots
  default_scope order('created_at DESC')
end
