class UsersController < ApplicationController
  
  def index
    users = User.all
    return render json: users, status: 200
  end

  def show
    user = User.find_by_id(params[:id])
    return render json: user, status: 200
  end

end
