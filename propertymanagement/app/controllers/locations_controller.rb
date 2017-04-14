class LocationsController < ApplicationController

    #Params -> :longitude, :latitude, :distance, :units
    def getLocationWithinRadius

        if("m" == params[:units])
            earthRadius = 3965
        elsif("km" == params[:units])
            earthRadius = 6380
        else
            earthRadius = nil
        end

        @locations = Location.nearby(params[:longitude], params[:latitude], earthRadius, params[:distance])
        #@locations = Location.nearby(-70.8901, 23.2136, 3965, 5)

        respond_to do |format|
                format.json{
                    render json:@locations
                }
        end
    end

    #Params -> :id
    def getLocationById
        @location = Location.find(params[:id])
        Location.select { |e|  }
        respond_to do |format|
            format.json{
                render json:@location
            }
            format.xml{
                render xml:@location.to_xml
            }
        end
    end
end
