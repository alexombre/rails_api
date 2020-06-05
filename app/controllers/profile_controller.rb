class ProfileController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json
  
  def index
    render json: current_user.as_json(only: [:username, :first_name, :last_name]), status: :created
  end
  
  def comment
    render json: Comment.all.select{|com| com.user_id == current_user.id}
  end
  
  def image
    render json: Image.all.select{|img| img.user_id == current_user.id}
  end
  
  private
  
  def respond_with(resource, _opts = {})
    render json: resource
  end
  
end
