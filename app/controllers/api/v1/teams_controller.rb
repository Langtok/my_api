class Api::V1::TeamsController < ApplicationController
    before_action :authenticate_admin!, only: [:create, :update, :destroy]
  
    def index
      @teams = Team.page(params[:page]).per(20)
      render json: @teams
    end
  
    def show
      @team = Team.find(params[:id])
      render json: @team
    end
  
    def create
      @team = Team.new(team_params)
      if @team.save
        render json: @team, status: :created
      else
        render json: @team.errors, status: :unprocessable_entity
      end
    end
  
    def update
      @team = Team.find(params[:id])
      if @team.update(team_params)
        render json: @team
      else
        render json: @team.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @team = Team.find(params[:id])
      @team.destroy
      head :no_content
    end
  
    private
  
    def team_params
      params.require(:team).permit(:name, :country, player_ids: [])
    end
  end
  