class VenuesController < ApplicationController
    def index
        @venues = Venue.all
        render :index
    end
    def show
        @venue = Venue.find(params[:id])
        render :show
      end
    def destroy
        @venue = Venue.find(params[:id])
        @venue.destroy
        flash[:success] = 'The venue item was successfully destroyed.'
        redirect_to venues_url, status: :see_other
      end
end
