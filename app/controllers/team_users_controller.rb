class TeamUsersController < ApplicationController
  def list
    team = Team.find(params[:team_id])

    if team.nil?
      render json: { status: 404 }
    end

    team_users = TeamUser.where(team: team)

    render json: {
        status: :found,
        team: team,
        members: team_users,
        members_count: team_users.count,
        actions: team.team_actions,
        actions_count: team.team_actions.count
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
        members: team_users,
        members_count: team_users.count,
        actions: team.team_actions,
        actions_count: team.team_actions.count
    }
  end

  def remove
    team = Team.find(params[:team_id])

    if team.nil?
      render json: { status: 404 }
    end

    team_user = TeamUser.find_by(team: team, user_id: params[:user_id])

    if team_user.present?
      team_user.delete
    end

    team_users = TeamUser.where(team: team)

    render json: {
        status: :found,
        team: team,
        members: team_users,
        members_count: team_users.count,
        actions: team.team_actions,
        actions_count: team.team_actions.count
    }
  end
end
