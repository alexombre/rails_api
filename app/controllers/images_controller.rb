class ImagesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json
  
  
  def index
    
  end

  def create
    @image = Image.create(image_params)
    if @image.save
      render json: @image, status: :created
    else
      render json: { error: @image.errors }, status: :unprocessable_entity
    end
    
  end
  
  private

  def image_params
    params.require(:image).permit(:stream, :extension, :description)
  end
  
  def respond_with(resource, _opts = {})
    render json: resource
  end

  def respond_to_on_destroy
    head :no_content
  end
  
end
