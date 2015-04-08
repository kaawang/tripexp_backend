class TripsController < ApplicationController
  include TripsHelper

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
    geocode_response = geocode_converter(params[:tripLocation])
    create_trip = Trip.create(
      user_id: params[:user_id],
      trip_name: params[:tripName],
      location: params[:tripLocation],
      startdate: params[:tripStartDate], # fix startdate enddate naming convention fields
      enddate: params[:tripEndDate],
      # geocode_location: geocode_response JSON FORMAT
      )
    return render json: create_trip, status: 200
  end

  private
end
