class HomeController < ApplicationController
  def index
    @prey = Robot.find_by_name('prey').positions.limit(30).map(&:xy).reverse()
    @predator = Robot.find_by_name('predator').positions.limit(30).map(&:xy).reverse()
  end
end
