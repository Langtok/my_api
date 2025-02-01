class Api::V1::MatchesController < ApplicationController
    before_action :authenticate_admin!, only: [:create, :update, :destroy]
  
    def index
      @matches = Match.page(params[:page]).per(20)
      render json: @matches
    end
  
    def show
      @match = Match.find(params[:id])
      render json: @match
    end
  
    def create
      @match = Match.new(match_params)
      if @match.save
        render json: @match, status: :created
      else
        render json: @match.errors, status: :unprocessable_entity
      end
    end
  
    def update
      @match = Match.find(params[:id])
      if @match.update(match_params)
        render json: @match
      else
        render json: @match.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @match = Match.find(params[:id])
      @match.destroy
      head :no_content
    end
  
    private
  
    def match_params
      params.require(:match).permit(:team_1, :team_2, :score, :date)
    end
  end
  