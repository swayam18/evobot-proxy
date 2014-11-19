class Robot < ActiveRecord::Base
  has_many :positions
  has_many :errors
  
  def error(i,o,p, state)
    errors.create(iteration: i, o_error: o , p_error: p, state: state)
  end

  def location(x,y)
    positions.create(x: x, y: y)
  end

  def last_error
    errors.first
  end

  def last_position
    positions.first
  end
end
