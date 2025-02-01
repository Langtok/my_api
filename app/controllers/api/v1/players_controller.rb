class Api::V1::PlayersController < ApplicationController
    before_action :authenticate_admin!, only: [:create, :update, :destroy]
  
    def index
      @players = Player.page(params[:page]).per(20)
      render json: @players
    end
  
    def show
      @player = Player.find(params[:id])
      render json: @player
    end
  
    def create
      @player = Player.new(player_params)
      if @player.save
        render json: @player, status: :created
      else
        render json: @player.errors, status: :unprocessable_entity
      end
    end
  
    def update
      @player = Player.find(params[:id])
      if @player.update(player_params)
        render json: @player
      else
        render json: @player.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @player = Player.find(params[:id])
      @player.destroy
      head :no_content
    end
  
    private
  
    def player_params
      params.require(:player).permit(:name, :goals, :assists, :matches_played)
    end
  end
  