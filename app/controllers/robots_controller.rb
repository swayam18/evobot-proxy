class RobotsController < ApplicationController
  def index
    @robots = Robot.all
    render json: @robots.to_json(include: [{ last_position: { only: [:x,:y,:created_at]}}, :last_error], only: [:id, :name, :state])
  end

  def snapshot
    @robot = Robot.find_by_name(params["name"])
    @robot.snapshot = params[:snapshot]
    @robot.save
    render json: @robot
  end

  def update
    robot = Robot.find_by_name(params["name"])
    robot.update_attributes(update_params)
    render json: robot
  end

  def locations
    robot = Robot.find_by_name(params["name"])
    render json: robot.to_json(include: :positions)
  end

  def location
    robot = Robot.find_by_name(params["name"])
    robot.location(params["x"],params["y"])
    render json: robot
  end

  def errors
    robot = Robot.find_by_name(params["name"])
    render json: robot.to_json(include: :controller_errors)
  end

  def error
    robot = Robot.find_by_name(params["name"])
    robot.error(params["iteration"],params["o_error"],params["p_error"], params["state"])
    render json: robot
  end

  def show
    robot = Robot.find_by_name(params["name"])
    render json: robot.to_json(include: :positions)
  end

  private
    
  def update_params
    params.require(:robot).permit(:name, :state, :snapshot)
  end

  def robot_params
    params.require(:robot).permit(:name, :x, :y)
  end
end
