class TeamActionsController < ApplicationController
  def create
    team = Team.find(params[:team_id])

    if team.nil?
      render json: { status: 404 } and return
    end

    team_action = TeamAction.create!(action: params['team_action']['type'],
                                     title: params['team_action']['title'],
                                     description: params['team_action']['description'],
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
    team_action = TeamAction.find(params[:action_id])

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
    team_action = TeamAction.find(params[:action_id])
    team_action.action = params['team_action']['type']
    team_action.title = params['team_action']['title']
    team_action.description = params['team_action']['description']
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
    team_action = TeamAction.find(params[:action_id])
    team_action.destroy!

    render json: {
        status: :deleted
    }
  end
end
