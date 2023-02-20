class TeamsController < ApplicationController
  before_action :authenticate_user!
    def index
        @user=current_user
        @team = Team.find(params[:id])
        render :index
    end

    def show
      @teams=Team.all
      render :show
    end

    def new
        @teams = Team.new
        render :new
    end
    
    def edit
      @teams = Team.find(params[:id])
      render :edit
    end
    def destroy
      @teams = Team.find(params[:id])
      @teams.destroy
      flash[:success] = 'The team item was successfully destroyed.'
      redirect_to team_url, status: :see_other
    end

    def create
        @team = Team.new(params.require(:team).permit(:name, :description, :coach))
        @team.uid=current_user.id
        current_user.team=@team
        @team.full="not full"
        if @team.save
          flash[:success] = 'New team successfully created'
          redirect_to teams_url
        else
          flash.now[:error] = 'Team creation failed'
          render :new, status: :unprocessable_entity
        end
      end
    def update
        @teams = Team.find(params[:id])
        if @teams.update(params.require(:team).permit(:name, :description, :coach, :pictures))
          flash[:success] = 'Team item successfully updated!'
          redirect_to teams_url(@teams)
        else
          flash.now[:error] = 'Team item update failed'
          render :edit, status: :unprocessable_entity
        end
    end
end
