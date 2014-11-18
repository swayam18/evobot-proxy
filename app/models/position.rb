class Position < ActiveRecord::Base
  belongs_to :robots
  default_scope order('created_at DESC')

  def self.last_known
    prey = Robot.find_by_name('prey')  
    predator = Robot.find_by_name('predator')
    return prey.positions.first
  end

  def previous
    Position.where("name=? AND id < ?",name,id).first
  end

  def xy
    [Integer(x), Integer(y)]
  end
end
