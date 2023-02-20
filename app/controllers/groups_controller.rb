class GroupsController < ApplicationController


    def index
        @user=current_user
        @group = Group.find(params[:id])
        render :index
    end
    def new
        @group = Group.new
        render :new
    end
    def create
        @group = Group.new(params.require(:group).permit(:name, :star_player, :location, :interests, :member_type, :group_image, :description))
        if @group.location=="None"
          @group.location=nil
        end
        if @group.member_type=="None"
          @group.member_type=nil
        end
        if @group.interests=="None"
          @group.interests=nil
        end
        if @group.save
          flash[:success] = 'New group successfully created'
          @participation=GroupParticipation.create(group_id: @group[:id],user_id: current_user[:id], admin: "true")
          @participation.save
          redirect_to show_groups_url
        else
          flash.now[:error] = 'Group creation failed'
          render :new, status: :unprocessable_entity
        end
      end
    def show
      @user=current_user
      @groups = Group.all
      render :show_groups
    end
    
    def edit
      @group=Group.find([params[:id]])
      render :edit
    end

    def destroy
      @group = Group.find(params[:id])
      @group.destroy
      flash[:success] = 'The group item was successfully destroyed.'
      redirect_to show_groups_url, status: :see_other
    end
    
    def update
      @group = Group.find(params[:id])
      if @group.update(params.require(:group).permit(:name, :location, :interests, :star_player, :member_type, :group_image, :description))
        flash[:success] = 'Group successfully updated!'
        redirect_to groups_url(@group)
      else
        flash.now[:error] = 'Group update failed'
        render :edit, status: :unprocessable_entity
      end
    end

    

end
