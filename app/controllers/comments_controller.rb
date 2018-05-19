class CommentsController < ApplicationController
    before_filter :authenticate_user, :only => [:postComment]
    before_filter :check_authentication, :only => [:index]
    
    # The new comments page. Return 8 latest comments
    def index
        @comments = Comment.all.order('created_at DESC').first(8)
    end
    
    # POST: validate, save comment and redirect to pages with flash messages
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
