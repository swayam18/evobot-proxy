class Position < ActiveRecord::Base
  default_scope order('created_at DESC')

  def previous
    Position.where("name=? AND id < ?",name,id).first
  end
end
