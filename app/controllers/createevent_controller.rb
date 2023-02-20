class CreateeventController < ApplicationController
  before_action :authenticate_user!
    def require_permission
      
    end
    def eventpage
        @user=current_user
        @events = Event.all
        render :eventpage
      end
    def show
        @event = Event.find(params[:id])
        render :show
    end
    def new
        @event = Event.new
        render :new
    end
    def edit
      @event=Event.find([params[:id]])
      render :edit
    end
    def create
        @event = Event.new(params.require(:event).permit(:eventname, :date))
        @event.user=current_user
        if @event.save
          flash[:success] = 'New event successfully created'
          redirect_to events_url
        else
          flash.now[:error] = 'event creation failed'
          render :new, status: :unprocessable_entity
        end
      end

    def update
        @event = Event.find(params[:id])
        if @event.update(params.require(:event).permit(:eventname, :date))
          flash[:success] = 'event successfully updated!'
          redirect_to event_url(@event)
        else
          flash.now[:error] = 'event update failed'
          render :edit, status: :unprocessable_entity
        end
    end
    def destroy
      @event = Event.find(params[:id])
      @event.destroy
      flash[:success] = 'The event item was successfully destroyed.'
      redirect_to events_url, status: :see_other
    end
  
end
