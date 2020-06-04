class ProfileController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json
  
  def index
    render json: current_user.as_json(only: [:username, :first_name, :last_name])
  end
  
  
end
