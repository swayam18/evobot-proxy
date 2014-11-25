class Robot < ActiveRecord::Base
  has_many :positions
  has_many :controller_errors

  def error(i,o,p, state)
    controller_errors.create(iteration: i, o_error: o , p_error: p, state: state)
  end

  def location(x,y)
    positions.create(x: x, y: y)
  end

  def last_error
    controller_errors.first
  end

  def last_position
    positions.first
  end
end
