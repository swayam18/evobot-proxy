class PositionsController < ApplicationController
  def index
    @positions = Position.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @positions}
    end
  end

  def predator
    @position = Position.where(name: 'predator').limit(1).first
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @position}
    end
  end

  def prey
    @position = Position.where(name: 'prey').limit(1).first
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @position}
    end
  end

  def create
    respond_to do |format|
      format.html # index.html.erb
      format.json do
        @position = Position.create(position_params) 
        if @position.save
          render json: @position
        else
          render json: { errors: @position.errors.full_messages }, status: 422
        end
      end
    end
  end

  private
    
  def position_params
    params.require(:position).permit(:name, :x, :y)
  end
end
