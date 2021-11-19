class TeamsController < ApplicationController
  before_action :set_team, only: %i[show edit update destroy]

  # GET /teams
  def index
    @q = Team.ransack(params[:q])
    @teams = @q.result(distinct: true).includes(:challenge,
                                                :participations).page(params[:page]).per(10)
  end

  # GET /teams/1
  def show
    @participation = Participation.new
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit; end

  # POST /teams
  def create
    @team = Team.new(team_params)

    if @team.save
      message = "Team was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @team, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /teams/1
  def update
    if @team.update(team_params)
      redirect_to @team, notice: "Team was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /teams/1
  def destroy
    @team.destroy
    message = "Team was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to teams_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def team_params
    params.require(:team).permit(:team_name, :team_picture, :challenge_id)
  end
end
