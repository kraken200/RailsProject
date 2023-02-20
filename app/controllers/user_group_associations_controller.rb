class UserGroupAssociationsController < ApplicationController
    before_action :authenticate_user!
    def edit
        @users=User.all
        @group=Group.find(params[:id])
        render :edit
    end
    
    def destroy
        @group=Group.find(params[:group_id])
        @user=User.find(params[:id])
        @group_participation=GroupParticipation.where(group_id: @group[:id], user_id: @user[:id])
        @group_participation.destroy_all
        flash[:success] = 'Player successfully deleted'
        redirect_to user_profile_path(current_user)
    end
  
    def create
        @group=Group.find(params[:group_id])
        @user=User.find(params[:id])
        if @group.member_type.nil?
            if @group.interests.nil?
                if @group.location.nil?
                    @participation=GroupParticipation.create(group_id: @group[:id],user_id: @user[:id], admin: "false")
                    @participation.save
                    flash[:success] = 'Player successfully added'
                    redirect_to user_profile_path(current_user)
                else
                    if @group.location==@user.location
                        @participation=GroupParticipation.create(group_id: @group[:id],user_id: @user[:id], admin: "false")
                        @participation.save
                        flash[:success] = 'Player successfully added'
                        redirect_to user_profile_path(current_user)
                    else
                        flash[:error] = 'User cannot join group'
                        redirect_to user_profile_path(current_user)
                    end   
                end
            else
                if @group.interests==@user.interests
                    if @group.location.nil?
                        @participation=GroupParticipation.create(group_id: @group[:id],user_id: @user[:id], admin: "false")
                        @participation.save
                        flash[:success] = 'Player successfully added'
                        redirect_to user_profile_path(current_user)
                    else
                        if @group.location==@user.location
                            @participation=GroupParticipation.create(group_id: @group[:id],user_id: @user[:id], admin: "false")
                            @participation.save
                            flash[:success] = 'Player successfully added'
                            redirect_to user_profile_path(current_user)
                        else
                            flash[:error] = 'User cannot join group'
                            redirect_to user_profile_path(current_user)
                        end   
                    end
                else
                    flash.now[:error] = 'User cannot join group'
                end
            end
        else
            if @group.member_type==@user.position
                if @group.interests.nil?
                    if @group.location.nil?
                        @participation=GroupParticipation.create(group_id: @group[:id],user_id: @user[:id], admin: "false")
                        @participation.save
                        flash[:success] = 'Player successfully added'
                        redirect_to user_profile_path(current_user)
                    else
                        if @group.location==@user.location
                            @participation=GroupParticipation.create(group_id: @group[:id],user_id: @user[:id], admin: "false")
                            @participation.save
                            flash[:success] = 'Player successfully added'
                            redirect_to user_profile_path(current_user)
                        else
                            flash[:error] = 'User cannot join group'
                            redirect_to user_profile_path(current_user)
                        end   
                    end
                else
                    if @group.interests==@user.interests
                        if @group.location.nil?
                            @participation=GroupParticipation.create(group_id: @group[:id],user_id: @user[:id], admin: "false")
                            @participation.save
                            flash[:success] = 'Player successfully added'
                            redirect_to user_profile_path(current_user)
                        else
                            if @group.location==@user.location
                                @participation=GroupParticipation.create(group_id: @group[:id],user_id: @user[:id], admin: "false")
                                @participation.save
                                flash[:success] = 'Player successfully added'
                                redirect_to user_profile_path(current_user)
                            else
                                flash[:error] = 'User cannot join group'
                                redirect_to user_profile_path(current_user)
                            end   
                        end
                    else
                        flash[:error] = 'User cannot join group'
                        redirect_to user_profile_path(current_user)
                    end
                end
            else
                flash[:error] = 'User cannot join group'
                redirect_to user_profile_path(current_user)
            end
        end
      end

    def update
        @group=Group.find(params[:group_id])
        @user=User.find(params[:id])
        @group.star_player=@user.name
        if @group.save
            flash[:success] = 'Star Player successfully added'
            redirect_to user_profile_path(current_user)
        else
            flash.now[:error] = 'User cannot be star player'
            render :edit, status: :unprocessable_entity
        end    
    end
end
