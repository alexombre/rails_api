class ImagesController < ApplicationController
  before_filter :authenticate_user!, only: [:create]
  respond_to :json
  
  
  def index
    @images = Image.all.select{|img| !img.private?}
    render json: @images
  end

  def create
    @image = Image.create(image_params.merge(user_id: current_user.id))
    if @image.save
      render json: @image, status: :created
    else
      render json: { error: @image.errors }, status: :unprocessable_entity
    end
    
  end
  
  private

  def image_params
    params.require(:image).permit(:stream, :extension, :description, :private?)
  end
  
  def respond_with(resource, _opts = {})
    render json: resource
  end

  def respond_to_on_destroy
    head :no_content
  end
  
end
