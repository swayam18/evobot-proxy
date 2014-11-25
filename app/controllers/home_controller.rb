class HomeController < ApplicationController
  def index
    @prey = Robot.find_by_name('prey').positions.limit(10).map(&:xy).reverse()
    @predator = Robot.find_by_name('predator').positions.limit(10).map(&:xy).reverse()
  end

  def about
  end

  def fitness
    @prey = Robot.find_by_name('prey').errors.limit(50).map{|e| Float(e.o_error)}.reverse()
    @predator = Robot.find_by_name('predator').errors.limit(50).map{|e| Float(e.o_error)}.reverse()
  end
end
