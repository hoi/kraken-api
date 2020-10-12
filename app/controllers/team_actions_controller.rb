class TeamActionsController < ApplicationController
  def create
    team = Team.find(params[:team_id])

    if team.nil?
      render json: { status: 404 } and return
    end

    team_action = TeamAction.create!(action: params['team_action']['action'],
                              team: team)

    if team_action
      render json: {
          status: :created,
          team_action: team_action
      }
    else
      render json: { status: 500 }
    end
  end

  def index
    team = Team.find(params[:team_id])

    if team
      render json: {
          status: :found,
          team_actions: team.team_actions
      }
    else
      render json: { status: 404 }
    end
  end

  def show
    team_action = TeamAction.find(params[:team_action_id])

    if team_action
      render json: {
          status: :found,
          team_action: team_action
      }
    else
      render json: { status: 404 }
    end
  end

  def edit
    team_action = TeamAction.find(params[:team_action_id])
    team_action.action = params['team_action']['action']
    team_action.save!

    if team_action
      render json: {
          status: :updated,
          team_action: team_action
      }
    else
      render json: { status: 500 }
    end
  end

  def delete
    team_action = TeamAction.find(params[:team_action_id])
    team_action.destroy!

    render json: {
        status: :deleted
    }
  end
end