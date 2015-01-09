class HomeController < ApplicationController
  def index
    @prey = Robot.find_by_name('prey').positions.limit(10).map(&:xy).reverse()
    @predator = Robot.find_by_name('predator').positions.limit(10).map(&:xy).reverse()
  end

  def about
  end

  def snapshot
    @snapshot = Camera.first.snapshot
  end

  def fitness
    prey_errors = Robot.find_by_name('prey').controller_errors.where("created_at >= ?", Time.zone.now.beginning_of_day)
    predator_errors = Robot.find_by_name('predator').controller_errors.where("created_at >= ?", Time.zone.now.beginning_of_day)

    @prey_o_errors = prey_errors.map{|e| Float(e.o_error)}.reverse()
    @predator_o_errors = predator_errors.map{|e| Float(e.o_error)}.reverse()

    @prey_p_errors =prey_errors.map{|e| Float(e.p_error)}.reverse()
    @predator_p_errors = predator_errors.map{|e| Float(e.p_error)}.reverse()
  end
end
