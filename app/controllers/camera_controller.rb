class CameraController < ApplicationController
  def update
    camera = Camera.first
    camera.snapshot = params[:snapshot]
    camera.save
    render json: { success: true }
  end
end
