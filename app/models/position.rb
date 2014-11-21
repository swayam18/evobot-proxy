class Position < ActiveRecord::Base
  belongs_to :robots
  before_create :check_count
  default_scope order('created_at DESC')

  validates :x, presence: true
  validates :y, presence: true

  def self.clear
    if Rails.env == 'production'
      Position.delete_all
      true
    end
    false
  end

  def check_count
    if Position.count > 4000
      Position.clear
    end
  end

  def previous
    Position.where("name=? AND id < ?",name,id).first
  end

  def xy
    [Integer(x), Integer(y)]
  end

end
