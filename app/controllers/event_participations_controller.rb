class EventParticipationsController < ApplicationController
    before_action :authenticate_user!
    before_action :require_permission, except: [:destroy,:create]


    def require_permission
        @event=Event.find(params[:id])
        if @event.user!= current_user
            flash[:error]="You do not have permission to do that"
            redirect_to event_url(@event)
        end
    end

    def edit
        @teams=Team.all
        @event=Event.find(params[:id])
        render :edit
    end

    def destroy
        @event=Event.find(params[:event_id])
        @team=Team.find(params[:id])
        @event_participation=EventParticipation.where(event_id: @event[:id], team_id: @team[:id])
        @event_participation.destroy_all
        redirect_to user_profile_path(current_user)
    end
  
    def create
        @event=Event.find(params[:event_id])
        @team=Team.find(params[:id])
        @event_participation=EventParticipation.create(event_id: @event[:id], team_id: @team[:id])
        if @event_participation.save
            flash[:success]="Team added successfully"
            redirect_to user_profile_path(current_user)
        else
            flash.now[:error]="Could not add team"
            render :edit, status: unprocessable_entity
        end
    end
end
