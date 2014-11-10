class Robot < ActiveRecord::Base
  has_many :positions
  
  def location(x,y)
    positions.create(x: x, y: y)
  end

  def last_position
    positions.first
  end
end
