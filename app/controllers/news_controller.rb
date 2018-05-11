class NewsController < ApplicationController
    before_filter :authenticate_user, :only => [:submit, :postNews]
    before_filter :check_authentication, :only => [:index, :item]
    
    def index
        @pageNumber = 1
        if params.has_key?(:p)
            @pageNumber = params["p"].to_f
        end
        @news = New.all.order('created_at DESC').first(8*@pageNumber).last(8)
    end
    
    def item
        @new = New.find(params[:id])
    end
    
    def submit
        @new = New.new
    end
    
    def postNews
        @new = New.new
        @new.headline = params["headline"]
        @new.content = params["content"]
        @new.user_id = session[:user_id]
        if @new.save
            redirect_to :action => 'index'
        else
            redirect_to :action => 'submit'  
        end
    end
end

