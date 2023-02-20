class TeamPlayersController < ApplicationController
    before_action :authenticate_user!
    def edit
        @users=User.all
        @team=Team.find(params[:id])
        render :edit
    end

    def destroy
        @team=Team.find(params[:team_id])
        @user=User.find(params[:id])
        @team.users.delete(@user)
        @team.full="not full"
        @team.save
        flash[:success] = 'Player successfully removed'
        redirect_to user_profile_path(current_user)
    end
  
    def create
        @team=Team.find(params[:team_id])
        @user=User.find(params[:id])
        if @team.full=="full"
            flash[:error]="Team is already full"
            redirect_to user_profile_path(current_user)
        else
            @user.team=@team
            if @team.users.count==15
                @team.full="full"
            end
            @user.save
            flash[:success] = 'Player successfully added'
            redirect_to user_profile_path(current_user)
        end
      end
end
