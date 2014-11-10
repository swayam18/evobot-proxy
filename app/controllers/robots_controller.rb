class RobotsController < ApplicationController
  def index
    @robots = Robot.all
    render json: @robots.to_json(include: { last_position: { only: [:x,:y,:created_at]}}, only: [:id, :name, :state])
  end

  def update
    robot = Robot.find_by_name(params["name"])
    robot.update_attributes(update_params)
    render json: robot
  end

  def location
    robot = Robot.find_by_name(params["name"])
    robot.location(params["x"],params["y"])
    render json: robot
  end

  def show
    robot = Robot.find_by_name(params["name"])
    render json: robot.to_json(include: :positions)
  end

  private
    
  def update_params
    params.require(:robot).permit(:name, :state)
  end

  def robot_params
    params.require(:robot).permit(:name, :x, :y)
  end
end
