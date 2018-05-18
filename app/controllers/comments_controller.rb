class CommentsController < ApplicationController
    before_filter :authenticate_user, :only => [:postComment]
    before_filter :check_authentication, :only => [:index]
    
    def index
        @comments = Comment.all.order('created_at DESC').first(8)
    end
    
    def postComment
        @comment = Comment.new
        @comment.content = params["content"]
        @comment.new_id = params["newId"]
        @comment.user_id = session[:user_id]
        if @comment.save
            flash[:success] = 'Comment added successfully'
        else
            flash[:warning] = 'Fail to add comment'
        end
        redirect_to :controller => 'news', :action => 'item', :id => params["newId"]
    end
end
