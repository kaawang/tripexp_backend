class TripsController < ApplicationController

  def index
    trips = Trip.where(user_id: params[:user_id])
    return render json: trips, status: 200
  end

 # Trips shown should be tied to the user_id ONLY

  def show
    trip = Trip.where(user_id: params[:user_id], id: params[:id])
    return render json: trip, status: 200
  end

  def create
    user = User.find_by(id: params[:user_id])
    create_trip = Trip.create(
      user_id: params[:user_id],
      trip_name: params[:tripName],
      location: params[:tripLocation],
      startdate: params[:startdate],
      enddate: params[:enddate]
      )
  end

  private

  def safe_params
    
  end

end
