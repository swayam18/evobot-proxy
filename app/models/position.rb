class Position < ActiveRecord::Base
  belongs_to :robots
  default_scope order('created_at DESC')

  validates :x, presence: true
  validates :y, presence: true

  def previous
    Position.where("name=? AND id < ?",name,id).first
  end

  def xy
    [Integer(x), Integer(y)]
  end
end
