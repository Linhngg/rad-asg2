class NewsController < ApplicationController
    before_filter :authenticate_user, :only => [:submit, :postNews]
    before_filter :check_authentication, :only => [:index, :item]
    
    def index
        @numberOfItem = 8
        @pageNumber = 1
        if params.has_key?(:p)
            @pageNumber = params["p"].to_f
        end
        @lastPage = New.all.length / @numberOfItem + 1
        if @pageNumber == @lastPage
            @news = New.all.order('created_at DESC').first(@numberOfItem*@pageNumber).last(New.all.length - (@pageNumber-1)*@numberOfItem)
        else
           @news = New.all.order('created_at DESC').first(@numberOfItem*@pageNumber).last(@numberOfItem) 
        end
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
            flash[:success] = "News submitted successfully"
            redirect_to :action => 'index'
        else
            flash[:warning] = "Fail to submit news"
            redirect_to :action => 'submit'  
        end
    end
end

