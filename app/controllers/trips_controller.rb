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
    hash_coordinates = geocode_response["geometry"]["location"]
    hash_place_id = geocode_response["place_id"]
    create_trip = Trip.create(
      user_id: params[:user_id],
      trip_name: params[:tripName],
      location: params[:tripLocation],
      start_date: params[:tripStartDate],
      end_date: params[:tripEndDate],
      geocode_longitude: hash_coordinates["lng"],
      geocode_latitude: hash_coordinates["lat"],
      google_place_id: hash_place_id
      )
    return render json: create_trip, status: 200
  end

  private
end
