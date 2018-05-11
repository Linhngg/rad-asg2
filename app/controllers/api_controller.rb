class ApiController < ActionController::Base
    def index
        @new = New.find(params[:id])
        render json: @new
    end
end
