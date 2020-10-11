class TeamsController < ApplicationController
  def create
    team = Team.create!(name: params['team']['name'],
                        description: params['team']['description'],
                        thumbnail: params['team']['thumbnail'])

    if team
      render json: {
          status: :created,
          team: team,
          members: []
      }
    else
      render json: { status: 500 }
    end
  end

  def index
    teams = Team.all

    if teams
      render json: {
          status: :found,
          teams: teams
      }
    else
      render json: { status: 404 }
    end
  end

  def show
    team = Team.find(params[:team_id])

    team_users = TeamUser.where(team: team)

    if team
      render json: {
          status: :found,
          team: team,
          members: team_users,
          members_count: team_users.count
      }
    else
      render json: { status: 404 }
    end
  end

  def edit
    team = Team.find(params[:team_id])
    team.name = params['team']['name']
    team.description = params['team']['description']
    team.thumbnail = params['thumbnail']['thumbnail']
    team.save!

    team_users = TeamUser.where(team: team)

    if team
      render json: {
          status: :updated,
          team: team,
          members: team_users,
          members_count: team_users.count
      }
    else
      render json: { status: 500 }
    end
  end

  def delete
    team = Team.find(params[:team_id])
    team.destroy!

    team_users = TeamUser.where(team_id: params[:team_id])
    team_users.delete_all

    render json: {
        status: :deleted
    }
  end
end
