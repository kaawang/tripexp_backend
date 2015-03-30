class PoisController < ApplicationController

  def index
    pois = Poi.where(trip_id: params[:trip_id])
    return render json: pois, status: 200
  end

 # Points of interest shown should be tied to the trip_id ONLY

  def show
    poi = Poi.where(trip_id: params[:trip_id], id: params[:id])
    if poi.empty?
      return render json: "ACCESS DENIED\n\nPOINT OF INTEREST: " + params[:id] + " DOES NOT BELONG TO TRIP: "  + params[:trip_id], status: 200
    else
      return render json: poi, status: 200
    end
  end

  def create
    
  end

end
