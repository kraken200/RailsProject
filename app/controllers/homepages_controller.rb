class HomepagesController < ApplicationController
    before_action :authenticate_user!, except: [:about]
    def about
        render :about
    end
    def home
        @venues=Venue.all
        @events=Event.all
        @teams=Team.all
        @groups=Group.all
        @user=current_user
        render :home
    end

    def welcome
        render :welcome
    end

    def profile
        @user=User.find(params[:id])
        @events=@user.events
        @groups=@user.groups
        render :profile
    end
    
    def home_group
        @venues=Venue.all
        @events=Event.all
        @teams=Team.all
        @user=current_user
        @group=Group.find(params[:id])
        @discussion=Discussion.new
        render :home_group
    end
    
end