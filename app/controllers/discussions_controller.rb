class DiscussionsController < ApplicationController
    def new
        render :new
    end

    def create
        @group=Group.find(params[:group_id])
        @discussion=@group.discussions.build(params.require(:discussion).permit(:content))
        @discussion.uid=current_user[:id]
        if @discussion.save
            redirect_to home_group_url(@group)
        else
            flash.now[:error]= "Error sending message"
        end
    end
end
