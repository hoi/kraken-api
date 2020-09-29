class TeamsController < ApplicationController
  def create
    team = Team.create!(name: params['team']['name'])

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
          members: team_users
      }
    else
      render json: { status: 404 }
    end
  end

  def edit
    team = Team.find(params[:team_id])
    team.name = params['team']['name']
    team.save!

    team_users = TeamUser.where(team: team)

    if team
      render json: {
          status: :updated,
          team: team,
          members: team_users
      }
    else
      render json: { status: 500 }
    end
  end

  def members
    team = Team.find(params[:team_id])

    if team.nil?
      render json: { status: 404 }
    end

    team_users = TeamUser.where(team: team)

    render json: {
        status: :found,
        team: team,
        members: team_users
    }
  end

  def add
    team = Team.find(params[:team_id])

    if team.nil?
      render json: { status: 404 }
    end

    TeamUser.create_or_find_by!(team: team, user_id: params[:user_id])

    team_users = TeamUser.where(team: team)

    render json: {
        status: :found,
        team: team,
        members: team_users
    }
  end

  def remove
    team = Team.find(params[:team_id])

    if team.nil?
      render json: { status: 404 }
    end

    team_user = TeamUser.find_by(team: team, user_id: params[:user_id])

    if team_user.present?
      team_user.delete!
    end

    team_users = TeamUser.where(team: team)

    render json: {
        status: :found,
        team: team,
        members: team_users
    }
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
