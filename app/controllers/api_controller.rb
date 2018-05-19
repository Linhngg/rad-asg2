class ApiController < ActionController::Base
    # GET: news or comment by id
    def index
        begin  
            # Seperate first char as identifier and the rest as id
            @first = params[:id].split(//).first
            if @first.eql? 'n'
                @new = New.find(params[:id][1..-1])
                render status: 200, json: @new
            elsif @first.eql? 'c'
                @comment = Comment.find(params[:id][1..-1])
                render status: 200, json: @comment
            else
                render status: 400, json: {
                    message: "Item not found"
                }.to_json
            end
        rescue  
            # Return 400 error if exeption is thrown
            render status: 400, json: {
                message: "Failed to retrieve data"
            }.to_json 
        end
    end
    
    # POST: news or comments
    # params: news(type, username, title, url) and comments(type, username, text, news_id)
    def create
        begin  
            @type = params["type"]
            if @type.eql? "news"
                # Retrieve needed data and save
                @user = User.where(username: params["username"]).take
                @new = New.new
                @new.headline = params["title"]
                @new.content = params["url"]
                @new.user_id = @user.id
                if @new.save
                    render status: 200, json: {
                        message: "Successfully created",
                        data: @new
                    }.to_json 
                else
                    render status: 400, json: {
                        message: "Fail to create"
                    }.to_json 
                end
            elsif @type.eql? "comment"
                # Retrieve needed data and save
                @user = User.where(username: params["username"]).take
                @new = New.find(params["news_id"])
                @comment = Comment.new
                @comment.content = params["text"]
                @comment.new_id = @new.id
                @comment.user_id = @user.id
                if @comment.save
                    render status: 200, json: {
                        message: "Successfully created",
                        data: @comment,
                    }.to_json 
                else
                    render status: 400, json: {
                        message: "Fail to create"
                    }.to_json 
                end
            else
                render status: 400, json: {
                    message: "Type not found"
                }.to_json
            end
        rescue  
            render status: 400, json: {
                message: "Failed to create"
            }.to_json 
        end
    end
end
