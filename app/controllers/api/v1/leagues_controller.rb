class Api::V1::LeaguesController < ApplicationController
    before_action :authenticate_user!
  
    # def index
    #   leagues = League.page(params[:page]).per(20)
    #   render json: leagues
    # end
    def index
        leagues = Rails.cache.fetch("leagues_page_#{params[:page]}", expires_in: 5.minutes) do
          League.page(params[:page]).per(20)
        end
        render json: leagues
    end
      
    
    def show
        league = League.find_by(id: params[:id])
        if league
          render json: league
        else
          render json: { error: 'League not found' }, status: :not_found
        end
    end
      
  
    def create
      league = League.new(league_params)
      if league.save
        render json: league, status: :created
      else
        render json: { errors: league.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def league_params
      params.require(:league).permit(:name, :country, :season)
    end
  end
  