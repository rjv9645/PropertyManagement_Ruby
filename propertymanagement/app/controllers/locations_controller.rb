class LocationsController < ApplicationController

    def getLocationById
        @location = Location.find(params[:id])
        respond_to do |format|
            format.json{
                render :json => @location
            }
            format.xml{
                render :xml => @location.to_xml
            }
        end
    end
end
