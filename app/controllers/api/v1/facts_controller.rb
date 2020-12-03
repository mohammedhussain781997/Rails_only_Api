class Api::V1::FactsController < ApplicationController
    before_action :find_fact,only: [:show,:update,:destroy]

    def index
        @facts = Fact.all
        render json:@facts
    end
    
    def show
        render json:@users
    end
    
    def create
        @fact =Fact.new(fact_params)
        if @fact.save
          render json:@fact
        else
        render error: {error: "Unable to create the fact"}, status: 400
        end
    end
    
    def update
        if @fact
          @fact.update(fact_params)
          render json:{message: "Fact updated successfully"}, status: 200
        else
          render error: {error: "Unable to update the fact"}, status: 400
        end
    end
    
    def destroy
        if @fact
            @fact.destroy
            render json:{message: "Fact deleted successfully"}, status: 200
         else
            render error: {error: "Unable to delete the fact"}, status: 400
        end
    end
    
    private 
    def fact_params
          params.require(:user).permit(:username, :password)
    end

    def find_fact
            @fact=Fact.find(params[:id])
    end
end
