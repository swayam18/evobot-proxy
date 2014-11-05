class PositionsController < ApplicationController
  def index
    @positions = Position.where(name: 'predator').limit(1) + Position.where(name: 'prey').limit(1)
    render json: @positions
  end

  def predator
    @position = Position.where(name: 'predator').limit(1).first
    render json: @position
  end

  def prey
    @position = Position.where(name: 'prey').limit(1).first
    render json: @position
  end

  def create
    @position = Position.create(position_params) 
    if @position.save
      render json: @position
    else
      render json: { errors: @position.errors.full_messages }, status: 422
    end
  end

  private
    
  def position_params
    params.require(:position).permit(:name, :x, :y)
  end
end
